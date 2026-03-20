Return-Path: <linux-arm-msm+bounces-98966-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8HzGEs2GvWnQ+gIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98966-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 18:41:33 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B55492DED30
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 18:41:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7A9AB303A252
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 17:33:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B7303D16EE;
	Fri, 20 Mar 2026 17:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JTh7qr6r"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 780B4284881;
	Fri, 20 Mar 2026 17:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774027993; cv=none; b=IKozdmw7b4MMlaLFit4yFcXeDMD2UgJsagiQZUQpbqp/n7+EZZDyLGRy8CLdaOfm4OAxmrkNZB5+ld6iKvMbWTFVwYZ/xbXgU28+/0SMkkRwk6Qxvc6AI55HipLDri5p6jhk7EpVBG5XDlvK7FuPSXsnEU+8gMWvi3v3UU4H5mI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774027993; c=relaxed/simple;
	bh=bJdmavUSv2NlFXOMsEE+uSUGXqFImnXF6p4/XW5muvg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=akAM+BTlJn9xF46VkFQLvVtirq5LkQbUgzBX3QCrXJZs2kEJA4hCgqbz82CJcofc+ggt9Pm2WJvsbREdSQOiuCD6FZqqRglU8QBheB9zw0k0lLFVvcvqXtpOqSgf6/Bnkva5Si1Ylrdu2jplXaefrZsFqYPY5VLxOZ2qG8duMCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JTh7qr6r; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 31E33C4CEF7;
	Fri, 20 Mar 2026 17:33:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774027993;
	bh=bJdmavUSv2NlFXOMsEE+uSUGXqFImnXF6p4/XW5muvg=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=JTh7qr6r5LaKRXGKUoJNN0roIuGnF0v6MT7LJu9lN6xwMurQK8hV21WbKcbQmvipL
	 BlqqnmRF3e0LGF4cx0I3iImmBbpSbocyxn/8aYv1jS+VBmn+B6sP5gqmYpP0dKAdS0
	 RfUrKowxWwMQyz61FAuYpFP18zoYURC8Xg9aJWn9DSiJ9M0Azg0u1R3sJQ/eIFFvuK
	 c4NMmSPr3JdqHiSUANXlXC2aAJHGPVGGe20ma9pxZ8wmZbERmU5K1EufsvWkvTeg0c
	 HsbCfGH18xKCdIP5MYl40KzT6LqpCyTE4homPivNtMNA9P7geqHwN2tzZDj8SvLcw9
	 aH63SmSUDV8XQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 202261099B31;
	Fri, 20 Mar 2026 17:33:13 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Fri, 20 Mar 2026 18:33:11 +0100
Subject: [PATCH v2] arm64: dts: qcom: sdm845-xiaomi-beryllium: Mark l1a
 regulator as powered during boot
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260320-beryllium-booton-v2-1-931d1be21eae@ixit.cz>
X-B4-Tracking: v=1; b=H4sIANaEvWkC/32NQQ6CMBBFr0JmbQ1TohRX3sOwaMsokyA1bW1A0
 rtbOYDL95L//gaBPFOAS7WBp8SB3VxAHiqwo54fJHgoDLKW57pBKQz5dZr4/RTGuehmoQcjUZF
 tSSoos5enOy978tYXHjlE59f9IeHP/oklFChOnVWNNh2aVl154Xi0H+hzzl9WmZdsrgAAAA==
X-Change-ID: 20260312-beryllium-booton-adb218ec7e28
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Amit Pundir <amit.pundir@linaro.org>, 
 Joel Selvaraj <foss@joelselvaraj.com>
Cc: Konrad Dybcio <konradybcio@gmail.com>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1322; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=qhSNX+ZRoU8k5wfUWkwoB33o7SNAMBW2ljNv0axP1vU=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpvYTXzZhy//JiuZ4qBP2RKD13XDkw9Mld4KDoo
 IAzTSF/WSeJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCab2E1wAKCRBgAj/E00kg
 chFMD/sEb5fXRORc/goYsqlAANIb4gpgIcgOeicvR1ooTpnhKWoctaeLtjCyWvphycHnE7+aBCA
 kAQND6PZVMFmfhQlvbbAg8Y9swz9muDhi3e85XneSh/ThRE/bfphWTuDUw+F8/TUMmFkXEv2wTr
 NrlyMCx+yfAcALO/j7n5YHHupzXhS+1rSBnSf5AyHRqdXEkFj1SgYOeeWcMiQdGYg0Tw+QwX36P
 4zlcoIl0e+LkMK28nIY452Mom9bJLslS+BPM/TC6PGp5dcytVCX+n0vhmAjM0ISFg4zGqplhcAX
 yyWTu9xr1B2ptmypyneG+dbXs3QOLrGXEfeEN46NXr6Uo5tO/Rq9yJB5OEvbVy5jXz4IyuEshZ2
 vvY4CrUvuEmRf5wTrBJmPaSexjt1G3HS7DPVLJ9AACYkic78tn9wvfeK2AoUZbaT/TozvCfPmOf
 gJwxJAxFkQjG3Z7A7WFPO3OKLzlsR48ymL/GKBeC2YP+VOGk0LcGC8Hh3T0bc6ImOVIKUUKYZ2k
 BXMTJ94uuWh+DG8kXtu3u/Y5cpcGtUaa4Xdm2Q3QweWI/7ykj3HxoseJZnaC22buHVRwI7WPoir
 +/Cgg52gR+UZ1D1AQUyfWIikhBlgVyiowrbAteMdEo+P6X+xMuJ+YMIZkZJRCFkLGoSahYuIRFF
 smGjavlr/9lt6Zg==
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98966-lists,linux-arm-msm=lfdr.de,david.ixit.cz];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,ixit.cz];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-0.781];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	HAS_REPLYTO(0.00)[david@ixit.cz];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ixit.cz:email,ixit.cz:replyto,ixit.cz:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B55492DED30
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: David Heidelberg <david@ixit.cz>

The regulator must be on, since it provides the display subsystem and
therefore the bootloader had turned it on before Linux booted.

Fixes: 77809cf74a8c ("arm64: dts: qcom: Add support for Xiaomi Poco F1 (Beryllium)")
Signed-off-by: David Heidelberg <david@ixit.cz>
---
Changes in v2:
- Filled missing device in the commit subject.
- Fixed commit wording to be more clear. (Konrad)
- Link to v1: https://lore.kernel.org/r/20260312-beryllium-booton-v1-1-59c83ab91b78@ixit.cz
---
 arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
index 01b570d0880d6..1298485c42142 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
@@ -148,6 +148,7 @@ vreg_l1a_0p875: ldo1 {
 			regulator-min-microvolt = <880000>;
 			regulator-max-microvolt = <880000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-boot-on;
 		};
 
 		vreg_l5a_0p8: ldo5 {

---
base-commit: 785f0eb2f85decbe7c1ef9ae922931f0194ffc2e
change-id: 20260312-beryllium-booton-adb218ec7e28

Best regards,
-- 
David Heidelberg <david@ixit.cz>



