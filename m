Return-Path: <linux-arm-msm+bounces-45808-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 71D55A192C6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jan 2025 14:41:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2E85F1882965
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jan 2025 13:41:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96E7F213237;
	Wed, 22 Jan 2025 13:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="f79E9XLu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7534338DF9
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jan 2025 13:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737553299; cv=none; b=s+iqrKw/XYgn1BygscCw+6KHveaSk7ij+gflvP8YlRa7OODFEqDg5nayIkMCBvAShQ/A2NuoSeXyJqnDuYN1xnZhPtIEUnpYL4+MrQH1C5Q6jfS/SGhtWcz9EVz7Mx0J1HrZpBVOeilnS1NGMT/CiTr4i3qVe3wNtD84pQYBSow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737553299; c=relaxed/simple;
	bh=Wgk8zZZUNvg9MP1jdfxaZ+8M8oxx6ykIpXlu++Rubog=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t4K1pATzCr08TzB8SRQ4/qHIU6R/bRzDcb1WtMzGMCCBylUBHaNujSqshmLlIWjnKaqTrfU7m8IziIfrql86p3FGvUPcxZhNq/+cVp4g+I9it1G9vo3V8Jr80gkzVFAgwvM4yKKM82EP/3jd352myn6NICEj6DpjMM/MRBh7pBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=f79E9XLu; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4361b6f9faeso6082925e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jan 2025 05:41:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737553295; x=1738158095; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Tv7xQXPsVhsp/qFSdjJTcBJiPV5vkVbgwyiggEpJzIg=;
        b=f79E9XLuSx9ZqgyFkjag4/fpgDnzIMdv5iC3+a/Lo/xHRvMIAWikeFEFSWXbEIcSd9
         fltmJAiNqDC8njTrN1aW7AMd7HRqc3FDxA0mxfUEUZMeklkdKd/lRC7TGKrqgtzu4VSj
         RLHGUy3NUl4+D7J4/c9ZaZsuXJ7k1Al5JTyf/fB0zZKiyF3RzSxiapmAQcLxw0D8QTkO
         teDcsbPdxExTwI/iATN204/EndsJJbA+N3yOn1Q4RL4G6qS7O7GzPsmUSnldkr4M+wFg
         56sckO/euI/8H6hXXoZSf/7v47itFWhexxgmyYsSrzQJDerMnFwkMi7OOcRyz7wNFbsB
         o1Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737553295; x=1738158095;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Tv7xQXPsVhsp/qFSdjJTcBJiPV5vkVbgwyiggEpJzIg=;
        b=a1S8qN8Hq4pUdO1xZfoMkHXb+Kj6lU+dZ3X3AI/Pjrcfdl7D1I55WVRkuwi+cefyeD
         5o0TqvR5Uw3DPjLEMTyWhDxwbF8QCVY1jLq4VHHcLfpwzfN7TGai/3nNcR0xiim2UnFz
         9hQ/QhlO+Ia3ahufwOwXl4ePU1zsv6dJiDBsTAq0Y0wM0a6SmpIlqBEdnyAzb1Sitgx9
         sajEf0cGaMyFal8oMk579pjyBet2dlEUT/ifYs7roTAApZJYuI1Wd8g5h5LmIVW/Y1TX
         dbFDpkKbRtk8sNyTlbUKuzz1cStbK1GVpPquiPAciHdkcXofYzxbKMV3shiqPimMrBz2
         Bviw==
X-Forwarded-Encrypted: i=1; AJvYcCV15mt7jcjHvYD7YlYcjdSr6E3r5f7sLUwJTuW/bOTS/YkKR1rZoQ9MluqnPdAFvyr2bnT8AkFSwa49neO2@vger.kernel.org
X-Gm-Message-State: AOJu0YyOBPn9vJyYXMVTO41ueaTUZ1zjpk/P5z29EN5+QTiNewsEqchM
	cgayr500oLY4TL4us2wTIykq2VryTVg+FgShsU5dEtElz/hobImXge734vJ1wRs=
X-Gm-Gg: ASbGncv5SJA9LTtXqtOmLoHW1V2ajjycXqtfJQDeY1CPMr16zrUjN+nvKmbTezianMR
	7otYBA1yAe3SGulDoQrcD9Ai2zmLF2k6yvh3NGjLKJGc68Hb2TpKE5QMr7U3PcO3EKHngI2Wo9f
	Uawvyi4Tsh4DjwWoNcjqy50eLs0eFRy3WPLSFteTV5OpNw66dGIg76tjgayO/mKjC8pCyfIu50q
	6sCwyBvFZPepv0oSqGHvHD63AUXAoMdrWvbrbQqbjDaxK3BylrV9LAI7SERkdl1eKIj0Db9rmP9
	Aats7T8=
X-Google-Smtp-Source: AGHT+IGuPXvmCQONvi9I2qMckgrQaufMKySAeB9Dd+evPEakzske0rFxtu9ojMMm8/alwj20y1oEBA==
X-Received: by 2002:a05:600c:1381:b0:434:fc5d:179c with SMTP id 5b1f17b1804b1-43891905c1fmr196346695e9.13.1737553294654;
        Wed, 22 Jan 2025 05:41:34 -0800 (PST)
Received: from [192.168.0.35] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438b31df435sm25438275e9.34.2025.01.22.05.41.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jan 2025 05:41:34 -0800 (PST)
Message-ID: <ff081020-6e6f-472e-823a-12b2cd2c9a72@linaro.org>
Date: Wed, 22 Jan 2025 13:41:33 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] media: qcom: camss: csiphy-3ph: Add 4nm CSIPHY 2ph
 5Gbps DPHY v2.1.2 init sequence
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Depeng Shao <quic_depengs@quicinc.com>,
 Vikram Sharma <quic_vikramsa@quicinc.com>
References: <20250120-linux-next-25-01-19-x1e80100-camss-driver-v1-0-44c62a0edcd2@linaro.org>
 <20250120-linux-next-25-01-19-x1e80100-camss-driver-v1-6-44c62a0edcd2@linaro.org>
 <00989990-85dd-46d7-a100-c986fc1fb066@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <00989990-85dd-46d7-a100-c986fc1fb066@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 22/01/2025 00:29, Vladimir Zapolskiy wrote:
> Hi Bryan.
> 
> On 1/20/25 17:47, Bryan O'Donoghue wrote:
>> For various SoC skews at 4nm CSIPHY 2.1.2 is used. Add in the init 
>> sequence
>> with base control reg offset of 0x1000.
>>
>> This initial version will support X1E80100. Take the silicon verification
>> PHY init parameters as a first/best guess pass.
>>
>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> ---
>>   .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     | 126 +++++++++++ 
>> ++++++++++
>>   1 file changed, 126 insertions(+)
>>
>> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c 
>> b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
>> index b44939686e4bb..fc624a3da1c43 100644
>> --- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
>> +++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
>> @@ -55,6 +55,7 @@
>>   #define CSIPHY_DNP_PARAMS        4
>>   #define CSIPHY_2PH_REGS            5
>>   #define CSIPHY_3PH_REGS            6
>> +#define CSIPHY_SKEW_CAL            7
> 
> This one is not needed, having CSIPHY_DNP_PARAMS only is good enough.
> 
>>   struct csiphy_lane_regs {
>>       s32 reg_addr;
>> @@ -423,6 +424,130 @@ csiphy_lane_regs lane_regs_sm8550[] = {
>>       {0x0C64, 0x7F, 0x00, CSIPHY_DEFAULT_PARAMS},
>>   };
>> +/* 4nm 2PH v 2.1.2 2p5Gbps 4 lane DPHY mode */
>> +static const struct
>> +csiphy_lane_regs lane_regs_x1e80100[] = {
>> +    /* Power up lanes 2ph mode */
>> +    {0x1014, 0xD5, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +    {0x101C, 0x7A, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +    {0x1018, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +
>> +    {0x0094, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +    {0x00A0, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +    {0x0090, 0x0f, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +    {0x0098, 0x08, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +    {0x0094, 0x07, 0x01, CSIPHY_DEFAULT_PARAMS},
>> +    {0x0030, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +    {0x0000, 0x8E, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +    {0x0038, 0xFE, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +    {0x002C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +    {0x0034, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +    {0x001C, 0x0A, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +    {0x0014, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +    {0x003C, 0xB8, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +    {0x0004, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +    {0x0020, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +    {0x0008, 0x10, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
>> +    {0x0010, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +    {0x0094, 0xD7, 0x00, CSIPHY_SKEW_CAL},
>> +    {0x005C, 0x00, 0x00, CSIPHY_SKEW_CAL},
>> +    {0x0060, 0xBD, 0x00, CSIPHY_SKEW_CAL},
>> +    {0x0064, 0x7F, 0x00, CSIPHY_SKEW_CAL},
>> +    {0x0064, 0x7F, 0x00, CSIPHY_SKEW_CAL},
> 
> Double write record, which is anyway ignored, but one should
> be enough.

Yes except having the SKEW_CAL definition allows us to import the 
downstream init sequence unmodified.

>> +
>> +    {0x0E94, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +    {0x0EA0, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +    {0x0E90, 0x0f, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +    {0x0E98, 0x08, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +    {0x0E94, 0x07, 0x01, CSIPHY_DEFAULT_PARAMS},
>> +    {0x0E30, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +    {0x0E28, 0x04, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +    {0x0E00, 0x80, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +    {0x0E0C, 0xFF, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +    {0x0E38, 0x1F, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +    {0x0E2C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +    {0x0E34, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +    {0x0E1C, 0x0A, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +    {0x0E14, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +    {0x0E3C, 0xB8, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +    {0x0E04, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +    {0x0E20, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +    {0x0E08, 0x10, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
>> +    {0x0E10, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +    {0x0E10, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +    {0x0E10, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +    {0x0E10, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
> 
> Writing the same value to a register 4 times in a row, apparently
> it's not needed, one time write is sufficient.

To be honest I just took the downstream sequence verbatim.

I'll see if the 4 x has an effect though.

>> +
>> +    {0x0494, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +    {0x04A0, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +    {0x0490, 0x0f, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +    {0x0498, 0x08, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +    {0x0494, 0x07, 0x01, CSIPHY_DEFAULT_PARAMS},
>> +    {0x0430, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +    {0x0400, 0x8E, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +    {0x0438, 0xFE, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +    {0x042C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +    {0x0434, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +    {0x041C, 0x0A, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +    {0x0414, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +    {0x043C, 0xB8, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +    {0x0404, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +    {0x0420, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +    {0x0408, 0x10, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
>> +    {0x0410, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +    {0x0494, 0xD7, 0x00, CSIPHY_SKEW_CAL},
>> +    {0x045C, 0x00, 0x00, CSIPHY_SKEW_CAL},
>> +    {0x0460, 0xBD, 0x00, CSIPHY_SKEW_CAL},
>> +    {0x0464, 0x7F, 0x00, CSIPHY_SKEW_CAL},
>> +    {0x0464, 0x7F, 0x00, CSIPHY_SKEW_CAL},
> 
> Two equal "ignored" writes.

Again I think these init sequences "do no harm" and its at least 
possible we can improve the logic of our upstream init sequences to make 
these NOPs mean more...

At they very least they consume time in the APSS wrt the next writes..


> 
>> +
>> +    {0x0894, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +    {0x08A0, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +    {0x0890, 0x0f, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +    {0x0898, 0x08, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +    {0x0894, 0x07, 0x01, CSIPHY_DEFAULT_PARAMS},
>> +    {0x0830, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +    {0x0800, 0x8E, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +    {0x0838, 0xFE, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +    {0x082C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +    {0x0834, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +    {0x081C, 0x0A, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +    {0x0814, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +    {0x083C, 0xB8, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +    {0x0804, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +    {0x0820, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +    {0x0808, 0x10, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
>> +    {0x0810, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +    {0x0894, 0xD7, 0x00, CSIPHY_SKEW_CAL},
>> +    {0x085C, 0x00, 0x00, CSIPHY_SKEW_CAL},
>> +    {0x0860, 0xBD, 0x00, CSIPHY_SKEW_CAL},
>> +    {0x0864, 0x7F, 0x00, CSIPHY_SKEW_CAL},
>> +    {0x0864, 0x7F, 0x00, CSIPHY_SKEW_CAL},
> 
> Two equal "ignored" writes.
> 
>> +
>> +    {0x0C94, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +    {0x0CA0, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +    {0x0C90, 0x0f, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +    {0x0C98, 0x08, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +    {0x0C94, 0x07, 0x01, CSIPHY_DEFAULT_PARAMS},
>> +    {0x0C30, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +    {0x0C00, 0x8E, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +    {0x0C38, 0xFE, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +    {0x0C2C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +    {0x0C34, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +    {0x0C1C, 0x0A, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +    {0x0C14, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +    {0x0C3C, 0xB8, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +    {0x0C04, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +    {0x0C20, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +    {0x0C08, 0x10, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
>> +    {0x0C10, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +    {0x0C94, 0xD7, 0x00, CSIPHY_SKEW_CAL},
>> +    {0x0C5C, 0x00, 0x00, CSIPHY_SKEW_CAL},
>> +    {0x0C60, 0xBD, 0x00, CSIPHY_SKEW_CAL},
>> +    {0x0C64, 0x7F, 0x00, CSIPHY_SKEW_CAL},
>> +    {0x0C64, 0x7F, 0x00, CSIPHY_SKEW_CAL},
> 
> Two equal "ignored" writes.
> 
>> +};
>> +
>>   static void csiphy_hw_version_read(struct csiphy_device *csiphy,
>>                      struct device *dev)
>>   {
>> @@ -594,6 +719,7 @@ static void csiphy_gen2_config_lanes(struct 
>> csiphy_device *csiphy,
>>               val = settle_cnt & 0xff;
>>               break;
>>           case CSIPHY_DNP_PARAMS:
>> +        case CSIPHY_SKEW_CAL:
> 
> Having CSIPHY_DNP_PARAMS is good enough, no need to add another
> "dummy" write type.

True but, I'd like to be able to bring in unmodified init sequences from 
downstream.

I think there is value in being able to setup the PHYs in the exact same 
configuration.

So, I think we should keep the SKEW_CAL support and I'm open to 
experiment reducing repeated DNP/SKEW downwards, perhaps defining a real 
number for the delay instead.

---
bod

