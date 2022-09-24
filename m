Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9A7785E8C36
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 Sep 2022 14:19:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233751AbiIXMTJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 24 Sep 2022 08:19:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233820AbiIXMTF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 24 Sep 2022 08:19:05 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0783CD07B6
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Sep 2022 05:19:04 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id q17so2707649lji.11
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Sep 2022 05:19:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=wD3ZI06u4uCsqVEUfwh957mdvUPp6OmvWbWypMR79T8=;
        b=nBK+COj+qWJOJr1vEWAq+PPZHyzDP7XVnSdgqieDOO8CI/VStgLHD8bmqQIJfm1bta
         JUkAMWVV7E8deEZR/5vohz7L7QBhWwdyZEP7aHo0wKEShQDPuWfO1uL8DyXvq7yFSoob
         NydCexnqlGYKcYrfhHiQk0B9BuW3xqJlSBGypzzdy17kZKwf2kCoBVSZReK4wowS2sRP
         IgjX+TvJIlmCXjayZWe35NqtFMHrDbqVEPWRarFFew+MrI3g8WKXwHvncJ/eKoz599Jd
         ZJWhiaUVAHWO2EoXngRkGog7CR04r+MuUry3BjHv6WHHQLKtelA3H0qtn67UHotCQn5j
         X5qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=wD3ZI06u4uCsqVEUfwh957mdvUPp6OmvWbWypMR79T8=;
        b=Ima0zv0bebARbI5tSc13nrS1MPJ985DP1c9zZMAwZvRzp/VrpodCjaGr2obZqL7ryF
         kfvDnSmHBmk0E+yaV/XcvplQXZNKNbIwGzG0+2Rw5dmbpe6ivnVdiTbYPXrbPnmVoe0a
         xMvMoPLqPOEeWZaPbcsqcbEsdYfUS1GANiPEi3vIMEBmndI35cffdgqU7fGPPV8AmSdP
         d6z+3hD27v3jgqM8DuoPL749vM/8DnqBM+O5mrkTCrtcPyAerWP1erZrqB9EIlnvnIGo
         /u1ujwC2BNMsEWH+BRlGFhVdv4nV22Jx1eH81Ztxu9L3e5MT/myCkxKzHRbTr/J7owbg
         FGkw==
X-Gm-Message-State: ACrzQf1gQ0DMcK/UV/U1ixmJJ+VWbN5phT7FZ+dwXxdFWFAUeAN36ltQ
        DjAbsvfdwj9C/toC/2gwNH3ydw==
X-Google-Smtp-Source: AMsMyM4e34UZotqqQpuUajQ6KhUnIaVDH3NbpeLeHKBsw2Xz7QmrnNeD63hJ98FQOiIMtktXyORJ4A==
X-Received: by 2002:a2e:8917:0:b0:26a:a520:db52 with SMTP id d23-20020a2e8917000000b0026aa520db52mr4288881lji.289.1664021942396;
        Sat, 24 Sep 2022 05:19:02 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id v12-20020a19740c000000b00497a2815d8dsm1870113lfe.195.2022.09.24.05.19.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Sep 2022 05:19:02 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH v3 1/2] dt-bindings: display/msm: Add QCM2290 DSI phy
Date:   Sat, 24 Sep 2022 15:18:59 +0300
Message-Id: <20220924121900.222711-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220924121900.222711-1-dmitry.baryshkov@linaro.org>
References: <20220924121900.222711-1-dmitry.baryshkov@linaro.org>
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

From: Loic Poulain <loic.poulain@linaro.org>

QCM2290 platform uses the 14nm DSI PHY driver.

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml
index bc3d0b4063c7..054d8f65d9fa 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml
@@ -15,6 +15,7 @@ properties:
   compatible:
     enum:
       - qcom,dsi-phy-14nm
+      - qcom,dsi-phy-14nm-2290
       - qcom,dsi-phy-14nm-660
       - qcom,dsi-phy-14nm-8953
 
-- 
2.35.1

