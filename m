Return-Path: <linux-arm-msm+bounces-89773-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FB9DD3C0F6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 08:53:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 9DF605061D7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 07:46:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9372F3ACEF0;
	Tue, 20 Jan 2026 07:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H+Ud4CAM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LKNmZ8ia"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E357E3ACF0A
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 07:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768895139; cv=none; b=IUqiGsrzrdTqP9CLoPb3iJfufYSdD6eInYR8RaCb333fyNm67Jhk8Xiv0OJpyvToSl7MpOy0Nb1mhad1wn8+odU7HB5sMIS7JN2/IFFfQxxyyl4w11WRwxdtyqrTUPO1L/rRWbBJx0gKek8mcQspNdxy1VRCawq+AoqNyDPP8zY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768895139; c=relaxed/simple;
	bh=+f9DFt1yAGP5lRU7/2hhzXsRmGUdxv+iemZ4bSy9+Q8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YTZyNPYSO9r+WWez4d3pL8U3iQA7R5Ppu5F3+mWSniru/FjyGqQ2ew36L2NkIhhrE4eN+LHuH2SwCwbo57K16jLjAf/5trVzyY9MGGy6FWM25kZTYbl3LvHxsFx/WSQrhHqj4rRu828THWw72lHFsd6z22sX9VPmc6Eba1p1FoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H+Ud4CAM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LKNmZ8ia; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60K6A2Bm227875
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 07:45:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=aGhGrX0dL/xdL01BQa1MYxZE
	1yg6gqsa3kDfPWyJ6Ps=; b=H+Ud4CAMP/JIVZR3UuwljCZbJWoijrdDIB0zRrRL
	jdRDb3RDzu6NdCmlUc44LvRpftFcCV0TXC5GB9W4x1x7aPyRfTYiE/t2IXc6L1K4
	bNdaWv67WPSi9Jurxc/gqwvRYt4WRNdUWZpCe3UsVtqbFasO/t9wJtV/2TaWHg+H
	xILVzp9kFX/xELi89ESFAbTaRBlIIPLbfT/oZ6XYX7EQUhvC29oRVKnl5YA5RjGz
	KcTcofljLMPtrAd1I/OOGQR8pJ7yzNgJguKtTbKkJlcR1jUFA0xzWrSAX1ErDoyL
	tYbC3zTjP+C8mHyZPjiAYVHKGbmoKUKxqu9LCS+BIVSk9g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bsgfrbhr3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 07:45:36 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c6a0ec2496so983326085a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 23:45:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768895136; x=1769499936; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aGhGrX0dL/xdL01BQa1MYxZE1yg6gqsa3kDfPWyJ6Ps=;
        b=LKNmZ8iaG46zQBhpqj7/TeaugcCqVOGDGFkoTr1aHrXS+TcLqhAyiORLeDrE+epYyv
         FPbp1IDTu3tXdlWBUQRJX0Hnn5/KP2MxCXOw8NikHEDKbv48oMGnDeWNStboWtXsdGnP
         yZLhIkrQ67QyV/gQrSOeUvLtKZ/enuI5nMFM27/aHyl3QcBoMw1UDQxVKZ+lDgzV+FJg
         v22GDJlrYk09XoHBsbUE2J0FsmGV8zU66wYDiyZGIJX/VHQaZH0EdFJ+Llu45J8Ckz6t
         5iqTFiCRzVjCB7Hr+rk9a+BApeSsqgvmCcef6oKAM2QxuMWbBCj5KKNFrauB55Wc056p
         L6ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768895136; x=1769499936;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aGhGrX0dL/xdL01BQa1MYxZE1yg6gqsa3kDfPWyJ6Ps=;
        b=rH12rSCu8nNqE4HEnzcFfEyYMJn9NRMlM1aPk/7g+eMIXfdt35uiCfnFty42ugD596
         BN7YGFtphKEF8KgC9POd3jp11iKnZrokUHDWN65NxWLAVOR7YHvUAMj5iHyVP9OoKke+
         tIFdVhTNGxKDxl7DEvZcAax+hlRnduWHzd8sFo6SZ6D1A760DrPbdHSvsxLYH1de6Oby
         DcXI8b/J367v/chx3HGFWHMQgKWN1HM8TgzluMvafYkvkEpW7o6NxOk1puhVLT0ICbLV
         UAdHbVv7pRMHzZhBGQtHD7469QgjMbiGaRRcafU8EoaVSsh+JZYhRl7kQ4UG9Ga9qhYQ
         Qqxg==
X-Forwarded-Encrypted: i=1; AJvYcCVvWeFSnK7a7FgOA7VI0dcSFUmpZWEBqM66uoOdKIA3MgkdifjdJQwCnBMo9VRQ6UiOkfH2S3uBwqivtbbx@vger.kernel.org
X-Gm-Message-State: AOJu0YyV3ueRUg5/J5q6KOBNtLbYxZ3X1QZC1XA4g1w790h58EhLglTM
	WB0q3boiVxCeqNulCDdLE4kFK+LT1QgDHjYqmWIV2QkEEvLv4tAS6BcknWSAMWfFnfsmWnj0STV
	EJJeoTYS/UBHw/TpCTSX8Hv7AgV35RGsBv6lfJ+/DL2aADVFshopccscxS1nHFkto4gTd
X-Gm-Gg: AY/fxX7Le7v7m+FmirvdobRvQnhMowuR+VwtedrF5xfvNsLMWyUVwU92looDUnJoT/Y
	BkXcFkh4aIppkllF+tPUV1UnOTAJdCbOhiqQrDEguXhyMg4ZSSLj4MbqBJPxUQWUUDezEB1RiIp
	rJ2TfTfMUo7P5vZcjYQqB1nIaEJSuVtwMhDP9qkOKdJodRTm+cYem4ce3M0eIADnIw8Rk+gR0Uf
	pPw+ImAZSzdTARnZ7Kv0cfbjQ3mI7CmOSZqVCQrSXLCRbqQGBGp6vDKS7eQgUMsbQz9PywKMVac
	Ctn/fg2+kZFyL8zNQLLtu7onsfP9RGr5mzvLKxPPH/H9SnJ3UpgQfca3WfFBUWnEOfIAgERFuY5
	Xg0V3jOG66Qbyci16P3zT7bOYhkwoIpHIxtCwhDUWj+7GxLThwMAxUtIXdx1IbvPCsO3HFINB5g
	mH34kVkmMOcQzFM31pvAUyCpg=
X-Received: by 2002:a05:620a:3181:b0:8c5:22b2:8b4a with SMTP id af79cd13be357-8c6a66d69abmr1919989885a.16.1768895136024;
        Mon, 19 Jan 2026 23:45:36 -0800 (PST)
X-Received: by 2002:a05:620a:3181:b0:8c5:22b2:8b4a with SMTP id af79cd13be357-8c6a66d69abmr1919987985a.16.1768895135554;
        Mon, 19 Jan 2026 23:45:35 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38384d3fe0fsm41188791fa.3.2026.01.19.23.45.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 23:45:34 -0800 (PST)
Date: Tue, 20 Jan 2026 09:45:33 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
Cc: Georgi Djakov <djakov@kernel.org>,
        Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] interconnect: qcom: qcs8300: fix the num_links for
 nsp icc node
Message-ID: <rsxdnmh4ezutvsblmcvjcwtwyuyrlrndxcyec3kth6ccqyxeac@yzcp2g6bqota>
References: <20260120-monaco_num_links_fix_nsp_ebi_path-v2-1-2933c1b35147@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260120-monaco_num_links_fix_nsp_ebi_path-v2-1-2933c1b35147@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: bbMvSJ4Abu-VM_sx0VSrIbE_9eRNp9O5
X-Proofpoint-GUID: bbMvSJ4Abu-VM_sx0VSrIbE_9eRNp9O5
X-Authority-Analysis: v=2.4 cv=c4OmgB9l c=1 sm=1 tr=0 ts=696f32a0 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=DMoFkxY2krY643WBwVkA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDA2MyBTYWx0ZWRfX8EURRCPgox7d
 AW9CBetYBLbY3PHxPbNVqeyJZIDRuKZbLtQ5IT1Is6UPrfZ+FOvmBwoK20/rPCTtwLwkyiHUbzL
 tguxxh+ZQPyrvL3+0QPZ7mh55YVfKfLOEMsxzQIQKhYOZvEZqRRr/0n26XR+dR1e9+Pc16o2DBG
 miLX68z8sS/gk7X/iVqoStjAVdGIJAjA2WdacdZSr1fyySweMjf1cAXqiBM0h4nPQCO7iMBr4cV
 EQ0RQBiA6QtVmn1EtYDcLhYsKnpvQdB65ENjmHhrRjC8OPzeH7AxyQkG7U6msV6uJjMBzOpNBL4
 HfGyJ5bPhBLLnJ+qDWzWzz+itQiJTu/m5BkBw66XfACSQo9IEQP5TsQ/e+2IiJ6Sgo+/o6D/gyF
 B7fzzTR3CQOGaQ7V7KEy3g2gMLrubML1qJlDOOD2e1/8NHyiaaNN+64gUvZPFmpLlQ7En2r0Vit
 D5scTZY20tLLs/RBhfA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-20_02,2026-01-19_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 spamscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601200063

On Tue, Jan 20, 2026 at 06:57:14AM +0000, Raviteja Laggyshetty wrote:
> Update the num_links to 2 for qxm_nsp node, this will help the clients
> to get the required path handle to vote on qxm_nsp->ebi path.

- Please describe the issue
- Please describe how it should be solved.

Having the link doesn't "help the clients". It allows them to cast votes
on certain BW paths.

> 
> Fixes: 874be3339c85 ("interconnect: qcom: qcs8300: convert to dynamic IDs")
> Signed-off-by: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
> ---
> Changes in v2:
> - Corrected the commit ID mentioned in Fixes tag.
> - Link to v1: https://lore.kernel.org/r/20260120-monaco_num_links_fix_nsp_ebi_path-v1-1-4aa2662637a3@oss.qualcomm.com
> ---
>  drivers/interconnect/qcom/qcs8300.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/interconnect/qcom/qcs8300.c b/drivers/interconnect/qcom/qcs8300.c
> index 70a377bbcf2930a4bdddcf6c3d98e95e4ad92561..bc403a9bf68c65c5e5b312505933f58c5bbeaaf7 100644
> --- a/drivers/interconnect/qcom/qcs8300.c
> +++ b/drivers/interconnect/qcom/qcs8300.c
> @@ -629,7 +629,7 @@ static struct qcom_icc_node qxm_nsp = {
>  	.name = "qxm_nsp",
>  	.channels = 2,
>  	.buswidth = 32,
> -	.num_links = 1,
> +	.num_links = 2,
>  	.link_nodes = { &qns_hcp, &qns_nsp_gemnoc },
>  };
>  
> 
> ---
> base-commit: f417b7ffcbef7d76b0d8860518f50dae0e7e5eda
> change-id: 20260119-monaco_num_links_fix_nsp_ebi_path-a658f8fc100f
> 
> Best regards,
> -- 
> Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
> 

-- 
With best wishes
Dmitry

