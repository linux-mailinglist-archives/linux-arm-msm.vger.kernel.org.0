Return-Path: <linux-arm-msm+bounces-54817-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 38031A9471F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 20 Apr 2025 10:16:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 47F533B74FE
	for <lists+linux-arm-msm@lfdr.de>; Sun, 20 Apr 2025 08:16:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D9B81E32A0;
	Sun, 20 Apr 2025 08:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="mgn/p3m2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B0868F5B;
	Sun, 20 Apr 2025 08:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745137015; cv=none; b=N7rd70gUh9Qbw3bjjnXxJM93JGTfCMkdEl+0YYGUSChGAoXxb/Zx3dct5udii2wK5/OCm8xyC2E2SWMChyfNHTQ1bGk6wM/qxjWfeniFYJZ1hMV471fVt3qFQQquIYInXJqcY5x4ROzVex20IAcgk3c3WQ8F5/yEu8uGRy9h68Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745137015; c=relaxed/simple;
	bh=fAI83R1Hc+Mck2dZdP8rUu5gY0p4WhXLJWXZVCOi4zU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=nWX7o4KhXCVHgoamBIu98bYfjrkqT1a0L/80B2aN42F26UE837kE5Htx9Pj+VDVFf1aiTExtz3OdofBXYYPuadUL4HykM4pv6ulA3IdCOJtzhHpxmHOjog20AfvMIlF2KgMBi4pUvwUsu+0j11u5h6SW2/0yQ5tEQKhYQ2gcjYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=mgn/p3m2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53K5Er4n027431;
	Sun, 20 Apr 2025 08:16:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T8V5FivsJSwKOA/GqRZig2+atb4s6qfJ9nlS/H3PBSc=; b=mgn/p3m2OjKLW/6q
	hGYes6/0NZtJhiKbciX8/38j9agfUMAF4TZld70Oi7QjP5mn5BIT1tk0lOHvIJPm
	fSN2gDN5JQ16Qhmeu3csnE3fl9ERuiD7qNmmheU+VFzhoZ+Z6dpEcKXVje17cpxq
	TizkFsnRJ+C+9DATmPLw8XH7VKfWMnpABkWNT+dJQhdEqHTwSLJEeV1+KZYE/ZBd
	HKRnGxhjP2RJ9rLC7f9BBRgZAjmAYBIuRc6wzU8waa+vzkqbqE2ciVz5vWfd1fak
	VsIb5x56EsfxTcU+NG0jrM5EOELf1LHuqt6IUor/gcexl8oyF88rMNgXjFwO778u
	mpgW2g==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46450p9ht0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 20 Apr 2025 08:16:42 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53K8Gf1u032196
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 20 Apr 2025 08:16:41 GMT
Received: from [10.216.55.51] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 20 Apr
 2025 01:16:38 -0700
Message-ID: <73989cd7-ea75-438c-a002-b83b999556c1@quicinc.com>
Date: Sun, 20 Apr 2025 13:46:35 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] dt-bindings: i3c: Add support for Qualcomm I3C
 controller
To: "Rob Herring (Arm)" <robh@kernel.org>
CC: <alexandre.belloni@bootlin.com>, <linux-i3c@lists.infradead.org>,
        <conor+dt@kernel.org>, <devicetree@vger.kernel.org>,
        <andersson@kernel.org>, <krzk+dt@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <konradybcio@kernel.org>, <jarkko.nikula@linux.intel.com>
References: <20250411113516.87958-1-quic_msavaliy@quicinc.com>
 <20250411113516.87958-2-quic_msavaliy@quicinc.com>
 <174440334691.3918820.6898145674623743895.robh@kernel.org>
Content-Language: en-US
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <174440334691.3918820.6898145674623743895.robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=Hd0UTjE8 c=1 sm=1 tr=0 ts=6804ad6a cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=VwQbUJbxAAAA:8 a=0zEQTNxZ-4jhgVUb3MkA:9
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: seBBRghoxq4EEt6ZBqszt6Ic0Kz1fg1H
X-Proofpoint-ORIG-GUID: seBBRghoxq4EEt6ZBqszt6Ic0Kz1fg1H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-20_03,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 mlxscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 adultscore=0 mlxlogscore=999 phishscore=0 clxscore=1015 spamscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504200067

Thanks a lot Rob ! Added RB-T in V5.

On 4/12/2025 2:00 AM, Rob Herring (Arm) wrote:
> 
> On Fri, 11 Apr 2025 17:05:14 +0530, Mukesh Kumar Savaliya wrote:
>> Add device tree bindings for the Qualcomm I3C controller. This includes
>> the necessary documentation and properties required to describe the
>> hardware in the device tree.
>>
>> Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
>> ---
>>   .../bindings/i3c/qcom,geni-i3c.yaml           | 59 +++++++++++++++++++
>>   1 file changed, 59 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/i3c/qcom,geni-i3c.yaml
>>
> 
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> 


