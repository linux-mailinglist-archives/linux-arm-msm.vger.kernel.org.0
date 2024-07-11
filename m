Return-Path: <linux-arm-msm+bounces-25947-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A71B92E428
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jul 2024 12:06:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 036ACB255EA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jul 2024 10:06:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F582157A61;
	Thu, 11 Jul 2024 10:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="YH7W7ggM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FE005CDE9;
	Thu, 11 Jul 2024 10:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720692375; cv=none; b=uUpW3OJUcRHcLf00lTK+90xcCbmzUnTpTE7/Ode3m7970hAuvFDMr5VJGLdBhZM1M+aSauZiWG6U1WPhvo55CfYvdEW+pq7HYLsx9YrhDoCP+YIbBSnu951ZfgAlDoVo2DP2auDsPtLSqQtJQqeDR1dbvpBYVpfj1ksj7Onv8dI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720692375; c=relaxed/simple;
	bh=DfEiBXIyn3QEEmwIeuS3fmBFM1HjKAUnXPJKRA9Z+tU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=efx9fe+wKCSgWa0U0928Krs6cK8i4Q3E6hS294+BsCASSl3uh1IyCGiodR84/TKDh+0bRcbLMoMHC2BwVZVhk6UznB8wmGrtH+cq9r6MthGgkyIG8y+upqySMrUsaipIHt2DiGSlh49ktL+GxgD30ex2cf+7T9qKGa5FPrY4+XM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=YH7W7ggM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46B4mluP016381;
	Thu, 11 Jul 2024 10:06:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s4rbnWrirQxLzCZC4tiBnKGBshjP4tF4ViVD5SXagkw=; b=YH7W7ggMIRhUz9Sh
	oojLii3WtoRZYW+Om5BWWBebV44o5Qd5W54DgPmar0xVX/hYZYK3ax9I7w+SzcTf
	fys22G0obQIrMBmc8cCVjN1YEnmpUSnRwOXgxK57PfSIwxsIKyTc5RtuM7H/1O0N
	57ednuNlKx+Y+EyHC5huHyK/2O7ftkVgWg20icSftsl+7dEzLVC0WIGgsqUlJoQZ
	rzpoCJVl/Qb7i6WuH2y0S6BMQQy5CQdCdLHIEljIssW7jghpnM+0jhRhfhbkpsJQ
	aaYuejjAXOyNsB/5aqGplHyzgVje/HUiMA2TTHcb6sPkn1A/eRb/YGgVWfj5yOhf
	D5Ofbw==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 406y3hkhm8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Jul 2024 10:06:06 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46BA65I5007846
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Jul 2024 10:06:05 GMT
Received: from [10.239.132.150] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 11 Jul
 2024 03:05:59 -0700
Message-ID: <51302de0-5e4c-4e2a-85a0-e22549baa13c@quicinc.com>
Date: Thu, 11 Jul 2024 18:05:57 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dt-bindings: phy: qcom,usb-snps-femto-v2: Add bindings
 for QCS9100
To: Trilok Soni <quic_tsoni@quicinc.com>, Rob Herring <robh@kernel.org>,
        Tengfei Fan <quic_tengfan@quicinc.com>
CC: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-phy@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel@quicinc.com>
References: <20240709-document_qcs9100_usb_hs_phy_compatible-v2-1-c84fbbafa9d6@quicinc.com>
 <20240710162745.GA3212156-robh@kernel.org>
 <3b8684f0-c89d-1a76-6bc5-93ced59dc51c@quicinc.com>
From: "Aiqun Yu (Maria)" <quic_aiquny@quicinc.com>
Content-Language: en-US
In-Reply-To: <3b8684f0-c89d-1a76-6bc5-93ced59dc51c@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: KltkDJck3BDoSsL7_rBuszENdxFJ3C0n
X-Proofpoint-GUID: KltkDJck3BDoSsL7_rBuszENdxFJ3C0n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-11_06,2024-07-10_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 spamscore=0 adultscore=0 mlxscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 mlxlogscore=999 impostorscore=0 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407110071



On 7/11/2024 12:45 AM, Trilok Soni wrote:
> On 7/10/2024 9:27 AM, Rob Herring wrote:
>> On Tue, Jul 09, 2024 at 08:46:19PM +0800, Tengfei Fan wrote:
>>> Document the compatible string for USB phy found in Qualcomm QCS9100
>>> SoC.
>>> QCS9100 is drived from SA8775p. Currently, both the QCS9100 and SA8775p
>>> platform use non-SCMI resource. In the future, the SA8775p platform will
>>> move to use SCMI resources and it will have new sa8775p-related device
>>> tree. Consequently, introduce "qcom,qcs9100-usb-hs-phy" to describe
>>> non-SCMI based USB phy.
>>>
>>> Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
>>> ---
>>> Introduce support for the QCS9100 SoC device tree (DTSI) and the
>>> QCS9100 RIDE board DTS. The QCS9100 is a variant of the SA8775p.
>>> While the QCS9100 platform is still in the early design stage, the
>>> QCS9100 RIDE board is identical to the SA8775p RIDE board, except it
>>> mounts the QCS9100 SoC instead of the SA8775p SoC.
>>>
>>> The QCS9100 SoC DTSI is directly renamed from the SA8775p SoC DTSI, and
>>> all the compatible strings will be updated from "SA8775p" to "QCS9100".
>>> The QCS9100 device tree patches will be pushed after all the device tree
>>> bindings and device driver patches are reviewed.
>>
>> I'm not convinced this is not just pointless churn. Aren't we going to 
>> end up with 2 compatible strings for everything? SCMI should just change 
>> the providers, but otherwise the consumers are the same. I suppose if 
>> clocks are abstracted into power-domains (an abuse IMO) then the 
>> bindings change.
>>
>> Why do we need to support both SCMI and not-SCMI for the same chip?
> 
> IOT SKU of this SOC is using the non-SCMI solution and Auto SKU
> of this SOC is using the SCMI based solution due to additional
> safety requirements. 

More add-on information, IOT SKU which have qcs9100 soc mounted will
have firmware releases which support non-scmi solution.
And AUTO SKU which mounted with SA8775p will have different firmware
releases which support SCMI solution.
> 
> 

-- 
Thx and BRs,
Aiqun(Maria) Yu

