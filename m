Return-Path: <linux-arm-msm+bounces-91582-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +BbqH/6MgWl/HAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91582-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 06:51:58 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 23823D4D14
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 06:51:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8425D30117C5
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Feb 2026 05:51:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AA70366DDB;
	Tue,  3 Feb 2026 05:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Kc5+5Aid";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KOT/YryG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAC74226CEB
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Feb 2026 05:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770097916; cv=none; b=JjPkdTiF5bzHjo7HaT0NipLmcDqjR343Fp8n/LH4YiFP7U3R9wuebCSWvGqGp2ro6j96L0WdHHm+dfpncURvp/58lcGGuS0B8S5dbmkMFdj3IrFT/he2U0fcMRh54JMKyeeeGiTVGWbILTJFOH2h1AbecRlNw+GCr07f3EEF3aA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770097916; c=relaxed/simple;
	bh=nzaF2yP3ATiqQC37LSxmXVL9MqWLOY4wwOUNTmvz/UA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A6bsnyJjJizfL0o7NHMlwj21czHqzNQcfb1ZDUOWD/YmxeO+1rssaxrTEu+sMWy0eDLDm1gkoWSzAfYdWAseqMOpj+UilwHOLe1KqKRMIIh2wnn3+n8XFRuH5NyqVOJKXiyNcpZpu/hZZybmL4PFeqnkZokCMY83y1oy+34SOgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Kc5+5Aid; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KOT/YryG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6132ebq33386845
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Feb 2026 05:51:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V/JNJXfM7FDohbLniT/dm0wA/+qShrtEurl8w70+rXY=; b=Kc5+5Aidb3REAC1G
	ke09e+x+zNjfgc3Myt2Df455wKfo6lNGhf1VNCeY5wj4zedcyDghrniCw4v2+vcB
	281+jmmbfFaBBEwNcjywDZxJSv5L1vyOJym4SObSqDHdKlunznDcSNup4w4w6LCr
	IC/YCsMSe4l8+oVj+gy3gJJZlp5abIxub8zL8LG9OmnhcveQ3xWSyyBL/oAeVRvN
	IMEzORnDEI843D3VElopMBndhoGAWw7Dj8kW1pchrj86CWB0ANgMUmJnhWtZORI9
	gPjreJDR6iX05Yv41esSyssUW2UkYp1jQ83UBeBnfXPqEtIU3sw75vnyhIQO9f12
	0bVUQQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c2xvbt7u7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 05:51:53 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2a784b2234dso145773335ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 21:51:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770097911; x=1770702711; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V/JNJXfM7FDohbLniT/dm0wA/+qShrtEurl8w70+rXY=;
        b=KOT/YryG8ADIasFl2Q0Bg0Jxi45ZKE13Zv/SiWWy2w2nLP2Z14xSPE6W2foZgdGXNf
         5JfD53UDi7KjRPinvSA+8vrCaAJp7zEo7HlfCwo304EYR0CUQP/Bld425zJ2cl8HeKi/
         qfW2s1RhTc0M2Sbp1zyuS6Z+cp8NKXFFDuurTWbNO9U7UUfiZ9sxrcT2wJH/KRlSj7vr
         any2rt8lvcCFEwmGx/GYvNv3f+ZObR4H3kQkRw9aw1wEFfwKO3TGAofM1iV1r8wbgvNo
         Z+iNrQXk0Qi1e8tTzWqeeimgd41cy1Mt//zt7+hFDjP4zBCMCAfzFi8GxvdP9S8GNErH
         fJ9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770097911; x=1770702711;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=V/JNJXfM7FDohbLniT/dm0wA/+qShrtEurl8w70+rXY=;
        b=oASJyiMqAwj/geRupkCUUZsklMzLXcuoSRNDxrw2coXsPK/1udkJSs18kviHU67Qg3
         QBQccDW3vo4xpQ/pNTzNya9Kh7IZmLI5dwgs3wXynWOsD9Qs/G3E4FXCqLnnNq78UiLo
         NITIweWyIGNargrXAfUSLv2Y1SqhYh/Jtck6uNNswcfdjwvf5qAXg8plfN1FT5bjBskf
         huWLyyrmPghM/XiRxDcHvparhQNa5yT90tlbk6Q2o9dCVbZoIGdkkzXO59Xyg77UrFaR
         GJ+/xPS9t2SNQRQ7kfWsYpbHnDk2bOju1SFhEmS0YCQcO/p105UkTHSypxzUsy6xK1UA
         AIvw==
X-Forwarded-Encrypted: i=1; AJvYcCVgOMkMycvj+Z2OGpLQdvG48GtGc56dChHhVzTt4mRCZbmAL19/mGFeUHxe2LqOrSR1ypyyusnLs7OOK/Pk@vger.kernel.org
X-Gm-Message-State: AOJu0YyyN8HE3bbjG8kiwv5XdYGOrmn0H2H/ZygnJRSavWhEd5zO3p7J
	fOayRMz5YUu+/zrSx9h58I+oCnSN1kRz5fW/JheXADmhAHkPTZKkqOD1yEqGZRzlO9yUr+OpNp+
	ndLeK83unmmfjX4bb6k3ZBTrOqDhryaZdwljqUjaylQb69pfVSaOftDTwD/ChKHfIRYMdR7Ra2Z
	9D
X-Gm-Gg: AZuq6aJFJtiwtA/GyTY+P2d1N4ryfB34Ex+Qz61J+3kKw8yuIvmPmOL/4wU92TK0Zr/
	gMQVRhJzyI2c+jF1KIQdHV/JBnjvQFyGpq6igB7pxBAOCCYY5IRyn5Qzzr3+v2QAjOPhRCiIAq4
	psbFTlfGlMBhjek1vAgpeSFtQh29YV3c5NuOVM07FN5qHAfhKWTcaG374tXuhBcdLMn1DEO98ki
	INxR4bHj5OZbxaAi33Bx8Fiy4bmrwvlSxmJt/JNymJL345nPK1HLJF98Vi4TlcrmdMqVfFAh+ZN
	lybDjwwLWaH3nS6DGgfwn/gWEpEwm/pdK6uj7wQXtEIVkYik9nzrGK9eg+UFd5i3kCzbZzhW46C
	JtqTqQAhoK4PaSpGj/cQWqi7Eptpz8lgFuFHh+RFOfatNzMKR+Na8yred82TAscsUOj93J9pz
X-Received: by 2002:a17:903:3e15:b0:290:c516:8c53 with SMTP id d9443c01a7336-2a8d994f3a3mr92432345ad.40.1770097911513;
        Mon, 02 Feb 2026 21:51:51 -0800 (PST)
X-Received: by 2002:a17:903:3e15:b0:290:c516:8c53 with SMTP id d9443c01a7336-2a8d994f3a3mr92432175ad.40.1770097911032;
        Mon, 02 Feb 2026 21:51:51 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b6e4189sm157424735ad.83.2026.02.02.21.51.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 21:51:50 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Tue, 03 Feb 2026 13:51:17 +0800
Subject: [PATCH v12 1/8] coresight: core: Refactoring ctcu_get_active_port
 and make it generic
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260203-enable-byte-cntr-for-ctcu-v12-1-7bf81b86b70e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770097896; l=3771;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=nzaF2yP3ATiqQC37LSxmXVL9MqWLOY4wwOUNTmvz/UA=;
 b=pWy43CaYoKueLn4k+QHMpLlbjvhPJdeqt0RH1YtNLHBUD5VRBzTiVeUCJeC3H6dSaokWtzCPc
 /0ltV4l8ISEAGDviAXJSq5VJuQ9V/sIUpTvPn+F4d+9g8UsK4JfocOf
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-GUID: vp8KqVxcWjrbuBUc-PN0-tOHWyKs5Hdz
X-Proofpoint-ORIG-GUID: vp8KqVxcWjrbuBUc-PN0-tOHWyKs5Hdz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAzMDA0NCBTYWx0ZWRfX6wb6AcMILUz7
 ozcsEBCxqc5gqzR2Nio5ew0znL2mgjLBWMdQnFCr7WVFF+viRCPn306XxKi2VU00Fj9/RFEnE3Y
 jfZK4QonCGRYoG1ftm9wyV/JSvprumjTyBgi7zxZHWVSrmZE0643jCscdttu5dns/sPqiF0VDAX
 ZueKHzynZ5CDNs1HHjpWsgzY9GwhtIttS0UPSexL7wRd+LXb5U5/YzPraTuK64RiP6dspNURW+3
 QamB10pcwTeC/gNPddBTroVeJAuGBRRRwQ4a+Wuql8rPiw2a6omfcYd7xGC6+mzv/8R/+63KjYT
 cYmmbl67TGBVBe7U9NWEbXNSSnIIQqwCFVbh77B+Wv8Yyscs16plNTuU8jzmk6e2sVjrkOoNeNl
 yQ6VPIsm9ht/fpEVJkBYwwjo1LolPzE5ddPMT+ce4Ra8xiTK2uLPlpfLNedo+uah9fKqcOk4lDF
 4DzkAGQP/XNQlFiJL0w==
X-Authority-Analysis: v=2.4 cv=AurjHe9P c=1 sm=1 tr=0 ts=69818cf9 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=qQZ2XtAyJf2dEkEvaVsA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_01,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 suspectscore=0 phishscore=0 adultscore=0
 malwarescore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602030044
X-Rspamd-Server: lfdr
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
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91582-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 23823D4D14
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


