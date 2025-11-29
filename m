Return-Path: <linux-arm-msm+bounces-83857-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F79AC93E12
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Nov 2025 14:18:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4B23C3A4A56
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Nov 2025 13:18:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A9C130F94B;
	Sat, 29 Nov 2025 13:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dd+I8FQq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GQ3Bz/BO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E47D930F817
	for <linux-arm-msm@vger.kernel.org>; Sat, 29 Nov 2025 13:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764422296; cv=none; b=dKPMgs3aGTNIFzXa+50asbVAptcdazs622mTDn82dTtbYMaCmKxEBvsFmnCIOH1ovqSNNj521Q+CJQn+15e9Vgb7wUPFPQEVmiXEZHjAZt8p9tDQT8tw0wmJ9pUVmaPCAJqvXcAoxowiXcUzvxqcHYWv1hJPkljN9z+1Kne/wFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764422296; c=relaxed/simple;
	bh=K42eh0RgaQ7SkV6aLlbnaArKT2lLyhObgyt79d/hoyo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bVx6vR+KXwCGq/Mt+ZN4czcirrPmgBmXA8+aXRT1bNUDqcGmFfCipFypDh/oUSzhlY3lx7am+ZC45wrg9cEJFYUNkovqefwIGWXdPw7Dcomwk0dTSnMfeptOJIYBUlUMJuLTQP4FIm1jDn4phL+icj09/AbmR7t5AEMs4EiqJgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dd+I8FQq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GQ3Bz/BO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AT28tMT1635517
	for <linux-arm-msm@vger.kernel.org>; Sat, 29 Nov 2025 13:18:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ay8cTpgGplkj5cCus4XuGSNhbbp+i2Dv1oJU3OIxNtU=; b=dd+I8FQqD9ZhR3/T
	wVldqEfZpUSJ8BM6fHasr+RIkg4TCZ+8BGVCtr3dMsZXd4jSK0rwsyCAIzx2nR3r
	OisaeVgypxC96iJ2e+Q/zcZFTTfnHEdmLhJSwy7wa9DzzGL5aKCZP7HdFfMNcT90
	StVKjubnEiV3liSqM/jTLYXJw52r+Z9xg6G9M2uAWtawsFapVRd9poxdmQXB4J4y
	G4/SIQEaGEekXi3CscJUo4hxuiB3B/25yoM4PU2YJ4ZPWJgzpOGox224ddBPdmnF
	m3arCvNEPg0w0KifwLr04RjOaGUnq1Hz6A2YMcJLK5O7PJBzjh0IkqcpyFoT1Rxo
	FQ4zmw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aqqsqgte8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 29 Nov 2025 13:18:14 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b234bae2a7so502082385a.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 29 Nov 2025 05:18:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764422293; x=1765027093; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ay8cTpgGplkj5cCus4XuGSNhbbp+i2Dv1oJU3OIxNtU=;
        b=GQ3Bz/BO0w76VTDfFCqhh04zYrm+RSB68TJl+moPICBlRdjWhFs9paVNxyk2pMMDtk
         jtDrdpxQORtc0j4Yra7812MPIQc8+pAWOB66/HkE6ahZLxmvAp5ULzhjV1+NXO+jgYHi
         I2iuTDFLpv0ADCYS51KtRVaMa811w9JlayP5m6V8F9+UTIznwwCBnp6QLJ3tq9dEoD29
         tCR9BLDFkU7qLGmjPBJJIEOsvXuB+XJVj8kLVOU0JthOSS0pEODNejJifdZwYoH43WKg
         WrFMAP21EXsrbIp9BSbGBueX6R0UBn0C9dmRfEfV+ZMT53B4n0LQ0+974KeAdlhU/mb/
         IgCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764422293; x=1765027093;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ay8cTpgGplkj5cCus4XuGSNhbbp+i2Dv1oJU3OIxNtU=;
        b=hYv8zv3so4vnrLgdo/yj6karC4AD0NiUGDu5Za5mVueUtV8fvBIDXsfjapHKsrjrOz
         Lu2CAJ+z7uyWrwjtMpRKbaU2u5GEBZuhXNdtMG0Rru0xkGLIltrEHhYlI3/Px/YErjHe
         LdYpUt7JEeCcAiy8/AI1Xv7s3tuyv9rrCuklHSNHKmhsRyTjBqzL0lxN8skNonIMymfA
         ICafSYLRT5yi4BGLrD5PrVOK/3SLic8Q17GdnTlhl+XyNI1GHLmAHWedoFtN8KbxNjr0
         lnP27aDbObMyF3ObOWqDDh8crcU6I7O1us5e9SoqsA31f2lo8x2BdOjTFCsSiAu76mOX
         TxcQ==
X-Forwarded-Encrypted: i=1; AJvYcCWMFYviDa8kfFb9hT5RJyjRBxxsyyKGrXjmO8xQ6vFpIo8N6TTB/NoTPdjxdvp/J0G4sg7wb9NcadhfV1hz@vger.kernel.org
X-Gm-Message-State: AOJu0YyRHpLjcMsuctRBKhQJFNJvhXq6wyQA1dva941Zhs/zFsXdeuM8
	l76qCu9v9CwDhgb1FZEvEr7xTmJHjvRjsEIlv4MAeR4Bj1cU9wHshybrZVoZ4j4IXxKV3PfKT3+
	rRRT8EoDz2Rl7tO9Pi4d0FJH5kG+ufCM0DZeNbGPXkwznvf7P1Wi3bm32gCEbTn5A9RRH
X-Gm-Gg: ASbGnctqh/nZpq/nXEDAFnKXjCV4LGSGsqt/PjeFlnxZzLYtUVQDeVfQaZi2DPnsLyI
	IRInTop4xoETeVKiEmtXUZp6XdRutwDaCpbXaMiix7waHmK4ztI8lkCz1kRUnSLmpJguKnh2/8u
	mOZSuY9wxrBJ5T0BlvuKb0xXHroR3Yl2Vhc/QVkOMcGQkAXD9GzvjwYEMzc2SASbn8z8Sw/DlKh
	E3XttNrirpSCDVToFaqeQPRDQA053PVqfWpRZtJj/NCQDUwWeGnDanSQWNbC+ZETtpf8ggmBo4w
	ruYmriC8Mi0X57zOfLY1Ta88Y5Ig3Ch4n71aO5q9jIczDzPvAquSkmtkRhv8++NJI3DA+ZBwYu9
	AhfW1mPlyqTNEMeCg52tajW5kdilicLipNQ==
X-Received: by 2002:a05:620a:1a2a:b0:8b2:d72d:e41b with SMTP id af79cd13be357-8b33d264190mr4143714985a.44.1764422293061;
        Sat, 29 Nov 2025 05:18:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEcLqw0fi2RGuk5nN2M4NnxKzhuzY+4reV3PrURPNdhTmtrfADCkI5j0oYE/bLnP7F+gaFR6w==
X-Received: by 2002:a05:620a:1a2a:b0:8b2:d72d:e41b with SMTP id af79cd13be357-8b33d264190mr4143710885a.44.1764422292612;
        Sat, 29 Nov 2025 05:18:12 -0800 (PST)
Received: from [127.0.1.1] ([178.197.195.159])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76f5163903sm723233866b.7.2025.11.29.05.18.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Nov 2025 05:18:11 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sat, 29 Nov 2025 14:17:57 +0100
Subject: [PATCH 5/6] ASoC: qcom: audioreach: Fix confusing cleanup.h syntax
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251129-asoc-wrong-cleanup-h-can-people-stop-sending-this-without-reading-docs-v1-5-c38b06884e39@oss.qualcomm.com>
References: <20251129-asoc-wrong-cleanup-h-can-people-stop-sending-this-without-reading-docs-v1-0-c38b06884e39@oss.qualcomm.com>
In-Reply-To: <20251129-asoc-wrong-cleanup-h-can-people-stop-sending-this-without-reading-docs-v1-0-c38b06884e39@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3530;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=K42eh0RgaQ7SkV6aLlbnaArKT2lLyhObgyt79d/hoyo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpKvKJhChddCBLhBKRSbGNkgZlGuVg4nlKETf1C
 7mTifJ2ZgKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaSryiQAKCRDBN2bmhouD
 11G/D/0cnEfCYwNasGSmG7h8qz2GmH3oCG7miSOIKZ9GkZtg2wdL1VibC/VUQD9GnBli6J8YUJQ
 FbNkGcE5PVp7BWr6VrTiciIqTVCEz5D3q570QdEpuxF3kb6aPYsQTN7JZKJfeYRmCB+7oCiUVzJ
 C8yeGmHkPs9Z9WXgYiIXFFAfJaayTZWmrmuuzuyutzbwqqlvI8Lunj1bfBPO6eW5Jo4/r86NQdV
 //G2Z+nbz2D8VsUZOii+BWFIsXfpzjN91v79SSjuN8ILd1lYAEIu0RdZZ5p3DSpOiIo54zh2Upr
 A9iG7r/fHRfu3WqRK7uYsgEp4NxAbm7HtjEKohhSzsDaBKx6ruE5rA8DLq22/WKc2FUawIGVrq7
 AOhO6boenwaa+w/O4j2dbGu9ddNCNzPKPMeXKCRh2ZIRArvdk7lABaeF4xSKbGOowi2vt6BS+T6
 IWBCE1fczZW4V4Js/RzX6Tnx0XRMhpiVrbwRI2QsJmrgsWUcsB8j/MWYkyp1wei3mKFXCibzIQa
 UY/PDom4sNfMN2d6urgo61FSdzdS4vUXHlWYJaCL5gVQEhxwhljeBBTJ7u1U3MomWr5BOpcUcWd
 /Rm6gD+blGmzqjAfYeQY12kW8keAtYOeFAYf5kLf4Xo/NWIDzRnVLB2hV66vE0qpH/T6n5M7hmH
 fQLQsvjRVnqViSQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=UqVu9uwB c=1 sm=1 tr=0 ts=692af296 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FPK7cjBCgYbqzSTDLBmM0Q==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=C9bQe94teVNSW6X4EGsA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: rymf3jGczG9xUHeZBdJlUejcsVpgXE9H
X-Proofpoint-GUID: rymf3jGczG9xUHeZBdJlUejcsVpgXE9H
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI5MDEwNiBTYWx0ZWRfX1tNfczqRoktu
 8LgXIq1NhugDiz/zCIyuTVwsuB2NMztK6MN7Jr9q8o6BX7adv58VHSxPBvSFMVZ63EUfZ5cDTqy
 /NOvZ5m0xYY6N0GnA4UHKrYVF6vs4UBUwdiy+zSfbB0jGI1L0UknEZ4/XzhijvvgMZfCXhCkPJS
 /XTV5TxgYw08LrEEoOkSHBWssm+fNgelaLHBx1B27sgxUnzx1T9bN4mY9O5ej5XPcNmsQOpGHpm
 baKO2visA2RskfK9SIrWz27eEjAdLtnmCMQEXfitGdh5CyIqNdF/3m3Brp4btxEu8pk4B9DgQpo
 Fe1E6XB+VBgtdrU28lgplNVFBARrjkp2VNm1EHz2OFX8bi2YhoJ78yv3H1SCPWrFpyDs791biuW
 GrbiiDKvM8IWpMWdoV2PkpOY8DfbLg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0 adultscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511290106

Commit 88a5f8e628ef ("ASoc: qcom: audioreach: Use automatic cleanup of
kfree()") did not make the code simpler but more complicated.  Already
simple code of allocation and free, without any error paths, got now
declaration with one constructor followed by another allocation, which
is in contrary to explicit coding rules guiding cleanup.h:

"Given that the "__free(...) = NULL" pattern for variables defined at
the top of the function poses this potential interdependency problem the
recommendation is to always define and assign variables in one statement
and not group variable definitions at the top of the function when
__free() is used."

Code does not have a bug, but is less readable and uses discouraged
coding practice, so fix that by moving declaration to the place of
assignment.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/audioreach.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
index ded49124581b..329d916779f0 100644
--- a/sound/soc/qcom/qdsp6/audioreach.c
+++ b/sound/soc/qcom/qdsp6/audioreach.c
@@ -730,15 +730,15 @@ int audioreach_send_u32_param(struct q6apm_graph *graph, struct audioreach_modul
 			      uint32_t param_id, uint32_t param_val)
 {
 	struct apm_module_param_data *param_data;
-	struct gpr_pkt *pkt __free(kfree) = NULL;
 	uint32_t *param;
 	int payload_size = sizeof(uint32_t) + APM_MODULE_PARAM_DATA_SIZE;
-	void *p = audioreach_alloc_apm_cmd_pkt(payload_size, APM_CMD_SET_CFG, 0);
-	if (IS_ERR(p))
+	void *p;
+
+	struct gpr_pkt *pkt __free(kfree) = audioreach_alloc_apm_cmd_pkt(payload_size, APM_CMD_SET_CFG, 0);
+	if (IS_ERR(pkt))
 		return -ENOMEM;
 
-	pkt = p;
-	p = p + GPR_HDR_SIZE + APM_CMD_HDR_SIZE;
+	p = (void *)pkt + GPR_HDR_SIZE + APM_CMD_HDR_SIZE;
 
 	param_data = p;
 	param_data->module_instance_id = module->instance_id;
@@ -1043,7 +1043,6 @@ static int audioreach_pcm_set_media_format(struct q6apm_graph *graph,
 	struct apm_pcm_module_media_fmt_cmd *cfg;
 	struct apm_module_param_data *param_data;
 	int payload_size;
-	struct gpr_pkt *pkt __free(kfree) = NULL;
 
 	if (num_channels > 4) {
 		dev_err(graph->dev, "Error: Invalid channels (%d)!\n", num_channels);
@@ -1052,7 +1051,8 @@ static int audioreach_pcm_set_media_format(struct q6apm_graph *graph,
 
 	payload_size = APM_PCM_MODULE_FMT_CMD_PSIZE(num_channels);
 
-	pkt = audioreach_alloc_apm_cmd_pkt(payload_size, APM_CMD_SET_CFG, 0);
+	struct gpr_pkt *pkt __free(kfree) =
+		audioreach_alloc_apm_cmd_pkt(payload_size, APM_CMD_SET_CFG, 0);
 	if (IS_ERR(pkt))
 		return PTR_ERR(pkt);
 
@@ -1090,7 +1090,6 @@ static int audioreach_shmem_set_media_format(struct q6apm_graph *graph,
 	struct payload_media_fmt_pcm *cfg;
 	struct media_format *header;
 	int rc, payload_size;
-	struct gpr_pkt *pkt __free(kfree) = NULL;
 	void *p;
 
 	if (num_channels > 4) {
@@ -1100,8 +1099,9 @@ static int audioreach_shmem_set_media_format(struct q6apm_graph *graph,
 
 	payload_size = APM_SHMEM_FMT_CFG_PSIZE(num_channels) + APM_MODULE_PARAM_DATA_SIZE;
 
-	pkt = audioreach_alloc_cmd_pkt(payload_size, APM_CMD_SET_CFG, 0,
-				     graph->port->id, module->instance_id);
+	struct gpr_pkt *pkt __free(kfree) =
+		audioreach_alloc_cmd_pkt(payload_size, APM_CMD_SET_CFG, 0,
+					 graph->port->id, module->instance_id);
 	if (IS_ERR(pkt))
 		return PTR_ERR(pkt);
 

-- 
2.48.1


