Return-Path: <linux-arm-msm+bounces-94564-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oLSYK0unomkK4wQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94564-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Feb 2026 09:28:59 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 550761C15C6
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Feb 2026 09:28:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id AFDCB303A94B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Feb 2026 08:28:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48A733E958E;
	Sat, 28 Feb 2026 08:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BLGJYf35";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KCwVJMkq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D53A73D9047
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Feb 2026 08:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772267337; cv=none; b=L7229mfJlt6ktIo9ApSIx9CyGxb6kWjqTtB3CD6js0UOepl6ggKQOoD6/YO+UvSdy8UxZvfm01VKXsfOGUzd5whROe8nS4Wdh7eH3DzM+G+XWRfHbkl/uNv40WHXDDto9sJhmEaMAoX6/cO+To2muu53gtvRL80Ti9M6WfYM7ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772267337; c=relaxed/simple;
	bh=M54qLiSx0tAuQGp4cYCiU0fjAE2JjhmPrU/j/fMoZxg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WCpheWitAsYW0nPLeGnzC6bA9OZNEFIG2v8R2u/CYxHhzrKKvmDhIMXrtpRUTAAVIh67xiWCUyX7Ob01wZ8wc6B1ElLExzNmXFPL6eVLUVBoMJIFj7fVp/i3xtIAfwJZoFpTeB/QkstPQgGdkFV20ishZPVGyGuzDauYRsaMRgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BLGJYf35; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KCwVJMkq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61S6NdXJ3830894
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Feb 2026 08:28:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+utxNAm/m2FGs9Q1dMAeV4ThMYgtQg6P+gmWB/t/PiY=; b=BLGJYf35q4Mj9zMu
	wbpCHFaOUPIyTBNcysuRoKj27v48kSZHGXhy4yy290+66qkDJaUKDdPt42P5Ukvk
	h6cxFrdfjY+1mAXYUHOpMW2TWxDIa0p3ryC8mvVYKsMuiLGdDB6T2HSib6wOVLij
	BFniajMyQeHfGKEKhJK7VFIQ9kMq1TRFYgQCzcQ4JE/H2/x9CxvJM4IkIhfSlTl+
	4r8XMGunMesfjm7lpw/Oa79GoZ6zGKXZ0NyiGXEt8jTV6aOKSdezy/o2twrsUu4O
	MZoN+O8NTxHhiHoweT4ruFCQxNR+N6f2NoqsDzocJ/bsH6rMhL27YurRQp10vquT
	xLLMEg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cksf8gjfg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Feb 2026 08:28:55 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb0595def4so2863960085a.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 28 Feb 2026 00:28:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772267334; x=1772872134; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+utxNAm/m2FGs9Q1dMAeV4ThMYgtQg6P+gmWB/t/PiY=;
        b=KCwVJMkqywOi0aIxufoBLIelALT6HlUlbgMuKUtnC2IkNuwySi5hBulvt20GOYKJMg
         PI/G11nNUMlSu7jZGvhiVX3URn1DLjn0QC8Sl6jZCX/nU1rfPEB175zPTvZbUVdjFm9u
         X/5HJF+ZEdXKTNVfdOBak3nsxUjVC5nypFvRjQClG1zUcc53n6R7mYIcyNn3D32tSZCN
         lgMClYX4THWnNQyQObD/TaIMkf0dPJPOl/t2Vaz+UCZ5a4znz9u7P+4YBHHiXd2Orwl9
         u13CAiszQf7h/wgJnN0R1jyepdHZabAR3hS2PUbRf/oAY5Px6Fz5avtCpAs6j5T1PCA4
         8bcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772267334; x=1772872134;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+utxNAm/m2FGs9Q1dMAeV4ThMYgtQg6P+gmWB/t/PiY=;
        b=kneCUUa/bHn5DBqcMj2sxJJlAIJgHbOFC466Y1a5ZVEy9zEPTKe1Kw3URRpVJ+uoe1
         Hbn0xB2celhuN7FCNjzYv1jRyMVJM5s+ADNStZ1n4QVIuOfT6yCJm/rFluUxPPFHvi7U
         MkYR6inHhkAonwjLAsSLXUkc9B5hmaKciEpU4gLUN2MsAEolrJ7aD2NGFMBW7to822+c
         WgdhXeTWCuJp/9o0XxJBmeO8Vqj5Cq9mDkZTKVht6gXnEQYo/o4bU4oDJhMY9QX3Iyql
         vh1Io8p+zbePXCA99CNb4o9d/qJioWLPhFmuRTlexZ/yypjOf0+gvwRv3+In6D/NMXzu
         tT6g==
X-Forwarded-Encrypted: i=1; AJvYcCVrvTD3muKaWaXaQXkj9KB+5Iu+nkOqpuKw/YsND+Otx8EwWbLxNk2fduwx+D7SQi1GIqhR7hEzR1nD4Qam@vger.kernel.org
X-Gm-Message-State: AOJu0YyqcCUv5dTkeAYCeG/iuNEr8j2VekMYZ+RQAcxorSyCvZETP+Dv
	aTHq6n4vDYrM0x3lK8jSAVe/5Mv2kGAE3tMZyAnRTtOUXaeBtxruRJrkelwvXmTLVe1ORzdyH0Y
	e8wvBu4JDsjp0CQEarfCUD7BZEvDBoDv7aoIxO1Dt0orydda0JxWk0G8vOyyz5oDYMUhY
X-Gm-Gg: ATEYQzwFLsU5vUbG33R4uVY0BrN8tVlcBQNZopdvi3ewt5WC+d2fwmUeW6YLv5QlsHG
	Dpz9w3PHwktuHImWzvwkzCCi7uUBwUuZ6P1LzC1ajQ3/LyuuPmX9oohZYUnxn6O+aDha31gG4pR
	S4ba4k/FQMgN4xsDyBc1A8vVLMQiGIj3Uo/hMkC7/JPipDeHzt1P/SvKlNFyzYRReJ5n+47/2N4
	T0+iN9AS0jv866l1kD+rpcD+Uj/Hw9v0wHoIw5Ohe02RbEzwffFvQ3a6ymekAv/Zz96VCAoycrO
	5/dfIc5A8mWelYOMzdxvuLUTZzd8gGBh81f0rieG1xLW0LjvYCw60cHCREGIH2E27fF4pIX7gQw
	Jtku/guwIZ8nDMOB0QSj15Z+IvhnGFHcuD2DMPRQh3DvrQJrWDnu2GKqMZBf/6g06GRE52Y2CSf
	hmiAEYt9cjzlWFCABbzIKSDbUYxkUqdhEBRZA=
X-Received: by 2002:a05:620a:1aa9:b0:8cb:df8:e86c with SMTP id af79cd13be357-8cbbf3cf0admr1021269985a.26.1772267334074;
        Sat, 28 Feb 2026 00:28:54 -0800 (PST)
X-Received: by 2002:a05:620a:1aa9:b0:8cb:df8:e86c with SMTP id af79cd13be357-8cbbf3cf0admr1021268085a.26.1772267333613;
        Sat, 28 Feb 2026 00:28:53 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-389f2f4b158sm17970711fa.6.2026.02.28.00.28.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Feb 2026 00:28:53 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 28 Feb 2026 10:28:46 +0200
Subject: [PATCH 01/11] media: qcom: iris: drop pas_id from the
 iris_platform_data struct
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260228-iris-platform-data-v1-1-c2c53539f948@oss.qualcomm.com>
References: <20260228-iris-platform-data-v1-0-c2c53539f948@oss.qualcomm.com>
In-Reply-To: <20260228-iris-platform-data-v1-0-c2c53539f948@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=6033;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=M54qLiSx0tAuQGp4cYCiU0fjAE2JjhmPrU/j/fMoZxg=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ+ai5fbMbnIbVrrUKN7dN/OEqB/Hz/LoCx6FDZbnFLuYf
 A7lXvLqZDRmYWDkYpAVU2TxKWiZGrMpOezDjqn1MINYmUCmMHBxCsBEIj04GFb9tDnRcmbilORW
 5tcv1y6XnFgma2ni53daJif0VPn5Zycy/f/kaG2z/2j8687WbW9SlrrfCUtv/fHjp+kiln8G7d5
 GD+OD2rcsKihvFbtX1+u27xtnnuCTg4qxhoevlCry8RVGVIRaiCdN53Z6421dyrzTmrN9xmFT1S
 tcAcGx61J8DG7s4eGr2aLjmGL3YXsh80+TJZsCltacMrl2WpjLZoqt8I6P+Yun5nj/zv1y/poY2
 7lg+fUT/is/vCvSJm3t2r27kOf+jeQF9/6t6v/KrNqcH853tY5rpqH2r0aGjYds4rTzndlryplr
 3wq/TnZ7IynK/KjoZ45CcOyxU6vkA7ODVFX3PBI/HLQDAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI4MDA3NyBTYWx0ZWRfXysXkiFwFDXMx
 e9y17GstG1JRrgYUbLeNs5667oOjMPDvOfccphMhX4thmjL+g2fTm2CaupgoRuuji9TkIMXUaJz
 i+ZobkrquM7xRd8SqUoLof+1YdZF0TRwG5HJVup+fBoq3whPdGDDJ3DcTwb0yZYGEXWaY4GA43z
 Ox2jiKK0eoXFmhnBchWbDdrj8D0p5U6nX0SrNaTIHON3sn5aptiRzc7btKxnu6ewR8beuTzo2CI
 XlcXhuZqwp3NpUFciE/lJ2ePEva3HRUFSm5zASbK3uQ+MedPqoY+k9ieNNWWnOGe5XqF+LJYJQV
 JgnqvsUrBlreSwlr8xTrs8bYdUQdArExSKlpydIxc8eALzjDCk8ogHVFyH8Qh9QIFtfKcKh+JEN
 8/1t5mL2YGy/iGeg9ybsZ2nYvZkyjw+E15fafeeWOwZel4GjaKwEQ5uxzaEJxDhwAjgbfHl9UFx
 wo14ZkGjPwqSuJr7S1g==
X-Proofpoint-ORIG-GUID: D3eTupeq-xUxICudRJg-H7hObzBqpe_i
X-Proofpoint-GUID: D3eTupeq-xUxICudRJg-H7hObzBqpe_i
X-Authority-Analysis: v=2.4 cv=I5dohdgg c=1 sm=1 tr=0 ts=69a2a747 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=iXhRqYnz1ivtNB1IvZoA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-28_02,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 phishscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602280077
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94564-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 550761C15C6
X-Rspamd-Action: no action

The PAS ID, the authentication service ID, used by the Iris is a
constant and it is not expected to change anytime. Drop it from the
platform data and use the constant instead.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_firmware.c        | 11 ++++++-----
 drivers/media/platform/qcom/iris/iris_platform_common.h |  2 --
 drivers/media/platform/qcom/iris/iris_platform_gen1.c   |  2 --
 drivers/media/platform/qcom/iris/iris_platform_gen2.c   |  4 ----
 4 files changed, 6 insertions(+), 13 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_firmware.c b/drivers/media/platform/qcom/iris/iris_firmware.c
index 5f408024e967..bc6c5c3e00c3 100644
--- a/drivers/media/platform/qcom/iris/iris_firmware.c
+++ b/drivers/media/platform/qcom/iris/iris_firmware.c
@@ -12,11 +12,12 @@
 #include "iris_core.h"
 #include "iris_firmware.h"
 
+#define IRIS_PAS_ID				9
+
 #define MAX_FIRMWARE_NAME_SIZE	128
 
 static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
 {
-	u32 pas_id = core->iris_platform_data->pas_id;
 	const struct firmware *firmware = NULL;
 	struct device *dev = core->dev;
 	struct resource res;
@@ -53,7 +54,7 @@ static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
 	}
 
 	ret = qcom_mdt_load(dev, firmware, fw_name,
-			    pas_id, mem_virt, mem_phys, res_size, NULL);
+			    IRIS_PAS_ID, mem_virt, mem_phys, res_size, NULL);
 
 	memunmap(mem_virt);
 err_release_fw:
@@ -79,7 +80,7 @@ int iris_fw_load(struct iris_core *core)
 		return -ENOMEM;
 	}
 
-	ret = qcom_scm_pas_auth_and_reset(core->iris_platform_data->pas_id);
+	ret = qcom_scm_pas_auth_and_reset(IRIS_PAS_ID);
 	if (ret)  {
 		dev_err(core->dev, "auth and reset failed: %d\n", ret);
 		return ret;
@@ -93,7 +94,7 @@ int iris_fw_load(struct iris_core *core)
 						     cp_config->cp_nonpixel_size);
 		if (ret) {
 			dev_err(core->dev, "qcom_scm_mem_protect_video_var failed: %d\n", ret);
-			qcom_scm_pas_shutdown(core->iris_platform_data->pas_id);
+			qcom_scm_pas_shutdown(IRIS_PAS_ID);
 			return ret;
 		}
 	}
@@ -103,7 +104,7 @@ int iris_fw_load(struct iris_core *core)
 
 int iris_fw_unload(struct iris_core *core)
 {
-	return qcom_scm_pas_shutdown(core->iris_platform_data->pas_id);
+	return qcom_scm_pas_shutdown(IRIS_PAS_ID);
 }
 
 int iris_set_hw_state(struct iris_core *core, bool resume)
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index f42e1798747c..e4eefc646c7f 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -12,7 +12,6 @@
 struct iris_core;
 struct iris_inst;
 
-#define IRIS_PAS_ID				9
 #define HW_RESPONSE_TIMEOUT_VALUE               (1000) /* milliseconds */
 #define AUTOSUSPEND_DELAY_VALUE			(HW_RESPONSE_TIMEOUT_VALUE + 500) /* milliseconds */
 
@@ -226,7 +225,6 @@ struct iris_platform_data {
 	unsigned int controller_rst_tbl_size;
 	u64 dma_mask;
 	const char *fwname;
-	u32 pas_id;
 	struct iris_fmt *inst_iris_fmts;
 	u32 inst_iris_fmts_size;
 	struct platform_inst_caps *inst_caps;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen1.c b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
index df8e6bf9430e..1bbdefc48d71 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen1.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
@@ -360,7 +360,6 @@ const struct iris_platform_data sm8250_data = {
 	/* Upper bound of DMA address range */
 	.dma_mask = 0xe0000000 - 1,
 	.fwname = "qcom/vpu-1.0/venus.mbn",
-	.pas_id = IRIS_PAS_ID,
 	.inst_iris_fmts = platform_fmts_sm8250_dec,
 	.inst_iris_fmts_size = ARRAY_SIZE(platform_fmts_sm8250_dec),
 	.inst_caps = &platform_inst_cap_sm8250,
@@ -413,7 +412,6 @@ const struct iris_platform_data sc7280_data = {
 	/* Upper bound of DMA address range */
 	.dma_mask = 0xe0000000 - 1,
 	.fwname = "qcom/vpu/vpu20_p1.mbn",
-	.pas_id = IRIS_PAS_ID,
 	.inst_iris_fmts = platform_fmts_sm8250_dec,
 	.inst_iris_fmts_size = ARRAY_SIZE(platform_fmts_sm8250_dec),
 	.inst_caps = &platform_inst_cap_sm8250,
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index a526b50a1cd3..1f23ddb972f0 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -934,7 +934,6 @@ const struct iris_platform_data sm8550_data = {
 	/* Upper bound of DMA address range */
 	.dma_mask = 0xe0000000 - 1,
 	.fwname = "qcom/vpu/vpu30_p4.mbn",
-	.pas_id = IRIS_PAS_ID,
 	.inst_iris_fmts = platform_fmts_sm8550_dec,
 	.inst_iris_fmts_size = ARRAY_SIZE(platform_fmts_sm8550_dec),
 	.inst_caps = &platform_inst_cap_sm8550,
@@ -1038,7 +1037,6 @@ const struct iris_platform_data sm8650_data = {
 	/* Upper bound of DMA address range */
 	.dma_mask = 0xe0000000 - 1,
 	.fwname = "qcom/vpu/vpu33_p4.mbn",
-	.pas_id = IRIS_PAS_ID,
 	.inst_iris_fmts = platform_fmts_sm8550_dec,
 	.inst_iris_fmts_size = ARRAY_SIZE(platform_fmts_sm8550_dec),
 	.inst_caps = &platform_inst_cap_sm8550,
@@ -1133,7 +1131,6 @@ const struct iris_platform_data sm8750_data = {
 	/* Upper bound of DMA address range */
 	.dma_mask = 0xe0000000 - 1,
 	.fwname = "qcom/vpu/vpu35_p4.mbn",
-	.pas_id = IRIS_PAS_ID,
 	.inst_iris_fmts = platform_fmts_sm8550_dec,
 	.inst_iris_fmts_size = ARRAY_SIZE(platform_fmts_sm8550_dec),
 	.inst_caps = &platform_inst_cap_sm8550,
@@ -1232,7 +1229,6 @@ const struct iris_platform_data qcs8300_data = {
 	/* Upper bound of DMA address range */
 	.dma_mask = 0xe0000000 - 1,
 	.fwname = "qcom/vpu/vpu30_p4_s6.mbn",
-	.pas_id = IRIS_PAS_ID,
 	.inst_iris_fmts = platform_fmts_sm8550_dec,
 	.inst_iris_fmts_size = ARRAY_SIZE(platform_fmts_sm8550_dec),
 	.inst_caps = &platform_inst_cap_qcs8300,

-- 
2.47.3


