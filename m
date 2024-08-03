Return-Path: <linux-arm-msm+bounces-27817-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C8A09466EC
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 Aug 2024 04:38:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 417C01C209F1
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 Aug 2024 02:38:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4E91B653;
	Sat,  3 Aug 2024 02:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NtJYliM6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 234BA20EB;
	Sat,  3 Aug 2024 02:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722652679; cv=none; b=H986BtzntuLeGvLO2LclUVFsBGEPs17Km9jb07JaZNHiiNBD9cNzZJg4eUEB6eAcnaxaQx4ajHQUEzybzo4XLduPtiNbfF5yvYZsgt0b4i14FNf7yF+J8BuuzWxPSQZHDT9tffE3lp8GdsWlRP6O0brVUfk9DuCtLbVLP8NSu/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722652679; c=relaxed/simple;
	bh=a6j5jKfDGojuf7XK8PkwLhH66PgT0971zW+9NrjFgEA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JgZKTjl6JcIy9YaNzylZiWgakgnXApS8nHbysJPEqshS9CSYWwh4BPnkiHHyBKyj+Q5aDweEhpivlLX/S+l6nsntrreQ3050IhM41yDTSXbWhRZPSuJIn1DSJXEvq3o0V/JDEtlydGSPc/fH83S7XOKU+QTq6RnGXg8FWu9SJJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NtJYliM6; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-6b79c969329so44368366d6.0;
        Fri, 02 Aug 2024 19:37:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722652677; x=1723257477; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+tHm0XRKhcukZsBzcu2vuKzIiUg/x7QNB9tMmshFIF8=;
        b=NtJYliM6RTj8xExooSZ04YPu9qDSgVTU2063N/ItLm24x7HSzdQn/3pa/zpKKMKPXY
         2sAL7kqR4zoTUSTMcRwSPVrjNzhjkfB9nGynhLG9eFvkLTx9EyfuIzfuvuTfoD8qEcjt
         zN2SMPfZFIyiDUF2hev+wqnq2IWbL+E811VTGf9sPtABbCeB8sorUc0JTPk/SR7nMZfC
         iOzJhF+Ic6OVto+I7USgvmRAz0Sj6nfNihwK63Kt7VcP7ZFgMcaDN+3CN21QJVsxGHSR
         R5Nh1gSQb3vq6gPK+JY0oLCilpyUZru43OoyGfamGEsiKi8Y70WwPXvfZ5MJMwH2gq6z
         lMIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722652677; x=1723257477;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+tHm0XRKhcukZsBzcu2vuKzIiUg/x7QNB9tMmshFIF8=;
        b=lqOct8CzrCLZBKRtDr1JE3OWwzROHXGhserikpa0dPDLgSmL7GFlldqorGGIHJUFFl
         ohcOH+vBJKPDB8KqPukAJENRu5unZBQdIcDt+H6R88UWS4tI29Vk6BPBY0zAuBuYQrie
         oFgijQhua5ph0fsev7caB8HL9TS616QZgV3UX7A6EIZ3rJlIwhaAg0UGxgl7OdW8K4pm
         +ufTgNjFkj5TxtjSk0wVEKilDUdc2hgtDKVZN2MSEHDQYiBsOoINUsUgKNMRwQ+IH2nL
         hDWZCTsbnvbX2uo3I7scBH6YpS5JJpM1zXQoxKS/6IQePwBW9ju+Z6sEEYTwMK4uNIPq
         F+Dw==
X-Forwarded-Encrypted: i=1; AJvYcCVc8sHMYhEgSYUzNZrmXSF/Dq6/Rr2WhEmvaDuMDfpC7wDugLoo8/HX/vjWjESMZ097ChqP7v44tkC6in+sL01h7Wxk3nh/Wvhh8HaIEtAZSJFBU0ZwyOla6jswbmQgRA59I6kziDK68zo=
X-Gm-Message-State: AOJu0Yx37Qx7Zv+xxeefqBajsAIC0v21IAzxAacJ9nIC1jBB3Pc9Op0r
	Sl29x/ywTg5EAIi1wU+51U7MMVKqGtC22SDD8YWw74czXVUpoGon
X-Google-Smtp-Source: AGHT+IHeW0oCuAYUKqNSkpMpIeXd9TfeijaXWhrzLO4R4P+EqckTLZqUm5DHdUGJdI1qvA79KSWVFg==
X-Received: by 2002:a05:6214:4a02:b0:6b7:4398:594c with SMTP id 6a1803df08f44-6bb9843efd0mr63557096d6.38.1722652676662;
        Fri, 02 Aug 2024 19:37:56 -0700 (PDT)
Received: from localhost ([2607:fea8:52a3:d200:324c:b818:b179:79b])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6bb9c765e4asm12355006d6.25.2024.08.02.19.37.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Aug 2024 19:37:56 -0700 (PDT)
Date: Fri, 2 Aug 2024 22:37:54 -0400
From: Richard Acayan <mailingradian@gmail.com>
To: Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Cc: Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 3/4] arm64: dts: qcom: sdm670: add gpu
Message-ID: <Zq2YAuxK5wRcNnve@radian>
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

On Mon, Jul 29, 2024 at 09:38:48PM -0400, Richard Acayan wrote:
> The Snapdragon 670 has the Adreno A615 GPU. Add it along with its device
> tree dependencies.
>
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/sdm670.dtsi | 168 +++++++++++++++++++++++++++
>  1 file changed, 168 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sdm670.dtsi b/arch/arm64/boot/dts/qcom/sdm670.dtsi
> index 187c6698835d..467006ab2bcb 100644
> --- a/arch/arm64/boot/dts/qcom/sdm670.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm670.dtsi

[snip]

> +
> +			gpu_opp_table: opp-table {
> +				compatible = "operating-points-v2";
> +
> +				opp-780000000 {
> +					opp-hz = /bits/ 64 <780000000>;
> +					opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L1>;
> +					opp-peak-kBps = <7216000>;
> +					opp-supported-hw = <0x8>;
> +				};
> +
> +				opp-750000000 {
> +					opp-hz = /bits/ 64 <750000000>;
> +					opp-level = <RPMH_REGULATOR_LEVEL_TURBO>;
> +					opp-peak-kBps = <7216000>;
> +					opp-supported-hw = <0xc>;
> +				};
> +
> +				opp-650000000 {
> +					opp-hz = /bits/ 64 <650000000>;
> +					opp-level = <RPMH_REGULATOR_LEVEL_NOM_L1>;
> +					opp-peak-kBps = <7216000>;
> +					opp-supported-hw = <0xc>;
> +				};
> +
> +				opp-565000000 {
> +					opp-hz = /bits/ 64 <565000000>;
> +					opp-level = <RPMH_REGULATOR_LEVEL_NOM>;
> +					opp-peak-kBps = <7216000>;
> +					opp-supported-hw = <0xe>;

The speed bins aren't entirely accurate. There is a single speed bin
that can reach exactly 504 MHz, but no higher, and one other speed bin
that can reach exactly 700 MHz. Let's add their exclusive OPPs.

> +				};
> +
> +				opp-430000000 {
> +					opp-hz = /bits/ 64 <430000000>;
> +					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
> +					opp-peak-kBps = <7216000>;
> +					opp-supported-hw = <0xf>;
> +				};
> +
> +				opp-355000000 {
> +					opp-hz = /bits/ 64 <355000000>;
> +					opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
> +					opp-peak-kBps = <6220000>;
> +					opp-supported-hw = <0xf>;
> +				};
> +
> +				opp-267000000 {
> +					opp-hz = /bits/ 64 <267000000>;
> +					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
> +					opp-peak-kBps = <4068000>;
> +					opp-supported-hw = <0xf>;
> +				};
> +
> +				opp-180000000 {
> +					opp-hz = /bits/ 64 <180000000>;
> +					opp-level = <RPMH_REGULATOR_LEVEL_MIN_SVS>;
> +					opp-peak-kBps = <1804000>;
> +					opp-supported-hw = <0xf>;
> +				};
> +			};

