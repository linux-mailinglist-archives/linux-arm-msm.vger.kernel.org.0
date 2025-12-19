Return-Path: <linux-arm-msm+bounces-85760-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F032CCE546
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 04:10:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C34C7305D7B8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 03:10:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4642B1DF261;
	Fri, 19 Dec 2025 03:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LPvR9dQR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Gx2l6ic3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F19828C862
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 03:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766113829; cv=none; b=Ij5Cv7SyVwE5N0BqPVDmAS5L6UpjYETGJpXVeVW4OMYjVT2x9/s191Uf/rTRxuqwUUnBugP64WWCtd5FJ7FIUjCH8rzoWjmMLR0sJTvA8tVyVqDVVrSYWVEwR17n/ykpHBa7ZXCQJ7DYYj7SydtxhbHR4qIOq7vde/5PZYRC9Sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766113829; c=relaxed/simple;
	bh=1KgQnlB41KBaC2DG4Yj9ulDgjSoB7PMArv6hECtKgus=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=c5wm6s/JyUha7V9k7iAGeSJU2ZpShFqI5vOGcWscTloXMOa8CdbwFFmVtWnC9GaeFn08jcUQlVy/WmuYdJPK2C1NC7VJHdw/z91Pd4X2Hm6/QgNpIXLExpj67cU92FWNb5dvgbIgYohnzl18nsF344d6roDxSwlCDPKon4VT38M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LPvR9dQR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Gx2l6ic3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJ2O7r31486785
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 03:10:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=imtAR/C7wDh
	u9pVrr0JhhByoc7Qoc/nTvrS7itb8mJQ=; b=LPvR9dQRKcszDMBfrL8l0Vrxo/Q
	q4UyTUIdMm1kTqRorp6kMCCpuDfYxMR+lKJcmZzTRJNfSM6nID/J2BpxRDr79axT
	MeYUf3uNpTP+OlqyUo1X8YuOWKj+p/MV2JyCXcARr0NAZTcOPREpAkGnHhtSjtdl
	NDxtc8cRJCM4O3d9Fpqw0Ll5ZAqP+SK/46IM8ZbdzCXu9CYxqA0nzRIUFtsMogA5
	aG28zsiC8rZl+MxtVA+d9DIw6isJRJLM+ZzU3sRffPW/MLYJzJe6k/f91EgFgpAk
	FR2PP5o9c3WtI8bUMWTNDHHXldKZYmdv61ekO3GiAVY4K1I0BQZHFrTrqew==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2bh0jh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 03:10:26 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-34c38781efcso2396551a91.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 19:10:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766113825; x=1766718625; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=imtAR/C7wDhu9pVrr0JhhByoc7Qoc/nTvrS7itb8mJQ=;
        b=Gx2l6ic3JzF6hLotN/i4bArWRshDrq/Q6a9vwIA+on5hcX8K9pbPCEunHWHvlCf4+H
         xGj4D88fvMnSbIJ2S2fxpWNhILWQJ0HbpO+GZ4P2YmGzHiEyeEeQTjgMQHv04nhAMqHv
         AKZ6hgsp6KJDM3TaS1jU3W7Bou9pGAeTajRCUaI7h5o2M/eXmkfVfzgp35gO56ZuoQWI
         q08LHXgZgIrAiwshDXR3XSKGytN4DnFSc/CHvgnpRPV1j3hRqprdCEpZ2zJIC7eP26wt
         y4j6lXBUpjl+nLD74RZSbonZnUMUWHaFRkgmx4FsoO/pos6bGucHWU5prc7nn1O+gUS/
         cz1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766113825; x=1766718625;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=imtAR/C7wDhu9pVrr0JhhByoc7Qoc/nTvrS7itb8mJQ=;
        b=H5O2BWmdpzsHe63/p8QZ2cVikTQa0GqDB2KPYHqRrOn63EhMK41lOuUuvBAHuIYOul
         WhRNf6R13NnUn7VpUljr0ecMmt8rvVcRVJJi8oea5Dpq72bcCLPlRC17vVUSg5vCGXY2
         evZLWOjPhQwDJlbayoDMuz1Gf6mRsSQojxflEER3kU4ottx+zBIUKVs+NgIt/6rZ0bEt
         3UdO+o51BG1o/PbD1PomN5ubx0XHCR7c7jj0eLeWUeSEOFAKBXhLx74B0D63fpn24TzS
         p7SoeXcbnemFS9lpdDIAhSrhrkJOt9F/81nhO7suY2cpPMKGj68aYatB3bmwDwTgBx/l
         y8zg==
X-Forwarded-Encrypted: i=1; AJvYcCX1pIqgXZdsgmR6eyW2Cjs0QIquXLqCvfZ+MXRkj5Ii7ez9BONTfTpayNrVEnUv8cEY123tF9PF/iFGJGX+@vger.kernel.org
X-Gm-Message-State: AOJu0Yyy6Egg5cA3Li9+Lh7NzGcQ3RDwH/YyOL944NCGZXqEMBIcnBhR
	fnEfraqmXI/mpZqgw8fnyGHoIF4uH4dhpEtT9wotvEane/ShJGMvm5rGXlqOjeShYokxqKE4q+x
	twCwSrycUyNXwJzA77udSLYPryELlqPlVw9TxBmikIaRjxJsL1Rb2ZdU1htKYmnbpRtzf
X-Gm-Gg: AY/fxX5L7DRRAZRc4c0nwU5RpOhGIcU5Dsqqk25zlfSXEK4zfYyk7VgFu4+D8htPWnf
	MiAbwOboqUHh6oCIuYShCJnBD1AFDGK5XMBXjudLbjONl+GjGzSYdQwJOt/X/FWHaESFxs+dkW0
	Fdr5r3OxPqCOWlYsCX4lEAAozgjstI5nWyiX2S6LKzdCPD6KGEL0/jYtfZhZPu80bcz1DBYIALk
	i8+gv21oIvFhlnciE1AuGGAMK7T+j49Px+d1ocLigagJgcLJI0U8ZK4AJ28jAQ06TmmbtWsvgfQ
	lfcFoy4B9woChribrO8ZHdTBKRA2a0rl26ToZSJonh+XsWUpj1KUu4XdTortMCMFuHT6wlrvhhn
	726yfrgvCUZJNy83TQ2fwCmuH5Lkrc+fdZqv365JwMLqoAePGmVYDwg6t2RBsA0IZzY5Yz0c99/
	8nkF+QlTkwSSf0g/05dYB0gQ2N2Wi4m9bVmpmxIec=
X-Received: by 2002:a17:90b:2e0c:b0:34a:4a8d:2e2e with SMTP id 98e67ed59e1d1-34e921b7ca2mr1336464a91.17.1766113825100;
        Thu, 18 Dec 2025 19:10:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFb9ZWK+oeRMMRCYJozlfCcOYjkREpySRVF4gwmiYA/MXbS22ApJNllDyU7QX8ZeVUVfFhBCQ==
X-Received: by 2002:a17:90b:2e0c:b0:34a:4a8d:2e2e with SMTP id 98e67ed59e1d1-34e921b7ca2mr1336433a91.17.1766113824629;
        Thu, 18 Dec 2025 19:10:24 -0800 (PST)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34e70d656casm3737867a91.7.2025.12.18.19.10.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 19:10:24 -0800 (PST)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: andersson@kernel.org, mathieu.poirier@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
        quic_mmanikan@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>
Subject: [PATCH v8 1/6] firmware: qcom_scm: ipq5332: add support to pass metadata size
Date: Fri, 19 Dec 2025 08:40:05 +0530
Message-Id: <20251219031010.2919875-2-varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251219031010.2919875-1-varadarajan.narayanan@oss.qualcomm.com>
References: <20251219031010.2919875-1-varadarajan.narayanan@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: fX91eC8PXeu8Tdkl1BTW1Hel3W-MTU9F
X-Proofpoint-ORIG-GUID: fX91eC8PXeu8Tdkl1BTW1Hel3W-MTU9F
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDAyMyBTYWx0ZWRfX1Q48HlFQmUY7
 vynoss94+ZkLj7GTTnfzqCYKJKFQ5rz3CjPxEwHglvBwDQCljiF9l4tGNYGMDR8LuGnZCz7nmY4
 XM8tHRQjoROMhAeq5bg0soBZ+fCIOmNnobie6uM1dky7s50yD1OEEzBJao/LCXoOrfdX2OIBluU
 TnjFR8Ica7Ftx1gYiOde52bc2f55ppsqUyL74wsa/zX4nHYLq6UQMXJJzEmhttFhaDjw2NUYaYI
 AfvlRECeETEubJ18EWblZh0+HD+OsgYOhrzm0M/pDS9zuLl3Vm6226l7ybfCl3e4/CEaW4sgfBd
 dn8eI3UGwRZafL2y0g1N8FfKLE2n2cVSj1Ls+SS79E02lBrP2MgCEC/FXXAeoyObLODU6uyfQP+
 12+gZYsdHGjv6lWpJfHTcTFxBgZFsWag+7yTb8L1wWhWzRD5CBz3E+DLJU734etcngV9ACQQApD
 8JNSquPPvLI6iN339/Q==
X-Authority-Analysis: v=2.4 cv=WYwBqkhX c=1 sm=1 tr=0 ts=6944c222 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=uWiwPwd6ELW8fYEcJRYA:9
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_01,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 clxscore=1015 phishscore=0 adultscore=0 suspectscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512190023

From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>

IPQ5332 security software running under trustzone requires metadata size.
With new command support added in TrustZone that includes a size parameter,
pass metadata size as well.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
Signed-off-by: Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c | 17 +++++++++++++----
 drivers/firmware/qcom/qcom_scm.h |  1 +
 2 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 1a6f85e463e0..c970157f75b5 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -583,9 +583,6 @@ int qcom_scm_pas_init_image(u32 peripheral, const void *metadata, size_t size,
 	int ret;
 	struct qcom_scm_desc desc = {
 		.svc = QCOM_SCM_SVC_PIL,
-		.cmd = QCOM_SCM_PIL_PAS_INIT_IMAGE,
-		.arginfo = QCOM_SCM_ARGS(2, QCOM_SCM_VAL, QCOM_SCM_RW),
-		.args[0] = peripheral,
 		.owner = ARM_SMCCC_OWNER_SIP,
 	};
 	struct qcom_scm_res res;
@@ -617,7 +614,19 @@ int qcom_scm_pas_init_image(u32 peripheral, const void *metadata, size_t size,
 	if (ret)
 		goto disable_clk;
 
-	desc.args[1] = mdata_phys;
+	if (__qcom_scm_is_call_available(__scm->dev, QCOM_SCM_SVC_PIL,
+					 QCOM_SCM_PIL_PAS_INIT_IMAGE_V2)) {
+		desc.cmd = QCOM_SCM_PIL_PAS_INIT_IMAGE_V2;
+		desc.arginfo = QCOM_SCM_ARGS(3, QCOM_SCM_VAL, QCOM_SCM_RW, QCOM_SCM_VAL);
+		desc.args[0] = peripheral;
+		desc.args[1] = mdata_phys;
+		desc.args[2] = size;
+	} else {
+		desc.cmd = QCOM_SCM_PIL_PAS_INIT_IMAGE;
+		desc.arginfo = QCOM_SCM_ARGS(2, QCOM_SCM_VAL, QCOM_SCM_RW);
+		desc.args[0] = peripheral;
+		desc.args[1] = mdata_phys;
+	}
 
 	ret = qcom_scm_call(__scm->dev, &desc, &res);
 	qcom_scm_bw_disable();
diff --git a/drivers/firmware/qcom/qcom_scm.h b/drivers/firmware/qcom/qcom_scm.h
index a56c8212cc0c..57d63e932f62 100644
--- a/drivers/firmware/qcom/qcom_scm.h
+++ b/drivers/firmware/qcom/qcom_scm.h
@@ -105,6 +105,7 @@ int qcom_scm_shm_bridge_enable(struct device *scm_dev);
 #define QCOM_SCM_PIL_PAS_SHUTDOWN	0x06
 #define QCOM_SCM_PIL_PAS_IS_SUPPORTED	0x07
 #define QCOM_SCM_PIL_PAS_MSS_RESET	0x0a
+#define QCOM_SCM_PIL_PAS_INIT_IMAGE_V2	0x1a
 
 #define QCOM_SCM_SVC_IO			0x05
 #define QCOM_SCM_IO_READ		0x01
-- 
2.34.1


