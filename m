Return-Path: <linux-arm-msm+bounces-41172-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C27E9EA256
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Dec 2024 00:02:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 147E116247A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 23:02:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40F1A19E804;
	Mon,  9 Dec 2024 23:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="H4C7/opO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 510F819E975
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Dec 2024 23:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733785329; cv=none; b=qTSDajas+1R4fdqHxtIiPgVBTtl7N0YkzokbfHTLOEqiWwu6jlFg4nTuXpBFD7epXb0uSJeK2oqs1FxwIWN1Uhh+vrZ04o9G2F5VssQYvNY4JFYFRbg/oRuQm7yIv19neC+RXypQChQG07Fwo/Dp9QJWXIEZzdyAuqDa2ZZSiUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733785329; c=relaxed/simple;
	bh=liVgg1Un+JU5vW6EYLPj8di7vygEt5iqSY9bAiVog34=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oqntdbjvLew9E96pFwc7rTunz8wmpARx8w4OKeqrqxSwcvty/+JyxGjWld6jvr1wpYqKUHkwCYOKgM59CZvKL5zkKWZr9pJ8Gzl8Hmr/uyeTPVI+zEta8UnnfOzQiYHEWCsccK5y5jF6zj+Fm4z7wzsHJbBcGhi4bm43A4q5qMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=H4C7/opO; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-30033e07ef3so35688231fa.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Dec 2024 15:02:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733785325; x=1734390125; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZK4h9MVOu/9hHVaZl4zKkp7NLqwJGJJgqac6hR7MTzI=;
        b=H4C7/opO6VRlO1FOruHjjKT+5sRaz+Z1bOwuetx89+wRwiCDJeYC25VGFEq9oXb7oM
         l6s91X4z4wb0A0C/w2AU1NIMRnim1aUHESYQtlLOCWoC4j25EDBbB/Lxmzoz3TBMc5od
         pMkCnqKdpfxSM3u952XJjB5elM2Zh7Cqgb41cnuJWMd3WAKp4SbsAHQliEm/VNTKzfAU
         t4QVQEgkftv3WZV0+tbCtg6VuMF5gl9IC5x/sGFZk8JR5dz4QdjXx+YuuPdGqXFlPWmP
         Ytlo81VWlbr5crnDKkwMce4e/5uc649cNMdP9uMfNLqVe+XWFkCcTGBEhoFJ7Ihakbox
         PbQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733785325; x=1734390125;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZK4h9MVOu/9hHVaZl4zKkp7NLqwJGJJgqac6hR7MTzI=;
        b=DqbYsQHb6n5PO/MZfN4BQYRppu5BQlv1fSxQogR3OMKYL3YxQFKpw4XLGOnbHxg0BD
         LwUzsVwaraUpF94IvCWqCSR/V2RkiMezBmcdBOo6PHQFtGWMViYXECywt2BvRtViwQKp
         5/TYIzG8o1bUHOpDtg4QpzZI9ZEpGYazuTfaXFBJJXA+ls6RU2gjhrpmJndIqz3FhXM9
         nfcVIC4pmFJSSSCn4k9i1eo3FUWmGUV6zghSbJA5QDF2l953n77pFj6d+DP2GN1p8L5s
         tnWaDkBg5rK2NQ/lLZm2zMDn8mMfkxZCsNbLCeTxlA0G6qx+VjEH5itOF8Xarc0FMtvw
         2a7Q==
X-Forwarded-Encrypted: i=1; AJvYcCWksIDue5vgwK8AyE1ZetwmcXVRzbYnZ1MUfhEYK5gtHF2yVXKSuesrxF8fjOrSdcCNnpw4XBHm9zw8cz+7@vger.kernel.org
X-Gm-Message-State: AOJu0YyGdp71WEbGtusa54lRH7wFXmSVS77RgvI1H5ajzE7g7YuJcDmq
	I7gnTkWbNfLorVyQdlJSHxPRaM16OxAKFfRDucAtBlBDfCIGQZpqxfIdEZKznMU=
X-Gm-Gg: ASbGncstBEmxJkkwPb/qMgLM8g81r9lRBbS1NESwrI90uhCL8hwG3Dfpb1muADBlUez
	2l3LpPfEhBFP18PCo1zmUfLZj0PDZhUSmHJhEwTWsjOzL8RThOcSQhmdDXpeSTyEdtVj9A7gztb
	AEZ25QMzO1jwwHhzY3/alfoeTmemM5OunbytzhmmqxOaRE8Tbl/eXYyTGXrZZvWhfI6es5c/eAN
	7EXUeHmIPKt4aN5WQEjSQhLk3lVcXc1FfCVcKc+8He2OFAmr9D8teyANJaVfpXlMCWq/rAI/Yt6
	sd3N+LNyluT+eDgnLHm6jlpCdAVYwoq4YQ==
X-Google-Smtp-Source: AGHT+IGnzZ2PJOWGOC6WltKgaOFUzxo3aZDddEYLzVRS44dM7WNYY9fUmV4e2qc5kDuxOcyc0FX6/Q==
X-Received: by 2002:a2e:be0b:0:b0:2ff:b8f5:5a17 with SMTP id 38308e7fff4ca-3023282c1femr3802651fa.5.1733785325460;
        Mon, 09 Dec 2024 15:02:05 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30038ce97b4sm10022871fa.118.2024.12.09.15.02.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 15:02:04 -0800 (PST)
Date: Tue, 10 Dec 2024 01:02:01 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Douglas Anderson <dianders@chromium.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Julius Werner <jwerner@chromium.org>, Jeffrey Hugo <quic_jhugo@quicinc.com>, 
	Roxana Bradescu <roxabee@google.com>, bjorn.andersson@oss.qualcomm.com, 
	linux-arm-kernel@lists.infradead.org, Trilok Soni <quic_tsoni@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, Anshuman Khandual <anshuman.khandual@arm.com>, 
	Besar Wicaksono <bwicaksono@nvidia.com>, D Scott Phillips <scott@os.amperecomputing.com>, 
	Easwar Hariharan <eahariha@linux.microsoft.com>, Oliver Upton <oliver.upton@linux.dev>, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/6] arm64: cputype: Add QCOM_CPU_PART_KRYO_3XX_GOLD
Message-ID: <k64saaxnipegp4ot636apzewrs7dz2j7xdpqxg6iotbaderuia@hxqf63bwwztf>
References: <20241209174430.2904353-1-dianders@chromium.org>
 <20241209094310.3.I18e0288742871393228249a768e5d56ea65d93dc@changeid>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241209094310.3.I18e0288742871393228249a768e5d56ea65d93dc@changeid>

On Mon, Dec 09, 2024 at 09:43:13AM -0800, Douglas Anderson wrote:
> Add a definition for the Qualcomm Kryo 300-series Gold cores.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> I have no idea if this is actually right and no way to test it, but it
> fits the pattern of the other definitions. Someone from Qualcomm ought
> to confirm this.

This matches what I see on SDM845.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


> 
>  arch/arm64/include/asm/cputype.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/include/asm/cputype.h b/arch/arm64/include/asm/cputype.h
> index 488f8e751349..c8058f91a5bd 100644
> --- a/arch/arm64/include/asm/cputype.h
> +++ b/arch/arm64/include/asm/cputype.h
> @@ -119,6 +119,7 @@
>  #define QCOM_CPU_PART_KRYO		0x200
>  #define QCOM_CPU_PART_KRYO_2XX_GOLD	0x800
>  #define QCOM_CPU_PART_KRYO_2XX_SILVER	0x801
> +#define QCOM_CPU_PART_KRYO_3XX_GOLD	0x802
>  #define QCOM_CPU_PART_KRYO_3XX_SILVER	0x803
>  #define QCOM_CPU_PART_KRYO_4XX_GOLD	0x804
>  #define QCOM_CPU_PART_KRYO_4XX_SILVER	0x805
> @@ -195,6 +196,7 @@
>  #define MIDR_QCOM_KRYO MIDR_CPU_MODEL(ARM_CPU_IMP_QCOM, QCOM_CPU_PART_KRYO)
>  #define MIDR_QCOM_KRYO_2XX_GOLD MIDR_CPU_MODEL(ARM_CPU_IMP_QCOM, QCOM_CPU_PART_KRYO_2XX_GOLD)
>  #define MIDR_QCOM_KRYO_2XX_SILVER MIDR_CPU_MODEL(ARM_CPU_IMP_QCOM, QCOM_CPU_PART_KRYO_2XX_SILVER)
> +#define MIDR_QCOM_KRYO_3XX_GOLD MIDR_CPU_MODEL(ARM_CPU_IMP_QCOM, QCOM_CPU_PART_KRYO_3XX_GOLD)
>  #define MIDR_QCOM_KRYO_3XX_SILVER MIDR_CPU_MODEL(ARM_CPU_IMP_QCOM, QCOM_CPU_PART_KRYO_3XX_SILVER)
>  #define MIDR_QCOM_KRYO_4XX_GOLD MIDR_CPU_MODEL(ARM_CPU_IMP_QCOM, QCOM_CPU_PART_KRYO_4XX_GOLD)
>  #define MIDR_QCOM_KRYO_4XX_SILVER MIDR_CPU_MODEL(ARM_CPU_IMP_QCOM, QCOM_CPU_PART_KRYO_4XX_SILVER)
> -- 
> 2.47.0.338.g60cca15819-goog
> 

-- 
With best wishes
Dmitry

