Return-Path: <linux-arm-msm+bounces-34859-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C485B9A356F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 08:32:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1813DB213E7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 06:32:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A975C17BEB7;
	Fri, 18 Oct 2024 06:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="FZsHjnxp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 280DF187339;
	Fri, 18 Oct 2024 06:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729233142; cv=none; b=jyDCs/DoPKyfBR5yNL0pCuFCA0mRJQSSYdfi6/S+2y5Ex6YKK5v3gbtriLh+s9CO4IJ2ssVuTYPO2Jun/L/aM/s1TJ34fvaZ0LTTjOxuZkmamfEln4QO3p2qcuYiDacAWxlKu0xb8UdHNV3uYxcZ9r+Cz0ENvtLYzlvrDrg9Qgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729233142; c=relaxed/simple;
	bh=RBbsmy0pgd1yHEdvREC300nWIODYwIgTapne369AcU4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=da5eVh1SbBQmuGK6lo0fjUODIOyo+eRC4J1ViUnPZXo8KVS5B19I6F6chifVDZy3J/+PolYNjf73eO/J0iuEYZtzM4gb6wSdz5YqjeBTy0VvI/Us6PTc8TDiYDc3driMVqMfjRQqymFOj5CRUj2r9dSdQPULcHFpE++QPz+W2sY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=FZsHjnxp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49I0NHCa005830;
	Fri, 18 Oct 2024 06:32:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NAsB94Uf/B5zfHWiXlHuP2BRqsvtHgo1G8A+Lzo/QG0=; b=FZsHjnxpyYHDiZIQ
	52WakfK1yBeEd2hCpKpCOIoAyTD5BVmXZBp/joDCl4oCRCHRiIo7zlTzedfu7gXj
	Y6egA6mdNmtUU4yK4zTE9OhKmAqwYQReuFZcaLhjDclDp5le5lAC32sWQ2qIr3Sb
	aU5mPatIxrW0toWiG4g3xT14N52dQOQuWQ9ZBFhTr1pQ8yAVebA1uA8K5rq8hOnX
	z4IhqVYs2Q3MA4t89TGD86gyTK00NtReXKP9k0eSHW2mGwrF58ZLzVnCieGMBMPt
	8oFf5KXoZUBXcUl4QlOq0S+yoVT2nJrlBMwI5Y7eveSvXTp5ejXuZ3Uk65++e8dW
	Z49aMA==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42bd3arrrw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Oct 2024 06:32:16 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49I6WGvx031587
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Oct 2024 06:32:16 GMT
Received: from [10.253.73.121] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 17 Oct
 2024 23:32:12 -0700
Message-ID: <abdb209a-3328-46f0-98d4-1a03e8da96d1@quicinc.com>
Date: Fri, 18 Oct 2024 14:32:09 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] dt-bindings: aoss: qcom: Document the qcs615 AOSS_QMP
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_tingweiz@quicinc.com>,
        <quic_aiquny@quicinc.com>, <quic_sudeepgo@quicinc.com>,
        <quic_taozhan@quicinc.com>, <quic_jiegan@quicinc.com>
References: <20241017025313.2028120-1-quic_chunkaid@quicinc.com>
 <20241017025313.2028120-3-quic_chunkaid@quicinc.com>
 <u7y2eu6t4ljk42rigfgxylpzpog2ygbwcou7e6jalnfqsqxsfy@ifezf2435be4>
Content-Language: en-US
From: Kyle Deng <quic_chunkaid@quicinc.com>
In-Reply-To: <u7y2eu6t4ljk42rigfgxylpzpog2ygbwcou7e6jalnfqsqxsfy@ifezf2435be4>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: NQ3mTraN_s6LAXjHz4GdM3Esfq1Pewvg
X-Proofpoint-ORIG-GUID: NQ3mTraN_s6LAXjHz4GdM3Esfq1Pewvg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 suspectscore=0 impostorscore=0 clxscore=1011 mlxlogscore=811
 malwarescore=0 adultscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410180039



On 2024/10/17 17:18, Krzysztof Kozlowski wrote:
> On Thu, Oct 17, 2024 at 10:53:12AM +0800, Kyle Deng wrote:
>> Document the Always-On Subsystem Qualcomm Message Potocol(AOSS_QMP)
> 
> typo: Protocol
Okay,I will fix it in the next version.
> 
>> on the Qualcomm qcs615 platform.
>>
>> Signed-off-by: Kyle Deng <quic_chunkaid@quicinc.com>
> 
> Best regards,
> Krzysztof
> 


