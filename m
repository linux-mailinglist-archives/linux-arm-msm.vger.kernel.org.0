Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EC0AD56712B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Jul 2022 16:35:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231338AbiGEOfu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Jul 2022 10:35:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230176AbiGEOfs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Jul 2022 10:35:48 -0400
Received: from mx.kernkonzept.com (serv1.kernkonzept.com [IPv6:2a01:4f8:1c1c:b490::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E179038B6;
        Tue,  5 Jul 2022 07:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=kernkonzept.com; s=mx1; h=Content-Transfer-Encoding:MIME-Version:References
        :In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=5he9YDxdjz6nU7cOCThUbiLOvUvzeNwPX9fT/TBQ8fg=; b=WCD/olnoUbcPwIq+9IJffkPWiW
        tbpAH5u2LlhdRycV+G4yiU2yz5zdkMkxI8z8zyglLOSw16PPVQzflKbHOsX6yKYc5P5sSDyLI9pYT
        bMi150Cg4N5hsku749erE0TfoL8lfGHB38keEmN1CddQ7sjVikcqUwwVUnn15YaWX9t8e3mJp2XH8
        FEry0F26nphv03s26j8c37CbqEm7q8S0Bo31o5upG8qvmNe+0uJzn2B7G9bS8E18Dk3he5Hhbofau
        D+UCddWK9qLObzeOtrO3bWAghgCvJl8lBvBBMUgPwEDmXmNx8MLtcAP+R/H1GURQL/syGCXjFiBS4
        ati33GPQ==;
Received: from [10.22.3.24] (helo=kernkonzept.com)
        by mx.kernkonzept.com with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim 4.94.2)
        id 1o8jeS-007EB6-5C; Tue, 05 Jul 2022 16:35:44 +0200
From:   Stephan Gerhold <stephan.gerhold@kernkonzept.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Stephan Gerhold <stephan@gerhold.net>,
        Stephan Gerhold <stephan.gerhold@kernkonzept.com>
Subject: [PATCH 4/8] soc: qcom: rpmpd: Add compatible for MSM8909
Date:   Tue,  5 Jul 2022 16:35:19 +0200
Message-Id: <20220705143523.3390944-5-stephan.gerhold@kernkonzept.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220705143523.3390944-1-stephan.gerhold@kernkonzept.com>
References: <20220705143523.3390944-1-stephan.gerhold@kernkonzept.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

MSM8909 has the same power domains as MSM8916, so just define another
compatible for the existing definition.

Signed-off-by: Stephan Gerhold <stephan.gerhold@kernkonzept.com>
---
 drivers/soc/qcom/rpmpd.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/rpmpd.c b/drivers/soc/qcom/rpmpd.c
index 3b5b91621532..5803038c744e 100644
--- a/drivers/soc/qcom/rpmpd.c
+++ b/drivers/soc/qcom/rpmpd.c
@@ -453,6 +453,7 @@ static const struct rpmpd_desc qcm2290_desc = {
 static const struct of_device_id rpmpd_match_table[] = {
 	{ .compatible = "qcom,mdm9607-rpmpd", .data = &mdm9607_desc },
 	{ .compatible = "qcom,msm8226-rpmpd", .data = &msm8226_desc },
+	{ .compatible = "qcom,msm8909-rpmpd", .data = &msm8916_desc },
 	{ .compatible = "qcom,msm8916-rpmpd", .data = &msm8916_desc },
 	{ .compatible = "qcom,msm8939-rpmpd", .data = &msm8939_desc },
 	{ .compatible = "qcom,msm8953-rpmpd", .data = &msm8953_desc },
-- 
2.30.2

