Return-Path: <linux-arm-msm+bounces-98568-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4HtyGEQju2lofgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98568-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 23:12:20 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 026552C3481
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 23:12:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 429C23016AC6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 22:12:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 217803033FF;
	Wed, 18 Mar 2026 22:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pN0BTH95";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CoHakncO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B71F634575A
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 22:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773871937; cv=none; b=kC5yMAqhPtPTSoeHoA4dJLiXxHkqBGYc+3j6ACoVx48xHCMRBtaIYOBbv6CQM2MCMjVSuleT8MdbPz7Kc4fsFtfVP8sGpZ/cbsaJ7gZm0d353YOAH6cV2Vua2NBX3JffCiNEzCfdSci4NADH+ERf4q4FoVcrJ/hg8FgZQ+vhbDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773871937; c=relaxed/simple;
	bh=WOVGW2z53slTRWk+CQA/w4RaDvMtyz0el+IgcgNAdRU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gbGAyx5lq664GBW2B8So7SvVVBphabrkXu0MMxPc6CmY54hJDfuxPjVQ2wMoD7pYxl30HPRqzWf3s2Fvb0E8zymiGGT7QH7MybJZZDlED5BVu8pkWpLtQF+tqg1hGivK7nKgAOd9WzNUJewl95oKRs+Ry24C7nwcM79Pbbb4gm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pN0BTH95; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CoHakncO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62IFhADN1930478
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 22:12:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=wfPdTTKFeIrqOaOP9gRV4ZVq
	TsDeuSzuEH83cPJoqOo=; b=pN0BTH956IbNpzhiCfIyryXAETBTLYRK+va1QblI
	uPVPzHuAsZdidVMzHb0ZlRq1C+WVLohRCpKyFHQZNC7bX0n0jGatOA8qdiO9I3Kz
	EDoDokM+grH0gdgqY2yYXlX9/SlZqNhNBFGkB0saihVCLau/8+DqhcDPwrpL0GXX
	o46hkX6hKKMBOt+VVSNbu00VH7o6GtahG3S6WhTFXYP/YIk6s0AO4NoJ1lHRvmJ+
	galis3GPPV1yljFPLpBaMtvRcgnkG77WhuFyJUm/Qym5LNb2zFV515z7/4FVUIM4
	lDf7RL083RJN4R0deOPbyCLJr5NlTnKFkXMOBg5hOstiig==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyut1a449-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 22:12:14 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c741a9ef5f0so179200a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 15:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773871933; x=1774476733; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wfPdTTKFeIrqOaOP9gRV4ZVqTsDeuSzuEH83cPJoqOo=;
        b=CoHakncO2IneEdkhQG9B6kbHusqOqRaGDEWQfqGsoTR7lm1FqJAeBZ1kPp9kXArysj
         R8dOU3W6ALNir56dbeB24ctif/XFnSiPlTElPJVriRm9E49fD3oO0oyYXzXIGjWdlb6U
         uDcaZN6oidGIZG38oENRY2Sc3fkjQIlglXM65Y+kjX92AYOO2o8WZv1N7Lx3QIpNlBFD
         K1tvRUC+yVDm2pHCwCZQ+MJAoRaOtXbNknQ+HUgTYHXkSBFjiAeKf1lepnZ9t3s0W7Xy
         NKxU0FEERcPLJsI+LpzYsjdUP5ZAqvnL5Ww0t1NdJ2Vt7rekbsc0N+Q/2hAvtDdpGk5S
         jp8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773871933; x=1774476733;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wfPdTTKFeIrqOaOP9gRV4ZVqTsDeuSzuEH83cPJoqOo=;
        b=S9mEJkS8b5/VPM8Du4pIgOvzPpIS3xIr0/BMPeV3tZD/9GO2uhdzhU4WdTf4Y8jHOQ
         nyuSPSoYxD/SRl3Sw6rCDpG7LaxOhnfuwNr1iJju3eF5ahdPP885DGbNPgBFM6JLKqR4
         UnipWwqjZiqEGRniF+HHL8SqxZwrsLSuFSqU7MxPWMtbOw2SPwbU8jewjvqGa1DEi7Zj
         l6l85EtXdfz67oliMEIjqBA8GZCVno0Mjc7JNYRhCpkka16uCNSnUICKD7WkC462XH0t
         EG/GBNB5RggjQFCYzLT3026e2LbkXivD6IYhWYRdUSLn3lLt+fcbnFB4AYcba40uj7G8
         Hfyg==
X-Forwarded-Encrypted: i=1; AJvYcCVg6oC0DENrcUHjoNk0pbOI6kerWEQAK21zuC29LtsBH4PTKKcJNYvLwAYX4sKoh7Bjq690bnNhsG9HelBm@vger.kernel.org
X-Gm-Message-State: AOJu0YymF7dZ/SR286eipFO/t7TjDJ5kOzGYUxkD1Q+c9VhYvk41WEiH
	ColillF0alL6uvI8k+FfVruRp7snCvayAzfvsW4gjWqzvlJHT3HyOSRMEwaRfX5xDRO+7lDA4NM
	HhOI8OwJ4Ku+Hz2fk0ioZr5xu5+XJx9sdts5saoC4u6GW8K9xAnBzayMdRVNZWbzKd8hA
X-Gm-Gg: ATEYQzyTcIKjLMQTh9HDCwQeCpxDE1K99dWHpxnZSximWQghPwdwLq95HVaJb2D7c8n
	EyPFNE6upoBvNcOzXQ1gRBFgmE88C6D7q4b2AvKI8R+lxQribo8myMD/GRyuqyBKHfWh4vPjWhj
	4NPgHbwZdOhQnTScK/m7U7cF0hurDAd0cBuHIqnuqD9xO8jGxn+ZXYB+zr3L0PVUjlHo3NXtAbg
	xnHY7hB80X64AGPSGThw8kLrmSD5wh3YyLgqzsywoOXvbR7c4EfFn44wuLgUwwBaWJ2DN2EuuP9
	OjeSvRuAynXqn9lugHwKg1SO2iIbglemNrjWBqfAk4NNuSc2wvGUpLfWewhkp8gfdoR0mnvY26K
	IHFDYGL23ChVwQ093Q9/Tm6fMCxqvZMgJ/8Y=
X-Received: by 2002:a05:6a21:6b02:b0:398:a41a:371f with SMTP id adf61e73a8af0-39bb2498f6fmr944721637.20.1773871933404;
        Wed, 18 Mar 2026 15:12:13 -0700 (PDT)
X-Received: by 2002:a05:6a21:6b02:b0:398:a41a:371f with SMTP id adf61e73a8af0-39bb2498f6fmr944692637.20.1773871932733;
        Wed, 18 Mar 2026 15:12:12 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a6b56ac50sm4778552b3a.16.2026.03.18.15.12.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 15:12:11 -0700 (PDT)
Date: Thu, 19 Mar 2026 03:42:05 +0530
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
Message-ID: <absjNQ2s3Z5N2Zwo@oss.qualcomm.com>
References: <abQC7r38QLhSeadl@shell.armlinux.org.uk>
 <abdEscs44fU4kRag@oss.qualcomm.com>
 <abdYu864OmNWiWIW@shell.armlinux.org.uk>
 <ablpxwGks9m38fhM@shell.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ablpxwGks9m38fhM@shell.armlinux.org.uk>
X-Proofpoint-GUID: 5h4Yf2129_5WunmaowiiIZu44p1nKz_h
X-Authority-Analysis: v=2.4 cv=ModfKmae c=1 sm=1 tr=0 ts=69bb233e cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=9Hbxq-cn08ijON1ErxsA:9 a=vUQH8iars7gmROI7:21 a=CjuIK1q_8ugA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: 5h4Yf2129_5WunmaowiiIZu44p1nKz_h
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDE5MiBTYWx0ZWRfX7XBjfNmYgafs
 /mmC7hKC9dmziykfCutPOgzLFcgDWs4C2Z1fh5RLLD0V9hqWHKR1NNlpMnqt/xlJAxpaUq89Fs8
 uwDXrdSXngI/wHEu2vZDZnNFF/gOAnSLsKNnKrRZRfN2P/qZUfcAmhpLZXX/6oYYAwk2vnZhJA/
 SKJZW9ZnbGt0RDIjLievI/Wk/4ug7pxXytNpzgLcHGvv7T91SvAusL1WMK6UxhdLUNHCsFcS46p
 4OgXYDiKJ1urYk4nQpAoQz7z29oPyszn+MsQGFUj5sh5m/V1lHNMYfBjmIs/zxITRXt7AT6//1G
 yAUDtEUCE/S/PGuFNtgokryeUuFGv8ZHkhpseaEs11nkFloHg/Pb4bVPNv10ozrumf0QGGAmLYl
 Tmva4vhMoRdZmOsP7brhdyDKrrT+GKcH+ro7Ikv7A+Mqzsvcezvj6YqhpjPrnQSNiem6k5d33e8
 yetIOJ1m6O0hvg4auRg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603180192
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-98568-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mohd.anwar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.980];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 026552C3481
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,
On Tue, Mar 17, 2026 at 02:48:39PM +0000, Russell King (Oracle) wrote:
> On Mon, Mar 16, 2026 at 01:11:23AM +0000, Russell King (Oracle) wrote:
> > This will be because we're not attaching any PHYs when phylink is
> > being told to operate in 2500BASE-X with inband, since it thinks
> > that's the media. That, and, because stmmac has a long history, it
> > needed a special phylink_expects_phy() check added in stmmac_init_phy()
> > which his what prevents the PHY being attached.
> 
> Okay, another idea that I hope will work. Please drop the "net: stmmac:
> qcom-ethqos: enable inband mode for SGMII" patch so we go back to using
> outband mode for everything.
> 
> Then, disable the call to ethqos_pcs_set_inband() so inband mode
> doesn't get enabled for SGMII - as phylink will be telling the PHY to
> disable inband mode.
> 
> Does that result in functional 100M, 1G and 2.5G speeds?

Yes, but with an asterisk.

 - 2.5G works fine
 - Shifting between 2.5G, 1G, and 100M are usually fine.
 - Booting up at 1G results in link flapping (it gets resolved if I
   do: ip link set <interface> down and then up on the link partner).
 - Similar link flapping also happens when shifting from 2.5G to 1G,
   though its not always.

Attaching logs of the booting up with a 1G scenario below.

	Ayaan
---
[    8.650471] qcom-ethqos 23040000.ethernet: Using 36/40 bits DMA host/device width
[    8.650486] qcom-ethqos 23040000.ethernet: clk_csr value out of range (0xffffff00 exceeds mask 0x00000f00), truncating
[   11.569262] qcom-ethqos 23040000.ethernet eth1: Register MEM_TYPE_PAGE_POOL RxQ-0
[   11.577988] qcom-ethqos 23040000.ethernet eth1: Register MEM_TYPE_PAGE_POOL RxQ-1
[   11.586665] qcom-ethqos 23040000.ethernet eth1: Register MEM_TYPE_PAGE_POOL RxQ-2
[   11.595357] qcom-ethqos 23040000.ethernet eth1: Register MEM_TYPE_PAGE_POOL RxQ-3
[   11.619882] qcom-ethqos 23040000.ethernet eth1: PHY stmmac-0:08 uses interfaces 4,23,27, validating 23
[   11.629468] qcom-ethqos 23040000.ethernet eth1:  interface 23 (2500base-x) rate match pause supports 0-7,9,13-14,47
[   11.640202] qcom-ethqos 23040000.ethernet eth1: PHY [stmmac-0:08] driver [Aquantia AQR115C] (irq=288)
[   11.649691] qcom-ethqos 23040000.ethernet eth1: phy: 2500base-x setting supported 00000000,00000000,00008000,000062ff advertising 00000000,00000000,00008000,000062ff
[   11.680117] qcom-ethqos 23040000.ethernet eth1: Enabling Safety Features
[   11.688517] qcom-ethqos 23040000.ethernet eth1: IEEE 1588-2008 Advanced Timestamp supported
[   11.698080] qcom-ethqos 23040000.ethernet eth1: registered PTP clock
[   11.704633] qcom-ethqos 23040000.ethernet eth1: configuring for phy/2500base-x link mode
[   11.712966] qcom-ethqos 23040000.ethernet eth1: major config, requested phy/2500base-x
[   11.721115] qcom-ethqos 23040000.ethernet eth1: interface 2500base-x inband modes: pcs=01 phy=00
[   11.730157] qcom-ethqos 23040000.ethernet eth1: major config, active phy/outband/2500base-x
[   11.738748] qcom-ethqos 23040000.ethernet eth1: phylink_mac_config: mode=phy/2500base-x/none adv=00000000,00000000,00000000,00000000 pause=00
[   11.763778] qcom-ethqos 23040000.ethernet eth1: phy link down 2500base-x/1Gbps/Full/none/off/nolpi
[   15.215445] qcom-ethqos 23040000.ethernet eth1: phy link up sgmii/1Gbps/Full/none/rx/tx/nolpi
[   15.226572] qcom-ethqos 23040000.ethernet eth1: major config, requested phy/sgmii
[   15.234297] qcom-ethqos 23040000.ethernet eth1: interface sgmii inband modes: pcs=03 phy=03
[   15.242902] qcom-ethqos 23040000.ethernet eth1: major config, active phy/outband/sgmii
[   15.251044] qcom-ethqos 23040000.ethernet eth1: phylink_mac_config: mode=phy/sgmii/none adv=00000000,00000000,00000000,00000000 pause=03
[   15.276661] qcom-ethqos 23040000.ethernet: PCS Link Up
[   15.278115] qcom-ethqos 23040000.ethernet eth1: Link is Up - 1Gbps/Full - flow control rx/tx
[   15.283364] qcom-ethqos 23040000.ethernet eth1: pcs link up
[   18.317922] qcom-ethqos 23040000.ethernet: PCS Link Down
[   18.323424] qcom-ethqos 23040000.ethernet eth1: pcs link down
[   18.323977] qcom-ethqos 23040000.ethernet eth1: Link is Down
[   18.329375] qcom-ethqos 23040000.ethernet: PCS Link Up
[   18.340467] qcom-ethqos 23040000.ethernet eth1: pcs link up
[   18.356522] qcom-ethqos 23040000.ethernet eth1: Link is Up - 1Gbps/Full - flow control rx/tx
[   21.358679] qcom-ethqos 23040000.ethernet: PCS Link Down
[   21.364183] qcom-ethqos 23040000.ethernet eth1: pcs link down
[   21.364745] qcom-ethqos 23040000.ethernet eth1: Link is Down
[   21.370130] qcom-ethqos 23040000.ethernet: PCS Link Up
[   21.370139] qcom-ethqos 23040000.ethernet eth1: pcs link up
[   21.397194] qcom-ethqos 23040000.ethernet eth1: Link is Up - 1Gbps/Full - flow control rx/tx
[   24.399108] qcom-ethqos 23040000.ethernet: PCS Link Down
[   24.404613] qcom-ethqos 23040000.ethernet eth1: pcs link down
[   24.405168] qcom-ethqos 23040000.ethernet eth1: Link is Down
[   24.410563] qcom-ethqos 23040000.ethernet: PCS Link Up
[   24.421657] qcom-ethqos 23040000.ethernet eth1: pcs link up
[   24.437636] qcom-ethqos 23040000.ethernet eth1: Link is Up - 1Gbps/Full - flow control rx/tx
[   27.439468] qcom-ethqos 23040000.ethernet: PCS Link Down
[   27.444971] qcom-ethqos 23040000.ethernet eth1: pcs link down
[   27.445528] qcom-ethqos 23040000.ethernet eth1: Link is Down
[   27.450920] qcom-ethqos 23040000.ethernet: PCS Link Up
[   27.462016] qcom-ethqos 23040000.ethernet eth1: pcs link up
[   27.477991] qcom-ethqos 23040000.ethernet eth1: Link is Up - 1Gbps/Full - flow control rx/tx
[   28.026087] qcom-ethqos 23040000.ethernet eth1: phy link down sgmii/1Gbps/Full/none/rx/tx/nolpi
[   28.035077] qcom-ethqos 23040000.ethernet eth1: Link is Down
[   33.336433] qcom-ethqos 23040000.ethernet eth1: phy link up sgmii/1Gbps/Full/none/rx/tx/nolpi
[   33.342861] qcom-ethqos 23040000.ethernet: PCS Link Down
[   33.350674] qcom-ethqos 23040000.ethernet eth1: pcs link down
[   33.350724] qcom-ethqos 23040000.ethernet: PCS Link Up
[   33.360912] qcom-ethqos 23040000.ethernet eth1: Link is Up - 1Gbps/Full - flow control rx/tx
[   33.366768] qcom-ethqos 23040000.ethernet eth1: pcs link up
[   33.386487] qcom-ethqos 23040000.ethernet eth1: Link is Down
Note: doing a remote link toggle recovers this.


