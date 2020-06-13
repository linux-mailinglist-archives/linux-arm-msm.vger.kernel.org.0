Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8D9C1F818A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jun 2020 09:28:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726499AbgFMH2T (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 13 Jun 2020 03:28:19 -0400
Received: from relay-2.mailobj.net ([213.182.54.5]:39471 "EHLO
        relay-2.mailobj.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725771AbgFMH2S (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 13 Jun 2020 03:28:18 -0400
Received: from v-1.localdomain (v-1.in.mailobj.net [192.168.90.191])
        by relay-2.mailobj.net (Postfix) with SMTP id 562271328;
        Sat, 13 Jun 2020 09:28:15 +0200 (CEST)
Received: by ip-25.net-c.com [213.182.54.25] with ESMTP
        Sat, 13 Jun 2020 09:29:10 +0200 (CEST)
X-EA-Auth: 9uH0uMMldOfHGB3uv1uMAj82M0LhDcv6vGQX9kXNwePpc4YfUophSLNQgdbaVz5lb7G15X9FN1rzHcy2PjswgFY8bnCBXdxaLZimS3vUf1I=
From:   Vincent Knecht <vincent.knecht@mailoo.org>
To:     sboyd@kernel.org
Cc:     konradybcio@gmail.com, Vincent Knecht <vincent.knecht@mailoo.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 3/4] drivers: soc: Add MSM8936 SMD RPM compatible
Date:   Sat, 13 Jun 2020 09:27:44 +0200
Message-Id: <20200613072745.1249003-4-vincent.knecht@mailoo.org>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200613072745.1249003-1-vincent.knecht@mailoo.org>
References: <20200613072745.1249003-1-vincent.knecht@mailoo.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Konrad Dybcio <konradybcio@gmail.com>

Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
Signed-off-by: Vincent Knecht <vincent.knecht@mailoo.org>
---
 drivers/soc/qcom/smd-rpm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/smd-rpm.c b/drivers/soc/qcom/smd-rpm.c
index 005dd30c58fa..8f290c67cb47 100644
--- a/drivers/soc/qcom/smd-rpm.c
+++ b/drivers/soc/qcom/smd-rpm.c
@@ -231,6 +231,7 @@ static void qcom_smd_rpm_remove(struct rpmsg_device *rpdev)
 static const struct of_device_id qcom_smd_rpm_of_match[] = {
 	{ .compatible = "qcom,rpm-apq8084" },
 	{ .compatible = "qcom,rpm-msm8916" },
+	{ .compatible = "qcom,rpm-msm8936" },
 	{ .compatible = "qcom,rpm-msm8974" },
 	{ .compatible = "qcom,rpm-msm8976" },
 	{ .compatible = "qcom,rpm-msm8996" },
-- 
2.25.4


