Return-Path: <linux-arm-msm+bounces-77920-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BB04DBEE6DD
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Oct 2025 16:22:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E6CE7188AECC
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Oct 2025 14:21:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 553CB2EB866;
	Sun, 19 Oct 2025 14:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="QfEInm4M";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="DRB+y11R"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8A272EB5DF;
	Sun, 19 Oct 2025 14:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760883674; cv=none; b=j3A38qLWIkgMG9zJAT3HhQu3aB6B1Su3lNDVJ5Vj/rppHXqWlJ0+2wgCsouk259eBckNsHXwS5VPAtybBDDAZ9x5hcKM7DAF5bLEezNArIO6lWM+/LlECbFFJn+tFTThR7yTivCWuXzJTY6/kYA5C80vbpiiC7Uu4mbBm/CgU70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760883674; c=relaxed/simple;
	bh=mujQJYaC5+EPXGJzjLpCAG5hlQGNqudkJnzeQgeYCw8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nhcE/f543nwOpCOKvWtjQGZaGnw2VDhy4xIlEDIW7NZFXE7c1qlanuW8u/Od3XEX6a9gL0aY8/4cXnD+bHzQfsZDVAhaMNKRkGxLwVkzjzrw1axQMYSk+AKFLU36lVizGo9FmUA2/yzWAzLbAv178eZDIBBpWcaPPIyRsn6O0TI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=QfEInm4M; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=DRB+y11R; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1760883624; bh=kmXQWpQITHFppEROcdKPhBt
	pkS6+mEYHh8mAZ/CjFOQ=; b=QfEInm4MyDJHuMKtFtWX2dNcWFAo+7gqx3sQ0MRpu0pppC8bVY
	qZHHu2gPcJAOm2l6Q3iRgWRaaZyc1GU/2wWzkWk6DnU3besnHAyYloQWRs1GyDuOus8Cov+fEb2
	4IEVobpUSvDjynylz1N2Q0AY+WZPM7n6V5z+mtOw6moSFYv9XFVggDZrtkL58EhW8It7AhLG+pt
	2diJD/NHxxMBt4+Pnb2hSWfk6LThnFAGYyHB0exp7CW9hxJF5TOf/Zk99wvr4D3lMbU4oMvOrZj
	ttuYTszxash0Gh9KHUrmIyuaWZYA8RONBQyTnyiv8kTbdb2kIRClhRjPtEHpurD3n9w==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1760883624; bh=kmXQWpQITHFppEROcdKPhBt
	pkS6+mEYHh8mAZ/CjFOQ=; b=DRB+y11RCyHRU86rqqhCkOeFCuThZLXFWkJQuFCbN1nve034sV
	rZy9uiWtzEnGV/jXJhFsUTrmnHVxfG4RwgAg==;
From: Nickolay Goppen <setotau@mainlining.org>
Date: Sun, 19 Oct 2025 17:20:20 +0300
Subject: [PATCH v2 2/3] dt-bindings: remoteproc: qcom: adsp: Add SDM660
 CDSP compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251019-qcom-sdm660-cdsp-v2-2-0d3bcb468de0@mainlining.org>
References: <20251019-qcom-sdm660-cdsp-v2-0-0d3bcb468de0@mainlining.org>
In-Reply-To: <20251019-qcom-sdm660-cdsp-v2-0-0d3bcb468de0@mainlining.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, linux@mainlining.org, 
 Nickolay Goppen <setotau@mainlining.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760883621; l=1901;
 i=setotau@mainlining.org; s=20250815; h=from:subject:message-id;
 bh=mujQJYaC5+EPXGJzjLpCAG5hlQGNqudkJnzeQgeYCw8=;
 b=U7pJNQdywSh4+Tf6DFTid8JHhsdd8jyVligYz87bPesaFXeIFX3lnHClYqRvJy1a+8b5VIu7M
 F4d4QDlq9c9Cb061ZbtHXn2+WXyzT06cr4Bzc6bMQVB31PepvCdUZej
X-Developer-Key: i=setotau@mainlining.org; a=ed25519;
 pk=Og7YO6LfW+M2QfcJfjaUaXc8oOr5zoK8+4AtX5ICr4o=

Add compatible for the compute DSP remoteproc found in SDM660.

Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
---
 Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
index c48561aae3a6..88da57ce7132 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
@@ -24,6 +24,7 @@ properties:
       - qcom,msm8998-adsp-pas
       - qcom,msm8998-slpi-pas
       - qcom,sdm660-adsp-pas
+      - qcom,sdm660-cdsp-pas
       - qcom,sdm845-adsp-pas
       - qcom,sdm845-cdsp-pas
       - qcom,sdm845-slpi-pas
@@ -70,6 +71,7 @@ allOf:
               - qcom,msm8998-adsp-pas
               - qcom,msm8998-slpi-pas
               - qcom,sdm660-adsp-pas
+              - qcom,sdm660-cdsp-pas
               - qcom,sdm845-adsp-pas
               - qcom,sdm845-cdsp-pas
               - qcom,sdm845-slpi-pas
@@ -95,6 +97,7 @@ allOf:
               - qcom,msm8998-adsp-pas
               - qcom,msm8998-slpi-pas
               - qcom,sdm660-adsp-pas
+              - qcom,sdm660-cdsp-pas
               - qcom,sdm845-adsp-pas
               - qcom,sdm845-cdsp-pas
               - qcom,sdm845-slpi-pas
@@ -125,6 +128,7 @@ allOf:
               - qcom,msm8996-adsp-pil
               - qcom,msm8998-adsp-pas
               - qcom,sdm660-adsp-pas
+              - qcom,sdm660-cdsp-pas
     then:
       properties:
         power-domains:
@@ -181,6 +185,7 @@ allOf:
               - qcom,msm8998-adsp-pas
               - qcom,msm8998-slpi-pas
               - qcom,sdm660-adsp-pas
+              - qcom,sdm660-cdsp-pas
     then:
       properties:
         qcom,qmp: false

-- 
2.51.1


