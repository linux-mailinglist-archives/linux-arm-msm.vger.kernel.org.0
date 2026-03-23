Return-Path: <linux-arm-msm+bounces-99401-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sHAeKqmiwWknUQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99401-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 21:29:29 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2921D2FD3D5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 21:29:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1D41D30A5B4A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 20:23:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 911183DE43D;
	Mon, 23 Mar 2026 20:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hrwgHYkt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OBlf1LBF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D5783630BA
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 20:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774297423; cv=none; b=rypm+gn64mk2GcQzTQiuZgiK/JGnGtsWeqb/DXUu9w66pKDsDMLBNQSo3Wfp4zSSQnKiwktMR5sNiA6L8fNE7PL/RMlng55DSzTMWgzCOFIJimyqTkCeDZqaXXDq1QptJla/vKM09fvCR+PZNBPpM7vjQzWX9rX9I5ubKQmdkrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774297423; c=relaxed/simple;
	bh=Ev6HL6r39nKqcDtyLtF9bFrf3NNu6kw4S+h7+fE4k2U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZJY7UM+y7CPi01ip52VM13AqsgJnh6bCDnx6JMMk//spTjW0Up0i2lQtXNeMTuyyOYxaFXUFWskSuBoxX1uzlYKGpbXgbvrIKcvwmWtlRaZtyB1sPZfz6OODQISB3IQo1E60FAv1OskW0razBSnu0P9MBFkKqa8RgtowxJUfoHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hrwgHYkt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OBlf1LBF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NHquvN2681748
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 20:23:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=olrg9+koKbp1wST4wwsyJvh2
	+Fhta++w8bB0JufkCNc=; b=hrwgHYkt1QFkdKuInaLwrkqFZ8cI3EhkOa53XLsD
	cbxrVjDJmZuW8PBe/zJ6hrCed2qH69LJeBNHdo9Q4QM3Nk0vUsnuK4T6/TEOXcEc
	t4h0TBFfOpYZFCzY8QtbYw+hyZ83aoPhB/RenJdJMo3cNayobtYjLa+fbbL6/Sio
	eAQwLkwYt09VoWUbb5LKI2OjES+lYfzalxhWGZxt8e0S6Op41Ut1YIGxlIuoLxL4
	7do+kdJn+/hTsV5vUryxB0tQ4DO7asIvpx1aFugKM6JPcSVkhoxsOjxAi1p9fsS8
	PXADvEucj7538b5FkLQpgU4u62f8QNlt707hQHifB4glzg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d31p7akw6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 20:23:40 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35a0337930eso620619a91.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 13:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774297419; x=1774902219; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=olrg9+koKbp1wST4wwsyJvh2+Fhta++w8bB0JufkCNc=;
        b=OBlf1LBFJAtSYbbFA8jC0PPzVqWWxfz8ZaT7+bI/OJHJNH/QfHF++hwX59wotKtbGQ
         8v6E+ibGtQDpwBzdfWVclVbF5T7HsRU9XSjFlsueG8MuPfgy20e0f0iMkE+spAnNhAzX
         IKj/pukFm3zxjO0v++E9hb5ihwHZxGgU1v9MByTJ7SRf61UNwfVIRgEatoCrzS2T9h40
         hfrA0dGMdmoKHUyY+Tvb1iD0/hQBuWhR3SEHFgwV4gi9oKyqpIXYGyIVVVaT8xSqvZYv
         YnOH6cVasOnPOdXcDphPi0eRcUJUfx21hzJ97eLjC1Jg9cwi7PNUhC/8OPQ/bsMi7T7x
         FgMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774297419; x=1774902219;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=olrg9+koKbp1wST4wwsyJvh2+Fhta++w8bB0JufkCNc=;
        b=Ogj5SoR5bndeAarrHm05JsojB7VVVXMa1R93zHCjFN2IJYIM9WNKFSd9YhrC8alEJe
         pJfaeoIVSmsfQ2A2TerexstKLDu+Zn2iz+ggHRFACdUc+6glTtCjPr/4NW9SPpyRXQUg
         DSqzc1p78FmqB5qNQAvNdAAd5o2cDA9ggGJmpTvyqF33Nr2aXeu7XgBpzxcZ6oVPlAdN
         TUOnzEYHDEcnr49o61ZOY3nHzJkq1unrqtjHMgelLmMV1KYGLZOZWKCnJNv8VdW0IjmW
         MIWu/MQTgWzwZq9uTe/dogyuEHq0L1bx5XFpgH0j8ZCae4B5f/yUEPqxm7XTVoeUGJ4F
         vjwQ==
X-Forwarded-Encrypted: i=1; AJvYcCX4hH+tAdYvrCDXc2lE5d7J54c7YvVEhLQnx9r2m1wgzC8vL8WS5lv5xO5qH2au3+gS1lfkf07kp4xDLNru@vger.kernel.org
X-Gm-Message-State: AOJu0YxsdTmQhOF2dxEPSpCwA3+GIbJUjie1qr8ociTHtDbFjQeowWcx
	UHobRaU71uFbFwmqaDOiQsE9ydzl2w1ZZlVekFR2pTLLn6Ei3Aqv54b+lRu5G5uo/hog7Oak6lR
	M+pgGzqJ5V3x8tyV+EtXRI4GFRBuQIE+zCb6h2fsKIVIV/Pjw5muIZr1PHwvHVKHmvA76
X-Gm-Gg: ATEYQzyy0y72iXNJzZL4ZsyNsVf2K5WuU8LeW1lWTHnTP40oUsZgTSxg/RGDGV60tI1
	12lx1ug6+Ii45vgvsbkOMkXDos9ayKnobrvrwLdMfo8CPA9dPbUsvNtFV0hB/c+hlgMmrSTlLnf
	Ngn/DSycRB87u421Wvf8kKHclYGfy9FXXHBBzG3VoMyjajme29IS6Rdn8AVLd63oGqnSv4GWa7P
	aDx2zMSOnu+LtO/9nlxcW2ajvmQWayMtxU7+LZp8i81BZ30hA5zBuAO0AsWLJxHjQAiYfPvSd0o
	58Eyp2fua0Ge9/Ji13hQuFiwokb5U6QZFY0DuPoBYuOQMZXwZKFe3ltTVhH4w4KUy9c3V4HiDZ/
	0x9OwdPPOQ/IrqDSPU086NXYUctn51+jg14A=
X-Received: by 2002:a17:90b:35d0:b0:34c:fe7e:84fe with SMTP id 98e67ed59e1d1-35bd2d0dabcmr12741291a91.28.1774297419028;
        Mon, 23 Mar 2026 13:23:39 -0700 (PDT)
X-Received: by 2002:a17:90b:35d0:b0:34c:fe7e:84fe with SMTP id 98e67ed59e1d1-35bd2d0dabcmr12741263a91.28.1774297418454;
        Mon, 23 Mar 2026 13:23:38 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c015cd6c3sm78727a91.0.2026.03.23.13.23.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 13:23:38 -0700 (PDT)
Date: Tue, 24 Mar 2026 01:53:31 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org,
        Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH net-next 0/8] net: stmmac: improve PCS support
Message-ID: <acGhQ0oui+dVRdLY@oss.qualcomm.com>
References: <abdEscs44fU4kRag@oss.qualcomm.com>
 <abdYu864OmNWiWIW@shell.armlinux.org.uk>
 <ablpxwGks9m38fhM@shell.armlinux.org.uk>
 <absjNQ2s3Z5N2Zwo@oss.qualcomm.com>
 <abtE7sDT75I7uPnk@shell.armlinux.org.uk>
 <abvAuHFZzCFobO-V@shell.armlinux.org.uk>
 <7566c66b-2dda-4b29-b59e-4e4a7e159e21@oss.qualcomm.com>
 <abvy6nZyjyxUXMuf@shell.armlinux.org.uk>
 <bcab38a5-e7f7-47c9-ab9c-99294e095c22@oss.qualcomm.com>
 <abwSHGw39FTJGNb7@shell.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <abwSHGw39FTJGNb7@shell.armlinux.org.uk>
X-Authority-Analysis: v=2.4 cv=RMC+3oi+ c=1 sm=1 tr=0 ts=69c1a14c cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=G4x0Uraz-9_3_ZZlgMgA:9 a=CjuIK1q_8ugA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: _4vvIhana_tJS6GAqOW6J_i6VpMyOwP2
X-Proofpoint-GUID: _4vvIhana_tJS6GAqOW6J_i6VpMyOwP2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDE1MSBTYWx0ZWRfX3jy8SObNvJnF
 husvPrNzF7zKmSeKfr/d6jCngp4raWp4UfUbr2mQBPUUDD9P+eipbo7i7HENN9GIPEi6u3MTUuZ
 3T5zaUq92R7Q1mqAraUr2fZNfaipVpGqBSVeI7CKoUkMmk3SVCT0SdksOp9DEPleiUvXNBl4kCm
 z01Xtpa3Tma8bqHOpPGP5gAdJlFV/JIkK66Nb/jVlvd1AeY2NzUz8emImQ0ox0bRo4s7qQJWGPN
 c1bsceIqR8cNIScoKTiKr6wtFUnEVX5WdTg18E+ZNnEGniFXSpe80cujyqsOQDyaPAa5CX/knMg
 x8Ju/80JaIG21c2c/FBwPEFuVvVH9ZAIdW0YDJ2ANTPKtQnirfYaQC42rY+Qk2IhC1ZbDE/yaq6
 fPj+yNss3IygPDG1r/B4Pffu+gkay/qXs33x+/NmHxdPYxU66pWb+iJrOLfhkQkk9d7kie0I8g0
 GYaxx7vq2PJE946Jv2g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_05,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230151
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99401-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,1.95.144.0:email];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
X-Rspamd-Queue-Id: 2921D2FD3D5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,
On Thu, Mar 19, 2026 at 03:11:24PM +0000, Russell King (Oracle) wrote:
> On Thu, Mar 19, 2026 at 02:50:29PM +0100, Konrad Dybcio wrote:
> > On 3/19/26 1:58 PM, Russell King (Oracle) wrote:
> > > On Thu, Mar 19, 2026 at 11:09:33AM +0100, Konrad Dybcio wrote:
> > >> On 3/19/26 10:24 AM, Russell King (Oracle) wrote:
> > >>> On Thu, Mar 19, 2026 at 12:35:58AM +0000, Russell King (Oracle) wrote:
> > >>>> On Thu, Mar 19, 2026 at 03:42:05AM +0530, Mohd Ayaan Anwar wrote:
> > >>>>> [    8.650486] qcom-ethqos 23040000.ethernet: clk_csr value out of range (0xffffff00 exceeds mask 0x00000f00), truncating
> > >>>>
> > >>>> Please look into this first - with the MDIO bus operating at
> > >>>> who-knows-what frequency, this could make reading from the PHY
> > >>>> unreliable.
> > >>>
> > >>> My guess is clk_get_rate(priv->plat->stmmac_clk) is returning zero,
> > >>> which means we don't know the rate of the CSR clock.
> > >>>
> > >>> From what I can see in drivers/clk/qcom/gcc-qcs404.c and
> > >>> drivers/clk/qcom/gcc-sdx55.c, this looks like this case - the
> > >>> struct clk_branch makes no mention of any clock rate, nor does it
> > >>> have any parent. From what I can see, neither of these drivers
> > >>> specify any rates for any of their clocks, which likely means that
> > >>> clk_get_rate() will be zero for all of them.
> > >>>
> > >>> Sadly, when I designed the clk API, I didn't think that people would
> > >>> be stupid enough not to implement the API properly, more fool me.
> > >>>
> > >>> Under the old code, we would've used STMMAC_CSR_20_35M, which means
> > >>> we're assuming that the CSR clock is between 20 and 35MHz, even
> > >>> though the value is zero. Is that the case? If it's higher than
> > >>> 35MHz, then you've been operating the MDIO bus out of IEEE 802.3
> > >>> specification, which can make PHY access unrealible.
> > >>>
> > >>> In any case, please fix your clock drivers.
> > >>
> > >> I'm not 100% sure the currently-passed AXI clock is what we want
> > >> there and the docs aren't super helpful.. is there a synopsys-name
> > >> for it? What rates would you expect it to run at?
> > > 
> > > There is no easy answer to that - it depends on the bus interfaces
> > > and whether the CSR (register) clock is separate.
> > > 
> > > The likely possible names are hclk_i (for AHB master), aclk_i (for
> > > AXI master), or clk_csr_i.
> > > 
> > > It does state that the CSR clock should have a minimum frequency of
> > > 25MHz to allow all statistics to be properly collected.
> > > 
> > > The rate of the CSR clock needs to be known, as selecting the divider
> > > for generating MDC within IEEE 802.3 specifications is rather
> > > fundamental. You may find something there which hints at what rate
> > > the dwmac's CSR clock runs at.
> > 
> > If it's either AXI or AHB, in both cases their direct parent is controlled
> > by an entity external to Linux and their rates may change at runtime,
> > based on aggregated needs of the bus. They're defined as levels/corners
> > (abstract term for a hidden volt+freq combo).
> > 
> > It may be that the operating range for the EMAC removes that variability,
> > but with no concrete evidence and just anecdotal experience, that's only
> > the case for the AHB clock
> 
> The important thing is that the MDC doesn't exceed the max clock
> frequency for the PHY and any other device connected to the MDIO
> bus. IEEE 802.3 specifies a max frequency of 2.5MHz (minimum period
> for MDC shall be 400 ns). Some PHYs can operate in excess of this,
> but one would need to confirm that all devices on the MDIO bus
> supports higher frequencies before using them. In the kernel, we
> generally err on the side of caution and stick to IEEE 802.3.
> 
> There are two ways to achieve the divider value with stmmac.
> 
> 1. if priv->plat->csr_clk is set to a value other than -1, this
>    configures the hardware divisor (for "normal" cores, it takes
>    STMMAC_CSR_* constants that can be found in include/linux/stmmac.h)
> 
> 2. otherwise, the rate of priv->plat->stmmac_clk is used as the CSR
>    clock value, which is the reference clock for the divider that
>    generates the MDC clock, and an appropriate divider is selected.
>    Given the available dividers, it works out at between 1.25MHz for
>    a CSR clock of just over 20MHz and 2.47MHz for 800MHz. (I have a
>    patch which documents the ranges for each of the STMMAC_CSR_xxx
>    values.)
> 
> Note that the dividier constants are not the actual divider itself,
> as can be seen in include/linux/stmmac.h
> 

As noted by Konrad, the AXI and AHB clock rates are indeed unknown to
the Linux kernel:
[    7.739389] [DBG] priv->plat->stmmac_clk rate = 0
[    7.739391] [DBG] priv->plat->pclk rate = 0

Additionally, here's what I found (focusing on QCS9100 Ride R3, but
most of this should be applicable to all qcom-ethqos consumers):

1. clk_csr_i is connected to the SLV_AHB clock, named "pclk" in the
   devicetree. This is the source for the MDC. The "stmmaceth" clock,
   provided by AXI, is used for data transfers. It appears that the
   devicetree gets it in reverse as per the stmmac clock
   documentation added by Russell, i.e., the right order would be:

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 147ebf9b1ac6..f1aa2490bf6b 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -7111,10 +7111,10 @@ ethernet0: ethernet@23040000 {
                        interrupts = <GIC_SPI 946 IRQ_TYPE_LEVEL_HIGH>,
                                     <GIC_SPI 782 IRQ_TYPE_LEVEL_HIGH>;
                        interrupt-names = "macirq", "sfty";
 
-                       clocks = <&gcc GCC_EMAC0_AXI_CLK>,
-                                <&gcc GCC_EMAC0_SLV_AHB_CLK>,
+                       clocks = <&gcc GCC_EMAC0_SLV_AHB_CLK>,
+                                <&gcc GCC_EMAC0_AXI_CLK>,
                                 <&gcc GCC_EMAC0_PTP_CLK>,
                                 <&gcc GCC_EMAC0_PHY_AUX_CLK>;
                        clock-names = "stmmaceth",
                                      "pclk",

2. However, even with the correct naming, clk_get_rate() would return
   0 for both clocks since they are firmware-managed.

3. For GCC_EMAC0_SLV_AHB_CLK, the hardware documentation mentions the
   range of 50 - 100 MHz. I am trying to check if there's any chance
   of it turboing to a higher rate. For now, I think we can assume
   this to be the working range.

In view of this, would setting priv->plat->clk_csr to
STMMAC_CSR_60_100M from the glue layer be correct?

	Ayaan

