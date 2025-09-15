Return-Path: <linux-arm-msm+bounces-73518-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F35AB573B8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 10:58:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4E5D67AFBFB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 08:56:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 046002F0C7D;
	Mon, 15 Sep 2025 08:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NlrgJBRa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 330DF2D6E78
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 08:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757926546; cv=none; b=mcx3jrXe1iu+2v4uhEOVKhze0ZzAUQbfEi3SlsT4UCmOuQbX0RTdWte3KQOQ6A6xk5zxECdbYjLAm9fsac2MvwgRxJkefOcNhF5bmWSxDPzbV2CfuhofHU6sZuvEG9Xb84SMGS+SvDL+wC3NvC82jePOz8wO+DzsFmUAJXd6U/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757926546; c=relaxed/simple;
	bh=Yy5STNsXLz/oHRvxTISnADXePW8lhB72PMJ0pnkSnxI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qVKP5tirRnWilZpZEwLFch0xTjNc4ri60UD68vjMxzK7nOgBUyosw2HnQ6bEKUv8DZgZNiTpjDrHu8BHAMEN3wy7axtWcSyRie8jG/23Z290J6bGqCQLtouaWV2t27TeeQUMgQoBiM/uealPpUdyoC4C4ndRNNfzYT7NcsWkAl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NlrgJBRa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58F8FdnP020478
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 08:55:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=wLNuOM/rMRTF8+cnf91YECVB
	LsmZQln4JgL+duYQ6Gs=; b=NlrgJBRawrjeWrAQ5UWTM9g22eePJlPV2MQFS4hI
	Cm9O7stq6FVxXmxVUKC6ld0lOXvA2HUZKTeulmvKSp7VM1vWg5n4ekDmgnBpcc9d
	KAj7V2W7h5oADnM8vQgp0SBGU0Q9Tss12/uRuvvcYLBhpLWnvJIbAPF6SGuVLfU7
	mLyqPTbuATHtezLVQmcaf2KUQrI630ueopKEM20Mrz9xXmAMwoIJUXfSc3R8+8Ws
	kNg1xppWRMv2tNDr3FtdapQMkZbG3OQBRjRGBs1AuGT/q474+W0R0V/vlZGoMpk0
	HAIALg9UPfa0qthIhs1E2UT8wbSnm3aVPOfbx0JKw1LHhA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4950pv46d2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 08:55:43 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-26472a98ab8so7507585ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 01:55:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757926543; x=1758531343;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wLNuOM/rMRTF8+cnf91YECVBLsmZQln4JgL+duYQ6Gs=;
        b=gqdA4ZwtfqEq+F94L4e70IoO9FVHLKx/vm0cASCfsS+vi7ytk7o20SLhoNzxH6+SOt
         v6G2TqLRU0i2fdBeZ8PER2L1ZJcYUxksn/LvZus0wiJ0/k033MhOuf33L6uMDnhXxTHz
         J0amBTg30vm/p+WTl86KvNswL4rNqxLwBMl6ITLYHTb6s6DYXQ3oud6/j69uAlfVVHHc
         P5wX14XhjOxp65ZQfl6rgO/zauJ9Z2IlqCvMccvO7MEfslz9njJOiDqk9alXUW6ubP3P
         gmFcPkRBLO5VhyS1KSh8834MgUPw2elIuJpfqA/0uEJezO3mdIERPRIXZQcTq5IoLIHt
         moIQ==
X-Forwarded-Encrypted: i=1; AJvYcCW0vk4IRfVvjdOpeQzVZQgMSrUzcAa7hzRpRBDyD+aIwS0GAS3HfglgSS7Mk6wyOmzS0D4QBwPtauY3+pKT@vger.kernel.org
X-Gm-Message-State: AOJu0YyD0R74TG+VKpbeM9HJORMIpgGjpb79P/ysRbZo0rZ12fS/Upbe
	swIffIlH1RcsoeWk1SSohq5hkRPdufPHYS45o6M+jfXO9nUYFICjPV6ASx5Pjw+MMYl3Fs3X0bU
	vUYiMqyrARzeuyc3zn09orOfN8gmNTKKSZx8gQUyzouW/sQcIiXV2S4apwSqxz2bqe387
X-Gm-Gg: ASbGncs5OuJ6dj6SG8c2oo7+R6HqZY5JgIlmx4tY07VyiBCj2SI+oL6BHD///QOm92Z
	LrbZBDNVf0f3IJQIoFAmLRcs2t77RyIUeP9wKDnQTbzi3FgGqNfkhYyG1mfLF7/L8hc6nCpV5ZG
	x23Es2IdsEUxK+Cfd7A1DiBlB27Em5ymkjsVLzGJ9+ssoNtPMicZT4RrzyC8gtrvqf9Td8r5DwT
	3KjGIo3mq2LrTcE8RB5WCRI62/tlGzM9imdCH2L5UHeltR+nUVWoZW8QaV/+1MzSkPaKtgrFvE4
	+Wo2l+vkzaW7KuZOKD/ke2HYsGrDFvlpz1tXoHebih7u4HZXLoI8cw==
X-Received: by 2002:a17:902:f147:b0:246:2da9:73a2 with SMTP id d9443c01a7336-25bae8dca71mr118773125ad.27.1757926542602;
        Mon, 15 Sep 2025 01:55:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFxJVzmN8L1lYkKLjLebIOGAD4Y/rC3K4e1Kjs12zKjyg936oG4vniFvJPtY1SQDO/H0GB+HA==
X-Received: by 2002:a17:902:f147:b0:246:2da9:73a2 with SMTP id d9443c01a7336-25bae8dca71mr118772965ad.27.1757926542028;
        Mon, 15 Sep 2025 01:55:42 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-264eeab7bf1sm35739675ad.5.2025.09.15.01.55.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 01:55:41 -0700 (PDT)
Date: Mon, 15 Sep 2025 14:25:36 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>, andrew@lunn.ch
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next] net: phy: qcom: qca808x: Add .get_rate_matching
 support
Message-ID: <aMfUiBe9gdEAuySZ@oss.qualcomm.com>
References: <20250914-qca808x_rate_match-v1-1-0f9e6a331c3b@oss.qualcomm.com>
 <aMcFHGa1zNFyFUeh@shell.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aMcFHGa1zNFyFUeh@shell.armlinux.org.uk>
X-Proofpoint-ORIG-GUID: Xj2b8gkMnEXTU3uwoIFANPopV4mxB1iT
X-Authority-Analysis: v=2.4 cv=PsWTbxM3 c=1 sm=1 tr=0 ts=68c7d490 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=yJojWOMRYYMA:10 a=P-IC7800AAAA:8 a=c4qJPYNQ9Ol6fpErAFgA:9
 a=CjuIK1q_8ugA:10 a=GvdueXVYPmCkWapjIL-Q:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-GUID: Xj2b8gkMnEXTU3uwoIFANPopV4mxB1iT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAyOSBTYWx0ZWRfX7y2YJCBWPGHI
 5HfnwpH7MGXy5EenJmOkUoXp363dcFy6EUududFvjXms88O/GZxGOU4Wu0TQYu9rFEmCjcx0Z44
 7h1eaoOnW1ENs/pE04JG3ezgZ5VXsw9BO6LF8xTWSd2cLha4U40LluYDkVzvw6lLn7+3NR3z5bl
 FR0mcSImv4gwx00DD7q9ykkKSeU9AOxXC+mL6xclYlylH2stGGm8Svdp/Y0tXa2VmLBeSKrNJ3s
 iBB9ZZ5CYZlha/Adbp3BS27o0tOAVKLLTg33pTZvRXG6RlA2zbq1srlH1igiR7vmhI9yED2KaBQ
 DFBNXMVYakiv+5aGh3tD08rmMBVVtAQMozDARIJQrx0gDCahqTxxZsb9OcPb3vUm3DNlsi5BFiU
 0pHbj+V0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-15_03,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 spamscore=0 bulkscore=0 adultscore=0 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509130029

On Sun, Sep 14, 2025 at 07:10:36PM +0100, Russell King (Oracle) wrote:
> On Sun, Sep 14, 2025 at 08:36:48PM +0530, Mohd Ayaan Anwar wrote:
> > Add support for rate matching to the QCA8081 PHY driver to correctly
> > report its capabilities. Some boards[0][1] with this PHY currently
> > report support only for 2.5G.
> > 
> > Implement the .get_rate_matching callback to allow phylink to determine
> > the actual PHY capabilities and report them accurately.
> 
> Sorry, but this is incorrect.
> 
> The PHY does not support rate matching, but switches between SGMII
> and 2500BASE-X depending on the negotiated speed according to the code:
> 
> static void qca808x_fill_possible_interfaces(struct phy_device *phydev)
> {
>         unsigned long *possible = phydev->possible_interfaces;
> 
>         __set_bit(PHY_INTERFACE_MODE_SGMII, possible);
> 
>         if (!qca808x_is_1g_only(phydev))
>                 __set_bit(PHY_INTERFACE_MODE_2500BASEX, possible);
> }
> 
> static int qca808x_read_status(struct phy_device *phydev)
> {
> ...
>         if (phydev->link) {
>                 if (phydev->speed == SPEED_2500)
>                         phydev->interface = PHY_INTERFACE_MODE_2500BASEX;
>                 else
>                         phydev->interface = PHY_INTERFACE_MODE_SGMII;
>         } else {
> 
> The driver certainly does not support rate-matching, even if the PHY
> can support it, and even with your patch. All you are doing is making
> ethtool suggest that other speeds are supported, but I think you'll
> find that if the PHY negotiates those speeds, it won't work.
> 

Weirdly, I was able to test both 1G and 2.5G with my patch. Could this
be because the driver is already deviating from the standard in other
areas?

> So, the bug is likely elsewhere, or your ethernet MAC doesn't support
> SGMII and you need to add complete support for  rate-matching to the
> driver.
> 

I tried setting phy-mode=sgmii in the Devicetree and I am able to get 1G
and lower speeds to work.

> Please enable phylink debugging and send the kernel messages so I can
> see what's going on.
> 

Filtered logs (without my patch):
[    7.937871] qcom-ethqos 23040000.ethernet: IRQ eth_wake_irq not found
[    7.944581] qcom-ethqos 23040000.ethernet: IRQ eth_lpi not found
[    7.953753] qcom-ethqos 23040000.ethernet: User ID: 0x20, Synopsys ID: 0x52
[    7.960927] qcom-ethqos 23040000.ethernet:   DWMAC4/5
[    7.966049] qcom-ethqos 23040000.ethernet: DMA HW capability register supported
[    7.973564] qcom-ethqos 23040000.ethernet: RX Checksum Offload Engine supported
[    7.981073] qcom-ethqos 23040000.ethernet: TX Checksum insertion supported
[    7.988139] qcom-ethqos 23040000.ethernet: TSO supported
[    7.993603] qcom-ethqos 23040000.ethernet: Enable RX Mitigation via HW Watchdog Timer
[    8.001654] qcom-ethqos 23040000.ethernet: Enabled L3L4 Flow TC (entries=8)
[    8.008817] qcom-ethqos 23040000.ethernet: Enabled RFS Flow TC (entries=10)
[    8.008819] qcom-ethqos 23040000.ethernet: Enabling HW TC (entries=128, max_off=64)
[    8.008821] qcom-ethqos 23040000.ethernet: TSO feature enabled
[    8.008822] qcom-ethqos 23040000.ethernet: SPH feature enabled
[    8.008824] qcom-ethqos 23040000.ethernet: Using 36/40 bits DMA host/device width
[    8.243500] qcom-ethqos 23040000.ethernet eth0: Register MEM_TYPE_PAGE_POOL RxQ-0
[    8.253778] qcom-ethqos 23040000.ethernet eth0: Register MEM_TYPE_PAGE_POOL RxQ-1
[    8.261991] qcom-ethqos 23040000.ethernet eth0: Register MEM_TYPE_PAGE_POOL RxQ-2
[    8.262527] qcom-ethqos 23040000.ethernet eth0: Register MEM_TYPE_PAGE_POOL RxQ-3
[    8.348697] qcom-ethqos 23040000.ethernet eth0: PHY stmmac-0:1c uses interfaces 4,23, validating 23
[    8.358304] qcom-ethqos 23040000.ethernet eth0:  interface 23 (2500base-x) rate match none supports 6,13-14,47
[    8.368589] qcom-ethqos 23040000.ethernet eth0: PHY [stmmac-0:1c] driver [Qualcomm QCA8081] (irq=POLL)
[    8.368595] qcom-ethqos 23040000.ethernet eth0: phy: 2500base-x setting supported 0000000,00000000,00008000,00006040 advertising 0000000,00000000,00008000,00006040
[    8.381057] qcom-ethqos 23040000.ethernet eth0: Enabling Safety Features
[    8.416398] qcom-ethqos 23040000.ethernet eth0: IEEE 1588-2008 Advanced Timestamp supported
[    8.425541] qcom-ethqos 23040000.ethernet eth0: registered PTP clock
[    8.434778] qcom-ethqos 23040000.ethernet eth0: configuring for phy/2500base-x link mode
[    8.446169] qcom-ethqos 23040000.ethernet eth0: major config, requested phy/2500base-x
[    8.454323] qcom-ethqos 23040000.ethernet eth0: interface 2500base-x inband modes: pcs=00 phy=00
[    8.463353] qcom-ethqos 23040000.ethernet eth0: major config, active phy/outband/2500base-x
[    8.471939] qcom-ethqos 23040000.ethernet eth0: phylink_mac_config: mode=phy/2500base-x/none adv=0000000,00000000,00000000,00000000 pause=00
[    8.485780] 8021q: adding VLAN 0 to HW filter on device eth0
[    8.489653] qcom-ethqos 23040000.ethernet eth0: phy link down 2500base-x/Unknown/Unknown/none/off/nolpi
[   13.615848] qcom-ethqos 23040000.ethernet eth0: phy link up 2500base-x/2.5Gbps/Full/none/rx/tx/nolpi
[   13.617924] qcom-ethqos 23040000.ethernet eth0: Link is Up - 2.5Gbps/Full - flow control rx/tx

// I changed the link partner speed to 1G here:
[   74.031182] qcom-ethqos 23040000.ethernet eth0: phy link down 2500base-x/Unknown/Unknown/none/off/nolpi
[   74.031773] qcom-ethqos 23040000.ethernet eth0: Link is Down

For reference, this board is using the same MAC as [0] which works
perfectly fine with the AQR115C PHY. I got the (wrong) idea to add
.get_rate_matching after comparing the two PHY drivers. The MAC driver
is stmmac/dwmac-qcom-ethqos.c

	Ayaan
---
[0] https://elixir.bootlin.com/linux/v6.17-rc5/source/arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dts

