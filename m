Return-Path: <linux-arm-msm+bounces-31792-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 82353979081
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Sep 2024 13:30:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B49371C21BF9
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Sep 2024 11:30:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F24A01CF5F1;
	Sat, 14 Sep 2024 11:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="skuqOD8j"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7ED212C54D;
	Sat, 14 Sep 2024 11:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726313383; cv=none; b=FRrkk5XARqLLjdLAKt7C5F1VFl2nPj7vzRnMEQlzhei6kY/QvhJH4Q+Z4Xd3ZLTQel5Orns5b07zRfyYMF2m3fSRFxKyyYEQwYK1tc8n6a+Tp6/OQP9/aSy//bG4ikvbzk6Ey9EguIHPyQmJALs/CBxtzD/Mlah9/JrXY84Z+oY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726313383; c=relaxed/simple;
	bh=ibWf5h/YDMR7+aYKTl31w6DGDWtFK+8+WSEzQEoJnZI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P4Dzee9r3x2qvbS3L55w/BgC/RQUJwCwla24lAQL7SwAuDHlMTvHtGI/hsJyUZGcLHrHthEabDsjZHJR7qzOVXeqW/ECgsj0QIsmoJzX46PF0qgGy1IMW0uYCfFX4tQjkSCKiiSpHIm7yw5Q6QR0kYJS9Lo6gTVkgAmhVkHNYlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=skuqOD8j; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C2E0C4CEC0;
	Sat, 14 Sep 2024 11:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726313383;
	bh=ibWf5h/YDMR7+aYKTl31w6DGDWtFK+8+WSEzQEoJnZI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=skuqOD8jLO7TYF3xAdh+YzydIe9lA57IQWVfeOofeb/wdeY9m1D21+O6Sqr+hdQgi
	 jFDyapW0FM9Psk+p7GcptCxlZ1hj1rFJsFVE7ntKdO1ati3NHnDz6aghSXCPaTwGKj
	 DWX25ggg7LaRE2kuREHyxIVzW/ji6J5U5lLPWsgY1yN2oPtnTGXKvijlw3lkTANNfM
	 ewYgVKxuIlVWqPQtNEZj2vTMMDLM+RFNZmaxMdBRZ6/I0uCpFlJvTQF4RS9paQ53Lw
	 IMypwu06ZvhZncqZwcDmvvso5R0YMRPsl0kuKgET+/MMuC57GXcTktuNg89w8PcwW4
	 t8oSRpTjCaEoQ==
Message-ID: <9fee28de-24eb-46b1-aa5b-6febc2972a3c@kernel.org>
Date: Sat, 14 Sep 2024 13:29:31 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] phy: qcom: edp: Introduce aux_cfg array for
 version specific aux settings
To: Soutrik Mukhopadhyay <quic_mukhopad@quicinc.com>, vkoul@kernel.org,
 kishon@kernel.org, konradybcio@kernel.org, andersson@kernel.org,
 simona@ffwll.ch, dmitry.baryshkov@linaro.org, abel.vesa@linaro.org,
 robdclark@gmail.com, quic_abhinavk@quicinc.com, sean@poorly.run,
 marijn.suijten@somainline.org, airlied@gmail.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 quic_khsieh@quicinc.com, konrad.dybcio@linaro.org,
 quic_parellan@quicinc.com, quic_bjorande@quicinc.com
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 quic_riteshk@quicinc.com, quic_vproddut@quicinc.com
References: <20240913103755.7290-1-quic_mukhopad@quicinc.com>
 <20240913103755.7290-3-quic_mukhopad@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konradybcio@kernel.org>
In-Reply-To: <20240913103755.7290-3-quic_mukhopad@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.09.2024 12:37 PM, Soutrik Mukhopadhyay wrote:
> In order to support different HW versions, introduce aux_cfg array
> to move v4 specific aux configuration settings.
> 
> Signed-off-by: Soutrik Mukhopadhyay <quic_mukhopad@quicinc.com>
> ---
> v2: Fixed review comments from Bjorn and Dmitry
> 	- Made aux_cfg array as const.
> 
> ---
>  drivers/phy/qualcomm/phy-qcom-edp.c | 37 ++++++++++++++++++-----------
>  1 file changed, 23 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
> index da2b32fb5b45..bcd5aced9e06 100644
> --- a/drivers/phy/qualcomm/phy-qcom-edp.c
> +++ b/drivers/phy/qualcomm/phy-qcom-edp.c
> @@ -90,6 +90,7 @@ struct phy_ver_ops {
>  
>  struct qcom_edp_phy_cfg {
>  	bool is_edp;
> +	const u8 *aux_cfg;
>  	const struct qcom_edp_swing_pre_emph_cfg *swing_pre_emph_cfg;
>  	const struct phy_ver_ops *ver_ops;
>  };
> @@ -186,11 +187,15 @@ static const struct qcom_edp_swing_pre_emph_cfg edp_phy_swing_pre_emph_cfg = {
>  	.pre_emphasis_hbr3_hbr2 = &edp_pre_emp_hbr2_hbr3,
>  };
>  
> +static const u8 edp_phy_aux_cfg_v4[10] = {
> +	0x00, 0x13, 0x24, 0x00, 0x0a, 0x26, 0x0a, 0x03, 0x37, 0x03
> +};

How about we only abstract the values that differ? It would seem like more
platforms reuse about half of these magic bytes

Konrad

