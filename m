Return-Path: <linux-arm-msm+bounces-118-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C0CB7E4B09
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Nov 2023 22:43:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B03C7B2110A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Nov 2023 21:43:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 444F82F84C;
	Tue,  7 Nov 2023 21:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="P7mPdNtS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F3642F841
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Nov 2023 21:41:40 +0000 (UTC)
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B391210E6
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Nov 2023 13:41:39 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-5079f9675c6so8360338e87.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Nov 2023 13:41:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699393298; x=1699998098; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oOUEzdR0Cx5aI5BrhAl9c27GtPSKarxoejL8ISU+wEI=;
        b=P7mPdNtS3LWkSshWb924y8h9udnZisx9DACuQne8B5b11RmLqcmIccgVfVeI0cT8gY
         sZIIxHAN2FD+YkLHZs43cuzVXJuyRPtwZpmToZbb8RWcXCU47Ek9M8XkRZOzeCv7ktTE
         5GjznURQYknaBMK5qLZ7hW7Kfs6fjqa6H8nXoEv9n5KazoZg5oIxTsG6GqbvPrunnfhL
         YN9vdIJfvzmOkt5WfRORVl3dQBqDjJ25bie3EBmlHPBk3tAAO14i5470b9MBEdj3tii0
         gQv/hbK9LQjx3oYtCsnu1GtmYQpV/zPXJPM0V8UxARKHvmRKH7oSzS6YNltw+HUpSgqf
         Kq2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699393298; x=1699998098;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oOUEzdR0Cx5aI5BrhAl9c27GtPSKarxoejL8ISU+wEI=;
        b=fRBA4shEba1EUTWMhCYaCf+AIQ4Iep08ZuI36nIq22HWmMrFvtzWTembW8y54FP1gT
         +4wpIRwa16Ql9wfqJRnj7UYigAnu2vSScV4RYGqd/Gvfugg4+hujLxUaMz2FwdcCGG+l
         iJepltn/Hff+vFdq/lzIF5Qn/V5th4xJ7OPBD1j1Xt/fRpAAOiG4EOvGgWB316MW+7j6
         tBUOFj90VyW6BcquK/azIMAeBCmts/pw+VzhgHUAgie9HiUOxNB+74u4W3kwEaoZ9Ijm
         U1O/aBBnPFA6t4XRGcjxWdNkepCAcf6/AY9tK61IxaJko+1w5/fGBecsKAQo94tWYwZq
         19pg==
X-Gm-Message-State: AOJu0YxjTjh4GySqCjMpiZpJqocgok1XoB+YXsaN040tPKlYttxq4ThM
	nGxTWVWYq42gnyWK/ShZUeVxtw==
X-Google-Smtp-Source: AGHT+IErEa1Tr4HT5ERsF8J6zUAe2Oe03GIPj+aU2/8QqeVpAvooAUrWGcH/t14PC1wMPnG8hz96RA==
X-Received: by 2002:ac2:5928:0:b0:507:984e:9f16 with SMTP id v8-20020ac25928000000b00507984e9f16mr25155506lfi.36.1699393297841;
        Tue, 07 Nov 2023 13:41:37 -0800 (PST)
Received: from [172.30.205.109] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id k11-20020ac2456b000000b00509366f4f7esm460879lfm.121.2023.11.07.13.41.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Nov 2023 13:41:37 -0800 (PST)
Message-ID: <ed074396-8c6e-4e57-85c5-d54187d901d6@linaro.org>
Date: Tue, 7 Nov 2023 22:41:33 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/6] media: qcom: camss: vfe-17x: Rename camss-vfe-170
 to camss-vfe-17x
Content-Language: en-US
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, hverkuil-cisco@xs4all.nl,
 laurent.pinchart@ideasonboard.com, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, vincent.knecht@mailoo.org,
 matti.lehtimaki@gmail.com, quic_grosikop@quicinc.com
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20231105-b4-camss-sc8280xp-v3-0-4b3c372ff0f4@linaro.org>
 <20231105-b4-camss-sc8280xp-v3-6-4b3c372ff0f4@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231105-b4-camss-sc8280xp-v3-6-4b3c372ff0f4@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/5/23 18:45, Bryan O'Donoghue wrote:
> vfe-170 and vfe-175 can be supported in the same file with some minimal
> indirection to differentiate between the silicon versions.
> 
> sdm845 uses vfe-170, sc8280xp uses vfe-175-200. Lets rename the file to
> capture its wider scope than vfe-170 only.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
Acked-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

