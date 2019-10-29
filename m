Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 604FBE8E9B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Oct 2019 18:48:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727562AbfJ2Rsp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Oct 2019 13:48:45 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:58756 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726566AbfJ2Rsp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Oct 2019 13:48:45 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 32BAA60F80; Tue, 29 Oct 2019 17:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1572371324;
        bh=wTW5UT9BjcV80xvLwPWNZUfHLnwR2RR0wUUoX3TDoNo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Q5oTSZFue6lmCfXoUTHu03ofP2olyxUjQHeEQJ/EjSdzCEsvfCSUbf3phqm1cXgo5
         Wpjg56dp39nHFxc6MULN/YqlWVIk1TwfUUolU9YzykkWAJVxiAow6OaCPdWQO1eBoW
         xaOX6rJUajNCmfwhhv0Te2njKxTsOwYkafanCzuU=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from tdas-linux.qualcomm.com (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tdas@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id BDDBA60F7B;
        Tue, 29 Oct 2019 17:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1572371322;
        bh=wTW5UT9BjcV80xvLwPWNZUfHLnwR2RR0wUUoX3TDoNo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=goYxoYfRDg76wigGCEIXg1Lzoeoa/YpmHp06iOPmSKqwQ3Mb8/gi/krQJTPj3lha7
         tXifbCtxq/t4ioHZY6qCoCaCKpBIEiBO0MN7RKcAzREa784xrSxzMS14fnjRIAIBJ2
         HwbpcngL0OWz2U+VFHxJmjZZPM8poy+EzCz9xuQ8=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org BDDBA60F7B
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=tdas@codeaurora.org
From:   Taniya Das <tdas@codeaurora.org>
To:     Stephen Boyd <sboyd@kernel.org>,
        =?UTF-8?q?Michael=20Turquette=20=C2=A0?= <mturquette@baylibre.com>
Cc:     David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, robh@kernel.org, robh+dt@kernel.org,
        Taniya Das <tdas@codeaurora.org>
Subject: [PATCH v2 2/3] dt-bindings: clock: Introduce RPMHCC bindings for SC7180
Date:   Tue, 29 Oct 2019 23:18:18 +0530
Message-Id: <1572371299-16774-3-git-send-email-tdas@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1572371299-16774-1-git-send-email-tdas@codeaurora.org>
References: <1572371299-16774-1-git-send-email-tdas@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add compatible for SC7180 RPMHCC.

Signed-off-by: Taniya Das <tdas@codeaurora.org>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
index f25d76f..feed637 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
@@ -19,6 +19,7 @@ properties:
     enum:
       - qcom,sdm845-rpmh-clk
       - qcom,sm8150-rpmh-clk
+      - qcom,sc7180-rpmh-clk

   clocks:
     maxItems: 1
--
Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
of the Code Aurora Forum, hosted by the  Linux Foundation.

