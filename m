Return-Path: <linux-arm-msm+bounces-97746-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CJgRF79Et2lKPAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97746-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 00:46:07 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AEC0B29307E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 00:46:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0E0C530086DA
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Mar 2026 23:46:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98B3D218ACC;
	Sun, 15 Mar 2026 23:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HjieKR2N";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hM9ZxIMH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E90E2770A
	for <linux-arm-msm@vger.kernel.org>; Sun, 15 Mar 2026 23:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773618364; cv=none; b=K8957YWDlzNJkX3mhuPbAXSseqQdUUrE5xunaAXkNnm2KHJh/Q4QOOKyMRcJpja2FSQYjiUVY8CaYv+NgUlN5oTl6dTx+2sGlLfXjbSXdsLHYaOnUD6W/NXiMMSgAPujWNiZiUVYUNgzuZpc5+6/YCqEvp2eIGmL9uNFWgU68YI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773618364; c=relaxed/simple;
	bh=KdFDrr71J8LoR2xT035mhXyIlBgN5GbB8uEGxEEj/Uw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tte03zFKRGkgTYYWdcDJRz45sJBy5WJnsVvybh3owPmSJz7qIVBrwYHKQyvXFd+9V84oWxin6C9YPzh16MyEImY1PEVYQc6OEfQffDokUxXIsE6605tBFsqepC9ecp6xhL8Kpv+EusaAJGy1+CgDWJcBaYO+QOMnvytdXjkPPXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HjieKR2N; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hM9ZxIMH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62FKwT2i133963
	for <linux-arm-msm@vger.kernel.org>; Sun, 15 Mar 2026 23:46:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=jtCQPLyj84+GsPspBnbaXy0y
	TRP7zEyOqjhe8ajtp8U=; b=HjieKR2NHTaR0CwoSzqXoqYE6PRpZxOASHyaEDNH
	QFshIG5NlEVem27vTrGoaT878Ez1LcvJ5yroYihhQSlIfIsb4SWjehyOFqvFrggo
	Kv3mt9KXQ9KPGVabe9T3vdIBUbyFvgN58FgzvPMxSgQAq+KxdmqwxDTVgF0DFqvk
	kbQX0mkdZ/VYLq+QoT/R6wGACbbqXQxMP8qdfdT6Pah6uXNZR2S83++I+2/tKUYD
	i4Gy2/SOAou9iJepI5mvkigfvpADUZsiI5wgfczhOQxjnzrE1h4o+eXNjuOkl5FH
	Rcvg1kTObzAPWjcdiosC37p/YSrV8bfWCOw//vG07RXvjg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvyyc3drx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 15 Mar 2026 23:46:02 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b6097ca315bso21476967a12.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 15 Mar 2026 16:46:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773618361; x=1774223161; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jtCQPLyj84+GsPspBnbaXy0yTRP7zEyOqjhe8ajtp8U=;
        b=hM9ZxIMHH6DMGF5C1ZK24p/p5W0H0OxJLn6nSQtXBt7o98to1YUM4PDJhYPfW+TK13
         UNDrlFWIjkV+jAaw6QqFVYx2jnMUKLmvhq2mlbjbj9uWJ4hrIuZ+br374uMszuuC0dbo
         UG3HTL5dzOLBrgpsfOyXwGv+g472oUkFtMEafjX7Cp0LxMFIl5nqKKUl5LCrKt3qhTE3
         xOJRZZZI5ytJm2typsvnjjl4yS9U69Ia91J2YCxRGtX7sFD/cKvlZnyA00Pm+ztuE/OX
         rZmOED6zYVM1zy8PbktasJJGpwTrjDjiYWNys9sOF1Ff7znMr3n5TmfRmTGWVyM6UQCM
         CffA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773618361; x=1774223161;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jtCQPLyj84+GsPspBnbaXy0yTRP7zEyOqjhe8ajtp8U=;
        b=ipOqZ350uv483yeF9pEW35/RmQqE+dA3Xyxd81l+N5w0cNh51rNwtn1MxiUCNsvmka
         Ha7eXPyFxPxGRNFvmUekqV9uA0XDTEE+v0soxlIyFtFFPWVj/VXXxa7Ykg4T6PKDHAng
         xUqxQ+4h4V0aRxbG8SkQr9st4Cp791ocmADsEAPKuDScgyhmd9pLs7ELi/bDdfeVCdFd
         SZSpIpwcLQ6+LIaMKipVKW/GVCcczCEvQoVtyX3aLT/qajQX0ftHVxwFzFBZVGnnjGwD
         qBfO4Sitzm7GSGyc/G1TLulrGbi9jj1rkA3AhAhX65v7rcJJrIkN8TnT394MvzU5V56A
         Yq0Q==
X-Forwarded-Encrypted: i=1; AJvYcCWEBgLKQ1KFsut8bYw29MBy4TCYszIWFVc3nkmWQtv5lfZnWUy3Uualhpd6EVGP4mTGrQTe2l7FTKaQOlAb@vger.kernel.org
X-Gm-Message-State: AOJu0YzSoiMutaKG2Bmf/9kyDRkHRupM+QlQQX+f7gyrYFsYwv0h2zeS
	zMKpySPJr73Ld8w+KCGFUxU9tGQ71P0GZWMgcnx+0+cncWMVojYZlqsn6s7rk8EGX8W8KywQxGi
	YyIjjBIMX67Dy49QjRz6JxFXMrMeghxSgnpt+44KdECXG7eugCG2UbPAYdlPz4XC79Xdc
X-Gm-Gg: ATEYQzw0492SuxYzLjBmlnSbz6yUEHsiypUA22ulW1CnEofJ9yNH/hS+Tsp+8w9DGD1
	Ic2o8bV6sN0rxiljL8uu5bo3aiDih56GLaQhxrnnpb5yejzScAVqlhzIMGEOnUDGfgzRNUef8WV
	CNWkG3F5Wgec0PXLkrwrQwqEdn4GjgvNjQMsceIyH7L9CTwsLmwiHC/rLGyehfZe7FR6BFm+4KU
	8DBFmINaRTmTKeg1yBeher4yi5PPM1iEboYJ8HGdnYt1e9elPCDL6WpInmR0Pjwn7EIBzfzV4LQ
	ss2Y0SsNbt4sDs23Ws04weU2essxAipvLRf0IQUyM9To93dIDK6mnK9D8MnG3sYMvDGbxi8XPQG
	GWq0iP5+jTkFIxy/QCsInecFBF5mJdErPPyE=
X-Received: by 2002:a05:6a00:1a93:b0:829:793f:da6c with SMTP id d2e1a72fcca58-82a19899de0mr9844289b3a.39.1773618361037;
        Sun, 15 Mar 2026 16:46:01 -0700 (PDT)
X-Received: by 2002:a05:6a00:1a93:b0:829:793f:da6c with SMTP id d2e1a72fcca58-82a19899de0mr9844265b3a.39.1773618360324;
        Sun, 15 Mar 2026 16:46:00 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a073b1d29sm11455561b3a.63.2026.03.15.16.45.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 16:45:59 -0700 (PDT)
Date: Mon, 16 Mar 2026 05:15:53 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org,
        Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH net-next 0/8] net: stmmac: improve PCS support
Message-ID: <abdEscs44fU4kRag@oss.qualcomm.com>
References: <abQC7r38QLhSeadl@shell.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <abQC7r38QLhSeadl@shell.armlinux.org.uk>
X-Authority-Analysis: v=2.4 cv=euXSD4pX c=1 sm=1 tr=0 ts=69b744ba cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=LzynlxIp8I5r7-4e--YA:9 a=CjuIK1q_8ugA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: 3YRlgupb2bRI0pwBRvT1ssRGeTXfMk3L
X-Proofpoint-ORIG-GUID: 3YRlgupb2bRI0pwBRvT1ssRGeTXfMk3L
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE1MDE4OSBTYWx0ZWRfXzrzZiCw65Oea
 3XkRMUwp5FJ26jHng1++p+yHExZPdz6HCiZqR9eQUkwSzNX4iiptZY1u2sJFc2JjB/Bt096qVkv
 DCS8BcONWc4lKxQY8qZOv/J6I5g2d4Ki1Zk+FbGGSMfHpruLFzup2W0fs4uMlVXEXBeHI4e+bc3
 HAKtvpRTxY74Cu8xXrnPiqMb0fGdKKwN05TAtc38x9IKDMAzu0RhYUGzPSHikim3FO+17Mi0Fd0
 y1ZubDSl/zFpzm1c+1a30ZVm3o6o/Ymed/Z3Dh3NajQyyODGkFFY0TTPC99Z8CnmczRqJEZ7902
 3rfgy6IBk+jcfIrJ/7OwNveNyBiFSvapcsjgB9R+EAS748fKZ2D8iKVIqCbtBzVfmchwNwsrqdA
 OxOVRN570nMRAarw/L60gQ8geEWm633CbpyV698C0qpuaoP77plyzPjWqTMCleAiwclMOVIl7gl
 H8lmLB5WvoYCAlHvK8g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-15_08,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 malwarescore=0 spamscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603150189
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97746-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mohd.anwar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: AEC0B29307E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Russell,
On Fri, Mar 13, 2026 at 12:28:30PM +0000, Russell King (Oracle) wrote:
> This series is the next of the three part series sorting out the PCS
> support in stmmac, building on part 2:
> 
> 	net: stmmac: qcom-ethqos: further serdes reorganisation
> 
> Similar patches have been posted previously. This series does away with
> the common SerDes PHY support, instead using a flag to indicate whether
> 2500Mbps mode is supported (STMMAC_FLAG_SERDES_SUPPORTS_2500M.) At this
> time, I have no plans to resurect the common SerDes PHY support - the
> generic PHY layer implementations are just too random to consider that,
> and I certainly do not want the extra work of fixing that.
> 
> Changes from RFC v3:
> - only set default_an_inband if using SGMII/2500BASE-X mode.
>

I encountered two NULL pointer dereferences and had to add a few
workarounds to proceed with testing.

1. On QCS9100 Ride R3, the mdio subnode is only defined for ethernet0
   (see lemans-ride-ethernet-aqr115c.dtsi). ethernet1 uses ethernet0's
   MDIO bus, so plat_dat->mdio_bus_data is NULL for ethernet1. Therefore,
   we get:
	[    9.205979] Hardware name: Qualcomm Technologies, Inc. Lemans Ride Rev3 (DT)
	[    9.221071] pc : qcom_ethqos_probe+0xc4/0x478 [dwmac_qcom_ethqos]
	[    9.221078] lr : qcom_ethqos_probe+0x7c/0x478 [dwmac_qcom_ethqos]
	[    9.221080] sp : ffff800081aa37f0
	[    9.221081] x29: ffff800081aa3860 x28: ffffcf84de69cfe8 x27: 0000000000000001
	[    9.221084] x26: 0000000000000000 x25: ffff0000b4577c80 x24: ffff0000818fd010
	[    9.221087] x23: ffff000ec7057628 x22: 0000000000000000 x21: ffffcf84ca2ce028
	[    9.221089] x20: ffff0000818fd000
	[    9.236975]  x19: ffff0000b3301740 x18: 00000000ffffffff
	[    9.236977] x17: 0000000000000000 x16: ffffcf84dc4a5448 x15: ffff0000b3301ec5
	[    9.236980] x14: 0000000000000000 x13: 0000000000000030 x12: 0101010101010101
	[    9.236982] x11: 7f7f7f7f7f7f7f7f x10: 00000000001305b0 x9 : 0000000000000000
	[    9.236984] x8 : ffff0000b3301780 x7 : 0000000000000000 x6 : 000000000000003f
	[    9.236986] x5 : 0000000000000040 x4 : 0000000000000000 x3 : ffff0000818fd210
	[    9.236988] x2 : 0000000000000017 x1 : 0000000000000000 x0 : 0000000000000001
	[    9.236991] Call trace:
	[    9.236991]  qcom_ethqos_probe+0xc4/0x478 [dwmac_qcom_ethqos] (P)
	[    9.236994]  platform_probe+0x5c/0xac
				...
	[    9.343300] Code: 910a7000 f9400b21 f9010320 52800020 (39005420)
	[    9.343302] ---[ end trace 0000000000000000 ]---

   I added the following workaround:
	--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
	+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
	@@ -765,7 +767,10 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
			case PHY_INTERFACE_MODE_SGMII:
					ethqos->configure_func = ethqos_configure_sgmii;
					plat_dat->mac_finish = ethqos_mac_finish_serdes;
	-               plat_dat->mdio_bus_data->default_an_inband = true;
	+               if (plat_dat->mdio_bus_data)
	+                       plat_dat->mdio_bus_data->default_an_inband = true;
	+               else
	+                       dev_err(dev, "plat_dat->mdio_bus_data is NULL");
					break;
			default:
					dev_err(dev, "Unsupported phy mode %s\n",

2. After working around issue 1, I hit the following:
	[   27.822907] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000000
	[   27.831944] Mem abort info:
	[   27.834832]   ESR = 0x0000000086000006
	[   27.838693]   EC = 0x21: IABT (current EL), IL = 32 bits
	[   27.844163]   SET = 0, FnV = 0
	[   27.847320]   EA = 0, S1PTW = 0
	[   27.850563]   FSC = 0x06: level 2 translation fault
	[   27.855587] user pgtable: 4k pages, 48-bit VAs, pgdp=0000000134b1c000
	[   27.862212] [0000000000000000] pgd=080000010185c403, p4d=080000010185c403, pud=0800000134884403, pmd=0000000000000000
	[   27.873107] Internal error: Oops: 0000000086000006 [#1]  SMP
	[   28.001619] Hardware name: Qualcomm Technologies, Inc. Lemans Ride Rev3 (DT)
	[   28.008853] pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
	[   28.016001] pc : 0x0
	[   28.018259] lr : phylink_pcs_an_restart+0x50/0x5c
	[   28.023092] sp : ffff8000869fb900
				...
	[   28.185967] ---[ end trace 0000000000000000 ]---

   This occurs due to pl->pcs->ops->pcs_an_restart being NULL. I added
   the following workaround:
	--- a/drivers/net/phy/phylink.c
	+++ b/drivers/net/phy/phylink.c
	@@ -1026,7 +1026,8 @@ static void phylink_pcs_an_restart(struct phylink *pl)
			if (pl->pcs && linkmode_test_bit(ETHTOOL_LINK_MODE_Autoneg_BIT,
							 pl->link_config.advertising) &&
			    phy_interface_mode_is_8023z(pl->link_config.interface) &&
	-		    phylink_autoneg_inband(pl->act_link_an_mode))
	+		    phylink_autoneg_inband(pl->act_link_an_mode) &&
	+		    pl->pcs->ops->pcs_an_restart)
					pl->pcs->ops->pcs_an_restart(pl->pcs);
	 }

3. With the recent VLAN filter changes in net-next, ndo_open takes a long
   time to complete as vlan_restore_hw_rx_fltr() tries to write filters
   for all 32 indices. This board previously timed out once, but now
   times out for each index. This is a separate issue unrelated to this
   series but I added the following workaround to rule out any timing
   issues.
	--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_vlan.c
	+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_vlan.c
	@@ -158,7 +158,8 @@ static void vlan_restore_hw_rx_fltr(struct net_device *dev,

			/* Extended Rx VLAN Filter Enable */
			for (i = 0; i < hw->num_vlan; i++)
	-               vlan_write_filter(dev, hw, i, hw->vlan_filter[i]);
	+               if (hw->vlan_filter[i])
	+                       vlan_write_filter(dev, hw, i, hw->vlan_filter[i]);
	 }

	 static void vlan_update_hash(struct mac_device_info *hw, u32 hash,


With the above workarounds in place, 2.5G works fine, but 1G (and 100M)
do not. With the RFC v1 series, only the 2.5G->1G speed change was
broken. With this series, the link does not come up at 1G at all.

Some observations from my failed attempt at debugging so far:
 - No change in behaviour after adding the provisioning code in
   aqr_gen4_config_init().
 - Setting GMAC_AN_CTRL_RAN in dwmac_integrated_pcs_config() did not
   help.
 - After shifting to 1G, GMAC_AN_STATUS reads 0x00000008, i.e.,
   BMSR_LSTATUS (bit 2) is clear. 


Sharing logs for two 1G scenarios (net-next + this series + the three
workarounds above):

# Booting up with a 1G link
	[    8.730854] qcom-ethqos 23040000.ethernet: IRQ eth_wake_irq not found
	[    8.766778] qcom-ethqos 23040000.ethernet: User ID: 0x20, Synopsys ID: 0x52
	[    8.780465] qcom-ethqos 23040000.ethernet:   DWMAC4/5
	[    8.794253] qcom-ethqos 23040000.ethernet: DMA HW capability register supported
	[    8.794258] qcom-ethqos 23040000.ethernet: Active PHY interface: SGMII (2)
	<snip>
	[    8.865690] qcom-ethqos 23040000.ethernet: Using 36/40 bits DMA host/device width
	[    8.865707] qcom-ethqos 23040000.ethernet: clk_csr value out of range (0xffffff00 exceeds mask 0x00000f00), truncating
	[   10.860749] qcom-ethqos 23040000.ethernet eth1: Register MEM_TYPE_PAGE_POOL RxQ-0
	[   10.861119] qcom-ethqos 23040000.ethernet eth1: Register MEM_TYPE_PAGE_POOL RxQ-1
	[   10.861510] qcom-ethqos 23040000.ethernet eth1: Register MEM_TYPE_PAGE_POOL RxQ-2
	[   10.861906] qcom-ethqos 23040000.ethernet eth1: Register MEM_TYPE_PAGE_POOL RxQ-3
	[   10.871763] qcom-ethqos 23040000.ethernet eth1: Enabling Safety Features
	[   10.907513] qcom-ethqos 23040000.ethernet eth1: IEEE 1588-2008 Advanced Timestamp supported
	[   10.921216] qcom-ethqos 23040000.ethernet eth1: registered PTP clock
	[   10.921220] qcom-ethqos 23040000.ethernet eth1: configuring for inband/2500base-x link mode
	[   10.921223] qcom-ethqos 23040000.ethernet eth1: major config, requested inband/2500base-x
	[   10.921226] qcom-ethqos 23040000.ethernet eth1: interface 2500base-x inband modes: pcs=01 phy=00
	[   10.921228] qcom-ethqos 23040000.ethernet eth1: major config, active inband/inband,an-disabled/2500base-x
	[   10.921230] qcom-ethqos 23040000.ethernet eth1: phylink_mac_config: mode=inband/2500base-x/none adv=00000000,00000000,00008000,0000e240 pause=04

No further messages appear after this point, and the link does not come
up at 1G.

# Switching from 2.5G to 1G
	[    8.368113] qcom-ethqos 23040000.ethernet: IRQ eth_wake_irq not found
	[    8.379601] qcom-ethqos 23040000.ethernet: User ID: 0x20, Synopsys ID: 0x52
	[    8.392900] qcom-ethqos 23040000.ethernet:   DWMAC4/5
	[    8.432379] qcom-ethqos 23040000.ethernet: DMA HW capability register supported
	<snip>
	[    8.480319] qcom-ethqos 23040000.ethernet: Using 36/40 bits DMA host/device width
	[    8.488609] qcom-ethqos 23040000.ethernet: clk_csr value out of range (0xffffff00 exceeds mask 0x00000f00), truncating
	[   11.192140] qcom-ethqos 23040000.ethernet eth1: Register MEM_TYPE_PAGE_POOL RxQ-0
	[   11.200567] qcom-ethqos 23040000.ethernet eth1: Register MEM_TYPE_PAGE_POOL RxQ-1
	[   11.216466] qcom-ethqos 23040000.ethernet eth1: Register MEM_TYPE_PAGE_POOL RxQ-2
	[   11.232393] qcom-ethqos 23040000.ethernet eth1: Register MEM_TYPE_PAGE_POOL RxQ-3
	[   11.250011] qcom-ethqos 23040000.ethernet eth1: Enabling Safety Features
	[   11.269722] qcom-ethqos 23040000.ethernet eth1: IEEE 1588-2008 Advanced Timestamp supported
	[   11.286758] qcom-ethqos 23040000.ethernet eth1: registered PTP clock
	[   11.300593] qcom-ethqos 23040000.ethernet eth1: configuring for inband/2500base-x link mode
	[   11.300596] qcom-ethqos 23040000.ethernet eth1: major config, requested inband/2500base-x
	[   11.300599] qcom-ethqos 23040000.ethernet eth1: interface 2500base-x inband modes: pcs=01 phy=00
	[   11.316311] qcom-ethqos 23040000.ethernet eth1: major config, active inband/inband,an-disabled/2500base-x
	[   11.316317] qcom-ethqos 23040000.ethernet eth1: phylink_mac_config: mode=inband/2500base-x/none adv=00000000,00000000,00008000,0000e240 pause=04
	[   14.125773] qcom-ethqos 23040000.ethernet: PCS Link Up
	[   14.131081] qcom-ethqos 23040000.ethernet eth1: pcs link up
	[   14.147059] qcom-ethqos 23040000.ethernet eth1: Link is Up - 2.5Gbps/Full - flow control rx/tx
	<link speed changed to 1G>
	[   25.868674] qcom-ethqos 23040000.ethernet: PCS Link Down
	[   25.874184] qcom-ethqos 23040000.ethernet eth1: pcs link down
	[   25.874745] qcom-ethqos 23040000.ethernet eth1: Link is Down

No further messages appear after "Link is Down".

I have been having some issues with the IQ9 EVK (QCA8081 PHY), so no
results to report for it yet.

	Ayaan
 

