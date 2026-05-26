Return-Path: <linux-arm-msm+bounces-109857-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4MTlKSS2FWrKYQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109857-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 17:03:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 519F15D83C3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 17:02:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 264BD300372C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 14:47:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32B403FDC05;
	Tue, 26 May 2026 14:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lh4vZZzg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16D1E3FD15C
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 14:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779806871; cv=none; b=PoMbMKvSbKiF2EujUN4HU5gHDQ78hoKy8FAXJ44dx0zJuCmn502zdJj5x51l528GOaI4egOU1jA22dYrwFWAsgsL9ZUg5122Uqp4XWgTaaBzXdKIDzGR+MfsPb547CYa80JlYB1ykhF6wxwS0lVG5Bi9wgbROhIP8mie/o6aVbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779806871; c=relaxed/simple;
	bh=I4iPR0pd3rbnXXYvHmgFYaUkKjHHBxISpGkZSsRqE5U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ecy9fPlb6qEYkCCOdmGQLAYUSbJZ7jQKYipv6BrkRmI0ZG8INSmxDIkKb5x0P5bsaF/DHi3hwGmswGG4oMYC4yZgmveoONOauoCmMwl5yyrJ3yyGzd41tw8OrQgRwmMf7TJJ4n2wCM4B8cf6FOcLCel99jO3g6m7Hdz0LF773Mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lh4vZZzg; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F7A31F000E9;
	Tue, 26 May 2026 14:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779806869;
	bh=RStObp8O+/IC+7JlVdvjDo5RIZxNBdmJc3V71lTJZUc=;
	h=From:To:Cc:Subject:Date;
	b=lh4vZZzgRdLKEiGvzMmwrV+jjPCQY5ljC12Qr86IUVky0d9FsMx0URhwt5ke5gPph
	 DXwTJU9dE9Ofc+QIKp4msqGRKMJ6OIYajJGKPbCdukBFBHzDbRirU7zCXwySaqMZQm
	 1NvshHT2KDVONdDvRrCpBq/Kc0zgT3bkOCITXqaqZOE1pJQkdVJY6r2Bla0fModpWe
	 SqTl2Be0Y82q+heiGUJv4fBpdYRwCcgUKY4CL81COE9cr/UD1ntVfsjE25qUXmGNz/
	 LfJKusLcTK3DU99she4AuWMujdW1eq69lbmu5ZXLBRVcA6Kmy9hciENmx8+tlu4I2/
	 VnYtEQ6TZCc8g==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
	Harshal Dev <harshal.dev@oss.qualcomm.com>
Subject: [GIT PULL] Qualcomm driver fixes for v7.1
Date: Tue, 26 May 2026 09:47:48 -0500
Message-ID: <20260526144748.2776-1-andersson@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109857-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 519F15D83C3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-fixes-for-7.1

for you to fetch changes up to 462a85f9f887a4fef36550bb76c7f7d7a0fa296c:

  soc: qcom: ice: Fix the error code when 'qcom,ice' property is not found (2026-05-21 18:18:44 -0500)

----------------------------------------------------------------
Qualcomm driver fixes for v7.1

The Qualcomm ICE driver suffers from race conditions between probe() and
get() and will in certain cases return the wrong error code, which
results in storage drivers failing to probe. Fix these issues.

Also correct the DeviceTree binding, to ensure that relevant clocks are
described and voted for, to prevent the driver from accessing unclocked
hardware during boot.

----------------------------------------------------------------
Bjorn Andersson (2):
      Merge branch '20260416-qcom_ice_power_and_clk_vote-v5-1-5ccf5d7e2846@oss.qualcomm.com' into drivers-fixes-for-7.1
      Merge branch '20260518-qcom-ice-fix-v7-0-2a595382185b@oss.qualcomm.com' into drivers-for-7.2

Harshal Dev (2):
      dt-bindings: crypto: qcom,ice: Fix missing power-domain and iface clk
      soc: qcom: ice: Allow explicit votes on 'iface' clock for ICE

Manivannan Sadhasivam (6):
      soc: qcom: ice: Fix race between qcom_ice_probe() and of_qcom_ice_get()
      soc: qcom: ice: Return -ENODEV if the ICE platform device is not found
      soc: qcom: ice: Return proper error codes from devm_of_qcom_ice_get() instead of NULL
      mmc: sdhci-msm: Remove NULL check from devm_of_qcom_ice_get()
      scsi: ufs: ufs-qcom: Remove NULL check from devm_of_qcom_ice_get()
      soc: qcom: ice: Fix the error code when 'qcom,ice' property is not found

 .../bindings/crypto/qcom,inline-crypto-engine.yaml | 35 +++++++++++-
 drivers/mmc/host/sdhci-msm.c                       | 10 ++--
 drivers/soc/qcom/ice.c                             | 66 +++++++++++++++++-----
 drivers/ufs/host/ufs-qcom.c                        | 10 ++--
 4 files changed, 95 insertions(+), 26 deletions(-)

