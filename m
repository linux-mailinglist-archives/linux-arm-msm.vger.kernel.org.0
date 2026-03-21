Return-Path: <linux-arm-msm+bounces-99009-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uK+6FDeivmmLVAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99009-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Mar 2026 14:50:47 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A94A92E59BB
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Mar 2026 14:50:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5B9F33008D07
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Mar 2026 13:50:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A76631F997;
	Sat, 21 Mar 2026 13:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JnhFWPjf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ilL7vhbY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20A2529D26E
	for <linux-arm-msm@vger.kernel.org>; Sat, 21 Mar 2026 13:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774101044; cv=none; b=NIg4+c5lMVY4SXh6pzL+BJ1n/U4U1LklRbeJwwVd5aGazjqoZGT7vGDqjK0soVqIQRR6TjVtcbaw/YeEbe3KkE0Ib/716gr4gwlJg7R82Xl0piut/Xd3STbLFOS0Gtx7fphGb0CqtMMYvM3wlUrgSVjoFObcxjKI7kw2xctqgBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774101044; c=relaxed/simple;
	bh=mKHx+VfRPQw/ItF5UDbBI85OytKLSDar0Sp+oJ606Rs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=XOzO3GI+GB8OB6vheLnV0GZbVbeeiCo+fK5OmY+xW8iG5Ru0C/9GG4qUsKRN02B6+7C1lrY4CbgO9fZnI4kzuBBCrMgiZimgsMxbvAHgpqMCm+6WVlhbTumUFuXXsLH4zikKdYkGvczx9HwfJZVsMt8NW+RC5lFyHzbY0BfDdME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JnhFWPjf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ilL7vhbY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62LBnr82337504
	for <linux-arm-msm@vger.kernel.org>; Sat, 21 Mar 2026 13:50:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=nXecX1NuKNC16BMQb4qBGz
	Rq5LjOcebRUD8yZZIJjtw=; b=JnhFWPjfrRRzGgmN8G1UB11yazMPXDNiLX9wYg
	/Q8ibRyHtgg+Wim71lhmhzMeP9NRlj4P8rUr+N6ats37jli4b2idNA0yrd/+Vm4Y
	3bU22VzXmLk21GwcQ9mGaP9aJbJj+j3rf9A9CYIDA5gHL/HqrP6I5m8EVZTHK9J0
	YWjxdIWd5kZJBNE3zIKPH3426f1IaM/OHXhQupNVCXSALqQVyaa7ZMxvN5xYSwaY
	zqVkNdZOlsD+S66gPW2creujUKcHZil23kxNsMmq9FsmWPLiq5mhNpNXhWH+8Pts
	ifZfK00xcrCsyRN2LzEPsny6vqAPMynObd2WqqMEDHrRY5EQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1h1e0y86-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 21 Mar 2026 13:50:42 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b091c3f891so941135ad.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 Mar 2026 06:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774101042; x=1774705842; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nXecX1NuKNC16BMQb4qBGzRq5LjOcebRUD8yZZIJjtw=;
        b=ilL7vhbYBqiIpj4K1/MJbPnXdlPNTeI86uD5qjtQ8vNNluwOSYyR9+vVWUQW8+Cb0O
         u4ianka/Ny7FcoVQUcWJUdZnn9fPU8xnQDHZtqKPCDdB4VMEsBH736OExFWmgs46TZsU
         34GnBB90SJPfXnI5B9ATE2nfBiglDQVEcv5BHYviAp0SgjDPda3TU2xxUHhBi3kZy5Xy
         1WrETDbLR7og+uhySC2HdZZX/9T49ezGclnlT36ywhZItVJqbsPGQ6SkgCnR5l3IkpRD
         BC7wEXRYl0Htv1RFr29B8mRVqLjT0BK0FR8jnU6CI8A1Qsh3CvrryUhO/jSAZKF/ITOL
         uxIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774101042; x=1774705842;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nXecX1NuKNC16BMQb4qBGzRq5LjOcebRUD8yZZIJjtw=;
        b=hu/bOVm9OciK0sA+QYWAOj0bkYlQf0DLiCUa0UIPV4adrcCa4bqcZdY3Q+q3VLCDs2
         LGnBqUUsXsXUjYw4mYPLH9gz/CHjwqyheE6DaWa2eocmEjVY6Q0zlMaRCOzTh6LA33oi
         tCASVWKjyFdlAa7vBy6HPI+XG7zdFhRWnSgwXGzwLNDHmPI8bOlOzkl40bX2HgUsPfc0
         EEM5o/1nu85EnkJb8rseie+2Qd8ZbiDdilk4Nk/MiJy1NYJsmtT0Rv3pR0oB6KCZOzed
         p2lZlKHNEyq4g0tjN13ieCPybQOVyzeK6rAmlZxn5kKuOCXUYYo0S4Z0PkYW/AkDfqwC
         KGjQ==
X-Forwarded-Encrypted: i=1; AJvYcCU8Lb9wI6KFSvAKuBIJrVVF5nfIINMjUf2s2v6Oi0cA5hGT5MGJPX+5oDqsGZfnC968rsk0pb8E1wRVKELs@vger.kernel.org
X-Gm-Message-State: AOJu0YwuQv2y9LHeJPqGbxt0Q2dn5L8HwfL0DbRrxFnw4Z8rwINvvLjg
	tqNK+l0I5ZK5Z9jCMIzGGmrtzdr2IroBIWl3dSStTQhoeFkAXMyLvumvsQzSkNqKKl3d3epaEN9
	AeHqdpW7XETONsW4E4fKG1sQCmZXalzjXpXX1asfEWpI6HvFW5WrssbBZHsVSZGeRVXMO
X-Gm-Gg: ATEYQzz/rzb5FUnme+faowcPiOQeKQKGSagRoLazI/ZAP0SZWKrkd2MNenCXtlgwoL6
	IZUKAI39zj6Otsxq6I79fSbRgziRg+uxS9lIeJpeL07f0R9BRo1AabFQFr0vzvzQR+IGjvQ/9x5
	l0OG8XPLj9fysw97TqlMXAJUquIbANT+hS5PUKa0UXyW1dSbv5J2kFy6g9ZKqPdT08hji3zU8Mo
	CTpRcbRx13sQZMOg1QrdtwrqNl5MSqnnEOKXuViFPbyi7Sll06lwn2VrKyT0NAdi4uB9FScCGuf
	E/1JlabMf5jqd3+0W1pH1N3m+vF4hxM5wRF3r9GuMf/ZA6aalKIA60F1rRN4gdC4EB1YLWY8fAV
	obu5HKRKfBl2X4UvCqFheEThEfwopMG/kNz63/2DuQN6JjA3Qt/5um48vRg==
X-Received: by 2002:a17:902:ecc7:b0:2ae:5163:c2aa with SMTP id d9443c01a7336-2b0826feed5mr59028915ad.20.1774101041721;
        Sat, 21 Mar 2026 06:50:41 -0700 (PDT)
X-Received: by 2002:a17:902:ecc7:b0:2ae:5163:c2aa with SMTP id d9443c01a7336-2b0826feed5mr59028695ad.20.1774101041170;
        Sat, 21 Mar 2026 06:50:41 -0700 (PDT)
Received: from hu-vdadhani-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b083516cb9sm54897555ad.2.2026.03.21.06.50.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Mar 2026 06:50:40 -0700 (PDT)
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
To: mkl@pengutronix.de, mani@kernel.org, thomas.kopp@microchip.com,
        mailhol@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        linusw@kernel.org, brgl@kernel.org, linux-can@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org
Cc: mukesh.savaliya@oss.qualcomm.com, anup.kulkarni@oss.qualcomm.com,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Subject: [PATCH v3 0/2] can: mcp251xfd: add XSTBYEN transceiver standby control
Date: Sat, 21 Mar 2026 19:20:29 +0530
Message-Id: <20260321135031.3107408-1-viken.dadhaniya@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: uQFLOq6tj5FTUGj2nuTi-QZ5_Qp06QKl
X-Authority-Analysis: v=2.4 cv=epXSD4pX c=1 sm=1 tr=0 ts=69bea232 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=3aoVsspQhmqNhTY_ZuUA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIxMDExNSBTYWx0ZWRfX5Z3c3vMDGsB3
 DxS5wUP/+QWzZuW1dbVVZRGv3Z4q8t3N/IYQKJYAjHr0QKcBh+efS4rJ/VcqutcCHUj7gDf/4cc
 CYXnAnhOWIoW0ZrtmTjouf61e3hDv9oVUiDmeuZnMAjfduPVQ2lKltLgPjOVYipVcp0PzVWtVF3
 iQCJJeWuw4VftPLQDPCrkKjR03dp9+Gk78Cn7KITwebcTOoces+u2gl9LIctwdOwhlhsJ+5vpPM
 VIw5Xni/wwTy3Q2dYg9duXVPcF+LiHrA6juvlvg40wFZwCp+ZTumM5i2q2fIaPhU80Md0uSid6P
 hMlqCh00eJcJpm/nxOJhQpP6O0gRjhoUWDhpYRm8M8pyb2f4MyTvJ/oyPeDrmNtKQaz3178Trqo
 K6CJXFc/K4KWnHoPMd8H1OO/kBdXBhz570TEdFogmsTQPQVphGskciCyQjMXw45VD/JwboJFj24
 GuBVKv0UAUc/bpu0HxA==
X-Proofpoint-GUID: uQFLOq6tj5FTUGj2nuTi-QZ5_Qp06QKl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-21_04,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603210115
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	TAGGED_FROM(0.00)[bounces-99009-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[viken.dadhaniya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A94A92E59BB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The MCP251xFD provides a dedicated transceiver standby control function
via the INT0/GPIO0/XSTBY pin, controlled by the XSTBYEN bit in IOCON.
When enabled, the hardware automatically drives the pin low while the
controller is active and high when it enters Sleep mode, allowing
automatic standby control of an external CAN transceiver without
software intervention.

This series adds driver support for the XSTBYEN-based transceiver
standby control feature.

Tested on QCS6490 RB3 Gen2 with a PCAN-USB FD adapter: the transceiver is
active in normal mode, CAN communication works correctly, and the pin is
automatically managed across sleep and wake transitions.
---
v2 -> v3:

- Dropped device Tree change from this series.
- Configure xstbyen pin before bringing the controller into normal mode.
- Add a check in mcp251xfd_gpio_request() to ensure that GPIO0 cannot be
  used when xstbyen is enabled.

v2 Link: https://lore.kernel.org/all/20260316131950.859748-1-viken.dadhaniya@oss.qualcomm.com/

v1 -> v2:

- Drop the gpio-hog approach as suggested by Dmitry.
- Enable hardware‑managed transceiver standby control via the appropriate
  Device Tree property.

v1 Link: https://lore.kernel.org/all/20260108125200.2803112-1-viken.dadhaniya@oss.qualcomm.com/
---
Viken Dadhaniya (2):
  dt-bindings: can: mcp251xfd: add microchip,xstbyen property
  can: mcp251xfd: add support for XSTBYEN transceiver standby control

 .../bindings/net/can/microchip,mcp251xfd.yaml |  8 ++++
 .../net/can/spi/mcp251xfd/mcp251xfd-core.c    | 37 +++++++++++++++++++
 drivers/net/can/spi/mcp251xfd/mcp251xfd.h     |  1 +
 3 files changed, 46 insertions(+)

-- 
2.34.1


