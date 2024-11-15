Return-Path: <linux-arm-msm+bounces-38020-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FD139CDFC2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Nov 2024 14:23:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E66C3B21F4C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Nov 2024 13:23:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1475D1BB6A0;
	Fri, 15 Nov 2024 13:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="kuS9SzL/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA58C1B218E;
	Fri, 15 Nov 2024 13:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731676978; cv=none; b=Em5TOfnv2Pj6EDHVrr5TtU5Ma5ExJQ0fEfjKgcmk0GL/733x/LYyKhLdb/J6XDcL3X+4+UmC+9ajyA1R4C9Q4qwZ9+YOj/ZUEuEpo5VdEO86k5mqXV5zqex0LXF5u5eLqfHw2Tx8+qz6nTUPUcDS94/dq54A5NcyDlM1/pGr+rU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731676978; c=relaxed/simple;
	bh=yZBYo3Xczm3xelxlNqnzQYLgDwGmIibZiotL/Xr5ibI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DrKARe5BvA9LVLJD5BgIGlj7keXsyRi3u1uw8lCxAPcNarPadB6u4IkGbdicK8KGqJ+edNaG8f+J7JGH4/Ksvko0Mv08eXlTyuWCE07m80DNmoFRiLREekArEwoQqEvU9wnVGb7pFNnOTsufBr4krHgcSWgo76F/IZRrueSz5/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=kuS9SzL/; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=ef3SzHkC/AAEf+p5zTM3KCa1I619LTyjflgp5vpLoF4=; b=kuS9SzL/3MNLaDLbckp5u18ELV
	TC/iDCSgoIsrmkllG4TQsJA8fMVq1f5M0UQpUg7sxxQ6138WVDYLd/ird8R+uvzoojnz1GKmjrw43
	M2aKNrxrwjjoLFw8OyfhJZ+u8pctVsw8ZDkz38yqYQu3xTw82qBqS9dj9HNHDgJv+6KM=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tBwHM-00DQ7l-NL; Fri, 15 Nov 2024 14:22:28 +0100
Date: Fri, 15 Nov 2024 14:22:28 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Sagar Cheluvegowda <quic_scheluve@quicinc.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel@quicinc.com
Subject: Re: [PATCH] net: stmmac: dwmac-qcom-ethqos: Enable support for XGMAC
Message-ID: <5899239a-50c4-46ca-9cd7-43e95d61fe54@lunn.ch>
References: <20241112-fix_qcom_ethqos_to_support_xgmac-v1-1-f0c93b27f9b2@quicinc.com>
 <55914c2a-95d8-4c40-a3ea-dfa6b2aeb1dd@lunn.ch>
 <2ac308d7-35be-463e-9838-3bbedc2a4d68@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2ac308d7-35be-463e-9838-3bbedc2a4d68@quicinc.com>

On Thu, Nov 14, 2024 at 05:08:13PM -0800, Sagar Cheluvegowda wrote:
> 
> 
> On 11/13/2024 6:51 PM, Andrew Lunn wrote:
> > On Tue, Nov 12, 2024 at 06:08:10PM -0800, Sagar Cheluvegowda wrote:
> >> All Qualcomm platforms have only supported EMAC version 4 until
> >> now whereas in future we will also be supporting XGMAC version
> >> which has higher capabilities than its peer. As both has_gmac4
> >> and has_xgmac fields cannot co-exist, make sure to disable the
> >> former flag when has_xgmac  is enabled.
> > 
> > If you say they are mutually exclusive, how can it happen that both
> > are enabled?
> > 
> > To me, this feels like you are papering over a bug somewhere else.
> > 
> > 	Andrew
> 
> 
> We can set either has_gmac4 or has_xgmac flags by using below
> dtsi properties as well. But since Qualcomm only supported
> GMAC4 version in all of its chipsets until now, we had enabled
> has_gmac4 flag by default within dwmac_qcom_ethqos.c instead
> of adding any of the below entries in the dtsi. But this will
> create problem for us as we start supporting Xgmac version
> in the future, so we are trying to add this change so that
> our driver can support Xgmac version when "snps,dwxgmac" is 
> defined in the dtsi and we are keeping the default supported
> configuration as gmac4.

So i think you are saying that stmmac_probe_config_dt() does not
reliably set

	plat->has_gmac4 = 1;

or

	plat->has_xgmac = 1;

because you have not listed the secondary compatibles:

"snps,dwmac-4.00"
"snps,dwmac-4.10a"
"snps,dwmac-4.20a"
"snps,dwmac-5.10a"
"snps,dwmac-5.20"
"snps,dwxgmac"

in your .dtsi files.

It is too late to add these, because of backwards compatibility to old
DT blobs.

However, you are thinking of doing it correctly for new SoCs, and
include "snps,dwxgmac", so stmmac_probe_config_dt() will set
plat->has_xgmac = 1. The hard coded plat_dat->has_gmac4 = 1 then gives
you problems.

Correct?

An explanation like this needs to be added to the commit message
however you solve it in the end, because your current commit message
does not explain the problem you are trying to solve.

You already have:

struct ethqos_emac_driver_data {
        const struct ethqos_emac_por *por;
        unsigned int num_por;
        bool rgmii_config_loopback_en;
        bool has_emac_ge_3;
        const char *link_clk_name;
        bool has_integrated_pcs;
        u32 dma_addr_width;
        struct dwmac4_addrs dwmac4_addrs;
        bool needs_sgmii_loopback;
};

static const struct of_device_id qcom_ethqos_match[] = {
        { .compatible = "qcom,qcs404-ethqos", .data = &emac_v2_3_0_data},
        { .compatible = "qcom,sa8775p-ethqos", .data = &emac_v4_0_0_data},
        { .compatible = "qcom,sc8280xp-ethqos", .data = &emac_v3_0_0_data},
        { .compatible = "qcom,sm8150-ethqos", .data = &emac_v2_1_0_data},
        { }
};

This has has_emac_ge_3. I think it is much cleaner to add has_gmac4
and has_xgmac to ethqos_emac_driver_data, so you have a clear link to
the compatible.

	Andrew

