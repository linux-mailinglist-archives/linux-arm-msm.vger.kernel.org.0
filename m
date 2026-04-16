Return-Path: <linux-arm-msm+bounces-103441-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +LHwMjPu4Gl4ngAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103441-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 16:12:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 40C3340F672
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 16:12:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A9A6C304C4D0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 14:10:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2B173DFC62;
	Thu, 16 Apr 2026 14:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NXJghhS5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XDqSNpMO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35B543DFC68
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 14:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776348626; cv=none; b=VpP+fiQreEj5ADH2T8ymVwcyKXlme1cR5bfnvHB5o+heD8unRP28ahQ4065ghX5Q9gKrTWYUobSFml9psI040NLPJxqovbOk2LHAXF39hwcBzVmwgs/DGkX0E5GAUsACugkxofn+oC0pS0tAKV4yeuWOumCfN2f1G3peNMBRjnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776348626; c=relaxed/simple;
	bh=Ai7Oj6HYo2DVpdnuStjVjQuKPI6ELc1HNULGnu45Dq0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZaUGsteMqv7TsuRR6vtR1TIi1diXArI4RYdc3YrQxThfj/1lmOFFWrxs5x5sDKi1dCh53cjloE4ftxKo2uRzzDomRBOI5ds865xSLLVJ+c8SRzMjr8xNXNbhFbEbi3g0o7kTUyCsZaGFX+XQvtedCy6orWYxL9JKzpE1A2CLvY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NXJghhS5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XDqSNpMO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63G8xokt4125437
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 14:10:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ILMb+mV5AdAqlIxF1QaEkI31w6HYyIF9XcVFgHuAyCo=; b=NXJghhS5Y94uTiXh
	vlaoOzTtkgnGrV/O/geMhThLlUVMw8E1bxPcKsZvAgXcoJPChVCz3IMqMo0wbfE0
	EySpjaAInNHKjpobrxamxOBMsbIdPCRSMh9oBk+C9LG0vhofKInNpjITY+Qz1Bay
	FreF+ohwj+wyWwe407n7DgHPNivediP6JqFGifIDQKMkeSBXKSqQF9a2nTgBbuGt
	IcqjyXefR6/DkUFclSaMwi963/nxTlVxtzidNvIrc6xVBozHmQ15fbmh6guJaUs1
	aIBR/WSgiF7tWlYcfW88XNVmR3grySvdTGisYgZmZTcydd71Lu1yVf9FzgX8GAdM
	kUtt6A==
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com [74.125.224.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4djvrf90vj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 14:10:23 +0000 (GMT)
Received: by mail-yx1-f69.google.com with SMTP id 956f58d0204a3-649deef077eso13246102d50.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 07:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776348623; x=1776953423; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ILMb+mV5AdAqlIxF1QaEkI31w6HYyIF9XcVFgHuAyCo=;
        b=XDqSNpMOgaL+S6ASmDDne2lpVIpAyeXbeFWWvfob1FHbGxHiPg5lMtfMRG0OV+aQrm
         LShIzHlWUC6wKK/bwCULjFVXbV9DJ6hO31EmkfYyI8XkmpD0oqJLpCi7OoFhxMbiH3ii
         +LPnRGIZdKRLsZXsqE3GTaEtVa5FJRkyu8oLjMl0BhCmVXAohzjoN7XkhGcwnWmmnRtC
         oFqW6rd/+brc2SbLFJiEa5bWmeEfGFDFkEtpBOPnXxqo79qRXAt7hFI19KDEhRZ8KBg1
         OTGcMXRQx/OInvsaPEyea8luOtPBRGMDIV0K9bn50po9vNF9kxduJm49YRkI3btkDMRn
         JUtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776348623; x=1776953423;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ILMb+mV5AdAqlIxF1QaEkI31w6HYyIF9XcVFgHuAyCo=;
        b=QVI7ch4dFxvfseNl7XewQWdms5UR4pQ8XU+9FWtd7iBxH65EJcDgBgWRUPxP6cva7o
         MFtS3CDWg3z+upmm+eWbXPpCAxa7mg0ky8UBiY9/05m7GkJ0YJSzkH4talX8sfwivVuk
         39jo8I4tcmKFma9fevJZBy2kr3o0FSc5a8prqxCzqubhM/ZCDW2leyCIYSLGss/tI/z3
         Is13hJEuFxGKIWLhROHsP3TXaT5GfKIZMPUAoeGx8P+D992RRwYeBoFSSJ/pWYZow7M4
         D1jNOOM4B1d1+U+qfj+UfX2ARz66al0eLwoF6K+47FBCzoNkjCjmW76re17tZUxdmOd4
         IE/A==
X-Forwarded-Encrypted: i=1; AFNElJ+0H1zGgjmJXXJQrYtrdZAZLY1h9UVL3U8ojxqbwgLa55SZylYCgLCwLluMA4soQUsY2vYl8mz78eH645la@vger.kernel.org
X-Gm-Message-State: AOJu0YyC/k25EKmthHKh24+uoJtLiF3RkB7/IkaBYCDk7vVEDAVL/vXk
	4fOP9zIctxc+Yt08elWxoS0Y/t1FsmGUYKgMKCK6OH+qXIQZzS24XnaHtBEqKsz+TGj8XMz1JvG
	vGJyNie/zzkbPRXJ45DK0W0wsHFvkoj69EXr2eQ1Wfu7pX439pE07nK1bsH7DtkD5nkS8wt09/n
	Oo
X-Gm-Gg: AeBDiespoYoH/hiwl4+ZFrPf41F9ErIgn64JH9ejin94aYCwkMXeUhdPH0Rnz6jUxX5
	cdI31P+BMZtbTMbG4ugXVLoMpxPUD9xr+o3P+R3BoWwrWU13XqgV1zcBN5LFSxPuDZ/7Uajzjjl
	vq11R24CSU1cmCqHTtG++XJONZdqVtBjprbIbSufiioNc2yRZIN6vQMP9P1iRewal2rHnBUT6wd
	suz7sL9YM3Nv6m5TEbD7fXxfex82Tp20iOpQSLkOyB1fkyi9KLpfXDTqAn+ICz9quJ/RMGWIwzK
	u+i83VYh55H3hFbvEmkNN7t55PNCBY4rBvDWb9WylWg+SNNgsfabS6RcrsDjS7dhUvZtGsxUFco
	ZtjJQoGJCS1G6QDoAQKJBo0O/4w8na0t6iJZ8KU3J+dF6QQ4lNmk=
X-Received: by 2002:a53:b6ce:0:b0:650:7846:f326 with SMTP id 956f58d0204a3-65198bb5341mr17653900d50.51.1776348622565;
        Thu, 16 Apr 2026 07:10:22 -0700 (PDT)
X-Received: by 2002:a53:b6ce:0:b0:650:7846:f326 with SMTP id 956f58d0204a3-65198bb5341mr17653845d50.51.1776348621719;
        Thu, 16 Apr 2026 07:10:21 -0700 (PDT)
Received: from hu-batta-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-652e47ba4a3sm2084691d50.17.2026.04.16.07.10.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 07:10:21 -0700 (PDT)
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
Date: Thu, 16 Apr 2026 19:39:46 +0530
Subject: [PATCH v5 5/7] bus: mhi: Load DDR training data using device
 serial number
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260416-sahara_protocol_new_v2-v5-5-6aebf005e4ba@oss.qualcomm.com>
References: <20260416-sahara_protocol_new_v2-v5-0-6aebf005e4ba@oss.qualcomm.com>
In-Reply-To: <20260416-sahara_protocol_new_v2-v5-0-6aebf005e4ba@oss.qualcomm.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        mhi@lists.linux.dev, Kishore Batta <kishore.batta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776348592; l=2770;
 i=kishore.batta@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=Ai7Oj6HYo2DVpdnuStjVjQuKPI6ELc1HNULGnu45Dq0=;
 b=WWlNVMISE32YzOacAObQV7dNIdXlO1BGZ6LObollUK2JIrhEPezGqcUbkpsBTUSpn3s2vLrDp
 UNhQYOZM7PhB+Q1nzHDwRgrwZHLL44tf02jQlSCFTctKmH9zRJSHFeq
X-Developer-Key: i=kishore.batta@oss.qualcomm.com; a=ed25519;
 pk=vJo8RvTf+HZpRLK2oOIljmbn9l3zFkibCGh+blaqZCw=
X-Proofpoint-GUID: f37aJOVs5rwC3tt5kFb2VElU4LVnXcE4
X-Proofpoint-ORIG-GUID: f37aJOVs5rwC3tt5kFb2VElU4LVnXcE4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE2MDEzNSBTYWx0ZWRfXwH5181deMvyb
 tyAUZDK81Qx8k3MPqjay+1tzpbvaHP1EArxztF0R7tqFHVRvwfGnVzmcdmQBXi45FHDm2JzTHsv
 q9pzuJRrrLDlks3xf67VZpab9UhR1Kc0fyX9ztgI0Ui/WFROhjKkaxiHcPh0BVJbfv8CER9QQuK
 2JLO4UsUjsKuAieCXuM8y3CXqjsrZ3POCigLC9wsq5PzcKIfvAlTJ7rEwn2De/6YtbWF0dzoP0P
 P0T7MyQSjJO1qXX9FD9MM9GwrVU8PBorz9HKhF2mUaIhjR0G1J85yS9ryPejKIvcUw1HdF3utkr
 ehhildapwcwXVBJFj+oAFwb5D0e7hiv/R3V+aevM5vZZlzCDAyAOg5ruRBibfbNsabvaN5OnNZk
 BvnTtuQtZVNMWpsGE83bAlDaqOzlKR2fuGT+WYnDGKP/bjaenfY1Y9Dx/JIOsZHuxqIaY1NdNsT
 J0D4kPzLZIz1rYTp38A==
X-Authority-Analysis: v=2.4 cv=YtE/gYYX c=1 sm=1 tr=0 ts=69e0edcf cx=c_pps
 a=J+5FMm3BkXb42VdG8aMU9w==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=ICgrKnnyuXbdZ-Zkjz4A:9 a=QEXdDO2ut3YA:10
 a=Epx66wHExT0cjJnnR-oj:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_03,2026-04-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 adultscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604160135
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103441-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kishore.batta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 40C3340F672
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Devices may provide device specific DDR training data that can be reused
across boot to avoid retraining and reduce boot time. The Sahara driver
currently always falls back to the default DDR training image, even when
serial specific training data is available.

Extend the firmware loading logic for the DDR training image to first
attempt loading a per-device image dervied from the device serial number.
If the serial-specific image is not present, fall back to the existing
default image, preserving current behavior.

This allows reuse of previously generated DDR training data when available,
while keeping the existing training flow unchanged for devices without
saved data or for all other firmware images.

Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
---
 drivers/bus/mhi/host/clients/sahara/sahara.c | 25 ++++++++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/drivers/bus/mhi/host/clients/sahara/sahara.c b/drivers/bus/mhi/host/clients/sahara/sahara.c
index 9adbd84859073d8024ba2a5fcfa33897439d6759..b5ca6353540dc3815db6539e7424afdb749fd3f6 100644
--- a/drivers/bus/mhi/host/clients/sahara/sahara.c
+++ b/drivers/bus/mhi/host/clients/sahara/sahara.c
@@ -59,6 +59,7 @@
 #define SAHARA_RESET_LENGTH		0x8
 #define SAHARA_MEM_DEBUG64_LENGTH	0x18
 #define SAHARA_MEM_READ64_LENGTH	0x18
+#define SAHARA_DDR_TRAINING_IMG_ID	34
 
 struct sahara_packet {
 	__le32 cmd;
@@ -226,6 +227,27 @@ static int sahara_find_image(struct sahara_context *context, u32 image_id)
 		return 0;
 	}
 
+	/* DDR training special case: Try per-serial number file first */
+	if (image_id == SAHARA_DDR_TRAINING_IMG_ID && context->fw_folder) {
+		u32 serial_num = context->mhi_dev->mhi_cntrl->serial_number;
+
+		fw_path = kasprintf(GFP_KERNEL,
+				    "qcom/%s/mdmddr_0x%x.mbn",
+				    context->fw_folder, serial_num);
+		if (!fw_path)
+			return -ENOMEM;
+
+		ret = firmware_request_nowarn(&context->firmware,
+					      fw_path,
+					      &context->mhi_dev->dev);
+		kfree(fw_path);
+
+		if (!ret) {
+			context->active_image_id = image_id;
+			return 0;
+		}
+	}
+
 	/*
 	 * This image might be optional. The device may continue without it.
 	 * Only the device knows. Suppress error messages that could suggest an
@@ -235,7 +257,8 @@ static int sahara_find_image(struct sahara_context *context, u32 image_id)
 				      context->image_table[image_id],
 				      &context->mhi_dev->dev);
 	if (ret) {
-		dev_dbg(&context->mhi_dev->dev, "request for image id %d / file %s failed %d\n",
+		dev_dbg(&context->mhi_dev->dev,
+			"request for image id %d / file %s failed %d\n",
 			image_id, context->image_table[image_id], ret);
 		return ret;
 	}

-- 
2.34.1


