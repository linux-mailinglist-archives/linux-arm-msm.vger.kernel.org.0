Return-Path: <linux-arm-msm+bounces-93588-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UCt2Njf6m2l5+gMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93588-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 07:56:55 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 588C51726F6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 07:56:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0515F30300EB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 06:56:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAA88349B05;
	Mon, 23 Feb 2026 06:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nOCpoty8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gE41fMM4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38A7417B425
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 06:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771829782; cv=none; b=RjNhIz99knmIktoLooXIPcMZRFJyE1sUakAB0Iv9gCLES60ODsZPt/ySDdf9IJd3OMeyZWkgaufgNRcf2fdqAs33zcp+et8/JkIaRPOm3vg91ZjekvsRXVNeFM5elmLnN0yGpz41rcYzJ8ICutT9g+Oj3/T+85OWHOcHWLyS5mI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771829782; c=relaxed/simple;
	bh=nzaF2yP3ATiqQC37LSxmXVL9MqWLOY4wwOUNTmvz/UA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eFKk2W+6M2Fo2bJfA3dQeulRzjH8tyj0MW17LmBUmkDxrDiuJJ+SFyw8rRu9d8mms5bJwC4z5k6WniLSEN5Tm4etRwYhunarC41733+nOWLwlW6bVBUD0PpwmHh5e2fnHCvv6IhPHEDHwhanFdCPhYP9IpCS5w4YU9860IJKSPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nOCpoty8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gE41fMM4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61MLrK4k3486255
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 06:56:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V/JNJXfM7FDohbLniT/dm0wA/+qShrtEurl8w70+rXY=; b=nOCpoty8Ol1Z/F+c
	STJO8lPVua66zACAjSvg9aDjtsDa8i67swd2frevuCLX7ZhniqB4FQzl7ztImc+B
	7VmkHkMk0D5yMAe6UPylmDJ9kTIjmYJMdcnrfXFzKxln73BIrx+BsGbYO4A8nCe2
	zN/r3lOrUsD8QX8PMoqoNNNdLLtzS2o8eEr+B2WHxskcO5dWdMgTHk0RFUacqwoZ
	uaMdxlZinw+tJhKiKi1GCroa3145SbdUqO/P63YVRi5qiZQ+mKTbcERTnxQEz0GJ
	ds4qOjRHrKGEpsxTMR/KXqO/oHKPePnV3a78ttp+ueGATNvQjKWhgmxb7tnd2IuE
	RhRJjw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5u8kpqy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 06:56:20 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2aae0d40a47so379972885ad.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 22 Feb 2026 22:56:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771829779; x=1772434579; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V/JNJXfM7FDohbLniT/dm0wA/+qShrtEurl8w70+rXY=;
        b=gE41fMM4qihPZepdeT0aYDg+BVENBG+XyPUtynmhgozmEBJJhIzKTVm5CF7ttYe9nz
         TI+ns7Ldx1tpLx3bLzAu2g6dRYCtkoJmGTpoiSXHuQJy1XJ+6kJgxMXiPjH6zk0ky9aT
         sGEF3VMA51NG1bUkqMWEjt3cDJbN3b2KdAzLdG0x+RwRCLos84nCR5Hl11gYzYVP6NTV
         TQMkN+RlGOd+O/RRsK0HbAlIGXKQh3j4XSLhXhqnXbpwy/d8DyY0Cuy6ynFdDQZR8Jh0
         PIpkx8n29+G+xtdq8yMOVluTsvSUbpw/f6vDuuejsAoVOe4UQPzPGAdLYQHDFH8YZ+he
         eMxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771829779; x=1772434579;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=V/JNJXfM7FDohbLniT/dm0wA/+qShrtEurl8w70+rXY=;
        b=Nbfd8Z0fky/ehafARpsY4NunZzotP4cUMI0nqyVrtqrHyunPOOSglCoCRC0q5XuZCr
         F8/TOb2ECed1WiuARBfY9z5qYcDBrVL7xX6Ju+ValAywXBynk97AtbSAcX9TGQChI/ZA
         Vzq5wu9eKiK1LIiTRmB6ZWpVzs0YNaJHmsUY2LxGk+QUSrcwE0+2trwNyfgG2nnnnW95
         m6rizGq1CjxYCXzgCd6L6t2zHsWrr97H1vR1gL089hHurAjnv7rTppDUcGbT0+DudcLi
         Fc6P3IZ2Hm6Htry+n0W8oPdMZHGOIhiLd9S5CPpA62NhgZ2KPtSSRTE0WLTbjHjD1WFB
         5AfA==
X-Forwarded-Encrypted: i=1; AJvYcCV77+G+qBSc1F/ObZ1qpPAMtYNOv9pJQP2RoSnZ3NK+wbUboHqs15SCTl50mhZyBuimWk+9ERs70SNXQUGN@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6w32/SMImD5/0RnwiNdz2hwE5+GFM3l2SbRj2V0VDTGwV7eVd
	6UmrFqk7vSCc/QAwfmHBv8Jy/ahKg18HreZ39bVbTBN0+XjD3pKXLTev/pB7Ui+O9KvAeamUvJC
	wqzlyRU7lP8WwX62fNIAGhGyv0xX9v/C/d6hnQjrxAJewTg+rrkafLTf+JBqgTyOl7Y0s
X-Gm-Gg: ATEYQzw3on4lvBUMQC0SUgkk+Ubct7CEBloICm/LNltKb/JFXDChb/8SENJrkpQEZyU
	L7qQ3P3v3cIyLjaktta19+QjaQD5ZhMlLQtbZeA+X0BKu5gWUWEXgSRu1DQVh7pid98CoBWOO+p
	xbo9l644wODkOBB2EQ/QpIItq55cPrhdoZ+ddjGDYuHMqmb7y5uKDmq6g/M+IWGYY3609hBUBqa
	GBpobXVaYFUC2t6fpsD7G+KOsQKHgaX2w5ntWWCDowuky6tMq63+9Y3odAghXAeOHpZGC9PA+wz
	CFHR2sx+U8IsDE74VjEX/hGrvUHb59cNW39L6VtsroKPNnPehyLf4H7sh26IaT6D17f6qowWzkb
	QDnWbS7Pl4voW3oqBDkTO8Zh1AHvqa/4F6p59pvZYmQJh2KQk8tBJdcO4IlKw33tW7kRTYolpiv
	pqmR/UFql4qpLg
X-Received: by 2002:a17:903:46cf:b0:2aa:d7fe:8611 with SMTP id d9443c01a7336-2ad745053a1mr64820805ad.27.1771829778966;
        Sun, 22 Feb 2026 22:56:18 -0800 (PST)
X-Received: by 2002:a17:903:46cf:b0:2aa:d7fe:8611 with SMTP id d9443c01a7336-2ad745053a1mr64820505ad.27.1771829778495;
        Sun, 22 Feb 2026 22:56:18 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad74f619f8sm62249225ad.36.2026.02.22.22.56.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 22:56:17 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 14:55:41 +0800
Subject: [PATCH v13 1/8] coresight: core: Refactoring ctcu_get_active_port
 and make it generic
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-enable-byte-cntr-for-ctcu-v13-1-9cb44178b250@oss.qualcomm.com>
References: <20260223-enable-byte-cntr-for-ctcu-v13-0-9cb44178b250@oss.qualcomm.com>
In-Reply-To: <20260223-enable-byte-cntr-for-ctcu-v13-0-9cb44178b250@oss.qualcomm.com>
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
        devicetree@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>,
        Mike Leach <mike.leach@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771829765; l=3771;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=nzaF2yP3ATiqQC37LSxmXVL9MqWLOY4wwOUNTmvz/UA=;
 b=94yEoy4nSurylGbRJ0V5DPEndCwAjFuBsRD2bm90sDL2wEYpjo+ftcY8uF8dOdxn5+dK39Pel
 aqeOr/cHOkmDuryVpmHsj9VAY7E/kW2NMP6mlBzkXRgdZD//Fi9xYV4
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-GUID: NTnzv-nJBjXV_PV_aJiBsyHUSVXNV5hf
X-Authority-Analysis: v=2.4 cv=cJftc1eN c=1 sm=1 tr=0 ts=699bfa14 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=qQZ2XtAyJf2dEkEvaVsA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: NTnzv-nJBjXV_PV_aJiBsyHUSVXNV5hf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA1OSBTYWx0ZWRfX7hm2/UQpttJj
 JjIo0tSq0Ioz2fiu5H2a3/IcFir37+0yGHHOzitomLmJeKHdOG1hpwysVanbmamTUw39tnI6n5x
 q3yZXKSKiNpELzfDq9KC1XfcUDUyD57ZFd9MFbdqts2zwaeccV4VXh/eDrVLxy1tDwIXUReQAfZ
 9i2oAiRzBZ/JwRg+HSoxefmUAcN194fojpYOlV8K3GGgnvGG0kTZ2pp+053Dc+9IOnfK2Pw27uO
 2vpOpClMcPR7/P9Uf/kOx54y+UJFdpUDsZCVexjuENZ1itejzpqJHjOEN/8Zl82lcbVfbRuvbqE
 bWqFSpIokjEuxeUiu0xKh+fjHgTdqeio+xbrf+4Ug9awvpgoFXrLnccyNgkTY4NtaH7tYCvJ8tS
 Sui6dqvFDZ4fVUAyhq92aii594Q/lBoOYnzSqaC+n7fbtWHWkyVKTbzprEjXcqnZzOpvVVu4TCl
 w7YtUFYhgULHsfu0x+Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_01,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602230059
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93588-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,linaro.org:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 588C51726F6
X-Rspamd-Action: no action

Remove ctcu_get_active_port from CTCU module and add it to the core
framework.

The port number is crucial for the CTCU device to identify which ETR
it serves. With the port number we can correctly get required parameters
of the CTCU device in TMC module.

Reviewed-by: Mike Leach <mike.leach@linaro.org>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-core.c      | 24 +++++++++++++++++++++++
 drivers/hwtracing/coresight/coresight-ctcu-core.c | 19 +-----------------
 drivers/hwtracing/coresight/coresight-priv.h      |  2 ++
 3 files changed, 27 insertions(+), 18 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index c660cf8adb1c..5f55f0c510e4 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -585,6 +585,30 @@ struct coresight_device *coresight_get_sink(struct coresight_path *path)
 }
 EXPORT_SYMBOL_GPL(coresight_get_sink);
 
+/**
+ * coresight_get_in_port: Find the input port number at @remote where the @csdev
+ * device is connected to.
+ *
+ * @csdev: csdev of the device.
+ * @remote: csdev of the remote device which is connected to @csdev.
+ *
+ * Return: port number upon success or -EINVAL for fail.
+ */
+int coresight_get_in_port(struct coresight_device *csdev,
+			  struct coresight_device *remote)
+{
+	struct coresight_platform_data *pdata = remote->pdata;
+	int i;
+
+	for (i = 0; i < pdata->nr_inconns; ++i) {
+		if (pdata->in_conns[i]->src_dev == csdev)
+			return pdata->in_conns[i]->dest_port;
+	}
+
+	return -EINVAL;
+}
+EXPORT_SYMBOL_GPL(coresight_get_in_port);
+
 u32 coresight_get_sink_id(struct coresight_device *csdev)
 {
 	if (!csdev->ea)
diff --git a/drivers/hwtracing/coresight/coresight-ctcu-core.c b/drivers/hwtracing/coresight/coresight-ctcu-core.c
index abed15eb72b4..78be783b3cb2 100644
--- a/drivers/hwtracing/coresight/coresight-ctcu-core.c
+++ b/drivers/hwtracing/coresight/coresight-ctcu-core.c
@@ -118,23 +118,6 @@ static int __ctcu_set_etr_traceid(struct coresight_device *csdev, u8 traceid, in
 	return 0;
 }
 
-/*
- * Searching the sink device from helper's view in case there are multiple helper devices
- * connected to the sink device.
- */
-static int ctcu_get_active_port(struct coresight_device *sink, struct coresight_device *helper)
-{
-	struct coresight_platform_data *pdata = helper->pdata;
-	int i;
-
-	for (i = 0; i < pdata->nr_inconns; ++i) {
-		if (pdata->in_conns[i]->src_dev == sink)
-			return pdata->in_conns[i]->dest_port;
-	}
-
-	return -EINVAL;
-}
-
 static int ctcu_set_etr_traceid(struct coresight_device *csdev, struct coresight_path *path,
 				bool enable)
 {
@@ -147,7 +130,7 @@ static int ctcu_set_etr_traceid(struct coresight_device *csdev, struct coresight
 		return -EINVAL;
 	}
 
-	port_num = ctcu_get_active_port(sink, csdev);
+	port_num = coresight_get_in_port(sink, csdev);
 	if (port_num < 0)
 		return -EINVAL;
 
diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
index fd896ac07942..cbf80b83e5ce 100644
--- a/drivers/hwtracing/coresight/coresight-priv.h
+++ b/drivers/hwtracing/coresight/coresight-priv.h
@@ -155,6 +155,8 @@ void coresight_remove_links(struct coresight_device *orig,
 u32 coresight_get_sink_id(struct coresight_device *csdev);
 void coresight_path_assign_trace_id(struct coresight_path *path,
 				   enum cs_mode mode);
+int coresight_get_in_port(struct coresight_device *csdev,
+			  struct coresight_device *remote);
 
 #if IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM3X)
 int etm_readl_cp14(u32 off, unsigned int *val);

-- 
2.34.1


