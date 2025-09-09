Return-Path: <linux-arm-msm+bounces-72711-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 70225B4A700
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 11:13:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0932A188CA54
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 09:11:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 724DA27F198;
	Tue,  9 Sep 2025 09:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aZXUjAh5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 695E924338F
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Sep 2025 09:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757409016; cv=none; b=BwH2kqcTU3Ca9Lj0NH8tC/5EIR0CXf/s//mJe1tAWOMOi+oK3XZT+dbnXBrAlyGOhRzaSPTQjp/7Q7Gg4Mqi630fBNK9HYuYLdIsGFWP0uz5EzLKfj2Ts3Ion1VPo+KWZtevtRAMAQYbKAr2LQRRBntWMuAh90YkUtOAW4HFlyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757409016; c=relaxed/simple;
	bh=VLE9FplhQ6lDitRlXymWZCJ8Fc4/CeLS2ID2UGtqpbk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aWOvrXP5fnGWiZwN6L1C5/QxWGvoPVAf+16lbpx/3zQy3sIoNweEJfJxbOkWmhzooyXZsm5Fj4OcKCeGIGSPzk210qwH5+BFQi7Axiw1OjeR2i+n7umzr6Yjn4wMTW21imxP3PSU/aFGl1epv+Crli+I++eKn0W1zQOtXc5GGCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aZXUjAh5; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-55f7be09db9so1193920e87.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Sep 2025 02:10:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757409012; x=1758013812; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I2qd2T+JXYNAvNRWDPsoxIO3KI39MwSeylvIiluAMGU=;
        b=aZXUjAh5FH5e9XxyeJZnfHVMHl+5VgVGeLwitoHPIFOwXHEvwkcxmK7twFu90q/3eG
         0erTUKgTqEtFpv4Neac+RGmlkbR6Xdt6GaD0p7B9uUrDOh5WTqERudS0tAQh15vEL59J
         iDsfoIEoTfy/AXZtqWHC61FYeBBjq81Guy68BU43TbPZ7BIEfCgjN6lsXl2gLkENHBAZ
         suJOQb1mdEodFgL8oczFZKtgafJfpojeQncRKtYVEUSDQwHz2aUTlKf/bGzrlwPlQo2K
         z+yD4SuryN4d9QU9JuW63BcBLhlMuGIpEwqwxDEDFGkogo+tHBf45FP3/7f6YafmKbZ4
         iOfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757409012; x=1758013812;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I2qd2T+JXYNAvNRWDPsoxIO3KI39MwSeylvIiluAMGU=;
        b=gGnUSXM18FWzJk+pA4aV7BDxgbK7BR8Ww48CSrjtfJb5joGghZHZt6RxPfersxMp3a
         pPTaIfMjE4sF+FumnHINXbdF0GQ/nglKYT+o9k7BNsRQrZUrpxAAUnDE2FDtQloDEPIw
         9b2Fq5HZEjN0A8oEC3+Pz0i1s06JgXOE48/3IqvAxBFMYcs/G3pcr4FEf1wXK4oqH3y9
         vKHzM847LrLsRk46g6uRNDPaQ8XSaQH11PR/5E+GlUcDFtd4nPT87y71fWyoD1lpdkRk
         hqlxbSDFtEcF7yp3d+gihTKLkOP6RE/9TmpAT3m0aE2gtkTx3Ft64c4XKXpiXoYTifgC
         hxvQ==
X-Forwarded-Encrypted: i=1; AJvYcCU4Tz7kMSl+6eyW/JImZ32RDRZRhuGtr2mOYo1ggMNXNG5BIMIj17GFqudghwe/iPwKdF4L2Jw4SNhSdfaW@vger.kernel.org
X-Gm-Message-State: AOJu0YxQUCut49lKZtj2JYRk/RCt4Yr0CPRMk2VHiYh+FM0vRFnL0tMb
	7BEI2fCQ5Wz+ayHSL+BrGsLe1+kiLhxiWnAxL3hJic8MOsQuNgcqjkcS550UEoZOm5M=
X-Gm-Gg: ASbGncsTM3HVuIgks7l5RUbXYumtaCOvXH1Ng1gdwOI+pnSBdGdP0ObL4ZPVIwgBzj4
	7OyzwKwmGr8/vU/qNqWoe1boIlLQXrHEY5dT0jgtxIZUvNZV0AE00uTbXwLFomIIhr35ufAaTtH
	wnFkmoR3wzXGcGcVq358Ws5TvwTctZHOn9auoTc5RGnFrvCzmy164zRglYdIstDR/99c4o71QrW
	X31nuvXXWvX+apcLG+BTyjat8rJmRpRdOHAaPhlbl7ccBc0o2b8I5vsoIHj1VyCaTtESXre346R
	YynKE1HaV3QIF57LrHKsjXUuB0//dKcqjXSPNyfhtiUjIsr/54HTFW/15vniAmRMFgErsfhJbUq
	zHlIQBJfPuFyecUvtN4GYjBP7d6Z2M99rXUjFs3DsTFfAFaQKhN+p5gIFOouRdcVfQ/Iz0d25ua
	cbx+upgpUyIZ0=
X-Google-Smtp-Source: AGHT+IFKp0e6rYFkPuP5GOUGQG9IaL/DYm2C2+J//H0beXwbIEHVqSkMcbQxgd+CI1PI/N1zvlwtiA==
X-Received: by 2002:a05:6512:3f18:b0:55f:612b:b350 with SMTP id 2adb3069b0e04-56260e42abcmr1454991e87.3.1757409012532;
        Tue, 09 Sep 2025 02:10:12 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-568188224d7sm387477e87.120.2025.09.09.02.10.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Sep 2025 02:10:12 -0700 (PDT)
Message-ID: <5ea25a21-2379-455d-aec3-9a559e54d577@linaro.org>
Date: Tue, 9 Sep 2025 12:10:10 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] media: qcom: camss: change internals of endpoint
 parsing to fwnode handling
Content-Language: ru-RU
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hans.verkuil@cisco.com>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20250903002255.346026-1-vladimir.zapolskiy@linaro.org>
 <20250903002255.346026-5-vladimir.zapolskiy@linaro.org>
 <1d72c06a-1a44-4364-bde1-afc4514520a1@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <1d72c06a-1a44-4364-bde1-afc4514520a1@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/8/25 15:38, Bryan O'Donoghue wrote:
> On 03/09/2025 01:22, Vladimir Zapolskiy wrote:
>> Since a few called V4L2 functions operate with fwnode arguments the change
>> from OF device nodes to fwnodes brings a simplification to the code.
>>
>> The camss_parse_endpoint_node() function is called once by camss_probe(),
>> and there is no use of knowing a number of asynchronously registered
>> remote devices, so it makes sense to remove the related computation from
>> the function.
>>
>> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> I think we should keep the code as is here until after merging csiphy
> changes.
> 

The logic above is inverted, a status of changes intended for the mainline
Linux shall not depend on some out-of-tree project with no defined merge
date.

The change shown is this changeset does not contradict "csiphy changes"
added to arm64-laptops/linux, merging of these light changes to upstream
can be done immediately, and in a very unexpected case of a mess with
arm64-laptops/linux project you may revert/update any mainline changes.

The mainline Linux kernel should gain a priority over its forks IMO.

-- 
Best wishes,
Vladimir

