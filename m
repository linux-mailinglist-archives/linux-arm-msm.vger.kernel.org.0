Return-Path: <linux-arm-msm+bounces-77261-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EABDBBDBE46
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 02:14:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 344B21889DF5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 00:14:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 878552B9A4;
	Wed, 15 Oct 2025 00:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Dw5YYCqx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFF0544C63
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 00:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760487231; cv=none; b=EP5yR8c7f17hBthbwEPjJ/B1O4f0eGVYDwOCdVurL9mHG+PmKe8ZUAN9SWqMtHs/c3tFXsdGE/ivW1INmYibuQJ5kKAJH/FnbWW1EV5Qs/ny2OWw/IqUd2MgoaceEJLbcZ2o4wJJH7haQ77AQ8tQw6JtOshQ+pN1BeqBsSGCSQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760487231; c=relaxed/simple;
	bh=cKDkNRbRQye9SCobwds6hQHh61wV4VK31p1ghM3oL0A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aWbOeWCqoEEe4ac4rlzjUNwAQjy0mvtwi+H756V9pgdOtMBBruXkeh9MFEY7HBouFxh7VZsglqsr/fslwZZdPnMOtvMG8tSa9lQLwGPzXYPXNiBDpiGR5R7t0IjbbsMuKQqkyLu4yu2rMkEZbs3cJgJ/rPeeH/B+gsWIH0Bs5sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Dw5YYCqx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59EKRUgC017936
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 00:13:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=iARUFZXc8gCMdc7i/8Ow9Fiz
	sPpC/ZIAW4HsDsCSfj8=; b=Dw5YYCqxvnj3ZC2jc5aiKPIs+0jY0O2OQ3TIMR+m
	/DR91rsvOah5UhCyPSuBeADZeIgiCvmIRsfnGanoHQED4qVT/RDwCQoCU5S2oC1s
	Zj880rry9Kx985EuvkakShpPizAkGTMD3CVPBzIyKtPA2F9Id2nqr7N8vIr2cYh7
	rnOmMEW4d/GD9q7w90sjw/ZldAfHWxBLfjfbupk7DbotdZMw28zbUNLt3hHUxf0o
	jBeQ+c+Ma7ZKUkppd1iDeOEPH7SJmit8olHijGcffqCWl4R7nNp+zN1AfSTaam2E
	ihq4oRH4Qr3vVNfCc1ruwkjjmQJN61ZMSrtbNYZ6skzNDw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfbj2g0e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 00:13:48 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-857003e911fso3010089285a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 17:13:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760487227; x=1761092027;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iARUFZXc8gCMdc7i/8Ow9FizsPpC/ZIAW4HsDsCSfj8=;
        b=HFNBMmoiOihySddbEhyWJszVIZ5L3xRUhMmCYaVKxpJ1EpEGi7+p3P2MBMH9Bor4OG
         0Ipt0J/9isUgltZ4wYYxOUzzTK5W/vx1GwD5b1qqvVNUSrsMVZSlO4x/g2hQH3FXRmss
         vvS+Abw9LAgh9rD9mIGlIPrxVIVELIwldqzeiwXvUAzE5iGSrIYVd0e1Yf3/RvdAeSj/
         3EgodlHM2/kAyk0oSBq5SCpnDzoI4D3OQQClC/iGwb4D1hLmwP2WNr/wIyghmQF3bZx4
         0mNrREy45F9YvrFlk554f4r5wxvDmlqZI2nQ7r92zUPRqSbY8+dYhdyXYvW5abslBAo8
         V2dQ==
X-Forwarded-Encrypted: i=1; AJvYcCX1na/zU94Hj5UWxSvm5HDG7CEJeBKX+IDFqjnF6FDT2kTBV8yUuHMjxxQBlQ5NTquNZJTUFiWTbhJ6Gppk@vger.kernel.org
X-Gm-Message-State: AOJu0YxwAewiexusWZpG4t9RJy0C+RMdL5vxf/IpNAMrEZD/XWQh4uez
	Ui4C9YWxP8Iz1wLT8U7A6o9BhfoYueSqCKrZThPvwSxOfp71eJzZBRJSmp/Dam3t0zqq8jkjfV1
	iBKp5/gLaUMfPw0Oq+GzEilOxPQ8ipjTCF8s/CUi/1DMmO1rwDVWb/MDVOTZBlTVQPMl0
X-Gm-Gg: ASbGnctiKxfQa0MnXQRfkqhd9S1eSA6Zn3tzHagnIZVq3EundQgwry9/iUQpCtnSJq3
	NITfQubMXsiFGlq493Seq+kPnqMHuLifiR64Ni0PbTv2BoxheiWBOdgOBIl+9Pb14XsgCaOT6bM
	FbybtnS8uFSJLDr7YqLVrdgGd88v/QMe7Fg6XmwWxyJT9sji25UH0blrWAhgjc2fK4xFbjbcagh
	FXdkiUAEht0Ce8vQmCe9t5LRT1ZNZYcMc308J8I7BF5Xwh9k76lfAPt8dYySkSPEyOtAj3EeEAA
	3Th9M9h9MoytS3s9IMs/8UnDnxbTnFCO+sPzoAjJN5Nl+KQfe8c0alIRiwx9G0jI0duMXBM4F+9
	WhPRYzaY9D5aPo0VQhRVpIrbL9VJq4WOQk5Tgor7dPmbmyFhNvhIj
X-Received: by 2002:a05:620a:710d:b0:827:e9b0:2761 with SMTP id af79cd13be357-883521db96dmr3761789085a.49.1760487227563;
        Tue, 14 Oct 2025 17:13:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHdSyBkINIZUcXEQ2ol35aZyHvOmzevhJoA60ezIDdbGsbeJ7tDiBuc1768MTDcgexRTxuHAg==
X-Received: by 2002:a05:620a:710d:b0:827:e9b0:2761 with SMTP id af79cd13be357-883521db96dmr3761786185a.49.1760487227048;
        Tue, 14 Oct 2025 17:13:47 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3762ea3b31bsm43141211fa.47.2025.10.14.17.13.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 17:13:46 -0700 (PDT)
Date: Wed, 15 Oct 2025 03:13:44 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/8] media: iris: stop copying r/o data
Message-ID: <j5za2knx6qmv6c7j6tszwpzawu5iugcnbgkfxptfxorm5zkzh4@ih3ylae7fngs>
References: <20251013-iris-sc7280-v3-0-f3bceb77a250@oss.qualcomm.com>
 <20251013-iris-sc7280-v3-3-f3bceb77a250@oss.qualcomm.com>
 <b97c5e01-f1d2-c3c9-8b9a-b5bb9a0c556e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b97c5e01-f1d2-c3c9-8b9a-b5bb9a0c556e@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX11oQ45w8/xRp
 fdU0m2Gd6MZ5dyR+ys0/9+cLdXwcAzqkoVrVppWCtLT7WqYqYf6Kx7pWKrAOInv4nvZHH4hSRoo
 enTwPkSuUjHU1u4SNha4YOqjja1an3hfwlYbj5rmIaVpUEpWttzxF9MrQemvYhFL/5RCjk5hVEb
 zCdOluj23F1XCgwnrkFH+PQS9Hz7igp5GFDfPGD7KxWCy4TH420GRShHdOS3IMZ94m9xtM9aERR
 NQlOogYZu499e0JgBRmjiGA6B8A8XVVSIWfojc/o3vNKyfImZA0P/JAMMw4MX2S61a3RUtc055m
 HXEBhA0Gc0F7UcV5nbpmgxyrzTn+AP5O6tW81ZPT+tBVk6cwBa/17YhuEkkgfX146wyQysIEaxV
 RpJbv3FB60WKk4l0lV2kn0CN9uorww==
X-Proofpoint-ORIG-GUID: gNqU7FfLgQjc3_4yeHTuYZsllzcZwB_g
X-Authority-Analysis: v=2.4 cv=bodBxUai c=1 sm=1 tr=0 ts=68eee73c cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=F1KjMKo46gj8V_haTSgA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: gNqU7FfLgQjc3_4yeHTuYZsllzcZwB_g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-14_05,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110018

On Tue, Oct 14, 2025 at 01:34:59PM +0530, Vikash Garodia wrote:
> 
> On 10/13/2025 7:38 AM, Dmitry Baryshkov wrote:
> > Most of the platform_inst_caps data is read-only. In order to lower the
> > amount of memory consumed by the driver, store the value and the
> > corresponding index in the read-write data and use the rest via the
> > pointer to r/o capability data.
> > 
> > Keep all read-only flags inside platform_inst_fw_cap.flags and transform
> > CAP_FLAG_CLIENT_SET (which is being set per-instance once the client
> > changes any of the controls) into the boolean field inside struct
> > platform_inst_fw_cap_value.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >  drivers/media/platform/qcom/iris/iris_core.h       |   4 +-
> >  drivers/media/platform/qcom/iris/iris_ctrls.c      | 238 ++++++++++-----------
> >  drivers/media/platform/qcom/iris/iris_instance.h   |   3 +-
> >  .../platform/qcom/iris/iris_platform_common.h      |   8 +-
> >  drivers/media/platform/qcom/iris/iris_vdec.c       |   5 +-
> >  drivers/media/platform/qcom/iris/iris_venc.c       |   5 +-
> >  6 files changed, 135 insertions(+), 128 deletions(-)
> > 
> > @@ -312,14 +317,8 @@ void iris_session_init_caps(struct iris_core *core)
> >  		if (!iris_valid_cap_id(cap_id))
> >  			continue;
> >  
> > -		core->inst_fw_caps_dec[cap_id].cap_id = caps[i].cap_id;
> > -		core->inst_fw_caps_dec[cap_id].min = caps[i].min;
> > -		core->inst_fw_caps_dec[cap_id].max = caps[i].max;
> > -		core->inst_fw_caps_dec[cap_id].step_or_mask = caps[i].step_or_mask;
> > +		core->inst_fw_caps_dec[cap_id].idx = i;
> 
> Consider a case when one of the cap is not present for a target, then idx and
> cap_id would not match, and any further usage to map each other would go wrong.
> Please keep idx and cap_id in sync so that driver can use it as key to pull out
> from inst_fw_caps.
> 
> >  		core->inst_fw_caps_dec[cap_id].value = caps[i].value;
> > -		core->inst_fw_caps_dec[cap_id].flags = caps[i].flags;
> > -		core->inst_fw_caps_dec[cap_id].hfi_id = caps[i].hfi_id;
> > -		core->inst_fw_caps_dec[cap_id].set = caps[i].set;
> >  	}
> >  
> >  	caps = core->iris_platform_data->inst_fw_caps_enc;
> > @@ -330,29 +329,23 @@ void iris_session_init_caps(struct iris_core *core)
> >  		if (!iris_valid_cap_id(cap_id))
> >  			continue;
> >  
> > -		core->inst_fw_caps_enc[cap_id].cap_id = caps[i].cap_id;
> > -		core->inst_fw_caps_enc[cap_id].min = caps[i].min;
> > -		core->inst_fw_caps_enc[cap_id].max = caps[i].max;
> > -		core->inst_fw_caps_enc[cap_id].step_or_mask = caps[i].step_or_mask;
> > +		core->inst_fw_caps_enc[cap_id].idx = i;
> 
> The above comment is directly seen on encoder, where the cap_id in platform data
> is not available in serial order for the given SOC.
> 
> For SM8250, the cap_id 3 is not present in the platform data, so when idx 3 is
> used as cap_idx to pick the cap from inst_fw_caps, it returns 0 as the cap_id,
> which is incorrect as it points to first cap in inst_fw_caps. This happens for
> all cases when idx is used for cap_id which is not defined for that SOC.
> 
> [ 1234.157453] iris_session_init_caps: cap_id: 9 idx: 0
> [ 1234.167761] iris_session_init_caps: cap_id: 1 idx: 1
> [ 1234.178240] iris_session_init_caps: cap_id: 2 idx: 2
> 
> ===> cap_id: 3 would have idx:0

I see. And this is the reason why cap_ids starts enumeration from 1:
this way all missing entries have core->inst_fw_caps_*[id].cap_id = 0
and are ignored by the rest of the driver.

I will see what is the best way to handle it in the driver.

> 
> [ 1234.188498] iris_session_init_caps: cap_id: 4 idx: 3
> [ 1234.198734] iris_session_init_caps: cap_id: 5 idx: 4
> [ 1234.208954] iris_session_init_caps: cap_id: 16 idx: 5
> [ 1234.219354] iris_session_init_caps: cap_id: 18 idx: 6
> [ 1234.229735] iris_session_init_caps: cap_id: 20 idx: 7
> 
> >  		core->inst_fw_caps_enc[cap_id].value = caps[i].value;
> > -		core->inst_fw_caps_enc[cap_id].flags = caps[i].flags;
> > -		core->inst_fw_caps_enc[cap_id].hfi_id = caps[i].hfi_id;
> > -		core->inst_fw_caps_enc[cap_id].set = caps[i].set;
> >  	}
> >  }
> >  

-- 
With best wishes
Dmitry

