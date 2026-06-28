Return-Path: <linux-arm-msm+bounces-114777-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DFeWHOQfQWrplAkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114777-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jun 2026 15:21:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E2EB96D3E14
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jun 2026 15:21:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="X8b6/pTW";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=DEJUzswq;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114777-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114777-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B879F3023DFE
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jun 2026 13:20:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB1BE3A8758;
	Sun, 28 Jun 2026 13:20:44 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C40C3A8732
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jun 2026 13:20:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782652844; cv=none; b=hpfrfi3dAQ7Cim9LkxeL04xvFcbEzm3ZVIljn2h/uzvXqz3FezT47DQ0nJGsDkyQY30NFqdm6kCkX8rbZC9W1FVi+RJ2PwwZDUiv5TTAo2c/CsdoKhXI/mFUlpdZbEUvv04zFp/ijwwbhsWCMEbWzCqvSC3fp0VrddXzSvJTIZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782652844; c=relaxed/simple;
	bh=vXgbWLY4+y3P2AScEYP40daNhxf/6do7tNn3R0RG52w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aMRTkGTPDuJLpjZl+iUDRjiVEd1NWML5BvGBfDRaSNe2muhWddwJT/UqsZ04fIBbalVLQ92tmEo1PLFoq1uGA1C4xf+2pkLKSo1bhgPWYzA3kLUNUix02AgNZaeK6yYn90iJiL9tKV/pV+T6mVhUCvPNPxgfy+N02mJsIWTGPXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X8b6/pTW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DEJUzswq; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65SBTd713840373
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jun 2026 13:20:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=HfvEQyPaa+6RDmpQjnB/uXWb
	MmtvKDAyWdpXPrmNtrU=; b=X8b6/pTW4/+BGRTue2/rWhz41bJ5/bX7nYBPotbl
	PA1j1d8zw1adhhT7XCFUxs7VcnN3XLlNCtWtH8CVuJ9IKcHaznAC1IF7DXrg4IVP
	atN2skdm5Ed/oXXswb97ChCQeWHAEUtfOw4ObSHi66Rnze/d93xZ6GA6D/GJVgNe
	UNL6uaJpGcA5WvFjW5y2solcp6Y3Le0AFRbRz2hpLAJj/nSvlQDfYqpJSGVWxgt6
	jI4rDb8VOlj6sOECQspBszTj4cpuagkttD5Ph7zXEsdUhPoebb7KNI1UfTUmn59S
	zaypIjVQ90bONv/dgxRFUpcpZyJQAWnoVTNNh8YkE37f6w==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f27pf2u2a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jun 2026 13:20:42 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8e9c9d635b0so49300826d6.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jun 2026 06:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782652842; x=1783257642; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HfvEQyPaa+6RDmpQjnB/uXWbMmtvKDAyWdpXPrmNtrU=;
        b=DEJUzswqZxJ/1YhAATvihpt/T1ghS7rX5V2jg+XumBXAXibGjteVCTnlxIilUJ+L+q
         jPCFfLt1fPQpR96CDFkO3ClJADK6zo6vc22V6hP06Gtl4LctEc3bM4GS5Kx7CfmxOU/J
         7/yPyvltb5IQSnCIhzmh3goSsrV3TLWpOOPG7ZjnpbIIDH0nLuasRHc4IfpD5Uqk30PQ
         34SdGBafgY/RpiBKnrC3jnmeDGj29IAH1a+MXrLeNX35z1m8yNWsBdOXC0uWlkRkBLbl
         cCmwGFXnATN1/swqgRXpwIz1fmQAQubfax7a5jYElZTyTYi65BgA8+tT6pBaeKXKVhCn
         0IBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782652842; x=1783257642;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HfvEQyPaa+6RDmpQjnB/uXWbMmtvKDAyWdpXPrmNtrU=;
        b=Kkl+jver/wDpebAhTQkKyMXDo3eyMoqWK427mHHXk+4gzVyLo1+Tv7nvOXfFW7hUW3
         eJH9UQC253UUnc632vSWB21aNApPLOXbUEoZtBu6aL/AfGlEycKmJAjbS0njw03dRhof
         MaM8jx9qf4wA/T+ux4xosH2MgDqor2H9VoMtiR6OXTLd35HggoP5rUakrfqvFpxJBcTC
         CQZkwKxWyJjT/2e2qhFTcpimNs5Lq7rPMEmWlU599LiPw15PXYC5M+jas3jsQNbkEpZP
         5CC4jr46LkoDjqVioelwt2LD4BBUBkcQBkz0OZ8HqKKbBfK67OvOsi4cdmgfsS3X+Rs7
         ccuA==
X-Forwarded-Encrypted: i=1; AFNElJ/EUxTYa2g0u5RBbNW4+WbsB0F0rz74UMSj1CAs34JJ377VoN2UJXhvLeY8kVaLMo0ewBk0mzRrBYkQOPn1@vger.kernel.org
X-Gm-Message-State: AOJu0YzgSZ4sK4+8IIjOveCIFs4xKKvL2IIbe+DRK3tCFe2MFiYwlvV3
	3aXD5E0Q1Ei2n1cismqEQfh+Dg0l1GaP28JQiafc3v9iLFv3eoxf8s0XuV3aAZQQwCTsyP291dI
	ZD1O2d52C6X038p0tIZ8Slzu8Buv+10KkWe2/9MBvUCsrD2p3UtkRlcOMYxsMglWc1jqA
X-Gm-Gg: AfdE7cnYka5AWBiiKneDzbdT2GJfH+3apzg6E9UGdi8DeKNyuy19+g6phvIo3ECh6OJ
	guQhW0onWY95ozEyuLfGlZMAt8dUD9Nzgu5pz5XzaBglbZAuKoVCNEQe0gQ1HYwfqkfLqxrHAZ/
	2Hp1h4QZN4x0aK50tFByXN4e6Flt7FP7k0rfbD4ILVXkF+0NnN2Yb4wuK5/jayKro63fugJZQaK
	CfgrlNTjQjBkbgOli6+aUn8Ouw3lz9d/HoFDEOJhzc79Xl2A/zxsUwBnSml3ysWTRY11qCKNRBi
	2GjnJDEv9Kx1tqVtkg0e26Fcr6v2t2zNyXPRFDDEXXfSHqKyYC+aWqdtlqhWpEZY9Rv3UeOTqTd
	YnMiDwco6HTJxgLmluldwPMsiY9f+arw5r8xpwlQHSuJcL6556FIiagcPfcsPEbjzNorSkd/PMP
	tfpDBAmjXhQrZaY/3XiRfJLQuz
X-Received: by 2002:a05:620a:1a20:b0:915:8055:3f91 with SMTP id af79cd13be357-9293c9e8124mr2059969385a.43.1782652841717;
        Sun, 28 Jun 2026 06:20:41 -0700 (PDT)
X-Received: by 2002:a05:620a:1a20:b0:915:8055:3f91 with SMTP id af79cd13be357-9293c9e8124mr2059965385a.43.1782652841281;
        Sun, 28 Jun 2026 06:20:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39ad31a81adsm26997141fa.28.2026.06.28.06.20.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 06:20:40 -0700 (PDT)
Date: Sun, 28 Jun 2026 16:20:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Subject: Re: [PATCH 3/3] firmware: qcom: scm: Allow QSEECOM on Asus Zenbook
 A14 (UX3407NA)
Message-ID: <peinpqddb4t7u6bz6adn6u2yiar5zkvghayfrhidy3echs2ayp@fupvo2n5cimn>
References: <20260623-zenbook-dts-v1-0-3f80f680381d@oss.qualcomm.com>
 <20260623-zenbook-dts-v1-3-3f80f680381d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260623-zenbook-dts-v1-3-3f80f680381d@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI4MDExNyBTYWx0ZWRfX8qPHqJXkeiNN
 AWIFtdUyPbyftIcX0XzCvpLxzCeqOIUufJqQ8CYElVgRxi+SpRf1VUX50Br9KQZNKOCLOI7fkxZ
 ZYAiNr5nTXaioOrG1etG0NjK8esERmQ=
X-Proofpoint-GUID: VjmTYR4BoYGzf8uRfij9HUTN3C-9bKYY
X-Proofpoint-ORIG-GUID: VjmTYR4BoYGzf8uRfij9HUTN3C-9bKYY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI4MDExNyBTYWx0ZWRfX1RQKujtb8Hno
 i0JhjHOsSK/hS3n8uf+n6Vd8X5Ejkavk2CgfSYDlo4c4LhDqe/Msgm6avJZknDRpFEy1ePuiY/e
 h/C+dhL3/P7/Wgo5KEU3AJBP5HQsyD5IUza/E64jxautAp6ooNCmwb2jeouXWdXVgQ1m1n5jhpY
 aVN2MeW6flkLGO5uoJRblkUG//MCVSZSQChIEdsPVZGL+VPE7l3znQZcBTffyzy5HGszcgP2imC
 19JTJLdg4pCMKB91swBE2FoW/A1FK0TyGutp0ZpV/mo2BHzkw0aLM5+eRDVnsUg/hyh2JhdeNRi
 0mH6eGuD+KGNG1XrAWRHavttcHrXBbZPlZ0pMHviQUNO+UIK//o0LWclGRdbSzKVoayWXriTpy8
 Az6MF1J8pCaaaQZfG7ERl5VTn8atDsaUGqOAFHScajpECT4GHx70/v/09e1ObS+ySwnNj/PELeJ
 lRARytdloV6SxCJndHw==
X-Authority-Analysis: v=2.4 cv=R7Mz39RX c=1 sm=1 tr=0 ts=6a411faa cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=AirSDpfm_WjXHfc9IO8A:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-28_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606280117
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114777-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:bjorn.andersson@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E2EB96D3E14

On Tue, Jun 23, 2026 at 01:31:51AM +0000, Bjorn Andersson wrote:
> From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> 
> In line with other Glymur-based machines, the Asus Zenbook A14
> (UX3407NA) exposes EFI variables through the "uefisecapp". Add it to the
> QSEECOM allowlist to enable this access.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> ---
>  drivers/firmware/qcom/qcom_scm.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

