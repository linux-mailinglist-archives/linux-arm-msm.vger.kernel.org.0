Return-Path: <linux-arm-msm+bounces-43964-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 17A6DA01EEA
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jan 2025 06:36:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3468C7A0338
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jan 2025 05:36:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 550EC15622E;
	Mon,  6 Jan 2025 05:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="SS13j9XG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C28F5171D2;
	Mon,  6 Jan 2025 05:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736141793; cv=none; b=T9ADMyNMlJQyPQOrYAjSnznA5/tYuZYA9YXIagb26xwuf6ntNN31q8Kahl65sWOoXm8FeZo2wSzFtF8W1qKbAvgibMI9pUkGTDJfNICfi5vsV/oLHerUbndGg15fe4jL1/x+h8KHEP/GfxMkZLvjiJ+nESJxMfyQq5WBt8hT8DY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736141793; c=relaxed/simple;
	bh=MZL0u7dkAvMTX1oJPqi2C7Ah8nUJQ1S0TC+hmUsRfk8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=VJzvx4bjJw97ToMQBTDuYiI9viw79H4cKIquHNqz7FKbIC6TVjXXfJzJ4yqWhK1OLUwUuAdIif5YXr7XHBeGNsNYTpfgCmdrLAuQdGq9FpUpaFOvXQc1Hq4TJW3aJza+cVFZ8zdjXVQ7Y397uVqhgP1yhxrE7W/IwUxChLLe74g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=SS13j9XG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5063XbGY032611;
	Mon, 6 Jan 2025 05:36:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZWjSPE375wCvmHehVIqPkjgjg9lH/7BvtFarqOjtsZ8=; b=SS13j9XGQWnnv5M5
	1+1sig5PteMR5hfB0Z9FceEjTlCOfxPcW8+0lISnOtYsqqW4Wva4w/VYwi+L4uy+
	Fy8prW8ZRuUZG8H5eAQ5xG7W5KBT/8e92UHCejMCpAYyKlLgoVZawcFSSXTgUrMe
	2VbWmpWTrItvanQ7vYAhVoRvYabr2/JDSKzPe81Z/TFiX9qRG76vK9YNu/4cb6zE
	yHS0WLeQ3ZwItONnIIigE+zMasmIwxLuLPqqBY/nLaAFJQpqhbX6VyFN1YgGB0RC
	apP0z1AXs0cxYzeSn30as6xSh+1LzaZLDWQC+TpNQRTVF5JXPLZKBhf3C5fZs08k
	t7XGbA==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4407ck86wt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Jan 2025 05:36:21 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5065aK3L027206
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 6 Jan 2025 05:36:20 GMT
Received: from [10.151.37.100] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 5 Jan 2025
 21:36:16 -0800
Message-ID: <2ae1d7f9-63da-47fd-8c39-4a87e2ce97c8@quicinc.com>
Date: Mon, 6 Jan 2025 11:06:21 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 1/2] dt-bindings: mailbox: Document qcom,tmel-qmp
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: <jassisinghbrar@gmail.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <andersson@kernel.org>, <konradybcio@kernel.org>,
        <manivannan.sadhasivam@linaro.org>, <dmitry.baryshkov@linaro.org>
References: <20241231054900.2144961-1-quic_srichara@quicinc.com>
 <20241231054900.2144961-2-quic_srichara@quicinc.com>
 <kwtzvcoyayml3tgicnp5a75r65hqpicm7hivtk25ohp6rt34qf@sgunxjxfe33r>
 <ac15561f-b9e7-4434-af1a-04408172d46c@quicinc.com>
 <d78bc184-b035-41bb-b5eb-088a86c6b77d@kernel.org>
Content-Language: en-US
From: Sricharan Ramabadhran <quic_srichara@quicinc.com>
In-Reply-To: <d78bc184-b035-41bb-b5eb-088a86c6b77d@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Iz6-HMa5AwKoRJNeQzl9HBoMuxinFgRM
X-Proofpoint-ORIG-GUID: Iz6-HMa5AwKoRJNeQzl9HBoMuxinFgRM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 suspectscore=0
 impostorscore=0 mlxlogscore=872 malwarescore=0 phishscore=0 mlxscore=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 bulkscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501060048



On 1/4/2025 12:13 AM, Krzysztof Kozlowski wrote:
> On 03/01/2025 19:34, Sricharan Ramabadhran wrote:
>>>> +description:
>>>> +  TMEL SS provides different kinds of services like secureboot, remote image
>>>> +  authentication, key management, crypto, OEM provisioning etc. This patch adds
>>>> +  support for remote image authentication. Support for rest of the services can
>>>> +  be added.
>>>> +
>>>> +  The QMP mailbox is the primary means of communication between TMEL SS and
>>>> +  other subsystem on the SoC. A dedicated pair of inbound and outbound mailboxes
>>>> +  is implemented for each subsystem/external execution environment which needs to
>>>> +  communicate with TMEL for security services. The inbound mailboxes are used to
>>>> +  send IPC requests to TMEL, which are then processed by TMEL firmware and
>>>> +  accordingly the responses are sent to the requestor via outbound mailboxes.
>>>> +
>>>> +properties:
>>>> +  compatible:
>>>> +    items:
>>>> +      - enum:
>>>> +          - qcom,ipq5424-tmel-qmp
>>>
>>>
>>> Why qmp? Can TMEL on IPQ5424 be anything else? Can TMEL be SMEM or using
>>> any other remoteproc?
>>>
>> TMEL on IPQ5424 uses only QMP protocol for communication.
> 
> 
> Then keep just "tmel". It completely defines this device.

ok.

Regards,
  Sricharan

