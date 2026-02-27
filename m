Return-Path: <linux-arm-msm+bounces-94475-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uLzkHmG6oWlhwAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94475-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 16:38:09 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 8942A1B9F2B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 16:38:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A7002303265F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 15:31:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B00413242B8;
	Fri, 27 Feb 2026 15:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="naHGGDHp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 490BD3233E8
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 15:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772206281; cv=none; b=Ziq7wsn3Ul3mxM8G1UHtEo/4yUqkWAo1cjZbLj+2UTkqZzaQcI5HwTtnfbVI0taDjOKD6BQX7Omb7A/emj5TJAvOx79+pqaran0qG9D15YsaYUqKyuHVL85E47WawZVcFL9aTuJEKg4daetxD1lEBhE7HbmWiKicWPNKnDyPSKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772206281; c=relaxed/simple;
	bh=TNIuemAFwWjgXBX8kMH62ik4iFwTOdB85BxIp9iTq4w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E40vo7HuFmwxmNBhWU+qKbBo/t/kuv2A0E+ycFEzQC6Q2FHLDlmuPDR/YRy4Vhash9HS516SriDbzSe70Xk3M+DE/K5KSfzfGakNeO+rnC1qCFso9dweZELhXQRndKUNxI0/y5/yjOJ1zBQxnyJ8kJguM/2DinqKObaOFdBnI/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=naHGGDHp; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-43636c9fd7eso130747f8f.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 07:31:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772206279; x=1772811079; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=P2kGl/nxca3gMElmPgWClDsdWOdb0++gHklmfXh1TOU=;
        b=naHGGDHpOiI+5/JqLdM5XQ0BiJEWf2s9SqwT9KZTEhKU9CfMQnm8azB8L7jFqu9DKx
         IcEJtGVh4rT6EX8PBYmdgd/+89OHU8LQuI3vMGDShJSueSckzTCPboaGMvzjGhKcs2tk
         M0MPIBgbor8+ubWe9M4XC7vsBuv8cPuLfxGyTLgJHrJRU/oCeHqdz5U6DpaJj03jlYRG
         eKCG92ffwWpqBftt4ORQD8NZz65nH/L4g9Y6MmZnk8jHiJAFYPzGbWtzxHOhDQOGoMqM
         lEZDUGsW86yxK+2lwOf108GbruKktt050RGHNgwb96EMzrw4z2rRDt9gS+NlIn0QEWZc
         bfUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772206279; x=1772811079;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P2kGl/nxca3gMElmPgWClDsdWOdb0++gHklmfXh1TOU=;
        b=sPvPFau1wTbNSta7UZXMaH8+Nkv6nmugsPS1jia5tk679lk9+NNSOkln0a/VWqGQHv
         93L7Ds9bszFdubrKS8++D5FtIH+V6P6sP+aQTdaP4CG3s65WFMFOcmZUOscs4hpQUVln
         JTWxg9ZHGO3W6LNaM42IhLFIAxoYpOGkkU2joaHJFSMmnusHlNTRqSnGsX1n5zbHMpx6
         vZiWlXglmBgUpT/8+iLAfSnvx4T+mLBhY1nuDDcL2fi8L2K3Rv6xHiTbQDMmM6NLQMLt
         2KXsPtBagQ7TEQasv1nNFWd0l7kFKw5uj0BJosPc9jxVnqcVMTMfD/J8mENrUqRHsnRs
         WBqQ==
X-Forwarded-Encrypted: i=1; AJvYcCV8CQ3eEMwrhTxeY0sMwCZtmUKkJ2t5+G9peIhTHiXIxaLQ22SRp9/8Fb9fCi6TRcb2+LZVS60Qwt+OT2pC@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2w/XC4/0ENYDHMShFMsE3AgYdXnj81YsYyQPNaubglfKm8b2k
	GH7zlO7zzcmWvMdbA0jz1U3CXRTd+JJSfRv0us7U8E6I/XYRrNgf2Mjx
X-Gm-Gg: ATEYQzwekFiqVBHXDnXntmzdPvnGI1osWRs6JE5Isca4T1Pxl8GWravQMy0Mb3ypR+v
	iNQCuMZE6ZBTdRDqp55vfl7Yf4mVeRGZ7vXZzJ14dWX7hSycRm0ETol6ZkeAN01jf68YLf8IRR1
	p558wzJicWk+4rDrawXBE/iqqjdvtRPgyN7rTtbsFJSasDWA9xILHWOrVZRTt1qKcurAEGA3E3+
	cmSJVhUm6DdBqjDFFocnljtoKJFaceaMZQQWtBbr9ZbgSENMgkiBZq6l4j8U9SO46GPxxhbbTJZ
	uLxf4ZnzjsGjIyKe6UQu+ZhJ+0NFEnntfgOv6yrfl48RyXtPxozE1T0o9Zm5NmG1qFFDvmofMWe
	HrdNB6gthcgtc6D1A9VmMLGKABqDTUmPDsg2uVfGuWi8/T2CbcglsKhQeYcLsgCCZOiHIkT90Ja
	YbB8V7S+h79eGQHA==
X-Received: by 2002:a05:600c:5249:b0:477:a478:3f94 with SMTP id 5b1f17b1804b1-483c9c29b66mr31520385e9.5.1772206278424;
        Fri, 27 Feb 2026 07:31:18 -0800 (PST)
Received: from skbuf ([2a02:2f04:d608:3a00:ac95:d4c:390e:fb0a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd70e692sm230573145e9.7.2026.02.27.07.31.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 07:31:17 -0800 (PST)
Date: Fri, 27 Feb 2026 17:31:15 +0200
From: Vladimir Oltean <olteanv@gmail.com>
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
	Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH RESEND2 net-next 8/8] net: stmmac: qcom-ethqos: remove
 phy_set_mode_ext() after phy_power_on()
Message-ID: <20260227153115.rk7ntq2p4fbjcqdv@skbuf>
References: <aaDSJAc-x2-klvHJ@shell.armlinux.org.uk>
 <E1vvkUX-0000000AuPo-3mEw@rmk-PC.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1vvkUX-0000000AuPo-3mEw@rmk-PC.armlinux.org.uk>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94475-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[olteanv@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,kernel,netdev];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,armlinux.org.uk:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: 8942A1B9F2B
X-Rspamd-Action: no action

On Thu, Feb 26, 2026 at 11:09:57PM +0000, Russell King (Oracle) wrote:
> The call to phy_set_mode_ext() after phy_power_on() was a work-around
> for the qcom-sgmii-eth SerDes driver that only re-enabled its clocks on
> phy_power_on() but did not configure the PHY. Now that the SerDes driver
> fully configures the SerDes at phy_power_on(), there is no need to call
> phy_set_mode_ext() immediately afterwards.
> 
> This also means we no longer need to record the previous operating mode
> of the driver - this is up to the SerDes driver. In any case, the only
> thing that we care about is the SerDes provides the necessary clocks to
> the stmmac core to allow it to reset at this point. The actual mode is
> irrelevant at this point as the correct mode will be configured in
> ethqos_mac_finish_serdes() just before the network device is brought
> online.
> 
> Reviewed-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
> Tested-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---

Reviewed-by: Vladimir Oltean <vladimir.oltean@nxp.com>

