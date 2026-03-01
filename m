Return-Path: <linux-arm-msm+bounces-94687-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uC6RFB2do2k3IQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94687-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 01 Mar 2026 02:57:49 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C6AA21CC648
	for <lists+linux-arm-msm@lfdr.de>; Sun, 01 Mar 2026 02:57:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A33AB31B375E
	for <lists+linux-arm-msm@lfdr.de>; Sun,  1 Mar 2026 01:40:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5239E2F3C19;
	Sun,  1 Mar 2026 01:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LIxZ6w4X"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AA7C2F3C07;
	Sun,  1 Mar 2026 01:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772329219; cv=none; b=msVawH3992CrgwsjzCMMHgygCwSHSdu4iDUuVnxd6FYF02VWm/jqYPQbdb8VcXQGEvQCpph2KlaIOyiJpiRsLZDo0Hfla3sPIXPrmFKiRMdcBSDJzSOjbAacAiXaZvtyUX6HCcX4ZjkS7Ba3wRTG8A0EGtbloF7BUqADboF+Ifs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772329219; c=relaxed/simple;
	bh=kyJ5jjC2x3U8C/PgXJVifJa+RhFVoV3BBR7Q4KEGRBc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lDrpFXV94r40lE42oK2kdd4ZO0PQOub3OOZbqX7PPTo4t9M8KWJ1AQ77XSw/oc2fO1cU0feMZnvFG8cD6zl5GCV8ZzGUeHqT50yrvB5X7AXDKQh3tAII8BQBSi0QrvdpRzrHfSV3nFHh2VWwZV8mPzhw7gXRKeqB0PdPn1A+5/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LIxZ6w4X; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57E6CC19421;
	Sun,  1 Mar 2026 01:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772329219;
	bh=kyJ5jjC2x3U8C/PgXJVifJa+RhFVoV3BBR7Q4KEGRBc=;
	h=From:To:Cc:Subject:Date:From;
	b=LIxZ6w4XBHpGeK/qi6w+Qh7lCuIG/DzSmPd43iC8WK/VQbEzClY3akyif/7aR62rz
	 h0/+neHnytYbZsTMOSbjDtzRFfv1CwA9J76VWgJHeCengukedA56AfOuh7GHKrgoyc
	 tYQas7YxMXi7z8kiyD7ahQtzGm54WScP5Lo7yIklfHhi3x4d15bKcO1CZyddTXX6wH
	 fHCArXktakuEzILL1TzViTaBp7xoGoN1T13wGRQo+O2OpGPA+lTkDyejJQbO3yKptz
	 2pUnJlYDpClM45pShWorxiVYNpEVO/HXqPRoh4cwII5dAiqL9VLqNFw2+0ED0190na
	 4+ON+w4/adr+w==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	cassel@kernel.org
Cc: Manivannan Sadhasivam <mani@kernel.org>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	linux-pci@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: FAILED: Patch "Revert "PCI: qcom: Enable MSI interrupts together with Link up if 'Global IRQ' is supported"" failed to apply to 6.1-stable tree
Date: Sat, 28 Feb 2026 20:40:16 -0500
Message-ID: <20260301014017.1701500-1-sashal@kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94687-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,msgid.link:url,rock-chips.com:email]
X-Rspamd-Queue-Id: C6AA21CC648
X-Rspamd-Action: no action

The patch below does not apply to the 6.1-stable tree.
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





