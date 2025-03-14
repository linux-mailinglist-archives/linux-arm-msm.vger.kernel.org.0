Return-Path: <linux-arm-msm+bounces-51442-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B22C5A616AD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 17:46:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 866FB1892FA0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 16:46:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6470084FAD;
	Fri, 14 Mar 2025 16:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MkPq5kWO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4B792B9A5
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Mar 2025 16:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741970784; cv=none; b=ad3GEl/J9k0V8K86okEusAc7F9zAvIGjOfmD68lNUPZgqIJRY78KrLSPiQzvK9BdCFqz0Xj96qrod8FlPrNX5F5A4NmlG5LJQbLC7plZaKi1AfzBuC1yG634/v5kkWh/YJSF2rxpzVp6cs0mS4b2Miqwx9qmGSR1NKCTfC0vnxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741970784; c=relaxed/simple;
	bh=9yVvwFZwWIIwJ4cqVDKRbVbSDXWcXfSzB4OeZg+iobs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O4Mm5wlBYfz2hhuJAYfq1ZUIjDf5eKMa2avW5VRMHZKrpne5Slfg8+OF2vDmXy8g6NiOYAOukf5Gzy9WCiTWVJIpl2RvvUNmvFNcNQUl0t4MOhVpMM4ld3/FCLh4S4mzu4lU9KszOBcCbkJcGXQ45oPSUdZzIufSIkd1twfwSRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MkPq5kWO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52EB0V3J008912
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Mar 2025 16:46:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V7iC8xf8rHfTJsz/B/gMbvSBnsp1N8NKxvrp+AGSFII=; b=MkPq5kWOire3LWlq
	RT44WTSZDdVihrF+mPzUf5Z9m1Thxg2Id2PcfOWB+zZmDKtDdZNO8+A/z78HV+Fz
	m1tKZVwv1OSj7RS2PW9FdJQ2LREfLbuICM6x2rNdwf8ZWqVxGH4PnLxscDCKonad
	s64MQG8ZyPKCjBciqhhawp5zOth5s6/THmBMi0govnfu203H/5txQjCO780GA5SF
	PG6sm2ZTxgy6TAtZnIF5gyt3A6qfXQwiYWfoiWFYY1Rg6LsLrcXw2eXIRj2GUuPx
	Oom3n8+6N0i06YZxNf9Eg+SKWFsvjxlS/ua9L11Y76NtR8VGaot8UaJa/06T/HZ0
	UbIK3w==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45au2rhtkj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Mar 2025 16:46:21 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-223a2770b75so44940845ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Mar 2025 09:46:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741970780; x=1742575580;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V7iC8xf8rHfTJsz/B/gMbvSBnsp1N8NKxvrp+AGSFII=;
        b=iA+Gm0LRG8Kbn8OZuoIjV+UkGpbJVKoYVZj6psO7CDtgyXpuLAvY/ubc6GKpRXnbFe
         4Iqti8cT9NoYgyy7aFRWpjh3iSEaTMbaDQIYjF03df0IzAMXEV3Go51oIufX+YikieNB
         nhnzTg9rxE3pYAgVWgCyYpeysv8kXmK3xVKcXcQUA+dojSpaDa88YUbZc7bsC2XZUiI9
         it3rAtJUkdvfvZp2lgXGjdJgcCd1gvp2+eDFIwbY9U5g+jfqKM0ZZnSdWOy9/Ie/j0HX
         iePFfWj3axnDUvSQ9/Uz4li/zD6S6YvXQMxGOQVOKP5YJzvRmh0ShWM167hvV8pcywbE
         +psw==
X-Forwarded-Encrypted: i=1; AJvYcCVn8sbp1sTATWN4RuMGzH+1VP6IZ7qRAezG8SYzQgT3vfVb6WrDCzBaPcOzvHATV2NCxyll0MI3rJ548kIa@vger.kernel.org
X-Gm-Message-State: AOJu0YxJEkZELJNEXR/Pr0iwToCV2LBRVsRm3D/R00rE71NgTdm3rRad
	KDHIt6d+Gvx2ZjM9vPRW3zss7K8lbE9Botti3Z4xPO3W4luDIxmX1ngDXMCZQ/6pbDagcHKkyPT
	aaZDogCffsX+NsfCuJYPjWDG3hr9RRVjmWsyvibXwnnoXv0rPpt3Ynmkp+XHanddc
X-Gm-Gg: ASbGncs2J1J1lxNuQa7xMuCoL5pVrP2aNdtPxZZSR9+fn5R7/Zcjj4nMPHFO2bUd0j/
	SyB+5ssRBKKqf4z9kDTtvubHDFxnFyTeiO/K6OfhS0C8PWQxwMkRNULKsSTVqOaFTAz3RozMCkg
	Pqof7IflkA3xMiyAQMU/HnlxpMK30C+a8g24rWUy9oboPmnde0qc0OVHnbxV1hXfACMUaK+9LhD
	+pnyUDEYARN7+W12W216vr9spWXPwPTwFRvcP+Cc1wpWzjGVnvPA6F5EerWWFdvST2NGI0TekDZ
	Hmyd/YYi+aMDD+FcMI9SaDnySCo0gyfXI6Z5OhtEoQwPA6U8QrENdT+4d8RXLmsW6Q==
X-Received: by 2002:aa7:88ca:0:b0:736:6279:ca25 with SMTP id d2e1a72fcca58-737223fd657mr4639691b3a.24.1741970780276;
        Fri, 14 Mar 2025 09:46:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF5Z0N372C40vTLg+lf6IIyxYpGOfRFioICowlAofkGkUXQTNrit8/4263LMemsQpFAjwboYw==
X-Received: by 2002:aa7:88ca:0:b0:736:6279:ca25 with SMTP id d2e1a72fcca58-737223fd657mr4639655b3a.24.1741970779865;
        Fri, 14 Mar 2025 09:46:19 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7371167d89asm3178677b3a.94.2025.03.14.09.46.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Mar 2025 09:46:19 -0700 (PDT)
Message-ID: <6f53e1f6-3ac8-4828-9ef5-dbeb76ab1459@oss.qualcomm.com>
Date: Fri, 14 Mar 2025 10:46:18 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] accel/qaic: Fix integer overflow in
 qaic_validate_req()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Carl Vanderlip <quic_carlv@quicinc.com>, Oded Gabbay
 <ogabbay@kernel.org>,
        Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
        Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>,
        Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <176388fa-40fe-4cb4-9aeb-2c91c22130bd@stanley.mountain>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <176388fa-40fe-4cb4-9aeb-2c91c22130bd@stanley.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=D6NHKuRj c=1 sm=1 tr=0 ts=67d45d5d cx=c_pps a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=LlO3PXAvtcZV46L7pkYA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: w0RNUNia3z41hiyUf-8TxaaWKqNvluB-
X-Proofpoint-ORIG-GUID: w0RNUNia3z41hiyUf-8TxaaWKqNvluB-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-14_06,2025-03-14_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 priorityscore=1501 mlxscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 adultscore=0 malwarescore=0 mlxlogscore=844 clxscore=1015 impostorscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503140131

On 3/7/2025 1:41 AM, Dan Carpenter wrote:
> These are u64 variables that come from the user via
> qaic_attach_slice_bo_ioctl().  Use check_add_overflow() to ensure that
> the math doesn't have an integer wrapping bug.
> 
> Cc: stable@vger.kernel.org
> Fixes: ff13be830333 ("accel/qaic: Add datapath")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Thanks!

Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>

