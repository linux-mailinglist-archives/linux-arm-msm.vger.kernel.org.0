Return-Path: <linux-arm-msm+bounces-89826-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YKGKLUGTcGlyYgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-89826-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 09:50:09 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FDA953DA1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 09:50:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id CD84C88420A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 12:26:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5658E428475;
	Tue, 20 Jan 2026 12:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BKO9GSfk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 247803A1CE2;
	Tue, 20 Jan 2026 12:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768911869; cv=none; b=KySZdaKGL3LMd6h+Awwt6s0YQNz3+zzTj9sG/vNkVZA0JwbbZnMmttJByJcGm2aLSrVcZV7DizzY1I4UdmWO80bvaFOrFMUD8PeWYbjHMzGw67HRVZ3vH96y6NV5KTJp1YTvlxgq87dlTBLIhEjS5dDvmZhhh0GQ42dOD8OlX8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768911869; c=relaxed/simple;
	bh=2TE/Ipsx9/X6kAVmUoNRFtQEKDXqXwJR04Pn5vRDv/Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ui5Uk8lBpUxYaLMdJQbhV29LbSAWjv5+tyNlltJV/SgF434N9j+pIhf9zONtGfcU2+tTVn76JBVd7LLgXDuqihkJOiAdO5kJ+MV5fNAXjnKIGkz4vZMLm6PoNIffOCJiJ3bIEs8ZpFCZuplZeuQPkdXlAnvRZV5Yfy9IUVyKviU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BKO9GSfk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0279DC2BC9E;
	Tue, 20 Jan 2026 12:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768911869;
	bh=2TE/Ipsx9/X6kAVmUoNRFtQEKDXqXwJR04Pn5vRDv/Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=BKO9GSfkMcCKenJ282hzJEOMCDCxlGsIt0TFkXqsLgvJzVAyGUTWNWfLG5NRdKV9v
	 E5FBEUrD9HgxFFCWtHGWV8kqn3QMCcGYEmAF5QHDocyTLG0SgWo8od8k/opLiRxRtt
	 MMwer7pD6yE252ms26oFwKn6roQsuXaSYQXSBb8iXAdJeLjDpf2ORJjteo5w5djzPu
	 8gonTuaPl/MzWQ3zE68+ows9A+NZIDB4gqIYt/3iRx+/yvWQcjAXG0i+WbTzhOt7NO
	 U86NYcyw1mSy0cPBHNZEBS5qG1i5Tx6ygMlMk7Kh9LnlFD6JaCVrB8HrGg3Nao284B
	 7czwirF03wIzA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4C5CD2ECE9;
	Tue, 20 Jan 2026 12:24:28 +0000 (UTC)
From: Petr Hodina via B4 Relay <devnull+petr.hodina.protonmail.com@kernel.org>
Date: Tue, 20 Jan 2026 13:24:25 +0100
Subject: [PATCH v2 2/2] arm64: dts: qcom: sdm845-sony-xperia-tama: Add
 bluetooth
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260120-akatsuki-uart-v2-2-867ee7f042d0@protonmail.com>
References: <20260120-akatsuki-uart-v2-0-867ee7f042d0@protonmail.com>
In-Reply-To: <20260120-akatsuki-uart-v2-0-867ee7f042d0@protonmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Petr Hodina <petr.hodina@protonmail.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768911867; l=963;
 i=petr.hodina@protonmail.com; s=20260107; h=from:subject:message-id;
 bh=PIDGO22caa5A8sUuRwlD1y0Ysd8fRqY2U65aBFBKHCM=;
 b=UFGOkqRZtKU6SlpW+Q0DC7x8sUOzMFSFWkGBjxZjy6qeFB9u8OHbA7YaxeSs3/zy6yt+tPlEv
 CLs/5DCKJiGCppHHso0gsLzG1KPMaCDC6AJ7P41ngiSOWQugD0IYEfx
X-Developer-Key: i=petr.hodina@protonmail.com; a=ed25519;
 pk=3QaVc6AaAu1IsyyH86+LIOOFhD7kCws8Xhe+wwyE7Bg=
X-Endpoint-Received: by B4 Relay for petr.hodina@protonmail.com/20260107
 with auth_id=594
X-Original-From: Petr Hodina <petr.hodina@protonmail.com>
Reply-To: petr.hodina@protonmail.com
X-Spamd-Result: default: False [1.54 / 15.00];
	FREEMAIL_REPLYTO_NEQ_FROM(2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-89826-lists,linux-arm-msm=lfdr.de,petr.hodina.protonmail.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_REPLYTO(0.00)[protonmail.com];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,protonmail.com,oss.qualcomm.com];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	HAS_REPLYTO(0.00)[petr.hodina@protonmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,protonmail.com:email,protonmail.com:replyto,protonmail.com:mid]
X-Rspamd-Queue-Id: 1FDA953DA1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Petr Hodina <petr.hodina@protonmail.com>

Enable the bluetooth interface on the uart6

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Petr Hodina <petr.hodina@protonmail.com>
---
 arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi b/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi
index 68841e036c20..4c63286d8b04 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi
@@ -755,6 +755,19 @@ int-pins {
 
 &uart6 {
 	status = "okay";
+
+	bluetooth {
+		compatible = "qcom,wcn3990-bt";
+
+		firmware-name = "Sony/tama/crnv21.bin";
+
+		vddio-supply = <&vreg_s3a_1p3>;
+		vddxo-supply = <&vreg_s5a_1p9>;
+		vddrf-supply = <&vreg_l17a_1p3>;
+		vddch0-supply = <&vreg_l25a_3p0>;
+
+		max-speed = <3200000>;
+	};
 };
 
 &uart9 {

-- 
2.52.0



