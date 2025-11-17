Return-Path: <linux-arm-msm+bounces-82073-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4038EC63C78
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 12:22:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 986094E0336
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 11:22:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 707952550BA;
	Mon, 17 Nov 2025 11:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PPjZwLMx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Th8N+AKM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D96D023BF9E
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 11:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763378573; cv=none; b=ACeeEfnL4L2RquNMddTrztXZTrmw5RacIarQrsE8+gvz6/r92A9qLbtevrN4JS6DYcgZnpxXGd5eJ6LVWlgTSbegYPTZ0k17TiUbhT4iOG9jc0arHfolHmkyt4Bave8j1mCP8oXGFfTOI8ceDXozU3gGFHmCvqZ6ngxLXZ5KpPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763378573; c=relaxed/simple;
	bh=4PAt8SgcgjUDaigP16ncjdeh20S/7KnOz/cnpoWkDCM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fDhtyZ9H0HmEDZS53k18z0JvSEDL3eS54h1GfjiV4I6ttm1KF2R+mm719dabgZWSgLQUdT/V96sLiEhAiEbhbRBDkBljskIRZ6XrGChL3Q2NOg3ThiCwQYINp1jVAT5l1tbOjTvWGRjwwZyQWhMeXGjLkQLXiTr8+ksEecHKqAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PPjZwLMx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Th8N+AKM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AHB7IQm2793251
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 11:22:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=saGdFln8ePIC2h1NNo48wOUc
	8mA5/pec4NdFBXiEC9E=; b=PPjZwLMxt8qa4rC6Ww90bbmIwDL6/zWblIaqLnFk
	AGkT/IYzz/AKY7tQN0a2+LNQ8VytzUdgz+jHQ/lJfV34HKGMUKbxxueiHXEC5Jsg
	8V7QRdFJ/e7g1m+dUZElycPknKLPVvr49ZDdrHWG5kbQXf8LAU4pzgW2048BMTAz
	Yt6FyvI39lQcJk9kTeIIVDCH2RuFQVyTVQhbU6tK1Ij3VzdN3EDex0DpHBq4heaP
	lEgPZB83KyPt/iOHoReI97HrnuhN9bUVa9LfxHSxx9B2Ke2FyZA9yE5p7Bsa/ZyG
	V8B5k+ALGJkvrQ6jJ8iy4QP3vdL4343ZJE0GrT+Vo70cPw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4afu5bhck9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 11:22:50 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b2657cfcdaso522664085a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 03:22:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763378570; x=1763983370; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=saGdFln8ePIC2h1NNo48wOUc8mA5/pec4NdFBXiEC9E=;
        b=Th8N+AKMXD3YXgKo6KmzmS8EBmY7x0Od0HrqNrlBlARAYsdDh6VbFM1F1sxqYnyv8O
         h3y4QmVl13OPMsleCViVcdOgDBTbJwrD7EcIClYvqJY9hsAGI68EzUUOse3oP5UilWRD
         da2QgVucrqNmb4FTAlnQWJ4QWMqKtsB2sL+pSMjh48S1LmV7uwsbxulxcSiudt95rZLX
         R0vFvP/MWvI+NVqgfqMe2wYPcDTTm+5IXfFFbu1EYwVK6VoyxsJbl8f5gG/RctZNCmei
         ZWPSJc4fgGiypCfpmGYAACrc/5bxw8BWdaUZZxj2SutDOffSRhwjlOIfrmwPd6UkqjFM
         5zrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763378570; x=1763983370;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=saGdFln8ePIC2h1NNo48wOUc8mA5/pec4NdFBXiEC9E=;
        b=S1W1nEQ5yFWHm9KNgp6EpOp6SFx3dGIMwLFjRaOOPkaanm+Q37+F6o983/0o3Z7ZgG
         HSXfEcdKaKJLB15OMYqcw5cv5lD7M6fF1Ie3/MCIwsSqsPovVapZm9Bg1NMuqaMrKJZN
         /IwG2Be3yDc2wLtKFRBl1ajIDtNN8tXFETCJp/k0HdjDq/9VSYfaU6DFNQg+DGMu4gvF
         qZU+2LkF9ncIVwpVWDSC/fpdJuAE3EE7WKrgEKteFi+DbOozCVSMEqUBSuvbBTzRPje3
         3aYJjFNtrBfaAd9pVfJa9umuMC+iMsY/UD9DMRVoQH2c+cjy8pbm+BSTlwCNjMoPwpoQ
         QuNw==
X-Forwarded-Encrypted: i=1; AJvYcCVO752MvkA6B1lA5NOVwANSG10sPDdJo3DtoEPWLnVDisM9DOGf1rEETlEf0hzZtup4e0cODFkbEpJwMJiI@vger.kernel.org
X-Gm-Message-State: AOJu0YwVeoC77M/m0x+7Ut14fRxA8spj5HPs33SIgjKn09Ao2Xs3Hf2M
	hE5AqYPSweGVSxWu7upu70obLg+FDHYBWds73SK0hwm9hcMqCul5joJuhPiiQ3NQdUHYw9nl2dx
	TBDZUxzCsYVmnxEZI5HIcY8miyguqWrxT7g4+Au4igOEc9pIhK1QqVihm70RCqL603PZy
X-Gm-Gg: ASbGncty8D18jHhR1eL++PeOtxO/E10DjjlvupIppzv8LUt3423IrZ3U8nwxg3eWZ/T
	jdXjBEk3bJnEOMxXxKID59U+eVNUnvd9j1Qmuk+GJIvC2TV46Uh8UUuWerAzmzNfQ6XU4uY/JLc
	ZuOrGgNrT1UO3Sf760ORhwYrxTdIN86lGLt/Xf8CI+CdP6YD1kef6ODdO+Lg/OueZZuZvUZVv5c
	Eha8ThRGKwwREyUY81iP9T1y3dHyLgWceOGqFbvKCf1mXr4OejfBIe8V9EKq7C33b+WaZeC6EK+
	crwZAFz0b4yNd5ChGNthfSh0JojETtyUENxbsPpqhyPHNBmceFRfk3FP5qf2KZO1GF/MC7JqhcY
	c2aF30jwF0dd1C4u9c5+BdrR/oQ3cwCXeOMmN1MFQWdGUm8I+ecr2RQHInOKfaTORfyHw1Rq3Cz
	hMbRh7QAF1U79T
X-Received: by 2002:a05:6214:f6a:b0:87c:1f7c:76ea with SMTP id 6a1803df08f44-88292686aabmr142405906d6.44.1763378569877;
        Mon, 17 Nov 2025 03:22:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHM6xHarG0Uuic+iXSpLkf0hpd/24gE2X2Esqxk+QMZ4WuIdIQSPR5TNvKK4YIs3v4H/ZZ2Kg==
X-Received: by 2002:a05:6214:f6a:b0:87c:1f7c:76ea with SMTP id 6a1803df08f44-88292686aabmr142405666d6.44.1763378569362;
        Mon, 17 Nov 2025 03:22:49 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-595803b305bsm3044303e87.28.2025.11.17.03.22.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 03:22:47 -0800 (PST)
Date: Mon, 17 Nov 2025 13:22:46 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, kpallavi@qti.qualcomm.com,
        srini@kernel.org, amahesh@qti.qualcomm.com, arnd@arndb.de,
        gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        ekansh.gupta@oss.qualcomm.com, linux-kernel@vger.kernel.org,
        quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, jingyi.wang@oss.qualcomm.com,
        aiqun.yu@oss.qualcomm.com, ktadakam@qti.qualcomm.com
Subject: Re: [PATCH v3 2/4] misc: fastrpc: Rename phys to dma_addr for clarity
Message-ID: <lxa5lomfvjf6e4jxt7c67cj7q6blflvc3lpmclybag3cumxtxb@xnte42junlmc>
References: <20251114084142.3386682-1-kumari.pallavi@oss.qualcomm.com>
 <20251114084142.3386682-3-kumari.pallavi@oss.qualcomm.com>
 <q46rupdndsmeojv4szm3qbtcwu6n7x2ukwrrx4jd7rph7nlq5b@xiclcnpx7rc7>
 <83112aa3-5998-4030-98cb-d3d5ee7c0570@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <83112aa3-5998-4030-98cb-d3d5ee7c0570@oss.qualcomm.com>
X-Proofpoint-GUID: pzWKE4_0eJvv7a2oZB4yYf_7YtiVhRP7
X-Proofpoint-ORIG-GUID: pzWKE4_0eJvv7a2oZB4yYf_7YtiVhRP7
X-Authority-Analysis: v=2.4 cv=Xvz3+FF9 c=1 sm=1 tr=0 ts=691b058a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=poC_On1pFPmngpHC2F4A:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDA5NiBTYWx0ZWRfX0+Br7q0msRHS
 0tqJI+J1FBe+sc23D96rLzJ+PG41tbKTLv+pAUDYdFcrqjFnPdD6KFtvYMJlDvlEXAvBap1WTN+
 XPGgysw9i6svC7QZNZWBx7tbMMnHuQc2afvqeFgKPOCdDZPeNFxubS9/Aqq0UD/eXCCt13XakHf
 H9iNfmNmEw+BhsYICpok0a5qDpw/DYlltuiBgoPljQgOgTesp546ES/1+tUJYSk1NdIcELYN3K6
 zDYkEpnA1rHu4E72eD2iQAVnj1vr+xE9l37RWj1+o/TIr+0NRUbAoB8484bvjmc6i1Mum6JU3cO
 UC/i+IBkNd4ihNibFP1xH2vlUPviwpOFMTXyQ0IPalopMfF153vBxnjGqFqo+6jh6kT+4TLEyTw
 HBQcetR3uN4okn+6FbDxxrPP4Zb5xQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_02,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 phishscore=0 priorityscore=1501 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511170096

On Mon, Nov 17, 2025 at 12:37:33PM +0530, Kumari Pallavi wrote:
> 
> 
> On 11/14/2025 9:14 PM, Bjorn Andersson wrote:
> > On Fri, Nov 14, 2025 at 02:11:40PM +0530, Kumari Pallavi wrote:
> > > Update all references of buf->phys and map->phys to buf->dma_addr and
> > > map->dma_addr to accurately represent that these fields store DMA
> > > addresses, not physical addresses. This change improves code clarity
> > > and aligns with kernel conventions for dma_addr_t usage.
> > > 
> > > Signed-off-by: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
> > > ---
> > >   drivers/misc/fastrpc.c | 76 ++++++++++++++++++++++--------------------
> > >   1 file changed, 40 insertions(+), 36 deletions(-)
> > > 
> > > diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> > > index ee652ef01534..d6a7960fe716 100644
> > > --- a/drivers/misc/fastrpc.c
> > > +++ b/drivers/misc/fastrpc.c
> > > @@ -106,7 +106,7 @@
> > >   #define miscdev_to_fdevice(d) container_of(d, struct fastrpc_device, miscdev)
> > >   struct fastrpc_phy_page {
> > > -	u64 addr;		/* physical address */
> > > +	u64 addr;		/* physical or dma address */
> > >   	u64 size;		/* size of contiguous region */
> > >   };
> > > @@ -171,7 +171,7 @@ struct fastrpc_msg {
> > >   	u64 ctx;		/* invoke caller context */
> > >   	u32 handle;	/* handle to invoke */
> > >   	u32 sc;		/* scalars structure describing the data */
> > > -	u64 addr;		/* physical address */
> > > +	u64 addr;		/* physical or dma address */
> > 
> > Can you go all the way and make the type dma_addr_t? That way you don't
> > need to typecast the dma_alloc_coherent() and dma_free_coherent().
> > 
> > I believe it might complicate the places where you do math on it, but
> > that is a good thing, as it highlights those places where you do
> > something unexpected.
> > 
> 
> While this not strictly limited to holding a dma_addr_t.
> Based on historical behavior, when the FASTRPC_ATTR_SECUREMAP flag is
> set, S2 mapping expects a physical address to be passed to the
> qcom_scm_assign_mem() API.
> reference-
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/drivers/misc/fastrpc.c?id=e90d911906196bf987492c94e38f10ca611dfd7b
> 
> If you suggest, I can define it as dma_addr_t and perform typecasting to u64
> wherever required.

You don't need to typecase dma_addr_t when passing u64.


-- 
With best wishes
Dmitry

