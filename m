Return-Path: <linux-arm-msm+bounces-109877-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +JJlD5y4FWrKYQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109877-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 17:13:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ABE325D86D9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 17:13:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F27A2305C51E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 15:04:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60A1A41B366;
	Tue, 26 May 2026 14:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S3h9MqkN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63F6F400DFF
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 14:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779807525; cv=none; b=pIw4b+K9+Ira2Q9Nf0tRjoQnIrACGesBfmXI8sP68i9unjnnwLtMRi1S5qC4eMgRUre/zbRQ4teumoGmVuuhu67Z/FcuLE5rjcTe7o8lwRS3ZLtoSVgi2Rm9iNtaPfxbkfGWfKgtLyosPLU3HJ1J9fjAZaIIeJCC3pSF/ZQ32bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779807525; c=relaxed/simple;
	bh=Q3qtZLbaAxNe/Ml4Vco9cMIjOM7QZfDDdQCMEVNa+bc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fR2ph+vNTZFQE4Um0rgo2Dg1nOuipD9dK2KIUOv65A0TpHB5FrUzwOY8+3488qmtVBo1HDrC59BBGt9o0Z4NXxcMwVaVoJzgnhY5755A7gTC6R9JThgec4cOVNmREmu2BJwGEDUkkSqyeECKdIJoH5kkPsE9GCdPeKxQleddSvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S3h9MqkN; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3C221F00A3A;
	Tue, 26 May 2026 14:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779807521;
	bh=WnbVx3Wf8n6g8+1K3F3HfJOpAIxDrMkmDGUSYXimutM=;
	h=From:To:Cc:Subject:Date;
	b=S3h9MqkNM7nhIQAdnHRqHHOhGORSU9uOCjaf1rtdfYFp1vrt/v0ykAnPzXICAuCZG
	 vszIoZPShp0ycja1BRp8WG9jZw60mTtiO/zDphA1stmOD7LfQr5UjlkzvvJ1JHYP4L
	 4KwJLnHx6A9YdOI/CymDyR834bOH2q+oBe/NOTHboC2esPGsC1hIckPl/57dISN2KC
	 uUTdnHNkwyx4JuO4jm0/6E1thR7T/7IuBbemaAVnHu4XMs/rNdHHssgEOml/bOZdlO
	 HWzgYF4N6H1Ywnx2EGxu/jxldrmdfeJ070ZINYva1heUwR7IFMTnRWRa9cpC2pqeUZ
	 /9jrRFihLaxOQ==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Subject: [GIT PULL] Qualcomm Arm64 defconfig fixes for v7.1
Date: Tue, 26 May 2026 09:58:39 -0500
Message-ID: <20260526145839.3800-1-andersson@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109877-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: ABE325D86D9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-defconfig-fixes-for-7.1

for you to fetch changes up to b73953af9bbd5c721c9d92b805a8aea8b0db74b1:

  arm64: defconfig: Enable PCI M.2 power sequencing driver (2026-05-18 09:56:50 -0500)

----------------------------------------------------------------
Qualcomm Arm64 defconfig fixes for v7.1

A number of targets now depends on the M.2 PCIe power sequencing driver,
enable this to keep these devices functional with a defconfig build.

----------------------------------------------------------------
Manivannan Sadhasivam (1):
      arm64: defconfig: Enable PCI M.2 power sequencing driver

 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

