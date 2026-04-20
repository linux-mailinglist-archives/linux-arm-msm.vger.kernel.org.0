Return-Path: <linux-arm-msm+bounces-103777-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iHoBOOA/5mlutgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103777-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 17:01:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E47542DB97
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 17:01:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2111E378DEEA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 14:24:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74FAC481228;
	Mon, 20 Apr 2026 13:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K2CEkVG1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DAA3481223;
	Mon, 20 Apr 2026 13:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776691895; cv=none; b=lbY1NQ6WF4DaGZef00DCl3KgYsiuxyO70+0x6+x/7m5DIn2KtEabPvuJbXTqaOlR2C481juMEKaoIfYPktYthkGx7nej+qFfh4bvkJn4D5rtp7KctCMEUr5EVHOJ6/uoDFFkkqXb4FEkLedogypEt6jhgcrTsFg5GBZ2VBR1/wQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776691895; c=relaxed/simple;
	bh=PMzgIL3qxQQdKE/EbUv8KvWYkYdmTuM5uD9ep8Nrghk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nKWlsNk+5s+8n40d+UwOzyEg0fK+I14hDwwWCq3jKpBs6BSGqCBOodKOcjFoeltksVtun+F9YAovT0UB+CZ0xNaUHm1cKXJyrnYYzmwtn4k2ZMfhbWvFkYcJwioK4cF4WdhbuQVBhQaJaWdZF9OCaOWWGdgPFFa/EdvFaAKFaQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K2CEkVG1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4D0EC2BCB6;
	Mon, 20 Apr 2026 13:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776691895;
	bh=PMzgIL3qxQQdKE/EbUv8KvWYkYdmTuM5uD9ep8Nrghk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=K2CEkVG1EpBKS7HzvToLQJSeDYVhcAUWznYmT950CQSMzt4gDSEsO4/ZlmQkRXNcF
	 Eu1e5HQWvgiXMKiOL10dQS0ieAcAjWsxWovvU8vtrOVmWn2KsWLojlijKxsuTksdP5
	 vIqoUS2GythwVU4PWb0iTSJRXeqQ8pEeCrWPE/Gj9bfiDWkLH+EJQ2gyfHHeHSKT3x
	 ZHApnjHG2N2k65CmC1/lgdA+S5srHbwNJ1PjVJNKlMr8MR+HHnWzV0DnF1QSeahY/a
	 c6TTw+NCGD6LFAq5HpJ9q4Jb8+RoEvI+AYaEIbtMNhXwyQztAb1tdg5VEQmJa692Be
	 8jC2R5ANLasFg==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Ravi Hothi <ravi.hothi@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mohammad.rafi.shaik@oss.qualcomm.com,
	quic_pkumpatl@quicinc.com,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH AUTOSEL 6.18] arm64: dts: qcom: qcm6490-idp: Fix WCD9370 reset GPIO polarity
Date: Mon, 20 Apr 2026 09:20:50 -0400
Message-ID: <20260420132314.1023554-256-sashal@kernel.org>
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
	TAGGED_FROM(0.00)[bounces-103777-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	RSPAMD_EMAILBL_FAIL(0.00)[konrad.dybcio.oss.qualcomm.com:query timed out];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.987];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8E47542DB97
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Ravi Hothi <ravi.hothi@oss.qualcomm.com>

[ Upstream commit b7df21c59739cceb7b866c6c5e8a6ba03875ab71 ]

The WCD9370 audio codec reset line on QCM6490 IDP should be active-low, but
the device tree described it as active-high. As a result, the codec is
kept in reset and fails to reset the SoundWire, leading to timeouts
and ASoC card probe failure (-ETIMEDOUT).

Fix the reset GPIO polarity to GPIO_ACTIVE_LOW so the codec can properly
initialize.

Fixes: aa04c298619f ("arm64: dts: qcom: qcm6490-idp: Add WSA8830 speakers and WCD9370 headset codec")
Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Link: https://lore.kernel.org/r/20260220090220.2992193-1-ravi.hothi@oss.qualcomm.com
Signed-off-by: Bjorn Andersson <andersson@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

Error: Failed to generate final synthesis

 arch/arm64/boot/dts/qcom/qcm6490-idp.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
index 73fce639370cd..214671b462770 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
@@ -177,7 +177,7 @@ wcd9370: audio-codec-0 {
 		pinctrl-0 = <&wcd_default>;
 		pinctrl-names = "default";
 
-		reset-gpios = <&tlmm 83 GPIO_ACTIVE_HIGH>;
+		reset-gpios = <&tlmm 83 GPIO_ACTIVE_LOW>;
 
 		vdd-buck-supply = <&vreg_l17b_1p7>;
 		vdd-rxtx-supply = <&vreg_l18b_1p8>;
-- 
2.53.0


