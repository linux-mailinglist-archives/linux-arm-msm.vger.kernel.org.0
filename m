Return-Path: <linux-arm-msm+bounces-66221-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 26828B0EF7A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 12:12:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 690773AD40F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 10:11:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E370D28C2A2;
	Wed, 23 Jul 2025 10:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cVibFs78"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04AC228C2A3
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 10:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753265460; cv=none; b=ANYLcJfTNxhnC8CRLbor5a9Ir5i0ZSI5PZCuFt8Uh01prRPs4sKLEY5DYosx+SAkbdKNImhNMS+tFu4rP5LiEY9r/RqDSxdtQGz2iUzk59GJs23Qw9tKbwJeN8fesGKCY9os6FpnTfOAjoiuyJdJeJa/8bs9N1jk++V2OHzaVoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753265460; c=relaxed/simple;
	bh=0I2Q5xccO1ZD2zdNQobm3Vr8rIsXJKO9K7RJSS44oig=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DmiHzbnPIXSZlyV8AbnKLl9aJ5bKgY69Wy3ORT6VEVXA+jIwgk/PScValwrkiFY/TvAA95PvfMWXJiEnpapQna2G/tzmYMYWKYN4wCs7oCiAQFKeRq8VnaPfPn2jou+a8hVM7L+cD6C1FGGCSgrKk04/q61IOQoIThzXMvpQOHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cVibFs78; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56N9OO5h016083
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 10:10:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	367qI0nz7D+7h4lGNKFfyYMcgYPJRnaZzBeo2TflJFQ=; b=cVibFs78mpAbpqKm
	uF8czhr8zLx2t4Qe27UCNjJL81V0q2OYEG1FpSQWB/bKdWqDmB4M+AE1OgetC+wv
	JHsywSzGtQ/T+n47iZ1WLol0PVw9buC1KizXkkhhJ/QqHcqaXT/VRZmcVvYG/qPM
	Qf4/jw4miQeR5x7PrdId5DJgJ2WkVr/MgKaqKmvTQMoHBdGMzYI2NRbwxn566b66
	Gb56vuMXwJUOp39PMt/ep/xobhf3JTnjOywpHv6WSYl8kKFgoKeSjGisTfhOOxAv
	93kUO9oH4QWUlgBODKksBeK0tTXDMmUWqStrGJiuw9OuPHrVZGa8JNA6ngTO7wlI
	3Y2J+w==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48048vb2vt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 10:10:58 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6fac0b29789so23568306d6.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 03:10:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753265457; x=1753870257;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=367qI0nz7D+7h4lGNKFfyYMcgYPJRnaZzBeo2TflJFQ=;
        b=dxKZB0BUBhrtWnuOoa8fiQUU9MBa8kdUEaQ4epsC354ypMLUu4K2GJEOufWEkWHtDu
         GjZlsjh8NGtxU5+99c8DnrD0UJHtd84RD/QP39kwQEOSNNolw2P9rnKVhrwh92ygdJK7
         /Qk0I5zPuXCF4l3kFwbYGiBHHOvxBwMafGh9R/VLMsdXui7bO/+ZVn79bi8DA6tuHBPz
         ZEGWbPkPRf8qeRjdVMPYSOPjNAOJQr5wBYUV8Qv5fM58cmBk36qcH42nVPYr2aVzIKxq
         Du7QeeaNZlXaLQgPzwSyzRTsFzPK3M98WxramFqnAz4uA3TJYblckX+Edng3cnlVjCsn
         UtEQ==
X-Gm-Message-State: AOJu0YxH4SlH9cf/ug8gPNjwEmeVgYRybvmXxfUKYeCZl8qgyetHlKc3
	snUJ6EstxxsDy+W4w2+a3MEv2aw4PJ2Y7Iv0XP9e4k3ibNnpLKZiyXDK3QtplCqrd69PnaHSEZ9
	QwcNyyOBHxQb/cl3vzdTnEkQ3KCAP/UJVZb/MM3uo+jfBSB+fMG9LdqdWM+o7bGJfziZw
X-Gm-Gg: ASbGncv+uUn2AXoCCWrFTyi7hEIz94rVXzn7W6U8dVtUVtXjQFF3sd3AusUh+1i4TPX
	+Vo86OiGYg/pGFDEIhPtWHTaRlz7g/x4SDTRNO5iR+vnNZEAVZ9v1lqtjkzEA3gTi2dJLVGn6nG
	AJ1GEuy26C4K3luABoCaVCLAqB6cckx5jcg/JmR6hVnR1+vYDcEhZNiCFCM7z7w+lfQdyUinG+N
	fjYedgljgbmGhaay+++CpgPcqxkrw2uQ5CDBPSjlM6ZKTg5hNF757eOl4kRfOy8Lc06UldJPWsy
	oxtyxgCcAZDpIa2WrZ+oo2Lk7SLiy4k/0eKmKErSSmPCqV0LSzNIV0unrthK5nF9t2P7UjOq1nG
	FlAxUPFKT35plVIM8rg==
X-Received: by 2002:a05:620a:3187:b0:7e1:ba5:6ee0 with SMTP id af79cd13be357-7e62a0390eemr120704785a.0.1753265456513;
        Wed, 23 Jul 2025 03:10:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHR6Y6ZAAWdnN6iFKod/XOWI6twM2I3VQjkDNOIwbsj0NfFRXCat4cq56yGbwtYclqGHHydmQ==
X-Received: by 2002:a05:620a:3187:b0:7e1:ba5:6ee0 with SMTP id af79cd13be357-7e62a0390eemr120702285a.0.1753265455848;
        Wed, 23 Jul 2025 03:10:55 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-612f1312e17sm6525453a12.39.2025.07.23.03.10.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Jul 2025 03:10:54 -0700 (PDT)
Message-ID: <ef79b37e-8b63-4ccc-a739-994a119b95c9@oss.qualcomm.com>
Date: Wed, 23 Jul 2025 12:10:53 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/17] drm/msm/a6xx: Poll AHB fence status in GPU IRQ
 handler
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250720-ifpc-support-v1-0-9347aa5bcbd6@oss.qualcomm.com>
 <20250720-ifpc-support-v1-10-9347aa5bcbd6@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250720-ifpc-support-v1-10-9347aa5bcbd6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: N_w-ZtixYcGsy3Riy3OFcWT-n1SU-Pl6
X-Authority-Analysis: v=2.4 cv=SYL3duRu c=1 sm=1 tr=0 ts=6880b532 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=LpQP-O61AAAA:8
 a=wn_gRGg2Iv5gsIDpaVAA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
 a=pioyyrs4ZptJ924tMmac:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDA4NSBTYWx0ZWRfX87W5EENwddbs
 mWib9+Kn6RTauHBY4eBqdN1cOqKjaU3ZHmMAMyxbWm+1Jhkbm7nvAAVC5/lpeXHX3UAhtZRaLQY
 n1X8h9vzBTSow3EHyiScEYT3+6CWV09BFlwevJYMozWaJsAMU6dG9j6A4+OMD8caw96kFzPZsjO
 bWUYyAt9P4CDsh4v8p+fJxoYbqe7MRzFjbErLWSAkVsJDSbx4bj3K02oKxvK5P6gsJ474koPRyv
 amTOS2BNHNVtslqWCvEEm3U+1Y/XuJCmTX3Pd5ksckyIKRWKS6+D7OfoST9A/3KY4iuSHb7bnPf
 VjxO+rsQ/E+HDQRljo+mFBFr055UD8S0SQQKRfg1rfO9LCPu+d7Yr66h+dnkp8AMmeWMbByR6gA
 rzPSSGoZ0+8R1pSBTDI0etRfmt0xiSkGqCVCfXWlSyk1037KbI5l163hsUxgvCSxSHhlJpCu
X-Proofpoint-ORIG-GUID: N_w-ZtixYcGsy3Riy3OFcWT-n1SU-Pl6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_01,2025-07-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 mlxscore=0 bulkscore=0 mlxlogscore=788
 lowpriorityscore=0 phishscore=0 malwarescore=0 spamscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507230085

On 7/20/25 2:16 PM, Akhil P Oommen wrote:
> Even though GX power domain is kept ON when there is a pending GPU
> interrupt, there is a small window of potential race with GMU where it
> may move the AHB fence to 'Drop' mode. Close this race window by polling
> for AHB fence to ensure that it is in 'Allow' mode.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

There's some more context in this commit message, please include some
of it:

commit 5e1b78bde04ca08ebc27031aba509565f7df348a
Author: Kyle Piefer <kpiefer@codeaurora.org>
Date:   Thu Oct 19 13:22:10 2017 -0700

    msm: kgsl: Prevent repeated FENCE stuck errors
    
    If the AHB fence is in DROP mode when we enter the RBBM
    interrupt handler, it is usually harmless. The GMU will
    see the pending interrupt and abort power collapse, causing
    the fence to be set back to ALLOW. Until this happens though,
    we cannot proceed to read the IRQ status and write the clear
    register because they are inaccessible.
    
    Poll the fence status until it is ALLOW and we can proceed.
    If we poll for too long and the fence is still stuck,
    the GMU is probably hung. In this case print an error
    message and give up.
    
    <cut off tags so as not to confuse b4>


Konrad

