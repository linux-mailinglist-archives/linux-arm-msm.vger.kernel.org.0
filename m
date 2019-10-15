Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ACAD3D734B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Oct 2019 12:32:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730182AbfJOKc2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Oct 2019 06:32:28 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:35144 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726736AbfJOKc1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Oct 2019 06:32:27 -0400
Received: by mail-wr1-f65.google.com with SMTP id v8so23196651wrt.2;
        Tue, 15 Oct 2019 03:32:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Hb1Yvl0/as5PLs4Q3Jw7L/tBFNfgfcQWaNt8zWD1s5o=;
        b=hTiKP3U00F9vC4bcMA8KHw1DriGIwQMGUfdgK6o10TQ59VmCS9VgynstbsY9o2Rnmo
         dYfyPfXKYELaDMituTYtSWoz5agL/NP0gGuC1zhKqw5iCiCX2hvtj36GBRxF/vs+QkiI
         nyWSKtO0lln577OC/SQXC3dhizhjhFPToUVTmGwSHmRbGyDcBD74sZLivCmUGCR7vLK2
         Kb7AhV4VKymqGIbMszhvOHyKlFJkMixmbecnYcoYQY8K4oqDvDQ8o0UQkV6tGjWJq/QY
         68SVBCmV7kH9RSd0R1p+AXma3Vs3AgI41eRGz+At8XJ2Ij8UD4Mw/aU+dPAWcqEUAevL
         5eUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Hb1Yvl0/as5PLs4Q3Jw7L/tBFNfgfcQWaNt8zWD1s5o=;
        b=porqmYlZhQBjr/sVAy1Dwm0XewaezInhfhStC2byLm5+t1DW4eyC8tGuYvDn2pjfCZ
         XLynzLF6u4oYHVRz/QXipWugsckqCC5gdRy/KyfgHVD1ez0yN7Gz21kGPl6geC6Rte4I
         zXlBryXEv+kGLma+sSGm0rlYiuun4zjMs9Sil5u2yB1ZtAXQCzNcJi22xzGa/BNUVCiS
         UJY2A/sTFxn9CZG5VPcAHttFiA65VhZp9TdrRgMT0t8UN9RN1sNL55/vqb8201jrBQZo
         3GNUXPA/d/7JsXdjiMD/4K0Sg2LyOUHZR2q94sD9F6OZCCBiok5FnJ4C8RUMtmbjrIuQ
         R8Xw==
X-Gm-Message-State: APjAAAUoSDwz0TBn2h+XzU19kGH8C/4La1p68JMoZLTl0bO5IOqYVppl
        yukbF8gRVIbG8b3Z/jfPye6CZTjrQ8FiOg==
X-Google-Smtp-Source: APXvYqyjw2qX5Pfmjf2ymG2KIWmxr8cTyNzEqn+4CGmgRMGmdH/2knxgTH/8LnvClFCb+t6EA3c+/w==
X-Received: by 2002:adf:dbce:: with SMTP id e14mr17255323wrj.49.1571135545174;
        Tue, 15 Oct 2019 03:32:25 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([93.51.16.173])
        by smtp.gmail.com with ESMTPSA id c6sm22751699wrm.71.2019.10.15.03.32.24
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 15 Oct 2019 03:32:24 -0700 (PDT)
From:   kholk11@gmail.com
To:     linux-arm-msm@vger.kernel.org
Cc:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        mark.rutland@arm.com, robh+dt@kernel.org, sboyd@kernel.org,
        mturquette@baylibre.com, agross@kernel.org,
        bjorn.andersson@linaro.org, marijns95@gmail.com,
        AngeloGioacchino Del Regno <kholk11@gmail.com>
Subject: [PATCH v2 2/2] dt-bindings: clock: Document MSM8976 gcc compatible
Date:   Tue, 15 Oct 2019 12:32:21 +0200
Message-Id: <20191015103221.51345-3-kholk11@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191015103221.51345-1-kholk11@gmail.com>
References: <20191015103221.51345-1-kholk11@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: AngeloGioacchino Del Regno <kholk11@gmail.com>

Document the Global Clock Controller driver (gcc-msm8976)
compatible string.
This driver is valid for MSM8976, MSM8956 and APQ variants.

Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
---
 Documentation/devicetree/bindings/clock/qcom,gcc.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc.txt b/Documentation/devicetree/bindings/clock/qcom,gcc.txt
index d14362ad4132..565bba5df298 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc.txt
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc.txt
@@ -15,6 +15,7 @@ Required properties :
 			"qcom,gcc-msm8974"
 			"qcom,gcc-msm8974pro"
 			"qcom,gcc-msm8974pro-ac"
+			"qcom,gcc-msm8976"
 			"qcom,gcc-msm8994"
 			"qcom,gcc-msm8996"
 			"qcom,gcc-msm8998"
-- 
2.21.0

