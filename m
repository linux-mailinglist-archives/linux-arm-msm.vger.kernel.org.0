Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2967A3B54D6
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Jun 2021 20:58:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231579AbhF0TAZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 27 Jun 2021 15:00:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231553AbhF0TAY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 27 Jun 2021 15:00:24 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00B91C061574;
        Sun, 27 Jun 2021 11:57:58 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id u8-20020a7bcb080000b02901e44e9caa2aso9399537wmj.4;
        Sun, 27 Jun 2021 11:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WV89p0Dh9gFyvzsassxs03sxu1k2bjjeRxKtJF5OFHo=;
        b=r/FZHPU5TX09KIVaCfM9qyyo+peXe9RLGnjeSfKAMdkrItxgE9ofpNzg+AcKCNA5sz
         ainW9i0slya2f7w0LzdA9M/vfhK6EqE+Nz9HeKmcuTwqjuL8rqS91NMUsKnB+u6dQU7E
         lGQtyDP745holSf+DztMl8SRbBgTeiJPEESS+/hP7DFpS3dp6fzSStlFyyMMZtGbwEe/
         rGKDVMxz8pu2RHaCNfHiXU0b0+60ia8P+B6Flyy0QXo8F096RpAmzp2uxULD3eg6QOyx
         557x2ur4ux/HtHU45+TD22qbCVGU7B5sx0WcKFp97MV1teEukaanMhdcklz9YUdHlWCt
         1kiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WV89p0Dh9gFyvzsassxs03sxu1k2bjjeRxKtJF5OFHo=;
        b=pcEuNEZP7f7TcYinRjWOZqWppvYpTRr3ChQKJ1gRE63oQCBAlI0PpfKCzNUaPfrT4Q
         fhO5J3dyq+qsAsj3IGlIkAGKOju2Ew6de3n5XJw6Y38tD2h85FynJm+lhLAucD57g7CX
         R1nA74MD5ot1WEmWdRpABchGFZLfgx2fOEmuwEhwaCAn16oauQmtSz4zpsVSqihz2XWQ
         1N7gCeYH4wfA4KT/kOjWzAfR4F8InfejADWEp5BBplSTPDsBk750GQAtNgNYOGgF/4oH
         FbjCEECOPgnY9BnbfkGIVVqcmrMLSlc5nVkn8gGlbK4Kyk4oaJh1e4MDJPW8IL94jzB3
         Rqxg==
X-Gm-Message-State: AOAM531AmavysntU7Il6Hxb5UZDPcXhoQT05X7rcp8m/s25yRBKIkQim
        GKDLRIGK55Ny4Vn4n62zn2YdMlPFkA1gdg==
X-Google-Smtp-Source: ABdhPJxZBXH4OwU+1hiA4jfv4zG3+2Hi4cZND0kX1kzYG49lBMk5OFZjP+Qqr6rW4KzCV4xiqM1K2g==
X-Received: by 2002:a1c:4d07:: with SMTP id o7mr22141772wmh.97.1624820277600;
        Sun, 27 Jun 2021 11:57:57 -0700 (PDT)
Received: from localhost (178-169-161-196.razgrad.ddns.bulsat.com. [178.169.161.196])
        by smtp.gmail.com with ESMTPSA id g7sm8755840wmq.27.2021.06.27.11.57.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Jun 2021 11:57:57 -0700 (PDT)
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
Subject: [PATCH v2 2/3] dt-bindings: phy: qcom,qusb2: document sm6115 compatible
Date:   Sun, 27 Jun 2021 21:57:49 +0300
Message-Id: <20210627185750.693222-3-iskren.chernev@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210627185750.693222-1-iskren.chernev@gmail.com>
References: <20210627185750.693222-1-iskren.chernev@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This compatible string is for the HS USB PHY on sm4250/6115 platforms.

Signed-off-by: Iskren Chernev <iskren.chernev@gmail.com>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
index 9f9cf07b7d45..3110d3a0331b 100644
--- a/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
@@ -23,6 +23,7 @@ properties:
               - qcom,msm8998-qusb2-phy
               - qcom,sdm660-qusb2-phy
               - qcom,ipq6018-qusb2-phy
+              - qcom,sm6115-qusb2-phy
       - items:
           - enum:
               - qcom,sc7180-qusb2-phy
-- 
2.32.0

