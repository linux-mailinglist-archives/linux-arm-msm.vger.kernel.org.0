Return-Path: <linux-arm-msm+bounces-64876-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 605D6B048C6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 22:40:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 92263189E29F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 20:40:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C83EF23815C;
	Mon, 14 Jul 2025 20:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PNLMXFRa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EAF8229B0D
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 20:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752525627; cv=none; b=WchxqHbNtc2TBIwNA/trfqVSjw+CEKKtI2X+tVdh1ndNIiu+FP0aGlU+uwlNoGeJurp8Dn24ZiT49/WO5gGSsk24xuhsr7q5oqkBUtLxapQ/cH7we4uaDT1OLAjIquM8AaT3UhedbmC4eEaLlMhb2xrcdg/fQM6hON1UBBeCJKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752525627; c=relaxed/simple;
	bh=2uZZTebuOFDjP13YTDGx4SMvfjxX+NyR4RNznioKjMs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JqUYvlTSJUB4dz0PEqtlyBkYPEX/a5gVDrZ8ehh8tweMQeEFqDH6dyKMq4k+h9fasYOebgPzImdjYlyg5OwLrne6OgZhj3mkzEE34DpBYdkNV1ouzsxypTKD+IaM7YlM1tbWo9eHHNAJnqUzv/LB8LMPNX+a52EfkvciUCddkY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PNLMXFRa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56EI2Q13022925
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 20:40:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	25GVmgVH9MDk+jPkcTAhkD6+0FAocGPXkUfqlwWZ3pw=; b=PNLMXFRazHMoAE1Q
	b2zqfe89TduErxSZAi8QZeNZpEPkA1msL7FbI0JgU5jvZqNN66vTqv3+XLjAChxQ
	I8nKIFfF5y/8nvK2A+YvkXeXBeKZ+caUVQNssT8B60IcbWAfGftXCSHNqWju/w7z
	nPeXOnvomxj0f/0YWsA8+rPYbeLP0DGyTQcrHxJyEPaFCTcxXJAfwhvI53rSrC+8
	U3AyJvz8I9R2xjv3iosKAS7YzqD11YEyc7YPRVa9v2AFDwre3UkHdmiNpH8/BwtA
	MBQqoyyIhipyY0BXgIyM8dyqkAi7t36Zn+0qY/f7AjFeXcPyWI0Onuu63Dxx44aQ
	zxDdiA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ufxaww32-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 20:40:24 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-234b133b428so37908785ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 13:40:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752525623; x=1753130423;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=25GVmgVH9MDk+jPkcTAhkD6+0FAocGPXkUfqlwWZ3pw=;
        b=aC8AObdOeyCQXfVtb5t28+R3uEvieSVUEImNRTRdZjLD/qHYJe4wu+mFuvtfapkvaO
         wCxZ7a3SH0h9zLYdjaRnggltwGqImdphmXIqmKsnBpVhY5+JYhsruyNtQLYebm5bzM/t
         DuENlQXK+6Tha47/SsjSgKSBIowQcApiq9E921sIChKbMjyRqTcYw4z8DjTGs9tSEret
         enrBLK/e38hJlb+AAFAkfkQ7BrJlF/46a5p4Yuk05IH/x5rSocKI5u6rppVL0IoqV3zm
         2EI1u0OEOly4D/u1/pkNjMn3NSeSGKhQLwIT+1gtfxjYSq+pWj8DF+ALSlSGRuxD2A9M
         01Gg==
X-Forwarded-Encrypted: i=1; AJvYcCW5oaOy4eqHIVFcziJPwgiL4zoyUO/JXZgoeuhvrqSPeDOsdo/5EBuwnYxCOm8EqxRymR7NS+h2X+L6gdga@vger.kernel.org
X-Gm-Message-State: AOJu0YxLZJmWjBH4Afl7hRrWIOzRzZp6iJf6YRb5U/hxJ9T3g0kZUNoC
	MelQwIzj0XmP9fZ7m/CeVD0QpnJaAjHZd1/7L/4jiKMMS31ILRzKP/J6WUNeKGpQOb7i5m03ejz
	WDLqNqetvRZC/IMvo0iCaNUXPJltGI3YzNjiwMbsPadLSlsA+hKlz37Qn3iMhIUxm9QEe
X-Gm-Gg: ASbGncsHrcMP8qc9nIbWZlhZyV11ea8vkwppIl1FWU+fxhOr6FXvoIPS3+0NwozibEL
	tBUPGysQHJN/TboaN17Emi1geOlF/1vAGutSidJQuSljX5Eb7f0Hp+eWfH+3+crrqGMznAwJEDs
	Q0qe7kawedmBEYmF3MNPTvQTscmGzvI+QXDK72e2pVxkF2iyi4dLIQvQNaaeu4Yj6nAkZAAhJtA
	ZRBvZXnrmXpqWAjfmFinpgDEKprYIiCYR7pur9Xu5476F9i8w6uIuiytsZNNCZ4ePwQi4rJsSGw
	e3fweM1fO6AiVQHLsY9kJdOJuo9jBGMMFt9MDYcXMNW2VnsULjsRJV3SPOYvZHBkjgmXkMhQhuW
	a+ayvsXakXwzHnGALZggrVQ==
X-Received: by 2002:a17:903:190d:b0:234:c8f6:1b11 with SMTP id d9443c01a7336-23df09637cemr220506775ad.44.1752525623066;
        Mon, 14 Jul 2025 13:40:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGWNBRWKprVEoGbPc3QI56BgXdYcezaLFCqX5CP+sJ7MbZarEK1v7Av0mTf7ehe9MRj6ZXn0g==
X-Received: by 2002:a17:903:190d:b0:234:c8f6:1b11 with SMTP id d9443c01a7336-23df09637cemr220506455ad.44.1752525622634;
        Mon, 14 Jul 2025 13:40:22 -0700 (PDT)
Received: from [10.134.71.99] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de4322db2sm99681325ad.100.2025.07.14.13.40.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Jul 2025 13:40:22 -0700 (PDT)
Message-ID: <6883f346-452a-44b1-b670-3bd514f57b08@oss.qualcomm.com>
Date: Mon, 14 Jul 2025 13:38:55 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/19] drm/msm/dp: replace ST_DISPLAY_OFF with power_on in
 msm_dp_hpd_unplug_handle()
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Dmitry Baryshkov
 <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Yongxing Mou <quic_yongmou@quicinc.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20250711-hpd-refactor-v1-0-33cbac823f34@oss.qualcomm.com>
 <20250711-hpd-refactor-v1-4-33cbac823f34@oss.qualcomm.com>
 <rmlgjr3fzb7dmnwmthf5bj67wb6fkcksmn3ouchzsvhhgxiv7h@vwcieejcufr7>
Content-Language: en-US
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
In-Reply-To: <rmlgjr3fzb7dmnwmthf5bj67wb6fkcksmn3ouchzsvhhgxiv7h@vwcieejcufr7>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: FW6TzA9t6dtIzsYZXE29QyMsBinvYRiq
X-Proofpoint-ORIG-GUID: FW6TzA9t6dtIzsYZXE29QyMsBinvYRiq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE0MDEzOSBTYWx0ZWRfX8CNyzq60Jj/I
 VEMfgBLtZ1LyRbXF1+vRafJd/KszF9lS5kIq4mwof/DtgYHGbWzwfm8Czo+aSEi5bmAbV7/1sHt
 cN+Z3o1DyHI4jobK80Qq/m5TcXHrpllM2+nuty/10uLzjsnP/be475IJTWDWym3tXKfxI8j62p1
 p0qLUqoDUDjjPzePROqqmxxxYJOlPhzd4vrrdsvnlqmw7CEVTxHdIWVr5KukahobT0dLo7x9vs3
 IeKozGMgSh5vberLALmOvrSsqWMDCLTjTj/y7ZN0h6dXLaFQk8h4JWZLJTFdi1pykHEIC0e8L7M
 whfo7iipquvvLFKK/tsFDcbCq4Abq+yfDOayBp1HjmRNK7JbC4oWCnnm1Fhj/M+zVpLrF7k8s2W
 Ww0l3o49WOuQ7Jh3cd+P0xuwb2f2v+XnMDSeYLs+KdfqVJigLWtEMjCfaBgI6/4mA8y88RTh
X-Authority-Analysis: v=2.4 cv=Xc2JzJ55 c=1 sm=1 tr=0 ts=68756b38 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=e5mUnYsNAAAA:8 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=a_MUTpskHjF2EEzg2GEA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=Vxmtnl_E_bksehYqCbjh:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_02,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0 priorityscore=1501 adultscore=0 mlxlogscore=721
 phishscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 clxscore=1015 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507140139



On 7/14/2025 5:27 AM, Dmitry Baryshkov wrote:
> On Fri, Jul 11, 2025 at 05:58:09PM -0700, Jessica Zhang wrote:
>> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>
>> msm_dp_hpd_unplug_handle() checks if the display was already disabled and
>> if so does not transition to ST_DISCONNECT_PENDING state and goes directly
>> to ST_DISCONNECTED. The same result can be achieved with the !power_on
>> check.
>>
>> Replace ST_DISPLAY_OFF with !power_on to achieve the same outcome.
>>
>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
>> ---
>> Note: Taken from https://patchwork.freedesktop.org/series/142010/
>> ---
>>   drivers/gpu/drm/msm/dp/dp_display.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> Please squash all state-related patches into a single one. It would make
> it easier to review and more logical.

Hi Dmitry,

Ack -- I'd wanted to keep all the patches small, but I can squash 
patches 4-16 into 1 patch if that makes it easier for you.

Thanks,

Jessica Zhang

> 


