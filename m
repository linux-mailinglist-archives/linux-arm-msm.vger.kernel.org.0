Return-Path: <linux-arm-msm+bounces-106347-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +PfIFOJ+/GnXQgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106347-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 14:00:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EC3714E7E58
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 14:00:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 77A38301625A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 11:59:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A00203AA4E2;
	Thu,  7 May 2026 11:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hGdH4KVW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20D1A3EDABB;
	Thu,  7 May 2026 11:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778155160; cv=none; b=kx9/v6X6N3SosbuzVLTi8p/33Ft+roei1FUbQ4tWP34baW0pGd01EdjQ5wdgt8UKn9bA6BWnOPWUOLx7JohNF/tq6gHmAuJ36Q6VBaOFT3G6NyDgV6nCfBChKyQRgiv+ERSaPCBmBidQNcDDzeW8lKrigoyltGUbIoabOL6d3lI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778155160; c=relaxed/simple;
	bh=7Dv78dPHpwiIhvWhF88DDJPcf7VAJ8SNWBAQJdLzKEk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XrzO+VD41FoKRN52XuGdWPu330jEe5mq6wCp/6jXZ+FcqOxK8WDOrx8BP4bP+CsT7Hsy/Pgf5HzIXZAJALJGJyKxFFBDKU3onLsqJ+QNF79m0VtczZ1r8vLM2LjSDdO2GgFpWaPGuYATvr2cWd4kY6NKPyv0Jslvj7K7JJbUNfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hGdH4KVW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 143EFC2BCB2;
	Thu,  7 May 2026 11:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778155159;
	bh=7Dv78dPHpwiIhvWhF88DDJPcf7VAJ8SNWBAQJdLzKEk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hGdH4KVW5+m/0FDhqPVhqTuLYSZ1Mtb/p4X06PPr1WOiOjp9gaII94BITfW/cGF1T
	 42okWI++PIA97lJDOVB5Q+GpiaeHk9VRAR3HbhwVi03QtRS25ib5d3gYfc/hhqef8o
	 hKsksNjNDK04bz2d1Jq8uBzmHeWMLrxaaS1LBJQy5U7OFKAWuXtVMhyWhHNDB/csx2
	 I/Ltl+zjgWH5sAnDd3FI4s6JhYAlB3CaibnA4pxi7d3UsijzkrImYhuk37EkXiMYax
	 X3+1ibtGFqLiNiv7anQZ+cX6gSvMVXxMMppaAnjhLlTohFGEFAaPpwgRsJlTt6Y8RX
	 iIwf4LlWX7Muw==
Date: Thu, 7 May 2026 17:29:06 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: manivannan.sadhasivam@oss.qualcomm.com, 
	Bartosz Golaszewski <brgl@kernel.org>, Marcel Holtmann <marcel@holtmann.org>, 
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>, Shuai Zhang <quic_shuaz@quicinc.com>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-bluetooth@vger.kernel.org, Wei Deng <wei.deng@oss.qualcomm.com>, 
	Luiz Augusto von Dentz <luiz.von.dentz@intel.com>, stable+noautosel@kernel.org
Subject: Re: [PATCH 12/12] Bluetooth: hci_qca: Fix the broken BT_EN GPIO
 detection for Qcom WCN devices
Message-ID: <u65dquj6im54rc6w5apmq2a6mcpndvh3slcxbjh2bs5el7epw4@zjovdsjkm6ur>
References: <20260422-pwrseq-m2-bt-v1-0-720d02545a64@oss.qualcomm.com>
 <20260422-pwrseq-m2-bt-v1-12-720d02545a64@oss.qualcomm.com>
 <klxyhlqwzl6dzk76lrhugxqdsv4hushphlfchuorcmvx5yja7q@pdmp3abepldg>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <klxyhlqwzl6dzk76lrhugxqdsv4hushphlfchuorcmvx5yja7q@pdmp3abepldg>
X-Rspamd-Queue-Id: EC3714E7E58
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106347-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,holtmann.org,gmail.com,quicinc.com,vger.kernel.org,intel.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,noautosel];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Wed, Apr 22, 2026 at 09:13:31PM +0300, Dmitry Baryshkov wrote:
> On Wed, Apr 22, 2026 at 04:54:53PM +0530, Manivannan Sadhasivam via B4 Relay wrote:
> > From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> > 
> > Commit 'db0ff7e15923 ("driver: bluetooth: hci_qca:fix unable to load the BT
> > driver")' tried to check the presence of the BT_EN GPIO in Qcom WCN devices
> > to indicate the HCI layer whether this BT device can be power controlled or
> > not.
> > 
> > But it was broken for two reasons:
> > 
> > 1. Assumes that when devm_pwrseq_get() API returns an error, BT_EN is not
> > controllable. This is no way true as the API can fail for various reasons
> > and also the pwrseq-qcom-wcn driver treats the BT_EN GPIO as optional. So
> > even if the GPIO is not present, it will not fail the probe and this API
> > will not fail.
> > 
> > 2. By skipping the error return, probe deferral is completely broken as the
> > API may return -EPROBE_DEFER to indicate the caller that the pwrseq driver
> > is not yet probed. Skipping the return value means, this driver is not
> > going to depend on pwrseq driver probing again and it just assumes that
> > the pwrseq is not available.
> > 
> > So to fix these issues, fail the probe if devm_pwrseq_get() returns an
> > error and if it succeeds, use the newly introduced pwrseq_is_fixed() API to
> > check whether the power sequencer is fixed or not (i.e., whether the
> > Bluetooth interface on the Qcom WCN device is controllable using BT_EN GPIO
> > or not) and set the 'bt_en_available' flag accordingly.
> > 
> > Cc: <stable+noautosel@kernel.org> # Depends on pwrseq change
> > Fixes: db0ff7e15923 ("driver: bluetooth: hci_qca:fix unable to load the BT driver")
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> > ---
> >  drivers/bluetooth/hci_qca.c | 15 ++++++---------
> >  1 file changed, 6 insertions(+), 9 deletions(-)
> > 
> > diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
> > index 27e52b08ec47..dd1d93cbb3d8 100644
> > --- a/drivers/bluetooth/hci_qca.c
> > +++ b/drivers/bluetooth/hci_qca.c
> > @@ -2470,16 +2470,13 @@ static int qca_serdev_probe(struct serdev_device *serdev)
> >  			qcadev->bt_power->pwrseq = devm_pwrseq_get(&serdev->dev,
> >  								   "bluetooth");
> >  
> > -			/*
> > -			 * Some modules have BT_EN enabled via a hardware pull-up,
> > -			 * meaning it is not defined in the DTS and is not controlled
> > -			 * through the power sequence. In such cases, fall through
> > -			 * to follow the legacy flow.
> > -			 */
> >  			if (IS_ERR(qcadev->bt_power->pwrseq))
> > -				qcadev->bt_power->pwrseq = NULL;
> > -			else
> > -				break;
> > +				return PTR_ERR(qcadev->bt_power->pwrseq);
> 
> This will break the case of WCN399x devices without the PMU in device
> tree. There is no enable-gpios since BT is not controllable, but if
> there is no PMU, then devm_pwrseq_get() will always return
> -EPROBE_DEFER.
> 

Hmm. I missed that the pwrseq returns -EPROBE_DEFER even if the client doesn't
require power sequencing. It is because, it has no way to figure it out.

But I think the client can parse the regulator phandle, reach the regulator
parent, then check for the '-pmu' suffix in the compatible to make sure that it
has the power sequencing requirement. Then it can call devm_pwrseq_get() only if
that check passes.

I'll do it in a separate series though as this series fixes a different problem
altogether.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

