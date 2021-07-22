Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62ED53D2329
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jul 2021 14:13:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231894AbhGVLco (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Jul 2021 07:32:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231886AbhGVLcn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Jul 2021 07:32:43 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 915F1C061798
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jul 2021 05:13:16 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id i16-20020a17090acf90b02901736d9d2218so5211022pju.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jul 2021 05:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MBGbqvseaowVXgAUsLtxjTmL1uju2aQqqvQPrdOEUMI=;
        b=MffmZA+8W2f1Kokpv98SrCuZFW73UW9/NaYK5d2w4ctJvjr1dWlq9TaYgmYcgQUVm3
         QV9cuUTVVRPEWozlvoeC64n1bJd5iDR5pCn+gvyALQnuTeYHEL7NhgcUzhr+5Ms0CS8f
         aeHozzPsJFagR8Pv9X3NwflkAGYzVHmUbRZMy1OVLQXdHkcpnVakDoh+G705Kj1Znjwc
         Uy9hQtDu+wdistUWq3yPvLF2pQAQIT2cYFB7paOAPUASV5owCY0RzT2VBAzCtdYX3S09
         fJuxczjKvkgUvlB60+nTWMCymb7QRxz36uaD3Lb/N56uLJmHQm/vGi/m/UIcDsYbj3AM
         7QHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MBGbqvseaowVXgAUsLtxjTmL1uju2aQqqvQPrdOEUMI=;
        b=qkYUgfs8p/nqCb5Y21cKU5L4PMl49J19I6wh5mBVg9dP1RUIqF8le344wSaaJAjZoA
         RxTMJta11KWfFQfXrhnV01hNp2uD34EwdI9LocCLHL/g9HYJQg766gpF1Kj7C4AiGGFR
         7pDzOjLx6rIBpQ6LrosbcbbM4i7iNASx0TKvY4efJUyXSrFzBdOuY7YTYniKxvcCDLwT
         GjRQLxjSAhy2cuogB4t8iG8tCixlG1rxGeW7MA/2IpGEsXANHeATA5GIVo9PUnLKbpkm
         LUV2o115jex5jAVilE8aroUlXuH8rvuX2mhJi9xUIPQPij9SSsNsSOLgxQlpF7ZuLyGW
         m9Cg==
X-Gm-Message-State: AOAM5334IjT5if4JvXGFEYs76ATS5Pebq+l7em+QrCHmpn8EYCqOajlq
        TEo7+xO+G+BbDSTcLA/oMGnb
X-Google-Smtp-Source: ABdhPJy/TPnXiFxfi1X0TTMzUVAeJN+6AbjyH2Yboi4ozzviDpf017R9CALoCl8Mt1zWU1qbuEDcrg==
X-Received: by 2002:a63:2b91:: with SMTP id r139mr40459040pgr.242.1626955996137;
        Thu, 22 Jul 2021 05:13:16 -0700 (PDT)
Received: from localhost.localdomain ([120.138.13.30])
        by smtp.gmail.com with ESMTPSA id cp6sm2913846pjb.17.2021.07.22.05.13.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jul 2021 05:13:15 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     kishon@ti.com, lorenzo.pieralisi@arm.com, bhelgaas@google.com,
        robh@kernel.org
Cc:     devicetree@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        hemantk@codeaurora.org, smohanad@codeaurora.org,
        bjorn.andersson@linaro.org, sallenki@codeaurora.org,
        skananth@codeaurora.org, vpernami@codeaurora.org,
        vbadigan@codeaurora.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v7 3/3] MAINTAINERS: Add entry for Qualcomm PCIe Endpoint driver and binding
Date:   Thu, 22 Jul 2021 17:42:42 +0530
Message-Id: <20210722121242.47838-4-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210722121242.47838-1-manivannan.sadhasivam@linaro.org>
References: <20210722121242.47838-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add MAINTAINERS entry for Qualcomm PCIe Endpoint driver and its
devicetree binding. While at it, let's also fix the PCIE RC entry to
cover only the RC driver.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 MAINTAINERS | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index bd7aff0c120f..cdd370138b9f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14254,7 +14254,15 @@ M:	Stanimir Varbanov <svarbanov@mm-sol.com>
 L:	linux-pci@vger.kernel.org
 L:	linux-arm-msm@vger.kernel.org
 S:	Maintained
-F:	drivers/pci/controller/dwc/*qcom*
+F:	drivers/pci/controller/dwc/pcie-qcom.c
+
+PCIE ENDPOINT DRIVER FOR QUALCOMM
+M:	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
+L:	linux-pci@vger.kernel.org
+L:	linux-arm-msm@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/pci/qcom,pcie-ep.yaml
+F:	drivers/pci/controller/dwc/pcie-qcom-ep.c
 
 PCIE DRIVER FOR ROCKCHIP
 M:	Shawn Lin <shawn.lin@rock-chips.com>
-- 
2.25.1

