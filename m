Return-Path: <linux-arm-msm+bounces-92097-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2Ft7I7hJhmkhLgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92097-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Feb 2026 21:06:16 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 08A8C10302A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Feb 2026 21:06:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8141D302A6E1
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Feb 2026 20:05:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77D40267B07;
	Fri,  6 Feb 2026 20:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=danielhodges.dev header.i=@danielhodges.dev header.b="i6iburd6";
	dkim=permerror (0-bit key) header.d=danielhodges.dev header.i=@danielhodges.dev header.b="SdPRbV7z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from devnull.danielhodges.dev (vps-2f6e086e.vps.ovh.us [135.148.138.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD2A81684B0;
	Fri,  6 Feb 2026 20:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=135.148.138.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770408332; cv=none; b=Rnu/A2QJzq5nKl45Z126K9Ksc12YVucQIaNQoa6uvSNmxlVQ9suLgpl6sMaK/cFC/FIuZKkhsZIRO3SvVynykzOAuMpFB/83Pgzypw2wSu8j9Fp4+JuEoVP4ziusUzRKZLLjf7ZaJAzcRuCQCMB6Ef2AO0cqxjz2FE903fMQvA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770408332; c=relaxed/simple;
	bh=OW+Q3rzodi0tW38z+786M3YCC3DeD5z4t0v6YdGlt2A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fE/nkZCR8qV3yPcsKwVMQAlqxtfQHT6fV5bcwWsBLHTyhFd949dVEXZGBHD17XJGpZYvAid8wU467UzkSPtr7k4/Zae8LdQm5nSXYZw1AHuFDvaTLtqv8aCC+bZHzV6n8tjrNn85wsYAuKbv8zZYgUAC1z3nKgoWsYvaAwcZsQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=danielhodges.dev; spf=pass smtp.mailfrom=danielhodges.dev; dkim=pass (2048-bit key) header.d=danielhodges.dev header.i=@danielhodges.dev header.b=i6iburd6; dkim=permerror (0-bit key) header.d=danielhodges.dev header.i=@danielhodges.dev header.b=SdPRbV7z; arc=none smtp.client-ip=135.148.138.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=danielhodges.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=danielhodges.dev
DKIM-Signature: v=1; a=rsa-sha256; s=202510r; d=danielhodges.dev; c=relaxed/relaxed;
	h=Message-ID:Date:Subject:To:From; t=1770408330; bh=5QQtgVbtkot2rgxT7w3IBYs
	aUEG80YUdurHvF76mGi8=; b=i6iburd6bUi2yiOeQ92+nHXUYxNSjyhEnBRGyuSMP/HQUBnoya
	J3fWye8Z9O6gKjy7sQ9sp6hmD7lc3iz13A8v5Ugwc5RDqa74QeE0cnIY3PndahfFkFPBJBNbQ5/
	kpFZaHq/+s4bthT16wC0m/VM5GSQjbPYBSnzNnW66uNHI2EsPuk8c9zVw+anDNOvMi7I2CvCoLX
	vUfmrkWhZPytkq3YVf44ZVsnjwWsQvYR6MVT31WcBSZ7156U83SfEZYLhMIWequdWM7SqNvJBQf
	/syEfw3kcog1znFazvPcWNF5Nj40T0etTu7qlGVoxO4e+Llycb0pIf944SP+LWqdtMw==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202510e; d=danielhodges.dev; c=relaxed/relaxed;
	h=Message-ID:Date:Subject:To:From; t=1770408330; bh=5QQtgVbtkot2rgxT7w3IBYs
	aUEG80YUdurHvF76mGi8=; b=SdPRbV7zHGtxVuFTg8s2NS6qMmuPmN/qOmRAyiKsZlyhOGmYmP
	roY0mMPhtXSdpKirQd88UKXNOrxH1nS0f4Bw==;
From: Daniel Hodges <git@danielhodges.dev>
To: mani@kernel.org,
	kwilczynski@kernel.org
Cc: kishon@kernel.org,
	bhelgaas@google.com,
	mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Daniel Hodges <git@danielhodges.dev>
Subject: [PATCH] PCI: epf-mhi: return 0 on success instead of positive jiffies
Date: Fri,  6 Feb 2026 15:05:29 -0500
Message-ID: <20260206200529.10784-1-git@danielhodges.dev>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[danielhodges.dev,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[danielhodges.dev:s=202510r,danielhodges.dev:s=202510e];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92097-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[danielhodges.dev:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[git@danielhodges.dev,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[danielhodges.dev:email,danielhodges.dev:dkim,danielhodges.dev:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 08A8C10302A
X-Rspamd-Action: no action

wait_for_completion_timeout() returns the number of jiffies remaining
on success (positive value) or 0 on timeout. The pci_epf_mhi_edma_read()
and pci_epf_mhi_edma_write() functions use the return value directly as
their own return value, only converting timeout (0) to -ETIMEDOUT.

On success, they return the positive jiffies value. The callers in
drivers/bus/mhi/ep/ring.c check for errors with "if (ret < 0)" for
read_sync and "if (ret)" for write_sync. This causes write_sync success
cases to be incorrectly treated as errors since the positive jiffies
value is non-zero.

Fix by setting ret to 0 when wait_for_completion_timeout() succeeds.

Fixes: 7b99aaaddabb ("PCI: epf-mhi: Add eDMA support")
Cc: stable@vger.kernel.org
Signed-off-by: Daniel Hodges <git@danielhodges.dev>
---
 drivers/pci/endpoint/functions/pci-epf-mhi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/pci/endpoint/functions/pci-epf-mhi.c b/drivers/pci/endpoint/functions/pci-epf-mhi.c
index 6643a88c7a0c..2f077d0b7957 100644
--- a/drivers/pci/endpoint/functions/pci-epf-mhi.c
+++ b/drivers/pci/endpoint/functions/pci-epf-mhi.c
@@ -367,6 +367,8 @@ static int pci_epf_mhi_edma_read(struct mhi_ep_cntrl *mhi_cntrl,
 		dev_err(dev, "DMA transfer timeout\n");
 		dmaengine_terminate_sync(chan);
 		ret = -ETIMEDOUT;
+	} else {
+		ret = 0;
 	}
 
 err_unmap:
@@ -438,6 +440,8 @@ static int pci_epf_mhi_edma_write(struct mhi_ep_cntrl *mhi_cntrl,
 		dev_err(dev, "DMA transfer timeout\n");
 		dmaengine_terminate_sync(chan);
 		ret = -ETIMEDOUT;
+	} else {
+		ret = 0;
 	}
 
 err_unmap:
-- 
2.52.0


