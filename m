Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DDAD16622E1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jan 2023 11:17:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236945AbjAIKQx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Jan 2023 05:16:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236934AbjAIKPw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Jan 2023 05:15:52 -0500
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1CBE186A2
        for <linux-arm-msm@vger.kernel.org>; Mon,  9 Jan 2023 02:15:25 -0800 (PST)
Received: by mail-wm1-x335.google.com with SMTP id m26-20020a05600c3b1a00b003d9811fcaafso6219676wms.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Jan 2023 02:15:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rC1HixjrwVN9Qc0qid0oTivyKuzDUPdxp8z39RQ72Wo=;
        b=hrmmo8SfG3rmXaOE36H7v1YZqukMDa8MI8vpJRCx1CnZUlDPVo4sgTKsZe1EhicxGD
         Z7j3yv3t4IwRwCg0bPqLbt6upC4ABF6iKrwi+JCLHHa8GbiszajKnYfB9HrG6RKq9aXu
         rtVmJ/dFAKn6rp2DYq0toXAi01/YKxFGPs3WaVoSjq42zDs6FHcS1TbW/L4jN4lKB7/t
         lQBG6pawRi49WYYRWKs0yfLFWRMK7D2XSuYhWHkPU64igHOINl1a51eELIICdiX+HK5g
         2yapJv5ar9Jusxmy9ObnGiIbh9enqvpkD3xvOgnsA8XpFyBhHvtAjACkUDQNRds+F2kz
         Px8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rC1HixjrwVN9Qc0qid0oTivyKuzDUPdxp8z39RQ72Wo=;
        b=d9SGLGNbwPY+GxRzuec9/jMCJ6dQKg+1MHmGBOfSJP71hbt+RZaEt/piCqGj9+h/+C
         aojIrCYDTMPSv75SBPAWu7O33Sg8gqq3SkWRh9+Ek5siYIhCdLBFcL8UPjYg/lalfjf+
         l8urxJ2JJhJnZ5QWGnE7MXQmqTZ61s9rctFeEvzmNHSA/lMzxIM6SQ3PrDBAlSQHcM3T
         0ysycjb5+Peaf+VvPEnpm/k3sHYrLeepnXkMDM0Zxg6ow+XFONV/605m/TP0S8B+UtZ9
         TcvNCs8z8NhTAzYJdRFGAHycnhZpeEDiSAnrVyapSj9Jh3dNVQswFRGCg7Hm7ivDmk3O
         gr9A==
X-Gm-Message-State: AFqh2koox0KOdV18RTwKjFeD6sbzvpauTjzvlP6RP6c1RvkCe/OIKaUi
        rE9MBwIrvw/p7skc8B1CcmVzEg==
X-Google-Smtp-Source: AMrXdXvN9kPFfEkhuEuShiZhptcP7yVgJq6IbPS8mOT9HkvcQPU81vvmcJtpG//3N6IhBs5RiJbKnw==
X-Received: by 2002:a05:600c:1c90:b0:3cf:75a8:ecf4 with SMTP id k16-20020a05600c1c9000b003cf75a8ecf4mr46102577wms.24.1673259325399;
        Mon, 09 Jan 2023 02:15:25 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id h10-20020a05600c2caa00b003cfd58409desm15815376wmc.13.2023.01.09.02.15.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jan 2023 02:15:25 -0800 (PST)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Mon, 09 Jan 2023 11:15:21 +0100
Subject: [PATCH v3 5/7] drm/msm: mdss: add support for SM8550
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230103-topic-sm8550-upstream-mdss-dsi-v3-5-660c3bcb127f@linaro.org>
References: <20230103-topic-sm8550-upstream-mdss-dsi-v3-0-660c3bcb127f@linaro.org>
In-Reply-To: <20230103-topic-sm8550-upstream-mdss-dsi-v3-0-660c3bcb127f@linaro.org>
To:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jonathan Marek <jonathan@marek.ca>
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.11.1
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support for the MDSS block on SM8550 platform.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_mdss.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index f9ef5085041d..02646e4bb4cd 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -297,6 +297,7 @@ static int msm_mdss_enable(struct msm_mdss *msm_mdss)
 		msm_mdss_setup_ubwc_dec_40(msm_mdss, UBWC_4_0, 6, 1, 2, 1);
 		break;
 	case DPU_HW_VER_810:
+	case DPU_HW_VER_900:
 		/* TODO: highest_bank_bit = 2 for LP_DDR4 */
 		msm_mdss_setup_ubwc_dec_40(msm_mdss, UBWC_4_0, 6, 1, 3, 1);
 		break;
@@ -532,6 +533,7 @@ static const struct of_device_id mdss_dt_match[] = {
 	{ .compatible = "qcom,sm8250-mdss" },
 	{ .compatible = "qcom,sm8350-mdss" },
 	{ .compatible = "qcom,sm8450-mdss" },
+	{ .compatible = "qcom,sm8550-mdss" },
 	{}
 };
 MODULE_DEVICE_TABLE(of, mdss_dt_match);

-- 
2.34.1
