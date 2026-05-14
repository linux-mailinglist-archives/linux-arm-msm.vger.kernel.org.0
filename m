Return-Path: <linux-arm-msm+bounces-107534-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SOYZA1JwBWoTXAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107534-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 08:48:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6207253E7EB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 08:48:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 60C79301B735
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 06:46:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B15853A8755;
	Thu, 14 May 2026 06:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zb5j9ke/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8909534DB52;
	Thu, 14 May 2026 06:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778741185; cv=none; b=tE/Ora7uhlpGTo6+2UnGoIpyL66f5/9pw2h6g5QoRZaB7RRtAZXs3c7uy3xkC/IXYm9gw5W4C/vlBAfAE0iclZUdjrFbNpqS6iKMSAtl1VcyOYyaP6Snv6pogilRHdNYVYTGWrNWYir6IXP3GjfhNIXrPk1WQAeeB2I/h1warSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778741185; c=relaxed/simple;
	bh=+pSCK8MFVryMnnZmvC/b8KJiZO6ZDcD27J+P7yy8oQo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oB+2yuvkY6AYPeFdovG+FGZs+AU0IFPrpcY1pazWyKtbCVgjcMjth7M6E4E3SxJpJXcBsn9984sJE/soreQGB8bFnzS8OknBDjS84Jr67E0riAfQp41jmIFfDLsTWpUu6lM6WcCRFhEAtnK20s+WWm3A2csvUp+OV+MS7qNooY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zb5j9ke/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9DD6C2BCB7;
	Thu, 14 May 2026 06:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778741185;
	bh=+pSCK8MFVryMnnZmvC/b8KJiZO6ZDcD27J+P7yy8oQo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Zb5j9ke/Swv4KLXs6VVV3pffw6yVgoMpoFff7OVWjLED1Yvvu6NJjk/kVryQYQPcd
	 2otgj6unGNeZBSuNf5uw6f53aWOlREpqnAugfCaqquHs+TxZeDfYrSWn6/ZTUS/2xt
	 XPxAtAXdBW5FlPVnvlHwxNUacpRY3gbzolXV5fVuJ51UOns0krc7qCy4hLEsx8yWnl
	 ssUl4CL4hpK6HBiRTf1iamKq4o0ycsngtcmkSYv4ZPAgIrB7HPkByWKl/DIegE/jiJ
	 T/m/oKN814fMqKdi4H/FiYlNiT7A7FTJMZ1JrOCJT4gtdcNl9JFo/4q5bL+Ub9psGE
	 8QO9Bi+ciEb0g==
Date: Thu, 14 May 2026 12:16:17 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, 
	bjorn.andersson@oss.qualcomm.com, konradybcio@kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org, wenst@chromium.org, arnd@arndb.de, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v2] arm64: defconfig: Enable PCI M.2 power sequencing
 driver
Message-ID: <q45pxcrka3k7w7zqeyh26mow3yf2ukqogscm5b33ehumbyvuuz@wjrawz6xthjy>
References: <20260501164440.11788-1-manivannan.sadhasivam@oss.qualcomm.com>
 <d04d7187-54ba-4ba7-b7d3-131fd4f3a98f@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d04d7187-54ba-4ba7-b7d3-131fd4f3a98f@kernel.org>
X-Rspamd-Queue-Id: 6207253E7EB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107534-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,linux.dev:email]
X-Rspamd-Action: no action

On Wed, May 13, 2026 at 09:41:42PM +0200, Krzysztof Kozlowski wrote:
> On 01/05/2026 18:44, Manivannan Sadhasivam wrote:
> > POWER_SEQUENCING_PCIE_M2 driver handles power supply to the PCIe M.2
> > connectors and is required on wide variety of ARM64 platforms such as
> > Qcom Snapdragon X Elite laptops and Mediatek Dojo Chromebooks.
> > 
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> > ---
> > 
> > Changes in v2:
> > 
> > * Dropped PCI_PWRCTRL_GENERIC change since it was already applied
> > * Reworded commit message to include ARM64 platforms making use of this driver
> > * Added R-b tag
> > 
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> CC list suggests this will go via Bjorn's tree, but I think it did not
> happen. Can you double check no one picked it up and send it to the
> soc@lists.linux.dev in such case?
> 

Looks like Bjorn didn't pick it up. I'll send it to soc list.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

