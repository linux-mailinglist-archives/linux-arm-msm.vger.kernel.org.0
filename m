Return-Path: <linux-arm-msm+bounces-57-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B22817E3A5D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Nov 2023 11:55:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E21CE1C20B85
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Nov 2023 10:55:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26EE52C859;
	Tue,  7 Nov 2023 10:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VVZ4AG1v"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCA5229D15
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Nov 2023 10:55:31 +0000 (UTC)
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32EDCED
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Nov 2023 02:55:28 -0800 (PST)
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-40853c639abso40312505e9.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Nov 2023 02:55:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699354526; x=1699959326; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9YR3HyIcWUCtOVLP7VoPEa4NXJBtPEhrFvCreFh9ZV8=;
        b=VVZ4AG1vhGCbALpfV8Ugd4SIprlDADjT0xix1Q5fSvPzfwkATJAsQV9e67xD5+lehd
         Nry9SdweUzcx6YmGAMZHNJkAEAIIyAj857pf/ierCS4byw18v8Z3Qvo5HVpK05g0yPIg
         /x0CrU77ut860S01NLHgLVt6njNhCRqQReuC6Qgfj/XK2EKsh38Vey6ijO/vNL9H/zRZ
         n/T7odO30sY5/lt1vP3tdijwPcLcaesw9aCBviKM09CmE/6zGFC6bj2CEVK3xGRz93rQ
         LZQG5gobadvRRfpzYLCP0QpOG/1MiP/z/5NJLv4+sbUhOLZjg7KvYi11PlhlpUiGKdX5
         CmEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699354526; x=1699959326;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9YR3HyIcWUCtOVLP7VoPEa4NXJBtPEhrFvCreFh9ZV8=;
        b=k553ywRT9BOGGW68EzkZF6cG+GB+LMGOflqK65b2olS0xSpIcNwyjGKv+7GYAVqRa+
         lG1EM9AzWwJuB4X2FrmoKik9+f70GevMXWU8aqh94nzQH0W0ByqtX6trNjvMAkmsv5c5
         FzlcPZ1zSulkcnYSr33m6Iz0XpLdxpag2m+Cc90cwdOiintT2kivxasUK92cotzsAi/7
         m4jzgAsUxHBNOxdz2bEqmEJgYZktT6kNrw8bPxm6Ts5xUcoaefxSFoK80O9Y73R2+UZl
         T59M2thrQnn6rJcG8ig3g+W8G1GHVWYm6IliWztbxGM8XKlKATR0j3bR3KQiQJal31Er
         Awhg==
X-Gm-Message-State: AOJu0YzzxdMu8/dMfZ+w+EZNoDEtsm8Ef8p9ESBsM8wd8/hPjZqReiBH
	5eOw8xb9va0W7m/mtodaIUciUQ==
X-Google-Smtp-Source: AGHT+IGJhP7SgEGrSMxqmO/hcQGe8Dh/czcY9QMxuvEh3I2lNVZq1cwfNUr3DfJnKmQwX4kPVuuU/A==
X-Received: by 2002:a05:600c:46c6:b0:406:5308:cfeb with SMTP id q6-20020a05600c46c600b004065308cfebmr2281387wmo.11.1699354526560;
        Tue, 07 Nov 2023 02:55:26 -0800 (PST)
Received: from [192.168.100.102] ([37.228.218.3])
        by smtp.gmail.com with ESMTPSA id t14-20020a05600c198e00b00405d9a950a2sm15456999wmq.28.2023.11.07.02.55.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Nov 2023 02:55:26 -0800 (PST)
Message-ID: <4b3e1f66-31e0-4b7a-9cc0-0b7a7a6ef2f5@linaro.org>
Date: Tue, 7 Nov 2023 10:55:24 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 2/8] usb: dwc3: core: Register vendor hooks for dwc3-qcom
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: Krishna Kurapati PSSNV <quic_kriskura@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-usb@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-kernel@vger.kernel.org, Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 Rob Herring <robh+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, quic_ppratap@quicinc.com,
 quic_jackp@quicinc.com, quic_wcheng@quicinc.com,
 Andy Gross <agross@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
References: <20231017131851.8299-1-quic_kriskura@quicinc.com>
 <20231017131851.8299-3-quic_kriskura@quicinc.com>
 <e700133b-58f7-4a4d-8e5c-0d04441b789b@linaro.org>
 <5ef66bdc-9645-4bbe-8182-baa7fe4c583a@quicinc.com>
 <3be5e95f-85d2-4abf-a8b4-18b019341602@quicinc.com>
 <cf553cd8-45f8-4a61-b016-69e7a80eee9f@linaro.org>
 <ea919050-22a8-4d28-ade2-fd16a99876cb@quicinc.com>
 <105d84b6-cbea-4758-9eba-1c104fa7a670@quicinc.com>
 <f94ca738-476c-4664-a8f1-e3ef3ac8220a@linaro.org>
In-Reply-To: <f94ca738-476c-4664-a8f1-e3ef3ac8220a@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 07/11/2023 10:41, Bryan O'Donoghue wrote:
> On 07/11/2023 08:33, Krishna Kurapati PSSNV wrote:
>>
>>
>> On 11/4/2023 10:32 PM, Krishna Kurapati PSSNV wrote:
>>>>
>>>> Are you saying to you require/rely on both of these series being 
>>>> applied first ?
>>>>
>>>> [1]: 
>>>> https://lore.kernel.org/all/af60c05b-4a0f-51b8-486a-1fc601602515@quicinc.com/
>>>> [2]: 
>>>> https://lore.kernel.org/all/20231016-dwc3-refactor-v1-0-ab4a84165470@quicinc.com/
>>>>
>>>> Must be, nothing applies for me in this series.
>>>
>>> The first one is not a patch. It is just a discussion thread I 
>>> started to get community's opinion before on disconnect interrupt 
>>> handling. The current series is based on top of [2] made by Bjorn (as 
>>> you already found out) and as I mentioned in cover letter of my series.
>>>
>>
>> Hi Bryan,
>>
>>    Are you able to apply the series after including Bjorn's patches ? 
>> Also can you confirm if the comments provided to your queries on [1] 
>> are proper and if you have any other comments w.r.t probe deferral.
>>
>> [1]: 
>> https://lore.kernel.org/all/e700133b-58f7-4a4d-8e5c-0d04441b789b@linaro.org/
>>
>> Regards,
>> Krishna,
> 
> I wonder could you give a base SHA to apply the various series on ?
> 
> Your referenced precursor doesn't apply to usb-next

Well now, that doesn't point where I thought it pointed usb-next/master 
is extremely old

  b3a9e3b9622ae - (HEAD -> usb-next-23-10-07-usb-glue-test, tag: 
v5.8-rc1, usb-next/master, origin/tracking-qcomlt-sm8150-gcc, 
linaro/tracking-qcomlt-sm8150-gcc, fecked-old, delete-this-branch2, 
delete-this-branch) Linux 5.8-rc1 (3 years, 5 months ago)

I want usb-next/main

*   d2f51b3516dad - (usb-next/usb-testing, usb-next/usb-next, 
usb-next/main) Merge tag 'rtc-6.7' of 
git://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux (32 hours ago)

Everything applies there.

Anyway, your pointing to Bjorn's series answers my question re: 
sequencing of the probe.

---
bod


