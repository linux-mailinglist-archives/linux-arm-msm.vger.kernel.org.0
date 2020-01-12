Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2C6E0138810
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jan 2020 20:54:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387404AbgALTyW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 12 Jan 2020 14:54:22 -0500
Received: from mail-pj1-f66.google.com ([209.85.216.66]:51552 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387395AbgALTyV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 12 Jan 2020 14:54:21 -0500
Received: by mail-pj1-f66.google.com with SMTP id d15so1881460pjw.1;
        Sun, 12 Jan 2020 11:54:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WAKFhdZyK7HD40XoPNoJKm5mL4rsXQP3NWhrKWK0Lv8=;
        b=tkhxotQzMNS/84e+1iIUXadR/8wu+V1vzYgRh2Ofqgjn0UiFS8RtohOkSahN1x2BnB
         Ezl3uybClY4/hFIRyNf0sBbVgHCuNzXtXJe55THmPY/prpnj3t3FvDAae+TTzydQKw+F
         V0dlsni7YyKNdyiVKNvHvxbkh4VsGhEhktieKL5kqh5IxFfdFlFU8ZWJwRWwiFVNzhlv
         pdvzWv4Yk55XFad7bMaX0qHn93hXvzxCM4diIFhfXz7YwWngfwBrPt37tej9vLRyEygs
         TL0j5d9fmp2SzjsXIR61s9sUu3iuu5uFpEiDaUG2iBfBz99AhBekKJeHDFSi/270qNmo
         OdnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WAKFhdZyK7HD40XoPNoJKm5mL4rsXQP3NWhrKWK0Lv8=;
        b=e8iIV8XOVgCBFSPWsNTChSVV2C9jvItTSbsz7G7aK32sy2hgZwmjZHevP49m5LEBro
         baZsBYyxuu9EOTlYrSJJ4WhhlYzXs8PmgLI7kESFqqshLJRCgiH9CfkGJWAyVfVL39dO
         ZmCPPRA3k9l4v80/giK/FYzLf7VMSSBczBxDVcdvBBt8CZojWBR4twFQBrF31FS6Eigd
         4TASZPN/Bp1WgrvCjtzn13+6oVIE56P3sexKbEOpiMPybx4CXHYEUkjwkln/oBkHHv3E
         0baUu2iiOEiSA2846CLS+dtxfgTthJv31khRAj506aZNbNRtPAJkvfJZlzCb6mpjwIT/
         jUeA==
X-Gm-Message-State: APjAAAW1mltg0SioLrGjPCaQfcoXUOx/iJZUfPxF0c00Lukl7wZmLdnN
        UGozGATxNkUQfLGKpZTQdeE=
X-Google-Smtp-Source: APXvYqwTHGhndNZNsQKYW9nTAcuiFTj1LSY80cI+G9OpcouT/PjQ1Ca1QJlhYXRZmaQOV1+0IG/iHw==
X-Received: by 2002:a17:902:426:: with SMTP id 35mr10638467ple.302.1578858860792;
        Sun, 12 Jan 2020 11:54:20 -0800 (PST)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id 17sm11391924pfv.142.2020.01.12.11.54.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jan 2020 11:54:20 -0800 (PST)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Sharat Masetty <smasetty@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 3/4] dt-bindings: drm/msm/gpu: Document firmware-name
Date:   Sun, 12 Jan 2020 11:53:59 -0800
Message-Id: <20200112195405.1132288-4-robdclark@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200112195405.1132288-1-robdclark@gmail.com>
References: <20200112195405.1132288-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

The firmware-name property in the zap node can be used to specify a
device specific zap firmware.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/gpu.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/gpu.txt b/Documentation/devicetree/bindings/display/msm/gpu.txt
index 3e6cd3f64a78..7edc298a15f2 100644
--- a/Documentation/devicetree/bindings/display/msm/gpu.txt
+++ b/Documentation/devicetree/bindings/display/msm/gpu.txt
@@ -33,6 +33,8 @@ Required properties:
 - zap-shader: For a5xx and a6xx devices this node contains a memory-region that
   points to reserved memory to store the zap shader that can be used to help
   bring the GPU out of secure mode.
+- firmware-name: optional property of the 'zap-shader' node, listing the
+  relative path of the device specific zap firmware.
 
 Example 3xx/4xx/a5xx:
 
@@ -85,6 +87,7 @@ Example a6xx (with GMU):
 
 		zap-shader {
 			memory-region = <&zap_shader_region>;
+			firmware-name = "qcom/LENOVO/81JL/qcdxkmsuc850.mbn"
 		};
 	};
 };
-- 
2.24.1

