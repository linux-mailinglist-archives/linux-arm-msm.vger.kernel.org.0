Return-Path: <linux-arm-msm+bounces-108937-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +Gj5Npa6DmrBBgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108937-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 09:56:06 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DE575A07BA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 09:56:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B70083016B5F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 07:56:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B35E0345CAB;
	Thu, 21 May 2026 07:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CG2kzxWV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F9DC23D297;
	Thu, 21 May 2026 07:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779350164; cv=none; b=n1cg+wRiqrcs5pWGLwwavu8eh0FyNyTf6UcaqathUBwA9VherafqSOUCzJNIdGdNhxCZbeHMsBm5Mlr6Zp2IRGOl2xEu1HA7QqK280J6to5HWQaGrjOylzi48bRZMs9vr/3yfAh2MZnIPRxCb3oDBn1f3oVgkm34TFUhZsH/UdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779350164; c=relaxed/simple;
	bh=L9GKhm39OqOrgwBGOextbcDeNLhrgqXllGWCajD0NfY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=s0cvf/eOujTxgPBddEneNxMwovLFpkVbflZ9eHDrw83BdLgR2vzZXyYWnq/qHm/vs/unpKBL+Cmc1pFBTWVgjsBtOqj1eoPN+Tyu1ow8jClIzWu7VDegnJd/Gx6BHMqOlDbEOYulND6Rr350GEwTQ6goqI8zQj+f/MeCqxdhzxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CG2kzxWV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 32688C2BCB4;
	Thu, 21 May 2026 07:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779350164;
	bh=L9GKhm39OqOrgwBGOextbcDeNLhrgqXllGWCajD0NfY=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=CG2kzxWV08uEOoFXl2nqfrArYB4ot99PAuMCUJVRwO1Dyc/IOOx+OX9AD/pZxUUCV
	 5APCX+eCapvR5drX2uL5JPYO5xq2cYWdYvG3qIy30PW1EWKuOy2E9OzCKu7fElHZy/
	 dJTs4ElDWGnTbxk9D0ksmj1hlYNWxEAbesuP5j/sJ22ZhJqXpIzSjQQVGDxiO7Uq4g
	 /lq15ohdIYMmUWS2HNaLBzMLwpfIq0QWR4MzWkv6Y9XUfS/nFHcUqr5rVo9WYLAkYe
	 cpP9sCCcMLIeucuC0pTaqgSgRZB6YPqj99jIBxbp8GB2pI52jre+v2fJeamgIKDu1D
	 KlXVEMvh+YMUg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AF2ACD5BAB;
	Thu, 21 May 2026 07:56:04 +0000 (UTC)
From: George Moussalem via B4 Relay <devnull+george.moussalem.outlook.com@kernel.org>
Date: Thu, 21 May 2026 11:55:58 +0400
Subject: [PATCH v2] arm64: dts: qcom: ipq5018: Correct CMN PLL reference
 clock rate
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-ipq5018-cmn-pll-rate-fix-v2-1-04b28a92e0f2@outlook.com>
X-B4-Tracking: v=1; b=H4sIAI26DmoC/42NQQ6CMBREr0K69pv+Nkhx5T0Mi1I/UgWKbSEaw
 t0teAGXbzIzb2GBvKXAztnCPM02WDckEIeMmVYPdwJ7S8wEFyeeYwl2fOUcFZh+gLHrwOtI0Ng
 3SKW0LMq6IeQszUdPKd6vr9WPw1Q/yMTtb2u0NkTnP7t7xq33h2ZGQJBGSY2FNKJoLm6KnXPPo
 3E9q9Z1/QLBrr0s1AAAAA==
X-Change-ID: 20260519-ipq5018-cmn-pll-rate-fix-388a379bfe10
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luo Jie <jie.luo@oss.qualcomm.com>, 
 George Moussalem <george.moussalem@outlook.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779350162; l=1492;
 i=george.moussalem@outlook.com; s=20250321; h=from:subject:message-id;
 bh=DLb/tXUr0dUrKVVXoLsmCJhHr76Y7PIwpW35qV9SqTo=;
 b=B8YbIqqllT59DBqqIioopKJlmiOy6l1WtFqFuFnd01++rRQ7meOpv1u/QHS6GaikX24qwJY3f
 3ie6CK8U/PaDt/YSbSvLHNEkiiZBXZjsAy3HSlbaWwG4XuHu4hEk9RV
X-Developer-Key: i=george.moussalem@outlook.com; a=ed25519;
 pk=/PuRTSI9iYiHwcc6Nrde8qF4ZDhJBlUgpHdhsIjnqIk=
X-Endpoint-Received: by B4 Relay for george.moussalem@outlook.com/20250321
 with auth_id=364
X-Original-From: George Moussalem <george.moussalem@outlook.com>
Reply-To: george.moussalem@outlook.com
X-Spamd-Result: default: False [-0.16 / 15.00];
	FREEMAIL_REPLYTO_NEQ_FROM(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108937-lists,linux-arm-msm=lfdr.de,george.moussalem.outlook.com];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_REPLYTO(0.00)[outlook.com];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,vger.kernel.org,outlook.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	HAS_REPLYTO(0.00)[george.moussalem@outlook.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,outlook.com:replyto,outlook.com:mid,outlook.com:email,msgid.link:url,a0000:email]
X-Rspamd-Queue-Id: 7DE575A07BA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: George Moussalem <george.moussalem@outlook.com>

The correct CMN PLL reference clock rate for IPQ5018 is 4.8 GHz.

The CMN PLL driver did not account for the ref clock divider which is 2
for IPQ5018. Therefore, the computed rate was twice the actual output.

With the driver now accounting for the CMN PLL reference clock
divider (commit: 88c543fff756), set the correct reference clock rate.

Fixes: c006b249c544 ("arm64: dts: ipq5018: Add CMN PLL node")
Signed-off-by: George Moussalem <george.moussalem@outlook.com>
---
Changes in v2:
- Removed line break in commit message between Fixes and SOB tags
- Link to v1: https://patch.msgid.link/20260519-ipq5018-cmn-pll-rate-fix-v1-1-3c83a173c27f@outlook.com
---
 arch/arm64/boot/dts/qcom/ipq5018.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq5018.dtsi b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
index 6f8004a22a1f..f6cf2cca44eb 100644
--- a/arch/arm64/boot/dts/qcom/ipq5018.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
@@ -256,7 +256,7 @@ cmn_pll: clock-controller@9b000 {
 				      "sys";
 			#clock-cells = <1>;
 			assigned-clocks = <&cmn_pll IPQ5018_CMN_PLL_CLK>;
-			assigned-clock-rates-u64 = /bits/ 64 <9600000000>;
+			assigned-clock-rates-u64 = /bits/ 64 <4800000000>;
 		};
 
 		qfprom: qfprom@a0000 {

---
base-commit: 80dd246accce631c328ea43294e53b2b2dd2aa32
change-id: 20260519-ipq5018-cmn-pll-rate-fix-388a379bfe10

Best regards,
--  
George Moussalem <george.moussalem@outlook.com>



