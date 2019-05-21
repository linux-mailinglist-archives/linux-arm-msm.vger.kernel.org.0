Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 334FE25616
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 May 2019 18:52:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728331AbfEUQwt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 May 2019 12:52:49 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:40736 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727817AbfEUQwt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 May 2019 12:52:49 -0400
Received: by mail-pf1-f194.google.com with SMTP id u17so9364295pfn.7;
        Tue, 21 May 2019 09:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=JeUvMVRhy9vIr0JZflvoYIcTkrFHG6EX/sbMxC1B3uM=;
        b=ZEPBRveFusxaOBnSa6H2OIVW+rDhs9WE2OVNS0XVCsq1TXVDoHWmn/T62Vh6nphTGa
         JR/jpjqMBXw1nh3VZdC88IeweXihFJfk3nqLgiUSku1TlaPKPNy90ik+bBw25uw9yxKY
         WS0woDkoJMa8pWgZiAydOJoF1Lf7wFmBqmk4Z38bhqQBaZl/Okmv78XygxcYLHMaj/Je
         BwboOJ+99c14+uCOURizxnznBoTVQLXcSaZEbkIIYnsRCyg2MYmnyD6QUTuqVuFuvPjg
         R2FST+SHB2XnMJeWbAHMKA1DcO0WoaNXifY42kYdq6/MtraN2QGZXsSXTBIVtA1FgRPK
         OBmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=JeUvMVRhy9vIr0JZflvoYIcTkrFHG6EX/sbMxC1B3uM=;
        b=QJYwqf/V8csFaAWUASbmmlNLy2jpLNCfz3DvHkJyGZ7K43tXIIDi8rBLOXTbKF94y0
         M9lzGz4nUEVL3FnQYtIDYZQSMpXdHzk+qltlZYWbDuDOPuVjd1FPVJytcO47ylsK5TUg
         w9I/z+3ILz/pjy2H+2bMS83DKbc2IPbrRL7C6Gdc40vUNZUrqFz0WYPSXuv6qnmpxv25
         i9hRTYsmQNQyho5mydeTqHhb2zCHNhEtkUWFvCafSYMamvIq15zP053Pd1kEO2ocW66h
         l2LWLrkNy/HHdmoouAmGwM/RE+7RRoiE8khbY9cX2qgVXMkSLc+718QHmf309FI02n7g
         vLJw==
X-Gm-Message-State: APjAAAVXvTm+FZBAOX9+dzUMKeTAC6GtneviyRVnkBlk/MrDJfSLACwZ
        p3stEVVb9g+Op7N/gQYfNog=
X-Google-Smtp-Source: APXvYqyxinKHyXishFxH9q4peQBsdWJ1OMjFsvwHReAzjmzq9RIFKp94isUiYuz98Wvno2u5jfMZuQ==
X-Received: by 2002:aa7:951c:: with SMTP id b28mr69892172pfp.99.1558457568685;
        Tue, 21 May 2019 09:52:48 -0700 (PDT)
Received: from aw-bldr-10.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id q27sm35405170pfg.49.2019.05.21.09.52.47
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 21 May 2019 09:52:48 -0700 (PDT)
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
To:     lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com
Cc:     agross@kernel.org, david.brown@linaro.org,
        bjorn.andersson@linaro.org, jcrouse@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: [PATCH 1/3] dt-bindings: qcom_spmi: Document PM8005 regulators
Date:   Tue, 21 May 2019 09:52:44 -0700
Message-Id: <20190521165244.14321-1-jeffrey.l.hugo@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190521164932.14265-1-jeffrey.l.hugo@gmail.com>
References: <20190521164932.14265-1-jeffrey.l.hugo@gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Document the dt bindings for the PM8005 regulators which are usually used
for VDD of standalone blocks on a SoC like the GPU.

Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
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

