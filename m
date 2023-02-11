Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D675969351B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Feb 2023 00:14:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229629AbjBKXOT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 11 Feb 2023 18:14:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229493AbjBKXOS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 11 Feb 2023 18:14:18 -0500
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53178126F7
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Feb 2023 15:14:17 -0800 (PST)
Received: by mail-ej1-x62f.google.com with SMTP id sb24so212ejb.8
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Feb 2023 15:14:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mA0wapugSIYwzJjh8QQpFZojK1Cf6nHUnMysknsiTI0=;
        b=u84Xb8jNF5JMSsHyPt8MkUuDdTr2c4CP4algLWN19zIEqrB1q0+zvL6YaCdjsFlDCd
         UoJPxb6Qd/iqJ8Gt48+YDkk5WPzTsZ2prf8xpLaO6OorKzxjRYknWfLQuE6KeW8i65Bs
         VftDo/d4mfadIwNCHMa0FSDclmcbN3ogWfM2tfczf8flwJIRfZcazOir1vMBzvvPgiPF
         LylJIDVd2ZDIlAmkq65TnGm/pKk/tk6drqkx9WrbZZKSTruTJoU9Iodhj2P5uPZoZDmW
         brtKKneU+DSmCHMSktm2c/yUJB/Ef9qLToTQJoC7Of6LhmcBBz81UF3npd+pbM5oFjK/
         QvUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mA0wapugSIYwzJjh8QQpFZojK1Cf6nHUnMysknsiTI0=;
        b=FW+xQXboZlbedWmirH3FjSG+Kwk1ZlUumdC9fQQ99KhEVm2fCHuBd37sWnJBLGsP+/
         rVyu6T5EMBucRmtRiyg2Jxkw4oqpEWo+sPZIubfeSmdQuNWpNy/WDQ0mqKw7xHHcAMMD
         e8A4BuenZ6Mmc9vdYnngaAwKVi5FNeAAnnVSPCqeL+WO5WlHqqkKntgklabDu6y9I06H
         9FwpplK6JAToMffridFb9NJoteGxNLsrKd01Nw0l/5h5O97UZ6V2qoG0wXVJ/WR8s22l
         bIVnTua/eK+3lL3OHRdfu491sQOYUOJguHA7v4p3fV9YPlnGctID0uQRDdnqUIcK9swP
         G1ow==
X-Gm-Message-State: AO0yUKXw/rrRSLosCg7IehSWH0xoit5Dd/JHRI5cZ//ZUEiEgLPNbcIZ
        c4PSfGNZU+ZikOWUmkVSBhBYcA==
X-Google-Smtp-Source: AK7set/3wadk7OzNoC9pIppF6oVoYWkP4Mlv4UbuwYA9P375LIa7pocOp1Gb7v8509k7wWyOIFz0Zw==
X-Received: by 2002:a17:906:4bd0:b0:882:cdd4:14d9 with SMTP id x16-20020a1709064bd000b00882cdd414d9mr17524049ejv.46.1676157240433;
        Sat, 11 Feb 2023 15:14:00 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id k20-20020a1709061c1400b00871390a3b74sm4517149ejg.177.2023.02.11.15.13.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Feb 2023 15:13:59 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v2 50/50] drm/msm/dpu: rename MERGE_3D_foo_MASK to contain major DPU version
Date:   Sun, 12 Feb 2023 01:12:59 +0200
Message-Id: <20230211231259.1308718-51-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230211231259.1308718-1-dmitry.baryshkov@linaro.org>
References: <20230211231259.1308718-1-dmitry.baryshkov@linaro.org>
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

To ease review and reuse rename MERGE_3D feature masks to contain base
DPU version since which this mask is used.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index b8143a3c35b0..6f907992866b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -70,7 +70,7 @@
 #define CTL_DPU_9_MASK \
 	(CTL_DPU_7_MASK | BIT(DPU_CTL_HAS_LAYER_EXT4))
 
-#define MERGE_3D_SM8150_MASK (0)
+#define MERGE_3D_DPU_5_MASK (0)
 
 #define DSPP_MSM8998_MASK BIT(DPU_DSPP_PCC) | BIT(DPU_DSPP_GC)
 
@@ -507,7 +507,7 @@ static const struct dpu_pingpong_sub_blks sc7280_pp_sblk = {
 	{\
 	.name = _name, .id = _id, \
 	.base = _base, .len = 0x100, \
-	.features = MERGE_3D_SM8150_MASK, \
+	.features = MERGE_3D_DPU_5_MASK, \
 	.sblk = NULL \
 	}
 
-- 
2.39.1

