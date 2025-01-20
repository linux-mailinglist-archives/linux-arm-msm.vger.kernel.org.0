Return-Path: <linux-arm-msm+bounces-45576-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B23AA16B30
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jan 2025 12:05:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 015A11885674
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jan 2025 11:05:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 920CD1BC066;
	Mon, 20 Jan 2025 11:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="RZWc1hai"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6D1533981;
	Mon, 20 Jan 2025 11:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737371121; cv=none; b=jy/gsaQW8XwkGSCx2COL/qE/FHJDnyUdi/4DdK09UAIECom8OOnGyIj3yXzhrUqBHkohu9WlsshUKnPmdRMow4td4P5b0Rh8VSkj3J9NlCOP5VQSDgWh6YfApAR+Os0td3632ec32BMd/Cdq6uO8djAxjekNKuQ6p2VTxgAfMFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737371121; c=relaxed/simple;
	bh=vjIjQ5qumXaC5V/OLUgg8GC0PYyG7dv07vfpzYg5EdA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=WlVyVCN9gJv0slUHSgz1wnrumplJ25TSxtMf0QNvl7IWKP5FzENXpcggCq+MFTbkWWAzWyb2iQknwc1yLjc5XiXOlG3ERHyPIMHiuRA3nIaWd8Y6rCJWBF7ckWW4C7DuoO4FjqSW2SJLRzRNa0MlO5XPC5Lpbbtmz7NGQLQ4eq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=RZWc1hai; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50KAB3OR021554;
	Mon, 20 Jan 2025 11:05:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IJHNqYMWw4G3jyIRWFyd7ysmaSfI/0yW59LUGHBiP/U=; b=RZWc1haiVtTdBk+O
	adrF858NIewy4HX2uZSpYoDzteqaTTmqjCAHIi/YtXfEsHh9RXPRnMkzdFCKQvZQ
	McX3+QD9v9LqTVX0mT9sKBWsr8FEVvIuO+3bk7OBkMuXY6D7ZPgeYKVYS2a1ZZr6
	YwX2MEwxFVmhbIGLHDV+1KmH09wCbWxNgurZjj9o/Wtybn59lYDXIpAuXyKFcWpR
	EBnjhkdWkirSb9eN/FY60lBup9xgUZ2pSw2sujPl2Fb5Npoj/4RwArZBeHRUbwz3
	v7gW+yJPf/KaFiZvlOSryrjHHHWnOMvXjdpL4yaMCXdeUNRzXzXV/7bkXOLtiuFg
	KIJI3Q==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 449mgpg46e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Jan 2025 11:05:09 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50KB58UB017257
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Jan 2025 11:05:08 GMT
Received: from [10.217.217.81] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 20 Jan
 2025 03:05:03 -0800
Message-ID: <2e4a4305-526b-4faa-9e56-3f2f11bc7365@quicinc.com>
Date: Mon, 20 Jan 2025 16:35:00 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 04/10] dt-bindings: clock: Add Qualcomm QCS615 Display
 clock controller
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: "Rob Herring (Arm)" <robh@kernel.org>, Will Deacon <will@kernel.org>,
        "Ajit Pandey" <quic_ajipan@quicinc.com>,
        <linux-arm-kernel@lists.infradead.org>,
        Catalin Marinas
	<catalin.marinas@arm.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Bjorn Andersson
	<andersson@kernel.org>
References: <20250119-qcs615-mm-v4-clockcontroller-v4-0-5d1bdb5a140c@quicinc.com>
 <20250119-qcs615-mm-v4-clockcontroller-v4-4-5d1bdb5a140c@quicinc.com>
 <173728731976.808036.168078560019330137.robh@kernel.org>
 <a646b3af-9957-4720-893e-9013b2dca43a@quicinc.com>
 <czxiikfvffnfljngec6gdwoapx2khtvltauzhezexkxxitclfn@7pfnj7jtyfil>
Content-Language: en-US
From: Taniya Das <quic_tdas@quicinc.com>
In-Reply-To: <czxiikfvffnfljngec6gdwoapx2khtvltauzhezexkxxitclfn@7pfnj7jtyfil>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: dOpV_QNsSYTcD6SkUJnP5egmlknj2ULT
X-Proofpoint-GUID: dOpV_QNsSYTcD6SkUJnP5egmlknj2ULT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-20_02,2025-01-20_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 impostorscore=0 phishscore=0 priorityscore=1501 mlxlogscore=878
 lowpriorityscore=0 spamscore=0 bulkscore=0 adultscore=0 clxscore=1015
 mlxscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501200092



On 1/20/2025 2:22 PM, Dmitry Baryshkov wrote:
> On Mon, Jan 20, 2025 at 10:10:11AM +0530, Taniya Das wrote:
>>
>>
>> On 1/19/2025 5:23 PM, Rob Herring (Arm) wrote:
>>> y bot found errors running 'make dt_binding_check' on your patch:
>>>
>>> yamllint warnings/errors:
>>>
>>> dtschema/dtc warnings/errors:
>>> Documentation/devicetree/bindings/clock/qcom,qcs615-dispcc.example.dts:19:18: fatal error: dt-bindings/clock/qcom,qcs615-gcc.h: No such file or directory
>>>      19 |         #include <dt-bindings/clock/qcom,qcs615-gcc.h>
>>>         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>> compilation terminated.
>>> make[2]: *** [scripts/Makefile.dtbs:131: Documentation/devicetree/bindings/clock/qcom,qcs615-dispcc.example.dtb] Error 1
>>> make[2]: *** Waiting for unfinished jobs....
>>> make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1506: dt_binding_check] Error 2
>>> make: *** [Makefile:251: __sub-make] Error 2
>>
>> The code https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/include/dt-bindings/clock/qcom,qcs615-gcc.h
>>
>> The cover letter also has the series mentioned.
> 
> Please. Stop using bindings for clock controllers in DT bindings for
> other devices. It provides no benefits and complicates merging.
> 

Sure, I agree we should not refer the bindings, but I hope this is 
agreed upon and I could remove such references in upcoming bindings.

-- 
Thanks & Regards,
Taniya Das.


