Return-Path: <linux-arm-msm+bounces-79152-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 27057C14038
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 11:12:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 6176A34FD58
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 10:12:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3FEF302150;
	Tue, 28 Oct 2025 10:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qyf34VUl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 428182C0294
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 10:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761646328; cv=none; b=bVJlDXsAsILAIXMGfZAg33aPPOptRlTgVmJbbyUQdeM9GvbTt6lBn2DvIzhgQTn6zRfErACDU9tP14kfm1Ry68R2/fSkmxtsPvdF8f9+uR+IW1XC6BYn1xKNlnd1iYqzsjccMOa8YCd9b8EgOfUr9cLe50V7y6Eqyj7oW7t7Fpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761646328; c=relaxed/simple;
	bh=iL7I37fqMtFDT6Am/ovhwJBg4E+9/0gzvyjWcWeJqEs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=aW9mHGRqBP9cs9ezNHPUhRCsHfsNGu/KFLgZA74Too6Q7A2VDTsPPMPf47uiObUucP4LEHdQ0teS5ofx8V3UpnHeYk37lCmdHhHYri3MzPoEe6/1Ks2NJo7MdXSTd1z0F4jn8d98KUFS1ENG+83iyB4BgTTEMMM7NxPAjGnEQ14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qyf34VUl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59S8j4GM2881593
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 10:12:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=buqw48wZ2ixwgWecJ4AHiC
	AXp2L7dg9Fzs85seWPCLc=; b=Qyf34VUlRzbrOyuqJBPX+vxMCe2U3w6+bwcj8F
	Xpi6oYft8Kl2jSEo4N6aoBobt9l2+iwuFUCnZaV+86JRkv3r1vEx2Tsb9ulaAvTy
	FtBq53l139bTy0zL8leRiYs5Cl2uez4iuzej1+5v4xVCijy4JyyTAc8sq7dcpap1
	xU6JX8rHg3VAyY1uhLmbEhncXvQeyTXNEDGhlcghQMFL0XJHNC/N0sY4kb/Ep73z
	seJkANpKt3p41uhrQ9xa8bM9RdhgrZZljvL+Uy8A9uUX9Rq1JKk4Es+FCsN6X2gw
	9kPZp5AB8eTibXPY7SLz95/qAfAN97HFR+Xe31Mdijk1ZL0w==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a29uhbd75-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 10:12:06 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-294880e7ca4so100913125ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 03:12:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761646326; x=1762251126;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=buqw48wZ2ixwgWecJ4AHiCAXp2L7dg9Fzs85seWPCLc=;
        b=Nr/ShXYAeTpDq+1yEw10XaAFJ9CWi95Us9VW8hAqe3gfkHJw5yrL3rOTI0k+oMvLlK
         F92tca1fdB501ymj+bkprD9aBlt8kaG+Dwsx3+tsJOvVHCyjv2mlZSZrYJllt9bq38Ca
         x0xyYUU/G7GC3UVfsvXU59BZVkZRcsg2JkjyohFt8cQacupFy5g1Y5VreJvJVt+Xf1+s
         DXeJ0WgbXkLSYXqCFVn+ParR3tcEHPyWCzgwsnH8h7VfX6Mse4mj8nmKDDY1oMIOBd0W
         DKCVQeHYEDWpN7/vnEC7qb3+17s2jo/278VM3TDAIkDo3eDBm3K88aNtiEwCQAQD2Rtw
         wmNA==
X-Gm-Message-State: AOJu0YwDqenJf/vgdLRDO9TdPsG57e/wWCYip+MgJpBagejHYRE5Vs5i
	zM0+DvhiJmU3G8d1SeHisgBNu0C6BVMuiHVxpGa1cJ9nuGgOC33F4kbpmzUjchgYPNNcij2av9n
	FFfU5co2zoIdvKoFv6dhh+ElgswBR/FEiR5OklARd9abwCrRVzi7VoNLBcEJpTOyYoMxyaTXlpW
	TFapA=
X-Gm-Gg: ASbGncvbH3Entz3J7xsjlNH5+zjAjw7urmSIkdiqJAehyHG0OIu7Daxh3L+LVE3tWO2
	eBFicV6igh1KkcEVCNI6bjSSnIsO1gSpGnGvi991deXNdMzg5XTtI2S9BhPBWkcTaClkmew2FyG
	bUX7Mzedqo8SFQMDpoCeRTJMQIXPKkBmhuRSb0Z+b8HVKM6QWWA3ZHkmV8qxdOvr+A5r8a/MZEc
	hazDioS4mQmQxlqfjQgfEx/6ZSojNYlv1dDPYXNEY2p4GJwXK9BtpJuc1tEqE+uVSfkyVRXi84k
	z3HiBzCo0HUOvYXfOuVQ2JxRiBwBTqIyuV4zls2WqhNf6/B4OOPSrPCQFmrLVPdr5J+ETXWw4G5
	Pb6NZ06hVa/a5wPxXKtH1wodvjtK9VfG6b3k2KzTs9xo05Q8lIKzElWsJG/9gTw==
X-Received: by 2002:a17:902:db12:b0:290:9a31:26de with SMTP id d9443c01a7336-294cb525649mr39336195ad.33.1761646325698;
        Tue, 28 Oct 2025 03:12:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEoOZGGOEt0phXm+J2KmSHFAnFwf0oW1ZiPsm8YvD0d0IrmHC4X8XekduC5XQE7VLYGJ5yRMw==
X-Received: by 2002:a17:902:db12:b0:290:9a31:26de with SMTP id d9443c01a7336-294cb525649mr39335755ad.33.1761646325135;
        Tue, 28 Oct 2025 03:12:05 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498cf423esm110408755ad.19.2025.10.28.03.11.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 03:12:04 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Subject: [PATCH v4 0/3] coresight: add static TPDM support
Date: Tue, 28 Oct 2025 18:11:39 +0800
Message-Id: <20251028-add_static_tpdm_support-v4-0-84e21b98e727@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANyWAGkC/x3MQQqAIBBA0avErBNqqIyuEiGSU82iEscikO6et
 HyL/xMIBSaBoUgQ6Gbh88hoygLmzR4rKXbZgBW2dYW9ss4ZiTbybKJ3u5HL+zNEVS8dNlr3rSa
 EXPtACz//eZze9wNzZEcsaQAAAA==
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Tao Zhang <tao.zhang@oss.qualcomm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761646319; l=2027;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=iL7I37fqMtFDT6Am/ovhwJBg4E+9/0gzvyjWcWeJqEs=;
 b=ulX3NnWkQGxxcdh2JMfepa/tXj9j4B3EM+LcLNZCzyLWdBBdicfrS/Wg+jQ8HP80LS2HrnvwA
 zd0bCxXxvwmDJ0ZhVSMpPsychpu+sS6VVHx2L8d2IJRfJ6+gP0PE2sn
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-ORIG-GUID: jH0t5YNOcIxoWSZk4u95p_yJLzRGhmJ3
X-Proofpoint-GUID: jH0t5YNOcIxoWSZk4u95p_yJLzRGhmJ3
X-Authority-Analysis: v=2.4 cv=QuFTHFyd c=1 sm=1 tr=0 ts=690096f6 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=9tgT5Dm6iABrUsP_WvEA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDA4NSBTYWx0ZWRfX2/ihMQZ6Fi9P
 Sr1nXdkps0YAXOkltjCp7RcHM+vRePIVKpSUHsVS3wUaQr1Xb/fVB8ek4xtFu7sL4eZ/LJ2451p
 xd7/i0hxWdT1ENeck1lWW5wmRiczDEsWUSDcWgySaSdfTn/wywCLlPgBJ7oklbsEYBdNY0H1Wii
 3kE7WiS+Jegro8QsExMhIvsv6HLiLkn5bEj3kadI1S3pENdvVpyLsRvUJG7W36WnuSaJQfcbbda
 SWAJrcDHCc8iiwpfpg1i+rBaFy2cQDW2bRTD6H1IxVwbw1phBmH+O2f0yCA9qG2LPsyx/Q50ftC
 XEZNdkkb49km1SyNX4hN0UCZmFeWdBDHzljBb/1LmC9r43zqBUCu96NnZ5h2LN1apGHxOd2O20z
 78naUEJ2K8Yal2i6UFrMrmuxMZNqaQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_04,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510280085

The static TPDM function as a dummy source, however, it is essential
to enable the port connected to the TPDA and configure the element size.
Without this, the TPDA cannot correctly receive trace data from the
static TPDM. Since the static TPDM does not require MMIO mapping to
access its registers, a clock controller is not mandatory for its
operation.

Meanwhile, a function has been introduced to determine whether the
current csdev is a static TPDM. This check enables the TPDA device
to correctly read the element size and activate its port accordingly.
Otherwise the TPDA cannot receive the trace data from the TPDM device.

Changes in V4:
1. decouple from tpda driver code.
2. Introduce a new solution to identify static TPDM.
Link to V3 - https://lore.kernel.org/all/20251013-add-static-tpdm-support-v3-0-a720b73e83db@oss.qualcomm.com/

Changes in V3:
1. rebased on next-20251010
Link to V2 - https://lore.kernel.org/all/20250911-add_static_tpdm_support-v2-0-608559d36f74@oss.qualcomm.com/

Changes in V2:
1. Remove the dependency.
2. Collect tags from Rob and Konard for patchset 1 and patchset 3.
Link to V1 - https://lore.kernel.org/all/20250822103008.1029-1-jie.gan@oss.qualcomm.com/

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
Jie Gan (3):
      dt-bindings: arm: document the static TPDM compatible
      coresight: tpdm: add static tpdm support
      arm64: dts: qcom: lemans: enable static TPDM

 .../bindings/arm/qcom,coresight-tpdm.yaml          |  23 ++-
 arch/arm64/boot/dts/qcom/lemans.dtsi               | 105 +++++++++++++
 drivers/hwtracing/coresight/coresight-tpda.c       |   7 -
 drivers/hwtracing/coresight/coresight-tpdm.c       | 174 +++++++++++++++++----
 drivers/hwtracing/coresight/coresight-tpdm.h       |  12 ++
 5 files changed, 279 insertions(+), 42 deletions(-)
---
base-commit: f7d2388eeec24966fc4d5cf32d706f0514f29ac5
change-id: 20251028-add_static_tpdm_support-1f62477857e2

Best regards,
-- 
Jie Gan <jie.gan@oss.qualcomm.com>


