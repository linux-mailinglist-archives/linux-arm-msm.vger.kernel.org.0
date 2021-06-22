Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B0533B0ED5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jun 2021 22:32:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230101AbhFVUfG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Jun 2021 16:35:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229629AbhFVUfF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Jun 2021 16:35:05 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E69E0C061574;
        Tue, 22 Jun 2021 13:32:48 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id hz1so442950ejc.1;
        Tue, 22 Jun 2021 13:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fmVw9pStfenfEOP3qSjlczojcgA/tTjIT2DLlSdXh+0=;
        b=WkwTLrEXm5bfSNXiGy18ZXmxAcf2lFYjWpEJ0mhRfQcr7LsSkQSJ00Y3dnnvXNA7bP
         hC0KAC0yyZJxuA/b5UorpOpYvG7H+KhJrOX4qyl7DJmCpIAfVm0p+MErmPhQFA9wUFy5
         pW6op6qf6AfHSotPx4laPGlN+6Efh8FFXya3+bEnQZCLaGERZ/wcvDBAdn8TQTGiaW82
         sDruRHgKAtQu1+D6lqMcipOzQhYBL9ibHCwcakvVvx6ACIb6TQ1ZjSICf/xNSgwT52PM
         te2gEEiX+J6HU+k1NHbEqtlSHlh5+YjDXpQFcCCIwVo3LRHH0F6pnW7RpUZuqphmQ1Wm
         vnfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fmVw9pStfenfEOP3qSjlczojcgA/tTjIT2DLlSdXh+0=;
        b=P4T77WYUECyBMsPrNSatwbFD5T0sjQZ+mO/ffNcpMOUAX59sgG314RsEWKPqpu1/+E
         WvEZsDquUMKGWrwmkjm+kPBxsFkHKqGRRoYWDAJ6NmpU74U42O88We30E+ZjXwNxkz5C
         egh0k5AeCVP0tluGLlqKMlJghPZiPetmSHDppPuqGAypzpE1OMAE3rsUVCswSyMakWNS
         9eRU7fdDukhNLujPKEklujMYzbU6QFlR0HWIx7iZf0zb95yY9gN0FIRYVYVdxT/Ssz0o
         6u5VKlJ/RAZWWFdtlgHQ7nvGaX0ANnHgtyG8XwxRZtt3v/pjMtr6iV6FoQmIeqvghOds
         MIKQ==
X-Gm-Message-State: AOAM532O7EugCq6gxR9VE/z4OlLQi5c2IxtxQX4heqfNrGKf4t7teOFH
        7/eRHiEESNMbdqb69Ru/l+g=
X-Google-Smtp-Source: ABdhPJwBBF/JzwFvctm6Kb/5QRElS2Jo+5/sgmj4KLRBIJ/c2T5sA4W8f4/PpG9ANWgbSDPuhPEe9g==
X-Received: by 2002:a17:907:7662:: with SMTP id kk2mr5879847ejc.218.1624393967267;
        Tue, 22 Jun 2021 13:32:47 -0700 (PDT)
Received: from localhost (178-169-161-196.razgrad.ddns.bulsat.com. [178.169.161.196])
        by smtp.gmail.com with ESMTPSA id i6sm6429481ejr.68.2021.06.22.13.32.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Jun 2021 13:32:46 -0700 (PDT)
From:   Iskren Chernev <iskren.chernev@gmail.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Manu Gautam <mgautam@codeaurora.org>,
        Rob Herring <robh+dt@kernel.org>,
        Vinod Koul <vkoul@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-usb@vger.kernel.org,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Iskren Chernev <iskren.chernev@gmail.com>
Subject: [PATCH v1 1/3] dt-bindings: usb: qcom,dwc3: Add bindings for sm6115/4250
Date:   Tue, 22 Jun 2021 23:32:38 +0300
Message-Id: <20210622203240.559979-2-iskren.chernev@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210622203240.559979-1-iskren.chernev@gmail.com>
References: <20210622203240.559979-1-iskren.chernev@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the compatible string for SM6115/4250 SoC from Qualcomm.

Signed-off-by: Iskren Chernev <iskren.chernev@gmail.com>
---
 Documentation/devicetree/bindings/usb/qcom,dwc3.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
index 413299b5fe2b..4e6451789806 100644
--- a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
@@ -19,6 +19,8 @@ properties:
           - qcom,sc7280-dwc3
           - qcom,sdm845-dwc3
           - qcom,sdx55-dwc3
+          - qcom,sm4250-dwc3
+          - qcom,sm6115-dwc3
           - qcom,sm8150-dwc3
           - qcom,sm8250-dwc3
           - qcom,sm8350-dwc3
-- 
2.31.1

