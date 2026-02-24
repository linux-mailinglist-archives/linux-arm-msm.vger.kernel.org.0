Return-Path: <linux-arm-msm+bounces-93965-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qHT5ETKNnWn5QQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93965-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 12:36:18 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C046018660A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 12:36:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 76D53301DE04
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 11:35:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 799C137BE76;
	Tue, 24 Feb 2026 11:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zmwp6GCL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 556F736D51B;
	Tue, 24 Feb 2026 11:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771932918; cv=none; b=LMSATDJIXH8z7DYZHOWopKtuKmSrP5wcN/4mg3WVvfeTxljDL+mgbX+IXYNpf719CxYcYXRy+8qGDlwZDTpoh8+gzyBxyMDgkfnoagFVsiIRVExxUg6dew+YXuMUgAX/akvJMFpGZ+TLpWnyH/oovfrARcmiggcNecMCo8cZ1D4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771932918; c=relaxed/simple;
	bh=3gnRD+YMffokRF85VUUxKomjtZQMuEx117IH58zzsDk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=UPYEzAQ7fo/ArVRQoxzJlwDVoFKRK4MtlD4sjKe5SzVHzEHUvcEMJ1A2ZIBxk460twmFqNwfRgv9SGn1EysvSYg083W4ugawU0EiIaxAqyknA2/VJiKDG/peBpAivc5eiYTSeNu9Z0cLotR6SrFFQMpXzrfbb0Yktf4nb9MA3B8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zmwp6GCL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A707C116D0;
	Tue, 24 Feb 2026 11:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771932918;
	bh=3gnRD+YMffokRF85VUUxKomjtZQMuEx117IH58zzsDk=;
	h=From:Subject:Date:To:Cc:From;
	b=Zmwp6GCLddeROusLGLpWhGSP4fUuythHuve767U0EiZ/a/vHNxkRAuDo33kZWj75C
	 qPCaD7gqZs6GGr0chX+GqxJAr+4aLZQ3ge6S9kGcq3ji3oT4xARrD++btVTOarELA1
	 ZAU1fUDshNgCQYrurJDqzR2KiCLiOJ3yxX3zKAKVGUiWqcBSCxFwFIrQJbrMeORIcW
	 dCs/tlC1HgP4OmrwsUxZaO8OHYeuuZCH61cSHrHqUXot76w8KOdIsjDNmICLWaidzZ
	 jmSI8r3U/ycKV7xrWSa7tPShUo4lY14imCtZMSmaKglFVOXlzBZlSUACw6Ws3/8R1X
	 M2LhILNQcqhJw==
From: Konrad Dybcio <konradybcio@kernel.org>
Subject: [net-next PATCH v5 0/3] Grab IPA IMEM slice through DT
Date: Tue, 24 Feb 2026 12:34:45 +0100
Message-Id: <20260224-topic-ipa_imem-v5-0-015bf09e123e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XOwWrDMAyA4VcpPs8lcmLH6anvUcZwLGUVLHUat
 2Gj5N2rFgqFLBfBL9CHbirTyJTVbnNTI02cOZ0k7MdGxWM4fZNmlFamMLawptSXNHDUPIQv7qn
 XSJ1zMQbvySo5Gkbq+PcJHj6lj5wvafx7+hM8tqvUBLrQrUVbOtNArLt9ynl7voafmPp+K0M9x
 Mm8K/VCMaI4hBCwgdZXsKKUL8UVBpZKKQo69ISAXevqFaV6V5qFUokCvpFPsCXy1T/KPM93l7i
 Ud4UBAAA=
X-Change-ID: 20250523-topic-ipa_imem-def66cca88e5
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Alex Elder <elder@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Alex Elder <elder@riscstar.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Simon Horman <horms@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771932912; l=2134;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=3gnRD+YMffokRF85VUUxKomjtZQMuEx117IH58zzsDk=;
 b=JcBeFRW09GILIBAXiQluD9TA0a1XPsxjYNtRHJ0cavVDjBFeKrSHj20xpYbgAMNGlq8Q0rPny
 /DErP1P2ZeZAqxSIflthgVLvsBULahbwn8JSkBk0c7we+iSIFXJFUZu
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93965-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konradybcio@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,netdev];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,oss.qualcomm.com:mid]
X-Rspamd-Queue-Id: C046018660A
X-Rspamd-Action: no action

This adds the necessary driver change to migrate over from
hardcoded-per-IPA-version-but-varying-per-implementation numbers, while
unfortunately keeping them in there for backwards compatibility.

The DT changes will be submitted in a separate series, this one is OK
to merge independently.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
Changes in v5:
- Rebase on next-20260223 (NOP)
- Resend after the merge window formally closed..
- Link to v4: https://lore.kernel.org/r/20260219-topic-ipa_imem-v4-0-189d91dbee84@oss.qualcomm.com

Changes in v4:
- Fix a memmap() leak
- Adjust comment style, take Alex's suggestion about very explicit
  DEPRECATION notices
- Pick up tags
- Link to v3: https://lore.kernel.org/r/20260217-topic-ipa_imem-v3-0-d6d8ed1dfb67@oss.qualcomm.com

Changes in v3:
- Pick up tags, rebase (effectively a NOP)
- Add actual binding constraints for modem-tables, drop Alex's r-b
- Better describe the purpose of this region, as much as I can anyway
- Link to v2: https://lore.kernel.org/r/20250527-topic-ipa_imem-v2-0-6d1aad91b841@oss.qualcomm.com

Changes in v2:
- Actually pass the retrieved data to the target function
- Re-wrap comments to match net/ style
- Mention next-next in the mail subjects
- Pick up tags
- Link to v1: https://lore.kernel.org/r/20250523-topic-ipa_imem-v1-0-b5d536291c7f@oss.qualcomm.com

---
Konrad Dybcio (3):
      dt-bindings: sram: qcom,imem: Allow modem-tables subnode
      dt-bindings: net: qcom,ipa: Add sram property for describing IMEM slice
      net: ipa: Grab IMEM slice base/size from DTS

 .../devicetree/bindings/net/qcom,ipa.yaml          |  7 +++++++
 .../devicetree/bindings/sram/qcom,imem.yaml        | 14 ++++++++++++++
 drivers/net/ipa/ipa_data.h                         |  9 +++++++--
 drivers/net/ipa/ipa_mem.c                          | 22 +++++++++++++++++++++-
 4 files changed, 49 insertions(+), 3 deletions(-)
---
base-commit: 779cae956c8316aebc1946ef86ca001f99658270
change-id: 20250523-topic-ipa_imem-def66cca88e5

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>


