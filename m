Return-Path: <linux-arm-msm+bounces-60471-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1760CAD00EA
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Jun 2025 12:59:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 99B4A18936D6
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Jun 2025 11:00:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 410A0286D61;
	Fri,  6 Jun 2025 10:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="y7HvIGO6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BFB8267B94
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Jun 2025 10:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749207588; cv=none; b=dIaJGKRkXQ9QB7pFlPRuzyUFjV0lsh0+Y2hgxrtie6x1v5TN/9SvhtlwrdFm7iPU43T0lCBphMMd7+Xo5v7tjf4DYWg9CA8eM0Fz/b+0Ir3q0ZjroB1R6Y8vC35mDuANI+rrJ2eJauLzlH9/+NxLSMh+XrJws6F1ZFoF1opbwIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749207588; c=relaxed/simple;
	bh=eNvJDVx2RVD1ON1QjqqCkfACmTkFJYvAfRFH/oO/c8w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CTU2Guwd3JAJFplvcq//81C4XT8wokNOVnOQy3pgPWCDWnlSi1ypm2A0esJ43JT04KUBt/18dfPSB1rE/tHsVi0ErF5G9m2ud7oB8v6CKjcoyBB/1pi0iVgejiPz2f6TgXPTkGZVCkpC2YuVEwytHzZG0Auq2tCxCUu6jIAtJs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=y7HvIGO6; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-553237a1931so236502e87.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Jun 2025 03:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749207584; x=1749812384; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gvqW3AWqkK+q0nQJutHUZ9u8mAXK0/731ZCrAoRGHHE=;
        b=y7HvIGO6Qgb8Jd6cOhGPeEheZl0oTWJsquM7T8v1Pt4XRmNmpQzdBIKhcEGqV3RoRb
         JzFKHSYxau83ee0ZkqjtQbQVm2lMOV5CH0r9qb0RaiakGI5CZvlGJANB/fgoswf5hPB6
         VeHtydAr20LUS7q5LSYkezfHF2DCpH5h/5TglbOrd/BV0sTKZOk+1dpWjR2alnTmL039
         idYPqOFYnwox9Nm7YaToTgDOwTTz5xf2gZo39GIL+oloHCNX0RrUsnx81FT5t5N5RCx0
         2MfW2bBWTz0yNH4i5h9KIeYaxrq7qOczOk5bcXd+pd/roKChu/bG3NPMKw34oDIeWur5
         3bIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749207584; x=1749812384;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gvqW3AWqkK+q0nQJutHUZ9u8mAXK0/731ZCrAoRGHHE=;
        b=d3EzHdAeSQEhxLV+w1x/wjO1HxSuqKtw/Utp1DoWNgJMuJxPKrQvI4cw03gGfgA3ox
         piT6ibID5lq78b7vpq2PwlkQXmZKq4TGR5L0HhoSHxN/X4+0665/y9nSRNn2gzBEOPVj
         yNfiN/D+40yLA4516dez2CkzWb2bwA0SnXW8BPij55UZaTDhrte2klnBE16I5bgl8jTu
         sMjlHdIMtmFd1gKmZFqQLxJS4jj+2CyTEU/0hLgTGh+N3zSxFhDGKhNmYrVwEKRfgO60
         dRjVxLHE6hf12rKPAUeU7jNCWsKgR7xrc9C9QydrZJFjcEm9gcBSAczpISm4faZnZ6Q1
         PXgA==
X-Forwarded-Encrypted: i=1; AJvYcCW4xIR2dYJHigVJ/dZPQaGgkS5agQt/nbfKWfberDzWrPY736tKMfU/cqlEVpDKkfPFvHBktIthG9ZiWiKS@vger.kernel.org
X-Gm-Message-State: AOJu0YwNiLc0OKEMagwUN5gq5FU+TE51eAZJ1n8K9o7l9y3pX7LyrqpS
	i+e17W7LVKokRHQGMuviUHw8vpI8RDtUeilft0f+PRwmU4zPCW1wckmG7DtWPmlyHRQ=
X-Gm-Gg: ASbGnct7MxJRPU72iiE5/eUz5iCKYBINa00ASKDcPIK7t5cEKmiKKAcvkZL9a7I3br/
	A5Qa8Eh9x/GgNxLlXhG/ZgvLcBMB5MH8BNi8buD+T2lhwfM4FX3DpvFU/YnNrCLUS0sGG9Li7/p
	r3Abn2A9U//2ndKMATOvE9ScPj9GKs02sjMGe/CJIGsDAOttS4EW09Bi2cy99KZNS+an0cKVpuy
	WS2qvF2sREKDS++SUioc2LUzfa9Yc4NuMV4RyJLpLc4Q8eVsBCKZyF2NmkuncYGve66JcIjyB7U
	vJX3Bh1GZHCYZ8HvtOauHYOCpS7ivfdr6GdL6Kt50gREeX1UiycxxNPEnziFdiwtql8mDPjS3D8
	tMx+nwc2lNGBb67xnS67bgck2g/3c1azm7vk76TnP
X-Google-Smtp-Source: AGHT+IF6VGZzfzzaonioCVFuOZMDtflg4UEsDYktUq+bINrW6ckDf4AUU0LdM6+SSpNaHgJWBn5jVg==
X-Received: by 2002:a05:6512:401e:b0:54d:6dd3:614e with SMTP id 2adb3069b0e04-55366bd41d7mr243196e87.1.1749207584314;
        Fri, 06 Jun 2025 03:59:44 -0700 (PDT)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55367731877sm151482e87.223.2025.06.06.03.59.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Jun 2025 03:59:42 -0700 (PDT)
Message-ID: <877a72fa-cdae-4a66-9991-5ea86ef76aac@linaro.org>
Date: Fri, 6 Jun 2025 13:59:41 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] media: qcom: camss: Add support for MSM8939
Content-Language: ru-RU
To: vincent.knecht@mailoo.org, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20250602-camss-8x39-vbif-v4-0-32c277d8f9bf@mailoo.org>
 <20250602-camss-8x39-vbif-v4-2-32c277d8f9bf@mailoo.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20250602-camss-8x39-vbif-v4-2-32c277d8f9bf@mailoo.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello Vincent.

On 6/2/25 20:27, Vincent Knecht via B4 Relay wrote:
> From: Vincent Knecht <vincent.knecht@mailoo.org>
> 
> The camera subsystem for the MSM8939 is the same as MSM8916 except with
> 3 CSID instead of 2, and some higher clock rates.
> 
> As a quirk, this SoC needs writing values to 2 VFE VBIF registers
> (see downstream msm8939-camera.dtsi vbif-{regs,settings} properties).
> This fixes black stripes across sensor and garbage in CSID TPG outputs.
> 
> Add support for the MSM8939 camera subsystem.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Vincent Knecht <vincent.knecht@mailoo.org>

There was a preceding and partially reviewed changeset published on
linux-media [1] before v1 of the MSM8939 platform support in CAMSS,
due to a merge conflict this platform changeset should be rebased IMHO.

[1] https://lore.kernel.org/all/20250513142353.2572563-4-vladimir.zapolskiy@linaro.org/

--
Best wishes,
Vladimir

