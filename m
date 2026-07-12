Return-Path: <linux-arm-msm+bounces-118537-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id t0nZD4EGU2qgWAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118537-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jul 2026 05:14:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C6848743AF9
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jul 2026 05:14:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=Nuav4sd1;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118537-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118537-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 266353005AA9
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jul 2026 03:14:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34B90311C2A;
	Sun, 12 Jul 2026 03:14:06 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EC7F248F73;
	Sun, 12 Jul 2026 03:14:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783826046; cv=none; b=TCuWLaq1dT+W3Dj3Vua6NCNY+yX2VtGcZqxNTsqV7lba5l0wJcwEtZYiPkyPUyQeJ137Kwzq1hxcL0hEIr3yOS6JvAtnObsHuU8SctltDqjzOURr3z8yq7Udl9M0fmv+BbEFxKIBumj1NpbRYkRoIckRctveEWXFF8atfQ25Xu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783826046; c=relaxed/simple;
	bh=mmOkhodHGtEQly1sJFXQCl0QkPRAuKzorAgvaUlQrpk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=AP0SHi5IrMjJyCBGv1jUxRnUxAU/2eAFBUgnI65c5oISLukiHD0wkjd78OFnGmoXYpyUB34pPZv01BIkZC9JOQfS0aFxBuz7Rn9yENnYU2PPX0cWe+IT2X98ucHzTutJCOxTGVWICboOewrES4fwpV/kMIqkqfoChMeir9ZB1Oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nuav4sd1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9B945C2BCF4;
	Sun, 12 Jul 2026 03:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783826045;
	bh=mmOkhodHGtEQly1sJFXQCl0QkPRAuKzorAgvaUlQrpk=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=Nuav4sd1jzHBwS6lSQL5X95lx8S1SXKL2p2A9cyPJIyOVbXmUPjCmOnEQDI39iChb
	 m7ROshMWdHvDfvHjDNXgi++ec7c96YHppV23Rdoaf9ezqSYajeVQ/X5V4LUDtUmDF6
	 YOX63eNQYDOgHj+nj4EXqsVdqtBQkpfsTdsBvGULZTvIlcBwH+EDvildpXB+QshdGO
	 i+108STxuKEwdMRK7/3taHwCrbgFpTk/mM4K8GXa/BIpRKRCdBSsaifJ17hZqxbldv
	 pfj2aqzzOZKVbEze31SJyJBRQ5qPUpDdEK1OnoiLoa9Y2mBN9GP4vS0RZNAM3Ymi8a
	 BtMc0yFY/fHWg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89A9BC43458;
	Sun, 12 Jul 2026 03:14:05 +0000 (UTC)
From: Esteban Urrutia via B4 Relay <devnull+esteuwu.proton.me@kernel.org>
Date: Sat, 11 Jul 2026 23:14:01 -0400
Subject: [PATCH v2] iommu/arm-smmu-qcom: Add SM8450 MDSS compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260711-sm8450-qol-smmu-v2-1-41a6fba41c3e@proton.me>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/02NQQ6CMBREr0L+2pq2CAVW3sOwQPqRGqHYD42G9
 O4W2Libl8y8WYHQGSSokhUcekPGjhHkKYG2b8YHMqMjg+Qy50oIRkNxyTh721eMw8IyhboUqHl
 aKoiryWFnPrvxVh9My/2J7bxptkZvaLbuu196sfUOey7lv90LxlmqUCIWuit1c52cne14HhDqE
 MIPrXS1FbsAAAA=
X-Change-ID: 20260711-sm8450-qol-smmu-57ed91ed0397
To: Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, "Joerg Roedel (AMD)" <joro@8bytes.org>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Esteban Urrutia <esteuwu@proton.me>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783826044; l=1419;
 i=esteuwu@proton.me; s=20260622; h=from:subject:message-id;
 bh=IfJaejqIoPsz18N/gqtzvEjuLMyEPDB5DAuVkODkmwc=;
 b=UvSUTz/MEMZyJa7vizKpKWIYxkiZgRxVdBJ+9EKLTBhRtjyn7HLNnNYv7ncQG/5rvMzEMVbEi
 1LpVyl+XTlpB1FA0BgmVY6yPnRyCCrkkSS8bu45gFrluIVoQYEDttnj
X-Developer-Key: i=esteuwu@proton.me; a=ed25519;
 pk=wToFt4mOAWkzbqb15Ye1hrhevI13vK9BcMUFiQ/me1M=
X-Endpoint-Received: by B4 Relay for esteuwu@proton.me/20260622 with
 auth_id=835
X-Original-From: Esteban Urrutia <esteuwu@proton.me>
Reply-To: esteuwu@proton.me
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118537-lists,linux-arm-msm=lfdr.de,esteuwu.proton.me];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:iommu@lists.linux.dev,m:linux-arm-msm@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:phone-devel@vger.kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:esteuwu@proton.me,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	HAS_REPLYTO(0.00)[esteuwu@proton.me];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,proton.me:replyto,proton.me:mid,proton.me:email,msgid.link:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C6848743AF9

From: Esteban Urrutia <esteuwu@proton.me>

Add the compatible for the MDSS client on the Snapdragon 8 Gen 1 so it can
be properly configured by the IOMMU driver.

Otherwise, there is an unhandled context fault, because the framebuffer is
already configured in UEFI.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Esteban Urrutia <esteuwu@proton.me>
---
This patch allows the MDSS driver to properly function on SM8450 based
devices.
---
Changes in v2:
- Split series in subseries (dispcc, dts, qmp, smmu)
- Link to v1: https://patch.msgid.link/20260622-sm8450-qol-v1-0-37e2ee8df9da@proton.me
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index e2c914fccd6f..795e8ec7e8fa 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -425,6 +425,7 @@ static const struct of_device_id qcom_smmu_client_of_match[] __maybe_unused = {
 	{ .compatible = "qcom,sm6375-mdss" },
 	{ .compatible = "qcom,sm8150-mdss" },
 	{ .compatible = "qcom,sm8250-mdss" },
+	{ .compatible = "qcom,sm8450-mdss" },
 	{ .compatible = "qcom,x1e80100-mdss" },
 	{ }
 };

---
base-commit: bee763d5f341b99cf472afeb508d4988f62a6ca1
change-id: 20260711-sm8450-qol-smmu-57ed91ed0397

Best regards,
--  
Esteban Urrutia <esteuwu@proton.me>



