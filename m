Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BD24D6E3AB6
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 Apr 2023 19:39:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229976AbjDPRjv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 16 Apr 2023 13:39:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229948AbjDPRjv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 16 Apr 2023 13:39:51 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05F1298
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Apr 2023 10:39:50 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id j5so1651458wms.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Apr 2023 10:39:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681666788; x=1684258788;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vj/vqJ5bGXyvz254ZvxSYqoDaKPY0yBJ/BPaiX+7f40=;
        b=GbZ9qiyBQiC3ZZsAZwmZuMooMXC98jAjM1w5wB0VdPvf4Av6DHWd74zf4tSA1A10Us
         47dMt74Xi0tWrq0wZOBcoOyTGktzKBUzP/Nw38f2QTbY3fL22uqTDCkuE7yLtp/mEWpK
         M2+xB0M77byJB40/68yhEdIK/+OlSWyNof2HGBhKlvj5OsUlnd066BJwIfNr2tVMNBgG
         ilNt18gjeWShGrj/nW9QjYOSCy79DIVKXZfqRsTDbC6FFV1Nq89WYLO1S7d1ks9YhRHV
         pIYWWEkCEXCv60Hl25tTsvZjyDiZvfGV5GEoIIdzPpvP8vbTEI/7NIn0rSluk8erIJ2+
         As8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681666788; x=1684258788;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vj/vqJ5bGXyvz254ZvxSYqoDaKPY0yBJ/BPaiX+7f40=;
        b=WU/tkys9O8J5Yllmzm3ct+UGQq69qGg/miPWWs0lId9f5if3QYqeNilAk/RNTuCAVj
         1l5f9NgfgWKyH6rDhsm2LeZ59I4fS+NWYkGeQz6wx/VXZxHx9vnfcqeJqh1ZjLvBGDIM
         m2OGktCLaJY2W2BkJPhPBit4CyfWFDo5GJ7bvVaMvFqJ6igArSHDdiGgVpTt2jBbQEGH
         1MRPhANensUzCOwsPEdTr3vp8EQzIUGcTzlSDyCNFb8qwQ/yYESKzIfpE/OZ9i95Gc1Y
         0Tlo/ShbehqwQNGege9g1MwDoxSpews+VWoZttFQlxgqwucVuQgk5X8bzKpUfE3saAJP
         ajfA==
X-Gm-Message-State: AAQBX9cTMrK45WTlN1R0ba2nrr9Lih+tpnWABcSfvN0MGxT0Ao6PpmuN
        J0GqBjpL5ZbAHgEiOjy18ZI=
X-Google-Smtp-Source: AKy350Y3fPwLrncRZ6gFnnV7HPqMl22uXBtXMCQlzgWmqs+WZ7y/f+Rn5c6rFTgk3saJv+pVdBlMbg==
X-Received: by 2002:a05:600c:348e:b0:3ee:93d2:c915 with SMTP id a14-20020a05600c348e00b003ee93d2c915mr8408694wmq.6.1681666788361;
        Sun, 16 Apr 2023 10:39:48 -0700 (PDT)
Received: from speedcore (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id v9-20020a5d6b09000000b002d97529b3bbsm8486767wrw.96.2023.04.16.10.39.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Apr 2023 10:39:47 -0700 (PDT)
Date:   Sun, 16 Apr 2023 19:39:46 +0200
From:   Arnaud Vrac <rawoul@gmail.com>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        dri-devel@lists.freedesktop.org,
        Stephen Boyd <swboyd@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@gmail.com>
Subject: Re: [Freedreno] [PATCH 2/2] drm/msm/dpu: add HDMI output support
Message-ID: <ZDwy4n12G8unCgM0@speedcore>
References: <20230415171926.85774-1-dmitry.baryshkov@linaro.org>
 <20230415171926.85774-3-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20230415171926.85774-3-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Apr 15 20:19, Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:

>MSM8998 and the older Qualcomm platforms support HDMI outputs. Now as
>DPU encoder is ready, add support for using INTF_HDMI.
>
>Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>---
> drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 45 +++++++++++++++++++++++++
> 1 file changed, 45 insertions(+)
>
>diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>index e85e3721d2c7..65cce59163a4 100644
>--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>@@ -617,6 +617,45 @@ static int _dpu_kms_initialize_displayport(struct drm_device *dev,
> 	return 0;
> }
>
>+static int _dpu_kms_initialize_hdmi(struct drm_device *dev,
>+				    struct msm_drm_private *priv,
>+				    struct dpu_kms *dpu_kms)
>+{
>+	struct drm_encoder *encoder = NULL;
>+	struct msm_display_info info;
>+	int rc;
>+	int i;
>+
>+	if (!priv->hdmi)
>+		return 0;
>+
>+	encoder = dpu_encoder_init(dev, DRM_MODE_ENCODER_TMDS);
>+	if (IS_ERR(encoder)) {
>+		DPU_ERROR("encoder init failed for HDMI display\n");
>+		return PTR_ERR(encoder);
>+	}
>+
>+	memset(&info, 0, sizeof(info));

Move this where fields are initialized ?

>+	rc = msm_hdmi_modeset_init(priv->hdmi, dev, encoder);
>+	if (rc) {
>+		DPU_ERROR("modeset_init failed for DP, rc = %d\n", rc);
>+		drm_encoder_cleanup(encoder);
>+		return rc;
>+	}
>+
>+	info.num_of_h_tiles = 1;
>+	info.h_tile_instance[0] = i;

i is uninitialized here, the line can be removed.

With the above changes:

Reviewed-by: Arnaud Vrac <rawoul@gmail.com>
Tested-by: Arnaud Vrac <rawoul@gmail.com> # on msm8998

-Arnaud

>+	info.intf_type = INTF_HDMI;
>+	rc = dpu_encoder_setup(dev, encoder, &info);
>+	if (rc) {
>+		DPU_ERROR("failed to setup DPU encoder %d: rc:%d\n",
>+			  encoder->base.id, rc);
>+		return rc;
>+	}
>+
>+	return 0;
>+}
>+
> static int _dpu_kms_initialize_writeback(struct drm_device *dev,
> 		struct msm_drm_private *priv, struct dpu_kms *dpu_kms,
> 		const u32 *wb_formats, int n_formats)
>@@ -683,6 +722,12 @@ static int _dpu_kms_setup_displays(struct drm_device *dev,
> 		return rc;
> 	}
>
>+	rc = _dpu_kms_initialize_hdmi(dev, priv, dpu_kms);
>+	if (rc) {
>+		DPU_ERROR("initialize HDMI failed, rc = %d\n", rc);
>+		return rc;
>+	}
>+
> 	/* Since WB isn't a driver check the catalog before initializing */
> 	if (dpu_kms->catalog->wb_count) {
> 		for (i = 0; i < dpu_kms->catalog->wb_count; i++) {
>-- 
>2.30.2
>
