Return-Path: <linux-arm-msm+bounces-58966-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A8D5EAC00AF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 01:24:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D92EF1BC4BE8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 23:24:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56C6223BCFF;
	Wed, 21 May 2025 23:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dU/mpAD1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6654239E65
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 May 2025 23:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747869874; cv=none; b=mNCbw4fXs4eo3DK09USHEEIctyJri0gGHFFz1c8zSkFd4PTXBWAyAQiFphVI0deVBAChTmJNaRQ+Sz5sHwf6jFTRJPY3+qs3lDd+WdPQZNaVZ48ou0OdkqnriLlNiuF/uPgypaTMnIyZ5LT+SBFOXHozFMp1B1reCkXmoBe8FqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747869874; c=relaxed/simple;
	bh=gauFSKiISLRX8Ov4HTQ62wBAZhpXKd4ecNxfk9HGWgA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nB5ZacVSGygZa9k2x33zdq/lYVT30cbpiywFWyngHju2Dx1uU6gn/vyTZYorj7tsvbAiR9SoI3kYVpuVYehYq0EFGlG+Mu1CmQjv5i0wwiAmy6YKJfPL6HEvwdLDppPQ+tV8UTDn8jgU7MseqERi/XeSmoGdAYWV6VWMjRC9MU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dU/mpAD1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54LI2i5X000731
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 May 2025 23:24:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hls0M1duMh3B/b0vy6maucv9cYQvjdyPKyokID1W0WY=; b=dU/mpAD1j3Qx7nKH
	f9JWbCq7aGrNdrbTTQVw7uB/Oo+pR50KoLHIa2cawtItAuM2go5BxWXtOnpXlbC1
	nrVFIiHPho7144N49M10apCy4ORoLqJ5VcXShJjsgQpTWIco0Bo9AwxSGOk2mTc4
	xlyv0B/YaGSTfV9ZOQUAU591rjjh5Py9d2c3TFcNOVru3IYTKR8d3QkC4Yxty77Q
	2LwibyTFh4fPnsX9eAArKT1y6dDJ423rJgoTH184qkRw6Ot48lytqetcopjsvci2
	l3WfYYFyr23+sdNGj62QRAHoJ5oi9ZGsAHTMzYFpKdyawZLXKDh6WAEOAVUZp92m
	LDDMgQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46s95tjtg8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 May 2025 23:24:31 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-231de0beccbso40971185ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 May 2025 16:24:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747869870; x=1748474670;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hls0M1duMh3B/b0vy6maucv9cYQvjdyPKyokID1W0WY=;
        b=OVuS1UQYUUhUDK47tSb+4TizWBgwJSJkbCmjPcUMSKEgYPFfb3rJcYkbR0oOfMNgd7
         78Bg3qj3L0sDAGsxkWWPfnU9GKflk7xpRUSpGZpNMIPxOPBYeDv1/B3+Ra1cqevJ9sAE
         aIs/gpPXm5D2P0rgXVvjkSktS7Y+qq9hwJ22hlZ3LrFWYTRmnd34X3GmZOU8yC0uIG/5
         z7F+3YK9qO2BZmqb2YXewfwVxnNku/h46wlN4wNXy3sFKwYSPwnFdvT2PQop0LRiKneX
         gLL37FBcEvI4OVPn4lEZKeOsN0Fu2TA9b9TrJFPADuKSkMDfKMMqYxtKA8Fg7X5aXDav
         vE/g==
X-Forwarded-Encrypted: i=1; AJvYcCUGGL0S2msHPNJawW1L7psfXFANEyNTyTUKHLmY3nfIkmlo0MG9+b+zn5q1ohGrecX38wggizIu3ZiENccd@vger.kernel.org
X-Gm-Message-State: AOJu0YwqwlUc1syUV8p2FXlumMBmhTmfaQLMptudXpNHQLTjnsyPnH8G
	omFmQsxTwI8xHW5MARS6ZjxtkHNI+gNPYFWvzh5WfD1zLswfesEs7o1Y3dzqqTt53LJUNHZRfok
	KOIDrHAaBbn4W/NLWtIau7ZeCX7a3LhQ5QorurR+IWtWV3W/2ao6Ieubd88dVuF/IQMIa
X-Gm-Gg: ASbGncuu/oDbACZLfxwpQYI33Uae9JCtLbTw2jr6cV1X/ZnMiHh86YOrBNPGnAajfnp
	HLBYPH4ToQaLzGNQ2LhRz3BESc4mYY2EvdE60YPSSSdmq/Zah5bCGHv+GHTc3oaAtQtVYNKEqCU
	4QSn/lAU/M2xdttGjFUrFHzCP/u5UpVRFN4y6/vBuisbYbS3YWLXtkVK8nm55lWPJ/CpOEDstRa
	SmT56pjZsGSUBhVdGc0JQVUTOFEzSRlQV8QqlFbHAPRY/HEUU3ogOfkvz9741cbiAuqoTS1O9o5
	Q1MUasA7GvI7SrdV8QSWCuu4K6CBWWoocfLjgrK26+Z6YoPdKeBIFyUVdxqF+zRYJftKVQCW9Or
	H2gNKXw==
X-Received: by 2002:a17:903:2391:b0:22e:491b:20d5 with SMTP id d9443c01a7336-231d4eafb92mr315567475ad.26.1747869870039;
        Wed, 21 May 2025 16:24:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFTYSdOlwbd5AW68Rhy7CMCDMuEU7P5LVqZql1g8ADHBgszFHLltnvKTnhMwqvwr8hM0Qvd4g==
X-Received: by 2002:a17:903:2391:b0:22e:491b:20d5 with SMTP id d9443c01a7336-231d4eafb92mr315567205ad.26.1747869869613;
        Wed, 21 May 2025 16:24:29 -0700 (PDT)
Received: from [10.71.110.187] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4e975f3sm97782615ad.117.2025.05.21.16.24.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 May 2025 16:24:28 -0700 (PDT)
Message-ID: <e061e56c-1b06-48d6-b118-1cc698337df7@oss.qualcomm.com>
Date: Wed, 21 May 2025 16:24:21 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/3] firmware: qcom_scm: Support multiple waitq
 contexts
To: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@oss.qualcomm.com,
        Prasad Sodagudi <prasad.sodagudi@oss.qualcomm.com>,
        Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>
References: <20250425-multi_waitq_scm-v6-0-cba8ca5a6d03@oss.qualcomm.com>
 <20250425-multi_waitq_scm-v6-2-cba8ca5a6d03@oss.qualcomm.com>
 <a1aefddb-6914-42b8-9ba9-8eb27a0ce2f4@quicinc.com>
Content-Language: en-US
From: Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>
In-Reply-To: <a1aefddb-6914-42b8-9ba9-8eb27a0ce2f4@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=QKBoRhLL c=1 sm=1 tr=0 ts=682e60af cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=ahDluMLb09nIdOiQcjIA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: th3KpmgmJvnaUjJPhuI12tqN6dKcs6Ws
X-Proofpoint-GUID: th3KpmgmJvnaUjJPhuI12tqN6dKcs6Ws
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIxMDIzMyBTYWx0ZWRfX6mpjKTdm/Ya7
 156hU6qIq1zRNwa6P2ghPDJvpMPOw67bV4GkhUAphTZEBLv+bROKbeXYZToblQ9IxCIDvFoXXuc
 3y+9WIBGIw+dN2FfadAPuWOKe7+Nwqoq5R11i/5GW4B8HONmVsRyPfrcTxhxIWlEgNIVGlsGuxr
 5XLJi4zBFhsbquqlKnefHbVOxZYwW64P6ibZJy9cF9Fo4wKdA1M0Sfn3IZEOq6p24tayMVlpYNW
 q6agKR+EZBXLZryntV541PRrTvtwXJYPlXj9KABD31tS/Gh8LzQsWJ/qQFRHFbFWGZIFgI2hRca
 wTf8OnmaSviawVdndDJXpZN77w2auvFNdFZQiCD19T0GpYN+PiBuYjW3pmfX0YxCC6fhX1wDuaM
 IpQiA73WBhIvIB/QhU+iN5Xf5GyI91p9PBPVue9bmYicj2kBRyOjc8HOGzfQ9TkgVEgfTItb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-21_07,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 spamscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 adultscore=0 mlxlogscore=999 suspectscore=0 bulkscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505210233

On 5/9/2025 2:48 AM, Pavan Kondeti wrote:
> On Fri, Apr 25, 2025 at 04:48:02PM -0700, Unnathi Chalicheemala wrote:
>>  
>> +static int qcom_scm_query_waitq_count(struct qcom_scm *scm)
>> +{
>> +	int ret;
>> +	struct qcom_scm_desc desc = {
>> +		.svc = QCOM_SCM_SVC_WAITQ,
>> +		.cmd = QCOM_SCM_WAITQ_GET_INFO,
>> +		.owner = ARM_SMCCC_OWNER_SIP
>> +	};
>> +	struct qcom_scm_res res;
>> +
>> +	if (!__qcom_scm_is_call_available(scm->dev, QCOM_SCM_SVC_WAITQ, QCOM_SCM_WAITQ_GET_INFO)) {
>> +		dev_info(scm->dev, "Multi-waitqueue support unavailable\n");
>> +		return 1;
>> +	}
> 
> I am testing this patch on SM8750 and found that we are returning from
> here, do you know why it is happening? The first patch in this series
> does not check if scm call is available or not and I see scm returns the
> hwirq properly. I have commented out this block and able to see waitq
> count as 2, which is inline with what would be overlayed in the device
> tree.
> 

Thanks for testing it on SM8750, Pavan.

Initially, I wanted to check whether the SCM call was available before invoking it, so we could
distinguish between a failed SCM call and a failure due to the call being unavailable.

However, after some internal discussions, we found that qcom_scm_is_call_available() is handled in TZ,
which doesn’t implement WAITQ_GET_INFO, and therefore always returns 0.

Given this, I’ll be removing the qcom_scm_is_call_available() check and will treat both scenarios -
SCM call failure and call not implemented on the target - as a single case.

>> +
>> +	ret = qcom_scm_call_atomic(scm->dev, &desc, &res);
>> +	if (ret)
>> +		return ret;
>> +
>> +	return res.result[0] & GENMASK(7, 0);
>> +}
>> +
> 
> Thanks,
> Pavan


