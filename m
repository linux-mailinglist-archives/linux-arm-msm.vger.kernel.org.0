Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1F5A3108FD8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Nov 2019 15:25:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728069AbfKYOZe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 Nov 2019 09:25:34 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:39342 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728023AbfKYOZe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 Nov 2019 09:25:34 -0500
Received: by mail-lj1-f193.google.com with SMTP id e10so6937000ljj.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Nov 2019 06:25:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hIpnG6FWTeAa0vcijPGznoB/xSYwTutFCgvay272V/4=;
        b=aRSvRXMyf1ali3uyoFd85ct/hWNmON6aS2t4ePy7ewCLikYo6GSFj4eqgh3k3YWQyD
         +Z+v/7aGti2ReaQkAwIQtqy5cHn+lkyDcFSn6nNGn2mpLin7BBspQXp6wUZz01gqBI4r
         sJUcBwUBfdQnSDBoyjuLz0fbCOWoPdqGCp2UIEKQHlL2rNvs8YuE8BoWaipzUtTUfXRn
         yAAfWnkkUcz2QKzazCpqUBwuGofue+tky0yylv3DVX9ZO6uTnCRGs4gpVNJyZOmE1xPH
         +dgDGEHA8P1aOtRyDa3TMn8cz8gwHpBvQhbDT5jgNscpuVxKt6hbGpUolQuxg9fW6voc
         ml0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hIpnG6FWTeAa0vcijPGznoB/xSYwTutFCgvay272V/4=;
        b=c0HranwQ7++vS8Xq4SXfZNW84kIei15gKRYkylTAGeq9EApVm1oNNTBIlA8RJZo2zp
         PZoXKUV+kmhx17Eo4kxQi7nzGSz10mtYo1hqVogZIINwqMXykngV77s320iAi1azxpkT
         Kx69+wN08GG9bH15XtDq7lG01i/MOQAxnwSb+mGoTCteeZaOpKXYWklEUHOqujErmiJz
         LTI4KFy5uXj76/H3LZU+iq/sd8PAz0nHD0tKt5P5tt3KJxxnopwLBCyvY6w5spU/telH
         /DNQgvROKKhx1CCLx1YtlN9quDIeXzjEplH5LeuekDBYWsxrmoV8gO52Ax4Y4KeFpwDI
         /k6Q==
X-Gm-Message-State: APjAAAWGgHkHFyOzdpdCqRoB2iFVxqWBgA0DPpR46FN2rj+wOw4LmkG8
        xx6fF8iDqyQxBshdywuyj6f212bchnk8og==
X-Google-Smtp-Source: APXvYqwa2KM4Dz+pKU7jcg7FzJdbHl2V1ER/pVfnPAE1CfaZFiYc92nFeRawfD1vx0nZUw2ZO66dqA==
X-Received: by 2002:a2e:b537:: with SMTP id z23mr22760453ljm.129.1574691932342;
        Mon, 25 Nov 2019 06:25:32 -0800 (PST)
Received: from centauri.lan (ua-84-217-220-205.bbcust.telenor.se. [84.217.220.205])
        by smtp.gmail.com with ESMTPSA id 15sm4016640ljq.62.2019.11.25.06.25.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2019 06:25:31 -0800 (PST)
From:   Niklas Cassel <niklas.cassel@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, amit.kucheria@linaro.org,
        Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>,
        Niklas Cassel <niklas.cassel@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/5] arm64: dts: qcom: qcs404: Add the clocks for APCS mux/divider
Date:   Mon, 25 Nov 2019 15:25:08 +0100
Message-Id: <20191125142511.681149-4-niklas.cassel@linaro.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191125142511.681149-1-niklas.cassel@linaro.org>
References: <20191125142511.681149-1-niklas.cassel@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>

Specify the clocks that feed the APCS mux/divider instead of using
default hardcoded values in the source code.

Co-developed-by: Niklas Cassel <niklas.cassel@linaro.org>
Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>
Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
Changes since v1:
-Swapped order of "pll" and "aux" clocks, in order to not break DT
backwards compatibility. (In case no clock-names are given, "pll" still
has to be the first clock).

 arch/arm64/boot/dts/qcom/qcs404.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs404.dtsi b/arch/arm64/boot/dts/qcom/qcs404.dtsi
index 78065fbb3626..ee5ecf413664 100644
--- a/arch/arm64/boot/dts/qcom/qcs404.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404.dtsi
@@ -902,6 +902,9 @@
 			compatible = "qcom,qcs404-apcs-apps-global", "syscon";
 			reg = <0x0b011000 0x1000>;
 			#mbox-cells = <1>;
+			clocks = <&apcs_hfpll>, <&gcc GCC_GPLL0_AO_OUT_MAIN>;
+			clock-names = "pll", "aux";
+			#clock-cells = <0>;
 		};
 
 		apcs_hfpll: clock-controller@b016000 {
-- 
2.23.0

