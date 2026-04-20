Return-Path: <linux-arm-msm+bounces-103779-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qHmyNfFQ5mkDuwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103779-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 18:14:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 441EB42F2FB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 18:14:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4967833ECEB1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 14:28:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19799492196;
	Mon, 20 Apr 2026 13:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M40yHFyQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E31D049218D;
	Mon, 20 Apr 2026 13:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776691935; cv=none; b=LGc8dJJWAYbTZte5Cmm4cL5OClhQx5edGMkeKfcoBoVHZmvYcZX4U9S0HRyVKrnTzFsOmHr1f7BjEdZH6sHDeRnHA+Oaup8v4xCYoS7b2oza4eLrv4Mdn/L4eloRlw9e/gGl7wWHC8VVw153+jwnORcHDc6xm74iS6Iyxn/sbms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776691935; c=relaxed/simple;
	bh=zH+XapoQ+nsRLPDH7ug+1YBImNv/ttzA7g3bA3wdVXg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Cix9YX+WgpfgynHNFH6G+tUE0rooVtiX42JGfnPELqs9lxU1gSCe1Hwz5c5YXUD4aRoYBJ+Ubq4X6BOcfqiWBKlagYmcd0afEjVdIsrA1852cRTHfvbOAJm4uCFQocH/VicD5CBlmNG/HHjtqwhF3gvZ63LnzSlJNf3/8+TCSC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M40yHFyQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C6AFC2BCB4;
	Mon, 20 Apr 2026 13:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776691934;
	bh=zH+XapoQ+nsRLPDH7ug+1YBImNv/ttzA7g3bA3wdVXg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=M40yHFyQI87rxlDZKUpoU8845PCaKcK2q/DH1XQHMbUeF6s924G5mzAsvuJfA5JlK
	 lllmCmWVHdMwn1T/P8oPqZQo73gcMdOQNpBCjlGAsTCBIU6WJRYwGzYfxtj1Aby71K
	 8OslIPH4fA0qBHv5h3jhtbC/0z0vveJgBleb/5hqwUSTYRrhRQSccfXFKTJJFMuZK4
	 TkhF7D2mv750ZSxVROcRtE+8RHRMNiURasKWXQjtCkHftUgUlmiKWhMNG3n6jDgBkk
	 7+hdSjBoiEfAlafEoIfM4aTALq60BdTnHBhcqG7DwPtO6EUdfwyKmFX1ksN1lucxrD
	 m2aXUY/tgpgTA==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	quic_msavaliy@quicinc.com,
	quic_vdadhani@quicinc.com,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH AUTOSEL 6.18] arm64: dts: qcom: monaco: Fix UART10 pinconf
Date: Mon, 20 Apr 2026 09:21:12 -0400
Message-ID: <20260420132314.1023554-278-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260420132314.1023554-1-sashal@kernel.org>
References: <20260420132314.1023554-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.18.23
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-103779-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.987];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 441EB42F2FB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Loic Poulain <loic.poulain@oss.qualcomm.com>

[ Upstream commit 5b2a16ab0dbd090dc545c05ee79a077cc7a9c1e0 ]

UART10 RTS and TX pins were incorrectly mapped to gpio84 and gpio85.
Correct them to gpio85 (RTS) and gpio86 (TX) to match the hardware
I/O mapping.

Fixes: 467284a3097f ("arm64: dts: qcom: qcs8300: Add QUPv3 configuration")
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Link: https://lore.kernel.org/r/20260202155611.1568-1-loic.poulain@oss.qualcomm.com
Signed-off-by: Bjorn Andersson <andersson@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

Error: Failed to generate final synthesis

 arch/arm64/boot/dts/qcom/qcs8300.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs8300.dtsi b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
index 8d78ccac411e4..b8d4a75baee22 100644
--- a/arch/arm64/boot/dts/qcom/qcs8300.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
@@ -5430,12 +5430,12 @@ qup_uart10_cts: qup-uart10-cts-state {
 			};
 
 			qup_uart10_rts: qup-uart10-rts-state {
-				pins = "gpio84";
+				pins = "gpio85";
 				function = "qup1_se2";
 			};
 
 			qup_uart10_tx: qup-uart10-tx-state {
-				pins = "gpio85";
+				pins = "gpio86";
 				function = "qup1_se2";
 			};
 
-- 
2.53.0


