Return-Path: <linux-arm-msm+bounces-94456-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MK4cGbKgoWnEvAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94456-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 14:48:34 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C60621B7DF4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 14:48:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EEAED3044093
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 13:47:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D32CF3F0754;
	Fri, 27 Feb 2026 13:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QXX7N77x"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B05AE368947;
	Fri, 27 Feb 2026 13:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772200029; cv=none; b=Udj8uLkpf1zg04dvoo2e9+9ArWCFb2Z9DscEa1IYhqhY7Gfif0jCmO2CgFA3wecrYmXS4hH7MCCge8rWocnv9S0UBu243C3wn865Lh8PxDlcE+YawSsP9Ref2p7exKEK/CGiXiK2MMrckEoR+dmX4OVCUgTGiauStA3D8b3b8r0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772200029; c=relaxed/simple;
	bh=qvJg2b+muPo/7mul4VkBUyfNKIzDq1yjTRVGO539OrM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DMb+0B4PYtS61PKL9PxoEKXORMQqKUGen6XJsMlvHZtH36foHE2rty6dKRrQfPjhQEjZyRVgaiHmyfHwaxtY7Z2PQvbs1Z0rHCBs7pPG0HHx2ZGrNFsndfUEmdXlEjtkc3VRmPBpKHbudFa/yxAtnidTqPcBaJyzdaAiwqvrWKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QXX7N77x; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9428C116C6;
	Fri, 27 Feb 2026 13:47:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772200029;
	bh=qvJg2b+muPo/7mul4VkBUyfNKIzDq1yjTRVGO539OrM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QXX7N77xOZthaKb8Gix4TD16r8C4jY4cHgaD9obUSckKNbhx0GgUtfYfrcO0m/JLn
	 MVyCCwL41/4WvXKefmz/KXLNEMZyBPIk5QBqo/Qg2hvhUWcIAb9WmVHqgFU0+i0Gav
	 /5uF9OQi06SEHlNBQIdjow7ZyfWnZiVCw3m41Qssd5AxgF3bu/cQ0IaIXSW5+M6583
	 cSHuZ7l6M2EZJBHQlV3ePocvMcSWVl+w27he89xAKKPTroHtX+CLCAEZRDTIoK2yq2
	 0J4iCQJeuHmxgSnz7BGmhHA6yva7BL2i+Ft7TYN+5m7klx2A3UTLFereCE8l+2UcJB
	 GauonCbjkudkw==
Date: Fri, 27 Feb 2026 19:17:05 +0530
From: Vinod Koul <vkoul@kernel.org>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
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
Subject: Re: [PATCH net-next 0/9] net: stmmac: qcom-ethqos: further serdes
 reorganisation
Message-ID: <aaGgWUpM2A5y11Wh@vaman>
References: <aZ66OT9scKipRRu2@shell.armlinux.org.uk>
 <aZ66uXCwGgH7B_A-@shell.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aZ66uXCwGgH7B_A-@shell.armlinux.org.uk>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94456-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vkoul@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C60621B7DF4
X-Rspamd-Action: no action

On 25-02-26, 09:02, Russell King (Oracle) wrote:
> Note: only 8 patches in this series, not 9 as the subject line says,
> as the set_clk_tx_rate() patch became part of the first series.
> 
> On Wed, Feb 25, 2026 at 09:00:41AM +0000, Russell King (Oracle) wrote:
> > This is part 2 of the qcom-ethqos series, part 1 has now been merged.
> > 
> > This part of the series focuses on the generic PHY driver, but these
> > changes have dependencies on the ethernet driver, hence why
> > it will need to go via net-next. Furthermore, subsequent changes
> > depend on these patches.

This lgtm, can we get signed tag so that we can pull this into phy tree
as well

Thanks

-- 
~Vinod

