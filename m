Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5BD93307D7
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Mar 2021 07:09:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234712AbhCHGJY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Mar 2021 01:09:24 -0500
Received: from mail.kernel.org ([198.145.29.99]:44574 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234669AbhCHGIw (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Mar 2021 01:08:52 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 747F164FBA;
        Mon,  8 Mar 2021 06:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615183731;
        bh=kKoZdeS4jH0APpDiDt90K7fmDmpRVir4uK0qg+zVO2I=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=J9n1i8kntkH46pHomJ3+jr/QaNLvmQSnwmhtofmUISAOUR2UFw6JMhKNFFJK6B7JO
         FKq2SnbkEHyxS/wWs6X+wUVnw4Gazm2/w+/+2eHNlnlAnGJ79jZ4BmWUvfG6pEKdDd
         7fipRpygipE9SmcuEvji+NRTl+9B6zP6ZGMWTmO7AjM++y1u/kVikHaC+TfvuQjl7y
         W2LOgEtT2LUTaktTQ/gtr1ucpVNTeTu1GI+9419tmE8CNmzHbCPcoaBRuyuk/9/iR1
         Zrccr5EiLjgUSce8me5sOOLZght2szAakqkb7Kk+TU0rRo8GnO9VbFjuMPGf3V62pJ
         B50xRBo1KGesg==
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 05/18] dt-bindings: arm: qcom: Document sony boards for apq8094
Date:   Mon,  8 Mar 2021 11:38:13 +0530
Message-Id: <20210308060826.3074234-6-vkoul@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210308060826.3074234-1-vkoul@kernel.org>
References: <20210308060826.3074234-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Document the various sony boards for apq8094. These are used in various
sony dts files but not documented

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 74610f1d1407..dc87238d411b 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -136,6 +136,16 @@ properties:
               - samsung,a5u-eur
           - const: qcom,msm8916
 
+      - items:
+          - enum:
+              - sony,karin_windy
+              - sony,karin-row
+              - sony,satsuki-row
+              - sony,sumire-row
+              - sony,suzuran-row
+              - qcom,msm8994
+          - const: qcom,apq8094
+
       - items:
           - const: qcom,msm8996-mtp
 
-- 
2.26.2

