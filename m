Return-Path: <linux-arm-msm+bounces-106617-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OPa/DCqy/WmlhgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106617-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 11:51:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C5E9A4F47B9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 11:51:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 333E2301AA7A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 May 2026 09:51:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70BB53CE495;
	Fri,  8 May 2026 09:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PLnsCxw7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NbBYMCh3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A43CE3C9ED6
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 May 2026 09:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778233880; cv=none; b=OX6mbvLFvAFdNmARmo1pPD1FvXUE/9XjjA6fPvSFqIHa4izxbFu7CpeNBC/usq5ITiXgoCyc3E+S+kRZ+uIBVviBiiMq1kE2Tec+z3thkg7+B1Syl2ErKOrzHfqfCDEGS3jzkO95NofRkPJYty0k+LBmqiD1tp40yLBSexcn+zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778233880; c=relaxed/simple;
	bh=qKzjMJqkdl0UrZ1tsHcMhHcQFeJyK74aki59dbalElM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uPS1gIAsJxwD1gbKr6OKAZEdWoq5rqo1I/1zgYwoBpayw0fusXuwxaePvvJHu7WDWmpKHzmRbbBpbWDREiKiNq0ari7pMZcpQXYfv64YMJVQppQZgOnSq1uqF80QqzFJkcwM+OVf4GzVSi5CSnRAC0V2XXXfOi2l6xogctm2+LA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PLnsCxw7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NbBYMCh3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6489iHt92770840
	for <linux-arm-msm@vger.kernel.org>; Fri, 8 May 2026 09:51:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	e2oupfZMutQOqFk2sEilpEuCB8it3QEHPnT9FmkvAO0=; b=PLnsCxw7cHHt3ftJ
	MTV54WNdyXsOtn+Nkrm6g5WslUjJYrdb1FbSZ8Ccd81ZDHmDH8mml3OyW0C/jK6k
	FFj4KJTMv6BebHRG7vWY3M0nGvAxixGjrbX/PdT6qLtZtNjuSuIKc7cKYK0PiLsk
	2fbpIKge0lbRser9jaw8fripEJjbSckzsh9I9Sgb8QmBCaXfZJj46ERoQ2k/rgUc
	UG2YBE1083KbdufYPFB8q86VJv4Txd2Vgo23hN75iumvsEGUqCMaI4oZQVFrJyVA
	aDuy7E7x/QmpNQ9jdqG5dnGKctjx3u0zGGRqzrsKp5kek9jpvBFjsodnLjs/vAGg
	XdRtmA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0yt5k3n7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 09:51:15 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2eebb099efbso5993537eec.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 02:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778233874; x=1778838674; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e2oupfZMutQOqFk2sEilpEuCB8it3QEHPnT9FmkvAO0=;
        b=NbBYMCh3gmcB1oJRpk0zmE7iRj+d57u6z+lIyb7iXRz64L212CftIEVDm5OFrdOm9e
         P6RqVHyQ3NFppF84/XV5tB/MkoFS1k6Dc1zQUcB8s5dwNBXbR2He8wsJc19Z6OFguIdO
         WaPPjXJ4mk+5IUE323wIUNx3hYwuKQQcii4CUJYAU34OeBCr1U74EdejcVd/L8D+EqLG
         moy89nvhmr+pfZApsO63L+BrkooFp0jKYmnNXcmpxqI/1tkzvjDni1wRFGFxiyBPgJFw
         gWynkolPIjY1pgQ5YIwpCB0bgvRqWbyXY/B3FqqD84r2crU2J9cjvOxWZH39VD7+qY1P
         vg5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778233874; x=1778838674;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=e2oupfZMutQOqFk2sEilpEuCB8it3QEHPnT9FmkvAO0=;
        b=C+zsBsrRSJANGczhYOqtqUsC9Mv0ybGAFusUF/GNJ26iDeBkKBlJoA6QFGiDtpJ3tz
         fHc9evgEJGR+3NJ9RXyrHC6DWy0m8WNbA/wHP07auAJ2aPraSPbhF1J4jJsWugBLGkdx
         kN6s1An6VzM2h5b6iTaqbrBxWBxyHD9E1u9nMmPudZTGIMJDF7P4gZEbs6Uc7Y5mC912
         f81S/eAcMfB0r5BWQPmopUv1JqA0ILTA75ZE86w7WJsqyssrgQ5JviM/Ed/44+Yolc6b
         WPpUoEVe6tqW10Y5OuNCtYAhO/FSvshSwnRFHQ+m5qStZAcumi8VafNF8brgit8Iwpma
         dcMg==
X-Forwarded-Encrypted: i=1; AFNElJ/jqnDLQOSWRppSGS1sMPxv0nbbVUz9fGHZvopaBxFfkXZiLp934eLHf4D30v71g4piNkjZoFzkZmrHrO+Z@vger.kernel.org
X-Gm-Message-State: AOJu0YybhVV0APlgopKcDTjjQnSRyzc5+iTUwIT6/exHcP+UIlVR2Bx9
	RAuELixLeuxsmClBYuia/RpMSlPJSR0pe+XpiIgxvZsYm1G6gnKtpMV9lDBoByRV7+v9XNHwamm
	ICUW754Tr0SDd7Zo/aULGyyZcrOphWHmROj47F/DhfLcTne9yqvsbRt70N/jpzhtVuHYt
X-Gm-Gg: Acq92OG7ZBGXGF4Do4j8orhe4Fjm2iNBJ3Z1F0XpSnrzYXbdrFBgo2fQ4Tk9WCzL8Jz
	GZCFu09WV0EMX8r7FR9z92axVbZqMau6a0euu0KABxcwmZ07fmxFf9tCTSzaOUgzjF+JaNIoYPw
	tVrE4YXTQsBx3Q3plNqbZS2FkeNxzka74tC4EvmeJncjk5Auk8+Un7/E3noa4yA6+RFVxQESmtf
	8Xcu4ii4NfkEu1ilqTZrvxnATkUfbm7wY+oik1rEoQ/ag8U3K4NGG15MNrJgLvkBmvG33mzRAN9
	N44ImstGipzIBbzKFgy1Jopqw+k3pqaQsvVBCzxPcOZG7x+fbObOZuCVx9j/QavpsjwX5E/TDCv
	VAzFRmuCkO9brZdRpBA8NdTgKXct6UtFqBND9upCsYXh/aOGwvpIIoHS1VzKBHiAFSZ0wnTbuGw
	qt
X-Received: by 2002:a05:7300:a987:b0:2dd:c066:bf7 with SMTP id 5a478bee46e88-2f54b360d4emr5595921eec.11.1778233874255;
        Fri, 08 May 2026 02:51:14 -0700 (PDT)
X-Received: by 2002:a05:7300:a987:b0:2dd:c066:bf7 with SMTP id 5a478bee46e88-2f54b360d4emr5595907eec.11.1778233873698;
        Fri, 08 May 2026 02:51:13 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f88847502fsm1739323eec.14.2026.05.08.02.51.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 02:51:13 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Fri, 08 May 2026 02:51:05 -0700
Subject: [PATCH v3 3/5] media: qcom: camss: csiphy: Add support for v2.3.0
 two-phase CSIPHY
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260508-add-support-for-camss-on-sm8750-v3-3-fc6861a65c67@oss.qualcomm.com>
References: <20260508-add-support-for-camss-on-sm8750-v3-0-fc6861a65c67@oss.qualcomm.com>
In-Reply-To: <20260508-add-support-for-camss-on-sm8750-v3-0-fc6861a65c67@oss.qualcomm.com>
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=Dc0nbPtW c=1 sm=1 tr=0 ts=69fdb213 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=UiSUrLz6K6kVaq6zp58A:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: bVRHlcixKC6CstIuVoRtxNVOYbMh25DC
X-Proofpoint-ORIG-GUID: bVRHlcixKC6CstIuVoRtxNVOYbMh25DC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDEwMSBTYWx0ZWRfX15VHhIh51YJE
 PCgyXPvm70Auo7q/dsOe2UFBajcn9aWvQWhuNkgOqGWExo0K48ZyKFw+6Yl7ajezO7lHmUg/rr+
 DbQbnStJ4VtpjEPDnf7wfEfwmPpSmclbY6398wOp7YSgVhAVjpQqmHMQ6CdEZInr27u5g7iXmsw
 Mfh38DGeaoJtbwXHzyRVoVTHyk3Y5/W3P1EeSsB0HpFkugOCLiJe4u3qTeW9v11HoPK0JpBhnwf
 ncmmYVnS5jEHK4PmL7jw1RtOvcH86YvBafDpIf+AqIaZiXobJhofRgj+6lwdQ1Qm/MvoLYL3xQ/
 1To3XJ+ZBh28Z4RMd8MB/rEDStknWaMyBSxkl++PiFDOjKvyOe/vbBQ0zcCxMfJtUCzoFGDdO72
 uwPxUAPoH8chk6Dsq2EfjzsDzoHR+68N8yOHgFRw3SzXlqAKTLRTC9fvEqvyxyZlOYO1+SktPE9
 1Q1HQSAmd2bvTqwPr0w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080101
X-Rspamd-Queue-Id: C5E9A4F47B9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106617-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hangxiang.ma@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Add more detailed resource information for CSIPHY devices in the camss
driver along with the support for v2.3.0 in the 2 phase CSIPHY driver
that is responsible for the PHY lane register configuration, module
reset and interrupt handling.

Additionally, generalize the struct name for the lane configuration that
had been added for Kaanapali and use it for SM8750 as well as they share
the settings.

Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     |   5 +-
 drivers/media/platform/qcom/camss/camss.c          | 125 +++++++++++++++++++++
 2 files changed, 129 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
index c51ffcd93ce1..5b633786314a 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
@@ -684,7 +684,7 @@ csiphy_lane_regs lane_regs_sm8650[] = {
 	{0x0c10, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
 };
 
-/* 3nm 2PH v 2.4.0 2p5Gbps 4 lane DPHY mode */
+/* 3nm 2PH v 2.3.0/2.4.0 2p5Gbps 4 lane DPHY mode */
 static const struct
 csiphy_lane_regs lane_regs_2_4_0[] = {
 	/* LN 0 */
@@ -1135,6 +1135,7 @@ static bool csiphy_is_gen2(u32 version)
 	case CAMSS_845:
 	case CAMSS_8550:
 	case CAMSS_8650:
+	case CAMSS_8750:
 	case CAMSS_8775P:
 	case CAMSS_KAANAPALI:
 	case CAMSS_X1E80100:
@@ -1252,7 +1253,9 @@ static int csiphy_init(struct csiphy_device *csiphy)
 		regs->lane_regs = &lane_regs_sa8775p[0];
 		regs->lane_array_size = ARRAY_SIZE(lane_regs_sa8775p);
 		break;
+	case CAMSS_8750:
 	case CAMSS_KAANAPALI:
+		/* CSPHY v2.4.0 is backward compatible with v2.3.0 settings */
 		regs->lane_regs = &lane_regs_2_4_0[0];
 		regs->lane_array_size = ARRAY_SIZE(lane_regs_2_4_0);
 		regs->offset = 0x1000;
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 3cebce812c58..6b7c3160e285 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -4238,6 +4238,129 @@ static const struct resources_icc icc_res_sa8775p[] = {
 	},
 };
 
+static const struct camss_subdev_resources csiphy_res_8750[] = {
+	/* CSIPHY0 */
+	{
+		.regulators = {
+			{ .supply = "vdd-csiphy0-0p9", .init_load_uA = 148000 },
+			{ .supply = "vdd-csiphy0-1p2", .init_load_uA = 14660 }
+		},
+		.clock = { "csiphy0", "csiphy0_timer",
+			   "cpas_ahb", "cpas_fast_ahb" },
+		.clock_rate = { { 400000000, 480000000 },
+				{ 400000000 },
+				{ 0 },
+				{ 0 } },
+		.reg = { "csiphy0" },
+		.interrupt = { "csiphy0" },
+		.csiphy = {
+			.id = 0,
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
+		}
+	},
+	/* CSIPHY1 */
+	{
+		.regulators = {
+			{ .supply = "vdd-csiphy1-0p9", .init_load_uA = 148000 },
+			{ .supply = "vdd-csiphy1-1p2", .init_load_uA = 14660 }
+		},
+		.clock = { "csiphy1", "csiphy1_timer",
+			   "cpas_ahb", "cpas_fast_ahb" },
+		.clock_rate = { { 400000000, 480000000 },
+				{ 400000000 },
+				{ 0 },
+				{ 0 } },
+		.reg = { "csiphy1" },
+		.interrupt = { "csiphy1" },
+		.csiphy = {
+			.id = 1,
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
+		}
+	},
+	/* CSIPHY2 */
+	{
+		.regulators = {
+			{ .supply = "vdd-csiphy2-0p9", .init_load_uA = 148000 },
+			{ .supply = "vdd-csiphy2-1p2", .init_load_uA = 14660 }
+		},
+		.clock = { "csiphy2", "csiphy2_timer",
+			   "cpas_ahb", "cpas_fast_ahb" },
+		.clock_rate = { { 400000000, 480000000 },
+				{ 400000000 },
+				{ 0 },
+				{ 0 } },
+		.reg = { "csiphy2" },
+		.interrupt = { "csiphy2" },
+		.csiphy = {
+			.id = 2,
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
+		}
+	},
+	/* CSIPHY3 */
+	{
+		.regulators = {
+			{ .supply = "vdd-csiphy3-0p9", .init_load_uA = 148000 },
+			{ .supply = "vdd-csiphy3-1p2", .init_load_uA = 14660 }
+		},
+		.clock = { "csiphy3", "csiphy3_timer",
+			   "cpas_ahb", "cpas_fast_ahb" },
+		.clock_rate = { { 400000000, 480000000 },
+				{ 400000000 },
+				{ 0 },
+				{ 0 } },
+		.reg = { "csiphy3" },
+		.interrupt = { "csiphy3" },
+		.csiphy = {
+			.id = 3,
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
+		}
+	},
+	/* CSIPHY4 */
+	{
+		.regulators = {
+			{ .supply = "vdd-csiphy4-0p9", .init_load_uA = 148000 },
+			{ .supply = "vdd-csiphy4-1p2", .init_load_uA = 14660 }
+		},
+		.clock = { "csiphy4", "csiphy4_timer",
+			   "cpas_ahb", "cpas_fast_ahb" },
+		.clock_rate = { { 400000000, 480000000 },
+				{ 400000000 },
+				{ 0 },
+				{ 0 } },
+		.reg = { "csiphy4" },
+		.interrupt = { "csiphy4" },
+		.csiphy = {
+			.id = 4,
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
+		}
+	},
+	/* CSIPHY5 */
+	{
+		.regulators = {
+			{ .supply = "vdd-csiphy5-0p9", .init_load_uA = 148000 },
+			{ .supply = "vdd-csiphy5-1p2", .init_load_uA = 14660 }
+		},
+		.clock = { "csiphy5", "csiphy5_timer",
+			   "cpas_ahb", "cpas_fast_ahb" },
+		.clock_rate = { { 400000000, 480000000 },
+				{ 400000000 },
+				{ 0 },
+				{ 0 } },
+		.reg = { "csiphy5" },
+		.interrupt = { "csiphy5" },
+		.csiphy = {
+			.id = 5,
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
+		}
+	},
+};
+
 static const struct resources_icc icc_res_sm8750[] = {
 	{
 		.name = "ahb",
@@ -5677,7 +5800,9 @@ static const struct camss_resources sm8650_resources = {
 static const struct camss_resources sm8750_resources = {
 	.version = CAMSS_8750,
 	.pd_name = "top",
+	.csiphy_res = csiphy_res_8750,
 	.icc_res = icc_res_sm8750,
+	.csiphy_num = ARRAY_SIZE(csiphy_res_8750),
 	.icc_path_num = ARRAY_SIZE(icc_res_sm8750),
 };
 

-- 
2.34.1


