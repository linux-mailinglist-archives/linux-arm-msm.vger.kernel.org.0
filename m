Return-Path: <linux-arm-msm+bounces-98274-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gNnDMunRuWnuOAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98274-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 23:12:57 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FAC42B2FED
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 23:12:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C63F33088248
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 22:12:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58129363093;
	Tue, 17 Mar 2026 22:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DCaUGdRN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 269CE3321C1;
	Tue, 17 Mar 2026 22:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773785555; cv=none; b=AsZXy0gkbCmPVbQ9+5BXkyemoHoiorvEn/+wT8gMqwLYu1YMWw/KTQqmeF+C3p8SE3g3efPr7P9DXB6HCkZ6aPg/B2MHybNdxNzE/VY7Zzsema0PXvGZFfyNjJoXLL+JtZclsZ7N1Curab4ttkKnqEOWHiP7Xt1R4dN8a4zm4IA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773785555; c=relaxed/simple;
	bh=YThPh5dk++SwOGnz1EIZgFOedIDRBgVyDkr3FQpkK5I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Pzx3mTXx/J6B25CAeeG4QjPEgqPuKpCv/x2QKfICMurYrRbyb85r0c/1+Z8GjuP8ZksWIVjHtVR4jfSo+U3LRyS9V3M5pMRuaypv27Jv1kaJM3my5Dr71Fzx8wRmTEdVLdwQRSXZycJWMtcbhUyXwPUX5hJYbcEguQfSwAUXcv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DCaUGdRN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id E69AAC4AF0B;
	Tue, 17 Mar 2026 22:12:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773785555;
	bh=YThPh5dk++SwOGnz1EIZgFOedIDRBgVyDkr3FQpkK5I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=DCaUGdRNpSstYL8lvre+UnoLoDiJ7n1hm7DlwqaVga0044UtehEUlUZ4IkBG5gGEb
	 tYdZ7pC9CsaJGjZQlW6Zai6Ue3aZ6jGbsHNhyl/TGU72tr4Rg9a406OW+mxJyCCivU
	 xzVnQRnfz/vSabJUqHAfpIFBSwWwRqR0VVBrefuvQPd9hNus7r4N2Jx0LBaWAjbRFa
	 aXKgmmzLxWYiL+1+5TAikJ1JC+F4TOC+39G5ga0cRsPWAZVqb+dmaxkTnYrNNJmHut
	 mh/uPO8hLuOsW5llTl+UrMgjszyK1JhA/VBDdd2uGma1I6bn13N92/16BYOIAqWPDl
	 93vi9bdNRVDZA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D99B2FF6E87;
	Tue, 17 Mar 2026 22:12:34 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Tue, 17 Mar 2026 23:12:32 +0100
Subject: [PATCH v2 2/5] arm64: dts: qcom: sdm845-oneplus: Drop address from
 framebuffer node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-beryllium-fb-v2-2-36b69dfb760c@ixit.cz>
References: <20260317-beryllium-fb-v2-0-36b69dfb760c@ixit.cz>
In-Reply-To: <20260317-beryllium-fb-v2-0-36b69dfb760c@ixit.cz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>, 
 Sam Day <me@samcday.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 Petr Hodina <petr.hodina@protonmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=857; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=KVG+oAo4IX+FcwkDj3OQjurvcb14N3Vls6N/xvndJuU=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpudHQjlabPKJ1x8fxqZ/sZSs8UqV4aoymK2u93
 U7q6IL5v12JAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCabnR0AAKCRBgAj/E00kg
 cn6fD/9NJ9RJT1D+qtD3fv1V0M5bqR0HnLU5hcs5cyFND1uIk8RGu3Vsj2ujZpcdlgVfdg0+wdx
 8NqE2InzM68848IRGbMxd4Z1AhNg7x/1hmOmAKFyW3OnKP67DOs1cbiHatUD3HMx1DrU+Mw7UMi
 YsVeBzNfrcJp4RUmpotJ6ewe9jk/osyAHPO64tE3sYpB1tarD91TFtsmjdHoKDJENUmc0n8UVBI
 pG4XJNgrHWg+8es1gfuT30jwhf10z4k5yBerutPIRcaRtIpsfS+Q9hcSv9Oi0xHXTLycO/erpBH
 adtH/X2EBhzmWw5TYFr1fcogTDoB24auqzLZ08fcNEITdZ4lMaRdxQmSP9i86rAM+feF/snYEna
 M+Bfm6v+Je/4GSUf1xregFwyon8H3wL647FrjEceWwu04bRIzKanKLLFuEeW95wY9wQrX/nTkh4
 G46OnCXhYoGfp8r9M9dy8PufldzpuGUM3Kx+Fng0s4l0MA0yaUyXaHI3wUJyw4SD9a8RHo3t9ZZ
 KvaGiLOCnGwKMnPLsPOhqkwVsWdbPVKDtSOwzVcIL+icYfGe4uoWEM6oGGbhdE3Wd+vAkthb6yg
 +tErEqC/X0/hLinD0qXsj9naacxz0uZkS1cg0WeL0C1TxHSrS/972o1q6lpBi1fULEcaTwwUaqc
 AT56VqMMiz8+hvQ==
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98274-lists,linux-arm-msm=lfdr.de,david.ixit.cz];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,protonmail.com];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	HAS_REPLYTO(0.00)[david@ixit.cz];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ixit.cz:email,ixit.cz:replyto,ixit.cz:mid]
X-Rspamd-Queue-Id: 6FAC42B2FED
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: David Heidelberg <david@ixit.cz>

This node has no 'reg' property, so it shouldn't have a unit address
(after '@') either

Fixes: b0d5c96e860c ("arm64: dts: qcom: sdm845-oneplus: Add framebuffer")
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
index 5b121ea5520f5..f5fd213d4a1fd 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
@@ -37,7 +37,7 @@ chosen {
 
 		stdout-path = "serial0:115200n8";
 
-		framebuffer: framebuffer@9d400000 {
+		framebuffer: framebuffer-0 {
 			compatible = "simple-framebuffer";
 			memory-region = <&cont_splash_mem>;
 

-- 
2.53.0



