Return-Path: <linux-arm-msm+bounces-108459-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WJAwFNdDDGrQcQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108459-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 13:04:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 73BB557D275
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 13:04:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B6C003090856
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 10:51:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70D652874FB;
	Tue, 19 May 2026 10:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AQLB9pGa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ego2/9Hq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 097B935CBCB
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 10:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779187818; cv=none; b=OrblmS+WN5OlsiMnPVTESL/TD6IjyLa4WE0x6/igPYpcPPhXSloiLQzxJI3B6GMRbxY+S7/CQ1RNPaexaK54+/ptsjBnqMk9V+5Wv6iDVOF+3tE8ogNjdGIdqNHrYNauUYepBOev2hqoHB2IW+8uCmMMxCu4+7rf08+id7Q18nE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779187818; c=relaxed/simple;
	bh=ykVX2JfEgwuvzc2/xbvDBqQmXvj/xqAycnxzoxu1sD0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=JXi5JfM64tn3JdtllNu0lZzoapXEMyFUaoCFCocixOwrE2Mt6pKVYsLwt/lsMx8yHUVpULphQ8drKB3orcYZpmPDafb7Ga7KiN91PkLQXxmDRGINa2iovmwfWj7FdMZs+vUTI/1mNbFcPFIsA3z3vnjPrCK3FQQ1ERbQgx1CoNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AQLB9pGa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ego2/9Hq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64JAXLuU4131363
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 10:50:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=yhVzbuKGUnJsoKjJBAWaOM
	jpe2Ss3XlvwQTt6r5Oxto=; b=AQLB9pGa4RkicqpyrqQZjSdzQkCGupC8DId2Ja
	sTIqxzLUJw0F52rtrWvcNpdq6hawA2hBl8OYDJjNVTuuGp+HzulJb1PhNzVB1nC1
	IFLAu14eBbBK1+w10YNQxfCqQjJcvjaeVdO5dHXZuCuo2RnnJZFP+QfvmqP7x16F
	a9YGhG5YJR5efU8TLxsYPsejYYjs2QmQB+VziqSMKeZ3lYy+lKYgvRyxRmUoCv1o
	4tSdT0x+jKJDRlac3B9gjpH12S2SUVi4KrSptCeJwVO0Qwm/25d1nPwC4dJo2YX1
	byz0oRaPNG1Dz+vJuazdqsNJekfJieztNptFTH4Q7MBDDxfA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8ht1hb5q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 10:50:16 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82f6e6a3a76so4864235b3a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 03:50:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779187816; x=1779792616; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yhVzbuKGUnJsoKjJBAWaOMjpe2Ss3XlvwQTt6r5Oxto=;
        b=Ego2/9HqLcEjyPsuK9C4MTxAWZUaBWLoK2wnroEiI/KalO7REVhUmJRsP1bV7sUxHC
         Nx7CjY/NVhdsA7+/JCdzNeaog5ZfiOwlCZ0wmMJXdfG4BsXhPeYxW1PHe9yb+XrcnR9f
         jVdKEB3b+1dtEIlyORRQtnpfKbbCz1qHYUeDXofebC2IWh27lRraJhpCe4MP2mSPdgXX
         l6Efsm+npejeISb8tVHGA6t5Zv9/b+31EiE72EYIJhGMZi2PrUyQGCS5k//jsXNz3yzt
         9T9/d8/Oys2eC7hFu/qciiYHW+gdnIB4iz1LGPJkdDjxxV/65UDP38LEsxojTN/aSm8k
         m5/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779187816; x=1779792616;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yhVzbuKGUnJsoKjJBAWaOMjpe2Ss3XlvwQTt6r5Oxto=;
        b=lucv7ENpFHLwasLHbDY5k2U+j4amnFx9z/CNdezfIoOprOsnIsgsvHt18/Iag1+8OW
         rjoXUX9nSd+fYWwQLHo5U9JPdH4MeuRRxVpfAQn6JUh1oUZFRxoTT0sO1LsxJR0pjI6K
         k02O4WmM4p6UL42icTFmyqDxJXXZfkSuSDyJbvtB4j6Nze0kfWQTgAUEG9XuSjzdyrYG
         7UHNZ01wGzlT7NiHcKN9zfqaZpHlbYaL9atkoScqJzuOl1tCm8SXukiFquPGpWsUHY4q
         vaW7LN7KNur9bZGdYBJiJa2NTeHyD2WdzKmRN2c0IkSN4pzm9rOleij2FJeCkOv499iy
         RohQ==
X-Gm-Message-State: AOJu0YzOyLm7NvBDWQBeXHYQdxg8z3vxIIeK/zXPXBOG4LK1l9Eh0xUz
	xGCRrNFcj/nCB8ZZ5BTr93ubfUKEyQwBQhpUqGyHKAvIQxl9Ml2OkRDi9c5qaNp8LfulHOzFml5
	6tKxYj8neEHx+aRjajNItlAhbbEMuVNrrv3MEB/FjOGx5yKKSTuul+B7xR8tvpKLuBieY
X-Gm-Gg: Acq92OFUbmB4XCuOAKsPundE9eYR0Cx1V3q5vfTn6T7v10ut9a1uV+FKZOLzoiat4Nd
	JcaaTgj7EZ4t7ZzyFFvegkFNjRhWjQqdoCUTe5/vyTEuq0TYZGAtHPU1cbtnyJwV11kUBuLM0ev
	PmayDbmPJG5Tz5yQ/cbOpkRmyOsNpCMpttHeHb5uzvm67KP/Xd4OBfl7qSg0592UIHPgCp1njXI
	klp4dCVTXlyNDxFC24XqMgzj4I+oifFRFkwbEA2XITb2ygX050u7gSzlxulx8GoUwgYji5RiF0+
	Ilq+gi9zlF2+XnkUbh5+97pt/CXoQyi9PrygJhunlhlZRij8TzqNv3UX3+xFDqvGCmnQrDXBAzz
	5LFVe7v20kQ1iah31XYP9CUav0Tsu0ewk4YFXbu/b1dKEaepjvh5S6Pun
X-Received: by 2002:a05:6a00:4c0e:b0:83e:d52c:e6bd with SMTP id d2e1a72fcca58-83f33c9bc80mr19699143b3a.38.1779187815826;
        Tue, 19 May 2026 03:50:15 -0700 (PDT)
X-Received: by 2002:a05:6a00:4c0e:b0:83e:d52c:e6bd with SMTP id d2e1a72fcca58-83f33c9bc80mr19699096b3a.38.1779187815243;
        Tue, 19 May 2026 03:50:15 -0700 (PDT)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19fa869esm20877879b3a.61.2026.05.19.03.50.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 03:50:14 -0700 (PDT)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Subject: [PATCH 0/3] Add Qualcomm SPEL powercap driver
Date: Tue, 19 May 2026 16:19:48 +0530
Message-Id: <20260519-qcom_spel_driver_upstream-v1-0-75356d1b7f94@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAE1ADGoC/x3MSwqEMBBF0a1IjQ0YQVG3IhIkebYFfmJVtwji3
 g09PIN7b1IIQ6nLbhKcrLxvCTbPyM/j9oHhkExlUdZFZVtz+H11GrG4IHxC3C/qVzCuxlpMofF
 NhRqU+iiY+Pq/++F5XlQC4SZrAAAA
X-Change-ID: 20260519-qcom_spel_driver_upstream-11efd8c85e6e
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779187810; l=1732;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=ykVX2JfEgwuvzc2/xbvDBqQmXvj/xqAycnxzoxu1sD0=;
 b=BRsaVnei+AYKkPcFrJSq3/l6PPY/i5cQAO1Kr12LP/4gwE3wRutqRqZz6lXC+lae5qmcc7ywm
 wPGj+cxAqfIDi7cdUkSAP15kZDisMCwhZdvqUW4rzNYgeuNMXUuKyyu
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Authority-Analysis: v=2.4 cv=JKULdcKb c=1 sm=1 tr=0 ts=6a0c4068 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=zL8LttSLqXSf2cHOEy0A:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: 3OK7OQoM9-ODf_4amroVZmLAVn6yjPlP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDEwNiBTYWx0ZWRfX9Fqv46y8bACP
 G3SYHZHQRNTjtIllzdA4eQsONopUbclaHI82FOefQD64kcpHx4rz5/1nbzchpuKwqpnJGCAtjV6
 D/D8diPiw8ujKNLue8w+xhQxOkZsN1uAZmM0dR4n9Wg376Lqvg5pZKsoedQfA/01h+rIz5H07LR
 u/2q+CT0GM0ML36KhnNTiNgLf7yqBGlqtnZ7dIvy5O9wrAJFKlffb3yAu5GGv8S30fbMGrpDPiN
 Wms31Y8FzjtuMZv1LI8Im7xgNp4dFtezLkYSP1K01zIqmDlfX50QEb0unHi+izknOL+PBFVDulH
 Ao65s/UVe/o+NgZa3vIItSM7iwlwpJwn01e/fSRyNozp1LB6XQYv9Q361A0DkwZETXPub5UjKU+
 MO3HcTwxzDU7A4gdBqrQMeXIiMOz2zeTBfhdaLfaB0LwWmGLc6KyF0bIm637jm4hiPdzob8HWNi
 /RMZ0Pl4TjH57g1ezfw==
X-Proofpoint-ORIG-GUID: 3OK7OQoM9-ODf_4amroVZmLAVn6yjPlP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 phishscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190106
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108459-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[manaf.pallikunhi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 73BB557D275
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This patch series introduces support for Qualcomm's SPEL (SoC Power
and Electrical Limits) hardware, which provides power monitoring and
limiting capabilities for various power domains in Qualcomm SoCs.

The SPEL hardware enables:
- Real-time energy consumption monitoring across multiple power domains
- Hardware-enforced power limits with configurable time windows
- Support for up to 4 power limits (PL1-PL4) per domain
- Hierarchical power domain organization (SYS -> SOC -> subsystems)

The driver integrates with the Linux powercap framework, exposing SPEL
capabilities through standard sysfs interfaces. This allows userspace
applications and thermal management daemons to monitor energy consumption
and configure power limits for optimal power/performance balance.

Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
---
Manaf Meethalavalappu Pallikunhi (3):
      dt-bindings: power: limits: Describe Qualcomm SPEL hardware
      powercap: qcom: Add SPEL powercap driver
      arm64: dts: qcom: glymur: Enable SPEL powercap driver

 .../bindings/power/limits/qcom,spel.yaml           |  47 ++
 MAINTAINERS                                        |   7 +
 arch/arm64/boot/dts/qcom/glymur.dtsi               |  10 +
 drivers/powercap/Kconfig                           |  13 +
 drivers/powercap/Makefile                          |   1 +
 drivers/powercap/qcom_spel.c                       | 787 +++++++++++++++++++++
 6 files changed, 865 insertions(+)
---
base-commit: 80dd246accce631c328ea43294e53b2b2dd2aa32
change-id: 20260519-qcom_spel_driver_upstream-11efd8c85e6e

Best regards,
-- 
Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>


