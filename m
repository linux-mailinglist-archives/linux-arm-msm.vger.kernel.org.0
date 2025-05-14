Return-Path: <linux-arm-msm+bounces-57945-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 06310AB750A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 21:04:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DB0A98C622D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 19:03:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E30128CF62;
	Wed, 14 May 2025 19:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Eb4GjAG5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 902601B043A
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 19:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747249420; cv=none; b=YA+fZJawPGtITsVZzToZmU6Vs1o48VJgGLgUsNdBLpOdXlofhAaSQa+JuK9m1gnrRgbudzIkuVYhB9E+IGpLYKMA2nyLO36YY44gBTgJJqQI1cw2nqgu99T2ujZvzeK0zwa7MXB6KfUPZuV0z06ybj2MLSocqUMw/2DTQHpbhZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747249420; c=relaxed/simple;
	bh=Kxw4Pfgec4u5qPFCN5p1Br1p5kPk70dOCz3U9YB/0+w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LUFtm1xD0NFiHSQdK3b7Or7cVKV1TcM5ojGv/Yty8WUmOuUcLx4e0wUdOLoncgCTcNfVJ452YnioplkEbtyqgWtsSwjlY2Eu+Rrv0ibWN5Ufeu0NglaKi2kkmXgjpxJxxKSZpOb8Reo2DAQVNa5WwO+1xjSYHLJxXb/lf+SWSCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Eb4GjAG5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54EAuwuu002581
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 19:03:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xYRDcZvrRlAs4itLVeZfoidr
	MFA19B14tFBdS3+9LaI=; b=Eb4GjAG5gViCu4d5xl8g7M0Fiwgy45K5d9VqgR5K
	amS3oPhv0p1NEzHEQEGjSgBZR+E99/PZECxF56R3Q43j4ddfzHpoS53/8do4P+E4
	VRb5cI4hETkAH6YppRjh6GsGPSRrlh3gtIzj57B8bPCjKcDotRAryznRyBVdHujK
	m7xL07QzRemA8qw3/yUxRmu8gDeOvqHdxVc+3vejZoTjkIF87JD2wTdU8gR+1vY8
	PE7nsztC4p7cFDDO3xRjOgWaW1aVV0dvkwoEhfSu9zpj5zqhsjg/fMT/X9XJTObh
	89KuTKa3m5M8PVYWfxtQUf+3jHvVVsYnDcHLLDT/RQXMRg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbex3s2a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 19:03:37 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5c9abdbd3so9330285a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 12:03:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747249416; x=1747854216;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xYRDcZvrRlAs4itLVeZfoidrMFA19B14tFBdS3+9LaI=;
        b=IWff7CddCFfQX7SAIDx4YGjKytpRA5jVuKAJ+29d8w9HSMRVekDIBLEs9H8dHuu4ZS
         CkiuXOMhdlcElVXv8RRqKevBIZDRCgGdBzb5wU5lP2ELdhF5jDLmMCGY9/JOobEnmLPE
         aDMKEhNhIU+ml1kU80FEvupu07iGp8JrBuHo74ntjPuhOAF/5evksxs7zXjrNqpSSo84
         dQb8pV/wbdPc1ZppXSt2yUWoIcWscpBQp7htXsGf5xnl4AfIRZMFFakndc4zA5dvjXqQ
         9Vuo/GrTUqVwAsNZYF3TF1zIqqKwZwO50hiWaUyM6HSZwZVdOKTpXkq29xEe7VmGTbjL
         xnIA==
X-Forwarded-Encrypted: i=1; AJvYcCW3qvXpK27tp+OqSli6K0mdaycRMilmlwnjrw8S3ZVZYuyxyuW0xunifv11o1SZ0zkyjv2xDJoTLPL8pa78@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9wwGehW9yOJ8ULNO8plTJH9dY+tnVglUI+eeKdBHeQPfl+Fh+
	rRleRBvogb2ANTaZQ6IRw4myMsqOClKaBflvrrW2ALUWkCE9fBadBmJ1JFy4B0L0kRughe7SWzC
	wClRR2zezKX4K7Z4Vmo4y8hcmbxuTe29yHLkVyLnsUR38ebsAA4IaLTVMmp7+u+PC
X-Gm-Gg: ASbGncuXu8+9UYuEaSdTq86mghCBlqTDDw0zL2RNQW0di3xihubCNLad+znrKK7tmNh
	uyKZXW27sbrGaCLIshlUA/k5lkF/HNz6UjSNRrQUZ0EjA37dwuSuA/30U1G52rzH5WAaQ2wN08V
	sLCgxvZ1hUBHaXGw3gI1oWL4iBz3XbAkhEVIZsIidcMYBd/gpP6TEEChjEKD/RBwN1hzZe1NgiH
	TXExXk6P5aqF6wpxYpBZjDM57kqSmx85pRtEsGpHQ1TfMd6yaD3pjzxsLqzkmfUbUYo6FGDk1/2
	i9z4dq/ZfAvrIWfcyzt4doYQxRGpmxryZXuG1xWSXFHmUJakW4vC3T8hVrVQFmAhiGecZm3drmg
	=
X-Received: by 2002:a05:620a:1a0e:b0:7c7:a5c9:d109 with SMTP id af79cd13be357-7cd2888f7d3mr704286285a.50.1747249416269;
        Wed, 14 May 2025 12:03:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEnbU/N6XFKdVURfBzODUtwnKgfcbS0R68TW1dNTpTgKpwi4qIQ1yAtQ1dg+wqpVirb5QQAHg==
X-Received: by 2002:a05:620a:1a0e:b0:7c7:a5c9:d109 with SMTP id af79cd13be357-7cd2888f7d3mr704280185a.50.1747249415726;
        Wed, 14 May 2025 12:03:35 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54fc64bf86fsm2347052e87.178.2025.05.14.12.03.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 12:03:34 -0700 (PDT)
Date: Wed, 14 May 2025 22:03:33 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH RFT v2 01/15] soc: qcom: Add UBWC config provider
Message-ID: <cd4zuhalspnepn3xebwkwt4is66o27db7e3s3n7h7x4r26sg3b@ai2psdpjdv56>
References: <20250514-topic-ubwc_central-v2-0-09ecbc0a05ce@oss.qualcomm.com>
 <20250514-topic-ubwc_central-v2-1-09ecbc0a05ce@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250514-topic-ubwc_central-v2-1-09ecbc0a05ce@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDE3MyBTYWx0ZWRfX5+AKFJMETjUh
 /3iIKK7x0/5pPDupgFnApEA/8SrnrXvrVdd9l+o1BHLBHAau2kztl7+FD7ieJ8P1KUtv89ZeofV
 E6jszYNYi/CyNxGlYRdJI6aS9OKBwCoJ+1Nc1JqQ0aUg6Qk7TMuZfoq5u4s6SC+8Va3dL54jpEx
 JQHWHwTysAuoc6qU2792kBsL5r5+JcpwRgxQQscqL0umPKovnx61+eX8aLwZmjeUtWiH9uLjvH4
 zLF1O9i4Jg+3kaz3gbICvU/mWhrbH28V4KjcEj08KeM4sZRaK5noJ+5asM5qhzf/h2gN+AfxHqf
 kWqeNeNFxEB5jiKjLzM2tWp9U8M2GMmeXXt4SmFcvUZzTyYTEPwrXJA9WROfqdkg9Eez8sRSfYj
 AeuYL2pNcEtFDDsGhxWFc9r07yzlHeD3F3Kl325k2rBtuEAenk8rzZ6gHoFe77wtDND8jKbn
X-Proofpoint-ORIG-GUID: YD9-5tYz3_0pR7Cx546EMA0PjXubwNz2
X-Proofpoint-GUID: YD9-5tYz3_0pR7Cx546EMA0PjXubwNz2
X-Authority-Analysis: v=2.4 cv=IcuHWXqa c=1 sm=1 tr=0 ts=6824e909 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=CA9_ZTp6D95CLmzeQEgA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_04,2025-05-14_03,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxscore=0 adultscore=0 mlxlogscore=999 bulkscore=0
 clxscore=1015 spamscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505140173

On Wed, May 14, 2025 at 05:10:21PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Add a file that will serve as a single source of truth for UBWC
> configuration data for various multimedia blocks.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/Kconfig       |   8 ++
>  drivers/soc/qcom/Makefile      |   1 +
>  drivers/soc/qcom/ubwc_config.c | 235 +++++++++++++++++++++++++++++++++++++++++
>  include/linux/soc/qcom/ubwc.h  |  67 ++++++++++++
>  4 files changed, 311 insertions(+)
> 

With the SAR2130P fixed

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


> +
> +	/**
> +	 * @highest_bank_bit: Highest Bank Bit
> +	 *
> +	 * The Highest Bank Bit value represents the bit of the highest
> +	 * DDR bank.  This should ideally use DRAM type detection.
> +	 */
> +	int highest_bank_bit;
> +	bool ubwc_bank_spread;

Nit: any documentation for this one?

> +
> +	/**
> +	 * @macrotile_mode: Macrotile Mode
> +	 *
> +	 * Whether to use 4-channel macrotiling mode or the newer
> +	 * 8-channel macrotiling mode introduced in UBWC 3.1. 0 is
> +	 * 4-channel and 1 is 8-channel.
> +	 */
> +	bool macrotile_mode;
> +};
> +

-- 
With best wishes
Dmitry

