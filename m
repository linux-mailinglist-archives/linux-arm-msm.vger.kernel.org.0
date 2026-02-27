Return-Path: <linux-arm-msm+bounces-94452-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CBBwBGifoWl8ugQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94452-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 14:43:04 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A2351B7CEF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 14:43:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 038E930313BA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 13:43:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20556330334;
	Fri, 27 Feb 2026 13:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZRWRg1pU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1EE524A06B;
	Fri, 27 Feb 2026 13:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772199782; cv=none; b=UJXmbLB460cb0Fs7mMtEHVzQ65LFxNui3xLOHF1JptPTQauyugFjWVJPP9BfmfKpPGIQ8ThH/Th5sQ2p72s+8EAEmnU3dGwvH6NZk+wU9JT1CAqrFtxXcv/dHmlXRgNjput1mWsKNVZg3YFL/LDm4E7iD7YneFWbKnd2FVbDblk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772199782; c=relaxed/simple;
	bh=Vsxx0tf/aez0eT/Zy9uhaG0dHCfN3A4iBIahMreaC/c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VmYd6SJ2X0PmHpkCAy1bJW3WXfg0ySn8EDlbuIpheXZwPMfzMPbRiD6or0YtR12neBc1d0blszvA97mDTKZp3N10vQ7HWmgp7oMhcwfBQSlKHZWLfV5xiWnsjn25fFTmFabCCF/+3rd+4VCMgE1/GXWoLvqxRQEbLJu33BW0bVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZRWRg1pU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D95B7C19423;
	Fri, 27 Feb 2026 13:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772199781;
	bh=Vsxx0tf/aez0eT/Zy9uhaG0dHCfN3A4iBIahMreaC/c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZRWRg1pU523wK9B4qH/oqfxalX1dWT1tRMgvmqEhkAiQCC6+aZk47rC2NcYr6UhO7
	 GSaSHNrYzBOKKhEh7mMElKMbIDwYIVryRv2a2FKCzh/P1lwmx+3yg7CYFUgUSSH3nm
	 CS9LpGw+mDUvIYt+G4TAFRUiF8RMm6xHL2yo1kipylcbA2Y1kDSNeJetaEvXB8TCct
	 q//5qO9lU20DNXf1PWD6Wus6q11rsXwDCKxYDHhlxzJD5gag8NF1z+LfJQ4HBDiIYD
	 kXX/RBc8sB2pEWWe6mDQ76zpgQoYJL1j4f+8GDWw60K/7018hfFa9IdueKYAESm5AS
	 554gGzUr67QjA==
Date: Fri, 27 Feb 2026 19:12:57 +0530
From: Vinod Koul <vkoul@kernel.org>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
	Neil Armstrong <neil.armstrong@linaro.org>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net-next 4/8] phy: qcom-sgmii-eth: remove .set_speed()
 implementation
Message-ID: <aaGfYSTaBEQpLG54@vaman>
References: <aZ66OT9scKipRRu2@shell.armlinux.org.uk>
 <E1vvCby-0000000ArL4-3x4U@rmk-PC.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1vvCby-0000000ArL4-3x4U@rmk-PC.armlinux.org.uk>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94452-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vkoul@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,kernel,netdev];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[armlinux.org.uk:email]
X-Rspamd-Queue-Id: 9A2351B7CEF
X-Rspamd-Action: no action

On 25-02-26, 10:59, Russell King (Oracle) wrote:
> Now that the qcom-ethqos driver has migrated to use phy_set_mode_ext()
> rather than phy_set_speed() to configure the SerDes, the support for
> phy_set_speed() is now obsolete. Remove support for this method.
> 
> Using the MAC speed for the SerDes is never correct due to the PCS
> encoding. For SGMII and 2500BASE-X, the PCS uses 8B10B encoding, and
> so:
> 
>   MAC rate * PCS output bits / PCS input bits = SerDes rate
>    1000M   *       10        /       8        = 1250M
>    2500M   *       10        /       8        = 3125M
> 
> Tested-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Acked-by: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod

