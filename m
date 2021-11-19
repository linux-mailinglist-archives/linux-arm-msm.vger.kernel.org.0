Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72F4D457840
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Nov 2021 22:40:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230098AbhKSVn5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 19 Nov 2021 16:43:57 -0500
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.81]:19738 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229633AbhKSVn4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 19 Nov 2021 16:43:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1637358047;
    s=strato-dkim-0002; d=gerhold.net;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=lxU9ltijgRM9c3gqZrDShRHSK5pywwb4iBM4yfM5rSM=;
    b=MMTXpc5kMQV2ylB1Kg6UCfSAcScRGkpHpxqrvq4YbeCwFShMVWBObG4W34SZn4zmAL
    xrL0Nmc0qwukZX5yTyxl27K3rcEz34Cf+bLTiJNDVWOVKZePGiZMJ1QRoPEHVtIa6h3A
    SY6rkELsFRRJhO7/71zOhI0YhGMTDFqkx9mM419UPCYU9U327qW0ESAkpHmEyCBwTjLN
    yxK68JPjl+pJPdhv0gBBWWxWjRDcLxn6qq9BwUmssk7RO3eGfdZI0MiVcqvraLajmrW6
    iUHCykElL+Bvm0Fm4fLtBqlEtTJZpdSxnu5dQocm6VpTzsArCBEnipskK77Cm2C9kolk
    XGAA==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXQ7UOGqRde+a0fiL0Iik="
X-RZG-CLASS-ID: mo00
Received: from droid..
    by smtp.strato.de (RZmta 47.34.5 AUTH)
    with ESMTPSA id j05669xAJLek0CS
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Fri, 19 Nov 2021 22:40:46 +0100 (CET)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Maulik Shah <mkshah@codeaurora.org>,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH v2 2/3] soc: qcom: stats: Add fixed sleep stats offset for older RPM firmwares
Date:   Fri, 19 Nov 2021 22:39:52 +0100
Message-Id: <20211119213953.31970-3-stephan@gerhold.net>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211119213953.31970-1-stephan@gerhold.net>
References: <20211119213953.31970-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Not all RPM firmware versions have the dynamic sleep stats offset
available. Most older versions use a fixed offset of 0xdba0.
Add support for this using new SoC-specific compatibles for APQ8084,
MSM8226, MSM8916 and MSM8974.

Even older SoCs seem to use a different offset and stats format.
If needed those could be supported in the future by adding separate
compatibles for those with a different stats_config.

Cc: Maulik Shah <mkshah@codeaurora.org>
Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
Changes in v2:
  - Use SoC-specific compatibles instead of qcom,rpm-legacy-stats
---
 drivers/soc/qcom/qcom_stats.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/soc/qcom/qcom_stats.c b/drivers/soc/qcom/qcom_stats.c
index 131d24caabf8..d6bfd1bbdc2a 100644
--- a/drivers/soc/qcom/qcom_stats.c
+++ b/drivers/soc/qcom/qcom_stats.c
@@ -237,6 +237,15 @@ static const struct stats_config rpm_data = {
 	.subsystem_stats_in_smem = false,
 };
 
+/* Older RPM firmwares have the stats at a fixed offset instead */
+static const struct stats_config rpm_data_dba0 = {
+	.stats_offset = 0xdba0,
+	.num_records = 2,
+	.appended_stats_avail = true,
+	.dynamic_offset = false,
+	.subsystem_stats_in_smem = false,
+};
+
 static const struct stats_config rpmh_data = {
 	.stats_offset = 0x48,
 	.num_records = 3,
@@ -246,6 +255,10 @@ static const struct stats_config rpmh_data = {
 };
 
 static const struct of_device_id qcom_stats_table[] = {
+	{ .compatible = "qcom,apq8084-rpm-stats", .data = &rpm_data_dba0 },
+	{ .compatible = "qcom,msm8226-rpm-stats", .data = &rpm_data_dba0 },
+	{ .compatible = "qcom,msm8916-rpm-stats", .data = &rpm_data_dba0 },
+	{ .compatible = "qcom,msm8974-rpm-stats", .data = &rpm_data_dba0 },
 	{ .compatible = "qcom,rpm-stats", .data = &rpm_data },
 	{ .compatible = "qcom,rpmh-stats", .data = &rpmh_data },
 	{ }
-- 
2.34.0

