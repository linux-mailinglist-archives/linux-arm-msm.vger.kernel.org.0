Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8780A15AE5A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2020 18:10:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728576AbgBLRJu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Feb 2020 12:09:50 -0500
Received: from mail-lf1-f66.google.com ([209.85.167.66]:33082 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727264AbgBLRJt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Feb 2020 12:09:49 -0500
Received: by mail-lf1-f66.google.com with SMTP id n25so2162623lfl.0;
        Wed, 12 Feb 2020 09:09:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RzAlCoqAZDSn2TyJo2MiPAMETy9dxfPAIY1/YsUVGt4=;
        b=d2Nx9id/JrT0eXUr1xLLPwoTcuiTj9wmz7xhTbXCNS7YqS8RYRhkFHhsDhHPPEfywd
         IjEeizaeKNtsfyoGwM/n6UCuvSZ3NfRQJ44eW7w7IcazWT3b1tCu0qsCm93oGrEem/oK
         HiW1QzmrjQ59z3nJKCFMWba/cLz8yORL35V7omBKCmu+JqfwhNNe6rjmiUF6e2CuUcL3
         y7xnHzTblBbmHjLtR7BIwZewTmOz26BuqzjW5To3T2FNRLrJDagenb4BJhr2X4eoTcx4
         GaNEt1eHnrjEnONI//6Hp1T4NcSApXf32I799KbFq8lZw2G5wD/uSJJhrly5pT0kgmLd
         4n2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RzAlCoqAZDSn2TyJo2MiPAMETy9dxfPAIY1/YsUVGt4=;
        b=jBg9B3V1CHRBH2bsDN5cSzBsfRbG1K9jaak9CslrrK0TcvydaapiOqlF6mZV4baA8+
         atc4OK7RNJPdPl79+/C+917azZXSZ/lnEJg9BsuP4rnX5CXx830UWgbi4MZQsToowH/v
         kI/UOPY9tvGXbknsL2IvDNAf9DlioetkE7QIoXFNG3DgQaHgPuNmVzLzWp95RWLS21wg
         aBCiKrtfET4QAOS065Z5LL33aUN2lgcH52/ekijA7ZzF1ezS0HnuoW8t+Hn9srxasxeT
         wTjbds5c841a8lUhiI6Yl2jNmhW9LZTmu3VTkNvC1t18D8FT64evOUYVj2Slv8wchULo
         tXFQ==
X-Gm-Message-State: APjAAAVsVnPSKS+QL4K0/c0Y1dSERsIKrcdmr7gzNMpYK0NPJIeY/HDG
        aQciOnGZgXn6X0jmgH5Imd8=
X-Google-Smtp-Source: APXvYqy8pKirAFGJW8gENb6o/zFLNS7p3rMsxgaWdFoS4acwGWb2X0f4yu3RCqhZABJCSC1CtM4Usg==
X-Received: by 2002:a19:7b0a:: with SMTP id w10mr7196691lfc.90.1581527387704;
        Wed, 12 Feb 2020 09:09:47 -0800 (PST)
Received: from emb-minnehanov-OptiPlex-7060.collabio.net ([77.244.21.162])
        by smtp.gmail.com with ESMTPSA id b20sm607955ljp.20.2020.02.12.09.09.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2020 09:09:47 -0800 (PST)
From:   Alexey Minnekhanov <alexey.min@gmail.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org,
        Alexey Minnekhanov <alexey.min@gmail.com>
Subject: [PATCH 1/5] dt-bindings: Add vendor prefix for Xiaomi
Date:   Wed, 12 Feb 2020 20:09:12 +0300
Message-Id: <20200212170916.7494-2-alexey.min@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200212170916.7494-1-alexey.min@gmail.com>
References: <20200212170916.7494-1-alexey.min@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Xiaomi Corporation is a Chinese electronics company.

Signed-off-by: Alexey Minnekhanov <alexey.min@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 6046f4555852..7cef5ee734d6 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1054,6 +1054,8 @@ patternProperties:
     description: X-Powers
   "^xes,.*":
     description: Extreme Engineering Solutions (X-ES)
+  "^xiaomi,.*":
+    description: Xiaomi Technology Co., Ltd.
   "^xillybus,.*":
     description: Xillybus Ltd.
   "^xlnx,.*":
-- 
2.20.1

