Return-Path: <linux-arm-msm+bounces-103804-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qE5dM35f5mndvQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103804-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 19:16:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BCEDA430E3E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 19:16:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BACC53258F19
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 15:44:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01CCC33B6D0;
	Mon, 20 Apr 2026 15:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e14QeWO/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L2mArInD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1966A33ADA4
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 15:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776699841; cv=none; b=dwUESIyN7bgLb6911VPv1SSYhPr4/l01nvX0aZj7XaG2J7XyTAxAXQKRceWsQnESFxh6eTsxMSby6HmBlZDw47q1plvyEECHjgRIQvBpwFxP/8kNsQ9zUP3mWBqZLZKy7CQSxJ9g3SJor4Qfccg0y1lbMTOZGDNx+Z5roI5fU1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776699841; c=relaxed/simple;
	bh=Hq96TCkrNAk+nIwzsh/wJnzVo8+VTfX6cYKH0fAOzjo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MeHcbtx4JVV1c6Q23x4tLNo5vMp1XheBgPFSFTz5vzIM88lMrpWFViXXmWaZk7MMscdHx5PvJ4E5RLfGyJOclY3RCwjW/trSVE0VJ7gna9pkDBpIuc4RzaohOAKy7jyOsPF0AqhzzylXZEJsn0H6tRW/ofHKngaD1iuxMtNfdd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e14QeWO/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L2mArInD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63KBKJsr3212158
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 15:43:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IQ+L0PhdbxHQr4ISeIqjXzA+0fOsr/ypPkuqaUU9Vbo=; b=e14QeWO/TFeeCsG2
	VnN0YmRq0pLnI9Cm6Ru/ySPbpP+y2ocJ8HrksQIkYZAd0wicDannAjl/DB0C6usm
	uRqQsWKLij1m1r4PI523bjto2ZktL7J2LXoxVtCStZC58qLR5B7PzUbzsp5fAxBA
	wuWYXWLnR5oZksMfiajuOoNerMU+R2WPPQ8Fq0WFtkXN4BC2wKk4lHawecHAYDFS
	rR5zM75muHMRPfk91Yc5rdS2mxNnDb5zAAESnaqpQfuM90UAwpU5+Wt0XL3HmS4k
	oXgGPTJMXgU0W0hjau4V+Dso08jy1ryre0Sm4p1Kv8tCs0azLdMzhT8AV2ELs4UL
	P3tKaw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnfcfj5af-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 15:43:58 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c76c2bb3149so1455911a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 08:43:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776699838; x=1777304638; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IQ+L0PhdbxHQr4ISeIqjXzA+0fOsr/ypPkuqaUU9Vbo=;
        b=L2mArInDWYK9EUlcFz+tm/uDmj0YXK7iS+xOod5pxtXPXiokzmmitPhga4DcUJq2v3
         QkD/9hdhg2xtRlxDghwMJnj3W6dOdpBwbPSecsNEFMliL+TN2yVCfgA6BOpNXJAOzapS
         BFrkfvrFmLaNcuRpqEbxwmuQ5hp3DQktze0y1dZtksW5bmM7kCte0eErBZBa+7vhFEZ2
         tLCO29fUTqg4qEUVc+vJRRnh8vqMy/iJy884XL5/DLMGg/5t4HzWRbU/iotE+MgEp9dH
         CsNr/Bt1AJkSt30wVH1adgBQ+lu6EWpSzDMIkU8bY2/nfoTBnwR6m6a9rDf5SUTDNY62
         uI+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776699838; x=1777304638;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IQ+L0PhdbxHQr4ISeIqjXzA+0fOsr/ypPkuqaUU9Vbo=;
        b=TFmGiyecHHjywHLWKgn5WeDKxuGTsc/bKD5vX8tuj7r+zSNtzLtOKDRXKHzKNVBIWK
         duyGrkq25jct0GBv0uW8E8Vv1ErULzuSLCHxnDkXUN1BPHnca7Zu+dCP9Q6oegesOxOJ
         nHDwunOiIyqHx69uagyngr/pv8fV6UW4A42BDB3GtBF9xA5GzLlPxxs5ZPdzmJNwes3n
         87O7E7xt2HK9/fHyDRsOG+osO6qH/4miVAJSTLDRVmR1278Wa6hcbNC1vI1sQRnaWqXD
         17epYI0cDqNE8gOVpoTsrWDcwK8S0P2GRl18czO/weE9ucfO0Dg2GJdMusEoIJ6WRmvQ
         7zqw==
X-Gm-Message-State: AOJu0YzWwSUg7I3vNoaJar4SNnjgxBYwxDWZwSXA4gwc1oJFAcKax7Qx
	8Won3ERFag2ZZlVnz7bRwnmez3LWdXPiqev/z7EB4uadizCOZaIIhBOvtvB+gj7Vy78zgohr5LA
	M+l8XIwUnXJOoNlIsPgPqw98T5Ot8vlJ2H/euEPLfhuWVS+oCFWorZ9Ob57IIB8ao5LaG
X-Gm-Gg: AeBDietLNXT2jhiploleZWMaqRQsNm5GlcB3XtLSEt8mj1aVzcsP6cWJzxMMAm2nQbC
	LW0VFbL3a1zMdOJtFm/rQw/KKBelZTmmX5MDMGZGTPriOUDyqS+7xwYE+IcWNcmmCPaWADzPY4b
	YwMrfMfo8PU802PSMqh4ZzvCecRhDKM4q4qPHutjaZjsD/HRkcwoxjNRISDQ9sCvXOZlTABnQkz
	KNILGGreZtrcl/0uwPw37QMP5k5PdzGee4P+DFacGZizJHcXofXoGZUPhFkEGc22D/AUaYG1+lN
	XVEwqu35EW4ypfgDP4a7bPtyhAUvggN02aMEjUqfDjmknoDMyRJC8B4qTGNS2WsDiq7UB0+av7d
	ItiQX1dyCu8sDn8zt8qPV9pxVNlyRGoxA4VpLc8ZppK+Mb3RWLjHnc/LlPO+sxA==
X-Received: by 2002:a05:6a00:a58a:b0:82f:3017:6168 with SMTP id d2e1a72fcca58-82f8b322ec3mr11320700b3a.1.1776699837557;
        Mon, 20 Apr 2026 08:43:57 -0700 (PDT)
X-Received: by 2002:a05:6a00:a58a:b0:82f:3017:6168 with SMTP id d2e1a72fcca58-82f8b322ec3mr11320677b3a.1.1776699836857;
        Mon, 20 Apr 2026 08:43:56 -0700 (PDT)
Received: from hu-kamalw-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8e9cbb28sm10533230b3a.13.2026.04.20.08.43.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 08:43:56 -0700 (PDT)
From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Date: Mon, 20 Apr 2026 21:13:40 +0530
Subject: [PATCH v4 3/4] regulator: qcom-rpmh: readback
 voltage/bypass/mode/status set during bootup
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260420-read-rpmh-v3-v4-3-70c152e6c958@oss.qualcomm.com>
References: <20260420-read-rpmh-v3-v4-0-70c152e6c958@oss.qualcomm.com>
In-Reply-To: <20260420-read-rpmh-v3-v4-0-70c152e6c958@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776699822; l=10320;
 i=kamal.wadhwa@oss.qualcomm.com; s=20260406; h=from:subject:message-id;
 bh=Hq96TCkrNAk+nIwzsh/wJnzVo8+VTfX6cYKH0fAOzjo=;
 b=kCi41cImcgixPZQicPEKNUV7UyQQ+WsfOIOPi4BZOTQQnaId10SygIozV+9a3dbSeRyGrFbM1
 rN6j8BcuiQEC1r4fFE3Sr/P+xXWTRGV5sUOMsKy/j6o093GtiXZgFEY
X-Developer-Key: i=kamal.wadhwa@oss.qualcomm.com; a=ed25519;
 pk=ylH1NxUZkBpYsmww89g6zVxpS0q8qthtzcORkYxn/Ag=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDE1MiBTYWx0ZWRfX5NLPOeMRJgGG
 zN9SUhfFIhPsM4K+9/0ZbB49ijU3+1moHhSdD3HD1mTdrKo3VoS7vyhUYo5tgbZaVGTEvRmz1FQ
 fWDQfwLNLuVARk2eKQ9FnzCQfT4Us1PdAQf/qiTWekP0XImKhqsg8NtCEQzrB9vvZEVtw4tq2hk
 /QhR7lGEGqw3uyzYprKki0rKDMsu4vSTSML5uJEat6UBZvXul6ik1TLma+NllXLqKj73tbSg2oU
 rBtSwoY3fLo6OgCfSulxeIQCI/8njmRJ+OrmbExsr94GG2oy9oY8SOnnaquz8+bRrvBeg2JXgut
 7ZL3iHWOi+gGa3CPx5AF+SuskMYUc5wu53+QGC6ElGppEOyU4nTRAz7+6jFdRYcU6MshwQRtTdd
 eNRkw3szP6h4K5teObk5pa62hsP8PJSsWmNcdXJ6PRWetmifNaw8+tzAkcfUZvpg+8Py/+Y27nx
 uGkhS5kq7hmqrSFvX5w==
X-Proofpoint-ORIG-GUID: Mk2GQS7Mpadkc9pn8Y8yVPI8CQiiVQcH
X-Proofpoint-GUID: Mk2GQS7Mpadkc9pn8Y8yVPI8CQiiVQcH
X-Authority-Analysis: v=2.4 cv=L+ItheT8 c=1 sm=1 tr=0 ts=69e649be cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=tHHH2asN0IuRntgD_GYA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_03,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 malwarescore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604200152
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-103804-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[cmd.data:url,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kamal.wadhwa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BCEDA430E3E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Currently, during regulator registration, regulator framework sends an
unnecessary `min-microvolts` request for the rpmh-regulator device. This
happens because in current design, we do not have a way to readback the
voltage settings that was set during the bootloader stage.

Fix this by using the rpmh_read() API to read the regulator voltage
settings done during boot and make it available to regulator framework
from the very first read after the bootup.

Also use this API to read the status/mode/bypass settings as well. This
will provide the regulator framework a sense of the initial settings
done by bootloader and thus preventing any redundents writes for any
setting post bootup incase the same setting was already applied during
bootup.

Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
---
 drivers/regulator/qcom-rpmh-regulator.c | 179 ++++++++++++++++++++++++++++++++
 1 file changed, 179 insertions(+)

diff --git a/drivers/regulator/qcom-rpmh-regulator.c b/drivers/regulator/qcom-rpmh-regulator.c
index 85fbf10f74bb3393071bc65681356312f27b7527..1add15d73cac67ad8c0b45aaad6fb2ae9b388180 100644
--- a/drivers/regulator/qcom-rpmh-regulator.c
+++ b/drivers/regulator/qcom-rpmh-regulator.c
@@ -14,6 +14,7 @@
 #include <linux/regulator/driver.h>
 #include <linux/regulator/machine.h>
 #include <linux/regulator/of_regulator.h>
+#include <linux/bits.h>
 
 #include <soc/qcom/cmd-db.h>
 #include <soc/qcom/rpmh.h>
@@ -61,8 +62,13 @@ static const struct resource_name_formats vreg_rsc_name_lookup[NUM_REGULATOR_TYP
 };
 
 #define RPMH_REGULATOR_REG_VRM_VOLTAGE		0x0
+#define RPMH_REGULATOR_VOLTAGE_MASK		GENMASK(12, 0)
+
 #define RPMH_REGULATOR_REG_ENABLE		0x4
+#define RPMH_REGULATOR_ENABLE_MASK		BIT(0)
+
 #define RPMH_REGULATOR_REG_VRM_MODE		0x8
+#define RPMH_REGULATOR_MODE_MASK		GENMASK(2, 0)
 
 #define PMIC4_LDO_MODE_RETENTION		4
 #define PMIC4_LDO_MODE_LPM			5
@@ -154,6 +160,7 @@ struct rpmh_vreg_hw_data {
  * @voltage_selector:		Selector used for get_voltage_sel() and
  *				set_voltage_sel() callbacks
  * @mode:			RPMh VRM regulator current framework mode
+ * @status:			RPMh VRM regulator current framework status
  */
 struct rpmh_vreg {
 	struct device			*dev;
@@ -166,6 +173,7 @@ struct rpmh_vreg {
 	bool				bypassed;
 	int				voltage_selector;
 	unsigned int			mode;
+	unsigned int			status;
 };
 
 /**
@@ -210,6 +218,28 @@ static int rpmh_regulator_send_request(struct rpmh_vreg *vreg,
 	return ret;
 }
 
+/**
+ * rpmh_regulator_read_data() - read data from RPMh
+ * @vreg:		Pointer to the RPMh regulator
+ * @cmd:		Pointer to the RPMh command struct to readback data
+ *
+ * Return: 0 on success, or a negative error number on failure
+ */
+static int rpmh_regulator_read_data(struct rpmh_vreg *vreg, struct tcs_cmd *cmd)
+{
+	return rpmh_read(vreg->dev, cmd);
+}
+
+static void rpmh_vreg_update_status(struct rpmh_vreg *vreg)
+{
+	if (!vreg->enabled)
+		vreg->status = REGULATOR_STATUS_OFF;
+	else if (vreg->bypassed)
+		vreg->status = REGULATOR_STATUS_BYPASS;
+	else
+		vreg->status = regulator_mode_to_status(vreg->mode);
+}
+
 static int _rpmh_regulator_vrm_set_voltage_sel(struct regulator_dev *rdev,
 				unsigned int selector, bool wait_for_ack)
 {
@@ -248,9 +278,42 @@ static int rpmh_regulator_vrm_set_voltage_sel(struct regulator_dev *rdev,
 					selector > vreg->voltage_selector);
 }
 
+static int _rpmh_regulator_vrm_get_voltage(struct regulator_dev *rdev, int *uV)
+{
+	struct rpmh_vreg *vreg = rdev_get_drvdata(rdev);
+	struct tcs_cmd cmd = {
+		.addr = vreg->addr + RPMH_REGULATOR_REG_VRM_VOLTAGE,
+	};
+	int min_uV = rdev->constraints->min_uV;
+	int max_uV = rdev->constraints->max_uV;
+	int ret, _uV = 0;
+
+	ret = rpmh_regulator_read_data(vreg, &cmd);
+	if (!ret)
+		_uV = (cmd.data & RPMH_REGULATOR_VOLTAGE_MASK) * 1000;
+	else
+		dev_err(vreg->dev, "failed to read VOLTAGE ret = %d\n", ret);
+
+	if (!_uV || (_uV >= min_uV && _uV <= max_uV))
+		*uV = _uV;
+	else
+		dev_err(vreg->dev, "read voltage %d is out-of-range[%d:%d]\n",
+						_uV, min_uV, max_uV);
+
+	return ret;
+}
+
 static int rpmh_regulator_vrm_get_voltage_sel(struct regulator_dev *rdev)
 {
 	struct rpmh_vreg *vreg = rdev_get_drvdata(rdev);
+	int ret, uV = 0;
+
+	if (vreg->voltage_selector < 0) {
+		ret = _rpmh_regulator_vrm_get_voltage(rdev, &uV);
+		if (!ret && uV != 0)
+			vreg->voltage_selector = regulator_map_voltage_linear_range(rdev,
+							uV, INT_MAX);
+	}
 
 	return vreg->voltage_selector;
 }
@@ -284,6 +347,8 @@ static int rpmh_regulator_set_enable_state(struct regulator_dev *rdev,
 	if (!ret)
 		vreg->enabled = enable;
 
+	rpmh_vreg_update_status(vreg);
+
 	return ret;
 }
 
@@ -333,9 +398,27 @@ static int rpmh_regulator_vrm_set_mode(struct regulator_dev *rdev,
 	if (!ret)
 		vreg->mode = mode;
 
+	rpmh_vreg_update_status(vreg);
+
 	return ret;
 }
 
+static int rpmh_regulator_vrm_get_pmic_mode(struct rpmh_vreg *vreg, int *pmic_mode)
+{
+	struct tcs_cmd cmd = {
+		.addr = vreg->addr + RPMH_REGULATOR_REG_VRM_MODE,
+	};
+	int ret;
+
+	ret = rpmh_regulator_read_data(vreg, &cmd);
+	if (!ret)
+		*pmic_mode = cmd.data & RPMH_REGULATOR_MODE_MASK;
+	else
+		return -EINVAL;
+
+	return 0;
+}
+
 static unsigned int rpmh_regulator_vrm_get_mode(struct regulator_dev *rdev)
 {
 	struct rpmh_vreg *vreg = rdev_get_drvdata(rdev);
@@ -343,6 +426,13 @@ static unsigned int rpmh_regulator_vrm_get_mode(struct regulator_dev *rdev)
 	return vreg->mode;
 }
 
+static int rpmh_regulator_vrm_get_status(struct regulator_dev *rdev)
+{
+	struct rpmh_vreg *vreg = rdev_get_drvdata(rdev);
+
+	return vreg->status;
+}
+
 /**
  * rpmh_regulator_vrm_get_optimum_mode() - get the mode based on the  load
  * @rdev:		Regulator device pointer for the rpmh-regulator
@@ -379,6 +469,8 @@ static int rpmh_regulator_vrm_set_bypass(struct regulator_dev *rdev,
 	if (!ret)
 		vreg->bypassed = enable;
 
+	rpmh_vreg_update_status(vreg);
+
 	return ret;
 }
 
@@ -401,6 +493,7 @@ static const struct regulator_ops rpmh_regulator_vrm_ops = {
 	.list_voltage		= regulator_list_voltage_linear_range,
 	.set_mode		= rpmh_regulator_vrm_set_mode,
 	.get_mode		= rpmh_regulator_vrm_get_mode,
+	.get_status		= rpmh_regulator_vrm_get_status,
 };
 
 static const struct regulator_ops rpmh_regulator_vrm_drms_ops = {
@@ -412,6 +505,7 @@ static const struct regulator_ops rpmh_regulator_vrm_drms_ops = {
 	.list_voltage		= regulator_list_voltage_linear_range,
 	.set_mode		= rpmh_regulator_vrm_set_mode,
 	.get_mode		= rpmh_regulator_vrm_get_mode,
+	.get_status		= rpmh_regulator_vrm_get_status,
 	.get_optimum_mode	= rpmh_regulator_vrm_get_optimum_mode,
 };
 
@@ -424,6 +518,7 @@ static const struct regulator_ops rpmh_regulator_vrm_bypass_ops = {
 	.list_voltage		= regulator_list_voltage_linear_range,
 	.set_mode		= rpmh_regulator_vrm_set_mode,
 	.get_mode		= rpmh_regulator_vrm_get_mode,
+	.get_status		= rpmh_regulator_vrm_get_status,
 	.set_bypass		= rpmh_regulator_vrm_set_bypass,
 	.get_bypass		= rpmh_regulator_vrm_get_bypass,
 };
@@ -432,6 +527,7 @@ static const struct regulator_ops rpmh_regulator_xob_ops = {
 	.enable			= rpmh_regulator_enable,
 	.disable		= rpmh_regulator_disable,
 	.is_enabled		= rpmh_regulator_is_enabled,
+	.get_status		= rpmh_regulator_vrm_get_status,
 };
 
 /**
@@ -540,6 +636,83 @@ static int rpmh_regulator_init_vreg(struct rpmh_vreg *vreg, struct device *dev,
 	return 0;
 }
 
+static int rpmh_regulator_determine_initial_status(struct rpmh_vreg *vreg)
+{
+	struct tcs_cmd cmd = {
+		.addr = vreg->addr + RPMH_REGULATOR_REG_ENABLE,
+	};
+	int ret, pmic_mode, mode;
+	int sts = 0;
+
+	ret = rpmh_regulator_read_data(vreg, &cmd);
+	if (ret) {
+		vreg->status = REGULATOR_STATUS_UNDEFINED;
+		dev_err(vreg->dev, "failed to read ENABLE status ret = %d\n", ret);
+
+		return ret;
+	}
+
+	sts = cmd.data & RPMH_REGULATOR_ENABLE_MASK;
+	if (!sts) {
+		vreg->status = REGULATOR_STATUS_OFF;
+
+		return 0;
+	}
+
+	if (vreg->hw_data->regulator_type == XOB) {
+		vreg->status = REGULATOR_STATUS_ON;
+
+		return 0;
+	}
+
+	ret = rpmh_regulator_vrm_get_pmic_mode(vreg, &pmic_mode);
+	if (ret < 0) {
+		vreg->mode = REGULATOR_MODE_INVALID;
+		vreg->status = REGULATOR_STATUS_UNDEFINED;
+		dev_err(vreg->dev, "failed to read pmic_mode ret = %d\n", ret);
+
+		return ret;
+	}
+
+	/*
+	 * NOTE: Since BOB4 BYPASS_MODE value = 0 we cannot confirm if that BOB
+	 * regulator has been sent into bypass mode by bootloader or if bootloader
+	 * just has not requested for any mode voting. Due this limitation, we
+	 * must check if the read pmic_mode value is non-zero before comparing it
+	 * to bypass mode value. This also is needed to avoid setting BYPASS status
+	 * for LDOs which dont support bypass mode, and have the pmic_bypass_mode
+	 * uninitialized value as zero in the vreg hw data. For such cases assume
+	 * lowest mode/status, if pmic_mode is zero, to allow for mode voting.
+	 */
+	if (!pmic_mode) {
+		for (mode = REGULATOR_MODE_STANDBY; mode > REGULATOR_MODE_INVALID; mode >>= 1) {
+			if (vreg->hw_data->pmic_mode_map[mode] >= 0) {
+				vreg->mode = mode;
+				break;
+			}
+		}
+
+		vreg->status = regulator_mode_to_status(vreg->mode);
+		return 0;
+	}
+
+	if (vreg->hw_data->pmic_bypass_mode == pmic_mode) {
+		vreg->bypassed = true;
+		vreg->status = REGULATOR_STATUS_BYPASS;
+		return 0;
+	}
+
+	for (mode = REGULATOR_MODE_STANDBY; mode > REGULATOR_MODE_INVALID; mode >>= 1) {
+		if (pmic_mode == vreg->hw_data->pmic_mode_map[mode]) {
+			vreg->mode = mode;
+			vreg->status = regulator_mode_to_status(vreg->mode);
+			break;
+		}
+	}
+
+	return 0;
+}
+
 static const int pmic_mode_map_pmic4_ldo[REGULATOR_MODE_STANDBY + 1] = {
 	[REGULATOR_MODE_INVALID] = -EINVAL,
 	[REGULATOR_MODE_STANDBY] = PMIC4_LDO_MODE_RETENTION,
@@ -1823,6 +1996,12 @@ static int rpmh_regulator_probe(struct platform_device *pdev)
 						vreg_data);
 		if (ret < 0)
 			return ret;
+
+		ret = rpmh_regulator_determine_initial_status(vreg);
+		if (ret < 0)
+			dev_err(dev, "failed to read initial status for %s\n",
+					vreg->rdesc.name);
+
 	}
 
 	return 0;

-- 
2.25.1


