Return-Path: <linux-arm-msm+bounces-104957-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KF2nKLeN8GmVUwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104957-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 12:36:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 9708A482BEB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 12:36:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id F29A2303158D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 10:26:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5B183E958E;
	Tue, 28 Apr 2026 10:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YMMegQ66";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YT3vXEfQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F5E83E867A
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 10:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777372001; cv=none; b=IzDXd/ZOC5hs+8Cj6JYBkAaf1LmD//wIB3SyDhzqCNgNr2xTONEiRu/0UyS7pNGmYXsSqBf+MwPZOsMwtdXATaoRomAEvnomJShroXSjdrfuFyE/Xh9e0kvMPOT4uQMc9WgqfBeHfHVWP4Q0fIIqgFXcYYrXxuJ5nfuHfs0fvYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777372001; c=relaxed/simple;
	bh=27VOQfbN1vMIhcKK+0PlFGn9GDTl1QArKYdMvHgjUqA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iB3G0ZxNgZQhEP05nVDp6V6Ma7JPmcOdCl6CyWszK3q2Feel1s9pWZrTXXUOMu2IKpiQaw96ohxjAMkpKbgtvpzDbMmRX3Sfs/XGvrBolvFgXaLjuBuNzC1UxXjQuaSp9FY8D0Eldy7s8ww3cbH+iAXfKwhnge9g5gfRxmZOKmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YMMegQ66; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YT3vXEfQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63SA3vOt3275100
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 10:26:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=8AKTk28XPgJmHgqTSTU5AnTp
	0W1XYNRTdTpAHvwrNYg=; b=YMMegQ668LEBrBOIEPSpxiHMdZHKjnAZZ01kAiDK
	gxa2BK0fXSjtCdulMe4phiAww/17ADVuCjN9ZR5zUdwsg19tcMCL2Lalj3fWPhWG
	QB5nnQm640JyEYHlouiXUncixpvPgufeoDa52cWw1mRKjcnV1qaCHN6C2OFm/vyW
	glS1dTWoHRFSlktcG0s2GQYFQtbkQyX2ppSqtGoYRZxzGR5OfLud0k4YFaBxiE6T
	0XvWktlI4l6EbRRJuzQC6kVAeeyOnB3bMzhcgwjKgZL3Uft188IrFbIaNGzqtp54
	BsSpt6FnDiIEtgK38rPaFoPTFXh2mr5eauicSAlGB/HOOQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtttjg2h0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 10:26:39 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50e5a336b44so149413381cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 03:26:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777371998; x=1777976798; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8AKTk28XPgJmHgqTSTU5AnTp0W1XYNRTdTpAHvwrNYg=;
        b=YT3vXEfQ9xU/ZXpXMtVCXccZSmW20SL7EDywBI+qDg3ZY0Qn7ces0C1J8HucrQ+wsX
         HX2Dlnm1/FC2vkOq29PYEkUWEXataad2sXsQaVoud/vFSLXhMD4V5NcDDVPdv6fV9/Pb
         GQDcnmnqS9bUh/02K2OVxhrcyZbDS2IGK4EzEnRJZLEDMs9OwpZjsFwMKdQ5YVewCk6J
         otpqMySvEOVQ8EIdRm4F0aSKN1zEizxHkAtXFRhtYEKImuSBj8iTNDC7oIcItLawiMal
         RJCkf3bAVPaX6WftZ86V8qkwM6LIc5YjqMipd0VEZ/M1UG99Zc+mbw9+QN8rndee9o+f
         i3Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777371998; x=1777976798;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8AKTk28XPgJmHgqTSTU5AnTp0W1XYNRTdTpAHvwrNYg=;
        b=cPF68QhjVPpvV7DDOnd847kVGvrwA7VeLWD/f5ucsN0mCtcShFIoyBF27HlTjr3zq3
         IUvX8oVengS2KRVSmSyeKNHsoOo60YmPXJjLmwilgslRX2YWxKJ20ltCGf1Fnx25oPdd
         XJZ3Mry8XJnay6v1h/1SsUKRSQW6L5/SEg9dhvI0+9Vl3grOfmEgZ2TCZas5gOaQxjXk
         pcSCjKzNOuxuspBQ3tlFkbk9zcriTToIiY3ffggyzSoAwLYmj1XVpFnN7xduUMvrRqr8
         Xu2QiWB0ursWsv4FpmNidpTuXFFACObAYRrTaa3w02YSLLaSWwIifsGNcx/gR+rIKUyg
         5sww==
X-Forwarded-Encrypted: i=1; AFNElJ+7viO/1Lj66Cf2y/x4+DiSauXPdWgzU+5AfXdx9azT+c8iQTKE11WF0idHS81Mwtp9mHSh20dhgIEIRhoo@vger.kernel.org
X-Gm-Message-State: AOJu0YwM1NwnnpXqgiwbL2wwDO3PpzknMPpkLRU/fLI6ukvg8E4gPpPu
	LzlZg0cjcCa6jhCSPAKBOwWJDPpN/AlBWZg2sTfApARXZutzWBFQn0eOWazZ6Hsv4ldVpBhAnS4
	WvPNqml2pSJuktxVbdZwTeghCrJGQzdLXXBIWmpxaNVISi/sUL7TC823L4RQtEnyvANrcTcBoje
	HG
X-Gm-Gg: AeBDietkmOVCtz2YbXSRg+1jEhxEPSeJb6UPiz5QWKhDCpfUxrMtq3I/9Ir3pjUtN8g
	zxFpPwvJxSNW04p3rhZxZVVNY9R3nS8KG7pQp0rJuSYwmIN35BH6ndaFh3jiYHf6Ji5Ip5iZHZu
	6MxoKYlSUebKIOtWFDOp8AR57OK/D6AIeq5JBUkHcP4RgzPfMZErQgzmvUkKqYLONcIj2PZXufy
	DMD6/b6IFxmxKzDd/QuVoD8UmJJdvVR/FDugWQrgSf3/n+vp6uSwIWWqFOpa1wMbyg8m7v4ML0b
	6bFKin2FhieJWqmqlwzIyveuAZwQhKiRq5TNNJYgloK3HYaXST3rP2dEPqG76leYoMgva7ghmSr
	ktSbjutcxfBGqLqH3BY/IX6y48VFZLNQXg6+RAc8TAvpOt5x4LI2Mk1PqBJSkNwBhtSOidAUb33
	iiIQV3H6tUmqrzT15cSIQYfT6xrx22VpIsda7IK091Q1rFDw==
X-Received: by 2002:a05:622a:d06:b0:50b:8b8c:f68b with SMTP id d75a77b69052e-5100da87a60mr25743881cf.39.1777371998224;
        Tue, 28 Apr 2026 03:26:38 -0700 (PDT)
X-Received: by 2002:a05:622a:d06:b0:50b:8b8c:f68b with SMTP id d75a77b69052e-5100da87a60mr25743581cf.39.1777371997776;
        Tue, 28 Apr 2026 03:26:37 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a7463f5e38sm510022e87.52.2026.04.28.03.26.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 03:26:36 -0700 (PDT)
Date: Tue, 28 Apr 2026 13:26:34 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Lokanadha M R <lokanadha.r@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
        iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iommu/arm-smmu-qcom: Add glymur MDSS to ACTLR client
 table
Message-ID: <rlm5shkccrpbijkuhrkp6evmfwxfsvlifhpmw4utnjryqtgm7s@tv6wyksenaji>
References: <20260428-add_glymur_mdss_compatible-v1-1-8416df5a26f4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260428-add_glymur_mdss_compatible-v1-1-8416df5a26f4@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDA5MyBTYWx0ZWRfXwmx03ESxw7Mz
 DbWQdaCvrZjC3TwfdNvYhldt5j6UWyrMn9tM6s6jXBH2I7/AZm5PkX6QjwGVqiSl1C9DTigLVr1
 GUEO4dtfvm/j2WYKA6FMNu+6lR8y3JCPwPsG87rW6N+fNH4NrzsuRaFJaYWPmPHVkdX22VgE3z2
 7nbmvqWDEvncz5Hdt7SbtXTOuaGvEhxUcitddSgpySCgJ6yWlv03EW+8/mUKl7HY0pd4j0wM7xM
 4215nZ0z8OSyovypedUIpA0441C6H5BsWnybcdvfsUSI8WVJeVguTx2TnZvCiaHfronJFpX1W45
 waRXIbJfhfAWu+yKppNvRAAZSur5m2s9xVrNWkxthS/SzgBXg68uxMFgq8rd5Erx/SqWB7G6jK0
 p6b1Ce2vWpsuRkYktEVvkIn85H2tqVpGzOaw/jaoQjo2tcFo2tY95MACECJtRfOQJlEKycbset6
 CsLU2SkTQOs5lE0oxQw==
X-Authority-Analysis: v=2.4 cv=TZKmcxQh c=1 sm=1 tr=0 ts=69f08b5f cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=WvJH3o8hvjs2AAOsRaEA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: nacJm5hQCKwllSlqIkslYQXj0Rm2y6YS
X-Proofpoint-ORIG-GUID: nacJm5hQCKwllSlqIkslYQXj0Rm2y6YS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 adultscore=0 phishscore=0 clxscore=1015
 suspectscore=0 bulkscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604280093
X-Rspamd-Queue-Id: 9708A482BEB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-104957-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

On Tue, Apr 28, 2026 at 03:13:50PM +0530, Lokanadha M R wrote:
> Add qcom,glymur-mdss to the qcom_smmu_actlr_client_of_match[]
> table to configure the SMMU-500 context bank for the display
> subsystem (MDSS) on the Glymur platform.
> 
> The settings disable the next-page prefetcher while keeping
> macro TLB caching enabled. Without this entry,
> qcom_smmu_set_actlr_dev() finds no match for the glymur MDSS
> device and leaves the context bank ACTLR at its reset value.
> 
> Signed-off-by: Lokanadha M R <lokanadha.r@oss.qualcomm.com>
> ---
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 2 ++
>  1 file changed, 2 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

