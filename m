Return-Path: <linux-arm-msm+bounces-27232-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97BDE93F2BF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 12:32:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B80C41C21CD1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 10:32:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3985F1448D7;
	Mon, 29 Jul 2024 10:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="adhOhIdb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1D0328399;
	Mon, 29 Jul 2024 10:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722249146; cv=none; b=VRP2e6tyScxsEyvp7YJkrpOnINxPfrjXOIJULK5SG4NB5HQL5YyGahipbYE3KYcbTL1mGs8vixUIdmiLYRdALRkG40tShJlAeNOWx2ShGQ74M0iZMz7eVka4Cq3dcs5XB9c0XwWyX8NdP3oX84vFJEbs1Ey6dcsTO8Ddel+ODHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722249146; c=relaxed/simple;
	bh=0JiOCSxkf9iCYCBuIA/pCfo25zjRRSDbvdu02TKFtS4=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:CC:References:
	 In-Reply-To:Content-Type; b=VBLhg5zKcwGj5CstleFH2WRYx7lEySSUxFWurzm7Py+yyyx1bXoYKKeijKhTo3vvlwnNRXxzNOrmaJrqzqSte5VhGavoT74BOlA2DsWoVaEKmGFFkTEbkOou+na7BtX3cMgTQnkZ2MUZiWqvOwUvsJcGd+h8sh3Gf/2li++hllw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=adhOhIdb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46TADSs1014190;
	Mon, 29 Jul 2024 10:27:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+LleWXTjGmWz/0Od+eQsmQiVYH4kwxgfQd2AFTRfKe8=; b=adhOhIdbJzvKRv3s
	3A4SPm2oIHuFzA9/NGHWajo9LUqMe/XiB8d+EM79mUOHQR78HoWAOdWNApYJvftA
	CmMNLzNdnixqv45janduu7BhOkSFPt3j1ULOrGi215KFuRLNH9K36aiqsMwi6aIR
	MBaIAjFwb64kFPuLG6SWYFkFp9JJX9WW3pxqe4fYbtG3J/SHpJ6aouHC1bUw+Uhd
	8UoEqGQuClfsAsYa9sypbpg3x5rN3B7grt1ddX9Vjbo2aPgNqSdR4Om6jgiDNp9s
	jHpLzA4m7L7GXLec/hJk3TPM3kg+We9H/doMEXmNUDReSmV40WTc13PP6V3zFdgi
	tSNIlw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40mr7gm0na-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Jul 2024 10:27:08 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46TAR7R1025532
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Jul 2024 10:27:07 GMT
Received: from [10.239.132.204] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 29 Jul
 2024 03:27:02 -0700
Message-ID: <f7be1d1d-3b6f-4a75-b5f6-429b25f84e63@quicinc.com>
Date: Mon, 29 Jul 2024 18:26:55 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dt-bindings: crypto: ice: Document QCS9100 inline
 crypto engine
From: Tengfei Fan <quic_tengfan@quicinc.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Herbert Xu
	<herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        "Rob
 Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-crypto@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel@quicinc.com>, Maria Yu <quic_aiquny@quicinc.com>
References: <20240709-documnet_qcs9100_crypto_engine_compatible-v2-1-59bd16b1a99c@quicinc.com>
 <46239515-badb-4ad7-8280-91074eae47bf@kernel.org>
 <21a5ab8b-ed33-41d5-a478-1f38ce8226c1@quicinc.com>
In-Reply-To: <21a5ab8b-ed33-41d5-a478-1f38ce8226c1@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: ORsYOYPhJjGgILjE8uXnPy51mx6GvlxI
X-Proofpoint-GUID: ORsYOYPhJjGgILjE8uXnPy51mx6GvlxI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-29_08,2024-07-26_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 impostorscore=0 adultscore=0 mlxscore=0 lowpriorityscore=0 malwarescore=0
 spamscore=0 clxscore=1015 priorityscore=1501 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2407290070



On 7/10/2024 6:23 PM, Tengfei Fan wrote:
> 
> 
> On 7/10/2024 6:16 PM, Krzysztof Kozlowski wrote:
>> On 09/07/2024 15:08, Tengfei Fan wrote:
>>> Document the compatible used for the inline crypto engine found on
>>> QCS9100.
>>>
>>> QCS9100 is drived from SA8775p. Currently, both the QCS9100 and SA8775p
>>> platform use non-SCMI resource. In the future, the SA8775p platform will
>>> move to use SCMI resources and it will have new sa8775p-related device
>>> tree. Consequently, introduce "qcom,qcs9100-inline-crypto-engine" to
>>> describe non-SCMI based crypto engine.
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
>>>
>>> The final dtsi will like:
>>> https://lore.kernel.org/linux-arm-msm/20240703025850.2172008-3-quic_tengfan@quicinc.com/
>>> The detailed cover letter reference:
>>> https://lore.kernel.org/linux-arm-msm/20240703025850.2172008-1-quic_tengfan@quicinc.com/
>>>
>>> Co-developed-by: Maria Yu <quic_aiquny@quicinc.com>
>>> Signed-off-by: Maria Yu <quic_aiquny@quicinc.com>
>>
>> This looks messy - wrongly placed, not in correct DCO order. Some tools
>> will just ignore it, some might produce wrong result.
>>
>> Best regards,
>> Krzysztof
>>
> 
> Thanks Krzysztof!
> 
> I will fix the messy information in all the QCS9100 related patch series 
> in the next.
> 

After considering the feedback provided on the subject, We have decided
to keep current SA8775p compatible and ABI compatibility in drivers.
Let's close this session and ignore the current patche here.
Thank you for your input.

-- 
Thx and BRs,
Tengfei Fan

