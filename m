Return-Path: <linux-arm-msm+bounces-50379-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 847F3A503F5
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Mar 2025 16:56:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AC82F164ABD
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Mar 2025 15:56:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 322C024A056;
	Wed,  5 Mar 2025 15:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="dQV0vHQv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF45117583;
	Wed,  5 Mar 2025 15:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741190195; cv=none; b=eKPksVUp01KolK51yRjEAoZogPA0rG8EUAJDqYX/WVMBvsRt13tuOc6Z+vLLskwG5tkdmO4lTPIwQ5jhTsbRg8bRAYQ5pozVhj7/lgXPnT4GCWuEzBBnrgnBO2F0aFx6D69/Yi3l080eCrWEYNro3HAWtRUstlDLdd+EvGFNGqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741190195; c=relaxed/simple;
	bh=oQsw9htoZyxwQw/DmSFXH6adXQmd1lXtCHHo9uwy0Ck=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ehgsHyiqxJnVsn8wNyNWzzllRa3mjkG+v6MfdvD+91O3IvnR1Ol1rRDXc2+Q2z2asu4Cbgu2dUL+L634CyZGLyFMMVJ+UA1Xun6LD8EYk0Y6iBmamG4hndtDvD4ucBANiW+ObcnLtCf4LzeBBALM3msnTA5PRCYErgqTu1vOXa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=dQV0vHQv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 525AVASW022020;
	Wed, 5 Mar 2025 15:56:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Mk1ob+/x6BrwtUiB6U5SUajg1O+M3YRlAxF6UW/pTT8=; b=dQV0vHQvkYekOsub
	aCl7K2/fmYbl2Ei7+IWq0gotAdOcecgh/AripHMR6JQ3lTNlS336dDLXq/tk+f0W
	CNCn6FuDbmFzb+8LjfL13W9oIcGj6jquLADh5nVb/Z5XTN3teNlgYsYzktDeV6xX
	6rj926QoSZpxLwrb2WC974XzWc/lCsTFqsEdUsH/STC/7uxrrc7a2+15fPJShPX6
	o+49GM4Lc0/J+Eko7KtUyeSql+LPEcfa8XRfNApyZfeejLvtFBqiUF/Hb5zQq8rU
	rMbwVrCI4Kmg0VvKyqPTNGizIR0JJW7lcXu6nZYK3nXl2YZGkHbObxLcbUQXcSM8
	avgJDQ==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 455p6untgh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Mar 2025 15:56:30 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 525FuUDu028287
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 5 Mar 2025 15:56:30 GMT
Received: from [10.216.60.184] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 5 Mar 2025
 07:56:26 -0800
Message-ID: <d93cba49-5355-4394-83a2-e585296cc849@quicinc.com>
Date: Wed, 5 Mar 2025 21:26:26 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: qcom6490-idp: Add IPA nodes
Content-Language: en-US
To: "Rob Herring (Arm)" <robh@kernel.org>
CC: <krzk+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_rpavan@quicinc.com>,
        <andersson@kernel.org>, <konradybcio@kernel.org>,
        <quic_sarata@quicinc.com>, <conor+dt@kernel.org>,
        <devicetree@vger.kernel.org>, <quic_sharathv@quicinc.com>
References: <20250304152133.GA2763820@hu-kapandey-hyd.qualcomm.com>
 <174112750057.3751450.15783784234696025160.robh@kernel.org>
From: Kaustubh Pandey <quic_kapandey@quicinc.com>
In-Reply-To: <174112750057.3751450.15783784234696025160.robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: EWHCzSKUB-lhQQ_6re9Ic63iV_hy6vW7
X-Authority-Analysis: v=2.4 cv=H40hw/Yi c=1 sm=1 tr=0 ts=67c8742f cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=7VjZp_oamj8JExNPJH4A:9
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: EWHCzSKUB-lhQQ_6re9Ic63iV_hy6vW7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-05_06,2025-03-05_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 adultscore=0
 impostorscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 mlxscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 spamscore=0 mlxlogscore=912
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503050122

On 3/5/2025 4:03 AM, Rob Herring (Arm) wrote:
> 
> On Tue, 04 Mar 2025 20:51:33 +0530, Kaustubh Pandey wrote:
>> Add IPA nodes for Qualcomm qcm6490 board.
>>
>> Signed-off-by: Kaustubh Pandey <quic_kapandey@quicinc.com>
>> ---
>>  arch/arm64/boot/dts/qcom/qcm6490-idp.dts | 8 +++++++-
>>  1 file changed, 7 insertions(+), 1 deletion(-)
>>
> 
> 
> My bot found new DTB warnings on the .dts files added or changed in this
> series.
> 
> Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
> are fixed by another series. Ultimately, it is up to the platform
> maintainer whether these warnings are acceptable or not. No need to reply
> unless the platform maintainer has comments.
> 
> If you already ran DT checks and didn't see these error(s), then
> make sure dt-schema is up to date:
> 
>   pip3 install dtschema --upgrade
> 
> 
> New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/qcom/' for 20250304152133.GA2763820@hu-kapandey-hyd.qualcomm.com:
> 
> arch/arm64/boot/dts/qcom/qcm6490-idp.dts:119.31-122.5: ERROR (duplicate_label): /reserved-memory/ipa-fw@8b300000: Duplicate label 'ipa_fw_mem' on /reserved-memory/ipa-fw@8b300000 and /reserved-memory/ipa-fw@8b700000
> ERROR: Input tree has errors, aborting (use -f to force output)
> make[3]: *** [scripts/Makefile.dtbs:131: arch/arm64/boot/dts/qcom/qcm6490-idp.dtb] Error 2
> make[2]: *** [scripts/Makefile.build:461: arch/arm64/boot/dts/qcom] Error 2
> make[2]: Target 'arch/arm64/boot/dts/qcom/qcm6490-idp.dtb' not remade because of errors.
> make[1]: *** [/home/rob/proj/linux-dt-testing/Makefile:1462: qcom/qcm6490-idp.dtb] Error 2
> make: *** [Makefile:251: __sub-make] Error 2
> 
> 
> 
> 
> 
Sure, Rob. Thanks for review.
Will check on these warnings and update new patch.

Thanks,
Kaustubh

