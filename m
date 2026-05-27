Return-Path: <linux-arm-msm+bounces-110009-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sNTHEhQSF2pf3QcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110009-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 17:47:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E340C5E723F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 17:47:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9F31E3003633
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 15:46:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD4D837B3FD;
	Wed, 27 May 2026 15:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G73LhGf/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C28732BF41;
	Wed, 27 May 2026 15:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779896779; cv=none; b=mVF4nVKlKHCfBAVUsMdNbA3rSYk05SO4JoM+40LrlqUArsnThGnsajnFKa7wzSTsB0m9DJMteeXoCm+YghmgTDalj6x34z7dswk1PT2IGutKmVfp2gBGuarLV7C4kV4PIA0jG16Chei/HlVUEffru5uuzyeVhnYWDvvCcT5Qg4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779896779; c=relaxed/simple;
	bh=8nHjRII1bGfS5ZDPkck3KgLk3PLh/gyrZ+YDaGi3tVM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A1pALM9lb2IXUQzP9gGtfCVCJ+4O5BaO8N/z5utFIKjHAsNbJ5OYnVbc2nOvDSvuxoyD+1oS/7WeGfVLMVrJvrvgRCqAVBdhFMhCpjSwrR9pd5sfohnz5AYGvQyKe0plWw4Y6Bxaob2RdoF58onUa03I8X/4FsxHpQFb1OH03UA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G73LhGf/; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57F571F000E9;
	Wed, 27 May 2026 15:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779896778;
	bh=CRFzbY/Pvx9sqS5IFlNYaoDBSo8VEfy1ySxkp44+ezA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=G73LhGf/35uAGCZ5j+7bq16+PNIguj2IWp97T/XGT+PwXrr3ssYHNTkZEqMiGyrHC
	 /5l2Aj783WxXhRM9L7o2oqs0GI02qRffAfnzDIEcM97Q+VcuKCt7ZqqpFklfv9qkcB
	 vBlxFEzY4qvpo2atqsX+JolVk/EYK061c038SJBY8OkfpKMuP4zCRkYLC1Ccr3RQqZ
	 rLwzQf7w1PgSTyp5nWV9KKBZR85A4Yy5D4v7N5vWhWcolxo82Aw7AjAlKlV67l9NwT
	 Ar+dWu1XfUjJFZulgLhlKhfYgg4sPHvGVa522NGumC1I7j7l0zBUJwgmPyRqciwTeh
	 C+TNcx8wS96XA==
Date: Wed, 27 May 2026 17:46:12 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Slark Xiao <slark_xiao@163.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, 
	mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] bus: mhi: host: pci_generic: Fix the physical function
 check
Message-ID: <n7e2ikwbgyuqkftn2z4dkc3eazsal3k247azxgsnnvxxwf6bvo@u3sifco5oazv>
References: <20260527085220.14139-1-manivannan.sadhasivam@oss.qualcomm.com>
 <12aa604a.8d99.19e68e81ed2.Coremail.slark_xiao@163.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <12aa604a.8d99.19e68e81ed2.Coremail.slark_xiao@163.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[163.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110009-lists,linux-arm-msm=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:email]
X-Rspamd-Queue-Id: E340C5E723F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, May 27, 2026 at 06:08:23PM +0800, Slark Xiao wrote:
> At 2026-05-27 16:52:20, "Manivannan Sadhasivam" <manivannan.sadhasivam@oss.qualcomm.com> wrote:
> >Commit b4d01c5b9a9d ("bus: mhi: host: pci_generic: Read SUBSYSTEM_VENDOR_ID
> >for VF's to check status") added the check for physical function by
> >checking for 'pdev->is_physfn. But 'pdev->is_physfn' is only set for the
> >physical function of a SR-IOV capable device. But for the non-SR-IOV device
> >this variable will be 0. So this check ended up breaking the health check
> >functionality for all non-SR-IOV devices.
> >
> >Fix it by checking for '!pdev->is_virtfn' to make sure that the check is
> >only skipped for virtual functions.
> >
> >Reported-by: Slark Xiao <slark_xiao@163.com>
> >Fixes: b4d01c5b9a9d ("bus: mhi: host: pci_generic: Read SUBSYSTEM_VENDOR_ID for VF's to check status")
> >Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> >---
> > drivers/bus/mhi/host/pci_generic.c | 20 ++++++++++----------
> > 1 file changed, 10 insertions(+), 10 deletions(-)
> >
> >diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
> >index 5836ecb0ea32..0d0d9c7ffa4b 100644
> >--- a/drivers/bus/mhi/host/pci_generic.c
> >+++ b/drivers/bus/mhi/host/pci_generic.c
> >@@ -1261,7 +1261,7 @@ static void mhi_pci_recovery_work(struct work_struct *work)
> > 
> > 	dev_warn(&pdev->dev, "device recovery started\n");
> > 
> >-	if (pdev->is_physfn)
> >+	if (!pdev->is_virtfn)
> > 		timer_delete(&mhi_pdev->health_check_timer);
> > 
> > 	pm_runtime_forbid(&pdev->dev);
> >@@ -1291,7 +1291,7 @@ static void mhi_pci_recovery_work(struct work_struct *work)
> > 
> > 	set_bit(MHI_PCI_DEV_STARTED, &mhi_pdev->status);
> > 
> >-	if (pdev->is_physfn)
> >+	if (!pdev->is_virtfn)
> > 		mod_timer(&mhi_pdev->health_check_timer, jiffies + HEALTH_CHECK_PERIOD);
> > 
> > 	return;
> >@@ -1382,7 +1382,7 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
> > 		mhi_cntrl_config = info->config;
> > 
> > 	/* Initialize health check monitor only for Physical functions */
> >-	if (pdev->is_physfn)
> >+	if (!pdev->is_virtfn)
> > 		timer_setup(&mhi_pdev->health_check_timer, health_check, 0);
> > 
> > 	mhi_cntrl = &mhi_pdev->mhi_cntrl;
> >@@ -1404,7 +1404,7 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
> > 	mhi_cntrl->mru = info->mru_default;
> > 	mhi_cntrl->name = info->name;
> > 
> >-	if (pdev->is_physfn)
> >+	if (!pdev->is_virtfn)
> > 		mhi_pdev->reset_on_remove = info->reset_on_remove;
> > 
> > 	if (info->edl_trigger)
> >@@ -1453,7 +1453,7 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
> > 	set_bit(MHI_PCI_DEV_STARTED, &mhi_pdev->status);
> > 
> > 	/* start health check */
> >-	if (pdev->is_physfn)
> >+	if (!pdev->is_virtfn)
> > 		mod_timer(&mhi_pdev->health_check_timer, jiffies + HEALTH_CHECK_PERIOD);
> > 
> > 	/* Allow runtime suspend only if both PME from D3Hot and M3 are supported */
> >@@ -1482,7 +1482,7 @@ static void mhi_pci_remove(struct pci_dev *pdev)
> > 	pm_runtime_forbid(&pdev->dev);
> > 	pci_disable_sriov(pdev);
> > 
> >-	if (pdev->is_physfn)
> >+	if (!pdev->is_virtfn)
> > 		timer_delete_sync(&mhi_pdev->health_check_timer);
> > 	cancel_work_sync(&mhi_pdev->recovery_work);
> > 
> >@@ -1514,7 +1514,7 @@ static void mhi_pci_reset_prepare(struct pci_dev *pdev)
> > 
> > 	dev_info(&pdev->dev, "reset\n");
> > 
> >-	if (pdev->is_physfn)
> >+	if (!pdev->is_virtfn)
> > 		timer_delete(&mhi_pdev->health_check_timer);
> > 
> > 	/* Clean up MHI state */
> >@@ -1560,7 +1560,7 @@ static void mhi_pci_reset_done(struct pci_dev *pdev)
> > 	}
> > 
> > 	set_bit(MHI_PCI_DEV_STARTED, &mhi_pdev->status);
> >-	if (pdev->is_physfn)
> >+	if (!pdev->is_virtfn)
> > 		mod_timer(&mhi_pdev->health_check_timer, jiffies + HEALTH_CHECK_PERIOD);
> > }
> > 
> >@@ -1626,7 +1626,7 @@ static int  __maybe_unused mhi_pci_runtime_suspend(struct device *dev)
> > 	if (test_and_set_bit(MHI_PCI_DEV_SUSPENDED, &mhi_pdev->status))
> > 		return 0;
> > 
> >-	if (pdev->is_physfn)
> >+	if (!pdev->is_virtfn)
> > 		timer_delete(&mhi_pdev->health_check_timer);
> > 
> > 	cancel_work_sync(&mhi_pdev->recovery_work);
> >@@ -1679,7 +1679,7 @@ static int __maybe_unused mhi_pci_runtime_resume(struct device *dev)
> > 	}
> > 
> > 	/* Resume health check */
> >-	if (pdev->is_physfn)
> >+	if (!pdev->is_virtfn)
> > 		mod_timer(&mhi_pdev->health_check_timer, jiffies + HEALTH_CHECK_PERIOD);
> > 
> > 	/* It can be a remote wakeup (no mhi runtime_get), update access time */
> >-- 
> >2.51.0
> 
> Tested-by: Slark Xiao <slark_xiao@163.com>
> 
> Test result is expected now with these changes.
> BTW, shall we add this changes into stable version? Since kernel 6.18 and 7.0  have been affected.
> 

I've CCed stable list while applying. Hopefully, stable team will backport this
fix once this gets merged upstream.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

