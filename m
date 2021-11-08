Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3F53448071
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Nov 2021 14:45:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240059AbhKHNro (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Nov 2021 08:47:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240063AbhKHNrm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Nov 2021 08:47:42 -0500
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F418C061766
        for <linux-arm-msm@vger.kernel.org>; Mon,  8 Nov 2021 05:44:58 -0800 (PST)
Received: by mail-pj1-x102f.google.com with SMTP id y14-20020a17090a2b4e00b001a5824f4918so8812271pjc.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Nov 2021 05:44:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=H7m5p97BKE1ln9x8mMCJwq7P//I9O+wuU0Z+Nt2052Y=;
        b=P+Utp/dlqKEWj6LUw9H9YhiIfaKS72hoEaHw6MpLEqMUryo4lbSa/EH6J0o0iegScV
         cdYm2qLfUKciJFZnblzm5/ZpoXAZeaoML+UBYTfSa33+YzfsDrLGOBa0iMW6mWoKTaQh
         C3TfeMkME+OA749VGpq+6dtLlhEO088MoXK8+v37H3tAV3WsNdnxltM7ZFeO2rPCzvrF
         Rsci752T7LTOztbaJ9a+PzAriqlW0MMWKvm3cH5Xx44p2uOaD/twNlM9UWDj+FdbSXqU
         YZPk7kN8HW+ds0EMjvaTdPDfwobr4MjYYditYbTdRdAsRTTnnADdSnmN2MR8duf50utd
         Ck7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=H7m5p97BKE1ln9x8mMCJwq7P//I9O+wuU0Z+Nt2052Y=;
        b=50EMqtd3BEp690s4oyXrRdiwnVej7ruwhgI4p5rKJgA1EJug5tOJqM6BDBHEzBU1Gb
         ncH6kcY9DWrvh6CidoyIAFy5v/w3CgRYy6lUgYmLtrNHaFmwnSwi+KlBGWs7Fu77eUra
         JrwlffyFj14BOuc6RoQ2KqjRYAKmJs2IyX18JBzYRFGMv3am4sMwMlU4jYgt00AUeSQq
         tJmgozTv/xMJJAp2XP7xC+UMN8FKTdjXxLUGAoPnL4IdBW2eKDuEnSTJa0qsjOqrn6GI
         qUiek55b5MmIqsmcYCFtelg4d+XnImJJMPnViP4tUi6V/ST24gm/vVzhxi1SbaMJ5Mv5
         WwEQ==
X-Gm-Message-State: AOAM531UTe2DGWCLoucM8XJTAW1sftYKvEHENi50TVeI+4PxLq2yh7ja
        0KGAjN1psN+UpK44RDZi1jTq1g==
X-Google-Smtp-Source: ABdhPJxP7jW2gLwiv9Q8PBw5mnZz3NE2z/LeHukHwHW64eCdd5J2Zd7+qzRP1C1lvWKdCUfie1FVag==
X-Received: by 2002:a17:90a:ab17:: with SMTP id m23mr5745396pjq.194.1636379097787;
        Mon, 08 Nov 2021 05:44:57 -0800 (PST)
Received: from localhost.localdomain (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id m184sm3693974pga.61.2021.11.08.05.44.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Nov 2021 05:44:57 -0800 (PST)
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH 1/3] soc: qcom: rpmpd: Drop unused res_name from struct rpmpd
Date:   Mon,  8 Nov 2021 21:44:40 +0800
Message-Id: <20211108134442.30051-2-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211108134442.30051-1-shawn.guo@linaro.org>
References: <20211108134442.30051-1-shawn.guo@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The res_name field in struct rpmpd is unused.  Drop it.

Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
---
 drivers/soc/qcom/rpmpd.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/soc/qcom/rpmpd.c b/drivers/soc/qcom/rpmpd.c
index 4f69fb9b2e0e..3e7905854eb9 100644
--- a/drivers/soc/qcom/rpmpd.c
+++ b/drivers/soc/qcom/rpmpd.c
@@ -102,7 +102,6 @@ struct rpmpd {
 	const bool active_only;
 	unsigned int corner;
 	bool enabled;
-	const char *res_name;
 	const int res_type;
 	const int res_id;
 	struct qcom_smd_rpm *rpm;
-- 
2.17.1

