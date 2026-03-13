Return-Path: <linux-arm-msm+bounces-97302-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gK9VB9+Es2msXQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97302-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 04:30:39 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 11F4F27D1B5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 04:30:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2CBE2302BB9E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 03:30:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8A63346E71;
	Fri, 13 Mar 2026 03:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KZlkqNWn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D9Ri1Iak"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51D8C34BA20
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 03:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773372632; cv=none; b=u/Uzf/HQcJc7carMnrJ9bFbaOmsR95kLcbDIOdlBClKFGKfobcFZORF5hOuYi0iTYLsH1bAIvE8qjb3X/OEb+FI0F1J9gbYVKdCxoXs7QUh/Jh/hDPvPdautv8NhMUuRgpLA6kLa8thkG/gf86p1FEuP6czXHbUs8vXO2+pDAG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773372632; c=relaxed/simple;
	bh=upK6uBmdFj3L01J2+uso9YhOoCCeQIlN/0kiddAlHQU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mMAmMNfKHfXylhj6d2uXLonJap1ALlDAQfU/ql3OFjhJmOlhnWxUpkYEVAIysjUbGiiKl5dSeSCKuskcxqaJ5LyA0f/213FDCn4rN6YYJJX+PxLXC/Ak3obGDEOf3HPQkuQpDYi14a1qd8W962Ei0iTrwDYqwqsNodPqkraMpJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KZlkqNWn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D9Ri1Iak; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62CJGtBw1756007
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 03:30:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z4EIReUVZDLLFKrNuhEc4keZuSe+ZzG9lS8i32XVEH8=; b=KZlkqNWnjEPJtHEW
	LKHlyAf2SQ1S8T31EhRaAeYbwKdEjWqyVYxDtIK3D75hpU0v1L5jOyU6Dvfb4TcB
	Ud4iQ3iAr2+uZKmqCnEBgiLSuWFnNiB3aBPIe/7frOmTt9ebb/yDBxko9gkXGhja
	ZNeEQ7lPFuQna3R3tgRrt0LG1y3XBfPawOq3OiF55LFKx8HrvZuqmx3iVbl2GVD7
	4WYBvs7pFQQH24JXGA9lLXdTyiX3QRA97f9zrM0oJIZFqs/nbtq+/ROUOAI2li7X
	OOQZPd07kymNU0BayesKDXU98MJOb6BDUw9LReICeQ7kajVTl2DsZGzWoG8vzrLu
	cIAlXw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh53mafu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 03:30:30 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cd767c51efso223592485a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 20:30:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773372630; x=1773977430; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z4EIReUVZDLLFKrNuhEc4keZuSe+ZzG9lS8i32XVEH8=;
        b=D9Ri1IakqDghMo4Lyndfa4QUJzbBqJjjR7cIxVabCNP3WjMur1j6vA+wKGfmEID1k+
         WD06gNvQc8FBlnhu1Gypm6RHdnNZ4xddggzv9850MzaR7JGot+BPkkfbge9Pi3kIlzGn
         W5YQBKwjdVlDd0RA2J6mRlBczwCOelcMWDejbTWs/MQZhelx+fCbxft2Ls9m1MQ+OlUL
         csuohmzz3Zw3busHz3qM3ebzr+ahtnAkQebvdW1q2H7rnNp25i9II44LDYC3OvroH9mp
         69kmMc6clyPUl8MDIA5osydQJR+DJXgmwfbBCq1QCWK6nh61oumm2n5/DQmq4yrGKNob
         MG4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773372630; x=1773977430;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=z4EIReUVZDLLFKrNuhEc4keZuSe+ZzG9lS8i32XVEH8=;
        b=FTgbVJ7WuMmawJO5JDsks/yeXuWQq2CLTVz+3ks3P3/gtbetaMUQnqDbzao6yHFQRH
         BDzvJ+0/ggWJjrZhsatr9mArTKNxblXmActOCjzGAhGDLdlnfyz+Y/3cd9azfK60Heop
         1UgmjpyQF6P2ZgasJk1ZqAoX+2md2K6lTD0NEnnWW1K4JoiAI8iv8wFmEeaDoRRxyB6n
         XyLw3GymGlaqTLzPvnSNHK0q9GomsbEvz8CvEVYuCqWKgZC+9DUN12nqJc3TuU3Iz0it
         7PZesbaz2A/LyP7b9VDqX1YEYGfABjas18wFdOMnDo/kSIfgiqj7W/UrVBUW1lLuvvtb
         Mdmg==
X-Forwarded-Encrypted: i=1; AJvYcCW4WWGhlzLna52vTMjh70VdCsah2QlaXHfnq3qJCD5VRuJTSWkscMCTf0VQVGk07ODqip6HgQiQVZdVc/tA@vger.kernel.org
X-Gm-Message-State: AOJu0YwXSwlPupRxn1Typac07l5jMZieQ20ESjL9L8Q7LNT+SiCEBZPu
	AP4IWnV8oRJ1nXXapwBQWFjRBGYsqhCIm2Hyx4I1cAlEUR56o+UoImq5gBZogR0z+fmToRNy4LU
	56PCNdb7mpuaF2VuBRAJ0lIX3OiDVXILR71PBTlxURiGhT8yM5BaE9jVNkv4VYdpagxzk
X-Gm-Gg: ATEYQzws58iEJuJeLob88P5Uz/Su7Y2f7TAhRlkrqY98A4xP4wZYxzwxL9InUOBRhIP
	8SReSp35h3yzfxchERDfE4vub/vk7uj1DSe60YoNDic78Lrna4CYj7CRb+W2bDJYP6Ph0EWYr5I
	zwHRxZlucVis7ISKh89Q4EwL1k3OwsvtpE0XPI8uj0FyS83TgqqvQys61rytNqYjWijbeIH6ive
	m773+MDfvl5kRTJUrjChX1eIOUedBM8kG50M/Q0Gl4IaC3FmXEYkc/JYuG+/HU9v1/RoteFbc83
	VoaEbPLGw1Mkf0aFblmFmU2+SUfkvK+sACYqtTCWoIKjuT88q9ZX1myf6ChyOgzt1BWgVIA5sBs
	z0W7fJIswqQXWmHDOH1K3vb07vowqbcTFnD8yyVjLvk9ke47r28th3aL70rA5RULnAeeoFOVVOM
	BafmIbT544ld5cIuQ7d7zGj2FHuxobPho0CFk=
X-Received: by 2002:a05:620a:25ce:b0:8cd:aa06:77ee with SMTP id af79cd13be357-8cdb59ec591mr274564985a.2.1773372629524;
        Thu, 12 Mar 2026 20:30:29 -0700 (PDT)
X-Received: by 2002:a05:620a:25ce:b0:8cd:aa06:77ee with SMTP id af79cd13be357-8cdb59ec591mr274562285a.2.1773372629029;
        Thu, 12 Mar 2026 20:30:29 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a67d93576sm11254901fa.11.2026.03.12.20.30.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 20:30:26 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 13 Mar 2026 05:30:18 +0200
Subject: [PATCH v4 1/8] media: qcom: iris: drop pas_id from the
 iris_platform_data struct
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260313-iris-platform-data-v4-1-14927df4906d@oss.qualcomm.com>
References: <20260313-iris-platform-data-v4-0-14927df4906d@oss.qualcomm.com>
In-Reply-To: <20260313-iris-platform-data-v4-0-14927df4906d@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=6161;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=upK6uBmdFj3L01J2+uso9YhOoCCeQIlN/0kiddAlHQU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBps4TLUpz7M5B0vAIIBK69EW/dnVi41Fe3qPEo3
 cdFp9aNC22JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCabOEywAKCRCLPIo+Aiko
 1VSRB/4r5rdPxqkUWWpKYcTK2DMziBcScQhC09lAHUcNNNEokUHMMC4tc+sJPgibYPdY7gdasOx
 3eAFUf8dQvpCW3R2zMcpVxoTsGcSu+eDYoeeCwBCHJ9F3574rcECoK1pG1LOgV9PJ/TRGobzI9r
 QKPppE3uKGpV7GoMGWyayaR/3z124j1mreLvvtlPeZvwXonqWm51llbGmo6IpfbV2tfEWLUwApD
 Wulicj7AuXfJObmXHCZJUpv674JPL/lG6vT9RJ1Ywyp9gl3axMKfriOWEWfzhK4iFo85cdR0UqX
 7c7UqhhmXWzvVA9Ti/jJ1FeDJvKcYVdDF1YkJFhWXn2EtzyJ
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=ZN/aWH7b c=1 sm=1 tr=0 ts=69b384d6 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=hYMYe-gnznq9qBW6PAEA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDAyNiBTYWx0ZWRfX1uaX5ZhlBKYh
 02Zp9TWyKq/pnOehggKgqmKgaiCh3HTRBqqD9FyYoaiW0L0/r78W+Rkj9l01xJVQsV1cG6HmLPv
 f0PWXkKoZ70nypZfKcZzHziKPB+GR5ceag6yCw6o6chLjsebw1skhEXnCzPD6g9HoerlMwkXMHi
 yNRc55d5TVZt2G7OT9A4IPA8vy6TL+WyGUTj0u4MC0eJfAfayK/R9T1O3gDxbnF5Wr0GB1uGgJJ
 SsqAhCXOgofbjdh+7Ixy1+0qLDCNz9q9NfKwcsuz3Z31rM7vtHZSB+u7Yam8PvBKy4PUYebaa+Q
 Zu8BDzBj5R7JciwL+Z8YnUoQZtRGSA+TC22w2ka5GpfRwNFLe4V/7vlB+niCzLaox8EzamCPr2f
 3l9fhxQrrk533mUxo/+kWuwsKtlNZYKNo2oug7q0wwRwgwj2niIxHYuKr/gyY9BeA8B4olARn36
 XCafIFX7kyqaQkUoeYQ==
X-Proofpoint-GUID: Q8ZbFP1WFCfdYr17fSSnnFKjFuVyecdH
X-Proofpoint-ORIG-GUID: Q8ZbFP1WFCfdYr17fSSnnFKjFuVyecdH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_03,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 adultscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130026
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97302-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 11F4F27D1B5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The PAS ID, the authentication service ID, used by the Iris is a
constant and it is not expected to change anytime. Drop it from the
platform data and use the constant instead.

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
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
index aa71f7f53ee3..07ed572e895b 100644
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


