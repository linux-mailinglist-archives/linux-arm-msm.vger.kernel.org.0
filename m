Return-Path: <linux-arm-msm+bounces-57612-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD514AB3AE3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 May 2025 16:43:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 538B53B84A3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 May 2025 14:42:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A43AC229B0E;
	Mon, 12 May 2025 14:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RYLH6qmk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07FD5229B26
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 May 2025 14:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747060987; cv=none; b=It/JCSkdzRxIE7VLIZ66+mZvFIgMAA1dTDzktp8SFEaWiyBKGpRi6+BcM4FPDyKcswlZrAC50/UO2Y66x8t11yqcXHwCZDIEi8A1tXX3huzrq3EwjxZhHmXFGE61G8+rxBZCbCTesk47u2bnWlcARdaG/BwW6LzdbafIEUrLz6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747060987; c=relaxed/simple;
	bh=bwj5+mAqRjuGjBMyvAcBv0WTt7nuIWHgWGUjiJkGlaU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IEqi/frxriXp0SUjTxLaSLMMQrfY/kxTV6f5EwzGVdFpQsj9jsZIlsx4AsaZDa1+ikLwmSMo6ZcX8DzN3rL19nIKq0CVYWQkgVaWlkpQDRDox6yfK6FjBSU2z94LIQGYqjQq85fsjUZ/9CN0r8yMDa/pblmAAlcSgl4pRKHMQqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RYLH6qmk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54CA3JmF024806
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 May 2025 14:43:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	djREPE0sqvYKUCjrqfcQkeo21X9ODx3TwXhEw7tG1QQ=; b=RYLH6qmkSz4e4/1g
	l87B/O6n70JEljqOUJfC6vwSlyvX72sA1SK6K90jO3KbrlWHCtsylyVyMC/IfsEI
	pmXzNpZ9jf+Opkw67IIkcd+Bw6SlAjUtRPnCkZ1jvXY4QX+mQrr9xH5aU3VwG4pn
	JJB/s74c0pEMfZglyLjJfEDOn2lAIwBzD6xlLl3Bmk3o/t85rxE2B2zi6nmzbtSQ
	Ij3eJYzES7Zrf3CLJF6yTiwIPg/z4IR5c2M7h/a/oVkdRZzimm3aASU4fzbADtq9
	Os168NFT1TlHADdT4B86D6KDwFIILOCr0tdTYBHPC/ZMRB67OsisxdhGFfd6Prdp
	Sdi6SQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46hyynvhxx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 May 2025 14:43:05 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c53d5f85c9so118812585a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 May 2025 07:43:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747060984; x=1747665784;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=djREPE0sqvYKUCjrqfcQkeo21X9ODx3TwXhEw7tG1QQ=;
        b=lpJVSe8plgk1Xv8vPsz3GVa6rIHev6CemwmxYT/X9bRdPvhR9syxlEjV7yw/lncCYt
         /hVavH919s3mXn3EGrwRUsDOVFCEMbvXDFlm8muPN6+wiHjlQyAYFfp3SJeTAJvjcIYS
         Ew4YI4DC/L3hBzQ0XnvxhxwrhxT5IL9rmUKPbZR/1Fpo5BiByZzgZvUqLtNf3/YjGr7d
         erm5flXVJ4UevmnM0uC1k6pWhuGrkYOGGyuDNm7KrNW0uC7LPPZ6QpSM0zVZT0aQ2uH1
         8yjmwT66O/GGn0rEyLcggUp4NlJ73HCyaC0NHvK9vPiq66HLtez/vFopr/ykqK1fLR8L
         0eUg==
X-Gm-Message-State: AOJu0YzMq1RvPI1MQ7vgw/5ao0LtF9dQImn3C8EYtJQDtRr05jSGmER6
	S5FNE8M6qtqgkHbYm0/2UZPvzZcRj/yd7bpO+PVcmAs2/SX9LjxecPXybRF1kxTH0wgvINvZnGb
	fqpFHuQ06u7EjHl+X2IsLGfHgQU+Z03I10tYRUR/1RL3vJTDm/JA34MrQW4471kpb
X-Gm-Gg: ASbGnctoY8IcUL0pm38+og0f+7kVhQTfvzRwK/xbMvrrr33LXl63t0MCSQJ7U4AZyly
	2nzDyHV14gnMSBsQfwTuxXmGGJqEIcYXff6PeTcwM9dw7+o4eqJ1ntP/6Lr2ODRcDCXuttHgrIl
	SQ9rSLt4nUHk/l5CMLqHlKX/TmLxF0FsdEPq6O2gb9yqIyaxaJ781Ue6yF6OW1KZ19mIQXvYcN0
	RZd807fJGRGn1/b2o4CpvrKjf1admn3CTf5SzrR07IESJTUvJXXnIWHckNI7WerzgX2I/5t+Zel
	8Dr88WZQamPqgGwH2f/dNvUThhZc353zB4EMcj4n6fcz0KGPXsnqIJAeHJgP1jbvOKs=
X-Received: by 2002:a05:620a:24d2:b0:7c0:b43c:b36c with SMTP id af79cd13be357-7cd011053camr814294485a.6.1747060983787;
        Mon, 12 May 2025 07:43:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEWY6Cl5GMpMzeN8jV1HQ/TUtYeE13TFqO10nMiMdzZFvOrcbPNhOHTggYJdxF61Zyg9UNzUA==
X-Received: by 2002:a05:620a:24d2:b0:7c0:b43c:b36c with SMTP id af79cd13be357-7cd011053camr814292285a.6.1747060983233;
        Mon, 12 May 2025 07:43:03 -0700 (PDT)
Received: from [192.168.65.222] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad22c563e34sm492121366b.137.2025.05.12.07.43.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 May 2025 07:43:02 -0700 (PDT)
Message-ID: <83cf6202-0efd-4382-bd0c-3d196c4a0b9a@oss.qualcomm.com>
Date: Mon, 12 May 2025 16:43:00 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: ipq5018: enable the download mode
 support
To: george.moussalem@outlook.com, Lee Jones <lee@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250512-ipq5018-syscon-v1-0-eb1ad2414c3c@outlook.com>
 <20250512-ipq5018-syscon-v1-2-eb1ad2414c3c@outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250512-ipq5018-syscon-v1-2-eb1ad2414c3c@outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEyMDE1MyBTYWx0ZWRfX+ouT6sVazTbV
 WEdmzRnMW9BqRIDuyKX+CzwPbr9X72jkj81XL9KdKNI1qD0lOKh/cDhHK9W8FK1C+XyBb3iwup7
 KIsI0TD3ivRqffepC3FXoeaIhCoXw3SrPL3NM6C7KSO7ZXGdKRfVrSxq3FXY58fI9X5hhDyn5pK
 atH05sJWJPUDWFFefw0QeWEpyvmkteLTCCQZygriuGIudEbBBbR2aYJC6s/KKzQKKp3RdtyPfZc
 qnTKGFpU6p81jvnm04xsrk1evStmPLtne+AmitXHxb+RBlQelZPb/z2n4JFYtkBwKsKY+c91nN0
 LH1KMJ4hcHcb9VhuprJSFW1pLb3GletYQTXh5oVZpKIxl71xot1W1yc3bs9wH4FZKh1O/0mUVIy
 pyiP38uflnPsSwasTvOoYDvugIZVcy6dNEuQwY64E10pYa0AfajYB6GluoQk1Lg9j8YXUIgB
X-Proofpoint-ORIG-GUID: RUxxtwoPSDECJEwMDGfY-jenDcEqEdxX
X-Authority-Analysis: v=2.4 cv=Uo9jN/wB c=1 sm=1 tr=0 ts=682208f9 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=UqCG9HQmAAAA:8 a=EUspDBNiAAAA:8
 a=WWQFUNGd85j635JlVwcA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: RUxxtwoPSDECJEwMDGfY-jenDcEqEdxX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-12_05,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 mlxscore=0 adultscore=0
 impostorscore=0 suspectscore=0 bulkscore=0 spamscore=0 mlxlogscore=639
 lowpriorityscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505120153

On 5/12/25 4:36 PM, George Moussalem via B4 Relay wrote:
> From: George Moussalem <george.moussalem@outlook.com>
> 
> Enable support for download mode to collect RAM dumps in case of a
> system crash, allowing post mortem analysis.
> 
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

