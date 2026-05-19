Return-Path: <linux-arm-msm+bounces-108384-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6OarNMoRDGoZVQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108384-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 09:31:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 49CE7579200
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 09:31:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2D04530AF1C7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 07:24:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCEC63D3306;
	Tue, 19 May 2026 07:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gtLNAinw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NY24tvAF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 030772BEFFD
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 07:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779175490; cv=none; b=oUcFNKWDZq3p3nP7sNWBwIeXc4YsIBLjbBLJCmGspg96wq1ZqisN/kcYRGeE2HueiC9ft2cCDHMAPPzlWVif7oqItcU4dSvSF1Pats1M0X07E9MxxDXdXfedYutrk0Aui+WkgNsmqLQXm/aQ0EHSalD2l0teN+O3XgU9OIDgD3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779175490; c=relaxed/simple;
	bh=T44s3TASdJnSBhWvx3N7ChQPB/5DJbCT54AUqTmjxB8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pSSNtbFlSZuY61aJOgj0VgcZ3dcUsCKuYzWaMauz/anHSWpSo5q69jrH5kVkCcPN9pnM7JF1xHBRcYabHlDv+4Ev/M7PM6Y66zF9CvTpsDmwejbIOT1VqudruOLL/lEDe49jcLsYsuWu9k0yJzBYRHf29mbEvKKzVW6XUJVGRzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gtLNAinw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NY24tvAF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J5a8n3867049
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 07:24:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jmqp3mmuKa++YH5YsnTqYgztsMnKTWnZkLg92GCMCNc=; b=gtLNAinw4jjDSCiw
	t6Mpon3EoVXm3K2JeSHFmbZbJs2P8jfH1L/5rjcI6Oi4eQRekElJ9lfl6tML6xhD
	SeJKzKCmtuwpUMtytRrjgRRcNtvrPUulG8bkcsxJE4L2vjeUd1owwSV82T46ESyN
	+LbisWhifLdSF4ZV/OhgV0EtDd7Ha+8qGFJqITOx5PCot0AhVVxKNURjQ42nIvfi
	0zGw3hUUltJrHrBqDYVUT9oALDtXGTjdYF//JS0kcYRckAAKWBeUIj6UQD0lcWQt
	d8zKFhHiLGjBW+miY1AViLrLM2Wo0Q3iqy+Uyy94/cA+pDdfkk2q1nIxQwtTU6XM
	FM71xA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8hv1geh3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 07:24:41 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2f2d983d109so13842954eec.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 00:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779175473; x=1779780273; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jmqp3mmuKa++YH5YsnTqYgztsMnKTWnZkLg92GCMCNc=;
        b=NY24tvAFN+KuM8eVafyYnbCus0bQjkpJd3Q5HN3R46jC591UP98zKqvT6eDMpjmoxk
         e66f0mMLQwBCFdeerEORzlI6+tho1qThK3dZzSBoDDKsjEId2cruqPt6nnMVZwZz9Tav
         oIi8m+QtiqfhMxEhI52EsgKQFNPG+yEZN5PYpLlKAqVsl3iyryqx7UCZgB71XN6Dx/i1
         iGuL5kBq8gvzVTYahwejdfaGO0d3Tqundg0Sn+hPUIm5uPQLTcUcPy5FQTMaY1pyEKgo
         a6bck3mQVXF1X7b/fIJkl1vwh9yAQshitI0vCmPb1QhhIUBEOd4ROPyVFbxAy0Yp1J56
         C2gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779175473; x=1779780273;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jmqp3mmuKa++YH5YsnTqYgztsMnKTWnZkLg92GCMCNc=;
        b=GPR4Wt0F2HEEu+COtDPM9fzy3PAa9Lv2+ZJNrqFcUIVppHhnHq5us+ud8dA3NWT+S1
         U90r8OLv/Be1OyLzN/JOqyQFl3vt2cfybNYoO9hhUs5cqZm+V3gZfldOjjdeLWQBOwP4
         sWd6qdvn8F8plgPRXzM2JeWs4NVvl6khzd/9QqqkMQ/VA2rZ5GduLZL1HrJBBeGagTK9
         izYecZ9TSWW7Qri1V2ad2nXuA7Cbb/T//Xi8X9rXb//3dVjOUKXugon5lAwOEliBDLFT
         8Odcgp5ob2fMUKzDw1Fsgsgmhwo/0TEEFYvV9z8ClJ6uZ3TdCAljLDO83H/RwIpLKzom
         VQCA==
X-Forwarded-Encrypted: i=1; AFNElJ+O2Hpr9+7d0kjwRLjV+ewb7hRrUgncgY67dpGwnQGwN2XHxWOK3GaHRsDstGtt/znQhzP4UatEJM2MGW4j@vger.kernel.org
X-Gm-Message-State: AOJu0YyaZC1Tr+Eh+oYPyWua9BjsgWcY3I8sBNMVijVSl3xsK6jVH33X
	2yJtryPJj1dljHZgR+7sbpC0bd8CWwtDn0Nc+PKatv1Su4BUSg6dUWWIJ7je6F7M4pAUPuu7ryO
	vqDUBA885Dl6gjQh88AraC0To+hzlK1q0xn1pmTK2oo055vdG4leSAao2mxtLIlNZ1X86
X-Gm-Gg: Acq92OEl3jBxa2zy8MExKQ+d5dKZzP8Uw2fWWxxB2htyfxSMgbKtgtyVyiwpa2Saxjx
	z/ZJKdmtBUhjZ9nx9FL3mEzU2VFIsPV5p7vzNwtGgFhXzKjSzo30XG3LM4OTIxN1ZsnkrX7i/vB
	cybd9CodnoLws079vrWLDyc7VULNZ3v4m9GlAAHva5WIpKB6PVmTB7YlD9NGfK2GpUnJsieOj+w
	XBDI7TSYoAvcvTBpKJlDUQj/ouLC4jf/6aDgKPvjoPMlGDBGFSZHFKJ2S0+hJkq+GgQisO7+Vxc
	ufC+e59BD/8N4JxOTwmE1ElOSk4LDBUlIna6xTykw0aItnBujrS8D0tZ/eGeK6a69W/+EYsAwhq
	1hSPYseF314L71ktcQgg+7Z4v2AxRiKofIX1cb80dTZxdwYo/IAmRzj/WS/hvpF+Lxx86W1rZ
X-Received: by 2002:a05:7022:2397:b0:135:43d3:284c with SMTP id a92af1059eb24-13543d329f4mr5539975c88.9.1779175472948;
        Tue, 19 May 2026 00:24:32 -0700 (PDT)
X-Received: by 2002:a05:7022:2397:b0:135:43d3:284c with SMTP id a92af1059eb24-13543d329f4mr5539943c88.9.1779175472389;
        Tue, 19 May 2026 00:24:32 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cbed2232sm23337779c88.7.2026.05.19.00.24.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 00:24:32 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Tue, 19 May 2026 00:24:24 -0700
Subject: [PATCH v6 6/6] remoteproc: qcom_q6v5_pas: Add SoCCP node on
 Kaanapali
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-knp-soccp-v6-6-cf5d0e194b5f@oss.qualcomm.com>
References: <20260519-knp-soccp-v6-0-cf5d0e194b5f@oss.qualcomm.com>
In-Reply-To: <20260519-knp-soccp-v6-0-cf5d0e194b5f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, shengchao.guo@oss.qualcomm.com
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779175464; l=1799;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=T44s3TASdJnSBhWvx3N7ChQPB/5DJbCT54AUqTmjxB8=;
 b=3R2bur04NLC9mbzUIEVCHdRIjCSiX7c8tDr4/ZvfHNleQwg5SpI/XwPd+VQtlHlQVM7lrDEH2
 /KBVnDvsOKNAXw+teUkL2UaquJHrLlbKE5A/DTxSk9mO2XuyqlgSWnW
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDA3MSBTYWx0ZWRfX9B/4RIFPM+l2
 0EpqBd0kYUBLy1dyk+snhBU0VVGvCH/nwffnM9pjPIi3+TrBeE5PSwqFvgqxmgPZJYS9iE3LZNm
 o+I8pDtkR1kkrY2d2zsZXdGJpOhCNnuXv8CTE84T3s8DFCGUsdj/cKDCVCCPNz4BzIRNJ92L/4T
 oWWt0FMC3W8FqHbrykiZpJpKcmcwQDjjZwqSq0jfYVQhUgnrJGn9qwslgexlDChCILKMoD5J6+v
 uwvX3ccREusGCEAAJFSHilw63pNEIRPZIPOhvZoxHx9z08jlio/wIOgaj22fcgM9oodwssY/QoG
 o5wKExZYuCqXB7hCu4eMbzhT1vGfqEdI34Ujgx5pnBF3eS4Q2yX0miD46pGybScDINSlA9aRWaH
 LuzGMdZvcsEDdpFdudT4RQzR8lznW/VpjrKkT19b1jTnIQORj/i772uie8xbcNH5Te8Q/GhwAcc
 bTo1zA2EinNtY2XLo7g==
X-Proofpoint-GUID: wc_dMUQvXu2O68ERvNVtsrAwDuv3u3SK
X-Proofpoint-ORIG-GUID: wc_dMUQvXu2O68ERvNVtsrAwDuv3u3SK
X-Authority-Analysis: v=2.4 cv=WZM8rUhX c=1 sm=1 tr=0 ts=6a0c1039 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=-54vo4t_4OUFHp6kYXwA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 phishscore=0 spamscore=0 impostorscore=0 adultscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605190071
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	URIBL_MULTI_FAIL(0.00)[tor.lore.kernel.org:server fail,oss.qualcomm.com:server fail,qualcomm.com:server fail];
	TAGGED_FROM(0.00)[bounces-108384-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jingyi.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 49CE7579200
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The SoC Control Processor (SoCCP) is small RISC-V MCU that controls
USB Type-C, battery charging and various other functions on Qualcomm SoCs.
It provides a solution for control-plane processing, reducing per-subsystem
microcontroller reinvention. Add support for SoCCP PAS loader on Kaanapali
platform.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index ac2a00aacd2e..d2ea26562c07 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -1588,8 +1588,26 @@ static const struct qcom_pas_data sm8750_mpss_resource = {
 	.region_assign_vmid = QCOM_SCM_VMID_MSS_MSA,
 };
 
+static const struct qcom_pas_data kaanapali_soccp_resource = {
+	.crash_reason_smem = 656,
+	.firmware_name = "soccp.mbn",
+	.dtb_firmware_name = "soccp_dtb.mbn",
+	.pas_id = 51,
+	.dtb_pas_id = 0x41,
+	.proxy_pd_names = (char*[]){
+		"cx",
+		"mx",
+		NULL
+	},
+	.ssr_name = "soccp",
+	.sysmon_name = "soccp",
+	.auto_boot = true,
+	.early_boot = true,
+};
+
 static const struct of_device_id qcom_pas_of_match[] = {
 	{ .compatible = "qcom,eliza-adsp-pas", .data = &sm8550_adsp_resource },
+	{ .compatible = "qcom,kaanapali-soccp-pas", .data = &kaanapali_soccp_resource },
 	{ .compatible = "qcom,milos-adsp-pas", .data = &sm8550_adsp_resource },
 	{ .compatible = "qcom,milos-cdsp-pas", .data = &milos_cdsp_resource },
 	{ .compatible = "qcom,milos-mpss-pas", .data = &sm8450_mpss_resource },

-- 
2.34.1


