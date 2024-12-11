Return-Path: <linux-arm-msm+bounces-41456-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 61DDA9EC949
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 10:38:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 78BA3281A77
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 09:38:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72ACB1C1AB1;
	Wed, 11 Dec 2024 09:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="fUBC4IBN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8BF6236FBF;
	Wed, 11 Dec 2024 09:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733909894; cv=none; b=SPVOLDeKE/W9VKfZ/uS9+eEiiy1YCuuF0uKpAUfT2u3wihFZ660rS/DX9i2FwlhfcvFoWEm6nsn8t0YaNasXJ+wAY3sm/zW90/xsegmESYknSmwcuUes6Q4/DvW+TwZMBZzi+W5q9ypE4hx0aUiYw86j39heUb3YkievIytizB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733909894; c=relaxed/simple;
	bh=irR/tG80Hr7oiSUNb906KeHzwHrdB5TuOgJG4tynl54=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=jgWLlia8sf/tjEhHHeWGib6m98eZciwVmdFuRgBOVtreiMZDTbDy/BvgRgBPztQI8+AB9OogK7MHcVv92s2FTDqs3GMtb8NHTO5E2WmP6R1dAISLygXy5JIrisyUo6AcxmzSCSQPbSHt68u0Ko+ZX5JvwoZ+u9JiXdtKId5nZhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=fUBC4IBN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BB2Ord9001566;
	Wed, 11 Dec 2024 09:38:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i4PlrbuYYZMbVLs/vrzao9epuZImIpDmugP7brd+zuQ=; b=fUBC4IBNjVaIDpeH
	QypiN4u+AxsgwYXCwkRWZ0/PF3xuIzO4w/NcQ9Vskdt4vhRWuowBJKXXU8vcelR8
	337aCvAtWjijQn6FVC3k7mzT5Dh/KwTrc/opQ6hs33XArDGceASUHKFVz9Mf0M0L
	8WELcLSZUUZNT2/60sCEf2VLon8RVYlJxVrWdCFq9Rky8hJBYn8HcicYoPeTgxrk
	aYkJ3C/PejMzsC1azpaJTx8pxGMkolC4cUaUyuV4zpR2NueW/NzuLTx5+1xzYFDi
	zqzA1wr2rWu6QGgT7eudqIkIwNyEbwrSU2gET3hyFs6EKNCUr0cTIJCQEG1rOpc2
	LWQ99w==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43f1xd15q8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Dec 2024 09:38:07 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BB9c6lC020263
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Dec 2024 09:38:06 GMT
Received: from [10.231.216.175] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 11 Dec
 2024 01:38:01 -0800
Message-ID: <b7acd819-f37b-470a-9366-2460be1075e2@quicinc.com>
Date: Wed, 11 Dec 2024 17:37:58 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/3] Expand firmware-name property to load specific
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz
	<luiz.dentz@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Balakrishna
 Godavarthi" <quic_bgodavar@quicinc.com>,
        Rocky Liao
	<quic_rjliao@quicinc.com>,
        <linux-bluetooth@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <quic_jiaymao@quicinc.com>, <quic_shuaz@quicinc.com>,
        <quic_zijuhu@quicinc.com>, <quic_mohamull@quicinc.com>
References: <20241210151636.2474809-1-quic_chejiang@quicinc.com>
 <hzw3ocj7vzmnnqbgpqxd3if3hww5jsvldhre2s67yugbf4xpfo@3lgyxdiket2e>
Content-Language: en-US
From: "Cheng Jiang (IOE)" <quic_chejiang@quicinc.com>
In-Reply-To: <hzw3ocj7vzmnnqbgpqxd3if3hww5jsvldhre2s67yugbf4xpfo@3lgyxdiket2e>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: JEK_uBGMnmXV58ULfewE4OLogldibL01
X-Proofpoint-GUID: JEK_uBGMnmXV58ULfewE4OLogldibL01
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 priorityscore=1501 mlxscore=0 clxscore=1015 bulkscore=0 adultscore=0
 suspectscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412110072

Hi Krzysztof,

On 12/11/2024 4:53 PM, Krzysztof Kozlowski wrote:
> On Tue, Dec 10, 2024 at 11:16:32PM +0800, Cheng Jiang wrote:
>> Expand the firmware-name property to specify the names of NVM and
>> rampatch firmware to load.
>>
>> This update will support loading specific firmware (nvm and rampatch)
>> for certain chips, like the QCA6698 Bluetooth chip, which shares the
>> same IP core as the WCN6855 but has different RF components and RAM
>> sizes, requiring new firmware files.
>>
>> Different connectivity boards may be attached to the same platform. For
>> example, QCA6698-based boards can support either a two-antenna or
>> three-antenna solution, both of which work on the sa8775p-ride platform.
>> Due to differences in connectivity boards and variations in RF
>> performance from different foundries, different NVM configurations are
>> used based on the board ID.
>>
>> So In firmware-name, if the NVM file has an extension, the NVM file will
>> be used. Otherwise, the system will first try the .bNN (board ID) file,
>> and if that fails, it will fall back to the .bin file.
>>
>> Possible configurations:
>> firmware-name = "QCA6698/hpnv21.bin", "QCA6698/hpbtfw21.tlv";
>> firmware-name = "QCA6698/hpnv21", "QCA6698/hpbtfw21.tlv";
>> firmware-name = "QCA6698/hpnv21.bin";
>>
>> ---
>> v4:
>>   1. Split nvm and rampatch changes to 2 commits
>>   2. Code fix according to review comments
> 
> Which comments? What exactly did you fix? This cannot be vague.
> 
Ack.
> Best regards,
> Krzysztof
> 


