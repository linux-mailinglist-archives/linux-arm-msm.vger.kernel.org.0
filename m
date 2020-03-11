Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DFBF418193D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2020 14:09:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729556AbgCKNJb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Mar 2020 09:09:31 -0400
Received: from mail-wr1-f50.google.com ([209.85.221.50]:34292 "EHLO
        mail-wr1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729320AbgCKNJa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Mar 2020 09:09:30 -0400
Received: by mail-wr1-f50.google.com with SMTP id z15so2553026wrl.1;
        Wed, 11 Mar 2020 06:09:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ellU5pOp/2uHnz6yN3yDSPmzaJ54IVdYIlW3Apzu9Qs=;
        b=NTg7VaVEX6BOO5o/pOLHKcc4CuQbKwTLBNIC813vxD+3Nr7Mu9uAfTaDaXDsLOhoKu
         15ZwbZcc+pG0womJxWVgEtOfoxfiiSBXl+0rAtI2Rw+TtKovn0e+6byNGzlmTS2JgTfn
         hx+G6QVfMIed9yBbpkL83iSXSz3bGnygei4j8i/TLGw8wmHEqCy7FFpp3/M+KdRZ3OUq
         vC9UJ8mbxSsCMyBCCcJAhBOY8Lw4qEdsUqZ7JC1efdhjI9r0qlSow4Vr/BcMQZF+RPS6
         5NDf1+FT2vOvsLHed/jLxhuDAVaBjp/uounQFs7UBYuRtEeW2laEG5fgNPuEbmPXDB0a
         XryQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ellU5pOp/2uHnz6yN3yDSPmzaJ54IVdYIlW3Apzu9Qs=;
        b=mk9QlNoUWNwHAtgIsxqXWprvzEFhSw39uS+OorlQ01NCXEEDV2GBmb6ARi8fu1dwxd
         mJSurfTsahU1dXV8HhNgPUwSwIx2ZjmVJwrfyHf9Apm33N493vGmCeN5fwr8aB5R51mq
         tzXwT6/Q1kItvLL5u9+/5S9pCQVCwJCAhLmTlk7qmvl4mnVgwEKHi0A+onnVxoYq3Agj
         daudCHJ7ZyiMKQ0/dSiGCxVWZs8O4Ho2N66MQmKXG+FJi1Exe9TUWvb8m5zOPStmv3Mt
         0HXx3SLG/HAkGKBloozfhnRqtIs2aOqLsXetMo4QUFlXlMMnwBUeErcaYr0tXhA5f14r
         C8KA==
X-Gm-Message-State: ANhLgQ2yiBpiUzX1e8OGIksmATyrv30KfrowkopfVSUtqMizjljs4UGL
        LBewLT88kkcueRAf3+LdHe4=
X-Google-Smtp-Source: ADFU+vsppto8aqMNjL7HDJF95tTaGEFOwBm/yhxQzldNMaHKoCfXRE0mP4YL2et+imj3n+2XMNt9lg==
X-Received: by 2002:adf:fa09:: with SMTP id m9mr4400451wrr.113.1583932168573;
        Wed, 11 Mar 2020 06:09:28 -0700 (PDT)
Received: from Ansuel-XPS.localdomain (93-39-149-95.ip76.fastwebnet.it. [93.39.149.95])
        by smtp.googlemail.com with ESMTPSA id f187sm4984036wme.31.2020.03.11.06.09.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2020 06:09:28 -0700 (PDT)
From:   Ansuel Smith <ansuelsmth@gmail.com>
To:     agross@kernel.org
Cc:     Ansuel Smith <ansuelsmth@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] devicetree: bindings: firmware: add ipq806x to qcom_scm
Date:   Wed, 11 Mar 2020 14:09:18 +0100
Message-Id: <20200311130918.753-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200311130918.753-1-ansuelsmth@gmail.com>
References: <20200311130918.753-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add ipq806x to compatible list in qcom_scm Documentation

Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
---
 Documentation/devicetree/bindings/firmware/qcom,scm.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.txt b/Documentation/devicetree/bindings/firmware/qcom,scm.txt
index 3f29ea04b5fe..354b448fc0c3 100644
--- a/Documentation/devicetree/bindings/firmware/qcom,scm.txt
+++ b/Documentation/devicetree/bindings/firmware/qcom,scm.txt
@@ -10,6 +10,7 @@ Required properties:
  * "qcom,scm-apq8064"
  * "qcom,scm-apq8084"
  * "qcom,scm-ipq4019"
+ * "qcom,scm-ipq806x"
  * "qcom,scm-msm8660"
  * "qcom,scm-msm8916"
  * "qcom,scm-msm8960"
-- 
2.25.0

