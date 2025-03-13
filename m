Return-Path: <linux-arm-msm+bounces-51273-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 429E3A5F288
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Mar 2025 12:35:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D105D189097E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Mar 2025 11:35:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5638A266B6F;
	Thu, 13 Mar 2025 11:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="pNjmuSei"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDCB1266B6A;
	Thu, 13 Mar 2025 11:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741865542; cv=none; b=UU8Ha/JNwx1K8I9UQueVArRXNymjjZETceaKUImdAT3BjoDTKJjJaNBZ7RSwA97rezCHjpstEWMVy7jiDGaqSWJAiwL6jSDBlYeLBgVgvFZzKnClg+Bjt4aC/dYl2Jf3HRTBvpEfgBuxjQjQ6sE2BmQ8DcBI6WtrXkI3/u5I8lU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741865542; c=relaxed/simple;
	bh=fM4QYfPQ1bBbkSkVISILbjMOl49/kv8ZtBWR8osWA+Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Mm/LFLkNhk58uk+eaj9DkMQxCAAcX+4X+ZllnZ/tkMH4IP1B17xmUDV95BYGWecE+wPKy7TcWZxKUb9OJi+9RodVTjsuDMbBLSGfLf1cMrUciomyZoA4hbiNyLgyuIh8U/ttuW/6rMQvd+R0HUGHEn9Kkms5T+v/bPBFBgjkK9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=pNjmuSei; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52DA6o2k003907;
	Thu, 13 Mar 2025 11:32:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ERixX6tJdx2Kfg4RHPvtkPgHxFglQd9DjzGK1XMwB/4=; b=pNjmuSei2Y0fGU4h
	bJkZG+Z7B4DwYRnHapmeyv08j5h6TfuCMd8xfLQQuwULG2ocIF7+kbxTSQVRLtCr
	1dsZa3mWskpAG6Ev8eEZpipIN8hIu7ebHXPDyKkr+rY9fqLamu+1ykwiM3XLxobB
	Asnp9iNBcffhyvLSG8wXLg+w+/keTDMcKffRwY/gNKO04G4XyKrDqjRt23pzyJbT
	ckrhOKFuN1JiugLHLQrZz85ejIFEaTWMnCUuVoJ9WbiDq1AL4BMSucQUJq3zniNH
	fRBr2w2qy0seLgG0jLq+DgSpdJ9RVR1p4WeHXuTVrlk60qy0mz42dNl4hhHFCKkh
	xAkLVQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45b96ybjp3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Mar 2025 11:32:15 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52DBWFl9020529
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Mar 2025 11:32:15 GMT
Received: from [10.217.216.178] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 13 Mar
 2025 04:32:11 -0700
Message-ID: <bcac64a4-63ba-4049-96f9-eea519455af3@quicinc.com>
Date: Thu, 13 Mar 2025 17:02:08 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sm8550: Additionally manage MXC
 power domain in camcc
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>,
        Vladimir Zapolskiy
	<vladimir.zapolskiy@linaro.org>
CC: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Jagadeesh Kona
	<quic_jkona@quicinc.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-clk@vger.kernel.org>
References: <20250303225521.1780611-1-vladimir.zapolskiy@linaro.org>
 <20250303225521.1780611-3-vladimir.zapolskiy@linaro.org>
 <dbxvzgqs5slrl5edqunal3wplg5jiszqv46dr4nzgowwlhkhxa@qwtfq7nfjwfo>
 <59b2553f-adbe-4a92-b7a1-8b388c03ef6b@quicinc.com>
 <93458252-956b-4630-957b-784cac4ca7ad@linaro.org>
 <b1be6e61-c620-4df0-810f-036c3c28561d@linaro.org>
Content-Language: en-US
From: Taniya Das <quic_tdas@quicinc.com>
In-Reply-To: <b1be6e61-c620-4df0-810f-036c3c28561d@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 1UxilPbRhoWcAzsE_TDoymVkiiFy6Y-q
X-Authority-Analysis: v=2.4 cv=I+llRMgg c=1 sm=1 tr=0 ts=67d2c23f cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=Za-vHGXcokoDKIOC2BAA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 1UxilPbRhoWcAzsE_TDoymVkiiFy6Y-q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-13_05,2025-03-11_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=521
 lowpriorityscore=0 adultscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 spamscore=0 malwarescore=0 mlxscore=0 suspectscore=0
 phishscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503130090



On 3/13/2025 2:55 PM, Bryan O'Donoghue wrote:
> On 13/03/2025 09:10, Bryan O'Donoghue wrote:
>> On 13/03/2025 04:39, Taniya Das wrote:
>>> power-domains = <&rpmhpd SM8550_MMCX>,
>>>         <&rpmhpd SM8550_MXC>;
>>>
>>> Once the above change is incorporated, please add
>>>
>>> Reviewed-by: Taniya Das<quic_tdas@quicinc.com>
>>
>> Why does the ordering matter ?
>>
>> It shouldn't, right ?
> 

The ordering does not matter, it is to keep the newly added domain at
the end.

> Being clear.
> 
> I just want to check that you aren't implying a dependency between the
> two domains, its just alphanumeric sorting you mean here, right ?
> 
> ---
> bod


