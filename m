Return-Path: <linux-arm-msm+bounces-36259-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 96B3F9B4223
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Oct 2024 07:09:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3C0AB1F233A5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Oct 2024 06:09:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2552E201027;
	Tue, 29 Oct 2024 06:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ftBBUqrm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A62E07464;
	Tue, 29 Oct 2024 06:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730182144; cv=none; b=jd4z7Siupk/YJNV+Y9BE1ZWv1gfz9JcaUqvx99hC1HgLKgjPSWjA15OAizhWIh01N/brniu4P4RsTH8Ww9Ir7Gkbcw4n7sK7QJ/TOEj+j/maOOPx4dghmtfeq93XVJ6MZAqLcAGzweonBda92aa0DKfwEJ2J66dKtfKZAtgbq8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730182144; c=relaxed/simple;
	bh=wwR+ydtsPTf5mZdslw+yFqLNdvviEtqZG2hcmZESksE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=d74XU5h4lz5m1UH0JwvjUhiybyXRcv3F7P6yuRk5LaHui2U5HNxKz7h+Ny8FQ4KKYU1OjgJABQsvPUOmDmuJI3R1FaaXkVduYBRN4vAoHBLBLN2dbBSz1jkJJzsV5ARfAV//c5auQEZ/wlyeD7mPAFspsDR5qKddPeiltrJqmHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ftBBUqrm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49SJhrJS019225;
	Tue, 29 Oct 2024 06:08:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8rfiywrYAqS+ll+TtY46Ca2fgi4aNwqBa+VTuRHmt2w=; b=ftBBUqrm5dhSVsa1
	dkJtCeZClGvYUe1ReZ4Q+Zim9XkqdEQKPszJm0sMYn5kcXmQY3+YPBU4fFGna2Ef
	TycVHfeMBx3NJIQ/ged9hgLC+PQZNPvaNh7RjGi6LsKJ2veJxhQm4C2pe7kICtA1
	tPly6f8GIbpvYy4txUJdnjq4zHdl9Xe5YaDQvDTYajZKM0NcPa+KJM0JAKawibI2
	74TVhkykdM/iHnfTxDzvyRanyrjflcl3hnf4gyuX8idK0nlCsuF+mrtz4vNnhwKc
	Oky5K2qx5ufSv3FqdCQ6Zt2/kDr4dyErB/l0KkkCLfgz5rvSycK2OhrBU6RxUIMk
	v9AKqw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42grn4ye4q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Oct 2024 06:08:56 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49T68ttK031166
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Oct 2024 06:08:55 GMT
Received: from [10.204.67.70] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 28 Oct
 2024 23:08:51 -0700
Message-ID: <fad3508a-bb02-4162-8803-fba5de25e752@quicinc.com>
Date: Tue, 29 Oct 2024 11:38:49 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: sa8775p-ride: Enable Display
 Port
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_riteshk@quicinc.com>,
        <quic_vproddut@quicinc.com>, <quic_abhinavk@quicinc.com>
References: <20241008112516.17702-1-quic_mukhopad@quicinc.com>
 <20241008112516.17702-3-quic_mukhopad@quicinc.com>
 <zluuezrywecffsh3f7yzrtvd2sa3nyzl52sk6bluvjch5icvuu@noecozosseko>
 <e7543055-316e-447e-ab0e-15d2fdd19dca@quicinc.com>
 <CAA8EJpqcnxbZAUJm0fdbQNjZ3Dw189oDMkC+0pMLz1XGO7HhnQ@mail.gmail.com>
From: Soutrik Mukhopadhyay <quic_mukhopad@quicinc.com>
In-Reply-To: <CAA8EJpqcnxbZAUJm0fdbQNjZ3Dw189oDMkC+0pMLz1XGO7HhnQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Pex_-xe5lo-J_Il77HN-WSKvTRynJV8x
X-Proofpoint-ORIG-GUID: Pex_-xe5lo-J_Il77HN-WSKvTRynJV8x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 mlxlogscore=704
 malwarescore=0 clxscore=1015 bulkscore=0 suspectscore=0 adultscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410290047


On 10/28/2024 3:15 PM, Dmitry Baryshkov wrote:
> On Mon, 28 Oct 2024 at 10:49, Soutrik Mukhopadhyay
> <quic_mukhopad@quicinc.com> wrote:
>>
>> On 10/8/2024 5:46 PM, Dmitry Baryshkov wrote:
>>> On Tue, Oct 08, 2024 at 04:55:16PM GMT, Soutrik Mukhopadhyay wrote:
>>>> Enable DPTX0 and DPTX1 along with their corresponding PHYs for
>>>> sa8775p-ride platform.
>>> What is connected to those DP lanes? If they are routed directly to the
>>> DisplayPort connectors, please add corresponding devices (see
>>> dp-connector).
>>
>> We are defining the functionality of gpio101 and gpio102 as "edp0_hot"
>> and "edp1_hot"
>>
>> respectively. This ensures that the hot plug will be directly routed via
>> the display interrupt
>>
>> line "mdss0" to the display port driver and no external dependencies on
>> dp-connector is
>>
>> necessary.
> Please describe the hardware, not the driver necessities.
> If the board has a DP connector, please add the node. E.g. it allows
> one to specify the label and the type used by the connector.
>
> Also could you please fix your email client so that you don't have
> strange/unnecessary line wraps and empty lines?

Addition of DP connector node with the hpd-gpio property does not allow 
hpd to be detected since the gpio

101/102 have the "edp0_hot" as function. If the hpd-gpio property is 
removed from the DP connector node,

the probe of DP connector will fail.


>

