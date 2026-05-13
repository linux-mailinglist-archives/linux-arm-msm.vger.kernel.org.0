Return-Path: <linux-arm-msm+bounces-107434-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +Ax2AovHBGrdNwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107434-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 20:48:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D19753941E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 20:48:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 81EA43029A7B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 18:48:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A2573AFAE1;
	Wed, 13 May 2026 18:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MSJ6Zqnd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QygKHTfD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E18523AE1A5
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 18:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778698075; cv=none; b=LlTsS1gcBAHLJY4hdzm34MipGDkgM0ApNvcn1aSqMXj3HImc7lydwKqlkWHfLBW8CVXXad3XViBZiwBEeoiWwpX4vNHXHHOZRAnk5aACC1UaLVj9mF1cBfyOmnQmHDa45M2MwtDjtq0kbpiG9bM/U1izQ/TzUXsmPmD3EHQacw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778698075; c=relaxed/simple;
	bh=8Yo4vX7fGe0QXwnrIwfbruhjFf5gM+ropxGlEWEHiKw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=l2T4gQBS7/wQQy8pS0YHd0gp0hp+SHWCm5v+6aiXwHuod4JpgmprtGJprM3t08T96C2nxDSOirS9FCa+e4lrU1GhNmmhAtUQ/WRJ2Vpj2pLdcEMrLhFLIOfCDf/8w3/CF7cvrnz/S7jJqEcnXm3jfTkjhk+UFm9Iq4xiVco9bf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MSJ6Zqnd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QygKHTfD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DEvmEm2888312
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 18:47:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j++imoZhA/2CP3igpgrQBwDBDfBKiWf9JFW7hYyONYo=; b=MSJ6Zqnd/A64Dzs9
	AlXGFD2XiKngi582LDo62wL1qReFNWZ+KGBpCfrICUh0bcBx2Xoj+N+A0+zgvmil
	ZL3rvQD085isHiE82+sZ0uIN/xjnpzz1p6CkW86eDzPqgvKZG8ep4eecOJntaowu
	Zg7BX254wf71v/jv5rCIslnRgIcpi/LvvT8ZBQoW+jPo1OjInYSzdghOGC5xuYJ5
	KS6RRwzbO/0ek61oFF2fimH1JYR/G40d4NT+lmraaDEZuL2jG9tp+K6dY998Uf3Q
	stH4zzf04LvEEwlu07KYw+i/aWAqz+HZPTF4wGKkmHNSdBypkcNFWX2LgJQey/K7
	c/6zPA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4p4gjf3v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 18:47:53 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ba115ab6bbso69442535ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 11:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778698072; x=1779302872; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j++imoZhA/2CP3igpgrQBwDBDfBKiWf9JFW7hYyONYo=;
        b=QygKHTfD3SasqVJbdHJaLhS04inngMPiMP6dcK89sFus4/pLb9ge2+jaSTo0vGcEas
         PSQ088Q2gsLvpzb2MxpMUKGXq9B8qlTQzNMKFnK08PzScJvx4mFI4c1AXtdad58AHqzS
         chqizcaRHWP6RjzeC/dOujIBeG1KDfX7lrHA6YQzV7fEnEoj8oMPPU9d2fZlSWhlUBfL
         STZZPSXg58WbGIFdI60UfpVi214LEAt0f76cZhtIK9Hduzl3VtQ64B9AGSPdUXg+nchD
         s4LjBorDDzAQcbWRNBqTNwunpK3MPJp1SOl2dPCBFzjokDsv5ZVz16l/EKzBV1HWktai
         kAJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778698072; x=1779302872;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=j++imoZhA/2CP3igpgrQBwDBDfBKiWf9JFW7hYyONYo=;
        b=nBtVe0gU6XRvYD64xjuy3B/YoglC4FU5/M331sFN5s66wj3zDwOAD4Ezrp2s+Y/MF7
         CI7sAj9CLFGmP9FBPxYTjOcIhLzK2hrkykNQHVbAktKsPR6PZID+illmmUhJUjS8tS0V
         TgiwvhB50Omg2yU30cSEao7DweojU0sqetvXSuj/VDTfo5kadYpMKHKB2czA5OqdvuSt
         rR9etmDGQr4195R7Kh1uT6G5Ww8etcEV8chtTx0NTwbJlFpH+LsciAmr9VHXPTwhAFj1
         MOCk0uj91PjjABAFsgDAl0EoDkNQdftKeP7DCvZInkqCg1x17ZH1eCBw1/4jatz0MS5+
         xO+w==
X-Gm-Message-State: AOJu0YyWLwwW31pTDtHV6uZsJjqst0ZYB09MZa4bEP/iLy16NdoI82kK
	SjRc0STiny6HzhaGDZ/A7doewVLbUbxgSlaPIinbG29GWAfuQeoecjRpulPrxf8FW6hppYg/tHb
	W8EcAZfVxIsQnvdtr+jqhsk5yy59cArnPFpd5mnoYLZGbVMBTK6LEaTlUDkwzMjJ5vgnR
X-Gm-Gg: Acq92OELNAV02zOxQBva2QdPXc68P2Tc9+r7Je0Es7BQjmQzPJQkjL/uEqZ9Kbz0mPE
	/QM/Mak9tPu4SevfQ7uEDtPC3zP1QHV8cpWj5nXlZ+Q1CGJFx97nBhvNil4y6/M2ADKFBuR4FHr
	uXXi72GcG4qUJWJXlxqHdss9hnjWDjx3Ssz4MTiYxQXIHxRV7wVM8X5jwUBfYJYZd3VzIIF+P11
	BBOouvtyo5bk6HkADzXa+FGGIsaJpHbnVkFcQkrlLaq5dw6YAB4eSSC0TVAHGc3Q0y1TKeXZ1U7
	BXProRWYXnYROlh+p9SeZDVqZlP+xhcVmZqIyHcEOZ5cWvPlwPdOx4Ed9vILSovxO8wTSRzc5X5
	4zn1IZeThkfMJjdEhFr9IO2w0C+C/4pnsqX7teX1CH2n8Ov0=
X-Received: by 2002:a17:903:3c0c:b0:2ba:307:4577 with SMTP id d9443c01a7336-2bd27138e8amr50272505ad.2.1778698072495;
        Wed, 13 May 2026 11:47:52 -0700 (PDT)
X-Received: by 2002:a17:903:3c0c:b0:2ba:307:4577 with SMTP id d9443c01a7336-2bd27138e8amr50272265ad.2.1778698071951;
        Wed, 13 May 2026 11:47:51 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1e35bb9sm187438405ad.52.2026.05.13.11.47.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 11:47:51 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Thu, 14 May 2026 00:17:31 +0530
Subject: [PATCH 2/2] remoteproc: qcom: pas: Add Shikra remoteproc support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260514-shikra-rproc-v1-2-9afdedeee002@oss.qualcomm.com>
References: <20260514-shikra-rproc-v1-0-9afdedeee002@oss.qualcomm.com>
In-Reply-To: <20260514-shikra-rproc-v1-0-9afdedeee002@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778698059; l=2729;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=Yg49z19gCeuEXzLK/ZNragrmueemXhXrgNF/YTyJqz4=;
 b=emnIGLr9iKI3bF5QjOkaCT+C+wl2jBz9TfisUA+Xt55TIzIHkHoXCGB4NoEE7fwRI/kFQUpN3
 OWCJWGh6fWZBUUWbtclXdf+2fJ+M1KD7DnZPm5i5NjT6CeB4sPT3dz8
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-GUID: Kwb6KnlgIdldGDK1avSw47Ld6wq4E_NS
X-Authority-Analysis: v=2.4 cv=DOS/JSNb c=1 sm=1 tr=0 ts=6a04c759 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=5sj8McGL5gorvj79y9wA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: Kwb6KnlgIdldGDK1avSw47Ld6wq4E_NS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE4NiBTYWx0ZWRfX5eSmIZlKDDPX
 semDTb94Ak7qiL40BNfVqSKNBqmUddAw+QkqXHRTDjMfFhxyUvC+eRJoHhnstJOwNnPygbWoacc
 Ffn/axBTHzJ4B+/W6pZCAqSuKewuRzfz3q69P+qsqKjIWNdeAHiY5PH169ZrWxhAnsFwbtJ4qXr
 MCyLoXnXRKzRQ5+ZPTATX+24iwvaZBpD8Suif4eyRhntYEt3XYfb4Ravi03Bz3B6Sjoh/fHwSvK
 PFdTCY0ANlPDFuV8O55eLAroVPOjSRmBKOH7rVxDl7cOFW2YUJbmHCS/WZBoAgu1MG55uqT9jMi
 g17KxrLfoYOagAVfLdiYTbbY6znOTRVTh44Xzxl1v13cqB5m79fxwTunmcw5/qWlaPKiqAjtT6T
 QVwInk7zCJRzrfIET5MoLMRuUigdR1YcLIQWW8wMZuQqQaOTIFYbUJsgb4ZpVJv4q9DymYQAYK1
 bxys210+gxrypZ/aomA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 phishscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130186
X-Rspamd-Queue-Id: 8D19753941E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107434-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[komal.bajaj@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>

Add the CDSP, LPAICP and MPSS Peripheral Authentication Service support
for the Qualcomm Shikra SoC.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 51 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index da27d1d3c9da..4d43201b9ada 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -1457,6 +1457,54 @@ static const struct qcom_pas_data sc7280_wpss_resource = {
 	.ssctl_id = 0x19,
 };
 
+static const struct qcom_pas_data shikra_cdsp_resource = {
+	.crash_reason_smem = 601,
+	.firmware_name = "cdsp.mbn",
+	.pas_id = 18,
+	.minidump_id = 7,
+	.auto_boot = false,
+	.proxy_pd_names = (char *[]){
+		"cx",
+		NULL
+	},
+	.load_state = "cdsp",
+	.ssr_name = "cdsp",
+	.sysmon_name = "cdsp",
+	.ssctl_id = 0x17,
+	.smem_host_id = 5,
+	.region_assign_vmid = QCOM_SCM_VMID_CDSP,
+};
+
+static const struct qcom_pas_data shikra_lpaicp_resource = {
+	.crash_reason_smem = 682,
+	.firmware_name = "lpaicp.mbn",
+	.dtb_firmware_name = "lpaicp_dtb.mbn",
+	.pas_id = 0x56,
+	.dtb_pas_id = 0x57,
+	.minidump_id = 0,
+	.auto_boot = true,
+	.ssr_name = "lpaicp",
+	.sysmon_name = "lpaicp",
+};
+
+static const struct qcom_pas_data shikra_mpss_resource = {
+	.crash_reason_smem = 421,
+	.firmware_name = "qdsp6sw.mbn",
+	.pas_id = 4,
+	.minidump_id = 3,
+	.auto_boot = false,
+	.decrypt_shutdown = true,
+	.proxy_pd_names = (char *[]){
+		"cx",
+		NULL
+	},
+	.load_state = "modem",
+	.ssr_name = "mpss",
+	.sysmon_name = "modem",
+	.ssctl_id = 0x12,
+	.region_assign_vmid = QCOM_SCM_VMID_MSS_MSA,
+};
+
 static const struct qcom_pas_data sm8650_cdsp_resource = {
 	.crash_reason_smem = 601,
 	.firmware_name = "cdsp.mdt",
@@ -1571,6 +1619,9 @@ static const struct of_device_id qcom_pas_of_match[] = {
 	{ .compatible = "qcom,sdm845-slpi-pas", .data = &sdm845_slpi_resource_init },
 	{ .compatible = "qcom,sdx55-mpss-pas", .data = &sdx55_mpss_resource },
 	{ .compatible = "qcom,sdx75-mpss-pas", .data = &sm8650_mpss_resource },
+	{ .compatible = "qcom,shikra-cdsp-pas", .data = &shikra_cdsp_resource },
+	{ .compatible = "qcom,shikra-lpaicp-pas", .data = &shikra_lpaicp_resource },
+	{ .compatible = "qcom,shikra-mpss-pas", .data = &shikra_mpss_resource },
 	{ .compatible = "qcom,sm6115-adsp-pas", .data = &adsp_resource_init },
 	{ .compatible = "qcom,sm6115-cdsp-pas", .data = &cdsp_resource_init },
 	{ .compatible = "qcom,sm6115-mpss-pas", .data = &sc8180x_mpss_resource },

-- 
2.34.1


