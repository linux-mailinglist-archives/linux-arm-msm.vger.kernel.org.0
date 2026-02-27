Return-Path: <linux-arm-msm+bounces-94483-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aMsaJWS+oWnPwAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94483-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 16:55:16 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 490D61BA5FE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 16:55:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6C35C30FBECF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 15:49:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A98804418C4;
	Fri, 27 Feb 2026 15:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iWw7dD8w"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DB2144103B
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 15:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772207342; cv=none; b=AoVgXggZe7mZAe0Qy3cOSTMC08/GAa1nnsFo7wz4qdpcG8kvosV4WxzUeOUuwBTRoWlbSyPmIktLS8vXoP4cHsWgHberBC2VCWscKqQzW/K1cR/dDWqvqneyisGdCFE0+7eAghV7Sb3Mx+sXDjR9fn7ZIabs4KGbJ3Xml7qAMPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772207342; c=relaxed/simple;
	bh=q5cRlSg0zS8q58mfnO/NBWuiexbMB10gJHn1CM3GOA8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZEyuOpj6suH8Qh5VqEqUobUq1JUEzSnutTeYkQLEZ03hinJdvR/oZONTXCSmbjRCrpXHPfGkU8Of8DoiI4tCtZOUV22TsR1ttUcLL1Te0lxBW2GnbcKMjK299Sr4cKnBX6Su9z5u62KWNAXVwT0u7IeCdDQa34afsw0vBlyrshw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iWw7dD8w; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-4398e347a08so89752f8f.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 07:48:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772207334; x=1772812134; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UNM6LkJDaly96+frvDYVu+WZiJv/Y/1sZYEDKoTKzhk=;
        b=iWw7dD8w2XsiYjJCcNDDrwOL7BO87AOsgmw/vqjw7LNOElIGXYrCShCnA7ZMemUnMQ
         3Urno44zLfmF3BSkgbPNecFxED1ZOqRK7+qpwksMviAEaQltuYU9iQz+QkR6I9yuqHX0
         yLguOayo026SqZraT2X76DfRTTyHGpwtq0/2PNawk3S1e7lSQ5nrg9E2J4zynILqwAK0
         e2evHmn5EYumrG4GyVDO9s6WuDUbsvzA3vmYH79NkUh75psc3gxOZrfqSEq2aW454osh
         4m0qlumH6izeS/wEtvin6XMNb5VdS9lD6jKdaziM0h6lEjjZkeEJAo8S1kHfz+0Nbfb4
         bxiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772207334; x=1772812134;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UNM6LkJDaly96+frvDYVu+WZiJv/Y/1sZYEDKoTKzhk=;
        b=C3TByM5p4jyoTujg+OllT2KdeNoAoyGMbjbzT6cCV1vVLY+16y5/vjC28IvkHPD1mo
         nATzeTN1oMK/OIdbJl569SCszDlOBxzDVnxzXCw1d7MFH5ycWN56vi66eGxzZtOHomGO
         tIeFTnTfgqnkDmcTs4y24szQBIvVtFSvMPVeVDvB52HH23XPIr3uE/xA9t+FXN/n9TRZ
         WjQ9paLC3WYwg2IRoeKyiK9AhRHiujtQQAAkJg3Xqiq/QQZT+PxPQ+nxk/q8krpWHfM2
         nXWCI6nRUAwC5rNss3RJp0WIIkRfcJvJ2UcSor6Q9naDxtKmmL4fiVNGQNjWFxFlO05M
         678A==
X-Forwarded-Encrypted: i=1; AJvYcCWE44H5dhNxwhnuPLi+rbak5H+Jj+wxW8yBilvGjiehcAXb9dc9GE1UJ4TbqNmamYmzKcDL+l0gms2D6CbS@vger.kernel.org
X-Gm-Message-State: AOJu0YypxeCWz++xtkP+zgeXPuRrYUVt8S6zAMZfneRge8KKcDvk/ak9
	65mTlVfLLSUzjEQq+WqV/AisI8ZLx9bgu1enhhtc8DOt93rv6Xt9MTl/
X-Gm-Gg: ATEYQzz/n8/N8f7XZK4ccvu55Tg68zVUWQuKMZU2AzVTg+5IJ7THz41xpgOZpwImmft
	OP6JYEVAncfTEQFrp6nBk6Qg02Ban2junK2aO4kWzOATWWNwjJAOAcS2cQK4BoSTf1+Z6HXshv8
	4wbaxBcyfwOBdKn7bujINU5botxYfxvPAqaN6vR4pq59gMrbfhpyVU9hOrV3t2df5PQd48D8NIF
	MYvOWSedT4frYn4EwO1cbG7Ddkb/MJWvXX94s7xgSlPHLAZ0q5+hkxb9Rz/V3T/a2qq63oZBVbM
	DwIJBJl6fatOOZMr6JhcdrPg+mKFirCzi6QaIEqM9uO1j3a0m8gOgveoG5laZsr8Ts6zfiUcZbY
	+2b36BeFclQ0R3hMab2h+xtRRc/8XyxO5+Yw/7et/0fFzKTYo3doyLZGpLcFeWtgvCaH+R8wOGP
	CLSl5FbVq5HmqnNQ==
X-Received: by 2002:a5d:5c89:0:b0:435:f96f:3517 with SMTP id ffacd0b85a97d-4399de241bamr3355441f8f.3.1772207334184;
        Fri, 27 Feb 2026 07:48:54 -0800 (PST)
Received: from skbuf ([2a02:2f04:d608:3a00:ac95:d4c:390e:fb0a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4399c76c49fsm8168270f8f.38.2026.02.27.07.48.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 07:48:53 -0800 (PST)
Date: Fri, 27 Feb 2026 17:48:50 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>, Eric Dumazet <edumazet@google.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"Paolo Abeni <pabeni@redhat.com>, David S. Miller" <davem@davemloft.net>,
	Andrew Lunn <andrew@lunn.ch>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
	Neil Armstrong <neil.armstrong@linaro.org>, netdev@vger.kernel.org,
	Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH RESEND2 net-next 0/8] net: stmmac: qcom-ethqos: further
 serdes reorganisation
Message-ID: <20260227154850.hcz4ftt3aah7robh@skbuf>
References: <aaDSJAc-x2-klvHJ@shell.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aaDSJAc-x2-klvHJ@shell.armlinux.org.uk>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94483-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
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
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[armlinux.org.uk:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 490D61BA5FE
X-Rspamd-Action: no action

On Thu, Feb 26, 2026 at 11:07:16PM +0000, Russell King (Oracle) wrote:
> This is part 2 of the qcom-ethqos series, part 1 has now been merged.
> 
> This part of the series focuses on the generic PHY driver, but these
> changes have dependencies on the ethernet driver, hence why
> it will need to go via net-next. Furthermore, subsequent changes
> depend on these patches.
> 
> The underlying ideas here are:
> 
> - get rid of the driver using phy_set_speed() with SPEED_1000 and
>   SPEED_2500 which makes no sense for an ethernet SerDes due to the
>   PCS 8B10B data encoding, which inflates the data rate at the SerDes
>   compared to the MAC. This is replaced with phy_set_mode_ext().
> - allow phy_power_on() / phy_set_mode*() to be called in any order.
> 
> Mohd has tested this series, but it would be great to get acks/reviews
> from the generic PHY maintainers.
> 
>  .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 31 +++--------
>  drivers/phy/qualcomm/phy-qcom-sgmii-eth.c          | 62 +++++++++++++++++-----
>  2 files changed, 57 insertions(+), 36 deletions(-)
> 
> -- 
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
> 

Reiterating Vinod's request to netdev maintainers from here, just
because it's easy to get lost in the multiple patch versions:
https://lore.kernel.org/netdev/aaGgWUpM2A5y11Wh@vaman/

Can we please get a tag to pull into linux-phy when this gets merged
in net-next? I'm also working on a patch set for phy-next which will
conflict with this series.

