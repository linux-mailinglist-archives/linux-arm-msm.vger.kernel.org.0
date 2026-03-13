Return-Path: <linux-arm-msm+bounces-97481-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aLsYCioHtGlvfwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97481-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 13:46:34 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 77398283340
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 13:46:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 25512307A084
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 12:45:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 173A037C93B;
	Fri, 13 Mar 2026 12:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="SCYzGSRp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCBC83750D3;
	Fri, 13 Mar 2026 12:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773405956; cv=none; b=c6f7tmzwj13uVL0V+9oznSJhbro5yYQHM9GK1XrFlizq0hH7XpmJGAQq2OUQQmYsg1N3waxXjQMh4WE4ZyNmVztx7CfmBK/HpSjQSB9BLbzLlk+ePVg0PMZa06+PEcA6rvSoHxL1TcIp+cqhoKfVfoiTs/nXi47b7uL2PzCT98U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773405956; c=relaxed/simple;
	bh=fBuS9ncfG7ZvEfsT5w8lBatDvpOW603wmlOUfj5Sr+A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lqEBaKQp8Z29jyEqsf4edMrprUmqIzJY3upMWPp+2/rl2obErOaTCow8Vlibmzx8upQyERlXJm5TymQRvCck0VvcocGB6aok4KiNfZYAc7K3T6POfXnXSRmibEbHBcoD2OeNGUd8D2Q5kG6wwzMfVGw3GzZmBvtj/yXCBro5mQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=SCYzGSRp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0015C19421;
	Fri, 13 Mar 2026 12:45:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773405955;
	bh=fBuS9ncfG7ZvEfsT5w8lBatDvpOW603wmlOUfj5Sr+A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SCYzGSRpIg/yBSR8wq2vAcrV+WkgbDh8OwCbc0FswlSxwLBV6tUZeX8qeApf4cJbj
	 nE79oAGg1TcGyGKbTmW+Mefid/z4b+yvlj+HQfDFkCjW2aw3aj6s7HonU8AKXe+zZT
	 y0g4wR7UN682mIC0cV5GiVNaY4H4V5JMqzHu99MQ=
Date: Fri, 13 Mar 2026 13:45:50 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Elson Serrao <elson.serrao@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC v3 02/10] usb: misc: qcom_eud: add sysfs attribute
 for port selection
Message-ID: <2026031327-sugar-disfigure-8034@gregkh>
References: <20260309203337.803986-1-elson.serrao@oss.qualcomm.com>
 <20260309203337.803986-3-elson.serrao@oss.qualcomm.com>
 <2026031101-cornstalk-partner-a30e@gregkh>
 <6fe7a63c-a1b3-430b-a128-0e38754d6393@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6fe7a63c-a1b3-430b-a128-0e38754d6393@oss.qualcomm.com>
X-Spamd-Result: default: False [2.34 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97481-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,linuxfoundation.org:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 77398283340
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 13, 2026 at 01:10:10PM +0100, Konrad Dybcio wrote:
> On 3/11/26 2:16 PM, Greg Kroah-Hartman wrote:
> > On Mon, Mar 09, 2026 at 01:33:29PM -0700, Elson Serrao wrote:
> >> EUD can be mapped to either the primary USB port or the secondary USB port
> >> depending on the value of the EUD_PORT_SEL register. Add a 'port' sysfs
> >> attribute to allow userspace to select which port EUD should operate on
> >> and update the ABI documentation. This is needed for systems with dual
> >> USB ports where EUD needs to be accessible on either port depending on the
> >> system configuration and use case.
> >>
> >> Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
> >> ---
> >>  Documentation/ABI/testing/sysfs-driver-eud | 16 ++++++++
> >>  drivers/usb/misc/qcom_eud.c                | 43 ++++++++++++++++++++++
> >>  2 files changed, 59 insertions(+)
> >>
> >> diff --git a/Documentation/ABI/testing/sysfs-driver-eud b/Documentation/ABI/testing/sysfs-driver-eud
> >> index 2bab0db2d2f0..67223f73ee60 100644
> >> --- a/Documentation/ABI/testing/sysfs-driver-eud
> >> +++ b/Documentation/ABI/testing/sysfs-driver-eud
> >> @@ -7,3 +7,19 @@ Description:
> >>  		EUD based on a 1 or a 0 value. By enabling EUD,
> >>  		the user is able to activate the mini-usb hub of
> >>  		EUD for debug and trace capabilities.
> >> +
> >> +What:		/sys/bus/platform/drivers/qcom_eud/.../port
> >> +Date:		January 2026
> >> +Contact:	Elson Serrao <elson.serrao@oss.qualcomm.com>
> >> +Description:
> >> +		Selects which USB port the Embedded USB Debugger (EUD)
> >> +		is mapped to on platforms providing multiple High-Speed
> >> +		USB ports.
> >> +
> >> +		Valid values:
> >> +		  0 - Primary USB port
> >> +		  1 - Secondary USB port
> > 
> > Why not use "primary" and "secondary" as values instead?  That makes
> > this much simpler to understand.
> 
> It's not inconceivable that future iterations of this hardware will let
> one mux between more than two USB PHYs/ports (there are already a multitude
> of SoCs where we have 4 or more USB controllers and >= that ports)

Great, and how will that be defined?  As a number?  Name?  Something
else?

thanks,

greg k-h

