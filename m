Return-Path: <linux-arm-msm+bounces-93583-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IMYgITL4m2mp+QMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93583-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 07:48:18 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 44062172577
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 07:48:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 89CB23025F71
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 06:45:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 895FC346A04;
	Mon, 23 Feb 2026 06:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cnKQrC48";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DXVsQp9u"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9087134A78F
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 06:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771829135; cv=none; b=CqcorV+hmiF+geobvN8yPNIUtLkfoIi5DNDlAAE39Q73V5vV91rxG0tdrpn9nzyMid7A8kQBYsgI3jKAzgzXc9qOFP7xaDQWOZVIvx7D2sqi4puBQZr+fWVL5vD450NG23Rv0YDsiAw4vM7TUUMP2Al6U1hP/wOiILmF1hcN57w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771829135; c=relaxed/simple;
	bh=PSFyCTD8XsFN5DnKm90Bf8IQfG9qwIw/GufXvDirK9w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CTCWs2ORyxbSZfCPSsQ3DVt7mq0oA3cYGKB0g28jg4Dz5bNpdyXsYqtGND0y4zJps2kLioylBDIGtVu5nup95Ve1EhnAGPFt2+cJo4YVBTZCJCYa8aWmnU/f//B61FcZEhe3OwKjCN0hQW0g4xj45aj6oSWIscAnGHm3aLwpA5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cnKQrC48; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DXVsQp9u; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61MFjpW52460514
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 06:45:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	a+f2aelFlTlRKGk/p4jbUmXoQWVOXGg/ifJWTMb0PcE=; b=cnKQrC48nrlsB9wZ
	TdP+gG4yMIab4U0Fsa+oBbqz6WavtdJ68lJ3DMiWtucrD9NyQHtBnLk6t8g6uJtc
	KG+pxWHHMhAVt301jWX8OEILSD6g4a4sBHUx7A8RZ3WD/hnpBFkPh24BBPHE/oK2
	VWurlFdk3vXe+hXj1QDJF+mCyaU72gsd2aD2YmHufegOpcnnafW2wfYzQqOpveBY
	lXIzS3mOC6lAAauQ8Clwy0y8Mv639mZOIL59ygrcQK6ElafCpdyJSQeqanFf1vfQ
	4tgDv+I6icjmRB6SCiS3dEmrDLRwgiHpbuXPxKuXlGJ2uD7uUVD9LKEZsBUixmq/
	9hyEnw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5wk3n3m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 06:45:32 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-824a1d441e7so1577639b3a.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 22 Feb 2026 22:45:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771829132; x=1772433932; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a+f2aelFlTlRKGk/p4jbUmXoQWVOXGg/ifJWTMb0PcE=;
        b=DXVsQp9u2x0W2A9e44d0J5A2Uye1L5FF0faRBBgBkOdeTIINv4oVE/hgFSQZLLLx2L
         /iVUeRg6339g4/c2R0LmdzXNjeoUyBRrCCQgpUGRPIFkbGFrVl/pCfHvroX35rdJ9IUA
         Knysy2e61uqvjgpUvUd+zHsCHETBXylxlqa5disFQOFeU4VeUms+9hlkHc4kAfLm72hW
         jHbYKjB84rJ7JIE/tv0myhkmN6jYP44whb2n2DLUUJyJt4egK1ai1vu2jo0Uig0cvBz6
         hcJK0Wrdl6UfN2ktQY/moJyRxj/sBLHRZKUsbuFtbOziFu8liTfN4rfcrqg6zZGguQbq
         d4Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771829132; x=1772433932;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=a+f2aelFlTlRKGk/p4jbUmXoQWVOXGg/ifJWTMb0PcE=;
        b=nujY50n+Nvf1LL5Ra7DZK4Ak2k60gxH/LpRmzm76jYfNbb43LT6LjnK+xh8GeOXP0k
         BiN2rZicJO960sexJtHXY4VP0EF5CVgRqqiZWZYQoVU9JPMjH4aGWPs87pDlon7R7O/l
         FuY6g+Cc4uzdcdZrAs0+0hwpbzB/x/aP0T4B5yWN+uTRJtEKq/52V41UFmPVX7cWiMGu
         su66056/8vaoQ4OLFT6evgEihumBgLupiN8wPuj/Idb3LrP7X9quxq/Ol68ket3JXj66
         sJRakzMo3ej0e+tOIFt7BrQg1pIdojCFoTAQcahD/gHBxxTYbOiC/dpStkF/VJOGaEg5
         2Lng==
X-Forwarded-Encrypted: i=1; AJvYcCVQKhgi153RC/M/11Gd+BpEI7D4/jECcYcAprEXz4Utrle7akC6VetgIGTX86K+FChw5ntxyinnl7wrAZCR@vger.kernel.org
X-Gm-Message-State: AOJu0YyXayCL9/K8elCi/4k1GGPbea5cco4oN+l/6kgnVWINWaZ+B3Tx
	FfrSBc2aRhPzI0JIRp/EUhw/t8SboWnOREpczS+7kGSudMjKAsB45c5tEM5+LOvgbuyoXQUee2L
	cGcvQ4R3PZ8kE1tjtGKN/4CZ8aAXl989R1wmX4bmyBOJlg7GamR/rd5Yo/BB4xKho8ruz
X-Gm-Gg: AZuq6aKvOnTGo6tNArfvOKVk8iTNshCsJZd27xqZhYXUpEfBnfzFF31ErRfrTsZ2YKC
	H85ldRsWxLT5Gp0O+SWWjzC9P/RlEOGXnMzPVvKAeuS/R8Y8Gdnq+Jadp4U7f/4E4ziVgDMbYg6
	XcPsQDbMVFPZmRfbWjbvVCmm6k5d82vcFiCnI4lKv7+yr2E3oMaddAhvjABI7US8uWXBTF3dZDj
	UQ7/Agb5i/ryDKCUu2yN81tLTe5cV6XV2+FGMbRTFx5BCTPnn5T3hji1OhjtpHsrwDYGI7sf5IW
	m11JP7WE/6XPBXSskNbVJt/KT+2LucY6q6DJR/C18xEAgDxFcG7I2ZEKjf7fFQ0onGticzu6tKL
	7hRo/BoBuiSKpW5Fm99RNPVpkyT3oIOjVyAY9MhSikqhvR1bV9oFCP6M+zSK2sO6U0p/Ya0yMe6
	3cngslM+Eq2brt
X-Received: by 2002:a05:6a00:1828:b0:81f:a842:276a with SMTP id d2e1a72fcca58-826da8c0e30mr6284456b3a.9.1771829131485;
        Sun, 22 Feb 2026 22:45:31 -0800 (PST)
X-Received: by 2002:a05:6a00:1828:b0:81f:a842:276a with SMTP id d2e1a72fcca58-826da8c0e30mr6284430b3a.9.1771829130839;
        Sun, 22 Feb 2026 22:45:30 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c70b71839d6sm6483993a12.6.2026.02.22.22.45.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 22:45:30 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 14:44:42 +0800
Subject: [PATCH 6/8] coresight: ctcu: enable byte-cntr for TMC ETR devices
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-enable-byte-cntr-for-ctcu-v1-6-042fb35bd37e@oss.qualcomm.com>
References: <20260223-enable-byte-cntr-for-ctcu-v1-0-042fb35bd37e@oss.qualcomm.com>
In-Reply-To: <20260223-enable-byte-cntr-for-ctcu-v1-0-042fb35bd37e@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <Mike.Leach@arm.com>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771829096; l=24560;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=PSFyCTD8XsFN5DnKm90Bf8IQfG9qwIw/GufXvDirK9w=;
 b=KCc25b/S1pFSROCegbebaN6N9jfUB9C4VMoBDBZTXR9qtXlTqvmoT2EBnlwjUfMHRtpucHk/0
 ROzJEdXNut/BVEy3QLp/pinVQC+s8IRLznYjdmVi8cxvF6O6ZYhLVUD
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Authority-Analysis: v=2.4 cv=a6k9NESF c=1 sm=1 tr=0 ts=699bf78c cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=TrPPj8Ph-2G9coJyck8A:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA1OCBTYWx0ZWRfX61xZUOYv+/Mj
 AJcAkA17efIuXPywyN/d6d2ZqRgSurNEC5fY56pEttzxri+hlhisEnxJMYakKG44LfEOYb4gqb6
 4TOecXon62u2/xUCP85DSDqR0Au0VGmRrYvR9QHVWkmS+XDfBExkNscvu4l5HcckX8Cu21pRtmh
 4Fn/tseaqpRJpwKquqGiq+V0lekPJcu8dtJw5k9jgANZQQbXjCsaSgC7CGrFw7v9sfWYtNqKat4
 jUFmgpisGKpMRUKh2FNPGD11Apnfrr55E5DegB4ahFfgSDok2L33qT6M9CSt0MbpQYXiH07kjql
 V4ZWI9KpRdNkrHhGCMmnx1hDj3aWzdrZcBC0TFJY8NVtOkd7dMdETlqA/p1YHTP4Tmio8FSLhij
 U2FBoyJKOKha9LEnVufI1a8+BJcanhjxnlN0yyMVMmt9vg+6Vem5qw9ryJspX6Xp/bUHEVKA4cq
 Y4I1QRj6VahelBrFrxg==
X-Proofpoint-ORIG-GUID: wlYO7pSMavO__IXQOY-NJXfV2PfM8VjH
X-Proofpoint-GUID: wlYO7pSMavO__IXQOY-NJXfV2PfM8VjH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_01,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 adultscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230058
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93583-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 44062172577
X-Rspamd-Action: no action

The byte-cntr function provided by the CTCU device is used to transfer data
from the ETR buffer to the userspace. An interrupt is triggered if the data
size exceeds the threshold set in the BYTECNTRVAL register. The interrupt
handler counts the number of triggered interruptions and the read function
will read the data from the synced ETR buffer.

Switching the sysfs_buf when current buffer is full or the timeout is
triggered and resets rrp and rwp registers after switched the buffer.
The synced buffer will become available for reading after the switch.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 .../ABI/testing/sysfs-bus-coresight-devices-ctcu   |   8 +
 drivers/hwtracing/coresight/Makefile               |   2 +-
 .../hwtracing/coresight/coresight-ctcu-byte-cntr.c | 367 +++++++++++++++++++++
 drivers/hwtracing/coresight/coresight-ctcu-core.c  | 103 +++++-
 drivers/hwtracing/coresight/coresight-ctcu.h       |  77 ++++-
 drivers/hwtracing/coresight/coresight-tmc-etr.c    |  18 +
 drivers/hwtracing/coresight/coresight-tmc.h        |   1 +
 7 files changed, 563 insertions(+), 13 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-ctcu b/Documentation/ABI/testing/sysfs-bus-coresight-devices-ctcu
new file mode 100644
index 000000000000..a58a05491f7a
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-ctcu
@@ -0,0 +1,8 @@
+What:           /sys/bus/coresight/devices/<ctcu-name>/irq_threshold[0:1]
+Date:           February 2026
+KernelVersion:  7.1
+Contact:        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>; Jinlong Mao <jinlong.mao@oss.qualcomm.com>; Jie Gan <jie.gan@oss.qualcomm.com>
+Description:
+		(RW) Configure the byte-cntr IRQ register for the specified ETR device
+		based on its port number. An interrupt is generated when the data size
+		exceeds the value set in the IRQ register.
diff --git a/drivers/hwtracing/coresight/Makefile b/drivers/hwtracing/coresight/Makefile
index ab16d06783a5..821a1b06b20c 100644
--- a/drivers/hwtracing/coresight/Makefile
+++ b/drivers/hwtracing/coresight/Makefile
@@ -55,5 +55,5 @@ coresight-cti-y := coresight-cti-core.o	coresight-cti-platform.o \
 obj-$(CONFIG_ULTRASOC_SMB) += ultrasoc-smb.o
 obj-$(CONFIG_CORESIGHT_DUMMY) += coresight-dummy.o
 obj-$(CONFIG_CORESIGHT_CTCU) += coresight-ctcu.o
-coresight-ctcu-y := coresight-ctcu-core.o
+coresight-ctcu-y := coresight-ctcu-core.o coresight-ctcu-byte-cntr.o
 obj-$(CONFIG_CORESIGHT_KUNIT_TESTS) += coresight-kunit-tests.o
diff --git a/drivers/hwtracing/coresight/coresight-ctcu-byte-cntr.c b/drivers/hwtracing/coresight/coresight-ctcu-byte-cntr.c
new file mode 100644
index 000000000000..bf59e654465b
--- /dev/null
+++ b/drivers/hwtracing/coresight/coresight-ctcu-byte-cntr.c
@@ -0,0 +1,367 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/coresight.h>
+#include <linux/device.h>
+#include <linux/fs.h>
+#include <linux/interrupt.h>
+#include <linux/of_irq.h>
+#include <linux/uaccess.h>
+
+#include "coresight-ctcu.h"
+#include "coresight-priv.h"
+#include "coresight-tmc.h"
+
+static irqreturn_t byte_cntr_handler(int irq, void *data)
+{
+	struct ctcu_byte_cntr *byte_cntr_data = (struct ctcu_byte_cntr *)data;
+
+	atomic_inc(&byte_cntr_data->irq_cnt);
+	wake_up(&byte_cntr_data->wq);
+
+	return IRQ_HANDLED;
+}
+
+static void ctcu_reset_sysfs_buf(struct tmc_drvdata *drvdata)
+{
+	u32 sts;
+
+	CS_UNLOCK(drvdata->base);
+	tmc_write_rrp(drvdata, drvdata->sysfs_buf->hwaddr);
+	tmc_write_rwp(drvdata, drvdata->sysfs_buf->hwaddr);
+	sts = readl_relaxed(drvdata->base + TMC_STS) & ~TMC_STS_FULL;
+	writel_relaxed(sts, drvdata->base + TMC_STS);
+	CS_LOCK(drvdata->base);
+}
+
+static void ctcu_cfg_byte_cntr_reg(struct tmc_drvdata *drvdata, u32 val, u32 offset)
+{
+	struct ctcu_drvdata *ctcu_drvdata;
+	struct coresight_device *helper;
+
+	helper = tmc_etr_get_ctcu_device(drvdata);
+	if (!helper)
+		return;
+
+	ctcu_drvdata = dev_get_drvdata(helper->dev.parent);
+	/* A one value for IRQCTRL register represents 8 bytes */
+	ctcu_program_register(ctcu_drvdata, val / 8, offset);
+}
+
+static struct ctcu_byte_cntr *ctcu_get_byte_cntr_data(struct tmc_drvdata *drvdata)
+{
+	struct ctcu_byte_cntr *byte_cntr_data;
+	struct ctcu_drvdata *ctcu_drvdata;
+	struct coresight_device *helper;
+	int port;
+
+	helper = tmc_etr_get_ctcu_device(drvdata);
+	if (!helper)
+		return NULL;
+
+	port = coresight_get_in_port(drvdata->csdev, helper);
+	if (port < 0)
+		return NULL;
+
+	ctcu_drvdata = dev_get_drvdata(helper->dev.parent);
+	byte_cntr_data = &ctcu_drvdata->byte_cntr_data[port];
+	return byte_cntr_data;
+}
+
+static bool ctcu_byte_cntr_switch_buffer(struct tmc_drvdata *drvdata,
+					 struct ctcu_byte_cntr *byte_cntr_data)
+{
+	struct etr_buf_node *nd, *next, *curr_node, *picked_node;
+	struct etr_buf *curr_buf = drvdata->sysfs_buf;
+	bool found_free_buf = false;
+
+	if (WARN_ON(!drvdata || !byte_cntr_data))
+		return found_free_buf;
+
+	/* Stop the ETR before we start the switch */
+	if (coresight_get_mode(drvdata->csdev) != CS_MODE_DISABLED)
+		tmc_etr_enable_disable_hw(drvdata, false);
+
+	list_for_each_entry_safe(nd, next, &drvdata->etr_buf_list, node) {
+		/* curr_buf is free for next round */
+		if (nd->sysfs_buf == curr_buf) {
+			nd->is_free = true;
+			curr_node = nd;
+		}
+
+		if (!found_free_buf && nd->is_free && nd->sysfs_buf != curr_buf) {
+			picked_node = nd;
+			found_free_buf = true;
+		}
+	}
+
+	if (found_free_buf) {
+		curr_node->pos = 0;
+		drvdata->reading_node = curr_node;
+		drvdata->sysfs_buf = picked_node->sysfs_buf;
+		drvdata->etr_buf = picked_node->sysfs_buf;
+		picked_node->is_free = false;
+		/* Reset irq_cnt for next etr_buf */
+		atomic_set(&byte_cntr_data->irq_cnt, 0);
+		/* Reset rrp and rwp when the system has switched the buffer*/
+		ctcu_reset_sysfs_buf(drvdata);
+		/* Restart the ETR when we find a free buffer */
+		if (coresight_get_mode(drvdata->csdev) != CS_MODE_DISABLED)
+			tmc_etr_enable_disable_hw(drvdata, true);
+	}
+
+	return found_free_buf;
+}
+
+/*
+ * ctcu_byte_cntr_get_data() - reads data from the deactivated and filled buffer.
+ * The byte-cntr reading work reads data from the deactivated and filled buffer.
+ * The read operation waits for a buffer to become available, either filled or
+ * upon timeout, and then reads trace data from the synced buffer.
+ */
+static ssize_t ctcu_byte_cntr_get_data(struct tmc_drvdata *drvdata, loff_t pos,
+				       size_t len, char **bufpp)
+{
+	struct etr_buf *sysfs_buf = drvdata->sysfs_buf;
+	struct device *dev = &drvdata->csdev->dev;
+	ssize_t actual, size = sysfs_buf->size;
+	struct ctcu_byte_cntr *byte_cntr_data;
+	size_t thresh_val;
+	atomic_t *irq_cnt;
+	int ret;
+
+	byte_cntr_data = ctcu_get_byte_cntr_data(drvdata);
+	if (!byte_cntr_data)
+		return -EINVAL;
+
+	thresh_val = byte_cntr_data->thresh_val;
+	irq_cnt = &byte_cntr_data->irq_cnt;
+
+wait_buffer:
+	if (!byte_cntr_data->reading_buf) {
+		ret = wait_event_interruptible_timeout(byte_cntr_data->wq,
+				((atomic_read(irq_cnt) + 1) * thresh_val >= size) ||
+				!byte_cntr_data->enable,
+				BYTE_CNTR_TIMEOUT);
+		if (ret < 0)
+			return ret;
+		/*
+		 * The current etr_buf is almost full or timeout is triggered,
+		 * so switch the buffer and mark the switched buffer as reading.
+		 */
+		if (byte_cntr_data->enable) {
+			if (!ctcu_byte_cntr_switch_buffer(drvdata, byte_cntr_data)) {
+				dev_err(dev, "Switch buffer failed for byte-cntr\n");
+				return -EINVAL;
+			}
+
+			byte_cntr_data->reading_buf = true;
+		} else {
+			/*
+			 * TMC-ETR has been disabled, so directly reads data from
+			 * the drvdata->sysfs_buf.
+			 */
+			actual = drvdata->sysfs_ops->get_trace_data(drvdata, pos, len, bufpp);
+			if (actual > 0) {
+				byte_cntr_data->total_size += actual;
+				return actual;
+			}
+
+			/* Exit byte-cntr reading */
+			return 0;
+		}
+	}
+
+	/* Check the status of current etr_buf*/
+	if ((atomic_read(irq_cnt) + 1) * thresh_val >= size)
+		/*
+		 * Unlikely to find a free buffer to switch, so just disable
+		 * the ETR for a while.
+		 */
+		if (!ctcu_byte_cntr_switch_buffer(drvdata, byte_cntr_data))
+			dev_warn(dev, "No available buffer to store data, disable ETR\n");
+
+	pos = drvdata->reading_node->pos;
+	actual = drvdata->sysfs_ops->get_trace_data(drvdata, pos, len, bufpp);
+	if (actual <= 0) {
+		/* Reset flags upon reading is finished or failed */
+		byte_cntr_data->reading_buf = false;
+		drvdata->reading_node = NULL;
+
+		/*
+		 * Nothing in the buffer, waiting for the next buffer
+		 * to be filled.
+		 */
+		if (actual == 0)
+			goto wait_buffer;
+	} else
+		byte_cntr_data->total_size += actual;
+
+	return actual;
+}
+
+static int ctcu_read_prepare_byte_cntr(struct tmc_drvdata *drvdata)
+{
+	struct ctcu_byte_cntr *byte_cntr_data;
+	unsigned long flags;
+	int ret = 0;
+
+	/* config types are set a boot time and never change */
+	if (WARN_ON_ONCE(drvdata->config_type != TMC_CONFIG_TYPE_ETR))
+		return -EINVAL;
+
+	/*
+	 * Byte counter reading should start only after the TMC-ETR has been
+	 * enabled, which implies that the sysfs_buf has already been setup
+	 * in drvdata.
+	 */
+	if (!drvdata->sysfs_buf)
+		return -EINVAL;
+
+	byte_cntr_data = ctcu_get_byte_cntr_data(drvdata);
+	if (!byte_cntr_data)
+		return -EINVAL;
+
+	/*
+	 * The threshold value must not exceed the buffer size.
+	 * A margin should be maintained between the two values to account
+	 * for the time gap between the interrupt and buffer switching.
+	 */
+	if (byte_cntr_data->thresh_val + SZ_16K >= drvdata->size) {
+		dev_err(&drvdata->csdev->dev, "The threshold value is too large\n");
+		return -EINVAL;
+	}
+
+	raw_spin_lock_irqsave(&drvdata->spinlock, flags);
+	if (byte_cntr_data->reading) {
+		ret = -EBUSY;
+		goto out_unlock;
+	}
+
+	byte_cntr_data->reading = true;
+	raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
+	/* Setup an available etr_buf_list for byte-cntr */
+	ret = tmc_create_etr_buf_list(drvdata, 2);
+	if (ret)
+		goto out;
+
+	raw_spin_lock_irqsave(&drvdata->spinlock, flags);
+	atomic_set(&byte_cntr_data->irq_cnt, 0);
+	/* Configure the byte-cntr register to enable IRQ */
+	ctcu_cfg_byte_cntr_reg(drvdata, byte_cntr_data->thresh_val,
+			       byte_cntr_data->irq_ctrl_offset);
+	enable_irq_wake(byte_cntr_data->irq);
+	byte_cntr_data->total_size = 0;
+
+out_unlock:
+	raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
+
+out:
+	return ret;
+}
+
+static int ctcu_read_unprepare_byte_cntr(struct tmc_drvdata *drvdata)
+{
+	struct device *dev = &drvdata->csdev->dev;
+	struct ctcu_byte_cntr *byte_cntr_data;
+	unsigned long flags;
+
+	byte_cntr_data = ctcu_get_byte_cntr_data(drvdata);
+	if (!byte_cntr_data)
+		return -EINVAL;
+
+	raw_spin_lock_irqsave(&drvdata->spinlock, flags);
+	/* Configure the byte-cntr register to disable IRQ */
+	ctcu_cfg_byte_cntr_reg(drvdata, 0, byte_cntr_data->irq_ctrl_offset);
+	disable_irq_wake(byte_cntr_data->irq);
+	byte_cntr_data->reading = false;
+	byte_cntr_data->reading_buf = false;
+	drvdata->reading_node = NULL;
+	raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
+	dev_dbg(dev, "send data total size:%llu bytes\n", byte_cntr_data->total_size);
+	tmc_clean_etr_buf_list(drvdata);
+
+	return 0;
+}
+
+static const struct tmc_sysfs_ops byte_cntr_sysfs_ops = {
+	.read_prepare	= ctcu_read_prepare_byte_cntr,
+	.read_unprepare	= ctcu_read_unprepare_byte_cntr,
+	.get_trace_data	= ctcu_byte_cntr_get_data,
+};
+
+/* Start the byte-cntr function when the path is enabled. */
+void ctcu_byte_cntr_start(struct coresight_device *csdev, struct coresight_path *path)
+{
+	struct ctcu_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
+	struct coresight_device *sink = coresight_get_sink(path);
+	struct ctcu_byte_cntr *byte_cntr_data;
+	int port_num;
+
+	if (!sink)
+		return;
+
+	port_num = coresight_get_in_port(sink, csdev);
+	if (port_num < 0)
+		return;
+
+	byte_cntr_data = &drvdata->byte_cntr_data[port_num];
+	/* Don't start byte-cntr function when threshold is not set. */
+	if (!byte_cntr_data->thresh_val || byte_cntr_data->enable)
+		return;
+
+	guard(raw_spinlock_irqsave)(&byte_cntr_data->spin_lock);
+	byte_cntr_data->enable = true;
+	byte_cntr_data->reading_buf = false;
+}
+
+/* Stop the byte-cntr function when the path is disabled. */
+void ctcu_byte_cntr_stop(struct coresight_device *csdev, struct coresight_path *path)
+{
+	struct ctcu_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
+	struct coresight_device *sink = coresight_get_sink(path);
+	struct ctcu_byte_cntr *byte_cntr_data;
+	int port_num;
+
+	if (!sink || coresight_get_mode(sink) == CS_MODE_SYSFS)
+		return;
+
+	port_num = coresight_get_in_port(sink, csdev);
+	if (port_num < 0)
+		return;
+
+	byte_cntr_data = &drvdata->byte_cntr_data[port_num];
+	guard(raw_spinlock_irqsave)(&byte_cntr_data->spin_lock);
+	byte_cntr_data->enable = false;
+}
+
+void ctcu_byte_cntr_init(struct device *dev, struct ctcu_drvdata *drvdata, int etr_num)
+{
+	struct ctcu_byte_cntr *byte_cntr_data;
+	struct device_node *nd = dev->of_node;
+	int irq_num, ret, i;
+
+	drvdata->byte_cntr_sysfs_ops = &byte_cntr_sysfs_ops;
+	for (i = 0; i < etr_num; i++) {
+		byte_cntr_data = &drvdata->byte_cntr_data[i];
+		irq_num = of_irq_get(nd, i);
+		if (irq_num < 0) {
+			dev_err(dev, "Failed to get IRQ from DT for port%d\n", i);
+			continue;
+		}
+
+		ret = devm_request_irq(dev, irq_num, byte_cntr_handler,
+				       IRQF_TRIGGER_RISING | IRQF_SHARED,
+				       dev_name(dev), byte_cntr_data);
+		if (ret) {
+			dev_err(dev, "Failed to register IRQ for port%d\n", i);
+			continue;
+		}
+
+		byte_cntr_data->irq = irq_num;
+		init_waitqueue_head(&byte_cntr_data->wq);
+		raw_spin_lock_init(&drvdata->spin_lock);
+	}
+}
diff --git a/drivers/hwtracing/coresight/coresight-ctcu-core.c b/drivers/hwtracing/coresight/coresight-ctcu-core.c
index 78be783b3cb2..0e5cadaac350 100644
--- a/drivers/hwtracing/coresight/coresight-ctcu-core.c
+++ b/drivers/hwtracing/coresight/coresight-ctcu-core.c
@@ -15,6 +15,7 @@
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/slab.h>
+#include <linux/sizes.h>
 
 #include "coresight-ctcu.h"
 #include "coresight-priv.h"
@@ -45,17 +46,21 @@ DEFINE_CORESIGHT_DEVLIST(ctcu_devs, "ctcu");
 
 #define CTCU_ATID_REG_BIT(traceid)	(traceid % 32)
 #define CTCU_ATID_REG_SIZE		0x10
+#define CTCU_ETR0_IRQCTRL               0x6c
+#define CTCU_ETR1_IRQCTRL               0x70
 #define CTCU_ETR0_ATID0			0xf8
 #define CTCU_ETR1_ATID0			0x108
 
 static const struct ctcu_etr_config sa8775p_etr_cfgs[] = {
 	{
-		.atid_offset	= CTCU_ETR0_ATID0,
-		.port_num	= 0,
+		.atid_offset		= CTCU_ETR0_ATID0,
+		.irq_ctrl_offset	= CTCU_ETR0_IRQCTRL,
+		.port_num		= 0,
 	},
 	{
-		.atid_offset	= CTCU_ETR1_ATID0,
-		.port_num	= 1,
+		.atid_offset		= CTCU_ETR1_ATID0,
+		.irq_ctrl_offset	= CTCU_ETR1_IRQCTRL,
+		.port_num		= 1,
 	},
 };
 
@@ -64,6 +69,88 @@ static const struct ctcu_config sa8775p_cfgs = {
 	.num_etr_config	= ARRAY_SIZE(sa8775p_etr_cfgs),
 };
 
+void ctcu_program_register(struct ctcu_drvdata *drvdata, u32 val, u32 offset)
+{
+	CS_UNLOCK(drvdata->base);
+	ctcu_writel(drvdata, val, offset);
+	CS_LOCK(drvdata->base);
+}
+
+static ssize_t irq_threshold_show(struct device *dev,
+				  struct device_attribute *attr,
+				  char *buf)
+{
+	struct ctcu_byte_cntr_irq_attribute *irq_attr =
+		container_of(attr, struct ctcu_byte_cntr_irq_attribute, attr);
+	struct ctcu_drvdata *drvdata = dev_get_drvdata(dev->parent);
+	u8 port = irq_attr->port;
+
+	if (!drvdata->byte_cntr_data[port].irq_ctrl_offset)
+		return -EINVAL;
+
+	return sysfs_emit(buf, "%u\n",
+			(unsigned int)drvdata->byte_cntr_data[port].thresh_val);
+}
+
+static ssize_t irq_threshold_store(struct device *dev,
+				   struct device_attribute *attr,
+				   const char *buf,
+				   size_t size)
+{
+	struct ctcu_byte_cntr_irq_attribute *irq_attr =
+		container_of(attr, struct ctcu_byte_cntr_irq_attribute, attr);
+	struct ctcu_drvdata *drvdata = dev_get_drvdata(dev->parent);
+	u8 port = irq_attr->port;
+	unsigned long val;
+
+	if (kstrtoul(buf, 0, &val))
+		return -EINVAL;
+
+	/* Threshold 0 disables the interruption. */
+	guard(raw_spinlock_irqsave)(&drvdata->spin_lock);
+	/* A small threshold will result in a large number of interruptions */
+	if (val && val < SZ_4K)
+		return -EINVAL;
+
+	if (drvdata->byte_cntr_data[port].irq_ctrl_offset)
+		drvdata->byte_cntr_data[port].thresh_val = val;
+
+	return size;
+}
+
+static umode_t irq_threshold_is_visible(struct kobject *kobj,
+					struct attribute *attr, int n)
+{
+	struct device_attribute *dev_attr =
+		container_of(attr, struct device_attribute, attr);
+	struct ctcu_byte_cntr_irq_attribute *irq_attr =
+		container_of(dev_attr, struct ctcu_byte_cntr_irq_attribute, attr);
+	struct device *dev = kobj_to_dev(kobj);
+	struct ctcu_drvdata *drvdata = dev_get_drvdata(dev->parent);
+	u8 port = irq_attr->port;
+
+	if (drvdata && drvdata->byte_cntr_data[port].irq_ctrl_offset)
+		return attr->mode;
+
+	return 0;
+}
+
+static struct attribute *ctcu_attrs[] = {
+	ctcu_byte_cntr_irq_rw(0),
+	ctcu_byte_cntr_irq_rw(1),
+	NULL,
+};
+
+static struct attribute_group ctcu_attr_grp = {
+	.attrs = ctcu_attrs,
+	.is_visible = irq_threshold_is_visible,
+};
+
+static const struct attribute_group *ctcu_attr_grps[] = {
+	&ctcu_attr_grp,
+	NULL,
+};
+
 static void ctcu_program_atid_register(struct ctcu_drvdata *drvdata, u32 reg_offset,
 				       u8 bit, bool enable)
 {
@@ -142,11 +229,15 @@ static int ctcu_set_etr_traceid(struct coresight_device *csdev, struct coresight
 static int ctcu_enable(struct coresight_device *csdev, enum cs_mode mode,
 		       struct coresight_path *path)
 {
+	ctcu_byte_cntr_start(csdev, path);
+
 	return ctcu_set_etr_traceid(csdev, path, true);
 }
 
 static int ctcu_disable(struct coresight_device *csdev, struct coresight_path *path)
 {
+	ctcu_byte_cntr_stop(csdev, path);
+
 	return ctcu_set_etr_traceid(csdev, path, false);
 }
 
@@ -197,7 +288,10 @@ static int ctcu_probe(struct platform_device *pdev)
 			for (i = 0; i < cfgs->num_etr_config; i++) {
 				etr_cfg = &cfgs->etr_cfgs[i];
 				drvdata->atid_offset[i] = etr_cfg->atid_offset;
+				drvdata->byte_cntr_data[i].irq_ctrl_offset =
+					etr_cfg->irq_ctrl_offset;
 			}
+			ctcu_byte_cntr_init(dev, drvdata, cfgs->num_etr_config);
 		}
 	}
 
@@ -209,6 +303,7 @@ static int ctcu_probe(struct platform_device *pdev)
 	desc.subtype.helper_subtype = CORESIGHT_DEV_SUBTYPE_HELPER_CTCU;
 	desc.pdata = pdata;
 	desc.dev = dev;
+	desc.groups = ctcu_attr_grps;
 	desc.ops = &ctcu_ops;
 	desc.access = CSDEV_ACCESS_IOMEM(base);
 
diff --git a/drivers/hwtracing/coresight/coresight-ctcu.h b/drivers/hwtracing/coresight/coresight-ctcu.h
index e9594c38dd91..bc833482c8bc 100644
--- a/drivers/hwtracing/coresight/coresight-ctcu.h
+++ b/drivers/hwtracing/coresight/coresight-ctcu.h
@@ -5,19 +5,26 @@
 
 #ifndef _CORESIGHT_CTCU_H
 #define _CORESIGHT_CTCU_H
+
+#include <linux/time.h>
 #include "coresight-trace-id.h"
 
 /* Maximum number of supported ETR devices for a single CTCU. */
 #define ETR_MAX_NUM	2
 
+#define BYTE_CNTR_TIMEOUT	(5 * HZ)
+
 /**
  * struct ctcu_etr_config
  * @atid_offset:	offset to the ATID0 Register.
- * @port_num:		in-port number of CTCU device that connected to ETR.
+ * @port_num:		in-port number of the CTCU device that connected to ETR.
+ * @irq_ctrl_offset:    offset to the BYTECNTRVAL register.
+ * @irq_name:           IRQ name in dt node.
  */
 struct ctcu_etr_config {
 	const u32 atid_offset;
 	const u32 port_num;
+	const u32 irq_ctrl_offset;
 };
 
 struct ctcu_config {
@@ -25,15 +32,69 @@ struct ctcu_config {
 	int num_etr_config;
 };
 
-struct ctcu_drvdata {
-	void __iomem		*base;
-	struct clk		*apb_clk;
-	struct device		*dev;
-	struct coresight_device	*csdev;
+/**
+ * struct ctcu_byte_cntr
+ * @enable:		indicates that byte_cntr function is enabled or not.
+ * @reading:		indicates that byte-cntr reading is started.
+ * @reading_buf:	indicates that byte-cntr is reading data from the buffer.
+ * @thresh_val:		threshold to trigger a interruption.
+ * @total_size:		total size of transferred data.
+ * @irq:		allocated number of the IRQ.
+ * @irq_cnt:		IRQ count number for triggered interruptions.
+ * @wq:			waitqueue for reading data from ETR buffer.
+ * @spin_lock:		spinlock of byte_cntr_data.
+ * @irq_ctrl_offset:	offset to the BYTECNTVAL Register.
+ */
+struct ctcu_byte_cntr {
+	bool			enable;
+	bool                    reading;
+	bool			reading_buf;
+	u32			thresh_val;
+	u64			total_size;
+	int			irq;
+	atomic_t		irq_cnt;
+	wait_queue_head_t	wq;
 	raw_spinlock_t		spin_lock;
-	u32			atid_offset[ETR_MAX_NUM];
+	u32			irq_ctrl_offset;
+};
+
+struct ctcu_drvdata {
+	void __iomem			*base;
+	struct clk			*apb_clk;
+	struct device			*dev;
+	struct coresight_device		*csdev;
+	struct ctcu_byte_cntr		byte_cntr_data[ETR_MAX_NUM];
+	raw_spinlock_t			spin_lock;
+	u32				atid_offset[ETR_MAX_NUM];
 	/* refcnt for each traceid of each sink */
-	u8			traceid_refcnt[ETR_MAX_NUM][CORESIGHT_TRACE_ID_RES_TOP];
+	u8				traceid_refcnt[ETR_MAX_NUM][CORESIGHT_TRACE_ID_RES_TOP];
+	const struct tmc_sysfs_ops	*byte_cntr_sysfs_ops;
 };
 
+/**
+ * struct ctcu_irq_thresh_attribute
+ * @attr:	The device attribute.
+ * @idx:	port number.
+ */
+struct ctcu_byte_cntr_irq_attribute {
+	struct device_attribute	attr;
+	u8			port;
+};
+
+#define ctcu_byte_cntr_irq_rw(port)					\
+	(&((struct ctcu_byte_cntr_irq_attribute[]) {			\
+	   {								\
+		__ATTR(irq_threshold##port, 0644, irq_threshold_show,	\
+		irq_threshold_store),					\
+		port,							\
+	   }								\
+	})[0].attr.attr)
+
+void ctcu_program_register(struct ctcu_drvdata *drvdata, u32 val, u32 offset);
+
+/* Byte-cntr functions */
+void ctcu_byte_cntr_start(struct coresight_device *csdev, struct coresight_path *path);
+void ctcu_byte_cntr_stop(struct coresight_device *csdev, struct coresight_path *path);
+void ctcu_byte_cntr_init(struct device *dev, struct ctcu_drvdata *drvdata, int port_num);
+
 #endif
diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
index 32353980964a..83514966df5a 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
@@ -1187,6 +1187,10 @@ ssize_t tmc_etr_get_sysfs_trace(struct tmc_drvdata *drvdata,
 	ssize_t actual = len;
 	struct etr_buf *etr_buf = drvdata->sysfs_buf;
 
+	/* Reading the buffer from the buf_node if it exists*/
+	if (drvdata->reading_node)
+		etr_buf = drvdata->reading_node->sysfs_buf;
+
 	if (pos + actual > etr_buf->len)
 		actual = etr_buf->len - pos;
 	if (actual <= 0)
@@ -1250,6 +1254,20 @@ static void __tmc_etr_disable_hw(struct tmc_drvdata *drvdata)
 
 }
 
+/**
+ * tmc_etr_enable_disable_hw - enable/disable the ETR hw.
+ * @drvdata:	drvdata of the TMC device.
+ * @enable:	indicates enable/disable.
+ */
+void tmc_etr_enable_disable_hw(struct tmc_drvdata *drvdata, bool enable)
+{
+	if (enable)
+		__tmc_etr_enable_hw(drvdata);
+	else
+		__tmc_etr_disable_hw(drvdata);
+}
+EXPORT_SYMBOL_GPL(tmc_etr_enable_disable_hw);
+
 void tmc_etr_disable_hw(struct tmc_drvdata *drvdata)
 {
 	__tmc_etr_disable_hw(drvdata);
diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
index 27dd72065c60..d60c70530c8a 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.h
+++ b/drivers/hwtracing/coresight/coresight-tmc.h
@@ -482,5 +482,6 @@ struct etr_buf *tmc_etr_get_buffer(struct coresight_device *csdev,
 extern const struct attribute_group coresight_etr_group;
 void tmc_clean_etr_buf_list(struct tmc_drvdata *drvdata);
 int tmc_create_etr_buf_list(struct tmc_drvdata *drvdata, int num_nodes);
+void tmc_etr_enable_disable_hw(struct tmc_drvdata *drvdata, bool enable);
 
 #endif

-- 
2.34.1


