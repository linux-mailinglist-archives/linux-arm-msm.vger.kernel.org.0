Return-Path: <linux-arm-msm+bounces-36274-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BCECC9B471D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Oct 2024 11:42:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 72F551F23F9D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Oct 2024 10:42:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8BC1204F69;
	Tue, 29 Oct 2024 10:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="g6Deb+Ph"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF205204934;
	Tue, 29 Oct 2024 10:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730198495; cv=none; b=aX5bbFOoQO9yJZ/HVbnCm90jq5hUB3S3ptD8NE2MhiMbFLFph4ySCjsr7+w8VZcAJxbJxTJcdrqeBWdVPw2okqvxq/XOMACY94DMz/DgXllhkYL2CZYcoYv09j+ijY/3jAA9fA+NzX4j/jRU/OqTnDD3nBA5x2hxWJTEqT4JXJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730198495; c=relaxed/simple;
	bh=CDxDPheZuIShbTxvGcnHynCpCSV2PBe5TGcpJ6O4hxw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=LtvZnoi3PRg3QAjfbIiHYIrgfx/K+Gd2A9fQaRqhBFsJCPy+kCxYidhR9psm/7xTCUHQv2SpCxqmtVDlBfMrAZ37MGLU9fftSTbblbGBzo7F0AmbU5uC7yntkhsNiLnMNPDAfUcOKQgUJ/KOjGla7ZXx/0ol/nkNwmW3XEtybtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=g6Deb+Ph; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49T9QgvS004569;
	Tue, 29 Oct 2024 10:41:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Hw0jxCeBaOwpy4JuP/bVGCjHkrcw66Z/6+sqZuhTue4=; b=g6Deb+Phxt14ZxHr
	RrA2Tx7gOxMtj4Iv8v83XBsATdCwgVUJ+Z8VLL/4l91kIHNAb8n1ZMQz+yItDQ5x
	bpRTkOdU+DB6r2P6AlPFhKHGiIPE8AGlTDzjIy38eLZTQryEtkLwSy2/zyK0hJAO
	1KdXqfwzdbNZy8Jkx8J7wFr2EFTbZ24MaWtQYAc+zzcyMD9Z6MUs89t9dh64Uynw
	QlGEyDrHWKc7AZscTKFKttz1YmiovGSU1BeyaSxZzfTPu5OFMER3v2ILhamdKzJl
	ySJg80R2cc5U9hnDa4di3tuy5F4yU5wPTvjtGiILFoSBF/Y01MerSPiGLn3fjaNu
	1eop/w==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42gs6e81nt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Oct 2024 10:41:30 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49TAfUFf027210
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Oct 2024 10:41:30 GMT
Received: from [10.239.133.118] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 29 Oct
 2024 03:41:25 -0700
Message-ID: <4d5d3c4d-098f-48ca-ba3a-289f5447e63a@quicinc.com>
Date: Tue, 29 Oct 2024 18:41:22 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: qcs615: Add LLCC support for QCS615
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <kernel@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20241011-add_llcc_dts_node_for_qcs615-v1-1-e7aa45244c36@quicinc.com>
 <c81b26dc-1c52-42b6-ba68-95906b9c524c@oss.qualcomm.com>
Content-Language: en-US
From: Song Xue <quic_songxue@quicinc.com>
In-Reply-To: <c81b26dc-1c52-42b6-ba68-95906b9c524c@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 6kdHWveVhken_w6xJ8NvfNRpP8SuBgJ-
X-Proofpoint-GUID: 6kdHWveVhken_w6xJ8NvfNRpP8SuBgJ-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 mlxscore=0
 priorityscore=1501 lowpriorityscore=0 mlxlogscore=999 phishscore=0
 malwarescore=0 impostorscore=0 adultscore=0 spamscore=0 suspectscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410290083



On 10/26/2024 1:46 AM, Konrad Dybcio wrote:
> On 11.10.2024 12:41 PM, Song Xue wrote:
>> The QCS615 platform has LLCC(Last Level Cache Controller) as the system
>> cache controller. It includes 1 LLCC instance and 1 LLCC broadcast
>> interface.
>>
>> Add LLCC node support for the QCS615 platform.
>>
>> Signed-off-by: Song Xue <quic_songxue@quicinc.com>
>> ---
>> This patch series depends on below patch series:
>> https://lore.kernel.org/all/20240926-add_initial_support_for_qcs615-v3-0-e37617e91c62@quicinc.com/
>> https://lore.kernel.org/linux-arm-msm/20241010-add_llcc_support_for_qcs615-v2-1-044432450a75@quicinc.com/
>> ---
>>   arch/arm64/boot/dts/qcom/qcs615.dtsi | 8 ++++++++
>>   1 file changed, 8 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
>> index ac4c4c751da1fbb28865877555ba317677bc6bd2..b718a4d2270d64ed43c2eca078bfe52b78ff680c 100644
>> --- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
>> @@ -495,6 +495,14 @@ dc_noc: interconnect@9160000 {
>>   			qcom,bcm-voters = <&apps_bcm_voter>;
>>   		};
>>   
>> +		llcc: system-cache-controller@9200000 {
>> +			compatible = "qcom,qcs615-llcc";
>> +			reg = <0x0 0x9200000 0x0 0x50000>,
>> +			      <0x0 0x9600000 0x0 0x50000>;
> 
> Please pad both addresses to 8 hex digits (e.g. 0x09200000)
> 
> With that:
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Konrad
> 
let me fix it.

Thanks,
Song


