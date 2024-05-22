Return-Path: <linux-arm-msm+bounces-20186-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 422698CBD7D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 May 2024 11:05:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 730DB1C20D71
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 May 2024 09:05:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93AF480023;
	Wed, 22 May 2024 09:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="cuvg+Tu5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 197817D3E0;
	Wed, 22 May 2024 09:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716368735; cv=none; b=Rl7weVOtqXOCFkmmMyUfhEerqD7mXhQKTI3jX1Z1fS+gCH/xUyOhUagtrC2oiCGc8u1VlRKW5ckU0o0j0YWVBUpwaVTQatxlaeDrJiwpBtTc5Uvv+rvCnMTWvkFnhCxYDp7bbOS40f+9zVa4I+UO6Lo0H0659QWLSyf869xeu+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716368735; c=relaxed/simple;
	bh=XT9Irt0hYUdqhK8+3O/4E15E46G1SyYY6IpTyBnyMYc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=eAQ8gw3r6MhuyjhBGyi7fSa/G1CkKBcwZWL80s1q8olnfFthRRIjNa1nySa814G/QTKucANLVkWlgH0v6IQO63uUD0XeH5Bd4fLdJjGbZEUsoi+UW0zPT3cJqAgtwlTZsgg9XhYBFqPrvelCVboilE8S5+8BVtAmvcbUXtvG7ts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=cuvg+Tu5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44M01hQZ010741;
	Wed, 22 May 2024 09:05:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=bEY8lSCUo4tsUCTd95BKCu1ICtNyR8s+DFBlmuNGtiU=; b=cu
	vg+Tu5shdymFnVUu8iV4hVRcX1LchmwlKm9OBIavxq6RZnapwxqKxIrcZaC3Ev01
	F+7cfB4lKsqrcZZXMs15y/0CAsJsPYtX+J+ud2KEXH8ABV76mqdSWgnV3H60AsRn
	Su5vOpyAMP2u+SMh9NSYL8EOtH9yNo8VPWelXM6oohAOW7gQPo7B9iCxqGzgNT89
	lOeUBCEugYoRU1HyjAFHW+qj448RimoZpOjQsxTFcu1Gl5t89AnpGSEsUSEGnJBt
	kQn0SDnbl2S2mEGGt1iRagGiELsep/zxW6uFkv6psYBoyzUu1P3azDLKwUU3EVsE
	GhE/7M8lj/6CGl1L8eHQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y6pqc8qqu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 May 2024 09:05:25 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44M95OtE010558
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 May 2024 09:05:24 GMT
Received: from [10.214.67.37] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 22 May
 2024 02:05:22 -0700
Message-ID: <baa55c1f-2670-4a3c-abcf-ea4e841e4a1e@quicinc.com>
Date: Wed, 22 May 2024 14:35:21 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: qcom: icc-bwmon: Update zone1_thres_count to 3
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_rgottimu@quicinc.com>
References: <20240522081508.1488592-1-quic_kshivnan@quicinc.com>
 <bc973b4f-fe8b-44e5-afbc-f3ce8a6fc873@linaro.org>
Content-Language: en-US
From: Shivnandan Kumar <quic_kshivnan@quicinc.com>
In-Reply-To: <bc973b4f-fe8b-44e5-afbc-f3ce8a6fc873@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: qkJd6EG-cd75Ayr1Og0tPIR1_IKkJ-er
X-Proofpoint-GUID: qkJd6EG-cd75Ayr1Og0tPIR1_IKkJ-er
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-22_03,2024-05-21_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 mlxlogscore=961 malwarescore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405220063



On 5/22/2024 1:58 PM, Krzysztof Kozlowski wrote:
> On 22/05/2024 10:15, Shivnandan Kumar wrote:
>> Update zone1_thres_count to 3 from 16 so that
>> driver can reduce bus vote in 3 sample windows instead
>> of waiting for 16 windows. This is in line with downstream
>> implementation.
>>
> 
> This might make bwmon quite jittery. I don't think downstream is the
> source of truth here. Please provide some measurements *on mainline tree*.
> 

Hi Krzysztof,

The 16-window (64 ms) waiting time is too long to reduce the bus vote.
At higher FPS, there will be multiple frames in 64ms e.g. 4 frames at 
60FPS in 64ms. Hence, delay of 64ms in decision making will lead to 
higher power regression. I’ve tested this change for 4K video playback 
on mainline tree, and there’s a significant power-saving.

I propose to make it a tunable,so that user space can tune it
based on runtime depending on fps.

USECASE                     zone1_thres_count=16     zone1_thres_count=3
4K video playback           236.15 mA	             203.15 mA

Thanks,
Shivnandan

> Best regards,
> Krzysztof
> 

