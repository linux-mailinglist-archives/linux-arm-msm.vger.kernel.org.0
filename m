Return-Path: <linux-arm-msm+bounces-97400-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2NKtBg7ks2ktcQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97400-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 11:16:46 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CAED02814AC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 11:16:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 260AE30DBE2B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 10:13:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAF4738D01D;
	Fri, 13 Mar 2026 10:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Rnd8HU80";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I7rvnj4Z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4150438CFF5
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 10:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773396805; cv=none; b=tgaUC9jbit2UFoZQCY014/nugW8XPRBmYgSrL+Cc7vZoCJuXWyhAJ4R6yp3J+wsrAZI7ZkvLZNsFO6mXFDZjQHR0Pj+O4wPhP55JcwZK8qZEt5yyqYiDHOjT5pOkmkN9eRidnm/NlW05MiXLbb5vzjl6Lj/wqk4eZI5OvJ6YD0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773396805; c=relaxed/simple;
	bh=anyIl7JW1qtiEL1WoOIsNogvxHhYznhRkaffZ+QRC/o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=T+55zKOwiuG/zoUEVtX4fl4y9YEMa/gUsCu5S+clROm9TPvLcppgBKaU+YZzIuhB7FbsPqBof94vybNc0OoSTj2SrxgZgimSPHZ1uB580jNT8DRnVT5aYzfCGB5ElP22gUDS9R50JWG2J1fBh+fbguweH8paqr7UR2Wcmr5gGps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Rnd8HU80; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I7rvnj4Z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D5tet53342528
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 10:13:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tDffoMh//Gh72VNAEm4CRmzs2FIVOAjsHJQepgif8II=; b=Rnd8HU80sKmAdjro
	IIWZ5d99C19CTOx9vuMwabFnfXSw5PcA7ZvuCcdl5+wHqtJUrZPFwuuXk2959lVC
	YHSVqQDR0fJTmk9ET3XRdLQJE1vAUXKefaJ6PgL0QpMmVMYJ/9jQD+64F7t6Xzsx
	E+/kKLJ6vha7lxyPv/mrLg2kgnGFLQl8+riowCZdVUexCWTG8OldIsqLzcyXIBr1
	HhwO+HqIlQpcjpaAH3idycqDXVvHUCHVW6KrpALXW+w7xJpPAJO8FSUY33RsRnK/
	4cimHgkQt4Kgwp90uyq99zgmX6JLb3tQBV+tAmPMgsnyyerRFcPrTUIa5gyOIgoP
	0MtBlw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cus9w4bfg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 10:13:22 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-509044f54aaso147265831cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 03:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773396801; x=1774001601; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tDffoMh//Gh72VNAEm4CRmzs2FIVOAjsHJQepgif8II=;
        b=I7rvnj4ZLh6U7+WmUwHsZaYOSCDWoA0df2oIKwtD6awWsflKoJNZH+j9WwgqtAJDs0
         dw1ZhDn7jWseyR/9+wSzLEUpAVLEACB/SHcfYzX+WGItIDqz06WyXtDbBPpveB84/wmF
         CSbu6MA58EOZ/Gv6071qtnuqZAiz9CUgP0qN8J3pXpFme+BvfPfCOVgtQjlCVX5PxAYl
         IM6zoSVaJLESasgf+wcyM0WLiSyBaRW5043EougPLY7onQ0TfacVDx6BWo1itgg3MxVX
         bdslbZ42XoQOGsyomTEEBeSWD3cM/ssbQujqmwIf2hZVKrW4MVKibpf/te2Meqh4GPui
         ZPXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773396801; x=1774001601;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tDffoMh//Gh72VNAEm4CRmzs2FIVOAjsHJQepgif8II=;
        b=sMbRIfRMXT6eNM5ZzIHhLv7i/dxYW4faxwWl45lwJOu7WK9bL8vyWRlsLwm3gBVLRo
         1lQ5wk6vMZqXCks/2DqkKnC8EVl7hgUsxGohRoMQ5uVlEfa7ZHFncuh7fQkoj/iNPcZl
         YQcv886C7JJe/pN2ZXBK49S8WS5ontZnu4NWufPZ1K2tQ5s8+bwLRLEG7D20EWjmsgGs
         lU7vD85PYixYhRiEV9QpHI9l50MzMSIO3Xku8Acjboz/nic8DEkKyu8FtHRfd/vJdcAn
         JZVWDC8tMdLvo6jkERxyxkGGnNsnrzmsKhgGdj3hfw8bwZZZHFRJa/2tgWaFwdemb1bj
         nKRQ==
X-Forwarded-Encrypted: i=1; AJvYcCWZr7g1c/8D2Ez6cxREKVw0bXUenx51uHf483RKEJdAqLt0p9k3uu+JRSJuYqQnvEDz1AKnbpZw3ACui2O4@vger.kernel.org
X-Gm-Message-State: AOJu0YxRKn4TkZfZH72loRYVvYogSVm52mqyZpg74Ghphjly1RvzT2XE
	izaguI8nGcH2Ag12nmnx98U1izv6xBPcxQZRdA8znt4jEw5+XEx+iXKA/fDHdeHV3Jmx16vp2Jn
	aLg9Xzv2VajwUrYFukWfL2N7OkrpYMnyBxDSU5d8s4o0kb6SsDn02Vka1BHxlLT7aFgKw
X-Gm-Gg: ATEYQzwuV9HitO3kZrpAxFeGwxf4EkKsdE6tyHubgrGpOfc8Pv4cWww4q5UExo4y9Ed
	opxLQZmM1bn6Xtec6XvcTaiy8b8bmZjg8j6fppQcWVwfeC9mVwdHqV5UkIzJLe3PTXZeFqpQdQy
	Vhla2U+ZaeARM7Ev7rwfrYJ5zqD9UGzDuOZZzyy9MfmrjJrxYVepCmtkoxIf7nXIsx/bUmWBFh9
	U6q0Xce/n9ctFsYu5tAsDwbtNfdvFUJLWRS18CTG0RgpeaGvyQEl4bQnPqNqGvRTs7SFPk9pReF
	Hucf0bT9I/gnsHyfdYqgr2Nvt+njzuEFOeEDFj71dox6gflkB5XB4Fa9vKaBC3maTIPiXQhtaA8
	JCOLrmTg+DYgX/a3F8wUE8IxpgoBh4gFPD9y1rqTW0DRxeN7DueQMfdzrGb0PPypgjCjLsoAQKl
	LILppFhAZuvApT
X-Received: by 2002:ac8:588d:0:b0:509:1f91:dc2a with SMTP id d75a77b69052e-50957e22bc6mr32318051cf.36.1773396801548;
        Fri, 13 Mar 2026 03:13:21 -0700 (PDT)
X-Received: by 2002:ac8:588d:0:b0:509:1f91:dc2a with SMTP id d75a77b69052e-50957e22bc6mr32317611cf.36.1773396801091;
        Fri, 13 Mar 2026 03:13:21 -0700 (PDT)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89a65bd5274sm53628846d6.3.2026.03.13.03.13.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 03:13:20 -0700 (PDT)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Fri, 13 Mar 2026 18:13:03 +0800
Subject: [PATCH v2 2/3] media: qcom: camss: Fix csid clock configuration
 for sa8775p
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260313-vfelite_fix-v2-2-7014429c8345@oss.qualcomm.com>
References: <20260313-vfelite_fix-v2-0-7014429c8345@oss.qualcomm.com>
In-Reply-To: <20260313-vfelite_fix-v2-0-7014429c8345@oss.qualcomm.com>
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Vikram Sharma <quic_vikramsa@quicinc.com>,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Wenmeng Liu <quic_wenmliu@quicinc.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773396787; l=3710;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=anyIl7JW1qtiEL1WoOIsNogvxHhYznhRkaffZ+QRC/o=;
 b=tEIZ0Qg+sH5ZUQ+cYRVxAVpBNNZ/LQpyK/TSr6Bh2ixMXyB/qhQFQFSFf2FH5xqOjGYL4BJJB
 taZcZ7PRn7aC8RRkBVIEoEu7BU1dA0QCtPo4Mpaq6sDmz9mzmy2zZsd
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-GUID: EOq_bJGJruxWh0d1K-XdfTw3eURxnx7G
X-Authority-Analysis: v=2.4 cv=IIIPywvG c=1 sm=1 tr=0 ts=69b3e342 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=ZWoIU-xV3qFNgvAps2QA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA3NiBTYWx0ZWRfX/K77h0K4gwBk
 qnaDmkfwvC1dCR6NNHEYn7y9IeD9kZ+q5kAkaJO5ciHOF/a6dnC3RyOA/lDRsLQVRvs3TH0b91L
 v2mcKQtXVxYE4AkjyPmNlCTvgg3DBYyJUaU/8IiBYOtOc171WlR1YU5LNdzzKsIjAjNcWp98ftU
 gy90fEcEXRzot47lZsZaisqefySC10onB0PkAgtMM4+l3FyTjOv16Qq8OFV9qW8QvX7ORgukGxM
 CtgTSwry08MQS7JiSmmhgi3eGrJUhruBLxWBVhk0J6M1jOgyzePe0tOd+OGmjd3ZNrzsZq58WEC
 er0lUqJDUhSXZP7lqrRJyEj/4Wsouduj5oelhn+pjS8jvOXiLxzCLEKDF8PqpYDdvT2ufY7IW3O
 IyEE81cNCXSgo89FUFkI0ADB+kYFMS4N3oN4HtW2cUCkB02FZzaXqLkGtW+UT/16YKYU4ZmWBVW
 2mgc1h24GUiffwJsm1A==
X-Proofpoint-ORIG-GUID: EOq_bJGJruxWh0d1K-XdfTw3eURxnx7G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 clxscore=1015 adultscore=0 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130076
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97400-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,linaro.org,quicinc.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wenmeng.liu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CAED02814AC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Fix the mismatch between clock list and clock rate table for CSID lite
instances. The current implementation has 5 clocks defined but only 2
are actually needed (vfe_lite_csid and vfe_lite_cphy_rx), while the
clock rate table doesn't match this configuration.

Update both clock list and rate table to maintain consistency:
- Remove unused clocks: cpas_vfe_lite, vfe_lite_ahb, vfe_lite
- Update clock rate table to match the remaining two clocks

Fixes: ed03e99de0fa ("media: qcom: camss: Add support for CSID 690")
Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 40 ++++++++++++-------------------
 1 file changed, 15 insertions(+), 25 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 00b87fd9afbd89871ffaee9cb2b2db6538e1d70d..cb013471898506f483e5b2779cfd4f679dc083e8 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -3598,12 +3598,10 @@ static const struct camss_subdev_resources csid_res_8775p[] = {
 	/* CSID2 (lite) */
 	{
 		.regulators = {},
-		.clock = { "cpas_vfe_lite", "vfe_lite_ahb",
-			   "vfe_lite_csid", "vfe_lite_cphy_rx",
-			   "vfe_lite"},
+		.clock = { "vfe_lite_csid", "vfe_lite_cphy_rx" },
 		.clock_rate = {
-			{ 0, 0, 400000000, 400000000, 0},
-			{ 0, 0, 400000000, 480000000, 0}
+			{ 400000000, 480000000 },
+			{ 400000000, 480000000 }
 		},
 		.reg = { "csid_lite0" },
 		.interrupt = { "csid_lite0" },
@@ -3617,12 +3615,10 @@ static const struct camss_subdev_resources csid_res_8775p[] = {
 	/* CSID3 (lite) */
 	{
 		.regulators = {},
-		.clock = { "cpas_vfe_lite", "vfe_lite_ahb",
-			   "vfe_lite_csid", "vfe_lite_cphy_rx",
-			   "vfe_lite"},
+		.clock = { "vfe_lite_csid", "vfe_lite_cphy_rx" },
 		.clock_rate = {
-			{ 0, 0, 400000000, 400000000, 0},
-			{ 0, 0, 400000000, 480000000, 0}
+			{ 400000000, 480000000 },
+			{ 400000000, 480000000 }
 		},
 		.reg = { "csid_lite1" },
 		.interrupt = { "csid_lite1" },
@@ -3636,12 +3632,10 @@ static const struct camss_subdev_resources csid_res_8775p[] = {
 	/* CSID4 (lite) */
 	{
 		.regulators = {},
-		.clock = { "cpas_vfe_lite", "vfe_lite_ahb",
-			   "vfe_lite_csid", "vfe_lite_cphy_rx",
-			   "vfe_lite"},
+		.clock = { "vfe_lite_csid", "vfe_lite_cphy_rx" },
 		.clock_rate = {
-			{ 0, 0, 400000000, 400000000, 0},
-			{ 0, 0, 400000000, 480000000, 0}
+			{ 400000000, 480000000 },
+			{ 400000000, 480000000 }
 		},
 		.reg = { "csid_lite2" },
 		.interrupt = { "csid_lite2" },
@@ -3655,12 +3649,10 @@ static const struct camss_subdev_resources csid_res_8775p[] = {
 	/* CSID5 (lite) */
 	{
 		.regulators = {},
-		.clock = { "cpas_vfe_lite", "vfe_lite_ahb",
-			   "vfe_lite_csid", "vfe_lite_cphy_rx",
-			   "vfe_lite"},
+		.clock = { "vfe_lite_csid", "vfe_lite_cphy_rx" },
 		.clock_rate = {
-			{ 0, 0, 400000000, 400000000, 0},
-			{ 0, 0, 400000000, 480000000, 0}
+			{ 400000000, 480000000 },
+			{ 400000000, 480000000 }
 		},
 		.reg = { "csid_lite3" },
 		.interrupt = { "csid_lite3" },
@@ -3674,12 +3666,10 @@ static const struct camss_subdev_resources csid_res_8775p[] = {
 	/* CSID6 (lite) */
 	{
 		.regulators = {},
-		.clock = { "cpas_vfe_lite", "vfe_lite_ahb",
-			   "vfe_lite_csid", "vfe_lite_cphy_rx",
-			   "vfe_lite"},
+		.clock = { "vfe_lite_csid", "vfe_lite_cphy_rx" },
 		.clock_rate = {
-			{ 0, 0, 400000000, 400000000, 0},
-			{ 0, 0, 400000000, 480000000, 0}
+			{ 400000000, 480000000 },
+			{ 400000000, 480000000 }
 		},
 		.reg = { "csid_lite4" },
 		.interrupt = { "csid_lite4" },

-- 
2.34.1


