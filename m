Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0FEDC7AE278
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Sep 2023 01:38:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233538AbjIYXhR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 Sep 2023 19:37:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233506AbjIYXhP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 Sep 2023 19:37:15 -0400
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com [IPv6:2607:f8b0:4864:20::1130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14FEB10A;
        Mon, 25 Sep 2023 16:37:09 -0700 (PDT)
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-59c0a7d54bdso90997047b3.1;
        Mon, 25 Sep 2023 16:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695685028; x=1696289828; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pO+UQ2PR4pSsRWkZZJzU+DVCcFUEkJviRU5QoEIQKsg=;
        b=JmMH+evvpxeyt514VIN3j4hLSl+M1t20nJpr5CBTS9BjavmKiFMOZ7NeZrAQYMsFvi
         ZZEkXPrsocZkG3WStb1hFPYT5FufTHLNBO6kwuJxiCx2WkF9CZ+pl00lVUs4/3S+Ezqd
         GCZ9KH/ePXYUWQQrPSampHUV+bIYHpuTX7s6ZtXIjNKxqjg5TP7trKjtYBg5c4EfTIBX
         fJaWw5Wjr5thNBjBbJdW6PcDv2qKPJze3OjqIjtyBYN6X5pnkUXEaybcpQY23WX9k15k
         MowzZSvorQj1WKZMXNzXYtYlZnv9d64BiqZ5V3k12K6dfuZwUCunFaa0Qvt41m8m9D+L
         b7og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695685028; x=1696289828;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pO+UQ2PR4pSsRWkZZJzU+DVCcFUEkJviRU5QoEIQKsg=;
        b=PD3pIIAvzKNWODqLydW4CbXHFAf19aZMHBd91XCvgy8l4u08MWNvscfGYdUERPCEhe
         D8+oNtj9MU1UilfGYPXehhfs96uaqXYc3biiL6yMy493AbhhpP3SyU0wsYl04z8GYJTu
         WfpNIXgurbXOLk2tkMTBpodSHqEPi8nL0AsvKYd7/IeMVuXepVZXFox+RI+dYP4EvdrV
         wwvm/cPbXpS9gawS/ZAGecqHqwqZJAr6xJKLohoKikWOLOlIe+jzAdTnijmnPZdJCPYM
         yA3mML+MF6fbDF8/pcmCYSpl0r7IQq77RAAdQwexLlJZfEIHq0alf4w7Z5EQhnBAavPz
         TDZA==
X-Gm-Message-State: AOJu0YxziRYvuFp2t8NSD1mI2zSkxWX0GrH4NrZx+jqv/FO85mgnRXuT
        hGnV8KrTVOYjrAKTWUPDx2xxlK+JIaM=
X-Google-Smtp-Source: AGHT+IGdfB9/Itdlndou96XYj1kYBSq6VKY4Er4/bmLpKTKHRCPY7CzLkDERgE067vfHt+163GGV8A==
X-Received: by 2002:a05:690c:f02:b0:5a0:5c65:1d3d with SMTP id dc2-20020a05690c0f0200b005a05c651d3dmr4097214ywb.19.1695685028220;
        Mon, 25 Sep 2023 16:37:08 -0700 (PDT)
Received: from localhost ([2607:fea8:529e:7800::efbe])
        by smtp.gmail.com with ESMTPSA id eh15-20020a05690c298f00b005773afca47bsm914236ywb.27.2023.09.25.16.37.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Sep 2023 16:37:07 -0700 (PDT)
From:   Richard Acayan <mailingradian@gmail.com>
To:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Vinod Polimera <quic_vpolimer@quicinc.com>,
        Ryan McCann <quic_rmccann@quicinc.com>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        Liu Shixin <liushixin2@huawei.com>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Cc:     Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH 1/6] dt-bindings: display/msm: dsi-controller-main: add SDM670 compatible
Date:   Mon, 25 Sep 2023 19:26:28 -0400
Message-ID: <20230925232625.846666-10-mailingradian@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230925232625.846666-9-mailingradian@gmail.com>
References: <20230925232625.846666-9-mailingradian@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The SDM670 has DSI ports. Add the compatible for the controller.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 .../devicetree/bindings/display/msm/dsi-controller-main.yaml     | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index c6dbab65d5f7..887c7dcaf438 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -25,6 +25,7 @@ properties:
               - qcom,sc7180-dsi-ctrl
               - qcom,sc7280-dsi-ctrl
               - qcom,sdm660-dsi-ctrl
+              - qcom,sdm670-dsi-ctrl
               - qcom,sdm845-dsi-ctrl
               - qcom,sm6115-dsi-ctrl
               - qcom,sm6125-dsi-ctrl
-- 
2.42.0

