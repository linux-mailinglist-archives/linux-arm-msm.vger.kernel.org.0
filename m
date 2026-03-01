Return-Path: <linux-arm-msm+bounces-94694-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mEwsDZuro2myJgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94694-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 01 Mar 2026 03:59:39 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A1B11CE1E9
	for <lists+linux-arm-msm@lfdr.de>; Sun, 01 Mar 2026 03:59:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CB1F833D1ECB
	for <lists+linux-arm-msm@lfdr.de>; Sun,  1 Mar 2026 01:50:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BBE32FD1B3;
	Sun,  1 Mar 2026 01:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sSElrp2k"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA62931280C;
	Sun,  1 Mar 2026 01:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772329727; cv=none; b=cb9pg8dy3yJb2bHMScIsZDCq4f5wXsHPjrv+n/fuwORCz+5FMrrXpJHhsIkRBxn+9hq1qRunifFn37ycVoN8lSPXWIyw4G4UK+FQc00IgjYuXGYIbpJzwkYVEr3NAJI60DzyZTR3UYfbMJp1GQ7CIVLwmNN7l/RQorbPiAf1m+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772329727; c=relaxed/simple;
	bh=vNd7LkGmxNT8mbGU/xBnuKNqTaBNjyglI+abRLE1Ay8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Q/vfSLrBsC6OFoA6QRoed0D4fvqNIaLxhPoCxnDzOROekhi53Fy4CotJhRy+FvkIizqIDdaauqXsV07s9g//8GJcz7uKeVzw6trXzbdpWKU6VWxDzk/oOUE0hCRZfcBhbiFDGSwj0HyfqKlJekeU3VIPXmvmFe/qZgLtkkhpt6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sSElrp2k; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1B50C19421;
	Sun,  1 Mar 2026 01:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772329726;
	bh=vNd7LkGmxNT8mbGU/xBnuKNqTaBNjyglI+abRLE1Ay8=;
	h=From:To:Cc:Subject:Date:From;
	b=sSElrp2krajqgI99HYdry8wlm9b3Mv2U5ByjpNa4G0pTz3f4aYXWDlCFMOa3NZ1hL
	 ZkbwNWsuKtFVj+sF/xIqtbfMQpOm2ySMK2MUoCXOGpWn0d+k4/JUzamV+Tbn5uonWh
	 pyO5Bautamlu1Q/W7873HA8qDogE4x8RtJeXuCvAH7yQDCqRseWw1mhkvpoyFvRDBs
	 gdj9GnUs2vSXmYxrebBbND2IJoOBijqyRSzUe4NJt4CjWM07GfpbtTuWFqs+lw+sDX
	 9dw+Iq9kf4ySEqahiLSV+0FEwvin2pg+vP0Lbo6KIZI0b3nxb0Yk7i/eGOF5V9zEfK
	 WekcWMnNxNHAQ==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	cassel@kernel.org
Cc: Manivannan Sadhasivam <mani@kernel.org>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	linux-pci@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: FAILED: Patch "Revert "PCI: qcom: Enable MSI interrupts together with Link up if 'Global IRQ' is supported"" failed to apply to 5.15-stable tree
Date: Sat, 28 Feb 2026 20:48:44 -0500
Message-ID: <20260301014844.1713000-1-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-stable: review
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94694-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 9A1B11CE1E9
X-Rspamd-Action: no action

The patch below does not apply to the 5.15-stable tree.
If someone wants it applied there, or to any other stable or longterm
tree, then please email the backport, including the original git commit
id to <stable@vger.kernel.org>.

Thanks,
Sasha

------------------ original commit in Linus's tree ------------------

From 7ebdefb87942073679e56cfbc5a72e8fc5441bfc Mon Sep 17 00:00:00 2001
From: Niklas Cassel <cassel@kernel.org>
Date: Mon, 22 Dec 2025 07:42:11 +0100
Subject: [PATCH] Revert "PCI: qcom: Enable MSI interrupts together with Link
 up if 'Global IRQ' is supported"

This reverts commit ba4a2e2317b9faeca9193ed6d3193ddc3cf2aba3.

Since the Link up IRQ support is going away, revert the MSI logic that got
added for it too.

Suggested-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Niklas Cassel <cassel@kernel.org>
[mani: reworded the description]
Signed-off-by: Manivannan Sadhasivam <mani@kernel.org>
Tested-by: Shawn Lin <shawn.lin@rock-chips.com>
Acked-by: Shawn Lin <shawn.lin@rock-chips.com>
Cc: stable@vger.kernel.org
Link: https://patch.msgid.link/20251222064207.3246632-12-cassel@kernel.org
---
 drivers/pci/controller/dwc/pcie-qcom.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index e87ec6779d44f..c5fcb87972e91 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -136,7 +136,6 @@
 
 /* PARF_INT_ALL_{STATUS/CLEAR/MASK} register fields */
 #define PARF_INT_ALL_LINK_UP			BIT(13)
-#define PARF_INT_MSI_DEV_0_7			GENMASK(30, 23)
 
 /* PARF_NO_SNOOP_OVERRIDE register fields */
 #define WR_NO_SNOOP_OVERRIDE_EN			BIT(1)
@@ -1982,8 +1981,7 @@ static int qcom_pcie_probe(struct platform_device *pdev)
 			goto err_host_deinit;
 		}
 
-		writel_relaxed(PARF_INT_ALL_LINK_UP | PARF_INT_MSI_DEV_0_7,
-			       pcie->parf + PARF_INT_ALL_MASK);
+		writel_relaxed(PARF_INT_ALL_LINK_UP, pcie->parf + PARF_INT_ALL_MASK);
 	}
 
 	qcom_pcie_icc_opp_update(pcie);
-- 
2.51.0





