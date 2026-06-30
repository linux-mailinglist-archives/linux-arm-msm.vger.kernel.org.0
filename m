Return-Path: <linux-arm-msm+bounces-115311-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CXC4JSVxQ2rjYQoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115311-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 09:32:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2620E6E12EB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 09:32:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="Cpu4G/H2";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115311-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115311-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3CA6B3026228
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 07:30:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EFAC35A385;
	Tue, 30 Jun 2026 07:30:37 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38F5A2E7387;
	Tue, 30 Jun 2026 07:30:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782804637; cv=none; b=rTbEjuO85o7FovyUVZovI/FrB3vyNVEktPhUhBPGYE5nQ5ukb9Qi4fvKD2VChUW5QBnUyDcOeHwt+6mpHlEUJuqOykfHcg/cFK+R9Qx4/8FrgBH/9jZK5DE8yyrxNUJH+/rf1t2X+sL8nJDgGnFKdQVuGW8Kmt1J8SrUs9QAyA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782804637; c=relaxed/simple;
	bh=1i5H97cpdrXfDqHxFloV26EDFW3NgkjN2lLHz2mCI/A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vDRYBxqoS+RomJcjLx6JEJ3XSGAbxqSDapRKKSRh/BBa7BkbNK9u5xrH3uPNG9gOUeH+hRPzgLguaQMfDCUTIII6KUUuR6aWt/8LIoivlDMbrAhE4xnbQ6Eg/6tr2Oe80QYycm1ZEhjToWQ2YM/hI8ky1xYK0snu3Pf4I2f7Aiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cpu4G/H2; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB4FE1F000E9;
	Tue, 30 Jun 2026 07:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782804635;
	bh=RSzgSwaz8xtCGQAnlakPMmyg5CmRJ4QZ2MQI2tc6d2w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Cpu4G/H26AcVeVXFJxpHzSyl0lzKZzwWBQ1IJN5P7IjOXBdCFO/Gc+KEFOa2+LuJR
	 vAEfAH2EselAro7jmyYW3nF2tebyXDLjkdn18+GtWE+9+T9/MfUIEyVknMADUvxfq+
	 OBUli5zGon8DPBjZmBfY/iSt9UamKRJIpF0O3f+rxIgcGPIwp5rMRZrugCqmooGJxX
	 SOvWWDDiu8+pf4TXZ6bh238xjw5jIy5pFgAVfUn5RXUHERJPdsnlJmXflGm8AWlqPv
	 sHY5GkMJ6FmvYYspZ3c2kcQINYcVMV3Z3jk2ZXOw9m+TYlUZHobM98TBmduCBiwWcB
	 1BK3l6/GtQdHA==
Date: Tue, 30 Jun 2026 09:30:26 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Steev Klimaszewski <threeway@gmail.com>, bhelgaas@google.com, 
	bjorn.andersson@oss.qualcomm.com, jingoohan1@gmail.com, jonathanh@nvidia.com, 
	kwilczynski@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, 
	lpieralisi@kernel.org, robh@kernel.org, will@kernel.org
Subject: Re: [PATCH v5 5/5] PCI: qcom: Add D3cold support
Message-ID: <4ombnzmepb5eswlilmkxd7fhic64nveiyznkltod6mha3hyk37@c5lutu2cwhia>
References: <20260429-d3cold-v5-5-89e9735b9df6@oss.qualcomm.com>
 <20260629211614.6942-1-threeway@gmail.com>
 <bc3cb302-5463-4e43-9b92-d141cafa2b8c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bc3cb302-5463-4e43-9b92-d141cafa2b8c@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:krishna.chundru@oss.qualcomm.com,m:threeway@gmail.com,m:bhelgaas@google.com,m:bjorn.andersson@oss.qualcomm.com,m:jingoohan1@gmail.com,m:jonathanh@nvidia.com,m:kwilczynski@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pci@vger.kernel.org,m:lpieralisi@kernel.org,m:robh@kernel.org,m:will@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER(0.00)[mani@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-115311-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,google.com,oss.qualcomm.com,nvidia.com,kernel.org,lists.infradead.org,vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,c5lutu2cwhia:mid,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2620E6E12EB

On Tue, Jun 30, 2026 at 12:01:15PM +0530, Krishna Chaitanya Chundru wrote:

[...]

Please trim the message while you reply.

> HI steev,
> 
> Can you also share dmesg logs also with console suspend disabled mainly
> suspend resume logs, in both the cases.
> 

Do note that these are production devices, so serial console won't be available.
Once the device enters suspend and crashes, there is no way we can get the dmesg
log.

We should try to repro the crash on an internal Makena CRD device that has
serial console access.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

