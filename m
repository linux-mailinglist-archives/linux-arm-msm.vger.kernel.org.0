Return-Path: <linux-arm-msm+bounces-77815-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 17511BEB15D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Oct 2025 19:34:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 04E234E1335
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Oct 2025 17:34:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46E292E4254;
	Fri, 17 Oct 2025 17:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ii/BKSqw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B85791C6A3
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 17:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760722478; cv=none; b=VQN+yGQd6PbGlpxjC7y+0rVogLnohy3cY2nxeLkI173iLjLMUqPr1LEQk7qwEplxJFib5h0kRfV9yBenEaeo0ZFxqv/Z4bag3ZKSHiv9RZuiEbLMcN6ZEPDRR4ifPUJFu82aS08zIIkb0Xy6/OUShq2iczYfA7g1uT3Mqf7y76k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760722478; c=relaxed/simple;
	bh=moluQ7YQvV+lODlr1HDCncFWiXQzoc4SVhiJwuxXt5o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uer6qMhvbLAMhhTyOJ0ZH78ORHSQo16zVTviRW+loWNMfptWUy4RorK7cfCH159SaVcK66x30vJIQEo7Mh+hCQXgDaDCEM4qa9BulAtumj+/nLeV/6nojMSOQu39kwRwQKC7UKDfN76HZztn3+w0LraGwEo8yy5Ni4z4NOCbffc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ii/BKSqw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59HEkAUB031041
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 17:34:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=dYsd/GjttT2s05A76WlHpo8PTH2x+Xn4E45
	9h0a1my8=; b=Ii/BKSqwm3695AX3YrUPuzlQ2KCdAOwKktM6md3eSxnTbmsrXg7
	6rOMtAW/QbXbY62xCiHXrKhZDgMeEZVk9xpn+xEFwx+P2mhjRRWDBTIKAdm+I8mX
	QTQ0uS10LIX8VGLmjqyu8+MjeHG+NiNTeDC1ASmbW/2Ll8/LG9r+pmVQOh8l654F
	skUJISQBPOG6se/pP5XI83va7z/AyH5omYlzNBat8D86kwPdTBNmcEgmKXj1KoAT
	bP0dSCVtQXhXv13kSBgt0PT2FE8enIVq27vZo9eixuYl83FJ2hGOjOZjsiMVOg0F
	ppeYeSsyFlKShHUDN5G6nWIegIceSY+fWYg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49uqun8k1f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 17:34:35 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-88e91599ee5so112806685a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 10:34:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760722474; x=1761327274;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dYsd/GjttT2s05A76WlHpo8PTH2x+Xn4E459h0a1my8=;
        b=CQBIHha5/cKlUcySfj8DYw9F7PDUzMGoEKw1ccVU+F42n8/DbNoYFPjHjjk7+vXC/p
         PAdAEtdxZvHjsD1DjN5IcTwz0theMO9+Y3WkQO9XEyCdOwNLUxfs9MUDxDjjr59TqC0W
         316AGUT/BK2LlyyMQnVO4irNDIcW1JaWqgxnoP3XlSYbU2lxH0tqCvygkTOMgM7o0xcU
         2FXEsXQIVCNFHcbKOFs6zcLBhXJ/vpWmJ3lx9SmaVegDft11YM4gHEBtNJ3mFLXV0gHy
         F+vY7lRuxeYzHe7LJ6DRPuK0q6n0HjTb/yILICnY7XTJoyWcygu3e3kvf6iMCZEl6ajY
         psOw==
X-Forwarded-Encrypted: i=1; AJvYcCU2FO744JZVtahwqUW/EiFCpasyQ3KOp5VuWl8HbqK7FWFiTNPtNH5m/u+zOWuMFkVxtkb2QH9FvNgRF8nc@vger.kernel.org
X-Gm-Message-State: AOJu0YwUBm7AsanbCNg9gOzfrDEp8hKWLOMx7R4LJ4uRrDpOD+V8VLHq
	gRGU/VhIQzkehbxelKWHbTkvnzOXIUyKNQbe/NovoqCFN8eRjaU6OgAj2daahGDRp2R5cRyXWVG
	MHTl5brPS28Ik5d59yuK6DCnAunAkRRdcqQmHe7DXvQHlKT7a7GQFcWHGYuL//hc6xF8D
X-Gm-Gg: ASbGncuCfoBF2utSmJs0tM0GolSs5hsMOH1HHTamAU8+mqvNzS7c5y6U5cmTUfvZ6d1
	3LntBpN+ylgMuJi3f6FW3ia/cL8Jnh4c7+REof8ZTpHucrlYxVSxd24+1zhdsMnV/RJ5cY1FjsB
	O/6Bvv+/9bnU3DeWFK/mJaHfiVrGqow4zxrNgq2UW9MjBQRjpNlETdRtjhpJAPrfiGZmjS2xHGl
	sXhCglOUBDgl1FrVol2Ohu41aMM5ReBAGd9JPVAil7krsSmgyu16xUc4hKmwl8XEfh51Ai/1ptx
	6VbAMG8olvS9Nn+QkGok6g/XHwXjlmSgwmeMCJDH5DUVvf9oH7Diw9ZIkdb6eZs0ZV0wnkOtjH+
	6EfaHeHM0BC9TUcGf/Z8EuIm26GAtfT/M9HsW/zo=
X-Received: by 2002:a05:622a:1391:b0:4e8:a6f8:e3cb with SMTP id d75a77b69052e-4e8a6f90f50mr25648971cf.69.1760722474185;
        Fri, 17 Oct 2025 10:34:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH/lFBuKecVPkwVpoCgUiysER1QwLu9lFDIt77lLJKQKBmlHT/8S8jGBtBO6C7Dk7rpmiTB+g==
X-Received: by 2002:a05:622a:1391:b0:4e8:a6f8:e3cb with SMTP id d75a77b69052e-4e8a6f90f50mr25648441cf.69.1760722473712;
        Fri, 17 Oct 2025 10:34:33 -0700 (PDT)
Received: from hu-yabdulra-ams.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65e8395a34sm27284766b.29.2025.10.17.10.34.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 10:34:33 -0700 (PDT)
From: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
To: jeff.hugo@oss.qualcomm.com, carl.vanderlip@oss.qualcomm.com,
        troy.hanson@oss.qualcomm.com, zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Zack McKevitt <zmckevit@qti.qualcomm.com>,
        Aswin Venkatesan <aswivenk@qti.qualcomm.com>
Subject: [PATCH v2] accel/qaic: Update the sahara image table for AIC200
Date: Fri, 17 Oct 2025 19:34:32 +0200
Message-ID: <20251017173432.1207656-1-youssef.abdulrahman@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=aM/9aL9m c=1 sm=1 tr=0 ts=68f27e2b cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=FaqWTh5nWRqmHptS-xsA:9 a=IoWCM6iH3mJn3m4BftBB:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE3MDEwOSBTYWx0ZWRfXyIyqVoK0pvb5
 IdprD5NdPjjhkGkIJ1Bce0H8QCzy4CwqRdkErz3EFK1iEmy1UlqL25B4a3a7m9rES6EcIj6AyIu
 F9+0A6lqxX6o31daqeP65HZLDuTrC7LcKrW16/IFrrQ3wore0cU6QP2vrjMx/1D9ZJZIoGNS4ix
 9Ud7drjnfnOb8vs3lYCqkMoI6KBTgMixPaiuOjV7RY9h/OKzq1T3xhLVhgK0BqM6V02HdZvGeMA
 qJOc8K+P/e/ivdzZyHd65baUPSw5gbAmxym+NFr9fI3XWt0fbiIu2TQBHBWuSSdoxbjVOzRjuPy
 k20wsgeQl8ElyNGAZbbV/YsWwN0btOFlI7r31FQn7JkHMGwiKfTWKug1ERBAc18aPvV5eU9M/nT
 lvSXNw8PwBxRjPsk7hfV8JCvR5hpZA==
X-Proofpoint-ORIG-GUID: -k4TGvBRL67FZLFD2oCthjppuZZNpIBd
X-Proofpoint-GUID: -k4TGvBRL67FZLFD2oCthjppuZZNpIBd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-17_06,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510170109

From: Youssef Samir <quic_yabdulra@quicinc.com>

Update the Sahara image table for the AIC200 to add entries for:
- qupv3fw.elf at id 54
- xbl_config.elf at id 38
- tz_qti_config.mbn at id 76
And move pvs.bin to id 78 to avoid firmware conflict.

Co-developed-by: Zack McKevitt <zmckevit@qti.qualcomm.com>
Signed-off-by: Zack McKevitt <zmckevit@qti.qualcomm.com>
Co-developed-by: Aswin Venkatesan <aswivenk@qti.qualcomm.com>
Signed-off-by: Aswin Venkatesan <aswivenk@qti.qualcomm.com>
Signed-off-by: Youssef Samir <quic_yabdulra@quicinc.com>
Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
---
Changes in V2:
- Squashed the following patches:
  * accel/qaic: Add QuPFW image entry for AIC200
    Link: https://lore.kernel.org/all/20251007161733.424647-1-youssef.abdulrahman@oss.qualcomm.com
  * accel/qaic: Add tz_qti_config.mbn entry for AIC200
    Link: https://lore.kernel.org/all/20251007161929.426336-1-youssef.abdulrahman@oss.qualcomm.com
  * accel/qaic: Add xbl_config image entry for AIC200
    Link: https://lore.kernel.org/all/20251007221528.561242-1-youssef.abdulrahman@oss.qualcomm.com
- Moved pvs.bin to id 78
---
 drivers/accel/qaic/sahara.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/accel/qaic/sahara.c b/drivers/accel/qaic/sahara.c
index 3ebcc1f7ff58..6ac0384c7dc2 100644
--- a/drivers/accel/qaic/sahara.c
+++ b/drivers/accel/qaic/sahara.c
@@ -194,6 +194,7 @@ static const char * const aic200_image_table[] = {
 	[23] = "qcom/aic200/aop.mbn",
 	[32] = "qcom/aic200/tz.mbn",
 	[33] = "qcom/aic200/hypvm.mbn",
+	[38] = "qcom/aic200/xbl_config.elf",
 	[39] = "qcom/aic200/aic200_abl.elf",
 	[40] = "qcom/aic200/apdp.mbn",
 	[41] = "qcom/aic200/devcfg.mbn",
@@ -202,6 +203,7 @@ static const char * const aic200_image_table[] = {
 	[49] = "qcom/aic200/shrm.elf",
 	[50] = "qcom/aic200/cpucp.elf",
 	[51] = "qcom/aic200/aop_devcfg.mbn",
+	[54] = "qcom/aic200/qupv3fw.elf",
 	[57] = "qcom/aic200/cpucp_dtbs.elf",
 	[62] = "qcom/aic200/uefi_dtbs.elf",
 	[63] = "qcom/aic200/xbl_ac_config.mbn",
@@ -213,7 +215,8 @@ static const char * const aic200_image_table[] = {
 	[69] = "qcom/aic200/dcd.mbn",
 	[73] = "qcom/aic200/gearvm.mbn",
 	[74] = "qcom/aic200/sti.bin",
-	[75] = "qcom/aic200/pvs.bin",
+	[76] = "qcom/aic200/tz_qti_config.mbn",
+	[78] = "qcom/aic200/pvs.bin",
 };
 
 static int sahara_find_image(struct sahara_context *context, u32 image_id)
-- 
2.43.0


