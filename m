Return-Path: <linux-arm-msm+bounces-88732-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E812D17A57
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 10:33:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 52D7D3003187
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 09:33:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7742736C589;
	Tue, 13 Jan 2026 09:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j3zlSVrG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OMsqlV3f"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0B20341674
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 09:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768296816; cv=none; b=Uzalt2xa+WYG1hIOw5DuaZTnyCNmowSj1CcC5JOjgQ4W+YiPbd6uy39YxIDCfv7bllSVnIAlOq09DfPyH0GKF87AdA6xM2ZtT8zgp9o4DdUnTYR/goj3Zemf9FwWvou6GttoOYaLrLCSLXOCRsypNVAtds0ozR1lri0Dk/uzlBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768296816; c=relaxed/simple;
	bh=H8rfWCz+nXlb+YRhv9ajoJCIpOgmMFGeDLzv4IonWdc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mm9Y6FH+s/5iivcT05Ftx5A/2loPfOBTHXAYMeFaUeAiktyepUGZU7KfDbv8G1rngK0jGe0H7JesFyOiF/+yvkI5BRwrN76nWFbGN+xaoi9wPA8UB1xuSM1BD8O5F8ELy0PO8+qcRBqI1t6pOx43xIxvA6OgUW7ZKfr2nTiW5zE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j3zlSVrG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OMsqlV3f; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60D5nU0R3735127
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 09:33:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7F6fqsyOtjM5uYbaPFIgQgGuXH/dsJ28oj9X44dO5jU=; b=j3zlSVrGbRUk2srz
	Y+Bki3mJ+ZJPIBCZbguoSOhQP6tRoE06CAAH02ft5gDXZxn4kN+J9Pk+HCsVX/uj
	c+8XYVTIBJQVZdRzYa9X+mXq7CmEuOWyKXzP+3uF4R0gORP3GdA27bK4xdoajqHh
	pbTLfk0ViY1moB/mIfpblNrbnvP6PVTQeV3FVrWFKjh+KBwslTee2y8jE+5tLip3
	hne7v93Zu01AxAaWChKS+KH3Q6P7tgBCmVA3daw5Jp9IccrwQzjfOaKa4BVfH6nv
	iEQrlNDNjXiIv9qAJPcn6NaNbwRnUypmUk7+UkuV/5oFRCNrWnyoLkyFl8OXgHNk
	m4r9yw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bng878nrx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 09:33:33 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-81eef665b49so6505469b3a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 01:33:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768296813; x=1768901613; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7F6fqsyOtjM5uYbaPFIgQgGuXH/dsJ28oj9X44dO5jU=;
        b=OMsqlV3f1w7ObmE/grlXuEHT53vGDGwMPjUjnILZQ2xXXYo9wCPtzrYBL0HueBOyXl
         Ck9XaOf8AxSt49Pwan4GhQ14U5uajeBljSTtCNPIezXkk+8aQhe/TT/a1ePSR/dKwYCC
         b+HgY0qAEIFyVFkrX5aML1MDJ3Dwx9yvLGv70XUIldBUbX4WlhZnl9HMN8SeNecm/8j+
         eychaSrLM+6mGA+LhlvB8ZV5fwnMPD846bXWudisrwfwUsVb7HoyCEWlBx0cGVsnqcqO
         lotOVgwul4N/E5fq6jso7bnDrT14w+APaDGNzeneOYK6dViWfIgab9cJDT7U4mPuQQR6
         0OcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768296813; x=1768901613;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7F6fqsyOtjM5uYbaPFIgQgGuXH/dsJ28oj9X44dO5jU=;
        b=cX9M7nmhRPr89gYNhjCIJhA4gG0l4hb1UiHEJcEoIgU18iuRldcvG4FcVaw6IAk43d
         TNWnCUoaDG3Dm+YueHqurY+VW8gsyKs4PdSiyM3U9ZO6bwTyKrYUIXQyZJxVsuDZ/zi9
         hcPSj2ZoLGjjcK1+RsEGNs+9Mxz2xoLR50dRa2Q/q+r1cfqjTqw8yN38bppV4QyeRHWd
         VlPTNhrijzy4ZIR2MAqPOHSLCZEJAv2R7lsmaV1LtJazNr2wiuPhNpx16a8SIfn3Be2m
         d7p5MQgbbrubeti0EuWgOGE+LQ5e9j6XGfP1y6zLOZ4psFTayODUDmwD6Q1xBihpnb9W
         0qnw==
X-Gm-Message-State: AOJu0YxGwI8Pw9zKzDUanNTEfxVeIuNj1nfDFBIPYETKc64PQQpuZwfi
	hqXEaWF948DkL+jccdciC+VoX2IcZ0Ib5i4ctgjI7O7Nd8OvizRh+ns4v2f/IFG9VDeF4IjUyvl
	MevgWkPYcS8CyJE8yUwJo9xibJJAVuYemW21uEJiNAezMnO3qzchx1h4W09zqB6K18E4l
X-Gm-Gg: AY/fxX7Y1I50vwwmYkhnaT5L8Ia+BWrsd4dB8+tX8EzBCpKJbz3euIo0mj2JZVQnYw/
	m4drqdBWJ5HVx+R5EpVPI7Gz88r5r0tB+rl9S2va96TyCeS4h1741NKM5sgPO22E7NhPMRcYrF7
	Yj0s6xHlU9xJ2K1c07+fwAIq3tTkJdPe0H8B8mbbLBFWquABNmkJljJQOj/midcwMNk/CnX2DwL
	OI24MbGNsE1PdOkU7RVwiGVmjj/mQc2UoU+j4lo2jmu8gqfvnjkhZxhwZN8f03kctgpwCuPX6wQ
	bfJ2VcrfePg+RyDhUCCttw37xtGl5li4v5PgZy5MwSLDp95/fXnqapG+/PGt3M26jZJ59g5Umvr
	fGebfLoprcOinyNV7rnP2G7MgQSiTl3fbec2rG/U=
X-Received: by 2002:a05:6a00:21c5:b0:7ff:da9b:bd82 with SMTP id d2e1a72fcca58-81b7f6ec1acmr19324360b3a.40.1768296812833;
        Tue, 13 Jan 2026 01:33:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFecIeFYBPLxo8KEKTggo8B28U1qCpzEzXqTxElS98E5p8rJyvLXahJvNMpn/S72AOPKREPWA==
X-Received: by 2002:a05:6a00:21c5:b0:7ff:da9b:bd82 with SMTP id d2e1a72fcca58-81b7f6ec1acmr19324337b3a.40.1768296812346;
        Tue, 13 Jan 2026 01:33:32 -0800 (PST)
Received: from [10.218.27.120] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819bafe991dsm19893360b3a.16.2026.01.13.01.33.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jan 2026 01:33:31 -0800 (PST)
Message-ID: <6ae95761-6428-4a01-8c60-54df5e54b71f@oss.qualcomm.com>
Date: Tue, 13 Jan 2026 15:03:24 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/8] Add RemoteProc cooling support
To: Casey Connolly <casey.connolly@linaro.org>, andersson@kernel.org,
        mathieu.poirier@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, rafael@kernel.org, daniel.lezcano@linaro.org,
        rui.zhang@intel.com, lukasz.luba@arm.com, konradybcio@kernel.org,
        amitk@kernel.org, mani@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
References: <20251223123227.1317244-1-gaurav.kohli@oss.qualcomm.com>
 <2a39719e-e73b-4558-95fa-d54f94c43220@linaro.org>
Content-Language: en-US
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
In-Reply-To: <2a39719e-e73b-4558-95fa-d54f94c43220@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDA4MCBTYWx0ZWRfX6Dyjk+7RaEWu
 L0UoQzYIFmA8WdpLjgpT4jfa9W0gxAFIcYJaQS2wVVDkef4DvlqcuyF4m/PHH1CTSh+GTP/Xso2
 tQD22vF7BMVx9P68MmcJz9eX6xG1X3iiMJmIHa6o0TWEryuJ2f02eZFE6Wv7b/5sWQft5nfNTl9
 ULF6SZqYV1JYlnlYkky2a17Edu62E9i/qNB/G402ytDwOFq81HAN1brJ5Hqrsd51ATyCEHTgrnb
 JSQsX0++XgQb5p1pqV6nIPiR/Emz1tQ5G7JrFewmLxWOK3/hLs+nt4BIeKeuWD/8JT3aiE75dPL
 4hDDiTnoDex3GVO/Doua81dMzByxpgk3dA0SNYmlB82qPsY6sYFXx83XPlpMLfYc1v6izHCpd3U
 w72FCxihtho+6nga1CQdIjcTKXlAKLw69QVf+MAuS2Fwzl1mM+YP8eEm2ReI9JKHv7jwg7qMiFT
 P2AQNQ65p+DtgbRCzSQ==
X-Proofpoint-ORIG-GUID: in8qDMeLf3JiKyKW7tBUs1nrJnvOcxuc
X-Authority-Analysis: v=2.4 cv=IOEPywvG c=1 sm=1 tr=0 ts=6966116d cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8
 a=0dxYOwnRambvcRU-GJ8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: in8qDMeLf3JiKyKW7tBUs1nrJnvOcxuc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_01,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0
 priorityscore=1501 clxscore=1015 impostorscore=0 phishscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601130080


On 1/10/2026 9:43 PM, Casey Connolly wrote:
>
>
> On 12/23/25 13:32, Gaurav Kohli wrote:
>> This series introduces a generic remote proc cooling framework to 
>> control
>> thermal sensors located on remote subsystem like modem, dsp etc.
>> Communications with these subsystems occurs through various channels, 
>> for example,
>> QMI interface for Qualcomm.
>>   The Framework provides an abstraction layer between thermal 
>> subsytem and vendor
>> specific remote subsystem. Vendor drivers are expected to implement 
>> callback
>> and registration mechanisms with cooling framework to control cooling
>> devices.
>>
>> This patchset also revives earlier discussions of QMI based TMD cooling
>> devices discussion posted on below series by Casey:
>> https://lore.kernel.org/linux-devicetree/20230905-caleb-qmi_cooling-v1-0-5aa39d4164a7@linaro.org/ 
>>
>>
>> That series introduced Qualcomm QMI-based TMD cooling devices which used
>> to mitigate thermal conditions across multiple remote subsystems. These
>> devices operate based on junction temperature sensors (TSENS) associated
>> with thermal zones for each subsystem and registering with remoteproc
>> cooling framework for cooling registration.
>>
>> This patch series has a compilation/runtime dependency on another 
>> series [1].
>>
>> [1] 
>> https://lore.kernel.org/linux-devicetree/20250822042316.1762153-1-quic_gkohli@quicinc.com/
>>
>> Casey Connolly (2):
>>    remoteproc: qcom: probe all child devices
>>    thermal: qcom: add qmi-cooling driver
>
> I'm glad this series is getting revived. It would be good if you could 
> explain what changes you made to my patches somewhere.
>
> I also remember one of my patches adding the DT parts for SDM845, 
> would you be willing to pick that up for the next revision? I'd be 
> happy to provide my Tested-by.
>
> Kind regards,
>
Hi Casey,

With this remoeproc cooling abstraction layer, we have integrated your 
patches for subsystem cooling. As lot of comments came for qmi-cooling 
driver, so need to send v2 with cleanup.

Will do clean up and send series again. Yes for other targets like 
sdm845 we will add once this is concluded.


>>
>> Gaurav Kohli (6):
>>    thermal: Add Remote Proc cooling driver
>>    dt-bindings: thermal: Add qcom,qmi-cooling yaml bindings
>>    arm64: dts: qcom: Enable cdsp qmi tmd devices for lemans
>>    arm64: dts: qcom: Enable cdsp qmi tmd devices for talos
>>    arm64: dts: qcom: Enable cdsp qmi tmd devices for kodiak
>>    arm64: dts: qcom: Enable cdsp qmi tmd devices for monaco
>>
>>   .../bindings/remoteproc/qcom,pas-common.yaml  |   6 +
>>   .../bindings/thermal/qcom,qmi-cooling.yaml    |  99 ++++
>>   MAINTAINERS                                   |   8 +
>>   arch/arm64/boot/dts/qcom/kodiak.dtsi          |  36 ++
>>   arch/arm64/boot/dts/qcom/lemans.dtsi          | 138 ++++-
>>   arch/arm64/boot/dts/qcom/monaco.dtsi          |  92 ++++
>>   arch/arm64/boot/dts/qcom/talos.dtsi           |  23 +
>>   drivers/remoteproc/qcom_q6v5.c                |   4 +
>>   drivers/remoteproc/qcom_q6v5_mss.c            |   8 -
>>   drivers/soc/qcom/Kconfig                      |  13 +
>>   drivers/soc/qcom/Makefile                     |   1 +
>>   drivers/soc/qcom/qmi-cooling.c                | 498 ++++++++++++++++++
>>   drivers/soc/qcom/qmi-cooling.h                | 428 +++++++++++++++
>>   drivers/thermal/Kconfig                       |  11 +
>>   drivers/thermal/Makefile                      |   2 +
>>   drivers/thermal/qcom/qmi-cooling.h            | 428 +++++++++++++++
>>   drivers/thermal/remoteproc_cooling.c          | 154 ++++++
>>   include/linux/remoteproc_cooling.h            |  52 ++
>>   18 files changed, 1981 insertions(+), 20 deletions(-)
>>   create mode 100644 
>> Documentation/devicetree/bindings/thermal/qcom,qmi-cooling.yaml
>>   create mode 100644 drivers/soc/qcom/qmi-cooling.c
>>   create mode 100644 drivers/soc/qcom/qmi-cooling.h
>>   create mode 100644 drivers/thermal/qcom/qmi-cooling.h
>>   create mode 100644 drivers/thermal/remoteproc_cooling.c
>>   create mode 100644 include/linux/remoteproc_cooling.h
>>
>

