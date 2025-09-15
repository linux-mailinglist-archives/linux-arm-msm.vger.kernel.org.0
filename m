Return-Path: <linux-arm-msm+bounces-73568-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C7B2FB57993
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 13:59:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 9D0F74E1D14
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 11:59:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDEF72D24B8;
	Mon, 15 Sep 2025 11:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D9FbIUlY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33D3E2FDC5D
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 11:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757937540; cv=none; b=UBuxmej3jZlDQcBPcwTmlmO6qASMuLHN46kouUwgWnchH7VcIh7YxpgM2XYPS0MaQHcOLByF4mf7EdxyCubHjFn11FBnvTSCdY8zYqXMNs4oJcOP/rqXwBL/UT7nH7KPcWtIwUyiiu0NBe9M1mEjZhEwO/LfOGyVkODuLlwWL40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757937540; c=relaxed/simple;
	bh=LgCFVFN4Ma3avEiWjA83ikTL6fC+6c1II0g9R/QKREA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CYYLnevNNH8HwysqN7hVb1MnmTfegTE/NW+SFLN2Zhi71+fDGtY8H8jICA5RaeNj/sHrV3cn0/i8tendfXZ2HeAHDfmWNeudvPw5QgWxSQ1sM94b7YuaYLdgWpTK8OpXTr+GGG5iRFVWA7domb5pi9NmkWxAQsGisvWeSEQWNy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D9FbIUlY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58F8FgL2005689
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 11:58:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O9Y91Mi9c6sVbop+7ZRsi0PmV9tUsrr5aJXQ5MNmIsQ=; b=D9FbIUlYDTZ9dCLs
	rkXnGI33Co+PxA1McGEmjkn4J+M48QcrLL+jje0jxxfqsHctPLUubJZTq981HUlh
	Q6EDKhkySonBO7Dn+rr9T4XF8yE8mPOrzhq+7PLRVC1hdiYR3eOEGAB1mawIyz8q
	+SlU1N6PZ7CXuLtIeRdxmDSbaOGbPbw7/KAw/fM298yOez+RDdJ6HmhCGhGqSE3d
	ltH5ByU1vMw7DF5kXWLDeKr6H8LP1xiv99ohAFjQZd4NvHnEr3kn+M3hdVYGyA0+
	XkWaoih0C60fPRu18LyOas2uFrOpcim24+4bjasxdG5GLbAQRe+GExdnlgEHSgW8
	YUnioA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4951snmm7m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 11:58:58 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3234811cab3so3677623a91.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 04:58:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757937537; x=1758542337;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O9Y91Mi9c6sVbop+7ZRsi0PmV9tUsrr5aJXQ5MNmIsQ=;
        b=W6AebHscOe0A40M1XLvExVOm8hJHP3ddKAQJ72BaoFdNeWwlwXafRI7qwAK1moLklw
         t1SY1qBw5xZA7aE34qAa7ZNNnbw/O8GFlqmOvx9frn2YnDCk8JL297d5aVti/+ynxp5C
         pY1zeG4t5zhSePCvT5+bcdIdDuP6G9ls4xso+IdGEyRRpqPpbr2/BIye6Ya84MnUHspL
         e+BBe3Q4cvDITTLnaFQHq4BM3jpwghoDh0pXKjUjWvID+sWGji+lUr9UJ7FHYN9CFzot
         nVaUBL6Dwm0bNN9GoAo3MEeoLkhe30wTw1REJJI36PIluZeBF0JXNIgWEraHcmR/J+8l
         S3ng==
X-Forwarded-Encrypted: i=1; AJvYcCVltL3L83mrkqcjT7IpPuPJvDhpSGnyBG+X5Iq+Lfi10W3qzbMwFILiiRpQoSzCak/A9BjNmAt7fuEmKrN4@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1aU1uOzReWfxtI4rV/f4m70xNhVbnjmSnnTl+H59/nwrFOZIv
	PW9tYYpN29ySGDGH0emMCk0hbd14ClgNgwBmQjrI3xfU/RswgXsoc3KjHM6igp4ljtPQpFGo0HM
	OcpMwHHMziUKQWuT69/95ZMqrcNOooI9zYMhODuNavrEY0nfWHBjEGAcpaxYuDor0MkSy
X-Gm-Gg: ASbGncuJQju6O7OxafkTsBEgak+pLz0Uo74h0mcuDRcm45o4Sc2BPGte4q+Kv8Pv61x
	JgROvjktckBfPwjS6Eb6yfmZQHN6tpmyuj59IBLvPnyEqF56oWYInRAyYy4YFR6FzzJI6RMIAXp
	6kLVUgQaG4eerzz4yq/I2D1OMF1kj7/QHRmmbctUYalB6ZPpTbt79/WHFuMCO1F2bc1mUO8rX6R
	pSEwTU+z/lndgwmzXyGz4J7r6l8Io1xGe2LuEsJi55rkBAIRX9nfii1wPteGIoCvxbSE8NycqKb
	mnXHwusVymZ7gwM8N+ZMqLnSYgL9qQtgDBr7xFr+sAY3lFANMEo1nQ==
X-Received: by 2002:a17:90b:5145:b0:32b:9750:10e4 with SMTP id 98e67ed59e1d1-32de4f982b2mr13969939a91.27.1757937537401;
        Mon, 15 Sep 2025 04:58:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGtbghQHq0gu3/yYi4bmubcUDLU1XWygObo3IOE8IqMLklbmQSQgIOtfaHyHtpJVC93qjmZow==
X-Received: by 2002:a17:90b:5145:b0:32b:9750:10e4 with SMTP id 98e67ed59e1d1-32de4f982b2mr13969904a91.27.1757937536906;
        Mon, 15 Sep 2025 04:58:56 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7760793b6b1sm13152436b3a.20.2025.09.15.04.58.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 04:58:56 -0700 (PDT)
Date: Mon, 15 Sep 2025 17:28:51 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>, andrew@lunn.ch
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next] net: phy: qcom: qca808x: Add .get_rate_matching
 support
Message-ID: <aMf/e5GfO9HyU+n0@oss.qualcomm.com>
References: <20250914-qca808x_rate_match-v1-1-0f9e6a331c3b@oss.qualcomm.com>
 <aMcFHGa1zNFyFUeh@shell.armlinux.org.uk>
 <aMfUiBe9gdEAuySZ@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aMfUiBe9gdEAuySZ@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=JO87s9Kb c=1 sm=1 tr=0 ts=68c7ff82 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=P-IC7800AAAA:8 a=trpLnoLhJh18tURxHDYA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-ORIG-GUID: mQte1R9EwLiggb86mduFq4fCeW7SiSDo
X-Proofpoint-GUID: mQte1R9EwLiggb86mduFq4fCeW7SiSDo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDA0MCBTYWx0ZWRfX3/H2K9WflyLr
 UAAtu7HRz0BTfr3SkAahH5TQtteoAo/+zW3iYv86z3RTENPWrYdt92lg5GpQUMWA3FEa44LxbjL
 glwJk+3VIS4wQLscEhw7pgD3UK8TnthZkk+EvvWSY0YE6DmEwpJ+sQadE8JAgxeS6VVqbros+Kl
 bfq7baCwf4RR7aE/0IVYIDXXdxr17FJzUE+uSVjxZsbEQ/Shq4vCVQbM+RfczVyetmPDi9k9kvH
 NawWrvKevEXruhAQEm4yWILcecjt6hXCnwLYPUwOiiTP4JfpCWhOow50+gHs1B/riXpqenU2nwX
 dH+Vmx5bF9sHKItWKpns1sNLt1PbN4vDrG+gGH3jNTE1Gz9XQgeGWqMMe675i8dgSaYBJNDrbP9
 kDjkTmlV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-15_05,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 spamscore=0 clxscore=1015 adultscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509130040

On Mon, Sep 15, 2025 at 02:25:42PM +0530, Mohd Ayaan Anwar wrote:
> On Sun, Sep 14, 2025 at 07:10:36PM +0100, Russell King (Oracle) wrote:
> > On Sun, Sep 14, 2025 at 08:36:48PM +0530, Mohd Ayaan Anwar wrote:
> > > Add support for rate matching to the QCA8081 PHY driver to correctly
> > > report its capabilities. Some boards[0][1] with this PHY currently
> > > report support only for 2.5G.
> > > 
> > > Implement the .get_rate_matching callback to allow phylink to determine
> > > the actual PHY capabilities and report them accurately.
> > 
> > Sorry, but this is incorrect.
> > 
> > The PHY does not support rate matching, but switches between SGMII
> > and 2500BASE-X depending on the negotiated speed according to the code:
> > 
> > static void qca808x_fill_possible_interfaces(struct phy_device *phydev)
> > {
> >         unsigned long *possible = phydev->possible_interfaces;
> > 
> >         __set_bit(PHY_INTERFACE_MODE_SGMII, possible);
> > 
> >         if (!qca808x_is_1g_only(phydev))
> >                 __set_bit(PHY_INTERFACE_MODE_2500BASEX, possible);
> > }
> > 
> > static int qca808x_read_status(struct phy_device *phydev)
> > {
> > ...
> >         if (phydev->link) {
> >                 if (phydev->speed == SPEED_2500)
> >                         phydev->interface = PHY_INTERFACE_MODE_2500BASEX;
> >                 else
> >                         phydev->interface = PHY_INTERFACE_MODE_SGMII;
> >         } else {
> > 
> > The driver certainly does not support rate-matching, even if the PHY
> > can support it, and even with your patch. All you are doing is making
> > ethtool suggest that other speeds are supported, but I think you'll
> > find that if the PHY negotiates those speeds, it won't work.
> > 
> 
> Weirdly, I was able to test both 1G and 2.5G with my patch. Could this
> be because the driver is already deviating from the standard in other
> areas?
> 
> > So, the bug is likely elsewhere, or your ethernet MAC doesn't support
> > SGMII and you need to add complete support for  rate-matching to the
> > driver.
> > 
> 
> I tried setting phy-mode=sgmii in the Devicetree and I am able to get 1G
> and lower speeds to work.
> 
> > Please enable phylink debugging and send the kernel messages so I can
> > see what's going on.
> > 
> 
> Filtered logs (without my patch):
> [    7.937871] qcom-ethqos 23040000.ethernet: IRQ eth_wake_irq not found
> [    7.944581] qcom-ethqos 23040000.ethernet: IRQ eth_lpi not found
> [    7.953753] qcom-ethqos 23040000.ethernet: User ID: 0x20, Synopsys ID: 0x52
> [    7.960927] qcom-ethqos 23040000.ethernet:   DWMAC4/5
> [    7.966049] qcom-ethqos 23040000.ethernet: DMA HW capability register supported
> [    7.973564] qcom-ethqos 23040000.ethernet: RX Checksum Offload Engine supported
> [    7.981073] qcom-ethqos 23040000.ethernet: TX Checksum insertion supported
> [    7.988139] qcom-ethqos 23040000.ethernet: TSO supported
> [    7.993603] qcom-ethqos 23040000.ethernet: Enable RX Mitigation via HW Watchdog Timer
> [    8.001654] qcom-ethqos 23040000.ethernet: Enabled L3L4 Flow TC (entries=8)
> [    8.008817] qcom-ethqos 23040000.ethernet: Enabled RFS Flow TC (entries=10)
> [    8.008819] qcom-ethqos 23040000.ethernet: Enabling HW TC (entries=128, max_off=64)
> [    8.008821] qcom-ethqos 23040000.ethernet: TSO feature enabled
> [    8.008822] qcom-ethqos 23040000.ethernet: SPH feature enabled
> [    8.008824] qcom-ethqos 23040000.ethernet: Using 36/40 bits DMA host/device width
> [    8.243500] qcom-ethqos 23040000.ethernet eth0: Register MEM_TYPE_PAGE_POOL RxQ-0
> [    8.253778] qcom-ethqos 23040000.ethernet eth0: Register MEM_TYPE_PAGE_POOL RxQ-1
> [    8.261991] qcom-ethqos 23040000.ethernet eth0: Register MEM_TYPE_PAGE_POOL RxQ-2
> [    8.262527] qcom-ethqos 23040000.ethernet eth0: Register MEM_TYPE_PAGE_POOL RxQ-3
> [    8.348697] qcom-ethqos 23040000.ethernet eth0: PHY stmmac-0:1c uses interfaces 4,23, validating 23
> [    8.358304] qcom-ethqos 23040000.ethernet eth0:  interface 23 (2500base-x) rate match none supports 6,13-14,47
> [    8.368589] qcom-ethqos 23040000.ethernet eth0: PHY [stmmac-0:1c] driver [Qualcomm QCA8081] (irq=POLL)
> [    8.368595] qcom-ethqos 23040000.ethernet eth0: phy: 2500base-x setting supported 0000000,00000000,00008000,00006040 advertising 0000000,00000000,00008000,00006040
> [    8.381057] qcom-ethqos 23040000.ethernet eth0: Enabling Safety Features
> [    8.416398] qcom-ethqos 23040000.ethernet eth0: IEEE 1588-2008 Advanced Timestamp supported
> [    8.425541] qcom-ethqos 23040000.ethernet eth0: registered PTP clock
> [    8.434778] qcom-ethqos 23040000.ethernet eth0: configuring for phy/2500base-x link mode
> [    8.446169] qcom-ethqos 23040000.ethernet eth0: major config, requested phy/2500base-x
> [    8.454323] qcom-ethqos 23040000.ethernet eth0: interface 2500base-x inband modes: pcs=00 phy=00
> [    8.463353] qcom-ethqos 23040000.ethernet eth0: major config, active phy/outband/2500base-x
> [    8.471939] qcom-ethqos 23040000.ethernet eth0: phylink_mac_config: mode=phy/2500base-x/none adv=0000000,00000000,00000000,00000000 pause=00
> [    8.485780] 8021q: adding VLAN 0 to HW filter on device eth0
> [    8.489653] qcom-ethqos 23040000.ethernet eth0: phy link down 2500base-x/Unknown/Unknown/none/off/nolpi
> [   13.615848] qcom-ethqos 23040000.ethernet eth0: phy link up 2500base-x/2.5Gbps/Full/none/rx/tx/nolpi
> [   13.617924] qcom-ethqos 23040000.ethernet eth0: Link is Up - 2.5Gbps/Full - flow control rx/tx
> 
> // I changed the link partner speed to 1G here:
> [   74.031182] qcom-ethqos 23040000.ethernet eth0: phy link down 2500base-x/Unknown/Unknown/none/off/nolpi
> [   74.031773] qcom-ethqos 23040000.ethernet eth0: Link is Down
> 
> For reference, this board is using the same MAC as [0] which works
> perfectly fine with the AQR115C PHY. I got the (wrong) idea to add
> .get_rate_matching after comparing the two PHY drivers. The MAC driver
> is stmmac/dwmac-qcom-ethqos.c
> 
> 	Ayaan
> ---
> [0] https://elixir.bootlin.com/linux/v6.17-rc5/source/arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dts

Sorry, I missed adding the following.

After checking the phylink logs, I am now wondering if we need to
register a `.get_interfaces` callback in `dwmac-qcom-ethqos.c` and
do something like:

case PHY_INTERFACE_MODE_2500BASEX:
	__set_bit(PHY_INTERFACE_MODE_2500BASEX, interfaces);
	fallthrough;
case PHY_INTERFACE_MODE_SGMII:
	__set_bit(PHY_INTERFACE_MODE_SGMII, interfaces);
	break;
...

This is based on my limited understanding, so I’d love to hear your
thoughts.

	Ayaan

