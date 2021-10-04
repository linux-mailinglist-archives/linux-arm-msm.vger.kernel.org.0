Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66F66420AFC
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Oct 2021 14:39:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231575AbhJDMlV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Oct 2021 08:41:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231337AbhJDMlV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Oct 2021 08:41:21 -0400
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5116C061746
        for <linux-arm-msm@vger.kernel.org>; Mon,  4 Oct 2021 05:39:32 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id c4so10997651pls.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Oct 2021 05:39:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=O5PG0hNVQuZSE12+d9FlPhmW1OMlHH2PE3/HV0fc7js=;
        b=zCa4dJaDImMk57hpwlY9GYF+yCSBgkEg0Nfxc2802Dc7xtNm9hz7ulY7yZThQqqME1
         Bnt3L0bltsch7KTWHr6gTC/KLnF3cu/km6Z+KrK5k4LUoI394XgsRCGDY0dJ5N436Xkv
         8Lhc2OzBnQpn0ongyLpmY0L+L+c+eqQ+XCWBL0j+dZzjTrvcIbizkm4iqjgFolrTd2nY
         xpSuDFkEhZGGLjImKUxaMIhxaJO2TvR2pawcxX7xSV18ysxJOfv8jcrG2rJ9K6XZdjKs
         o8R8e/OD3bJu+65CFky6liCc48GBwVIklaM3DEgm29tPPxWNBPpoHRNwL2vOphVbCBLn
         Qv7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=O5PG0hNVQuZSE12+d9FlPhmW1OMlHH2PE3/HV0fc7js=;
        b=7JRRQ+3p75IVynVNUJC4+1RV3CuYrgvOkbbmyLU/cLV+39G/AVG+qY1fk6+v8HJOhW
         /leBPLOK8LMT5S/dhpWS1qGSWrCoO+cPKMBhqbq1GEq6B3mx8HWIWfjXgO8JVh6xjXRB
         NOmYLtkvpYUcT6FD0XNf8Znsfgb3alcMIDOMpRGfQXWOnmTT8dzuHOY+/tO2MavfXaDu
         ruCNX2MFo1teXRbafvLb01v4maA0yI+HB1EFQqC7q7I/anDYv6eWUvRVrg/kcBEkvKbP
         JIQFAzJoHheNOFm8d69SIdL07jwovDee8dv+AsbEp3Q8IYi4uYS1jPIZbV8OF+ILQRJM
         GTFw==
X-Gm-Message-State: AOAM53032uO6h1PbzyOam/94NJn9Knfdk6d6F8/kGeAGqEbBVSBGOWyF
        8Gtd2dGsbNAG5VFjxY49eFph
X-Google-Smtp-Source: ABdhPJyR0xmWPPEnJxvOpWnT5V1wOjU5KDQKOy3+IjK6Qes2PM2DjbcIn94b5dR4UkHCgqvwfXJaMw==
X-Received: by 2002:a17:902:6545:b0:13e:51ef:3ba with SMTP id d5-20020a170902654500b0013e51ef03bamr23252391pln.61.1633351172153;
        Mon, 04 Oct 2021 05:39:32 -0700 (PDT)
Received: from localhost.localdomain ([120.138.13.170])
        by smtp.gmail.com with ESMTPSA id b15sm14103036pgs.13.2021.10.04.05.39.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Oct 2021 05:39:31 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     miquel.raynal@bootlin.com
Cc:     linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH] MAINTAINERS: Add entry for Qualcomm NAND controller driver
Date:   Mon,  4 Oct 2021 18:09:26 +0530
Message-Id: <20211004123926.53462-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Since I maintain the dt-binding for this controller, I'm stepping
forward to maintain the driver also.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2c9165e4e816..8cfd8ae9e69e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15580,6 +15580,14 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/regulator/vqmmc-ipq4019-regulator.yaml
 F:	drivers/regulator/vqmmc-ipq4019-regulator.c
 
+QUALCOMM NAND CONTROLLER DRIVER
+M:	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
+L:	linux-mtd@lists.infradead.org
+L:	linux-arm-msm@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/mtd/qcom,nandc.yaml
+F:	drivers/mtd/nand/raw/qcom_nandc.c
+
 QUALCOMM RMNET DRIVER
 M:	Subash Abhinov Kasiviswanathan <subashab@codeaurora.org>
 M:	Sean Tranchetti <stranche@codeaurora.org>
-- 
2.25.1

