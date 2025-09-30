Return-Path: <linux-arm-msm+bounces-75528-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D02EBBAB192
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Sep 2025 04:53:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 253F91924BEE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Sep 2025 02:53:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EDF0214204;
	Tue, 30 Sep 2025 02:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V3iTXAvH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5924880604
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Sep 2025 02:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759200805; cv=none; b=qqK5nlBxhmWm5DnUs7kkVPbNRYrZ6M6Sd47Y/oYVkiINNZMDH+ej7PeBirdk3GRiwTkqAxnY8yOQWnTTIMD42vLiEIyYLkZPmYq9zS8uyu1iH4WXEvvYhMtSiSlq+O0p1e+KQQd/UsqaNI5ddC7lNsZVlyVtW1/2o1t+GwIu2pY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759200805; c=relaxed/simple;
	bh=vx+f1fQY2Uwueq3Jx9VQNWKhSt/AYmYcmnwfYaVLCf8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P9rSiOjikAT0KqSJ0+0Ss2/031qXvD1y2Mxm7ao39bcablZAHJvRH8hgl/8CZaTGriYeUuboMGFQ9K/4xFYzByoDG+8d1IAeZuMGlE4QZgQEisK8N442Wgp2IwnD56qCVJ7qDrGZ4i4+7tm1LbfXmHA/J4IPzplfjQMvnjJzpG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V3iTXAvH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58TJbnx9022463
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Sep 2025 02:53:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ptmEaaTCFgclY0orIxraWd4bdye2B8I3nhnkuntUSC4=; b=V3iTXAvHQu716hMu
	lFlOXMFOLM7FRNpoWINAQOmdXf3hKtyIk+xH6+Gzn5FfR1fFQfa90OodMziHt2Wd
	K3uXTkpB05uEHm8Pr1GTZLdBZZ2kBlXUhw9QIJpNgI4HRrQGi6eXEEauG+lMjgoB
	07/tLRos6R2ifnwv2reoBEnqLOEdePEVWGz2fmlOUt8d/3lzO9QnKXqXyF8TvSQe
	5fEs2m/xpacJs47Fe91l6vuUnrGF9LEmh54ueL8zNeC8xSAtNHn0KLv4zrxPnFvK
	EeJyw2LsCcaTZIkaSaTnRZ2A6Lht6M9p79wf50tK///JrPfLB/TYMlSPdusInv/a
	qgy3ag==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e59myrkf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Sep 2025 02:53:22 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2681623f927so50964245ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Sep 2025 19:53:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759200802; x=1759805602;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ptmEaaTCFgclY0orIxraWd4bdye2B8I3nhnkuntUSC4=;
        b=RKT89OXBkdi077A+/yXTJI1j1yrfp66Ok91L/M4UVqwmLQWSd4Cd8kfFwB2akoqpd6
         SNSAR2TMPva/pNTynS0Mz1oPUUhuAl/BN3JG0dtObF64UZeR89VJzyPM7n54l1cRQb/M
         kKrnyqgqZacm1M4CUmJAR9Wt6HGCOlh6x4KskBMAkb6EVTEMgaAe+Gd+nZh6TvSzamsU
         l0rT8fhWG0wH7OBd3hC+OJ5YL/ULTlv+vNLy4kN2w0WtC1jG8e4xHKjmgwrZUpah9mne
         YcIHG/6iU9hn2iXw4Al520AXdKYWvIMQSBvqoRo4Y8DkRjoEHWylT1+zgz3dnME6pL8U
         1Fow==
X-Forwarded-Encrypted: i=1; AJvYcCVRW1eJvLVcYhghMwAYYHcYB2pDHYIW+k7ZPJqV1zYp7g/tJ4vj7GSZxsMDv7BxGxyN7nCMTNXCQbOq62Dj@vger.kernel.org
X-Gm-Message-State: AOJu0Yxo/kepLYz57yqvwFvB+PhR2gpSALygiTF+8AzTxc1+KMFHknSX
	MJspWTvIjKPtxig1FMtuU/zJizDbXfReDIe3SIchdqMCc+TgifTiNRMzlJcPOFG06kRtcR8IUGv
	9JD4Z5cza6bj1XwaR51bVPAAYcwk4s3Jumkhc9h+ljsMGuq3rC0qbAYj2TzFlkJlFZXva
X-Gm-Gg: ASbGncvCHWVUehA0rwXlIiOPeDvGpJChgb3AHJT4vwqAggUm2T7eEuTp7vpaM9BAU8s
	yt617NFipLe/9352o/YpulfFpoyBxkSM1bacJOqhhqS2N7BYiO5pX1/axqE7nnFS7yMi4g0y987
	CCU+a9XyQs2wncK8A2vz5LOCKhQwAr40g7xZRF6VRuuqbGr0s34OxExrcqqM26SplPDvBfwsEB2
	AcRioESKBgIZ09BFtYZENk8vW4WsOXs9XIeME75fPhL0dd8LxTIOYpC5XoLtEZEXdYEX0syuo6X
	XA16CFL5lkZxkssteng63ctpDFyh3M92M6jss15sIEXKFIjAuv5OpUuBXM0Sn1n2G08K4l2VT+a
	gin5X9njy1w==
X-Received: by 2002:a17:903:90d:b0:268:baa6:94ba with SMTP id d9443c01a7336-27ed4ab65b8mr164718605ad.53.1759200801557;
        Mon, 29 Sep 2025 19:53:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG9BYMWp6hNCw9FidFOi2WDNeI5c08GRWhasex0PVEvIzKhELgPVQ9in2bgdPZSp3Wkfk1VQA==
X-Received: by 2002:a17:903:90d:b0:268:baa6:94ba with SMTP id d9443c01a7336-27ed4ab65b8mr164718445ad.53.1759200801090;
        Mon, 29 Sep 2025 19:53:21 -0700 (PDT)
Received: from [10.218.15.248] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed699ecacsm144700875ad.109.2025.09.29.19.53.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Sep 2025 19:53:20 -0700 (PDT)
Message-ID: <91821a59-d893-4807-a9da-bf7cb75a30f0@oss.qualcomm.com>
Date: Tue, 30 Sep 2025 08:22:29 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] interconnect: qcom: add Kaanapali interconnect
 provider driver
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com
References: <20250924-knp-interconnect-v1-0-4c822a72141c@oss.qualcomm.com>
 <20250924-knp-interconnect-v1-2-4c822a72141c@oss.qualcomm.com>
 <2mq2qqrgm5x4hj2cnstzsqzfk4lmzhg223hmobrjnqu62facc4@p57wbmkys4in>
Content-Language: en-US
From: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
In-Reply-To: <2mq2qqrgm5x4hj2cnstzsqzfk4lmzhg223hmobrjnqu62facc4@p57wbmkys4in>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: NWYRY9QW1reVWBoKV9GuAPedkSGAgYsB
X-Authority-Analysis: v=2.4 cv=O4g0fR9W c=1 sm=1 tr=0 ts=68db4622 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=U-4vxhJDZ8N_SHWVoUYA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: NWYRY9QW1reVWBoKV9GuAPedkSGAgYsB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAwMSBTYWx0ZWRfX4DQH8boL/3c1
 Yn2APGH5gKAjuuQoBUl4eASN9EEqtDlxzigbLzqlyC7IbhucfoTlRJwb5LxrbjIAmHf7XBLd+Ru
 cuVbAjDBF7/+oPDPW9qeIOZ14zeZb9zEMpqpaQLc3+7tMeE+BXDxNQj/oz+RedefTOHY1JUIbla
 kKzSwjfkTxVKpAZxLFY3pHRqFilWWd3nj7SfEtRsSPDAnxkhwNPgm2T8nUKSe9vHb/jL7lH5U4q
 rVsFK2tmfhKdbD4F7o4GZZD9J67TPMrwjxBvqiVoLWcgNVPZRQmOZsFtyfOQnn81SbUWlJI6Ovg
 sQAgEMJQIbpUqqIEKHN5XhVw3CJ6tl+9xWLj4hPCzow6biTGakgkqT9Foc6tcKRklm0NZ8CQBce
 ovF3cB9W3o4/gz3NyiyXuyuHt5f2wQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-29_08,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 spamscore=0 impostorscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270001



On 9/25/2025 8:17 AM, Dmitry Baryshkov wrote:
> On Wed, Sep 24, 2025 at 04:02:45PM -0700, Jingyi Wang wrote:
>> From: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
>>
>> Add driver for the Qualcomm interconnect buses found in Kaanapali
>> based platforms. The topology consists of several NoCs that are
>> controlled by a remote processor that collects the aggregated
>> bandwidth for each master-slave pairs.
>>
>> Signed-off-by: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>> ---
>>  drivers/interconnect/qcom/Kconfig     |    9 +
>>  drivers/interconnect/qcom/Makefile    |    2 +
>>  drivers/interconnect/qcom/kaanapali.c | 1868 +++++++++++++++++++++++++++++++++
>>  3 files changed, 1879 insertions(+)
>>
>> +
>> +MODULE_DESCRIPTION("Kaanapali NoC driver");
> 
> Qualcomm Kaanapali ...

Will be addressed in next patch revision, thanks for the review.

> 
>> +MODULE_LICENSE("GPL");
>>
>> -- 
>> 2.25.1
>>
> 


