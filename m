Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 31F4743812
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2019 17:03:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732502AbfFMPD0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Jun 2019 11:03:26 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:47087 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732497AbfFMOX3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Jun 2019 10:23:29 -0400
Received: by mail-pg1-f194.google.com with SMTP id v9so9343598pgr.13;
        Thu, 13 Jun 2019 07:23:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=pNCtTqN2On7Akbg5ZQ6dO9GyNd+lckTzvjUJWbNQ7ao=;
        b=pyQh+pDwuqlH7DXpwGbPoT2vEms4GBLUW7uR/davwElTtSa3zlTj15dLXdL3fut9O0
         Q3XFICQ4rc/nBlC4bKDCSsQ4pZpo02SqEfHIRZxjZcvD5lr42bEKhDXqNp6LiqpaUIl7
         8jHliQPnUHPlMCxcIQ4VVhuweTanMOSGhUfkGTcw4yWVIPIXlmGrPZaxoFnmRd1kawP0
         qW52w9f+on7FtE88g5atUgAU3JN5nqhby2RKXNu049Pe4PgUMzjTvN8lI4UIJo+RifUL
         nJrtIct8flMvt4OFYPNkxgBlaYaR6Rs/YZn4J+8RB3yhy+BJj5QCz2ZnBinFTsB/kXBi
         lW4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=pNCtTqN2On7Akbg5ZQ6dO9GyNd+lckTzvjUJWbNQ7ao=;
        b=ow1TFgU/y5sGC7P0myNUn4cItWMzd0wP0Gp7iG22NeUMaS3hhmVmTBgjB6zZxKgj6X
         /hwBIu/UX1luyJjkhqdZE74ZCB/BE+R/4lry3ZnOv5Do3PxVQZ2zDQmMWCX1VttDotjr
         KZB0dRA0gfPKEB4S83Fr6OfQ/VwI4IpJvHZPjXc3mc8JkYDl/CsaOvHRa62yDZNe84Sq
         I4cFGwpe7fTkq4BrELdhLB/6BuFzEUyOS+FoX4G5R8sn+uzgk097+7+/UcY08gry7eF9
         wtRrJk+1eArM1kiUZbKNZDL3cBbl1cTF4B0Del0lj+ovmszw9FKcBC5WZyZtuCzi5nnS
         gYtA==
X-Gm-Message-State: APjAAAVKRdSASFE/ZwP/5ni4DaB9oP2+BLoXx5DznCK9seTq/XXwvHV4
        kMmZxhGdwYTMa3Ea7/vS5GH3HMpq
X-Google-Smtp-Source: APXvYqw98Hb1MaNj1VpzrW3gXbGPvQefh9VN4zQ2mmqK85pS6hrtPxfSsB7YVjaF0KSC1573v7ixQw==
X-Received: by 2002:a65:65c9:: with SMTP id y9mr31170526pgv.76.1560435809012;
        Thu, 13 Jun 2019 07:23:29 -0700 (PDT)
Received: from aw-bldr-10.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id m5sm129792pjl.24.2019.06.13.07.23.27
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 13 Jun 2019 07:23:28 -0700 (PDT)
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
To:     lgirdwood@gmail.com, broonie@kernel.org
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        mark.rutland@arm.com, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: [PATCH v3 3/7] dt-bindings: qcom_spmi: Document PM8005 regulators
Date:   Thu, 13 Jun 2019 07:23:25 -0700
Message-Id: <20190613142325.8831-1-jeffrey.l.hugo@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190613142157.8674-1-jeffrey.l.hugo@gmail.com>
References: <20190613142157.8674-1-jeffrey.l.hugo@gmail.com>
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

