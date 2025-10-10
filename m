Return-Path: <linux-arm-msm+bounces-76801-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 46DEEBCE16B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Oct 2025 19:30:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id F39F14E46C0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Oct 2025 17:30:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F420420C023;
	Fri, 10 Oct 2025 17:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iLdLx7Xf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8979922157F
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Oct 2025 17:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760117411; cv=none; b=rq/pGaQDxRZ4SShxyW7g359ib6Z++0bYSm4/PyTwIyQAyagvsZEKqqcyqgYa3JngxAVweZ+ayJyBlRLa9/kJ00XFI3VHFLHNOiZVSZd9kdKqL9JsGWv7rZAXh9ybqPoRCHnXU5vCgq7h2J/pv09wSnyX37/J8wXYSFJlMh9YzX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760117411; c=relaxed/simple;
	bh=nWNPqczF/IxgC8AwsNffriAiexgBBMHO9WesC80uOcc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZAWeDzpeONJ2kUKeluXkb5NNGOIzQMUhpYt4vO2DPaYQnGFinD6Q2bpifVyeFai1cY4hXDw9p+DLzEtHu8n6aRRdr11DPCpNRbuAO/7ABxMn/kj1/7Nc/1rBVcr2HDjBz7FOMdKYJXC/U5Ls3lXKPJ0/9aYdrz7H1v4611aAVdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iLdLx7Xf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59AF2foo024731
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Oct 2025 17:30:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ATXrLGPewk+USu4WH2tPmXTpI3iF7n/KZMdGkOVu4WY=; b=iLdLx7Xfko/0GgWa
	hbPzFA1YEUyGGpWqBgTsZYy7efzDlklzJJDrDRQ3e5AI4TCr+7RK8nF3S/IC01wG
	X+tvOzVklpiyOdaLJj1WRX6C2C+2RhOSWdZ2GU0i9I2aR4KhuJwLcD3/HGzPunLc
	1qHNDnxOEuM+vgPZtHh+sj205MMZ65m0r5h0J1BCd61SaSk/0+5KNK8CLb+pbD8C
	ttBfrI5LjG/tva5xb/94+AhEoeFAj+8lkemNN8S3eqtpvcaqVBWYN5in7kCsA8Hy
	KpbWabNKwKJZtcvMOB+qpbBm3iRFyBEKZsj0gl+mnQHuKhC2X0UT91XTp7BD3+HT
	Q6l+yQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4ky7my-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Oct 2025 17:30:09 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-5d5e5b2df67so371547137.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Oct 2025 10:30:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760117408; x=1760722208;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ATXrLGPewk+USu4WH2tPmXTpI3iF7n/KZMdGkOVu4WY=;
        b=rgU5MEXP3u5S3Vn+02ZLN+eGXcdyc+yoYF+zjIQZCAELIZENtR6+OOnRzReBQG9KKM
         YmYt5Dtp6LuouKZx55rCptxfLluWB+O27UG+colwMZ1QncdNv/EShKyQVc1dTtz13D0/
         nR6fOufsiPNBHkIVBcqNQ/fV6FGv3JckcDNagKGLiVJcLFtgbpEH3Lo1bdYCFGzvafJ4
         rMEqs07mt2ZH9Mhs0LjQSXSkTnJHhI5dekQTsH5lc/sHWjlarYjtjXgPJXiXBOdd3yN2
         0bTWkzVm3reBtECPpJSTDhABGDEYhLMxWSzo4gFLpPHYS4n3ZN1PIcDGtGwRX7u+c9xO
         nn+A==
X-Gm-Message-State: AOJu0YxniR9el/tH67uZ3+wXTNCoX5ugcR09CN0DHVOfzQP9x3amE7f1
	Mw3ChNnD95KfAwLzGrpe8xv7dNqV1xl8KffbtLK+XQm8gYmo6UPD8l3zQo9e6Hkr7sTdVAdJ/uR
	ZikQqxZx9i6GPeb+oF9MjM7ndBSx2ySnRLLRUbKsBN0VaXtHtPEbilHPlBsk0EhE9MLPA
X-Gm-Gg: ASbGnctmwpmuw+PheWIqmPW3CqanpZ0p7P72+3IS3W+X+bLglMqTP8qynIYcUD7oIvd
	9ZiqJFO+Prxlr+tR5+ywgrgg/FWzKGClHMFV/IeL728uCGvp9tLPKEdGzW5ge341QAVMQHIHQnZ
	qNjXCiYv/qfChwzizwLb1rlG7VIsnnCdx+XjNdfBQDO+EQJKFR/sraE3mDNzdNXW5Md3DfSuxYT
	Uf87zmmW0v8Rus97oiNM7P1anf0MvwNvwpRyMj/mfW8Tx62A6vIGMrfUCt2U+1+vUrEojWV2hV+
	UNDbBhy85BFJLbktaQzPGvaUBvRFbUDeRmzXOXQ4kvNZ6Zy9Tlb9vNwdy2m0gd9fGq/WVKXPxlh
	/qVH40oJEr/OFZwM7dlJMTw==
X-Received: by 2002:a05:6122:e0cf:b0:554:b341:2764 with SMTP id 71dfb90a1353d-554b890a550mr1451430e0c.0.1760117408374;
        Fri, 10 Oct 2025 10:30:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEHD0hhK6b4JamkLYHPshkWQ8JHKI3MVUIkzRHAZmhbAXRpyPdpO2PcbsweVGgxi06rXqhX5g==
X-Received: by 2002:a05:6122:e0cf:b0:554:b341:2764 with SMTP id 71dfb90a1353d-554b890a550mr1451416e0c.0.1760117407888;
        Fri, 10 Oct 2025 10:30:07 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63a5c321341sm2786754a12.38.2025.10.10.10.30.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Oct 2025 10:30:06 -0700 (PDT)
Message-ID: <eb15cf16-f51a-4eb9-992f-158e2510184e@oss.qualcomm.com>
Date: Fri, 10 Oct 2025 19:30:04 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/msm: make sure last_fence is always updated
To: Anna Maniscalco <anna.maniscalco2000@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Antonino Maniscalco <antomani103@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20251010-close_fence_wait_fix-v2-1-adb332dbff65@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251010-close_fence_wait_fix-v2-1-adb332dbff65@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX8dqALbtVorJL
 //NB6kRCCzU8HxujzroVLvLQVwCsuZj03u2pLJhaYHHG+4aqB8C3zzNJzdzdrw08QtAhf9y48F3
 dPImIo8IeI9BIfcuC9HGGVzzRlQHHu2IMBZlflTHKVVhELUTRPlW5jp/GbQxHSGzZ08Az6LQPRu
 J3pCa9aQxJSC22gyErBYnvxPl77qC3EdQKuOWNdjueF9t5GjEH4RuyKE4G0pLJjOINLM5wEgZKZ
 0O8OAj+tqNe3ekOV2cLnPgbSbSJjdxAKk8SIoeIZqCIb/cR8VfolRzqtJaMdzK0rgxcRtD4zbnb
 wEIJIH9qYfz6qJenSQHkqnwtvUxTX5WH3ln4/BiD79c8K41fCUed1w7hjGrOIqZsEr0kcsJ094Z
 bs0DJxeeMog1ZXaZ2dNQziNLY/7P+Q==
X-Proofpoint-GUID: lPs-aaRYL7x6uJHgRV0m9fITV-JB2THj
X-Proofpoint-ORIG-GUID: lPs-aaRYL7x6uJHgRV0m9fITV-JB2THj
X-Authority-Analysis: v=2.4 cv=SJxPlevH c=1 sm=1 tr=0 ts=68e942a1 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=pGLkceISAAAA:8 a=XV8jktkr_dr238JMAFQA:9
 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-10_04,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 impostorscore=0 spamscore=0 phishscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121

On 10/10/25 4:39 PM, Anna Maniscalco wrote:
> Update last_fence in the vm-bind path instead of kernel managed path.
> 
> last_fence is used to wait for work to finish in vm_bind contexts but not
> used for kernel managed contexts.
> 
> This fixes a bug where last_fence is not waited on context close leading
> to faults as resources are freed while in use.
> 
> Fixes: 92395af63a99 ("drm/msm: Add VM_BIND submitqueue")
> ---
> Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>

Your sign-off will be removed by git, as it appears below the '---' line

Konrad

