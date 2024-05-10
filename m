Return-Path: <linux-arm-msm+bounces-19688-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B7F888C2511
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 May 2024 14:50:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 36D6B282356
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 May 2024 12:50:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3E1A127B5F;
	Fri, 10 May 2024 12:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="F8uMkKM3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E055F376
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 May 2024 12:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715345400; cv=none; b=gkzxtwr6Qlr0oDcxmA3hfAQxK7N5ZPCLCQlPuMQpSoswqnsgWiBCWuvKq0QLPZlD/9ME7cIsMrlqyqct9s2/76RMYXzUmnnX6sR0euIb48eV37oM/XmCHM2keIbUFrtn7JqZq1xrV5lP9zAbb8jQ8F9nRlJbA6O/Td6C0v3caJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715345400; c=relaxed/simple;
	bh=e8oYhO8gpIXlkw2NTCH4PCGRI63BGYDQZ+LoX+zEZoo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qgxkEjLjdXM6cLEs0ql+bqePKQR0VPIKV6gtqwGhheanAQ4BINRM7ySYMRdabWFBl17I5M9N9lQvqlbhDVmzDoPsf0+QB/bvRY74mzRLXq/VaK7m7vrDd5K2rqtrVMEc1CT+sxXjOLQvb0zDr29gEcT/Ma7pZy59LaeEA6SUBck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=F8uMkKM3; arc=none smtp.client-ip=209.85.128.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-41ff5e3dc3bso3894985e9.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 May 2024 05:49:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715345397; x=1715950197; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dGh1C5y3FLEijiqD4sM17A/yGAQ20EDxp/D2IyXBR8o=;
        b=F8uMkKM3StAvUVv/zAgU0Zs/KiSTRl4+AXJkopLxasPYpuXBOAnKbJXg8SA5o1eowq
         Gbf3f1YKK4Z2AxS1w2PPEe43G1bNncOCDk9ZQlCfjeY+FVQ/3Vh5sl/fAnfKDxqNFtkA
         CNQ/L5kOGV4KYFKp4tA8q7PxM4cMgcEcE6VN33JpF5+oQL9uIvUgCF6xWMJLqXbFfhl5
         mPCcj4RoW3mMbm1sDNO9ok2p1T3bTBFiJ/1A66ZTYOfyYRnx1KGl8FvTnUP+Pu9NmcUj
         pZRYm4seHxgNeNGPR3s/VPo13osz0CGyowTzexWIqPTvyZwVyuewqu7yPdjMos7orG2I
         E3VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715345397; x=1715950197;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dGh1C5y3FLEijiqD4sM17A/yGAQ20EDxp/D2IyXBR8o=;
        b=BN5vZRxTOxPVs+8E583RFkGiY0fPnUphtl7LwdwuwfvzsPWcKYZgRxP0AQEki7my7u
         MLXMFVsamdzSOk7KMB2TP5u9yhsjm9q9+5xWDYvbwDoV237FRJZxrsLeNB56sEGpDEcH
         Ui4c+84cPG9QogH6vIYwaaG87RRWab3P2EvvXYEAyPHEx3zxifogvcjjyzG2YsqF8gJY
         h9xNbwFsJKytiVvPm9R7eOnTS++jzyPc3uk1jzEDPIHyZCmws/GBxrbYlfw324aBqHnI
         gi/ob1+yPesDkTccDiN0DnyX01pj1KUbN5ZIBFt8S0ChfTpkKiuEZr0iAUJhfTQN8HIS
         aY4w==
X-Gm-Message-State: AOJu0YzZDWnDo189jQx96+u1Ow/rK7fFHC9olnklFmr1rDzn3Qx/m0Vc
	eovnLlhRSqO5Si9SF2ZMTYwfqU+BsGjWzYsz1YeSkRRTAa8m1YCM30i2LQoyjTc=
X-Google-Smtp-Source: AGHT+IFsnS46zswqbpjJ71i4j/fP7pM80I7qhCs6nr0ajA+gbaKAJxnCuGqoRsRhUI941tuQahemjg==
X-Received: by 2002:adf:ff92:0:b0:34d:8f9c:e742 with SMTP id ffacd0b85a97d-3504a62fb49mr1871728f8f.5.1715345397278;
        Fri, 10 May 2024 05:49:57 -0700 (PDT)
Received: from [192.168.0.3] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3502b8a7748sm4499570f8f.49.2024.05.10.05.49.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 May 2024 05:49:56 -0700 (PDT)
Message-ID: <b4dba1d5-448a-4a4b-94d5-f27c6ff0010d@linaro.org>
Date: Fri, 10 May 2024 13:49:56 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/31] Clean up thermal zone polling-delay
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240510-topic-msm-polling-cleanup-v2-0-436ca4218da2@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240510-topic-msm-polling-cleanup-v2-0-436ca4218da2@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/05/2024 12:59, Konrad Dybcio wrote:
> A trivial follow-up on the changes introduced in Commit 488164006a28
> ("thermal/of: Assume polling-delay(-passive) 0 when absent").
> 
> Should probably wait until v6.9-rc1 so that the patch in question is
> in the base tree, otherwise TZs will fail to register.
> 
> FWIW, Compile-tested only (except 8280).
> 
> To: Bjorn Andersson <andersson@kernel.org>
> To: Rob Herring <robh@kernel.org>
> To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> To: Conor Dooley <conor+dt@kernel.org>
> To: cros-qcom-dts-watchers@chromium.org
> To: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> 
> Changes in v2:
> - Un-drop passive delays. Whether they're useful where they're enabled
>    is a topic for another patchset, as it requires examination on a case-
>    -by-case basis.
> - Better unify the style (newlines between properties)
> - Link to v1: https://lore.kernel.org/r/20240319-topic-msm-polling-cleanup-v1-0-e0aee1dbcd78@linaro.org

So perhaps you can answer the question I have.

Right now, we have non-zero delay values, doesn't this mean the thermal 
framework driver has a delay between evaluating dT/dt values per

Documentation/devicetree/bindings/thermal/thermal-zones.yaml

Your commit log implies or my reading of it is, there's no functional 
change because its currently driven by an IRQ but, is that actually _so_ 
with non-zero values in the DT?

---
bod


