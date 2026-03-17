Return-Path: <linux-arm-msm+bounces-98273-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6A3mCujRuWnuOAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98273-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 23:12:56 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C6DBB2B2FD4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 23:12:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 753D030838C9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 22:12:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F46E35F198;
	Tue, 17 Mar 2026 22:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="luC509gb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26933330D24;
	Tue, 17 Mar 2026 22:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773785555; cv=none; b=R5NSleWN+VxE4f+MsAC04O8zpguVn1e31Xk3jzj1FiUtQ+SsdY19dyHjMNp04dqrNx2ABkOkmK305qeuWOnrdjK2bjzwN9Pw1YskLLu6j3vKgPGbrlruIcbE4iDCDofEgYxSKMHHPda6bsk2gZOKQFmHJdu2Bx7QyrcaDa1TR4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773785555; c=relaxed/simple;
	bh=y243D6Ne6ta8m6pwl19zt5ZKjdhAH8edxSmktq9NqqU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=DxtuVUlrPAFGW/YMJwi5jVPYM8thqw5du59OIOGxs6t+Ayy/B5CPQe2R7RTTmCJ3CYkh++L7rusNfoCok/9RyJ9ZkGY7xBb+snhKIYi/FGm+qJJuUOFKXzRgGndoPTzGBT/8HYvZG7hwf+VholtorGLRABgyxmoIPH49F/hMJ84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=luC509gb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id C30DBC2BC9E;
	Tue, 17 Mar 2026 22:12:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773785554;
	bh=y243D6Ne6ta8m6pwl19zt5ZKjdhAH8edxSmktq9NqqU=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=luC509gb9U3Qs4KURDJFp3wzckE74/JwLjlbhTOCDPhCY2CCQZvAyAv8aWdBK7lY0
	 UxwAqOK3ikbhbXuMaWFrZPr2Z4ogCLgM9iSg1h68TtTMKtTokAl/VPvkDzQLu69NOO
	 +9TfHpQgvzIAZjXO7jZPD2qGf/8aAfumYHjo67cnaxyMD7+97Ntmu22jgctKoR8KuV
	 jvBQtK3N4PkPu2F6Uel1913slsfWAnGj7Fm3w6hMlRowYCgD3KCaCY5BfSAS2/Xp+E
	 +DGHsSJ+OpZBajlUlNHso+kzybdvAjLFqebuwpOj9YZJ4eQ9efpkGEMCSXNIFx2EzM
	 hlz6ScSmiFURQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF3B0FF6E8D;
	Tue, 17 Mar 2026 22:12:34 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Subject: [PATCH v2 0/5] Add framebuffer on Xiaomi Poco F1 and disable the
 MDSS on tianma panel variant
Date: Tue, 17 Mar 2026 23:12:30 +0100
Message-Id: <20260317-beryllium-fb-v2-0-36b69dfb760c@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAM7RuWkC/1XMQQ6CMBCF4auQWVszLSKNK+9hWNB2kEkQTIsNS
 Hp3K65c/i953waBPFOAS7GBp8iBpzGHOhRg+3a8k2CXGxSqM0qshSG/DgO/HqIzwpWka2MVGkL
 Il6enjpeduzW5ew7z5Nddj/K7/qBSyn8oSoHihLqtNDqpKrrywvPRvqFJKX0AauYrz6YAAAA=
X-Change-ID: 20260107-beryllium-fb-d3e87bc20be0
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1522; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=y243D6Ne6ta8m6pwl19zt5ZKjdhAH8edxSmktq9NqqU=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpudHQ+dDsZMmxVdjdT95CwZwEQ8WZdO1Y+hAJi
 SsMoNpogICJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCabnR0AAKCRBgAj/E00kg
 cpoID/wJY1PrVCkHjF7CseuHrjO2y4z5UerUXFD04e8qh3pgNpH9epcpN6kNdhMFux3NmidW8wq
 hh93DpYgfyZ5AAfRhXJFspw78jTBPwZHZuhxZkBIfosoklUFqTKiIZGxSaz+V+CExThbNx9r9t7
 IOTMBx0am1Jbnc2SD3J26EgDwboRfSnQ++QAvVPcWCALMhkNTsJB4I9fF56hmj9h08DXfzHd9qv
 E6KQsIjlH4h0IncecABl106/2odbezK+XzBRZgEkgBow5132oEFEF3CUmoIsg+/H91GCZ5Rp/FT
 tCNd7H5zNHVKGTSWgclVUB7zrd9zkoxs8sic8ziJCTH1L2WRp0Rjx2nTj5F4gbBdSHPKRN1lT8v
 21iZ+h72jATQriYLraONUxdrrojSOpuCCI8k/zDs9P9GW146YXDzlCXSmH+pxttsm7bz6V5fmlq
 9T9xFoM25xOk2NM1EWn7/oPvk1nv33MLdSwriQAb30z/HWtKsFSMk2te2m5T5k8kz2ZmTjZ6aas
 YG4kbZe3AIVM/1Fhi/Q2gVl8jCO3NIXDWPIpeC/4ZCfisGmDXrqNUE50pQ8nFe+VkrS593OvKq7
 s5QCh4KOTxiIYviKaXib8AFkQAuobp+qGP93uwL9wJgVML/GU/h7E9cIG0yFPXRbrJTXrQYxcLz
 Ew7FghT0H4GxX6Q==
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
	TAGGED_FROM(0.00)[bounces-98273-lists,linux-arm-msm=lfdr.de,david.ixit.cz];
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
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	HAS_REPLYTO(0.00)[david@ixit.cz];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ixit.cz:email,ixit.cz:replyto,ixit.cz:mid,protonmail.com:email]
X-Rspamd-Queue-Id: C6DBB2B2FD4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Enable framebuffer for early console output.

Due to broken panel driver on tianma and no visual output it's better
to disable the MDSS so the framebuffer stays on. 

In case second patch gets rejected, please apply the first one standalone

Signed-off-by: Petr Hodina <petr.hodina@protonmail.com>
---
Changes in v2:
- Added few conversion to use memory-region.
- Corrected framebuffer node name. (Konrad)
- Link to v1: https://lore.kernel.org/r/20260311-beryllium-fb-v1-0-408a580d125e@ixit.cz

---
David Heidelberg (3):
      arm64: dts: qcom: sdm845-oneplus: Drop address from framebuffer node
      arm64: dts: qcom: sdm845-shift-axolotl: Convert fb to use memory-region
      arm64: dts: qcom: sdm845-samsung-starqltechn: Convert fb to use memory-region

Petr Hodina (2):
      arm64: dts: qcom: sdm845-xiaomi-beryllium: Introduce framebuffer
      arm64: dts: qcom: sdm845-xiaomi-beryllium-tianma: Disable MDSS

 arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi      |  2 +-
 arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts  |  7 ++++---
 arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts        |  6 +++---
 .../boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi    | 16 ++++++++++++++++
 .../boot/dts/qcom/sdm845-xiaomi-beryllium-tianma.dts     | 10 ++++++++++
 5 files changed, 34 insertions(+), 7 deletions(-)
---
base-commit: 8e5a478b6d6a5bb0a3d52147862b15e4d826af19
change-id: 20260107-beryllium-fb-d3e87bc20be0

Best regards,
-- 
David Heidelberg <david@ixit.cz>



