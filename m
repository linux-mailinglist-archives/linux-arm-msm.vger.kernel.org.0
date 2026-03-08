Return-Path: <linux-arm-msm+bounces-95997-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iEiJALrFrGnTuAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95997-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 08 Mar 2026 01:41:30 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 909B522E26F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 08 Mar 2026 01:41:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8D5903014C53
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Mar 2026 00:41:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7969922423A;
	Sun,  8 Mar 2026 00:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="bFmFig6W";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="Klfz1DKM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26FC522256F;
	Sun,  8 Mar 2026 00:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772930455; cv=none; b=bZKXSAuZ0YfeCEyEzXqXLpZ4ZxEqx+N4z5jou18uj4ir92ftqSe3tNgOf7wOm1x+ij0KETCp16AQI9ro36C+jOz1+v5BaA0emllX/xwj56qKJ605MXL/gPLVB0YsnsernuJCbPeLPh+l6tanawQRCaOxvbkNzITdx1T3O2xvc/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772930455; c=relaxed/simple;
	bh=PV5HOSY8dG4JQ9a9Lf9pv7ApBS105+RPc2PVXbwO36w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Dh+rsId9JATxWfpY6zG5PRMCGchVBAWifwuGnrwCJZ8Y4w413Aqwk+4WXNSJREaNuh2Rejdv8JZH2xLSXA9UCPwROwANKSQJW6kvJNpJdL8RV2sA+8gPHkbScSYz0btVH8/85UuiQiR+CEFFSbm9VufQf2Di38oIwSdEEz26ttM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=bFmFig6W; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=Klfz1DKM; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1772930384; bh=xbx6TU4jfnpq72IWABUQiEH
	UwT8jYRPG1/eGQS2LZok=; b=bFmFig6WMRVDqWtetvFXd7p1vYm5j4uRq3QZacX5sRqFGK53nb
	lxkZCZrLHEQQTVToVXN9T9QEoa822EQdcRBs5u4cniLJTwdAVXh5oTlVvmUUHwuWAnD/U5lV/vj
	mASDc9A2/VuArI3bL+AAawdWWP6iK1+jy8/MQi8di0qzL/Z/gdMoJfdiIgdH1WnA8UtJERJo7mX
	nCN2Hgm29lXRtWXc8fbdL1QcbA6UFcawQJHOPpRRiTQ/Um95/F/dwZDm7DRibIzZnbns0VZkocj
	Z0Kta0zoBhByhr3l51Mm0XTkfpLzegdL0YyWuntV9iBeM6O55drOdNPeZUPV50VwVgQ==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1772930384; bh=xbx6TU4jfnpq72IWABUQiEH
	UwT8jYRPG1/eGQS2LZok=; b=Klfz1DKMInjWORQPQs5jy0ZwQ2BCWwaJloRq1yolraBmhNZ0ew
	IejfGtnk8Xj9aX51QWULQY1N/9M32Si6x/AA==;
From: Aelin Reidel <aelin@mainlining.org>
Date: Sun, 08 Mar 2026 01:39:28 +0100
Subject: [PATCH 2/4] dt-bindings: clock: qcom: Document the Fillmore RPMH
 Clock Controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260308-fillmore-clks-v1-2-976d9a6bebe7@mainlining.org>
References: <20260308-fillmore-clks-v1-0-976d9a6bebe7@mainlining.org>
In-Reply-To: <20260308-fillmore-clks-v1-0-976d9a6bebe7@mainlining.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux@mainlining.org, phone-devel@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, Aelin Reidel <aelin@mainlining.org>
X-Mailer: b4 0.14.2
X-Rspamd-Queue-Id: 909B522E26F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mainlining.org,reject];
	R_DKIM_ALLOW(-0.20)[mainlining.org:s=202507r,mainlining.org:s=202507e];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95997-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aelin@mainlining.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[mainlining.org:+];
	NEURAL_HAM(-0.00)[-0.963];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mainlining.org:dkim,mainlining.org:email,mainlining.org:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

Add bindings documentation for the Fillmore (e.g. SM7450) RPMH Clock
Controller.

Signed-off-by: Aelin Reidel <aelin@mainlining.org>
---
 Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
index 3f5f1336262ee60bb29c2fcea4a9212ccf7920f4..9e5d64865fc17cf5a13c242d992af70587bf2688 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
@@ -17,6 +17,7 @@ description: |
 properties:
   compatible:
     enum:
+      - qcom,fillmore-rpmh-clk
       - qcom,glymur-rpmh-clk
       - qcom,kaanapali-rpmh-clk
       - qcom,milos-rpmh-clk

-- 
2.53.0


