Return-Path: <linux-arm-msm+bounces-84750-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D0B87CAF377
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Dec 2025 08:54:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3B3ED30095E8
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Dec 2025 07:54:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9919922F74A;
	Tue,  9 Dec 2025 07:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c7plenwx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KM7cyGYT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2078C2C027E
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Dec 2025 07:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765266854; cv=none; b=kbO3Ap1rNYKcnasuPj8Mm+5t3Hu/yOWmNVoXPh2HTyFDA9de0qJ+HbF/FbuvAwqaH4q9iEE/++TdUVE+qV7xOUlHTRRJbq38O8T1PJARa1MDveY7AOLYvffhEGbNd6yQ0VPmdASa8n8Ixc95fQnW8LQr83Tc0TLZA6xnLPZJ+QE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765266854; c=relaxed/simple;
	bh=f3hFOUXZQmo24jMhZ0iVBQj23npapc2wA39d5w8BbLc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=krcYexWdCCR605Ul9RsLOIE4iiaEgPK4MMDHy+phOouh8mUVrGkTEFjGP3AhHTjN27pd8rUoHoOWnYO9Hug5rm1wayG1FqtbtUMDxPk/EnSlz5SHMERWciadBc2SW3HLGD1DSiHHTtCCbVNgRitK5nyuSxoBa3DgXbM/FSjDwCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c7plenwx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KM7cyGYT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B8NWxMq2366832
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Dec 2025 07:54:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=z/qB9ZJcl6AwCnOewAs0YoTP
	tLby8Rz7UlROS0HKyGs=; b=c7plenwxhCrqC7pWSwBYNyiWgjrMJdUlh0NDLa4H
	eRwnws3fbaTFGBG11LEcIkNZVqkrwClLMTEPkUr+8b1l+D1/LUs/Xy63jWOVbcMM
	0hcz9ginAxo9tmPYQqwtIFVI0v3XwOb7SngA8OBKwHsOT75yR9ZJaImOLQTM52ET
	aahfl6YvxIbRn5WENbEN+sOAxv84va0uJuubKi5PlZhsy84A9FG1vBRJocop0apK
	VpBkTGlHO9bZBIN8mdgghcP2bAyoUSNLtU0WihVFqeWMY+IVCO5qP4oTjYWAQwlu
	nUnRJ9X0po8ydD8oym+BwF/Zid1Pw3QLl6rQaqtVFu0qPw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ax4fqhv8d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Dec 2025 07:54:11 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ee0995fa85so171186591cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Dec 2025 23:54:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765266851; x=1765871651; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=z/qB9ZJcl6AwCnOewAs0YoTPtLby8Rz7UlROS0HKyGs=;
        b=KM7cyGYTMh/RrBnQViFHcnOGmLAubfKaLxF5p+hx9bgbq7o1dJaFEuUufYH76Yb7rZ
         a1vwBC36pgvCzpLXlwefveo3FU3XFhXBMxwFKoqWxfzMZBzv2sX2vuMpQ/vO7V+B0MDP
         EDpHmuEiiya7LAzGyYog9v7//JSGoJYOCFsqBYfejyZIQfvcGwz7bnyvfqwv7FgSHBOW
         2XuqlMOFdr51msqGrcvPxSRIAhhVJG1084D9rG4BneI+w2ajREaxakpHjyH44+sNHG1u
         nDn5jY/x+TW3vreupMxGe2qn+m9kDEFH4lU4GctRJaFrqjLmngYA06upt8ar53/38x9J
         xWYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765266851; x=1765871651;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z/qB9ZJcl6AwCnOewAs0YoTPtLby8Rz7UlROS0HKyGs=;
        b=AOACIm26e1iLjeh9CFQTVBFOFu3F16lsDv7WOucO/7ucFvKQLjhFsIUqk+D3CcrNGH
         dMAxIgUWOjT5XVYKWkm7u+Y0xDKgy78IVlZ0PuyH5x5VpUaEJCeTl60nR8bT+j9gnRid
         MJfPE7RdS4Z2nZFDtcd+gKqw2lj34+7sON9ZQL0LXo6qW/fn7iY0hzQS6zWvNlCsp2jy
         Mn72kuahRwoJPMxT6iiYG3EY8MCsJ/y2ZTU79H717JpSsuAIQyus27ae2CwULXFcnKyp
         1+WBZLVJax/AitZbQ3IGqv6Nsk03B7IPLZ7yIGIwhdLZvE2StnkVQsOsv8DXtHyVcVI8
         AoUg==
X-Forwarded-Encrypted: i=1; AJvYcCUdMefvAFfSgi/TsiYiVLtaA9U1+j3lGeu3ehKmMNbqOgN0g4+Es0OixihMMXTUPzSyd7RxuHGWrq9MRzbd@vger.kernel.org
X-Gm-Message-State: AOJu0Yxp8EOW+yZtC7n45xaUZFBx0YlpKoaSo6if1PBUTbHOFDXVZgIw
	Ez7sQ3tU9CZ/epUNfyK22E7cuVRraAKREE6MXg+zcLsOKHQeKTNJO2OuLAXJJHdF/Fw2cFT/abm
	N3saKbEd2WNU2qTNGiJ7MJ2TYdzDaKD4h6IZG50PFh5/JCDxlCYDoj51Y8ew3YqjO+3et/uQwfg
	mL
X-Gm-Gg: ASbGncvcGJzEN/ssTBPYcPl87r7XiBqQF0rMUx1FixNzaEL+3a1SzG5aymR7pNbme3U
	qGcI6OKpLdBvJbXjNillZJmqD96+KbX0kUTboe32Mqm+wNRsiJtZUKypX/FsKTFc9Fp0fO0Eeu/
	aY28cE3a8C/AI28Hx513dUqmHYhhTfIbwoIcyTxyG22ciA8MdO30gYT9ldem5DSvByK/kqJHqig
	c6stlznGl/KUnlOE1+0mgQFpZK/MRhdUN36y7nXkRGwnnpfzXsOvHbgUlIzcBvFvXbJ7I1Y4Edu
	cbhEkd4wRasJUKRpbToflLrp3m6ZN99nhDN+m4JgiGo3y7DB6qCNrkfUk2IInrFz25s9Cy2lsLB
	hrWWRSFl//vfCUdRB4E8o8fbvY+tv8xqv1hCL5tipI3SZqidHvey65l4usa/UCrAjtLVBMRpRE+
	AZGHs15+1wthJfKn5+gKe9hsQ=
X-Received: by 2002:a05:622a:1:b0:4ee:483:3128 with SMTP id d75a77b69052e-4f03fef2992mr145340811cf.44.1765266851034;
        Mon, 08 Dec 2025 23:54:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHT1HYyL+PuRpEbQzvYRyfux9Xn4dFXR+RBw2n6kf4gMz5YGRoEb6WIRsvklXhyeNSG+ByjRQ==
X-Received: by 2002:a05:622a:1:b0:4ee:483:3128 with SMTP id d75a77b69052e-4f03fef2992mr145340731cf.44.1765266850644;
        Mon, 08 Dec 2025 23:54:10 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-597d7c1e37esm4878289e87.48.2025.12.08.23.54.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Dec 2025 23:54:10 -0800 (PST)
Date: Tue, 9 Dec 2025 09:54:08 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soc: qcom: smem: handle ENOMEM error during probe
Message-ID: <uyqkzbbkt5ss6ta3wx6z4pe2jygiybpir7r7fet6am4u4cb6hj@rwfmb575l7ff>
References: <20251209074610.3751781-1-jorge.ramirez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251209074610.3751781-1-jorge.ramirez@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA5MDA1OCBTYWx0ZWRfX/pjqaFxiNfWh
 XD9LDX8vwSxzLu5jE7OMrlFBs+OHclpf6ZlS+AKcpS4a7jH35G3oisgf6ZkU0//+Lh3JlXvjXwh
 UcjLGI4OjZ5k8bm+6slkqvIu5Z+4OED/vScSTluqV2gONhiFpz6GMIeHk6Ev3i3CzscldlmS3hb
 42DWNKnl2WMmRFV3PHvUA3dwfcmT052/MzFp7bl9MWHyhvHGzEztVLxsmQ3qdwnuxyVSYu1Yrc5
 A52JzsAlhXSxRkDizhxt1fuCCfopybodO0dgP1Hq+K47SO62t9JM4VDITtg8gRx0Pm3SqlA8kV/
 23faSUnpt15T7B7YCAgSjtSwjqHEg2OA0dzMLffUevgOEIXyPEo4uNt91LAGoS8mq9uMzgmALpP
 lvFBu/VE1G3ixxA3ZWBT83pNSI60jg==
X-Proofpoint-ORIG-GUID: nC43degfEO0ezaCZIzvgnVqPMz8tUVfP
X-Authority-Analysis: v=2.4 cv=TPFIilla c=1 sm=1 tr=0 ts=6937d5a3 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=_JO6XaC-YqUdhfGpi60A:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: nC43degfEO0ezaCZIzvgnVqPMz8tUVfP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_01,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 spamscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512090058

On Tue, Dec 09, 2025 at 08:45:37AM +0100, Jorge Ramirez-Ortiz wrote:
> Fail the driver probe if the region can't be mapped
> 
> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/smem.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Fixes: 20bb6c9de1b7 ("soc: qcom: smem: map only partitions used by local HOST")

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

