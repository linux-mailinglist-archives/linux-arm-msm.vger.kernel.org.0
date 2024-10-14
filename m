Return-Path: <linux-arm-msm+bounces-34301-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 362ED99C675
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Oct 2024 11:53:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D58921F232BE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Oct 2024 09:53:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87A38157484;
	Mon, 14 Oct 2024 09:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="lzxpxFjR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C102A146D55;
	Mon, 14 Oct 2024 09:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728899618; cv=none; b=uHBhkXcVR4OjwI8bJ3xqDwwlDRpbCpqpY02GHJOhj5+x8KZh4NxYR0EdgvNhBzgZRpD5UJLiLWTl7O4dC9+vHW97uCXSI2sxZYNaMpeQV9zCRNaumA7BFvQe2uUPM2058a1w8pPKZiFL5KW7+Ch9aHdEw1J/Gc3aUaxhC9wIiL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728899618; c=relaxed/simple;
	bh=e+Bwo2NC+pMNRd8ckI+Vz0wV5wuZi+wfJeI6HwZ7nfg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=McKhfGozn1bZBY6+nqiUsrOAaI04HuIJOFA3h4bj1usroIhBVbN+u8tMZJEsHZvmG4XzxoHTLKAB0kWAdxf2iB6pwujCHNRyzajIw6PE08RkgV5P0+maj9JRl9uIF4VEkDKnZ2hMygTEMHGemuohg4//qulouRdPTQAfRqyaUcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=lzxpxFjR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49DMvgj0015046;
	Mon, 14 Oct 2024 09:53:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x943eeIf1OGm4gHh4eXaE9srZxFaW2nqi0KQm3uYLxE=; b=lzxpxFjRdCAZ2ftC
	LPQv/rMcHl8AWBpsQdrdPiq0Z21pX5J4Ktb+0s87LXZY4B5+JLuckTSlAIDscSgi
	V6n7Rrc7MIvFRjmNbhe4Nc7VNDrspF1PSxe6uiF4Uuc0+8fjl0Ujrykv3CmkwVz3
	auNChqG1akDYNqd25xSsFzXKaubQlqLPIgNfpnSe+Rr8NOPj3IC/C4VbeZZ7WtS1
	qGjv2xyaiug55QsoAld5XpGpi+gpK3wl96oqXKFbC1Kq/pd0rlSB8495f5TyCLTT
	ZWeK+tN5dUYguGpTLwXVXE5Pg1N2ZjhHOBKEqMrFchtYubZDty6Q51wfhP3QdJpf
	XdGTeg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 427hvfuwsx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Oct 2024 09:53:26 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49E9rPIF025380
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Oct 2024 09:53:25 GMT
Received: from [10.239.132.41] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 14 Oct
 2024 02:53:21 -0700
Message-ID: <c316c6ff-b741-4186-8f03-f103efc51d1c@quicinc.com>
Date: Mon, 14 Oct 2024 17:53:18 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] dt-bindings: arm-smmu: Document Qualcomm QCS615 apps
 smmu
To: Krzysztof Kozlowski <krzk@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <robimarko@gmail.com>, <quic_gurus@quicinc.com>,
        <will@kernel.org>, <robin.murphy@arm.com>, <joro@8bytes.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <iommu@lists.linux.dev>
References: <20241011063112.19087-1-quic_qqzhou@quicinc.com>
 <20241011063112.19087-3-quic_qqzhou@quicinc.com>
 <af81be27-fdfa-4dec-a18c-56c7022e3c75@kernel.org>
 <2224b2fe-4e72-4371-9f0b-d5ee211c2210@quicinc.com>
 <4102024c-d4a9-494d-b855-c5f770228788@kernel.org>
From: Qingqing Zhou <quic_qqzhou@quicinc.com>
In-Reply-To: <4102024c-d4a9-494d-b855-c5f770228788@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: LsRrV4vBcDNpys5sRunHPVuFPmZE2lxD
X-Proofpoint-ORIG-GUID: LsRrV4vBcDNpys5sRunHPVuFPmZE2lxD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 bulkscore=0 mlxlogscore=999 malwarescore=0 mlxscore=0
 clxscore=1015 adultscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410140071



在 10/14/2024 2:52 PM, Krzysztof Kozlowski 写道:
> On 14/10/2024 05:09, Qingqing Zhou wrote:
>>>> ---
>>>>  Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 1 +
>>>>  1 file changed, 1 insertion(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
>>>> index 92d350b8e01a..9e62c2cdda08 100644
>>>> --- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
>>>> +++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
>>>> @@ -36,6 +36,7 @@ properties:
>>>>          items:
>>>>            - enum:
>>>>                - qcom,qcm2290-smmu-500
>>>> +              - qcom,qcs615-smmu-500
>>>
>>> This is incomplete? No clocks? No power-domains?
>> This is APPS SMMU, no clocks and no power-domains are needed for DT.
> 
> Then express it in the binding.
OK, will add this in next patch version.
> 
> Best regards,
> Krzysztof
> 

