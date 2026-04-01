Return-Path: <linux-arm-msm+bounces-101375-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SOooMXNSzWmnbwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101375-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 19:14:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id AA63B37E7A6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 19:14:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6319F306E03B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Apr 2026 16:51:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77A7B47A0B0;
	Wed,  1 Apr 2026 16:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WBM6xYkt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50A5B4418D7;
	Wed,  1 Apr 2026 16:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775062309; cv=none; b=NO4/IIE/ZLzQTCePmqH4L+zyTn80mMiAAclM4/5W0LB5P3ozTobgtVcW+qORTUz0KWrRAAtzPK3xPAHDk7r9xu2ER6S6u15bGylPMV3tVfHbxRxIiG+Mh0CNG4S7mw1b+sScIrjAlL0Xpw2PZisaJXE66nyniv3KBrize1Yq9pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775062309; c=relaxed/simple;
	bh=Yf6NIIdiv8jj0AvVNXjthqtqYEHhNSpeeYcobYhStPI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OI7zGHx0RUq1inMPY5zCwfgPtfjz1kq/qyEmATF5hJJxQE5IaR7YrwP+F27s1U0ez5vAlqJVWfXq6UFATqwtBpsnG7PybRyXQcn105Qp4tM0SsRWtIglV54dMgDpvHDp5pDp5aKajod+nmF4nb1X6Dh8DCRH2VslqqsvWAIgxVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WBM6xYkt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1D5D5C2BCAF;
	Wed,  1 Apr 2026 16:51:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775062309;
	bh=Yf6NIIdiv8jj0AvVNXjthqtqYEHhNSpeeYcobYhStPI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=WBM6xYktQ0Vdi7YK9iA50sBVRggTnlEcTY/GvWf/Zpg4NhnpQnplNG3RYrF9CXq+r
	 Eku0j/BPI7MqDiNDWeJfaKSokvVscV+ufMy4GF1Ihocd6+qlORMOZbPGtZuBQGcX6a
	 mMp+oHZcpAhuNJw1jMQwJBZB6Ry84yGqYV7X8Oxwlx/etiIBp5d68nRpjBpeBq3GDg
	 gPXdxYWdjWR9NRPIJHRNul/7PaDuVde3i0O5NHTG4LEfbwxtessOXAfu4cJN8HLiAV
	 nJJNpFRAXeqg7WE55mLJ2Fz4FJxKknOAfgTVOK2AeLGE/J5yk/SflV17O8kLccfkWN
	 v96vDZh5snQsA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E76910F6FD9;
	Wed,  1 Apr 2026 16:51:49 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Wed, 01 Apr 2026 18:51:44 +0200
Subject: [PATCH v2 2/3] arm64: dts: qcom: sdm845-shift-axolotl: Set higher
 touchscreen i2c clock
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260401-axolotl-misc-p1-v2-2-f3af384bbb50@ixit.cz>
References: <20260401-axolotl-misc-p1-v2-0-f3af384bbb50@ixit.cz>
In-Reply-To: <20260401-axolotl-misc-p1-v2-0-f3af384bbb50@ixit.cz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Dylan Van Assche <me@dylanvanassche.be>
Cc: linux-arm-msm@vger.kernel.org, Petr Hodina <phodina@protonmail.com>, 
 Casey Connolly <casey.connolly@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Alexander Martinz <amartinz@shiftphones.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=838; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=I0Y7L1PsS3Jhw9nUJ5UreIwD0pMxhXyzUsaI/TIX2V8=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpzU0jNGGXoC33T+AVl2tjBGQZ4i6IupF4X7Y4z
 6gEqV2RzVKJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCac1NIwAKCRBgAj/E00kg
 cvCkD/4pAu+7Ud3PoqBKltvqJCumdqwBdGkFnrGryy2unNZmvFgJnkQHHTeafTNLOQtZ2XStLgp
 Lx9DaCSmRrAk+twJG1LEcaIYISN4pxo+HaFMCHXNecdqei1oXR+uZoTzX9RaJmEFKG/PwR6Or+r
 mJA201ockb7844c+d66lJXb6zvsPc2UBRv1ZlFGEBMHfkJpKVUBDm6pRSkvaLLZvdXb4U7B6dTA
 h1xy001b1xFQOXCGlV22sqrQ9uHOvjR8gkPTFwHARE2BHXkdiix13cI1aC0MiQ0Xz1brhueFOoC
 dyWPJIGZRiMEvM8kDNgJuF4gmblIG2mCcjv9cjw9w2hYfClDCGCbV0BlI4BPelOR9rKZveM5fX3
 k6u3DXTJcoRc8iW5DuqgIwxcpshzq4lwd1/jVxbyHRCrkSM03oIGy4M2KKb0Kc6i4zWpfw/UIR8
 skCV5rz2kYDZzr5j6Ga7Flj6A/0UYZ+GuNgKaBoy1skA9ejHYrpouM/T63os/e8r3azknWt+Van
 cI6d6U1tqSxtaeRUvMKSRAfvptGm+OsrotrlmMTj2irl1pbeGuvFYb6jPpXF3X+hsS2M8kMmkKm
 Ch6jmAHxV9raXO0lEiDGMGT+AV747nMCPEwIDhp4rL5B9ofD/CGQPTy4Gxl8L8Qm+qnehVPZJI3
 zO/wwP+MfGHL2UA==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101375-lists,linux-arm-msm=lfdr.de,david.ixit.cz];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,protonmail.com,linaro.org,oss.qualcomm.com,shiftphones.com,ixit.cz];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	HAS_REPLYTO(0.00)[david@ixit.cz];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	DBL_PROHIBIT(0.00)[0.0.0.38:email];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,linaro.org:email,ixit.cz:email,ixit.cz:replyto,ixit.cz:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: AA63B37E7A6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Casey Connolly <casey.connolly@linaro.org>

Sets a higher rate than the default for good responsiveness of
touchscreen.

Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts b/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
index c394350998c26..181c61e8ed748 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
@@ -432,6 +432,8 @@ &gpu_zap_shader {
 };
 
 &i2c5 {
+	clock-frequency = <400000>;
+
 	status = "okay";
 
 	touchscreen@38 {

-- 
2.53.0



