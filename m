Return-Path: <linux-arm-msm+bounces-57943-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 42B43AB74CF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 20:54:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5ECB38C5255
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 18:53:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01FDF28B3E4;
	Wed, 14 May 2025 18:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LGN1rBZc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CAEF28A718
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 18:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747248819; cv=none; b=JLskxsxcx+FEcnRqJVXlter+7fJkZcHdCQSzZakdJr9PvhVEAmgRgZn48KSsqSCXBcOgCJFVlxxEguFbtM5jeBvD1+MF3Ju44edZoeRSmgMqMfdIqW6RcySB9RhMnGuS04B4ja5nJn3qEyLNklQnc46KXitpviHyk5PB5oVFKsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747248819; c=relaxed/simple;
	bh=DenyVCoE0RAHWPP7ykajv60a+GLIC/b1a2OG1bz8byA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BvFO/w+BtrGgJYSCHXztuO1tN3hyrWvCoxYRIEkMJw6zyD/OsqfYIdl8+U4Uf5JfJVgNT5jnMxuk/T7xt99iMltt7QYvYRU/sKpH42SVJA4j0jzlXVKdAHhg4cMKHv9HptB6RVfw5jf07zEOrfa2AmHHVrpZfUvDWFm0WTwx8RQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LGN1rBZc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54EAuv4Z015137
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 18:53:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=g1u9AjxY4YHd0zzxyGQLIleU
	CRHdyFyktyL3hnCDzbg=; b=LGN1rBZcyZ6Fb2C93lULqvsXn2Y7OCTNQy9zeHPd
	3qdtlX2oRYfQ836qLHSHeqOUfQJNwnSgjTd8U1YkeMFNjP2EBX/xUnZy1edXmsJQ
	jUNqnPDYUlQUx0CA9ERhLlBCZBx9FC/A8p2X1pAZAlgHeR6gNXWXwzJ13PktAxup
	GMtgaSTpOJ/KzrkZ2OT8gZe4AF3+pBsvW9R/dCK8zWoXbxOP7hA2Bxs+CLCO8eXA
	MAlETUQyovpborVg/Imd1x4aDv0fZEIUEqp4aQWZeSQC83jbMHyUzIm6+fISg/Mp
	1/bU3TU4KhGKi2DymZV41g9xCmMtsL95ON0wF5/LtegNug==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcr3nm8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 18:53:34 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c7c30d8986so19571985a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 11:53:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747248808; x=1747853608;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g1u9AjxY4YHd0zzxyGQLIleUCRHdyFyktyL3hnCDzbg=;
        b=Qc6jQFQImtgaHvzSctytvsgQHmt1LJH4AwVXcEE2kkqTdRIgxLzovJcjcJOZ4vB1+T
         gphyCgpmB0WqHZbkqnF3nFuFagPbE3jOH5+DBYrgy/Vve3NktYGCGTjyJZlQxT2gEfB/
         kykK7G9rpxoCSoJvkVIJUrEZDkXSEgU21uwyV2NG6JJ6Pu+ImzvvqONh9WZg5MhRFv16
         IR8kvHFKqGwhcpqfNf3Ua3hhAqGgRJ1kZ+jeFZmomM9PPowkKcu+fCwHvfGddgabeXBE
         G7SldbWsd4qMVKKjZwEMXa18zmaYOgz50JUDCYIy1Ta+UsNr9kSOck33nw3rN23HoLA2
         eYJg==
X-Forwarded-Encrypted: i=1; AJvYcCUxDWf4zZz/Q/c8i9tOBxR331Q0gf+TnX9F6ZvgmfqjHFE+6XY4m+SuHMOMFTrXlkQ+6HswCM6QtLGB6V4R@vger.kernel.org
X-Gm-Message-State: AOJu0Yyr8qq0Bvp85NJ54YqcsX2fGtvBGKDQLaoUEY+C1i2Uthuna1B3
	Dli6Y4z53d1618g7wGNJrglPR8w4VH0Pc2UMnxcmplw/PTEgq07eb0BG4MDbk63h/XAfSoh9Xxx
	pqpYcm/8+J+2uGFR6LvWuxSvL69wDXARCG1Mu7ojTOkgNJ/HjbnUhfjYSsGYBrtGb
X-Gm-Gg: ASbGncsyr4MDxoUSvJqGL/IUle/y+w80FW/IGOc0RLzP61k7NOB19830O0qy/9pV7fD
	dSbdDB4OjQxJKYu/GBHNNJBFOAWMarw8q9yWuE0LDNr3myW8LBCDakBMKHUa6rIxLXDn1BZqFHX
	wxfU9ME5yVCit0c4HJpz3YlazWak5BnvwX0LjgDlddjFMZTRPLSWAxMvhJT/eCmQ0J8Ez18BXi0
	ZUXJyzPSqglkOb6ZLFYaomgtGiolj8soU1w5s06LCSgH460DPhGVqsvWl0+enEZrkHaLtz7hivp
	lcLwlFZ0FoTXd/alzMhhnRZxZP4VrK9Chew9I2+wkRGTmWKiZYYTfEUf+d2PPUNHWqLCzQegQ+w
	=
X-Received: by 2002:a05:620a:2685:b0:7ca:f021:4d3a with SMTP id af79cd13be357-7cd28846e89mr557329185a.39.1747248807898;
        Wed, 14 May 2025 11:53:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEni7d5kUjD2KP2PjQKe+EW9a164yH0fjztcPSlhC8TjwdgfR6PFawkMxitDxR1Q62D/acBqw==
X-Received: by 2002:a05:620a:2685:b0:7ca:f021:4d3a with SMTP id af79cd13be357-7cd28846e89mr557324885a.39.1747248807417;
        Wed, 14 May 2025 11:53:27 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54fc64cd303sm2361639e87.245.2025.05.14.11.53.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 11:53:26 -0700 (PDT)
Date: Wed, 14 May 2025 21:53:24 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH] ASoC: q6apm-lpass-dais: Print APM port id in decimal on
 enable error
Message-ID: <xtq5rvhihppgmi47sihvz36k3t5zrj6lmuskoevilzdffrode7@nlxr4go7hwo4>
References: <20250514-topic-asoc_print_hexdec-v1-1-85e90947ec4f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250514-topic-asoc_print_hexdec-v1-1-85e90947ec4f@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: IBw3P5x6EVJH0801DV76OS4EZ49CwsrN
X-Authority-Analysis: v=2.4 cv=Auju3P9P c=1 sm=1 tr=0 ts=6824e6ae cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=lIfUitz33hkrLK1uG6cA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: IBw3P5x6EVJH0801DV76OS4EZ49CwsrN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDE3MiBTYWx0ZWRfXyN65ts5imZ2Y
 k8sRRHCazexobM8hmdvl1vOXcugP08VingNrgsgKD/AOjWFMBSWRbP3QdJPWJMRr3k8RooAvG1M
 klzIWXmNyWtgkbIknYIhlWKRu/vqWgC9/minSb9WVE5P7qR61ODCp1Xux7OptGMT30YTYs8qSh6
 is0DRBpdveOBfc0Vtdmo1EL8dhO3/XH9GObDOkwp6VdQys5/QsevuUm/iT50gtoGXwraZKM0zv+
 4JdsEnHxaXcUqiuDRIw3SwMZTFKdLwSTbiUD9PFGt8m3d59Umvlx42u2IKWDIEEGYnM3yPRcLtq
 5RughuhCLO+tp5yF9tKwnnV1Q1IG4uM4mIAmyoX4cbCfNxhDi2uYrnJb4Bg/V+PJb/DfAkbEuLF
 DR71G1iBMxWYsPCSYL945XYifAXlYzwLR15wXI0qE6B3iCDA8JMXLE//Q48wDL+bpLBS6ubf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_04,2025-05-14_03,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 spamscore=0 impostorscore=0 lowpriorityscore=0
 malwarescore=0 mlxscore=0 adultscore=0 priorityscore=1501 mlxlogscore=741
 phishscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505140172

On Wed, May 14, 2025 at 07:53:38PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Change the port enable failure error message format specifier to make
> it less confusing.
> 
> Take the chance to align the style ('fail'->'Failed') while at it.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  sound/soc/qcom/qdsp6/q6apm-lpass-dais.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

