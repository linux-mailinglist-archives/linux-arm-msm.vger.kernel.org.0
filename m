Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C8CDD180597
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2020 18:55:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726437AbgCJRzA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Mar 2020 13:55:00 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:46362 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726415AbgCJRzA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Mar 2020 13:55:00 -0400
Received: by mail-wr1-f65.google.com with SMTP id n15so17012980wrw.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2020 10:55:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Gy4Jfc/467vUAWjAYvthLE4X5RpTfeYf5bfEh9qniiM=;
        b=HGxEsuFHeApKS0eZBh8GANvVORFyKOLh3yKmbKzjt025Aoa89mHj8dVrAh6tc5Xrgr
         xFMhdg9KyAyBIeJyGYUWA+Jwh/6dGJHNUPgayN8CSiIpBRyxDjFHnxbUngqIcR8PS9fe
         PRhC5B7QQpuVtBgB6N2J09o+gXciLMZoEw93LJMfAF5QR2s48IuX30jWYunRAl+blYqL
         kte2+tv2XwSCFBL/oSMTsARobCWmIIUiGg/N8t4gecUWE5RxnqFiCKrR/xmLClbMvddO
         h7mw/TBHlaLMeyqOyh8/f3jm6pnDRs9eXiW3ZGFczxtnfQ1Lwfr4QApRIw06lbn0+02e
         I0ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Gy4Jfc/467vUAWjAYvthLE4X5RpTfeYf5bfEh9qniiM=;
        b=reqbRi0KSlpohhxkA3wWHHhZyqBLaSqduGfVsNbpQN24PfI+rnOhqSiQkhPLfXp0Qy
         A+Ow4SXdVGFemdGpXM0l+8FNN7CXnATXbufLnNWH4E9ntBR0HXujvSFTzlSdR+djrghS
         +TIKq1Om/tK8Fkx4sw+g6WxEedmriet3jNi2/ppaJYCuB/H8saK5wlvjdnULG7amEeKa
         MU+cai3AMOQof9X0Udy0C25U1tuwOlYjdt6N/rJVm+FTQ2t2LEJmEGUxF3xMIuR8Z7zP
         WdiviLubAlylyweCW5NibPziN+I1QK4Qd49mv4eLoUYqMKLU4wFllVC7EdlIfxcod75Y
         /rQg==
X-Gm-Message-State: ANhLgQ0AqzvYuZdftH9RfIcoKnhvYhOyod5g19krEF7KrBZHZul1o2GF
        9rPYW8JCrZl+5p9Do+Q1zbcjxQ==
X-Google-Smtp-Source: ADFU+vsQNzOzfQJiP+Eu6WEj8jIWHGeLJOYbvDsVed9KMgdL6fzDBvRWSGOnIj6uzIin3OUaJDweNA==
X-Received: by 2002:a5d:6544:: with SMTP id z4mr9934573wrv.298.1583862899458;
        Tue, 10 Mar 2020 10:54:59 -0700 (PDT)
Received: from srini-hackbox.lan (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
        by smtp.gmail.com with ESMTPSA id w1sm4671030wmc.11.2020.03.10.10.54.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2020 10:54:58 -0700 (PDT)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     bjorn.andersson@linaro.org, agross@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH] arm64: dts: msm8916: Add fastrpc node
Date:   Tue, 10 Mar 2020 17:54:52 +0000
Message-Id: <20200310175452.7503-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add fastrpc device node for adsp with one compute bank.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8916.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index bef1a66334c3..a7cd8f87df97 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -1157,6 +1157,19 @@
 				qcom,remote-pid = <1>;
 
 				label = "hexagon";
+				fastrpc {
+					compatible = "qcom,fastrpc";
+					qcom,smd-channels = "fastrpcsmd-apps-dsp";
+					label = "adsp";
+
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					cb@1{
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <1>;
+					};
+				};
 			};
 		};
 
-- 
2.21.0

