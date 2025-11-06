Return-Path: <linux-arm-msm+bounces-80546-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D6702C39D1A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 06 Nov 2025 10:31:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 86DAB3BAB4B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Nov 2025 09:31:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42C192550CA;
	Thu,  6 Nov 2025 09:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="WCLHVOIL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7447935965;
	Thu,  6 Nov 2025 09:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762421479; cv=none; b=h3TemJJ04vUJsjJBW9rr2jzPJFNXsnHOjIiNZNk3ZXAttDbPh0yRHe7/jjEoHBZwLO/RcsDmVY27rtDh34m355TyrdOHkxzXCDS+rtTgeUAFwP5GBkxKHGfuAPwOPEYvu0fDGz+QTs98lYT2So/vtRrdTdDUEE9XdvNNmsqrndI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762421479; c=relaxed/simple;
	bh=8tuXIJaRQj67Wuzt3GQJZZ9j955PqstWCmEb3K0qaJ8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=u3iv8DRqH4soJ0A2JumoCW1zWlrHn/lw9r1TR/CyO+pcOvrzy+WSmuKBxvVW/C/TPgu73swQBaG4vcIKuCHgRcHKs0iKe1XZqIaJTeWpidqqe25zKa740SZooxmZibV3DueBzoA7lmYWLdE74GSa6CQBoFnCzJwoVqQtjssaNUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=WCLHVOIL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A690r6q2797652;
	Thu, 6 Nov 2025 09:31:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E1ifgCrzhtp1+j9Pung6ohTcRTZrJt0ve1KAMLyjOMk=; b=WCLHVOILHMO6EOWz
	K4oqoEaEdpNkA3DQqiwiXVQQkXZZuR0thIYFQHxfbK1wy9C+m2mZrccMOFD1pT+1
	V5+2C2TiW/Ih7/84J7eTtGPfk72oaXvCCKpo7lizjbEj5urcb7woCax/sc20T5gZ
	M+91LCFgY7G+0vNUKHLIVn6KDo4tYdikqzTe5PsGlbWpDebjkyLfiKy2MQ+t9Ila
	wKmCZYsw3CcqvuH3ZFGiyObSrs/UgsIsYr2oTslwduN/ZYeZN4poo6a2xg0j7Ktt
	SWHtCBHzf9q36hFEcdsJQ8TlXeZXEfQYHn+G2MKuOey6E3ZOpq4gfIhROX7C+66U
	EPFY/A==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a8hyts7h3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Nov 2025 09:31:14 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5A69VEqA020470
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 6 Nov 2025 09:31:14 GMT
Received: from [10.204.78.32] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.24; Thu, 6 Nov
 2025 01:31:10 -0800
Message-ID: <c6ef0324-c932-4c80-8252-97dd3ee255d3@quicinc.com>
Date: Thu, 6 Nov 2025 15:01:07 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: qcs6490-rb3gen2: Use 'edp_hot' function
 for hpd gpio
To: Bjorn Andersson <andersson@kernel.org>
CC: <konradybcio@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_riteshk@quicinc.com>, <quic_rajeevny@quicinc.com>,
        <quic_vproddut@quicinc.com>
References: <20251031085739.440153-1-quic_amitsi@quicinc.com>
 <nzg7auudxocxnpnjsc2emot7sgh5azvucl72jqzgqsp4jhzint@hykb2xyx66uh>
Content-Language: en-US
From: Amit Singh <quic_amitsi@quicinc.com>
In-Reply-To: <nzg7auudxocxnpnjsc2emot7sgh5azvucl72jqzgqsp4jhzint@hykb2xyx66uh>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: e0rMN5I_0VamN8TIDerrPR0BN_k2Hq8v
X-Proofpoint-ORIG-GUID: e0rMN5I_0VamN8TIDerrPR0BN_k2Hq8v
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA2MDA3NiBTYWx0ZWRfX8Qz6ZiMVY6Zd
 R+RKR3EgmKNmdheHITTOGKMjZFXvYhV/aFKvNwTfEMpJPDjSpaEox8nQP7puL6jT5qF7gyN/EtN
 eZtdwoxMpHxc/resGTxcCrAzxu6Ek/YvfoQOM28wBl746XstcJ7PpKw/8BA7z3c6ckO0cHk4xTe
 uFnEs8xGgVYDl9UUa4q5qo5eIm8B9A7qG3YSP6FBivdCoc0jZHjKGs2GNrHQO1JhjFOZ+pxalQm
 eWW4YRQ7zJlNKba6R+x0LibxxDmx8MwFIVIQCQd5+Q0Bq0vu117PkFEu5t2x7bLQ0YmI46A59LZ
 cQZjQ35xbNlK5ZKHEgTkdNLPd+OkL5+9zMtFLsPVNrnRatBc2uRwDJMfFJhME2PL2LYGjcMhUvX
 I+FhGpkqkT3taIJZ5D38M3lBI+3PBQ==
X-Authority-Analysis: v=2.4 cv=X+Rf6WTe c=1 sm=1 tr=0 ts=690c6ae2 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=X2bJkxrq0LOtwHL-icMA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-06_02,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 clxscore=1015 malwarescore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511060076



On 11/2/2025 12:29 AM, Bjorn Andersson wrote:
> On Fri, Oct 31, 2025 at 02:27:39PM +0530, Amit Singh wrote:
>> Currently, hpd gpio is configured as a general-purpose gpio, which does
>> not support interrupt generation. This change removes the generic
>> hpd-gpios property and assigns the edp_hot function to the pin,
>> enabling proper irq support.
>>
> 
> No, it replaces the use of display-connector for hotplug detect with the
> DP-controller's internal HPD logic.
> 
> There might be good reasons to do so, but you need to describe them.
> 
> I'm guessing that there are still some issues in the DP driver's logic
> for handling of external HPD? This should be addressed by fixing that
> logic in the DP driver, to ensure that this (display-connector +
> hpd-gpios) works, and then you should send this patch again explaining
> why the internal HPD hardware does a better job.
> 
> Regards,
> Bjorn

Thanks for the feedback and clarification.

We observed a specific use case where using the GPIO-based external HPD
handling via display-connector leads to a functional issue.
When the DisplayPort cable is already connected and the display is active,
and we perform a system reboot, the display does not come up automatically
after boot with the current configuration (using hpd-gpios).
This happens because we do not receive a connect event post boot —
the GPIO-based HPD path does not generate an interrupt in this scenario,
as the line remains high and no edge event is triggered.

However, when we configure the pin with the edp_hot function and use the
internal HPD logic of the DP controller, the controller correctly detects
the HPD state after reboot. The internal HPD block generates the necessary
interrupt, and the display comes up automatically without requiring a
replug event.

This behavior aligns with other Qualcomm reference platforms where,
if the controller’s internal HPD is available, it is preferred over
the external GPIO path. Using the internal HPD provides more reliable
detection and keeps the configuration consistent across platforms.
So, this change ensures:
1. The display recovers correctly after reboot when the cable
remains connected.
2. We leverage the controller’s native HPD interrupt capability for
better reliability.
3. We maintain consistency with other DP-enabled Qualcomm boards that
use internal HPD.
4. edp_hot follows the Source device behavior upon HPD pulse
Detection [VESA DP standard v1.4 section 5.1.4].

I’ll add these details to the commit message in the next revision.

Thanks,
Amit

