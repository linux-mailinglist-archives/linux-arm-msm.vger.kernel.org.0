Return-Path: <linux-arm-msm+bounces-58607-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EE03ABCF87
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 08:41:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B50B9188A174
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 06:41:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E6D125CC68;
	Tue, 20 May 2025 06:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="lpC2iHq9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A22B025B676;
	Tue, 20 May 2025 06:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747723294; cv=none; b=qIF3LzOx3nhZPGoxdSObswlrcm/fhViMkXp6N70zPeIxf0h9f0HiucV6ZsTuSrSx32OwBs9f+nMBr8+UFFt/R9mqSH24Fw1gixR2VMY84v1IO5rKYCH7bA1xDJBvEyxtNdQ7Oxl11fJJduMruOyOQSO3JVuBr1li3KYnyNs6DA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747723294; c=relaxed/simple;
	bh=TDZp42HXoy1lVULd4RTU4LhbZnaqmDUY7mKn3skZl2A=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Vby0EGsqZCyXGkUSj8kLZo9M5AvxtFQHN0iG9lfFkgBB9JvAFdSIWpB64TEj2dP4pNLF7zL9wh7J0SJJnl3FuprotUH3iJjOjevS0GGr5/Mx4rstyogMKTiOYkR8Bx7xm7D7K7t1FK/J1odXUeLz+2Kb9tVDKK3Ej2YkY4Nsesw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=lpC2iHq9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54K520oZ023215;
	Tue, 20 May 2025 06:41:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oQpKxIHvHa3BgsCwNI3BkG3WgPxBXsHxKKrXaf0BNvQ=; b=lpC2iHq9FaP/UQw6
	f6hxaTJdfEPIaRLRnC9DOsBf7MCm4zQfLZ0d98TZpgCG9/jm0YO8f130iPS+LfeS
	/PvHd4umwMwRjXw5sUGJKJpW00ud8wncIMcv89ysL3yOxvHhkqARiyz5nqdCTMbL
	tNvaeJUo6aKwfm2gjiTGXMWeiWpbUz5PP/Sjmp1DxtDFPyh8iQRAfPBQLnhNxKaR
	J8ukq6OzGMGMF432sgGfWjAGAU63w1llBZTNHziVc/pDbSHTMXOBOa3ZyM5Emx+x
	GfduYSHe0XLa+Lufnl4ngOrmfQ+qwdH6NQAhVq+xZ4eVAg71jNsV7aHUuJ7cKO61
	ig4Plg==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46r041uc8p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 May 2025 06:41:28 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54K6fR1n027726
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 May 2025 06:41:27 GMT
Received: from [10.239.29.49] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 19 May
 2025 23:41:24 -0700
Message-ID: <b90ee18a-5e88-4c36-a623-ae9447c53a46@quicinc.com>
Date: Tue, 20 May 2025 14:41:22 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] arm64: dts: qcom: sc7280: Add memory region for
 audiopd
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
CC: <cros-qcom-dts-watchers@chromium.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <ekansh.gupta@oss.qualcomm.com>
References: <20250516110029.1637270-1-quic_lxu5@quicinc.com>
 <20250516110029.1637270-2-quic_lxu5@quicinc.com>
 <uzyxagnmxz5tsjy32mfro2alwdpcq5kybwzcbsysul7u6adgdf@x7katw7eme6u>
Content-Language: en-US
From: Ling Xu <quic_lxu5@quicinc.com>
In-Reply-To: <uzyxagnmxz5tsjy32mfro2alwdpcq5kybwzcbsysul7u6adgdf@x7katw7eme6u>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDA1MiBTYWx0ZWRfX/vvrxFhQAA10
 Ajxbv8xlo1vzaQYnjegcbESrpuYqgORcl9UX+6KVUKpHZlfjQYPQ7oyT7EHdF7ltHV4Ny+M0TOD
 EEASWSgvaQ5oZYnZ0l2ZC9I0LZgaIgVr/b392UfRlAXbIXNPz8enAwlXCczZbz0lByqWuIYaMnZ
 otwzj5gkpzAmLKtmMHItnC+cG358IJgZmfgqiwykZOc+lRdHCs1IgX6AV6cd7yGBck6Cbca3jsC
 qRZS0DXK8ZsCN9a4ClP6qFB20rvRHjAAqIwo1uADN0P7MYBn6VWn3amTIQlLhfxTdcAXSiNmfJh
 OyvKb96+qbpwpmlb0eERiDqI0b6Zu41iYZCRGXimBVXvWJKNcS6TE5rK6AvsySvNFLzVpYSvCdg
 l1DNo+C3Rbd024Wyje2S1zQcOtNuLT5laS7Ug7g0LHimBhvQQol9ZzBmBLY/AQmttKlcxBBr
X-Proofpoint-ORIG-GUID: _rzWEsD6HFH7XcuvXPDdpCW-ny2bUCTM
X-Proofpoint-GUID: _rzWEsD6HFH7XcuvXPDdpCW-ny2bUCTM
X-Authority-Analysis: v=2.4 cv=HIjDFptv c=1 sm=1 tr=0 ts=682c2418 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=NerZ36xiTtOB36ebo4kA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_03,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 mlxscore=0 clxscore=1015
 bulkscore=0 suspectscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 impostorscore=0 mlxlogscore=625 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505200052

在 5/17/2025 5:47 AM, Dmitry Baryshkov 写道:
> On Fri, May 16, 2025 at 04:30:27PM +0530, Ling Xu wrote:
>> Add reserved memory region and VMIDs for audio PD dynamic loading and
>> remote heap memory requirements.
> 
> Why? Was it not working without this heap?

yes, it will not working without this heap.
Memory region is required for audio PD for dynamic loading and remote heap memory
requirements. For more info, please refer below patches, it has provided a more
detailed explanation.
https://lore.kernel.org/all/bb68da04-ef52-4172-8b6e-f4027bcc2786@oss.qualcomm.com/
https://lore.kernel.org/all/effea02f-6ffb-42e9-87df-081caafab728@oss.qualcomm.com/

>>
>> Signed-off-by: Ling Xu <quic_lxu5@quicinc.com>
>> ---
>>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 11 +++++++++++
>>  1 file changed, 11 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> index 8e86d75cc6b4..d9af79ff8c4e 100644
>> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> @@ -188,6 +188,14 @@ rmtfs_mem: rmtfs@9c900000 {
>>  			qcom,client-id = <1>;
>>  			qcom,vmid = <QCOM_SCM_VMID_MSS_MSA>;
>>  		};
>> +
>> +		adsp_rpc_remote_heap_mem: adsp-rpc-remote-heap {
>> +			compatible = "shared-dma-pool";
>> +			size = <0x0 0x800000>;
>> +			alignment = <0x0 0x100000>;
>> +			alloc-ranges = <0x0 0x80000000 0x0 0x40000000>;
>> +			no-map;
>> +		};
>>  	};
>>  
>>  	cpus {
>> @@ -3863,6 +3871,9 @@ fastrpc {
>>  					qcom,glink-channels = "fastrpcglink-apps-dsp";
>>  					label = "adsp";
>>  					qcom,non-secure-domain;
>> +					memory-region = <&adsp_rpc_remote_heap_mem>;
>> +					qcom,vmids = <QCOM_SCM_VMID_LPASS>,
>> +							  <QCOM_SCM_VMID_ADSP_HEAP>;

Thanks. Will modify this.

> Please align '<' vertically.
> 
>>  					#address-cells = <1>;
>>  					#size-cells = <0>;
>>  
>> -- 
>> 2.34.1
>>
> 

-- 
Thx and BRs,
Ling Xu


