Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 176D81F3C8C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2020 15:31:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729318AbgFINbd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 Jun 2020 09:31:33 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:20591 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729564AbgFINbd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 Jun 2020 09:31:33 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1591709493; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=rKRIJ4Ke9iXpXerSjzDQLHjofE5cmJDtdnzle9dJnm0=; b=MXqqNUt2ABYI6JU4ju+CbNAouMtas1Xsj30d3a/gYKv97y5u8f5SsTntBw27ZlFbyyH2Gs0d
 6y6iFJQ2mcvnEiqE9whF7XSGk9JEPBy0IcnP806TqaSQEQZuEq0T2lA6skvs11bU37karjnt
 Ruf95FhFDgIraQuwslgbczdk4Qc=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 5edf8f19567385e8e7f9d51f (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 09 Jun 2020 13:31:05
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 9474EC43395; Tue,  9 Jun 2020 13:31:04 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from blr-ubuntu-253.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 97C3FC433C6;
        Tue,  9 Jun 2020 13:31:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 97C3FC433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=saiprakash.ranjan@codeaurora.org
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        mike.leach@linaro.org, Jonathan Marek <jonathan@marek.ca>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: [PATCH 3/4] arm64: dts: qcom: sc7180: Add support for context losing replicator
Date:   Tue,  9 Jun 2020 19:00:30 +0530
Message-Id: <5072d94849cfaee46748d26ac997212fb2d783c2.1591708204.git.saiprakash.ranjan@codeaurora.org>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <cover.1591708204.git.saiprakash.ranjan@codeaurora.org>
References: <cover.1591708204.git.saiprakash.ranjan@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add "qcom,replicator-loses-context" property to the replicator
in Always-on domain in SC7180 SoC to enable coresight replicator
driver to handle this variation of replicator designs.

Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
---

Depends on coresight replicator change here:
 - https://git.linaro.org/kernel/coresight.git/commit/?h=next-v5.8-rc1&id=1b6cddfb7ebb5ed293124698f147e914b15315a1

---
 arch/arm64/boot/dts/qcom/sc7180.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index 9b38867740ca..0cbe322a30c9 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -1784,6 +1784,7 @@
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			qcom,replicator-loses-context;
 
 			out-ports {
 				port {
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

