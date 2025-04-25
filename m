Return-Path: <linux-arm-msm+bounces-55689-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B2A3A9CF90
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 19:29:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 87BA23B342C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 17:29:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D1101F8BCB;
	Fri, 25 Apr 2025 17:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jsf3ZLbU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ED981F8724
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 17:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745602161; cv=none; b=XkjOM0esXmoISGE1UALyw9s6QIpMlX6ys3g4zydFV/J9Se7bLQZM1ou85RTJ8ekTP40Og7utTTAVJz32HB8+lLL7xozJR3bYVC+JMWirYDeA9NF62XAvTJOtbDIvy3ngF6qXD/QIZD/08oQ+juoOB+sGiyYKz/qv0LN4lHPotyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745602161; c=relaxed/simple;
	bh=Vq2kaZ1JliFPaYFvT1z/n9E9y0WnKdn/Apce+WVD+QE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J7PhYYaK3W57C8TIs3xwI8zxq575sLyaA7KlQbZVg0uVOOV6Gkb031jBMEIPFpZ6lHHMy1pQ5AqdWr/23bBKrjqK7l2TjTZ5rcFzFwIVh2Pcu7bhKH8z40deqQxEWpuVnSYA/jF4b/VLqENrmLbd6fnCqx1dOrkAaifYaeAv5UA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jsf3ZLbU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGKMY6001943
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 17:29:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=i2O5HicpG8+gCzYxjVsix8Kr
	oj4gSwc+A6+ddsoGeAk=; b=jsf3ZLbU+4ZoZ1REhmf/vc+IG9xQqCBXrqfLtq73
	kDNseSuCG6lqGOq8+gzFxqZIKGR15MZ8FC05Dzsx5JORjkQlgCLdE4SVRnH5ZWYn
	9jH1i4pI5DAdRImw6WW7tHQHfm41u6MkXxb+JbQPODFB74VKiFTHJSnmo/ZZAKIm
	e3fyLd6e0gOo7BL+otxn27SvuhX3JYgHEf6fdi4kHqGwLcmfzovU4g/JobLzH86H
	hMlrezE82Fiuumk1ooA00K/itoOxmpq44c5ImIbruERcjaRAwKolOuWvf1CZJR9r
	Rti7WDwpmPtrU6XUNdiRkJblZu5t8dLazbSjcR+e1rPV8w==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh3hsmq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 17:29:19 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6e8f9057432so50688196d6.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 10:29:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745602157; x=1746206957;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i2O5HicpG8+gCzYxjVsix8Kroj4gSwc+A6+ddsoGeAk=;
        b=DZNdHzDYJ+voNyYZaKe36AeAhESVu9mttnyc7442Z2sW+2TTAziDHvlEiL+P6oKvxi
         PoMK1Uv6t0cjeJ2F+ZxKRwPwL9dvTV3oMjzbZd0aUA+uYeN0DUUnUiQ607ZZJtEIa6tk
         cO5n90bvQScQYpdGTAIy7O+XmiO+wd7uD6AOWRHJMHGmjmYWUNwYQkSJa9RflFqMvxSW
         vmD/yet3aVo9g1RVmXWlIwpUpUPHcP5tOFCV6Qu0/9lDMDC+Q0XVPiwyunssr4uDK9zY
         uTsYUBrDMU8EFI63iZibr1if2H01C9x8K1y+9Hp2ZtLLseS3qi0iwJWn5J6WPcFbXFrx
         QoUg==
X-Forwarded-Encrypted: i=1; AJvYcCVfbIZu/HrEqaIRH06MMci2uDWiNm8rtOeknQcCtX7OkmkO0pDP/Lceck5Gm2IlU6GOr0gQLivlL6WF7y51@vger.kernel.org
X-Gm-Message-State: AOJu0YwZj5LpPjuW/Uaulx46drfSXgbW+D5yp6EBW4TDz5hyxrRclV29
	vbtSqFJNxBFyqLPtqQGiVJvOf0pvJ6EXpR7+0a/0ERbZivgdiD9zplRf/huEyvTy+zRE9J2Ij6F
	lud/edtjVp7LfoEMD5qMFvaT6dFNrW9xN8qFuAn7ykftXOwx8HX8oe6y9Nr2euezTTfOKjtx0
X-Gm-Gg: ASbGncsT4zX4l5aYm7PLoOhETBFVAKXXwr+Ox7CaTXiaklMltrhaKXTytorANtHel17
	hPqw+sKBWTbN5un2knG0xFm3SP0ghSJJhG66FgJGlm1dzNjLAwzc5snp8oT/i5kgLcMAd/pNa+W
	+1WEjNU0pabqCZZ6uVs5zuncBXtI6FhvIucval+C1+dUD/ejUJWKe/I+O9IUT2Hk5ESHnYzIZY8
	fJKrATQiT4pWfvHpn87BXvy3Pz5EtLQpblanpKzmRTQNCwy1dOIE85PHgnt7h2FI5nFdRWq+Lva
	oFhdFUVOyNDv6dH88EQbj6QVZCWtoU1b76HJlxI8vSUamKu2okixpgps25P+48/t1dGgLUBJOJ8
	=
X-Received: by 2002:a05:6214:2306:b0:6f2:c88a:50c5 with SMTP id 6a1803df08f44-6f4d1f90d1amr4141236d6.32.1745602157701;
        Fri, 25 Apr 2025 10:29:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGfwDIdtrIRKsVYjQf7vNsZsfKS3hF4nH7bFNPEubXKXlnRQxvHnj1wsLkMIzWwQQ+CY+aHVw==
X-Received: by 2002:a05:6214:2306:b0:6f2:c88a:50c5 with SMTP id 6a1803df08f44-6f4d1f90d1amr4140906d6.32.1745602157324;
        Fri, 25 Apr 2025 10:29:17 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7ccb899bsm670471e87.247.2025.04.25.10.29.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 10:29:16 -0700 (PDT)
Date: Fri, 25 Apr 2025 20:29:15 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] soc: qcom: socinfo: Add support for new fields in
 revision 22
Message-ID: <7qviruo3hmtchsz5ubnvyocxh3bdixtmd5hqh2e63seuc45ixd@3c3qkottroze>
References: <20250425135946.1087065-1-mukesh.ojha@oss.qualcomm.com>
 <20250425135946.1087065-3-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250425135946.1087065-3-mukesh.ojha@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: Qoctjc7L1D4ncZxH2mEX46kWw8GX5_Ho
X-Proofpoint-GUID: Qoctjc7L1D4ncZxH2mEX46kWw8GX5_Ho
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDEyMyBTYWx0ZWRfX13OVQkvB7NLf /+9rAaG4/p1e8hOo7qAByx4xX8UP0ZRoHA3CQV1WR/d1Y0evdzvZ1U5qo1W2XLVz4qevkq9WmRL q2rWIc/ZEv4mMmqoFtwgfw8ypw07/VQqPifJ0vEUoXmx+Mbp4zdNQzhaDkyymdcyPjOhVCky6Ov
 SEGj61a3Wj11+TEDgNMKs25RdaFfjikpjEuPBDVF0DGKyUDavZOja9ZjwVV1QMnzHYNTIWpTezn 7NddTjXq9h+HGru4Mr7TZH3Dv885ehWznxvQglDO1FvQNvZnLLWz32h7d/q0RDvdfKLybBPwoC9 uHXQ0+kPc43Bz2iyTQKxDEUS5xr7SxCBXpXEb8x4+t+q7bFuLAx6mUz6Zhv8u8kDTFg9bxOW9iI
 FcGSiDqKt/uvG/SUGoKKfTxQdOUgg5X7RS2Xlbo+ZLN+zn/YPOO2+z9PyO/wSwrNz4QfeGad
X-Authority-Analysis: v=2.4 cv=Mepsu4/f c=1 sm=1 tr=0 ts=680bc66f cx=c_pps a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=RlFFFbEGpoodJOQkPl8A:9 a=CjuIK1q_8ugA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_05,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 mlxscore=0 impostorscore=0 clxscore=1015
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250123

On Fri, Apr 25, 2025 at 07:29:46PM +0530, Mukesh Ojha wrote:
> Add the ncluster_cores_array_offset field with socinfo structure
> revision 22 which specifies no of cores present in each cluster.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
> Changes in v2:
>  - Added debugfs entry.
> 
>  drivers/soc/qcom/socinfo.c       | 6 ++++++
>  include/linux/soc/qcom/socinfo.h | 2 ++
>  2 files changed, 8 insertions(+)
> 
> diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
> index bac1485f1b27..13cf73744bd9 100644
> --- a/drivers/soc/qcom/socinfo.c
> +++ b/drivers/soc/qcom/socinfo.c
> @@ -155,6 +155,7 @@ struct socinfo_params {
>  	u32 boot_core;
>  	u32 raw_package_type;
>  	u32 nsubpart_feat_array_offset;
> +	u32 ncluster_cores_array_offset;

Same comment as the one for the previous patch.

>  };
>  
>  struct smem_image_version {

-- 
With best wishes
Dmitry

