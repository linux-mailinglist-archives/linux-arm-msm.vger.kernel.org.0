Return-Path: <linux-arm-msm+bounces-85289-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F6EACC01DA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Dec 2025 23:19:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CDCE430146C9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Dec 2025 22:19:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCCC330DD12;
	Mon, 15 Dec 2025 22:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DDoHONWC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cpGuKwV3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66B7E2E7F03
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 22:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765837176; cv=none; b=IICjhIMVzLrEPDDu8zLjJs7XkEu+81fVhy3J6d5RgrEWhpl0OGrZjcT22Lzz2Hdl987ZGzq7qQt0Mme4uRgpSqhzWO1HOcW1YrOKMfWcQz4ISkxoiHFUn8iKcIgZBU/LQ7PMnFlRNDXo3h6A2xLeUzHXQBMhJY6S0JWtPlpw1KQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765837176; c=relaxed/simple;
	bh=yhiRYQVDK6pXOG9KqsW6RjAV6TTBKYtRmbLfbgCVL94=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=an2RAhZPHNIozUKpdu8oW5z+pvnQvzYi67nCZeArCXa285qbPX4oeTa+Y/xe62MqAJWZO3jveSyOy7F72tBjpkssoAbFg6hlucRGBRqgiHHLapslAfJurNDUyf5zRmMz6yYsOUl/c8iassP1znkd7AETjJGI96yMN6UlOmgiVk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DDoHONWC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cpGuKwV3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BFFrejP825918
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 22:19:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=g0sqAY7iGTg21nBUewuW1vAX
	hsbl69njdYehUmnU+Vo=; b=DDoHONWCTUDhv9gtdb/z+m7yW99vtN5OkVkGr14S
	2LDzkAbFd0RP+WV4LlIDtN4+f64ZuUCcqqIMJ2stcdH9OXJyqfXJzA++3nloUk4D
	yvUS2z+oKBoaQ09N9cYfQpOd4zBj3vaWYA314N2IIIBfzVlT6CXXAdEMmpphGu6q
	6A1lE1iIUgzsB7nCpfatpqCrqQi+7ufszjBtn4cKUHpaQ7k2teUmF0v5Y3rSCtGf
	S+fA24bwmwpC6jv/ylPaeroEjajx4sQLT+sWU9XBV5qedbPd0I6mEDwstXJm7Uis
	ngmN0ueCyCUdLreC98pf1eqEtu4vpF+raUJiu+0XFylGxg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b2nces6ae-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 22:19:34 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ed6ceab125so92627811cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 14:19:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765837173; x=1766441973; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=g0sqAY7iGTg21nBUewuW1vAXhsbl69njdYehUmnU+Vo=;
        b=cpGuKwV3vsn3qfhfsgafv3Y78VkDpaT78hJKN0trTmHr/CfJ8lOEaAbziWW7XE7EM1
         bYp32dlN4EWEF5LtyrOWWN6HiWMbbfQmpzrWnpstUYpdGmVrRkhRSjfPguEzKId8LboA
         qwdTJYAWy7LKiVZNJk1spWlgKCpyYJof0wFz0CBFwIX9pS8CTcvm1K9FrnboW53muBzP
         MZb5pTdLgSqs+sG1zHyEDo0HC4UR6zgbctP86iS+KAXVIW1axByFWhOVlLwxXcsi0dii
         h3yY9OrWlh8rsTrH4Da/5bIKoiVurxDZYWyKo07Hj652oi3iZAbuPdxJysNoZB/+1w3i
         iOzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765837173; x=1766441973;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g0sqAY7iGTg21nBUewuW1vAXhsbl69njdYehUmnU+Vo=;
        b=cRPR7Tu8gXQ8cxjhdKDgfRx44zI3prEuYv8MXgNk7R6GrNhilezBCw77BsK0yNi7w+
         NJ1U8hWKadg5OdS4PTX1StNF3oqv1ilbV/srDoHTmVKWmSHY2FroZPKxRb2WvfHiOaRe
         vxJcczp8whbsNd7GTmWNVGYj8NjDnOlb/nxYUhtfj8CQYubbITZrkHCINinxGsCDN0Bt
         gmIrVLpuPlNOLoCuu+f8PnzAld+aD3gRAduwWEQ2WZFPX1gOWlrqAw2vbLGQ+0uV1158
         rkvc6MuAaa18JdjIcULfsB8K9NvWl9ovWdBvBiaDQmugYaXW0GOWe/HkiXxmg5VFd8u1
         29Ow==
X-Forwarded-Encrypted: i=1; AJvYcCVvSULganhxmKy4lcBd6nlCRgd5tnnexC6jv0M6y6jcbpCK/C4jZHMTV++yi7HfofL6hOXWsP4R75+1dWkq@vger.kernel.org
X-Gm-Message-State: AOJu0YxMo0IQZftMUuAPaDna324MUl7DOdMphzOW5b9XU2NReAyBGRES
	oiLwrNU7pcUfRvxHnnHQzbI/bUD37RSnlpCXv1n129eL8MIS35JZntR/hbY37zKcBuXfKa+QEte
	jaaBNt8XKIoVS8kolowhVKsYyPN8Qy339AdG3AOYCG+U+bFedRiFpgNf7taOJQm1rawtpKpEfPK
	T+
X-Gm-Gg: AY/fxX55gGGQdKf9MQI6QHuqBeCBlUohy4/baIMpGdlAHeixP653aIDg4vRHykpyokM
	KwyCANgDCOb9r85A6XMU57JKUgqwsgkfpsskQ0xrw76IP1GWIChi02FIPKfbc0ChVbslg0pluky
	yy/RDA4k+S/wsgLIPLV2mjrEyN6vyQF897eafoz7Ez3Q20pSKD6SGdCCMe7nWDhQplSGYMQDn9l
	K+zo2S/EZecTm1Ze1JQthBHhV3tVCg72WSm5z0l4FuCD3Ws8CmkUz1+Xk+ax6blD23B0H2TaqCo
	1y7irztGUV/ENgxtMqLdLGL3dyAF4bj/bUgzgO+fWKxM/r6GqbWTC9QD6Q4p4dce44jA/Fw7n//
	cuN2YwGbrTZmUwRb9kSSb5Jm2bvC8FoiVGx01rOEmDg/e57hfNgVRyz1iGvxSz0omfjB5CBgeZ5
	sikNK7XweT43TemQ3ajip0qSc=
X-Received: by 2002:a05:622a:1919:b0:4ee:1fbe:80de with SMTP id d75a77b69052e-4f1d05ee8d3mr126802161cf.63.1765837173184;
        Mon, 15 Dec 2025 14:19:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEEBHopw39ddClk/rWrLAB0qILgz9PTCV8ogOZPqgbH8FO/m3zgyYbq61xnaSieIhsnA9TSrg==
X-Received: by 2002:a05:622a:1919:b0:4ee:1fbe:80de with SMTP id d75a77b69052e-4f1d05ee8d3mr126801941cf.63.1765837172754;
        Mon, 15 Dec 2025 14:19:32 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5990da11ba1sm214614e87.17.2025.12.15.14.19.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 14:19:32 -0800 (PST)
Date: Tue, 16 Dec 2025 00:19:30 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Alexander Koskovich <AKoskovich@pm.me>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soc: qcom: pd-mapper: Add support for SM7635
Message-ID: <mtjbtdmcrmssrthkgvfizokxxtwc32tcnnwobufmsefh622jq6@wwwc7acsxy3y>
References: <20251214074736.2147462-1-akoskovich@pm.me>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251214074736.2147462-1-akoskovich@pm.me>
X-Proofpoint-ORIG-GUID: oBWI1nX-vALpX93NWi8vFsAHjqtKf6ac
X-Proofpoint-GUID: oBWI1nX-vALpX93NWi8vFsAHjqtKf6ac
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE1MDE5MiBTYWx0ZWRfXxCFfBfK/Zmm+
 ku8cXNcHpGNkrzgcAp3HlU/Qk+NJ1BUzTkm/4yydcC5MvJ35K2IWtRc2sALu3t7bI9YNbaK3E9O
 YS+8LkUHZk/qdj+KpjtQgao4Mn5xjgsp4R9+ptnJqzcNIgdOYEV/IWschfjMUBR/bhEF5szRkhx
 hQSrnMtRaTAFB6+J3x6SgNj2jvTDwCvT5AhbsR6m9rgVApeNhlaQ5UbdBEWmtyVRnX72Cs5csAE
 Ksb3oeD3/4TWD3rIayH3DkIzW0DQUpXZcV8rT1T0N+9as7sZlDXBeiRdqTjH7OHjzSDPQRnZN91
 A2N/OazzJJifMjFsTn7xHJMqgLjrxW3p33lSDtMKrLMLNp4LF8bEXJKEC8GcrlHwfzTIqLWgyXl
 h/S5ODwcrJ+bpekY4zvlAU1lmrVQWQ==
X-Authority-Analysis: v=2.4 cv=XJU9iAhE c=1 sm=1 tr=0 ts=69408976 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=MdHzwyQwQPv0fR8hFt4A:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-15_05,2025-12-15_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 phishscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512150192

On Sun, Dec 14, 2025 at 07:47:45AM +0000, Alexander Koskovich wrote:
> Add support for the Qualcomm SM7635 SoC to the protection domain
> mapper. SM7635 shares the same protection domain configuration as
> SM8550, so reuse the existing SM8550 domain data.
> 
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---
>  drivers/soc/qcom/qcom_pd_mapper.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

