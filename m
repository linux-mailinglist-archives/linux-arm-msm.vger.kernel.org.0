Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 40BEC44E62
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2019 23:26:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728830AbfFMVZ6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Jun 2019 17:25:58 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:43252 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725747AbfFMVZ6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Jun 2019 17:25:58 -0400
Received: by mail-pf1-f194.google.com with SMTP id i189so42570pfg.10;
        Thu, 13 Jun 2019 14:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=pNCtTqN2On7Akbg5ZQ6dO9GyNd+lckTzvjUJWbNQ7ao=;
        b=ltqcn802Ex3XuXSSP4rMFFKbOgxOlyY3jVxZBqAhgKuqUR+9giZwJtOAI1swqfj+Dx
         DAdJKQcXqRXLTQg1URn8xrM5w+6jLhdNGiTctmz39W6pkuYBe4zo9A55yanxAZRXeBz9
         Jqsg21f8tNfY2qkuAQTID8OHeNWuXWOug8DN6gZzMPpVir3sdnP57ppCbJeXw9fgxwHd
         +W1CRWRFH4mhdeU3JUpUvAc2KVM5IXOobPNeyFbQNeZJf+Y/ntwtZNETUjLJ/hoK7xZg
         VmTYx+9t0whSZOra8SbrKEe40o4khLTNvrKAvcBkNjMa1kcknVB61sX+cE5denVWAx/1
         ukrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=pNCtTqN2On7Akbg5ZQ6dO9GyNd+lckTzvjUJWbNQ7ao=;
        b=XL3zUpGHAdntgAPXyVW2vxOrKLEL4jI6QvCEcREix7D1x/0w0A+QsdgIPGS0Hd2cAB
         xxLG6W0/j3vTprVa5aFBaBPX/T0fyKUOtz9Eh3KzlBNQFzTpRCLXgtQACooWD+0gwKY4
         wLYMmaMb9xlGA/Gq1y5FVRV4RMxjUhyOs0bi1oGbsyFnwpQ6z1cGbdfiPmFn6WIZZIcG
         VxJyae0++5vMHAzz5HcTQR61wlK1wNraadqTTe1bqq9AjtAxtBTiZ41fHExo4z/Tvo7O
         mNXTBoUbprL3JC53JqzBK3At8Aee2Aqmrjo/JhOPyQ2pTBiT1W5ihfZPK3gjLC1tg0k/
         +2kA==
X-Gm-Message-State: APjAAAUFibVUhjpcEzEMqJ1lQkNsXHzQ9J2KWjLeBjqfJPCl/LkZW+8u
        Jbz9tCy7+TyFyZ2M2YP8Q94=
X-Google-Smtp-Source: APXvYqwt9twTC6m+Pxzy3gFe8ns8PAY0zdvYz5HRUgjqtlBos3q9G4UqDjZ5YNPZ1CMTFCoe0NgC7w==
X-Received: by 2002:a63:2c02:: with SMTP id s2mr4088745pgs.173.1560461157673;
        Thu, 13 Jun 2019 14:25:57 -0700 (PDT)
Received: from aw-bldr-10.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id o13sm667887pfh.23.2019.06.13.14.25.56
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 13 Jun 2019 14:25:57 -0700 (PDT)
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
To:     lgirdwood@gmail.com, broonie@kernel.org
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        mark.rutland@arm.com, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: [PATCH v4 3/7] dt-bindings: qcom_spmi: Document PM8005 regulators
Date:   Thu, 13 Jun 2019 14:25:52 -0700
Message-Id: <20190613212553.10541-1-jeffrey.l.hugo@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190613212436.6940-1-jeffrey.l.hugo@gmail.com>
References: <20190613212436.6940-1-jeffrey.l.hugo@gmail.com>
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

