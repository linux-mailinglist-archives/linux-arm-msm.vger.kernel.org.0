Return-Path: <linux-arm-msm+bounces-111574-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id gmc0JWx8JWq/IgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111574-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 07 Jun 2026 16:13:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EF0C4650BC3
	for <lists+linux-arm-msm@lfdr.de>; Sun, 07 Jun 2026 16:12:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=DHpdFtR1;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111574-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111574-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 836C0300C00A
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 Jun 2026 14:12:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 385F33AA4EF;
	Sun,  7 Jun 2026 14:12:25 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1375912E1DC;
	Sun,  7 Jun 2026 14:12:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780841545; cv=none; b=kFjq+hrqcXoNPXc5WOtPOuZzRU9GHN9JfB/y9vV/d7Xi13B876kybSCqHJNuAc3NQ0r36/6XzyofpM9a6VlYKNb3u7EPVrpaG3vDLDIkdC4n7G2xTbQTg1s1iwA8xE/qnAKHqIxGxX+Un3/KxU+yEhA1QY2eOABkdHhHs23E4DQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780841545; c=relaxed/simple;
	bh=oLK5o76MZcMHwJ5irJSXP5ZkkNB5qrREO4SJ1hqymNE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=C4i5fVIMO/v1uwPM9tm85lQ8XmzpFszFnNJR+abiDl+0Jz7rBz3jxwsEHPm0mQlttk+DI0+SFT6XOAuQByuPkRxdhulbgIAOp4SFjC5Dt0Fi3oh1Ur9YIpmERcg5L/oXUxWn7A93YNaXEmqlAA7XXM7fJUyvwaHEI9NRcyqShDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DHpdFtR1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id B804DC2BCC7;
	Sun,  7 Jun 2026 14:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780841544;
	bh=oLK5o76MZcMHwJ5irJSXP5ZkkNB5qrREO4SJ1hqymNE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=DHpdFtR1dgLuD5/Fg/ei1o0zUERwDvq2NmXrxdKH72CblHlKqWfIBc6vddFV5xqod
	 NhkQXZdAo8F/gKsYNaYQRxBcInc/sGmGY/Lztqz/02X+lgysHamFj+Q6RF8q38/cZO
	 CfE92MToVk0ywWFLwLnvWE0FJdvrFFjmvP4QNpU/g0TSrYmqD0uwPoP8Ge4ciEJ/JP
	 qkLc2Y8i5ejVIOs4bqseOfJI+wb0+HTx4Ov10T7oyJLgcdKbggHvolW4s+uTIUWfQH
	 h1UNaIkIu/zsARluXP17uim6Mpy+mIRMIt4JAnTQRWBStNEJrE1eDrSaUDt62Gv+vW
	 2AwP4jc/st/tQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F224CD8C88;
	Sun,  7 Jun 2026 14:12:24 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Sun, 07 Jun 2026 16:12:18 +0200
Subject: [PATCH 1/2] arm64: dts: qcom: qcm6490-shift-otter: Convert fb to
 use memory-region
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260607-shift8-fb-v1-1-72b9dac25f4a@ixit.cz>
References: <20260607-shift8-fb-v1-0-72b9dac25f4a@ixit.cz>
In-Reply-To: <20260607-shift8-fb-v1-0-72b9dac25f4a@ixit.cz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1010; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=31h4ioQzbcHAXb50MokaSyiYOmg1H0n523N8ZRz5iGE=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBqJXxH+olj1QhBfSEcCgVsdItddc0Xa0lU7S+A5
 GLYM453ssyJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaiV8RwAKCRBgAj/E00kg
 cjCKEACjSjFf012CANltf8ay6OM0l87B7IiCRnqWqFyZsObAonCKbj9zyDXvu5EGjftS75bYrGL
 ctMD+3x2i9RRpHTKIaJabHUda531b+zJu8uuGANflhFCjNiUhN9qTnYgMwcVE4o2UP8/N86WkCI
 Ayw3p8pmeezbQHVHsO/iVDOVPLwCGb71gnLFAYanFyai4oBISQn6qQvcDFbIrCZTlFZIAK+6oJu
 SMgsuszb9Ewq0+8axLNNShE0mETmqOAD/xcLgHrVC+J5cRPJKzjqXZetBEMf1qLMQt5KFrq5OE9
 oaOcplLAY+otIqCL5lx2W1N4you/rPEDgYxBmuGiBdSKLHOloP11ozq/4X0g6y7coAeNqAKpmex
 Gh/5corsONX/Z4VN+VwdBKOek6/vxA42Q7KkfQIgRhVte+GQ7HDXeHspwXVR6PvAV179XJMPZMr
 KgWcR8VsdkpM9hFHULTkrxikYwn3mnbhAW6SJx4NRK+amaYAmfFhtEZwPoPGsfbEKF5rVBIk3x5
 MstEYsrP6SXo09U7R4rMNaD0Gzww6Ue/qaS/IUxCJlo0cv/iL08Oo2OStKKonDqpiOKasJCZNFT
 qjSqrK26alLt6//OrIfXKQs6iE52tCdmpUDWuxHPZ8/VszxYaCAVzlKmukdtSQPwHLKgeseRB9U
 /nZpaWwcRrVYGJA==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111574-lists,linux-arm-msm=lfdr.de,david.ixit.cz];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:phone-devel@vger.kernel.org,m:david@ixit.cz,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[david@ixit.cz];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EF0C4650BC3

From: David Heidelberg <david@ixit.cz>

Instead of manually specifying reg, reuse the memory region.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts b/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts
index 797f37596bf19..9b90143d2c332 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts
@@ -34,19 +34,19 @@ aliases {
 
 	chosen {
 		#address-cells = <2>;
 		#size-cells = <2>;
 		ranges;
 
 		stdout-path = "serial0:115200n8";
 
-		framebuffer0: framebuffer@a000000 {
+		framebuffer {
 			compatible = "simple-framebuffer";
-			reg = <0x0 0xe1000000 0x0 (2400 * 1080 * 4)>;
+			memory-region = <&cont_splash_mem>;
 			width = <1080>;
 			height = <2400>;
 			stride = <(1080 * 4)>;
 			format = "a8r8g8b8";
 			clocks = <&gcc GCC_DISP_HF_AXI_CLK>;
 		};
 	};
 

-- 
2.53.0



