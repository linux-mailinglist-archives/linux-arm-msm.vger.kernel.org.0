Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A5846643671
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Dec 2022 22:07:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231892AbiLEVH4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Dec 2022 16:07:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232331AbiLEVHd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Dec 2022 16:07:33 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F37A727DEB
        for <linux-arm-msm@vger.kernel.org>; Mon,  5 Dec 2022 13:07:19 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id bp15so20499667lfb.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Dec 2022 13:07:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=nEcGbFYaYRq0pR1tWc2XnqrDYCVIJgjwtYCoVp42TNk=;
        b=jjcnbT5RW+Jg3fKg5EXzRhjtcYoduMPGSVCGNsD0Npm/3UICGWW531+ekuoTbmyBbD
         HdfDMcXJBnaDDuczwEKLqKcMzBpPfO1sXzHCyPv9L361Y+IpUX2Ip1DJijpomiF/s0Zv
         6rg2NF4Aj0EijsK1Z0Rz3kU539KiMSaPJ1Y+ev6TiaFO2l7RMruIkz/Cjpnows6tGfdM
         KCCN2380XaEitxlH+8Ave1Wx4AINdfYCihKjp/1lRXkMhUmNo1dXAMyxC6YkuHB4n7KW
         ovSxd9RBBMDdhqEOMEIi5uWcTpZjMXCMCf2UfLdrvn7sauI0DH8fGn4lVCZtsyqWKSgJ
         VBew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nEcGbFYaYRq0pR1tWc2XnqrDYCVIJgjwtYCoVp42TNk=;
        b=H5Y4dYkSXTvDOPScwDJgLZQgN9ZmJ+GF2sYi6J3MbCxWD3kBsO8ZfqpK50f5WaiK5Y
         0eYyWnrvk5iZKcuq5S9AeJh+YZq9OONjgtc88RPi2xTDm13hfQASJCyq7Y5nk7Vz+prp
         Mnw5VW6ax2XMhrUaUAANJsuy5FDdmtJRXQDe8nlOZhBJ5qSqwme6BonyU11m5TjMbxsN
         zcMf5b1mO053YXJJ2/8pOu9A1Zt+da4MBRoN5xgdFrNeFiW/vQohYhQCdEfdxqn9Ca3I
         ZUoWz0Ex+ll4uUL3DxataFiNfdBHJeim3Gu9ra/3vt8mgUwCVWdP56VQFC/lz1CLrM3Z
         xgkw==
X-Gm-Message-State: ANoB5pkWAQKKvblQ9BbpxPoPY9plzGhtsBKoNk0RbYLT3+wvy+krSfly
        Vur/TpgoEnDEqdeKmTeWCegZcw==
X-Google-Smtp-Source: AA0mqf4mFk64/EPNgptSRfBt9JSDGtHkFbbcllBU2v8HjWoBGLcLmGR4VHuZIT1dMzCprrNqwdsdsA==
X-Received: by 2002:a05:6512:baa:b0:4b5:6417:644e with SMTP id b42-20020a0565120baa00b004b56417644emr3342100lfv.495.1670274438364;
        Mon, 05 Dec 2022 13:07:18 -0800 (PST)
Received: from [127.0.0.1] ([94.25.229.129])
        by smtp.gmail.com with ESMTPSA id u5-20020a05651c130500b0027740a1b854sm1509451lja.52.2022.12.05.13.07.17
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 05 Dec 2022 13:07:17 -0800 (PST)
Date:   Tue, 06 Dec 2022 00:07:12 +0300
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
Subject: Re: [PATCH v4 09/13] drm/msm/dp: Don't enable HPD interrupts for edp
User-Agent: K-9 Mail for Android
In-Reply-To: <20221205174433.16847-10-quic_bjorande@quicinc.com>
References: <20221205174433.16847-1-quic_bjorande@quicinc.com> <20221205174433.16847-10-quic_bjorande@quicinc.com>
Message-ID: <62FFEABE-0074-4836-84BE-2C88C83F8674@linaro.org>
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



On 5 December 2022 20:44:29 GMT+03:00, Bjorn Andersson <quic_bjorande@quic=
inc=2Ecom> wrote:
>From: Bjorn Andersson <bjorn=2Eandersson@linaro=2Eorg>
>
>Most instances where HPD interrupts are masked and unmasked are guareded
>by the presence of an EDP panel being connected, but not all=2E Extend
>this to cover the last few places, as HPD interrupt handling is not used
>for the EDP case=2E

I don't remember whether I asked that or not=2E Would it be possible to mo=
ve hpd irq enablement to bridge's hpd_enable() / hpd_disable() callbacks ? =
I think this would allow us to drop the is_edp checks=2E

>
>Signed-off-by: Bjorn Andersson <bjorn=2Eandersson@linaro=2Eorg>
>Reviewed-by: Dmitry Baryshkov <dmitry=2Ebaryshkov@linaro=2Eorg>
>Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc=2Ecom>
>---
>
>Changes since v3:
>- None
>
> drivers/gpu/drm/msm/dp/dp_display=2Ec | 15 ++++++++++-----
> 1 file changed, 10 insertions(+), 5 deletions(-)
>
>diff --git a/drivers/gpu/drm/msm/dp/dp_display=2Ec b/drivers/gpu/drm/msm/=
dp/dp_display=2Ec
>index 17fcf8cd84cd=2E=2Ebb92c33beff8 100644
>--- a/drivers/gpu/drm/msm/dp/dp_display=2Ec
>+++ b/drivers/gpu/drm/msm/dp/dp_display=2Ec
>@@ -610,8 +610,10 @@ static int dp_hpd_plug_handle(struct dp_display_priv=
ate *dp, u32 data)
> 	}
>=20
> 	/* enable HDP irq_hpd/replug interrupt */
>-	dp_catalog_hpd_config_intr(dp->catalog,
>-		DP_DP_IRQ_HPD_INT_MASK | DP_DP_HPD_REPLUG_INT_MASK, true);
>+	if (!dp->dp_display=2Eis_edp)
>+		dp_catalog_hpd_config_intr(dp->catalog,
>+					   DP_DP_IRQ_HPD_INT_MASK | DP_DP_HPD_REPLUG_INT_MASK,
>+					   true);
>=20
> 	drm_dbg_dp(dp->drm_dev, "After, type=3D%d hpd_state=3D%d\n",
> 			dp->dp_display=2Econnector_type, state);
>@@ -651,8 +653,10 @@ static int dp_hpd_unplug_handle(struct dp_display_pr=
ivate *dp, u32 data)
> 			dp->dp_display=2Econnector_type, state);
>=20
> 	/* disable irq_hpd/replug interrupts */
>-	dp_catalog_hpd_config_intr(dp->catalog,
>-		DP_DP_IRQ_HPD_INT_MASK | DP_DP_HPD_REPLUG_INT_MASK, false);
>+	if (!dp->dp_display=2Eis_edp)
>+		dp_catalog_hpd_config_intr(dp->catalog,
>+					   DP_DP_IRQ_HPD_INT_MASK | DP_DP_HPD_REPLUG_INT_MASK,
>+					   false);
>=20
> 	/* unplugged, no more irq_hpd handle */
> 	dp_del_event(dp, EV_IRQ_HPD_INT);
>@@ -678,7 +682,8 @@ static int dp_hpd_unplug_handle(struct dp_display_pri=
vate *dp, u32 data)
> 	}
>=20
> 	/* disable HPD plug interrupts */
>-	dp_catalog_hpd_config_intr(dp->catalog, DP_DP_HPD_PLUG_INT_MASK, false)=
;
>+	if (!dp->dp_display=2Eis_edp)
>+		dp_catalog_hpd_config_intr(dp->catalog, DP_DP_HPD_PLUG_INT_MASK, false=
);
>=20
> 	/*
> 	 * We don't need separate work for disconnect as

--=20
With best wishes
Dmitry
