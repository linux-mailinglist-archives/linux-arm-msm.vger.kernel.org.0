Return-Path: <linux-arm-msm+bounces-94627-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0BD7ClQYo2mJ9gQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94627-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Feb 2026 17:31:16 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 92EA21C455B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Feb 2026 17:31:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7249C3031AF4
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Feb 2026 16:31:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5EAE1F30A4;
	Sat, 28 Feb 2026 16:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p+YPb6tt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82A211459F6;
	Sat, 28 Feb 2026 16:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772296273; cv=none; b=TY9+ScLW++o2/AbecNmCLaIiNZ1ORrys01OxIPm6WeRAXkeQrU4b8xo0FlqG++g9K3kwRsK//4DkBtQ8ms/48wvOVg+oJxxZE/47MgDxsUJZrTolbAR/+qHJlTF6lxM1ApUxnhvRTODFepbB92eqkAts0hxLJsOQwpDjCyDt7E8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772296273; c=relaxed/simple;
	bh=nT2o6uADu1l9was26u2c5s17fQJ4nx20mIidrP/gZI4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=csCUfVzyIQzELVGtcRZJQrCOZkPGCqJvozfacfZHC9XhVbsD9RdDMrcoG/agGKDZvPNuIk4mXUkQb5nxU6AapMTM9aU21zgsjFe04yOwH6daCMUmdGkoflKy2bSNycxzYqELnJq8+1Lnv05bBiHPjRIIO0ZAPBd2Bw8TOWXtLx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p+YPb6tt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 818F0C116D0;
	Sat, 28 Feb 2026 16:31:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772296273;
	bh=nT2o6uADu1l9was26u2c5s17fQJ4nx20mIidrP/gZI4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=p+YPb6ttQ6QDD9awfMfrizt7DNQtdRhfQkE38+s34ZDF/Tb7oKq1yGHoUU4NHwH1z
	 XTdf58qtRQ9sn2EGxvAzzK2mvu59VEQzYM+vrXrq2bDMMfKFq2AxK3HJavAVWsCqLJ
	 ROhc2MGrzX2RKFbzMj/iH8HnGEywkIKDyIP1pTAWvuEWJWExxGjma3aLSU8T3SGBMf
	 vrA/jjKFj5l6RUobRqeY01LDJt3tKB5lLWTozwgfK71REtg980NbVjcwuK3O86AaoS
	 MR5ybCFQv5gZZphy/a5gk4wYeRe8b6oc/2sHJAdHXorD3PhbsnlCkdH+8Wa3prueqO
	 IXAcB158q1qqQ==
Date: Sat, 28 Feb 2026 08:31:11 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Andrew Lunn <andrew+netdev@lunn.ch>, "David
 S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, netdev@vger.kernel.org, Paolo Abeni
 <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH RESEND2 net-next 0/8] net: stmmac: qcom-ethqos: further
 serdes reorganisation
Message-ID: <20260228083111.5df8550c@kernel.org>
In-Reply-To: <20260227165556.5cf9e844@kernel.org>
References: <aaDSJAc-x2-klvHJ@shell.armlinux.org.uk>
	<aaIysVxy-WxbiJz9@shell.armlinux.org.uk>
	<20260227165556.5cf9e844@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-94627-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuba@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 92EA21C455B
X-Rspamd-Action: no action

On Fri, 27 Feb 2026 16:55:56 -0800 Jakub Kicinski wrote:
> On Sat, 28 Feb 2026 00:11:29 +0000 Russell King (Oracle) wrote:
> > The AI review for patch 7 says:
> > 
> >   This commit fixes a bug but lacks a Fixes: tag. The commit modifies
> >   behavior introduced in 360000820ae2 ("phy: qcom-sgmii-eth: add
> >   .set_mode() and .validate() methods") by making phy_power_on() call
> >   qcom_dwmac_sgmii_phy_calibrate() to restore the previous setup, and by
> >   making qcom_dwmac_sgmii_phy_set_mode() check if the PHY is powered on
> >   before attempting calibration.
> > 
> >   Should this commit include:
> > 
> >   Fixes: 360000820ae2 ("phy: qcom-sgmii-eth: add .set_mode() and .validate() methods")
> > 
> > which is _wrong_, this isn't a bug fix.  
> 
> Yes, that's what I thought but then I saw the other thread..

Trying to apply this now but stmmac parts don't apply on Linus's tree,
and Vinod wants a tag :( What do we do? 

Could you, perhaps, send us a PR with this on top of Linus's tree 
(a resolution of the inevitable conflict with net-next would be helpful
too).

Or do we give up on the tag?

