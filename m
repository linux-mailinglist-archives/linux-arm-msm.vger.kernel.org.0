Return-Path: <linux-arm-msm+bounces-81835-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 80842C5CC37
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 12:08:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 45DD5348655
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 11:06:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76D1A3126D9;
	Fri, 14 Nov 2025 11:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c8j8d+hF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RC1hl/0J"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82F74311C05
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 11:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763118395; cv=none; b=qYQZnSsVM5fsAT/iC5/+PoGPyQdfOfBwMin2+GeU//g16c61y8YiE0bDZ0ivaqcHofAcl2REfXkmN/O+mv6H+Gzw+xDDyny7zck6h43jF1SG4/BAqdUdMarlYkNU6OSJioKWFc4o52yrmTGNcJR+es2Auzhgk/DLmjenq9xS/Oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763118395; c=relaxed/simple;
	bh=3BOV1tl7TjNQrll9fHkxZzjrNPf/e4/8LiBH6nCvRmA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FHMRjxuTcPk9Tjdxa3a9jwHYOKQE1zgu0sJR02d2APgIQTrY3UaAtgz+biXUslq3PZ/9kaV2Vqnw4DopbS1s5vDy6mTrZlWJlBkapmDHTWqSpLfGEESrWXSlHQ3o/5DXoRSZYgjP3vZMqjaFAu6942sHPz/BBPbD6ad8Wi9IUlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c8j8d+hF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RC1hl/0J; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AE8iOOU1426033
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 11:06:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=74+kg7lLrnTQ83su7R/2/8ws
	11VOins2fvjFVb1sOvY=; b=c8j8d+hFHkEXjXALcnJJzKt+rmCt93m3CmSQSxQb
	w32/BVK9ntevyz+g8RQ+ov9KixMjN3ZC0sOADjp6urGtPBrUYSidyYCL6F4QfFFW
	HDRGHoZqU0nt3octgmTd0WtRqNloGAPJrsAHb6Bzwa43fUsQoNXonkKxU3Mki0H0
	tiBM/0+hQ00tlnpB+Y3tLWq6yTu4xcvJ5Afuql6EWr/Sht3Sl0uZgEvZRZW30vMb
	KL7RxksVto7/TXueumK60DnQNiyg4i4Q2BCyyi7t4rB34TRiudTQAaxR2QUj1pGP
	q2/lQLbbNGWP0ASWExLiDg+RFdGmC4V01msRNnegCONIrg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9g1w0f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 11:06:32 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ed82af96faso54672541cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 03:06:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763118392; x=1763723192; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=74+kg7lLrnTQ83su7R/2/8ws11VOins2fvjFVb1sOvY=;
        b=RC1hl/0J/4Ml73CIMjS4I7+aWflwkA+PyDlqRb5bE+8fjqCtOwQYBY70ngGss6axGa
         UvdJutNBskUZyz3nlxHQn1l/VF3HoMkfEYlgOL7PO4gDVUy8u/hSzyzkXQXBVBdRJckQ
         K7RTTaXmvoaxdO8njxvbQ9KJO2dy3Ew0q1kEMj4er15jOON6XjPofUwynhO5KgwyOAcr
         YPkQ5MVJ8w5DgKFM1Ov/exedNxYktdujWQWm984sMx0Agev8M71E7WSTO2+zYZsxmLrn
         rKEf79qLmNMi+qwFAxb36+6bFzozdDt551AIkrkVN78s88LjQ2p8TFI9R6p11DnJ6lGq
         VtvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763118392; x=1763723192;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=74+kg7lLrnTQ83su7R/2/8ws11VOins2fvjFVb1sOvY=;
        b=R3f3+X+haixds/X9Xpz1jxO60YGeZHOhmQlKpD+1FdZwqoBFge3gdN4FugsxssNYoQ
         yslL3ec/4ewPwQ5ap6pzkhbGqsX9bl3iF8jjn2PfKyRqHWrfyLGESTVxIwdxnfh80Nhn
         qT2qx/QxtXlajCjWh7gUl4focnBwSpUu0xyOhFOYJ6AU1tQ8VytwHaEfD/OPThsCWbP5
         yorMxBcMPUW+Is+kz50rVmMufZZI4LdeuIc/wzo6htYGnfBPqSEHYxDAfT+3xm/tA0G3
         eak55J+Jk+pM2kiz984DthTMWkjfy0qc2Uyng6ZuTYCk6bSJ9dYgTh09Zh3D6A/4lPZI
         j6nA==
X-Forwarded-Encrypted: i=1; AJvYcCUvNdaRzvOTpPR8cGS8bunwYKP2c6lYlh2JIN1s1O2SOOjtnmJ1zd7H9/J+xM7lIhKuFqJla76fcRQtX5st@vger.kernel.org
X-Gm-Message-State: AOJu0YzZDGml3ULy04sJYC4y8HMsXAP4iUvdc5RNoWmSHx4gncrm/erM
	obFZ5g+R1vpL3rB4eyQE4MFzti1Bp1C/akl8tqVqdymT03PNvuGMV96dMIWJb3sA7i9xaA1q2z8
	6sQ2Hz/tNKm1/IN0saCWQijom5HGF8zt1HUDhsB4uKeI712+zM/L6K8noYpSuGvKIIY0I
X-Gm-Gg: ASbGncuVBXkUOpmtLe3s+9Plr+JiOpm+KH/H5GJ0i+lJloIL5GeVnOH0edVrR4s/jcH
	PbBziqZLp29NPOREpJ+rVEB6LIzNLYLlZ35Qw799WvCk3TY05ZqYAXvDi3sjAJEL5a+gqt22//m
	0fpxiyQ0J319alXLnFCKFpyUDY7cNRmN8VGzwVf1nfA8ZOOZ38bTImpf/NSIp0Bd6GzY3yxpLuw
	Dhkp1HOXTUICAeoLL7/hz2ogWaeuTAqYZJ7dbFaKTb6hpBSAQJM/f6rkXvwHGkaNz4UKbuEMjgf
	VEkHou3rV2jaYf3qB5QUp1uc+AuIPxWeLhqNQzBLlkjAWQXLMu/40oNtv7fcvCWh8xFsPz7pmfQ
	wdTpcjaR0PNcJgaHadLTvWeGYy8pLulCqSnfZ/8hqGEqRQTY63PzdX2+OWKk7d60WsByLbvIHZ7
	uZNg5h/Ygi28Qz
X-Received: by 2002:ac8:5d54:0:b0:4eb:a07a:5fce with SMTP id d75a77b69052e-4edf2044abamr35978981cf.17.1763118391637;
        Fri, 14 Nov 2025 03:06:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGWCtoqJ9eEoz9VAi84ImZOu7pTERyYGjny9OzPT+PKrThzZ1sTEylt2zQF8ckW9BA1nAjdGA==
X-Received: by 2002:ac8:5d54:0:b0:4eb:a07a:5fce with SMTP id d75a77b69052e-4edf2044abamr35978531cf.17.1763118391115;
        Fri, 14 Nov 2025 03:06:31 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-595803b33acsm993512e87.33.2025.11.14.03.06.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 03:06:30 -0800 (PST)
Date: Fri, 14 Nov 2025 13:06:28 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/5] interconnect: qcom: icc-rpmh: Get parent's regmap
 for nested NoCs
Message-ID: <puogcauf57v2auwmmqcdrwuy7oqb3lqwx6v7glldgh7pdez77t@a632c7akqe6w>
References: <20251114-sm6350-icc-qos-v2-0-6af348cb9c69@fairphone.com>
 <20251114-sm6350-icc-qos-v2-2-6af348cb9c69@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251114-sm6350-icc-qos-v2-2-6af348cb9c69@fairphone.com>
X-Authority-Analysis: v=2.4 cv=L+AQguT8 c=1 sm=1 tr=0 ts=69170d38 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=a4FZeaqhxxCkONjFBGYA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDA4NyBTYWx0ZWRfX6+Al45uuXjY1
 0pIZW7E6mJnmZRCUMnUKYrrLD4Ezo1p26xBcc68GhJFBv+NFFVGLwa/qoduV07rhGxCXFLVJYd/
 8KAoqMqQ0C3neqKLndBLFT9krXEwVlpNfZRimMb5zGXWxiLv+9d6auGEDkuY3G1wAbuSPXzWcMU
 vp5a1p7IcCXQ7bqB975XKGTy7QjMU2EpKAo6K2vrndt5aye5OCE62Td5DBY8eSLpOJUK3pJwLbI
 5Y7ywA4i9SI3zZWQadUp/12Vk6aQVwvjJmQudGPXKWNbiabDOiJFW+jdrjT6P/JJSEmEHtkIDV2
 EWMqlUhgtBj27ex2X2pVONoA5+WNnq+wzR5dPtPJIqcgyyZk9DPMSgdzUNJWFJbv3bVY2sNf0i5
 YjuCY7mxzP9PqwWQUACzLolf+eU/9g==
X-Proofpoint-ORIG-GUID: u3WKIPJvbP7S66SHB-RfLtH8O3lqwixF
X-Proofpoint-GUID: u3WKIPJvbP7S66SHB-RfLtH8O3lqwixF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_03,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 impostorscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 bulkscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140087

On Fri, Nov 14, 2025 at 10:31:10AM +0100, Luca Weiss wrote:
> Since commit 57eb14779dfd ("interconnect: qcom: icc-rpmh: Support child
> NoC device probe") the icc-rpmh driver supports initializing child NoCs,
> but those child NoCs also need to be able to get the parent's regmap in
> order to enable QoS.
> 
> Change the driver to support that and support programming QoS register.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  drivers/interconnect/qcom/icc-rpmh.c | 19 ++++++++++++-------
>  1 file changed, 12 insertions(+), 7 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

