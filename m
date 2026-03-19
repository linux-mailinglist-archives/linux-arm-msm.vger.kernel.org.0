Return-Path: <linux-arm-msm+bounces-98770-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wA81I0gLvGkArgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98770-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 15:42:16 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A7BFF2CD0E8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 15:42:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id AF4FB302BB90
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 14:29:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7B9B3815FA;
	Thu, 19 Mar 2026 14:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P5oZqVRv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IUIMmaLf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5728F372B4D
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 14:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773930571; cv=none; b=cJPBRcr/Fj9bOUs6dhvdl0n7YDs6rMT2owO/pmGih9UvEDdJSttzGZsfIksj4UP0XHjTHALJKYSKFDzl0znXLeCd6hsiiwdeG7o2NlZGx8os5VbboyfG1o7t3Fp6iAepV5wfPDm81tCiaZnC3XRVU1WgBM4KOl5jDnXgXmlRvr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773930571; c=relaxed/simple;
	bh=iXiANR9PmKDbfCmLu56gNubq2anpPH44+zvIM0aRT+A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=odjop6KbLxSqpqNPoHo9BpMzpaWaoOQnmjboE0GmFWfFoQbcqCYrfRR5W7qNr6f6N8w4hmhcpc3z2ll+/UZIOM0ici1CX8xw5BKXhrHPEYGpL4TbOcQbMblI1I2O81Ly9TkpkW6HXy/FV6qZ1JaqZqXFG9w4RypNvObOtEQBOrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P5oZqVRv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IUIMmaLf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62J74AN21999448
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 14:29:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=SBBJRl3WE/dPyMZ9UaHMarXx
	IkJePlMXITr7YBuGRtg=; b=P5oZqVRv+nGrRxmqAj21Pg1hO/0z2R75kuDs+x0n
	EDEvvx1zUpZ0LLd1id2gqBRSBQ3uaLF1h0MPesm8jLAooD6TzdDJb4V4++xsvrN3
	SI49Kd/5+UkShG4oUkEVd4oyQQxXJr5eSzsH98ta/fX8uwKRF8vgpkq0CP614o/F
	Frf7ogU5yPPLTbtmbkP3erngKSdDkrsptpoKeJxogweI3baIo625x5yIs7MIC9yu
	yzOrjX1cYLORu0cX26BFUiVt2dq7oMPtN7q744H0KE2LJWtJC36pYGQkW18qf//v
	R4IbSpEYxMvb1aii6lUQT3A9lWC4Wlhv/qebr+5eQ9uBbw==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyscb5bhq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 14:29:29 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-5ff9edc2158so1410513137.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 07:29:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773930568; x=1774535368; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SBBJRl3WE/dPyMZ9UaHMarXxIkJePlMXITr7YBuGRtg=;
        b=IUIMmaLfSpsdP3bKHoFFL8cvIQJqIu1hcF5qBqIWjgo6lI9k2Q6S3MhZDzvnfXKhbL
         Q/qeK9s3e48HF6BUAAhHT1aGPbg58zo6P4ZC3YjokFGm/vc+9CIKahuVgnsJRshPebt9
         9ZP7Jd1YkvSDqI/gTTwPtxchvMWE2WNZ0rlzHEdyPUl8lXooBkvXMgf2bHTHfCVk+zEN
         799Hf331Xtuu2LOazU1s23QX4//wVg+e8PkOguI0FaciJ6Ts4rbxDb7HZ33D3j4k2iJH
         V7cagoLhGeR/ELUn8oS8H5oGnzLQ1AFLc5llMGiCEPBhCyEDvRQSFv1ggLbiuir/LK2t
         pjnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773930568; x=1774535368;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SBBJRl3WE/dPyMZ9UaHMarXxIkJePlMXITr7YBuGRtg=;
        b=cCTRWUJGbvP01H+u30qvBKXjPpBmZl4Ac5dZscnr//qtLj8/HSpOZKSVRxbxzxoOpA
         mij9aD6nHfh7SBO+fFv3mnO2z2E0rqWFlzZ5ajxwMP2h2SfnwR+IygbkboOuOk0AJb/R
         RCtqWAPFBiu0spTElu4wMPfXC/MZ7jWOi+3la2kNgv/KemnIGskIdbL6ebWm89yUjcK3
         QUUdMzkIm8vPl/wg66p3ie5VSyiGzOYcmfpOBSI2GJiYezzcgTVY9l6klRg6KEZCwxMr
         e4aDu9lZMq971oPgkMS0uYMaD0OXes89Q1KOZbMyeKiNxroEFKKshlFSKkWHAktnQHKz
         q+qQ==
X-Forwarded-Encrypted: i=1; AJvYcCXbdA2CQtgZEBYyrFT9pNZqL5R6gG5B5czh750ccbk+AYGTP95i0lAJ3Re1vlTeAUZ/Tn6WvVeahHyhyzxq@vger.kernel.org
X-Gm-Message-State: AOJu0YwKrhn9UburNC0DPLEqcKjwX65o/E2xnt8mmb8BqR+xL4spUSX6
	y4oxeQQgeG8YEQ1yBrfmyDWsiPcTpfb10NmSeyGrx2P/bBisBbypBidczAL6aJs48B6uJrgmWYU
	C8JEVRQ80Xpo1GjZXy+SOJz9id+RIPtO9t5qIBbjnnGTIx1b/rN8c3fbPKqvNJD6PWveiTjvlj3
	3z
X-Gm-Gg: ATEYQzz8eNy6O0hwNc5gIUnpVkYre7nyOwLDnBO2P5vGvjTEnez8oVJo0hh6TogNbl8
	zhjZkA8HmwBr/7zkh/bzX7XQv7ozkfJh/wEb0IDHdM9/oAZ8f7pvVPWxmmablgDXVgs5P+PhubK
	cyZL6hujbPW0kFdYhF1ksUfm7VzP3iW4Y3NG7VuHMBONYyUGGkU4Tg8RlvFLmW5qzMLli0skCEu
	JjjfMDBsn13iikc7WPh2pTy3+kijAK7psIUn1SB+yMGDxGylE5REgA5tl9UmmMMVDmIvZAA+keh
	PGwJV6Ib8QT29BRTkhOvF5km4KcuS6w/sWEbETgjLhUK7JVMG/eSfcscrOpYcsVFnC8ZR1b49Vv
	eyj2nzzJbB+T3pEh+9OpwRXedZuS7y8XScQ==
X-Received: by 2002:a05:6102:d89:b0:5ff:9d74:967b with SMTP id ada2fe7eead31-6027d330b13mr2880725137.20.1773930568456;
        Thu, 19 Mar 2026 07:29:28 -0700 (PDT)
X-Received: by 2002:a05:6102:d89:b0:5ff:9d74:967b with SMTP id ada2fe7eead31-6027d330b13mr2880718137.20.1773930567849;
        Thu, 19 Mar 2026 07:29:27 -0700 (PDT)
Received: from oss.qualcomm.com ([82.79.95.133])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486fdba674csm3486515e9.0.2026.03.19.07.29.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 07:29:26 -0700 (PDT)
Date: Thu, 19 Mar 2026 16:29:25 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v3 2/3] arm64: dts: qcom: Introduce Eliza Soc base dtsi
Message-ID: <whoikp5tdu34gujfjqpopbhywzj6dvcxebywtwufip6jxdwp2s@oepb2y36a2hw>
References: <20260318-eliza-base-dt-v3-0-8a50bd2201ed@oss.qualcomm.com>
 <20260318-eliza-base-dt-v3-2-8a50bd2201ed@oss.qualcomm.com>
 <fc42719d-3474-4883-859d-b12a1c4a5cee@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fc42719d-3474-4883-859d-b12a1c4a5cee@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: rIOXz_BqRNGsdiCxrePoHaSz5oEV5eFM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDExNCBTYWx0ZWRfX7QHXR3D/toAD
 Vmbnd2N9yMzt/Wsu9gLXOawsYEor+vu4H6ZcXJnXMI2jtWImbuwZU6dmqEoxgjrWa5sKc59izkN
 8AnzEgYS24ujzbLiZIbES5I/8B7QrLXPnkHMYsR0BuTelwPgUzCAJxgnb0hYh7MnN+HeBE8sSoN
 YnlA+iMAX1w/2VCrOabiJt+eHqAuXB4j/mmm2ipgn9iUEkLelC+UK9KtJw0SLE0RyyIg8gXH5+R
 KF/cMgmts7c2ITJm09wnJMj9y+FhOmY+p+j+poBCDD3tE8CUN0cp+zVfkdtxuS/Fyki7aL50tvJ
 GDcsRp4UuMgZOmOjg88NUgVFQ2Qe5+aLGomf0rhHeMq5nRpJLL9wDpUUTroPCY/dp8rC6aOmWB5
 sc/wo9wmpB1/30S7sQ9jO+bT8UmfimJFmtoIYnIYWPf2Xq2fsQRryC9dFniUvLlQchSKKgx1HyD
 IC2+qD/7/P6ugdjyQcw==
X-Proofpoint-GUID: rIOXz_BqRNGsdiCxrePoHaSz5oEV5eFM
X-Authority-Analysis: v=2.4 cv=PtCergM3 c=1 sm=1 tr=0 ts=69bc0849 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=iKs3dpp2RB4k51ZqCjcyjQ==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=r9zBADRPwHUBQTTAkTcA:9 a=CjuIK1q_8ugA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_01,2026-03-19_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 malwarescore=0 spamscore=0 adultscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603190114
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98770-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,0.1.134.160:email,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A7BFF2CD0E8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 26-03-18 12:18:09, Konrad Dybcio wrote:
> On 3/18/26 11:19 AM, Abel Vesa wrote:
> > Introduce the initial support for the Qualcomm Eliza SoC. It comes in
> > different flavors. There is SM7750 for mobiles and then QC7790S/M for IoT.
> > Describe the common parts under a common dtsi.
> > 
> > The initial submission enables support for:
> > - CPU nodes with cpufreq and cpuidle support
> > - Global Clock Controller (GCC)
> > - Resource State Coordinator (RSC) with clock controller & genpd provider
> > - Interrupt controller
> > - Power Domain Controller (PDC)
> > - Vendor specific SMMU
> > - SPMI bus arbiter
> > - Top Control and Status Register (TCSR)
> > - Top Level Mode Multiplexer (TLMM)
> > - Debug UART
> > - Reserved memory nodes
> > - Interconnect providers
> > - System timer
> > - UFS
> > 
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > Co-developed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> > Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> > Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> > ---
> 
> [...]
> 
> > +		gcc: clock-controller@100000 {
> > +			compatible = "qcom,eliza-gcc";
> > +			reg = <0x0 0x00100000 0x0 0x1f4200>;
> > +
> > +			clocks = <&bi_tcxo_div2>,
> > +				 <&sleep_clk>,
> > +				 <0>,
> > +				 <0>,
> > +				 <&ufs_mem_phy 0>,
> > +				 <&ufs_mem_phy 1>,
> > +				 <&ufs_mem_phy 2>,
> > +				 <0>;
> 
> power-domains = <&rpmhpd RPMHPD_CX>;

Bjorn has already applied this version.

I'll send a fix soon where I'll be addressing all the other comments you
had bellow.

Thanks for reviewing.

