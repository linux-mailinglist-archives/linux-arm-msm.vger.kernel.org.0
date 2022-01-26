Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E712E49CB83
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jan 2022 14:54:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241726AbiAZNyc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 Jan 2022 08:54:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241729AbiAZNyb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 Jan 2022 08:54:31 -0500
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69D7DC06161C
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Jan 2022 05:54:31 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id u15so25948450wrt.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Jan 2022 05:54:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Z5AnMORgB0aa+xiAll7F0CRVY0oWDotsOZG4NUiDGN0=;
        b=NdW3yfIwrbjsYzOF1RonPMYJ0WpfZTFxuHuQxBM/dVV9Ezhl2+SeHHs6yoaIX8C0hy
         kaQzfRS4Cv/aIaxNI13XhtW+QBB12IbukOsEnmkeAILaSCT+8EzmnizAqSds4mKCYHbP
         QO9wRoQLxzIm0ZJkiWxg3aLbG2X7H7aqyR0eJSsbMjffMUG+vLkJgD5BkUowRQrp2Biy
         0nPMLYA5BTxmvVEZopjPMurq6WrIzYtc5zReiZB0wfE98dXUMNiuzVZZm73TgjmK8jP8
         B0DrAxSf/jAXaA/H7Z1fJZB/3bBRK0AwHucn0uREPTaW/9fn+pf3wmBqCuYvlA/4j+H+
         rKeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Z5AnMORgB0aa+xiAll7F0CRVY0oWDotsOZG4NUiDGN0=;
        b=zzS77CRWQ9SkgjqDnBcOs4213zfGNmjyqCYSiBdx2peYWOWjfXZ97X6MvTZW31lONV
         AJx9fWTWHU+N8djSNdHsN6AajEm0lwJaaGZs65iPeB1lIfeCNXgg+7mkNqiVuOVLclpT
         2byZSl7takYFnjm9NMTgxi0TDYarR5shumGeFQTv6JTCE2Ym6yAz4XRQwkVN8kHn6qNU
         1ejGpo7juejW452ACH3zTc8b1QfDEBkECxK+OoI96CRKZhN+v7XRIKTyWOSMUzkLFAdq
         Le5uPcfkBm/LJtlwmckeacd6NDEY9G5OMmgZIy3Fg85AnrXHVm5ZraJ+oGOQzequbruQ
         ZjWg==
X-Gm-Message-State: AOAM532JTk4Hm07RPWaCv+C4GRwQORhSsjD9ccoeLYma2dZqKWYHY08C
        /ctUB4IDaJNEazF1sAR1KgfUXw==
X-Google-Smtp-Source: ABdhPJymzELD6H/RrVSkXF0UApF80RbqrMriC5qEG36lxHjhh0tFfDjthzRNG7rS5Tlrp0AgnnLy4w==
X-Received: by 2002:a5d:6c68:: with SMTP id r8mr11040893wrz.406.1643205270062;
        Wed, 26 Jan 2022 05:54:30 -0800 (PST)
Received: from srini-hackbox.lan (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
        by smtp.gmail.com with ESMTPSA id n15sm3356593wmr.26.2022.01.26.05.54.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jan 2022 05:54:29 -0800 (PST)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     robh+dt@kernel.org, gregkh@linuxfoundation.org
Cc:     devicetree@vger.kernel.org, ekangupt@qti.qualcomm.com,
        bkumar@qti.qualcomm.com, linux-kernel@vger.kernel.org,
        srini@kernel.org, bjorn.andersson@linaro.org,
        linux-arm-msm@vger.kernel.org, Jeya R <jeyr@codeaurora.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v3 04/12] dt-bindings: misc: add property to support non-secure DSP
Date:   Wed, 26 Jan 2022 13:52:56 +0000
Message-Id: <20220126135304.16340-5-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20220126135304.16340-1-srinivas.kandagatla@linaro.org>
References: <20220126135304.16340-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Jeya R <jeyr@codeaurora.org>

Add property to set DSP domain as non-secure.

ADSP/MDSP/SDSP are by default secured, where as CDSP can be either be
secured/unsecured.
non-secured Compute DSP would allow users to load unsigned process
and run hexagon instructions, but limiting access to secured hardware
within the DSP.

Based on this flag device nodes for secured and unsecured are created.

Signed-off-by: Jeya R <jeyr@codeaurora.org>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 Documentation/devicetree/bindings/misc/qcom,fastrpc.txt | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/misc/qcom,fastrpc.txt b/Documentation/devicetree/bindings/misc/qcom,fastrpc.txt
index 2a1827ab50d2..f9a01e2b4c96 100644
--- a/Documentation/devicetree/bindings/misc/qcom,fastrpc.txt
+++ b/Documentation/devicetree/bindings/misc/qcom,fastrpc.txt
@@ -17,6 +17,11 @@ other tasks.
 	Definition: should specify the dsp domain name this fastrpc
 	corresponds to. must be one of this: "adsp", "mdsp", "sdsp", "cdsp"
 
+- qcom,non-secure-domain:
+	Usage: required
+	Value type: <boolean>
+	Definition: Property to specify that dsp domain is non-secure.
+
 - #address-cells
 	Usage: required
 	Value type: <u32>
-- 
2.21.0

