Return-Path: <linux-arm-msm+bounces-92179-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WDjYMsMXiWkd2gQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92179-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 00:09:55 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 33B7710A8F5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 00:09:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6B15130086F1
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Feb 2026 23:09:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 622E733B6D3;
	Sun,  8 Feb 2026 23:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T353r0Tb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B1BF1CBEB9;
	Sun,  8 Feb 2026 23:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770592191; cv=none; b=NH5Gejd7dpLMs40rMgwyjCcpWFydqbtKjK4os5tbSngIQFZ0QyQf/WShlav9NdzGJl9YobyDWFx4B5QfAWhwrH0HORP2HBN0XHx4l3PO4LSijppnC6GILAFsS9F6DLICwIPmYoNz5j2Wl27M+tRgte5tjMJzRrX9Ms+k1gJiX3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770592191; c=relaxed/simple;
	bh=j1lymzKs6N3SZ3jLvBp91X5W04tWsUuqeM3MyN9LSw4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SmiuV9IwOZiqInU2RecfEhowLYmxBALW6e/AaTWAUFK+bOBY3THo7+tT9qd+jeC4TX18sZ800RFWYrN/KGUuHKMyKZleV0Kj2y+/9Q8zIB+VrL2nyBLMnnkkdbjkae/kdYoGLMP49xHuY57IFOAvfvw5dri5joB3zF99nW1vb8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T353r0Tb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EF53C4CEF7;
	Sun,  8 Feb 2026 23:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770592190;
	bh=j1lymzKs6N3SZ3jLvBp91X5W04tWsUuqeM3MyN9LSw4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T353r0Tbt+H5laEunDirGDTsbhUttXAr5xFiuzAFq1lchP6YIVm/pqDxx4nLWxg0s
	 QCFsEUqfeSUnuAUNzIom8bVxuGPTTbryOETNU0LqS+Nkq2bbmHUPKZwSa6qSxnyiEE
	 SUgn9EgSIwIiZKgHdwY+7zDQvv/8uVrVDWfHrn8Q0t0qMRSZGJSrPi/B1Kg8L6ihAr
	 qG2wp/dADfbbh6q9g+UaUp7gMHjJq6Ky7fqBPqvOKZXwy5ZDMcj86n9B0LY4ytASYF
	 fuSEHQdBbYr7IOB27iB2pKcg33XhywfgooqYwAghzuvTY+mfycuBPCNG6CvYcVfbXW
	 JKAagZexhXURA==
Date: Sun, 8 Feb 2026 17:09:48 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Cc: Saravana Kannan <saravanak@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, robh@kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, qiang.yu@oss.qualcomm.com
Subject: Re: [PATCH] of: property: Create devlink between PCI Host bridge and
 Root Port suppliers
Message-ID: <re6ed3n5scouxoj66ysqitkm5zmloj5t5pwlvdkkvgcj4pshcs@d4ibi32x4qcs>
References: <20260205070640.10653-1-manivannan.sadhasivam@oss.qualcomm.com>
 <bfba9d62-2741-47b8-8325-2d932c20c9e7@oss.qualcomm.com>
 <lnzmgsdjckbf6u5hxfqm4kzlmcg2cqvszcg7otmkqxaj3yzdfq@vu232xx5kts3>
 <CACRMN=eu7n+wCD3vRY-7GSKpqf3VG=oyDoQdeauiEHGK-q9pPg@mail.gmail.com>
 <apfr6syofeffm4ffv67viacsi4bvc5hd7ozk3ddcdcl7kisjee@qsbusru4uns2>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <apfr6syofeffm4ffv67viacsi4bvc5hd7ozk3ddcdcl7kisjee@qsbusru4uns2>
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
	TAGGED_FROM(0.00)[bounces-92179-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 33B7710A8F5
X-Rspamd-Action: no action

On Sun, Feb 08, 2026 at 08:51:33PM +0530, Manivannan Sadhasivam wrote:
> On Sat, Feb 07, 2026 at 05:27:21PM -0800, Saravana Kannan wrote:
> > On Thu, Feb 5, 2026 at 1:01 AM Manivannan Sadhasivam
> > <manivannan.sadhasivam@oss.qualcomm.com> wrote:
> > >
> > > On Thu, Feb 05, 2026 at 09:50:20AM +0100, Konrad Dybcio wrote:
> > > > On 2/5/26 8:06 AM, Manivannan Sadhasivam wrote:
[..]
> > 3. Just create device links if you know you have a weird case of
> > dependency that fw_devlink doesn't pick up? It's generally more
> > painful to get fw_devlink to ignore what it thinks is a dependency,
> > but thankfully that's not the case here.
> > 
> 
> I would love to solve it in the PCI layer itself if there is a way. But I don't
> know how. The PCI framework becomes operational only when the controller driver
> probes and registers with the framework. But we need to create devlink even
> before the controller driver probes.
> 

The devlinks are just an optimization, so worst case you should be able
to create the link on the first probe attempt to avoid further probe
deferrals until the dependencies are in place?

Just like we could have done for all those other provider types that
of_link_property() handles.

> We do have the PCI class which gets registered during postcore_initcall(), FYI.
> 
> > Please continue cc'ing me in future patches trying to address this.
> > I'm happy to give guidance if you get stuck.
> > 
> 
> Sure, thanks for the review. Even I'm not super happy with plumbing PCI
> specific code in the core DT layer, but I'm not sure of doing it elsewhere. Any
> suggestions from you would be greatly appreciated!
> 

I don't understand your concern, Saravana, of_link_property() is all
about tangling subsystem-specific details into the of-core.

Regards,
Bjorn

> - Mani
> 
> -- 
> மணிவண்ணன் சதாசிவம்

