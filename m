Return-Path: <linux-arm-msm+bounces-110604-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IPQpOt2GHWrAbQkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110604-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 15:19:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 034A061FE88
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 15:19:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2BFBE3004C95
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jun 2026 13:19:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A6193A59B1;
	Mon,  1 Jun 2026 13:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WeqAE2IO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D1FD376A05;
	Mon,  1 Jun 2026 13:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780319953; cv=none; b=KlAddsSyoYMkRwIBR2pwYafcx6n6yxQrs3N1b7z1LBSzLQYSjOIIW1IU3XPjTkt8tgLDMxfB8p4fC69aRF6G07KosJrfm6qLOuxJG6M6Fbo7LFxQZeKqUdtGhCp54sj1Z6LUbSZnBTPLwYEYCUoMF8KpPVPdFuMyqUDZTt33nHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780319953; c=relaxed/simple;
	bh=ShW9Ricl3pdsDQmWHAT9WtSifRMHSURnw6DOL8FJBD0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FAbcuMVUKi+aKp1wN7xxZrfc6q6BOIb2HXKR53r0MmrPYiqrb9tIt7c7abES+avncul+XL2exyWnzE96MCW0r1NF19UMzR1YJkt+t36bC3yYb4AbUUFsxibqR7CoHTOQzDkC3ovWa+QQOkypcPsh375N4ie9gQn8WtoVDdX1JMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WeqAE2IO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 06999C2BCF4;
	Mon,  1 Jun 2026 13:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780319953;
	bh=ShW9Ricl3pdsDQmWHAT9WtSifRMHSURnw6DOL8FJBD0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=WeqAE2IOxUvZ9Khuc4yNKnzcHsCffjHLuZkR0PevFGBJz74FbvYzBW/YbWXvMtdJ1
	 ucAVsL0Z51NZDl0Z+Bd3opDwXMKQnycqqN+8Z6R/tmgdi1SNydtdA2FfU0sIbRBGXh
	 SkLuxKuGcfh1hdczOWwaDwn4QZDEj2ArTcJdF6CkV1hQ3dmXUTIzgWvlnclSs/zvbr
	 aRFBeyiCmJgErYrMXpAOC1V0AzPJt8jVB0f7cD2ujeGfdOIXkMb/OskhIDgVXeNRnl
	 BHzPmYGozX2Ighyoxj0HVICPHeTj/rRwRpusHieQBNA47ryWdz90UN6mYeOCV2y+BO
	 Ytz+AIRJPzA9w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF65BCD5BD1;
	Mon,  1 Jun 2026 13:19:12 +0000 (UTC)
From: George Moussalem via B4 Relay <devnull+george.moussalem.outlook.com@kernel.org>
Date: Mon, 01 Jun 2026 17:19:09 +0400
Subject: [PATCH 2/3] arm64: qcom: ipq5018: Add GEPHY RX and TX clocks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260601-ipq5018-gephy-clocks-v1-2-2df8287712c3@outlook.com>
References: <20260601-ipq5018-gephy-clocks-v1-0-2df8287712c3@outlook.com>
In-Reply-To: <20260601-ipq5018-gephy-clocks-v1-0-2df8287712c3@outlook.com>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 linux-arm-msm@vger.kernel.org, 
 George Moussalem <george.moussalem@outlook.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780319950; l=821;
 i=george.moussalem@outlook.com; s=20250321; h=from:subject:message-id;
 bh=ZUcDzKT3pAn1GyMp8FWZKORP9V8n09/s7Z10uOma/1w=;
 b=JqFr7y43SPRkIzRRff/Vc9u8059ar/Vq4NriBUp+X1yEWQvaAQjk/FokPlT2yIWNPlQmoq4wH
 Huriw7ZpG+jA9mAvOl8P+VkuG8sVD/mGXL5eSfyy9Pas36Agxp97MP9
X-Developer-Key: i=george.moussalem@outlook.com; a=ed25519;
 pk=/PuRTSI9iYiHwcc6Nrde8qF4ZDhJBlUgpHdhsIjnqIk=
X-Endpoint-Received: by B4 Relay for george.moussalem@outlook.com/20250321
 with auth_id=364
X-Original-From: George Moussalem <george.moussalem@outlook.com>
Reply-To: george.moussalem@outlook.com
X-Spamd-Result: default: False [1.34 / 15.00];
	FREEMAIL_REPLYTO_NEQ_FROM(2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110604-lists,linux-arm-msm=lfdr.de,george.moussalem.outlook.com];
	FREEMAIL_TO(0.00)[lunn.ch,gmail.com,armlinux.org.uk,davemloft.net,google.com,kernel.org,redhat.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_REPLYTO(0.00)[outlook.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	HAS_REPLYTO(0.00)[george.moussalem@outlook.com];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-0.995];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,oss.qualcomm.com,outlook.com];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DKIM_TRACE(0.00)[kernel.org:+];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,outlook.com:replyto,outlook.com:mid,outlook.com:email,0.0.0.7:email]
X-Rspamd-Queue-Id: 034A061FE88
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: George Moussalem <george.moussalem@outlook.com>

Add RX and TX clocks for the IPQ5018 GEPHY to enable the datapath.

Fixes: f5f2b835e316 ("arm64: dts: qcom: ipq5018: Add GE PHY to internal mdio bus")
Signed-off-by: George Moussalem <george.moussalem@outlook.com>
---
 arch/arm64/boot/dts/qcom/ipq5018.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5018.dtsi b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
index 6f8004a22a1f..60c27a6f2b10 100644
--- a/arch/arm64/boot/dts/qcom/ipq5018.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
@@ -229,6 +229,9 @@ ge_phy: ethernet-phy@7 {
 				compatible = "ethernet-phy-id004d.d0c0";
 				reg = <7>;
 
+				clocks = <&gcc GCC_GEPHY_RX_CLK>,
+					 <&gcc GCC_GEPHY_TX_CLK>;
+				clock-names = "rx", "tx";
 				resets = <&gcc GCC_GEPHY_MISC_ARES>;
 			};
 		};

-- 
2.53.0



