Return-Path: <linux-arm-msm+bounces-48293-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 62D4FA38EAE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 23:09:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 283B03A648C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 22:06:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69D741B4141;
	Mon, 17 Feb 2025 22:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="nO6GCS4y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC28B1AF0B7;
	Mon, 17 Feb 2025 22:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739829962; cv=none; b=Yt/hFKCG/pcDLpDLFCUsQcna4oNA5Tt9q5pR+T9rW6Ii4LDD9SwGlrwiY2TiXDXFZD6e5+UqEFX1oZGsl2NmNqQaIx6+IUsd492oHbV/JcfPnlmyMDMDlMr+nYuG1DHSngXDRurqXD8grXgtny/Fudm1bkpiH0fMJg+GIgepa+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739829962; c=relaxed/simple;
	bh=jpy5uWscm5n25aeooQjOuugzo/l5xnqC2dhnFTaNXq0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SouBlKyp1hz9wqkUjwX0gaNiJjWFs27dtLVQ0K25rgtnVA9+dQ24lq4sr8W0Iv+RyDjZ5L3kaxgnQ4oqRJ5vrWN8SmeZvGCuU55iu4iCnxBGLS/5Ik6V288BMcYHyQJF4ZYQMOrgC60j+AyRPubCBNQXpKIh1mL5whpp281lBDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=nO6GCS4y; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1739829949; bh=jpy5uWscm5n25aeooQjOuugzo/l5xnqC2dhnFTaNXq0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=nO6GCS4yu2/3IjXpqMOIDjQqbzHEhEF0vd7rG2Qmi6lvEpuRN3MvaArFlctnvZtzC
	 DBIpcbfA6X2/YSug1aaGQUmVW8rI145twBcaUU2WvLm3NCR5MVCPy8NzLTiT1PmyXv
	 YjbQZSVEQ0HwikoY3QP7Manj5YCTmMhP2tmiKJjE=
From: Luca Weiss <luca@lucaweiss.eu>
Date: Mon, 17 Feb 2025 23:05:21 +0100
Subject: [PATCH v5 07/13] ARM: dts: qcom: msm8226: Add node for TCSR halt
 regs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250217-msm8226-modem-v5-7-2bc74b80e0ae@lucaweiss.eu>
References: <20250217-msm8226-modem-v5-0-2bc74b80e0ae@lucaweiss.eu>
In-Reply-To: <20250217-msm8226-modem-v5-0-2bc74b80e0ae@lucaweiss.eu>
To: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Stephan Gerhold <stephan@gerhold.net>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 =?utf-8?q?Matti_Lehtim=C3=A4ki?= <matti.lehtimaki@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca@lucaweiss.eu>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=977; i=luca@lucaweiss.eu;
 h=from:subject:message-id; bh=EG1Yxy7Ssf9FR6CqB3nM5wo8JTRgwLQbA7US32NjMDg=;
 b=owEBbQKS/ZANAwAIAXLYQ7idTddWAcsmYgBns7K1h2ZEO1NoQMm7lsMw/nevMv/6YlcD7SfrQ
 +uMfUXDO6SJAjMEAAEIAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCZ7OytQAKCRBy2EO4nU3X
 VvoIEADaXo8Yg1ff5ApnAnwmd81sgu+nlCM2k99JFmBSM72AtDKaCgATLSKD9w9gul/TB03vjNo
 KXnTX5KdvsFvrZzOYVfjMvDTu973BLO4r4emD7n1GZq6rEYew58GF6SE89Kqmy725QuCz0L25mY
 cC8oWajHcsQ8Qc2el+VgDbe0tirKuKsAKxIaD5/YhhiniIAGJk+riIR0U9K/Hxj92u6MEF4jQA5
 nfWaqzk85hdHPQYPuVw7guHburDNt2d45PijS+ErfwYCtUChfYPA96BzJR78JgEeXqnHcuds2iH
 oqtzoSTbRX7ePMzypIXymgKPCSxgt+ncAUYplKjwpN8nlLXZUmGhOjGotobi15olq0WZue1yj7x
 pJGipVNbq2uJZr1tJqdf1JIJ6kuknaJZF6acgevdt8mdUF4N8p9jHCzwxgYp6Hip13s11oDelPN
 Zfp551CKIoEmUKxwuLoGRRm5ujY7c8h0roHBy3wPuZ8H+Yr1Q5FyOMmOMyI/RAWC7XHbx2Gpwty
 4QdMQimmfpDqE97ZM3wfMhzJEqVJrhPk8GkAwK/iDKJRRk32oNg1+izScYLoP7WCkXzHMSBvg7i
 hkRQM8QyUotM2NvxUGaRnPc/AjhIW6SlH7QCPyn12X8Vzh4fcW8MNJR/vXWj0Y7fldfi6kY1akC
 aWyfJ1Yv6LI9mXg==
X-Developer-Key: i=luca@lucaweiss.eu; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD

From: Matti Lehtimäki <matti.lehtimaki@gmail.com>

Add a syscon device node for the TCSR halt regs needed by
modem and other remoteprocs.

Signed-off-by: Matti Lehtimäki <matti.lehtimaki@gmail.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
---
 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8226.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8226.dtsi
index 64c8ac94f352e46dc4a18f902d2c30114ecd91d2..caaeeadf289f78d29403312738bbb714eaad74d2 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8226.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-msm8226.dtsi
@@ -851,6 +851,11 @@ tcsr_mutex: hwlock@fd484000 {
 			#hwlock-cells = <1>;
 		};
 
+		tcsr_regs_1: syscon@fd485000 {
+			compatible = "qcom,tcsr-msm8226", "syscon";
+			reg = <0xfd485000 0x1000>;
+		};
+
 		tlmm: pinctrl@fd510000 {
 			compatible = "qcom,msm8226-pinctrl";
 			reg = <0xfd510000 0x4000>;

-- 
2.48.1


