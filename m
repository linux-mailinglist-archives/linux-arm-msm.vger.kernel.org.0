Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 90514656BEF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Dec 2022 15:36:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231751AbiL0Ofm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Dec 2022 09:35:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232140AbiL0OfZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Dec 2022 09:35:25 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D73E0BF61
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Dec 2022 06:35:14 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id z26so19846552lfu.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Dec 2022 06:35:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dtcsotDn15TPTkFly8n95bUSK+EHyjdF6zxrKEvkF+A=;
        b=cJ6ktIhanhnQQuskUX/4b3r+ZzyyazoGhkGvCIWOpRGFRQh+SM5o/rp+mpmU49Wy7+
         6u8KGyNEsTG/p1By7QGTIpmLjWNx5zky/8nTDMhLt2+iy5aKJ//3QhQKknBzM/aZqMyC
         39QrU2TFro3S6lBE2G2DlzVtqdeVFEhDmMTsnLEsa9Bu4XdOSNvQaTt9gjAcM6P2KZmf
         uXFJCagktoBGohIFqndsaqMcFydLOh+4PFm9P3ZFoKPrcZaYl8AZoJ0Y8hepxFzH+7Hv
         21E+JhnDLpXc4l6ly7f2aCdB+4Zkb3/qoOmN08mdItoxIKkcjAR3arAWpdPi0aqxMh3Y
         icKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dtcsotDn15TPTkFly8n95bUSK+EHyjdF6zxrKEvkF+A=;
        b=Y+KL3loIlPHxyfyt/F98STn5+Mqap90QwHz1ohauljl6rK44vxfwk0YBMdjPdmbqsy
         7k7BCI4H+oON/2XbpjGD7g++6EodOJ9+mqZ8S3zw+0qiWBKzJsUi2xirNn7Tn+UuCo0S
         KPq4YCdi451W/gvzUdJEMLUx5YL/nxTKUUGUUNiC9+1FBaIAJwEhM7/XVK0PIypfGMxf
         0To/RqEhGB1oGP5sruLJAhGeZ68FICU4be3mR6CxjDZIY3HHycwL1op+E5+d59gHIyNW
         nn4+wZe2/udpPeIcW+8aQvXRFTpOxCtzgLKmByBdyhTl39Dzul8sVvzMkLsy7lahMUNB
         oGLg==
X-Gm-Message-State: AFqh2ko8lt1VvS+4HkLfriSRKNdvPcuF5ChaUuyQD26c4M/O6SeZdETn
        /5s+W5Zv2qdaBp5dz9M31yur0Q==
X-Google-Smtp-Source: AMrXdXuvld5/xbXQGLb+wU76UBWoZji/R/V7d0PC62MJJiUSsWttGYN1Xw7w41Rp5vRAAFSeE9LofA==
X-Received: by 2002:a05:6512:b27:b0:4b6:eaed:f18f with SMTP id w39-20020a0565120b2700b004b6eaedf18fmr6727397lfu.38.1672151713200;
        Tue, 27 Dec 2022 06:35:13 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id m2-20020ac24242000000b0048b0696d0b1sm2276372lfl.90.2022.12.27.06.35.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Dec 2022 06:35:12 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] media: venus: drop unused opp_table field documentation
Date:   Tue, 27 Dec 2022 15:35:09 +0100
Message-Id: <20221227143509.77812-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
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

The struct venus_format does not have a "opp_table" field.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/media/platform/qcom/venus/core.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index 32551c2602a9..6c4d483d98d2 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -107,7 +107,6 @@ struct venus_format {
  * @vcodec1_clks: an array of vcodec1 struct clk pointers
  * @video_path: an interconnect handle to video to/from memory path
  * @cpucfg_path: an interconnect handle to cpu configuration path
- * @opp_table: an device OPP table handle
  * @has_opp_table: does OPP table exist
  * @pmdomains:	an array of pmdomains struct device pointers
  * @opp_dl_venus: an device-link for device OPP
-- 
2.34.1

