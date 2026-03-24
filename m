Return-Path: <linux-arm-msm+bounces-99761-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WMaAGgUgw2k9ogQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99761-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 00:36:37 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DC6E731DC3E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 00:36:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C561A30A7A2A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 23:35:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 466D93CAE96;
	Tue, 24 Mar 2026 23:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FLWDdRJg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JNhsGz1e"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18AA039EF28
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 23:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774395354; cv=none; b=kokkbyikmSfXX5dScrn0qKudq5RIXPIDMy4dMt3mt8WJLnSNnawR4pRPyHvKeaLRXfn/id8XhzvUqCx44dRshAhETaMC+vzrgmIZR7/W/RR/dDIDEze2wcJEnAc3IMNZnicXzeKabGn0hiIjoLVlj05GZ0rGMyHCQ/8rbDNNK98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774395354; c=relaxed/simple;
	bh=m1IRTIQlUehftEBclPk9fOy9/4X9f0ayizJagcEecy4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N+12i7ip5t8OGwd64Dr/1udRtJ/SAA9+Cx07Vqwu2F1wlwRAus4lvFgBB0XJca1Mky+bLYkbitLdqZKLIFF0vL+1Wuwr+S11+Qwm7GJf+VKnt4Q4Zz4LMJ4KUUJ2B4p5v5CX4AlrupukbQxCpkrl8e9eXL01kyWSa9Y+0o9n8AE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FLWDdRJg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JNhsGz1e; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62OJCebT989019
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 23:35:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pXpbtuVjHzaZekfV5IcPlnc8Y4BS6S5ApQt4Khrvoxs=; b=FLWDdRJg6bhRwqsL
	JNW2fDOFCzWic3iLrSSboFvp/2k81TqXiMT7E8/Bfw/39c4KlyE1/1ILwjgmNSgQ
	mCInvSUu2dv6t80VtsvrTSPYY84PL1n27yge3fE9BZVyqHOnjfeeJTBRwTm3FRBO
	l447iqJHVdmvzW4uBmPx14cJJLDS8uOG6nYHvfQRS+H00SlekjiqC90O0dOMu9X9
	fURyN9JSe/CK92iBzY5gd0e5xiwFtVF3VE/aZ6aQluWiTgD8i5CLDDT3+bUdRKjG
	/KtzqvVxPmT5e/1etPrSFXkkx4tm7uUqWclrHkt1V5sqWrbMmW1umLAqkrwupJQL
	14Z0Og==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3u0m28x3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 23:35:52 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5093787e2fdso286280231cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 16:35:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774395351; x=1775000151; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pXpbtuVjHzaZekfV5IcPlnc8Y4BS6S5ApQt4Khrvoxs=;
        b=JNhsGz1eluZqY4T6plAPOCPQeR3scrxnUq+QdFR3Zl++yeBO5VOdMDSot+XloMHzo1
         p1nU32BAWsJvfXwmXh2qzOs5Szqndo9kG7zNm4snumc6va1aDz2YYAzvjjEjufcaFj2m
         yG0aPjd32STQK/4iSCDMhROZh3I5aoffaEFMpdhg4ep5KzA3fvaOvxiJd7EpsT2D6ZNF
         2atUmq4uD5csoRclPpRtpSI5rWwn1Gdse1sIOSgV1KXsNCD9FxvZb2fx2cCMuqiVFB1T
         eImaNSJZ6XsZmTdxM4togv5wzl4K/YgMXT+KDcOZPCyJyPWitLfZ4Yj9AjcE08iAZo8S
         xT2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774395351; x=1775000151;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pXpbtuVjHzaZekfV5IcPlnc8Y4BS6S5ApQt4Khrvoxs=;
        b=DQ56l0/tsF6MspqhmGBJEcxANFkD9ro/CNclAvED2UNs3SMCyD1BvAxjqbFJHb1hif
         /R1vBLumQMmeI6ka34B0Uklk/R3OBl0+WqR1YMYtjXuBNxyeE+CR3ti4BPT88FnAm3D2
         NEwGOHpbIJpfAM76JLPg5Te2DuuAbPrR1MU/VNzTEbQKpa5yoXCujGBL8To8RpkDG+HK
         XQoRIFfTsHu/AbS+WghNcMauYqV92B+/7bMo7f+5ljWGHNhBNQsjVxNzoVb/TgrLU6h8
         LpVKMgWMQm4j7m4bMgSSGl/itpIH+23ohvlcddOE5gJW8nCNs6IPKA+DDd71MjCuu247
         3Ehg==
X-Forwarded-Encrypted: i=1; AJvYcCW5nfh2T97sQfS/w284yPxBAA2CcyXL8CNf93pH4dUjdDMqvv2e7u06mm8ofGhfygyn65BXjhplwpSWVWJh@vger.kernel.org
X-Gm-Message-State: AOJu0Yyy1h1VunCKiu/1CGiNTtYIXpWzIw/AEHMpFykE79ukCYFyg4R4
	VzlA6Y4oT0IZdhDWnL0V1wAF/lnAMAurqBCb8SkBkRu6NP4XvcS5sFc8KlFS4+zjnbBLy2XH0Gc
	T9aFL8KP4ljEmjwB5XXiwRfBL1ChPPGfAjeZEtc4HlQQkJy4m4R1IDmlHDdXvf08Qt7rK
X-Gm-Gg: ATEYQzylIse2/j6Dcie26LePMKvReXKMlQ/cbrDVyxf5tWU3r+nXkLIVVn/ys/z6y0b
	E1VYTwU3JrMhR8ErWH1jTbKEKVJo/gf8KFtJn0xQGl8Tun75zFXI6TlH1DmkIEe+S7RFFYCxGnM
	mRdAwi7/FbVGsnkD8H82Le1P9Pqqhu6+vvlGBGjn+LRIrmsm/LaQcAcW8gti/HzyyPQRBkW+Bnv
	C1xtnKEBSJSpvDJJfrpjgNr2aAWy4r12D6dMyqE5dNSv2SKnElaCzA8mrly+ioHkewpG4wX19Xv
	r99qiDQcAGIx9mcn/cNAdypQjtddIKPlvQvRLs0NKQzHnfuWsW5NBClLfJYy/Cd5Unmr1h8KmKA
	R+/3J1uXOOGgar6+sQ1vpoOntP0QhajqgU/dDrs6pmgrpkFRtwVBpX764MoCXc/igRxnCrd9ra6
	uh8C/TVShuXtx+XjJKdYbqobzJLATgPNn44mA=
X-Received: by 2002:a05:622a:1981:b0:509:4198:546a with SMTP id d75a77b69052e-50b80c9bdd2mr23319301cf.1.1774395351224;
        Tue, 24 Mar 2026 16:35:51 -0700 (PDT)
X-Received: by 2002:a05:622a:1981:b0:509:4198:546a with SMTP id d75a77b69052e-50b80c9bdd2mr23318951cf.1.1774395350713;
        Tue, 24 Mar 2026 16:35:50 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a28520731esm3419975e87.45.2026.03.24.16.35.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 16:35:47 -0700 (PDT)
Date: Wed, 25 Mar 2026 01:35:46 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: qcom: qcs6490-rb3gen2: Enable uPD720201
 and GL3590
Message-ID: <hrebrfsc4lcsrpk7thg72f7gdmi3btuiphdwh2ft7algej72xz@cijypbournvw>
References: <20260323-rb3gen2-upd-gl3590-v2-1-073514bf9ed5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260323-rb3gen2-upd-gl3590-v2-1-073514bf9ed5@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=IY6KmGqa c=1 sm=1 tr=0 ts=69c31fd8 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=WPfDNM3sXuLfQzZvfOcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: HQg9lPZ959cn7aErPO56qfKz5ayDdqaJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDE4MiBTYWx0ZWRfX8p+f67cajA9g
 RUwIwYyJRc/cLJsb5JRYlWy/30ZEObddsr6aG63BQtyvLVpCA/B0eR2tus3w7r+unoAhWx5xegV
 +ppsVkDleDvkR7BOmf09bqclcL+lVsblVtmgmTxL/z3qPjmZNkfpOY9XpXWIekdryrhsvA/qKEa
 Lboj5FXP1H2lVZjUgawDBkSpjP8jeNliMah34EcJpaaS6npCOBgy/cUa6Qq3Oy7rZtxAyGuboAQ
 JOesFnTP9jBO82iYL7jDX3+0QVv4uhdmrIJBwQ0Z4PTXKG2HsqqSYjU8fQaXUzT366Dl4xob/WZ
 qgFZBB/b/+X3R1tPBxZo3d/i2nHtoeI07nq06P1iXmLdh4N73c6EIJjERfLbBiu+408U2oBg0au
 INZUsZRSFnaz84iHJSJbQ4LX0hNCD6NUBMXykG4s/lS+wa5W2z75f/v2l2FwY+JP9aq8+R80P+d
 F5DePAXWaCAyb7EzB1Q==
X-Proofpoint-GUID: HQg9lPZ959cn7aErPO56qfKz5ayDdqaJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_04,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 phishscore=0 malwarescore=0 suspectscore=0
 adultscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603240182
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99761-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DC6E731DC3E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 23, 2026 at 09:32:39PM -0500, Bjorn Andersson wrote:
> The QCS6490 Rb3Gen2 has a Renesas μPD720201 XHCI controller hanging off
> the TC9563 PCIe switch, on this a Genesys Logic GL3590 USB hub provides
> two USB Type-A ports and an ASIX AX88179 USB 3.0 Gigabit Ethernet
> interface.
> 
> The Renesas chip is powered by two regulators controlled through PM7250B
> GPIOs 1 and 4, and the power/reset pin is pulled down by PM8350C GPIO 4.
> The Genesys chip power is always-on, but the reset pin is controlled
> through TLMM GPIO 162.
> 
> Describe the Renesas chip on the PCIe bus, with supplies and reset, to
> allow it to be brought out of reset and discovered. Then describe the
> two peers of the USB hub, with its reset GPIO, to allow this to be
> brought out of reset.
> 
> The USB Type-A connectors are not described, as they are in no regard
> controlled by the operating system.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> ---
> Dependencies has now landed, so this provides USB Type-A and Ethernet
> support (when renesas_usb_fw.mem) is present.

Note, I initially applied the patch to the bit old -next (20260317) and
I ended up with no PCIe host at all (bare -next would still show the
PCIe host and the TC9563 bridge).


ANyway, does this actually work for you? The hub is detected, but the
USB bus is empty. I tried plugging in several devices (includin the
powered USB hub) and they were completely ignored by the hub.

FWIW I tried both the the pcie_aspm=off and w/o it.

> Missing from the RFC/v1 description was the mentioning that unless I
> pass "pcie_aspm=off" to the kernel, the Renesas controller fails with:
> 
>   xhci-pci-renesas 0001:04:00.0: Abort failed to stop command ring: -110

Interesting, it "worked" in my case, having everythign built in into the
kernel.

> ---
> Changes in v2:
> - Waited for dependencies to land.
> - Dropped "RFC".
> - Link to v1: https://lore.kernel.org/r/20260212-rb3gen2-upd-gl3590-v1-1-18fb04bb32b0@oss.qualcomm.com
> ---
>  arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 93 ++++++++++++++++++++++++++++
>  1 file changed, 93 insertions(+)
> 

-- 
With best wishes
Dmitry

