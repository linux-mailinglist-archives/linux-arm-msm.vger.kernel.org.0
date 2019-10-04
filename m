Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F0CB1CB7EE
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Oct 2019 12:09:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729291AbfJDKJU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Oct 2019 06:09:20 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:37210 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728257AbfJDKJT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Oct 2019 06:09:19 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id CF40661A1C; Fri,  4 Oct 2019 10:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1570183758;
        bh=AkeNMgIMO1pbJoRLFidcxKLZR4e3UT+NiDdo9nDWuvs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=dm0FBoHabz2niyaC4jOlbA9jB59TywvZtbs46nhCC+PWRl9CFU9RISUMDOYNVsK6N
         yXRpcRqosE0QBTOEPg1U9FYKMb7RSY1rt24CsG2zDl+wR6U7XzXmD4XpH1WXe8EkzT
         Mlrmbqn8JeMrc0+2HxpCpGoTzxRBZvAqN8ovT6Ds=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from kgunda-linux.qualcomm.com (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: kgunda@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 7411F614B5;
        Fri,  4 Oct 2019 10:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1570183757;
        bh=AkeNMgIMO1pbJoRLFidcxKLZR4e3UT+NiDdo9nDWuvs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=pJkkmi+7PTOZEah/Hg61YiWOGIH16h0IWQw2yU+CGl7o1erLWoUYFV2Hvm7rxNkFl
         tcN0PdW/Ov4vjY0jXTV9uBsiwooalzUUvPpfuUHCWsWnJ/b6LDGgqZgdYgTt5F0dWd
         ZldKRVQCZFD5CIRDinKace30kduMlOlkZmH5nnJI=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 7411F614B5
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=kgunda@codeaurora.org
From:   Kiran Gunda <kgunda@codeaurora.org>
To:     bjorn.andersson@linaro.org, Andy Gross <agross@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     Kiran Gunda <kgunda@codeaurora.org>
Subject: [PATCH V1 1/2]  regulator: dt-bindings: Add PM6150x compatibles
Date:   Fri,  4 Oct 2019 15:38:53 +0530
Message-Id: <1570183734-30706-2-git-send-email-kgunda@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1570183734-30706-1-git-send-email-kgunda@codeaurora.org>
References: <1570183734-30706-1-git-send-email-kgunda@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add PM6150 and PM6150L compatibles for Qualcomm SC7180 platfrom.

Signed-off-by: Kiran Gunda <kgunda@codeaurora.org>
---
 Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.txt b/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.txt
index bab9f71..97c3e0b 100644
--- a/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.txt
+++ b/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.txt
@@ -28,6 +28,8 @@ Supported regulator node names:
 	PM8150L:	smps1 - smps8, ldo1 - ldo11, bob, flash, rgb
 	PM8998:		smps1 - smps13, ldo1 - ldo28, lvs1 - lvs2
 	PMI8998:	bob
+	PM6150:         smps1 - smps5, ldo1 - ldo19
+	PM6150L:        smps1 - smps8, ldo1 - ldo11, bob
 
 ========================
 First Level Nodes - PMIC
@@ -43,6 +45,8 @@ First Level Nodes - PMIC
 		    "qcom,pm8150l-rpmh-regulators"
 		    "qcom,pm8998-rpmh-regulators"
 		    "qcom,pmi8998-rpmh-regulators"
+		    "qcom,pm6150-rpmh-regulators"
+		    "qcom,pm6150l-rpmh-regulators"
 
 - qcom,pmic-id
 	Usage:      required
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
 a Linux Foundation Collaborative Project

