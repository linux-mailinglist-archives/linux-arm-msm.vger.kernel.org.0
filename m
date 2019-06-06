Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 43AE937CA9
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2019 20:51:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727510AbfFFSvg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Jun 2019 14:51:36 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:40748 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727427AbfFFSvg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Jun 2019 14:51:36 -0400
Received: by mail-pf1-f195.google.com with SMTP id u17so2052846pfn.7;
        Thu, 06 Jun 2019 11:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=pNCtTqN2On7Akbg5ZQ6dO9GyNd+lckTzvjUJWbNQ7ao=;
        b=iEbduDhstBDjTyI4rp63Yu1sZPHPubL7K4/iDKZ2o2kWzevD6k7kuuOrbSZ7BQswS2
         PfhgN1A0zJCTaRtW4R8KwWWjVLPxgpnZbmg1L6JZoaZPCWUPTvhr/2YBatfth2yRydFe
         bTUR17pxdN8hm/j/YokCGYVc0yLpuZ3AEl+pUEAboHAVtA12r3x6y3E7rp4b3MEuJ5MS
         ObP9oZ6gX0j+0Via8H5fsbl7DV0ADWaEInTH17pEa3pl4cpidM0dc2QCAzP85WMFYAS7
         PsmSDgPaKGQUdKhZZtswj45YL8KmYrSdVVCL9QaWCyqYL+0pXqT6C+AppPh0Q14RmaDJ
         FFCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=pNCtTqN2On7Akbg5ZQ6dO9GyNd+lckTzvjUJWbNQ7ao=;
        b=cP1wKCGfOz0PrRSBdaQoS9LNjrjfr9YXFlGPjSnthbkjcWFN5h4TkY0wy2St3090zL
         qXW0Kv0s6A/HzqtupxTdrOtxgcwUdz5W+85fh4nafvxARjxTnhuPvLZaZhL2TnrKEol5
         +vFkXOPj8bW1NjcQh/wDubnrktXOPR8JpWLaxhfuNiXi139vMJ3IhXPu4JTGboU67woZ
         r43Pdw1Upp0RyLkDOIaCFaw4OkRmFb+vc653J03fmnSDFNk1Q9QaCrEFgmjwftC8EOS+
         I2qQWBFpiqGO7dmczswvFIVzXT7hll0e7EhfkalydMuPSwnVO9+jMVcE9WRc7l9/Q5fP
         c9tA==
X-Gm-Message-State: APjAAAV6AgSRkbr1KoQ37g9swI97Jeu5ZOdLBEKGUt33YA0wIe5g8Jan
        eK5VH3/2LKX6SJ7AR0yrhYI=
X-Google-Smtp-Source: APXvYqykKE3u5CfAfq7wkYUPGn6QRbPZ2M8NLGZZpH3od917WZ0KbK+lg5kCbPPnhqZOk4kDpBKuHA==
X-Received: by 2002:a63:6c83:: with SMTP id h125mr34482pgc.86.1559847095305;
        Thu, 06 Jun 2019 11:51:35 -0700 (PDT)
Received: from aw-bldr-10.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id z18sm2457449pgh.88.2019.06.06.11.51.33
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 06 Jun 2019 11:51:34 -0700 (PDT)
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
To:     lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com
Cc:     agross@kernel.org, david.brown@linaro.org,
        bjorn.andersson@linaro.org, jorge.ramirez-ortiz@linaro.org,
        niklas.cassel@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: [PATCH v2 3/7] dt-bindings: qcom_spmi: Document PM8005 regulators
Date:   Thu,  6 Jun 2019 11:50:09 -0700
Message-Id: <20190606185009.39684-1-jeffrey.l.hugo@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190606184842.39484-1-jeffrey.l.hugo@gmail.com>
References: <20190606184842.39484-1-jeffrey.l.hugo@gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Document the dt bindings for the PM8005 regulators which are usually used
for VDD of standalone blocks on a SoC like the GPU.

Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 .../devicetree/bindings/regulator/qcom,spmi-regulator.txt     | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/qcom,spmi-regulator.txt b/Documentation/devicetree/bindings/regulator/qcom,spmi-regulator.txt
index 406f2e570c50..ba94bc2d407a 100644
--- a/Documentation/devicetree/bindings/regulator/qcom,spmi-regulator.txt
+++ b/Documentation/devicetree/bindings/regulator/qcom,spmi-regulator.txt
@@ -4,6 +4,7 @@ Qualcomm SPMI Regulators
 	Usage: required
 	Value type: <string>
 	Definition: must be one of:
+			"qcom,pm8005-regulators"
 			"qcom,pm8841-regulators"
 			"qcom,pm8916-regulators"
 			"qcom,pm8941-regulators"
@@ -120,6 +121,9 @@ The regulator node houses sub-nodes for each regulator within the device. Each
 sub-node is identified using the node's name, with valid values listed for each
 of the PMICs below.
 
+pm8005:
+	s1, s2, s3, s4
+
 pm8841:
 	s1, s2, s3, s4, s5, s6, s7, s8
 
-- 
2.17.1

