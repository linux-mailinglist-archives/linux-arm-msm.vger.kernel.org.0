Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 70DEEEAEF5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Oct 2019 12:30:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726506AbfJaL37 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 31 Oct 2019 07:29:59 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:33217 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726462AbfJaL37 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 31 Oct 2019 07:29:59 -0400
Received: by mail-wr1-f68.google.com with SMTP id s1so5865788wro.0;
        Thu, 31 Oct 2019 04:29:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ro53YB+MKod/Y42OOMgHzLxbEZJXl+SagwYe7xZuvMo=;
        b=pa0y0BDfbi5Zscq0yZu1N18Y2EDGD7Rdpm3U4pMstfiv1MDH5GTX5wJqGhBhptglo+
         RwGkGc/nyMbfXU8PrCTtk8cHyJLnXSR285Zs2OXpINcS2GKZCGIjRothWjPN+zSeM3fW
         seo1T1QIrlhKNBb/3efE8JoR3ejrV/F2UNM4lPblBOGSxHUTDANmKJUwI7lgrKGQ4IGE
         HvZ62cKFB3uC46QM3zWxMWBMnxL9UuGcVRTk+f7XTEliXGZsjh8uTT+v5XKhYi+CcM3A
         BBvniP0QkINKaJkuvGhIAMIBLaWOpR4L4BnnlV6JaQZCXoKZG2/nr+8V6hrVRSgVhv3h
         J8xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ro53YB+MKod/Y42OOMgHzLxbEZJXl+SagwYe7xZuvMo=;
        b=GooJebXmOU4W3Q169h0UAIkuZhBqzv2cs5QBTq0iaiEJGEbgjEjwvEvw//j3cGZyKO
         sSwHqT1yqDn15zTiLA743Zl7mbCEcdDmp26N9r1/bZd1Ri4ZUeykMYy6zx60rMMqr7RA
         7UJhJ2N8kUqOUQzhe/y6Zioa20te07IQZVNjz+ESNGdRUP+Zc2b9HBZLqpwyOfn79elA
         ohTrIq1b4NgBLBb4joC7ATR24HxlemdBNu0iqaXhx+WxnqsAyzPaOFzQwyuAAymABO1b
         GdDddZME6/fjbw4VKPX1ra3E71y4gF5836Vs0vm3Gn9px9nOHWsjxK1RAaoBzfJmAmDU
         30Jw==
X-Gm-Message-State: APjAAAUbKbINu1BRhbWW2xEXL8Cofm4XMdL2hBYFqMQ54meX3FsfeaSh
        LFRXz1mW7LvpJ1mWXSlfz6sB5MJ3Cj4=
X-Google-Smtp-Source: APXvYqw8evn6JduYCXCmfwMv/bQgxouPphyHjCR7CCpd1qVlYHDdoH2YSXDpXVl6Dk8JYcug3q1Jiw==
X-Received: by 2002:adf:9481:: with SMTP id 1mr5095177wrr.77.1572521396878;
        Thu, 31 Oct 2019 04:29:56 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([93.51.16.173])
        by smtp.gmail.com with ESMTPSA id r13sm4563586wra.74.2019.10.31.04.29.56
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 31 Oct 2019 04:29:56 -0700 (PDT)
From:   kholk11@gmail.com
To:     linux-arm-msm@vger.kernel.org
Cc:     kholk11@gmail.com, marijns95@gmail.com, agross@kernel.org,
        mturquette@baylibre.com, bjorn.andersson@linaro.org,
        sboyd@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 2/2] dt-bindings: clock: rpmcc: Document msm8976 compatible
Date:   Thu, 31 Oct 2019 12:29:51 +0100
Message-Id: <20191031112951.35850-3-kholk11@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191031112951.35850-1-kholk11@gmail.com>
References: <20191031112951.35850-1-kholk11@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: AngeloGioacchino Del Regno <kholk11@gmail.com>

Support for MSM8976 was added to the clk-smd-rpm driver: let's
document here the newly added compatible string.

Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
---
 Documentation/devicetree/bindings/clock/qcom,rpmcc.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmcc.txt b/Documentation/devicetree/bindings/clock/qcom,rpmcc.txt
index 944719bd586f..356cabcd844d 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmcc.txt
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmcc.txt
@@ -14,6 +14,7 @@ Required properties :
 			"qcom,rpmcc-apq8060", "qcom,rpmcc"
 			"qcom,rpmcc-msm8916", "qcom,rpmcc"
 			"qcom,rpmcc-msm8974", "qcom,rpmcc"
+			"qcom,rpmcc-msm8976", "qcom,rpmcc"
 			"qcom,rpmcc-apq8064", "qcom,rpmcc"
 			"qcom,rpmcc-msm8996", "qcom,rpmcc"
 			"qcom,rpmcc-msm8998", "qcom,rpmcc"
-- 
2.21.0

