Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F146E46A01B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Dec 2021 16:55:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1443069AbhLFP5t (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Dec 2021 10:57:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1388278AbhLFPy5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Dec 2021 10:54:57 -0500
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 920B3C07E5E9
        for <linux-arm-msm@vger.kernel.org>; Mon,  6 Dec 2021 07:40:09 -0800 (PST)
Received: by mail-wr1-x42c.google.com with SMTP id u17so15969543wrt.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Dec 2021 07:40:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2GJDE2PlAe1SK4CWIqaNsGRDv9Fy2sK0QymkxrkRl9Q=;
        b=vqXtM8dac/0SlC/DS4sp1pnEAS2lR73/xsVfG2VZt9Om7gEpBQLNKXRK6eMb4nN0vw
         LI3VSmH7pqLRbW2sGBQ7jTT7Te8C3KGvPp+lsXr/Ku5kE/KDhB6C8a7kQbcQJxEQ0yLP
         763BrPSx/gYz+nVXLPX5yQ8xWZt7iQ5BxW7toKejEAFGFzHm7MHv3JAJ5rk6IZMNeXiw
         kbeiYgcXRc5LLZi8MjzDjOcGsJfc7cScQ+ZdSNlJTdD1wfSY4DdiqrGEniQGNjJ+VhVq
         v5aqIRzZ0qkoU55gyfWZIs8WZPTJ3UAdaN4CkxbUZPlWiuInsOGrHjM3ZEoZ3hTo9qLu
         lYqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2GJDE2PlAe1SK4CWIqaNsGRDv9Fy2sK0QymkxrkRl9Q=;
        b=almGgwRHgiXJZy10WGZRRwuZIL8eTqSHSpSljvqa2vfcDfvBNHkF2ZwVQSNXbRqXJZ
         oDv02JHJsExR0vuKtpH/kV0Q23bdNCdZwXLClmgy955CUn3GkkpEzIwbYrRCek9CWk3n
         ngbllytH3gARFWHAuSFQ0JpUhvKCYL4FItc/6vUpyZyOsPj7tRbQRQGkhzoFs7XDLznY
         WtxsGCTEjeqGms7Rqg62DnZQZlDNY13qWkUiWYU36+NXJnnEua4fWFO8bXWy9ZDk60Gu
         dEJbDnCEdxzI46g5B7CiQkeJIxw9qPqjO/Bv8B4ddT7cB0wypRzUFrxxaxH9xcgrRvzE
         IS2w==
X-Gm-Message-State: AOAM5339FCjLag0sK1mHg6P89a2v8rZbNP/80cvAuegwbo19EPdmzQAy
        zvdu9oQyr42vbWjN3x/7nz1xew==
X-Google-Smtp-Source: ABdhPJyATexF8UtrBdaev8nChUE8RNqxgsjAWoeHGQnhc+vMpNPzXPUV3Ql+fETfplfbig6ujPTsbg==
X-Received: by 2002:a05:6000:11c3:: with SMTP id i3mr43243273wrx.426.1638805208160;
        Mon, 06 Dec 2021 07:40:08 -0800 (PST)
Received: from xps7590.. (freifunk-gw.bsa1-cpe1.syseleven.net. [176.74.57.43])
        by smtp.gmail.com with ESMTPSA id g13sm15818962wrd.57.2021.12.06.07.40.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Dec 2021 07:40:07 -0800 (PST)
From:   Robert Foss <robert.foss@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Mauro Carvalho <mchehab@kernel.org>
Cc:     Robert Foss <robert.foss@linaro.org>
Subject: [PATCH v4 2/2] arm64: dts: qcom: sdm845-db845c: Remove clock-lanes property from &camss node
Date:   Mon,  6 Dec 2021 16:40:03 +0100
Message-Id: <20211206154003.39892-3-robert.foss@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211206154003.39892-1-robert.foss@linaro.org>
References: <20211206154003.39892-1-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The clock-lanes property is no longer used as it is not programmable by
the CSIPHY hardware block of Qcom ISPs and should be removed.

Signed-off-by: Robert Foss <robert.foss@linaro.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
index 13f80a0b6faa..2cf4b932aee2 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
@@ -1125,7 +1125,6 @@ ports {
 		port@0 {
 			reg = <0>;
 			csiphy0_ep: endpoint {
-				clock-lanes = <7>;
 				data-lanes = <0 1 2 3>;
 				remote-endpoint = <&ov8856_ep>;
 			};
@@ -1166,7 +1165,6 @@ camera@10 {
 
 		port {
 			ov8856_ep: endpoint {
-				clock-lanes = <1>;
 				link-frequencies = /bits/ 64
 					<360000000 180000000>;
 				data-lanes = <1 2 3 4>;
@@ -1211,7 +1209,6 @@ camera@60 {
 
 		port {
 			ov7251_ep: endpoint {
-				clock-lanes = <1>;
 				data-lanes = <0 1>;
 //				remote-endpoint = <&csiphy3_ep>;
 			};
-- 
2.32.0

