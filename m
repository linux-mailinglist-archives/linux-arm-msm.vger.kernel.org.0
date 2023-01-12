Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C31FF6672D7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Jan 2023 14:05:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231946AbjALNF6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Jan 2023 08:05:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231454AbjALNF5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Jan 2023 08:05:57 -0500
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67033C72
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Jan 2023 05:05:53 -0800 (PST)
Received: by mail-ej1-x632.google.com with SMTP id jo4so44618878ejb.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Jan 2023 05:05:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Js79G0ew5SBLWV/rp6ARJpWVK36TQx65bfTfHk7gwPY=;
        b=WdwnFkSJ6TcQXJX0/YPUg2u26LJdKuuvmh6a4VmVSCu93pLHHZCqhBDl7C1Mom7mCc
         L+Rw5jcBJjG+adaV+vlEyQ9oAFCmmXgMNWC0mFzirsmDljWLksDNmPVFAEJ4nIAcKWxf
         l/AlaCkYpRXdMvbtZqNPfhJREPhB3M79ZcCqFEQx85zXwPHNOKAxGscs7tJLK8B9Q6WU
         ZAZBBT3XbLWn6mo70gZaZKx22EgIpGuMbRZEkAqMoS9WC3B6c1OMr8jn6+0ycMil6uqF
         9wcmyiDXs30gAuDSnmgm9/AJWGCYLUY34uD1HqX8IOFIeZjfgtO2eKUkleO27LGwx8ZF
         cG1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Js79G0ew5SBLWV/rp6ARJpWVK36TQx65bfTfHk7gwPY=;
        b=aOyjgpV2Gr9O9z5VauuzK23c3utIDrZb/AoK28OZ1VzkCU1KkDekxh9z21PZHYHiOu
         JmgN1zuXJRkffCIFZ0XNlfO04iYpvtaqKKQFNiuu+cFj0qMS8dp1DdboAmP2aT6YPlc3
         f4S5iMMdlQvdlQdxO1JcoYH6fDtg3LEd/FNOHGkqQTkP+5UuvmhIOIvDkS2ftITTgmDK
         DlNI3I1OERo6KTfD8mWtchyozf6EgRU7yATztKhNep8Nj+YSH+/iDJ+qXPesrPl4hv6l
         +2WWKgbzIakW55GsS1cCTYP/oDUTAUkoZ+5Hy/NZFZ5gp6bcGhhw1D23H+hWue4WfVZx
         FFOA==
X-Gm-Message-State: AFqh2koOUbRy5BKgoTDmDtbvF8haa2HWO58N0VzikOM0kMFlPenErW64
        E1grn9Io4zuxpluPmdsiHftMnA==
X-Google-Smtp-Source: AMrXdXsOc8saCzmD/dXqJ2/l2qrKh7yzarDqaDTYDJKr8FLOUpOP5e9rsoahF5JlLSFJYI/9/P2l4A==
X-Received: by 2002:a17:907:d004:b0:7c0:f213:4485 with SMTP id va4-20020a170907d00400b007c0f2134485mr66310785ejc.73.1673528752001;
        Thu, 12 Jan 2023 05:05:52 -0800 (PST)
Received: from hackbox.lan ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id 11-20020a170906318b00b0078d3f96d293sm7427668ejy.30.2023.01.12.05.05.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jan 2023 05:05:51 -0800 (PST)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        "vkoul@kernel.org" <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 1/6] dt-bindings: phy: Add QMP UFS PHY comptible for SM8550
Date:   Thu, 12 Jan 2023 15:05:37 +0200
Message-Id: <20230112130542.1399921-2-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230112130542.1399921-1-abel.vesa@linaro.org>
References: <20230112130542.1399921-1-abel.vesa@linaro.org>
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

Document the QMP UFS PHY compatible for SM8550.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 .../devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
index 32ed1886fbae..cd4e877415d6 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
@@ -17,6 +17,7 @@ properties:
   compatible:
     enum:
       - qcom,sc8280xp-qmp-ufs-phy
+      - qcom,sm8550-qmp-ufs-phy
 
   reg:
     maxItems: 1
-- 
2.34.1

