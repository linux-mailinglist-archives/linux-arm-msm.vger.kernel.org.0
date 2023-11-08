Return-Path: <linux-arm-msm+bounces-134-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C5CF7E4E82
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Nov 2023 02:15:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 12BD4281501
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Nov 2023 01:15:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51497641;
	Wed,  8 Nov 2023 01:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="A2okkFp7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 434C2650
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Nov 2023 01:15:20 +0000 (UTC)
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71D7713A
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Nov 2023 17:15:19 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-40806e4106dso1447835e9.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Nov 2023 17:15:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699406118; x=1700010918; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XZnznCqM2AjhaZi79PbuLHcHUwpNTpzbw/YuXnI5mfQ=;
        b=A2okkFp7TX/st0lbMUu2UPI+8NYPHjuLjE/StjD2LuiCQHGOvv44FL84gtaP0OgSZe
         T6gvaK0gzSUqdBMTKJY6sg1Wfejy8xZCtHMTKhYB91JJ+Mqyn/n6aprV2F2TANk79UAm
         HRX2bLe7tF4+d8TVDmfEjIXu7p/OSM4O1tGEuUi4qNjqGdOM8HXQBrf8YhI75KrQ5MVF
         u3Etx60oeKmyFGdScAnvAu71GzJjpMUi781RLWcyw1SYf/1YNPOUhdIRZtREhNuevuNJ
         BYUOx11YReIQ7KSs2gTGv7uqzfayDIU6C0wpCRQ700VjNUUuhQbiWkxA9bLsa6ibw6fD
         z5iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699406118; x=1700010918;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XZnznCqM2AjhaZi79PbuLHcHUwpNTpzbw/YuXnI5mfQ=;
        b=cwTMYh1sYdXfT3cyl4NYRR7tyF+GNloVufS/ftCzztLOUNL/EXioQbX5avajo11dzF
         n3bR8aAt5XG6mUDelzqA4QCtpiCqBOjm8uvpqU/Od6L5GGb34cRDx6dEPPDRGUh3NmsR
         +mBuRk1hQ1B0sVmMN3QmvP9QTqVZ215HYmaMW2v/NHGKdIJ5AwUjt/b56Tfl9OPmEjP1
         bOX26SXKN1CP0G45tbA11PSLWx+GqWjl1qkNo+NPTuA9O6pTai1l1tiY60B6wZrct1x6
         2gsVQA6yLmnnIybL3QSVmexn0EEIxzAxhoXI75PfPO13J6G8qpQZyZ/jL85u4JeAbe77
         YHiQ==
X-Gm-Message-State: AOJu0YyvhhqiT1oL1DL+1EYFwQ/yFmn8iUQEsL+Rsk1Ta2TNKhMSas14
	dDYvtQKHRnjmdE2lqsV1ARNVjAdPoZTYkIV3W1ogzQ==
X-Google-Smtp-Source: AGHT+IEIbjP5ubRLbHFuttHbIGtYyTdvZVb5ctg0N4NF3wFeDFArM4/Br06A2vdI/3SJ+YmATJCpTw==
X-Received: by 2002:a05:600c:c0c:b0:401:b425:2414 with SMTP id fm12-20020a05600c0c0c00b00401b4252414mr4903500wmb.18.1699406117867;
        Tue, 07 Nov 2023 17:15:17 -0800 (PST)
Received: from [192.168.100.102] ([37.228.218.3])
        by smtp.gmail.com with ESMTPSA id f21-20020a7bcc15000000b0040773c69fc0sm17049309wmh.11.2023.11.07.17.15.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Nov 2023 17:15:17 -0800 (PST)
Message-ID: <ae95c3c7-26b7-42f5-b806-f57b56e6300e@linaro.org>
Date: Wed, 8 Nov 2023 01:15:14 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v3 4/5] clk: qcom: Use HW_CTRL_TRIGGER flag to
 switch video GDSC to HW mode
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@linaro.org>, Abel Vesa
 <abel.vesa@linaro.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Kevin Hilman <khilman@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 Pavel Machek <pavel@ucw.cz>, Len Brown <len.brown@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Bjorn Andersson <andersson@kernel.org>, Andy Gross <agross@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Taniya Das <tdas@qti.qualcomm.com>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-media@vger.kernel.org,
 Jagadeesh Kona <quic_jkona@quicinc.com>
References: <20231101-gdsc-hwctrl-v3-0-0740ae6b2b04@linaro.org>
 <20231101-gdsc-hwctrl-v3-4-0740ae6b2b04@linaro.org>
 <835a6add-81e9-42e4-abbe-91632aaa6bc9@linaro.org>
 <82a25b12-7a63-4c75-8a46-624bc35c6752@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <82a25b12-7a63-4c75-8a46-624bc35c6752@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07/11/2023 21:21, Konrad Dybcio wrote:
>>
>> So.
>>
>> I'm assuming the rest of this series works however for sc8250 at least 
>> this is a NAK, breaks venus on rb5.
> Are you saying that applying this patch alone causes the attached crash?
> 
> Konrad

I tried to revert this patch in isolation and got

->

[  157.083287] qcom-venus aa00000.video-codec: Failed to switch 
power-domain:1 to SW mode
[  162.004630] qcom-venus aa00000.video-codec: Failed to switch 
power-domain:1 to SW mode

I stopped debugging there.

---
bod

