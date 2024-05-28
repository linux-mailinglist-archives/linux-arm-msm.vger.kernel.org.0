Return-Path: <linux-arm-msm+bounces-20851-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 921FA8D280D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2024 00:35:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 11F8A1F263E1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 22:35:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2A6A13DDD2;
	Tue, 28 May 2024 22:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UIUBI4Sd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AF7613D8A2
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 May 2024 22:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716935733; cv=none; b=VfZyxlGuR5zlg3WLn73YPrIVCVUU3fBTaZqcxvnmUocQzyKw6PzyeywHDDotocVhH9O4056mw7pYkg/VijULHRujYwqCQRJmcpQpzxhHrLZhG6o6W+VYMc7adlKh3WQ9FraZWNKOJ+o0a+rAh/LDiGB9D06awsliPuRwqbjfoXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716935733; c=relaxed/simple;
	bh=jte3WYru06tH2x9atBWbSvJ/WMZh03BnAoQDtEstuZY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kTWeTDqW3C2JztqwLUNj4eqgqpd7VphObHdUWiwsOTyt2UEDWxJpucHoQ8IHjQgajZHHWLd6uS884DNjl5ox1gyvGpmEyNIXrnOzpnQcFRkfaDs1W2fBmUUlrdYYLPNq0ekPxEkK0pyU04kGBppDYR2LJsvDsprrlV454KSKGo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UIUBI4Sd; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1716935730;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2vTVfu+olLzFpc34MrVztZvLijZKhVzXnLTbDNxRCT8=;
	b=UIUBI4SdwSqZP1j8v6wj9cnZOSqP35VrCYWn7YVMXNBZoyDDlS6e755LUSvIRQ1h+/Cc2B
	FbNNq1RTriqvHlUeX6ICam4lNKtkQuYOvHUK1weH+ys13RT5qAyEa4e8FPaeNo0ocbnmtC
	X9q+Xafeu3zEr40aWBQNaKqDoCHn8PQ=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-47-pHxeX8VHMYKxrOiO7WNWrg-1; Tue, 28 May 2024 18:35:28 -0400
X-MC-Unique: pHxeX8VHMYKxrOiO7WNWrg-1
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-794ab2615f4so163197185a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 May 2024 15:35:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716935728; x=1717540528;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2vTVfu+olLzFpc34MrVztZvLijZKhVzXnLTbDNxRCT8=;
        b=tg67NkX5J+9UeNS5AD0OlNJHJLY77rK8v3DlrFk839o/u6iAZFpFg+tRQ9968pNVQ6
         zHSDSCrm0MbOS+h2CTydeL189JlM87Kn9Hmskz41UGBZ/+EmNPEh1qBcs2mXe8jmxd4u
         hX6i4Na3Azo29unVo4U2Hw3WqtlrCGR1HwxGrjzIi3tJZIxBAcDuEi/d2nY2K8HLmjDJ
         sZG+HO8FS+6YeRzqZSqNua3r5AZTYS3buFPRq1rnkotH33OdR/FDjJ5WBrb85G8jcRhY
         ZGXF0K5QcjpQU91wbxWcfy4kN64MDZLrUyWXSy7uKnTOn0rqNptFUrGJQrMEtwbccieA
         SC+Q==
X-Forwarded-Encrypted: i=1; AJvYcCU9aSrxwNYtEih+b5eJ7mgr1qA/mBUcCaWV/MbbN11Vq88Y06YwJFUJYhjcWeKY70nxErqFV6ogSBo+BYK07MJOwh25XJ3dYUl77Zfr7w==
X-Gm-Message-State: AOJu0YwDgvrJiNfSNByZup5slbfk1xm/2y3G0Wy2mIW+qvDs1ZPEtTPh
	aVy8hBMwPtHOTtZfPrTJh7/4x3QXYIGewwZ/autoIrD5lTxfRkBstkgPQiozU3jN7FXWR9zJEUL
	+/4cR/6cP9SZE2vSdy+SVGHO6f7+8HHNrYbGGz5A7FGzie6HTVoghxCbQ8BewgX8=
X-Received: by 2002:a05:620a:9369:b0:792:bf2e:2e55 with SMTP id af79cd13be357-794ab0f48e7mr1535759685a.47.1716935727651;
        Tue, 28 May 2024 15:35:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEPkr0oXpchpPNq60OMM5uiWtPmMmFSYh9Y7CUuCbZqgUXDMnoKeDv8DKfmv2M391gvEDduQg==
X-Received: by 2002:a05:620a:9369:b0:792:bf2e:2e55 with SMTP id af79cd13be357-794ab0f48e7mr1535757285a.47.1716935727121;
        Tue, 28 May 2024 15:35:27 -0700 (PDT)
Received: from x1gen2nano ([2600:1700:1ff0:d0e0::33])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-794abd30e10sm417659385a.113.2024.05.28.15.35.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 May 2024 15:35:26 -0700 (PDT)
Date: Tue, 28 May 2024 17:35:24 -0500
From: Andrew Halaney <ahalaney@redhat.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Sneh Shah <quic_snehshah@quicinc.com>, Vinod Koul <vkoul@kernel.org>, 
	Bhupesh Sharma <bhupesh.sharma@linaro.org>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kernel@quicinc.com
Subject: Re: [PATCH net-next] net: stmmac: dwmac-qcom-ethqos: Add support for
 2.5G SGMII
Message-ID: <wxzfc5znyjyv7d7aout7bfqax3ata5uhijm7x4jqe2zlxbm2zz@qrq7az6odkmk>
References: <20231218071118.21879-1-quic_snehshah@quicinc.com>
 <4zbf5fmijxnajk7kygcjrcusf6tdnuzsqqboh23nr6f3rb3c4g@qkfofhq7jmv6>
 <8b80ab09-8444-4c3d-83b0-c7dbf5e58658@quicinc.com>
 <wvzhz4fmtheculsiag4t2pn2kaggyle2mzhvawbs4m5isvqjto@lmaonvq3c3e7>
 <8f94489d-5f0e-4166-a14e-4959098a5c80@quicinc.com>
 <ZlNi11AsdDpKM6AM@shell.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZlNi11AsdDpKM6AM@shell.armlinux.org.uk>

On Sun, May 26, 2024 at 05:27:03PM GMT, Russell King (Oracle) wrote:
> On Thu, Dec 21, 2023 at 02:23:57PM +0530, Sneh Shah wrote:
> > On 12/20/2023 9:29 PM, Andrew Halaney wrote:
> > > I'd evaluate if you can update that function to clear the ANE bit when
> > > the ane boolean is false. From the usage I see I feel that makes sense,
> > > but correct me if you think I'm wrong.
> > > At the very least let's use the defines from there, and possibly add a
> > > new function if clearing is not acceptable in dwmac_ctrl_ane().
> > > 
> > > Stepping back, I was asking in general is the need to muck with ANE here
> > > is a Qualcomm specific problem, or is that a generic thing that should be
> > > handled in the core (and the phy_set_speed() bit stay here)? i.e. would
> > > any dwmac5 based IP need to do something like this for SPEED_2500?
> > I think disabling ANE for SPEED_2500 is generic not specific to qualcomm.
> > Even in dwxgmac2 versions also we need to disable ANE for SPEED_2500.
> > Autoneg clause 37 stadard doesn't support 2500 speed. So we need to
> > disable autoneg for speed 2500
> 
> (Going back over the history of this addition)
> 
> What 802.3 Clause 37 says is utterly _irrelevant_ when discussing Cisco
> SGMII. Cisco took 802.3 1000base-X and modified it for their own
> purposes, changing the format of the 16-bit control word, adding support
> for symbol replication to support 100Mbps and 10Mbps, changing the link
> timer, etc. SGMII is *not* 802.3 Clause 37.
> 
> I guess you are getting caught up in the widespread crud where
> manufacturers stupidly abuse "SGMII" to mean maybe "Cisco SGMII" and
> maybe "802.3 1000base-X" because both are "serial gigabit MII". Yes,
> both are serial in nature, but Cisco SGMII is not 1000base-X and it
> also is not 2500base-X.
> 
> What makes this even more difficult is that 2500base-X was never
> standardised by the 802.3 committees until very late, so we've ended
> up with manufacturers doing their own thing for years. We've ended up
> with a mess of different implementations described in different ways
> many of which boil down to being 2500base-X without inband AN. For
> example, one manufacturer talks about "HS-SGMII", but doesn't permit
> the interface to operate at the x10 and x100 symbol replications that
> conventional Cisco SGMII uses for 100M and 10M speeds respectfully,
> making it in effect no different from 2500base-X.
> 
> Now through into this mess various implementations that do not support
> inband at 2.5G speeds, those that require inband at 2.5G speeds... one
> can get into the situation where one pairs a PHY that requires inband
> with a PCS that doesn't support it and the result doesn't work. This
> is particularly problematical if the PHY is on a hotpluggable module
> like a SFP.
> 
> It's a total trainwreck.
> 
> I do have some work-in-progress patches that attempt to sort this out
> in phylink and identify incompatible situations.
> 
> See http://git.armlinux.org.uk/cgit/linux-arm.git/log/?h=net-queue
> 
> commits (I think)...
> 
> net: phylink: clean up phylink_resolve()
> 
> to:
> 
> net: phylink: switch to MLO_AN_PHY when PCS uses outband
> 
> and since I'm converting stmmac's hacky PCS that bypasses phylink to
> a real phylink_pcs, the ethqos code as it stands presents a blocker
> because of this issue. So, I'm intending to post a series in the next
> few days (after the bank holiday) and will definitely need to be
> tested on ethqos hardware.

Whatever you work out here with Qualcomm, I can at least test this on this
board:

    https://elixir.bootlin.com/linux/v6.9-rc3/source/arch/arm64/boot/dts/qcom/sa8775p-ride.dts#L266

So basically the same SoC as the one Sneh is adding some support for
here, but on a board with a Marvell 88EA1512 connected via SGMII stuck in
a remote lab somewhere.

I don't have documentation on the IP though... but can at least provide
some testing. Qualcomm has access (I think) to two other boards with the
same SoC, one with some Aquantia phy (that I think is 2500 Mbps
capable), and another with a fixed-link setup at 2500 Mbps. If I
understand correctly the latter works with the driver already.

Please CC me on future patches on the topic and I'll at least give them
a spin and a look, following through some of your threads today this is a
real rats nest.

Thanks,
Andrew

> 
> However, first we need to get to the bottom of your latest patch that
> only sets PHY_INTERFACE_MODE_2500BASEX when plat_dat->flags has the
> STMMAC_FLAG_HAS_INTEGRATED_PCS flag _set_, but the stmmac code very
> oddly does _not_ use the built-in PCS if this flag is set. See:
> 
> 	stmmac_ethtool_get_link_ksettings()
> 	stmmac_ethtool_set_link_ksettings()
> 
> and their use of pcs_link / pcs_duplex / pcs_speed. Also see
> 
> 	stmmac_common_interrupt()
> 
> and its use of pcs_link to control the carrier, the dwmac1000 and
> dwmac4 code that reads the status from the GMAC, updating the
> pcs_link / pcs_duplex / pcs_speed variables.
> 
> -- 
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
> 


