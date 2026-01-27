Return-Path: <linux-arm-msm+bounces-90796-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QOg+OYTSeGmNtQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90796-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 15:58:12 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B45896290
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 15:58:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 475493017031
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 14:58:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7C233587C2;
	Tue, 27 Jan 2026 14:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JfZPlapf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HSWOQrAz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F38D355057
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 14:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769525882; cv=none; b=ezAq3FDV6BvCIVSmX1ZYH2LOHsfdrGmnpSaWUhDTotdRWVPKLZjh8pdiptlf9VA94L28SV7V9PCTazAOuIkAN35Y4GcSy/jrzbDOLPoe3axmR1Tv+E+8b6aY1W2QYC0ZlFWiUQUGVAtij6NfMWI8RwhuNGunepVWrBYiU9LYm1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769525882; c=relaxed/simple;
	bh=T4S6WxgnOOkIwtltJ63CUwFYdV3gHvItd3PvplcsZt8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JoikOrVK/Qh1Abf9fLiUQ3tCkI0pnfMIjcCtOaPzgOogI5Zvf3yBCPluBvaLvJIuXN8bZz1bfeGjwSceJQn2ppqaD7PklQHZ7Ncg37KdswZhi6SfnBqDtLtggz4iHTJVEcRb8jAGEboroHd186Gi1bMBWCQtJ7v0IydocmYeAiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JfZPlapf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HSWOQrAz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60R87Pdb2379408
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 14:58:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=LWpVchwqvdGyEWC9dq5KQLLm
	6bzYdAUNcEvylYGhyMk=; b=JfZPlapfYbLDmW8jIqIUG1zzsRs6BdzYsI20J1Ga
	vpqifUaODyp/EbBsE7VGur1lPvpwW2LyLCCFu9I9wj22Hc9AhTiXQrKopV5k0Teq
	R2GHzgjEQhEZnhP/yJV39yPxTvSDUm3uEQXB8csExTNm5EFWRdThOxM2rIRWZjSF
	lgmeGNIPVSSdJYSop2kWFXzJgUBarZXUnJMiTbjdzPTUWIl7z3yKiORpQP41xppw
	2UW04TuaCRTUoHoF9aX7whiNoViKOmS5QqbJZe6DyAvoRmxvYgOWzrpfyNfBujJ1
	jO40wm+ddDMn7K30vv0vgDucLij7LxCP8PCy5FRB8JEDuQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxsjr99p2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 14:58:00 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-352c7f19acaso4423763a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 06:58:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769525880; x=1770130680; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LWpVchwqvdGyEWC9dq5KQLLm6bzYdAUNcEvylYGhyMk=;
        b=HSWOQrAzng4uCWEmIj/NUMGol5TxFKfPG9m32MuWU9N/IwYfgAEZg75BhGtBOg/Tdg
         REMwNE7/kN1/CNdm+0tYX5MN9nTA7L9rGFr9IWyOvTgffCVxdV1AqZodn+fmRUqCewQ2
         mszH8epY8KVnrkjICSTTUVJPOegKR3GPday8ckbuYbdysCDf8TS/LRj6qbRY5wmvYbMO
         NhCPPc6/cjeCDkWJGIrBFNNOvb7G55AlhOCO9Fli9yde2fZpuPhMNyt+Akq2Ab0cKX5y
         uOc3vkmdTjRgDOU6CDYmHPoVJRyDmAzrdml5/VaDYSNpbOIOpjpSIPRPN7jRDS0aV/Ha
         PM+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769525880; x=1770130680;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LWpVchwqvdGyEWC9dq5KQLLm6bzYdAUNcEvylYGhyMk=;
        b=u7DoGjvjK/vn5p0ijyZjCsVWHqnuyJXn2A8EWVKCIPrFh5Lwo2TxRaMv05EN0mRfQZ
         vTeWPuSTAsnRjwTuBgAiPiv/vzPvjizeahZLw3H0+3bREbYHilgQg6+rcEzrSXKMdNpc
         gpDQTZ0r98SSEJT1vucZYsIbZk4YDOLMGf2SEysyxG9g492ILj+H8n/FVxAZ4DpIYGsm
         GoEvtUmOuZqiiUiUIta2lYMJVrtKA/05PYlthAgJ2649pQ/H+bpBQ5ub4cFlqAk4XO+N
         zxDYTjdx6K6gkeFBuaexHgIa4Og7DvE7lWwtz/DU21m9po0E2qrr5U88SLS1JaaCgNxQ
         WEDQ==
X-Forwarded-Encrypted: i=1; AJvYcCVfEj9F3DijGHqbSSvLtk0/Mjqa33TItsThwgekLn3VJToNcMHBbMIpkeX9pv0vuVj+shH/qcR+dRqy04iV@vger.kernel.org
X-Gm-Message-State: AOJu0YxxqoKN09su1lOztYiq1ZdjCi2R7JOgP9t6mr8FC+6BObCzcUlt
	gqu4MzMex+TvulfN8YESvx1FTuEK3tGJM7j6VgCXFjwOwn/hPFSO7zzr6yrWFQ/vvALSSzcnnwe
	ZP8aG3EURj/sp5oqCQdmnjdTQmyBwXWAAgph0sljki9J6ggRY8f/p+PlNIvMzkTu4Pq21
X-Gm-Gg: AZuq6aI79E6AQHJj+GbfnqMN0+iLn9bRuHJ5LsvM0L5jQVXJux+SVOzquicuGBVO9gW
	MfFzTrvSM4jHdVNbS0orlhQQh317wVmXDfGWDTuOrKFZpuEufn8yHRCpfdCTS5LPN0UGfuP6RH3
	Ga4p3YkWFew6huT75alo8LBpzb31QjaUIgLx5pfBezNDhEC3uCuU96AfGFBq75aRkj7y57NcZX8
	0r0c8zPQKlRToM2rtsV/s1ruSyMf5V7G3uSqbYaT6XC0H0wOe9V8+jgSSq0Oh+BZqS7YZDSFmv+
	FBzG5NNMD0UWQzirFk7BvzlxE8EXBKEsX2H7LT92tZMrVLfc79P3py1oCEDRmm3S47AIKZQpYF8
	gF57ex4u3cMgBOaRebVimNAQ=
X-Received: by 2002:a17:90b:5627:b0:34a:47d0:9a82 with SMTP id 98e67ed59e1d1-353fed70718mr2006708a91.23.1769525879753;
        Tue, 27 Jan 2026 06:57:59 -0800 (PST)
X-Received: by 2002:a17:90b:5627:b0:34a:47d0:9a82 with SMTP id 98e67ed59e1d1-353fed70718mr2006667a91.23.1769525878954;
        Tue, 27 Jan 2026 06:57:58 -0800 (PST)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3536b050e08sm4712102a91.1.2026.01.27.06.57.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 06:57:58 -0800 (PST)
Date: Tue, 27 Jan 2026 20:27:50 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Neil Armstrong <neil.armstrong@linaro.org>, netdev@vger.kernel.org,
        Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH net-next v2 00/14] net: stmmac: SerDes, PCS, BASE-X, and
 inband goodies
Message-ID: <aXjSbu6L6ICYOPiJ@oss.qualcomm.com>
References: <aXNEwBW3OA1xLEUj@shell.armlinux.org.uk>
 <aXN5BFXMshnhwBQ7@oss.qualcomm.com>
 <aXPo5R1Q-qWG3r3l@shell.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aXPo5R1Q-qWG3r3l@shell.armlinux.org.uk>
X-Proofpoint-GUID: tlxmg0LIdz3uzJmwGWSVQlNzCBXIyj-M
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDEyMyBTYWx0ZWRfX1WIoBauC614A
 pAU9vwFQ76J9FXo3+Jk4H2mh9CMT2OW+uwfQ6NGIf/xf9/1XFD6T4iBUBK64AS40XZlP/CN2Wjd
 E9VPg0D32sF4WKM4PAyQBfx+vHOS2V+5Di1O3636JXEO+QzXtQOGFHxqvUCNCfppZchNTUgHovX
 KLJ/JdtgepAWPnkV3NXHwkNewOR1icgv9y7qwmmg4irp3Hb6Vv5uLrcKPSWLiF2cMvTFZMJpHbc
 wgW1Xa4/AHMtixfo9F4tM7YS4A/ch6O37nBLbooGrhNGJQC5PDtHEaiXVs4EfchZRTSNyl8ZcX1
 y1X9u1EyKdDXkFn/FadAkBgRLPVdvQYOl74EpWMfL4in2/rY9JHwwduIs4yPr/OssbuWMqNlmWY
 DcBHofTfHidY7xXHb18N3NkZGSGcL7KwoeJF5DC29XWTJY8USWwWIxbdY+bCI5ai6qoZuUgUQYE
 L7t3yz0Oteo9qShVtcA==
X-Authority-Analysis: v=2.4 cv=b+i/I9Gx c=1 sm=1 tr=0 ts=6978d278 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=-kEnI-koradUIOcFO3kA:9 a=CjuIK1q_8ugA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: tlxmg0LIdz3uzJmwGWSVQlNzCBXIyj-M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_03,2026-01-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 impostorscore=0 bulkscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270123
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lunn.ch,gmail.com,foss.st.com,davemloft.net,google.com,kernel.org,oss.qualcomm.com,lists.infradead.org,vger.kernel.org,st-md-mailman.stormreply.com,linaro.org,redhat.com];
	TAGGED_FROM(0.00)[bounces-90796-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mohd.anwar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4B45896290
X-Rspamd-Action: no action

On Fri, Jan 23, 2026 at 09:32:21PM +0000, Russell King (Oracle) wrote:
> 
> and the failing store is the one for that last line of C code - in
> other words, pcs = NULL.
> 
> This means that mac_select_pcs() returned NULL when being asked
> "which PCS should be used for 2500base-X" ?
> 
> This suggests that the SerDes detection of support for 2500BASE-X
> isn't working, meaning that stmmac_mac_select_pcs() ends up returning
> NULL, rather than &priv->integrated_pcs->pcs.
> 
> That would only happen if:
> 
>                 /* Only allow 2500Base-X if the SerDes has support. */
>                 ret = dwmac_serdes_validate(priv, PHY_INTERFACE_MODE_2500BASEX);
>                 if (ret == 0)
>                         __set_bit(PHY_INTERFACE_MODE_2500BASEX,
>                                   spcs->pcs.supported_interfaces);
> 
> fails, meaning we don't set that interface mode for the PCS.
> dwmac_serdes_validate() calls phy_validate() for PHY_MODE_ETHERNET
> with the PHY interface mode as the sub mode.
> 
> Patch 3 adds the required methods to phy-qcom-sgmii-eth.c to allow
> phy_validate() to indicate whether this is supported or not:
> 
>         .validate       = qcom_dwmac_sgmii_phy_validate,
> 
> and its implementation is:
> 
>         int ret = qcom_dwmac_sgmii_phy_speed(mode, submode);
> 
>         return ret < 0 ? ret : 0;
> 
> where qcom_dwmac_sgmii_phy_speed() is:
> 
>         if (mode != PHY_MODE_ETHERNET)
>                 return -EINVAL;
> 
>         if (submode == PHY_INTERFACE_MODE_SGMII ||
>             submode == PHY_INTERFACE_MODE_1000BASEX)
>                 return SPEED_1000;
> 
>         if (submode == PHY_INTERFACE_MODE_2500BASEX)
>                 return SPEED_2500;
> 
>         return -EINVAL;
> 
> So, this should be returning a positive integer (SPEED_2500), which
> should cause phy_validate(serdes, PHY_MODE_ETHERNET,
> PHY_INTERFACE_MODE_2500BASEX, NULL) to return success (zero). That
> should result in PHY_INTERFACE_MODE_2500BASEX being set in
> spcs->pcs.supported_interfaces, and thus &priv->integrated_pcs->pcs
> being returned for PHY_INTERFACE_MODE_2500BASEX.
> 
> Is the particular hardware you're running this oopsing test on not
> using a SerDes PHY? If that's the case, how does it switch between
> 2.5Gbps and 1Gbps data rate on the SerDes?
> 

It is using the same SerDes PHY (qcom_dwmac_sgmii_phy_driver).

I added additional debug prints, and I think the crash is due to
BMSR_ESTATEN not being set in GMAC_AN_STATUS.

During pcs_init, BIT(8) of GMAC_AN_STATUS is 0:
[    7.985913] [DBG] GMAC_AN_STATUS = 8

Therefore, this check:
	if (readl(spcs->base + GMAC_AN_STATUS) & BMSR_ESTATEN) {
		__set_bit(PHY_INTERFACE_MODE_1000BASEX,
			  spcs->pcs.supported_interfaces);

		/* Only allow 2500Base-X if the SerDes has support. */
		ret = dwmac_serdes_validate(priv, PHY_INTERFACE_MODE_2500BASEX);
		if (ret == 0)
			__set_bit(PHY_INTERFACE_MODE_2500BASEX,
				  spcs->pcs.supported_interfaces);
	}
fails, and PHY_INTERFACE_MODE_2500BASEX never gets set in
pcs.supported_interfaces. Pardon my naivete, but does the
BMSR_ESTATEN bit not being set break some standard?

If I remove the check, the NULL pointer dereference is not observed
anymore. Although the SerDes link is still unstable.

I also tried enabling comma detect during dwmac_integrated_pcs_config,
but I am still seeing the Tx timeouts. I remember that when I had
tested the patches in October (without the SerDes driver changes),
the link state used to flap, but the data path became functional
after the link stabilized.

	Ayaan

---
Full Logs (Speed Change: 1G -> 2.5G)
[  244.817499] qcom-ethqos 23040000.ethernet eth1: pcs link down
[  257.066210] dwmac: PCS configuration changed from phylink by glue, please report: 0x00040000 -> 0x00041000
[  257.076143] dwmac:      ANE 0 -> 1
[  257.079668] qcom-ethqos 23040000.ethernet eth1: Link is Up - 1Gbps/Full - flow control off
[  264.260852] qcom-ethqos 23040000.ethernet eth1: NETDEV WATCHDOG: CPU: 7: transmit queue 3 timed out 5472 ms
[  264.271394] qcom-ethqos 23040000.ethernet eth1: Reset adapter.
[  264.280493] qcom-ethqos 23040000.ethernet eth1: phy link down 2500base-x/Unknown/Unknown/none/off/nolpi
[  264.842309] qcom-ethqos 23040000.ethernet eth1: Timeout accessing MAC_VLAN_Tag_Filter
[  264.850391] qcom-ethqos 23040000.ethernet eth1: failed to kill vid 0081/0
[  264.857547] qcom-ethqos 23040000.ethernet eth1: Register MEM_TYPE_PAGE_POOL RxQ-0
[  264.865795] qcom-ethqos 23040000.ethernet eth1: Register MEM_TYPE_PAGE_POOL RxQ-1
[  264.873939] qcom-ethqos 23040000.ethernet eth1: Register MEM_TYPE_PAGE_POOL RxQ-2
[  264.882111] qcom-ethqos 23040000.ethernet eth1: Register MEM_TYPE_PAGE_POOL RxQ-3
[  265.792807] qcom-ethqos 23040000.ethernet eth1: PHY stmmac-0:08 uses interfaces 4,23,27, validating 23
[  265.802389] [DBG] stmmac_mac_select_pcs - testing for 23 (2500base-x) on priv->integrated_pcs->pcs.supported_interfaces = 4
[  265.802399] qcom-ethqos 23040000.ethernet eth1:  interface 23 (2500base-x) rate match pause supports 0-7,9,13-14,47
[  265.824572] qcom-ethqos 23040000.ethernet eth1: PHY [stmmac-0:08] driver [Aquantia AQR115C] (irq=334)
[  265.834055] qcom-ethqos 23040000.ethernet eth1: phy: sgmii setting supported 00000000,00000000,00008000,000062ff advertising 00000000,00000000,00008000,000062ff
[  265.852828] [DBG] qcom_dwmac_sgmii_phy_speed called with mode=15, submode=4
[  265.852837] [DBG] qcom_dwmac_sgmii_phy_validate - qcom_dwmac_sgmii_phy_speed returned 1000
[  265.868580] qcom-ethqos 23040000.ethernet eth1: Enabling Safety Features
[  265.884237] qcom-ethqos 23040000.ethernet eth1: IEEE 1588-2008 Advanced Timestamp supported
[  265.893946] qcom-ethqos 23040000.ethernet eth1: registered PTP clock
[  265.900561] qcom-ethqos 23040000.ethernet eth1: configuring for phy/sgmii link mode
[  265.908451] qcom-ethqos 23040000.ethernet eth1: major config, requested phy/sgmii
[  265.916159] [DBG] stmmac_mac_select_pcs - testing for 4 (sgmii) on priv->integrated_pcs->pcs.supported_interfaces = 4
[  265.916166] qcom-ethqos 23040000.ethernet eth1: interface sgmii inband modes: pcs=03 phy=03
[  265.935652] qcom-ethqos 23040000.ethernet eth1: major config, active phy/outband/sgmii
[  265.943795] qcom-ethqos 23040000.ethernet eth1: phylink_mac_config: mode=phy/sgmii/none adv=00000000,00000000,00000000,00000000 pause=00
[  265.956407] [DBG] qcom_dwmac_sgmii_phy_speed called with mode=15, submode=4
[  265.956408] [DBG] qcom_dwmac_sgmii_phy_set_mode - qcom_dwmac_sgmii_phy_speed returned 1000
[  265.976997] qcom-ethqos 23040000.ethernet eth1: phy link down 2500base-x/Unknown/Unknown/none/off/nolpi
[  270.556001] qcom-ethqos 23040000.ethernet eth1: phy link up 2500base-x/2.5Gbps/Full/none/off/nolpi
[  270.567649] qcom-ethqos 23040000.ethernet eth1: major config, requested phy/2500base-x
[  270.575823] [DBG] stmmac_mac_select_pcs - testing for 23 (2500base-x) on priv->integrated_pcs->pcs.supported_interfaces = 4
[  270.575831] qcom-ethqos 23040000.ethernet eth1: mac_select_pcs returned NULL
[  270.594521] qcom-ethqos 23040000.ethernet eth1: interface 2500base-x inband modes: pcs=00 phy=00
[  270.603554] qcom-ethqos 23040000.ethernet eth1: major config, active phy/outband/2500base-x
[  270.612286] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000010


