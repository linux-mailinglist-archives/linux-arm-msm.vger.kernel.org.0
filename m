Return-Path: <linux-arm-msm+bounces-80226-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 912EAC2F761
	for <lists+linux-arm-msm@lfdr.de>; Tue, 04 Nov 2025 07:42:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3D3994E4FD9
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Nov 2025 06:42:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C944728000F;
	Tue,  4 Nov 2025 06:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mkJRlasC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HzWiGRrH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC4621F7098
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Nov 2025 06:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762238518; cv=none; b=ixnzfun7/J9WRdJa/+F6ktXdR0V0m8+zMjX3UrGD4ftmG1E6XGSPCdo/c/Wmir5emYhuEsWDXil/+IGY/bDVkOReMsBnTI8hmPo8iF3GzXzT2ST9zLhxsRM9uUnqsP+KgHSyeVkyrTqtOy9Dd8I6Nv2AvVY34j/dfCjrE8GCuyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762238518; c=relaxed/simple;
	bh=z3fLbBj9/JXOknVd2UVpf/apEyQAeIC3Rg2T9U1f0NM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=knL3utRnoH/OvsHsnO9b7osUp1HHyncu/qgwcwDmPdpPkAn7vODAiYydENdD3yurf4eSDYdu1G5RdD5lFyn7r/nTUHtTkNgZcZ0sEBHz4/hc3vw9h+h/17y6cyBigVSfi03VgCdHJpE6JHfP08WcopyT05fK9HSHji4sN6uMJE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mkJRlasC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HzWiGRrH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A42lWlS3659464
	for <linux-arm-msm@vger.kernel.org>; Tue, 4 Nov 2025 06:41:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ibEwJwxRJUdRY1eR4hz3JT
	7HtcnamXz9ZfIAYm73UCI=; b=mkJRlasCMb5aqPK4kb+KTOb1KOrxIilShCrkAT
	YmoH6r1BoLzt6vA3GD8o9adML8ck/fxCpTXfA6bhPvhvv59k8kLghKrjF+QzaQsw
	OY7CSdPz1jgvDWPyVgT7D0ifWV3vSO40F0WSQhlk7dnq43jGGZuGdJQQky1fG2vM
	+Ept8f2bYuBjRq0zIIL0S9vol5Dzq59wESzxFZQeSBnXNnA211oflgCnYOcCIIRs
	OV3PRzNCsR0pd9xopLIWUGkpxN3DY1fehki5HPcDNX/NPpEqsxOkCNKW8cWS5Z23
	IxG35LSW68ukz2WG6PgfCFlQbO4oP3ad27S5nYe5yTlnDCwg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a70ge9wtj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 04 Nov 2025 06:41:55 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3418c17d21dso21016a91.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Nov 2025 22:41:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762238515; x=1762843315; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ibEwJwxRJUdRY1eR4hz3JT7HtcnamXz9ZfIAYm73UCI=;
        b=HzWiGRrHTl9u1NKu0PFHRtOPqcwvQM3aw/UvILEl+FnUNuxKVfSonXdvYqd+lOTwnM
         YRqElVOYAv8lu8Fr0wPQR8saYzIg4+RgUX6PocGwl0dzt19CM7gQo1X8LAJkilxq4lrv
         yKLaBltlCB8rHBJDwCBcBrGQ6G5pdKEqfq4YFjDPHuqezzsDsA6ZZy/ihtFpEO9DB7eL
         R6ON+u1MSb6BEWsg8t5mcxvYPsxfAlQ9bSGfCNqPB0OjcuVyIcSWk7Igg534D+qvpa02
         ZYS1dN/45piMK9LqjpCjDiuiATkSMnQ+/WZr/NTg1W0ZUv7NxKzi+dYufMs847mxUvAM
         KznQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762238515; x=1762843315;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ibEwJwxRJUdRY1eR4hz3JT7HtcnamXz9ZfIAYm73UCI=;
        b=vjbzTWR6L579Ruol+WD7JGS2+IIipw5MlF+DL7E9KGpJ02w1sGzyQbhxKpvUJLOifd
         hH2IaOSr9Hxd93QMnaojUDikDsR+BlS/+GB6lh66w+S/sEYacemUXd0cHjR+zFKWRUby
         Q2h4lOv7Hpot4vYxmhBVZh5XWCT9okJoW+bh1xba2bJhqSSXpmCyjKVpjbisfU+jRahY
         /9U4ZcjJdoEiZh0DbjchlcM4Yhuf3UZa8YXeOENxck8IX/DHbLDtKSxSuTW2RAqOmWpv
         hMjbU7I7y7H5/YtRoX/s45X/k/eENJHcXGlXC/fkCL8hFIHrgmyVRtVn7D0Q9rismn+A
         /bcA==
X-Forwarded-Encrypted: i=1; AJvYcCUGysU/GLKppyHshXUrQrBKPZm1CAk/OmS8Ir9BV7oeNC2Rq3K46AJLdbfI/Lme9h0NoSDQ1itNbsNPBou6@vger.kernel.org
X-Gm-Message-State: AOJu0YyXlSXUhigo8KhKeFqawBuP9ySjy3mIu4Q9c4ajVvS5X6Q5Nvvf
	VGN9OOQWg0vGYhfIq3wt7Cw/8hv7/0vjvbH1ApsjJ/eewasR1WxVFUB83ieyQ7zH6VNWhFd935V
	Xuma8DUpFxJ/W7H0gIAEGXCBHpjO4yCBAKp7+NZPOvDroiE3wDjw4XFJC0AUL7EHz4wSy
X-Gm-Gg: ASbGncuyEIUEZcEHfu5qAjAaZwuw/ekDGtnoSCwdvykbgujdl4lLxq03DIop4jHVanr
	x/724ya1pVoiNVstKR+GpaAcIWWKKri2X+8+DO5vzPPn3IBu3CvSphjcRh+Vegm+6W4quM3o154
	Mb4B4KPOKwTfDxqqpkZarIlxYtzY0itaL/nkdMcADb8LpLldJSUn9h8Ofbm6RZl0CFtXs5epcPW
	savSLgPoCE5M9QyFXIrIj3/eZZDaufnFwnQ93qF3u1+hHTCHAEdTSsLOMFY6zfoKv+F621/K3Da
	lG0IuD+DeLbOYz4y3AWdtscL6hSRuxB4RUU+lzhf5vTrJ80nmmYjttmqVYcsIVooZybL26hP+Qs
	6fsPi8Y6emnCHrT41EZaxH5lV/3arIERG8RHxyLHx6Hi0XvDt9MqQbw==
X-Received: by 2002:a17:90b:2789:b0:341:88ba:bdda with SMTP id 98e67ed59e1d1-34188babf0emr408695a91.31.1762238514025;
        Mon, 03 Nov 2025 22:41:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGBKvCkpW9aHNOj9emv5P1GELGKEfol3zMzYWEVGCEYS1Bh6AYCS0DUS3V9u6Ui+sDCp/uJsQ==
X-Received: by 2002:a17:90b:2789:b0:341:88ba:bdda with SMTP id 98e67ed59e1d1-34188babf0emr408656a91.31.1762238513257;
        Mon, 03 Nov 2025 22:41:53 -0800 (PST)
Received: from hu-songchai-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34159a0780dsm3294791a91.16.2025.11.03.22.41.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 22:41:52 -0800 (PST)
From: Songwei Chai <songwei.chai@oss.qualcomm.com>
To: andersson@kernel.org, alexander.shishkin@linux.intel.com,
        kernel@oss.qualcomm.com, mike.leach@linaro.org, suzuki.poulose@arm.com
Cc: Songwei Chai <songwei.chai@oss.qualcomm.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        coresight@lists.linaro.org, devicetree@vger.kernel.org
Subject: [PATCH v7 0/7] Provides support for Trigger Generation Unit
Date: Mon,  3 Nov 2025 22:40:36 -0800
Message-Id: <20251104064043.88972-1-songwei.chai@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: fS1LZqNdUC3VMMxYWeyR68IjccdK684x
X-Authority-Analysis: v=2.4 cv=bqBBxUai c=1 sm=1 tr=0 ts=6909a033 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=Y4MViknzB6XciWjnlzcA:9 a=8KGQzfimsMkVHzi2:21
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA0MDA1MyBTYWx0ZWRfX45mI3xq1ksY/
 +IQAoFhDlZLx1H7LSMt910wAKrv8XbomL4jHxPMY/gFANdYGJI2+v4ZPbmrIJswRXSWIeg+e+jH
 R3P55zGkpEyH6e5qqgVJlDobexTprLLd3Urod89AqVr4AAmon6FlznV6cfvVvEBb6O/9qSY9Hz+
 Rd2pOS8TEh/xGglPPRqn/u0FhI3GgqbyCkRtN8O9PD/Gt/Ofklvdf0UHJASakU/WAWxKLmzws/1
 q3/1ftyRnoRoVq2ORz4j80GtYK88Z2bcSYUmOgzHSrsFNn8VAoDYOdHjvFUkl1w5dgH6yJfxsh2
 IhfRhw5bd8N+HoFTdlR57b96a81ZxbdzYmwDLwY1T9OA0kQVty5DKnc1uXgPT+jCIao34Kl8Ddn
 paoj/UTeeu95ovO4KV2Gs4HQ4UaV4Q==
X-Proofpoint-GUID: fS1LZqNdUC3VMMxYWeyR68IjccdK684x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-03_06,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 adultscore=0 bulkscore=0 malwarescore=0
 impostorscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511040053

We propose creating a new qcom directory under drivers/hwtracing
to host this TGU driver, as well as additional Qualcomm-specific
hwtracing drivers that we plan to submit in the coming months.
This structure will help organize vendor-specific implementations
and facilitate future development and maintenance.

Feedback from the community on this proposal is highly appreciated.

- Why we are proposing this:

TGU has the ability to monitor signal conditions and trigger debug-related
actions, serving as a programmable hardware component that enhances system
trace and debug capabilities. Placing it under drivers/hwtracing aligns with
its function as a trace generation utility.

We previously attempted to push this driver to drivers/hwtracing/coresight,
but did not receive support from the maintainers of the CoreSight subsystem.
The reason provided was: “This component is primarily a part of the
Qualcomm proprietary QPMDA subsystem, and is capable of operating
independently from the CoreSight hardware trace generation system.”

Chat history : https://lore.kernel.org/all/CAJ9a7ViKxHThyZfFFDV_FkNRimk4uo1NrMtQ-kcaj1qO4ZcGnA@mail.gmail.com/

Given this, we have been considering whether it would be appropriate
to create a dedicated drivers/hwtracing/qcom directory for
Qualcomm-related hwtracing drivers. This would follow the precedent set
by Intel, which maintains its own directory at drivers/hwtracing/intel_th.
We believe this structure would significantly facilitate
future submissions of related Qualcomm drivers.

- Maintenance of drivers/hwtracing/qcom:

Bjorn, who maintains linux-arm-msm, will be the maintainer of this
directory — we’ve discussed this with him and he’s aware that his task
list may grow accordingly. Additionally, Qualcomm engineers familiar with
the debug hardware — such as [Tingwei Zhang, Jinlong Mao, Songwei Chai],
will be available to review incoming patches and support ongoing
development.

- Detail for TGU:

This component can be utilized to sense a plurality of signals and
create a trigger into the CTI or generate interrupts to processors
once the input signal meets the conditions. We can treat the TGU’s
workflow as a flowsheet, it has some “steps” regions for customization.
In each step region, we can set the signals that we want with priority
in priority_group, set the conditions in each step via condition_decode,
and set the resultant action by condition_select. Meanwhile,
some TGUs (not all) also provide timer/counter functionality.
Based on the characteristics described above, we consider the TGU as a
helper in the CoreSight subsystem. Its master device is the TPDM, which
can transmit signals from other subsystems, and we reuse the existing
ports mechanism to link the TPDM to the connected TGU.

Here is a detailed example to explain how to use the TGU:

In this example, the TGU is configured to use 2 conditions, 2 steps, and
the timer. The goal is to look for one of two patterns which are generated
from TPDM, giving priority to one, and then generate a trigger once the
timer reaches a certain value. In other words, two conditions are used
for the first step to look for the two patterns, where the one with the
highest priority is used in the first condition. Then, in the second step,
the timer is enabled and set to be compared to the given value at each
clock cycle. These steps are better shown below.
    
              |-----------------|
              |                 |
              |       TPDM      |
              |                 |
              |-----------------|
                       |
                       |
    --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- ------
    |                  |                                                 |
    |                  |                          |--------------------| |
    |    |---- --->    |                          |  Go to next steps  | |
    |    |             |                |--- ---> |  Enable timer      | |
    |    |             v                |         |                    | |
    |    |    |-----------------|       |         |--------------------| |
    |    |    |                 |  Yes  |                    |           |
    |    |    |   inputs==0xB   | ----->|                    | <-------- |
    |    |    |                 |       |                    |      No | |
    | No |    |-----------------|       |                    v         | |
    |    |             |                |          |-----------------| | |
    |    |             |                |          |                 | | |
    |    |             |                |          |      timer>=3   |-- |
    |    |             v                |          |                 |   |
    |    |    |-----------------|       |          |-----------------|   |
    |    |    |                 |  Yes  |                    |           |
    |    |--- |   inputs==0xA   | ----->|                    | Yes       |
    |         |                 |                            |           |
    |         |-----------------|                            v           |
    |                                              |-----------------|   |
    |                                              |                 |   |
    |                                              |      Trigger    |   |
    |                                              |                 |   |
    |                                              |-----------------|   |
    |  TGU                                                   |           |
    |--- --- --- --- --- --- --- --- --- --- --- --- --- --- |--- --- -- |
                                                             |
                                                             v
                                                    |-----------------|
                                                    |The controllers  |
                                                    |which will use   |
                                                    |triggers further |
                                                    |-----------------|

steps:
    1. Reset TGU /*it will disable tgu and reset dataset*/
    - echo 1 > /sys/bus/coresight/devices/<tgu-name>/reset_tgu

    2. Set the pattern match for priority0 to 0xA = 0b1010 and for
       priority 1 to 0xB = 0b1011.
    - echo 0x11113232 > /sys/bus/coresight/devices/<tgu-name>/step0_priority0/reg0
    - echo 0x11113233 > /sys/bus/coresight/devices/<tgu-name>/step0_priority1/reg0

    Note:
        Bit distribution diagram for each priority register
    |-------------------------------------------------------------------|
    |   Bits          |       Field Nam   |    Description              |
    |-------------------------------------------------------------------|
    |                 |                   | 00 = bypass for OR output   |
    |     29:28       |   SEL_BIT7_TYPE2  | 01 = bypass for AND output  |
    |                 |                   | 10 = sense input '0' is true|
    |                 |                   | 11 = sense input '1' is true|
    |-------------------------------------------------------------------|
    |                 |                   | 00 = bypass for OR output   |
    |     25:24       |   SEL_BIT6_TYPE2  | 01 = bypass for AND output  |
    |                 |                   | 10 = sense input '0' is true|
    |                 |                   | 11 = sense input '1' is true|
    |-------------------------------------------------------------------|
    |                 |                   | 00 = bypass for OR output   |
    |     21:20       |   SEL_BIT5_TYPE2  | 01 = bypass for AND output  |
    |                 |                   | 10 = sense input '0' is true|
    |                 |                   | 11 = sense input '1' is true|
    |-------------------------------------------------------------------|
    |                 |                   | 00 = bypass for OR output   |
    |     17:16       |   SEL_BIT4_TYPE2  | 01 = bypass for AND output  |
    |                 |                   | 10 = sense input '0' is true|
    |                 |                   | 11 = sense input '1' is true|
    |-------------------------------------------------------------------|
    |                 |                   | 00 = bypass for OR output   |
    |     13:12       |   SEL_BIT3_TYPE2  | 01 = bypass for AND output  |
    |                 |                   | 10 = sense input '0' is true|
    |                 |                   | 11 = sense input '1' is true|
    |-------------------------------------------------------------------|
    |                 |                   | 00 = bypass for OR output   |
    |      9:8        |   SEL_BIT2_TYPE2  | 01 = bypass for AND output  |
    |                 |                   | 10 = sense input '0' is true|
    |                 |                   | 11 = sense input '1' is true|
    |-------------------------------------------------------------------|
    |                 |                   | 00 = bypass for OR output   |
    |      5:4        |  SEL_BIT1_TYPE2   | 01 = bypass for AND output  |
    |                 |                   | 10 = sense input '0' is true|
    |                 |                   | 11 = sense input '1' is true|
    |-------------------------------------------------------------------|
    |                 |                   | 00 = bypass for OR output   |
    |      1:0        |  SEL_BIT0_TYPE2   | 01 = bypass for AND output  |
    |                 |                   | 10 = sense input '0' is true|
    |                 |                   | 11 = sense input '1' is true|
    |-------------------------------------------------------------------|
    These bits are used to identify the signals we want to sense, with
    a maximum signal number of 140. For example, to sense the signal
    0xA (binary 1010), we set the value of bits 0 to 13 to 3232, which
    represents 1010. The remaining bits are set to 1, as we want to use
    AND gate to summarize all the signals we want to sense here. For
    rising or falling edge detection of any input to the priority, set
    the remaining bits to 0 to use an OR gate.

    3. look for the pattern for priority_i i=0,1.
    - echo 0x3 > /sys/bus/coresight/devices/<tgu-name>/step0_condition_decode/reg0
    - echo 0x30 > /sys/bus/coresight/devices/<tgu-name>/step0_condition_decode/reg1

    |-------------------------------------------------------------------------------|
    |   Bits          |    Field Nam        |            Description                |
    |-------------------------------------------------------------------------------|
    |                 |                     |For each decoded condition, this       |
    |      24         |       NOT           |inverts the output. If the condition   |
    |                 |                     |decodes to true, and the NOT field     |
    |                 |                     |is '1', then the output is NOT true.   |
    |-------------------------------------------------------------------------------|
    |                 |                     |When '1' the output from the associated|
    |      21         |  BC0_COMP_ACTIVE    |comparator will be actively included in|
    |                 |                     |the decoding of this particular        |
    |                 |                     |condition.                             |
    |-------------------------------------------------------------------------------|
    |                 |                     |When '1' the output from the associated|
    |                 |                     |comparator will need to be 1 to affect |
    |      20         |   BC0_COMP_HIGH     |the decoding of this condition.        |
    |                 |                     |Conversely, a '0' here requires a '0'  |
    |                 |                     |from the comparator                    |
    |-------------------------------------------------------------------------------|
    |                 |                     |When '1' the output from the associated|
    |      17         |                     |comparator will be actively included in|
    |                 |  TC0_COMP_ACTIVE    |the decoding of this particular        |
    |                 |                     |condition.                             |
    |-------------------------------------------------------------------------------|
    |                 |                     |When '1' the output from the associated|
    |                 |                     |comparator will need to be 1 to affect |
    |      16         |  TC0_COMP_HIGH      |the decoding of this particular        |
    |                 |                     |condition.Conversely, a 0 here         |
    |                 |                     |requires a '0' from the comparator     |
    |-------------------------------------------------------------------------------|
    |                 |                     |When '1' the output from Priority_n    |
    |                 |                     |OR logic will be actively              |
    |     4n+3        | Priority_n_OR_ACTIVE|included in the decoding of            |
    |                 |    (n=0,1,2,3)      |this particular condition.             |
    |                 |                     |                                       |
    |-------------------------------------------------------------------------------|
    |                 |                     |When '1' the output from Priority_n    |
    |                 |                     |will need to be '1' to affect the      |
    |     4n+2        |  Priority_n_OR_HIGH |decoding of this particular            |
    |                 |    (n=0,1,2,3)      |condition. Conversely, a '0' here      |
    |                 |                     |requires a '0' from Priority_n OR logic|
    |-------------------------------------------------------------------------------|
    |                 |                     |When '1' the output from Priority_n    |
    |                 |                     |AND logic will be actively             |
    |     4n+1        |Priority_n_AND_ACTIVE|included in the decoding of this       |
    |                 |  (n=0,1,2,3)        |particular condition.                  |
    |                 |                     |                                       |
    |-------------------------------------------------------------------------------|
    |                 |                     |When '1' the output from Priority_n    |
    |                 |                     |AND logic will need to be '1' to       |
    |      4n         | Priority_n_AND_HIGH |affect the decoding of this            |
    |                 |   (n=0,1,2,3)       |particular condition. Conversely,      |
    |                 |                     |a '0' here requires a '0' from         |
    |                 |                     |Priority_n AND logic.                  |
    |-------------------------------------------------------------------------------|
    Since we use `priority_0` and `priority_1` with an AND output in step 2, we set `0x3`
    and `0x30` here to activate them.

    4. Set NEXT_STEP = 1 and TC0_ENABLE = 1 so that when the conditions
       are met then the next step will be step 1 and the timer will be enabled.
    - echo 0x20008 > /sys/bus/coresight/devices/<tgu-name>/step0_condition_select/reg0
    - echo 0x20008 > /sys/bus/coresight/devices/<tgu-name>/step0_condition_select/reg1

    |-----------------------------------------------------------------------------|
    |   Bits          |       Field Nam   |            Description                |
    |-----------------------------------------------------------------------------|
    |                 |                   |This field defines the next step the   |
    |    18:17        |     NEXT_STEP     |TGU will 'goto' for the associated     |
    |                 |                   |Condition and Step.                    |
    |-----------------------------------------------------------------------------|
    |                 |                   |For each possible output trigger       |
    |    13           |     TRIGGER       |available, set a '1' if you want       |
    |                 |                   |the trigger to go active for the       |
    |                 |                   |associated condition and Step.         |
    |-----------------------------------------------------------------------------|
    |                 |                   |This will cause BC0 to increment if the|
    |    9            |     BC0_INC       |associated Condition is decoded for    |
    |                 |                   |this step.                             |
    |-----------------------------------------------------------------------------|
    |                 |                   |This will cause BC0 to decrement if the|
    |    8            |     BC0_DEC       |associated Condition is decoded for    |
    |                 |                   |this step.                             |
    |-----------------------------------------------------------------------------|
    |                 |                   |This will clear BC0 count value to 0 if|
    |    7            |     BC0_CLEAR     |the associated Condition is decoded    |
    |                 |                   |for this step.                         |
    |-----------------------------------------------------------------------------|
    |                 |                   |This will cause TC0 to increment until |
    |    3            |     TC0_ENABLE    |paused or cleared if the associated    |
    |                 |                   |Condition is decoded for this step.    |
    |-----------------------------------------------------------------------------|
    |                 |                   |This will cause TC0 to pause until     |
    |    2            |     TC0_PAUSE     |enabled if the associated Condition    |
    |                 |                   |is decoded for this step.              |
    |-----------------------------------------------------------------------------|
    |                 |                   |This will clear TC0 count value to 0   |
    |    1            |     TC0_CLEAR     |if the associated Condition is         |
    |                 |                   |decoded for this step.                 |
    |-----------------------------------------------------------------------------|
    |                 |                   |This will set the done signal to the   |
    |    0            |     DONE          |TGU FSM if the associated Condition    |
    |                 |                   |is decoded for this step.              |
    |-----------------------------------------------------------------------------|
    Based on the distribution diagram, we set `0x20008` for `priority0` and `priority1` to
    achieve "jump to step 1 and enable TC0" once the signal is sensed.

    5. activate the timer comparison for this step.
    -  echo 0x30000  > /sys/bus/coresight/devices/<tgu-name>/step1_condition_decode/reg0

    |-------------------------------------------------------------------------------|
    |                 |                     |When '1' the output from the associated|
    |      17         |                     |comparator will be actively included in|
    |                 |  TC0_COMP_ACTIVE    |the decoding of this particular        |
    |                 |                     |condition.                             |
    |-------------------------------------------------------------------------------|
    |                 |                     |When '1' the output from the associated|
    |                 |                     |comparator will need to be 1 to affect |
    |      16         |  TC0_COMP_HIGH      |the decoding of this particular        |
    |                 |                     |condition.Conversely, a 0 here         |
    |                 |                     |requires a '0' from the comparator     |
    |-------------------------------------------------------------------------------|
    Accroding to the decode distribution diagram , we give 0x30000 here to set 16th&17th bit
    to enable timer comparison.

    6. Set the NEXT_STEP = 0 and TC0_PAUSE = 1 and TC0_CLEAR = 1 once the timer
       has reached the given value.
    - echo 0x6 > /sys/bus/coresight/devices/<tgu-name>/step1_condition_select/reg0

    7. Enable Trigger 0 for TGU when the condition 0 is met in step1,
       i.e. when the timer reaches 3.
    - echo 0x2000 > /sys/bus/coresight/devices/<tgu-name>/step1_condition_select/default

    Note:
        1. 'default' register allows for establishing the resultant action for
        the default condition

        2. Trigger:For each possible output trigger available from
        the Design document, there are three triggers: interrupts, CTI,
        and Cross-TGU mapping.All three triggers can occur, but
        the choice of which trigger to use depends on the user's
        needs.

    8. Compare the timer to 3 in step 1.
    - echo 0x3 > /sys/bus/coresight/devices/<tgu-name>/step1_timer/reg0

    9. enale tgu
    - echo 1 > /sys/bus/coresight/devices/<tgu-name>/enable_tgu
---
Link to V6: https://lore.kernel.org/all/20250709104114.22240-1-songchai@qti.qualcomm.com/

Changes in V7:
- Move the TGU code location from 'drivers/hwtracing/coresight/' to 'drivers/hwtracing/qcom/'.
- Rename the spinlock used in the code from 'spinlock' to 'lock'.
- Perform the 'calculate_array_location' separately, instead of doing it within the function.
- Update the sender email address.
---
Link to V5: https://lore.kernel.org/all/20250529081949.26493-1-quic_songchai@quicinc.com/

Changes in V6:
- Replace spinlock with guard(spinlock) in tgu_enable.
- Remove redundant blank line.
- Update publish date and contact member's name in "sysfs-bus-coresight-devices-tgu".
---
Link to V4: https://patchwork.kernel.org/project/linux-arm-msm/cover/20250423101054.954066-1-quic_songchai@quicinc.com/

Changes in V5:
- Update publish date and kernel_version in "sysfs-bus-coresight-devices-tgu"
---
Link to V3: https://lore.kernel.org/all/20250227092640.2666894-1-quic_songchai@quicinc.com/

Changes in V4:
- Add changlog in coverletter.
- Correct 'year' in Copyright in patch1.
- Correct port mechansim description in patch1.
- Remove 'tgu-steps','tgu-regs','tgu-conditions','tgu-timer-counters' from dt-binding
and set them through reading DEVID register as per Mike's suggestion.
- Modify tgu_disable func to make it have single return point in patch2 as per
Mike's suggestion.
- Use sysfs_emit in enable_tgu_show func in ptach2.
- Remove redundant judgement in enable_tgu_store in patch2.
- Correct typo in description in patch3.
- Set default ret as SYSFS_GROUP_INVISIBLE, and returnret at end in pacth3 as
per Mike's suggestion.
- Remove tgu_dataset_ro definition in patch3
- Use #define constants with explanations of what they are rather than
arbitrary magic numbers in patch3 and patch4.
- Check -EINVAL before using 'calculate_array_location()' in array in patch4.
- Add 'default' in 'tgu_dataset_show''s switch part in patch4.
- Document the value needed to initiate the reset in pacth7.
- Check "value" in 'reset_tgu_store' and bail out with an error code if 0 in patch7.
- Remove dev_dbg in 'reset_tgu_store' in patch7.
---
Link to V2: https://lore.kernel.org/all/20241010073917.16023-1-quic_songchai@quicinc.com/

Changes in V3:
- Correct typo and format in dt-binding in patch1
- Rebase to the latest kernel version
---
Link to V1: https://lore.kernel.org/all/20240830092311.14400-1-quic_songchai@quicinc.com/

Changes in V2:
 - Use real name instead of login name,
 - Correct typo and format in dt-binding and code.
 - Bring order in tgu_prob(declarations with and without assignments) as per
Krzysztof's suggestion.
 - Add module device table in patch2.
 - Set const for tgu_common_grp and tgu_ids in patch2.
 - Initialize 'data' in tgu_ids to fix the warning in pacth2.
---

Songwei Chai (7):
  dt-bindings: arm: Add support for Qualcomm TGU trace
  qcom-tgu: Add TGU driver
  qcom-tgu: Add signal priority support
  qcom-tgu: Add TGU decode support
  qcom-tgu: Add support to configure next action
  qcom-tgu: Add timer/counter functionality for TGU
  qcom-tgu: Add reset node to initialize

 .../testing/sysfs-bus-coresight-devices-tgu   |  51 ++
 .../devicetree/bindings/arm/qcom,tgu.yaml     |  82 ++
 drivers/Makefile                              |   1 +
 drivers/hwtracing/Kconfig                     |   2 +
 drivers/hwtracing/qcom/Kconfig                |  18 +
 drivers/hwtracing/qcom/Makefile               |   3 +
 drivers/hwtracing/qcom/tgu.c                  | 737 ++++++++++++++++++
 drivers/hwtracing/qcom/tgu.h                  | 252 ++++++
 8 files changed, 1146 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-coresight-devices-tgu
 create mode 100644 Documentation/devicetree/bindings/arm/qcom,tgu.yaml
 create mode 100644 drivers/hwtracing/qcom/Kconfig
 create mode 100644 drivers/hwtracing/qcom/Makefile
 create mode 100644 drivers/hwtracing/qcom/tgu.c
 create mode 100644 drivers/hwtracing/qcom/tgu.h

-- 
2.34.1


