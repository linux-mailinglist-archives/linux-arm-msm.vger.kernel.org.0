Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 897EC3109A0
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Feb 2021 11:57:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231855AbhBEKzk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 Feb 2021 05:55:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231821AbhBEKxa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 Feb 2021 05:53:30 -0500
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 461CBC0698DC
        for <linux-arm-msm@vger.kernel.org>; Fri,  5 Feb 2021 02:45:25 -0800 (PST)
Received: by mail-wr1-x433.google.com with SMTP id c12so7119530wrc.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Feb 2021 02:45:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fUGwtlmgXSNtLs4jeYoyMy0OUjwWufxEelxvIP0w1pA=;
        b=Fwx1ouohDc1t1SRm9bp+trJ4XgAH3o7xsafjqV8b3Z8BSs756P7sNCFXezdm+oIYEI
         1LzOAiYEi+yiOCxpqno4ZeEsNAqi+Nh/dwKU78S6R1oCjsivIrNO8HgfsoT9pJ1OjJ7e
         JKEqgDe4l5a1f7yfz3WXlAd8CDZa0LzSO523xHV68YrOnqQSmp2OD94YDz6AusIsE0ce
         EAAdKhmGiJ+HbqbjZl7IuyRb6CHTVG2iu6e/4uEBiY/PtLkgw4ODHU25u96w7GhlYM1i
         ixzulomlgu5/0ZZkIVlEpymV1wlpo84KNks75nbunUNfvMxrEU4xO+otpS/e2ndtUn7D
         Dzgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fUGwtlmgXSNtLs4jeYoyMy0OUjwWufxEelxvIP0w1pA=;
        b=Xympm5Rf9AlJOEObOxG5rI/7wY7KgAP2PzW44wreeqOEuSUl6WZrHHOL5uRkdmHaRw
         BdFfCQruirFdzKYD7IpBdChsNKyESXP1gazhokUNLpfr9aoaWEWfYFoqKO7R2GQ5Y0/f
         E1PsEEIw8cUJzHvKrTw3pavGOYW4hQCZOSOxXV18rfImZwRKYGFJ6rLvyp5LcezzjmHD
         1/r4HvlF0Q0cdbFSdDOwmRI/6Ul6x6rmHJbU9O1aNx/Pdsv+LubMJNG8XJKHyrIbz1Gm
         3OrZpXJl+fCcYy7FWq5K7LhT9THC/2nohZFybDUuzy3iHfO0uBICityMRHXqifqeLWlk
         XvVw==
X-Gm-Message-State: AOAM531M70PLBXX4NeNNvVz3eZ/H1+MzCkP8qSjsHxidUc1e9sA3T8cL
        bBDAxR2uyrTDYMv/ua1++mgZUw==
X-Google-Smtp-Source: ABdhPJwTcctxZeQ/VmfTFSbXLstzOjpQA92T6jyVM+woDgkju33ipwaN46VApTeLxaZTphfjXZb1Tw==
X-Received: by 2002:a5d:6305:: with SMTP id i5mr4270526wru.314.1612521924035;
        Fri, 05 Feb 2021 02:45:24 -0800 (PST)
Received: from localhost.localdomain ([2a02:2450:102f:d6a:38fd:e0db:ea01:afc8])
        by smtp.gmail.com with ESMTPSA id u4sm11300233wrr.37.2021.02.05.02.45.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Feb 2021 02:45:23 -0800 (PST)
From:   Robert Foss <robert.foss@linaro.org>
To:     robert.foss@linaro.org, todor.too@gmail.com, agross@kernel.org,
        bjorn.andersson@linaro.org, mchehab@kernel.org, robh+dt@kernel.org,
        angelogioacchino.delregno@somainline.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Andrey Konovalov <andrey.konovalov@linaro.org>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Azam Sadiq Pasha Kapatrala Syed <akapatra@quicinc.com>,
        Sarvesh Sridutt <Sarvesh.Sridutt@smartwirelesscompute.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jonathan Marek <jonathan@marek.ca>
Subject: [PATCH v4 18/22] MAINTAINERS: Change CAMSS documentation to use dtschema bindings
Date:   Fri,  5 Feb 2021 11:44:10 +0100
Message-Id: <20210205104414.299732-19-robert.foss@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210205104414.299732-1-robert.foss@linaro.org>
References: <20210205104414.299732-1-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Due to the complexity of describing multiple hardware generations
in one document, switch to using separate dt-bindings.

Signed-off-by: Robert Foss <robert.foss@linaro.org>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index cdf1556c6007..7c5a494d9113 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14686,7 +14686,7 @@ M:	Todor Tomov <todor.too@gmail.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	Documentation/admin-guide/media/qcom_camss.rst
-F:	Documentation/devicetree/bindings/media/qcom,camss.txt
+F:	Documentation/devicetree/bindings/media/*camss*
 F:	drivers/media/platform/qcom/camss/
 
 QUALCOMM CORE POWER REDUCTION (CPR) AVS DRIVER
-- 
2.27.0

