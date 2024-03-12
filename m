Return-Path: <linux-arm-msm+bounces-13922-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 651DC87931C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Mar 2024 12:37:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E546E1F22ACB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Mar 2024 11:37:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9437379B8B;
	Tue, 12 Mar 2024 11:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="o2/a5yHv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B787579B82
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Mar 2024 11:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710243416; cv=none; b=omqyaT+KmapNTy6NM/qRo1Mt8kOei9NlJ5dUNaiKgD9URMnsA7P2kksMz+rojOc815ty/clNbeGC0pzfWcACJkHacuviwN9pypshTAh++zQyF/Cf98zluUhZWIE+YpNSHfXdBUS8koS3BqQHUwH5ejrRshJywRLAxOTQ2NNTNLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710243416; c=relaxed/simple;
	bh=/HfAOTvgvK+ZP7hntk2gOupMDWzmnPzgBfeMmDbBJ8o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PkQJaM0CpaNlP3rtVYSS0VpHN1n//1M+APZkHfzBl9KBDrh/5/0oyKp7f0PsHzdZ4r88AqZNlyPa0gOVAzMQqivfViACvGUwEloM2xyAv0sEbQt/KGy7lpDBITFD5SB1uOU7wCCPdqx2PX8rJKI7SnmJ7njR8utaAnv6EzVyFys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=o2/a5yHv; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-33e8e9a4edaso3283546f8f.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Mar 2024 04:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710243413; x=1710848213; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0jQWEz46XfQeAJGkU96Nzsi3yVDV7VGgsIpTSrRBfXA=;
        b=o2/a5yHvwp8/mJHI3GPUBtjTp5PuRkQQOaXd1IDB/kOsTBRM9PBCn7qW6S4ir2uzj0
         X2A6ETWQvkZivxdXD1CcF4qpFv5KhJPhmQDpo/t1MQomuHk3EEx6gPOKk7+gq9hRponp
         mpT5FCIf4CWSA/otKbkv/KeacOKNDoNjEODupkXtSoZl3sh/SO+i5NgXbaN5iAdP0L0j
         EHaudPQtMbc9tYwrCP+jvg855hf0K3NaKfQeNy0ycDvvREq6/IDJG7JEwVKu8OtrBXhP
         jET75fvCpwqH8wacZowX4TislhTWbdlVIFyWCZ6c2t1srFeASmiEPpOcH2v04aLS/U3g
         dH8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710243413; x=1710848213;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0jQWEz46XfQeAJGkU96Nzsi3yVDV7VGgsIpTSrRBfXA=;
        b=NsFQ0Rn8zmYrJ1lRrA5uYmvQnytd6pMu0TfyFpYHG1I5omp6dMWG8Cvenfs4Gangwj
         9NLOsDBvfuPvQlnQvwdqelCmFb1MNfsB7jDesEXNGp8PVs64PMCxWjo7higHNkSe07Kh
         sgLnKPXWcpgOGp+1Ss27YZpsCVPaA/ZO8niHHhQB5xatT+dgjqjOHt34yibyenGJ7Oth
         /w+I+hwfsqJt4Pydx8iT09pKKaFIkFPkyQL489wWq3JPwCnkBCoBdSwJt8ychNdQavNK
         YI11w4PrNsqRN098uGpJHQPgm3SsWbqcdjOWbB+LS1UgWxZDnBBqGosf1gnoY3r/TYhQ
         klgA==
X-Forwarded-Encrypted: i=1; AJvYcCX3XBohXr/XoJ3m/oouD2aHejf9PyGf1D9WuTSNY5iDU8u1gzwBUz/0AY8M9soQPzXpq1SnVC7FksCgWgtCLtlcxFKPiIViAtNI9GtDgQ==
X-Gm-Message-State: AOJu0Yyr46W9OYyKITFgV3Q8/0p0kEQM1TAmoaGk1lN41+qFVagamO4+
	hVJfAMpl1mWjmCCcMox8DEaDKo3zGO1Yn7p3Da/DN3orLQ+wT8OXYowaysX1dQU=
X-Google-Smtp-Source: AGHT+IFPbyfspTiqBmykXM+/OZmKTJqO+WTpqMN171r75kCfPVwu3J+2IZ4n00AAacSciosYd2Yvwg==
X-Received: by 2002:a5d:6750:0:b0:33e:dd4:ca44 with SMTP id l16-20020a5d6750000000b0033e0dd4ca44mr2162984wrw.2.1710243413116;
        Tue, 12 Mar 2024 04:36:53 -0700 (PDT)
Received: from [192.168.0.102] ([176.61.106.68])
        by smtp.gmail.com with ESMTPSA id w17-20020adfee51000000b0033e1be7f3d8sm8828789wro.70.2024.03.12.04.36.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Mar 2024 04:36:52 -0700 (PDT)
Message-ID: <5d4434fc-862e-4430-a2a0-758887d7596d@linaro.org>
Date: Tue, 12 Mar 2024 11:36:51 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] platform: Add ARM64 platform directory
Content-Language: en-US
To: Nikita Travkin <nikita@trvn.ru>, Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Sebastian Reichel <sre@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, platform-driver-x86@vger.kernel.org
References: <20240312-aspire1-ec-v4-0-bd8e3eea212f@trvn.ru>
 <20240312-aspire1-ec-v4-2-bd8e3eea212f@trvn.ru>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240312-aspire1-ec-v4-2-bd8e3eea212f@trvn.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 12/03/2024 08:42, Nikita Travkin wrote:
> Some ARM64 based laptops and computers require vendor/board specific
> drivers for their embedded controllers. Even though usually the most
> important functionality of those devices is implemented inside ACPI,
> unfortunately Linux doesn't currently have great support for ACPI on
> platforms like Qualcomm Snapdragon that are used in most ARM64 laptops
> today. Instead Linux relies on Device Tree for Qualcomm based devices
> and it's significantly easier to reimplement the EC functionality in
> a dedicated driver than to make use of ACPI code.
> 
> This commit introduces a new platform/arm64 subdirectory to give a
> place to such drivers for EC-like devices.
> 
> A new MAINTAINERS entry is added for this directory. Patches to files in
> this directory will be taken up by the platform-drivers-x86 team (i.e.
> Hans de Goede and Mark Gross).
> 
> Signed-off-by: Nikita Travkin <nikita@trvn.ru>
> ---
>   MAINTAINERS                     |  9 +++++++++
>   drivers/platform/Kconfig        |  2 ++
>   drivers/platform/Makefile       |  1 +
>   drivers/platform/arm64/Kconfig  | 19 +++++++++++++++++++
>   drivers/platform/arm64/Makefile |  6 ++++++
>   5 files changed, 37 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index b43102ca365d..ec8d706a99aa 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3050,6 +3050,15 @@ F:	drivers/mmc/host/sdhci-of-arasan.c
>   N:	zynq
>   N:	xilinx
>   
> +ARM64 PLATFORM DRIVERS
> +M:	Hans de Goede <hdegoede@redhat.com>
> +M:	Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
> +L:	platform-driver-x86@vger.kernel.org
> +S:	Maintained
> +Q:	https://patchwork.kernel.org/project/platform-driver-x86/list/
> +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git

Surely some sort of Arm specific mailing list should be added here ? 
platform-drivers-x86 for arm64 platform drivers standalone, makes little 
sense.

Perhaps for each new SoC class added - you could add the appropriate 
mailing list linux-arm-msm is suspiciously missing from the list even 
though the only driver that will live in this directory after this 
series is a qcom based device.

And if tomorrow someone added a Rockchip based EC controller then you'd 
assume the rockchip mailing list should get a ping.

---
bod

