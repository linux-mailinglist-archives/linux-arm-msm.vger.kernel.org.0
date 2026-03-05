Return-Path: <linux-arm-msm+bounces-95493-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2HLxJ5kGqWlW0QAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95493-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 05:29:13 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A97D20AC95
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 05:29:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 53F8F305B2A9
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Mar 2026 04:29:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E711274B59;
	Thu,  5 Mar 2026 04:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OF7XjYQC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bOZJVFUD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6828288AD
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Mar 2026 04:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772684941; cv=none; b=d4zWtCzzp04SbSzEmRkmyXde/SwjSN+gNWkJ+0KrJOgrA+vVpJM4rYfkAAays/z7nJ5s3nMnUIWcDwe08pZB14hV4zXpEpa0Uspa+EWIRAQ9ku2NzdlOzDJQsXX6M6scjOFe69roCTdfXw03mpfz5Mx3AEI71acW6nUyhDGJLO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772684941; c=relaxed/simple;
	bh=+Cx5q89r/2uxmygkXvkznY4AxwqKjadt+WOwF9aZKAk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=iG6DTMMX70luJbJDnzXaQAzIPFb4Nar6kWjSc2hvEaOstXYKK/pY0nklrRAjbDyZJEdJ+jkGmgrTrDDW4IroKrVUCiOo34prfsNGrmoPaHKSh4VjEarUKOhOmKcpEu8gEaE2V2R0GyGFVMSrLe1kyiEfz0KU220MutogRhatg5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OF7XjYQC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bOZJVFUD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6251CFHY3473621
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Mar 2026 04:28:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Oi71X33SI7rhKIyGul9KTr
	YLg9wAYvvKP6HOo9k0t/s=; b=OF7XjYQCHbt5CkQeU/rTYQWdxwQdDl9fxn8uKr
	DtIGRaoxmeNmEW5aRtTbPo1leJsFIQQPz/3GD8oTGMgF3Z4HP8AHe04ar2SL7n7t
	3mnKYpPB+KbfuJjbrhgeTojUMfKZqhyb6mElRkUsXyzxzAimunfEIAMiCBM12aAh
	qmxKzcmUqfenp2U6ozNp9R4JdboTYIAiaP4qWRHSktfO7WLEKSD2yE3XZOZfIJa0
	r94HSS94VZvu4l8i0ojmhCTaQyf0lnFhpZEa10YgPgrdW5alSGchWGx5xATSO81V
	IE3ogl1gLTXLPUaYc7LRSPjblslxnPu380vgurY5XQOaNJGA==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpj1835sb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Mar 2026 04:28:53 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-127133794b6so11014847c88.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 20:28:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772684932; x=1773289732; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Oi71X33SI7rhKIyGul9KTrYLg9wAYvvKP6HOo9k0t/s=;
        b=bOZJVFUDSB8foa6X8FuKd4jZNO6u/cdugUfK3oI2E/Nd6LLsfisRbMNM3oyOmKxHU8
         agQ7rNUhLhxcbqr0dArT9IHvxSjG7s2yRMOqVovo8lv2zEzWHJwa6+X3M9Fl5cJRovIK
         Stun+VUMroIP0czrjVsY6gR0zNIsCJqjz+/g7vdbqx27h5H8emFWPTJZqqatMLjF7O5I
         cQVmuLDLCrYa90iyPGm0SU0LL0mwTaUNeVmo+w4jim/BDAlJPZ8NH+WYgHPf9LjOWveP
         sI4YhXRa+gw11dcmHpiN9a/LPodfJDl2SrYvjS53NnzrD/txhM2vyqiUEabtB/juOACh
         0qtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772684932; x=1773289732;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Oi71X33SI7rhKIyGul9KTrYLg9wAYvvKP6HOo9k0t/s=;
        b=k4bnGrfnHkSl7hA+jAo0l1WxaOrUovb7Zfv16uvYuR+KQk6iA+DO5YbzcAl2ZVfMMf
         QZrkGB2ZlMgqsTuPtCVuFAKqhOppe8VgkkNSbP7SW3aaoN3Wh2DXfLNOwf1RIL117sBJ
         3/gmnoGRxId6Bts2ROdqGnpvO1gxKahOYAxpxK89Pxw+0AOdXXmwI2Z7p7tmUxMXy16o
         86wt8b5Ihh84AvlCesNaxHiMv9fTle/Ny2F0W6UKZ3ggJWAOAOPnmq0rhxg+0zNVb+hS
         SFiJoYj28111b0Lh74AVElZKevgouMygLQsM5/B9RSUTsHDp+wd/dTTiMsaHuOtSVAx/
         IYYA==
X-Gm-Message-State: AOJu0Yz8xuAeJchZcnyG4uBImUpTsXFvgk1WV8O6s5Sce05qvk+Njp6b
	ofwdsF2gCA7LsMjK7xoAynGqV8lQ191gUX+kLM/mIwIIsRX2qhsaZVJXt0WIfSjz8NEsh+Qx3rz
	QlF/maM7hjlGR/xjsJ/lJET9Rs/OZgh74hjgyFeNxp6xsdvRIJOR5Xfd0VZp+FGMbrfvA
X-Gm-Gg: ATEYQzx39OWCxWe7f5712hQ9kf5qIggHRwE2YaBp8+2FkbybN2Rh3YJBNW8KIxG0Y7W
	OR0jS8v0QLrdWwJpr8qRuGnHkeAp64x4uzKUNKSCZh8sjYlooVPYzgW3cNJG//ji29E+UDhT210
	s2560vfVauYt1zDAQGnr1N1ufBNtAFHE/Pxc/71BGm7ScSqezeccMnx/Cu4vzaM0TyosHyfYOOq
	Op9ksITmmvOsraH4mjAutd0HJM47pUykzlWr2jQ4KjjfIPx6rSXoZWTu49aNjarGzUHdypLMVLb
	sc4mLTHBRMWY9MlTJW6gnlcKskr182ZiGJnD3v2n85mfhendx82pgKUU6T+YaTveeaD2C2veQVX
	wbww1q6Je10W7iBWkBNLN0A6kfgxTI1zQA7rmLWxv0SsCLGeYOXefAHIagWhiFbOZVlOSmDWnmA
	==
X-Received: by 2002:a05:7022:6629:b0:127:5c3d:bd95 with SMTP id a92af1059eb24-128b70df628mr1655496c88.32.1772684932339;
        Wed, 04 Mar 2026 20:28:52 -0800 (PST)
X-Received: by 2002:a05:7022:6629:b0:127:5c3d:bd95 with SMTP id a92af1059eb24-128b70df628mr1655483c88.32.1772684931745;
        Wed, 04 Mar 2026 20:28:51 -0800 (PST)
Received: from hu-djaggi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1279cbd1993sm11164942c88.2.2026.03.04.20.28.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 20:28:51 -0800 (PST)
From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
Subject: [PATCH v5 0/3] arm64: dts: qcom: Introduce sa8255p platform device
 tree
Date: Wed, 04 Mar 2026 20:28:27 -0800
Message-Id: <20260304-b4-scmi-upstream-v5-0-f8fc763d8da0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGsGqWkC/x3MQQ5AMBBA0as0szYJTZG6ilhUDWaBpoNIGnfXW
 L7F/wmEIpNApxJEuln42DPqQoFf3b4Q8pQNutRNqbXB0aD4jfEKckZyG3rbWl9XjTVjBTkLkWZ
 +/mU/vO8HR2oWj2IAAAA=
X-Change-ID: 20260224-b4-scmi-upstream-c979c51694b1
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Prasad Sodagudi <prasad.sodagudi@oss.qualcomm.com>,
        Nikunj Kela <quic_nkela@quicinc.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        Shazad Hussain <shazad.hussain@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772684930; l=7646;
 i=deepti.jaggi@oss.qualcomm.com; s=20250501; h=from:subject:message-id;
 bh=+Cx5q89r/2uxmygkXvkznY4AxwqKjadt+WOwF9aZKAk=;
 b=kSY1spIOAWhpZz2Gb0c4ZKxAI+fz9dV+ypkHqA+rf+Wsu1ClsEaPk/12kXgsnhaFsdcmcXR9p
 VMBJjY0Tm1GCCyEA+gLh3tHFZw6BAFKxEX1b6UGoAIy5IqmmEJlKNIj
X-Developer-Key: i=deepti.jaggi@oss.qualcomm.com; a=ed25519;
 pk=+b3H5UC/u0pUK5+btJ+35nW+6vKwJV1CfjJ1CJWuOZw=
X-Proofpoint-GUID: suvtc7f6tTgT6fUTkxLC08yc0jrew4Jp
X-Proofpoint-ORIG-GUID: suvtc7f6tTgT6fUTkxLC08yc0jrew4Jp
X-Authority-Analysis: v=2.4 cv=Ed7FgfmC c=1 sm=1 tr=0 ts=69a90685 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=OqDjb2b6Uua3qTf0ZKoA:9 a=QEXdDO2ut3YA:10 a=Fk4IpSoW4aLDllm1B1p-:22
 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDAzMSBTYWx0ZWRfX0dzjnUiSJ2re
 e1WoqTBNhoqu/dHh89Z0B8R0MHBziHc9T3AXKt3jAyutymsm6XjV7Rh7nkgwtG2wTl7l+mnA5aW
 oEAEShxxKbKpFwRuu7m3XwlolAj1WbVIw0r86zdutPPr2EFd6MiNNT10TTwoiwOs+JXsluk064B
 n/wSU0l0GjFfPxbXZ+hWjslcyv2nFJmrWCg1pbMno2JKZDuH1sOBZn0BcqceRYkfsZTXvkZgZyN
 CSwGITn0ONKYlMT/R3HpgYrm6HQA1BvOjvmHDcd3sAfixLm6lkrFYO+p5gwBW1r+CKJI/B9xMAy
 2C89mzzQhJrwJnO90u9GlKrdjnfkRlBV/oytm2oT0mQ2v3xtJoODpzIapDNsDBYVvmJipq/vM0j
 M4feXHiFx9NPewWFwjgHgjBJJ5cAe22Me8WxiALC75FcQXxlC8lm7kwTIG8J5QWuqEAYGUEcTHc
 frPyTgA6QsbGhSxcycg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_09,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 impostorscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050031
X-Rspamd-Queue-Id: 0A97D20AC95
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-95493-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,linaro.org:url,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[deepti.jaggi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Introduce initial device tree support for sa8255p Qualcomm's automotive
infotainment SoC and its reference board: sa8255p-ride. Use SCMI power,
reset, performance, and sensor protocols to manage resources such as
clocks, regulators, interconnects, and PHYs. Operate the SCMI server
stack in an SMP-enabled VM, using the Qualcomm SMC/HVC transport driver
for communication.

Instantiate multiple SCMI instances to support parallelism and assign each
device a dedicated SCMI channel and Tx/Rx doorbells.

Group resource operations to improve abstraction and minimize SCMI
server requests. Apply the design as presented at LinaroConnect 2024
conference[1].

Features added and enabled:
- CPUs with cpufreq
- Interrupt-controller with PDC wakeup support
- Timers, TCSR
- Reserved memory regions
- TLMM
- QuP with uart
- SMMU
- Watchdog
- TSENS (Thermal Sensors)
- PMIC support
- IPCC
- Random number generator (RNG)
- UFS
- PCIE

Architecture:
                                                          +--------------------+
                                                          |   Shared Memory    |
                                                          |                    |
                                                          | +----------------+ |                +-------------------+
 +--------------------------------+                   +-+-> |    uart-shmem  | <-+-+            |      Linux        |
 |            SCMI Platform       |                   |   | +----------------+ |   |            |   +----------+    |
 |                                |                   |   |         |          |   |            |   |   UART   |    |
 |  +------------+ f +----------+ |                   |   |                    |   |            |   |  Driver  |    |
 |  |  Drivers   <---+  SCMI    | |        e          |   |         |          |   |            |   +--+----^--+    |
 |  |  (clks,    | g | Server   +-+-------------------+   |                    |   |            |      |    |       |
 |  | icc paths, +--->          | |        h              |         |          |  b|k           |     a|   l|       |
 |  |     tlmm,  |   +--^-----+-+ |                       |                    |   |            |      |    |       |
 |  |     etc.)  |      |     |   |                       |         |          |   |            |  +---v----+----+  |
 |  |            |      |     |   |                       |                    |   +------------+--+  UART SCMI  |  |
 |  +------------+      |     |   |                       |         |          |                |  |  INSTANCE   |  |
 |                      |     |   |                       |                    |                |  +-^-----+-----+  |
 |                      |     |   |                       |         |          |                |    |     |        |
 +----------------------+-----+---+                       |                    |                +----+-----+--------+
                        |     |                           |         |          |                     |     |
                        |     |                           +--------------------+                     |     |
                       d|IRQ i|HVC                                                                  j|IRQ c|HVC
                        |     |                                                                      |     |
                        |     |                                                                      |     |
+-----------------------+-----v----------------------------------------------------------------------+-----v--------+
|                                                                                                                   |
|                                                                                                                   |
|                                                                                                                   |
|                                                               HYPERVISOR                                          |
|                                                                                                                   |
|                                                                                                                   |
+-------------------------------------------------------------------------------------------------------------------+

+--------+   +--------+                                                               +-----------+
        | CLOCK  |   |  TLMM  |                                                               |    UART   |
        +--------+   +--------+                                                               +-----------+

---
Patch 1:
Changes in v5:
  No changes

Changes in v4:
  Added the patch in this series.
  Rebased on linux-next
  Link to v3 https://lore.kernel.org/all/20250423003845.3980330-1-quic_djaggi@quicinc.com/

Changes in v3:
  Removed the patches from original series[2]

Changes in v2:
  Added Reviewed-by tag

Patch 2:
Changes in v5:
  Move soc and board dt into separate patches(Patch 2 and 3). - Dmitry
  Drop arch timer label- Dmitry
  Move pmic thermal zones to board dts - Dmitry 

Changes in v4:
  Added the patch in this series
  Updates to commit text
  Sorted clocks in alphabetical order
  Added dcvsh interrupts
  Hystersis value changed to 10000 for soc thermal zones
  Deleted sa8255p-scmi.dtsi and scmi nodes moved under firmware node to sa8255p.dtsi
  Changes to scmi shmem nodes - removed from sram and added to reserved region
  Changes to copyright
  Added address cells and size cells to interrupt controller/intc
  Added dma-coherent property to smmu
  Added pcie and ufs support
  Link to v3 https://lore.kernel.org/all/20250422231249.871995-1-quic_djaggi@quicinc.com/

Changes in v3:
  Removed the patches from original series [2].
  Added arm,max-msg and arm,max-msg-size DT property in scmi nodes.
  Changed max-rx-timeout-ms to arm,max-rx-timeout-ms in scmi nodes.
  Updated commit text.
  Reordered range property for qupv3_id_0, qupv3_id_1 and qupv3_id_3 nodes.
  Reordered vendor property(#qcom,sensors) for tsens* nodes.
  Changed cache labels to lower case.
  Removed unused i2c,spi and tlmm nodes.
  Updated reserved memory nodes.

Changes in v2:
  Removed scmichannels label and alias
  Modified scmi node name to conform to schema
  Moved status property to be the last one in scmi instances
  Changed to lower case for cpu labels
  Added fallback compatible for tlmm node

Patch 3:
Changes in v5:
  Added board changes into separate patch - Dmitry
  PMIC thermal zones moved to board file - Dmitry

[1]: https://resources.linaro.org/en/resource/wfnfEwBhRjLV1PEAJoDDte
[2]: https://lore.kernel.org/all/20240903220240.2594102-1-quic_nkela@quicinc.com/

---
Nikunj Kela (3):
      dt-bindings: arm: qcom: add SA8255p Ride board
      arm64: dts: qcom: Introduce sa8255p SoC
      arm64: dts: qcom: sa8255p: Enable sa8255p-ride board support

 Documentation/devicetree/bindings/arm/qcom.yaml |    5 +
 arch/arm64/boot/dts/qcom/Makefile               |    1 +
 arch/arm64/boot/dts/qcom/sa8255p-ride.dts       |  222 ++
 arch/arm64/boot/dts/qcom/sa8255p.dtsi           | 4861 +++++++++++++++++++++++
 4 files changed, 5089 insertions(+)
---
base-commit: af98e93c5c39e6d0b87b42f0a32dd3066f795718
change-id: 20260224-b4-scmi-upstream-c979c51694b1

Best regards,
-- 
Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>


