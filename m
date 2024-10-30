Return-Path: <linux-arm-msm+bounces-36474-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 16C5F9B6B68
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Oct 2024 18:54:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9BF3C1F21188
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Oct 2024 17:54:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1527A1CBEAD;
	Wed, 30 Oct 2024 17:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="cVrMSWRk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2692A1BD9DD;
	Wed, 30 Oct 2024 17:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730310843; cv=none; b=BswtiZedHfiEPhQIs8o5eTTCj6zyCL657vprNK8+2vvQ7Bh8NO2gWRoF8FmppBLuNMDHe0pjeAxQ+KWAWBXALgAkvKZLHgBcSZ5Utr3k72K5PMEEqvuUEU+Lsmk/n0uBry215g4f1j2wBkWByZztvDO+IkAmI/b7wiwjf9BoBPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730310843; c=relaxed/simple;
	bh=AKlsg8MKpbZLIJ56R8La4VLJsinqO3R9EOnpKXxoejk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=kdjIAV4sIXAW9P/ERf7kcip8m6axJG7qGW4s4CnIOjqg90SAEVffvOwHamsVINJHv/pjNohZ1zNtpAbYunvDbCSwojSXac/RrYWWheYy6fX0nGbo5CFwhmxYpEFmSe+tlGgDjb9jQmP+cPoyDu53PN/L08Q8nfiR/WcGO92gx7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=cVrMSWRk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49U9Tgut026938;
	Wed, 30 Oct 2024 17:53:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	islD7/hTAaJepVUU53aoHZr7I1505Jhxy29H8utccEo=; b=cVrMSWRkWUClr3/R
	U2XHFzzcw7rQzSkEMSVlPI9VM45lRL6jkoHUGsDaIV+aQa+m0qB4GB65Vc3hPBRx
	1y8GqPHLFWI1r5s2//jN07YJ2Z6Ij0sM6kpI6LFryfTUKVwnmCsC/YwmOuLFRmh0
	1YX0dAJE3tsnUOksIjXYi6dzloyV8JwvtO4a1Joz9ATS2QoEDVAONBRYUn29qxbz
	kQuyD4FBybjUIR2m1gLk+bkNn0JUdV+Pd+DXZIp31K6SevWz3+40WrUy9x9gtPwx
	8U4MpX4qhmzFn/oxGfuTn8FpCoQPpTtmbDut/fOm5uSiVtRyX2Iaf8lprmy2GHLT
	xUrXNA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42gqcqvxkw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Oct 2024 17:53:24 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49UHrN21008161
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Oct 2024 17:53:23 GMT
Received: from [10.216.35.255] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 30 Oct
 2024 10:53:14 -0700
Message-ID: <3f80ccd8-19b6-45cc-a34e-6fa420f78557@quicinc.com>
Date: Wed, 30 Oct 2024 23:23:11 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/11] dt-bindings: clock: Add Qualcomm QCS615 Camera
 clock controller
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Abhishek Sahu
	<absahu@codeaurora.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Catalin Marinas
	<catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Ajit Pandey
	<quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        "Jagadeesh Kona" <quic_jkona@quicinc.com>,
        Stephen Boyd
	<sboyd@codeaurora.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
References: <20241019-qcs615-mm-clockcontroller-v1-0-4cfb96d779ae@quicinc.com>
 <20241019-qcs615-mm-clockcontroller-v1-3-4cfb96d779ae@quicinc.com>
 <da47ugibewtz6zyezkaxpvver47pp46r62mabls56pleb7nqdy@bwuwbenkb2zw>
Content-Language: en-US
From: Taniya Das <quic_tdas@quicinc.com>
In-Reply-To: <da47ugibewtz6zyezkaxpvver47pp46r62mabls56pleb7nqdy@bwuwbenkb2zw>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Kc5bA-ntgXpxXk0Xee1GX_sLnDohq0V8
X-Proofpoint-GUID: Kc5bA-ntgXpxXk0Xee1GX_sLnDohq0V8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 adultscore=0 spamscore=0
 phishscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 mlxscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410300140



On 10/22/2024 11:31 AM, Krzysztof Kozlowski wrote:
>> Add DT bindings for the Camera clock on QCS615 platforms. Add the
>> relevant DT include definitions as well.
>>
>> Signed-off-by: Taniya Das<quic_tdas@quicinc.com>
>> ---
>>   .../bindings/clock/qcom,qcs615-camcc.yaml          |  60 +++++++++++
>>   include/dt-bindings/clock/qcom,qcs615-camcc.h      | 110 +++++++++++++++++++++
>>   2 files changed, 170 insertions(+)
>>
> That's some duplicate posting. I already reviewed some of the patches
> here, so please implement that feedback.

I will implement the fixes in the next patch.

-- 
Thanks & Regards,
Taniya Das.

