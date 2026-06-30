Return-Path: <linux-arm-msm+bounces-115256-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3MeDBjc3Q2rwVAoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115256-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 05:25:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 94DD36E00C1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 05:25:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=gJKb2vQ4;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=fg8m3Irb;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115256-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115256-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E9627300A4AA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 03:25:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 186032F7EF9;
	Tue, 30 Jun 2026 03:25:41 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B5B036AB4D
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 03:25:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782789941; cv=none; b=u1FHqo8xxhTmpb1BclzO7eH1DVImNXPGCUXFASTz3+/r6Luq2bsyMUh/Wx4YI62+ji554jxAHmh2GnM2iY5nulDYW0yk2zEO5JwqRoUtsQmzD0rDPfuofU1HrFi3i0BvM9cfy6uNC+zWGsIJ+fyP5C6yii06xjmuTlYp4d17v5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782789941; c=relaxed/simple;
	bh=KEto8abrbHUWADx3QSqe85k3RGP7klGE2TliF1qOblY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=i0RpVSi/2H3iGK/uw+UoCbOJ+5rx/EmC5VID8zIPm4IlgBVmpzf3IQLA8l+VoQKKzVfHv984wPUyBMnETuQhZyxn9UDnn8kr9/du3Eh7cySz497Lq3Rn6GJmMJeN2aeIi8sm5pMU161u4ONlJPYBakPnZONT+P0YOgK4u7Ztpsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gJKb2vQ4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fg8m3Irb; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U1IiHD439747
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 03:25:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=N1ybCHgngEG78ue7E2l4Di
	+WJxj0EHYYtZneBRAM3V0=; b=gJKb2vQ4J5VgbgtxlmhMSHXdRTJUDuqWa3lM8G
	5+3UHgn6dMECEGStEIZ6vtczcEZ/VzDjxjE6Vx2SuQlv4XGqtZUdsdEMLIrcsm9v
	8wdiGS2S4TdGTgePlPjSkYzeQwfcZ4vY2k4AFpLk+v6zlIDFAXJ3E5X6qdPgrmdD
	KcJ2+y3cdSDUNFuJ0vjZAuUk+fD0szpQjGv13QV3PyerydUqRbaPglA8pV+wdmaE
	FUeo6b25WCJspIEx4p9tJuXzMey4gsq4sRKt3mR0+K/2c12ibpSljwnW12d7tal1
	s53SvR/1nCv/haiY0yihgnCIA2GNtBNmdQ0fTIsz6/ceugXg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3n5s49bc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 03:25:38 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30ca81e05bfso4092508eec.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 20:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782789938; x=1783394738; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=N1ybCHgngEG78ue7E2l4Di+WJxj0EHYYtZneBRAM3V0=;
        b=fg8m3IrbEqIgei/xM7H3bbwU/SrrHVoKq5+ETdWW4p21vAwzPnsxdXkRhPLPiFYVOo
         dVFWa6zSLH6o3QIqH3V7cbizx33GnPh5rT4sKv1mXx1Az/Ztwq60CScpi0hbBbu0EBUD
         WT40E5rOV5pxaA/dEpsyAZ6SNOXqRiSSoCpo74TIQJ6TlKo1WapH1hgmSfz8FsYQwPZW
         E5vQz1Mh8U2pFp9DMMtwC7FdbSu+DVfnlMy3dCT5se2mn6kBzw1OJ+bb4Vdw0OhbJE3Z
         Irm2ts9wnYI7tR505/p5jF2AJAGSkyVMKEIf5+7rdVKJE/RQDSr/DKrFF2atmZxaXoH7
         WOUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782789938; x=1783394738;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N1ybCHgngEG78ue7E2l4Di+WJxj0EHYYtZneBRAM3V0=;
        b=DYx9QJYVF7BK5wzg4AnnvbNtuYynA/S4n+Bk0LEBL46gRXPvP5nUQ6Tpj0FKDeW21F
         dlo0TnrNTzcC/IZ4InraqMsZoehtL0HyhlDimbRsYSHzqhMW8naJLC+O0XCzE6XIqHt+
         VxPLVWP4Fna4zXV+I9KE732ayNG3PuXhGpGRJfnD6k98gED8IwlNCWtxkWMv3MlzGRy5
         hjADsBS2TRPaBBkysUDWXwjZ7Oq0WKMCNzTMzfTg9wFNzT77o8q8tszsiax1kZZ+Y8CD
         kZtvSddNp03AFci/RaX9CN9QVhbIVjT8MXfgq3KuY0WYKpbmwB/wZ16XpvOQSV5XNRwe
         JyBg==
X-Gm-Message-State: AOJu0YzKbj3UUfbPaOSSvHHuuR6Ar6p2/IcmkK7/fihFBNltl2R5idkY
	qEtOzoIdiDPDjbRn+Kdm1iHrUcKiwNLA4WPz6XuZlzemny9jRN9ImSQk4+VPzbv+pR4qOIhVD9m
	LB7p4qnyXP/4tluoJ405dBIqo5cUhuqhJEgvVcdKVp0FWcKh3f8VnF+c9QIH5kFvghW/+TN1Vda
	ZL/WU=
X-Gm-Gg: AfdE7cnhq6CWKIzymyh6Us9Vjule/pL/DnjsOpVLspFof4cQ2wYZ5VnYkxBmmhkllQe
	ErC5Y36HA6PXLqqvsxWYjaxeCxLyMLmFv+E0xdF7wFzOrRGlb3naA4P1gR3Gp0IXNDqHugUTynX
	7IN9DQT+/wxQ3xQtwp8THOK0Y/5MOon7+LQAyfpDiV7r24ZqDnwIMZUIeBZ9ny0XsvJR/ca4XKb
	8FoU+ZaTFWmLHtTRYKCZCMv7p4CdvCIHKxTsuL4Om+276JKTP2KGjmhToMry18xRoYQixYYESpT
	8uJlO8xY2eqJsxxzjkcgGvzhAqOmnDQqPIcgBaeo7QaHELSycHyIRSe5tiP37Z/lQxOHS7PoC6c
	HraASjQ5B89zSlCW/X6V5Cwukl7WNX4MwERNGTwvhz6V66Eh+Ej61+xNcQ+9li3s=
X-Received: by 2002:a05:7300:8b2c:b0:30c:536e:3a87 with SMTP id 5a478bee46e88-30ee12c01bemr1305741eec.3.1782789937443;
        Mon, 29 Jun 2026 20:25:37 -0700 (PDT)
X-Received: by 2002:a05:7300:8b2c:b0:30c:536e:3a87 with SMTP id 5a478bee46e88-30ee12c01bemr1305707eec.3.1782789936821;
        Mon, 29 Jun 2026 20:25:36 -0700 (PDT)
Received: from hu-fenglinw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ee32519aesm2699183eec.27.2026.06.29.20.25.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 20:25:36 -0700 (PDT)
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 20:25:34 -0700
Subject: [PATCH v4] leds: rgb: leds-qcom-lpg: Fix LED color balancing in HW
 pattern mode
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-lpg-rgb-color-balance-fix-v4-1-4db8592fb3c5@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAC03Q2oC/43NQQ7CIBAF0KsY1o4BhlJx5T2MC6C0YmqpoI2m6
 d2lunGhxs0kfzLz/kiSi94lslmMJLrBJx+6HMRyQexBd40DX+VMOOWSSlpA2zcQGwM2tCGC0a3
 urIPa32DNBUoplDY1kvzfR5fXT3u3f+V0NUdnLzM4Xxx8uoR4f5YPbL77p2dgwAA5ohRCI66Lb
 Uhpdb7q1obTaZUHmesG/gZy8QvkGbSUGeoKanUtv4D4DqpfIGaQlaWSmsqqVOoDOE3TA3hpl0h
 9AQAA
X-Change-ID: 20260605-lpg-rgb-color-balance-fix-82436649abf3
To: linux-arm-msm@vger.kernel.org, Lee Jones <lee@kernel.org>,
        Pavel Machek <pavel@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Anjelique Melendez <quic_amelende@quicinc.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>
Cc: David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>, kernel@oss.qualcomm.com,
        Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
        Fenglin Wu <fenglin.wu@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-17187
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782789935; l=10460;
 i=fenglin.wu@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=KEto8abrbHUWADx3QSqe85k3RGP7klGE2TliF1qOblY=;
 b=sBCRy9eQLJZ2MMiMhzTpJrtVMASWI9ntwIqeXnX5KeLkoqfVmWdjUlVIW/O2/0/8dl8qddiVL
 tQs6lmnXy9fCfAFvjEyo1s7/lUJgkvak1CwXT72PVR7fYQH2jEqwk7Z
X-Developer-Key: i=fenglin.wu@oss.qualcomm.com; a=ed25519;
 pk=hJdt3E7o54lql+miD2GaxwF74cDyhgNwMbmFOZ46bRU=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDAyOSBTYWx0ZWRfX7R6J6CO1qeKw
 8DizhrSnNJ1CKzROEL6XWRtzTDc1aODBqiENmJzWNSXzRdz1rHUyYRQE3b0MH4zpm9xaultQqYs
 I56QpwEkDJtE9h9Xr4ypQTNoAuGHubg=
X-Proofpoint-ORIG-GUID: CY09qY9Bo4i9ghJ_ctYefZx6WBVT3T2Z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDAyOSBTYWx0ZWRfX0ujHJoAdph5J
 7h42SuFSQhfCM/Onq3eOdXdoWvMCEO5KlFAN4gjUCiCoy9Ovf1mVXOc26CyYdItBbvIKzJx0PYn
 Qr8JY3ganeS8/eN8TRRxuWcX0JYyss86hsvGHZcEu7s7jHx3HJZdg6Fv8uSoCTNP/H96SIroXNz
 L4Qj4GNcxf3MSdk4CBOG1WGyjIT9HruqejEys4p6HJej7JX/BN6IkJHciHJ88ntCMK+Hzm2794Y
 ppQwtaKHcyUozxquulXi5SzSpCRa8/OiGfqMK9A8ljKag1fB9b6BuaSb5/LAqi2ttylsHJx/fFD
 f47z3IrYbWR11eSaJXnt3JrnZYycMJ6yROYrNitb7GuU1OrJVINZv2MTuPNTbg2yaPMsWcAFnsr
 0pakQFIKK1AkEHCc/Beht8R3rO/CncOagmWTyjBQpAd3s5M7rBGM41yTgVWD+IcZ9Pp0iwkMDU6
 x9HhoK9qjjmHc4RMVuQ==
X-Authority-Analysis: v=2.4 cv=NZzWEWD4 c=1 sm=1 tr=0 ts=6a433732 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=63AshnvTA_EL1TQD_80A:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: CY09qY9Bo4i9ghJ_ctYefZx6WBVT3T2Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 adultscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606300029
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-115256-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[vger.kernel.org,kernel.org,somainline.org,quicinc.com,gurudas.dev,gmail.com,google.com];
	FORGED_RECIPIENTS(0.00)[m:linux-arm-msm@vger.kernel.org,m:lee@kernel.org,m:pavel@kernel.org,m:andersson@kernel.org,m:marijn.suijten@somainline.org,m:quic_amelende@quicinc.com,m:linux@gurudas.dev,m:nathan@kernel.org,m:nick.desaulniers+lkml@gmail.com,m:morbo@google.com,m:justinstitt@google.com,m:david.collins@oss.qualcomm.com,m:subbaraman.narayanamurthy@oss.qualcomm.com,m:kamal.wadhwa@oss.qualcomm.com,m:kernel@oss.qualcomm.com,m:pavel@ucw.cz,m:linux-leds@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:llvm@lists.linux.dev,m:fenglin.wu@oss.qualcomm.com,m:nickdesaulniers@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[fenglin.wu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,msgid.link:url,pattern.data:url,qualcomm.com:dkim,qualcomm.com:email];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fenglin.wu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,lkml];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 94DD36E00C1

Currently, when the LED is configured as a RGB LED or a multi-color
LED device, the same pattern is programmed for all LED channels
regardless of the sub-led intensities when triggered by HW pattern.
It results that the LED device is always working in a white-balanced
mode regardless of the intensity settings.

To fix this, scale the pattern data according to the sub-led intensity
and program the HW pattern separately for each LPG channel.

Fixes: 24e2d05d1b68 ("leds: Add driver for Qualcomm LPG")
Fixes: 6ab1f766a80a ("leds: rgb: leds-qcom-lpg: Add support for PPG through single SDAM")
Fixes: 5e9ff626861a ("leds: rgb: leds-qcom-lpg: Include support for PPG with dedicated LUT SDAM")
Assisted-by: Claude:claude-4-6-sonnet
Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
---
Changes in v4:
- Fixing LLVM compilation issue: avoid jumping over guard(mutex) initialization
- Link to v3: https://patch.msgid.link/20260629-lpg-rgb-color-balance-fix-v3-1-17796a06d799@oss.qualcomm.com

Changes in v3:
- update to use __free() and guard(mutex) for easy cleanup
- Link to v2: https://patch.msgid.link/20260624-lpg-rgb-color-balance-fix-v2-1-c01b0e50caf6@oss.qualcomm.com

Changes in v2:
- Change to use tab for the indention in the comments of 'struct lpg_pattern'
- Remove the comment in lpg_prepare_pattern() as the function name is
  self-explantory.
- Link to v1: https://patch.msgid.link/20260605-lpg-rgb-color-balance-fix-v1-1-3233644a3385@oss.qualcomm.com
---
 drivers/leds/rgb/leds-qcom-lpg.c | 173 ++++++++++++++++++++++++++++++---------
 1 file changed, 133 insertions(+), 40 deletions(-)

diff --git a/drivers/leds/rgb/leds-qcom-lpg.c b/drivers/leds/rgb/leds-qcom-lpg.c
index d7d6518de30f..e407742ec3b3 100644
--- a/drivers/leds/rgb/leds-qcom-lpg.c
+++ b/drivers/leds/rgb/leds-qcom-lpg.c
@@ -148,6 +148,24 @@ struct lpg_channel {
 	unsigned int pattern_hi_idx;
 };
 
+/**
+ * struct lpg_pattern - The LPG pattern normalized from the LED pattern
+ * @data:	The pattern data array (caller must kfree)
+ * @len:	number of entries to write to the LUT
+ * @delta_t:	common step duration in ms
+ * @lo_pause:	low-pause duration in ms
+ * @hi_pause:	high-pause duration in ms
+ * @ping_pong:	true if the pattern support reverse
+ */
+struct lpg_pattern {
+	struct led_pattern *data;
+	unsigned int len;
+	unsigned int delta_t;
+	unsigned int lo_pause;
+	unsigned int hi_pause;
+	bool ping_pong;
+};
+
 /**
  * struct lpg_led - logical LED object
  * @lpg:		lpg context reference
@@ -959,23 +977,15 @@ static int lpg_blink_mc_set(struct led_classdev *cdev,
 	return ret;
 }
 
-static int lpg_pattern_set(struct lpg_led *led, struct led_pattern *led_pattern,
-			   u32 len, int repeat)
+static int lpg_prepare_pattern(struct lpg *lpg, struct led_pattern *led_pattern,
+				u32 len, int repeat, struct lpg_pattern *prep)
 {
-	struct lpg_channel *chan;
-	struct lpg *lpg = led->lpg;
-	struct led_pattern *pattern;
 	unsigned int brightness_a;
 	unsigned int brightness_b;
-	unsigned int hi_pause = 0;
-	unsigned int lo_pause = 0;
 	unsigned int actual_len;
 	unsigned int delta_t;
-	unsigned int lo_idx;
-	unsigned int hi_idx;
 	unsigned int i;
 	bool ping_pong = true;
-	int ret = -EINVAL;
 
 	/* Hardware only support oneshot or indefinite loops */
 	if (repeat != -1 && repeat != 1)
@@ -995,15 +1005,16 @@ static int lpg_pattern_set(struct lpg_led *led, struct led_pattern *led_pattern,
 	if (len % 2)
 		return -EINVAL;
 
-	pattern = kzalloc_objs(*pattern, len / 2);
+	struct led_pattern *pattern __free(kfree) = kzalloc_objs(*pattern, len / 2);
+
 	if (!pattern)
 		return -ENOMEM;
 
 	for (i = 0; i < len; i += 2) {
 		if (led_pattern[i].brightness != led_pattern[i + 1].brightness)
-			goto out_free_pattern;
+			return -EINVAL;
 		if (led_pattern[i + 1].delta_t != 0)
-			goto out_free_pattern;
+			return -EINVAL;
 
 		pattern[i / 2].brightness = led_pattern[i].brightness;
 		pattern[i / 2].delta_t = led_pattern[i].delta_t;
@@ -1016,7 +1027,7 @@ static int lpg_pattern_set(struct lpg_led *led, struct led_pattern *led_pattern,
 	 * through the entire LUT, so prohibit this.
 	 */
 	if (len < 2)
-		goto out_free_pattern;
+		return -EINVAL;
 
 	/*
 	 * The LPG plays patterns with at a fixed pace, a "low pause" can be
@@ -1073,13 +1084,13 @@ static int lpg_pattern_set(struct lpg_led *led, struct led_pattern *led_pattern,
 			 * specify hi pause. Reject other variations.
 			 */
 			if (i != actual_len - 1)
-				goto out_free_pattern;
+				return -EINVAL;
 		}
 	}
 
 	/* LPG_RAMP_DURATION_REG is a 9bit */
 	if (delta_t >= BIT(9))
-		goto out_free_pattern;
+		return -EINVAL;
 
 	/*
 	 * Find "low pause" and "high pause" in the pattern in the LUT case.
@@ -1087,43 +1098,64 @@ static int lpg_pattern_set(struct lpg_led *led, struct led_pattern *led_pattern,
 	 * duration of all steps.
 	 */
 	if (lpg->lut_base || lpg->lut_sdam) {
-		lo_pause = pattern[0].delta_t;
-		hi_pause = pattern[actual_len - 1].delta_t;
+		prep->lo_pause = pattern[0].delta_t;
+		prep->hi_pause = pattern[actual_len - 1].delta_t;
 	} else {
 		if (delta_t != pattern[0].delta_t || delta_t != pattern[actual_len - 1].delta_t)
-			goto out_free_pattern;
+			return -EINVAL;
+		prep->lo_pause = 0;
+		prep->hi_pause = 0;
 	}
 
+	prep->data = pattern;
+	prep->len = actual_len;
+	prep->delta_t = delta_t;
+	prep->ping_pong = ping_pong;
 
-	mutex_lock(&lpg->lock);
+	return 0;
+}
+
+static int lpg_pattern_set(struct lpg_led *led, struct led_pattern *led_pattern,
+			   u32 len, int repeat)
+{
+	struct lpg_channel *chan;
+	struct lpg *lpg = led->lpg;
+	struct lpg_pattern pattern;
+	unsigned int lo_idx;
+	unsigned int hi_idx;
+	unsigned int i;
+	int ret;
+
+	ret = lpg_prepare_pattern(lpg, led_pattern, len, repeat, &pattern);
+	if (ret < 0)
+		return ret;
+
+	guard(mutex)(&lpg->lock);
 
 	if (lpg->lut_base)
-		ret = lpg_lut_store(lpg, pattern, actual_len, &lo_idx, &hi_idx);
+		ret = lpg_lut_store(lpg, pattern.data, pattern.len, &lo_idx, &hi_idx);
 	else
-		ret = lpg_lut_store_sdam(lpg, pattern, actual_len, &lo_idx, &hi_idx);
+		ret = lpg_lut_store_sdam(lpg, pattern.data, pattern.len, &lo_idx, &hi_idx);
 
 	if (ret < 0)
-		goto out_unlock;
+		goto free_pattern;
 
 	for (i = 0; i < led->num_channels; i++) {
 		chan = led->channels[i];
 
-		chan->ramp_tick_ms = delta_t;
-		chan->ramp_ping_pong = ping_pong;
+		chan->ramp_tick_ms = pattern.delta_t;
+		chan->ramp_ping_pong = pattern.ping_pong;
 		chan->ramp_oneshot = repeat != -1;
 
-		chan->ramp_lo_pause_ms = lo_pause;
-		chan->ramp_hi_pause_ms = hi_pause;
+		chan->ramp_lo_pause_ms = pattern.lo_pause;
+		chan->ramp_hi_pause_ms = pattern.hi_pause;
 
 		chan->pattern_lo_idx = lo_idx;
 		chan->pattern_hi_idx = hi_idx;
 	}
 
-out_unlock:
-	mutex_unlock(&lpg->lock);
-out_free_pattern:
-	kfree(pattern);
-
+free_pattern:
+	kfree(pattern.data);
 	return ret;
 }
 
@@ -1144,23 +1176,86 @@ static int lpg_pattern_single_set(struct led_classdev *cdev,
 }
 
 static int lpg_pattern_mc_set(struct led_classdev *cdev,
-			      struct led_pattern *pattern, u32 len,
+			      struct led_pattern *led_pattern, u32 len,
 			      int repeat)
 {
 	struct led_classdev_mc *mc = lcdev_to_mccdev(cdev);
 	struct lpg_led *led = container_of(mc, struct lpg_led, mcdev);
+	struct lpg *lpg = led->lpg;
+	struct lpg_channel *chan;
+	struct lpg_pattern pattern;
 	unsigned int triled_mask = 0;
-	int ret, i;
+	unsigned int lo_idx;
+	unsigned int hi_idx;
+	unsigned int scale;
+	unsigned int i, j;
+	int ret;
+
+	ret = lpg_prepare_pattern(lpg, led_pattern, len, repeat, &pattern);
+	if (ret < 0)
+		return ret;
+
+	/* Allocate buffer for the per-channel scaled pattern copy */
+	struct led_pattern *scaled __free(kfree) =
+			   kmalloc_array(pattern.len, sizeof(*scaled), GFP_KERNEL);
+	if (!scaled) {
+		kfree(pattern.data);
+		return -ENOMEM;
+	}
 
 	for (i = 0; i < led->num_channels; i++)
 		triled_mask |= led->channels[i]->triled_mask;
-	triled_set(led->lpg, triled_mask, 0);
+	triled_set(lpg, triled_mask, 0);
 
-	ret = lpg_pattern_set(led, pattern, len, repeat);
+	led_mc_calc_color_components(mc, LED_FULL);
+
+	/*
+	 * Each channel gets its own LUT block scaled by subled_info[i].brightness
+	 * so the pattern respects the configured colour balance.
+	 */
+	guard(mutex)(&lpg->lock);
+
+	for (i = 0; i < led->num_channels; i++) {
+		chan = led->channels[i];
+		scale = mc->subled_info[i].brightness;
+
+		for (j = 0; j < pattern.len; j++) {
+			scaled[j].brightness = DIV_ROUND_CLOSEST(
+				(u32)pattern.data[j].brightness * scale, LED_FULL);
+			scaled[j].delta_t = pattern.data[j].delta_t;
+		}
+
+		if (lpg->lut_base)
+			ret = lpg_lut_store(lpg, scaled, pattern.len, &lo_idx, &hi_idx);
+		else
+			ret = lpg_lut_store_sdam(lpg, scaled, pattern.len, &lo_idx, &hi_idx);
+
+		if (ret < 0) {
+			/* Free LUT slots already allocated for previous channels */
+			while (i-- > 0) {
+				chan = led->channels[i];
+				lpg_lut_free(lpg, chan->pattern_lo_idx, chan->pattern_hi_idx);
+				chan->pattern_lo_idx = 0;
+				chan->pattern_hi_idx = 0;
+			}
+
+			goto free_pattern;
+		}
+
+		chan->ramp_tick_ms = pattern.delta_t;
+		chan->ramp_ping_pong = pattern.ping_pong;
+		chan->ramp_oneshot = repeat != -1;
+		chan->ramp_lo_pause_ms = pattern.lo_pause;
+		chan->ramp_hi_pause_ms = pattern.hi_pause;
+		chan->pattern_lo_idx = lo_idx;
+		chan->pattern_hi_idx = hi_idx;
+	}
+
+free_pattern:
+	kfree(pattern.data);
 	if (ret < 0)
 		return ret;
 
-	led_mc_calc_color_components(mc, LED_FULL);
 	lpg_brightness_set(led, cdev, mc->subled_info);
 
 	return 0;
@@ -1174,11 +1269,9 @@ static int lpg_pattern_clear(struct lpg_led *led)
 
 	mutex_lock(&lpg->lock);
 
-	chan = led->channels[0];
-	lpg_lut_free(lpg, chan->pattern_lo_idx, chan->pattern_hi_idx);
-
 	for (i = 0; i < led->num_channels; i++) {
 		chan = led->channels[i];
+		lpg_lut_free(lpg, chan->pattern_lo_idx, chan->pattern_hi_idx);
 		lpg_sdam_configure_triggers(chan, 0);
 		lpg_clear_pbs_trigger(chan->lpg, chan->lut_mask);
 		chan->pattern_lo_idx = 0;

---
base-commit: 1795fd2dbe84ef4d393b69a0b2a3b371f810bde5
change-id: 20260605-lpg-rgb-color-balance-fix-82436649abf3

Best regards,
--  
Fenglin Wu <fenglin.wu@oss.qualcomm.com>


