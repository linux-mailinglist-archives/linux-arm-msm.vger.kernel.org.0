Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 569DC642D30
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Dec 2022 17:40:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232840AbiLEQj7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Dec 2022 11:39:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232926AbiLEQjX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Dec 2022 11:39:23 -0500
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C474D1A216
        for <linux-arm-msm@vger.kernel.org>; Mon,  5 Dec 2022 08:38:08 -0800 (PST)
Received: by mail-ed1-x52e.google.com with SMTP id r26so16536351edc.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Dec 2022 08:38:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FA6VZLr8EX+1LwmM9brJgk2AqL1UbJ0XsUIaiz9n7JY=;
        b=tuw0NhESTq3UZ+zy40f7o9AcmkK+r5BotJvqEeJrQPDv77id5pMwvQOHANJ2pRtiTl
         xfu6zuqe1cvA141nvEgxDsqRM6STYF64bsrkifcmQGHQfR6upjeQ2pNje7FVJr/e3bD/
         7Q8yXuYkEQkCGpUntC88RpDTIMB7KJ7F4idNK0jBre+Ez8Wn5egIntB5VRXzSDec4ICR
         xn0GB/c0+JK1b0gWuCkNWcFtQ/QTSlNO8lezjo0kRY1JbCt35Vss2vzU4viHBqOU6Ciy
         wUKYJF+T/HFTNyQQwori8EBSxhi4ogLMiDJpL5GPTOcJnuPfL2KtbCtqReGC/cMny0BV
         sPKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FA6VZLr8EX+1LwmM9brJgk2AqL1UbJ0XsUIaiz9n7JY=;
        b=p7L+6OqqswXcKuyUj8VFsEV/t6gQSQak8kW6O6o2s9df8fSyx0FAAqYM7G13leJmK7
         j+XB3eA5vSgegUeja9sSYvKKCpXm/4Lo+iZJQK8aUbFYz5pKyiKkKGBLzm85mY1kHSdI
         +3BHALdRJz/bdxRTPPTkUW1xnCoM0iisuq446TMOx6WpWoE7W+aP5vbmZUd+IicHJxRf
         14ipMRiTrWEUy8yQ1MphvWdWl3zGVoWWBfL/fjLwMOpxW3kOyp4UrCjZ4oU0rr9uxC7p
         8zY8rZ84jyL3j9kKvmdZDaobc1xlYRk5KkVCCKWn0WlG8XEbF9ooiFaHDK+52quiZt/W
         OYZA==
X-Gm-Message-State: ANoB5pmI5TVYd7edbpbPsgcTG1PYmkK1V7x9WNk0/M/tLFU1E0UO8bk/
        KztkBZVDNJc2janUQFJPEXhH2Q==
X-Google-Smtp-Source: AA0mqf4UTFIOaQqMzS0VIDvYTbzzH/oX2gTN+rgxrjAy0Q4o2IYeg3hUbwZ7Nzsbb/5KoI4Sh/LVdw==
X-Received: by 2002:aa7:d556:0:b0:45c:6467:94e2 with SMTP id u22-20020aa7d556000000b0045c646794e2mr73784880edr.295.1670258287354;
        Mon, 05 Dec 2022 08:38:07 -0800 (PST)
Received: from prec5560.localdomain (ip5f58f364.dynamic.kabel-deutschland.de. [95.88.243.100])
        by smtp.gmail.com with ESMTPSA id e21-20020a170906315500b007bed316a6d9sm6413610eje.18.2022.12.05.08.38.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Dec 2022 08:38:06 -0800 (PST)
From:   Robert Foss <robert.foss@linaro.org>
To:     robdclark@gmail.com, quic_abhinavk@quicinc.com,
        dmitry.baryshkov@linaro.org, sean@poorly.run, airlied@linux.ie,
        daniel@ffwll.ch, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, agross@kernel.org,
        bjorn.andersson@linaro.org, konrad.dybcio@somainline.org,
        quic_kalyant@quicinc.com, angelogioacchino.delregno@somainline.org,
        robert.foss@linaro.org, loic.poulain@linaro.org,
        swboyd@chromium.org, quic_vpolimer@quicinc.com, vkoul@kernel.org,
        dianders@chromium.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jonathan Marek <jonathan@marek.ca>, vinod.koul@linaro.org,
        quic_jesszhan@quicinc.com, andersson@kernel.org
Subject: [PATCH v3 05/11] drm/msm: Add support for SM8350
Date:   Mon,  5 Dec 2022 17:37:48 +0100
Message-Id: <20221205163754.221139-6-robert.foss@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221205163754.221139-1-robert.foss@linaro.org>
References: <20221205163754.221139-1-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add compatibles string, "qcom,sm8350-mdss", for the multimedia display
subsystem unit used on Qualcomm SM8350 platform.

Signed-off-by: Robert Foss <robert.foss@linaro.org>
---
 drivers/gpu/drm/msm/msm_mdss.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index a2264fb517a1..39746b972cdd 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -293,6 +293,9 @@ static int msm_mdss_enable(struct msm_mdss *msm_mdss)
 		/* UBWC_2_0 */
 		msm_mdss_setup_ubwc_dec_20(msm_mdss, 0x1e);
 		break;
+	case DPU_HW_VER_700:
+		msm_mdss_setup_ubwc_dec_40(msm_mdss, UBWC_4_0, 6, 1, 1, 1);
+		break;
 	case DPU_HW_VER_720:
 		msm_mdss_setup_ubwc_dec_40(msm_mdss, UBWC_3_0, 6, 1, 1, 1);
 		break;
@@ -530,6 +533,7 @@ static const struct of_device_id mdss_dt_match[] = {
 	{ .compatible = "qcom,sc8180x-mdss" },
 	{ .compatible = "qcom,sm8150-mdss" },
 	{ .compatible = "qcom,sm8250-mdss" },
+	{ .compatible = "qcom,sm8350-mdss" },
 	{ .compatible = "qcom,sm8450-mdss" },
 	{}
 };
-- 
2.34.1

