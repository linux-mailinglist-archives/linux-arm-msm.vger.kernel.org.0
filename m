Return-Path: <linux-arm-msm+bounces-49854-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AA20A49ACE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Feb 2025 14:43:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BBE2C189871D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Feb 2025 13:43:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E492E26B2B5;
	Fri, 28 Feb 2025 13:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Jc8yrn4g"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C7F826BDBB
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Feb 2025 13:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740750203; cv=none; b=j41oh+MXgYzLLSCEc5lmib+EhcqBJrKC0s0XGn9RvCIAhIevMLLuOKlcciSt7g1Qak94NkLhHoVN3FOYnVtSqD0yaWxNMAMa8pcp2HZLXnSxjp4OVVNWd4csw3Kxi/38dO+mQjQL4OEIDBUGz2ffvDUIM+2l6EmUv17mPecG7IM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740750203; c=relaxed/simple;
	bh=kdCzsJnxrvZDUpLBfmlo2ylZJm+1Scc5/iJi6oPwejE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hidIkZwI8wSa66uX34qTggFGP3/tiSZbliLtIxHFRtwlLSsBN8JpVPQIejWKbDVq5P0LZ7BokR2/jbhKTWqpMArpbWCXg9WRA2GBZBNc+S5hq6DZmx0pDJseYRrzhp3AE7Yu+lZxx0NCvF2zHEV44V/5WzbZ1BL6czjhoTcD61Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Jc8yrn4g; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51SAXLx5011785
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Feb 2025 13:43:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X8ScGz40JRccpFkf1d+tHM1VpGzuLrp85WFCzzDHaHs=; b=Jc8yrn4g7Mrf1wB6
	ErFhcikirR7ykGAIThDbwgB8j9wqXUUNSukiiucnpQsFWtEguATofNQ490ZWNvak
	w9GpIMhD+dMP2jVXGitR5Ej8uPcOPjZ5kUkcGo46LO0d0Ht5oHSsIEB/3AJDnPER
	CijrCykE0kbtRWWCSysuMMFBgUJGhmT0EvbMXeOlACbh7ElRSiqp5m2uSnKqHVZ6
	eg33pswtF7QyOUVEJUsfVrchYSFT1ve8K8USh+2SuQKWLreD5GG3VpW5IdFWjRn7
	uxzO5wTvPRhZ+a4JgvCny9JcJzSD7JBHp/g+NdRfs2WPA+1SYfW/291OUnFhhmHb
	K6HvbQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4522skykgf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Feb 2025 13:43:21 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6e422f1ceadso4802536d6.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Feb 2025 05:43:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740750200; x=1741355000;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X8ScGz40JRccpFkf1d+tHM1VpGzuLrp85WFCzzDHaHs=;
        b=jsnfZ6OpnpZk3sAXZpCYta2LNqV6jqdpl6xGIACitij58ml5yg/smmqO2E9yzt4Kw4
         nN4fvatVS+nsspKoMir64TAND1IsbSOSCiUUAZszsxbkyNh3BIJWVfInXnRX84lbThre
         jwAdXVlqXZc4nf566pTsEE/WJhxqcdFnsEyEYld3REWqFNh1ixINMR1X+U1/TtUYK0b2
         74+cAGM8sj0AdxssSBniz8xVbTu82t49B2JCwEXqd372Jc3ZGvxj4ZSyiMPdyOh98rF9
         haSuegPe8cokX6AyMo5wNYxBVaidPmI0z+T4gEPuNflLLPIozgNJl991hPbb8qFrFD7s
         5LxA==
X-Gm-Message-State: AOJu0Ywwmci8D+kcEOk0t1j1cCNKuzHb3CzbC4xws/Fmd4L8r9/++SrL
	eEWwLM9At1XEHQGf7yGSDhcGag8ePPDWX9hYv3qI0aZ/tSdgeitbMMV0tMlM8sWxa4y4n1rmqix
	zZVUlPwp1AAtdrL8mgCSp9wtqHtzhQAGqKym1vUZ+LEHzmRmlgIEnx7iHshwHgos8UrE/bk2n
X-Gm-Gg: ASbGncumxZdwowvcD8/1L3SjjwB9tFrSDmEMxZYXuHWtLXR3FQFs4GjHeDODpgDf33q
	Pux1A70BY8HAk0klyhgcL4svMHOJtzVfgoECgjaiOZfb6Mczfe2xks3kwBDiuRkhpHQbusdZdEx
	cVkchm/2wbMdCsDNiFm9YC0ZH9fdXFp+VKyYQ6Lc0/aiOehq5cKGIW/wcBfcMztL6Aiz4iHFYGF
	kPZEG/jLqAXBxB0U6qbp1vcgddA0AfFcrPe3zhlhWF1xz6QRFk6GZl03XCT+Uzx8r4Pi5l8YqIH
	B83isfk1OTl14UZYjnKwm63R+1RmsksTxdzUS74/UpZKPmlecrEtVoNkxF6/oMesQgoUnw==
X-Received: by 2002:ad4:5f87:0:b0:6e4:29f8:1e9e with SMTP id 6a1803df08f44-6e8a0acb028mr19315546d6.0.1740750200119;
        Fri, 28 Feb 2025 05:43:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE2BhTFPrGcsBUD3d+js2LSjbjIbSoqrswvT4KyTm/vYvLllJTBt7l/wIo7yhlMbwFAi0+lCQ==
X-Received: by 2002:ad4:5f87:0:b0:6e4:29f8:1e9e with SMTP id 6a1803df08f44-6e8a0acb028mr19315376d6.0.1740750199768;
        Fri, 28 Feb 2025 05:43:19 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf0c0bab1bsm289935166b.28.2025.02.28.05.43.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Feb 2025 05:43:19 -0800 (PST)
Message-ID: <98a9bedb-cdf9-4865-a089-85a2f411bbd9@oss.qualcomm.com>
Date: Fri, 28 Feb 2025 14:43:17 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] drm/msm/dpu: remove DSC feature bit for PINGPONG on
 MSM8917
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250228-dpu-fix-catalog-v1-0-b05d22fbc2b4@linaro.org>
 <20250228-dpu-fix-catalog-v1-2-b05d22fbc2b4@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250228-dpu-fix-catalog-v1-2-b05d22fbc2b4@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ypQjAdz6KMUFVnRKLShhuDKLr0dgMBGY
X-Proofpoint-ORIG-GUID: ypQjAdz6KMUFVnRKLShhuDKLr0dgMBGY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-28_03,2025-02-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 clxscore=1015
 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 mlxscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 mlxlogscore=974
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2502280100

On 28.02.2025 3:40 AM, Dmitry Baryshkov wrote:
> The MSM8937 platform doesn't have DSC blocks nor does have it DSC
> registers in the PINGPONG block. Drop the DPU_PINGPONG_DSC feature bit
> from the PINGPONG's feature mask and, as it is the only remaining bit,
> drop the .features assignment completely.
> 
> Fixes: 62af6e1cb596 ("drm/msm/dpu: Add support for MSM8917")
> Reported-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

With the commit message fixed:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

