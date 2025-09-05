Return-Path: <linux-arm-msm+bounces-72347-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AF76FB45E86
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 18:46:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3C5581C82CC6
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 16:46:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A72CD309F08;
	Fri,  5 Sep 2025 16:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PWdAgCuI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00D47309F00
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Sep 2025 16:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757090730; cv=none; b=txs/9jjx8OyqDrYDtYwRBHPOUt+rADYsDK/WfqCLUm5TJRBp8hUOSUUx7cHM0DFwk32q6EPtIKRuRP0ehWvmQRDL+OpHXIt9sV2Pw2ETW7azTC1G5xF/b5SOnG+MBOS7PTNAvbrZpSjzHm9LhW+hZ2aF2N7frYlWxlzZrb2+LMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757090730; c=relaxed/simple;
	bh=4ndmFMUbOTTdZbdHfbff2gdinb3ORcxCtOb4ojVQ+GE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FkvxYJ6V++4C0qKYZubKIHlvv/sB9L0RjpwXEGrmrJfa4/BU/aAGkyZvGuMBJo1BC725wFBq9fdc0xLsTFciJFO7lWL6+ahIE036YXes1Ey6uHKX79bla30n/EekTEZrLBWtrOwY1ICiEfhgKzzR9NUJl/kOPNIBx7ZHuZkfTis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PWdAgCuI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 585GTerD008250
	for <linux-arm-msm@vger.kernel.org>; Fri, 5 Sep 2025 16:45:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=PY3+Jawa4aCuOeTafCiAiCV8
	LrCyuUCU77yZ0e5sHFM=; b=PWdAgCuIQXlQNWNX2cVccUhP+v5vZZ8aI1e4NbWs
	oP3pUbr+rnpZKOf1wRRe4rBcPVtqjdRyTdY6qwLOC7o1zNVXNnUyAJ3yQsGKwFaC
	M6qBhrAyXZUP1NK6qCMuMcbb05fzmI0WhXwGkONqfxIZP5p+hTBYlDqey+xdSAk1
	QjN2cYLHStD3nZKctEcLd9VIwY8u/Nitity2RaV5H9eX6wax4xufOuKzophrCQym
	riLqwHGPCfMkDkcxKVevEvemK/NoBm+HPrrQXfDsaaI0VIJdEPUOy7yq0OT8WMpN
	1H/XdTYC0SGMxUuDM/VB4l1hm6B6Pn9/NI9eeSBNgNG2Iw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48urmjut4h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 05 Sep 2025 16:45:27 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-70fa9206690so54116736d6.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Sep 2025 09:45:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757090727; x=1757695527;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PY3+Jawa4aCuOeTafCiAiCV8LrCyuUCU77yZ0e5sHFM=;
        b=PWSYiBO5sz5mc+GXYM1V5R1hyqiKQQIo6CMEpi2cMDDbZ/GWbdBBdXk7SfTwIEVhvE
         Fa3yIoPCkp5iv87YRkjiRdL3Fxb2beUDzV5hm5l2lYnAyk/ZudTcFmPJ2YhFSPKjQ7DS
         TENMqcsx21ZJ9P8i0u5REIK4RKhh0qq7JRrWnDtNAL2BCcCENJ5OSnk+kZYm+72gUlcL
         gaZ74ZxUm1ux6Qzb30jiY3JG0uLtxt1IsbE39gU6uMzfZIjj9H78o4niDiiujTs4N32C
         YO4PHlIUocm/k+QCm9PEFHbFHDlRtBMl7ZvyaBEiihQHvdIp3SI6YN9z8afJ065LanzT
         FXsg==
X-Forwarded-Encrypted: i=1; AJvYcCVsadH7HwfMVoM1F0rtXgsTg5CgnoPetZFnjPCsMV1+/VuTJIuKD4k8eRPe8jZnqJDF74YxTwOxrpfa3riB@vger.kernel.org
X-Gm-Message-State: AOJu0Yxa0ARp0tmPhmT3U3z39f8nf5E5R+6Egc174IIbwidTelyeldBi
	OXIsFURiNKyik3xd2zhhTtXU6mus/mfMlpy+bkgiOEPIPsxg4IhfF8gNhhx802mqE7X1usRTNT4
	Z0RPHhGMEJG92lFXF7Axzj6rOGwbsqKKopecMVi7g7wLzaIGMAdngsZK0dVg61N6z1nBq
X-Gm-Gg: ASbGnctIzqBSnjMOefD7JR1wYgDqw1SrxGI5ZHYFkkXwe3WcnS57oa7o2E/84O6MkWU
	b8dRuQmag6EyI/MQJ8MUdTQMAinljQJRPb2GWD6KPvwWtuJ4ygaj2HawnHreURWi7j+CTmKACHY
	cp75C/mVxs15085fDrxUtoGUSKelSmP9QrjpBn+CWlKcRe1zNQXP6zFESaJWPbAKjOXLINenrKG
	LECIKhVJsEWalwcIxE7Zqr3ixxxwy3oLQtEhmxAVFLP/urVNegYXvYGMGoLc3as9Mfc/1NXksmK
	ETu5gEKsMu2EXzwcUxXBTY+4S/Biao7ijvng+1oxHZQNuBGY8kQb92tbVK7mUoDAF+lMpu657rV
	ir9DI18DmMILGEbMWedm0SQ329S9I9y9M1CgGppUacCmt94s7H1i8
X-Received: by 2002:a05:6214:dad:b0:728:c849:6dee with SMTP id 6a1803df08f44-72bbdfc9005mr43147776d6.5.1757090726914;
        Fri, 05 Sep 2025 09:45:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGZtIjm7lssml3KCe/y4SRR3EJkskoy992JWsv0TItb9NXhJIJLjjguyWB09LWjXMqF3P/SNw==
X-Received: by 2002:a05:6214:dad:b0:728:c849:6dee with SMTP id 6a1803df08f44-72bbdfc9005mr43147466d6.5.1757090726359;
        Fri, 05 Sep 2025 09:45:26 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5608ab5c174sm1911595e87.11.2025.09.05.09.45.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 09:45:25 -0700 (PDT)
Date: Fri, 5 Sep 2025 19:45:23 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, tiwai@suse.com, vkoul@kernel.org,
        srini@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, neil.armstrong@linaro.org,
        krzysztof.kozlowski@linaro.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH v3 12/12] ASoC: codecs: wcd937x: get regmap directly
Message-ID: <wml7b2iv66lyoozc2jypuf5xhkg6me4cdxac2chtrpmjubfago@qqvxiymn47sr>
References: <20250905154430.12268-1-srinivas.kandagatla@oss.qualcomm.com>
 <20250905154430.12268-13-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250905154430.12268-13-srinivas.kandagatla@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=OemYDgTY c=1 sm=1 tr=0 ts=68bb13a7 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=azzZ5_6gx0kgBHoxRwcA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: 1LpDTJbYGY8OP2Q80rs_7SwFW9Nyzhx9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNCBTYWx0ZWRfX1wO+A5DTuAQV
 +SoVtWkLbzN7+IwYZ8N9dLpZFTRwvukpwzuuzPz+gJb4IzEw1583cB5Ob/Tb4nrQtqazqw/sVEk
 UT3qAMi+EcOwtPh6L8AopCLWxTR1i1HGVTa092yMBpsAAV1KZQQrDlV0/yA+uTMdvT4MFQnBlVQ
 JWbSOJB+gUTJHdJQ4i2HJreofCI1/qg9mqv9O55V5ZWVhS1ILnivIHYo42RIoEUNRhYCWHgnyF6
 PIqbmJtdaDyxUlOCj9S7+1fw5jA3aa4VdK0AN2shCZ/uVmyLoWmbqqZvtXCKlRUu4nMet5Ip7yT
 5Qs7bKoHgMumBDbOeuNAth/MxBit0AFzV5QVBpIYOqJnL+jMVRW4Kc7wkp7OYJ8f3iIMjbpfXLK
 OcGH1lX0
X-Proofpoint-ORIG-GUID: 1LpDTJbYGY8OP2Q80rs_7SwFW9Nyzhx9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_05,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300024

On Fri, Sep 05, 2025 at 04:44:30PM +0100, Srinivas Kandagatla wrote:
> Remove usage of dev_get_regmap, as this its more efficient to directly
> reference the pointer.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---
>  sound/soc/codecs/wcd937x.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

