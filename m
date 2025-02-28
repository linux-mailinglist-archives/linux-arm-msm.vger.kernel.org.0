Return-Path: <linux-arm-msm+bounces-49834-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 92E93A494C8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Feb 2025 10:24:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3633C7A2D72
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Feb 2025 09:23:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F5601DDC34;
	Fri, 28 Feb 2025 09:24:00 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from relay06.th.seeweb.it (relay06.th.seeweb.it [5.144.164.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36AB4276D3B
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Feb 2025 09:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.144.164.167
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740734640; cv=none; b=llSL4ATMC1EUC8jxIkPmPZl68ncYUg9PrC3xbqc7PqekeOVwPWMwyH9GVf/p5fVPTxTI9TYrvo8gtFJH5LyJ93Agf8Sokdznt+SNQk/q+mAkLS0HgNIWUEC2+MoI2ltJEUuASiqRk7Z+pK6w3O+ZPH2KyJbu47o3oaIs9picQRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740734640; c=relaxed/simple;
	bh=lWLCb46R8hij78SjcvmroxuHOuUYtOSrNx+gY4cGZB0=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=XjaIWYFQnNy2uHWGzWGL8sYCaHqliBKjt6zl9Aq8sNu14WeMDO1aGh3TyuSoQwDrlSTw6iORrvR7008kVaB2oLe/Kez44Jc7j98wMI/eSzqWBXalq8wQ8+ISOXq0EnhJJT71evSWTZ+Jmm7n3fPnQ4WgAaUEYIoSVQqygBs4PKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=somainline.org; spf=pass smtp.mailfrom=somainline.org; arc=none smtp.client-ip=5.144.164.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=somainline.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=somainline.org
Received: from [127.0.0.1] (161-51-78-170.static.ef-service.nl [161.51.78.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 6CDB03F26F;
	Fri, 28 Feb 2025 10:23:55 +0100 (CET)
Date: Fri, 28 Feb 2025 10:23:54 +0100
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
CC: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/8] drm/msm/dpu: program master INTF value
User-Agent: Thunderbird for Android
In-Reply-To: <20250228-dpu-active-ctl-v2-2-9a9df2ee5193@linaro.org>
References: <20250228-dpu-active-ctl-v2-0-9a9df2ee5193@linaro.org> <20250228-dpu-active-ctl-v2-2-9a9df2ee5193@linaro.org>
Message-ID: <CAACA6C8-441A-4B6E-AC07-A46094A02126@somainline.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 28 February 2025 05:14:06 CET, Dmitry Baryshkov <dmitry=2Ebaryshkov@lina=
ro=2Eorg> wrote:
>If several interfaces are being handled through a single CTL, a main
>('master') INTF needs to be programmed into a separate register=2E Write
>corresponding value into that register=2E
>
>Co-developed-by: Marijn Suijten <marijn=2Esuijten@somainline=2Eorg>
>Signed-off-by: Marijn Suijten <marijn=2Esuijten@somainline=2Eorg>
>Signed-off-by: Dmitry Baryshkov <dmitry=2Ebaryshkov@linaro=2Eorg>
>---
> drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl=2Ec | 12 ++++++++++++
> drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl=2Eh |  2 ++
> 2 files changed, 14 insertions(+)
>
>diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl=2Ec b/drivers/gpu/d=
rm/msm/disp/dpu1/dpu_hw_ctl=2Ec
>index 32ab33b314fc44e12ccb935c1695d2eea5c7d9b2=2E=2Effff60c4206c6f2833293=
fdcc56b653f7d3124a5 100644
>--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl=2Ec
>+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl=2Ec
>@@ -583,6 +583,9 @@ static void dpu_hw_ctl_intf_cfg_v1(struct dpu_hw_ctl =
*ctx,
> 	DPU_REG_WRITE(c, CTL_DSC_ACTIVE, dsc_active);
> 	DPU_REG_WRITE(c, CTL_MERGE_3D_ACTIVE, merge_3d_active);
>=20
>+	if (cfg->intf_master)
>+		DPU_REG_WRITE(c, CTL_INTF_MASTER, BIT(cfg->intf_master - INTF_0));
>+
> 	if (cfg->cdm)
> 		DPU_REG_WRITE(c, CTL_CDM_ACTIVE, cfg->cdm);
> }
>@@ -625,6 +628,7 @@ static void dpu_hw_ctl_reset_intf_cfg_v1(struct dpu_h=
w_ctl *ctx,
> {
> 	struct dpu_hw_blk_reg_map *c =3D &ctx->hw;
> 	u32 intf_active =3D 0;
>+	u32 intf_master =3D 0;
> 	u32 wb_active =3D 0;
> 	u32 merge3d_active =3D 0;
> 	u32 dsc_active;
>@@ -651,6 +655,14 @@ static void dpu_hw_ctl_reset_intf_cfg_v1(struct dpu_=
hw_ctl *ctx,
> 		intf_active =3D DPU_REG_READ(c, CTL_INTF_ACTIVE);
> 		intf_active &=3D ~BIT(cfg->intf - INTF_0);
> 		DPU_REG_WRITE(c, CTL_INTF_ACTIVE, intf_active);
>+
>+		intf_master =3D DPU_REG_READ(c, CTL_INTF_MASTER);
>+
>+		/* Unset this intf as master, if it is the current master */
>+		if (intf_master =3D=3D BIT(cfg->intf - INTF_0)) {
>+			DPU_DEBUG_DRIVER("Unsetting INTF_%d master\n", cfg->intf - INTF_0);

Don't think you want to include my testing ramblings here: we didn't print=
 a message either when the master was _set_, and don't print messages for o=
ther register writes either=2E

After that:

Reviewed-by: Marijn Suijten <marijn=2Esuijten@somainline=2Eorg>

>+			DPU_REG_WRITE(c, CTL_INTF_MASTER, 0);
>+		}
> 	}
>=20
> 	if (cfg->wb) {
>diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl=2Eh b/drivers/gpu/d=
rm/msm/disp/dpu1/dpu_hw_ctl=2Eh
>index 85c6c835cc8780e6cb66f3a262d9897c91962935=2E=2Ee95989a2fdda6344d0cb9=
d3036e6ed22a0458675 100644
>--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl=2Eh
>+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl=2Eh
>@@ -36,6 +36,7 @@ struct dpu_hw_stage_cfg {
> /**
>  * struct dpu_hw_intf_cfg :Describes how the DPU writes data to output i=
nterface
>  * @intf :                 Interface id
>+ * @intf_master:           Master interface id in the dual pipe topology

Not sure if you've seen my comment in v1 about the dual word; maybe the qu=
adpipe series can update it since they might need a master (or two?) as wel=
l?

- Marijn

>  * @mode_3d:               3d mux configuration
>  * @merge_3d:              3d merge block used
>  * @intf_mode_sel:         Interface mode, cmd / vid
>@@ -45,6 +46,7 @@ struct dpu_hw_stage_cfg {
>  */
> struct dpu_hw_intf_cfg {
> 	enum dpu_intf intf;
>+	enum dpu_intf intf_master;
> 	enum dpu_wb wb;
> 	enum dpu_3d_blend_mode mode_3d;
> 	enum dpu_merge_3d merge_3d;
>


