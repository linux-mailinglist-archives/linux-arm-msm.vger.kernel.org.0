Return-Path: <linux-arm-msm+bounces-1262-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2955F7F228A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Nov 2023 01:51:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5B8B81C214A2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Nov 2023 00:51:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00BE715B6;
	Tue, 21 Nov 2023 00:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="CQ/Aoqau"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 629B491;
	Mon, 20 Nov 2023 16:51:37 -0800 (PST)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AKNfrb8011022;
	Tue, 21 Nov 2023 00:51:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=Uer5WtduZBBOF0bD4+5J1TW7TZH8v4HLbehG1UFqfUk=;
 b=CQ/Aoqaua5NvFpkJ0kYp0d84/kZgV3x+gD3FR2zpYqcAVqJLuAHvdL8Wicc13uRFRuOF
 P++UEsTdfMEPfweXuyUQo4q7qHDos54abpNjp8RRE/KU/5tMz2yhF3wu/xjDzJs+C/01
 iVL1hr1MtTq4Ve+xkSgEzwzD6TNC2hvlZDohpeMOQdwVSEnZ4tqYvyteg6i6D3CnU/Eo
 U2Prj3RtWv9mzJ4cUWIVcPUyrL2vxacbfSyFrHkwiCCDnWWs++iYoraxf/Rl4BdipMch
 PeyISnVWtkbPcOKRLFC/hVWMNPNwG4mMUSdIToW4mfXJSHygDQMhbPWk2u1mEvcvlqKR lA== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ugcqs0npe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Nov 2023 00:51:32 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AL0pVRf008762
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Nov 2023 00:51:31 GMT
Received: from [10.239.132.204] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 20 Nov
 2023 16:51:28 -0800
Message-ID: <732c55bb-e4a5-4a09-9b7b-0e615ddd580c@quicinc.com>
Date: Tue, 21 Nov 2023 08:51:26 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/16] arm64: dts: qcom: sm8550-aim300: add PCIe0
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, <agross@kernel.org>,
        <andersson@kernel.org>, <konrad.dybcio@linaro.org>,
        <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <conor+dt@kernel.org>, <tglx@linutronix.de>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <-cc=kernel@quicinc.com>
References: <20231117101817.4401-1-quic_tengfan@quicinc.com>
 <20231117101817.4401-8-quic_tengfan@quicinc.com>
 <61977f5a-fc04-4f85-8b18-a11df3a6b5ec@linaro.org>
From: Tengfei Fan <quic_tengfan@quicinc.com>
In-Reply-To: <61977f5a-fc04-4f85-8b18-a11df3a6b5ec@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: qRddRAiZwe3czk4xwVz1jbjPQ0wYJQWB
X-Proofpoint-GUID: qRddRAiZwe3czk4xwVz1jbjPQ0wYJQWB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-20_22,2023-11-20_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 clxscore=1015 mlxlogscore=751
 mlxscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311210002



在 11/17/2023 6:30 PM, Krzysztof Kozlowski 写道:
> On 17/11/2023 11:18, Tengfei Fan wrote:
>> Add PCIe0 nodes used with WCN7851 device.  The PCIe1 is not connected,
>> thus skip pcie_1_phy_aux_clk input clock to GCC.
>>
>> Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
> 
> You just added this board. Does it mean you added incomplete and wrong DTSU?
> 
> Best regards,
> Krzysztof
> 

Hi Krzysztof,
I will drop PCIe1 setting in dts file because of PCIe1 still have not 
enable in dts file.
Another I understand what your comments means is I should combine all 
the functions which should be implemented together and submit as a 
complete patch, right?
I will combine all the functions patch to a total patch when I do next 
version patch series, because there is another your comments also want 
to me do as so.

-- 
Thx and BRs,
Tengfei Fan

