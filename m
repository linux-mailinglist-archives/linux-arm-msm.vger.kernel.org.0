Return-Path: <linux-arm-msm+bounces-50135-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 76562A4D750
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 10:04:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7A9993AC805
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 09:04:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 228E61FC7EF;
	Tue,  4 Mar 2025 08:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="jMoCZOEY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 649021FAC59;
	Tue,  4 Mar 2025 08:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741078688; cv=none; b=PapT8YgLzTIwMZQ72ieiDReyTIjrYJeAuPNZ9wcZIJWJ9Pc0+YKyHAKXKqOpvV9X5SoFP9Q1NuaoSBKmF7Pkfg3PIZZ1zsa6H3FsvY0/gFLrQfWsZr7msuU0Xs/THeZPtXRNjhEI9/j7RIqRDyZv6BIfQUmE7dsZyGqqdyR28mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741078688; c=relaxed/simple;
	bh=ddy7BgWCBWeuZUy2eIZh8ooD1wt0aH8qK5EF6t6ee0U=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=cJv7sg3Bj+nc+3IpIXvHpV3lPVUThHfFiWQBy9+TCkUmgHcSAHpXjFQGqMFsPsnM80pKeB2+NVkfYlEqkH2nMgesOLbRC6ekBobStAq05fEzEiHl9aODReMJ5k+5vmIHLPp2N2GPdOEO4CcIlCgb57NVznaIO6+9UtbgXEs3nc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=jMoCZOEY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 523NX3lX006113;
	Tue, 4 Mar 2025 08:58:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JtNqsTlqI2gMEyukBobe1UA3U9C+2jFIY+BhbFzyXSo=; b=jMoCZOEYPph2YD+t
	aOz9KMKpHPQjhX0bUi8bTqbn3U4nTtcabwt+w3hvYABpWx7lm1ch8dV0tWcpV4JA
	hT1EsIDDQzxR/9Lj8Yz+VwIbwQIFX8/SEE4jmb231tFutvGsnmvZUSBirZGhx8Jr
	aPy8UZ6eCYVdMUmW66VO5KUXeOIxwFGS3UN+C4fFm+ZUy4yx1sJqLbHM4YKWUvpM
	1B3j4qitZsFHjsq1QH1OsFi2taLXnwoneUQHMlfmqrNWm+s8X/JToVOcDFS9r3/b
	NOqauJf8UJtrFmOl8FFJ9UGKD3BHVity6tAoD7yGccZteZIRyf22V+FpXS8ejaIF
	AfzzmA==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 455p6th8yg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Mar 2025 08:58:01 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5248w0Y4015630
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 4 Mar 2025 08:58:00 GMT
Received: from [10.216.44.43] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 4 Mar 2025
 00:57:56 -0800
Message-ID: <9db40fd1-a9bc-421e-b322-c309edb095d0@quicinc.com>
Date: Tue, 4 Mar 2025 14:27:53 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 1/2] dt-bindings: mailbox: Document qcom,tmel-qmp
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <jassisinghbrar@gmail.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <andersson@kernel.org>, <konradybcio@kernel.org>,
        <manivannan.sadhasivam@linaro.org>
References: <20250228045356.3527662-1-quic_srichara@quicinc.com>
 <20250228045356.3527662-2-quic_srichara@quicinc.com>
 <velvqajyhrdaipmqmsduv3l3dsv56sy4rfukwm2hrdvh47hgqx@7sbnrgkzsn67>
 <1a22a637-c3f1-49b3-adf5-3e952c7d336a@quicinc.com>
 <5xjtb4cifjjagkeifpkgx4y5cb7mwrocv7sxq3lh4lhadtw2bn@umtwhw7eqkhe>
Content-Language: en-US
From: Sricharan Ramabadhran <quic_srichara@quicinc.com>
In-Reply-To: <5xjtb4cifjjagkeifpkgx4y5cb7mwrocv7sxq3lh4lhadtw2bn@umtwhw7eqkhe>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=HZbuTjE8 c=1 sm=1 tr=0 ts=67c6c099 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=gEfo2CItAAAA:8 a=COk6AnOGAAAA:8 a=yp3r7umGiTXjgQfZ3P4A:9
 a=QEXdDO2ut3YA:10 a=sptkURWiP4Gy88Gu7hUp:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: LUzPKvJdMvzL8nO84qMGWjlsnHR5YBFO
X-Proofpoint-ORIG-GUID: LUzPKvJdMvzL8nO84qMGWjlsnHR5YBFO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-04_04,2025-03-03_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 mlxscore=0 spamscore=0 clxscore=1015 phishscore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 malwarescore=0
 mlxlogscore=770 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2502100000 definitions=main-2503040075

<..>
>>>> diff --git a/Documentation/devicetree/bindings/mailbox/qcom,ipq5424-tmel.yaml b/Documentation/devicetree/bindings/mailbox/qcom,ipq5424-tmel.yaml
>>>> new file mode 100644
>>>> index 000000000000..2e3c79add405
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/mailbox/qcom,ipq5424-tmel.yaml
>>>> @@ -0,0 +1,62 @@
>>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>>> +%YAML 1.2
>>>> +---
>>>> +$id: http://devicetree.org/schemas/mailbox/qcom,ipq5424-tmel.yaml#
>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>> +
>>>> +title: Qualcomm TMEL IPCC channel
>>>> +
>>>> +maintainers:
>>>> +  - Sricharan Ramabadhran <quic_srichara@quicinc.com>
>>>> +
>>>> +description:
>>>> +  TMEL SS provides different kinds of services like secureboot, remote image authentication,
>>>> +  key management, crypto, OEM provisioning etc. This patch adds support for remote image
>>>> +  authentication. Support for rest of the services can be added.
>>>> +
>>>> +  The QMP mailbox is the primary means of communication between TMEL SS and other subsystem on
>>>> +  the SoC. A dedicated pair of inbound and outbound mailboxes is implemented for each
>>>> +  subsystem/external execution environment which needs to communicate with TMEL for security
>>>> +  services. The inbound mailboxes are used to send IPC requests to TMEL, which are then processed
>>>
>>> This string is 100 chars long. What is the recommended wrapping
>>> boundary?
>>>
>> I kept it as 100 and checkpatch did not throw any warnings.
> 
> "The preferred limit on the length of a single line is 80 columns."
> 
> Documentation/process/coding-style.rst
ok, will fix.

Regards,
  Sricharan

