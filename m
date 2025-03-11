Return-Path: <linux-arm-msm+bounces-51035-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A9CB9A5CD48
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Mar 2025 19:10:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4973E3A4932
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Mar 2025 18:10:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C85EF262D05;
	Tue, 11 Mar 2025 18:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="At4YJ3V5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB1842627E7
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Mar 2025 18:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741716620; cv=none; b=q88bhxlcW3CG+g8SNMM9gOaiA+cI2J+OXsLkmpw5+7zS98h5MBh3r4gnazNrBj3iqtygylxOlcDvv1qNfeSLlCF8Ryn7luX0JnItgQUASB6qlmp4m8rSjhIT4PV1ivhBKXV9K5UwoZg8znsHflIoyioyFjrycr6emByyX55aK84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741716620; c=relaxed/simple;
	bh=coAzhB0hx7rYebe0dMRnAoaKwZDK9rhElFVz2wVG6jc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aXyUtPBZJj30Btuxy+pGf/At0MXx5i3O840VG2sSTkVUrPGB5NzPzs1bwmPVK0HY+Z5XId0nwtaFt8qcS+7q8eCfJ3nd5J3KeZn2pXogEvNmDWjujwXMMOGrqoRKW7injPIwgaltOMWkilgqqAD2UZI7m1JZ+RTFROIBWrDI5HM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=At4YJ3V5; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3913cf69784so3988959f8f.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Mar 2025 11:10:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741716617; x=1742321417; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7tecvAy+u2nTgNfC9RdDCsqyar8u41Y2yinoQJZWxPw=;
        b=At4YJ3V51CeWCPyLfE0DJVp//Dep8xz9zqENUdX0gbpbeWvp1hGWhYmta56PGiu1d/
         Q9rqu/Ld1nwCoUauIk9PM/AnWH6A2LXYvEOG6MHAQ0xbJ5dzjszKvbHq6+8y6WJs5pY4
         C0APWZOoS5kLoYZEqpN1Ofwn1TOFHmbYf2SZYSjNk/AtIUarR06HCmxwRJ9+LBeabcBF
         cvpi8LdZogC9/PGhF028kHFS8h9jtEVni7XIRiE9LQoFOJv5zbuMbojFzoWxfGJcw2rV
         XkBHVY9ZOE/T7hPvHW1IjUxAu6syOsBi2DvXcR5qeo6z0pOkAB0/zz+fdQKuE+VHjMOx
         xTlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741716617; x=1742321417;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7tecvAy+u2nTgNfC9RdDCsqyar8u41Y2yinoQJZWxPw=;
        b=v6wsRN2oWKrPg5sjb1uFo0VNxJVrmTDnj5i48a7yenUj7Js6ncnNBUp3bN+4FcKZvm
         9Ly/QpOtATcllLNWT+bzXR9x5dGEkLiC6N+w2UWtMbiFl8p1hfhbw1G97DV46gSI0+rl
         qJb5Pzqo1cVvAAshbWBvZLe848tJPTaT5YIO1oDZD2pmN1elRKEIyuKCFPuXpLsb1w2P
         QKzEP5deSyRILNEU07wNqswBeqzYjjdWco9JQq5eFgSA4y1z6z3mAa/3kQyKJwm113i6
         ZppZ5Oc+hTviJwkBWrZa1SjQNJuTTIqZt0cTXf8q45SKN22sdL289IufMtXRv9xonDs7
         PAnA==
X-Forwarded-Encrypted: i=1; AJvYcCXLqp4HjJadnYRRRQrfhZm7tVT8rZ/Cf2VW1rMeG5Bs9Mx49457Tkz6nr2n+PYkkjvgJBBEeEmGbdobKWsF@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+otB6NyDIuN96ToK9AxUzudZMcX+8Vpto0kj5MBrGFFF22OBs
	X9yZufjWP5x/fdsexNYUjZiWdKIlM/+Aqxjk5AiSXr8hKzYS09vaRsa2RxcRlXOKTctvHC5nM9Q
	3VX6Fx4pzn2F0GcaOWwWw1vW2eCutCOElgNMfuw==
X-Gm-Gg: ASbGncuNUPZYs22DX8rewzMtE8Nnom371e+ECHQzE78Ee14K/7G/2Bv8fx6n4cdFgSq
	BuKRqxwcVf4jkHcesMu1Hq4QJDwtKeIlZXidXLSfBjNDGI09aPTFPyMh4eSVW5lqp5IJG8DSeci
	JY0V+LyaTl/V3iO6I644XCOrZYsDc=
X-Google-Smtp-Source: AGHT+IEoMIu2qa0ouzgu4WMGPB2l4x9tF1jT5ThBiiWJB8oICkXYch22N7BWvOSIBrMFeOfJO4XpxafHp8QkcQy5AgE=
X-Received: by 2002:a05:6000:402a:b0:391:888:f534 with SMTP id
 ffacd0b85a97d-39132d39209mr19655289f8f.20.1741716617093; Tue, 11 Mar 2025
 11:10:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250311-wip-obbardc-qcom-defconfig-interconnects-builtin-v1-1-675b6bc57176@linaro.org>
In-Reply-To: <20250311-wip-obbardc-qcom-defconfig-interconnects-builtin-v1-1-675b6bc57176@linaro.org>
From: Christopher Obbard <christopher.obbard@linaro.org>
Date: Tue, 11 Mar 2025 19:10:06 +0100
X-Gm-Features: AQ5f1Jog8mLk3h4VXg6PLgDM_85qkXGsgrKxdx2EG0uqVayo6r93gzulMiKOPb8
Message-ID: <CACr-zFC=mPNeeHMp9XnSby+cMQaPWt_3s8iUiCN+EnVPeGad8Q@mail.gmail.com>
Subject: Re: [PATCH] arm64: defconfig: Enable Qualcomm interconnects as built-in
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

I sent this patch to start the discussion, some things I found:

1) Some interconnects are missing from arm defconfig. Should they be =y too ?
$ grep CONFIG_INTERCONNECT_QCOM arch/arm/configs/qcom_defconfig
CONFIG_INTERCONNECT_QCOM=y
CONFIG_INTERCONNECT_QCOM_MSM8974=m
CONFIG_INTERCONNECT_QCOM_SDX55=m

2) Some interconnects are missing from arm64 defconfig (which should
probably be in there) (I have included just two examples):
$ grep CONFIG_INTERCONNECT drivers/interconnect/qcom/Makefile
obj-$(CONFIG_INTERCONNECT_QCOM_QCS615) += qnoc-qcs615.o
obj-$(CONFIG_INTERCONNECT_QCOM_SM7150) += qnoc-sm7150.o

I can handle these in follow-up or v2 of the patchset as follow-up
commits, please let me know what you'd prefer.

On Tue, 11 Mar 2025 at 19:03, Christopher Obbard
<christopher.obbard@linaro.org> wrote:
>
> Currently some Qualcomm interconnect drivers are enabled
> as modules which isn't overly useful since the interconnects
> are required to be loaded during early boot.
>
> Loading the interconnects late (e.g. in initrd or as module)
> can cause boot issues, such as slowdown or even not booting
> at all (since the interconnect would be required for storage
> devices).
>
> Be consistent and enable all of the Qualcomm interconnect
> drivers as built-in to the kernel image.
>
> Signed-off-by: Christopher Obbard <christopher.obbard@linaro.org>
> ---
>  arch/arm64/configs/defconfig | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 219ef05ee5a757c43a37ec9f8571ce9976354830..6582baee2ab02ecb2ff442c6e73aa6a23fee8d7f 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -1656,11 +1656,11 @@ CONFIG_INTERCONNECT_IMX8MN=m
>  CONFIG_INTERCONNECT_IMX8MQ=m
>  CONFIG_INTERCONNECT_IMX8MP=y
>  CONFIG_INTERCONNECT_QCOM=y
> -CONFIG_INTERCONNECT_QCOM_MSM8916=m
> +CONFIG_INTERCONNECT_QCOM_MSM8916=y
>  CONFIG_INTERCONNECT_QCOM_MSM8996=y
> -CONFIG_INTERCONNECT_QCOM_OSM_L3=m
> +CONFIG_INTERCONNECT_QCOM_OSM_L3=y
>  CONFIG_INTERCONNECT_QCOM_QCM2290=y
> -CONFIG_INTERCONNECT_QCOM_QCS404=m
> +CONFIG_INTERCONNECT_QCOM_QCS404=y
>  CONFIG_INTERCONNECT_QCOM_QCS615=y
>  CONFIG_INTERCONNECT_QCOM_QCS8300=y
>  CONFIG_INTERCONNECT_QCOM_QDU1000=y
>
> ---
> base-commit: b098bcd8278b89cb3eb73fdb6e06dc49af75ad37
> change-id: 20250311-wip-obbardc-qcom-defconfig-interconnects-builtin-258fcc961b11
>
> Best regards,
> --
> Christopher Obbard <christopher.obbard@linaro.org>
>

