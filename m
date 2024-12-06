Return-Path: <linux-arm-msm+bounces-40655-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 12FBC9E6491
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 04:07:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9145018854C2
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 03:07:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00E6217C224;
	Fri,  6 Dec 2024 03:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="FpzjHSV+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58C2634CDE;
	Fri,  6 Dec 2024 03:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733454423; cv=none; b=os8YENWO3sd3sFk2pXn816lZnUnrbWGH0lIHVtsHF6GCYxey27NvNoetaXl56W/J04OTakpjxfCZB7V4McCGgFzhiPouOuxupk43+qtArofbKV5VQwuXceRX1eFjKKED0zAzc4qItL41lWh1wMu/uVr2395fZoDDSs6JrF6qUc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733454423; c=relaxed/simple;
	bh=y4ETJU0hj3FgnNKLiXNJAH9L2d+pIEzCQGYX7P/TFIY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ONXBFL8yDgQxA5RROA3pFOuHU13fLoqYSV+hK8a97IifS+Fc6V8PycX4RN0+J/WyEqWP1VYdjFkrcBmAoMtW24jXyi2Wa4OZZ2dBzgeDbp9BKEkF8j10s+9ifnqToTddjfyDEt9111EId5DRCWdA3HdLDSSebwzS1s97hH0kJ/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=FpzjHSV+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B5HaRU2007168;
	Fri, 6 Dec 2024 03:06:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SCnnyNmXFdCjUq3YP8qX1zzwPVrm/4VHVweOka8kGIo=; b=FpzjHSV+0oZRihnK
	jvcHCdu8ygqKYLfLG35UTmjt1X4PKDE5cbRpwwF+OFRX1RSnQpAtUGdIgHOA3cY2
	B0XWCPwTF4X8efT7NJNY1lq1Hicyx4QqT3UOAkxBuYUbxVRR9oV5fq/wBaZhYhFe
	AottI9BqXWd5eVyidRR2/TDH/u4Al3J9+ouTcHAyHc7feZH6dXSolUqKgMc6BdAx
	NGhsR5KSLLkGKr12LoYT7lfJNrjSZRobQv+DnBPdDXFfrfPkHoURBYVrt5+FsDW5
	IUJ0xLLtHqn9EsLm7tjTWSPENYm4ttm+2Zgl7VYWGjZlJnDxGMVwmwKuEG4UH+29
	G09X4A==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43ben89jqk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Dec 2024 03:06:55 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B636snZ028511
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 6 Dec 2024 03:06:54 GMT
Received: from [10.239.28.113] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 5 Dec 2024
 19:06:49 -0800
Message-ID: <b4449c99-0fc7-4a12-9861-39c8db3698e7@quicinc.com>
Date: Fri, 6 Dec 2024 11:06:46 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] dt-bindings: net: bluetooth: qca: Expand
 firmware-name property
To: "Rob Herring (Arm)" <robh@kernel.org>
CC: <quic_shuaz@quicinc.com>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Conor Dooley <conor+dt@kernel.org>, <linux-bluetooth@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <quic_jiaymao@quicinc.com>,
        Marcel Holtmann
	<marcel@holtmann.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, <quic_zijuhu@quicinc.com>,
        Rocky Liao
	<quic_rjliao@quicinc.com>, <devicetree@vger.kernel.org>,
        "Balakrishna
 Godavarthi" <quic_bgodavar@quicinc.com>,
        Bjorn Andersson
	<andersson@kernel.org>, <quic_mohamull@quicinc.com>,
        <linux-kernel@vger.kernel.org>
References: <20241205102213.1281865-1-quic_chejiang@quicinc.com>
 <20241205102213.1281865-2-quic_chejiang@quicinc.com>
 <173339749198.2690453.6235486221062242906.robh@kernel.org>
Content-Language: en-US
From: "Cheng Jiang (IOE)" <quic_chejiang@quicinc.com>
In-Reply-To: <173339749198.2690453.6235486221062242906.robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 9edsrctiaV3Y-t5k5ByzkEVCNbHM3jOI
X-Proofpoint-GUID: 9edsrctiaV3Y-t5k5ByzkEVCNbHM3jOI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 mlxlogscore=999 clxscore=1015
 malwarescore=0 suspectscore=0 spamscore=0 mlxscore=0 lowpriorityscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412060022

Hi Rob,

On 12/5/2024 7:18 PM, Rob Herring (Arm) wrote:
> 
> On Thu, 05 Dec 2024 18:22:11 +0800, Cheng Jiang wrote:
>> Expand the firmware-name property to specify the names of NVM and
>> rampatch firmware to load. This update will support loading specific
>> firmware (nvm and rampatch) for certain chips, like the QCA6698
>> Bluetooth chip, which shares the same IP core as the WCN6855 but has
>> different RF components and RAM sizes, requiring new firmware files.
>>
>> We might use different connectivity boards on the same platform. For
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
>> Signed-off-by: Cheng Jiang <quic_chejiang@quicinc.com>
>> ---
>>  .../devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml   | 2 ++
>>  1 file changed, 2 insertions(+)
>>
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> yamllint warnings/errors:
> ./Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml:106:5: [error] duplication of key "description" in mapping (key-duplicates)
> 
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml: ignoring, error parsing file
> ./Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml:106:5: found duplicate key "description" with value "specify the name of rampatch firmware to load" (original value: "specify the name of nvm firmware to load")
> make[2]: *** Deleting file 'Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.example.dts'
> Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml:106:5: found duplicate key "description" with value "specify the name of rampatch firmware to load" (original value: "specify the name of nvm firmware to load")
> make[2]: *** [Documentation/devicetree/bindings/Makefile:26: Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.example.dts] Error 1
> make[2]: *** Waiting for unfinished jobs....
> make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1506: dt_binding_check] Error 2
> make: *** [Makefile:251: __sub-make] Error 2
> 
> doc reference errors (make refcheckdocs):
> 
> See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20241205102213.1281865-2-quic_chejiang@quicinc.com
> 
> The base for the series is generally the latest rc1. A different dependency
> should be noted in *this* patch.
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
> 
> pip3 install dtschema --upgrade
> 
> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your schema.
> 
Thank you for the info. I will run the dt_binding_check before next patch. 


