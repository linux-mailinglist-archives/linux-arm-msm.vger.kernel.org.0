Return-Path: <linux-arm-msm+bounces-62488-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0189AAE86FA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 16:47:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 90FCB3B9DB1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 14:47:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3538C30748C;
	Wed, 25 Jun 2025 14:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RHdwm23u"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABEEB1B0F23
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 14:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750862869; cv=none; b=au8zLLGCh93tsk24UXuXfh3q94+yZagcpaJfqNrKCRmm+kE8nnwjSzwlyuMnJ21BB/inh1u7aYz1E6VRphK5O6HXcalxhp4lL7PHFJ5pEaVgfstZi/UI3LLMRIBaQDcRXLYmisoJqclDzQHNu2ze7HNdS+PdVWqacLbpiw9y6mY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750862869; c=relaxed/simple;
	bh=mmpag1FbNtHN+Bk5VdCMHKabZ5lvXBEoUFhGpfCLplU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=risYgVj1otXS18aWfvnGjZBCMBPJ0wryBreg1jRTRb5OKQxsx3cuWTo3NoWpl6B+xu/kWePp2YZqPPimYdw52cDsZNzeIo7E4Pq5lJlVYrf5SA03IwE2lO1jGvHI5EDp1oPztqT7mGU9ssePDOkXMYtPDAOkHKrPYT0xoZyHPD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RHdwm23u; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55P7LxUE017387
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 14:47:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EcfGyCqb7hjrTcZliws6C0nYMOKKPOQx90DJmTrhTcU=; b=RHdwm23unkMPokt3
	IsQNHHqAb0TuCOKdL4wJgRowGkwH3UpB1tJbWHAjaFMAHx59TsIfq5ZaXVhtjDaa
	qvJYB+o+biMF/XMAfaXv2nFAR0en2YKLJ14UXqFpy0noa5ZZgOl9A32FE2JsFuns
	hBx1oEBhB/7xyvMDylb0h47NoVnZ1t3gtMs554A/Hr2k4Xy6MMJsIkRKbNVAalBv
	R9Rtu+i7VrQw7vf3tcjM43AAHvMhqoos662z0Pi2bMM06WK0deadMn+sPlfjhyux
	s74qFEK0zQO3COkt64x8Cn1ZVFlcXzhKbltIZc41cOcKWtLnhhFewJRm6e2ITIDx
	OlmZMA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f3bgg9tn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 14:47:46 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6fb030f541bso4166d6.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 07:47:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750862866; x=1751467666;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EcfGyCqb7hjrTcZliws6C0nYMOKKPOQx90DJmTrhTcU=;
        b=NYGe1fjIFV0plfWuf9+vbbMY3kjvPis8mT0xDgFg6V6aDYWuW26Tsz3UQ06qF8a13d
         RaIhWrCZLk/XLlc3DqI3kh6WiRGC+TiCdLQCcQw0Mw+HYiXQC6PgUGYvW04TeuSURucK
         dO3RyDHVjXRjNWR3Iu9U3ueZKHYFXchLGlTYIGMBS38BQL5QyngV4Ai+Dh0tSI5znjg+
         hTkZ92jRrZB5MJ6rPoohEVh5qzCfqJrDqLAepZJk304LCXsl+R1ZADKDngMJaCDMOHg4
         3mF97RYwFvvQS45vk4+z+NbmX3Zz8LnbUC2qX/f2vPrIlqa+tO/Nz9gCdOW3hz93u5A9
         NhXg==
X-Gm-Message-State: AOJu0YzmWx0PQW04eQnA+F49QAy3SO4PVmG2nlBwI9VIZ29UFvgDr03V
	aZzgb9iM5eO2xU6btUcoObI8oywffOV0yU0k6370C++wMZPIfn0vUUrsE5IiB3Mb56FnBdqT1UI
	sEvjxYc9jHluIWCc5o5iGvcsbZ+S8VgWYLNTK3z1Uumsodg242TJZlxt0ggm9FkYeJIZd
X-Gm-Gg: ASbGncvvFbMlBV4tA9qJIc2BUXbWheFEV0D4BjPyPqvO9zNOo4ynaTcDykjQH21ai/c
	Ru2QZ2QRbdXi4GvsXhfUEJPJwOijQ3n59p/qjMcqUw24oo9XhepTQ16aFAQZdfXcBY7uvDtCfBC
	mn2p1ExJD9qivS7jA1fXje57NowAmSSySuTPse4HAtrC46NxLPMrFTLaeu0umYjpKqLY1lVmNqa
	r4XyWIClxx+giMYmnw9h7mnhQY1wMO6vA74B8nP41l4SEC9GpdwkcDfn5KwZTNSZEQf6p/YkGrb
	+mfn8xlzl5K5zT8OSiod2AW2yzqFfn2piBcezhypn+tw1fyP0SWu113c3GBys/4iuFClCvivo5Q
	gnAc=
X-Received: by 2002:a05:620a:2850:b0:7d3:c688:a590 with SMTP id af79cd13be357-7d4296e98bbmr135911385a.4.1750862865761;
        Wed, 25 Jun 2025 07:47:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEDhn5CUWwlD3br5LtGscA9kGzCuOj+kmUtFraZgnYTOTbZBN0x0uR8zb+m54XpY8QdAku4rw==
X-Received: by 2002:a05:620a:2850:b0:7d3:c688:a590 with SMTP id af79cd13be357-7d4296e98bbmr135910385a.4.1750862865288;
        Wed, 25 Jun 2025 07:47:45 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c52922662sm856497a12.33.2025.06.25.07.47.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jun 2025 07:47:44 -0700 (PDT)
Message-ID: <efbe6c4d-cbf2-4749-8a3f-a69b2e4b726c@oss.qualcomm.com>
Date: Wed, 25 Jun 2025 16:47:42 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] firmware: qcom: scm: initialize tzmem before marking
 SCM as available
To: Bartosz Golaszewski <brgl@bgdev.pl>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20250625-qcom-scm-race-v1-0-45601e1f248b@linaro.org>
 <20250625-qcom-scm-race-v1-3-45601e1f248b@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250625-qcom-scm-race-v1-3-45601e1f248b@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: CCBM_wsNQ9q5isl6ANt8DQTJ2x8m3jZe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDEwNyBTYWx0ZWRfX/gNNyqpES7eT
 PjbDeE66VobFuCazLKhr+f3YJpdvkcWAX1sCA9iqVP/Px5FgwxgKGZadNLm/is3SibnAxaJRL6+
 z0cNnEtr/QgEZkVQRYf4bN41uDz933+BNK8r9SzhAyJvy0/3cXf2bHdpJs5LARQQADMGrHqKy+u
 j+gqx7I9x6rJN4F9fK47EDpZ4g0DP2nYLtyGVIbu0/IdmCBGh21exR9ffnlYUQWaOXHvqKqQv+k
 EsQ1Kp16QQa31Jeleb0+xdyGLLZYwqhMNGEEZjnZBeQrtv9ufwVFv1yXKM3LiFamLfYkOwjzun5
 /RB5DKmlfWLI1MHsG1pfkJFbUxNs95VZox5xGhO+9Ovsxv7GIjwY80pBxRxwLJFOyy/SzxOeFiW
 GhilRoorTwZmlXMFHj/C9O2GUtXpdfXqqDvUplJ4fg8NLkmTqBm+G7HEKHzzCvJ13ThNzlAb
X-Authority-Analysis: v=2.4 cv=L4kdQ/T8 c=1 sm=1 tr=0 ts=685c0c12 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=KKAkSRfTAAAA:8 a=A4gc5PxaQYkLfIBl00IA:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: CCBM_wsNQ9q5isl6ANt8DQTJ2x8m3jZe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_04,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 bulkscore=0 clxscore=1015 suspectscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 phishscore=0 mlxlogscore=762 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506250107

On 6/25/25 10:14 AM, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Now that qcom_scm_shm_bridge_enable() uses the struct device passed to
> it as argument to make the QCOM_SCM_MP_SHM_BRIDGE_ENABLE SCM call, we
> can move the TZMem initialization before the assignment of the __scm
> pointer in the SCM driver (which marks SCM as ready to users) thus
> fixing the potential race between consumer calls and the memory pool
> initialization.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---

I'm not sure any user of tzmem ever checks qcom_scm_is_available()

(or is it orthogonal to this problem?)

Konrad

