Return-Path: <linux-arm-msm+bounces-52225-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CB1CAA6BF8A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Mar 2025 17:18:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 266AC3BA8BC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Mar 2025 16:17:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10B7522B590;
	Fri, 21 Mar 2025 16:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jtSoBD0t"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7796B22A1FA
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Mar 2025 16:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742573803; cv=none; b=enGKdXCcUqzcq4eAXzdYY3sSMFHvf3z+Xuq3FbOQETVYfoCLCsku2Ca1FXM3/V3+KQdaGVIbMIyvA+tTqo+9egjMChF+JAXx8jcVmCSTrGC1tZVGc2s6uRTaxTo7CudkaifH2O2uSj0AmSpJ/UHEkyIvm58xFDpcjeBz4iXc/QU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742573803; c=relaxed/simple;
	bh=sX4muvpyzWlipm3+edEVZE9OiBEpH0DByrdbnIKMYr0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jxZkkHWrpM+i3G1J4MI5YifyUKxDpdxg7h0SbUUxi4+yO9fv3iyZwE8Tjo8dZVjVsJbuUeJ6YjtowNsaiEDju7cv6t1MNJRxg/bRZYTa1yHgx4Ent3xSPQ9yQQcrkFE/GRubyr6KeHjswYvCJBajY3TprcYpyXEiuF2UCany0kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jtSoBD0t; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52LATB3x014996
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Mar 2025 16:16:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=KC691n78UfcfnBIMAEEZOgix
	8UerazMGS6DJH8rBSes=; b=jtSoBD0ttl3RR0OcVWAiU/nuCCHpxHsJRs8T718P
	mPp0eDBxxTQce9+Dar557Zlf9gKMXJGcgJSLUZZjaCzrI59/MGrbjO+ecn6sR5P4
	/CkzAuySTJIRr7YNmt92bvIlxVqquRB717Kxu5nbZ+5rvED+3XClwt5jMx6jH5rw
	vDT25pWCuY07CXEUk2jmFMo98CLkWqP99IDOjgamiXKg1GUO8176ikjn/rnPwrOh
	6wSDPq5uxAB3qEhypBM9JT0wsNGqq2upSh2fSZVEsrCyUiqpels8zshaow4M/B9D
	d7/iONRXmp4uXex3oCuC3NI9Vvr6lmCqgGrU9Gu59p1Ghg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45gbngnj9m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Mar 2025 16:16:41 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c0b0cf53f3so328383585a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Mar 2025 09:16:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742573800; x=1743178600;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KC691n78UfcfnBIMAEEZOgix8UerazMGS6DJH8rBSes=;
        b=GqLh2R7761HJ7GhIIWKopU/s4xZe61Qw8CnGHpY2Qfz92mISklAhnm/kPNpY+zshLj
         k1ij7wAss36ULgRIm4CB/jXcpqEFwVJ0iu/dk3BnjC9pQHfJjiwgiwYPG8pcF0rEtq6Z
         BAybX8dzZowTiA1zqucb6/3ocoNL5Et05u6vsB11tzwmkhYum4Fkc8e500L/32LNW4HQ
         vMWXRAoFglaEpty4KZJaeK0glLiby1phL549USpQADao2ybNnIv8szj0Zrg7O6HyKzcE
         iqBpTwEEalGp93GHfyDZbA7Xzx9/4b1S9ZTZBU8J7OYGjFppTIoxgCFtQHsfu9p9cRC/
         HQoQ==
X-Forwarded-Encrypted: i=1; AJvYcCV8GqkVMzGOMDRSQlYuW9ZOUijTCXQfPQtkqQSfdAPXvqSD/OWuHUtRZLlg0cOvKcEJmW6YSXoXt/8IKha1@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/n+GVxB/HmsoCUqqZ4KDRS17NhS1hfm9ModDsHjWLTYmoioPG
	PVl90ezKa28rEhXJwJFlwkvPV3iKZAYXgIahVMYQ4dJg4g7jYHeJMLVqh7F3uVHlaDALNbok06H
	eOVGneMMTgKVBbb6m2BeEepjWHqo5Qc/5z8g2i9PQls6nOxPXhzgDqlODnKuc8yL+
X-Gm-Gg: ASbGncvuDcAGTFA2AcvGhyavtsbdY690eRx3IxxyMsWFNNhiXzdOg8M+Pr4AIED4vF2
	0ixKwggkwk3rkAXr0b7id+4om4M3o9WaVOPcIxLRgSXcxs9YK4s9dab7FOXnE35XM2NjpWZXax7
	rL2VnI/tVTywwKUPm1pvjb18zGcMZSS25LQC2jFv6B7kEPO3CddpT0Cm2KV3E4h+1oKSYWNc498
	lGTuRfGyPKyGRu521fdQxcn4RshRJmjbITij1wobjaGQ8i+tZWfjr4HNYQ1QIki5ciiIvnVVgBb
	LSWknVT7vKQkb8A4/BHLvng84vBqUyAnsTZHhEnTHzhgfttQxYAc7Z+jEESIrUP0hKj2AiF3wdZ
	x8Uc=
X-Received: by 2002:a05:620a:394a:b0:7c5:4a6c:eb8d with SMTP id af79cd13be357-7c5ba200eb2mr484939585a.58.1742573799926;
        Fri, 21 Mar 2025 09:16:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGCnw0RuPGGAcRXmxyrZFcq6Uvyn0JUfRhjB0xBqWfhqbZS/bLEaIZ6/ICcRwJQBMDqvBgROA==
X-Received: by 2002:a05:620a:394a:b0:7c5:4a6c:eb8d with SMTP id af79cd13be357-7c5ba200eb2mr484933985a.58.1742573799445;
        Fri, 21 Mar 2025 09:16:39 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ad647c79dsm212119e87.70.2025.03.21.09.16.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 09:16:38 -0700 (PDT)
Date: Fri, 21 Mar 2025 18:16:37 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] remoteproc: sysmon: Update qcom_add_sysmon_subdev()
 comment
Message-ID: <ytbcjcbzwftajmovkun3x44tvmfyljthzcsrml3vbwyvkd7glg@enfp7qfhtzkq>
References: <77a6b65b-5f3f-4a21-a837-7a4a7e09b099@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <77a6b65b-5f3f-4a21-a837-7a4a7e09b099@stanley.mountain>
X-Proofpoint-GUID: HTXhqe2K4UMvweshkrxihSCIUT7cERi8
X-Authority-Analysis: v=2.4 cv=MJ5gmNZl c=1 sm=1 tr=0 ts=67dd90e9 cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=Oz3NjKvTjiMZACM5Y-cA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: HTXhqe2K4UMvweshkrxihSCIUT7cERi8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-21_05,2025-03-21_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=714 clxscore=1015
 spamscore=0 priorityscore=1501 mlxscore=0 adultscore=0 phishscore=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503210119

On Fri, Mar 21, 2025 at 05:35:44PM +0300, Dan Carpenter wrote:
> The comment says the qcom_add_sysmon_subdev() returns NULL on error but
> it actually returns error pointers.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/remoteproc/qcom_sysmon.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

