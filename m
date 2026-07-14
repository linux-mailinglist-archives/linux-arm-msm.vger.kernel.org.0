Return-Path: <linux-arm-msm+bounces-119052-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id b/4vOOdAVmoD2QAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119052-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 16:00:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 105007556FF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 16:00:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=aAnB2vu9;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119052-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119052-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0EA0931366A4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 13:56:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CFF147AF6F;
	Tue, 14 Jul 2026 13:56:32 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA353477E58;
	Tue, 14 Jul 2026 13:56:30 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784037392; cv=none; b=szPFcLdY8v2S3G0oSw2K+B2vq+Czy0rqp+neMYGzVnzgIoAu4JXlgejM64lPvF0IqfY/QBokIrdW7+3nExXrPlUGKxqCsAxiFgLGFK5ZgUZu32QB2bfOhZHY/+VBmM1q2E9CBmG78b7ZiTHVbGWWVjwAr3WsT8HsAwQYjfApTik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784037392; c=relaxed/simple;
	bh=fRiZB8tA7lW4ibBkFR5cfmbaWFeHNxE6TXPzbWhUWiY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ENXoAfyWkAYrgQs3KmcRX9galLO+J0YwdMy/JQEMJENQxhooV3S39OSZ7qnIQ4Lekgk3ziB77rAtISy1QDReLU0cBS1kDZpdFW+gFaGKPpQYWDE6piAvIJFRgWfM1rhAcI5cyWd6+BsEPn1/p71wEUKsbq67AvhYz1HuQ2y03Xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aAnB2vu9; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B19AF1F000E9;
	Tue, 14 Jul 2026 13:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784037390;
	bh=JDSPBH8kmN8yWl3cpRdFds2lHGQF/dri6Vcet/2h+xk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=aAnB2vu9e/YKC+BpOiBBbngLjlm+aVOzjKEZDie2L9tFORrca4yaTOjWMFjzQilYD
	 /3NiqemGIalkfC0yUSL8wHR7XnvLVZpCODMcvb0FT+EHdwmf8Y9449O69za8DG9m30
	 jYMC9gN1VtabrOqMuLIHxR0GBCSNIHshk6T5/ol46naeqMpVtJV9/OX2Ma/G6rqnL9
	 DgFL+ijhELAHMmjyEr9uPQc9fn27WGHIp4N8IrR0m7MZj70PC2QBQXHiddx/25Swsp
	 Df0fna0kZ5UdLfKuBKDl+PgEOQyYUK3T/XCkXB3QXvHKGukBA+w6iFlvLaJcoQB6YQ
	 Pwgds6ytJD31Q==
Date: Tue, 14 Jul 2026 15:56:20 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Wei Deng <wei.deng@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-pm@vger.kernel.org, Chen-Yu Tsai <wenst@chromium.org>, 
	mengshi.wu@oss.qualcomm.com, quic_chezhou@quicinc.com, cheng.jiang@oss.qualcomm.com, 
	shuai.zhang@oss.qualcomm.com, jinwang.li@oss.qualcomm.com, xiuzhuo.shang@oss.qualcomm.com
Subject: Re: [PATCH 3/3] power: sequencing: pcie-m2: Deassert W_DISABLE2#
 when no UART serdev is created
Message-ID: <bjcmn2euhpik54ytc7falqgcezvy2loimudm6v2ibzxx6autki@rex5cjq2o755>
References: <gatls7n4xes7mrnhgxwsjof7owpocdmjrvuxazedznwa3zeb22@q3mtufc5dzkv>
 <20260713091616.4092086-1-wei.deng@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260713091616.4092086-1-wei.deng@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[mani@kernel.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_RECIPIENTS(0.00)[m:wei.deng@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:brgl@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pci@vger.kernel.org,m:linux-pm@vger.kernel.org,m:wenst@chromium.org,m:mengshi.wu@oss.qualcomm.com,m:quic_chezhou@quicinc.com,m:cheng.jiang@oss.qualcomm.com,m:shuai.zhang@oss.qualcomm.com,m:jinwang.li@oss.qualcomm.com,m:xiuzhuo.shang@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-119052-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,vger.kernel.org:from_smtp,rex5cjq2o755:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 105007556FF

On Mon, Jul 13, 2026 at 02:46:16PM +0530, Wei Deng wrote:
> On Thu, 9 Jul 2026, Dmitry Baryshkov wrote:
> > On Thu, Jul 09, 2026 at 12:59:42PM +0530, Wei Deng wrote:
> > > The pwrseq_m2_pci_ids[] table lists PCIe BT devices that use UART as the
> > > BT transport and need a UART serdev created by the driver. When a PCIe
> > > device under the M.2 connector does not match any entry in this table,
> > > no UART serdev is created.
> > > 
> > > However, the BT subsystem of such a device may still require W_DISABLE2#
> > > to be deasserted to power up. Rather than adding every possible non-UART
> > > BT device ID to the table, add an else branch that deasserts W_DISABLE2#
> > > whenever a PCIe device is detected under the connector but does not match
> > > a UART BT entry. This allows any BT interface on the card (USB or other)
> > > to enumerate without requiring explicit knowledge of its device ID.
> > > 
> > > The primary use case is USB BT variants of combo chips that share the
> > > same PCIe device ID as their UART counterpart (e.g. WCN7851 NCM865 USB,
> > > sub 0x3378, vs NCM865A UART, sub 0x337c): no UART serdev is needed, but
> > > W_DISABLE2# must be deasserted so the USB BT device can enumerate.
> > 
> > Instead of forcibly toggling it, would it be more sensible to tie pwrseq
> > into the USB too? The onboard-usb-dev implements the same idea (of
> > powering up the USB device), but it predates pwrseq.
> > 
> > > Reassert W_DISABLE2# symmetrically when the PCIe device is removed.
> > > 
> > > Validated on Hamoa EVK (IQ-X7181-EVK) with WCN7851 NCM865 USB card
> > > (sub 0x3378): without this change GPIO116 (W_DISABLE2#) stays low and
> > > no BT interface appears; with this change GPIO116 is driven high and the
> > > USB BT device enumerates and comes up via btusb.
> > > 
> > > Signed-off-by: Wei Deng <wei.deng@oss.qualcomm.com>
> > > ---
> > >  drivers/power/sequencing/pwrseq-pcie-m2.c | 33 +++++++++++++++++++++----------
> > >  1 file changed, 23 insertions(+), 10 deletions(-)
> > > 
> > 
> > -- 
> > With best wishes
> > Dmitry
> > 
> 
> Hi Dmitry,
> 
> There is a patch series from Chen-Yu Tsai that appears to implement what
> you suggested:
> 
>   [PATCH v4 00/14] arm64: mediatek: Add M.2 E-key slot on Chromebooks
>   https://lore.kernel.org/all/20260709095726.704448-1-wenst@chromium.org/
> 
> We have been testing this on the Qualcomm Hamoa IoT EVK with both UART BT
> and USB BT M.2 cards.  Is this the direction you had in mind?
> 

IMO, we should move towards Chen's series.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

