Return-Path: <linux-arm-msm+bounces-116089-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xcmhK62rRmpYbQsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116089-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 20:19:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9691A6FBEDF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 20:19:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=mZweog86;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=LpXqr4S9;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116089-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116089-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1375230B68B6
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 17:23:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01ACE3612F1;
	Thu,  2 Jul 2026 17:23:16 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 682603603EF
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2026 17:23:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783012995; cv=none; b=q3+CsZealA1WTy/fF4u2w5ZWRyp21a7KAhIqNBsveSSrleoCZCZGao2WkGdZPqSc5J2mK57UaYotRtUKbbQQ5RHhY847BJ60pNoE8lnWGgat6Ij3UYdcdOte+5sibfNP+eG050o5lqlGeSeQ4VjZZgGT//FEcvjpnmLFx7tq/bQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783012995; c=relaxed/simple;
	bh=SQVELIkS6Yw3HpdkUdHKEkrxPxte6hDRaNWPxNHtyYs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=V78ccbeBcVjoc87jAqORwpfLS3OQ6kQB6TbwYZGdRgV4U1rd1dqyltAhXGJtgd1YQ7knlX5PATq4iArPmFfbszvY/nGeob90kYzXWEIOnLYw4KtO4DxfCCsMCKDFkjI/RZXE7aNL7Bnks29GGicOuGkwMFcrJPFonNIhUmxOc/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mZweog86; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LpXqr4S9; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 662FUeFi866100
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Jul 2026 17:23:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=QYGE1+3lnFBhSDxCjuj8Jz
	Eg+wB7iM4pgaTuFcIUXHo=; b=mZweog86Hk5bnj+K6WHhKGjju5PousPJQZreQu
	1WOaaKiR27HFpXBA/qA27o5OBdg34shk/dxsvWYf+8dU6GrStEJKyrcf/VSlRjaI
	yBi9kxI0b67dWKL5sM+3xPp2g6JZHXjmQaf3xWEmXzNmv4v1t6wfRI/+v74oBWIE
	jfLJPdeYoqCp0NAhw0FH+w7JeXxcuxj80wMQFplIuxfoX0uE5bTLNPkf1WrJWzVm
	9kvKLbFadycssuGi5BaXJVEJgqDx5s2HuO5mC8zpK84UUMtg6oXmja/zlga17PWM
	glqw4U9aZ2XRIbpWmdHyfcXeky4UTSlCLtvwL3Q97Xw+3Ncw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5tpnggk7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 17:23:10 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c9d5a5b63c5so2556127a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 10:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783012989; x=1783617789; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QYGE1+3lnFBhSDxCjuj8JzEg+wB7iM4pgaTuFcIUXHo=;
        b=LpXqr4S9OWWfM+IiXS1m5wVRll0oDiTTtrV/u5msN5na8JC56fpvXmnt4qEjgna2sg
         y1ocud4YAGqk/ZUNy0eaiMIcgAm/dFh5Vpd7Y+eY2yOidVmWt4E23PgavIgzi8apDveD
         9LbkD9eMqW+zpvm0qSYLy+DndtNmIAKLzEGpSYx3nASQiqgrXq+ty5IJNUQ6qRGCBh/b
         vuqDuF/oEFgGu2lHzcKZ2/E1BUSehHwNUYo7CUKDDgL4QuTp3SAL2ZF9XdSUTXww536r
         IRXsk5Q5LhJRYRCV+QBxKSXJYWbQSXbuYZpQ3qwHK7bIgqHmvStw60xakKrlsOyamic2
         nsQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783012989; x=1783617789;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QYGE1+3lnFBhSDxCjuj8JzEg+wB7iM4pgaTuFcIUXHo=;
        b=EMybflsaAIJzzvuy6Ahr9YSlPHb2djsLKI1UcWBauV0lXgrRayTD34DUQFDHWPHi64
         l9XEnZRDQfRlmyFeo/+Kr4MkoOckkmVj006agRmH/6mkxHR3AXVe38Og/BUw3z5geHcp
         K0Nc6NC9q6sUk0r2x9nGKlFRZxKMEu2grpZnnrciPMhiMO8OaYf3dexcwp955OjGFdSr
         HxIPaItMrp3YimGoem61wngsLfDm26JC6X6D4p3GluwH8us/cPJbafkXpoWSFw8ULyKd
         9KpjZomV6edsjCKdcJRYPx7reprwmjwSQnNuFMNxk72SxDQvEevlRfNOyBIBqnnLgkPe
         23oQ==
X-Forwarded-Encrypted: i=1; AFNElJ/chISpiCTojP3b8njC/yOGM1u3usu5YWaUw5TYEE6UksLKwJijYSgGZ4mqX8FxW91U+zYMp8M0MGPYSufp@vger.kernel.org
X-Gm-Message-State: AOJu0YwiGkg6c7NQcZtfEGMH/RXe7yl243WtmZZS6ZyY8mt2gYZic7MP
	dHBizHvlvxyOH1fi9J6IiEOw/+BX0sx5+xGOS9FPlLDQAtBVPEEwclDKxxs7+4upZ+6Su9t06N5
	Jk48TJonyDf0jusy7u33yG4wmf6cwAKJW/+EVc50TU5I9RCjdM5UeKyZpRKqtCd9Xhb6u
X-Gm-Gg: AfdE7clEMIptY5tIgk3Ja0YWVAYmpYkPaO+a1lSaW4LGz1ing5muIYqDLyFFInNBsU/
	nyKjCJfqw7LmpSnltNlpZFES90/Y7bsXELDbBCWaahCukjGvaWoTmmtsrRe6qsftv7dfntDSAsN
	rSlVA5fd9eWjvzIp91sQsD3DqasOPGXWTg9ouUNvufyAwqUXS16liQCpn5oTkKJ8DvSVBT4O9GC
	Bln5U2xwrKlP+BeKkXVV36InmmGJxcLSHAsvaC2biyfbi4/X9qXraP+SW/OKmHsdZm+S+flPIN7
	qkpr1Ac2pA/OMa6H4uVp7lPThaX7pqksq7H8HTDkfkuj+tEi2lSCyx2FJ8e9sBO+R7Bkq+ZX5ox
	MZUSTgbKvHnf9Bi4dB8sQ9r6Q+am7RrwSwiOrsTjg22IPxg==
X-Received: by 2002:a05:6a21:4688:b0:3b4:7eb0:47a1 with SMTP id adf61e73a8af0-3bfed2721b3mr9157703637.19.1783012989478;
        Thu, 02 Jul 2026 10:23:09 -0700 (PDT)
X-Received: by 2002:a05:6a21:4688:b0:3b4:7eb0:47a1 with SMTP id adf61e73a8af0-3bfed2721b3mr9157650637.19.1783012988774;
        Thu, 02 Jul 2026 10:23:08 -0700 (PDT)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3ececfe4sm10564289c88.8.2026.07.02.10.23.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 10:23:08 -0700 (PDT)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Subject: [PATCH v3 0/4] Add Qualcomm SPEL powercap driver
Date: Thu, 02 Jul 2026 22:52:53 +0530
Message-Id: <20260702-qcom_spel_driver_upstream-v3-0-434d50f0c5b0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAG2eRmoC/33OTQqDMBAF4KtI1o3kp2rsqvcoRawZa0CNJhpax
 Lt3tItuipuBN/C+mYV4cAY8uUQLcRCMN7bHIE8RqZqyfwI1GjMRTKQsY4KOle0KP0BbaGcCuGI
 e/OSg7GjOci2zSmkFimB/cFCb127f7pgb4yfr3vupwLftV014fqAGThnNEpmkmj+yOj9frffxO
 JctVroYB9nwIH5gKtgRKBAsJUCq8Fuu6j/guq4ffvyX8RoBAAA=
X-Change-ID: 20260702-qcom_spel_driver_upstream-909d37c8d8e8
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783012984; l=3809;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=SQVELIkS6Yw3HpdkUdHKEkrxPxte6hDRaNWPxNHtyYs=;
 b=PIjNMLYQ7O2dYZ56VLmjm9CtsrsqOXdg82ZMGQVPKWDEgjirbY9X/L69V1Px2Ssao2hxENwhx
 acrfzqMv9gqAS17eoyUjTF+RHPsUFummveZBRGc7Mos9hv4sqmYWGbo
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Proofpoint-GUID: D74RUwvG0D2kprzfbwUHexJ1PBdUvlvZ
X-Proofpoint-ORIG-GUID: D74RUwvG0D2kprzfbwUHexJ1PBdUvlvZ
X-Authority-Analysis: v=2.4 cv=UMft2ify c=1 sm=1 tr=0 ts=6a469e7e cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=1rr6DjYnXoqnmp2ReCQA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDE4MyBTYWx0ZWRfXwwKDSx7drq6L
 CaoNiWFSO34t6+n4cdfdbOkxMxIhWq7u+rDAj4lIQi8iZZ1KxojnvvLJ/YTqSCdvt+zfsOI96ow
 h8uArG86OP9/CnyFASo5JWBq9DBX1kY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDE4MyBTYWx0ZWRfX4/homV6hzAaG
 /DkLQR4etYrZbnOOrHSVbCZLxB6HqHhCT8cKc73Yvj2mVABZBMIiJ2eq9J+2tsZTRgx5HsDFhHU
 ZiGZd3uZkyHTi7+vwiy4mWEa9Kx9bKGcoJBh4b7dkhZmGl0lsJXHYA0zspudy5nVizIvpBzpeqM
 Q+obhMohcAn3MOfKx8y9JOa72sgUzIDZFYWWgR6tLznwlJQdcSSEjknk/lOT5kkk6XMb/JvAYYY
 T51wIJPcSee/wMh6HXNsIOF80fwSn5bwyQ/K9M46R79w6dVYHP+mKsZyxAq5o+JC1OCt3Ox1Tje
 KcWKhzWZZmc1C6s69zssw3OcgbAgcRYFucKdik/zmJd8l58rtQ7+B82/usKKY8/9lKXCn9sj8AW
 XhBybWO1knayYUk2hFzOGlKlql1O3s0Fcdps6BZWGRCPEZyO3A0VFKN/TBC//SwP1cS/lMqtyTJ
 WI033ZS09vx1L0B8/vw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 spamscore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607020183
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116089-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:rafael@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:daniel.lezcano@oss.qualcomm.com,m:gaurav.kohli@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:manaf.pallikunhi@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[manaf.pallikunhi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[manaf.pallikunhi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9691A6FBEDF

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

This series introduces a new power/limits directory for power limit
controller bindings. The power-limit-controller.yaml schema is added to
MAINTAINERS under "QUALCOMM SPEL POWERCAP DRIVER" in patch 2/X alongside
the SPEL device specific binding, as this is its primary use case.

Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
---
Changes in v3:
- Created common power-limit-controller schema under power/limits and described
  power-limit-controller device common capabilities.(Krzysztof)
- Created SoC-specific qcom,glymur-spel.yaml file instead of generic one and updated
  description and commit.(Krzysztof)
- Used FIELD_MODIFY() macro at different places.(Konrad)
- Updated glymur specific domain info table.(Konrad)
- Updated all for-loops iterator declaration to C99 style.(Konrad)
- Fixed use-after-free bugs.(Sashiko)
- Corrected time_unit documention to reflect the logic.(Sashiko)
- Link to v2: https://lore.kernel.org/r/20260620-qcom_spel_driver_upstream-v2-0-a3ee6837c18f@oss.qualcomm.com

Changes in v2:
- Fixed DT issues: corrected unit-address mismatch and made compatible
  platform-specific.(Konrad/Krzysztof)
- Cleaned up bitfield handling: switched to GENMASK, FIELD_* macros.(Konrad)
- Converted hex values to lowercase and simplified array definitions.(Konrad)
- used devm_platform_ioremap_resource_byname().(Konrad)
- Refactored data structures: merged domain data into spel_domain_info
  and removed hardcoded limits using ARRAY_SIZE().(Daniel)
- Added bounds checks (TIME_WINDOW_MAX) and fixed time window RMW
  handling (preserving reserved bits + firmware notify).(Sashiko)
- Resolved use-after-free, replaced allocation strategy, and
  added proper cleanup in .release().(Sashiko)
- Updated time window calculation logic.
- Removed cyclic dependency, improved validation logic, and aligned
  naming consistency.(Daniel)
- Link to v1: https://lore.kernel.org/r/20260519-qcom_spel_driver_upstream-v1-0-75356d1b7f94@oss.qualcomm.com

---
Manaf Meethalavalappu Pallikunhi (4):
      dt-bindings: power: Add common power limit controller schema
      dt-bindings: power: limits: Describe Qualcomm SPEL hardware
      powercap: qcom: Add SPEL powercap driver
      arm64: dts: qcom: glymur: Enable SPEL powercap driver

 .../power/limits/power-limit-controller.yaml       |  34 +
 .../bindings/power/limits/qcom,glymur-spel.yaml    |  61 ++
 MAINTAINERS                                        |   8 +
 arch/arm64/boot/dts/qcom/glymur.dtsi               |  10 +
 drivers/powercap/Kconfig                           |  13 +
 drivers/powercap/Makefile                          |   1 +
 drivers/powercap/qcom_spel.c                       | 803 +++++++++++++++++++++
 7 files changed, 930 insertions(+)
---
base-commit: 4f441960e691d37c880d2cc004de06bb5b6bd5e4
change-id: 20260702-qcom_spel_driver_upstream-909d37c8d8e8

Best regards,
-- 
Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>


