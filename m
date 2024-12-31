Return-Path: <linux-arm-msm+bounces-43736-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1312E9FEF01
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Dec 2024 12:06:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F3AA71882595
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Dec 2024 11:06:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7877190678;
	Tue, 31 Dec 2024 11:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="naELv3y4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00A042114;
	Tue, 31 Dec 2024 11:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735643177; cv=none; b=EHaBvdR+iZqSMK7BfPB7FXmzwxHj/EvwhUp/2LGOyNE60S8KcGIXY25aAfOQeTmeuPQFiVrTGQX7TmRk/J1OC2qUhXQ3oipoIv8PNFwcdV4lCp4pmIyZmcegE1ozE+7fiOHle51yxpWE5gTYjPW8qIilgRDm03dd/WGyX5npLt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735643177; c=relaxed/simple;
	bh=6LMVRMYxBYH/1X1FjOXjcWNBk+NXyI+asDilyVY8QWE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=RELRhkHgPvHu2lgqEWBKB9mi7P9O7nQHn/U/hdTmZpZ0OdhVw2fsoaIgrKqgwfffochDIdos+dMinjA7rsTievX0bz3F+KNiIOb0n7U6cuFJUvzqhDgEpBrGriq5dtHwFqOQLNp07QJVDDIUcF6yCf3kze7p3OCVlsC2AAZxAC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=naELv3y4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BV32wMq024218;
	Tue, 31 Dec 2024 11:06:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3MBsV3dbCMTCDXJUbU6DZlHetW1ARbicxMRruxZ+pPE=; b=naELv3y4jyWFHTIm
	G+kCima3hKJMVJy6r5e4y0JXWlI6rtWk1DcgSNnaOQsAhLpveLoBZaYmYXs6ZSkP
	8XfChhPQ3FKAR8S93+wmMAJap0GmUUIIWiighV8UEyegG/19HKJ0y61JEmAL2Kdy
	1SueOlPRzHMjQ8yk6j4cwLEz1tzVTv6oZ+XSo49aWHfuFVxn+Vo5FMFI/XZ3Np4i
	ofsdW/rhfAjyuQQSM5iTk5HrGWZXXmUdTNe+/aG8UuZpyHJFBmPoQul1rFWCPye/
	J13TdiGOCMpXfXxORsT1irdEGAQk/iDtFWmJdgwMklzx14+FRGi70R3T4j3QowLO
	ZhSZaw==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43v8c3gyy1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 31 Dec 2024 11:06:09 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BVB687G016255
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 31 Dec 2024 11:06:08 GMT
Received: from [10.216.1.202] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 31 Dec
 2024 03:06:01 -0800
Message-ID: <af982662-85c0-5d21-be40-44cbc8401678@quicinc.com>
Date: Tue, 31 Dec 2024 16:35:48 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v5 6/6] arm64: dts: qcom: Enable cpu cooling devices for
 QCS9075 platforms
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Wasim Nazir
	<quic_wasimn@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        "Konrad
 Dybcio" <konradybcio@kernel.org>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <kernel@quicinc.com>
References: <20241229152332.3068172-1-quic_wasimn@quicinc.com>
 <20241229152332.3068172-7-quic_wasimn@quicinc.com>
 <dc6876f2-ede8-4105-86fd-fd7060d9e7fd@oss.qualcomm.com>
From: Manaf Meethalavalappu Pallikunhi <quic_manafm@quicinc.com>
In-Reply-To: <dc6876f2-ede8-4105-86fd-fd7060d9e7fd@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: JeVKayQ_ib3wMVa8ZZr5wC2xko-DNn8n
X-Proofpoint-ORIG-GUID: JeVKayQ_ib3wMVa8ZZr5wC2xko-DNn8n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 priorityscore=1501 mlxscore=0 bulkscore=0 adultscore=0 impostorscore=0
 mlxlogscore=572 spamscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412310093


Hi Konrad,

On 12/30/2024 9:05 PM, Konrad Dybcio wrote:
> On 29.12.2024 4:23 PM, Wasim Nazir wrote:
>> From: Manaf Meethalavalappu Pallikunhi <quic_manafm@quicinc.com>
>>
>> In QCS9100 SoC, the safety subsystem monitors all thermal sensors and
>> does corrective action for each subsystem based on sensor violation
>> to comply safety standards. But as QCS9075 is non-safe SoC it
>> requires conventional thermal mitigation to control thermal for
>> different subsystems.
>>
>> The cpu frequency throttling for different cpu tsens is enabled in
>> hardware as first defense for cpu thermal control. But QCS9075 SoC
>> has higher ambient specification. During high ambient condition, even
>> lowest frequency with multi cores can slowly build heat over the time
>> and it can lead to thermal run-away situations. This patch restrict
>> cpu cores during this scenario helps further thermal control and
>> avoids thermal critical violation.
>>
>> Add cpu idle injection cooling bindings for cpu tsens thermal zones
>> as a mitigation for cpu subsystem prior to thermal shutdown.
>>
>> Add cpu frequency cooling devices that will be used by userspace
>> thermal governor to mitigate skin thermal management.
>>
>> Signed-off-by: Manaf Meethalavalappu Pallikunhi <quic_manafm@quicinc.com>
>> ---
> Does this bring measurable benefits over just making the CPU a cooling
> device and pointing the thermal zones to it (and not the idle subnode)?
>
> Konrad
As noted in the commit, CPU frequency mitigation is handled by hardware 
as a first level mitigation. The software/scheduler will be updated via 
arch_update_hw_pressure API [1] for this mitigation. Adding the same CPU 
mitigation in thermal zones is redundant. We are adding idle injection 
with a 100% duty cycle as an additional mitigation step  at higher trip 
to further reduce CPU power consumption. This helps device thermal 
stability further, especially in high ambient conditions.

[1]. 
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/cpufreq/qcom-cpufreq-hw.c?h=next-20241220#n352

Best regards,

Manaf


