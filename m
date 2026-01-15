Return-Path: <linux-arm-msm+bounces-89239-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D4F7D2582E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 16:54:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 26FF83010CF5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 15:54:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97090350A05;
	Thu, 15 Jan 2026 15:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lfAGhMxK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06AE72750ED
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 15:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768492460; cv=none; b=mQXN/nOaaxwTlHAhZ47gypZFFqMV3+OtiRDMweyTCRIvon+RBoUX5R1IrpwMwQUhXOM7er4mEba5FI3ZEckWCAiPxKBmx63qH/9VZyQML/m66g3IEXgMEgbESxM5mfMelQfUWhXS7LM+LT8CdRdjotqJlkHj0QLd4Yfy2NwpMAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768492460; c=relaxed/simple;
	bh=Ske1nYGRXQK4PyUXkOyknKoa8+u+jcut+L+FXzFSQhA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q4Dyttg7j7HucZd2eVM8KwroE5tR0Ws+Doi8M93Bt1M9FpMA6GQAfaXIFw4WC1nltheozqxAK/OyWMWH5qMPKRr05fpyecQ949jSjvPlOO/oXVoCy3zrkJFAkKsjyMTZ6kSm694tH88xTODNBcN/2ld22HuYCOaqY9cYE+pZFsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lfAGhMxK; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4801bc32725so4020245e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 07:54:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768492457; x=1769097257; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=giMlm7L2g+M4CFMM8/nACLMgbMspj8AJvUXN07mxYlg=;
        b=lfAGhMxKEqvX1CfZ1GJdahUGj/ROD56xC91aK1qQysmzZGEg0v0xLmrXzS+vBXDsX2
         OWblT13a3Mompj3Qapc7gIcrpfBkWwzev8UuV9XpVMNdCCRZBj4aumNntkov/95pCtNp
         U1EflQyGEkYxgpLg8T17aJyoy7pvFX0LJwgvSOpW0rVJseXo2Ih/5pxDUCk9ebGR9JBd
         OEvy9Gvc9sHdWTfytpsZdBzC6YxxuFAFdA8+PZU4RI8TzP3HEoIa9yWlQOz6ws6LhPLB
         w0GXt50u9DylYVXWakzDfQRAB3z3rEOzhtdtPLyg39q/0q2Yt/ghJiS+rCfM6B0OwB7v
         NYwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768492457; x=1769097257;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=giMlm7L2g+M4CFMM8/nACLMgbMspj8AJvUXN07mxYlg=;
        b=H0F3//9leHpNeNRyQd3zdHsJyHBQAFJoCv1iyaThJZ6UW/TWLA+iDDYA4K5swS2rfB
         xLi7RYQy9/Qz/56qh4Y+LIXzIOD1wOlrdQoi/kmVSwmyTk2kAxRj6Q6ih3OcCaSq5Rpp
         2XA76nZBB69t3lqqT350sNvVyUI+4Rgk6tsTmSGOUhHzrZA3lF871xPVz3k47Rqm6UA3
         BkdEa57MBhXDJ8xwxamvyc7z8pIXUD7KFHyN9d2Ft7fewHvT0XPndPLwLpqefGcjT/lQ
         ySnjQ1VWgKHeHthVhRCRj4npYknz96PimSaVBOjy0wpxDJkO0fYlNclKno383gzeOCnj
         zZbQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+8X0CWYOY60TEvmxOljZ+8jKbbILh6qwjGmY/cD6va9nDTuyPJl7SPpgqKcgAH76HRgfjTZ1HLAP8GiHJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/9AI7C2vhfuLs5ga1w2I0/r9GFWA+5yVVvOgZ1nTbU88IkRHZ
	mSfcfhHR0QcDwDrLTEFKzZ0iNg5Hc/TafpqO0w5EL7tjsCkU4aqDW1jmIDSCPOk2Z80=
X-Gm-Gg: AY/fxX5Kjvb48FcIqjfbk0ToQWM2Dm+RsbhIFCs5Yyi9Zt+6f7UHH7UKYy8EpTLPjVQ
	kOfrrp4GTyQpQ2NFOWcbhcu4+lhow9hXnvSU7I+sJxg81mJTLKCWsukHkD/fpBB62TWfa28Yb4G
	22yg2k458njcd6mZs69bWBx6grShSLVZmWqFssHdCRB/pOainXEOo6JUdxzns/rsU+bDFKnna21
	NMNR8oyo47VNG8ZEgeHNFx/uP+8pct+IyUIABIV/sG/CLW8ZXx1dLqk1dFQC/i91bqKBAVBfzkj
	b6JcDlmiW5+kwWdbmt/+46aQrkk0IGrb+TLdqDHdpV6J83Dz7CtxzIsLtR5imsycs3XeUxxMLLM
	i8t/tdBrS7ov7yQhgJImpdNEpbUJ5/zuK+48/iStd349BG8L8QLcichblz+8ODcA+yr9KPjx6tG
	o8wqRP3P2al33jzvh3R+D21CsMrX2SlxulqNtzjEquWY3ukEG6dGwK+aY08JgatEI=
X-Received: by 2002:a05:600c:8b30:b0:480:1aae:676c with SMTP id 5b1f17b1804b1-4801e337219mr2560995e9.18.1768492457318;
        Thu, 15 Jan 2026 07:54:17 -0800 (PST)
Received: from [192.168.0.40] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47f42907141sm52933395e9.9.2026.01.15.07.54.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jan 2026 07:54:16 -0800 (PST)
Message-ID: <e94e3391-6fef-4378-b5bd-66aafea95a0c@linaro.org>
Date: Thu, 15 Jan 2026 15:54:15 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/3] media: qcom: camss: Add common TPG support
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20260113-camss_tpg-v8-0-fa2cb186a018@oss.qualcomm.com>
 <20260113-camss_tpg-v8-1-fa2cb186a018@oss.qualcomm.com>
 <87a31d4e-b604-4b9a-92e9-75fd2748489a@linaro.org>
 <98a26638-675b-4654-a940-898ba9e1af9c@oss.qualcomm.com>
 <e1907273-3d14-41ee-9a22-a963f2b83d20@linaro.org>
 <a70f69e6-6ee6-4a96-88fc-c0ec4db48697@oss.qualcomm.com>
 <641421a6-bf42-49f4-8f94-9cb0bce8e97c@linaro.org>
 <f77e0d03-ba4a-4722-b575-7aee8e93f04b@linaro.org>
 <f1c4288f-983f-4a62-82fb-22d1ec56bed0@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <f1c4288f-983f-4a62-82fb-22d1ec56bed0@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15/01/2026 02:58, Vladimir Zapolskiy wrote:
>>> Writing proper values to registers should be a concern on the driver 
>>> level,
>>> it sounds improper to push this simple task and responsibility to
>>> userspace.
>>
>> I think we should stick to the same format as is already upstream for
>> the CSID version of this - which is the same data.
>>
> 
> It is not the same and it will not be the same, if the currently presented
> version is taken. If TPG modes in CSID are continuous, here they are not,
> so it makes a big difference for userspace, and better it should be 
> removed.

Not sure I follow you here.

The set of strings for camss-csid we have now is:

const char * const csid_testgen_modes[] = {
         "Disabled",
         "Incrementing",
         "Alternating 0x55/0xAA",
         "All Zeros 0x00",
         "All Ones 0xFF",
         "Pseudo-random Data",
         "User Specified",
         "Complex pattern",
         "Color box",
         "Color bars",
         NULL
};

Wengmeng has

+const char * const testgen_payload_modes[] = {
+	"Disabled",
+	"Incrementing",
+	"Alternating 0x55/0xAA",
+	"Reserved",
+	"Reserved",
+	"Pseudo-random Data",
+	"User Specified",
+	"Reserved",
+	"Reserved",
+	"Color bars",
+	"Reserved"
+};

I think the "Reserved" should go away but, other than that we should 
keep namespace consistency between CSID-TPG and standalone-TPG.

---
bod

