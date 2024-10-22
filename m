Return-Path: <linux-arm-msm+bounces-35322-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2194F9A97E7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 06:31:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C10121F23C54
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 04:31:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1290C8003F;
	Tue, 22 Oct 2024 04:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="czdyb2K4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6259C8002A;
	Tue, 22 Oct 2024 04:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729571491; cv=none; b=so35gipMFtjb8/YK+bq13Hxt2eKj3bLeLxAbjKdr3oivKiINjbOiuabibywLKT6rsEhZVa8qIN91szioX/bGMSxO5fS3KCQyTekArO00GIGlfnjLSPrKMTuRBvJ6fdc1FjWaRXccK2ooItg2PrbD+JwwUM2o70mXAY+yefd1+QQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729571491; c=relaxed/simple;
	bh=xZoHbrKmig+5nmpk1WocTQRf5OEtGSwALU08ezJUsqw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=qgauLKGSEbVVOHWONCd0HGx9ZG0EE/Kea7PCzU7UlhhX2iyza64+ZawZgXkeZs4alCYbsdU3m7jCsoML9DcMIzJGY1KMaNhv+yFl+XTsBIvXckR9JEwU4xd7L/3Nln9bX+y3MrUicVqbqSGsl4ih4BEx/meepzO1t+teim3bvCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=czdyb2K4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49LJrnqV017139;
	Tue, 22 Oct 2024 04:31:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6h5iGtO94+T34vjXeQ8JgZMIZwPeD65QwF7Tw1HNYwg=; b=czdyb2K4Idbpg+Gb
	RkZCcBFjZk72QTdEdWd0ruM5hCam+s+xGC7/E1rFwYS2akAdk/nlIWC1708VZqD2
	FWFahc6KRfl3b3SOMVoruTR+Q56L/Ov0oxE/ZMPezDNHpPdZjNWbFQiGY9JZ3Ztr
	Y2pi0P70P8aTXEs0SkxeeUyxGW357pYbVAGex+JQwYSnq9du26CsaWc1kiNVSXJi
	ATxQ8/5k2HOsn2OW+uupFaH+vdx5jBnY+Zz1wiC+Ypu5J28qhtLEL4k/2zyzISwC
	Z8g3jY7wzKvEIt3OohIlKe4+Q2qtNfom7i0I0B0f8J9eXQFx3jzucQIoUSvJZGQ8
	zu9kjQ==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42dmdqas50-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Oct 2024 04:31:25 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49M4VOep030279
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Oct 2024 04:31:24 GMT
Received: from [10.216.44.181] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 21 Oct
 2024 21:31:20 -0700
Message-ID: <a7410975-cc74-493d-b0c4-5dbd3eb43c8d@quicinc.com>
Date: Tue, 22 Oct 2024 10:01:17 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] dt-bindings: clock: qcom: Add QCS8300 video clock
 controller
To: Rob Herring <robh@kernel.org>
CC: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Ajit
 Pandey" <quic_ajipan@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Satya Priya Kakitapalli
	<quic_skakitap@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20241018-qcs8300-mm-patches-v1-0-859095e0776c@quicinc.com>
 <20241018-qcs8300-mm-patches-v1-5-859095e0776c@quicinc.com>
 <20241021181641.GA874673-robh@kernel.org>
Content-Language: en-US
From: Imran Shaik <quic_imrashai@quicinc.com>
In-Reply-To: <20241021181641.GA874673-robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: GDfbSgFSE5uVNNJj8G4BZX2zwyHwjdLB
X-Proofpoint-GUID: GDfbSgFSE5uVNNJj8G4BZX2zwyHwjdLB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 priorityscore=1501 spamscore=0 mlxscore=0 phishscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 adultscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2410220028



On 10/21/2024 11:46 PM, Rob Herring wrote:
> On Fri, Oct 18, 2024 at 04:42:33PM +0530, Imran Shaik wrote:
>> Add device tree bindings for the video clock controller on Qualcomm
>> QCS8300 platform.
> 
> That's obvious reading the diff. How is it different from the sa8775p
> version? It must be different or you should have a fallback compatible.
> 

The QCS8300 Video clock controller is mostly identical to SA8775P, but 
QCS8300 has minor difference. Hence, re-using the SA8775P VideoCC for 
QCS8300. I will update the commit text with the details and post next 
series.

Thanks,
Imran

>>
>> Signed-off-by: Imran Shaik <quic_imrashai@quicinc.com>
>> ---
>>   Documentation/devicetree/bindings/clock/qcom,sa8775p-videocc.yaml | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/Documentation/devicetree/bindings/clock/qcom,sa8775p-videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,sa8775p-videocc.yaml
>> index 928131bff4c1..07e5d811d816 100644
>> --- a/Documentation/devicetree/bindings/clock/qcom,sa8775p-videocc.yaml
>> +++ b/Documentation/devicetree/bindings/clock/qcom,sa8775p-videocc.yaml
>> @@ -18,6 +18,7 @@ description: |
>>   properties:
>>     compatible:
>>       enum:
>> +      - qcom,qcs8300-videocc
>>         - qcom,sa8775p-videocc
>>   
>>     clocks:
>>
>> -- 
>> 2.25.1
>>


