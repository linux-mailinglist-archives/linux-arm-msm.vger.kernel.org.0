Return-Path: <linux-arm-msm+bounces-36276-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AC1A9B47BC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Oct 2024 12:04:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 817F91C22C86
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Oct 2024 11:04:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFA75209F2D;
	Tue, 29 Oct 2024 10:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="NpSWsmM2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BB86205AA8;
	Tue, 29 Oct 2024 10:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730199419; cv=none; b=Zuot9JLA/P9kNi2yNAfMIY2c5syUPv3iMBx39MWbKSBir//xSz+ym9hK28jwHxbK6h8APgUohE82kGeN0pP1aVN0hrdfNWXub0mfEgIaq59jKT8A+gIEmcw3n3X+kdRR3pErRE3DCYdxFW+28BeoBP2KvcG31np7r/UkECjXJ1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730199419; c=relaxed/simple;
	bh=nKFYf84lmyIPBMOZwLdUuDhuIcAFFSl+9WXqV5vPl9w=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=V2LKtuzd2D2N6k/rs8uJTx3aeZBdSi+gOiVTe8YLXygitySTRlhePfLcvFduLtVOysx/5GUMZF8VzfN+HRQhoMaiMBChmprZKKDIRJYiOriJnxec2c5k5vyZ91tZERM7N9v5hfzO7zJqD1PpzilkQbWj32aFRCNqu3SeydK8duU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=NpSWsmM2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49TA0AdQ000705;
	Tue, 29 Oct 2024 10:56:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jwU84DHKVHfvPRx7+IWqSw4kdTZmHxrUc0yGpnugKO8=; b=NpSWsmM2DIEneY8+
	QDMtVuIyK52lyrPFfwyEUKVHJQsUpbnpFFU+ZB5rRDtbJwSFCwTv6CrIE6DnTJ2W
	eHV+lvfUAT274xvPmNjB12+Wnv3eRZorfMWqU3/KU1SJfHX1L7SiRZyhUtX7sZpo
	9tavQ1mW9IFbFtxeH6TaaAH/M33tq92vLx+M2g8/3INaD+NS2hWv13zIyDc6kaCQ
	YitrLmuU6615UP6S8BrCXL4AKv0wR7bOIyq55Up+aIM6L6WwLwr+Agm7bcBwR5RQ
	QWHUOytaDj4+8vAB/hkQDo7J7tp2dfKt0dccMfNNbKKu1XY1e/7AUqJ24V0sG9l3
	/OrJAQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42grt7032p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Oct 2024 10:56:33 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49TAuWkd014076
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Oct 2024 10:56:32 GMT
Received: from [10.216.3.156] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 29 Oct
 2024 03:56:26 -0700
Message-ID: <a22a8de1-6f5a-4d43-9b5f-9c3af6bc55b6@quicinc.com>
Date: Tue, 29 Oct 2024 16:25:53 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1 1/3] dt-bindings: ufs: qcom: Document ice configuration
 table
To: "Rob Herring (Arm)" <robh@kernel.org>
CC: <martin.petersen@oracle.com>, <avri.altman@wdc.com>, <krzk+dt@kernel.org>,
        <andersson@kernel.org>, <devicetree@vger.kernel.org>,
        <quic_nitirawa@quicinc.com>, <quic_narepall@quicinc.com>,
        <James.Bottomley@HansenPartnership.com>, <bvanassche@acm.org>,
        <linux-kernel@vger.kernel.org>, <agross@kernel.org>,
        <konrad.dybcio@linaro.org>, <alim.akhtar@samsung.com>,
        <conor+dt@kernel.org>, <manivannan.sadhasivam@linaro.org>,
        <linux-scsi@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>
References: <20241005064307.18972-1-quic_rdwivedi@quicinc.com>
 <20241005064307.18972-2-quic_rdwivedi@quicinc.com>
 <172813824187.140695.2656302375333082019.robh@kernel.org>
Content-Language: en-US
From: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
In-Reply-To: <172813824187.140695.2656302375333082019.robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: OwnLJmx1IGGFKiwHgByDSd43TVPYC8jW
X-Proofpoint-GUID: OwnLJmx1IGGFKiwHgByDSd43TVPYC8jW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 bulkscore=0
 adultscore=0 clxscore=1011 impostorscore=0 malwarescore=0
 priorityscore=1501 phishscore=0 mlxscore=0 suspectscore=0 mlxlogscore=999
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410290085



On 05-Oct-24 7:54 PM, Rob Herring (Arm) wrote:
> 
> On Sat, 05 Oct 2024 12:13:05 +0530, Ram Kumar Dwivedi wrote:
>> There are three algorithms supported for inline crypto engine:
>> Floor based, Static and Instantaneous algorithm.
>>
>> Document the compatible used for the algorithm configurations
>> for inline crypto engine found.
>>
>> Co-developed-by: Naveen Kumar Goud Arepalli <quic_narepall@quicinc.com>
>> Signed-off-by: Naveen Kumar Goud Arepalli <quic_narepall@quicinc.com>
>> Co-developed-by: Nitin Rawat <quic_nitirawa@quicinc.com>
>> Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
>> Signed-off-by: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
>> ---
>>  .../devicetree/bindings/ufs/qcom,ufs.yaml     | 24 +++++++++++++++++++
>>  1 file changed, 24 insertions(+)
>>
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/ufs/qcom,ufs.example.dtb: alg3: status: 'oneOf' conditional failed, one must be fixed:
> 	['ok'] is not of type 'object'
> 	'ok' is not one of ['okay', 'disabled', 'reserved', 'fail', 'fail-needs-probe']
> 	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
> 

Hi Rob,
	I have addressed the comment in the latest patch set. Now the dt binding is successfully compiling.
Thanks,
Ram.

> doc reference errors (make refcheckdocs):
> 
> See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20241005064307.18972-2-quic_rdwivedi@quicinc.com
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





