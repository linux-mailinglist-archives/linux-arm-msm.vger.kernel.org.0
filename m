Return-Path: <linux-arm-msm+bounces-83311-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A74CFC8699A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 19:26:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 60CE93AA825
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 18:26:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53C6A32BF21;
	Tue, 25 Nov 2025 18:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PxNpbBuS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gyT4E9GQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E23793016F7
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 18:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764095191; cv=none; b=Q6ASQyHbvxNW//VDJl+T6Bur71gTG72K0N2DSwJQaAdbbyIEd12RDg2sPPeY4uDv78v7yh1K+Y2oOJHJhKwBDm17reNyfivQLn618aln9fq5LepjQJpqVPF/MUyeBa5HbzfFTBpdsX2GcHLlXuGlf0YzJ5Mrh2FyW/Ud1StcjGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764095191; c=relaxed/simple;
	bh=ebxjg6gB3x4MpDFvERk9WCDA5uPKeU5F/fUIRzDY0jY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ObJR5E3kzmRXSusQlcwsQ78baIrELIa3eytm95eOlCcRi7fKWnMMKOOHYB5BziySz/rBxewCOzgId0EJKfz6Yp22WIwnTrB05H8T09AAVOn3R1cPT6ZSXofuHQGrAAOQnlsjOrLeEpFmFwnVXyEnD751drlpunso+gQ20HhXjEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PxNpbBuS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gyT4E9GQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5APHKoJn2650414
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 18:26:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=kD1u7+cJseUlBfgY9G7IN8T2
	h35v2Fl8hABAZni79VU=; b=PxNpbBuSndx0tDPdVy3yS3topP7rFOSEQNRxb5nZ
	UnOjLike2j+x6E21+f7gxVTtkcPa2zydF0u0tzF3bZ2eY7B49eYXbcThTaWA8FM5
	an/JORQ9J+phUvNxagq2X9ebzrYKIU8L1vhQXV4sXK/bBHsOv4DYysC982iSpA0A
	tGmSvedf7IQ1aLwZgpM2x4oZhXq8PINDOviW1JR+tTD/BbM5H+h2FNXPZfQZW5dI
	YN0XBvHAp7ydsqaasK7t6QNba+u9b70xQWNc1L2SjRzGO4b+4pt7tYiS/SMMvvz2
	CLbUiYMMqSvBWstNC9CCxkAyk1PKdK30S94igdNyCHfxzA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4anaabsfs0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 18:26:29 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8824b00ee8bso89090446d6.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 10:26:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764095188; x=1764699988; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kD1u7+cJseUlBfgY9G7IN8T2h35v2Fl8hABAZni79VU=;
        b=gyT4E9GQnXtoiXr3Vi18RHjx40VQWOPXHKcgoN0xkNX7hy4RYMjXhV0gY6QkCQP90F
         89DRUDwTSLSajI+edS4byc6GdLqmyzpxL4eMym8GOlIEzasJS6X2B8ON7XzsVbOzf66t
         KqFCo5ndYQof5cWcAM9no+EDO1gqsWuidXzpR/1vJA57o88y9SdiTLf1Eyb/Q/KuhW2B
         j+AXYF3aPyzPOuZ1MKuzcyYFBpmkXMyhpo81GVMtm1ktGOFgpQnh0XIoSJnY+XDMghIR
         xg8neSTi2ntt4OLxJr/OiPXIjTkkn7vP2guK5RWCgCUM/v/qhMgwJZDWIh0pIrCOlH96
         8kyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764095188; x=1764699988;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kD1u7+cJseUlBfgY9G7IN8T2h35v2Fl8hABAZni79VU=;
        b=qpd2wcQUsJDJbhQGPxGcovG1Clqitqbt578IOONjtVyjH6LzN8pJT3Zz67uLv18xa1
         WNa5gxpT4PDjnfcTJrHCWR9vLUrpwfueLvycr4Pice5SW6NdwEDY1wRlDkpGu0B478Mh
         SbS/OKMTCg511v3XKHoimjQP63bIlh9LVWhWy205LjqtVQgGaNaEc95MC6rsYe1AA/Fp
         CmqsSk9p+4GF9FEvkkfpn3vJJyKXCqZDfL/y/YYAn/Lt6onYYMEZOiaCvhMhOuyHoQw8
         5RIHXAWTCSmiIB1t01SzuCvimilZJUvG8Sfk5sIXGQoWPBE985l4C5CIoukY6DJJ+SO3
         Htvg==
X-Forwarded-Encrypted: i=1; AJvYcCUbYh6nxqPoCos3+vr1bnuyHA0c8ByhQuIv41oLyDtrZuXab2VgpgOZxzy1XQOvaRHSGkh3JfuTo1EKRNlH@vger.kernel.org
X-Gm-Message-State: AOJu0YxmGaIPPJAwQmGc9e5zKbXO9tiTORd7O4SSrChG8q2J+H3IcNmW
	RXEau6JCLAct+dL+rmxpD7hJjDFmAWwdh0FBrlPSD4+cJa1S/14mzmsirlfw6BlZIg6CbDcf3wK
	Fr4K6KMq5R9b6cVBDaaP/AbHoKrhJSGqkSRDYIgbDkxuyvXBUDg1aRuog/nu2L9Vu9eJS
X-Gm-Gg: ASbGncuKLrWjFO5fGnOLN2a5vWNunIzx7130J2McVdXkptmW9lEk8z5DVbmXtK9/uQ9
	QK00BB2fB2IQqBqQ6RL8MXeuWv0q66XeOyooncle54vhsMy6+Qr4OD2kkjwgeoKIbgsW2F63iFl
	mSsT6VD6s4ybqzwPzDBV2RSS7GeE7ZJ/3bOT6uSnZiMehIIB4IRAsm/fGcK04Y62IS50kQYdtBe
	6qKO/F2F/YpsCswiOtyOL9q571qbzUp8zk6xbIkrC56pELStoGsPJTsFcymXNStHQrMLt1/2qab
	ZOXCViwDm3z0cJCc+ztt91corh5+tKGGHtAyYv7XqPl/8HNl8tNsH5PWKnwNrMO1mrK9O67ASEF
	dmlxwdtPYizphOtboQB1WAtbO+Q9eQJLm6R4QFYnUpVRb51lvCAo+UA+CVv9DlyAOh1o2l24i3v
	Avzc+uC78TPkwdVE8ldlx8ZF4=
X-Received: by 2002:a05:622a:1ba7:b0:4ed:6303:ea79 with SMTP id d75a77b69052e-4efbda958famr49464231cf.54.1764095188274;
        Tue, 25 Nov 2025 10:26:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF89eCmHbFpIp5+TB5GdNuHM+TjnMfVnv7SdEs+Iq4wEVhFZhvdYmllhJEiyz1UytnIPYP4Og==
X-Received: by 2002:a05:622a:1ba7:b0:4ed:6303:ea79 with SMTP id d75a77b69052e-4efbda958famr49463791cf.54.1764095187798;
        Tue, 25 Nov 2025 10:26:27 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5969dbd2d1fsm5272025e87.102.2025.11.25.10.26.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 10:26:27 -0800 (PST)
Date: Tue, 25 Nov 2025 20:26:25 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: clk-rpmh: Update the clock suffix for Glymur
Message-ID: <pkcwprrzpvbe6sxuuzanaqquhezz2ftoxtdt2fuufrjpmnyeqx@e3oodiuwhy4p>
References: <20251125-glymur_rpmhcc_fix-v1-1-60081b3cce7f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251125-glymur_rpmhcc_fix-v1-1-60081b3cce7f@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Vd36/Vp9 c=1 sm=1 tr=0 ts=6925f4d5 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=q7dqqsrAYvYYBxBYVC8A:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: -Y51clObobifXC9cUNY0NT2f_JCNhiy7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI1MDE1NCBTYWx0ZWRfX80FeNR8UmLnZ
 z0QB/QAGIyOCOVK0gNEhu1XND5gEQYdKMgQOKofPf8TAPq6SGwBPDy3LM6eH2zFqamMXPhlYAK+
 P12VRzWOfvGZVQwAr4ANxI+wWumji394miG19ruMS22PznxZu50kZGanf242f7bHYTeHH7Bf87y
 RBQQlBwTxfIjAUhuXDTYfPEHmxmWMSykLzcTXo6ppK5f8zqf7IuSTXFDi8bLMs86xXr61q3terX
 LjzI43lSSnAvXbVwZfpGadzgyRGjpwTYLfdXFaSAkc7H+EeVmUnmaihJ/aK+unpZbYBi+L6Um1t
 mrX/sdZZQKQXCgrP1P+P/5AoM3ISs1RWNGTTFlSnp+iEaqTH5v8BAHQhPdxjLfb1Fv7NayZwDyb
 uJBHLypMR6Iuu4YEPpRpu+YoIpDFAg==
X-Proofpoint-GUID: -Y51clObobifXC9cUNY0NT2f_JCNhiy7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 impostorscore=0 adultscore=0 phishscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511250154

On Tue, Nov 25, 2025 at 11:42:39PM +0530, Taniya Das wrote:
> Update the RPMh VRM clock definitions for Glymur to add the suffix to
> indicate the clock div and e0 for the C3A_E0, C4A_E0, C5A_E0, and
> C8A_E0 clock resources.
> 
> Fixes: ebcb9db98bda ("clk: qcom: rpmh: Add support for Glymur rpmh clocks")

It's not a bug, there is nothing to fix.

> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/clk-rpmh.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
> index 1a98b3a0c528c24b600326e6b951b2edb6dcadd7..a370ab2d96c34fa8e7a090e8427b11008318c02f 100644
> --- a/drivers/clk/qcom/clk-rpmh.c
> +++ b/drivers/clk/qcom/clk-rpmh.c
> @@ -390,10 +390,10 @@ DEFINE_CLK_RPMH_VRM(clk7, _a4, "clka7", 4);
>  
>  DEFINE_CLK_RPMH_VRM(div_clk1, _div2, "divclka1", 2);
>  
> -DEFINE_CLK_RPMH_VRM(clk3, _a, "C3A_E0", 1);
> -DEFINE_CLK_RPMH_VRM(clk4, _a, "C4A_E0", 1);
> -DEFINE_CLK_RPMH_VRM(clk5, _a, "C5A_E0", 1);
> -DEFINE_CLK_RPMH_VRM(clk8, _a, "C8A_E0", 1);
> +DEFINE_CLK_RPMH_VRM(clk3, _a1_e0, "C3A_E0", 1);
> +DEFINE_CLK_RPMH_VRM(clk4, _a1_e0, "C4A_E0", 1);
> +DEFINE_CLK_RPMH_VRM(clk5, _a1_e0, "C5A_E0", 1);
> +DEFINE_CLK_RPMH_VRM(clk8, _a1_e0, "C8A_E0", 1);
>  
>  DEFINE_CLK_RPMH_BCM(ce, "CE0");
>  DEFINE_CLK_RPMH_BCM(hwkm, "HK0");
> 
> ---
> base-commit: 92fd6e84175befa1775e5c0ab682938eca27c0b2
> change-id: 20251125-glymur_rpmhcc_fix-5daa36a1e8ff
> 
> Best regards,
> -- 
> Taniya Das <taniya.das@oss.qualcomm.com>
> 

-- 
With best wishes
Dmitry

