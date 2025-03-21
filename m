Return-Path: <linux-arm-msm+bounces-52233-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 32DE6A6C160
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Mar 2025 18:25:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A996B16EB1A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Mar 2025 17:25:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C31722E3F1;
	Fri, 21 Mar 2025 17:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i87AR01m"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 776F422FAE1
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Mar 2025 17:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742577873; cv=none; b=JhzK3v95qKrqG0C934p/TR49Ar/rxYcxzqQpJBo60WmEdPGApC2Z8OsKpsq8yY5NRtOoDo/3SYDC2kGzgcxxoPFtTv3+CuiyGN6wLOTPj61Zn7DIWLVMaXRiKmsTzYdBZj3iCsTdbqtILyNZk2GG2YS6Vwe/EQ1pyBVmjxXsDgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742577873; c=relaxed/simple;
	bh=wmgWDqUJvlikxwYSBQGbNkTJck+p4wsSLylUsigCs9M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PIHSTQgkiv1yDgwuHutsPro+W8huIbj20iIpSuzx/FhAcq6fJfPT9dcsj5ilEEDi/4EDweENqQgGFzEVCfIq9sLKUEe43MDnbSj2gdBymr0zqPnM/RNky/E4RLD3ED76Y7PDusxzTtVrWQuMMSJl2LRsowsAmRc/jsXyOun8U8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i87AR01m; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52LATANT022096
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Mar 2025 17:24:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fmyEdbwSj/HfKYKw0u3nOMsS
	tnOViYSt8oyx8TwW7b8=; b=i87AR01mow3m5gEH55ckDnJpAaZZ9lHk5FbD2AR7
	EE2nqJ/KQXV21AcN8xGx7FtunGIgNEyalQdKUGgb0RgnD3PW6JrmlzPU9E84hrZy
	XomY/qV5A/MfVWn6bJz8O7LFG8Zks6wN/SuZwyQXzBCC8VPCx66w77HekUCX5Yvx
	yOU8WzLYBJh6qgJkVXCl7VEcHbK59Qpa74GiatPXjOS7vwhYs6cmhWn5i6SizOpI
	Ai4Ytx8H26+jXrR9AezXHFlEczRqqwIpPvbo+qOFgZEGvlZPklOymDq7c+9SP1Md
	bWxT6A1esgHoiTbkORG9jsg7dL+yxdq3bq/TSayQKY3/5Q==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45h4wphdsn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Mar 2025 17:24:29 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6eb2480028cso36698016d6.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Mar 2025 10:24:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742577869; x=1743182669;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fmyEdbwSj/HfKYKw0u3nOMsStnOViYSt8oyx8TwW7b8=;
        b=XGdJPELVSFkG+3yXStd+Zuk7okhbRQ1U0qSeQtvjRcMs0Bitasi63GSuVKw5ZXBSGX
         rA/wdYUizJ1vLZlJCKqCDL6J4Fa0zxorlm/Xerb5xRwa1u7tR6Zo+Is3jvRU10Ob/pZv
         zidJLjRXb3+/E9DzNbtX4SnBr1CDkGfhV2A36qn1jboSVzgQpN3LI8mHHRnNrT7uy+DQ
         UX3ArbFBHfPtdFrazAYTfCaVqrXb72CoVhXZy/v4J+pTyL9UtWxg+IUEn37Htaw2WcOc
         DWi+XlhfUR9As4BfJU/i5WSx8C+DvDUKtnj3WPA/s3kCT7azWR6O+rSuZpxa10ITB1Ej
         sUlA==
X-Forwarded-Encrypted: i=1; AJvYcCXJi5Rx7s7HPejU+yJ0FZIdxhGieHHVKoUwlnomFkoEgrqMGQDEOTmlIz4FHBrfAXt83VccxxRP7HBlVq9k@vger.kernel.org
X-Gm-Message-State: AOJu0Yxucf1zk2+GwWzvfprq3hWHqLlTky4Bvw2AjL9XQ6fR4PiRuuzI
	/Lj/iwHcPGTtxrw+1qGzJXgqhuAKkmDGIRZaSz07/PxNdv3wHoQ0Mh/R98pcut2n0GaLdTQ7hmM
	+gWg9KmjbRXOnYfIAm5WGPwRpC5U6RQ/dDnPt6NSW6tR3bGLRsHAlD/eYlZIhMxHS
X-Gm-Gg: ASbGnctkNh/jkYTdiLJuPokhwlXL/0MasTNFvIBowViyaOUNPWBhFB34nXGjxbk5PPB
	MdB5rwilISuxzVdMffjqhHrv5qLAzVHvu+XwU+CI0uGEX8DJtMcaWiCpqnGvJA/2GTi5Oq0qtoE
	jqWyOJ89QSCP9E2jxp6tLloEkqZ5TdNuF8LOT/4IoHkp9AteLki0tLwGushkJxXT68EE6FDojDw
	KG4Gi3ThQy7ckEjSWgmJuMliK6CHoP3jd9ty5xRfMfG5wL+BpVr0gL9//byoAVRQs79Qgok6CKV
	8/Q+lysBewP2r1h+3OC0esufJeedTk3WIOKwO52TIw5AxiScywwVUQbHhBBF0QuRZyBUq3lj8Y/
	6KLY=
X-Received: by 2002:a05:6214:d64:b0:6e8:9e8f:cfb with SMTP id 6a1803df08f44-6eb3f2e309bmr41689736d6.24.1742577869122;
        Fri, 21 Mar 2025 10:24:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEYPBMkBWN8m5K5k3xpn/3XXm87TYAnHC/7fY88pVAc/I3QngrdnmwHHeW81kaD1vdN8OD9hw==
X-Received: by 2002:a05:6214:d64:b0:6e8:9e8f:cfb with SMTP id 6a1803df08f44-6eb3f2e309bmr41689466d6.24.1742577868651;
        Fri, 21 Mar 2025 10:24:28 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30d7d8f38b1sm2966901fa.84.2025.03.21.10.24.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 10:24:27 -0700 (PDT)
Date: Fri, 21 Mar 2025 19:24:26 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vikash Garodia <quic_vgarodia@quicinc.com>
Cc: Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, sumit.garg@oss.qualcomm.com
Subject: Re: [PATCH v3 2/3] arm64: dts: qcom: sa8775p: add support for video
 node
Message-ID: <cp2uisloxbt3kxe2pnogyqwblp6cjg6srao6mzxozmwn2zmrlr@5vjgfeyosmza>
References: <20250320-dtbinding-v3-0-2a16fced51d5@quicinc.com>
 <20250320-dtbinding-v3-2-2a16fced51d5@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250320-dtbinding-v3-2-2a16fced51d5@quicinc.com>
X-Proofpoint-ORIG-GUID: c6cAVamaEFQUPIOwV7RMGPW0wkkt3Een
X-Proofpoint-GUID: c6cAVamaEFQUPIOwV7RMGPW0wkkt3Een
X-Authority-Analysis: v=2.4 cv=ZN3XmW7b c=1 sm=1 tr=0 ts=67dda0cd cx=c_pps a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=MV23zIJfk3Kbbaa4CC4A:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-21_05,2025-03-21_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=819 clxscore=1015 phishscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 impostorscore=0 spamscore=0 mlxscore=0 priorityscore=1501
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503210127

On Thu, Mar 20, 2025 at 11:36:51PM +0530, Vikash Garodia wrote:
> Video node enables video on Qualcomm SA8775P platform.
> 
> Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sa8775p.dtsi | 71 +++++++++++++++++++++++++++++++++++
>  1 file changed, 71 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

