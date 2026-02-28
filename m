Return-Path: <linux-arm-msm+bounces-94616-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YHH/BjoJo2nY9AQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94616-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Feb 2026 16:26:50 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 334251C3E7D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Feb 2026 16:26:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1C191305391D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Feb 2026 15:26:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E83B847AF7E;
	Sat, 28 Feb 2026 15:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E+emVWye";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XONw6AAh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 985B547AF58
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Feb 2026 15:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772292397; cv=none; b=TByNHBZNzpLR6k81m3+alNhdAPitW6aQhqmJoXOL8WpUNi5t490z8pKza1W/Eo61OrqwXXQSZCSWPvOjsioBwzsvt6YtFK48ww8yqWuHJHKODRq8XhYlopKR+oiVuosh3bSD45gywcM864Er/XXxxjwxvwraKo+NVKfMQxGtKXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772292397; c=relaxed/simple;
	bh=M54qLiSx0tAuQGp4cYCiU0fjAE2JjhmPrU/j/fMoZxg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EEB+xTiJSxRJ3vLaGdTF+K8oXDnIzK8x8J/HXu8JTdMmNM4qHkHvxn3h8qDO/2oaZXGyex+FY//xu1jFX+dAbe2AqD/A8XMTnfTjtBy5zJE87ftKhAXzrzQwkEOZfcnjmbtUx+saMwKs4gtddHuIHS2s/Ki2pZjGlPoLSdnaDOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E+emVWye; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XONw6AAh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61SEPsCB2736851
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Feb 2026 15:26:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+utxNAm/m2FGs9Q1dMAeV4ThMYgtQg6P+gmWB/t/PiY=; b=E+emVWyeisHTsacX
	EWMONZIeQHNIEUBiyesotPfVARs0ZTGv42Onw/OBx2UW4KGlU6e1LdQG2etp1bKE
	k9W6e2uErueIpuqQRrAin4HpPl0H5XVmt9EK0AaEqEP77LGy/uDt+/FwQzlc9CjJ
	exUuTw1HN3513+tAFlznYvFxolb0YEGqGJ69EFcKiRivsPd+fCd7JDJM+9dPeDvF
	I4c75VOctP0Vk05t8IBTBJ/R8SfR86QZjQXskZoGvRo6O/YSAefWH175GUdZ8E8R
	7lLcMo+e6F4SaO3x5/q0LC1SkPn8uPwczbcCyPL9nTdeDCGCbFNzMYR0LREQjTPg
	A+f4gQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cksgrs5v3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Feb 2026 15:26:36 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb3b0d938dso2819834685a.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 28 Feb 2026 07:26:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772292395; x=1772897195; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+utxNAm/m2FGs9Q1dMAeV4ThMYgtQg6P+gmWB/t/PiY=;
        b=XONw6AAhKV19KTvjiuxAkzL5tN/wzw65i+/VfQxBRaO7zzc4s1TbeYHokZLI5EM1hK
         3LAaneQKlNj/SfUbEUZ6QpaNdI71O1ByokIRsw7JuqsTIvIuAxQmCoR1F213yQ6yiNcx
         JDcbKL1QDaLoXCMfxrsntbd2ZncsPnag7eBEb9DJcIBXa34p6Nnb9NoK4AhBMDlOVAN4
         hL2xLP2CDUFZ8TqYr4DqojpXZenpvsjmx9Zl7PW4u6xIvp0u8Jh7PaB+/xI/3rcoIncm
         QuDd4rZNQBrE397D1V+6Eg+AZvmXul6D6OOu5d5xJdmkPGMLKYEw6AF8X/sNYiDc7ljN
         OBvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772292395; x=1772897195;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+utxNAm/m2FGs9Q1dMAeV4ThMYgtQg6P+gmWB/t/PiY=;
        b=eCBdVaYO9v/KKc2t5v4ISFu1B+bQs3f51g+PH5RrEGIQNiB3OAFjeg53xNV/OOOkl4
         wXeKZH2dokYzzYNYikFAIo8fXY0kfQdqXIsQAJ7qAE7R0YK3w0Ns78ylX6OeBpKhx2Ph
         4qfQxqs74idVfU0mAoP3MaUvgH1K5+wehbYUJtcekio7n7o6YrRW5n/hbHzT5dNdpGi3
         kox/iM6yAyJxCcGk60eZvSiUL+F2fjWKo6ryr0OiRxJ7KgywO53C/EaWuZBTIbn2m5yZ
         HeFK+0ZKvbwU1AaWpU+UUFhYfmyVrZcqM0X44PaokTCuYk9G9Of7ZiAdD2nYZpRV4z/p
         J1bQ==
X-Forwarded-Encrypted: i=1; AJvYcCVyN3WPvcU0AGHSkn1UjfET+6At98BSzNI4RNGhBvwhHUdILv30Y8OVb0mNY1b0hMASjpwnzs0YPJHL9d1w@vger.kernel.org
X-Gm-Message-State: AOJu0YxzMMk6JReNmML/wrtY1q+osMHAuO7+ToWkbmMt9yQIF1rUXMIe
	sd6OFjZ2ew+BSof9orXTMu6XQHx2Bn5Bv1jlPdFhd5q1UuUeSDAVvkwon4yqHsp5mi5e2ZgPhls
	rc4owBJ7kzqFPTuHVAqBQyNMkixoUy5apOcnnHak0QTFco9bmrNLICdoZCHp9HyNMqHAuuyLAIo
	Ak
X-Gm-Gg: ATEYQzxsSC3Opq926aOAeBHMBrvtwZaqz/oSqSny3Z5+ancnONac439/7pRQ0s1pFcK
	bSV3L0j7Z5avH2ekJNSiVkgdrPmsQO5Qe6WtpZbwffuZIFJ9WFHY5cjfzjvVNUd85MeDyaRBS1O
	RJXK/tcJMEFI1tHONHBYwC4xJ/d/bBnvhxt+YV+gqRJ7Ih3msYKc8wVsHOoKF4eGmXH29kdm9vM
	CWa8uRdCUzJhjgKhkItbfybhidrx/eWoVaNeGcpBuUHNIikdlUp02KOxtDtBvYIFOuHXHmRTemh
	1XOT3gTzJftxjoE/xhYuV2OgL8IfvWE78KckD2p8R+vuALUJYd4XcG68eTt+0F9xPzwuvrx7nCe
	bSEn7wrS8DxO6HOQ5jsUVp6OEQexTtOZQzPayS/M22AVeeI4o+eiiH+uMVhPzqeHW2hqS2oYp23
	KpGDLjQ/6gPgrWjsU3twpuGv9sIJqRq2vW/ak=
X-Received: by 2002:a05:620a:3949:b0:8c7:1b3f:7d0c with SMTP id af79cd13be357-8cbc8e55216mr837955985a.16.1772292394666;
        Sat, 28 Feb 2026 07:26:34 -0800 (PST)
X-Received: by 2002:a05:620a:3949:b0:8c7:1b3f:7d0c with SMTP id af79cd13be357-8cbc8e55216mr837952385a.16.1772292394167;
        Sat, 28 Feb 2026 07:26:34 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a115b57922sm625558e87.63.2026.02.28.07.26.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Feb 2026 07:26:33 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 28 Feb 2026 17:26:28 +0200
Subject: [PATCH v2 01/11] media: qcom: iris: drop pas_id from the
 iris_platform_data struct
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260228-iris-platform-data-v2-1-acf036a3c84c@oss.qualcomm.com>
References: <20260228-iris-platform-data-v2-0-acf036a3c84c@oss.qualcomm.com>
In-Reply-To: <20260228-iris-platform-data-v2-0-acf036a3c84c@oss.qualcomm.com>
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
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpowkmTu4QornIC7qeD88xt8cB+FYEbe9Tcm2Ex
 jaQGrf+A+GJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaaMJJgAKCRCLPIo+Aiko
 1cYyCACfspNGGzFvCAUwZeNzBL76kgvuZeUa45t5mMAtX0bBrjrpqktER9q6edzQ8sJ0649YyvI
 heHAL74yQm9UHn20EH4/sfze01NlfNVOQ0h9su2JxbrgdBk6wTpNYmSBvlM+BkMWiFaUrUN4gxj
 v7MnQN0pXZSiR+lv6MpqiO3MSXw0+1zx4RNJYFJ+hrkVWqJK/Q+zLZkKjZA1F+ORtLbhyGJxrzZ
 qFb8R2S3FdR3sMW1X33Pa/n406ap+I9oScvT3xM+sby2BYcsy+ZziAA4GkpglTVgWWzinZUgfRz
 i73KjwPpgAlO1O81/H/3w62no0g/fGSpQegB2dtXAJ0REP6v
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI4MDE0MiBTYWx0ZWRfX0rbR2eGZGJeL
 oN4auUqntQSvUeEm2lrkhh/eAWrf5HVhKwl2J1B1m15nDMjGilZJ7Rfa8dn3ibP078BL24ViQFR
 UNwGQvLtgldZj4Ul0FPuF1UDXm3/QjRESq1RcsuhJhahMeuAmKuaZhC6MceIyqicJDysHSagk6y
 9qhnY5h5y0icyL18MRRh75FZqFsx6mZMucoWsjQnUhKeK8WTHl9lQblfN7gBwt/JCe+a8ptEddJ
 CTY/LT7vVpSiNMzsYnf6SF/gEr4xKYpWlznYO5nAa6QddUJk15DBFcDIzwhJltTQfhuv5OZB2a4
 wKJF2Uw+9FCHOgB55cRlIN3kzWZA9YtNnEq6LkdD/OS8UVoFgb1mwfw12Y5hXYFgWX75cX/I0wY
 K9ZS6lPAN23QtlHl2neGkaQJkSBaYeJImV2Tf3iOFc96XZWwvLM8hfhTqXW8AbSFAJ+GLfmAD2H
 vu3ap2xBwG3B07UMpJg==
X-Proofpoint-GUID: bTjaTbPHWsujrTq79WJsLtqI9KFN0OPI
X-Proofpoint-ORIG-GUID: bTjaTbPHWsujrTq79WJsLtqI9KFN0OPI
X-Authority-Analysis: v=2.4 cv=Zqzg6t7G c=1 sm=1 tr=0 ts=69a3092c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=iXhRqYnz1ivtNB1IvZoA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-28_05,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 spamscore=0 priorityscore=1501 phishscore=0
 suspectscore=0 impostorscore=0 malwarescore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602280142
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94616-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
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
X-Rspamd-Queue-Id: 334251C3E7D
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


