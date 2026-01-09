Return-Path: <linux-arm-msm+bounces-88205-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id E4FC0D07AB2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 09 Jan 2026 09:00:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 25E5C3013BF5
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jan 2026 08:00:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC1032FBDFF;
	Fri,  9 Jan 2026 08:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pcriZ9Rr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IyJzxlHX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78B322F9985
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Jan 2026 08:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767945611; cv=none; b=YLEzDG8ECOknFdLG+nvuvNEEzjOXW8WwnKqyO/sGMPr6z7pkTWwVUH7CrSXBvFabZfw+l+spOwWhrp+I3nLLzjYAGTwESZYI0UVr9/cP7kKB6BTLjP5dJGKe7a+2LM4usqbJGPXuUAZaFNe8o6jOzOZx1CkJZ1sOIbp7YfO4knU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767945611; c=relaxed/simple;
	bh=2YNgsZyT2uVAHyX6If8myEru6s0VwLkGer4gzuGhqr4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ilYiBJ1gtJo7yVHWD3ZC3x6FhZ0yht0ZtPlhtkFJ9CvzdbphFGFnq2z1r+Pou7qNESBLwVvsvEElgEVftzNhXrRUW3hYvW/f1lT2EI55z+2zLldFriC58ZWuKkAl0fg5/D+482paoJHTDxrvq2ByDQ7cnucHIlIK07bTlDQqlxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pcriZ9Rr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IyJzxlHX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60964FVW2986455
	for <linux-arm-msm@vger.kernel.org>; Fri, 9 Jan 2026 08:00:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=oVUXBlvFkGa
	S6g+YdgCI1ahZnqFYalAIHcRf+aPjVeg=; b=pcriZ9Rr4UdnIrIcVcbLzjtHqyk
	0l7GfFjLIkHQpcwHV+vgQ4GDsPRtJ2flO05wTVR5X+20bPhNCJLlR282X9RTromj
	H1hHVu5DCojK64Hg9F0xFHAUDTyfu0LzVEhvK4aCuRDEs6rD8W97NQ8LBwIq3LHK
	7Zxmp/LCnoQnaLi38CdwRkUb79XUnITRam0bApSAkX1oZ+SZWh/IxK/jyIfI4sBu
	UU0EsK7ydEBEgziksjUG4+vIBiDzFPLQfL8Ic93JZymXXgYaxeh/ImvrsfhzcOmn
	KBoo79lIYtowIfcDa2MRGScmoe1WHadZBb0FxoyGHQVqYFIzigOhMCRvArg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjhwx1wn6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jan 2026 08:00:09 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c56848e6f45so180733a12.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jan 2026 00:00:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767945608; x=1768550408; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oVUXBlvFkGaS6g+YdgCI1ahZnqFYalAIHcRf+aPjVeg=;
        b=IyJzxlHX/EWiwZ3BRQvuvpDfTOTZpvtGe8TnM3qAaG7fYgbfLLhUnbvK/yNyB3dzhe
         XqI8ErYsOLM4yOXLWeipd34ecs5OMUGLfhsKBq4oMvf09Md7gIc3fvt/graXxZYQFv5G
         cvZZMybpTEq7PHDVoQYqy/6SZEp47GKUEiPCdPPlIl7d9lP+4iWlUua5TWlToljN3ni+
         bubOCkJ0HTisIqoPEVFjJaM9Wu+Fe0a48liwYaLCYVVH4r6A0jXL7NOVATn0IHBMoYwu
         ALVvr8UweiShmNd7P7cMhLTjfmmc3K6k3y3hHi1FqV1PB7ZPCsYTKnbEjB0VN08AyTOi
         96YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767945608; x=1768550408;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oVUXBlvFkGaS6g+YdgCI1ahZnqFYalAIHcRf+aPjVeg=;
        b=J9xkIZdDkGF+E8E5D+YopJ19VSm9aOJxQQfpZ97bvSEx3BVmM9avzy9Ih/d3KeBQMj
         eSazuBekUrY4GHZT3IbbQfpZCIUF/K5hSwIsVdDlN0J0Ph0MdDu6Pkt6yzrvLO4SSQs7
         3KdtOYR3ElY5V2w2/VKWvfPon3nTDSZsUdyC2w8gsQMe6vcCNGn7Ut8xZdqO1nZvbHi4
         4/4Kkspv5uPy8/nJrz7n449YrXwR5kg1CKgAj6wTUmtsPKXeh1zMzzEqqtGe5umD4nam
         NSeNVLh8jHshM3KFcRLQ7ukS4CHWZOAwPE1BOXkz9tUoet5ZqBOmDx8atV6UxDGa6yi7
         DBPA==
X-Gm-Message-State: AOJu0YxkPHnM3p43Z0MlPjKXv9YC7uMU8r+uwO1DtzEu65UanKd3jBep
	ZxYzq5O6UZiyEvegEQoOtBMi5uUJi7tkXt/icSgn6rdOuVjS0qLWZYivKz/ZmFEGlpxaLIdZ+p0
	XFJzCQ26LU9Tef71PLTFS00f50yLAKiA4sbdQWM6tTqeIZrZesS24TvKfFWsNwfZ/5lhF
X-Gm-Gg: AY/fxX5hJ9lghTTK1BVhHCpDVePJ6lskycFOhA2maAlz2/iz2HCYKrt/9xV0wriUlp2
	SbE7t0biJf2ctx7GxhgcNoj5r4mVP0vnZTZPXVdsFUjkSRwTUDUeEiEV91MFlhiN3vcW/rm2KEu
	9iE15iTbP+TTbHTO2NkNTYAmbHiwOJdxMGvhe9TAFXNcFTXmDu3kG4EAjJ/xTvj2oxOWcRgei+I
	B7Oa6GbMi8bVBespnLiUClcfyi1DuFt2oTkmEz7zL0jvE+hKwgzwyfumfhDnJlQoMbiPAXofQ4z
	lffPF8ssEgU7ER+J8hcNdywY3w4d/Tj8TdBoFvadXnH8GwDU2Pt3f3DiljdKEqbU689S4GjWQPB
	mBevhFGU44T3SaQOgS29dSMMH5dwDLoge7ly1E691oLd2fVn9y8f/mhvxpguc5l2QRvmfmZfhLy
	o=
X-Received: by 2002:a05:6a20:2589:b0:366:14b2:313 with SMTP id adf61e73a8af0-3898f9f87damr8538581637.70.1767945607728;
        Fri, 09 Jan 2026 00:00:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH0r9GyaMI7HjrQf4u8VaKZPWTcwAQ/HxlKh3VhidXwBLKQ5JqZWdd3ZMGp4nZpxq+fShAh8w==
X-Received: by 2002:a05:6a20:2589:b0:366:14b2:313 with SMTP id adf61e73a8af0-3898f9f87damr8538542637.70.1767945607249;
        Fri, 09 Jan 2026 00:00:07 -0800 (PST)
Received: from yijiyang-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3c3a56bsm96808445ad.20.2026.01.09.00.00.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 00:00:06 -0800 (PST)
From: YijieYang <yijie.yang@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, yijie.yang@oss.qualcomm.com,
        krzysztof.kozlowski@oss.qualcomm.com
Subject: [PATCH v2 2/4] firmware: qcom: scm: Allow QSEECOM on PURWA-IOT-EVK
Date: Fri,  9 Jan 2026 15:59:52 +0800
Message-Id: <20260109080000.606603-2-yijie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260109-purwa-v2-0-f39ee10684cb@oss.qualcomm.com>
References: <20260109-purwa-v2-0-f39ee10684cb@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDA1NSBTYWx0ZWRfX6J3PxiX7kfnq
 WKNB5LwUsW7IOmt/DNtL+94RiKZvW2lgUD+wDce43XmApIVPE/Zm8r25ki+Wz5ieZssPHzDGMKj
 Eiu+TTelWlmf7JmZv0koZ9OBLM7eJzwWIbTgwtWaJEs/SKNJyHxqYsQgTIeQLb4wFGFqF2usaRJ
 iRWYFk0JBFH1iSww295O2j3Sp6eX0snINaxMn3hVHJbsnNMiI8KA2WXEkNpwf0yHa8U3BXy6nbh
 7ZSrwtaNunHBx0HdIKfAUx6G64ZNPyhDH/p57QsEZgdsJYeISA2muVM2+dO28VBOIUtIPEfWkjJ
 Stic4OJlDgijM+YGf/NuITH/st+gnrgjz23FsT/VQW2/7Ov4UnFwPouh82drhuQmcW/9HszzC+x
 k5pXaOg+uUIL4EQ0v25DvVn9G2mOmIY7K265TtmZfVWofPLRb8Al2dG9YcVMGlEfpoALDMCtCH3
 Aovs/wBzQrG02Wnw/Ng==
X-Proofpoint-ORIG-GUID: cb2K4rGebxSpuM89Ve-sHunjcWNA5KeR
X-Authority-Analysis: v=2.4 cv=ENILElZC c=1 sm=1 tr=0 ts=6960b589 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=ZmGgbmymOzp8U7yWMvkA:9 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: cb2K4rGebxSpuM89Ve-sHunjcWNA5KeR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_02,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 clxscore=1015 malwarescore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601090055

From: Yijie Yang <yijie.yang@oss.qualcomm.com>

Add the Purwa-IoT-EVK board to the list to enable access to EFI variables.

Guarantee that subsystems relying on SCM services can access secure-world
features. This change improves reliability and prevents missing functionality
or boot-time issues by making service availability explicit.

Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 1ced6022c716..9a046b09275d 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -2022,6 +2022,7 @@ static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
 	{ .compatible = "microsoft,romulus13", },
 	{ .compatible = "microsoft,romulus15", },
 	{ .compatible = "qcom,hamoa-iot-evk" },
+	{ .compatible = "qcom,purwa-iot-evk" },
 	{ .compatible = "qcom,sc8180x-primus" },
 	{ .compatible = "qcom,x1e001de-devkit" },
 	{ .compatible = "qcom,x1e80100-crd" },
-- 
2.34.1


