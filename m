Return-Path: <linux-arm-msm+bounces-1039-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 967FD7EFD0E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Nov 2023 02:56:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AF8721C20880
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Nov 2023 01:56:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 379895255;
	Sat, 18 Nov 2023 01:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WGmnCuGq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C68751AD
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Nov 2023 17:56:08 -0800 (PST)
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-407c3adef8eso770485e9.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Nov 2023 17:56:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700272567; x=1700877367; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tXrHQ3w3ZeCgtpBw84c6HijlDU6o8dqFfZbTc1+ea3o=;
        b=WGmnCuGqc5Ub+lM5VFPb2IA93CAwgurh9bz78XY5vyKmEJbBKaLy3KKFXT/e4+7GCB
         BhPDqjnIqI6gogihds9Bm6M+gLFQgibPsMFVrkT1udBAlWgF3tQ8rFRPpBPHA4WR4oux
         XdrMdOr1GnYzwzP+KeMJqqx0QbYPcwdRRabf5oVm8+WHbUR3hOnofdK8/rJ85Huv7QiC
         C6DUgqmObF0wFgf+HGuOyisLZpZ0+Wae9JYTf4wC/0/u5otr1xLjTl4Htqhh73T4Gvox
         l1eovsFhh9/oiVEKw7hX9LN4a95EN7mjKQS9XlYl3ubqb+Lw64LNiwBq1HKJbNNOrkCW
         magA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700272567; x=1700877367;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tXrHQ3w3ZeCgtpBw84c6HijlDU6o8dqFfZbTc1+ea3o=;
        b=WyhZgPo6oGNHDOT3nK8Y48CgZ44WKGvUKdA5AX9WdvymXByadeJfP5wzhx7h6jKicK
         0tV9KY2/81b99LwznDNKrm3IRiZhpEuJB8dLQ9eIRfukcmtK86JQ8dcc4zI/dFxYC7WA
         ZNxnR2KspnEmAmK1vw9gvx6+G/31n9HSVH1zDfnY7d6eGoL3477zZ1twTc9Ze6fNx9o7
         fJGC+cj+VjmU/GMF4M1FyyCc2iMUvoqks7MVKPkqDUZn+nIeG10T7GbhlmBNJ2fNbQ7k
         Vd3dyEp6VjX+IxDGT5HUTT8CTfYJkiDkWnhOqDOjvn3Dg3mdW6ASaMhF8thWDESTfJLx
         nvrg==
X-Gm-Message-State: AOJu0Yw6pi8wF2tb/t2YueHnuMsoWk3ZsKMFWEZUu8vx1MvvYL1kTiHW
	4XzZkbCVDz/bd1wL1BsWz0G6xw==
X-Google-Smtp-Source: AGHT+IGNlNdvBLqd0P+OKkTRipccHqp/1xRwscwSV6ZxHjV94jWhm/8MkJUHeAG/Rhk3tsFe8Yltrw==
X-Received: by 2002:a05:600c:4448:b0:40a:45ff:fd69 with SMTP id v8-20020a05600c444800b0040a45fffd69mr789470wmn.19.1700272566550;
        Fri, 17 Nov 2023 17:56:06 -0800 (PST)
Received: from [192.168.100.102] ([37.228.218.3])
        by smtp.gmail.com with ESMTPSA id j7-20020a05600c190700b004064cd71aa8sm4666185wmq.34.2023.11.17.17.56.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Nov 2023 17:56:06 -0800 (PST)
Message-ID: <4b60b317-6961-45c7-a4dd-9fe73641a239@linaro.org>
Date: Sat, 18 Nov 2023 01:56:05 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/7] media: qcom: camss: Add support for named
 power-domains
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@linaro.org>, hverkuil-cisco@xs4all.nl,
 laurent.pinchart@ideasonboard.com, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, matti.lehtimaki@gmail.com,
 quic_grosikop@quicinc.com
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20231103-b4-camss-named-power-domains-v4-0-33a905359dbc@linaro.org>
 <20231103-b4-camss-named-power-domains-v4-5-33a905359dbc@linaro.org>
 <9752f4ab-5e08-4d1b-9ed4-6aa280c87a36@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <9752f4ab-5e08-4d1b-9ed4-6aa280c87a36@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 18/11/2023 00:38, Konrad Dybcio wrote:
> On 3.11.2023 13:29, Bryan O'Donoghue wrote:
>> Right now we use fixed indexes to assign power-domains, with a
>> requirement for the TOP GDSC to come last in the list.
>>
>> Adding support for named power-domains means the declaration in the dtsi
>> can come in any order.
>>
>> After this change we continue to support the old indexing - if a SoC
>> resource declaration or the in-use dtb doesn't declare power-domain names
>> we fall back to the default legacy indexing.
>>
>>  From this point on though new SoC additions should contain named
>> power-domains, eventually we will drop support for legacy indexing.
>>
>> Tested-by: Matti Lehtimäki <matti.lehtimaki@gmail.com>
>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> ---
> rg -l "&cc.* \{" arch/arm64/boot/dts/qcom # (the bus is named cci or cciN)
> 
> arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
> arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dts
> arch/arm64/boot/dts/qcom/apq8016-sbc-d3-camera-mezzanine.dts
> arch/arm64/boot/dts/qcom/qrb5165-rb5-vision-mezzanine.dts
> 
> the FP4 only has bus enablements (i.e. no attached sensors)
> the number of working DB845c/RB3s is probably single-digit today
> 
> 410c and rb5 are probably legit users.. part of me would like to
> get rid of this messy old binding ASAP.. but then are there really
> non-Bryans with these boards and the camera mezzs?
> 
> Konrad

The plan here is to follow the procedures as I understand them.

- Deprecate
- Wait a reasonable amount of time ~ 1 year or so
- Drop

We could go faster but, there's no need. Drawing a line on new SoCs and 
deprecating the old way will do fine.

---
bod

