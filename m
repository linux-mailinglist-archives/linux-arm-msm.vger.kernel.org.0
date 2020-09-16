Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A65726C925
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Sep 2020 21:04:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727635AbgIPTD6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Sep 2020 15:03:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727407AbgIPRsG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Sep 2020 13:48:06 -0400
Received: from mo6-p02-ob.smtp.rzone.de (mo6-p02-ob.smtp.rzone.de [IPv6:2a01:238:20a:202:5302::11])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C766C061A2B;
        Wed, 16 Sep 2020 04:14:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1600254283;
        s=strato-dkim-0002; d=gerhold.net;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=TFNXvKJwdtFzCefcgMtOvafQoeaSFyYS/u0KKD5oVW8=;
        b=gPzf3js/HWVP5uFH/poWB0INhXvEnj87wp526vurWlxAnhwDpUl85re7xFY6QflPR8
        J1Gp15d6gpsX2HOKAMsg2X2WaZqLoybYIm8zZVeNnnDvISw4a9Y4AzcLdP0Zw6OjjgKj
        e1Kc54fsCsd/NdXbkLODNKhfdyfzDlre0Con7GVzwGq2VwsnAqRnU3jfvegzsqdkxPwC
        XX+hUkdFbbGltaZ1TlfyDBmHO0dpbHtz9VbjSi8i0OQ+uzMXJART2ATh2E/yaVNU/34F
        IN15OIKq8MoUdEN+P/EjjWPiG+yw/EN/6ZM4w65qg8I+3gJY2A0NRiQR+Sxz6cgeG9jy
        riug==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXS7IYBkLahKxB4W6Nahc="
X-RZG-CLASS-ID: mo00
Received: from localhost.localdomain
        by smtp.strato.de (RZmta 46.10.7 DYNA|AUTH)
        with ESMTPSA id g0b6c1w8GAfpzlQ
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Wed, 16 Sep 2020 12:41:51 +0200 (CEST)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-remoteproc@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH 03/10] soc: qcom: rpmpd: Add MSM8916 power domains
Date:   Wed, 16 Sep 2020 12:41:28 +0200
Message-Id: <20200916104135.25085-4-stephan@gerhold.net>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200916104135.25085-1-stephan@gerhold.net>
References: <20200916104135.25085-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

MSM8916 has two RPM power domains: VDDCX and VDDMX.
Add the necessary definitions to manage them with rpmpd.

Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 drivers/soc/qcom/rpmpd.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/soc/qcom/rpmpd.c b/drivers/soc/qcom/rpmpd.c
index 88eb458b13d0..daeea119d48a 100644
--- a/drivers/soc/qcom/rpmpd.c
+++ b/drivers/soc/qcom/rpmpd.c
@@ -116,6 +116,26 @@ struct rpmpd_desc {
 
 static DEFINE_MUTEX(rpmpd_lock);
 
+/* msm8916 RPM Power Domains */
+DEFINE_RPMPD_PAIR(msm8916, vddcx, vddcx_ao, SMPA, CORNER, 1);
+DEFINE_RPMPD_PAIR(msm8916, vddmx, vddmx_ao, LDOA, CORNER, 3);
+
+DEFINE_RPMPD_VFC(msm8916, vddcx_vfc, SMPA, 1);
+
+static struct rpmpd *msm8916_rpmpds[] = {
+	[MSM8916_VDDCX] =	&msm8916_vddcx,
+	[MSM8916_VDDCX_AO] =	&msm8916_vddcx_ao,
+	[MSM8916_VDDCX_VFC] =	&msm8916_vddcx_vfc,
+	[MSM8916_VDDMX] =	&msm8916_vddmx,
+	[MSM8916_VDDMX_AO] =	&msm8916_vddmx_ao,
+};
+
+static const struct rpmpd_desc msm8916_desc = {
+	.rpmpds = msm8916_rpmpds,
+	.num_pds = ARRAY_SIZE(msm8916_rpmpds),
+	.max_state = MAX_CORNER_RPMPD_STATE,
+};
+
 /* msm8976 RPM Power Domains */
 DEFINE_RPMPD_PAIR(msm8976, vddcx, vddcx_ao, SMPA, LEVEL, 2);
 DEFINE_RPMPD_PAIR(msm8976, vddmx, vddmx_ao, SMPA, LEVEL, 6);
@@ -221,6 +241,7 @@ static const struct rpmpd_desc qcs404_desc = {
 };
 
 static const struct of_device_id rpmpd_match_table[] = {
+	{ .compatible = "qcom,msm8916-rpmpd", .data = &msm8916_desc },
 	{ .compatible = "qcom,msm8976-rpmpd", .data = &msm8976_desc },
 	{ .compatible = "qcom,msm8996-rpmpd", .data = &msm8996_desc },
 	{ .compatible = "qcom,msm8998-rpmpd", .data = &msm8998_desc },
-- 
2.28.0

