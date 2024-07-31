Return-Path: <linux-arm-msm+bounces-27542-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 61A92943108
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 15:35:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EE385B2598A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 13:35:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF1561B1421;
	Wed, 31 Jul 2024 13:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="urG+oKL4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FFB01AE85E
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Jul 2024 13:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722432918; cv=none; b=ZiOlq4Z7RKLHqQXxyNed7w/9uVqd1L2+BTt5Gz78DFmvW0SzjtQ5UcYsqN21X5D4sV5OEe9fq+LBHoXjYIxicEI3ZqhiyjUOKQdzv4t3MmzF0RImZHSOaUu8gWWTUccS/t1xKwN+cbk6hQPZ027XCU6vqJ9iUSAsPwoU4MOatU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722432918; c=relaxed/simple;
	bh=UyKFMFScKLIP8IpKBhj7u4hVpC3HT4sM6sX6xd4Lh5Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SHYhAUg/ehi5ilL6G08Wfkv6OCCFmN60uQGXyr058rp8GALLlKU2Hb3eFQMaQ6c6hF0HlEQpGEZJ5onUdsx/Y3im6nIBLqtH8NTHZ2qRwyVRv1uH/PrZGZEAhhIerJZH1mzU4y8fWSjFvPPR2AsjKBOUsyjSvlP9pEvpIIqyTNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=urG+oKL4; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2eeb1ba0468so88998891fa.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Jul 2024 06:35:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722432915; x=1723037715; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2nuFog//dQJyQDurmfY02l3W/M3VEET6dFsY5XpmaxY=;
        b=urG+oKL4wvrzFVUgZ7GEdpLfrFmh8ahYUvx2gUhO64UWg6xPFQRDMAjIe/nfJFNT71
         0MB//04EjOeK49sN9DdawTrLIPHwctESYlkdMXc/uazZ8m65B/KGnnpoOsZsD3bXTLfP
         FR/3591LGYXCAozBMHGY+pSrx6LksV59V9gwzuDcgDQKc2DNDiRaSb8++eGk6domTX+K
         caT9Sel0yXMmTFCHtT7Ftk7fugmKiZ4Fzk+SWn2GKAJxkzpmAKEK+wihBgQdseDn4UYg
         qojiaSVrMxTG7j5utPtKB4C7mvlYlars352QJP1sHdnJJIJlvD+I23tm2V658h0WVb2U
         ouOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722432915; x=1723037715;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2nuFog//dQJyQDurmfY02l3W/M3VEET6dFsY5XpmaxY=;
        b=PvOYlaXeGtvLp6u8/CPSj/mtmXzdrrreJe0ga+eKoPlIBJ9Tfq/cbhCnM4wBS3syVa
         6SDOpB5rz0OEwLQzBkR0ISiOSkkXgcCQiDKSrYVXIzJO8JiASQyXjGiH759eNUssGD3F
         2D/591wau6Ctxftk+Vg32K+C0deTAlkPNkMHwBJU8xcG23Tgziq4cmoEuALBYqL+o+Fj
         AgtppEiH9m5FBBh9+XAzTDEQSFbfu06CLPPQqSJLiLYSk15lgq+5CFoNEMALCK2wzsce
         Qp9f5uRHvbvJrK20uIb6gzbbMajvhBiV5lChmkUM+7jE1VsdYESEp2arFTUBk+akOa8W
         APtw==
X-Forwarded-Encrypted: i=1; AJvYcCVfg1VUQeEBcPl+U6pZ2vaz2mxTNOTzNeuSb8L3L3BfBzUlrchCkrHjefsFKDiwPiDFGXCWBjGfVowouwZC2IN/ayGt0bdLbMNp6XKOaw==
X-Gm-Message-State: AOJu0Yy4RVrfnn9OBZjvGJ09bQfXVH98XAsJj+LdHlsuMTdlLc/Skviq
	MMoD6Ap3TlpsgvB9oBkOXRxNh3cTRL5Pbt/zjKpa/h5Rq5zPFP7j4kj+T7fidVQ=
X-Google-Smtp-Source: AGHT+IGK97ZT6lgO5zmLXsUMfHQ0g2+ejUm5/06nq2BG7Njg79hsOrPZXa8iT9IXsNx5sVJEXLv2jw==
X-Received: by 2002:a2e:9608:0:b0:2ef:2443:ac8c with SMTP id 38308e7fff4ca-2f12ee422eemr90180411fa.31.1722432915136;
        Wed, 31 Jul 2024 06:35:15 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f03cf30a74sm19598871fa.41.2024.07.31.06.35.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jul 2024 06:35:14 -0700 (PDT)
Date: Wed, 31 Jul 2024 16:35:13 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Richard Acayan <mailingradian@gmail.com>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 3/4] arm64: dts: qcom: sdm670: add gpu
Message-ID: <l7qdl43tyrdw6yuupd2ym47ztmb2jhb5tzswme4yoitipsqrai@qalxt7hjmt4c>
References: <20240730013844.41951-6-mailingradian@gmail.com>
 <20240730013844.41951-9-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240730013844.41951-9-mailingradian@gmail.com>

On Mon, Jul 29, 2024 at 09:38:48PM GMT, Richard Acayan wrote:
> The Snapdragon 670 has the Adreno A615 GPU. Add it along with its device
> tree dependencies.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/sdm670.dtsi | 168 +++++++++++++++++++++++++++
>  1 file changed, 168 insertions(+)

> +
> +		gmu: gmu@506a000 {
> +			compatible = "qcom,adreno-gmu-615.0", "qcom,adreno-gmu";
> +

[...]

> +
> +			status = "disabled";

Probably no need to. The rest LGTM.

> +
> +			gmu_opp_table: opp-table {
> +				compatible = "operating-points-v2";
> +
> +				opp-200000000 {
> +					opp-hz = /bits/ 64 <200000000>;
> +					opp-level = <RPMH_REGULATOR_LEVEL_MIN_SVS>;
> +				};
> +			};
> +		};
> +

-- 
With best wishes
Dmitry

