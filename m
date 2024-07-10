Return-Path: <linux-arm-msm+bounces-25797-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 380CC92CF1F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jul 2024 12:31:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D7E641F25802
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jul 2024 10:31:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18959193474;
	Wed, 10 Jul 2024 10:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="BBm1m4xK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CDCA19004B;
	Wed, 10 Jul 2024 10:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720607009; cv=none; b=Cl0xwnbFYZuwJ3yRgxsOepowerGq9FbMVZlgntgfH6NTxpsDi2Ps2tRBJCRDqrcj5DzVdj1V0uKpq/WLTNEoFEG/6ov0ns2VKeZEGYRnUHKoh4gLwNJf+NCRcAGXSi89u4uz5TjBh+IX22ma1i7unDlFYw7sW/DX04TT6Lzc8fQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720607009; c=relaxed/simple;
	bh=fcaO4h/+u+w3+nshc5FwqYeFFC6p7+zsydZ+zqXYiQM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=MOo1mnniCx8vOinEmZowr4/QuKhEd7826hoyk0U/sY4/ijFIkzZmAnIEeqZ62TRPvcCVGvAKd0+xMK16utmHrBKHOU/OK3xo2DH92A9d/0Ofm756NLejzEpRaQkNFxm5ooE4Y5ZmePbmQynLg5UNzQYF0wTpKMF2GZT6BCDqErw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=BBm1m4xK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46A9q512031417;
	Wed, 10 Jul 2024 10:23:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kG/I+Sehug8xvjfpoA+Y8R4NHvaPUsN6xVsDLdaFOlE=; b=BBm1m4xKwyACpGJa
	C4uyaKFCPTyXh13ayT08GesJoBU2PNSWuVj/UwK5NSP5S470yPUEdBX7JM8Cx3/i
	ts89LZOJOYcHlCNkG60Uc/Akbon0LoGhcbCokhQcL0abJFXZv4rPMgFt5jfuzIO3
	FtpAlHcKQqC3VDuHpRiuOpwXXgflv6bOkDYnjYd5W51IhimUsRb4SfnSvn+4XWf4
	k0A1Rf0n3QEcjzcVVuXTN0CnSPDDlC7x5AOTBf5vD8cA7NPRfzNO6bPG4eWdPMnu
	t2KQEXpHp7zEwwLHiVCZ8/6COLbJAkEinUPmrqxhSiEdMS88vQF+PLpd/hJw692X
	93xqAw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 406wmms5yw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Jul 2024 10:23:21 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46AANJDf024645
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Jul 2024 10:23:19 GMT
Received: from [10.239.132.204] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 10 Jul
 2024 03:23:13 -0700
Message-ID: <21a5ab8b-ed33-41d5-a478-1f38ce8226c1@quicinc.com>
Date: Wed, 10 Jul 2024 18:23:10 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dt-bindings: crypto: ice: Document QCS9100 inline
 crypto engine
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
From: Tengfei Fan <quic_tengfan@quicinc.com>
In-Reply-To: <46239515-badb-4ad7-8280-91074eae47bf@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 4farxQXVREIav9xRq9zWYeXE8cTWMxOh
X-Proofpoint-ORIG-GUID: 4farxQXVREIav9xRq9zWYeXE8cTWMxOh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-10_06,2024-07-09_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 spamscore=0 bulkscore=0 adultscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 mlxscore=0 mlxlogscore=999
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407100071



On 7/10/2024 6:16 PM, Krzysztof Kozlowski wrote:
> On 09/07/2024 15:08, Tengfei Fan wrote:
>> Document the compatible used for the inline crypto engine found on
>> QCS9100.
>>
>> QCS9100 is drived from SA8775p. Currently, both the QCS9100 and SA8775p
>> platform use non-SCMI resource. In the future, the SA8775p platform will
>> move to use SCMI resources and it will have new sa8775p-related device
>> tree. Consequently, introduce "qcom,qcs9100-inline-crypto-engine" to
>> describe non-SCMI based crypto engine.
>>
>> Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
>> ---
>> Introduce support for the QCS9100 SoC device tree (DTSI) and the
>> QCS9100 RIDE board DTS. The QCS9100 is a variant of the SA8775p.
>> While the QCS9100 platform is still in the early design stage, the
>> QCS9100 RIDE board is identical to the SA8775p RIDE board, except it
>> mounts the QCS9100 SoC instead of the SA8775p SoC.
>>
>> The QCS9100 SoC DTSI is directly renamed from the SA8775p SoC DTSI, and
>> all the compatible strings will be updated from "SA8775p" to "QCS9100".
>> The QCS9100 device tree patches will be pushed after all the device tree
>> bindings and device driver patches are reviewed.
>>
>> The final dtsi will like:
>> https://lore.kernel.org/linux-arm-msm/20240703025850.2172008-3-quic_tengfan@quicinc.com/
>>   
>> The detailed cover letter reference:
>> https://lore.kernel.org/linux-arm-msm/20240703025850.2172008-1-quic_tengfan@quicinc.com/
>>
>> Co-developed-by: Maria Yu <quic_aiquny@quicinc.com>
>> Signed-off-by: Maria Yu <quic_aiquny@quicinc.com>
> 
> This looks messy - wrongly placed, not in correct DCO order. Some tools
> will just ignore it, some might produce wrong result.
> 
> Best regards,
> Krzysztof
> 

Thanks Krzysztof!

I will fix the messy information in all the QCS9100 related patch series 
in the next.

-- 
Thx and BRs,
Tengfei Fan

