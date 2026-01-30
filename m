Return-Path: <linux-arm-msm+bounces-91269-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id pWFTHp2LfGnvNgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91269-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 11:44:45 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AEA66B972D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 11:44:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 58104300D94A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 10:44:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E3BF2F0C7F;
	Fri, 30 Jan 2026 10:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dxD2tAoJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EclKDsPz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D7A336A03B
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 10:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769769882; cv=none; b=hdZpwrYWmdyN0qUWpsZ2RZ4cy62mj1DFQ1/6mr1zdfwYlXE2dXDokhAveFAv3OyBC1QM1po27XIUnu2sEV9zbwX5LTkaV9QZnc/NkWlIXZDxCOVm+f5uk+QynjlCy2fGnuzQNsCnRdXFSOUXYeMimCbEJndd8Uxpz+RMDuq+RVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769769882; c=relaxed/simple;
	bh=UkqzJuJSnuN7H0m3EWp/Ondn1y+Z0aKMJnexqBz9nNY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Ab92XXzdLoKPGe54SFF9ibbGTi6ciSOAWKXyJcJXihZwP16GuuPhs2R4OP3P5Qvhc1J9L+DxXB483/0tJL45C5zd7RZfWYek+KHp6onWuHayfsm+DibB+bY3UXGhQGI6KVi0Bo+sC8rnIX5WIMsVi0gGUueLKtSxxsjvh2TFnPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dxD2tAoJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EclKDsPz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60U4bnqP1826296
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 10:44:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=KMlzmANYZGozYGIY4q6ueI
	QTYz67Z+A+DviLOBx8XzU=; b=dxD2tAoJt4G2h8AaaRt1eXpcuJ8ejheZHkRNVu
	Px5ucY5XWLzZ48HIZK8C7GaeUTkc71k71W1a/CdeBoNaUoIQjbPDiSNUerjGaE0/
	oTQwoAsgFACL7gIiPH31gFZmePrOBgXa/BM4/JopllhSN5AeQ6ni+bU2ly0LLvuK
	RlXpaDEjY8tch5Tic16T5/BdbFS+u7Y2N1Cq47NPXoidXtosEPMVqVsONnkeh6m/
	98LR5FkatABISP8Uiy275dxW7VjET+jkG6HQ/ZzC0Ilqf3qlo693GauAKNsfrcdD
	vtwxXYohxH77KRf/6WdK1U22JRgmiUokIvGPxYh9KYgf/pIg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c0nsms1pd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 10:44:40 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-29f1f69eec6so22829065ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 02:44:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769769879; x=1770374679; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KMlzmANYZGozYGIY4q6ueIQTYz67Z+A+DviLOBx8XzU=;
        b=EclKDsPzMESYAkFj4xm6T+4n9D8O6QIDnyDKq5LQCxPIODtNjBx/QDDxcGrhhIifH+
         fBwsBZyH0go7s6pLQfR6WRCYuE+S2ZhgBJpfTwRq2w9FmM4LXFojUNiL135SWVSTNsC7
         UM9LiJjunZ9ejiQkxRjl0Hzz9UOMB9jWqMzpTP1hgyB0fnTCox/GS7LGnsClSMUMUZ2d
         rdT8DaGD7giXS2fDyvEdDmL6ILW58uCFfoN2AmNRitqX9xp7js1v3uE+k4vyj5Q3C7OQ
         lipw5x519jyKDQB7ZtYj0WooBk3ToCEBa1dd98CyLFA2nT/cxJm9pF1l2zRP10V1qbsH
         kWbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769769879; x=1770374679;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KMlzmANYZGozYGIY4q6ueIQTYz67Z+A+DviLOBx8XzU=;
        b=SKHE7mjP7NHagckCsfOP//a8KtkHJ0gAB9umLwET/OC4GbWzJSq/ERSGMy9axzp+mZ
         GJp8tTw3yzf3fDSftegptx6baHumAkhl/fV4yUN6FS2fNoEOtsHTpl/QJ4aFEULVdYOt
         p1w/Pz7Iw8DZv5AF1rwH5uD1lqaqjBgYVU0XmvNfaxBwgu+BujNcU6/UX4C9D0aTdCfL
         Py1EUCxNOvucDqiW69Fb7azhB/t9rE7415PdXLfaoqkQS7R+s40y5SuJofViOv+qsT0w
         lpIvLNpfHX/gwines19KTjLkVlMrALnu0ZW7907hss82grO8DaWYKhGvVbRgbncyCkjH
         MeVQ==
X-Gm-Message-State: AOJu0YxeZARgpnJuJSf00BB2EWBWjZk9nFIvocAkfSxzGKIo0zyWEJnr
	p9TIMSEC2z+y9mctGkFxD/Mxgo2j6IWh9so7UIcQJJ7cFAE3IltIU7h40VieyOfcOCUvA8OwwpQ
	Ce88NG7vAku7K4rYiT026N3QjX+9P908mmaxIS/yJpALylS6jANAK7Evz+Q3eVPLPA5xeLg/6le
	H8
X-Gm-Gg: AZuq6aLzq7JO4j0JA/KBe0ufqxzgPeZqdanwLYuXMJB/p5Ooa5Y8gNIri4j8HgHgOcK
	wd7K0ngYJCJfJvF7tBLUYMR2UlJ+lVbG+JRRRUwrYWGZuZxgmG++ujqNdPV5W4XiIoMEwSpI4Ia
	wZIq98rHwg0nzvFytN67pTyFChIoII8DKcpzvruQvTxqAzEW4VoPYcaWp5PW0RQ4JFltXfQl0CF
	94OtUqOOFXUsC5sTz7fX5xnrGPqMu2ZKSk70lwuwKk7dGoP4LKRf9OAQsaK1DTx9vZ6ch3u/fKy
	+eSJccBbU7p39ZIyUu/A3QvHlBTa1AC58opo0HX4bQscMBb+P03HrSovKLmglt/bPMbD+xJWTw+
	ZnMKEcgeM5P+itQBZJCpc1t6kv+//+PoWxC432Dx+kQqH25o1pjfPssbohsUOo1S14OlYaq89ap
	5h9B7CRxz/t2HgETbPZYAuez2IgqNGTgWF5XaHlD1CIirF
X-Received: by 2002:a17:903:2345:b0:2a0:d629:903f with SMTP id d9443c01a7336-2a8d9593702mr16601875ad.9.1769769879221;
        Fri, 30 Jan 2026 02:44:39 -0800 (PST)
X-Received: by 2002:a17:903:2345:b0:2a0:d629:903f with SMTP id d9443c01a7336-2a8d9593702mr16601685ad.9.1769769878692;
        Fri, 30 Jan 2026 02:44:38 -0800 (PST)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b5d92a9sm71231465ad.69.2026.01.30.02.44.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 02:44:38 -0800 (PST)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Subject: [PATCH v6 0/5] Add support to read the watchdog bootstatus from
 IMEM
Date: Fri, 30 Jan 2026 16:14:29 +0530
Message-Id: <20260130-wdt_reset_reason-v6-0-417ab789cd97@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAI2LfGkC/x2MQQqAIBAAvyJ7TtgEE/pKREittRcNNyqQ/p51G
 ZjDTAGhzCTQqwKZThZOsUrXKJg3H1fSvFQHg8Zi16K+lmPKJPTRS4raeesDOTToLNRszxT4/pf
 D+DwvxhNAemIAAAA=
X-Change-ID: 20250610-wdt_reset_reason-7a5afe702075
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rajendra Nayak <quic_rjendra@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769769874; l=3151;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=UkqzJuJSnuN7H0m3EWp/Ondn1y+Z0aKMJnexqBz9nNY=;
 b=s/6iFWuKQHil5X08wCG+FNnWw1QVoBzYEHXsjtJin80TYyoCkFZ5hxZV9G7A7nzz9WrcSIDqM
 y8F8qFWh6v4DYUvkRcngJTf2gd7/ma11X1WrmgOSeHMd58i+uYb3Mxw
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMwMDA4NyBTYWx0ZWRfXxAptUL0ZoA1Y
 2TEj7rQlTomuo6Ks/4sZGqJOwMKoX7xN0k5RByS1NkKeuoWfN5TJ442wGbbczC6JBftp9Luyj72
 7OG/bKbJoDlNmpHz2sVZztdwcir0rTz9wW2ed5F/q+IHoZe5wqdWHnkfz5uP7EK9Z5C42jZWxnm
 mxBOi7bmze6vOmBjCMO13K1iia1+ATlica5Ohovghbs3/JAhq8ySz7sYouNdiK3Ifer/91DWrjE
 TMeC+QIsoEc3UK5E/r2Ht+K0aKjm5rKooQCITsH3BUmzcHOAscBkd39jDOIiHeWyVRVAhdyfePy
 wZBaJRJpstrYQsHPquxPkHJsQzqRFR7vlI+sbW5ZjTmwzoBucnxu0wPP61FdxsFfu/HGfLiQ5d5
 /sL6EttdTNwOfujWxF6lKfblYaenjtceYbHcz1I6tw0cWyCPyMhRBM3dSrxcPye9wEpouBeQtpv
 /n+IrQbP4WgdeAIE0qg==
X-Proofpoint-GUID: nCG8kkeWFQCDvX5YQmWNVQg6EGDGEFli
X-Proofpoint-ORIG-GUID: nCG8kkeWFQCDvX5YQmWNVQg6EGDGEFli
X-Authority-Analysis: v=2.4 cv=HMbO14tv c=1 sm=1 tr=0 ts=697c8b98 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=3xu3cfvniY9m67ySxx8A:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-30_01,2026-01-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 suspectscore=0
 phishscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601300087
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91269-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,0.0.0.0:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: AEA66B972D
X-Rspamd-Action: no action

In Qualcomm IPQ SoCs, if the system is rebooted due to the watchdog
timeout, there is no way to identify it. Current approach of checking
the EXPIRED_STATUS in WDT_STS is not working.

To achieve this, if the system is rebooted due to watchdog timeout, the
information is captured in the IMEM by the bootloader (along with other
reason codes as well).

This series attempts to address this by adding the support to read the
IMEM and populate the information via bootstatus sysfs file.

With the CONFIG_WATCHDOG_SYSFS enabled, user can extract the information
as below:

cat
/sys/devices/platform/soc@0/f410000.watchdog/watchdog/watchdog0/bootstatus
32

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
Changes in v6:
- Moved the IMEM compatible from qcom,imem to sram binding
- Updated the 'sram' property in watchdog binding to point to SRAM
  region and update the watchdog driver accordingly
- Dropped the Konrad's R-b tag in 2/5

Changes in v5:
- Rename property 'qcom,imem' to 'sram'
- Use dev_err_probe instead of dev_err
- Link to v4:
  https://lore.kernel.org/linux-arm-msm/20250519-wdt_reset_reason-v4-0-d59d21275c75@oss.qualcomm.com/

Changes in v4:
- Kept only the WDIOF_CARDRESET and dropped other codes (Guenter)
- Renamed qcom_wdt_get_restart_reason() to qcom_wdt_get_bootstatus()
- Dropped the device data and describe the required information in the
  DT (Konrad)
- Link to v3:
  https://lore.kernel.org/linux-arm-msm/20250502-wdt_reset_reason-v3-0-b2dc7ace38ca@oss.qualcomm.com/

Changes in v3:
- Picked up the relevant tags
- Dropped the fallback compatible handling
- Split the driver changes into 2. Introduce the device data in one and
  extend the same in another for the use case
- Link to v2:
  https://lore.kernel.org/linux-arm-msm/20250416-wdt_reset_reason-v2-0-c65bba312914@oss.qualcomm.com/

Changes in v2:
- Dropped the RFC tag
- Reworked the driver changes to use the syscon API
- Link to v1:
  https://lore.kernel.org/linux-arm-msm/20250408-wdt_reset_reason-v1-0-e6ec30c2c926@oss.qualcomm.com/

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>

---
Kathiravan Thirumoorthy (5):
      dt-bindings: sram: describe the IPQ5424 IMEM as mmio-sram
      arm64: dts: qcom: ipq5424: Add the IMEM node
      dt-bindings: watchdog: qcom-wdt: Document sram property
      watchdog: qcom: add support to get the bootstatus from IMEM
      arm64: dts: qcom: ipq5424: add support to get watchdog bootstatus from IMEM

 .../devicetree/bindings/sram/qcom,imem.yaml        |  1 -
 Documentation/devicetree/bindings/sram/sram.yaml   |  1 +
 .../devicetree/bindings/watchdog/qcom-wdt.yaml     |  6 +++
 arch/arm64/boot/dts/qcom/ipq5424.dtsi              | 14 +++++++
 drivers/watchdog/qcom-wdt.c                        | 43 +++++++++++++++++++++-
 5 files changed, 62 insertions(+), 3 deletions(-)
---
base-commit: 33a647c659ffa5bdb94abc345c8c86768ff96215
change-id: 20250610-wdt_reset_reason-7a5afe702075

Best regards,
-- 
Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>


