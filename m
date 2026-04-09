Return-Path: <linux-arm-msm+bounces-102450-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MDFQOu9o12myNggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102450-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 10:53:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AA4F3C7FF7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 10:53:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id EFEB3301A750
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Apr 2026 08:52:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C590F38757D;
	Thu,  9 Apr 2026 08:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Bundnklb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Sf1X+vJ1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B49EC3859FC
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Apr 2026 08:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775724762; cv=none; b=ojSH+vN3bag/6TYjUr8MzJCTmstp+WU+Ta8wVfh4cQDCtrndg1sp9zhiFCiwg1xfpvcFVLOAjq4xh7b1X3dXkPpY5O5ZvtTeV3pfeNss5d5Or0Tj4biGdevr8CYV3+f14ILuhkiRANvx43udwP85i93MoCVgAvmn/8tH3RnQU0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775724762; c=relaxed/simple;
	bh=n5I+YFTTdwt/UV0ptVvro8vzeF0ApSpVzs5EPodmpJ4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hackEKOlgNy35O66vHvAsaKzbgKkXJ61gjouiFtCV3ziVi3f/KmBSSYtIx9l3YaJOov/6yy4r2yeztc19CKArQP8WLddZUMKDxZy4mlEEhVKBPONaUXzufjzafMcsl7wlQ9JJ3setMCYkNxHmRHZD+IqOc8k2xx1sG6kW7D/Wso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Bundnklb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Sf1X+vJ1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63956ID0254985
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Apr 2026 08:52:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cEyXWQODeyHRBWFxwzlb1StMfjWkaPL8DcyHjmYesxY=; b=BundnklbLeWdFiyW
	aQ1Y7MF3iKrLL9DYXlPC3rdiwtVSc0h/ymREWTbyRzd4J5bWmRRvJsNByKf67CRO
	oPwXMB6oCLg0VrlGGdwQb+jYSb4xWbE4uecugu0csHYmB4ey+qGH4SIKlf0834sn
	g4R+zr4fSdsehLs2t7j19BBkCpV4H1aQvjFk4CXoJmFoNOCMrqz1GEer7j1vD+Gm
	mbBiRTiSspCdqVIWyvfKtkpEg/LWeHRZjJ/DFKUcABCK39r9avk5zRzuo978IGzv
	aXv8UTPGaUnIZpLOoLHovK9ZnwW/oTK6pRHamV/zrki2Neo1/Cg0Xiin4HC4h9U7
	G7uMDw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ddt6yb825-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 08:52:39 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2c4cfe08c9dso1967528eec.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 01:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775724758; x=1776329558; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cEyXWQODeyHRBWFxwzlb1StMfjWkaPL8DcyHjmYesxY=;
        b=Sf1X+vJ1Z8qGEus06XEEmF0PvBNV3yCQz5OCOIl8SVWtrY15tu+x6eiJDZTXl2yjAq
         igILRLQU2bNrNe2QK6ni6Bf1hAgb96nBaX8h5FKavDplLR6UOSwSKrTJ4bOIwJpJYafP
         Hn7nt9FgtCyhIefFtYGycge2cke2Gu9wFPUlJLuAJWLes2UMPcSAUWdWB/38v+Le83R0
         C2y9TVAVQWhGn1qfbvo9E+4T/+dwiOewa2YiKH+NXdlGLQSvTvCSZ2GiUr7qLnFzvjMl
         pEcVolleCG4OKC/vya5TqV6c4W5yTgRVPQYvMvlt5CYzxxOMIuzAXZ0mmkY6aWB1UyL1
         FJng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775724758; x=1776329558;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cEyXWQODeyHRBWFxwzlb1StMfjWkaPL8DcyHjmYesxY=;
        b=iNlX80SZO5V7Gxap+Yy/Ym2eHRBVkSTdctW0OnN7tBtb7uHgKwYRx7JuEyblGvuGZP
         wFGOBzKIG4/+uaImJKp1tSYmjSp7PtCLYL6Pda5BLimilYtnLv3tUM214h9vGZB9i2w6
         xtMxDCBnxlM7lU2j46nRmipJOIaqaFnEoiLyiVaF5iIZK/V9nKJ31FU2y1X3wId8mAxq
         hO+aFOH+vRjxRXgf01y69tX2AdUKsWlMIsxdoxyIw1u8mA3c/3HT+MHzgEkwC9mse99o
         rXyEkEdlvFbOEdVom13H2vequz2Gld4nwBBHLXZdM8euQJNmqMNKiQ8Vp+/vU9NNhBxd
         G0wg==
X-Forwarded-Encrypted: i=1; AJvYcCXCFawa5BhQUW0xgQiKAD6jKWUC8BG0b6VowmYRUNUFvDdXuEkrqp3yVRH6ttbHd54LAYeRWDw3Bvj+z/K0@vger.kernel.org
X-Gm-Message-State: AOJu0YyHAmHscG2eKIqw3dgFLRMG4W2JEf8tzcEY8vuD8DFa4bXySQ6q
	sKqfeR6ssdLX2G41A+lS7UILYIpXCbzD3uIYOQlmHOGP265O4RedDbvb1egPrKmilZ+ESB8Oysb
	ZeS8hrppPJbyOHaWNpU/yt+V0Aibj62zY1ECqdaEl2VbWHW9yMPCA7U7mk3jKsgF8/juI
X-Gm-Gg: AeBDievdJlYNyxKM7jWv4NZRwINwyX82d0nz3XZjxZ+tKSY4zuRw9Z6uM7q+mAQB9nH
	qNT5MpFZrVwzV+pPq0IjUNxXccux2mztCAZsoeLpohKOy/Lgl7P2egZvx6DD4/n+vuKqJrjyjjk
	FyrifumvxlOWnGj3Z9fRTxd6G55Z7P5wj7AieAvuSd/WCZkk8183johSIYJn2ZxSLJkpn8HFO5W
	BEFNadHyBothtzVtzLXS+FlIlgF4hiobSwSMku9vdTnf2Qdlo0I+rvrJpEqyl9XXIHH/UfnczRo
	fjFYAyL74GJ6Q4rKFh6Uci83uS9oddLiAZ4E4A+Sb0ShOHIbB+rOJCtu/TPCpJk1rxx/UowjVom
	tzTS9hn6YQSEAuKnYR5fFyqbyhZs0NZDUj1+j8p8vU+T7GxEZGrSNqtfLVi3z+bFWyde3SliJ
X-Received: by 2002:a05:7300:bc0c:b0:2c5:b23e:48a9 with SMTP id 5a478bee46e88-2d40e2f0792mr1466111eec.25.1775724758246;
        Thu, 09 Apr 2026 01:52:38 -0700 (PDT)
X-Received: by 2002:a05:7300:bc0c:b0:2c5:b23e:48a9 with SMTP id 5a478bee46e88-2d40e2f0792mr1466086eec.25.1775724757673;
        Thu, 09 Apr 2026 01:52:37 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d460c8e9a5sm2312889eec.17.2026.04.09.01.52.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 01:52:36 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Thu, 09 Apr 2026 01:52:27 -0700
Subject: [PATCH v5 4/5] remoteproc: qcom: pas: Add late attach support for
 subsystems
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260409-knp-soccp-v5-4-805a492124da@oss.qualcomm.com>
References: <20260409-knp-soccp-v5-0-805a492124da@oss.qualcomm.com>
In-Reply-To: <20260409-knp-soccp-v5-0-805a492124da@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Gokul Krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775724750; l=8178;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=n5I+YFTTdwt/UV0ptVvro8vzeF0ApSpVzs5EPodmpJ4=;
 b=s4oZvhS6UrcdwCI13t0Uo2kOakJBA6Pyuuj3XYIkx9dKKCTDyGlfNWSyuoWTS5UWWDGJtCysI
 HcbVy8R3kimCyFn4/5z2z3BXVDq0nAKfdPqqZeUpFHjlbMOwiMFuuwI
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-ORIG-GUID: C9_YAXYu3HxSS4WdoIRtxBEmcTAYmOQy
X-Proofpoint-GUID: C9_YAXYu3HxSS4WdoIRtxBEmcTAYmOQy
X-Authority-Analysis: v=2.4 cv=R9sz39RX c=1 sm=1 tr=0 ts=69d768d7 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=bg9ZlOV0f5yciO4fbPwA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDA3NyBTYWx0ZWRfX3mvBNEZ8ghPX
 RjF3dG5EZoEwkJb8WQb6s2wr8wGZg/mau0JOxnIQTTHL7VW9WIoH5UYYHT2IMA0m7vlSNZEly6I
 eQ27AhAscC1yciKnFAtwDOt+cGcrWvifUxjE5i129DfM+32HlH95Xfs1zqyPkiqaoqf9ywHAF1X
 0xI283e+akEZzk9DZwAGhXOkK3yd6NVYZnFqNnpPRSHuu1fGTP4IjWcULT/y4/2XVS3H1jK7M5c
 ESfkG5fCJqQBcpz3y320PL9ZMhOaIfS9Rj5Gh8vHY1lk7cE7R+Lea3u7zCIXYwr15ErB9wRYnC6
 JpqxiZH14UshEfyi/R/lxxcTn+ea4YNyfo0uVf/npqaXd1kjfSzKzx8TT3KbQxHLUEcg19BSG/y
 gwO8ztLwRiQpicn3hewd3clwkKaKq3hxvmccpA7jy5K/8r9wLAxIO2ob6Q1Wa9DlmdL5k949NEw
 LbOhz6vwSVPbiSw3xOg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_02,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 phishscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604090077
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102450-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jingyi.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9AA4F3C7FF7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Subsystems can be brought out of reset by entities such as bootloaders.
As the irq enablement could be later than subsystem bring up, the state
of subsystem should be checked by reading SMP2P bits and performing ping
test.

A new qcom_pas_attach() function is introduced. if a crash state is
detected for the subsystem, rproc_report_crash() is called. If the
subsystem is ready and the ping is successful, it will be marked as
"attached". If ready irq is not received, it could be the early boot
feature is not supported by other entities. In this case, the state will
be marked as RPROC_OFFLINE so that the PAS driver can load the firmware
and start the remoteproc.

Co-developed-by: Gokul Krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>
Signed-off-by: Gokul Krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5.c     | 69 ++++++++++++++++++++++++++++++++
 drivers/remoteproc/qcom_q6v5.h     |  6 +++
 drivers/remoteproc/qcom_q6v5_pas.c | 80 ++++++++++++++++++++++++++++++++++++--
 3 files changed, 152 insertions(+), 3 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5.c b/drivers/remoteproc/qcom_q6v5.c
index 58d5b85e58cd..52247c17c38a 100644
--- a/drivers/remoteproc/qcom_q6v5.c
+++ b/drivers/remoteproc/qcom_q6v5.c
@@ -20,6 +20,7 @@
 
 #define Q6V5_LOAD_STATE_MSG_LEN	64
 #define Q6V5_PANIC_DELAY_MS	200
+#define Q6V5_PING_TIMEOUT_MS	500
 
 static int q6v5_load_state_toggle(struct qcom_q6v5 *q6v5, bool enable)
 {
@@ -234,6 +235,74 @@ unsigned long qcom_q6v5_panic(struct qcom_q6v5 *q6v5)
 }
 EXPORT_SYMBOL_GPL(qcom_q6v5_panic);
 
+static irqreturn_t q6v5_pong_interrupt(int irq, void *data)
+{
+	struct qcom_q6v5 *q6v5 = data;
+
+	complete(&q6v5->ping_done);
+
+	return IRQ_HANDLED;
+}
+
+int qcom_q6v5_ping_subsystem(struct qcom_q6v5 *q6v5)
+{
+	int ret;
+	int ping_failed = 0;
+
+	reinit_completion(&q6v5->ping_done);
+
+	/* Set master kernel Ping bit */
+	ret = qcom_smem_state_update_bits(q6v5->ping_state,
+					  BIT(q6v5->ping_bit), BIT(q6v5->ping_bit));
+	if (ret) {
+		dev_err(q6v5->dev, "Failed to update ping bits\n");
+		return ret;
+	}
+
+	ret = wait_for_completion_timeout(&q6v5->ping_done, msecs_to_jiffies(Q6V5_PING_TIMEOUT_MS));
+	if (!ret) {
+		ping_failed = -ETIMEDOUT;
+		dev_err(q6v5->dev, "Failed to get back pong\n");
+	}
+
+	/* Clear ping bit master kernel */
+	ret = qcom_smem_state_update_bits(q6v5->ping_state, BIT(q6v5->ping_bit), 0);
+	if (ret) {
+		dev_err(q6v5->dev, "Failed to clear master kernel bits\n");
+		return ret;
+	}
+
+	return ping_failed;
+}
+EXPORT_SYMBOL_GPL(qcom_q6v5_ping_subsystem);
+
+int qcom_q6v5_ping_subsystem_init(struct qcom_q6v5 *q6v5, struct platform_device *pdev)
+{
+	int ret = -ENODEV;
+
+	q6v5->ping_state = devm_qcom_smem_state_get(&pdev->dev, "ping", &q6v5->ping_bit);
+	if (IS_ERR(q6v5->ping_state)) {
+		dev_err(&pdev->dev, "Failed to acquire smem state %ld\n",
+			PTR_ERR(q6v5->ping_state));
+		return PTR_ERR(q6v5->ping_state);
+	}
+
+	init_completion(&q6v5->ping_done);
+
+	q6v5->pong_irq = platform_get_irq_byname(pdev, "pong");
+	if (q6v5->pong_irq < 0)
+		return q6v5->pong_irq;
+
+	ret = devm_request_threaded_irq(&pdev->dev, q6v5->pong_irq, NULL,
+					q6v5_pong_interrupt, IRQF_TRIGGER_RISING | IRQF_ONESHOT,
+					"q6v5 pong", q6v5);
+	if (ret)
+		dev_err(&pdev->dev, "Failed to acquire pong IRQ\n");
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(qcom_q6v5_ping_subsystem_init);
+
 /**
  * qcom_q6v5_init() - initializer of the q6v5 common struct
  * @q6v5:	handle to be initialized
diff --git a/drivers/remoteproc/qcom_q6v5.h b/drivers/remoteproc/qcom_q6v5.h
index 5a859c41896e..5025ffc4dbe8 100644
--- a/drivers/remoteproc/qcom_q6v5.h
+++ b/drivers/remoteproc/qcom_q6v5.h
@@ -17,22 +17,26 @@ struct qcom_q6v5 {
 	struct rproc *rproc;
 
 	struct qcom_smem_state *state;
+	struct qcom_smem_state *ping_state;
 	struct qmp *qmp;
 
 	struct icc_path *path;
 
 	unsigned stop_bit;
+	unsigned int ping_bit;
 
 	int wdog_irq;
 	int fatal_irq;
 	int ready_irq;
 	int handover_irq;
 	int stop_irq;
+	int pong_irq;
 
 	bool handover_issued;
 
 	struct completion start_done;
 	struct completion stop_done;
+	struct completion ping_done;
 
 	int crash_reason;
 
@@ -52,5 +56,7 @@ int qcom_q6v5_unprepare(struct qcom_q6v5 *q6v5);
 int qcom_q6v5_request_stop(struct qcom_q6v5 *q6v5, struct qcom_sysmon *sysmon);
 int qcom_q6v5_wait_for_start(struct qcom_q6v5 *q6v5, int timeout);
 unsigned long qcom_q6v5_panic(struct qcom_q6v5 *q6v5);
+int qcom_q6v5_ping_subsystem(struct qcom_q6v5 *q6v5);
+int qcom_q6v5_ping_subsystem_init(struct qcom_q6v5 *q6v5, struct platform_device *pdev);
 
 #endif
diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index da27d1d3c9da..34b54cf832d0 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -60,6 +60,7 @@ struct qcom_pas_data {
 	int region_assign_count;
 	bool region_assign_shared;
 	int region_assign_vmid;
+	bool early_boot;
 };
 
 struct qcom_pas {
@@ -423,9 +424,15 @@ static int qcom_pas_stop(struct rproc *rproc)
 
 	qcom_pas_unmap_carveout(rproc, pas->mem_phys, pas->mem_size);
 
-	handover = qcom_q6v5_unprepare(&pas->q6v5);
-	if (handover)
-		qcom_pas_handover(&pas->q6v5);
+	/*
+	 * qcom_q6v5_prepare is not called in qcom_pas_attach, skip unprepare to
+	 * avoid mismatch.
+	 */
+	if (pas->rproc->state != RPROC_ATTACHED) {
+		handover = qcom_q6v5_unprepare(&pas->q6v5);
+		if (handover)
+			qcom_pas_handover(&pas->q6v5);
+	}
 
 	if (pas->smem_host_id)
 		ret = qcom_smem_bust_hwspin_lock_by_host(pas->smem_host_id);
@@ -510,6 +517,63 @@ static unsigned long qcom_pas_panic(struct rproc *rproc)
 	return qcom_q6v5_panic(&pas->q6v5);
 }
 
+static int qcom_pas_attach(struct rproc *rproc)
+{
+	int ret;
+	struct qcom_pas *pas = rproc->priv;
+	bool ready_state;
+	bool crash_state;
+
+	pas->q6v5.running = true;
+	ret = irq_get_irqchip_state(pas->q6v5.fatal_irq,
+				    IRQCHIP_STATE_LINE_LEVEL, &crash_state);
+
+	if (ret)
+		goto disable_running;
+
+	if (crash_state) {
+		dev_err(pas->dev, "Subsystem has crashed before driver probe\n");
+		rproc_report_crash(rproc, RPROC_FATAL_ERROR);
+		ret = -EINVAL;
+		goto disable_running;
+	}
+
+	ret = irq_get_irqchip_state(pas->q6v5.ready_irq,
+				    IRQCHIP_STATE_LINE_LEVEL, &ready_state);
+
+	if (ret)
+		goto disable_running;
+
+	if (unlikely(!ready_state)) {
+		/*
+		 * The bootloader may not support early boot, mark the state as
+		 * RPROC_OFFLINE so that the PAS driver can load the firmware and
+		 * start the remoteproc.
+		 */
+		dev_err(pas->dev, "Failed to get subsystem ready interrupt\n");
+		pas->rproc->state = RPROC_OFFLINE;
+		ret = -EINVAL;
+		goto disable_running;
+	}
+
+	ret = qcom_q6v5_ping_subsystem(&pas->q6v5);
+
+	if (ret) {
+		dev_err(pas->dev, "Failed to ping subsystem, assuming device crashed\n");
+		rproc_report_crash(rproc, RPROC_FATAL_ERROR);
+		goto disable_running;
+	}
+
+	pas->q6v5.handover_issued = true;
+
+	return 0;
+
+disable_running:
+	pas->q6v5.running = false;
+
+	return ret;
+}
+
 static const struct rproc_ops qcom_pas_ops = {
 	.unprepare = qcom_pas_unprepare,
 	.start = qcom_pas_start,
@@ -518,6 +582,7 @@ static const struct rproc_ops qcom_pas_ops = {
 	.parse_fw = qcom_pas_parse_firmware,
 	.load = qcom_pas_load,
 	.panic = qcom_pas_panic,
+	.attach = qcom_pas_attach,
 };
 
 static const struct rproc_ops qcom_pas_minidump_ops = {
@@ -855,6 +920,15 @@ static int qcom_pas_probe(struct platform_device *pdev)
 
 	pas->pas_ctx->use_tzmem = rproc->has_iommu;
 	pas->dtb_pas_ctx->use_tzmem = rproc->has_iommu;
+
+	if (desc->early_boot) {
+		ret = qcom_q6v5_ping_subsystem_init(&pas->q6v5, pdev);
+		if (ret)
+			dev_warn(&pdev->dev, "Falling back to firmware load\n");
+		else
+			pas->rproc->state = RPROC_DETACHED;
+	}
+
 	ret = rproc_add(rproc);
 	if (ret)
 		goto remove_ssr_sysmon;

-- 
2.34.1


