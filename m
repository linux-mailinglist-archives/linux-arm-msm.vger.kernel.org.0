Return-Path: <linux-arm-msm+bounces-41908-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B54599F063F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 09:22:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7775F281AFB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 08:22:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 636F21A8F79;
	Fri, 13 Dec 2024 08:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="CLm2AnAF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE8B619993E;
	Fri, 13 Dec 2024 08:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734078163; cv=none; b=rJhYdQ5H1qS0b0pZgxoeOMgjB4dEjZhvRh3FYDg+uHm648olWOIkAddvN+vecqHo7cGKBi453cQ9Z8gMXigRCqvlNxrOKc0j5cChGHPTrIxclnE9zNSs3/vmeatv8VpB8DV6uLAkPHfLoKeburraVC4/ekiTVAcNMITkOx6MVoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734078163; c=relaxed/simple;
	bh=9+mtr1FbR4lFF1BHbpaxuyw0l5k/bfu6BVCTbLKrS2I=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=U6ZAjSnl0uBuVZGPolf+IvXZRWDalFfLzOr7oxql2CQw6LWYcAyIKodSwtaNn8Ui1bFjoOlwHGTomBhYLvZVC4b66HaCIrniKvODfwLWME0f/WYejn4a6dALEkXy+F2oOeBr5Qy2MqCwujwJNcTn7jhEsFNehaLaxh/9agSqnXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=CLm2AnAF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BCKe4xf031415;
	Fri, 13 Dec 2024 08:22:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qhB1rfra3QW06FFZ0hHDMb2euq+i2W3Q6ykFpHn8BH0=; b=CLm2AnAF4DMRJ6VR
	Sun8Z0wbaLCKsxu1xoZlbrXZ5tUqi0i6v60T2JYqYyPcuXRvhJhMHq40PYwoeUm3
	tJcKtdjOVmWtwEdQdyib4gIugRBev1PjQiIFnlFaq+S8JigQO7EmMN5QUc3CA4ac
	3BoqCl8l7NsjKkLvmGuxq4xAfKZahI71yW2cCok6Rxuqsxv3oKrDSy1bv64mfgPD
	QBwx9rgWB+kcPbfdjUIstW8S52brWe0avt6goqXNwigBUckTn1KPJren1PWU0GXU
	vHjUUuo4I0LlFQ+Ila4aQsBRyWV36eQPCtCVoK5QvwU0AocsHGQgQ7Akki6xASky
	LGRd5Q==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43fwgek36b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Dec 2024 08:22:38 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BD8Mc47032576
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Dec 2024 08:22:38 GMT
Received: from [10.64.68.153] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 13 Dec
 2024 00:22:34 -0800
Message-ID: <51fd15b5-70f9-4a23-a871-a40dde4a5b77@quicinc.com>
Date: Fri, 13 Dec 2024 16:22:32 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: Add coresight nodes for QCS8300
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20241205084418.671631-1-quic_jiegan@quicinc.com>
 <47154b48-8393-423d-bd4b-4d56fc18400c@kernel.org>
Content-Language: en-US
From: Jie Gan <quic_jiegan@quicinc.com>
In-Reply-To: <47154b48-8393-423d-bd4b-4d56fc18400c@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: -sKGnQXxHWsyhBWi9HRLpUdJAtMfHGWQ
X-Proofpoint-ORIG-GUID: -sKGnQXxHWsyhBWi9HRLpUdJAtMfHGWQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 bulkscore=0 mlxlogscore=857 spamscore=0 clxscore=1015
 impostorscore=0 mlxscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412130056



On 12/13/2024 4:09 PM, Krzysztof Kozlowski wrote:
> On 05/12/2024 09:44, Jie Gan wrote:
>> Add following coresight components for QCS8300 platform.
>> It includes CTI, dummy sink, dynamic Funnel, Replicator, STM,
>> TPDM, TPDA and TMC ETF.
>>
>> Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>
>> ---
>> Changes in V2:
>> 1. Rebased on tag next-20241204.
>> 2. Padding the register address to 8 bits.
>> Link to V1 - https://lore.kernel.org/linux-arm-msm/20240929-add_coresight_devices_for_qcs8300-v1-1-4f14e8cb8955@quicinc.com/
>> ---
>>   arch/arm64/boot/dts/qcom/qcs8300.dtsi | 2150 +++++++++++++++++++++++++
>>   1 file changed, 2150 insertions(+)
>>
> Please use subject prefixes matching the subsystem. You can get them for
> example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
> your patch is touching. For bindings, the preferred subjects are
> explained here:
> https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-patches.html#i-for-patch-submitters
> 
Sure, I will update the subject prefix to "arm64: dts: qcom: qcs8300:"


> Best regards,
> Krzysztof

Thanks,
Jie


