Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 43846DE500
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2019 08:56:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727547AbfJUG4p (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Oct 2019 02:56:45 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:35916 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727506AbfJUG4p (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Oct 2019 02:56:45 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 3DBD360B16; Mon, 21 Oct 2019 06:56:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1571641004;
        bh=Nj9rYTRREDQFN0Vgl0E6ZqlkrCh1kPQL2IP303YZx2s=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=AyRjtxw1M4hvd3TVewpiww4caHYwlkuKSVfp1dfgipgBP8mJhvBiNlbMZbl9txNZc
         QYg/7qJQYbip0kXWChCFROb5byAN8EaMVVTkxmQLMa8ws4ES3nAwwKKy3k5yd0F+gd
         1peEE34pQTmlytWC9xGQunpr2WTUR05eapyeJVjU=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from blr-ubuntu-173.qualcomm.com (blr-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id D069D60B6C;
        Mon, 21 Oct 2019 06:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1571641003;
        bh=Nj9rYTRREDQFN0Vgl0E6ZqlkrCh1kPQL2IP303YZx2s=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=VO9twpprfBWjDPCaCCQo3ICWRJqU8a6kC1JRWvM/dGOgz5zPJcDTwmWun9jeutD0k
         gbjztBeAAKhPEzhRqu1pAjBH9GHTY5BwxH+jiWVG+Aiv1sO/eZXnuMO8iA8sT6uFR6
         pJ7D9c2gXgvMik+SU62hXxfXq8BLBuCOSh5we5f4=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org D069D60B6C
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=rnayak@codeaurora.org
From:   Rajendra Nayak <rnayak@codeaurora.org>
To:     agross@kernel.org, robh+dt@kernel.org, bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Lina Iyer <ilina@codeaurora.org>, Marc Zyngier <maz@kernel.org>
Subject: [PATCH v2 12/13] dt-bindings: qcom,pdc: Add compatible for sc7180
Date:   Mon, 21 Oct 2019 12:25:21 +0530
Message-Id: <20191021065522.24511-13-rnayak@codeaurora.org>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20191021065522.24511-1-rnayak@codeaurora.org>
References: <20191021065522.24511-1-rnayak@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the compatible string for sc7180 SoC from Qualcomm.

Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
Cc: Lina Iyer <ilina@codeaurora.org>
Cc: Marc Zyngier <maz@kernel.org>
---
v2: No change

 .../devicetree/bindings/interrupt-controller/qcom,pdc.txt        | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.txt b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.txt
index 8e0797cb1487..f0542b339f40 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.txt
+++ b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.txt
@@ -19,6 +19,7 @@ Properties:
 	Value type: <string>
 	Definition: Should contain "qcom,<soc>-pdc"
 		    - "qcom,sdm845-pdc": For SDM845
+		    - "qcom,sc7180-pdc": For SC7180
 
 - reg:
 	Usage: required
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

