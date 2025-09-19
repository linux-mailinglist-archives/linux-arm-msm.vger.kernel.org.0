Return-Path: <linux-arm-msm+bounces-74184-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 890EBB8978A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Sep 2025 14:37:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 563151C878E0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Sep 2025 12:38:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AD801E5B73;
	Fri, 19 Sep 2025 12:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="iafKBMAn";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="6XwjPMJk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77DC41DA62E;
	Fri, 19 Sep 2025 12:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758285461; cv=none; b=CMS8+4D0D12CDZj9uhu0F1NZKsekvJrFFrlMyLAYsP7ixV2sbOqCvDMYx0Vq2KNiIQUn7DKGoSynVWaV8k8Z35MeYZnQFnIeuFhNSJ7b07v5RhaEjzET1j+AGVFaIdK59tSPbUrufTOy86iQ+wDCjPsZpJFvBu4Is40WSsxNCcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758285461; c=relaxed/simple;
	bh=Cfh7jKCIIdh0ilsuaB7h/MSlYkhLkr2BKLhXRvpHUWc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=brzJxoimRgoMYSfdJmLNChFSW9kjJYa9EyNGUDXBr4SQpa4EB6zaHfjbiyR5UvjLaL/ZBf6AmvaqTdkKeX/xL2WTk+nSycMWyAgn0mIH+VzQH9n+F/XdKqpdnjYlpi1QJ4JolWqiKiQwzy8Lun2HfwpP/sfIOoxHLD05C3Mk//s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=iafKBMAn; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=6XwjPMJk; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1758285281; bh=cE4YyDikLXUbR2I09c3gZ0I
	Uijha+U7iyL4uJQme8R0=; b=iafKBMAnqbhfA87Pt3Sev9F7isZPfrZ88XQcDzoHs8h0T3UXhN
	5qWkhKFhUvlfU03tbN4xdFm70HUEekgTOH5mctfxn9uzFsIDIdgqPvRoYRmgkrj4n4pLPLH+Dl0
	Fr3u0D8h48+vMTB+e4Rvqw/XyX8bBI0o52W6jTHsBkrDMiLz3DMa13ZCBsXjZH0smaEVwDbtMbG
	Gv57fWjH3b2peWEYF4mjKFMUSWMDkZAN6U+19iSeFVL6HzJ12HGB/vJhk4Ce/Hx4WLJNxXgv1pM
	YZsCepv5YSz+oD8ZVw07nYHQc+chyqzpKE7SfEbBh6prifhAVsdt4cumqgqjeLntyGA==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1758285281; bh=cE4YyDikLXUbR2I09c3gZ0I
	Uijha+U7iyL4uJQme8R0=; b=6XwjPMJkQX0ZTtQSVwDr7QQE9krj4y51fbxD2w9+gZaRF3pIKE
	k6pk2fcwC0I+pn3E/winjhkc81JEartUdUBA==;
From: Jens Reidel <adrian@mainlining.org>
Date: Fri, 19 Sep 2025 14:34:30 +0200
Subject: [PATCH 1/3] dt-bindings: clock: sm7150-dispcc: Add MDSS_CORE reset
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250919-sm7150-dispcc-fixes-v1-1-308ad47c5fce@mainlining.org>
References: <20250919-sm7150-dispcc-fixes-v1-0-308ad47c5fce@mainlining.org>
In-Reply-To: <20250919-sm7150-dispcc-fixes-v1-0-308ad47c5fce@mainlining.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Danila Tikhonov <danila@jiaxyga.com>, 
 David Wronek <david@mainlining.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, linux@mainlining.org, 
 ~postmarketos/upstreaming@lists.sr.ht, Jens Reidel <adrian@mainlining.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=741; i=adrian@mainlining.org;
 h=from:subject:message-id; bh=Cfh7jKCIIdh0ilsuaB7h/MSlYkhLkr2BKLhXRvpHUWc=;
 b=owGbwMvMwCWmfPDpV6GDysyMp9WSGDLO+j5gsMtbukdsze9noifq/ssmrje7JKC54dCneT9FI
 iostTOXdJSyMIhxMciKKbLU30gwuWr97dD8fJvVMHNYmcCGcHEKwES67jP8r9FX2J02QXT9wcXn
 VFeYlidM1mr8u3vlXJHjZw0SGk8dcWP4X6Auw77bKphRYc19jccRhsvDX9QZXnLr1D/pLrtBvOc
 wJwA=
X-Developer-Key: i=adrian@mainlining.org; a=openpgp;
 fpr=7FD86034D53BF6C29F6F3CAB23C1E5F512C12303

Add the index for a reset inside the dispcc on SM7150 SoC.

Signed-off-by: Jens Reidel <adrian@mainlining.org>
---
 include/dt-bindings/clock/qcom,sm7150-dispcc.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/dt-bindings/clock/qcom,sm7150-dispcc.h b/include/dt-bindings/clock/qcom,sm7150-dispcc.h
index fc1fefe8fd7248bb160816cebb8cc4c51615a8dc..1e4e6432d5065b1dd3daed5b382732c9c9c09444 100644
--- a/include/dt-bindings/clock/qcom,sm7150-dispcc.h
+++ b/include/dt-bindings/clock/qcom,sm7150-dispcc.h
@@ -53,6 +53,9 @@
 #define DISPCC_SLEEP_CLK			41
 #define DISPCC_SLEEP_CLK_SRC			42
 
+/* DISPCC resets */
+#define DISPCC_MDSS_CORE_BCR			0
+
 /* DISPCC GDSCR */
 #define MDSS_GDSC				0
 

-- 
2.51.0


