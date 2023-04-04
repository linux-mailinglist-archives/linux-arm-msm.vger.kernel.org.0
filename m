Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D31806D624B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Apr 2023 15:09:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235022AbjDDNJm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 Apr 2023 09:09:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235105AbjDDNJk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 Apr 2023 09:09:40 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB8E7198A
        for <linux-arm-msm@vger.kernel.org>; Tue,  4 Apr 2023 06:09:38 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id t14so33781253ljd.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Apr 2023 06:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680613777;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mg71u/7TiS0yeZEc+ean62kiFm+Wj1LDeVN5x0ynJuQ=;
        b=waUZvSBCntuvftxrsrVSq+s6qkirXzhd1JgVDFdgzkskmeeSIc6CLCBdvSbR8fMYMI
         KNFu3YI++Gj6luwLTJiy4Yb2wD3pPX9dIvy+8ZbHRNSJIiwXnS7GdhFtpWaAdFv5rD6v
         /Hg8YxGSkbz9fUw06Anj+D1BkiRX53pV+B+fSCXj9QWdwrTJ0xeTOReR/ANEgSM+9Fmt
         lDg+svsYaxyL68/R4hTpEtwA8W080stUhbVNE0VrOwXycDQg0bWxy0Er0A/v4Aoazmn/
         5wKbB7PbK9gQXuiqo6mNQDJTZJ6qMdqyivCqXS1lKeHucb5Ga8lXoCAuVvu9nu/QmAAz
         FZog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680613777;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mg71u/7TiS0yeZEc+ean62kiFm+Wj1LDeVN5x0ynJuQ=;
        b=vIAYr3n5xZykaaNfn1Frx4UJFMTRCRaV4KzHD2wTYsxDFBepixTJIz8QYzi9I3EBK0
         AGGUVZ+NZ56pX+u21dGKCx3FVELtQuaEzdwvzWIkZQL3PFGgfpsmxvM81IzxI1NAq1Mm
         hwcUaK2bIcdAyaFSD6Gf1pCoHIRx92MzbsFQRQx4x9neBI8zFfR2GjEkI+lKAvIx6kPd
         Po5zJL5L1JtyHiuaFYhFeZfynBOTxqHpObRqFP+3uaSia3E7kUt5xsTqlJwsn2yzKGh+
         Xmw7kchRIKdedSCreB0hV85+SbyNFHqSCubhvVbH9zUvyw6FmPAjY4yCFFXS9/1Cps9Q
         Hibw==
X-Gm-Message-State: AAQBX9cxzyJ9VvfptPs3p44ljnDCqQARkc+22hFE/s79/1KSdsEmdOsF
        +3yYnv3rPEfZrl5sEqE0oK7j5A==
X-Google-Smtp-Source: AKy350ZaG9FURFchBp7M4Jb+8kCkBHL1Worr6nxNj1hYj+hGT4pxzmqgiQ+onvd8GiQ+HA+VtBG0xg==
X-Received: by 2002:a2e:90d3:0:b0:298:aa76:34db with SMTP id o19-20020a2e90d3000000b00298aa7634dbmr787595ljg.13.1680613777284;
        Tue, 04 Apr 2023 06:09:37 -0700 (PDT)
Received: from eriador.lumag.spb.ru ([193.65.47.217])
        by smtp.gmail.com with ESMTPSA id c11-20020a05651c014b00b0029e5448e752sm2304789ljd.131.2023.04.04.06.09.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 06:09:36 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH v4 40/42] drm/msm/dpu: rename MERGE_3D_foo_MASK to contain major DPU version
Date:   Tue,  4 Apr 2023 16:06:20 +0300
Message-Id: <20230404130622.509628-41-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230404130622.509628-1-dmitry.baryshkov@linaro.org>
References: <20230404130622.509628-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

To ease review and reuse rename MERGE_3D feature masks to contain base
DPU version since which this mask is used.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 96c5b94264e8..d74029f163c8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -88,7 +88,7 @@
 #define CTL_DPU_9_MASK (CTL_DPU_7_MASK | \
 			BIT(DPU_CTL_HAS_LAYER_EXT4))
 
-#define MERGE_3D_SM8150_MASK (0)
+#define MERGE_3D_DPU_5_MASK (0)
 
 #define DSPP_MSM8998_MASK BIT(DPU_DSPP_PCC) | BIT(DPU_DSPP_GC)
 
@@ -529,7 +529,7 @@ static const struct dpu_pingpong_sub_blks sc7280_pp_sblk = {
 	{\
 	.name = _name, .id = _id, \
 	.base = _base, .len = 0x100, \
-	.features = MERGE_3D_SM8150_MASK, \
+	.features = MERGE_3D_DPU_5_MASK, \
 	.sblk = NULL \
 	}
 
-- 
2.39.2

