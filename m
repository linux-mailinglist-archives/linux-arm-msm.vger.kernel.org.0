Return-Path: <linux-arm-msm+bounces-109478-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KKHSGCp5EWrymQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109478-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 May 2026 11:53:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 25DE65BE5FD
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 May 2026 11:53:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A91AA304BF34
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 May 2026 09:47:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F27CE379C29;
	Sat, 23 May 2026 09:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oSZzfn0a"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB45933F59B;
	Sat, 23 May 2026 09:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779529536; cv=none; b=r/UepbdcWVExty1Df88D+cCjB55cn0E4LnCYY0Wa6gS1wSYJPhxdOSRf/NoCvp6JcPgt1jSzxqvqzqzByvU5u7wyUikt4sa2UzgD+6kZ9kOfoJdvsyGvE/MNaYYUCS8FQ9IEFsrzku76BOlJNLVSdEBqXonF5Fd3/pGwd9dCgTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779529536; c=relaxed/simple;
	bh=c2bPbOvyx0B4NvokfiEkW0mIp1XsacdSHNsgXaB2B+w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sg7/+moxJditynsnbJFYWpPmKthYeAaTmo1qqPYDKlC49TANA6azg0Lq5djnTMW60gFp6Vp4nMHeVvNLA124bNiDTWUrWTgWMDdIxzQ9mobcBtSadr/y8W4cGY4Wj5qd4Esrp6ojBI4N2lZVbCWMxeNCFa2cNUxzKyavuurplnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oSZzfn0a; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9BCB2C2BCB4;
	Sat, 23 May 2026 09:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779529536;
	bh=c2bPbOvyx0B4NvokfiEkW0mIp1XsacdSHNsgXaB2B+w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=oSZzfn0aI2ck5d/SU8ohSbYy+OaTiFI8z+6fnuMngcvaAAx1dA5AeiTXRB3QIC04S
	 Fw4nUcKUdDdnF3kvaRcgh8XxtAszjjEoF+M6idc23vO+ZGwIG/IDMFMSdnpQ9PLpg7
	 x+4DLVPUqR1134bRyaYhr/qHpcHE/ARrgC4QiOstQ7oUbEzc9Jfdvx2FCQxQUs0xW5
	 5TuZIp0aSfwo5HwJCNBx6eg09SJd+he3n6AUUlKU5iz8TVGIeAgfzjsede3uo/XwKJ
	 wvK92u/GZUyGG/KsPVKbEMtzOST9fUNp/RiIGcavBN1zfNl8mWXB4vYXJeK9Uv8uMQ
	 g9arIdbbE0enA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 862A8CD5BB1;
	Sat, 23 May 2026 09:45:36 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Sat, 23 May 2026 11:45:35 +0200
Subject: [PATCH v2 2/2] arm64: dts: qcom: sdm845-oneplus: Update compatible
 to include model
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260523-synaptics-rmi4-dt-v2-2-0645122babdc@ixit.cz>
References: <20260523-synaptics-rmi4-dt-v2-0-0645122babdc@ixit.cz>
In-Reply-To: <20260523-synaptics-rmi4-dt-v2-0-0645122babdc@ixit.cz>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, "Jason A. Donenfeld" <Jason@zx2c4.com>, 
 Matthias Schiffer <matthias.schiffer@ew.tq-group.com>, 
 Vincent Huang <vincent.huang@tw.synaptics.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 phone-devel@vger.kernel.org, David Heidelberg <david@ixit.cz>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1137; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=bXz0ST37brWbiTCA1202uLTw4l3V5FHcLPfgUGhSY+w=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBqEXc/9Xo2wQGQuXaJI1BsObKmstt+3LbtWqUbe
 YS7+whGC/qJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCahF3PwAKCRBgAj/E00kg
 crUHD/931RtYS8EMQCqn0irqENlTOzT6BQGjcX/+ysD0vgAr1WiibaDCv00HINMYiZq2BtpV37G
 /rQUrQLpDXtpN25+xFam/QB321DhP0gnLHQrdpeKjcWDQexre0h6mYXKbjrxvzwJI1qYScNfGQR
 M31wmVjrBLhtOBv9DE/Mx0YNimpktI7eSME0g1I/EA80YNjUdbIqzU7L3FOqyDbhzNvo5asI2ea
 CEMdkMFDwY/ZKuvY/+glhO9Lu74yz2MJaeFVNo7k7sgnVcAX8jvY1qhaYKRpeDWqK5gtnC7OTz6
 GttyhKjn/NKdqeJOqJLwKiumG57+2UnzOx9cdDSMcAxynkbYIpfMzBi3Ddy+sWZFIdcWcSeJaGD
 WeNlZNUtwmNztw+sgf6szhKVnu1tSyT//6bBVbx9keyvhpZ5HowAfBqvBbFl37GhlelDJem9/ak
 uvDVCrlRjfmTtf2x/GmaGde3I3TL5tOxBEAeb6CSB496k63uE8KGU1QZat48gHQWxIv5hUGbu8D
 r5Vb9bX6JfGjeT/6SyjUy5tLbSV93EyyyyLjY51TGxnSflPn9+if/TT1o5J9r3ua/3uoOV0PQPe
 3L5Bjk49Z1iuh+moUZqcWT6aksqCufZ4vnQXPfY5aayvp1xyiC2rk1s0EZAm4iuL7BpUhs19jk0
 7/J3WMsrRjbPiPw==
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109478-lists,linux-arm-msm=lfdr.de,david.ixit.cz];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,zx2c4.com,ew.tq-group.com,tw.synaptics.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.998];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[david@ixit.cz]
X-Rspamd-Queue-Id: 25DE65BE5FD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: David Heidelberg <david@ixit.cz>

We know the driver is reporting s3706b, introduce the compatible so we
can more easily introduce quirks for weird touchscreen replacements in
followup series.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
index 6b7378cf4d493..148164d456a5a 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
@@ -475,17 +475,17 @@ bq27441_fg: bq27441-battery@55 {
 	};
 };
 
 &i2c12 {
 	status = "okay";
 	clock-frequency = <400000>;
 
 	synaptics-rmi4-i2c@20 {
-		compatible = "syna,rmi4-i2c";
+		compatible = "syna,rmi4-s3706b", "syna,rmi4-i2c";
 		reg = <0x20>;
 		#address-cells = <1>;
 		#size-cells = <0>;
 		interrupts-extended = <&tlmm 125 IRQ_TYPE_EDGE_FALLING>;
 
 		pinctrl-names = "default";
 		pinctrl-0 = <&ts_default_pins>;
 

-- 
2.53.0



