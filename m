Return-Path: <linux-arm-msm+bounces-52853-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D2C8A75F0C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Mar 2025 08:53:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2A9FC167AB9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Mar 2025 06:53:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 703E218CBE1;
	Mon, 31 Mar 2025 06:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="IuDv8R2S"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF76638F80;
	Mon, 31 Mar 2025 06:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743403985; cv=none; b=DKjUrLsRTOPkk91zo1XRIYGrqz5Nglcgz/weFib0X9vQShRtU+J9akUdr3skrkJUv5yycn9ecdk/sojNdZ5+PMhSc8G5GVkw9FDigRmSCJuHq17L/O5PrrOtAwshFtKiNoIZBW7ih0gnPnpFqpyNMdYuMLVrgJyuduiTrpR6lV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743403985; c=relaxed/simple;
	bh=yj/pxwHPLCCFPyOXDGMHSC1v/c4IiWOY0gjc+KrXFV0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=mPjY2Noy7tlMAkAbKtpnQ09E3oz3qgBcWfbmZpppfyVCisAiPyE+MkE1JPq3AdaovFASj4WpELzK6Vu8wcx1l/p91GoCab5xrSXsO/w4Xgd/XhxEZt0hJI2kwrdmU5luDvZfSb+PweEKqsvXarBcYvJq3ZPPA0trpQqKrzsLsTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=IuDv8R2S; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52V6kcHs014189;
	Mon, 31 Mar 2025 06:52:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BZ+YTWORFfoODnOFnZUutcfl5JuliNWq21uLksy5p30=; b=IuDv8R2Sogzg7psJ
	8aRBkWboIffzBLq1eymTkCz0zq1XUhM5NV0fPmC2EuBg+WWSO4dIOb1Q6bkw++II
	sMr/tWLFpa6pPksJ4e90feoIPsJ3VjUOqpfOUjyVRh6vp1LNEgs0iKHHSsXaVrfU
	4GrjvbliEEPV8pTyiHN7WuhDSX80PcKMWcnDvhCbUgnVXSqo6A7XGtSycvRHoLaU
	oFvFwZiQ38ZTJ63ecIAwvvkMLjy4Rf7E6W0n6CWXVQq9cH+p/ihuWbC1Y+9LXN2c
	sjG7tY5lg+jyAylpdEBw1iM1tmH5CAMzQ791mAJtq+imWlEO6vH3hDtwiIZaPynj
	o3UI5A==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45pa1num8a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 31 Mar 2025 06:52:55 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52V6qt99006487
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 31 Mar 2025 06:52:55 GMT
Received: from [10.216.38.66] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 30 Mar
 2025 23:52:50 -0700
Message-ID: <c6370b99-efde-46ab-a1a4-65b979ca2dfa@quicinc.com>
Date: Mon, 31 Mar 2025 12:22:47 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: i3c: Add Qualcomm I3C master
 controller
To: Krzysztof Kozlowski <krzk@kernel.org>, <alexandre.belloni@bootlin.com>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <jarkko.nikula@linux.intel.com>, <linux-i3c@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <andersson@kernel.org>, <konradybcio@kernel.org>
References: <20250326141641.3471906-1-quic_msavaliy@quicinc.com>
 <20250326141641.3471906-2-quic_msavaliy@quicinc.com>
 <991b0652-76f2-40d6-b49b-1e6f76e254ac@kernel.org>
 <661e1a21-0f3a-497a-9b3b-fab284e30d19@quicinc.com>
 <36b67f9c-5905-4fa6-8190-ab980850b3a2@kernel.org>
 <e997bd15-728c-4316-8050-d461f115fd9f@quicinc.com>
 <04945ad2-1372-4c73-beae-fc6449fb9a76@kernel.org>
 <838dfc8d-24c3-4f03-9c24-863259bb22b1@quicinc.com>
 <b68559e6-fc2b-493b-9f37-3125ff924a65@kernel.org>
Content-Language: en-US
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <b68559e6-fc2b-493b-9f37-3125ff924a65@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: vNeAZpDF50fZftzFKNSLKpbkfEJNRyTU
X-Proofpoint-GUID: vNeAZpDF50fZftzFKNSLKpbkfEJNRyTU
X-Authority-Analysis: v=2.4 cv=MPlgmNZl c=1 sm=1 tr=0 ts=67ea3bc7 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=yguuy8DFeHIEintHG0IA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-31_03,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 phishscore=0 spamscore=0 clxscore=1015
 bulkscore=0 mlxlogscore=999 impostorscore=0 mlxscore=0 adultscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503310047

Thanks Krzysztof  !

On 3/30/2025 3:12 PM, Krzysztof Kozlowski wrote:
> On 29/03/2025 15:31, Mukesh Kumar Savaliya wrote:
>> dt-binding file name: qcom,i3c-geni-qcom.yaml
> 
> No. I already asked to use compatible as filename. Don't create your own
> rules.
> 
okay, no problem. I was trying to follow previous i2c,spi, serial uart.
Let me make a cleanup patch for them also next as mentioned earlier.

For i3c, compatible will be "geni-i3c" as suggested by you , Rob.
dt-binding filename  "qcom,i3c-geni.yaml" OR "qcom,geni-i3c.yaml" ?
>> compatible = "qcom,geni-i3c";
>>>
>>> Best regards,
>>> Krzysztof
>>
> 
> 
> Best regards,
> Krzysztof


