Return-Path: <linux-arm-msm+bounces-109940-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aF3UEGGvFmokogcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109940-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 10:46:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D3FB5E147F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 10:46:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 59E7D30356FA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 08:43:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C44813E00AD;
	Wed, 27 May 2026 08:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QhtrgpfG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA8AF377009;
	Wed, 27 May 2026 08:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779871438; cv=none; b=dSzH67GYcmkSLPkVuFz92Hn6ZiA2IoisrEVIFWXKZ1j7iN0MSv774X6RrahMwvdeKYUgmK9fFhgSQrVtgrGOIufrY5J5wPpXwrl0LVg0wb7rOPnhRwFsyxvGtnarM22kjKl/oUaWJguvYdL3VKWnRJnuvl+LKBkOC6Bpw4Wv9bY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779871438; c=relaxed/simple;
	bh=xM6pn0UC9+sOiDUQppprjDUfEvnLXNVq9kDqk7p9l+U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sINKeCj/9HTbFVMkO5NsyBJd/U1R86XLcRYS/5qzjdZGgTQAF5BcfaEHp496C81quaFCNtu8QFHHrCr50hHkqVZGK8fWssKcn/6JOhP77K3q+Fnqs48LGmyhOoofIrDsRyG/6mYmQV6BSDM1ef2Hqsp7E7SUqv76vSre4el+4vg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QhtrgpfG; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21B321F000E9;
	Wed, 27 May 2026 08:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779871437;
	bh=apMDLFVE20VYz0VOe6++2k+xxLMIVv62QQ00GL6rdw8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QhtrgpfGElMe7XH6RzsqwL8wS7nMq1YuAHuFicfSjU9uu7y9YBTEgIR4NECmdAU0H
	 OpA/9u6xHow23ELrdx6rW4M0vZIGBTWxa8EO1SKLl7TZrlQzzot9okOcSQwT1o7hYA
	 9Y314ArgfzR/adle0nyvCyW5zUUUMpF27OGsrCOjPYPfv4cZVW2HvgWoaIkTHZtPGK
	 /IGrrDnNV/c4+tWPxMgD15qu4QBPYiGGwco12bptgSz86ShwNNVEcglFobL+cfjNUf
	 dEYwkeZkpxMwO+V9JzZyYfv86V0ZQUrYrrGvETkWZErav3KHJS/o/QxKOcTH7UpKxT
	 EhHyWC/dnU16Q==
Date: Wed, 27 May 2026 10:43:53 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Slark Xiao <slark_xiao@163.com>
Cc: "manivannan.sadhasivam@linaro.org" <manivannan.sadhasivam@linaro.org>, 
	"mhi@lists.linux.dev" <mhi@lists.linux.dev>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
Subject: Re: Concern about commit bus: mhi: host: pci_generic: Read
 SUBSYSTEM_VENDOR_ID for VF's to check status
Message-ID: <mqnxszftflkzm34risvyrkfwy226e5gycllw2fpgexcg5ejdat@nzqnzczcwfqj>
References: <2441e0c7.6edc.19e6887e64f.Coremail.slark_xiao@163.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2441e0c7.6edc.19e6887e64f.Coremail.slark_xiao@163.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[163.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-109940-lists,linux-arm-msm=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5]
X-Rspamd-Queue-Id: 9D3FB5E147F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, May 27, 2026 at 04:23:17PM +0800, Slark Xiao wrote:
> Hi Mani,
> I got a problem recently about the health_check function. It's disabled in my Thinkpad X1 Gen14.
> After checking, this feature was disbaled because the commit bus: mhi: host: pci_generic: Read SUBSYSTEM_VENDOR_ID for VF's to check status.
> 
> 
> This commit only allows the device that the value "pdev->is_physfn" is true to enable health check.
> But I don't know why my PC and WWAN device would get a false result. Test result as below:
> 
> 
> [    3.920101] mhi-pci-generic 0000:08:00.0: MHI PCI device found: foxconn-t99w696
> [    3.920113] mhi-pci-generic 0000:08:00.0: ##debug## mhi_cntrl_config is assign
> [    3.920114] mhi-pci-generic 0000:08:00.0: ##debug## mhi_pci_claim ..
> [    3.920127] mhi-pci-generic 0000:08:00.0: enabling device (0000 -> 0002)
> [    3.920179] mhi-pci-generic 0000:08:00.0: ##debug## mhi_pci_get_irqs ..
> [    3.930223] mhi-pci-generic 0000:08:00.0: ##debug## mhi_register_controller ..
> [    3.935268] mhi-pci-generic 0000:08:00.0: ##debug## mhi_prepare_for_power_up ..
> [    3.935373] mhi-pci-generic 0000:08:00.0: ##debug## mhi_sync_power_up ..
> [    3.935375] mhi mhi0: Requested to power ON
> [    3.935388] mhi mhi0: Power on setup success
> [    3.971342] mhi-pci-generic 0000:08:00.0: pdev->is_physfn is 0
> [    3.971346] mhi-pci-generic 0000:08:00.0: pdev->is_virtfn is 0
> 
> 
> For my situation, both pdev->is_virtfn and pdev->is_physfn are false.
> And I also checked the requirement for pdev->is_physf, seems it will only be 1 if the device has SR-IOV capbility and the function is recognized as a PF. If your device is just
> a regular PCIe function or the kernel does not recognize the SR-IOV capability, it will be 0.
> 
> 
> So for mhi_pci_generic side, I suggest that we should modify it by using "!pdev->is_virtfn" instead of "pdev->is_physfn".
> 

Sorry for the breakage! Yeah, that was a mistake. It should've been
"!pdev->is_virtfn". Let me fix it right away.

Thanks for reporting. Please share your tested-by tag for the patch after
testing it.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

