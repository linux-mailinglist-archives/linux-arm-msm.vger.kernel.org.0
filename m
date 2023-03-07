Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E517C6AE14F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Mar 2023 14:50:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229794AbjCGNu5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Mar 2023 08:50:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229699AbjCGNuW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Mar 2023 08:50:22 -0500
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9834F21978
        for <linux-arm-msm@vger.kernel.org>; Tue,  7 Mar 2023 05:49:24 -0800 (PST)
Received: by mail-lj1-x22a.google.com with SMTP id b13so13203851ljf.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Mar 2023 05:49:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678196949;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C00WLLY6BRHuPhABrtxiqlYfBItYgfyJkU1QDvQQHNw=;
        b=VHzD5vFnu+2CSJV5nEv//ilP2CdFYhxruRgksVjxiHK4kwk+a45GY96Cis9LfF+GKB
         Fl0tqfb27xICa4MjqL0S9rHS12x9e+LTXzEiAXaSMU3waaHQKSv9IcCR5/VZepgdmpKE
         vp/02ugMrHJXwqMeJ1cfT743PVHIGcS0eMC3yQ4/8+c1aHb3tCxf71bFeRw0XrRp1QFB
         ra7huasdY547XWi9CrTeg7GDnhR/LuYSq65FXAHHMiffmp3qIs+rGMhwLrdn0nquyb6Y
         j+oLMmTjcW0cZRv+bLKKXUyScpkNPHhANsMERMNnxFf+5ynE5KFhjimpu5ItdL02UnMP
         FUzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678196949;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C00WLLY6BRHuPhABrtxiqlYfBItYgfyJkU1QDvQQHNw=;
        b=YF5xkKwtk2ueQvKvBx/+MAG9X2oSmPPlZSisCyyBGgt2kzNMZstYLtZtNCCcOzoCqZ
         iOADuapRF6kGZkTKWz5rGk3V+8IHowvxBomVNaEZ+r9Ia7KGgzlrp8HcVfhaRc8lUY/D
         kM/OdMmSzHBzi4DEX0b34JZ3qwQ9ukASa1KlP483aVq/RWYdWm8tOwhA85lb9CKlARjg
         XGdQcUn9nMFaeN2UP17QfmNpET8cNPRQMAcJzSxvn5ymMvAWXt9zUORkMMXxd4QmgSnb
         EqUHxqpVjNk/hr+Nq+t9OaDpfyThLzbl8b9sjcgc9xLhbeYuPzP0oNduJyLn1f4O5Tzt
         vBtg==
X-Gm-Message-State: AO0yUKV9xEOAP7ScotbK2Dip4PLPdzQEqOT5Jb/uWt932AlNcbi6tTO+
        whQZimp52Ozv3IHQvM3tvrYy0w==
X-Google-Smtp-Source: AK7set++M3LP4rz1Yp/02PuUkSXvXgd0Jc1fytshpLpA1bLmvxjDnEsaMcBCABEBruvrkj6FgfXhfg==
X-Received: by 2002:a2e:910d:0:b0:295:c39c:d8ab with SMTP id m13-20020a2e910d000000b00295c39cd8abmr4015759ljg.39.1678196949419;
        Tue, 07 Mar 2023 05:49:09 -0800 (PST)
Received: from eriador.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id u14-20020a2e91ce000000b0029597ebacd0sm2128991ljg.64.2023.03.07.05.49.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 05:49:09 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc:     =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= 
        <ville.syrjala@linux.intel.com>, dri-devel@lists.freedesktop.org,
        intel-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v2 09/10] drm/display/dsc: add helper to set semi-const parameters
Date:   Tue,  7 Mar 2023 15:49:00 +0200
Message-Id: <20230307134901.322560-10-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230307134901.322560-1-dmitry.baryshkov@linaro.org>
References: <20230307134901.322560-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add a helper setting config values which are typically constant across
operating modes (table E-4 of the standard) and mux_word_size (which is
a const according to 3.5.2).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/display/drm_dsc_helper.c | 21 +++++++++++++++++++++
 include/drm/display/drm_dsc_helper.h     |  1 +
 2 files changed, 22 insertions(+)

diff --git a/drivers/gpu/drm/display/drm_dsc_helper.c b/drivers/gpu/drm/display/drm_dsc_helper.c
index 65e810a54257..10ba413d8bf1 100644
--- a/drivers/gpu/drm/display/drm_dsc_helper.c
+++ b/drivers/gpu/drm/display/drm_dsc_helper.c
@@ -270,6 +270,27 @@ void drm_dsc_pps_payload_pack(struct drm_dsc_picture_parameter_set *pps_payload,
 }
 EXPORT_SYMBOL(drm_dsc_pps_payload_pack);
 
+/**
+ * drm_dsc_set_const_params() - Set DSC parameters considered typically
+ * constant across operation modes
+ *
+ * @vdsc_cfg:
+ * DSC Configuration data partially filled by driver
+ */
+void drm_dsc_set_const_params(struct drm_dsc_config *vdsc_cfg)
+{
+	vdsc_cfg->rc_model_size = DSC_RC_MODEL_SIZE_CONST;
+	vdsc_cfg->rc_edge_factor = DSC_RC_EDGE_FACTOR_CONST;
+	vdsc_cfg->rc_tgt_offset_high = DSC_RC_TGT_OFFSET_HI_CONST;
+	vdsc_cfg->rc_tgt_offset_low = DSC_RC_TGT_OFFSET_LO_CONST;
+
+	if (vdsc_cfg->bits_per_component <= 10)
+		vdsc_cfg->mux_word_size = DSC_MUX_WORD_SIZE_8_10_BPC;
+	else
+		vdsc_cfg->mux_word_size = DSC_MUX_WORD_SIZE_12_BPC;
+}
+EXPORT_SYMBOL(drm_dsc_set_const_params);
+
 /* From DSC_v1.11 spec, rc_parameter_Set syntax element typically constant */
 static const u16 drm_dsc_rc_buf_thresh[] = {
 	896, 1792, 2688, 3584, 4480, 5376, 6272, 6720, 7168, 7616,
diff --git a/include/drm/display/drm_dsc_helper.h b/include/drm/display/drm_dsc_helper.h
index 0bb0c3afd740..4448c482b092 100644
--- a/include/drm/display/drm_dsc_helper.h
+++ b/include/drm/display/drm_dsc_helper.h
@@ -21,6 +21,7 @@ void drm_dsc_dp_pps_header_init(struct dp_sdp_header *pps_header);
 int drm_dsc_dp_rc_buffer_size(u8 rc_buffer_block_size, u8 rc_buffer_size);
 void drm_dsc_pps_payload_pack(struct drm_dsc_picture_parameter_set *pps_sdp,
 			      const struct drm_dsc_config *dsc_cfg);
+void drm_dsc_set_const_params(struct drm_dsc_config *vdsc_cfg);
 void drm_dsc_set_rc_buf_thresh(struct drm_dsc_config *vdsc_cfg);
 int drm_dsc_setup_rc_params(struct drm_dsc_config *vdsc_cfg, enum drm_dsc_params_kind kind);
 int drm_dsc_compute_rc_parameters(struct drm_dsc_config *vdsc_cfg);
-- 
2.39.2

