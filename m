Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1E0C061717F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Nov 2022 00:13:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229516AbiKBXNP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Nov 2022 19:13:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229993AbiKBXNP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Nov 2022 19:13:15 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95E97D13D
        for <linux-arm-msm@vger.kernel.org>; Wed,  2 Nov 2022 16:13:13 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id d3so242118ljl.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Nov 2022 16:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V99md7rLtpNqzsDzhmBdbw6JcMGG4OCEBg8fYBcn1Kk=;
        b=ozkbiwshk7uZ/S7wP5Qerle/gYtFRrnLifxjIaxVrsh2YJ9z6yTy9NJGjk+bYXP9MC
         8M64a4PMRYiDUbW3f7pp+7SMLJeWzaiRTlZ6Kk3112UxNV/UAEelGeBe20P/hLBwhb2N
         64qTz9cR+QT2qt9ixGayXWLdZAmFesApco9GsoMQG3ymd5SHqF2EM061HrsrzTOXRLP0
         x1AeP6LaMdzoI11g4stgG6B+5qX2jmHnfI2xNMvKfLAGpCdzhGSblu5/vjhAJrvO/NpQ
         2s0P3TjA1N6zzwxgFU36LLOR3J1HXDDT4zzrKbN1a6cPJPPpf9GiITKqlW0MN71My+JW
         ycFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V99md7rLtpNqzsDzhmBdbw6JcMGG4OCEBg8fYBcn1Kk=;
        b=kDaUhLOSt1AiXfHKrr4RpTJimyRXzQkgXxmIzfDcTosiDQVm91L3RWzaJ8bUxlwfGn
         lfyUdNld1erTjMV+iAgK2IOrjMQrUJb6KY8f8JpeTodCtCLPYwy2QSwdWXFZKZqIlCR2
         lXjKVKLm51Py4FQDSLR4oduiDBR4hW4HTue6g57MUQvFNW2QWKQJp1yHHVGMPl60bSBn
         dcn91s8kCf2084xlMWniQX2HeZE1DFX01OeEVWQCBNMwm0vHPYwnLhSus8LWgZQ/WaqL
         7CHU5Cdh3usUN7tMd4Dhl7D9aX4rrRqL2iu9ZxpTr/kXvBJlI6ms7hpFMD1ml6zFgwS9
         VNHA==
X-Gm-Message-State: ACrzQf3v2tknROcTh/xnBqWDSYfCCck8qy47J8w5xuESafoQ4J+o6ptg
        BsschveGaLxeeNs0BIfxZcOeNw==
X-Google-Smtp-Source: AMsMyM79ZwE9Kn2WHfgZ0XRTpIxaxrCh50+4YuBR56AUy//VpPQBI/VtDpNMjGhcJSYwUpZ69RQgyQ==
X-Received: by 2002:a05:651c:22d:b0:277:22ec:8dd8 with SMTP id z13-20020a05651c022d00b0027722ec8dd8mr9744878ljn.101.1667430791974;
        Wed, 02 Nov 2022 16:13:11 -0700 (PDT)
Received: from localhost.localdomain ([195.165.23.90])
        by smtp.gmail.com with ESMTPSA id m6-20020a056512114600b004b0a1e77cb6sm1636134lfg.139.2022.11.02.16.13.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Nov 2022 16:13:11 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v2 1/8] dt-bindings: display/msm/dsi-controller-main: allow defining opp-table
Date:   Thu,  3 Nov 2022 02:13:02 +0300
Message-Id: <20221102231309.583587-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221102231309.583587-1-dmitry.baryshkov@linaro.org>
References: <20221102231309.583587-1-dmitry.baryshkov@linaro.org>
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

Allow defining DSI OPP table inside the DSI controller node.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/display/msm/dsi-controller-main.yaml   | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index 3b609c19e0bc..c37dd9503da0 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -80,6 +80,9 @@ properties:
 
   operating-points-v2: true
 
+  opp-table:
+    type: object
+
   ports:
     $ref: "/schemas/graph.yaml#/properties/ports"
     description: |
-- 
2.35.1

