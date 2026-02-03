Return-Path: <linux-arm-msm+bounces-91583-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +F3mNuaNgWl/HAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91583-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 06:55:50 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 44148D4DB9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 06:55:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 13B5930C567C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Feb 2026 05:52:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E480A3570CC;
	Tue,  3 Feb 2026 05:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P2nCuFX7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NeCsMmMy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 565C636606E
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Feb 2026 05:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770097921; cv=none; b=IuPd07aQS6hS50Gjh3a/8uKVVeodOJDgulccK1St7A/WoYtMMP1CVjxolNbVCw5VPE7rw7Yp4OQRQxZ4XBDQ4vUbN+w4SCib3XAW4sJZieX/t5MwVMLk3+KN2hYrdBxU6yk0JY1QAiyBOzpM5qv+1+B83AChdFWPdFDszhitTIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770097921; c=relaxed/simple;
	bh=iOBlKE7wcNNqdQg697EHs/307n7EmzHjJxd5G5rMLIU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=I94rl67EE1jcbHwfB2ctV4np+bMyxKM1/Rk7TTY1MvfwqPsvNmEtcytHijXGqo55DBQFpfiBudhX1eEACRsMfgIVQQogVdpbeltzEEJ8+mfx68JyvjDxlWpm/w1YQ+Gp8HB44fBSbC/AxbubGw5e57bRC2jQn71VzOO1EqaLu8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P2nCuFX7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NeCsMmMy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 612J3cWh2899836
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Feb 2026 05:51:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4Jay9EfBX3UpMTwsvQnGvQgNS5FLBeKOwQWuoZ1I2KI=; b=P2nCuFX7safyPSt4
	md3wzsabmXuDGIOuzhF+VIlU4aQol5XzPLFz9VR5mgZb2tF0EqW7wBeKb05L/Mk2
	Twuu2UKx1g1XmLKBX+k4u+zKSiaPyEBrL1Z16MnPCEEPTpeU4k4NDluH5bVO5pvu
	Ylr4gZahpdoCJopOnL4MIiUznzvkhrB3WtBXUzpvu1l7TkfRJkOHSP35dDuamwnF
	btTQgB5uFIayj6PqjKtF6bPCzDHogxhSdcP5GZD8vsEvJMWCirIq2Bo9praryObV
	lI0uRINWiVAGIrpk8OCIFBZTVzagFGHbN1fMZjK7mBNS4WtGIy+LOKNtMxEFHMQI
	pTi6Tg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c2tp0u1k8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 05:51:59 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-29f1f79d6afso58883875ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 21:51:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770097918; x=1770702718; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4Jay9EfBX3UpMTwsvQnGvQgNS5FLBeKOwQWuoZ1I2KI=;
        b=NeCsMmMyIIHEvMeRIy02FsaZliS84DApvj+lh6qB07mh38+KYCSxYp948UPkEoa3Z0
         uqdPDStUeXJew1eUxmt06TKWj+YWsJlKKNCbNJTM8JhPWSy4KeavaMBEvq/Y/mjG1oW0
         R2TO/APJ49Fxsn9j/nnXKgxveNwUBPW2APyNqEzMhYA99Bg1p37732NW3hUPJW7TGtkU
         kRkklT+J4edv7UgU+vkHTUOPOsUBkPClrdIr+W+skjo8QuPALNpEQ4F53bLu+mpkfxRr
         e8wuMnOESu6TNU2i5iGndMsusmmLWdgEgKjxZqTfCKiNkD4wa+SkY+7S4S2OXH6FWl5J
         6BfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770097918; x=1770702718;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4Jay9EfBX3UpMTwsvQnGvQgNS5FLBeKOwQWuoZ1I2KI=;
        b=xVQSXpEds5IvCPDkN4rKQT6gPHJc/jSh7dT4zr0dHama9Y381vAri2iJ0qyz0vlFZq
         LiYbI5lt6R1lmLWZoxGhBMtk4cnbvRfwRQjhdS7Mf80e8TEB5doYQ8+RzE4vqUudb2L3
         dYPT5+TIdu/YF1o2kTgdNQfRilN6eIGyzM9xYVJfTb26EFpwEdoQ2SkPke5yNTXNUqDt
         BQ67qBWn+jSMuSnK9aTq7pPhDXy3vbSxiQ5nbILzLc0+a655OZs/32OTJwGMgB4cAGnh
         LBW8PlxolZpCqoOvAfPyx0R2ts5ygWSxScrRNXaO94iMq2MyVPl1cB4IDmbu+Q7kfGtC
         sqTA==
X-Forwarded-Encrypted: i=1; AJvYcCXsLUeSDoRg81SqpRCXSgF6aOzn3sjLcg1tRIynqJTH73LaXA81oTlfrm/fIM5ASg0myRDYO3E6/+4Z3Dc5@vger.kernel.org
X-Gm-Message-State: AOJu0Yy25S+ZQJZ6aJXgixN+bHTNzRquVSDRo5y6eFj7r7tzwirgh/dO
	RvExitVwQ7bktBnhnIod0H0UdhgNI6uTR+jZ4m8hoHeghlTJsn19iFAy2d2sz0DZ2bD4m/5ts2W
	3ZvnK5k56cVhV0fMUrn6IjSCRFscoirmGKPtKVNJwf3NGBnMnhTr9ooXo+NCSb9ydw2o7AN6T5W
	d9
X-Gm-Gg: AZuq6aLpzMsr9FMeiz0+zal68/NO9S48RGHIsSW0MtgJAcU4rqsHzbROUjpPNraXaYM
	pTvf9SWt9GD1MShfq3lDxkqGAmnp8Vr6DN3EhzjMg9FbdKzZiOS8iit2zEdcqdZ0vghxYjDI01j
	a1BkUDmQnvvnLMP42JiP36QHmGYm5zAi8NNgFpKJcE66MNUgYAXV0DsF2HbS6RmICDoTSpmaWoV
	b3sa8nW1xCNKlVDNuUSleTYvbidZGwJq/GYwYUcyh9rrMMHl2YpFVVaJlUjBXl6vn6ajapu2qyS
	jUKcdxiucIksMrHqd6SbodJRyQZiHcFrIgrDdfvCcSjtE93fL5FI1eEnJCgWaLsVM7HhI7jHbLm
	/HILqOG+mS6BQhZFm1Fcnh211CV3khV0F/FLaCzAEsf88k8tIYcx0OjPDweQjGAasUY81LGLR
X-Received: by 2002:a17:903:41c2:b0:29f:3042:407f with SMTP id d9443c01a7336-2a8d96a521cmr137241245ad.21.1770097917904;
        Mon, 02 Feb 2026 21:51:57 -0800 (PST)
X-Received: by 2002:a17:903:41c2:b0:29f:3042:407f with SMTP id d9443c01a7336-2a8d96a521cmr137241115ad.21.1770097917398;
        Mon, 02 Feb 2026 21:51:57 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b6e4189sm157424735ad.83.2026.02.02.21.51.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 21:51:57 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Tue, 03 Feb 2026 13:51:18 +0800
Subject: [PATCH v12 2/8] coresight: tmc: add create/clean functions for
 etr_buf_list
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260203-enable-byte-cntr-for-ctcu-v12-2-7bf81b86b70e@oss.qualcomm.com>
References: <20260203-enable-byte-cntr-for-ctcu-v12-0-7bf81b86b70e@oss.qualcomm.com>
In-Reply-To: <20260203-enable-byte-cntr-for-ctcu-v12-0-7bf81b86b70e@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770097896; l=6192;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=iOBlKE7wcNNqdQg697EHs/307n7EmzHjJxd5G5rMLIU=;
 b=VqcnM4vNbyRGQwAS7LjKD/ijBNX9/5TItxTwYFrPQTUdNQ8N938fH6Incwj8y6Zf3Ls5c9MmF
 ihumcsv1vgPCwdqoLuvnKUdD2LhamMVlLN8dukCCpdJdg7i699WMtMU
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-ORIG-GUID: 6hmYg0yEH3wY1bcOX_37eJm53u0O6M-Z
X-Authority-Analysis: v=2.4 cv=VJ/QXtPX c=1 sm=1 tr=0 ts=69818cff cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=AScg1gZdVb1XvqdcXssA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAzMDA0NCBTYWx0ZWRfXzCv1A28sMpz6
 Q4d5CNcY982oxRGOxbDsbOrBN3kDnLLKFHp7CmE48LDGphARYsi6kgpBs8tkFAxXAIE6pSaIS6E
 fW5lXw528TU1Z30ycaIurQkpWBGT+9BiwtVAZF14KvUNYr3GmQmodPmrskN5tCPoNlYPCERk0oN
 QUKFdjIx1Jy2eHen9kIqJmx5FT6ihG2ywO0rh5ZDOPzSou6ZDborHJPKcqt7CTIrXmHoPKPuzaT
 Y/PoCfqs9JIiW1e5Kz3KGnH2eSnOwp34dZ0ID+UKdz8IGndMRMFjtxASWaABLUjqKgCZ8rMKsex
 Xxy5M44OfrRWSefjqI3QKmjOGyRG71sDmgxGVkC7euX3dFsM0xWEg86eivSbZ1QbPHeFiVBt+6r
 8Fvq9jv/B6I22FjEUe4BJmF6d9GbNgkES+A+vRXuPg2OGgjd3pqf3KTFyuqPCbjLZE0ISY+cNL0
 QRQ5JJdjclXX6HWkA1Q==
X-Proofpoint-GUID: 6hmYg0yEH3wY1bcOX_37eJm53u0O6M-Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_01,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 malwarescore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602030044
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91583-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,linaro.org:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 44148D4DB9
X-Rspamd-Action: no action

Introduce functions for creating and inserting or removing the
etr_buf_node to/from the etr_buf_list.

The byte-cntr functionality requires two etr_buf to receive trace data.
The active etr_buf collects the trace data from source device, while the
byte-cntr reading function accesses the deactivated etr_buf after is
has been filled and synced, transferring data to the userspace.

Reviewed-by: Mike Leach <mike.leach@linaro.org>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-tmc-core.c |  1 +
 drivers/hwtracing/coresight/coresight-tmc-etr.c  | 94 ++++++++++++++++++++++++
 drivers/hwtracing/coresight/coresight-tmc.h      | 19 +++++
 3 files changed, 114 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
index 36599c431be6..1ea255ffa67c 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-core.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
@@ -840,6 +840,7 @@ static int __tmc_probe(struct device *dev, struct resource *res)
 		idr_init(&drvdata->idr);
 		mutex_init(&drvdata->idr_mutex);
 		dev_list = &etr_devs;
+		INIT_LIST_HEAD(&drvdata->etr_buf_list);
 		break;
 	case TMC_CONFIG_TYPE_ETF:
 		desc.groups = coresight_etf_groups;
diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
index e0d83ee01b77..cbbb15648fb7 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
@@ -1919,6 +1919,100 @@ const struct coresight_ops tmc_etr_cs_ops = {
 	.panic_ops	= &tmc_etr_sync_ops,
 };
 
+/**
+ * tmc_clean_etr_buf_list - clean the etr_buf_list.
+ * @drvdata:	driver data of the TMC device.
+ *
+ * Remove the allocated node from the list and free the extra buffer.
+ */
+void tmc_clean_etr_buf_list(struct tmc_drvdata *drvdata)
+{
+	struct etr_buf_node *nd, *next;
+
+	list_for_each_entry_safe(nd, next, &drvdata->etr_buf_list, node) {
+		if (nd->sysfs_buf == drvdata->sysfs_buf) {
+			if (coresight_get_mode(drvdata->csdev) == CS_MODE_DISABLED) {
+				drvdata->sysfs_buf = NULL;
+				tmc_free_etr_buf(nd->sysfs_buf);
+				nd->sysfs_buf = NULL;
+			}
+			list_del(&nd->node);
+			kfree(nd);
+		} else {
+			/* Free allocated buffers which are not utilized by ETR */
+			list_del(&nd->node);
+			tmc_free_etr_buf(nd->sysfs_buf);
+			nd->sysfs_buf = NULL;
+			kfree(nd);
+		}
+	}
+}
+EXPORT_SYMBOL_GPL(tmc_clean_etr_buf_list);
+
+/**
+ * tmc_create_etr_buf_list - create a list to manage the etr_buf_node.
+ * @drvdata:	driver data of the TMC device.
+ * @num_nodes:	number of nodes want to create with the list.
+ *
+ * Return 0 upon success and return the error number if fail.
+ */
+int tmc_create_etr_buf_list(struct tmc_drvdata *drvdata, int num_nodes)
+{
+	struct etr_buf_node *new_node;
+	struct etr_buf *sysfs_buf;
+	int i = 0, ret = 0;
+
+	/* We dont need a list if there is only one node */
+	if (num_nodes < 2)
+		return -EINVAL;
+
+	/* We expect that sysfs_buf in drvdata has already been allocated. */
+	if (drvdata->sysfs_buf) {
+		/* Directly insert the allocated sysfs_buf into the list first */
+		new_node = kzalloc(sizeof(struct etr_buf_node), GFP_KERNEL);
+		if (IS_ERR(new_node))
+			return PTR_ERR(new_node);
+
+		new_node->sysfs_buf = drvdata->sysfs_buf;
+		new_node->is_free = false;
+		list_add(&new_node->node, &drvdata->etr_buf_list);
+		i++;
+	}
+
+	while (i < num_nodes) {
+		new_node = kzalloc(sizeof(struct etr_buf_node), GFP_KERNEL);
+		if (IS_ERR(new_node)) {
+			ret = PTR_ERR(new_node);
+			break;
+		}
+
+		sysfs_buf = tmc_alloc_etr_buf(drvdata, drvdata->size, 0, cpu_to_node(0), NULL);
+		if (IS_ERR(sysfs_buf)) {
+			kfree(new_node);
+			ret = PTR_ERR(sysfs_buf);
+			break;
+		}
+
+		/* We dont have a available sysfs_buf in drvdata, setup one */
+		if (!drvdata->sysfs_buf) {
+			drvdata->sysfs_buf = sysfs_buf;
+			new_node->is_free = false;
+		} else
+			new_node->is_free = true;
+
+		new_node->sysfs_buf = sysfs_buf;
+		list_add(&new_node->node, &drvdata->etr_buf_list);
+		i++;
+	}
+
+	/* Clean the list if there is an error */
+	if (ret)
+		tmc_clean_etr_buf_list(drvdata);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(tmc_create_etr_buf_list);
+
 int tmc_read_prepare_etr(struct tmc_drvdata *drvdata)
 {
 	int ret = 0;
diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
index 95473d131032..9b3c4e6f0a5e 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.h
+++ b/drivers/hwtracing/coresight/coresight-tmc.h
@@ -208,6 +208,19 @@ struct tmc_resrv_buf {
 	s64		len;
 };
 
+/**
+ * @sysfs_buf:	Allocated sysfs_buf.
+ * @is_free:	Indicates whether the buffer is free to choose.
+ * @pos:	Position of the buffer.
+ * @node:	Node in etr_buf_list.
+ */
+struct etr_buf_node {
+	struct etr_buf		*sysfs_buf;
+	bool			is_free;
+	loff_t			pos;
+	struct list_head	node;
+};
+
 /**
  * struct tmc_drvdata - specifics associated to an TMC component
  * @atclk:	optional clock for the core parts of the TMC.
@@ -243,6 +256,8 @@ struct tmc_resrv_buf {
  *		(after crash) by default.
  * @crash_mdata: Reserved memory for storing tmc crash metadata.
  *		 Used by ETR/ETF.
+ * @etr_buf_list: List that is used to manage allocated etr_buf.
+ * @reading_node: Available buffer_node for byte-cntr reading.
  */
 struct tmc_drvdata {
 	struct clk		*atclk;
@@ -273,6 +288,8 @@ struct tmc_drvdata {
 	struct etr_buf		*perf_buf;
 	struct tmc_resrv_buf	resrv_buf;
 	struct tmc_resrv_buf	crash_mdata;
+	struct list_head        etr_buf_list;
+	struct etr_buf_node     *reading_node;
 };
 
 struct etr_buf_operations {
@@ -445,5 +462,7 @@ struct etr_buf *tmc_etr_get_buffer(struct coresight_device *csdev,
 				   enum cs_mode mode,
 				   struct coresight_path *path);
 extern const struct attribute_group coresight_etr_group;
+void tmc_clean_etr_buf_list(struct tmc_drvdata *drvdata);
+int tmc_create_etr_buf_list(struct tmc_drvdata *drvdata, int num_nodes);
 
 #endif

-- 
2.34.1


