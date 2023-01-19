Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CCF126739E7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Jan 2023 14:22:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230114AbjASNW1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 Jan 2023 08:22:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230053AbjASNW0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 Jan 2023 08:22:26 -0500
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEDC04EC2
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Jan 2023 05:22:24 -0800 (PST)
Received: by mail-ed1-x532.google.com with SMTP id v30so2814217edb.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Jan 2023 05:22:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PIsMxIaM7FWCSnFu6ERIKZQQpBb8dWtHDLyxMia/DaE=;
        b=zHvsLCp4UZgDNma6+o6Dmdwxkm3zIJp0m/SuNq7yeGJL+z9KQrgJX/co3O5A3QYrT7
         e4r9cVDq6tO5l8iwY5UvTjSmSCI4LndapEYdwjIkhqcC0ERiKXWaraRGe0LTHAKzcJ7f
         p38O+rmC37wkeWh952qfDH4DzT3e+QioB8DvLKsMJyGxmd7LqklQQBNfA9eNhgLgmbEy
         MnhcJ9VwetYFUFDdhQOHT74cBVbWeOBamVzbV9nF4twKrAuQf1DNG2I76e96XhAMQzin
         Ng7ODPJsI0TVer52u5bWEYaE/AAiHPzjJXho4bPgsPFnDt+LLJnTBrDn3jPL1ou66ILo
         EIEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PIsMxIaM7FWCSnFu6ERIKZQQpBb8dWtHDLyxMia/DaE=;
        b=E2yXpy+wnvr+3hLU5ppdq916JR4dW39CEbDST78sLcLubIcUe0U17fvH1Pdi1DmEzx
         OqtSQU1UU+Rh5GapXNnj/obw8A+qWZUzTIE5BB6+rAKlbP+k+okitYqUvHZVwF5mfYkS
         Zzx3QlevKDOrAx4Ddr5nLAYBXmhTWuh7ooglwO6ojzB14CGjy4+x2/UyWhWAb6hIxt4m
         4QaTe85bU7uY/QaLcS/Rq87cENAEfm3A6TV42x6qDZ6tbK2FFQstKZMcKRego1kJvxnz
         Fwf02l/COY20ONCT5Vl8m0sNCuiDttjWFImTwXb5yn4r8flMqVHABsp9MgEMpsO6li+t
         erRw==
X-Gm-Message-State: AFqh2krJRs5QXVZUryrjp2HEuy8GbmjD5sQzzQn4TDh/xrMjiYC6hbrE
        cDFzoHtD9G49t0Q6uYGnHoGCEg==
X-Google-Smtp-Source: AMrXdXuMIUAAq9eH1sfX626DL7xXAJlq4u5CdG/LFj32y0rjrQyb7gWRmyJlPsV2QEvee/RfsxxM7A==
X-Received: by 2002:a05:6402:194c:b0:498:b9ea:1896 with SMTP id f12-20020a056402194c00b00498b9ea1896mr12562874edz.9.1674134543424;
        Thu, 19 Jan 2023 05:22:23 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id bt16-20020a0564020a5000b00482e0c55e2bsm15532646edb.93.2023.01.19.05.22.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jan 2023 05:22:23 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH 2/6] dt-bindings: phy: qcom,hdmi-phy-other: mark it as clock provider
Date:   Thu, 19 Jan 2023 15:22:15 +0200
Message-Id: <20230119132219.2479775-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230119132219.2479775-1-dmitry.baryshkov@linaro.org>
References: <20230119132219.2479775-1-dmitry.baryshkov@linaro.org>
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

Eventually all HDMI PHYs are going to provide the HDMI PLL clock to the
MMCC. Add #clock-cells property required to provide the HDMI PLL clock to
other devices.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/phy/qcom,hdmi-phy-other.yaml          | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,hdmi-phy-other.yaml b/Documentation/devicetree/bindings/phy/qcom,hdmi-phy-other.yaml
index 2c21e120ff8d..0c8f03b78608 100644
--- a/Documentation/devicetree/bindings/phy/qcom,hdmi-phy-other.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,hdmi-phy-other.yaml
@@ -43,6 +43,9 @@ properties:
   vddio-supply:
     description: phandle to VDD I/O supply regulator
 
+  '#clock-cells':
+    const: 0
+
   '#phy-cells':
     const: 0
 
@@ -113,6 +116,7 @@ examples:
                   "hdmi_pll";
       reg = <0x4a00400 0x60>,
             <0x4a00500 0x100>;
+      #clock-cells = <0>;
       #phy-cells = <0>;
       power-domains = <&mmcc 1>;
       clock-names = "slave_iface", "pxo";
-- 
2.39.0

