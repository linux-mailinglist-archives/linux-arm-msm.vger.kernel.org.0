Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3220C11685D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2019 09:39:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727349AbfLIIjV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Dec 2019 03:39:21 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:37929 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727337AbfLIIjU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Dec 2019 03:39:20 -0500
Received: by mail-lj1-f195.google.com with SMTP id k8so14585514ljh.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Dec 2019 00:39:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=M6xBk2t3JSq6Gm+btMkUw0HvLbeKjwldK9lPc/9p6IU=;
        b=vFQKn9BvVVUUQ4Y9uusSgffYFjQKPOk2bHHTZorOpYzW/4FB9kB6JzD1XbXDirsL66
         NJhJcFSJBS9/9nXEbtC4h3cl0FQ9w3y0WHYi/zqUm06sd3JfJjSIfaZTPQfTVEvIL9Nx
         kwThT+MoV+y5uvtbP83Hoe1MPxjqQyz9E2MYnYL7N3U7Vt6onDSv+PlqO/P0Fxto37YB
         9zAywrd1pHIk68ouG2NpoiLA4GEz04/VVpDXnRTcMbH9d5jo4uQBhJcUBy8qFLL1JgVM
         rD/gDDq6nMW+NtJi+oVMZx/sL53+sIDMBMcspigWp//UCstQBEPwEJqCo+xH8CoXmcCQ
         Z5UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=M6xBk2t3JSq6Gm+btMkUw0HvLbeKjwldK9lPc/9p6IU=;
        b=as3CPuvdbcaMGgSiBfXCnU2u5jWhkJlJZtSMTXnNJFzS5KO7XSFwykSgUWUPG2VvKi
         vve6EP4rpA4SGSIL6MFj+eaFRZ16y7J7eVhKh2QB9G6EIRRPWUGchTbUL6NG02NeI6nQ
         7Dy119UVzl6uogZpL7ktSb/O8qREltkd7LSQBHsVIk0hDcZUVRLr2D/j7ETfUHdPZkl4
         161Opu+6YdIXx3JAqPmac4XBdO1Z/wW+W0HjNqu6/LFz2HEMug/YsXdIlXECNVZGmxOM
         GtZYbXRb+xvK6FoIPZvJagCiOtXa71IM8cKCgasLVPjxiFKJeyo+pIBv7gBPdVkAtL8b
         j4+g==
X-Gm-Message-State: APjAAAUh1HNsyIufMBXcjpn56BJDbjQ5JMrBSzL9m/GLtZAvykfIaKCC
        5G/HsaEHFG5M/9gMQ37c6kKAV7ynlyo=
X-Google-Smtp-Source: APXvYqyd/Hl/dcqTOW4HAPtSVFyeUDEZNQ0Muro85srrZE45Au6soKwyk1tCfVT095Stl7QIjLEjvw==
X-Received: by 2002:a2e:844e:: with SMTP id u14mr12502198ljh.183.1575880758682;
        Mon, 09 Dec 2019 00:39:18 -0800 (PST)
Received: from localhost.localdomain ([37.157.136.193])
        by smtp.gmail.com with ESMTPSA id r26sm10438971lfm.82.2019.12.09.00.39.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2019 00:39:18 -0800 (PST)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Vikash Garodia <vgarodia@codeaurora.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH 4/6] dt-bindings: media: venus: describe sdm845 with optional pmdomains
Date:   Mon,  9 Dec 2019 10:38:22 +0200
Message-Id: <20191209083824.806-5-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191209083824.806-1-stanimir.varbanov@linaro.org>
References: <20191209083824.806-1-stanimir.varbanov@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Describe an optional DT binding for sdm845 with power-domain-names
and clocks in Venus DT node. After that the binding for sdm845 will
have two options, the first will be to describe vcodec clocks and
pmdomains in (encoder and decoder) subnodes and the second will be
to describe vcodec clocks and pmdomains in the Venus DT node
(the parent). Both option will be handled in driver, and the second
one will give an opportunity to the driver to dynamically assign
vcodec pipelines for every given instance depending on its load.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 .../devicetree/bindings/media/qcom,venus.txt  | 22 ++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,venus.txt b/Documentation/devicetree/bindings/media/qcom,venus.txt
index b602c4c025e7..69a104fcb8eb 100644
--- a/Documentation/devicetree/bindings/media/qcom,venus.txt
+++ b/Documentation/devicetree/bindings/media/qcom,venus.txt
@@ -35,6 +35,21 @@
 		- "iface"	Video accelerator AHB clock
 		- "bus"		Video accelerator AXI clock
 		- "mbus"	Video MAXI clock
+- clock-names:
+	Usage: required for sdm845
+	Value type: <stringlist>
+	Definition: Should contain the following entries:
+		- "core"	Core video accelerator clock
+		- "iface"	Video accelerator AHB clock
+		- "bus"		Video accelerator AXI clock
+- clock-names:
+	Usage: optional for sdm845
+	Value type: <stringlist>
+	Definition: Should contain the following entries:
+		- "vcodec0_core"	Codec0 core clock
+		- "vcodec0_bus"		Codec0 AXI clock
+		- "vcodec1_core"	Codec1 core clock
+		- "vcoded1_bus"		Codec1 AXI clock
 - power-domains:
 	Usage: required
 	Value type: <prop-encoded-array>
@@ -72,7 +87,12 @@ Every of video-encoder or video-decoder subnode should have:
 	Value type: <stringlist>
 	Definition: Should contain the following entries:
 		- "core"	Subcore video accelerator clock
-
+- clock-names:
+	Usage: required for sdm845
+	Value type: <stringlist>
+	Definition: Should contain the following entries:
+		- "core"	Video codec accelerator clock
+		- "bus"		Video codec AXI clock
 - power-domains:
 	Usage: required for msm8996
 	Value type: <prop-encoded-array>
-- 
2.17.1

