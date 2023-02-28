Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 193F56A5859
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Feb 2023 12:34:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229530AbjB1Leb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Feb 2023 06:34:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231707AbjB1LeT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Feb 2023 06:34:19 -0500
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E01D4301B0
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Feb 2023 03:33:52 -0800 (PST)
Received: by mail-lj1-x232.google.com with SMTP id z5so9832836ljc.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Feb 2023 03:33:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3KT0tm55CwQeOvkwkTgHaHdetIJWdI80ap2cZuEVveQ=;
        b=pxQzOQYqoubvaY1rgPRL1RCPsKkw9rxetkLZruGPkUW3R095txRMHRn6ygybhRypAs
         582ggnL0QO9aTIq2kQ27s5+2bhll7Q0F7DI0bsCCZGAruou5sFE6VnPsnLPFSoBO3jM1
         EcOsh8ovP8uPOyzlpKbVqARN43mtwIEph3YwjQYc7TzCTjvCJMEwreLsGpLbYLJwfump
         sQa4WPEYyMfYA1oIUbDPImCWt+VL5WaryBnA/W57lKvolqAX1lxgOZ3JITyWuHHCzqtn
         YFvSpbo+yqIQm9J2jBlEvyVY29ew2F77Th9bkd1kiDnbz//7sYstMPPnMOz35S604VMt
         vrqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3KT0tm55CwQeOvkwkTgHaHdetIJWdI80ap2cZuEVveQ=;
        b=VmTEZ5FxuFyABMQKC2gyHEIz5Kxp64Mz/aXKR02PH0QmzuVV2V7ROHTFw5fyeQYBy8
         cDNpktLEbSXUqBoJ+161tLArMzVqhzI8TtyQ8HyHmGw6kqvZnsFTyBhrRhVg7zrftiGu
         8WAGAd0cxAShE7jVjsVA0g5bzKkQwyPdJMxbJaC9IoE2luqpCSm0Rhh8V+aqIZVqI5GH
         qxuNI/u93wAj7od6SZTRpw4jodLAE83Ks4U6ICo1CkhjR02rT+gNpOab9MZVbtSUbQsG
         3km+XBJNFt+FuKdpPC9HLWG3suOf771A4StOscc89AEjuPkJQEq+qxwoPrgl/i0ufcca
         nEPA==
X-Gm-Message-State: AO0yUKXE/eMDL+LuclmhI7nWe04kfkfqEC/vlNxRU2Sf+3ldZbFxXNDo
        H1iGLySg3Z236OvNmu0O+REljg==
X-Google-Smtp-Source: AK7set8xqbIYixOWd1TQi0fzyAnnbCTOke9cBftS9p7O50nfXzoQCT37kMnV+/7pvB64kS/PcJHTig==
X-Received: by 2002:a2e:2c05:0:b0:295:9a9f:3f55 with SMTP id s5-20020a2e2c05000000b002959a9f3f55mr828883ljs.0.1677584031116;
        Tue, 28 Feb 2023 03:33:51 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id h20-20020ac25974000000b004dd0bbc89a1sm1288472lfp.244.2023.02.28.03.33.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Feb 2023 03:33:50 -0800 (PST)
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
Subject: [PATCH 09/10] drm/display/dsc: add helper to set semi-const parameters
Date:   Tue, 28 Feb 2023 13:33:41 +0200
Message-Id: <20230228113342.2051425-10-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230228113342.2051425-1-dmitry.baryshkov@linaro.org>
References: <20230228113342.2051425-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
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
index d11ee8f1efa7..7de1d84f5bc7 100644
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
 const u16 drm_dsc_rc_buf_thresh[] = {
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

