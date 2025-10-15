Return-Path: <linux-arm-msm+bounces-77437-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 83DB4BDF6F6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 17:40:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C9571189EA15
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 15:41:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 324E0326D77;
	Wed, 15 Oct 2025 15:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fFifcm06"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AC31322DD0
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 15:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760542842; cv=none; b=kAvEw1iqNbZ1RZOd3ERY7yRpIEiA02ndHejIAeXSIVOmfuS7NA5GBXMRUZk05Pf6D0aaqC79ZhV7MudAr9PJjH9Z6LcopuqdfG0tzNhxAwdIHPFxRxQlXTuP3C0n+Kc1576sXY4TmalCYdPnQ1tl6hdIM587Od9iLB2RkD6tzmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760542842; c=relaxed/simple;
	bh=8yIzlOJSXfO6YXhbSck71FcfdlxfIEO0W1rlhZ3Foj0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RWgyBMsS8+/xQd+Zq+JfninvYHEeZjYVUNW8sHAer3e2YxE7EIGBsRdURaVKxz2U9jNrYGV/ZLaXOxLU3jFz81CrxG4MKcWD14nRFbwdqth4TwprpW/DTqLaRV22+m2Geq2AnAocpn6EWXyTIfRTiZNGXApNkHrNoQ6rmbALHLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fFifcm06; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59FAoY9q014770
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 15:40:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=v51xGGLBzfthpJ6uAG1FtfpT
	PpeQpU30JZDZNcynxBI=; b=fFifcm06MJtVgPqG3E+gCnYpVvRuDmp8Kd5uoQhJ
	KU8sxlsS/ZEY2VcwhzOQaw5i1Qtdshl/deNlyb8C9HL7eC0cQqMiBfIz+wje3iFa
	evnphpSb97MAd9bPeNhrZxG6HlnL530o9Ej323pF1JFTaBf54WAKcsbffE0ujUBe
	zZrvzCnoyKpJk33+0stXq639TgJd2N9UgnwjFHfsjKlaCifQlz+1yU14zd464FAT
	uINnJbFeeEXWLjF3ZrNXEMUfP00/kPcglhFjYRRjRPstwTQy7aQryG5+Sq+8K9S3
	v3GKHBAfFKsxohCoV8AEAKDVkeLxiTuhey1ErGpQ0gKqwQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfbj4ywb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 15:40:39 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2699ed6d43dso112123615ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 08:40:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760542838; x=1761147638;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v51xGGLBzfthpJ6uAG1FtfpTPpeQpU30JZDZNcynxBI=;
        b=j7Fmpaaq+a1zzegfULXpzwsX3j3MHOUpcvERS5zri8CCFlzHR/Faf4JZcGrw9CDrlL
         j5Q9JvBv5NQ7qkzZyeC5h9to6arsc9sj0VsCdHDpKw2nCgCnD/CnYrue9KWZIiRNW/k5
         WGheki9JNv5EYc6CZtJ2NEx8cJwdtZSNE8xPolt+bKnO29TK+IxQyo9aBf+xVHpngY6j
         fKsAKXeWM318Cg1YKdpr/XWAQBDpqiI2vIvGhuGIipojkIxg9l0tF3Y3KOyQuc6vK9fY
         uN9G+sFVGJuW8IoxBUmVPcNecqDw/6KWAn6/BngLlhXgONf49RuB+c7wGo7YRQUBFcWU
         FfdA==
X-Forwarded-Encrypted: i=1; AJvYcCVan9CVad3QlHwEU+tZTTw57hepGvWf1f2ViDGfe065Bgjm9bTKwwdKa7mVjL980OFOHnX3RiPNEYUJX7uW@vger.kernel.org
X-Gm-Message-State: AOJu0Yx55oiLZGOwSu3nOv90eQDet1WYn8KDcESMUKSW2VLkW10FgUO1
	q2Rn1w4R2BspT1ym1qRs3axXBvkhRCR4nZRaXMNhwFjbRQuN2PEKKHCV+SLP2r3dpkaFiEllkQW
	jGo5e0DZPtt8YR31wTR1XiAoD2q2ymXTwWw1ABxhGm0FQEk8PHsaCJBVs8i1J+AS2KVe1
X-Gm-Gg: ASbGncsjULGxcf0XMCql6HqwFstYIVf7iRMCbygNnNJkcYG6j5xRSVlnBCqEbYE/m/t
	1ymmHRor+u/POORtyDepyJR6eXMXQzieA3OT0zTsQo0dlld2SnFS/W3Y7CX/pZ2lKlDt7aTRFnQ
	aA/YUhledzJvwrUYnim1sAde91aAM4dwkjqxQ0VNrebpiOH2RqI70Ip7hCfRysYRXgKwNr1/6HW
	YuLr30aK7cfas4WrZTey6wzzOc4b0LAtKIQ7qOR/dlnl4deTS8APy8X0BpJFqqlAop7csrDIDEp
	yH6HaIQHduaG+DP9kGBJwu02rFJ0jY6mpEdxs/7u3o/DEGMsgC2+OfFU1BgynUAvd7jNp/RlkMX
	qnTGZl/3TcLed9XAxKbJKad76ng==
X-Received: by 2002:a17:903:94f:b0:250:643e:c947 with SMTP id d9443c01a7336-290273ee209mr362922995ad.28.1760542837806;
        Wed, 15 Oct 2025 08:40:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH0flfR5h7EFdAnGkZA4xK4OhgMnYLtcfmupB0TvW9tUJ2NNuuPUm+lRnMe685BmxN8pgVIOg==
X-Received: by 2002:a17:903:94f:b0:250:643e:c947 with SMTP id d9443c01a7336-290273ee209mr362922665ad.28.1760542837307;
        Wed, 15 Oct 2025 08:40:37 -0700 (PDT)
Received: from hu-kamalw-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034e1cbcbsm200774325ad.45.2025.10.15.08.40.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 08:40:36 -0700 (PDT)
Date: Wed, 15 Oct 2025 21:10:31 +0530
From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 09/24] arm64: dts: qcom: glymur-crd: Add RPMH regulator
 rails
Message-ID: <20251015154031.hbifj6khno3gi3mz@hu-kamalw-hyd.qualcomm.com>
References: <20250925-v3_glymur_introduction-v1-0-24b601bbecc0@oss.qualcomm.com>
 <20250925-v3_glymur_introduction-v1-9-24b601bbecc0@oss.qualcomm.com>
 <a49f3f75-c882-4635-9be3-a433b7fe32c8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a49f3f75-c882-4635-9be3-a433b7fe32c8@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX18kr+1HEhyid
 4AxAq00/GjbL/KLNsiHVzgOZ2bZy9jEC5WU7FGW8sLbU3sQSjdtrc5rruAvxzjFCVroTuyiHOkx
 vEXhbXk42Lmdv0kaN+rlV7L7VCzvIdzilfOCKVR573K41pB2S4jYrOrlKx6q9Qgz6l3O0uidINg
 bCF/2ayNSvLpwYjQrkMnh247GKG1RXZ2KzaHm3geMC56wz9Vp59uUN9oA1r6cJQlq0Ltb+TiW5R
 JAMu3jwvQZk846Le21DJf1TkQ+i1Hgj8gwGm88BKjYtbX3WYsOkz7vG0silxYv4PRmWtWHqWTqI
 nwLKa7sX4bh35jzpc8LUrFKP1k75/8+BudiinLlhS08IOyT4K6jwgr8dFMS4BxEFZqmVQ/S82N8
 H4AmVRRO3huINRJcKGaeGHLjJMEktA==
X-Proofpoint-ORIG-GUID: lN2oTP2TE9JsDNodXCYC9k9GLidcqzjN
X-Authority-Analysis: v=2.4 cv=bodBxUai c=1 sm=1 tr=0 ts=68efc077 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=VNp9kv7xENmXbawpSbEA:9 a=CjuIK1q_8ugA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: lN2oTP2TE9JsDNodXCYC9k9GLidcqzjN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_05,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110018

On Thu, Sep 25, 2025 at 01:01:56PM +0200, Konrad Dybcio wrote:
> On 9/25/25 8:32 AM, Pankaj Patil wrote:
> > From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
> > 
> > Add RPMH regulator rails for Glymur CRD.
> > 
> > Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
> > Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
> > ---
> 
> [...]
> 
> > +	regulators-1 {
> > +		compatible = "qcom,pmcx0102-rpmh-regulators";
> > +		qcom,pmic-id = "C_E0";
> > +		vdd-s1-supply = <&vph_pwr>;
> > +		vdd-s8-supply = <&vph_pwr>;
> > +
> > +		vreg_s1c_e0_0p3: smps1 {
> > +			regulator-name = "vreg_s1c_e0_0p3";
> > +			regulator-min-microvolt = <300000>;
> > +			regulator-max-microvolt = <1200000>;
> > +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> > +		};
> > +
> > +		vreg_s8c_e0_0p3: smps8 {
> > +			regulator-name = "vreg_s8c_e0_0p3";
> > +			regulator-min-microvolt = <300000>;
> > +			regulator-max-microvolt = <1200000>
> 
> Both of these regulators, having no consumers, will be parked to 0.3 V
> (the lower bound)
> 
> There are other similar cases in this patch

Ok. I will remove the unused rails.

But just wanted to let you know currently i have exposed all the rails that
are allowed to be controlled from APPS, mostly these rails will be staying
OFF if no clients in SW are there to vote on them.

But do note that some of the clients may be getting added as more features
get added, as lot of these rails are not unused in the HW. The client driver
just isnt enabled as of now.

So wanted to check if I should remove ALL rails that are unused in SW?
 or
Can i keep the ones for which clients will be getting added in near future.

(i would prefer the later option, if that is ok with you?)

> 
> Does the board still boot with all the expected functionality with only
> patches 1-9 applied?

No. just tested, it seems not able to boot properly with just 1-9 patches.
is your concern about squashing of the patches?
(just trying to understand)

> 
> Konrad

Regards,
Kamal

