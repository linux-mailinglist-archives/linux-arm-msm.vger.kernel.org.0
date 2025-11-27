Return-Path: <linux-arm-msm+bounces-83564-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F219C8DC50
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Nov 2025 11:32:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 2A66735067B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Nov 2025 10:32:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BDDB26F29F;
	Thu, 27 Nov 2025 10:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MnNIz7ki";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EV2QkibC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAF9E31E106
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 10:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764239552; cv=none; b=UoSKCGKq+Sk/715SDDNH5YuZ0h/U7MYGQyQBem6JOaGWqxWSWET06QODL9tGw6AtJ3VoN+hgYXQH0e6lPbFYW8PxN4+B+VRrOuhFwTzdEOZ4XdMhzyDVCCdIbfqX6FCSmNELLEZ9BXdM2Y5G26UVtKPL4KmHM+uPy65NXF6itFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764239552; c=relaxed/simple;
	bh=XpQtZpYgohZHl3gAooTdrRQYTIfYtL/nP1rnoS4rsys=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=B0uRYrL5RIWwkj0gxP7Lel7/IEDVDYdQXwWEyT/N7Q3loQvcaI9+SsWf5RO1YYBM+a7R4DH+DBxAShu34a1vPynJc1YPMdJZcsZEIRPNrI9mkyKZRhpaap5D9hbJuDMg6vbZkMeB1QdXszEX1fgRu0lUL2ywqJjV2mcHT4oeXkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MnNIz7ki; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EV2QkibC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ARA3gXg848717
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 10:32:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Me0mTYqa6XZKWAnCIeXoav
	rsmUe3XwWATdzt5BMmD8U=; b=MnNIz7kifGH1921lOzZ++3AY4EZueI3Nadk7oT
	THlVvQaC7+3LltP9tbo+ofmGRHlpez2MbS7lvEZvzd34zBkwR6+DMUH2o5Q3UpYV
	2FWEDZB078eRtz2EhViPbuIJT2jJb34Bdc3BkOaHQk9ZworDscXUIwyxoMUmRbN8
	otFd7FpN5DvnrGEYEMwzLaZ0sgpW7EMC3uyq4u4A1JksrzsW1z4XRbu9Zf3myPUM
	Bzw1ar8/Xm1tT3u33uQFGOM/ZxbcPF0EnRxivL5ywT5evSNVyaQJKSjqvnb5U3gX
	daCpYPStbWbhfBGS+RjIWuKvS/Kq/VQaz1VqZWvMiVPJlVzA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4apmjd82ra-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 10:32:29 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7aa9f595688so1063653b3a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 02:32:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764239549; x=1764844349; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Me0mTYqa6XZKWAnCIeXoavrsmUe3XwWATdzt5BMmD8U=;
        b=EV2QkibCFABpe5zZWBVn2YATmeL73sITHJBqeMxNLcwugtnEZw4U9bOqaT9Od2HiZP
         Qhy+zEYDsHk9DzWrqME96CngjIIz61ZYYQtjvCvAquEeYhbcjUl5zmyxUmyJ3Zl8yu/U
         RSDmRNbHPx8GMEeexPQGKQTuGuFnD/3ARyab9Z3rJANLnx6pc11IlOSB9bUZdVD9QLrK
         f9CNAipcrevsOr57wDvQtzW38O0K9+c5dM9RXLikdIPk5XlqohskWNf7jZUwmQynj1Zz
         JpDB32yjbFqfYxHp1j+G+0mNH2NskfT+c/vNkfY8YsfHIyZ4GUxXNW4WKX1KfpXOJXKy
         Y+zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764239549; x=1764844349;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Me0mTYqa6XZKWAnCIeXoavrsmUe3XwWATdzt5BMmD8U=;
        b=vOJwLlL1+uvtoFOdo6CmGV/dv2Mu+jO+ZGCWibgd9fIZeusnLQtcPrgObeyOjGd9FS
         Jcobay57w98xKtlorM+jwUL3CtY8t5Ny9/AVXQu5DMlG8tu8MCx2tw6wRhsoYJ+EZNQc
         2lIyrTg9OBG+M+di+FR/xUbcrtnjOFcn6HqJ/e4nyL78XO9AKFDNEHFAeE1G9LbHFJWr
         8PaITVZuiLDNMnC11gAxSFPDowvN1j/HQJpKSlhO//sVTysT9LHZr/LsX3k8B1kG8o/c
         aVkTQ/hgKO9bKW57LnPwzbcKl0ugHYHRmgtgUZv7Pj6rUt7wo5KiB1eqHPhhobAZVIsB
         e7rw==
X-Forwarded-Encrypted: i=1; AJvYcCUAlfqn7U/Wq2s5Cf2dwJf/QEWjCWnyR9SJWh8KN1n7+QZQL4QG5v+klDQUj7aipTTP/BpLNPFvJUyM6cN2@vger.kernel.org
X-Gm-Message-State: AOJu0YwbubPLoHyGhO1VLVbdGho8U3GyLIgztqZWi+0s4KhKwcAxCyU9
	kcU4+wQYFswKJKuMNVyhojdxtlVjdVT1AUaMfsZ4uaO/l8SwRpyRUu0+YCDUj9pXZPyIou0rQny
	BA1ievF61HGmIPXr92Bh3qTvioOTzCQgGvn4zrbhd2XOCN/ouz6a6pTBlBcITzckWpW5z
X-Gm-Gg: ASbGncvmf89LtK2EsUx4sRxp8GGGEBjOdZYFqYC5Ega3R/zxG6PM1Etuc/qdguzvdaI
	3sUIQHXPkV32q0tGIo0sZo3v7fp7cLJx8uIetzUCo6mCJyE6RElTLa8sGlMQl38M7fw/sbCFLxe
	Wq5qiGl4JohEk0QyQWRUCIPVhlLIJljAjT4B0oFcmpMPFrFrqXSEezI2hxadr+Ywl1PsnpLj5JP
	oNypvJY1YYxKEHneZp5mmDalrz0l+ZdJVINMBUqxl/tw3Nd5Q1Qx8AR1kS3G3t83FyeCbbG3/9A
	Skhqhvx0enhMvCwvtOtjK0+QJeyhtZ1erRnFZW4psxqRsw/a5OiHEEG+ZciN90lsO3Q+fSpxQPi
	3iymHSvlrJCKGLZDChOUeM1hTZmW7cTWsbzxfV70=
X-Received: by 2002:a05:6a00:9508:b0:7aa:9ca5:da9c with SMTP id d2e1a72fcca58-7c58e50cc8dmr23646230b3a.22.1764239549086;
        Thu, 27 Nov 2025 02:32:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFh4xDobvpYf000wLtNMXCC3xUKgy8Hb7ZILTY4TEz3RCs72W7MXDq1HxRQ7xCslzY/T2Y3sA==
X-Received: by 2002:a05:6a00:9508:b0:7aa:9ca5:da9c with SMTP id d2e1a72fcca58-7c58e50cc8dmr23646207b3a.22.1764239548595;
        Thu, 27 Nov 2025 02:32:28 -0800 (PST)
Received: from hu-sriramd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7d15f457c38sm1479819b3a.54.2025.11.27.02.32.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Nov 2025 02:32:28 -0800 (PST)
From: Sriram Dash <sriram.dash@oss.qualcomm.com>
Subject: [PATCH 0/2] usb: dwc3: qcom: Add support for firmware-managed
 resources
Date: Thu, 27 Nov 2025 16:01:43 +0530
Message-Id: <20251127-controller_scmi_upstream-v1-0-38bcca513c28@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAI8oKGkC/x3MQQqEMAxA0atI1lOYVmXAq8ggNY0a0FYSFUF69
 ymzfIv/H1ASJoWuekDoYuUUC+yrAlx8nMlwKAb3dq217mMwxUPSupIMihsP566HkN+Mr5tm9MH
 VIyKUfBea+P6v+2/OPydaREBqAAAA
X-Change-ID: 20251127-controller_scmi_upstream-a344bad23bcc
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: jack.pham@oss.qualcomm.com, faisal.hassan@oss.qualcomm.com,
        krishna.kurapati@oss.qualcomm.com, andersson@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sriram Dash <sriram.dash@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Shazad Hussain <shazad.hussain@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764239543; l=15753;
 i=sriram.dash@oss.qualcomm.com; s=20251022; h=from:subject:message-id;
 bh=XpQtZpYgohZHl3gAooTdrRQYTIfYtL/nP1rnoS4rsys=;
 b=cfg1y97rHyz8bE78LH47J69aLLY/TL/ERX1V3qu3uUn3EyDD3eWwMhnBrdviz6pmfkiEPzAil
 ubOwO8hoA0MCBjeVlnG9ty3J037cN1zo3OrXWkg7Q9RjM9tqrKYWHc+
X-Developer-Key: i=sriram.dash@oss.qualcomm.com; a=ed25519;
 pk=balisq+aEVXEJ6Gnze3kqbYZiFlsdHUjTSdCvupAeP4=
X-Proofpoint-GUID: dQeDf17P6djO9VvcHLTBdZAveJp3RpzN
X-Proofpoint-ORIG-GUID: dQeDf17P6djO9VvcHLTBdZAveJp3RpzN
X-Authority-Analysis: v=2.4 cv=OPcqHCaB c=1 sm=1 tr=0 ts=692828bd cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=wCQJ_rpfr0L53EHWLpgA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI3MDA3NyBTYWx0ZWRfX0WkGSPTTxXrt
 OTas0sAX9+6U+ML0fcVU6epZzke+7XRNxSpzX3nj6+Rn4rsxqv4c2LrgO/DEQNAQyTI2hg9ho6Y
 NLtZ20Z9ObTOQyHLaCeYYLorwbg95D0h524ajeo2xlblwU0xb6bhZGxKPb7VrcMXpg4oIcj3Zf6
 AFWXJ/ZF8o+vktPRwuf0Le6l7X2q+7h4s1GRG5jHuaHrx5Z5e7NNTZAce5X2dcX7JX98bCudAAI
 hb2QgAe78Zzo3SHIi7Au3HDmHTPck4b50vLaTBbWTdxHAmUOQt90ovYUvkZKmM7czKDUvNsWPxc
 Q9SE/ZDpMim8DU844Q0tM/8x3wJKk8dcS8BpkzyH46APzrMVOlNqkB0r1sQp5jHLhcAkg3Ya02+
 3bTc82rrQCuRINLTUK/CT+6PbQEXOQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1011
 spamscore=0 malwarescore=0 phishscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511270077

On Qualcomm automotive SoC sa8255p, platform resources like clocks,
interconnect, resets, regulators and GDSC are configured remotely by
firmware.

PM OPP is used to abstract these resources in firmware
and SCMI power protocol is used to request resource operations by using
runtime PM framework APIs such as pm_runtime_get/put_sync to invoke
power_on/_off calls from kernel respectively.

"qcom,snps-dwc3-fw-managed" compatible allows the driver to
determine if device resources are managed by firmware.
Additionally, it makes the power-domains property mandatory
and excludes the clocks property for the IPs where resources
are managed by firmware.

Macros are introduced to represent key lifecycle events:
initialization, system and runtime suspend/resume, and exit.
The driver sets the appropriate resource state during probe,
remove, suspend, and resume operations, enabling bulk ON/OFF
transitions of grouped resources according to the
controller's operational state.

Below architecture diagram explains the firmware managed resource
abstraction:

                                         +--------------------+
                                         |   Shared Memory    |
                                         |                    |
                                         | +----------------+ |       +--------------------+
  +----------------------------+       +-+->  usb-shmem     <-+---+   |    Linux VM        |
  |        Firmware VM         |       | | +----------------+ |   |   |   +----------+     |
  |                            |       | |                    |   |   |   |   USB    |     |
  | +---------+ f +----------+ |       | |                    |   |   |   |  Driver  |     |
  | |Drivers  <---+  SCMI    | |   e   | |         |          |   |   |   +--+----^--+     |
  | | (clks,  | g | Server   +-+-------+ |                    |   |   |      |    |        |
  | |  GDSC,  +--->          | |   h     |         |          |  b|k  |     a|   l|        |
  | |  gpio,  |   +--^-----+-+ |         |                    |   |   |      |    |        |
  | |  resets,|      |     |   |         |         |          |   |   |  +---v----+----+   |
  | |  etc.)  |      |     |   |         |                    |   +---+--+  USB SCMI   |   |
  | +---------+      |     |   |         |                    |       |  |  INSTANCE   |   |
  |                  |     |   |         |  +---------------+ |       |  +-^-----+-----+   |
  |                  |     |   |         |  |  pcie-shmem   | |       |    |     |         |
  +------------------+-----+---+         |  +---------------+ |       +----+-----+---------+
                     |     |             |                    |            |     |
                     |     |             +--------------------+            |     |
                    d|IRQ i|HVC                                           j|IRQ c|HVC
                     |     |                                               |     |
                     |     |                                               |     |
+--------------------+-----v-----------------------------------------------+-----v---------+
|                                              HYPERVISOR                                  |
+------------------------------------------------------------------------------------------+

     +--------+   +--------+                                           +----------+
     | CLOCK  |   |  Reset |                                           |   USB    |
     +--------+   +--------+                                           +----------+

Below architecture diagram explains the PM suspend and resume
sequences (the runtime suspend or resume also will follow similar
flow, using different levels to signal the firmware for managing
respective resources for the operational states):

PM Suspend Sequence

+-----------+    +-----------+    +-----------+    +-------+    +-----------+    +----------------+    +----------+
|Kernel_PM  |    |DWC3_QCOM  |    |DWC3_CORE  |    |  PHY  |    |   PMOPP   |    | SCMI_Transport |    | Firmware |
+-----------+    +-----------+    +-----------+    +-------+    +-----------+    +----------------+    +----------+
     |                |                |              |              |                  |                  |
     | Call suspend   |                |              |              |                  |                  |
     |--------------->|                |              |              |                  |                  |
     |                | Notify core    |              |              |                  |                  |
     |                | for suspend    |              |              |                  |                  |
     |                |--------------->|              |              |                  |                  |
     |                |                | Trigger PHY  |              |                  |                  |
     |                |                | exit         |              |                  |                  |
     |                |                |------------->|              |                  |                  |
     |                |                | Ack PHY exit |              |                  |                  |
     |                |                |<-------------|              |                  |                  |
     |                |                |              |              |                  |                  |
     |                |  core Suspend  |              |              |                  |                  |
     |                |    complete    |              |              |                  |                  |
     |                |<---------------|              |              |                  |                  |
     |                |                |              |              |                  |                  |
     |                |                | dev_pm_set_level(SYSTEM_SUSPEND)               |                  |
     |                |--------------------------------------------->|                  |                  |
     |                |                |              |              |                  |                  |
     |                |                |              |              |                  |                  |
     |                |                |              |              | Forward set_level|                  |
     |                |                |              |              | (channel A,      |                  |
     |                |                |              |              | domain B,        |                  |
     |                |                |              |              | SYSTEM_SUSPEND)  |                  |
     |                |                |              |              |----------------->|                  |
     |                |                |              |              |                  | Pass suspend info|
     |                |                |              |              |                  | (channel A,      |
     |                |                |              |              |                  | domain B,        |
     |                |                |              |              |                  | SYSTEM_SUSPEND)  |
     |                |                |              |              |                  |----------------->|
     |                |                |              |              |                  |                  | Switch off clocks
     |                |                |              |              |                  |                  |  interconnects,
     |                |                |              |              |                  |                  |  disable GDSC,
     |                |                |              |              |                  |                  |  disable VBUS
     |                |                |              |              |                  |                  |
     |                |                |              |              |                  | Ack              |
     |                |                |              |              |                  |<-----------------|
     |                |                |              |              | Ack              |                  |
     |                |                |              |              |<-----------------|                  |
     |                |                |              | Ack          |                  |                  |
     |                |<---------------------------------------------|                  |                  |
     |                |                |              |              |                  |                  |
     |                |                |              |              |                  |                  |
     |<---------------|                |              |              |                  |                  |
     | Suspend        |                |              |              |                  |                  |
     | complete       |                |              |              |                  |                  |
+-----------+    +-----------+    +-----------+    +-------+    +-----------+    +----------------+    +--------+

PM Resume Sequence

+-----------+    +-----------+    +-----------+    +-------+    +-----------+    +----------------+    +----------+
|Kernel_PM  |    |DWC3_QCOM  |    |DWC3_CORE  |    |  PHY  |    |   PMOPP   |    | SCMI_Transport |    | Firmware |
+-----------+    +-----------+    +-----------+    +-------+    +-----------+    +----------------+    +----------+
     |                |                |              |              |                  |                  |
     | Call resume    |                |              |              |                  |                  |
     |--------------->|                |              |              |                  |                  |
     |                | Notify core    |              |              |                  |                  |
     |                | for resume     |              |              |                  |                  |
     |                |--------------->|              |              |                  |                  |
     |                |                | Trigger PHY  |              |                  |                  |
     |                |                | init         |              |                  |                  |
     |                |                |------------->|              |                  |                  |
     |                |                | Ack PHY init |              |                  |                  |
     |                |                |<-------------|              |                  |                  |
     |                |                |              |              |                  |                  |
     |                |  core Resume   |              |              |                  |                  |
     |                |    complete    |              |              |                  |                  |
     |                |<---------------|              |              |                  |                  |
     |                |                |              |              |                  |                  |
     |                |                |              |              |                  |                  |
     |                |                | dev_pm_set_level(SYSTEM_RESUME)                |                  |
     |                |--------------------------------------------->|                  |                  |
     |                |                |              |              | Forward set_level|                  |
     |                |                |              |              | (channel A,      |                  |
     |                |                |              |              | domain B,        |                  |
     |                |                |              |              | SYSTEM_RESUME)   |                  |
     |                |                |              |              |----------------->|                  |
     |                |                |              |              |                  | Pass resume info |
     |                |                |              |              |                  | (channel A,      |
     |                |                |              |              |                  | domain B,        |
     |                |                |              |              |                  | SYSTEM_RESUME)   |
     |                |                |              |              |                  |----------------->|
     |                |                |              |              |                  |                  | Enable VBUS,
     |                |                |              |              |                  |                  | enable GDSC,
     |                |                |              |              |                  |                  | switch ON clocks,
     |                |                |              |              |                  |                  | interconnects
     |                |                |              |              |                  |                  |
     |                |                |              |              |                  | Ack              |
     |                |                |              |              |                  |<-----------------|
     |                |                |              |              | Ack              |                  |
     |                |                |              |              |<-----------------|                  |
     |                |                |              | Ack          |                  |                  |
     |                |<---------------------------------------------|                  |                  |
     |                |                |              |              |                  |                  |
     |                |                |              |              |                  |                  |
     |<---------------|                |              |              |                  |                  |
     | Resume         |                |              |              |                  |                  |
     | complete       |                |              |              |                  |                  |
+-----------+    +-----------+    +-----------+    +-------+    +-----------+    +----------------+    +--------+

Signed-off-by: Sriram Dash <sriram.dash@oss.qualcomm.com>
---
Depends-on: https://lore.kernel.org/all/20250422231249.871995-1-quic_djaggi@quicinc.com/

---
Sriram Dash (2):
      dt-bindings: usb: qcom,snps-dwc3: Add support for firmware-managed resources
      usb: dwc3: qcom: Support firmware-managed resource states for power management

 .../devicetree/bindings/usb/qcom,snps-dwc3.yaml    | 173 +++++++++++++--------
 drivers/usb/dwc3/dwc3-qcom.c                       |  97 ++++++++++--
 2 files changed, 199 insertions(+), 71 deletions(-)
---
base-commit: c77a6544d8a2364e4bee1b52890f577be27b7296
change-id: 20251127-controller_scmi_upstream-a344bad23bcc

Best regards,
-- 
Sriram Dash <sriram.dash@oss.qualcomm.com>


