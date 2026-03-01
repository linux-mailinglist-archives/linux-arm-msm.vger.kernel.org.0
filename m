Return-Path: <linux-arm-msm+bounces-94652-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gD+POA6Fo2lWFwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94652-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 01 Mar 2026 01:15:10 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8339D1C9CD2
	for <lists+linux-arm-msm@lfdr.de>; Sun, 01 Mar 2026 01:15:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1C30B3023361
	for <lists+linux-arm-msm@lfdr.de>; Sun,  1 Mar 2026 00:15:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84CAC5733E;
	Sun,  1 Mar 2026 00:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bQe5O76S"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92DAA27470
	for <linux-arm-msm@vger.kernel.org>; Sun,  1 Mar 2026 00:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772324101; cv=none; b=ZPv8W+yJRyrqM7z2hLJO3COrCizRON+xGfv3YErN/z0alUnO8cC/kJAwlY6eMQvfyowYzKWuTc7ZMuK3m18gTSXzDIGt86AlRGVUtCNFQFLhK3sRPui7frAeErreiUy/ugL16qIVtf0RMv/skKRJdlgdth8GbKtlqgF7VJ1CJkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772324101; c=relaxed/simple;
	bh=OaUtj2W/CaIahiBMFLAhrH1ZSMd7s39qEsfPdT7abx0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Oa2s1tJJculoSUdxK18CI3QDDSnHj7dZpx9uZ8Y0E/nIpCI7sZ2K+f5jHuWAj8HiTk0+/BwjzlotEX5j/tNBn9XcgqIf2jY0Dv6OFXGhUiu2+2S6pPsGVbyXDoUap7DePOUrJGKxs/CeKIn5iiZphCIhfAXzLiipyAnHju2bT/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bQe5O76S; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-439ab83f773so87716f8f.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 28 Feb 2026 16:14:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772324098; x=1772928898; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zYnsoG7qDnrk7Z/gOuxzAyQoovXIM2RIYjUlYbsloBk=;
        b=bQe5O76SIAWjoC8Vvu67qJNZDvU6+sINjXetrecVLMB4qzouflNtiS3CXc8ruNKBil
         N9hLSLcTJ83b5mxapfMwHqhEX9UlaNj7FXdhb9vlFk4mnj1ZV5QOuE62/a5jisex08tT
         c0KTEDmdLWyLnjD/XjbJADAtU1HHkIK6DEKpie5febXSOGEXl966HZSQQT+//pDsl7jk
         oyDtkySnknTKp5l42Qw50xnKJGz0vFVeGXPoKnwtHD8EpAMZKbzdCHSCvv6iuz0CCwMS
         XgWE89Ium91o50YLdQln9tYBeh8+Yfk/qE7XARdxE/63d3ETF8NpSFa7NknTpv6Lc2zS
         pf4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772324098; x=1772928898;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zYnsoG7qDnrk7Z/gOuxzAyQoovXIM2RIYjUlYbsloBk=;
        b=HxQRXD9WFLNmUAdW0/x0SEjyLvk5PRUESXSKozD19Nsexp3pMNBT7vmlTun1EuxXKa
         A9JvkVFvbKuLWHANjLtmDWBfuYRk5F6eUeEXTT7s2U7EAJ+2QKneAqQvCjsZJxqKnwXt
         UfOxkV0A9U5JJ2U76Wh4ATIfumJgnADuvlFL+ktjki/Gv5uw6xTVHkmbVOfu3D3/5XAo
         FFotCglTPutxppNuBHLmCAyDmcnBIouambvp3HRoHCTJfU3wx40uYeHTiqE8jm0oBMZ9
         q+1O76t7lIy++DlLG3R9ZRGAWZOT4hNzEh6DNToBFsKFUBQqMVENKVNRTQvJ9xYBdrdv
         9hAw==
X-Forwarded-Encrypted: i=1; AJvYcCUV6uVw7nxP8ilnmftT8AMiQBQHmCWKB/lrHmoAHi7lIX5ksfVfxWeY2Srknsk4KDT7/kkg7+b9K1p1SZEP@vger.kernel.org
X-Gm-Message-State: AOJu0YzdFsozBs0dgN4cGHI/8L7+mZDSCQG8UetlMw/ZreO8bgbglWjg
	YtHkgvSXEboIgKJbQomWLQLZjyF9TSdIkGJTyRUNKS5IODdU6Ijdgg8N
X-Gm-Gg: ATEYQzzsh2RkJRMrDQkxUdBk6FrBm07H5kg+7pe+0vgrkG0JlL+i+ImNS8segPnGdTM
	KAGlWDvmXJv1TpWWn6ZHjPUS39UTkRcR8ct1l9YujZNzZ8EfxWTSuDHVHug8g3spyXYKc3zWUMi
	357lc/poUY6TCXiDzQircmWNjn7GtjP0raP7+NxcRAk0SojCUJCORfffz0md9CVCU3JKX7agpJp
	/hY4vUkMuDeXhKLrjKH6Pq3ogWEpVQ9qXY4Nx9ixXePMifv/iS4RCguJ6/wYBkMjFSF5ugBE6fa
	P6jLJ49oqpoQjEaIThspRbj36MZnaBYlL/CrCQzz3bwzH7y92lL44iSQgqPxJPJDAGKy0P+kGn+
	d4bhRfR7Sl1OGXg/MG/un82VLNzi2K04abtF1cFNS0jiMvAJsqa2aMObHjuzInZFGcpFLOwEH/H
	m/IQTAJpOqvmMHF9XhQuE=
X-Received: by 2002:a05:600c:474e:b0:483:7d93:9fb7 with SMTP id 5b1f17b1804b1-483c9b99876mr77353565e9.2.1772324097547;
        Sat, 28 Feb 2026 16:14:57 -0800 (PST)
Received: from skbuf ([2a02:2f04:d608:3a00:53bb:2a43:1888:95a0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd75dfaasm278799855e9.12.2026.02.28.16.14.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Feb 2026 16:14:56 -0800 (PST)
Date: Sun, 1 Mar 2026 02:14:53 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>,
	Andrew Lunn <andrew@lunn.ch>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
	Neil Armstrong <neil.armstrong@linaro.org>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH RESEND2 net-next 0/8] net: stmmac: qcom-ethqos: further
 serdes reorganisation
Message-ID: <20260301001453.lpd2rawy7bqxyivp@skbuf>
References: <aaDSJAc-x2-klvHJ@shell.armlinux.org.uk>
 <aaIysVxy-WxbiJz9@shell.armlinux.org.uk>
 <20260227165556.5cf9e844@kernel.org>
 <20260228083111.5df8550c@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260228083111.5df8550c@kernel.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94652-lists,linux-arm-msm=lfdr.de];
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
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8339D1C9CD2
X-Rspamd-Action: no action

On Sat, Feb 28, 2026 at 08:31:11AM -0800, Jakub Kicinski wrote:
> On Fri, 27 Feb 2026 16:55:56 -0800 Jakub Kicinski wrote:
> > On Sat, 28 Feb 2026 00:11:29 +0000 Russell King (Oracle) wrote:
> > > The AI review for patch 7 says:
> > > 
> > >   This commit fixes a bug but lacks a Fixes: tag. The commit modifies
> > >   behavior introduced in 360000820ae2 ("phy: qcom-sgmii-eth: add
> > >   .set_mode() and .validate() methods") by making phy_power_on() call
> > >   qcom_dwmac_sgmii_phy_calibrate() to restore the previous setup, and by
> > >   making qcom_dwmac_sgmii_phy_set_mode() check if the PHY is powered on
> > >   before attempting calibration.
> > > 
> > >   Should this commit include:
> > > 
> > >   Fixes: 360000820ae2 ("phy: qcom-sgmii-eth: add .set_mode() and .validate() methods")
> > > 
> > > which is _wrong_, this isn't a bug fix.  
> > 
> > Yes, that's what I thought but then I saw the other thread..
> 
> Trying to apply this now but stmmac parts don't apply on Linus's tree,
> and Vinod wants a tag :( What do we do? 
> 
> Could you, perhaps, send us a PR with this on top of Linus's tree 
> (a resolution of the inevitable conflict with net-next would be helpful
> too).
> 
> Or do we give up on the tag?

Actually, I think it's mainly me who wants a stable tag. I'm working on
a series for phy-next which will conflict with this hunk from Russell's
patch 1:

diff --git a/drivers/phy/qualcomm/phy-qcom-sgmii-eth.c b/drivers/phy/qualcomm/phy-qcom-sgmii-eth.c
index 5b1c82459c12..4ea3dce7719f 100644
--- a/drivers/phy/qualcomm/phy-qcom-sgmii-eth.c
+++ b/drivers/phy/qualcomm/phy-qcom-sgmii-eth.c
@@ -7,6 +7,7 @@
 #include <linux/ethtool.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/phy.h>
 #include <linux/phy/phy.h> // this gets renamed to <linux/phy/phy-provider.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>

If there's no other way to provide a stable tag other than on v7.0-rc1
(like for example a snapshot of current net-next/main), which I didn't
know wouldn't be possible, then I think going with the route of fewer/
more trivial merge conflicts makes sense.

