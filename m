Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7E21316436
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Feb 2021 11:48:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231325AbhBJKsN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Feb 2021 05:48:13 -0500
Received: from mail.kernel.org ([198.145.29.99]:50742 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230379AbhBJKq2 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Feb 2021 05:46:28 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id C5DF864E37;
        Wed, 10 Feb 2021 10:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612953947;
        bh=3tkR6c5zUqero+5H7/Z8Ucg6Qgbzr4ym72/veesXOVI=;
        h=From:To:Cc:Subject:Date:From;
        b=ab5vgRMwBm3BH74eHjJi9qnlPiEOlkj9aOF6IIKV66Ehk/Ex7jE/LZox9/+kG7tHO
         lMpJS8vD92xkLGd4fgQaxbBX77km91rK79VRH9J6AO9vMUEeVuB1hS7dHQrGMmopO8
         2LMLMcV9c++Fm8ncqspA3RFGQv84vSSCjXE7PH8fFT99//T6ZGbYariqr+Cf47VQBj
         Xn6Gsponmx/hOCrSM+hLvleio7KHAcxhp39K3e1bFuoxWl9XfiSVKmemUhKdCuV1Yv
         ACZuNHbyPwNWXMhygEE51JwlTK2jGKaKJRtgcXGioaYahhr0R9mgWsKYt9g3R1o/y5
         k4YXB8XIGjwhA==
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: remoteproc: qcom: pas: Add SM8350 remoteprocs
Date:   Wed, 10 Feb 2021 16:15:38 +0530
Message-Id: <20210210104539.340349-1-vkoul@kernel.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the SM8350 audio, compute, modem and sensor remoteprocs to the PAS
DT binding.

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 .../devicetree/bindings/remoteproc/qcom,adsp.txt     | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.txt b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.txt
index 54737024da20..41eaa2466aab 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.txt
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.txt
@@ -25,6 +25,10 @@ on the Qualcomm ADSP Hexagon core.
 		    "qcom,sm8250-adsp-pas"
 		    "qcom,sm8250-cdsp-pas"
 		    "qcom,sm8250-slpi-pas"
+		    "qcom,sm8350-adsp-pas"
+		    "qcom,sm8350-cdsp-pas"
+		    "qcom,sm8350-slpi-pas"
+		    "qcom,sm8350-mpss-pas"
 
 - interrupts-extended:
 	Usage: required
@@ -51,10 +55,14 @@ on the Qualcomm ADSP Hexagon core.
 	qcom,sm8250-adsp-pas:
 	qcom,sm8250-cdsp-pas:
 	qcom,sm8250-slpi-pas:
+	qcom,sm8350-adsp-pas:
+	qcom,sm8350-cdsp-pas:
+	qcom,sm8350-slpi-pas:
 		    must be "wdog", "fatal", "ready", "handover", "stop-ack"
 	qcom,qcs404-wcss-pas:
 	qcom,sc7180-mpss-pas:
 	qcom,sm8150-mpss-pas:
+	qcom,sm8350-mpss-pas:
 		    must be "wdog", "fatal", "ready", "handover", "stop-ack",
 		    "shutdown-ack"
 
@@ -113,14 +121,18 @@ on the Qualcomm ADSP Hexagon core.
 	qcom,sdm845-cdsp-pas:
 	qcom,sm8150-adsp-pas:
 	qcom,sm8150-cdsp-pas:
+	qcom,sm8250-cdsp-pas:
 	qcom,sm8250-cdsp-pas:
 		    must be "cx", "load_state"
 	qcom,sc7180-mpss-pas:
 	qcom,sm8150-mpss-pas:
+	qcom,sm8350-mpss-pas:
 		    must be "cx", "load_state", "mss"
 	qcom,sm8250-adsp-pas:
+	qcom,sm8350-adsp-pas:
 	qcom,sm8150-slpi-pas:
 	qcom,sm8250-slpi-pas:
+	qcom,sm8350-slpi-pas:
 		    must be "lcx", "lmx", "load_state"
 
 - memory-region:
-- 
2.26.2

