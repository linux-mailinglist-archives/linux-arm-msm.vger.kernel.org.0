Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 01BF2675B17
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Jan 2023 18:22:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229491AbjATRWl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 20 Jan 2023 12:22:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229461AbjATRWk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 20 Jan 2023 12:22:40 -0500
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A7115FC2
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Jan 2023 09:22:39 -0800 (PST)
Received: by mail-ej1-x62f.google.com with SMTP id bk15so15639088ejb.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Jan 2023 09:22:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nlWHzYt1MKw2/OgDmezZgQ5GhftSlLYv/uJLjKuNnjE=;
        b=O/z69Ose/fTxg4AkZ3TWLYWifzXOQ9huPgQv9jBjMlQMXDvnUgDXgy0iAP4zGbMZ8R
         b9YHMO5s7hbZ0GIf6t8G//3eY7bYgRxZ1gW7lACePYd+j6YS2msS5XYZnsCurxRs1Zuy
         2cx+HW8oT56T0uwPnCwXDbwoRDtocgX5qYsZbmHGGZRyRrJUWfNwcuefihCblx5YcpyH
         rcj5PHa2DnhsbxJKW/kND6WLSqq2g+hUkeriVROWJViAl12mS9siHIML2NLBMkKAazR2
         m9eq/ok8WWPpD/I7lckLec63YTAks1mt2MPsRoFxdwqqdBNADF0MO+H+29uFok/YLR7/
         SvYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nlWHzYt1MKw2/OgDmezZgQ5GhftSlLYv/uJLjKuNnjE=;
        b=ZGjGQlvhZwGRJN6fcREcGf8YGh/drB4Ug79aOopGzEFEJeRJr2zg+IPTG1SLnN2bXP
         +i5vIG9pMID59FC6fwflungmZDXTHinE8HNNUCngdmbcJgFtF9IpaaXVSBB9uRYS8QWh
         Jb72/ZuDOOF93GpaRJWb/fbNAHNpqSR/6Ct1WoD/x5RN8KXV00yeaELmvihut7olqpkJ
         TSyvtO+qglpyiIVSNmfxZvMSgx8PE8gvIqpnr8W7odAJTLyCsIBuH/PhJgLNHVT8exKe
         ScWMTEDDiCR7D6fgeFeqIyuFk01zNtEMToUjTHmHI2LGzQ6ISlEWxeEOqPkvmxuu2rzr
         2K+w==
X-Gm-Message-State: AFqh2kotK+Yr+qvwl5n8TkqA+h4uf9O8odp/o1cJ3hP7vo2RFw9KAE+P
        S5IZZoEJ/ApvUYHAPmg4WPqSzv9Vz2e4eTzQ
X-Google-Smtp-Source: AMrXdXvA4fZxu3viSHUGe64689Ah6SzrdCvICnHPO1T/DCwu+f9I0EEM+3k/ukglLIFH0xDXHr5GvQ==
X-Received: by 2002:a17:906:2308:b0:870:709e:169d with SMTP id l8-20020a170906230800b00870709e169dmr16908459eja.35.1674235357915;
        Fri, 20 Jan 2023 09:22:37 -0800 (PST)
Received: from localhost.localdomain (abyk37.neoplus.adsl.tpnet.pl. [83.9.30.37])
        by smtp.gmail.com with ESMTPSA id s17-20020a1709060c1100b0084d21db0691sm18313857ejf.179.2023.01.20.09.22.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jan 2023 09:22:37 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH v2 0/5] SM8[12]50 GPU speedbin
Date:   Fri, 20 Jan 2023 18:22:28 +0100
Message-Id: <20230120172233.1905761-1-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.1
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

This series brings SM8[12]50 (A6[45]0) speedbin support along with a
touch-up for 8150, allowing Adreno to cooperate with the display hw.

Tested on Xperia 5 II (SM8250 Edo PDX206) and Xperia 5 (SM8150 Kumano
Bahamut).

v1 -> v2:
- Drop bindings patches (Applied by Srini)
- Remove leftover comment about missing speedbin in 8150 DTSI (Marijn)
- Collect tags

Konrad Dybcio (5):
  drm/msm/a6xx: Add support for A640 speed binning
  drm/msm/a6xx: Add support for A650 speed binning
  arm64: dts: qcom: sm8150: Don't start Adreno in headless mode
  arm64: dts: qcom: sm8150: Add GPU speedbin support
  arm64: dts: qcom: sm8250: Add GPU speedbin support

 arch/arm64/boot/dts/qcom/sm8150-hdk.dts |  5 ++++
 arch/arm64/boot/dts/qcom/sm8150-mtp.dts |  5 ++++
 arch/arm64/boot/dts/qcom/sm8150.dtsi    | 31 +++++++++++++++++--------
 arch/arm64/boot/dts/qcom/sm8250.dtsi    | 23 +++++++++++++++++-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 30 ++++++++++++++++++++++++
 5 files changed, 83 insertions(+), 11 deletions(-)

-- 
2.39.1

