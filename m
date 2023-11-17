Return-Path: <linux-arm-msm+bounces-836-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D4727EEB86
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Nov 2023 05:06:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 655C11C203FF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Nov 2023 04:06:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 272B46AD9;
	Fri, 17 Nov 2023 04:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="aox+EMFn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9050C1A5;
	Thu, 16 Nov 2023 20:06:13 -0800 (PST)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AH3ALlg013206;
	Fri, 17 Nov 2023 04:05:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=4rqiAUt5QRLvNgqo+9fyR8GgkuXDp4lMsBfEjehiMmE=;
 b=aox+EMFncCESKwTBddn0sLMP6+adGXbdbxOX/l2bA/E7KgkrtG4ziZEAhz5ijpyRI4jy
 q10Kii/mCuJtVZBIoqeP7Qzq7CgJ9fGzyhSfKArZcd5ora1HJUi+hHr0zlvaPakscEOa
 lGgdHC4xPDbUgIVUS46HzrxQnHDYzyv6NF+NkwSJ3qZjU6uiO/Uzb/gyx469q95fi2Vy
 pQvfZcp+XowzTb+qMVe+oj7HygCnoZNBKTL3eFVVB9e/Rm+5KZfpIy/weH0DslMBeX87
 LwD6aEW34ib8vcDqoB+i1lw7ADpXbFx6S7bkdztsi7zwxxcWPtk/WF0tDzNXeWQgsuIh Pg== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3udpqq1b75-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Nov 2023 04:05:52 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AH45o4O012608
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Nov 2023 04:05:50 GMT
Received: from [10.79.43.91] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Thu, 16 Nov
 2023 20:05:43 -0800
Message-ID: <816f9321-5bc5-16b6-6846-8924393805ae@quicinc.com>
Date: Fri, 17 Nov 2023 09:35:40 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 2/5] dt-bindings: arm: qcom: Document SC8380XP SoC and
 boards
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@linaro.org>, <andersson@kernel.org>,
        <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <catalin.marinas@arm.com>, <ulf.hansson@linaro.org>
CC: <agross@kernel.org>, <conor+dt@kernel.org>, <ayan.kumar.halder@amd.com>,
        <j@jannau.net>, <dmitry.baryshkov@linaro.org>,
        <nfraprado@collabora.com>, <m.szyprowski@samsung.com>,
        <u-kumar1@ti.com>, <peng.fan@nxp.com>, <lpieralisi@kernel.org>,
        <quic_rjendra@quicinc.com>, <abel.vesa@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <quic_tsoni@quicinc.com>, <neil.armstrong@linaro.org>
References: <20231025142427.2661-1-quic_sibis@quicinc.com>
 <20231025142427.2661-3-quic_sibis@quicinc.com>
 <d0b22e91-ebf0-47e8-985e-f99629f97cf7@linaro.org>
From: Sibi Sankar <quic_sibis@quicinc.com>
In-Reply-To: <d0b22e91-ebf0-47e8-985e-f99629f97cf7@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Tdbgf7DBSOEsqfViksWexpGu0xNAlK3X
X-Proofpoint-ORIG-GUID: Tdbgf7DBSOEsqfViksWexpGu0xNAlK3X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 phishscore=0 spamscore=0 bulkscore=0 clxscore=1011
 lowpriorityscore=0 mlxlogscore=718 impostorscore=0 suspectscore=0
 mlxscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311170029

Hey Konrad,

Thanks for taking time to review the series.

On 10/26/23 15:54, Konrad Dybcio wrote:
> 
> 
> On 10/25/23 16:24, Sibi Sankar wrote:
>> From: Rajendra Nayak <quic_rjendra@quicinc.com>
>>
>> Document the SC8380XP SoC binding and also the boards using it.
>> Also document the new board id qcp (Qualcomm Compute Platform).
>>
>> Signed-off-by: Rajendra Nayak <quic_rjendra@quicinc.com>
>> Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
>> ---
> Looks good, but can you elaborate a bit more on QCP? Is it going
> to be a new fuse setting for devices that fall into the "compute"
> category, but aren't necessarily CRDs?

QCP and CRD have different form factors, the former looks like a laptop
while the latter isn't. The fuse settings probably won't have any diffs
between them but the board schematics will have diffs.

-Sibi

> 
> Konrad

