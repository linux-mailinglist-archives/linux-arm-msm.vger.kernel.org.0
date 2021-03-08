Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E54983307D4
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Mar 2021 07:09:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234658AbhCHGJY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Mar 2021 01:09:24 -0500
Received: from mail.kernel.org ([198.145.29.99]:44586 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234685AbhCHGIz (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Mar 2021 01:08:55 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8D17D64FBD;
        Mon,  8 Mar 2021 06:08:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615183735;
        bh=Xnd/3lU6ihIa0SMi3MtuXxntWG15YIkmDOB1/QLmb54=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=iXSL9TUHNDvOPz/wo1utjG/9QfjhKHL9bqhd+gGcr0o3QFmATIUKdkpUqmBamLxvT
         w9xoTc9auOelmQPiE+uXXhRTlIVVwscvhMROp8TQ7opwxy/fioTU50zKLaCVndLUUI
         bl1pZQs3o+TYyHswZgdWBpMk7M2D4AlOLFmPj+FnvcnrXJ/9E2DIPfinM9yyBUvgIc
         hf5Pxlza6uTr936TGLuc2Ur4UgBEZ9QoQelHvY4amZN/kAbMFSECCoNHfReL7MPbha
         tIcTOGXyaIUQDijUY4s0VYeNa6bwfoLK9snKIPoFco9sSbYcHXSKi5RTF+o9ETvabK
         xQ8PBgpIKEF+Q==
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 06/18] dt-bindings: arm: qcom: Document alcatel,idol347 board
Date:   Mon,  8 Mar 2021 11:38:14 +0530
Message-Id: <20210308060826.3074234-7-vkoul@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210308060826.3074234-1-vkoul@kernel.org>
References: <20210308060826.3074234-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Document the alcatel,idol347 board. It was missing leading to warning:

arch/arm64/boot/dts/qcom/msm8916-alcatel-idol347.dt.yaml: /: compatible: 'oneOf' conditional failed, one must be fixed:
        Additional items are not allowed ('qcom,msm8916' was unexpected)

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index dc87238d411b..7d97246dc379 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -125,6 +125,8 @@ properties:
           - const: qcom,msm8974
 
       - items:
+          - enum:
+              - alcatel,idol347
           - const: qcom,msm8916-mtp/1
           - const: qcom,msm8916-mtp
           - const: qcom,msm8916
-- 
2.26.2

