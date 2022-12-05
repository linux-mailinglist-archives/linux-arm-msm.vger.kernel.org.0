Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 82A9364368F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Dec 2022 22:11:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231940AbiLEVLd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Dec 2022 16:11:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230293AbiLEVLb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Dec 2022 16:11:31 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70BDFA197
        for <linux-arm-msm@vger.kernel.org>; Mon,  5 Dec 2022 13:11:30 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id bp15so20514930lfb.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Dec 2022 13:11:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Qaxv3NTYrdhjmMxZVeZBBOkIL8ZMlIl/vcyEbcU6bqg=;
        b=AJinAH99VXbxNr2krT+wMZh7dVoDVjZDaNl8/ctVT/ACKhwCOindRvGfbhcf9Fz2yK
         WoUtcBBmuGTFtkXQNTrRcuxgB1Zxfg3CtW1RCSkYKDVregHP+5fy3SXwBVUYmDOa4Bp+
         YSvvb4D8uUR2cMV8qZ1spxUxaWX48y5Or3PfDCjrmMGWI91bBax+03leUlqq5cSTUuPW
         ufztMSPfBkowr0wTiuCyXfFUDoRH+6a6Wr/FS1nn11GIOURz71DCEiKR0FpF/++0yStE
         NuD087I6mO4jdkX6+S0sBD54oHo7/R9z0dSfFz40zEkadVLZKiptm9e5SffPZpY6jwxb
         Tb+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Qaxv3NTYrdhjmMxZVeZBBOkIL8ZMlIl/vcyEbcU6bqg=;
        b=7n6CVnE6KHYKBABTj8NzKSpL6pDyjeS6SYK68rChwPh+skwYLtsOK3Io+5CIs4bRb/
         y8M2LUun/R3wv8HS/Xtqjd0xl2x0MFRRHM+GDepRjdHV6zuDM9tSef0g0MIBxZhlPjjT
         D3UheKWpK3IWsWlVbhFfMBX7keaTA3xWphRO3HVp1xsqXkkJhxzIuHFQ0I1Ei3JY8hY8
         qAtaEn1ljtuo+FDldkF+6oJu2qRUC8Qgrq57He3kasSC2yexSkz+bbHW4ULqfJ+hZGe8
         F2ZmT1/5DENpapuDCZZroGu24nMmXocYuIQS3JpcxWSgwYkMs5nZc4jylaU8XFZwV4KF
         mNNQ==
X-Gm-Message-State: ANoB5pmPvojfKwZ5HJ03ceWtR6TWGUDWOOhx+L2fXoo1+QkyqiJE7GAO
        s1YH+gmJ0pB1kCgbgNJGgQVHPQ==
X-Google-Smtp-Source: AA0mqf7qkc6/G1oAfHjBSLElK621Nca9745yIcsitoPhHVxolhipcePVEhdyc6Fe6cHVlBVdCwvdXA==
X-Received: by 2002:ac2:46e1:0:b0:4b4:c234:b79d with SMTP id q1-20020ac246e1000000b004b4c234b79dmr24242767lfo.557.1670274688813;
        Mon, 05 Dec 2022 13:11:28 -0800 (PST)
Received: from [127.0.0.1] ([94.25.229.129])
        by smtp.gmail.com with ESMTPSA id w22-20020ac254b6000000b004abc977ad7fsm2221502lfk.294.2022.12.05.13.11.27
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 05 Dec 2022 13:11:28 -0800 (PST)
Date:   Tue, 06 Dec 2022 00:11:22 +0300
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <quic_bjorande@quicinc.com>
CC:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Kalyan Thota <quic_kalyant@quicinc.com>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 10/13] drm/msm/dp: Rely on hpd_enable/disable callbacks
User-Agent: K-9 Mail for Android
In-Reply-To: <20221205174433.16847-11-quic_bjorande@quicinc.com>
References: <20221205174433.16847-1-quic_bjorande@quicinc.com> <20221205174433.16847-11-quic_bjorande@quicinc.com>
Message-ID: <2C14A755-81B2-44CD-A75B-627A137251A1@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 5 December 2022 20:44:30 GMT+03:00, Bjorn Andersson <quic_bjorande@quic=
inc=2Ecom> wrote:
>From: Bjorn Andersson <bjorn=2Eandersson@linaro=2Eorg>
>
>The DisplayPort controller's internal HPD interrupt handling is used for
>cases where the HPD signal is connected to a GPIO which is pinmuxed into
>the DisplayPort controller=2E In other configurations the HPD notificatio=
n
>might be delivered by the DRM framework from an associated bridge=2E
>
>This difference is not appropriately represented by the "is_edp"
>boolean, but is properly represented by the frameworks invocation of the
>hpd_enable() and hpd_disable() callbacks=2E Switch the current condition
>to rely on these callbacks instead=2E
>
>This ensures appropriate handling of the three cases; no bridge
>connected, a bridge without DRM_BRIDGE_OP_HPD and a bridge with
>DRM_BRIDGE_OP_HPD=2E
>
>Signed-off-by: Bjorn Andersson <bjorn=2Eandersson@linaro=2Eorg>
>Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc=2Ecom>
>---
>
>Worth mentioning, I did look into moving the HPD enablement/disablement
>completely into these new callbacks, but that affect the entire power
>management model of the driver, so I think it's worth to tackle that in
>subsequent changes=2E It seems also reasonable to expect that we by such
>modifications could leave the block unclocked until the external HPD
>notification arrives=2E=2E=2E

I see=2E=2E=2E I still suppose this is the way to go in the long term=2E

For now:

Reviewed-by: Dmitry Baryshkov <dmitry=2Ebaryshkov@linaro=2Eorg>

>
>Changes since v3:
>- Introduced reliance on hpd_enable/disable callbacks instead of next_bri=
dge
>
> drivers/gpu/drm/msm/dp/dp_display=2Ec | 35 ++++++++++++++++++++---------
> drivers/gpu/drm/msm/dp/dp_display=2Eh |  1 +
> drivers/gpu/drm/msm/dp/dp_drm=2Ec     |  2 ++
> drivers/gpu/drm/msm/dp/dp_drm=2Eh     |  2 ++
> 4 files changed, 30 insertions(+), 10 deletions(-)
>
>diff --git a/drivers/gpu/drm/msm/dp/dp_display=2Ec b/drivers/gpu/drm/msm/=
dp/dp_display=2Ec
>index bb92c33beff8=2E=2E3e464c33ff11 100644
>--- a/drivers/gpu/drm/msm/dp/dp_display=2Ec
>+++ b/drivers/gpu/drm/msm/dp/dp_display=2Ec
>@@ -610,7 +610,7 @@ static int dp_hpd_plug_handle(struct dp_display_priva=
te *dp, u32 data)
> 	}
>=20
> 	/* enable HDP irq_hpd/replug interrupt */
>-	if (!dp->dp_display=2Eis_edp)
>+	if (dp->dp_display=2Einternal_hpd)
> 		dp_catalog_hpd_config_intr(dp->catalog,
> 					   DP_DP_IRQ_HPD_INT_MASK | DP_DP_HPD_REPLUG_INT_MASK,
> 					   true);
>@@ -653,7 +653,7 @@ static int dp_hpd_unplug_handle(struct dp_display_pri=
vate *dp, u32 data)
> 			dp->dp_display=2Econnector_type, state);
>=20
> 	/* disable irq_hpd/replug interrupts */
>-	if (!dp->dp_display=2Eis_edp)
>+	if (dp->dp_display=2Einternal_hpd)
> 		dp_catalog_hpd_config_intr(dp->catalog,
> 					   DP_DP_IRQ_HPD_INT_MASK | DP_DP_HPD_REPLUG_INT_MASK,
> 					   false);
>@@ -682,7 +682,7 @@ static int dp_hpd_unplug_handle(struct dp_display_pri=
vate *dp, u32 data)
> 	}
>=20
> 	/* disable HPD plug interrupts */
>-	if (!dp->dp_display=2Eis_edp)
>+	if (dp->dp_display=2Einternal_hpd)
> 		dp_catalog_hpd_config_intr(dp->catalog, DP_DP_HPD_PLUG_INT_MASK, false=
);
>=20
> 	/*
>@@ -701,7 +701,7 @@ static int dp_hpd_unplug_handle(struct dp_display_pri=
vate *dp, u32 data)
> 	dp_display_handle_plugged_change(&dp->dp_display, false);
>=20
> 	/* enable HDP plug interrupt to prepare for next plugin */
>-	if (!dp->dp_display=2Eis_edp)
>+	if (dp->dp_display=2Einternal_hpd)
> 		dp_catalog_hpd_config_intr(dp->catalog, DP_DP_HPD_PLUG_INT_MASK, true)=
;
>=20
> 	drm_dbg_dp(dp->drm_dev, "After, type=3D%d hpd_state=3D%d\n",
>@@ -1086,8 +1086,8 @@ static void dp_display_config_hpd(struct dp_display=
_private *dp)
> 	dp_display_host_init(dp);
> 	dp_catalog_ctrl_hpd_config(dp->catalog);
>=20
>-	/* Enable plug and unplug interrupts only for external DisplayPort */
>-	if (!dp->dp_display=2Eis_edp)
>+	/* Enable plug and unplug interrupts only if requested */
>+	if (dp->dp_display=2Einternal_hpd)
> 		dp_catalog_hpd_config_intr(dp->catalog,
> 				DP_DP_HPD_PLUG_INT_MASK |
> 				DP_DP_HPD_UNPLUG_INT_MASK,
>@@ -1379,8 +1379,7 @@ static int dp_pm_resume(struct device *dev)
>=20
> 	dp_catalog_ctrl_hpd_config(dp->catalog);
>=20
>-
>-	if (!dp->dp_display=2Eis_edp)
>+	if (dp->dp_display=2Einternal_hpd)
> 		dp_catalog_hpd_config_intr(dp->catalog,
> 				DP_DP_HPD_PLUG_INT_MASK |
> 				DP_DP_HPD_UNPLUG_INT_MASK,
>@@ -1778,6 +1777,22 @@ void dp_bridge_mode_set(struct drm_bridge *drm_bri=
dge,
> 		!!(dp_display->dp_mode=2Edrm_mode=2Eflags & DRM_MODE_FLAG_NHSYNC);
> }
>=20
>+void dp_bridge_hpd_enable(struct drm_bridge *bridge)
>+{
>+	struct msm_dp_bridge *dp_bridge =3D to_dp_bridge(bridge);
>+	struct msm_dp *dp_display =3D dp_bridge->dp_display;
>+
>+	dp_display->internal_hpd =3D true;
>+}
>+
>+void dp_bridge_hpd_disable(struct drm_bridge *bridge)
>+{
>+	struct msm_dp_bridge *dp_bridge =3D to_dp_bridge(bridge);
>+	struct msm_dp *dp_display =3D dp_bridge->dp_display;
>+
>+	dp_display->internal_hpd =3D false;
>+}
>+
> void dp_bridge_hpd_notify(struct drm_bridge *bridge,
> 			  enum drm_connector_status status)
> {
>@@ -1785,8 +1800,8 @@ void dp_bridge_hpd_notify(struct drm_bridge *bridge=
,
> 	struct msm_dp *dp_display =3D dp_bridge->dp_display;
> 	struct dp_display_private *dp =3D container_of(dp_display, struct dp_di=
splay_private, dp_display);
>=20
>-	/* Without next_bridge interrupts are handled by the DP core directly *=
/
>-	if (!dp_display->next_bridge)
>+	/* Plug events are generated by the dp_display_irq_handler() */
>+	if (dp_display->internal_hpd)
> 		return;
>=20
> 	if (!dp->core_initialized) {
>diff --git a/drivers/gpu/drm/msm/dp/dp_display=2Eh b/drivers/gpu/drm/msm/=
dp/dp_display=2Eh
>index dcedf021f7fe=2E=2E371337d0fae2 100644
>--- a/drivers/gpu/drm/msm/dp/dp_display=2Eh
>+++ b/drivers/gpu/drm/msm/dp/dp_display=2Eh
>@@ -21,6 +21,7 @@ struct msm_dp {
> 	bool power_on;
> 	unsigned int connector_type;
> 	bool is_edp;
>+	bool internal_hpd;
>=20
> 	hdmi_codec_plugged_cb plugged_cb;
>=20
>diff --git a/drivers/gpu/drm/msm/dp/dp_drm=2Ec b/drivers/gpu/drm/msm/dp/d=
p_drm=2Ec
>index 3898366ebd5e=2E=2E275370f21115 100644
>--- a/drivers/gpu/drm/msm/dp/dp_drm=2Ec
>+++ b/drivers/gpu/drm/msm/dp/dp_drm=2Ec
>@@ -102,6 +102,8 @@ static const struct drm_bridge_funcs dp_bridge_ops =
=3D {
> 	=2Eget_modes    =3D dp_bridge_get_modes,
> 	=2Edetect       =3D dp_bridge_detect,
> 	=2Eatomic_check =3D dp_bridge_atomic_check,
>+	=2Ehpd_enable   =3D dp_bridge_hpd_enable,
>+	=2Ehpd_disable  =3D dp_bridge_hpd_disable,
> 	=2Ehpd_notify   =3D dp_bridge_hpd_notify,
> };
>=20
>diff --git a/drivers/gpu/drm/msm/dp/dp_drm=2Eh b/drivers/gpu/drm/msm/dp/d=
p_drm=2Eh
>index 79e6b2cf2d25=2E=2E250f7c66201f 100644
>--- a/drivers/gpu/drm/msm/dp/dp_drm=2Eh
>+++ b/drivers/gpu/drm/msm/dp/dp_drm=2Eh
>@@ -32,6 +32,8 @@ enum drm_mode_status dp_bridge_mode_valid(struct drm_br=
idge *bridge,
> void dp_bridge_mode_set(struct drm_bridge *drm_bridge,
> 			const struct drm_display_mode *mode,
> 			const struct drm_display_mode *adjusted_mode);
>+void dp_bridge_hpd_enable(struct drm_bridge *bridge);
>+void dp_bridge_hpd_disable(struct drm_bridge *bridge);
> void dp_bridge_hpd_notify(struct drm_bridge *bridge,
> 			  enum drm_connector_status status);
>=20

--=20
With best wishes
Dmitry
