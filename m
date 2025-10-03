Return-Path: <linux-arm-msm+bounces-75927-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EFB06BB793E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Oct 2025 18:38:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 88D511899C9C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Oct 2025 16:38:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25D703B186;
	Fri,  3 Oct 2025 16:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BDAabfTB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D3742C15B7
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Oct 2025 16:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759509487; cv=none; b=OKhYgmkP16S/6C8MUSTr9fbYwfJdnysfr/vPXcpxZwtoos3pHv8ZNIWUzd5DYQiA59MjtmjdqWOYJjiyp2rJY3rv8Ney5uAVwGG3425AohxE8BrrA8GSocaIiHgyAbEzyepo09zBLEFbwl17x2zFrP2dk217L1qaBc3C1N3dCnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759509487; c=relaxed/simple;
	bh=Rd4ITa1ufTX9QpDN7o4u6/QA3cwL90cyiRqHsHecpUk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tnoDSyCjci4ef6Mm2u/j/UFYAq9yqE5X8Kp8XnL9pnQbNVYgK974eprSux0rjle6t/RlE2zG3fufFfztuPV7kouGdK6ZnN3SiLiEZHKBV14Acm+En4Kmacz7bZTajzNIFnxqUxpJ9RkGYoFJWVHEpHNfOzyuzuLJFV7468CpI4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BDAabfTB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5939SMuY024838
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Oct 2025 16:38:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=PaB05ReHzVkjcgDOQJ8wCEcv
	GYDkEolJa/U3B3s4jhQ=; b=BDAabfTBHu4Qu7hHQcd4IUutsFopPzc789XbybRe
	tzimqUkbL+tppeZO0qOdF4ae7AbWNAr2ewqk7VA4DRN0VBawMYahdyLjSNZvPO5Z
	wW7YVot4zjAiwsgzl7HQ3u6gDxNHcgI//Gy3/hnKOYssKKxqixoGbog/jtwbC2hw
	p8FFXFFJuRrfRvpmEaSadBLlCN552h4+fAQUuc3+vol+H5TKYaiPXwZr/BKz1/jV
	KU2jbNZ+R+r0lM9bnAw3DEBwULi20Ndl5XVUo1ix8tKuocoxXxMiBynlsgXtwhiU
	GCwz2Zr/jlzRNlqtU/iA63FyGrk7TSpwt3VKA1grlgQ1rw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e97836n0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Oct 2025 16:38:03 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4de36c623f6so59602901cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Oct 2025 09:38:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759509482; x=1760114282;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PaB05ReHzVkjcgDOQJ8wCEcvGYDkEolJa/U3B3s4jhQ=;
        b=OpuncV6xvzDgyYCrMjWHLXAYOv3MRbOojvZ4s+u8c7HFJDJ3hwbfF0R0MBdAbE2J0b
         ZNCN3G4QKuH8z/SS5RRFBVTg9AhbZi7TRGyQAcMUNU21HONrJzJJS1qsFlv5DzxQRLXf
         FnlAQapTlZEvvNGQDuuhwjBK55pl6qbHiumNMutRJxZg6UFRHA15BVGKR2QXSjb6rQkq
         kNqatQIb548h4xLq9IIv+8LcotQkeeMqYMLTOU7ELIMxQ/bPQrt3MHGTeVYA3HdgJVfI
         jWPPyRfHoOt2MZKFjlZBBtEINvSUMHPe3own+yCQZTQUX1ZbwnE+VeYSN3mvzU6wjmfG
         tK5A==
X-Forwarded-Encrypted: i=1; AJvYcCW5Bb614b8kRVauPSjfr+jdhzsv86sg/QZTe09T3J3EJL9VtkGs/OvTUE663qDlHQngh1f0qs+2JH2FRqiD@vger.kernel.org
X-Gm-Message-State: AOJu0YzZ2HPp256I9O7b7rV3PVuN2/hJgMHEjEYEPv/IcGs//vjXFYgW
	eqUuqUQn1eOZMWUVUJX0BD7yWtKg/DeoQyvgWdAtyG0b0b9IxXFotOKJHJoJTuvI+CA/KTWpbeH
	Z0z1VdzhssDBhXLB68N19RVn0VaPh71oYOkNkXU+Q8JjhdUvnyTUAEBYgvpEmGrFrLArW
X-Gm-Gg: ASbGncvpeCEGRdikF548hyG4b2PpkWpCyIyug4WuXgefjpV150e0vv8RQ8PuvTxP/9u
	PKsNiq+baqw3Cx3UvZO7QzzdLS1Qi288zYKG7JF7sUfvwSWxJJkRRR8UY+cdl4fp05QqfMiUsjv
	umSDfGtYsId+cwii8+DCsoAu0ChF10+boe34kCAv3QBM4ibdpu3swI7WPs7yY6jvEWwfvVKFGWx
	M07ZTRHDvYCAWCJoZr75Jr6sRp1rRU5PqthMFC1it3SowgFWB9M92fwt3Qm3IIrVk1pUkzB3I8A
	C2hqXUvyZ12lapZDx5KeEnYCDRpb3XfVhtiZuGFJOTW7JRcfqYios17//uGh/4f1Bk6XZnfXFRN
	mHMnuLjp4ticpFGTflP0cVAZQIS7mYsKx8O+W+qTmZNHt0u9PDbx2CIv3mg==
X-Received: by 2002:ac8:5a84:0:b0:4e0:33d8:c636 with SMTP id d75a77b69052e-4e576a80529mr50279111cf.26.1759509482026;
        Fri, 03 Oct 2025 09:38:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHSWbvfWkZQINoQDGTwKD6Xs8g7eq9/yE76D0brkwEkWdt9KSTmMQhBBhVaw7u8NS1F6T0QKg==
X-Received: by 2002:ac8:5a84:0:b0:4e0:33d8:c636 with SMTP id d75a77b69052e-4e576a80529mr50278691cf.26.1759509481479;
        Fri, 03 Oct 2025 09:38:01 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b0119e878sm1983385e87.99.2025.10.03.09.37.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Oct 2025 09:38:00 -0700 (PDT)
Date: Fri, 3 Oct 2025 19:37:58 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org
Subject: Re: [PATCH] MAINTAINERS: Update Jessica Zhang's email address
Message-ID: <v37d36nd7ues6fp53ncrqdzvmikzjn4pf427wztzatc3pvqhvn@kpg5jrkqbfc4>
References: <20251002-quit-qcom-v1-1-0898a63ffddd@oss.qualcomm.com>
 <35jqgias5o4ruhkc72oacepcq4skfzpe4gyivg2pz7bnpy5luj@d5saa7y7rcus>
 <e42176e9-cac0-4142-b463-9eaf86906c46@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e42176e9-cac0-4142-b463-9eaf86906c46@linaro.org>
X-Proofpoint-GUID: lnQ_Qc81z-M_0APkeR27NC1D86raSxJ2
X-Proofpoint-ORIG-GUID: lnQ_Qc81z-M_0APkeR27NC1D86raSxJ2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDA0MyBTYWx0ZWRfX1w7mdEoJc/A2
 JWsyxo7DOouwKALppzHGuvBibKv8L/uPlBX46wy1mh7VGI8lu5THUz/lsofoEEDeaaPxzdLUB9O
 xgpGBAGa3TALpVMjlzes48Y8CaeUCgHCVOu8Q1QY+L0NQvYag649r9X2I9os8K2AJh0xkp01yHa
 EjMeS7q75a56/CyKbhzFRNwdWOmu/GKx81ntbjXqJWQVFJE9ngATt5QTe0QN0qHwbpHG9mFy/fE
 fyDv8JR3DP5pY7XrJv+DbieZpf0dvlIYisoCwvx1PyTIsl7+pLJOxZjJi2blWI86X+Y5LuUJXod
 L+Tn5mZd06tLwed9VMQaUF5zpR1u6AxTmaUFLwUY0XoUvDJch/XfC8fQ1XRDnZ1dHo0KmxZWixV
 dZIAjIkEy0902YAIUxBL8fz9JSgp8Q==
X-Authority-Analysis: v=2.4 cv=Sf36t/Ru c=1 sm=1 tr=0 ts=68dffbeb cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=qOohxIfdt6ZrimawmyUA:9 a=CjuIK1q_8ugA:10 a=2MHBSq50hwYA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-03_05,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 suspectscore=0 adultscore=0 spamscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270043

On Fri, Oct 03, 2025 at 11:01:56AM +0200, Neil Armstrong wrote:
> On 10/3/25 03:17, Dmitry Baryshkov wrote:
> > On Thu, Oct 02, 2025 at 04:57:35PM -0700, Jessica Zhang wrote:
> > > My current email will stop working soon. Update my email address to
> > > jesszhan0024@gmail.com
> > > 
> > > Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> > > ---
> > >   MAINTAINERS | 4 ++--
> > >   1 file changed, 2 insertions(+), 2 deletions(-)
> > > 
> > 
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > 
> > 
> 
> So dim complains you didn't review with the right address...
> 
> dim: ERROR: 261785a47e0b ("MAINTAINERS: Update Jessica Zhang's email address"): Mandatory Maintainer Acked-by missing., aborting
> 
> I guess it expects Dmitry Baryshkov <lumag@kernel.org>

No. It is a known limitation of dim, it expects a maintainers's review,
but there aer no maintainers for MAINTAINERS file. 

-- 
With best wishes
Dmitry

