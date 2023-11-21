Return-Path: <linux-arm-msm+bounces-1375-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BA9007F311D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Nov 2023 15:37:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5AB9DB21B4F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Nov 2023 14:37:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B0711FAA;
	Tue, 21 Nov 2023 14:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="SDg081mb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07E29113;
	Tue, 21 Nov 2023 06:37:20 -0800 (PST)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3ALE27wt001575;
	Tue, 21 Nov 2023 14:37:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=WaJBva/h0Nlx25sp8iGDPxyi3rDtUTLmHycyJq63zJ0=;
 b=SDg081mbPSoGTEhpo2r//oG+qz9U+2qjTaY7DNDnUrZGtGXHoBVhS3l7sxMVjZ8PU6RR
 dRV5axLY2DB/Du+uWdQIe85DveLlYID0fzIC2m6zxLsvV/YWdkuyzezNtGliwrxIzRNE
 2A1imArlZfxZ91oVSkCOMCs2LVBVzps9GDarWo3YZWPrsC25L/UumZ/QSobUyncabcaq
 /I1Xx5lKM2pKyf+OuyTjK4K6G/3PAHj8Y0z86jjqnYkxw80L2bTskTcy243lvG0Y7WNW
 QO/9nRhzn+GxXHkrSWYw98fEtL0Q8NnG8baK0HeCSt+CQOkqieLq7xJPgitfHaDWWwup jw== 
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ugcqs2txt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Nov 2023 14:37:11 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3ALEbAFS002320
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Nov 2023 14:37:10 GMT
Received: from [10.218.10.86] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 21 Nov
 2023 06:37:03 -0800
Message-ID: <d432e662-869b-2176-834f-c05ef47b4bcd@quicinc.com>
Date: Tue, 21 Nov 2023 20:06:59 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: sa8775p: Mark PCIe controller as
 cache coherent
Content-Language: en-US
To: Manivannan Sadhasivam <mani@kernel.org>
CC: <agross@kernel.org>, <andersson@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <konrad.dybcio@linaro.org>, <robh+dt@kernel.org>,
        <quic_shazhuss@quicinc.com>, <quic_nitegupt@quicinc.com>,
        <quic_ramkri@quicinc.com>, <quic_nayiluri@quicinc.com>,
        <dmitry.baryshkov@linaro.org>, <robh@kernel.org>,
        <quic_krichai@quicinc.com>, <quic_vbadigan@quicinc.com>,
        <quic_parass@quicinc.com>, <quic_schintav@quicinc.com>,
        <quic_shijjose@quicinc.com>,
        Lorenzo Pieralisi
	<lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=c5=84ski?=
	<kw@linux.com>,
        Bjorn Helgaas <bhelgaas@google.com>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-pci@vger.kernel.org>
References: <1700051821-1087-1-git-send-email-quic_msarkar@quicinc.com>
 <1700051821-1087-4-git-send-email-quic_msarkar@quicinc.com>
 <20231117090640.GB250770@thinkpad>
From: Mrinmay Sarkar <quic_msarkar@quicinc.com>
In-Reply-To: <20231117090640.GB250770@thinkpad>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: ij6xhw0c-UirGYQ4RbHzbY5SVqo60cjc
X-Proofpoint-GUID: ij6xhw0c-UirGYQ4RbHzbY5SVqo60cjc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-21_07,2023-11-21_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 clxscore=1015 mlxlogscore=999
 mlxscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311210114


On 11/17/2023 2:36 PM, Manivannan Sadhasivam wrote:
> On Wed, Nov 15, 2023 at 06:07:01PM +0530, Mrinmay Sarkar wrote:
>> The PCIe controller on SA8775P supports cache coherency, hence add the
> "PCIe RC controller" both in subject and description.

This is for EP so will make as "PCIe EP controller"

--Mrinmay

>> "dma-coherent" property to mark it as such.
>>
>> Signed-off-by: Mrinmay Sarkar <quic_msarkar@quicinc.com>
> With that,
>
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
>
> - Mani
>
>> ---
>>   arch/arm64/boot/dts/qcom/sa8775p.dtsi | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
>> index 7eab458..ab01efe 100644
>> --- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
>> @@ -3620,6 +3620,7 @@
>>   				<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_PCIE_0 0>;
>>   		interconnect-names = "pcie-mem", "cpu-pcie";
>>   
>> +		dma-coherent;
>>   		iommus = <&pcie_smmu 0x0000 0x7f>;
>>   		resets = <&gcc GCC_PCIE_0_BCR>;
>>   		reset-names = "core";
>> -- 
>> 2.7.4
>>

