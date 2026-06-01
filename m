Return-Path: <linux-arm-msm+bounces-110636-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SDToHeuqHWq+cwkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110636-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 17:53:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 12E08622173
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 17:53:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B4EE430FD437
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jun 2026 15:43:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53E753DCDAD;
	Mon,  1 Jun 2026 15:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SHl4d4Vj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Mdpa6YHw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBA773DBD63
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Jun 2026 15:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780328549; cv=none; b=BaqhTrLO0LkDL+kIyX88ZwJPbMzj/S7u0tUfwnO7sw1f36LGcC48UskUH02s/zMWGOoZtizygCORW9XbC2p6HjxU8uVFrMDOGtk3XfL2nsEFGnqTlKgf2DbzQDBbHyfnPllf56cOc0hkLn1d1L3ombmmT19Iuerh/3CqjYaTmFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780328549; c=relaxed/simple;
	bh=N4Z+AZc7wjVb3bdfB+zDhgey7FSU64002OYWNB/Cwgk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Pb9gLnjnx8x3K2xiLoI0g4wKMCwYQWgxGjDnux5awLJDpwpQGKKiA+AhSNvsIwM7TILI2qVQs1zxeLiPvNUF4J4n830J34e8Naq0ha1aDGez0wO38rVZRgJHVbPue7IAabwl0NpSfYbh3iA1cnn+i2yYqIRXun0KAW29Q0wqmzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SHl4d4Vj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Mdpa6YHw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 651F0Yu14065646
	for <linux-arm-msm@vger.kernel.org>; Mon, 1 Jun 2026 15:42:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6ve/nvJiVqGCRF/XbvZ8kqLcqT9EQaai+53rKyC32JQ=; b=SHl4d4VjlqOyX/Hk
	onHTYi4p42GJbKVJU5V07nrrK6psOfCh0u2I8loK6Boe12wsXYbM+gBI/54Nb/5g
	MLVAtN98DQ1COtas1+T5INuRXFk2lpmMpWj+Ll4QRTwine+JjJUEZg/msTt/w0jz
	QTkV8TUWT0/iB3Yld17PEbm3wVzUvlz6SywEIoImuHytLaiBozO0nTBhse0jKuAg
	bC3N/R1p1Nf4YsYDx0QyCD1wjtOKc/9vwakTkEANfqtP8lWGsREy+F94tlK1U7Os
	//kEAakRF/+CdXk/saKlDy9xaHMb4ycteHLyGs9JNePaRdwI2eh/KLj/JQ2RJpwV
	4UjHbg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eh6swss6n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jun 2026 15:42:23 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3041ab826ddso17671829eec.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jun 2026 08:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780328543; x=1780933343; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6ve/nvJiVqGCRF/XbvZ8kqLcqT9EQaai+53rKyC32JQ=;
        b=Mdpa6YHw4wPURqWKrr7o+dfzmqu1UMr1VrB7NlTA67TBw4MpFbnS6w7glSutEXVAlA
         J0IBM09F5/Va2245v5nbYxrm6TK0vMZM2NkbOaEvYjLXz02VtXilcrB/04dMugAa4m5+
         mEykHUn/a7BlvewrQHb/ogTbE3CmIB0lewvL9ccdMNIIqMTvGdN2WkdOewMUSLDhAibC
         O3udLGtzF4m+EUHolRBW5AMDEAmqeOWztnEGHms/QlpvFyDNEX5uKtRsmPhjxijdeEmv
         ib7k01ak9g1wQRc5ocKDUaqQpvvUBzDl5taoHYQbtxxKw+mnngOZ4UqyUJiymKgkgSwY
         OYMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780328543; x=1780933343;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6ve/nvJiVqGCRF/XbvZ8kqLcqT9EQaai+53rKyC32JQ=;
        b=gNqzoYnp0t3ysjoEZa7kwicdSazeC+oNYGEmgiZaQ4gPTJN+1rZTpVZ5Ip8x8fFDwa
         myyQAnslw8er7loESH+GuFDDhIRCBJS14NIKw/rt7Apg/C9ozORikv0ottR7szEN6DKH
         esN6K4hI4hD240EmH+DgBU22QrJliXCerlfaiJ3WDz6metVFIrOoNOVkoOyU2/B1/Cea
         fa6tlzvJAV+osrnq5HeCkiapuORdpkxv3Qy5lA9kKAHhywTg9dFQiB+itdb5HlHaCWM8
         Zj08rvYleAHHENxBLavYCqGfcxJNVM3mr6qzB6/Bjrgoum9WkReHb5LibH6sY8pDoVmb
         L+Aw==
X-Forwarded-Encrypted: i=1; AFNElJ8vWYPoMUfmOlZ8cKoSzXn9dMO5u5gfwA+6AD0aRRH35GOM41xnoy6fh4qYdVLofQiuqHLxkje/7PWJ7a6t@vger.kernel.org
X-Gm-Message-State: AOJu0YyszvOwBlj3+tYcttdioteJ8lW9PN+gM8AY+nDVDxU9jbqOc1tL
	sdwxrSwRFuYQ0tNq+0u84NlkxM4g4DbIRKNqsetaIZJ30ct2GhDcQ9SFXqnTsaObCgXhBlUo2gJ
	RoZ5vceJvuXuslVCOyF6d7RS8NTBO/FRp9PN3CGM87HZ8lLCHjmafVPmeQg7zgS1NlR5i
X-Gm-Gg: Acq92OHwKIPSflPFnxk3w1BsG13NXPwDlDtR0uX/UiFcBxGRbEkc7tpHwXVmYPQ6lKd
	azjfWINZLxHoiUE5+JaaoSwxhcm6PR/7YPOdYfl7Z45hKAaugLpB9SnmVh3y8pZeTa3eKkT+R2r
	WtXKuWFVlVFw/O6S0ksxvD0Pd76DiDCfIuJ24GKERjjAHw1XgxhWbD354Okns9Y2oPk+iEWpYwR
	MJ8kChA1tiJAezIThGNX/sEFXA/3Q1Wy/E4kHGjHzbJMMwkJTStNVoa4+4GGWxz3REL9bsG+sU/
	a322SRMhZ2ZcNEydkRn6LKcZ9SfzbSCWLuQ78D0KwZ6Fhtvxo0e9aQvC32HdbS7Y3dtaDKwhV5u
	/Xjp8NyqhYcMTIjExzh3MPLaeMKpmTxqyYLSQQzfTZwvgCKYPD5rQ5lFZx85Trvf78B+7yIRaO9
	kx6KKt+HDUdqE=
X-Received: by 2002:a05:7300:e12a:b0:2d8:71c2:255d with SMTP id 5a478bee46e88-304fa51a193mr4973871eec.14.1780328542515;
        Mon, 01 Jun 2026 08:42:22 -0700 (PDT)
X-Received: by 2002:a05:7300:e12a:b0:2d8:71c2:255d with SMTP id 5a478bee46e88-304fa51a193mr4973838eec.14.1780328541850;
        Mon, 01 Jun 2026 08:42:21 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-304ed53f002sm9430371eec.18.2026.06.01.08.42.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 08:42:21 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Mon, 01 Jun 2026 08:42:17 -0700
Subject: [PATCH v4 4/5] media: qcom: camss: csid: Add support for CSID 980
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260601-add-support-for-camss-on-sm8750-v4-4-1eb6f432cfd1@oss.qualcomm.com>
References: <20260601-add-support-for-camss-on-sm8750-v4-0-1eb6f432cfd1@oss.qualcomm.com>
In-Reply-To: <20260601-add-support-for-camss-on-sm8750-v4-0-1eb6f432cfd1@oss.qualcomm.com>
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Atiya Kailany <atiya.kailany@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=Z4Hc2nRA c=1 sm=1 tr=0 ts=6a1da85f cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=63CfXtnvIBONjkcrFHoA:9 a=Z-sH2BZsVlbqz-yA:21
 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: XWJIo-zqZVSxI-SwxS8WF-3o-JUmp8ps
X-Proofpoint-ORIG-GUID: XWJIo-zqZVSxI-SwxS8WF-3o-JUmp8ps
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDE1NyBTYWx0ZWRfXxO0gUeQvh12d
 7NQ8KuqGSOhDN6rksP32y9YLR9itv3Fga2Ga0UVjoKJceokUEeOAn+m8s+2lUt65oQ6Mj7QuLpp
 veJIjJSDTVj7AUDeJgyzm+qAVEp+ALVDruq+oTYGc76By3nr1mfNUFue3HnNjkBtftQGEM02TVo
 fZaDyySVGPYe3+UvJ+vUcOQr7gAx2jR29T1h9lutrG4ZVEG0DS5xIz/Hi9vlu6PH6V8n69hk78t
 EftFx4b0VMeiIhw5rANV/BwQxdxueJEA8TLAPgKJR89RGjsjqmNt4M2IzeZrzXQh2KpBHGJFt1C
 oE8NMBAyAUle/6/ufCeTCTGtQWnEn0M0U3T4PqGJRYI9NACzSVlbAC6wntKr0VUVRCZzvoxuPf2
 kgXoadacIY8qweVe7LvFKhXK07umv2Bs83w3OB3bFR+whQC22zActzRD03ohpE+FXGsYPC5ZsYX
 gUNshUxyfm3XlNviNNg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010157
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-110636-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,linaro.org,oss.qualcomm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hangxiang.ma@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 12E08622173
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add more detailed resource information for CSID devices along with the
driver for CSID 980 that is responsible for CSID register
configuration, module reset and IRQ handling for BUF_DONE events.

In SM8750, RUP and AUP updates for the CSID Full modules are split into
two registers along with a SET register. However, CSID Lite modules
still use a single register to update RUP and AUP without the additional
SET register. Handled such differences in the driver.

Co-developed-by: Atiya Kailany <atiya.kailany@oss.qualcomm.com>
Signed-off-by: Atiya Kailany <atiya.kailany@oss.qualcomm.com>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/Makefile         |   1 +
 drivers/media/platform/qcom/camss/camss-csid-980.c | 442 +++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss-csid.h     |   1 +
 drivers/media/platform/qcom/camss/camss.c          |  75 ++++
 4 files changed, 519 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/Makefile b/drivers/media/platform/qcom/camss/Makefile
index b114ca37e36e..c19d3183882a 100644
--- a/drivers/media/platform/qcom/camss/Makefile
+++ b/drivers/media/platform/qcom/camss/Makefile
@@ -8,6 +8,7 @@ qcom-camss-objs += \
 		camss-csid-4-7.o \
 		camss-csid-340.o \
 		camss-csid-680.o \
+		camss-csid-980.o \
 		camss-csid-gen2.o \
 		camss-csid-gen3.o \
 		camss-csid-gen4.o \
diff --git a/drivers/media/platform/qcom/camss/camss-csid-980.c b/drivers/media/platform/qcom/camss/camss-csid-980.c
new file mode 100644
index 000000000000..79eb063000b8
--- /dev/null
+++ b/drivers/media/platform/qcom/camss/camss-csid-980.c
@@ -0,0 +1,442 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * camss-csid-980.c
+ *
+ * Qualcomm MSM Camera Subsystem - CSID (CSI Decoder) Module
+ *
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+#include <linux/completion.h>
+#include <linux/delay.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/of.h>
+#include "camss.h"
+#include "camss-csid.h"
+#include "camss-csid-gen3.h"
+
+/* Reset and Command Registers */
+#define CSID_RST_CFG				0xC
+#define		RST_MODE				BIT(0)
+#define		RST_LOCATION				BIT(4)
+
+/* Reset and Command Registers */
+#define CSID_RST_CMD				0x10
+#define		SELECT_HW_RST				BIT(0)
+#define		SELECT_IRQ_RST				BIT(2)
+#define CSID_IRQ_CMD				0x14
+#define		IRQ_CMD_CLEAR				BIT(0)
+
+/* Register Update Commands, RUP/AUP */
+#define CSID_RUP_CMD				0x18
+#define CSID_AUP_CMD				0x1C
+#define		CSID_RUP_AUP_RDI(rdi)			(BIT(8) << (rdi))
+#define CSID_RUP_AUP_CMD			0x20
+#define		RUP_SET					BIT(0)
+#define		MUP					BIT(4)
+
+#define CSID_LITE_RUP_AUP_CMD			0x18
+#define		CSID_LITE_RUP_RDI(rdi)		(BIT(4) << (rdi))
+#define		CSID_LITE_AUP_RDI(rdi)		(BIT(20) << (rdi))
+
+/* Top level interrupt registers */
+#define CSID_TOP_IRQ_STATUS			(csid_is_lite(csid) ? 0x7C : 0x84)
+#define CSID_TOP_IRQ_MASK			(csid_is_lite(csid) ? 0x80 : 0x88)
+#define CSID_TOP_IRQ_CLEAR			(csid_is_lite(csid) ? 0x84 : 0x8C)
+#define CSID_TOP_IRQ_SET			(csid_is_lite(csid) ? 0x88 : 0x90)
+#define		INFO_RST_DONE				BIT(0)
+#define		CSI2_RX_IRQ_STATUS			BIT(2)
+#define		BUF_DONE_IRQ_STATUS			BIT(csid_is_lite(csid) ? 13 : 3)
+
+/* Buffer done interrupt registers */
+#define CSID_BUF_DONE_IRQ_STATUS		(csid_is_lite(csid) ? 0x8C : 0xA4)
+#define		BUF_DONE_IRQ_STATUS_RDI_OFFSET		(csid_is_lite(csid) ? 1 : 16)
+#define CSID_BUF_DONE_IRQ_MASK			(csid_is_lite(csid) ? 0x90 : 0xA8)
+#define CSID_BUF_DONE_IRQ_CLEAR			(csid_is_lite(csid) ? 0x94 : 0xAC)
+#define CSID_BUF_DONE_IRQ_SET			(csid_is_lite(csid) ? 0x98 : 0xB0)
+
+/* CSI2 RX interrupt registers */
+#define CSID_CSI2_RX_IRQ_STATUS			(csid_is_lite(csid) ? 0x9C : 0xB4)
+#define CSID_CSI2_RX_IRQ_MASK			(csid_is_lite(csid) ? 0xA0 : 0xB8)
+#define CSID_CSI2_RX_IRQ_CLEAR			(csid_is_lite(csid) ? 0xA4 : 0xBC)
+#define CSID_CSI2_RX_IRQ_SET			(csid_is_lite(csid) ? 0xA8 : 0xC0)
+
+/* CSI2 RX Configuration */
+#define CSID_CSI2_RX_CFG0			(csid_is_lite(csid) ? 0x200 : 0x400)
+#define		CSI2_RX_CFG0_NUM_ACTIVE_LANES		0
+#define		CSI2_RX_CFG0_DL0_INPUT_SEL		4
+#define		CSI2_RX_CFG0_PHY_NUM_SEL		20
+#define CSID_CSI2_RX_CFG1			(csid_is_lite(csid) ? 0x204 : 0x404)
+#define		CSI2_RX_CFG1_ECC_CORRECTION_EN		BIT(0)
+#define		CSI2_RX_CFG1_VC_MODE			BIT(2)
+
+#define MSM_CSID_MAX_SRC_STREAMS_980		(csid_is_lite(csid) ? 4 : 5)
+
+#define CSID_RDI_CFG0(rdi)                                  \
+	({                                                  \
+		__typeof__(rdi) _rdi = (rdi);               \
+		csid_is_lite(csid) ? 0x500 + 0x100 * _rdi : \
+				     0xE00 + 0x200 * _rdi;  \
+	})
+#define		RDI_CFG0_RETIME_BS			BIT(5)
+#define		RDI_CFG0_TIMESTAMP_EN			BIT(6)
+#define		RDI_CFG0_TIMESTAMP_STB_SEL		BIT(8)
+#define		RDI_CFG0_DECODE_FORMAT			12
+#define		RDI_CFG0_DT				16
+#define		RDI_CFG0_VC				22
+#define		RDI_CFG0_DT_ID				27
+#define		RDI_CFG0_EN				BIT(31)
+
+/* RDI Control and Configuration */
+#define CSID_RDI_CTRL(rdi)                                  \
+	({                                                  \
+		__typeof__(rdi) _rdi = (rdi);               \
+		csid_is_lite(csid) ? 0x504 + 0x100 * _rdi : \
+				     0xE04 + 0x200 * _rdi;  \
+	})
+#define		RDI_CTRL_START_CMD			BIT(0)
+
+#define CSID_RDI_CFG1(rdi)                                  \
+	({                                                  \
+		__typeof__(rdi) _rdi = (rdi);               \
+		csid_is_lite(csid) ? 0x510 + 0x100 * _rdi : \
+				     0xE10 + 0x200 * _rdi;  \
+	})
+#define		RDI_CFG1_DROP_H_EN			BIT(5)
+#define		RDI_CFG1_DROP_V_EN			BIT(6)
+#define		RDI_CFG1_CROP_H_EN			BIT(7)
+#define		RDI_CFG1_CROP_V_EN			BIT(8)
+#define		RDI_CFG1_PACKING_FORMAT_MIPI		BIT(15)
+
+/* RDI Pixel Store Configuration */
+#define CSID_RDI_PIX_STORE_CFG0(rdi)		(0xE14 + 0x200 * (rdi))
+#define		RDI_PIX_STORE_CFG0_EN			BIT(0)
+#define		RDI_PIX_STORE_CFG0_MIN_HBI		1
+
+/* RDI IRQ Status in wrapper */
+#define CSID_CSI2_RDIN_IRQ_STATUS(rdi) \
+	(csid_is_lite(csid) ? 0xEC : 0x114 + 0x10 * (rdi))
+#define CSID_CSI2_RDIN_IRQ_CLEAR(rdi) \
+	(csid_is_lite(csid) ? 0xF4 : 0x11C + 0x10 * (rdi))
+#define		INFO_RUP_DONE				BIT(23)
+
+static void __csid_full_aup_rup_trigger(struct csid_device *csid)
+{
+	/* trigger SET in combined register */
+	writel(RUP_SET, csid->base + CSID_RUP_AUP_CMD);
+}
+
+static void __csid_aup_update(struct csid_device *csid, int port_id)
+{
+	if (csid_is_lite(csid)) {
+		/* CSID Lites in v980 follow the legacy way of a combined RUP
+		 * and AUP commands without an explicit SET register.
+		 */
+		csid->reg_update |= CSID_LITE_AUP_RDI(port_id);
+		writel(csid->reg_update, csid->base + CSID_LITE_RUP_AUP_CMD);
+	} else {
+		csid->aup_update |= CSID_RUP_AUP_RDI(port_id);
+		writel(csid->aup_update, csid->base + CSID_AUP_CMD);
+
+		/* CSID Fulls in v980 split AUP and RUP commands, which requires
+		 * additional SET operation to make registers modification take
+		 * effect.
+		 */
+		__csid_full_aup_rup_trigger(csid);
+	}
+}
+
+static void __csid_rup_update(struct csid_device *csid, int port_id)
+{
+	if (csid_is_lite(csid)) {
+		/* CSID Lites in v980 follow the legacy way of a combined RUP
+		 * and AUP commands without an explicit SET register.
+		 */
+		csid->reg_update |= CSID_LITE_RUP_RDI(port_id);
+		writel(csid->reg_update, csid->base + CSID_LITE_RUP_AUP_CMD);
+	} else {
+		csid->rup_update |= CSID_RUP_AUP_RDI(port_id);
+		writel(csid->rup_update, csid->base + CSID_RUP_CMD);
+
+		/* CSID Fulls in v980 split AUP and RUP commands, which requires
+		 * additional SET operation to make registers modification take
+		 * effect.
+		 */
+		__csid_full_aup_rup_trigger(csid);
+	}
+}
+
+static void __csid_aup_rup_clear(struct csid_device *csid, int port_id)
+{
+	/* Hardware clears the registers upon consuming the settings */
+	if (csid_is_lite(csid)) {
+		csid->reg_update &= ~CSID_LITE_RUP_RDI(port_id);
+		csid->reg_update &= ~CSID_LITE_AUP_RDI(port_id);
+	} else {
+		csid->aup_update &= ~CSID_RUP_AUP_RDI(port_id);
+		csid->rup_update &= ~CSID_RUP_AUP_RDI(port_id);
+	}
+}
+
+static void __csid_configure_rx(struct csid_device *csid,
+				struct csid_phy_config *phy)
+{
+	int val;
+
+	val = (phy->lane_cnt - 1) << CSI2_RX_CFG0_NUM_ACTIVE_LANES;
+	val |= phy->lane_assign << CSI2_RX_CFG0_DL0_INPUT_SEL;
+	val |= (phy->csiphy_id + CSI2_RX_CFG0_PHY_SEL_BASE_IDX)
+	       << CSI2_RX_CFG0_PHY_NUM_SEL;
+	writel(val, csid->base + CSID_CSI2_RX_CFG0);
+
+	val = CSI2_RX_CFG1_ECC_CORRECTION_EN;
+	writel(val, csid->base + CSID_CSI2_RX_CFG1);
+}
+
+static void __csid_configure_rx_vc(struct csid_device *csid, int vc)
+{
+	int val;
+
+	if (vc > 3) {
+		val = readl(csid->base + CSID_CSI2_RX_CFG1);
+		val |= CSI2_RX_CFG1_VC_MODE;
+		writel(val, csid->base + CSID_CSI2_RX_CFG1);
+	}
+}
+
+static void __csid_ctrl_rdi(struct csid_device *csid, int enable, u8 rdi)
+{
+	int val = 0;
+	u32 rdi_ctrl_offset = CSID_RDI_CTRL(rdi);
+
+	if (enable)
+		val = RDI_CTRL_START_CMD;
+
+	writel(val, csid->base + rdi_ctrl_offset);
+}
+
+static void __csid_configure_rdi_pix_store(struct csid_device *csid, u8 rdi)
+{
+	u32 val;
+
+	/*
+	 * Configure pixel store to allow absorption of hblanking or idle time.
+	 * This helps with horizontal crop and prevents line buffer conflicts.
+	 * Reset state is 0x8 which has MIN_HBI=4, we keep the default MIN_HBI
+	 * and just enable the pixel store functionality.
+	 */
+	val = (4 << RDI_PIX_STORE_CFG0_MIN_HBI) | RDI_PIX_STORE_CFG0_EN;
+	writel(val, csid->base + CSID_RDI_PIX_STORE_CFG0(rdi));
+}
+
+static void __csid_configure_rdi_stream(struct csid_device *csid, u8 enable, u8 port, u8 vc)
+{
+	u32 val;
+	u8 lane_cnt = csid->phy.lane_cnt;
+
+	/* Source pads matching RDI channels on hardware.
+	 * E.g. Pad 1 -> RDI0, Pad 2 -> RDI1, etc.
+	 */
+	struct v4l2_mbus_framefmt *input_format = &csid->fmt[MSM_CSID_PAD_FIRST_SRC + port];
+	const struct csid_format_info *format = csid_get_fmt_entry(csid->res->formats->formats,
+								   csid->res->formats->nformats,
+								   input_format->code);
+
+	if (!lane_cnt)
+		lane_cnt = 4;
+
+	/*
+	 * DT_ID is a two bit bitfield that is concatenated with
+	 * the four least significant bits of the five bit VC
+	 * bitfield to generate an internal CID value.
+	 *
+	 * CSID_RDI_CFG0(vc)
+	 * DT_ID : 28:27
+	 * VC    : 26:22
+	 * DT    : 21:16
+	 *
+	 * CID   : VC 3:0 << 2 | DT_ID 1:0
+	 */
+	u8 dt_id = vc & 0x03;
+	u32 rdi_cfg0_offset = CSID_RDI_CFG0(port);
+	u32 rdi_cfg1_offset = CSID_RDI_CFG1(port);
+	u32 rdi_ctrl_offset = CSID_RDI_CTRL(port);
+
+	val = RDI_CFG0_TIMESTAMP_EN;
+	val |= RDI_CFG0_TIMESTAMP_STB_SEL;
+	val |= RDI_CFG0_RETIME_BS;
+
+	/* note: for non-RDI path, this should be format->decode_format */
+	val |= DECODE_FORMAT_PAYLOAD_ONLY << RDI_CFG0_DECODE_FORMAT;
+	val |= vc << RDI_CFG0_VC;
+	val |= format->data_type << RDI_CFG0_DT;
+	val |= dt_id << RDI_CFG0_DT_ID;
+	writel(val, csid->base + rdi_cfg0_offset);
+
+	val = RDI_CFG1_PACKING_FORMAT_MIPI;
+	writel(val, csid->base + rdi_cfg1_offset);
+
+	/* Configure pixel store using dedicated register in 980 */
+	if (!csid_is_lite(csid))
+		__csid_configure_rdi_pix_store(csid, port);
+
+	val = 0;
+	writel(val, csid->base + rdi_ctrl_offset);
+
+	val = readl(csid->base + rdi_cfg0_offset);
+
+	if (enable)
+		val |= RDI_CFG0_EN;
+
+	writel(val, csid->base + rdi_cfg0_offset);
+}
+
+static void csid_configure_stream(struct csid_device *csid, u8 enable)
+{
+	u8 i, k;
+
+	__csid_configure_rx(csid, &csid->phy);
+
+	for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS_980; i++) {
+		if (csid->phy.en_vc & BIT(i)) {
+			__csid_configure_rdi_stream(csid, enable, i, 0);
+			__csid_configure_rx_vc(csid, 0);
+
+			for (k = 0; k < CAMSS_INIT_BUF_COUNT; k++) {
+				__csid_aup_update(csid, i);
+				__csid_rup_update(csid, i);
+			}
+
+			__csid_ctrl_rdi(csid, enable, i);
+		}
+	}
+}
+
+static int csid_configure_testgen_pattern(struct csid_device *csid, s32 val)
+{
+	return 0;
+}
+
+static void csid_subdev_reg_update(struct csid_device *csid, int port_id,
+				   bool clear)
+{
+	if (clear)
+		__csid_aup_rup_clear(csid, port_id);
+	else
+		__csid_aup_update(csid, port_id);
+}
+
+/**
+ * csid_isr - CSID module interrupt service routine
+ * @irq: Interrupt line
+ * @dev: CSID device
+ *
+ * Return IRQ_HANDLED on success
+ */
+static irqreturn_t csid_isr(int irq, void *dev)
+{
+	struct csid_device *csid = dev;
+	u32 val, buf_done_val;
+	u8 reset_done;
+	int i;
+
+	val = readl(csid->base + CSID_TOP_IRQ_STATUS);
+	writel(val, csid->base + CSID_TOP_IRQ_CLEAR);
+
+	reset_done = val & INFO_RST_DONE;
+
+	buf_done_val = readl(csid->base + CSID_BUF_DONE_IRQ_STATUS);
+	writel(buf_done_val, csid->base + CSID_BUF_DONE_IRQ_CLEAR);
+
+	for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS_980; i++) {
+		if (csid->phy.en_vc & BIT(i)) {
+			val = readl(csid->base + CSID_CSI2_RDIN_IRQ_STATUS(i));
+			writel(val, csid->base + CSID_CSI2_RDIN_IRQ_CLEAR(i));
+
+			if (val & INFO_RUP_DONE)
+				csid_subdev_reg_update(csid, i, true);
+
+			if (buf_done_val & BIT(BUF_DONE_IRQ_STATUS_RDI_OFFSET + i))
+				camss_buf_done(csid->camss, csid->id, i);
+		}
+	}
+
+	val = IRQ_CMD_CLEAR;
+	writel(val, csid->base + CSID_IRQ_CMD);
+
+	if (reset_done)
+		complete(&csid->reset_complete);
+
+	return IRQ_HANDLED;
+}
+
+/**
+ * csid_reset - Trigger reset on CSID module and wait to complete
+ * @csid: CSID device
+ *
+ * Return 0 on success or a negative error code otherwise
+ */
+static int csid_reset(struct csid_device *csid)
+{
+	unsigned long time;
+	u32 val;
+	int i;
+
+	reinit_completion(&csid->reset_complete);
+
+	val = INFO_RST_DONE | BUF_DONE_IRQ_STATUS;
+	writel(val, csid->base + CSID_TOP_IRQ_CLEAR);
+	writel(val, csid->base + CSID_TOP_IRQ_MASK);
+
+	val = 0;
+	for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS_980; i++) {
+		if (csid->phy.en_vc & BIT(i)) {
+			/*
+			 * Only need to clear buf done IRQ status here,
+			 * RUP done IRQ status will be cleared once isr
+			 * strobe generated by CSID_RST_CMD
+			 */
+			val |= BIT(BUF_DONE_IRQ_STATUS_RDI_OFFSET + i);
+		}
+	}
+	writel(val, csid->base + CSID_BUF_DONE_IRQ_CLEAR);
+	writel(val, csid->base + CSID_BUF_DONE_IRQ_MASK);
+
+	/* Clear all IRQ status with CLEAR bits set */
+	val = IRQ_CMD_CLEAR;
+	writel(val, csid->base + CSID_IRQ_CMD);
+
+	val = RST_LOCATION | RST_MODE;
+	writel(val, csid->base + CSID_RST_CFG);
+
+	val = SELECT_HW_RST | SELECT_IRQ_RST;
+	writel(val, csid->base + CSID_RST_CMD);
+
+	time = wait_for_completion_timeout(&csid->reset_complete,
+					   msecs_to_jiffies(CSID_RESET_TIMEOUT_MS));
+
+	if (!time) {
+		dev_err(csid->camss->dev, "CSID reset timeout\n");
+		return -ETIMEDOUT;
+	}
+
+	return 0;
+}
+
+static void csid_subdev_init(struct csid_device *csid)
+{
+	csid->testgen.nmodes = CSID_PAYLOAD_MODE_DISABLED;
+}
+
+const struct csid_hw_ops csid_ops_980 = {
+	.configure_stream = csid_configure_stream,
+	.configure_testgen_pattern = csid_configure_testgen_pattern,
+	.hw_version = csid_hw_version,
+	.isr = csid_isr,
+	.reset = csid_reset,
+	.src_pad_code = csid_src_pad_code,
+	.subdev_init = csid_subdev_init,
+	.reg_update = csid_subdev_reg_update,
+};
+
diff --git a/drivers/media/platform/qcom/camss/camss-csid.h b/drivers/media/platform/qcom/camss/camss-csid.h
index 4f31ad303c4e..8edf3548d692 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.h
+++ b/drivers/media/platform/qcom/camss/camss-csid.h
@@ -222,6 +222,7 @@ extern const struct csid_hw_ops csid_ops_4_1;
 extern const struct csid_hw_ops csid_ops_4_7;
 extern const struct csid_hw_ops csid_ops_340;
 extern const struct csid_hw_ops csid_ops_680;
+extern const struct csid_hw_ops csid_ops_980;
 extern const struct csid_hw_ops csid_ops_gen2;
 extern const struct csid_hw_ops csid_ops_gen3;
 extern const struct csid_hw_ops csid_ops_gen4;
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index d68d5debe6d6..ce1a9bbff203 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -4656,6 +4656,79 @@ static const struct camss_subdev_resources csiphy_res_8750[] = {
 	},
 };
 
+static const struct camss_subdev_resources csid_res_8750[] = {
+	/* CSID0 */
+	{
+		.clock = { "csid", "csid_csiphy_rx" },
+		.clock_rate = { { 400000000, 480000000 },
+				{ 400000000, 480000000 } },
+		.reg = { "csid0" },
+		.interrupt = { "csid0" },
+		.csid = {
+			.is_lite = false,
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.hw_ops = &csid_ops_980,
+			.formats = &csid_formats_gen2
+		}
+	},
+	/* CSID1 */
+	{
+		.clock = { "csid", "csid_csiphy_rx" },
+		.clock_rate = { { 400000000, 480000000 },
+				{ 400000000, 480000000 } },
+		.reg = { "csid1" },
+		.interrupt = { "csid1" },
+		.csid = {
+			.is_lite = false,
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.hw_ops = &csid_ops_980,
+			.formats = &csid_formats_gen2
+		}
+	},
+	/* CSID2 */
+	{
+		.clock = { "csid", "csid_csiphy_rx" },
+		.clock_rate = { { 400000000, 480000000 },
+				{ 400000000, 480000000 } },
+		.reg = { "csid2" },
+		.interrupt = { "csid2" },
+		.csid = {
+			.is_lite = false,
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.hw_ops = &csid_ops_980,
+			.formats = &csid_formats_gen2
+		}
+	},
+	/* CSID_LITE0 */
+	{
+		.clock = { "vfe_lite_csid", "vfe_lite_cphy_rx" },
+		.clock_rate = { { 400000000, 480000000 },
+				{ 400000000, 480000000 } },
+		.reg = { "csid_lite0" },
+		.interrupt = { "csid_lite0" },
+		.csid = {
+			.is_lite = true,
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.hw_ops = &csid_ops_980,
+			.formats = &csid_formats_gen2
+		}
+	},
+	/* CSID_LITE1 */
+	{
+		.clock = { "vfe_lite_csid", "vfe_lite_cphy_rx" },
+		.clock_rate = { { 400000000, 480000000 },
+				{ 400000000, 480000000 } },
+		.reg = { "csid_lite1" },
+		.interrupt = { "csid_lite1" },
+		.csid = {
+			.is_lite = true,
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.hw_ops = &csid_ops_980,
+			.formats = &csid_formats_gen2
+		}
+	}
+};
+
 static const struct resources_icc icc_res_sm8750[] = {
 	{
 		.name = "ahb",
@@ -6223,8 +6296,10 @@ static const struct camss_resources sm8750_resources = {
 	.version = CAMSS_8750,
 	.pd_name = "top",
 	.csiphy_res = csiphy_res_8750,
+	.csid_res = csid_res_8750,
 	.icc_res = icc_res_sm8750,
 	.csiphy_num = ARRAY_SIZE(csiphy_res_8750),
+	.csid_num = ARRAY_SIZE(csid_res_8750),
 	.icc_path_num = ARRAY_SIZE(icc_res_sm8750),
 };
 

-- 
2.34.1


