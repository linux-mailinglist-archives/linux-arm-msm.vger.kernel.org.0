Return-Path: <linux-arm-msm+bounces-94783-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kIuqLws8pWne6QUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94783-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 08:28:11 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1543B1D3E45
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 08:28:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A8E73300C93C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2026 07:28:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0398C32AAB3;
	Mon,  2 Mar 2026 07:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MdE/Dts0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D30F43FF1;
	Mon,  2 Mar 2026 07:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772436488; cv=none; b=qWs8D21gz8B6kfnjq6+fS1k7ObxRMIZa4vlDDB6mhsvxvqMn3Tlx0hgImts2M8Xxo9TV19DocDr5Y/GtZ/gvV+wzYB7KSL/Ns19vPpCVVN63ocMLTQi8aeFN64/nwbL9CwNpzG0WdEwRjV/Y9CtFMHgkMVIRkGIjDECXXkwaI7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772436488; c=relaxed/simple;
	bh=HjoS5dJpV1blUOPyZj4PekTv+ApMqRtQr2c1nZERRWw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cJgAmDm1xsGtZWcIWyYwqc+zJFIiKSe8YpfbcVKLr99YRDiaa9kjkKJY5k/eDn2ciFPGTajlsVtwWE4PqzWr0MIAjyAORAFoe1mKt5GcQv6cjcHeXE2lrHrYeXyepseQKvdLYq6Av16YJQQPIFE0ERGQs83cvNEtUTQfWrNPRsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MdE/Dts0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF53BC19423;
	Mon,  2 Mar 2026 07:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772436488;
	bh=HjoS5dJpV1blUOPyZj4PekTv+ApMqRtQr2c1nZERRWw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MdE/Dts0svgdaQbD+fuFc5IVrgfQsH4BCvSpqCkm09RYJIhX6yVeZoIk/PM0q3GDC
	 5vv0zQsT+7y6XYT3GxJlzUUm35dL/p0AwyF3lI9+qlUpZq4vRL0vr2HNyikfc0h8L8
	 N934ctLYyCZYTmoo5VtegVmMqFxjnXa2fTWDuE9h9V+2EKsUb/gLWpyTMfZYhyfwqv
	 byoFBWKIw1D05bZ/sWDIrEbXBcS8YwiVOmDYBi1wzKs2XvTYXYb5Zq5uGxfmnKkjg5
	 jS0RmzpdyQYvZZYAiOoc5ua8J8HXN8Lx3j8Yce4sVwLCK+apRUvMATxhwC8oTJj6g8
	 zVLeOWb47Yb/A==
Date: Mon, 2 Mar 2026 12:57:57 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, 
	mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] bus: mhi: host: pci_generic: Add Qualcomm SDX35 modem
Message-ID: <wtybwmfau4ldtnbh5qr3eady2zn5ryac7w4ad4cjfg5jy5eyde@wfzkzgeoxftk>
References: <20260123-mhi_sdx35-v1-1-79440abf0c92@oss.qualcomm.com>
 <4c552f50-a712-49e1-addf-7f0950495496@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4c552f50-a712-49e1-addf-7f0950495496@oss.qualcomm.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94783-lists,linux-arm-msm=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1543B1D3E45
X-Rspamd-Action: no action

On Fri, Jan 23, 2026 at 12:58:45PM +0100, Konrad Dybcio wrote:
> On 1/23/26 12:46 PM, Krishna Chaitanya Chundru wrote:
> > Add support for sdx35 modem. Similar to SDX75, SDX35 can take longer to
> > transition to ready during power up, so use modem_qcom_v2_mhiv_config
> > configurations.
> > 
> > 01:00.0 Unassigned class [ff00]: Qualcomm Device 011a
>           ^ this looks like a separate bug to fix
> 
> see e.g. qcom_fixup_class in drivers/pci/controller/dwc/pcie-qcom.c
> 

Controller specific fixups are only for Root Ports. But this 'Unassigned class'
is for the endpoint device and is a common pattern among the Qcom modems not
setting the proper class.

I've sent a patch adding quirk for some known devices:
https://lore.kernel.org/linux-pci/20260302072449.13584-1-manivannan.sadhasivam@oss.qualcomm.com

- Mani

> Konrad

-- 
மணிவண்ணன் சதாசிவம்

