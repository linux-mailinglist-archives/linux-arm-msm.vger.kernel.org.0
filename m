Return-Path: <linux-arm-msm+bounces-64084-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 82E07AFD518
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 19:17:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 435EE42127A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 17:16:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 287FC2E6133;
	Tue,  8 Jul 2025 17:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vDfJHdtR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F00EAF9E8;
	Tue,  8 Jul 2025 17:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751995007; cv=none; b=hUj7wvPf880UeyOKycoLv0unJVRxehm9cV5zgol/L7eKBCNO1xTGPJSesyG3huRC00lbKxmWkx/mYjhbPPtqvrx4y/KIqDiNO3aM3y4jtyKkvuoiIEuLtDyYn9XnWe7hfq+naZGMiK8ExJJXa0Dswadea24PPzpuPfShxa3nbTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751995007; c=relaxed/simple;
	bh=8JCM007Su614dbs0l57eUxf4MWAtqpo3iFUjAkEXeAQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nKj/N5x8whWtK2g8rlneAF7RiNUtI0S1gAmZwapab9trUK/O1Gzr/KgL5H66Rnm1j2z0CmRtI23JENWXc4XPkryfCmMHBnJHeO3rRPd74iSQXWlHuCgcGxhj3ntmw4Xo64c3K1k4TSAWO4T5WTvaOuLDOOfPxSGSwvW2Xun3S2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vDfJHdtR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D8B7C4CEED;
	Tue,  8 Jul 2025 17:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751995006;
	bh=8JCM007Su614dbs0l57eUxf4MWAtqpo3iFUjAkEXeAQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vDfJHdtRTlcgaUIFBLrdCi1UWjZWnGedZeU5C7IhRs0DTnUrd43Jb4WcnU3ZVH2XR
	 maXi/ZbFcpUUa1U36gKTtdWhSMQ9mXgQhWrnrrsyjNr/SGyW9Ol6iI9qYAAHlwtX5p
	 2M5/YD6MYvhd/TtyVkUAtsKtbTo/tx+m26kPiAnhd4senIUj4vT/Zpxg2NA2vKv1Xm
	 +3pTopEo669j9v4NV+3G1AtFLut/nYOYojVW3wZZwPpz0M4F1qc6uPMImCdjCqDhwJ
	 Uv/8nT4jdDruw9aEk7MkFE49Y2FsR97NSDw3ufc3RIYol+W11/7UfAvmCjFxU6mBG5
	 6agGSBMQYKTCg==
Date: Tue, 8 Jul 2025 12:16:45 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Maxime Ripard <mripard@kernel.org>, Sean Paul <sean@poorly.run>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>, devicetree@vger.kernel.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	linux-arm-msm@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Krishna Manikandan <quic_mkrishn@quicinc.com>,
	freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	Simona Vetter <simona@ffwll.ch>, David Airlie <airlied@gmail.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Marijn Suijten <marijn.suijten@somainline.org>
Subject: Re: [PATCH 1/4] dt-bindings: display/msm: dsi-controller-main: add
 SC8180X
Message-ID: <175199500495.649724.17681226218267809608.robh@kernel.org>
References: <20250704-mdss-schema-v1-0-e978e4e73e14@oss.qualcomm.com>
 <20250704-mdss-schema-v1-1-e978e4e73e14@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250704-mdss-schema-v1-1-e978e4e73e14@oss.qualcomm.com>


On Fri, 04 Jul 2025 19:31:53 +0300, Dmitry Baryshkov wrote:
> Describe the SC8180X-specific compatible for the DSI controller persent
> on the SoC. While the current DT for SC8180X doesn't use this
> compatible, all other platforms were updated to have one. This change
> makes SC8180X follow the lead.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


