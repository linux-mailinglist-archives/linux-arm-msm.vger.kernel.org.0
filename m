Return-Path: <linux-arm-msm+bounces-85033-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2094ECB58CF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Dec 2025 11:47:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2A6933005095
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Dec 2025 10:47:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDA85303C9F;
	Thu, 11 Dec 2025 10:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="taRiryPZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 171E62F693F
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 10:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765450073; cv=none; b=MxrxJsplXlrZC8q+IRoqTfzWGK4Tb3KfBB8mj3zIlY1/39zyY9GOjK4KoqKq64Te5CQI1JEZXHpo4l1H5ApuCweNAt85XoaLcHiuM4thjF3eH1ALUddhZQENc8YQpZfZ3N2VN+AEC6yJWN/+PwK7INImM4jWP8MD+e5cBxFECkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765450073; c=relaxed/simple;
	bh=/hJYTPgyO3sAld5wDaKkhaw6EwYwaEEqTlH2rzJMZ18=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CaibsgvcpUeixAwdGesQhPQZu1AMiz4f8bm3dgrJrREIpashl8SfiP9eyr1lxdE/x+jzmv9NXNCQFPk/LVDMAm93Znf+0mgIZaEFe4LrtkVVl1AkbrkZy/ByNNNDaoI3adLY+zcGIrP9DJwrnW/EcbQdhYvkFofi/6+fhHu0EZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=taRiryPZ; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-37a33bd356fso476211fa.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 02:47:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765450070; x=1766054870; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sa4s1sdDw8tatxWU1wIWykEhaXAgMDTgFi6xwN1LbFg=;
        b=taRiryPZHvOW9mL33v9ReHpkrhaoocqTitjcPVbfs4xVSwYcLXLbTuUYatSTE7ByuO
         hp7KVu++Cf6FWfGN0HVQhx2GDef8cAQiNBMJ4RaQ9kSLZ02xgv6GaTKSOEtbUD8AkW/E
         CLhGLvzELWudAb9wEMa2is/oCPaKFGl9p1l6mOMojUz67w31vXSLMBMHHg5ezu0HYGMc
         DVuFCsenWa2JjDb6iKw8pXdpLRRRBxiG+9RpdAa0C5HPu8GcdHz3c1xVDvfKqgc44pA5
         SlTV/zINSzIFAwdtHJtRBfWiMaqoqLDg72xhVHRT+XoeBMID3R9gm6PTdWZBz36OF/8u
         cMGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765450070; x=1766054870;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sa4s1sdDw8tatxWU1wIWykEhaXAgMDTgFi6xwN1LbFg=;
        b=TUHH4HYqsZXL1elKhpMQe4nnBVmVmcffdtot47FdMMqpJNJqYGauYv3gbOBYataFnJ
         t7balkMoq1eh3dr9SO+YWjQNo7i2zWLZM0xxzmhayIvf6UkM3qNvm/KO4oiJ9/8mXVIk
         l2X8kn83Kh4AuBjhbXrzQ66Ic55U8Y2eZYxSUNnQT5j6EeN1I/98opOUfKynzTKJxvgr
         4xYFpW4Iw9HateSQ3pQH8LEy7AsADz8B0d0Rb2Tit7R/aj1LHA1F1/DDv/jPp41icVCp
         zC9QN2if4f4ZbsGdavgRT6XTvvmDtfTk6SWvxEOUGfWBcaZWb+y4YCGlv+c822YURVtv
         Sqhw==
X-Forwarded-Encrypted: i=1; AJvYcCWIYJbyREeaAWrgb5ypSrJ7o76PbJJRUg9olYCXLeCc640oMpSJ1jlYQWZriw9bJLFkZXHl2MDV4reV71Lr@vger.kernel.org
X-Gm-Message-State: AOJu0YxCVNnLa/Ed5cj1ZmX6RB+5cjefISM3ZmdyOfUfN805mzzTxs4I
	2aYsY/sy4/TyNadBQnHXbn+lG6GZcsklsJ2Cx3S7zuW9LI4AlCXMVMuqTYBcCq5I3NraAR9GXkF
	w351A
X-Gm-Gg: AY/fxX6vVv7PCsA7/43O0OI776K2RXD3OrBqRp1txSr8jDxYGSCPw1ejuH2KM3oNvpR
	tbFPih1ek6mgWBPEY2jkkjI+DZlmtBNVO2CzS9z2HK7zV0pAnsbs7Nqik3D9J6ueJmln0Sfaf/o
	wAu6PVd5/KNLRcKBrNlPnvxhmJ4rrd2QvQZXfXSbJDPKBOKxnarRuGupgExs7G98+QCBwZ/D53j
	eG02KL6KYInZMcHxozcDmUUTV6YScyEC96iQXerjnhvv3lJPvhl7UFjCxZgXG/IlpRoERMm4ah8
	mfvQtkoHdw6QbKlpt4gmdXWbiyB+nXrlDMh6OqwkeBMQY1dBlS1+N1FmG4xn5B5Rq7Yuwzj/yHc
	V65j1eqV+0eObwqmDkGSwoILCZIp3gj1GregwyrYgXWPdwHTGsEgTtKwNGOpOnVQYat465An86x
	Q3PRuxEuIhy9BMVK6HSrNB0D4Oc2jqRYrkeBVJRqNtc20WQ6ilS89Dwad7LTPR78i9Btj5ZNDrS
	TrW
X-Google-Smtp-Source: AGHT+IHL0nA4s/oF/x2Q6BybMdGdTLDPq2ugV8txN57v1OrxcOFcQnTUnN2DMwrgc1SDYdT1FHQ2+A==
X-Received: by 2002:a05:651c:f1c:b0:37b:bafc:26a4 with SMTP id 38308e7fff4ca-37fbe0c23a7mr3640941fa.1.1765450070139;
        Thu, 11 Dec 2025 02:47:50 -0800 (PST)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37fbc9ba1e6sm5688151fa.17.2025.12.11.02.47.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Dec 2025 02:47:49 -0800 (PST)
Message-ID: <dfeb8bbe-8751-45f8-9ed8-1e28435056e2@linaro.org>
Date: Thu, 11 Dec 2025 12:47:48 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/5] arm64: dts: qcom: sdm670: add camera mclk pins
To: Richard Acayan <mailingradian@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Tianshu Qiu <tian.shu.qiu@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-media@vger.kernel.org
Cc: Robert Mader <robert.mader@collabora.com>
References: <20251211014846.16602-1-mailingradian@gmail.com>
 <20251211014846.16602-5-mailingradian@gmail.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20251211014846.16602-5-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/11/25 03:48, Richard Acayan wrote:
> The camera subsystem is added for the SoC common devicetree, but the
> mclk pins should also be common across the SoC. Add the mclk pins for
> the cameras.
> 
> Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Link: https://lore.kernel.org/r/5135823c-f2e4-4873-9e3a-9d190cac0113@oss.qualcomm.com
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir

