Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EF9526599DE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Dec 2022 16:36:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235183AbiL3Pga (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Dec 2022 10:36:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235225AbiL3PgO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Dec 2022 10:36:14 -0500
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 218811BEA0
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Dec 2022 07:36:10 -0800 (PST)
Received: by mail-wm1-x334.google.com with SMTP id o15so15373832wmr.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Dec 2022 07:36:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UpPq5JazF5WYQ6jpgXZutDJ6jwFO4iP9SJS7CYk0/y0=;
        b=IpFvRCH7jQ1qWrmgFoWu0b+b6MW5eXC/n7lDMp/rPVGRmWg3wAK2lnV3sL5GxEOPCb
         JmDCzs9hTA+VhH7QPw83kZltUJ3ltSFX0hHH0dPvSLA4M0RS74+M5e8Jt9meIOwwlnvL
         A18R45EQaEgYRyrMzV9cpu+Me2+SFgsV44YQ2OiezuBuyKvejcGg1+krBsJFYO6Y1qFS
         aqO5jfjWy62uWPRBTvoqRLmScF42JSVukLt9hEHb54Bak8o5knX4vxTlDNnUDGNB52nM
         Uuipi/07BFVK05Qv7GJAMgiOwevHD81cCb5QLmq1P0L+9mmQ1pKUu4iUMnGUku5iCYZw
         4AhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UpPq5JazF5WYQ6jpgXZutDJ6jwFO4iP9SJS7CYk0/y0=;
        b=EfPC8D3wlX0YWpYjWt/OY/1btPHdlMt4tUIs1iOVt119KTLl42bu7BZ31mEqKbR96N
         IAOaUYxCOCn01R5mbE1tOX9nV7uDeKxZtT4QE935WGPpfcoOIsCnm79lNWQNkcF9XMNc
         +OdhdO8YgyYOQ1S2PfUsOlSoO/381PBdNgt8EVIzak0loUu8R/tbJLyXrN9fKkKKxMhS
         MfNnFllgqxvDTTLprRPIW0Eyu5upX6R33vpd6lGcavAasHr6nFiGwrJBnbR2b3P2EWCG
         iJd9DWLkl7Dx1hBefFwI97qcDtpKvMn6fXf142F5iA0qBAhfe8S0wa2wVJ3fClVEzE91
         FVqw==
X-Gm-Message-State: AFqh2kqd4dXHk/qUwnsLaw4BQbFZEbEcNZC9JofN/xLqOnTw+dE1fFs7
        YvhDJz16o2gpJwbIjM+RCUZydw==
X-Google-Smtp-Source: AMrXdXtLrKFZgNnLmucO73CgP/R0EgJOux6fVGeOspso4zpdgP2Pp5PGqIWUTqEVkYr5vhE+FKsERQ==
X-Received: by 2002:a05:600c:295:b0:3d2:259f:9061 with SMTP id 21-20020a05600c029500b003d2259f9061mr28475797wmk.34.1672414568688;
        Fri, 30 Dec 2022 07:36:08 -0800 (PST)
Received: from prec5560.. (freifunk-gw.bsa1-cpe1.syseleven.net. [176.74.57.43])
        by smtp.gmail.com with ESMTPSA id l42-20020a05600c1d2a00b003cfbbd54178sm49857993wms.2.2022.12.30.07.36.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Dec 2022 07:36:08 -0800 (PST)
From:   Robert Foss <robert.foss@linaro.org>
To:     robdclark@gmail.com, quic_abhinavk@quicinc.com,
        dmitry.baryshkov@linaro.org, sean@poorly.run, airlied@gmail.com,
        daniel@ffwll.ch, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@somainline.org,
        quic_jesszhan@quicinc.com, robert.foss@linaro.org,
        angelogioacchino.delregno@somainline.org, loic.poulain@linaro.org,
        vkoul@kernel.org, a39.skl@gmail.com, quic_khsieh@quicinc.com,
        quic_vpolimer@quicinc.com, swboyd@chromium.org,
        dianders@chromium.org, liushixin2@huawei.com,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jonathan Marek <jonathan@marek.ca>,
        vinod.koul@linaro.org
Subject: [PATCH v4 04/11] drm/msm/dpu: Add support for SM8350
Date:   Fri, 30 Dec 2022 16:35:47 +0100
Message-Id: <20221230153554.105856-5-robert.foss@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221230153554.105856-1-robert.foss@linaro.org>
References: <20221230153554.105856-1-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add compatibles string, "qcom,sm8350-dpu", for the display processing unit
used on Qualcomm SM8350 platform.

Signed-off-by: Robert Foss <robert.foss@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 987a74fb7fad..165958d47ec6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1302,6 +1302,7 @@ static const struct of_device_id dpu_dt_match[] = {
 	{ .compatible = "qcom,sm6115-dpu", },
 	{ .compatible = "qcom,sm8150-dpu", },
 	{ .compatible = "qcom,sm8250-dpu", },
+	{ .compatible = "qcom,sm8350-dpu", },
 	{}
 };
 MODULE_DEVICE_TABLE(of, dpu_dt_match);
-- 
2.34.1

