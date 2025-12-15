Return-Path: <linux-arm-msm+bounces-85274-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 37B45CBFAB6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Dec 2025 21:08:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 557B230B1160
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Dec 2025 20:03:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E050277C88;
	Mon, 15 Dec 2025 19:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JaP7NIQm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XHc3kJT5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6952225408
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 19:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765828292; cv=none; b=UZ9mlW/1g44WwXl4CV6G+09YouSxoFt5AZNRcQDfyB6YrP8pF8kzszsua7HH1YbN9pZiR974TcyAklTwMKyaQlBFMhGNqTpq3fQtDjToI7rgECQ1MPGo5QDDtviVh3qua6rH/c/SKSPwu6X1iB8ktvup5Q3PF88zLXofHSZPz20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765828292; c=relaxed/simple;
	bh=aVmk3qRlwdz6mN4zqLMEo5ugflOPlLaYgaA42mxN91s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lb3FEwciIFkMYd2ZuSCfkJQCfFmKR0HasHq4hD4muRVcQRxNrh9KMD0VK3SxL9iq2vMKB8nistHmvSfxbzAIzcMvo3rq3moAc48XL6eIQNg2zrVNaKoQmjFUI1oDPQWT+2bEpLxs35z5vC4ERSFa9pbRGRdM0X3M56/CmHG3v5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JaP7NIQm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XHc3kJT5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BFGiJsE1268578
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 19:51:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8zZ0wVZ6CGJG81lJ8F5lk5/TU8p/2rjklemmenOPYHc=; b=JaP7NIQm+vx2yYZL
	SjtLCJT0zTWchW10Z0kmh0ULx2CUE40/2Kaha7qqZqPyTJZgFQ24ObUQ7GtgkzKR
	8nG1dMsKSxSPnhYqxaEitHG+k/FPhwUyInIeuoBhDRNZxsZ6Svgpj5w9Nh4tWsxW
	VZVW3ykRkrBvhsV13vU2+DNg8tH9y2eoGH0z9aY8aawVPKveDUX8jfuWX0UmULVl
	Le8XBSzb+jahP1ZDfuxRsOG3n+yLqNnfb82Ji7vCA+9zAdFj5b+J9Ysqp9LVzsPR
	mo7pLQz6Tgym7WV21Ii1gi5sS5OXQiWCM8ZNyVX0CtJ3S8KtNJqDMCS+DUmrRRsR
	1k83iw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b2p46gg00-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 19:51:28 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4edaf9e48ecso103917081cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 11:51:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765828288; x=1766433088; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8zZ0wVZ6CGJG81lJ8F5lk5/TU8p/2rjklemmenOPYHc=;
        b=XHc3kJT5sFxdUsWyObu1YBZg89622/3j5Z4mAQPUXNT4snFvNrw5l8/1W1BT/Hdv3N
         LMbVg377hFJQMAsNhaiaJppoM+tIC43IFazB+cL32Jp6AAqdkPqtx2UxP/QBa896TGeO
         kLOJEXcwuoqAUDpP6hKNJxQ5XqbmcCfklw9HerFtruPB680b57mpRKslEphK13kQzpTM
         Jj/LRyCp4nb71Uh+czLn5rwt4klS5pgQV2zIXpSdwABIh6+ksJC+RSajIKL4Z14gRr94
         +jvOQnSIwTBNcMC9Y7YKpOXsHpT4e2+EPOsc1YOhhIzQ1w4OM2O0ZHwdWiHOIhxieMK+
         YmOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765828288; x=1766433088;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8zZ0wVZ6CGJG81lJ8F5lk5/TU8p/2rjklemmenOPYHc=;
        b=J8yol9Ib9u9aZDeuXjNaUnCyNoLgZODL1abGghdEkpxPh1Z6PcqyiD/r+m5gSiSRbq
         SLMSvgMopGDYotdaR8XrLegagLHVOm5QeTMBnrwkI2Ir714N8228CObNVikAS56NykSJ
         Exa9MSvkaom2u4TfIJGR8JS1+seDpGTXfrrYS5kKEq27fll50Tl/N2pR4Ww3E8XfbaVc
         L/fwW9Oyko9eJaEfju/vvW1U7WS9UT/bCuyRgWgtRno7+JqU+0quvS3281AUtoH8BbIY
         xnZkaA0AEq8oJGvRYiVHnu9aAG/xZ3Cg9p3GsUzeH4BNyRcgC9NNabdVqx2T27jtXxD+
         1wXg==
X-Forwarded-Encrypted: i=1; AJvYcCXFYmtf0MbimNDcPvJmSlfTS632G7K7722kh6ugJcXDCphRCSUslUyjZrAD+EGtucFUGTCPQOZSmy8lsKQy@vger.kernel.org
X-Gm-Message-State: AOJu0Yz13SVKVMVpBDPxdv30i9NAzQ2Qi81SCB9f9XoJx1t7EF1fakcy
	2AYBrPvMYIy0RxPKFD5OItmQoEOQVANLc99Vfoj9/GKjywBV4dBjIR7T3rNTtE2BuMrZfIdRati
	WPCAhKBlkml6Lwnmd2+ko+MmcTkLc3/qGVnkm6IQM1JDlDyD30EzLPiH84ixdyD87SbS4
X-Gm-Gg: AY/fxX7gJRSEskYZGeTBTOrJGEZKmYuJuBuISXEHyxivnmU/OptE5+EGbOHEpAJfGyF
	4IZDKuhrHqLljgfUePyqx2Ktbt5Om0YXHsdkBwKAAWegg39KgQyKOlf7dAXlYdw1YzTJgfKWNn1
	J9X2FIHiRigwW+QjH4pKRyxNXmDdl7GD8ZRpjQWFupAkznHrFpkXyVYwH+mKMA8vWu9w2nahzNJ
	orewYTQ66aZ0f4wi72FGrR5exisZ5uy3ohjsP1qkPzVj6BQKinMu8OETsUuL1+9xZmO7qOievVf
	0btf4akL0DHVndmZuGc8MvXj4NdyeHsRKSlx4aOPZOky8wI+oKr+i20tTGk0iAzCXJXny6R9pzM
	yfa26kHGyrdAZgCSSJhVVacWfRQYzQusXcl4nGhy2GvivYl5d97bh5hHZaU51iKCwSxHlWLR8pb
	gtb8jYSnHcgjV8YhDsDr4Pb+k=
X-Received: by 2002:a05:622a:138b:b0:4ee:28b8:f110 with SMTP id d75a77b69052e-4f1d04d43e4mr174778601cf.29.1765828288303;
        Mon, 15 Dec 2025 11:51:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHR2qqzf15w/PQE+3lVEkOfu7VDJB6n+c/cemYOJART+y1y9TjK4ViaJ5YvWAAh6xBm703xow==
X-Received: by 2002:a05:622a:138b:b0:4ee:28b8:f110 with SMTP id d75a77b69052e-4f1d04d43e4mr174778291cf.29.1765828287874;
        Mon, 15 Dec 2025 11:51:27 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5990d98c478sm101449e87.0.2025.12.15.11.51.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 11:51:27 -0800 (PST)
Date: Mon, 15 Dec 2025 21:51:25 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: qcs6490-rb3gen2: Adjust tsens thermal
 zone configuration
Message-ID: <zf5ztvnzaf6tplpjpytwbhktrebdnst2doybuubp6rjfj2fjs7@t2ma4ylx67gx>
References: <20251215105934.2428987-1-manaf.pallikunhi@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251215105934.2428987-1-manaf.pallikunhi@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: Cka8AqqghcN-j2mq6yzG_mByWu2ELEX7
X-Proofpoint-GUID: Cka8AqqghcN-j2mq6yzG_mByWu2ELEX7
X-Authority-Analysis: v=2.4 cv=TcybdBQh c=1 sm=1 tr=0 ts=694066c1 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=Q-NFahC57dXWrdbE1I8A:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE1MDE3MSBTYWx0ZWRfX27k4Sl+xPW2S
 RYuXF6XqJBpnTB+XPIqhdM37D7jPJiINc3+OdkJp1n9aYCb8NY6nxH2HdUu3CZY1V1179pn20Ky
 XqEHEbh1bdtL0HBprvZ9OU4DV111VEypqIx5Jpx3dnP3hoRoFCl7JJfuOB0Ij3t0GI94SGIVTwD
 4N8eGFRNVQr9mR5YL2vuv4YVmOL1TBxHH8E6bPVnlf4qZtH0c+3zMYv32meWh7huXCdSRqbL6ot
 UJJ8sqgu5h3eY2DgLht7706RvZzglD6pS6Ipj2iNMDXREJcUPy88nwaHtc2eW+lzi4e6M8Nvaiq
 n8hfmaBEIXprCvKLqLEnOix8fPcYc2KM2sAy+VdKa1VZX8pWUUMyOVbzsZqVsa+6/RnXvnEYJqd
 1la0LHsTJwcBLMieUVq/PtfkO9qDoQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-15_04,2025-12-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512150171

On Mon, Dec 15, 2025 at 04:29:34PM +0530, Manaf Meethalavalappu Pallikunhi wrote:
> The QCS6490 rb3gen2 board uses the same Qualcomm QCM6490 platform

Is there a difference between QCS6490 and QCM6490 or between QC[SM]6490
and SC7280?

> but has a different thermal junction temperature specification
> due to package-level differences.
> 
> Update passive/hot trip thresholds to 105°C and critical trip
> thresholds to 115°C for various subsystem TSENS sensors.
> 
> Disable CPU cooling maps for CPU TSENS since CPU thermal mitigation
> is handled automatically in hardware on this board.

Is it a peculiarity of the RB3 Gen2 or is it that Chrome devices didn't
do it? What about QCM6490 IDP or FairPhone FP5?

> 
> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 334 +++++++++++++++++++
>  1 file changed, 334 insertions(+)
> 

-- 
With best wishes
Dmitry

