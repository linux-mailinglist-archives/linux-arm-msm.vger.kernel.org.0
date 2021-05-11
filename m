Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B210B37ADF3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 May 2021 20:08:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232050AbhEKSJf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 May 2021 14:09:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232125AbhEKSJ1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 May 2021 14:09:27 -0400
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com [IPv6:2607:f8b0:4864:20::732])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 416CAC061349
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 May 2021 11:08:20 -0700 (PDT)
Received: by mail-qk1-x732.google.com with SMTP id 197so19646300qkl.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 May 2021 11:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZPyfLXfAuFVtdULxwP4Td4sMymsB5106H47fAEp+QH8=;
        b=zWqwgWpJCjw7WKmZ3oqortSwz3uz133jwoi5Cuk2zdcaxJU2LH/Cv4WB3OdImE6rpt
         knHRbRwCcFlacyCr117pB2bq9R/IGtvQiaeDjlU/GfrjrczWc4jXe1FdlnDygTAsKpZ5
         b4bEuggLKHnY8bbMgtZ6cZJgqmw05kj9LBAx1PzwoVuhgQt/rb0Uwd6UaDyoqYwRT9ml
         sTbFOZZZ9lwL6aQWo3Be0DxXVd3STEFAieWYzIWTF63oro4WtMVVvUNtK3kxRg+Uxpfb
         Fwbcq8eSdzpVYl4Qvn35oFz2OVg0kLeR7uO8eIlZXTiz7aKqahCOqmWe8B8nuOfpPhVa
         cUgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZPyfLXfAuFVtdULxwP4Td4sMymsB5106H47fAEp+QH8=;
        b=euD8qr4YPeITyqC1W3vnE0b7whodV6wcGrsC7MxlNV9lninAsD3rlmIkG3fa8P516u
         VuzQmjWCkMiAwvcNUuZBRfGDKUQepcG2HwKWf0BSY6lUP0zd4+1w3hU2RE9ya+y1+Q1j
         pPNDdswToBaT33b9j5aUVAdZvqBRWo1SiqSNMB+Y8yE77IUxeBwB91c1LVkIrQ6cGmao
         mxlYDK7kkv3VmQqtCWax0K3ifaGs2cYY6sBch7PLk0IwCE8w3/7DSEdSNVd3iy2K+K6a
         r0pLjMhTpGsSio9ZC6Xle1qG6MCT5EexR+rGtwWjYW0AIbfq0Qx3AVjH+Vvb4zq3HSSj
         Qmbw==
X-Gm-Message-State: AOAM533SAAT+7CweViU72dRnxC+vQja3uN1pDjG3+gWJu859NLgiskvn
        CFFNV4hanAp0tj8JKvSXZDEFB/CoLm6iBmR3
X-Google-Smtp-Source: ABdhPJyUYlQ1lNhxL3Whnu1SGV39Fue1yyCO+w66YFqJ29+5d5GET9aFjejSuvRp/FJxQTu9i4Y2JQ==
X-Received: by 2002:a37:8403:: with SMTP id g3mr19476744qkd.469.1620756499128;
        Tue, 11 May 2021 11:08:19 -0700 (PDT)
Received: from localhost.localdomain (modemcable068.184-131-66.mc.videotron.ca. [66.131.184.68])
        by smtp.gmail.com with ESMTPSA id g5sm17104476qtm.2.2021.05.11.11.08.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 May 2021 11:08:18 -0700 (PDT)
From:   Jonathan Marek <jonathan@marek.ca>
To:     linux-arm-msm@vger.kernel.org
Cc:     robert.foss@linaro.org, andrey.konovalov@linaro.org,
        Todor Tomov <todor.too@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org (open list:QUALCOMM CAMERA SUBSYSTEM DRIVER),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 10/17] media: camss: remove vdda-csiN from sdm845 resources
Date:   Tue, 11 May 2021 14:07:17 -0400
Message-Id: <20210511180728.23781-11-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20210511180728.23781-1-jonathan@marek.ca>
References: <20210511180728.23781-1-jonathan@marek.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This isn't used and only works because devm_regulator_get() returns a dummy
regulator.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 drivers/media/platform/qcom/camss/camss.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index ef100d5f7763..c08d6d6f6f90 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -542,7 +542,7 @@ static const struct resources csiphy_res_845[] = {
 static const struct resources csid_res_845[] = {
 	/* CSID0 */
 	{
-		.regulator = { "vdda-csi0" },
+		.regulator = { NULL },
 		.clock = { "cpas_ahb", "cphy_rx_src", "slow_ahb_src",
 				"soc_ahb", "vfe0", "vfe0_src",
 				"vfe0_cphy_rx", "csi0",
@@ -562,7 +562,7 @@ static const struct resources csid_res_845[] = {
 
 	/* CSID1 */
 	{
-		.regulator = { "vdda-csi1" },
+		.regulator = { NULL },
 		.clock = { "cpas_ahb", "cphy_rx_src", "slow_ahb_src",
 				"soc_ahb", "vfe1", "vfe1_src",
 				"vfe1_cphy_rx", "csi1",
@@ -582,7 +582,7 @@ static const struct resources csid_res_845[] = {
 
 	/* CSID2 */
 	{
-		.regulator = { "vdda-csi2" },
+		.regulator = { NULL },
 		.clock = { "cpas_ahb", "cphy_rx_src", "slow_ahb_src",
 				"soc_ahb", "vfe_lite", "vfe_lite_src",
 				"vfe_lite_cphy_rx", "csi2",
-- 
2.26.1

