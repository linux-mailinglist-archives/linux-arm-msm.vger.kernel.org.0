Return-Path: <linux-arm-msm+bounces-82920-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E70A0C7BDD2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 23:32:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 615EC3A6A7C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 22:32:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59E5E2D6E6D;
	Fri, 21 Nov 2025 22:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kH7WqefG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XTs4kY/S"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8BCA2475D0
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 22:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763764366; cv=none; b=BsJ1Bul3guJVG68pecFtNaGjkXabLveSgIIUvDyLYDJkriIANHTECIegmlNAaBiYU5UqexztZigIBMUWqY/nF/BUGY2AW5flLYXTBHpppQJqMl2UKYi1M3Vyj5XAxQzCHu2wAqB7SLrOwohSU6QkfVgUTTJIn/twBKRG5xfW56U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763764366; c=relaxed/simple;
	bh=5A0Q77sAPpGijX2UqsXmaV76gU4BZ0C2GTRYj7Rq/zA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gTnPdxTb/q7OsdIwydslnT6cucZGisd3El8nsmOdJ0Q7RAvLnVTMqORQp1UmE8WExkIUAa2FtthDLCskaQcH8kKoNAuwuthc5IuuYv1d99uqolPegdyAmc2r5+BWu92QPuIU3LCwpfR2gVYTEmfrB3nTIwhmKMd8f6TvoDNpUUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kH7WqefG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XTs4kY/S; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ALCl8cb2831865
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 22:32:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Pr453cERSmy1/J9J1l2SfVrp
	0cwlN0LwGQ0VuFEXJdQ=; b=kH7WqefGVNsFQj+gaR6mLFWKT1rqgfx9RKoagdyk
	MazkSWDV1TldXVvbJlvNhfQBaB2vAPc12HMsrllpzzq+C8U+RUTkfUTnfcSFW+7g
	ChHV8N/1BDarRlqSM1ql4cCgubBG3UqqAVRxNZU3HwVI55608t9MIkoYZVe1GRoJ
	idSLZpxDTXVQ9qsrghEqbYpv2vBrcfCkSXzDwZvay8oJU3usYmfNOwvKZgLnTMYI
	JnCgv0B/5E3IYNCapvMfwJ7cOe3B+mS3Jneg5jvOw5IkClAxRRxUGAWsUuC7SWaE
	oBldQ2dUrpr8GUTtyQQJg9ntnwz0GonSLABUv9EB2p3JYw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ajhyq342s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 22:32:43 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-89ee646359cso745272485a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 14:32:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763764363; x=1764369163; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Pr453cERSmy1/J9J1l2SfVrp0cwlN0LwGQ0VuFEXJdQ=;
        b=XTs4kY/Sd3A2CyXcoUvR89IAPUAwG0HUYQGPaDAMyGQN05EjbBw08k8PK56/f51EcH
         rMIXwRRdHrvSEflEBKOMNF8Trw4bS4NEElFB04YMl7uCQyQubsAhsK4qLMa0GGbk3Fk9
         mEl7YMVHD4xn3D1oBnBIVMTkhmSe5n8ULLH1CJ0vKOt8OFmOR5APOz/AtGoEMN7vmNp1
         UP8L0vmdPGIivfCPs73o9kuX5IdBockkcniVz5D5hzdkPmo2xclSPwHz3Ym8SwBHDLex
         UuEnZssDuoNyx6pbO0e5Xrs5DtVcvlmd2Kv8eDhPWNyrSwxXeDrLJMwfWqaIyTYRBmrT
         s/lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763764363; x=1764369163;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pr453cERSmy1/J9J1l2SfVrp0cwlN0LwGQ0VuFEXJdQ=;
        b=nI0nZZCQKmBzc5bMrQ0/I401lLu5aButl0SxnOrLeoIddI8ip2L47M4GFnEVwvRhOP
         eYJkhLVWSJK+1CVH6d64tOuO4WlhTsh2Nwmbi31Z/e548C8WMA6h8+y+LqmlHMOFSHHM
         ViX0mCr1yiv07aezLUn/Rezvsvv+GK14b29IF+OxDd8tu8ev6MutiUXh6+c9vvMJgEj8
         4lrfZXxAbWZ/qmlb9FMp6TahmglHjqi6Dq8/K07n0MaFQCplvC8H3I82141x5vKtTC7c
         omnLQyAqxZKIlo9TYWEnPJE7Tu3Ot9uYOLSZgZgWI+V2PbM7dlXTsEOlKz9gwkb3O5z+
         Qd6w==
X-Forwarded-Encrypted: i=1; AJvYcCUCtMltNk2f6pA5qiuogYrKufvy6LF4+JAwhZQ6rXuYuVvH9u8N9vvuWakRtifr03xhFZKGnIKpqOwhaAjk@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8t4QC0W0MXZSS+ACD0Boj4sQntdCQGeDLZLKMyFtKsPKBTOlP
	3FLzKKbheUELwptAe9XfHEexwzsWgEtmzbj4YkLcgqu0r18V3B1sE+8OnR3p18E49X5Ebj0nZxN
	JhpOqMv1yoFAHwbL12n3h185hlvOiCeyaJn4cP5bH8QSzsx47nvG1Ga0K4JKolg+bocLB
X-Gm-Gg: ASbGncuTG9owkz9+gglmxoJQBiguFUb2D3JKvELsIMiLmXkfKVhTPHgkAcZmPSojwxl
	tsCQAOiF56ez+ZSodu1W+ytzS0AcQnV71OyEOtH0lTbZdYuhDmaytF0IF4eXQ/n9q51s21FJbCv
	bwaYfH7b5IgCwwcxWg7MaMeKnmq8TgPohr4oRvRcmNS6S/DlSa1cVYq+bV1/J7ibBK99mM8E6Ln
	fM4TAYyjs7Tr6dmFQES6SjhB7oC6N11R4Q4HiqBCtwSUjPaH6FnVvDMuUiQBs3EZRfcoUXYYbcQ
	fTGrxNFc/JuPHvQdW10tGR1qvgcnb4RRb5Negb4MiNSAjU4qD/AAR42HNBBL1n9qywlygxluITq
	/aC9fl7vksvyBmthaTArCdvATcqVp4nNCCcztcQIAe3jqtZx2jFAgSHjOhruQnIZvK0sj+l80jo
	BwYUpJgUH3xRR9ujXcf/aKAh0=
X-Received: by 2002:a05:620a:1aa7:b0:8b2:bf20:f0ef with SMTP id af79cd13be357-8b33d47997fmr497572285a.54.1763764362825;
        Fri, 21 Nov 2025 14:32:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGrQuCX6VXqTt+aYIlduBf1Y7uPpB2QJUvC4Ki9sjnl/6lrwFmlUsH69t4JWc63uH1+2GbDVg==
X-Received: by 2002:a05:620a:1aa7:b0:8b2:bf20:f0ef with SMTP id af79cd13be357-8b33d47997fmr497568285a.54.1763764362337;
        Fri, 21 Nov 2025 14:32:42 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5969dbd2817sm1914260e87.100.2025.11.21.14.32.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 14:32:41 -0800 (PST)
Date: Sat, 22 Nov 2025 00:32:39 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Dan Carpenter <dan.carpenter@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Qingqing Zhou <quic_qqzhou@quicinc.com>,
        Jie Zhang <jie.zhang@oss.qualcomm.com>
Subject: Re: [PATCH v3 4/6] arm64: dts: qcom: sm6150: add the GPU SMMU node
Message-ID: <7dd6deirm7p7jgbjzev2hcxcfmsx5dtijfaglynmqaicpxr7rf@p2zev7mayq6l>
References: <20251122-qcs615-spin-2-v3-0-9f4d4c87f51d@oss.qualcomm.com>
 <20251122-qcs615-spin-2-v3-4-9f4d4c87f51d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251122-qcs615-spin-2-v3-4-9f4d4c87f51d@oss.qualcomm.com>
X-Proofpoint-GUID: nPXNVTpxml2ErR7wxIYTgzN4jjOi5yh5
X-Proofpoint-ORIG-GUID: nPXNVTpxml2ErR7wxIYTgzN4jjOi5yh5
X-Authority-Analysis: v=2.4 cv=N94k1m9B c=1 sm=1 tr=0 ts=6920e88c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=UQAiW8fk4jwks4S4FoYA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIxMDE3MyBTYWx0ZWRfX5ERq+JW4R0VJ
 kqD9PyADeY6Vt3Ej15Qy29EO6zJqIYcvspPSWTB9nAnLyUAYt+8nUB01CgxpYq9Yulah+oC9VhB
 aVejBemqh19DWAvfbVnibRKttVRi+SYrezdC4KuqPBRqUuqysNHzgiA3tESaO0YOTtPJ25B45Fy
 orODd+5DrZjaYK3FqBOQ9gEFsLvWU+TnLT024HtSh1JefkPBA9qeBTTHdXAudbRBnvXWENabphs
 CFDKkNzN5pXeXSUpy8zsmz9QHOtYqtlE2UG1sF9YxqqZoT51HNIZE6pD07KmmxEmbS54CjNVbG4
 XlyBgg9mWtf5o7efnGutIIKzontlgDs5vGt7c3Srvtw5FlVDSgyObJjIzkR53hW694oOxti6171
 yAbwkpEJwNeG/7G4DU+Ckc8xyWPbQg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_07,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511210173

On Sat, Nov 22, 2025 at 03:22:18AM +0530, Akhil P Oommen wrote:
> From: Qingqing Zhou <quic_qqzhou@quicinc.com>
> 
> Add the Adreno GPU SMMU node for QCS615 platform.
> 
> Signed-off-by: Qingqing Zhou <quic_qqzhou@quicinc.com>
> Signed-off-by: Jie Zhang <jie.zhang@oss.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/talos.dtsi | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

