Return-Path: <linux-arm-msm+bounces-49857-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B844FA49AE5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Feb 2025 14:46:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 977621883AE4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Feb 2025 13:46:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A362266F01;
	Fri, 28 Feb 2025 13:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WG9WXvGH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F09AE21CC78
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Feb 2025 13:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740750382; cv=none; b=iARv8h/6ckGtGYQpPUWtc+jmtePxNVNI5O9uZICNA/EElIXilAcpI3mu2zPxukBoSCDpu90mpsogyN9oF6EvrpVlMLseLQK0U/qRmIzjChdnlQS6jQCFTNunIS1mnQajmWpvQaSLXnxj26PW1LJrd1OJos/WvP8q7A5mKXKpZSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740750382; c=relaxed/simple;
	bh=QgqPUh7e3P4mc0BkdQLn17sZPbkFFdNZs/qPJ0pdcVY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B79X60wgUx5dmmsOzQTNaSo/ppa1XuC9sDAZEV0idwf2iRjfo12vrPpOV5arH0URj9swpCNN+FeZPDug7j6TGDgFcG4Coqq8Ea0yTfdnqcXIfZmNKv9mWUT/VH+qC5X2Vq1XokopW0bQCay4J6ShXCtkXJmA60efvS3f5+hO9cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WG9WXvGH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51SAXIVa022173
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Feb 2025 13:46:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r95R7tzUmkOZqqPt8d9Jdn6qMh6aJzeR3kWmNTHBidI=; b=WG9WXvGHGcttu2js
	DCuqRGAjOgoNRrEHXkchcTJaHmlv5baHp+U+jGwVVve2pYqKca5aR+7K0nYL7fW5
	b0r3XIcLImfHYoqR9uevUu61nzalX4fdXYLQoT+0IUgs6lCLEEanOGJdWNxcWHjK
	dM1sCwYKjdn+8oIQf8TgQEjxfUznmUwY6eL7LdkopGYUzAbTBv7CXJJDEVJhBhm5
	bungXysf8QqBiHN8ER9EdY3EbKF8fzc01ayBdrUxPPIVjqw4Wa3SG0ekkiqyE0Ms
	XFWwkhvqVlLpY3H7EzsrUZ96Qsmb6o798Rowot+EUOG377r/h2HGAWarXsimaoIM
	8zR2gA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 451pu9hn3h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Feb 2025 13:46:20 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6e4546f8c47so5447416d6.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Feb 2025 05:46:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740750378; x=1741355178;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r95R7tzUmkOZqqPt8d9Jdn6qMh6aJzeR3kWmNTHBidI=;
        b=Xvf5YUIg7lUoeTPdBhQMqdrAT5lAS0EOZJ2dAAd0JQOxKE4Y2WSFF+bNESS52WA7yZ
         q4tK+Tqt/IO1e75CME4a8jxI1fLG4JcIyP9pR4T/du0HAftlFqzivegw5hBEG0lJPwzV
         oT4F7t1a6QLIo8P7AK1ujRbhW7DxdxkiYj5PkXVcns9k23PohMzywG+DXFU7UuMsBW6c
         luIqvNEfLJi3L6EVKlv7VHl1apSzYuTuaF5qQiDuKcpUyQcPySQwGDriGQQJsQ5W9lPs
         QKdWdPKPQQNhX5xMwaWbTrLnxgNRSODpe2hxa3Z52FVPmvHL6O6vDZ2TWhKgluUO8nbR
         /umw==
X-Gm-Message-State: AOJu0YwwmDBTMvauc7d5ah0oH8GLyYzUcMbLCWHmv4kMT6vtxuju3LMG
	ClP7QXxRIDRn81U41OgKNiTna8xp2Vaajl8GFdY0+rbAalHNvDeFOdqNRF139+cyukbfuJCIICR
	b87JqSSNmCAFtMlIPxaQUVM2ZZMmIlr0OGM7lpRNGq0NqDUb/nC9DqeSA0tYsV92u
X-Gm-Gg: ASbGncv1YT1kksPAkndjh4Q8wjAPYbFGe20lIRno7EH7LJBk00kHCG44qVmgwC+Nv4X
	jFkaL11ZXPVOdc1trJ6U/MX0EoohZZIhtjSPu1ms2Kd1oXd5EABRqsx7KgG39HR5ubYoS3PHV2d
	pyqLfrvi6yTAL1yKs759DbZ9iC69KJcbOQ4dHUOsUPAWLjk+Y+lL9t+KubYYZMLX9soC3pEWKJj
	UAP6cy5Q+lJNefEjgsuv8KuzHLPq7zTqB2Qu6ZoXIiSM0Epa43CBV/t1scxvGmPzRlyLiUr3C0z
	jU3U+VLZPL/+Tc7lxOZV18FBtvd++CitHkxcOogqyy/8U35ot7/w7h85WhLiPMukRjCESw==
X-Received: by 2002:a05:6214:2aad:b0:6e8:9ed4:140c with SMTP id 6a1803df08f44-6e8a0d6de81mr17037116d6.7.1740750378602;
        Fri, 28 Feb 2025 05:46:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEWmbVtyz5v9qdeTk2Q60/snetUXxtadcfnzHCU2jryscortfPes5qhPNB3YWzaAGxONm8dXQ==
X-Received: by 2002:a05:6214:2aad:b0:6e8:9ed4:140c with SMTP id 6a1803df08f44-6e8a0d6de81mr17037006d6.7.1740750378268;
        Fri, 28 Feb 2025 05:46:18 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e4c43a4e26sm2502065a12.66.2025.02.28.05.46.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Feb 2025 05:46:17 -0800 (PST)
Message-ID: <9208e80e-b7cd-4e7f-86f6-1de264c13e6b@oss.qualcomm.com>
Date: Fri, 28 Feb 2025 14:46:15 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] drm/msm/dpu: remove DSC feature bit for PINGPONG on
 MSM8937
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250228-dpu-fix-catalog-v1-0-b05d22fbc2b4@linaro.org>
 <20250228-dpu-fix-catalog-v1-1-b05d22fbc2b4@linaro.org>
 <50cf6659-ae08-45a7-869a-2300f4d037da@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <50cf6659-ae08-45a7-869a-2300f4d037da@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: IRFrVs7VjM2SlrMMh_bBVm98GSSTpMUU
X-Proofpoint-ORIG-GUID: IRFrVs7VjM2SlrMMh_bBVm98GSSTpMUU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-28_03,2025-02-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 adultscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0
 bulkscore=0 mlxlogscore=933 malwarescore=0 suspectscore=0 clxscore=1015
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502280100

On 28.02.2025 2:43 PM, Konrad Dybcio wrote:
> On 28.02.2025 3:40 AM, Dmitry Baryshkov wrote:
>> The MSM8937 platform doesn't have DSC blocks nor does have it DSC
>> registers in the PINGPONG block. Drop the DPU_PINGPONG_DSC feature bit
>> from the PINGPONG's feature mask and, as it is the only remaining bit,
>> drop the .features assignment completely.
>>
>> Fixes: c079680bb0fa ("drm/msm/dpu: Add support for MSM8937")
>> Reported-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
> 
> With the commit message fixed:

I like to copy-paste too.. this one needs no fixing

Konrad

