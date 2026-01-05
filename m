Return-Path: <linux-arm-msm+bounces-87383-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 749EDCF2560
	for <lists+linux-arm-msm@lfdr.de>; Mon, 05 Jan 2026 09:12:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1AEA530010C4
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jan 2026 08:12:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4B542D63F6;
	Mon,  5 Jan 2026 08:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XLZso7zr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h9BS8ipN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 322432D8DC3
	for <linux-arm-msm@vger.kernel.org>; Mon,  5 Jan 2026 08:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767600724; cv=none; b=Yim57n2zMMpZOTczMZozgG1LgjGk3+Rkg7DGHtL/65hLBCp5zIKXeoV30Y2UjPh1fSk9b1zPTURbiQ34H0wfXvohu7XFbg/bOTArakEIYl1hUYuI+VrE3lqDLUUvffSgacAZ/SjSSxhiHt3Vf9lQP3bBiPds1XunA65aCb6mjFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767600724; c=relaxed/simple;
	bh=sL9mmiw1Ek3nuTojJp6/bs/wbFVaj40tOMUCFczLO7U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Kf0HMnt3F01LT7+wORAa6ViVfCF0oa3rER2vm0M2q+mHyK0lHNF6e3QA4LsbP8akqOX0RYgAPxqwDzE6fp2zuoQcrSTVy3Qh1y80phwqFj+RFXRmK0wGuk9idRoZ6Cvm49eLvPndvMPLFeslHZhFaV+sPx/CYjGHoAfyu97tPno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XLZso7zr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h9BS8ipN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 604MUdIZ3604116
	for <linux-arm-msm@vger.kernel.org>; Mon, 5 Jan 2026 08:12:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XvRC78V+Kcb+nz16MxAbPrDUiGsyPydNzbtsD7OPmqk=; b=XLZso7zrivKUnDv9
	NxOu+vqyx28a8ODMzFnjZBgWg6xSsuDSHZjaZeEU7zaHZBm1WVTh3JZDrvnQVEo0
	h+qagLywE8UOtl20FPaMbHr1j1NQF3ODexLJtOJq3GtAy6/0jKzYrJbICWNxrtP9
	nEDKqHsR6+ffAzHYjBfVtIraGclIYXbACH+mlncnZK8KJNGJBGymcFwG7Fl7aIuV
	RNKmOWWIm8Wj03/ctx5lJ5fja56CjRssyOE1QUu9VBGxVvRLMxDD7PXJOSiWhvW/
	/XLGq20AVCnnTxXo9FVpUVMt+F6WjvVgfVC8JWAs1qs/3GOZewbW+huIsbze/NdJ
	PhVqxA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4beu6t3nsy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 05 Jan 2026 08:12:02 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-815f9dc8f43so1944448b3a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Jan 2026 00:12:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767600721; x=1768205521; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XvRC78V+Kcb+nz16MxAbPrDUiGsyPydNzbtsD7OPmqk=;
        b=h9BS8ipNSNqknt9lhaz2ZMICOWOJK03fU5K0uC4yyJiPPjRa0kKrswgwQjKPcnvZkb
         zLoi/1KbTZRBeGsB23lKfbjhR50+bcCpCCuDVQtezlvWBQG5/TJ8ERSaLiGd+vzr7pQ6
         xwMTQ4whwFaqG9hSR1hYerhDsZljI46nLz/YT25NsxG7URKhX2T5q97EVu0AEcHxLVX5
         kKbAS8NXuFs0eF9x5X7F/gfB+2EGXp6/2rZiX4wHJkf8VlTIWcWUtAJ+ohtJjqv5HwI9
         NDG2p0ntg1gHZlornyq2CrcGa6VWpcf4f20fFuIvWLjrf/XOOInVbFfoi0fT5WBdRqMP
         /EBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767600721; x=1768205521;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XvRC78V+Kcb+nz16MxAbPrDUiGsyPydNzbtsD7OPmqk=;
        b=TZkKHzgejy9iCQU8MVHvsxA7dIl4sy5tbucmfWzV9Ai7LvGSRG9jL14MrtGkfFPJm0
         DgS6PADTRNNX5rMdSJQnd3RHK+vXAm23UanB29/PmhwUt45FOLZzlFqqOYbkiPvO/+1f
         hfAP8SVRivDIex04s5YEmzRX5DsKmdLpTmxT3T96ATUp6hycxCcNCXEGHOP3Ni40Lhi7
         NG6TxEszq66lPFT1QVgjkyT3QGqOKBblTDqZXl6nd9ZuCPXVXSmjg8jgVQcANzdewMeS
         XuPzGWFHY67LDzVaZLc50NNcUhAA110IVQi42IbcFRENkC7ncZxxlV2J1K50EAfg4/S+
         /5Gg==
X-Forwarded-Encrypted: i=1; AJvYcCXJSZO1AD188uqJUYVqAWj1Eoe9VWwIHLqq90TsBZqSWdLkC39UQm7eFfE74hVzsxeQ8Q9AEW6Z8o8qYBzz@vger.kernel.org
X-Gm-Message-State: AOJu0Yzr8TCMb/L5nSX/5qOWSnl6ud8GT4v38vvHg/rjYZB3e1RvzkJF
	iAyI+O0m1LaR2Y7vpIo+tJAfWtepdLEIRgUXZzq1dCE8xF5XIh22vME7yOl6NfWZQ5ciOJSDyoV
	m+0f+2OtAIF8ESNvIOOfbKsfYBAuBelV7px/GYEAeBN7VdE6rfHaWZ534xFaKa/Trs/gO
X-Gm-Gg: AY/fxX55xo+MkSQlqLci0wUmHqDYzoxWW0GetWvWB69bmmB26Kqgo0BCOX7NLi/Gt3/
	SKXZ08HcZUcTKEpGeF17cxGPZKy4DZPunOwARmqjhA5IRazCZJJM5EuZcVFBgKzBsIwh8yKnBFC
	CE7L/RKD7tIOUMqB6ggqqJaW7q7xs3lJnMSKy7ujYRo8EfGUqoTf8ea4+mAjdaq7F78/mtdJl9O
	SwfvODGdj5cRE8asEVTCUK8IUbHOySC/qJvsx8/x7hi9LkrPta+ciVHsstwrBiHvwqvEtN3dPVw
	NhwOzg6dMDQFRUtxxVdsxDTcW5VqchJC6+v7ymopu0EKgt/H9cLINcXUivrO3owHdSkvSoJVvnN
	IxV6INUJFty95vZ//z+Rfs8Uj/fNNX/DK7K1ZQ6CO82m3GMiBxBA=
X-Received: by 2002:a05:6a00:418f:b0:7e8:450c:61d5 with SMTP id d2e1a72fcca58-7ff66d5fe18mr37831966b3a.69.1767600720938;
        Mon, 05 Jan 2026 00:12:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE4pEalQ/S1gzH+PCmh2lNBlkf/m1qweLCoP8v4jj2jAYqu7jgAZHqb7rFgDkAig+pTtomiSw==
X-Received: by 2002:a05:6a00:418f:b0:7e8:450c:61d5 with SMTP id d2e1a72fcca58-7ff66d5fe18mr37831937b3a.69.1767600720455;
        Mon, 05 Jan 2026 00:12:00 -0800 (PST)
Received: from [10.217.216.105] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7e88cd71sm47276718b3a.64.2026.01.05.00.11.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Jan 2026 00:12:00 -0800 (PST)
Message-ID: <c106658b-7fe4-47cb-95b8-1970b397444a@oss.qualcomm.com>
Date: Mon, 5 Jan 2026 13:41:52 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 1/4] dt-bindings: phy: Add QMP UFS PHY compatible for
 x1e80100
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: vkoul@kernel.org, neil.armstrong@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, martin.petersen@oracle.com,
        andersson@kernel.org, konradybcio@kernel.org,
        taniya.das@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com,
        manivannan.sadhasivam@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
        nitin.rawat@oss.qualcomm.com
References: <20251231101951.1026163-1-pradeep.pragallapati@oss.qualcomm.com>
 <20251231101951.1026163-2-pradeep.pragallapati@oss.qualcomm.com>
 <20260102-heretic-angelic-narwhal-5d9d8c@quoll>
Content-Language: en-US
From: Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>
In-Reply-To: <20260102-heretic-angelic-narwhal-5d9d8c@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDA3MiBTYWx0ZWRfX87p9A4YNYZVE
 eJ4a03FuhOcEMVMjujdcG19H0biVGAXMHq05MchBTviIUIPCpxbn+1r5pGvatObWycxtMatwla/
 1ib90fl+hL98kdcTtR3k7c2jaZQR1mPMLHy0WiHDaP3Gxhj6arSijI+0WYXOwS2Nt3pRqRMCSVR
 FOWTXeHu0eL6CI6jlq4O22PLtBtXwKKDvMdTEzIpDsXK88dT2sZr2wME5HN30kxjA64tBJEa/+x
 6ZTeXqAEsIhHjqDztInOUnnu1ti8rKfiptO3vrruatJcptjp27rGJgsWJ4J/MRXATcA9cq8kRvg
 lNoGQbR7WUjmEAi+ufnO73zHxhndfB8fogVJh+mJyiA9gw5blpvrJqMvUnWG8TFFtw4ty9VJxUI
 5pFMFPspiShCvxAHbFXkEE/WPGM8P0peH5PckQRJtPJRcQLmBQEPNaXYhowxW6vExMvKpS5uL+a
 ugpNSQQPYTgw14mau5w==
X-Authority-Analysis: v=2.4 cv=HLbO14tv c=1 sm=1 tr=0 ts=695b7252 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=ZAgaqRceEw1IiIRpFMgA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: bdJywDfdn2AnQodEorWthZXNUFcUOMMU
X-Proofpoint-ORIG-GUID: bdJywDfdn2AnQodEorWthZXNUFcUOMMU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0 impostorscore=0
 spamscore=0 priorityscore=1501 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601050072



On 1/2/2026 4:53 PM, Krzysztof Kozlowski wrote:
> On Wed, Dec 31, 2025 at 03:49:48PM +0530, Pradeep P V K wrote:
>> Add the QMP UFS PHY compatible string for Qualcomm x1e80100 SoC to
>> support its physical layer functionality for UFS. Use SM8550 as a
>> fallback since x1e80100 UFS PHY shares the same tech node, allowing
> 
> What is a "tech node"?
At brief - tech node represents a generation (e.g., 7nm, 5nm, 3nm) of 
semiconductor fabrication technology.
> 
>> reuse of existing UFS PHY support.
>>
>> Signed-off-by: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
>> ---
>>   .../devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml    | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
>> index fba7b2549dde..552dd663b7c9 100644
>> --- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
>> +++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
>> @@ -28,6 +28,10 @@ properties:
>>             - enum:
>>                 - qcom,kaanapali-qmp-ufs-phy
>>             - const: qcom,sm8750-qmp-ufs-phy
>> +      - items:
>> +          - enum:
>> +              - qcom,x1e80100-qmp-ufs-phy
>> +          - const: qcom,sm8550-qmp-ufs-phy
> 
> 85 < 87, keep the order by last compatible. It was already screwed by
> Xin Liu in previous commit but you do not have to grow discouraged
> patterns.
> 
sure, i will update in my next patchset.

> Best regards,
> Krzysztof
> 


