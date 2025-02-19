Return-Path: <linux-arm-msm+bounces-48483-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D02BA3BB01
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Feb 2025 11:01:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B31801885AE0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Feb 2025 10:01:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA8BF1CAA6D;
	Wed, 19 Feb 2025 10:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="fDcp4E15"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61D9B1B86E9;
	Wed, 19 Feb 2025 10:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739959260; cv=none; b=jTBEZmAGT1Tq+I+Wt4q7cp10+6hphNxk5CVTQAkgmB9Lk8IY8BfNXXRZ6P74gat2AtWxP3/dEO/u5Jk2zZsAwc7aQFDOc4OAm2QNLreTtLI+fRhjB6zJP2PiglGsDqbINOk+x6cSSL0elEkg1FT9Jo8O7jRo8EvOuSrx7HOKkeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739959260; c=relaxed/simple;
	bh=+9A6KT9c6tYh0vvXQTviVa21IvFFL2MuvcUoRwUqcTQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=uBncYpXaT3/NoaRWfAXM7oxro4vrxJDdh37GBzH4IjTsCHjHkwOH+ipcdCqt6XhwKbE3mYoWu2Iiug3YHi5kg7tBZ+ZpX8xlHwZgLXvdBtLMju+zo7EcqmaINIi85KtO79PnpthabRjWMwfXAlB9L1lV7rduQH9c/taYqhWDBJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=fDcp4E15; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51J8KFbo011661;
	Wed, 19 Feb 2025 10:00:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kONlORsbzcldRcq1vJWx9kOv30pV6zKsVjvecUABq0Q=; b=fDcp4E15SIcomS8j
	apyRcVwaVE2OjMN6pI2fANDxQilGLuyONSmdA2GkT2JWtQ1LbCDRkM56bMuEYuqa
	pnvMKJSqEADgRXuRzuUth9y5QySQ80tGyw00cUApxutjrZqKT0/nyYO+S57+vvCY
	Fo5BeKXqtBr0IQhKmYG1r2vZ0rYYtWXyTQmkqThfnq9qSxJekea4PLrDAc5UqOYP
	SpZv8AG4Soa7A3uDUD6bb7BK6M8Wcc/RYXnRKgAf37LRPKuOtoy8LLSp688E1Oyk
	JWM/dzsl54otAdRfFnu+/VbsxXA7nLUcOQHaGPX3Fz1rEOgZllWVY708IvCeatVS
	b4ORuA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44vyy3j1c9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Feb 2025 10:00:47 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51JA0kHx031669
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Feb 2025 10:00:46 GMT
Received: from [10.64.68.119] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 19 Feb
 2025 02:00:40 -0800
Message-ID: <4278573e-4919-4dfb-a916-871e4bf1de42@quicinc.com>
Date: Wed, 19 Feb 2025 18:00:37 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: qcom: qcs8300: Add support for stream 1
 clk for DP MST
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Rob Clark
	<robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        "Dmitry
 Baryshkov" <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        "Marijn Suijten" <marijn.suijten@somainline.org>,
        David Airlie
	<airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250212-mst_qcs8300-v1-0-38a8aa08394b@quicinc.com>
 <20250212-mst_qcs8300-v1-4-38a8aa08394b@quicinc.com>
 <9c188b0a-5137-4f8d-b8c7-2eb31c5b8424@oss.qualcomm.com>
Content-Language: en-US
From: Yongxing Mou <quic_yongmou@quicinc.com>
In-Reply-To: <9c188b0a-5137-4f8d-b8c7-2eb31c5b8424@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: X52OSTLJx2MhPbntYvIzliqW28tHzBOC
X-Proofpoint-GUID: X52OSTLJx2MhPbntYvIzliqW28tHzBOC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-19_04,2025-02-18_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 mlxlogscore=835 bulkscore=0 mlxscore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 malwarescore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2502100000 definitions=main-2502190078



On 2025/2/13 7:41, Konrad Dybcio wrote:
> On 12.02.2025 8:12 AM, Yongxing Mou wrote:
>> Add 2 streams MST support for qcs8300. Compatile with qcs8300 dp
>> controller driver and populate the stream clock for qcs8300 DP0
>> controller in MST mode.
>>
>> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
>> ---
> 
> Please add all required resources for quad-MST operation
> 
> Konrad
Goit it, Thanks.

