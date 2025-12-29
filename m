Return-Path: <linux-arm-msm+bounces-86791-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 05300CE6085
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Dec 2025 07:34:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 04DD9303199E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Dec 2025 06:32:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF8572D0298;
	Mon, 29 Dec 2025 06:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HkmE7Aug";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e0UsHvOe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2752A2D0608
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 06:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766989921; cv=none; b=tmrDfRdk0PnzOCnrzya1JXecakkJ2Us77dRCiCkhJrEvo/q3tRkZGGTjhtleiODLWeQuqCu3DHzEAAwN7hscuv4u/lNfsmbZ4iCd0XcvVDqcc9KesdeIUNbxe4kmWcLdnuR0dvs9jRh0myOIuqsd3TbGi7SoCsX9RC68/yZdmq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766989921; c=relaxed/simple;
	bh=v55TNg//wC4XAcaHWZTXoCk9GlnNzZOSKMtmlhh/99s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dm3p8CtC+AtYiSlYL05PQGyGQ4hc46qsLB7qXqYIWHs/Vz7VplUcBXzsUVfJHyyhFmxpE1aMqscmstNsDcm0P5CRPrt0QAZTZ0I26YYBgZ4lcVqIsm4eTjXdNpRREtiOJTCJpdD8ZXqp9TY4CHj0XZdtdu8PWvx0P5fl5pyqZiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HkmE7Aug; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e0UsHvOe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BSNaPDi1446519
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 06:31:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aaVi6kTxKFVUUN+LstLP4rB1bASy8KXXeuDqCkR8A3c=; b=HkmE7AugOxT9WlqZ
	z4vMJHPDN1YMVhBrOqgb8GwUUg+VK+8r/aTQ1FKP3T0VI22dWL5Wo+6EznHE/MhS
	7db0ooXdMQQUMGZW8aStYKvEfgk06oQSqZHODoia9XtD2ilmnx5FMq+ujHrdjx+I
	IZBczZbRfI4BdJCeP2kYloStkyiF3DxV2B8QP1Aw++hr559MPncTSDHGt0rO5RVs
	664uCrKTnYSTlpBvsC27EkYEMMUyJolLI6uvr70nyWnFWCrAyg9XGcbOVse/KhH+
	LhloOoHsEnpF5xFVlUmOgCLWkzep1GsYHvuvWbBqAlX+98A3agzdwjUzUDOFMvoB
	YslxLg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bavrj20nr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 06:31:59 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7bf5cdef41dso15317993b3a.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Dec 2025 22:31:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766989917; x=1767594717; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aaVi6kTxKFVUUN+LstLP4rB1bASy8KXXeuDqCkR8A3c=;
        b=e0UsHvOehd9+Y+5Ve9NJF2nBWG4tnZYtNB+VrOVTExW/QEzT01yWVoi4HqBoQ7SNlW
         b32UzqZ0eB1K8VxigcjyMQjcfvfn45vs1vCLsuG0MxPxGtmOKzoDhpt3rPZdI+QUR1Nt
         wDZnIniRm6ES6YMPxtPdcAuoPPT0tZa10Z80zj/zWBbl5pXsQGnbe4VC9ZM/u+0k90xh
         I8FTxkIcNlMHqVdbxHPeiJmREt2IO/D80q8WOj/XVdTbxiZFUD4AYK9mIX0oopRG8JDD
         pOG34VbzcvFCxmrDULF2Uiyg0d7pnDybA2o7IgzT6kcDo2vSRxEuWir1GW4h7IGeXtaw
         kvKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766989917; x=1767594717;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aaVi6kTxKFVUUN+LstLP4rB1bASy8KXXeuDqCkR8A3c=;
        b=usmcCdx/H52TRC6UuAATwAhFrO9bBw0eDamE312A6xtWJ8hVp84XbHw0bT/R9mltMj
         RKDWMfxzWvgxibheKUkI1CgJJJUY6S5wFk8UNs7IH3rvfjKFKPXGJ2Utk4FJW8tqOqm2
         VI4iyB9QDZ7MnnvABcrH1nre7xnG8TtsLEmv43Pup3cOtzVeZrBGtRSZG8WjovA30N80
         9jGSZNC49Y77LdvI2WfhG9/mkIdhL5G8h2QXd3V0ftoN6EobIPdmM50Jm6Ej9TC6Uex3
         IbqD3Wezmbb5nTCPuUEPUAjA6fnbRIJlmbyHrinTLCTm1atc7lDyImUQJgflCw0z8Omz
         SzFA==
X-Forwarded-Encrypted: i=1; AJvYcCXENTiLChcRJI3kab94GBeYBdMVTjaofFwhba2FZia0P7x1xDEPn7bC4KHerx5yqewuGnVH5Y9V+kY0fLk3@vger.kernel.org
X-Gm-Message-State: AOJu0YwF+eLpsIt+XIZyL1Qg3HfBT2s0hmsigDI4z0phoyhsb8+rR9Sj
	mKxPok1SviLDkE1Kn+igxLTQa2NhmwG9G2RwV3WPdhFQTTNPY+oawheol8xRPsOPQwaCgeX2uAz
	W4Q6M0un2We+6tkp7z8HXgJQsL2+ch+r2JwS1p+Shv+YAHJqPXjpj4oHDHfosrIqQBXv1
X-Gm-Gg: AY/fxX7YzJ2G+WZDNkebKjEx7ek8yr3n4g1ZbtKGrGsWsg8B9G8DXM0EFZ+vVAGTB0V
	UuZvkhpPwnI+vZpO2zQHl12IWZUf8ZnnGeCpZxjP5YTBOBgGshJeTDp45IY3+CgtcB/TNjFx5Cz
	7tR9mscrTY4ab1mUnlYnFQzOEOikfpLegKIvhHbpw6hbU+Jo5/hshvZpKeHn8soX34Mrw8OKkFY
	Omz3GAEN4J/vhQmiepliTmtE2CoW7TDjgb8D4b6rsYmCwrnJhEvVf3AFLcRKNK/jI/EW6kqJgHN
	Dms3+E/BcMQzIMjUXImCNnuSFvmjlsgUghdGj++g/YmR4D3w2Ivz9o03Zip76heew3QzM170tpL
	oElMVDObzCMHNlBJ0keV7YVKOS0mAzhB6+7Jd3RMI4c12KJs=
X-Received: by 2002:a05:6a00:90a2:b0:7e8:4471:ae5c with SMTP id d2e1a72fcca58-7ff67456c12mr24865581b3a.40.1766989917361;
        Sun, 28 Dec 2025 22:31:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFX0ThBZeW+BigEL8dzVjUuDuXkQS9otcnHN3QgmHmuY+Fxw19HAteXH2bjW3/rRGKbh+msgQ==
X-Received: by 2002:a05:6a00:90a2:b0:7e8:4471:ae5c with SMTP id d2e1a72fcca58-7ff67456c12mr24865542b3a.40.1766989916512;
        Sun, 28 Dec 2025 22:31:56 -0800 (PST)
Received: from hu-dikshita-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7e797ab9sm28308962b3a.59.2025.12.28.22.31.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Dec 2025 22:31:56 -0800 (PST)
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Date: Mon, 29 Dec 2025 12:01:24 +0530
Subject: [PATCH v2 5/6] media: iris: gen2: Add sanity check for session
 stop
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251229-iris-fixes-v2-5-6dce2063d782@oss.qualcomm.com>
References: <20251229-iris-fixes-v2-0-6dce2063d782@oss.qualcomm.com>
In-Reply-To: <20251229-iris-fixes-v2-0-6dce2063d782@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766989894; l=1244;
 i=dikshita.agarwal@oss.qualcomm.com; s=20240917; h=from:subject:message-id;
 bh=v55TNg//wC4XAcaHWZTXoCk9GlnNzZOSKMtmlhh/99s=;
 b=56U9/cpxgd6FqwYiSraU5YRmgQlKZvQjxUwJu9bnWBH4JEI/08y9dFRLPfHh/+xjtF+B+JGfa
 NF/6E/wSsUaCkusbqS9QCk8PZnYWdaoDaGsRTI4lYzhdNj5QXhj5WnQ
X-Developer-Key: i=dikshita.agarwal@oss.qualcomm.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-Proofpoint-ORIG-GUID: PZQNGVvXdDgejKFvkTNZW1nALUbf5Ryh
X-Proofpoint-GUID: PZQNGVvXdDgejKFvkTNZW1nALUbf5Ryh
X-Authority-Analysis: v=2.4 cv=coiWUl4i c=1 sm=1 tr=0 ts=6952205f cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=hJpQIKcYsydMz8RtK9gA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI5MDA1NyBTYWx0ZWRfX9BSGk+/sir44
 Ti4VrH+MuCctV/hArGQevvChSa5DAlptg6ikU9ytsOC8ql8YFqnwpvU37D2Jm1mTOKsgO8b+SCM
 GVGoZJpB9KA+NTWvdEywe269Y/apDO2LgKfEjf2Gk072u7ZvbuIaGhB+UVS1g8m/cPeEwJJP9yT
 ZrB7rHvdyJGTDpsHSuCxyT8WJpctl8CYhe0ajzPrh/5czHEPj2triNKF3iB6x3eFQV8LiR1S/Ld
 ad5gLDVvtI/JI9If/xcAhW3XqSidoEGdk1gFL/0PuRYZxzhas3ELbTEI4T6+bLrr7Fc1tuPH6h4
 A8KDht9C1OmLw3wDNqCMQ5GQ8yBd+NRuu0cv2fu9MrCP/vuegEmiQO7sot7+cM0Ik7gEhQViQPW
 veQjd3otevFJlRYDwipcmK4Gg2RI9nQbQkyxFJ0+QB/Fv7mQqEvGxrEjXsFyDi5wog/XEqDZglK
 rqP2g2psgmMQvjTbCfw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-29_01,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 phishscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512290057

In iris_kill_session, inst->state is set to IRIS_INST_ERROR and
session_close is executed, which will kfree(inst_hfi_gen2->packet).
If stop_streaming is called afterward, it will cause a crash.

Add a NULL check for inst_hfi_gen2->packet before sendling STOP packet
to firmware to fix that.

Fixes: 11712ce70f8e ("media: iris: implement vb2 streaming ops")
Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
index 6a772db2ec33fb002d8884753a41dc98b3a8439d..59e41adcce9aadd7c60bb1d369d68a4954f62aef 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
@@ -963,6 +963,9 @@ static int iris_hfi_gen2_session_stop(struct iris_inst *inst, u32 plane)
 	struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
 	int ret = 0;
 
+	if (!inst_hfi_gen2->packet)
+		return -EINVAL;
+
 	reinit_completion(&inst->completion);
 
 	iris_hfi_gen2_packet_session_command(inst,

-- 
2.34.1


