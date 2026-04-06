Return-Path: <linux-arm-msm+bounces-102014-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ONMsImYw1GmUsAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102014-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 00:15:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C4023A7C84
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 00:15:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 453D830427F1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Apr 2026 22:14:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9899B39DBE7;
	Mon,  6 Apr 2026 22:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gtOFeecX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SmFGajlQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 456222D8DD6
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Apr 2026 22:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775513692; cv=none; b=RRsNZEVujZtQAkpmv7wXRnwjLYO40uSFlJgsu2QN2CjGIzchPw/F9s3ZNDRu5uKplRng40HKuwPL9G1ChG1mb0jH02XCegk8Y60hayIErDYiN+b1E/W9y9flAfT0CryKJSoQY0YOl062ZPXzt0r7J1EpVFZs/RxNd8S73jFB094=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775513692; c=relaxed/simple;
	bh=iOwuvALQIxMbLYv7A9rd+WY0kqRMtLoK0llPgfx8U1s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=PLqod95Rb6Xpufr3G65kFdGb5VPDtDcMSH3C6xDvra8ENQuc6gscgX2GLWS3HT3gwEEG0uSvRLMkmKpIYbGSI0epwGzRl/ENb/+w3F494QBdqNCi9wKoBo8K7/AQT/41zDvqwVdfZJ66MDQOVfPDeWY2G5RL+R1NOaN+7DSga5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gtOFeecX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SmFGajlQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 636LQmLv2550794
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Apr 2026 22:14:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=EumurGm868mUc3WSikFqcK
	cfbgvr1fOR4UqmCi3WbQY=; b=gtOFeecX8LB9k383vAyrgqTdvzuG7StUpAFg04
	hpxfqDMZz4JaOplsmW1Qo7q0CBUo+WKhR1rahgZYyI5KVOaiQlmOV5HSsm8zj+pg
	KH7ASRXHXCxhaSH07imyu/GtBKMgYqMqnR9HaqmmXDcQhVKTMzHOyj5ALzt8buvz
	KNSH4M+5YXU5MXiAAJF9V/vRMUjXxh/hdBPJkPDp8a3oHYRh6aOsAWiF9JTt5jfP
	kNX4zzoDpd1S2CpY7HFEkHYTnZjETRE7BZlvNUV5pDa42UzXXE/aDkHE6xbopsYT
	i/dNQEGRZqmtsspGd1EKf+tdXT5ujQD8HdAdZiZB10zNdIJQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmre838y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Apr 2026 22:14:50 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50d9d52ad9aso17457741cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Apr 2026 15:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775513689; x=1776118489; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EumurGm868mUc3WSikFqcKcfbgvr1fOR4UqmCi3WbQY=;
        b=SmFGajlQBSy9FZgqAX6f1DuL5rfRgglqtH5n2fzmIesIDM6UMuyeYhbw+WrZHwAu2O
         doi4RtakYl4YLJab0opQF4ODYlXWKPrSkJeKilWY7Gr9fXy3xd+fyiw7QYM59kas8j7w
         AZiWW1I/hBXJK5Y2BvBclU9SHX7Nf6rNn+UMzDPloOGKg98/IKA3T4qhJHQe9jBY4wFB
         Caw9Nijew05JYoYGSWnONa8hT9+jruz9kQDbwGa0ClD9VAfPANRUekF3y2rn9XNKb5Ow
         WkVhGi8CeOo1shCXBuY4AcbCO1doE1n4qPsoNRSbmYZLF7v9fkYpskpUU1Vmt6/W6bNV
         ck/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775513689; x=1776118489;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EumurGm868mUc3WSikFqcKcfbgvr1fOR4UqmCi3WbQY=;
        b=IGTN9BJ/QJ7wewg5bwH3T9iwmqbdpLuP4YycR4tE3V5GOYIJUk7snGFJUZjK9wZ02g
         qxO4E6Ag6h06j6RT+n3VRX4nrKq4tqBp6MJ22K6VSLS6HMO3Q5oiDpb2bpgSPwt+duBQ
         ux2S1o95SgQqDR9WRWqyxtZwXU5iW9EysnC1RrOzKb02U4DQn7SkYVcUc/H1rgzuNT4x
         p06YKGIP4h/ggc2C2GXCutyieEDAodsiiQnt0URGhbkjwMLeTrEkVm11/9gcaB6mkXme
         oXPZ/AZyMxCBkqLhEvwC0Ri6bubnbyQu3UbEckoeKaHjMFUCY6vNRZFBjIfI6FDbXIzK
         Oymw==
X-Gm-Message-State: AOJu0YwCP7Si3G7fKVAGMx5PTX5wpBKwkiF3bS2olb3EXYfnQ1XWe9r/
	iIJ4zHtmfItH6Oc5y5wru54iISFZtd+U4piUk9hHw1MRbwFmUxqZfkJLxkJNlMQ25S+lsAB62ri
	6olnLwLHj35NR5rIWHuMlmCGNahIprqpZTujypQjVL7thdf2H8Dls2mcpUhPkfmPj2eNR
X-Gm-Gg: AeBDievr3iMluWRjLs3SFKXni15bppUZibo0kkpdRj5/SxwJ6549OwEO1wt9sbKCOHR
	jtky70poi8ZTmOGUAxXpeUOfCCwWOrmkzlCxhbeGdpA3UTNXXGXzVb87WialUrXuOCPdAMhTG2d
	d7SJoawINd1m1jLjIF6HLiyf3XRyroZiigbUk1buFQE/w85QgbadcuDye6g7opUbrSiz0m1I68J
	MZiB6MCoSP0qRXFqzz44a2lERypfZx7LE7XaedUwdpLCEHopHfY3lh7VQR2IuuCr3D5gNNNMR40
	7ix3m51BCaYyTpflOcepznmPfaSk/HU6tyIuiBb6Lfx8idZ4HG21uw8Esj4XhCtY4v8HLKCMnzH
	Amdc2YLeHW8OL1fC08OyS+KRWQHszzAWzywPEDeq6Cu0enq12luZwDflNBbWqOEfmxzWTwWl0t9
	ujSJZPWucwx8sNzVUPAI8Gr7rxsff4FiG4FiA=
X-Received: by 2002:ac8:5dcc:0:b0:50d:714a:327a with SMTP id d75a77b69052e-50d714a37eemr183759881cf.10.1775513689272;
        Mon, 06 Apr 2026 15:14:49 -0700 (PDT)
X-Received: by 2002:ac8:5dcc:0:b0:50d:714a:327a with SMTP id d75a77b69052e-50d714a37eemr183759421cf.10.1775513688754;
        Mon, 06 Apr 2026 15:14:48 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6cc60b2sm3727087e87.38.2026.04.06.15.14.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 15:14:47 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 07 Apr 2026 01:14:44 +0300
Subject: [PATCH] drm/msm/adreno: fix userspace-triggered crash on a2xx-a4xx
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260407-adreno-fix-ubwc-v1-1-bb2b09450b87@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAFMw1GkC/yXMywqAIBCF4VeJWTegUga9SrRQm2paWGg3iN49q
 +XH4fwXRApMEersgkA7R559gswzcKPxAyF3yaCE0qIQFZoukJ+x5xM3ezjURpW6qKQgJSG9lkB
 p+4pN+ztudiK3vhm47wcZ1uhUcwAAAA==
X-Change-ID: 20260407-adreno-fix-ubwc-6a2564710e21
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1940;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=iOwuvALQIxMbLYv7A9rd+WY0kqRMtLoK0llPgfx8U1s=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp1DBVMGuNvEWzn24DV3+IqffS84tw+zeK0/bjp
 MPQSyKN/d2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCadQwVQAKCRCLPIo+Aiko
 1XYaB/0f7EZ0LEcOnLO+p250YjjW58iR2HHQkFHfm2HaRzfPcYArqZKuit0fMJQEeix/B3FrWuF
 pC0Hg12DreYcAsqcDt0+AModK9M2hcgMDsx0i1eh2HNNj8mBzS/mRAmSRaIlKvvQNSWZIRNAHa2
 U0z4c71wfCW4v7vdmQ1h5lNqupCk+8+pPomMalg0lybWESOzHd1mPOMg1hRcciukKtLCY7lQd9X
 2v/I2+d9H9BI+jehSC9I506XK4VhrZCti4K1WsdW9ZUYr6x1QckGyTakbt/rHjlOIEBZntehDI0
 YtHkzrd7CEgQICkAP+ny20d7gdNsUuC0rlGvFnj5rpM6fnVA
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=OKEXGyaB c=1 sm=1 tr=0 ts=69d4305a cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=5ICTkH4HVDsf0thFk5wA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: T3ACt2hv66bWJVY5Y8bwLtfg8pmAD6yN
X-Proofpoint-ORIG-GUID: T3ACt2hv66bWJVY5Y8bwLtfg8pmAD6yN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA2MDIxOCBTYWx0ZWRfXwMgRtLglx4C+
 CGktVg++nCEYDoAiI3hmuS8ypq+7QRuBrquDnX1Sqy2/IJKwxtGmk9ftAJoxC4k05xU5l7N0Gp8
 r5JbQby5QRqrxx67n5ZCtC3zUliVC6qN+uETtFbENiiJhaVKyAKTWvAbAJbTbC9a3cE6SnNmrad
 0b5+IcBewEoy2n6luKIDJugFk+1T1dI3ZtVLVd/kcVKKoPbYUM5Qnen0vG6Pc3c1IVeREeeQMq/
 rvf7hGXaepyfy+FKIBO4+ddsTZuIJjwnDFxHem4mGomcLO2btNivS29ny8g4Ukj6EFUbILjHlVc
 kBF5qTwhPqshn2Y+cvHIz07eqIL69TYB0c5q4bEBELNvNyKbsrgn0MsmiLYzeXajHYHsVX9bMt9
 Rnc+aYJPWO3d5OR0yGw8/qa23FPIhjwaoNGhYzaWYeWHcueQe0lHR0d8is9RKpm01didmd0c4Ug
 csvwH5ECiISYPuHXUrg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-06_04,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 spamscore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1015 adultscore=0 malwarescore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604060218
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102014-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2C4023A7C84
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Before a5xx Adreno driver will not try fetching UBWC params (because
those generations didn't support UBWC anyway), however it's still
possible to query UBWC-related params from the userspace, triggering
possible NULL pointer dereference. Check for UBWC config in
adreno_get_param() and return sane defaults if there is none.

Fixes: a452510aad53 ("drm/msm/adreno: Switch to the common UBWC config struct")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index d5fe6f6f0dec..7dc95c0a17f7 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -426,16 +426,25 @@ int adreno_get_param(struct msm_gpu *gpu, struct msm_context *ctx,
 		*value = vm->mm_range;
 		return 0;
 	case MSM_PARAM_HIGHEST_BANK_BIT:
-		*value = adreno_gpu->ubwc_config->highest_bank_bit;
+		if (!adreno_gpu->ubwc_config)
+			*value = 13;
+		else
+			*value = adreno_gpu->ubwc_config->highest_bank_bit;
 		return 0;
 	case MSM_PARAM_RAYTRACING:
 		*value = adreno_gpu->has_ray_tracing;
 		return 0;
 	case MSM_PARAM_UBWC_SWIZZLE:
-		*value = adreno_gpu->ubwc_config->ubwc_swizzle;
+		if (!adreno_gpu->ubwc_config)
+			*value = 0;
+		else
+			*value = adreno_gpu->ubwc_config->ubwc_swizzle;
 		return 0;
 	case MSM_PARAM_MACROTILE_MODE:
-		*value = adreno_gpu->ubwc_config->macrotile_mode;
+		if (!adreno_gpu->ubwc_config)
+			*value = 0;
+		else
+			*value = adreno_gpu->ubwc_config->macrotile_mode;
 		return 0;
 	case MSM_PARAM_UCHE_TRAP_BASE:
 		*value = adreno_gpu->uche_trap_base;

---
base-commit: 36ece9697e89016181e5ae87510e40fb31d86f2b
change-id: 20260407-adreno-fix-ubwc-6a2564710e21

Best regards,
--  
With best wishes
Dmitry


