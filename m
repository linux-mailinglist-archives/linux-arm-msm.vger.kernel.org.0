Return-Path: <linux-arm-msm+bounces-68271-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 92732B2028C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 11:03:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7AEC918C0402
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 09:03:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09C0D1684AC;
	Mon, 11 Aug 2025 09:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FfYtt73T"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ADF72DCC11
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 09:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754902973; cv=none; b=PHBAHsgrGiKz7wj4LO9yyrtcKBHaLoclYm73YIrUeqtk1XMzBTGTEW93JluuuWtOKe2IvP4LCYwYOFmxJpUmCay/eNdfAr+pFdN5lcis+585oV/KiC1r287V0PZ6CES9HEZMBBA3BvOVXt8tU6+X94BFhL1pWGL6cCKrVjz+quk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754902973; c=relaxed/simple;
	bh=tdgwIQdJG+orKkZyHmIqAu1docbT/zmwkliWXBBtmGE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MuCSfNEd1oRTPIqjCjP8K7ioYVoqT3hfWi97TVkDsCGsciJ9Twr9xF8Susozqp1pRA6p4W/NkEmUA9oo3JXyy0Sw2OP4QllC2mu4SUnWhzLM9/6HNNzhLecNUnRvLcSPDhhQfcS96//OanogXr8ZAu/Bg4Cq7djacfVergJhLKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FfYtt73T; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57ANpGZb001291
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 09:02:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tdgwIQdJG+orKkZyHmIqAu1docbT/zmwkliWXBBtmGE=; b=FfYtt73TZBF5+9/z
	qDBn8YF/XFOCvLK8+/qPa/2rX2ieN8UifIMXB6c0XGgtZc1uOHxrG9sMzXaVOTMW
	ODfXLj1cqgiE94V7Sea1ZRVhXpTDS/YT6vK+Yvf9qP58EoLphFNO4V/PM5YrTbWf
	FafAbgxCz2Qt8Yw7MP+UTHtXhHT+jMd/ERgqL2Zs9FTpY1iCxL63eu3dJfUX9Lvn
	ZNby5h2tNk1xx+IBNHTohCpm3kk82W7QcvKl6CL1SXR2Ar9b2D8DTx7Dlc4J1rRz
	koCBHRw1vEqu+UufFE7wk4xUFFporON534+10M3shJ38oZofnfetpOYD09MFP//G
	+w1TSw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dv1fkxkt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 09:02:51 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4af1219f29bso3625541cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 02:02:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754902970; x=1755507770;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tdgwIQdJG+orKkZyHmIqAu1docbT/zmwkliWXBBtmGE=;
        b=RnJR7pxEADW2jh051MRkGY2mqjgN3Kid7A0Z1s9i7hWpsugMPwFts6D8Ias+o4Eh9V
         KeBRY/KSYYWGzY3OA8o8b/iRrTjiJoVaVpEIdCHP8GZczhhMp4a3BfkITjIcw5Bn0vbc
         hgXLOZ3ZMxKJiKw1cFvXwLr286U14Dspqnxg1eixnERjmrow2tsy02Ebgv7Q9EGNqRsQ
         LXioclmehrLzC5BX1tVaCoZzWsYE2w2lFrGjHplvmwIJRRj+z3SDKOsnqXGCTSLL4uu/
         lZGHVGlDVFcf2UHjfhAodlE12AJy7ABZpJR0fVZ4wUr8Dw16807ip1yiRzGkg/hrQ30o
         Z/eA==
X-Forwarded-Encrypted: i=1; AJvYcCVY81fmscj87vx7JNCQ5V/BLHIbWYgTy+MSv+tQLsU91bJXnkY4GSihRoUHa+uTFw14lrktCaBhP1O55ghF@vger.kernel.org
X-Gm-Message-State: AOJu0YyxYrGyDvLLOoOIQLpN++iGn3ydX3pLYyvGrUOs++BYI7MSdkf+
	1OK+SzzG40mLdxTmHvjy2nHjdtnbEdsy0OnJprC0nDl+426B56YxQQUiSeYSABBNm/Vck+43MP4
	unX+JEeJOdYPFHNgJpg6kS5KNSEQobccyqYvILyUU09n9z/XW0AYSxYfTTPv0USdctnmx
X-Gm-Gg: ASbGncsZ3T5dc2B9YaseZyf1PhVyjHLaB6v0yVZzwfS5K4F6OFQpPx3TtSdqgqD3NGV
	1ARtJaLoJHBi9XfARlpYP7z/hrV16qpoDQbS+7CGy1O3YiEKyzKQ4Dwy4XyhQTwnLekZ2DfK+b/
	PNNxk2j7dMGxJW8ykxgGJ1ePSPN+ek+oT5qS6i94rvmUKVfoksk7BwadjGmPWlVd32377iQq+kF
	nxZmadNa8+ZB4tRynldIaJxD4veHakJU5wPGEuw2Fi9B8eFxztzKsnogv8t1xJEFN9ozEk/b/zx
	nBfpTzm4+CgqJ9d95TRoEG3fKBmoDG7ZxTuo08HkdE6U38LOqXISHMkIz7P5F0p5L41nQyQQm2G
	WfQqpR1/y/UPql9L3/Q==
X-Received: by 2002:ac8:5d51:0:b0:4a9:9695:64c0 with SMTP id d75a77b69052e-4b0c1b28bf5mr48920891cf.8.1754902970265;
        Mon, 11 Aug 2025 02:02:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH5TWRviyLEMQPzvh4QVbqH5jPy1ZuqxzZtRDTRJ9JxfjUgmBuPx6tAaaAYzS0THJjvJINbNA==
X-Received: by 2002:ac8:5d51:0:b0:4a9:9695:64c0 with SMTP id d75a77b69052e-4b0c1b28bf5mr48920671cf.8.1754902969784;
        Mon, 11 Aug 2025 02:02:49 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a21c0afsm1977783566b.117.2025.08.11.02.02.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Aug 2025 02:02:49 -0700 (PDT)
Message-ID: <d00689fb-8074-48df-ae95-bcdf5e756111@oss.qualcomm.com>
Date: Mon, 11 Aug 2025 11:02:46 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/7] drm/msm/dsi/phy: convert from clk round_rate() to
 determine_rate()
To: Brian Masney <bmasney@redhat.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maxime Ripard <mripard@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
References: <20250810-drm-msm-phy-clk-round-rate-v2-0-0fd1f7979c83@redhat.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250810-drm-msm-phy-clk-round-rate-v2-0-0fd1f7979c83@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: VNDGqTNfD9Ogrv5EKeXgs06oC6MPEP8l
X-Authority-Analysis: v=2.4 cv=cLTgskeN c=1 sm=1 tr=0 ts=6899b1bb cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=aS93HcZ8ji4XsMPHnqgA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAwMyBTYWx0ZWRfX0LPGoO0gsCv4
 C6fVTrJSQgIAH4j2AHI19Q28fVZ0ieikhZ5FVSrYMLi4I3F7mUKMuR2VBxhbiushB4vpEN1XOPt
 Jqp/87der2Ku6MHeVlkBy1JVTQVENiLCpAS3tonEIhlfKsC8t70sEdsp2o99H6nW3GAgrjIA6hX
 eRbSzYwDdPR3RwiHWg5pN/7PIeROoqoNPI/L3anGOMyWJCv/An1MGYuUKtoay/a3+CP4iOLBn6Q
 yxp/kJI4Wr/dbHxzIyfEVsLeQ2qdW+/cu4qr7GRsIPqUaoqsoed4W0L3s50nykJnwSIqRZYDWPE
 aESvz9Q7k7jitnONHCDCdT4YhHspXBTZjwQ5il40ULFU1AAU898jPVHzWYjNn9hKDxT2ve0+a6x
 thtG90X9
X-Proofpoint-ORIG-GUID: VNDGqTNfD9Ogrv5EKeXgs06oC6MPEP8l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-11_01,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090003

On 8/11/25 12:57 AM, Brian Masney wrote:
> The round_rate() clk ops is deprecated in the clk framework in favor
> of the determine_rate() clk ops, so let's go ahead and convert the
> drivers in the drm/msm/dsi/phy subsystem using the Coccinelle semantic
> patch posted below. I did a few minor cosmetic cleanups of the code in a
> few cases.


Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

