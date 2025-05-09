Return-Path: <linux-arm-msm+bounces-57432-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 19049AB138D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 May 2025 14:37:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E63494A8BCE
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 May 2025 12:36:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F2E228ECD8;
	Fri,  9 May 2025 12:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OekZo0N0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5AFB27700C
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 May 2025 12:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746794211; cv=none; b=oYQ4tJyy5xgYEJWBDCbp08PlubPhliG8IbFv+hgkNRZRtUCbAS6sQMywjULEZj5XxXPLDY35meNWXBGK1qcIVxeHAXp71RlmBZED9zt0JBBjmYI+ilGPIRfOUMDExAKXtAYG6JpCOLA/kTeke1TDaixmj9m/Gdu1Fj9E2tXnd3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746794211; c=relaxed/simple;
	bh=z5Y98Dx2UEyRxwSsfaZlWmpmk6jTclzxuC7MxxU33FQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nYciinNdsAfn45Fbsoxj8awKoEgDwK8EWM7nSBjPA9TRgIj/TDqzOlk2vTMwW3rZHMlFSMe1sUCQAzPUQazmXDqr/DVnn8Wzh5vwIN5F7Ps9BkNJtQDy6GpXAeD/N9Vbni0WFHotzAOhpu1HWDHPVjWNGCD5GMj30WdS3QmXSW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OekZo0N0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 549B89se008649
	for <linux-arm-msm@vger.kernel.org>; Fri, 9 May 2025 12:36:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nj3eTuWQfQQ9acGARQe0moB1OSB4sNdWAMULwa+W20o=; b=OekZo0N0lSQx2oHV
	8DoRNN12uLa1TXCMhuzv4XDkf67zS3dqE8tOuGbnGaaWxZI4B0rIoijr28ZkP+Ot
	4CnkSgwh4EuXKJmY+jpWhrOHszRvJCKwUYGzn0GP8IqfEnVxjd2Xzsz/JkawW8AQ
	9rdYXD1RaRU8oDuSVkrfqYtYX+KYzTTRCsUKw0d8kC7EZsURtxeClGOp5h2vduuv
	PT6Pjdn1FWFlkjCzAf4rJIAnj5uXDw9rhLGCfPq6RWRdf3y3f4EjbTCzFtnkRTd4
	lG9Nf0g3go90LYKcr/6uZHTTGshDsr8Ce47ySHa3zCvBqD5WdjDjGKyK8QgfAEqQ
	9SYf7g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnp5cn7r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 09 May 2025 12:36:48 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c54734292aso56639985a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 May 2025 05:36:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746794208; x=1747399008;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nj3eTuWQfQQ9acGARQe0moB1OSB4sNdWAMULwa+W20o=;
        b=NJe6iLHmkCVARWsykVJrSCUFR+ze0hKjrR1naujZ1z6ohsDdcf6MMgPmrMrGUCFgq7
         idnPgkecdlGVdOUCaJgQ1447sHv0cQh/brQc7xYCKvS4A/2NfT9rB1Ig2o2dGMAhQmuh
         sbRaG6hqs4MNVaEQRYLdc1k9XNesa15goQW3BlRq1A6jq84tbdFh/wNWLkgY5joXb0XQ
         YlU3WvWl4KFR//3hJACbn72R/2w+l0/DXqMjquNyiaqbOSm7K/qpHnwdgzXakG1ACq+S
         V7OSEvmwQq+FSkbABXXD+Mwmdd14Vq43kh1dqmPLZiWgL+VJq5x2n4TPgtGG26y+b2Pf
         RIYg==
X-Forwarded-Encrypted: i=1; AJvYcCVfq+D3jVGj/ByykfqYjlFwmakBaZXwxpA2F18iVmY/BpdRVNzI94gZS2ejNWK4QxkJbqHTLph8/yt3fpC+@vger.kernel.org
X-Gm-Message-State: AOJu0YxlQHZHmLEVme8DBtpyfJ5NBDuZTWgUKEDEYMlBJDFmAs6CrvhQ
	a46czhe7VOaB4qiCwTygHTty7LzkvK5cQVKPNLZMZNenghVnPEhQccVe2jyr2zy/dNxpiL3oLBe
	Wv1z92Ht88FNkDsHlZKri0s2/aHyUMg8DBbXSKN9vZKnLn2OO2ypAR5r5AJh5sf8/
X-Gm-Gg: ASbGnct1SnrXoxmAsQWiLRwV4i61Zpe7fEeNfdx3UkMNvgMtPAgBmDJPI5lumAy8/gk
	+jLLQwqwdCYMat6xXeMCjfTgB+METCmIFsxL+4DxUN9vvRRjtnwrcSEiaBEJnTQVr1+NVj4jm7q
	C1WtSCGb7SXlL2NVd0tav/3gZwyrSUsTLA+AuHQeTDPQ+TEwnB+B7tJNVsWz90xhncFey+Db1S5
	UOHIyOPafK+DIWv2mgbjBxbYB9qwqw+ohlGP7aOEhLRNKyp+XCyq53oGLqH+GyCA0WgVTdxD+yq
	Q3VCYeNX9uCWJS3RmxI2BlHE0XzU2hmTCll0jHEXs3La6X14oVfB+74yxGadi6CtyrA=
X-Received: by 2002:a05:620a:f07:b0:7c5:79e8:412a with SMTP id af79cd13be357-7cd010f40femr186040085a.2.1746794207715;
        Fri, 09 May 2025 05:36:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFQhiMLUJ0ERqiuafBgH55DApa66wpoH4lt5Gorw5mA7CwOWIVCyFKphnkpkg2Nv6S/CahJtw==
X-Received: by 2002:a05:620a:f07:b0:7c5:79e8:412a with SMTP id af79cd13be357-7cd010f40femr186037985a.2.1746794207301;
        Fri, 09 May 2025 05:36:47 -0700 (PDT)
Received: from [192.168.65.105] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad2192c83d9sm145517466b.28.2025.05.09.05.36.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 May 2025 05:36:46 -0700 (PDT)
Message-ID: <407a75cc-7a8f-4a45-adfc-fdc1b72185e3@oss.qualcomm.com>
Date: Fri, 9 May 2025 14:36:43 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT 06/14] drm/msm/a6xx: Simplify uavflagprd_inv detection
To: Connor Abbott <cwabbott0@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
References: <20250508-topic-ubwc_central-v1-0-035c4c5cbe50@oss.qualcomm.com>
 <20250508-topic-ubwc_central-v1-6-035c4c5cbe50@oss.qualcomm.com>
 <CACu1E7G8QEoadxOGOi22QCePR5C7X81wRZ2yzLGCaA8Um63ibA@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CACu1E7G8QEoadxOGOi22QCePR5C7X81wRZ2yzLGCaA8Um63ibA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Lu2Symdc c=1 sm=1 tr=0 ts=681df6e0 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=UaTn3js9I2XXQmNgdkcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: o2tEW45K_RDWY0YGpfkWPz0lDgFIGmcM
X-Proofpoint-ORIG-GUID: o2tEW45K_RDWY0YGpfkWPz0lDgFIGmcM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA5MDEyMyBTYWx0ZWRfX/hDYH1K6oI78
 SKxfOOAAvO67KP21pc67pNgTDKznpbLN56hOLFDZIv84js4E9Uf0b/AcTPABn+CuiR2z0UcQ1Iw
 kJzPSHZfFBMUDYw/6jiWbS16ixGm9+Rh6pp6gc5k9spcutQ0hGtBLtzx9QUeSsxFxCmXUHk+0//
 yZhHIoZQ9c+WUwZwu+v0NnCfJ44k1CL+R5TbmKiAnKZh64OJ02KwLZn/Ontvx7N1XdCJx5Sx4z0
 PKecnhQRnFF7wquz1qyhiRECRaJbpMy6jATEwiBz8uCRAVehyPGrBOT6QO2tH4MDzi+qSlCQGN+
 OuA9ciC13B+4gYrKYC4/oz9KgG446uNHPl4/OGdqEy/6JtmE8JUDsmlvuPpdlK6kih1xmQZ2aUC
 mimU9z/ODeRmzALelpq/A9F5P7eYdN5E4XLcWjAbmrfTulPOnA2SQ5B26STS3OnrZBajkcYn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-09_05,2025-05-08_04,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 mlxlogscore=867
 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0 malwarescore=0
 spamscore=0 impostorscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505090123

On 5/8/25 9:05 PM, Connor Abbott wrote:
> On Thu, May 8, 2025 at 2:13 PM Konrad Dybcio <konradybcio@kernel.org> wrote:
>>
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> Instead of setting it on a gpu-per-gpu basis, converge it to the
>> intended "is A650 family or A7xx".
> 
> Can we also set this based on the UBWC version?

Unfortunately that doesn't give us a 100% match

Konrad

