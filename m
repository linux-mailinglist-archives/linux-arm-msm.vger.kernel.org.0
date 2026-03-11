Return-Path: <linux-arm-msm+bounces-97061-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IDIyMNO4sWmxEwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97061-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 19:47:47 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C559A268D66
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 19:47:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EAEAE319F883
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 18:44:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF90F36405E;
	Wed, 11 Mar 2026 18:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j5mVhLxa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 962D33033D8;
	Wed, 11 Mar 2026 18:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773254671; cv=none; b=q3hXCqheRn87AZ7CPt7jsLzATvEp2KRiOUK0v4mYR1F3Q08ZjfqVYgy9t0C2mruyWTnHGNc2LrD83SDDllx6BPWxtwsNWpLaRlSgylB10xoDgSXnXItmkNNgiuXTG/LQvAfjT0yo7ThMq/rrzhQhf5pFjUTpmhqtHOwnRFbJ38I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773254671; c=relaxed/simple;
	bh=Pzzmign7Hy4szkEHrZUkoI+XLqdJUVJ2mA0Db6ivvGU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ouOklpDP/L/E3Mc7KyoEMsMsf32zpCYXzfbF/8Srh5if7hc8RgDUGRf+LBrZ+B0kpAZ9crXHGBCWdc6q51tphUrcNiQSmLh3DIm1BCozSFGROIpKFmJAEsRXRNSO0g31xuB5hGVdoovSKayASew6TggzQzke3Xa1iY8aHl4AnJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j5mVhLxa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 63AACC2BC86;
	Wed, 11 Mar 2026 18:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773254671;
	bh=Pzzmign7Hy4szkEHrZUkoI+XLqdJUVJ2mA0Db6ivvGU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=j5mVhLxa+mmB/8uKtDxb/rm/ccTNg9Rnd901FtcIMG6F4+OPX+4Wnc/ftL4w1QudP
	 q4gYOaHjVUIAcP7wqmr2GrB/qiZend7iLPOPFvse3R5dJjZdeOMR9MX52GJh1+FaF/
	 z6vGab0ldEueIDXP+14S43DFOm0YEgUn++tl5ToY7LpHRzY5ZcQd4Dws1ZB8OG670b
	 tevtrmN3QQfsEyC6RlITRBdkTKXsbRMFoeLHyXID/PyokQFyByQMZJIPPKRmMvnn25
	 Y2YAcLZawJJp1HN3no6eLo6nM9j4VSGso0ubv626qypLwnbaJcZ1zjI1x5qIFsyFUK
	 ngp1h/itccJWw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55D871125865;
	Wed, 11 Mar 2026 18:44:31 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Wed, 11 Mar 2026 19:44:30 +0100
Subject: [PATCH 2/2] arm64: dts: qcom: sdm845-xiaomi-beryllium-tianma:
 Disable MDSS
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-beryllium-fb-v1-2-408a580d125e@ixit.cz>
References: <20260311-beryllium-fb-v1-0-408a580d125e@ixit.cz>
In-Reply-To: <20260311-beryllium-fb-v1-0-408a580d125e@ixit.cz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 Petr Hodina <petr.hodina@protonmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=960; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=3Pg7NvtymOOJ0LjoaS8anANtqZcNQW66vxuq+tyshlk=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpsbgOFN0ReCshfufGyULOQf7EZRyQs3GVsHVb9
 K1qGZUzGRGJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCabG4DgAKCRBgAj/E00kg
 ciqKD/wMixPocS60DrqpLPI/mYEJMYSsKvfDAZ28XU7nRLtzXMaKEeJC+q1g0AT3IV9Hl1Ygysw
 SRuhlexk2kRycUualbhyrVMDe4GraTrbUGv1tW7dNTe/yKaizDeI41eXPuk47hQUPz/EtH8ZlfM
 XVY2JfbG4rjxzmzNE7OUM3FiXmd0IXZj7njHiLAbn78811CYfbgTIQZwwb6tQysE+Z48jBu7jdx
 4bNrrzsPmeFin0kNutgsOblQUw9qO8bnYlwk54jM2Ds/bDCN68arPGK+N9kE6zVTPC9Mg8wMQbh
 mUCm4AA0DL873Zl7rK12NDEzAafQHG0hrG5fRR+u5zQd4F017o8RIOt9AF4JUTUIXCxgs7LVDFP
 c//aaFd25kXCkRGeUjmmEIBBfemvKitvPJZNq+qqPGPPFFzTeOcPqR6gWdjaWo1LoKMBCxp8U/p
 AScPU3CoaWggcLY/6yGxdG5zGCF5mkohNZAlH39oud2sJU2WB/Ewi+EqpPkV2mEORJzXe8x5R3r
 PHII+f2z8tI26KJvDa8y5UZ/RQAZgcbXe95GctyZ/wsIs4dtdqsSnMFSvhh6b4saHDNe+79IyOA
 YyeiGv5sa6bLUswQghRJQDvMD05X4pYEE4DqvYW92ZPwo1iFZoJTvpuPyZjaiKBcDQTCl4q97eJ
 HtJLiZeIPkb+foQ==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97061-lists,linux-arm-msm=lfdr.de,david.ixit.cz];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,protonmail.com];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	HAS_REPLYTO(0.00)[david@ixit.cz];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,protonmail.com:email,0.0.0.1:email]
X-Rspamd-Queue-Id: C559A268D66
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Petr Hodina <petr.hodina@protonmail.com>

Currently the panel driver for tianma is broken.
Disable MDSS to prevent DRM taking over the framebuffer.

Signed-off-by: Petr Hodina <petr.hodina@protonmail.com>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-tianma.dts | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-tianma.dts b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-tianma.dts
index b58964cde8342..d1c7bccaab500 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-tianma.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-tianma.dts
@@ -36,3 +36,13 @@ touchscreen@1 {
 		touchscreen-size-y = <2246>;
 	};
 };
+
+&dispcc {
+	/* Disable for now so simple-framebuffer continues working */
+	status = "disabled";
+};
+
+&mdss {
+	/* Disable for now so simple-framebuffer continues working */
+	status = "disabled";
+};

-- 
2.53.0



