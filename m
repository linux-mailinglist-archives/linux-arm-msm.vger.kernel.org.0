Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5970B3B54D1
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Jun 2021 20:58:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231489AbhF0TAX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 27 Jun 2021 15:00:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231298AbhF0TAW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 27 Jun 2021 15:00:22 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6CB4C061574;
        Sun, 27 Jun 2021 11:57:56 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id u20so4580791wmq.4;
        Sun, 27 Jun 2021 11:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hbU5C53by8ndXGtDEtCLVhoqtGIcQT0Y5XrfcYaPR5U=;
        b=XjbWv8UNt42p5A0Ph1knmvdygMxaAn/0g7apE32zRAGtCJ6jnfpBY3FMJOW/cYse9G
         9JqccMrWywt7QkNDMNiupj0MLtOSD7MOG7L+XeOrsSPouSpsuRsNPzdecg+x113BFUIV
         yrR3FoJ4xRg+2YNePg4gmbRy9iobLHkmcCvvHSK7wuL0zzbbjiKnPykJcaRP3Owy9DpL
         tijine4/Bd1BDcYyxfFnlzVmG8fkWRwLd4KFdfdo8hXRRCaIS9BtOl8zj/ebqUo1WfA5
         3EwtoFHVm9GnC679/nVA/Cgh97zeHJr2mWx8+bqGYnA+kgiWBtYqODrWb7gn6l5lEJAw
         zAQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hbU5C53by8ndXGtDEtCLVhoqtGIcQT0Y5XrfcYaPR5U=;
        b=ThBIl2i3gTCmRWLG9FPX1s+61NDUh4JW1ZhSIqUfG7f4j/2iT3YlWbNr8tYn1qIchJ
         laQeQmKJ3Bo0HLg1ow22SffyiaWTNI6sRg751TWFIFmhVXa6kJMoz96FnpKhtG6sX91H
         qK3R4885Le1HwhJOCOtdqkRAjJit/S2Yq4pa9tLg7nlxul6/sWmyoVgBl5dgHVYRNS8a
         zyNAf7akxvmiLwIYSSCeaxmUFjoVX0Ah1oEvMDRIrCCUtjJ0MLqWKALZWgzgg+DfBIXw
         FDwpX5XFqvn/zTt4AAYjlHDB/rfbEvvOu66Pta2YaOKEvy0pH70ZJwJlW6KxjkGfk/ci
         vJDw==
X-Gm-Message-State: AOAM532/NqGtcakkocq/butwNRwX7hgDCWsz3nxzbnn3TG9qm5Qytjsh
        lKyMNp0QN2DxnQlXAOQ9PTA=
X-Google-Smtp-Source: ABdhPJytfeyRGXE5YzR0zAsxyOTXEKP5cpkjgw0SUEWYEw3BnHQyhWkoHAtaXKSC0/4czYQMCh41Ag==
X-Received: by 2002:a1c:4d10:: with SMTP id o16mr468366wmh.160.1624820275513;
        Sun, 27 Jun 2021 11:57:55 -0700 (PDT)
Received: from localhost (178-169-161-196.razgrad.ddns.bulsat.com. [178.169.161.196])
        by smtp.gmail.com with ESMTPSA id e17sm13615158wre.79.2021.06.27.11.57.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Jun 2021 11:57:55 -0700 (PDT)
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
Subject: [PATCH v2 1/3] dt-bindings: usb: qcom,dwc3: Add bindings for sm6115
Date:   Sun, 27 Jun 2021 21:57:48 +0300
Message-Id: <20210627185750.693222-2-iskren.chernev@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210627185750.693222-1-iskren.chernev@gmail.com>
References: <20210627185750.693222-1-iskren.chernev@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the compatible string for SM4250/6115 SoC from Qualcomm.

Signed-off-by: Iskren Chernev <iskren.chernev@gmail.com>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 Documentation/devicetree/bindings/usb/qcom,dwc3.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
index 413299b5fe2b..938b1137fac0 100644
--- a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
@@ -19,6 +19,7 @@ properties:
           - qcom,sc7280-dwc3
           - qcom,sdm845-dwc3
           - qcom,sdx55-dwc3
+          - qcom,sm6115-dwc3
           - qcom,sm8150-dwc3
           - qcom,sm8250-dwc3
           - qcom,sm8350-dwc3
-- 
2.32.0

