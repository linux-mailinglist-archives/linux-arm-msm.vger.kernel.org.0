Return-Path: <linux-arm-msm+bounces-109100-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qA3iMKwND2p7EgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109100-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 15:50:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 593825A64B6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 15:50:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A241833396F4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 13:23:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12AAC226863;
	Thu, 21 May 2026 13:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c+7sooWh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aAJBXIse"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6452F3E2ABB
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 13:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779369719; cv=none; b=qHTtYV3iIXqCIAa6fxqZg8MUHifNG5Ua+JioaeeCjsGMws4j5LuyqZzjtXZObEK0B5uVr+8W/VwGdI8t8qZtJV82gHpxlio4Zc/zYj/d8Nl69ivwRUsbyYfLTyIvZObXQbZ9OsZrk6/twaMuE+/8ieOA/kk2k3ptOyIW2GP4iC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779369719; c=relaxed/simple;
	bh=W0/Uu+1m9zRO87h8CajyONTXKGYKrPV5nJKS09BkI34=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZcmuomLArhGPPktMfrCdzeBj9oQ8DQZuy6bapByKaoAD2+GxUk/QwpexcXeQQBREZB78MDR9WaJSe6AGYu6kEDlyl0NBDdo2HynzTjoLurx3SEckOWJGHM2IRLsiZjvIBvNKrFwWMB+HR8ReDPV76WxqhWFsRuMOblEMummlU8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c+7sooWh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aAJBXIse; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L99kaj3451336
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 13:21:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aE9MYFmFwU88VeE8ZXPSijChgvgU9D9aRPiqoxDMKCo=; b=c+7sooWh8iDuhWS+
	Dc+Y3b8mb+/zKPVxGHr4GIhLBG8hmFmZ9nSY/k5rDUNZ4T48gJK3JjgWT8SpTVw5
	kEfQ9JiCVf/80anZk5Q61z6ufFSLdcHd8RuD59pQMggNfpbMfklORwmnOKSbseOh
	YUpTEDcfk2IhryFFWOJUCjAevczbd86DlFeFWF+gGdXkdzPkVHQ1HoBDDio2oaez
	CXotQ7/+6loRydeUOKywaOFDKpU1qKXsEu/W7ALoxIq/IRNjrZ47X8pyyEQErAXc
	e6Y+63Gm10Su9jrAQLlQ46TCprHFjV4H1NBpRn1lhxMGnTLb/mre28uo21FIY3uf
	BRtdnw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9y1h90c2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 13:21:56 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3692f395339so6122139a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 06:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779369715; x=1779974515; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aE9MYFmFwU88VeE8ZXPSijChgvgU9D9aRPiqoxDMKCo=;
        b=aAJBXIseFaxVY5lbTUjNGxanWINXegTbq4uGhmRMQCuelXyAR1iq7AjZS9DrC0HTsC
         JmlLd41p+kkVpM82j3hPfg8MmvRvIl/kUJCrzAOkWikDcl4Y6e6Az+3+7g/NNqt1fZnM
         vt3b1rQh9V4Eo5wJ8hUbauZiBI1XWflt6jSPeM0iGZr8ha4y5cbY+1q/TfbvsVmxYUmT
         gmvqpznr6M97T9W2TdW/o38OTR6kK3I6U6snJxeLDT5AY6CMll6Sdi3/IakY+SAYiYJG
         ln30MX52EtjeFGY20AlNe47ptY6+jGLMouJsLfw4fvTogswO0pWb6UxRQAyqdILnL7q1
         cD9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779369715; x=1779974515;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aE9MYFmFwU88VeE8ZXPSijChgvgU9D9aRPiqoxDMKCo=;
        b=fUp1e1iqLJK9Fl9H2HKAo2hHM3wR9yr9mAT9GrrMSXuAmt/ahbE1XQy/gGLLbZX8dJ
         JPXOzWg36s8MxA7GQTY5n+ezt1Mxjpu49j4peOYvVU5M+gYjyBlztp5MXkIF0PJRBE3m
         7XuIyLRdhVK8PBUyEkNwT+StiwQJ32zb7Gdj8G5x0NyM2jCHXxaOW1LLZipefCg/9M17
         n5Rsrbd0HANJ3u3m6AD3YVASXvDWfiDiL2zMXd9HnCCmuNOduV8jjnxrVaHRC2qVtp8c
         7yL46wOB5zPHaxGLeI3jkMmQL+oPGnrJSsgGvVFajui46CZAvkNL1BlWtmFXj2aQ0nBq
         yyow==
X-Gm-Message-State: AOJu0YzyDuLy8Ma5IIUqS3yoq/yIdSKx38CfiQ1luaGAiI6m7ZRf5cfP
	v7VAuqiAlX54MZXyWUxQQv4TtVEpuTw2lC+cOVDFUnqYSqK6rZpfONEubD4OR1/V0rqfF+hIa0j
	AbXCngWTEl05N97PtZiGYv7hXo+pbXTiBpLABCclHXqsfrr8g7N3VofWqDjii8tlfQL1i
X-Gm-Gg: Acq92OFaon79sJ5TucU8hKWoC17sGuGUaYkQgHsb6EAWKxCDrYqQJj44vTL+PqeVHnN
	0qTlaT7r7WbHJ2m5UiR7o+mPegbUZaAJzBQTCTqTcOF6X+eVyHdgFztHYNPw4N3HIRJ3WmZ8fa7
	bHKpqAmj1hd+h6nQ/1E0wPCDJgyom+oPYEfXAAtf04kSfmfRTmNtNatxeq88i2TlQnbJ3CrDZCy
	Hk+kPn1PerTIZZ/X6j8zBCr+c3mRDGPMnmvBchFrECAlx0CPSYtYFhjIBpOCCdZk2p4pRbTzD0h
	xC3VO/rXrHUJUvO4hzi5DwBiuqWqDpv18pT8+bEOSnv5W3Nw1OzQ0P1o+MRkwjHfFGPDed/s/5E
	jEKZZYjDwTq0d2RYafa5wSGh9v6V7O7zLvuOY
X-Received: by 2002:a17:90b:3906:b0:36a:b34:17e5 with SMTP id 98e67ed59e1d1-36a456043a6mr2845104a91.14.1779369715047;
        Thu, 21 May 2026 06:21:55 -0700 (PDT)
X-Received: by 2002:a17:90b:3906:b0:36a:b34:17e5 with SMTP id 98e67ed59e1d1-36a456043a6mr2845062a91.14.1779369714477;
        Thu, 21 May 2026 06:21:54 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a3d1e9300sm2927797a91.13.2026.05.21.06.21.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 06:21:54 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Thu, 21 May 2026 18:51:38 +0530
Subject: [PATCH v3 2/2] remoteproc: qcom: pas: Add Shikra remoteproc
 support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-shikra-rproc-v3-2-2fca0bbe1ad7@oss.qualcomm.com>
References: <20260521-shikra-rproc-v3-0-2fca0bbe1ad7@oss.qualcomm.com>
In-Reply-To: <20260521-shikra-rproc-v3-0-2fca0bbe1ad7@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779369701; l=2673;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=XoVsbLspLJSC0rBw1se9tovMaT2+CG8RoLGQiO3wVm8=;
 b=e+t7G0ot79Y1UN0mhQwSYmV1AEbMAWPkK9QhdszHRHM1eoqCAOgUuX5h3wPAXbbHTjTMQSLbe
 lUW73ePB504AA0w7vqwv3uEJJmjEcyyDb/sMEdmPQ86vFZZxDqwA11C
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-ORIG-GUID: leDBSpjp5da-z4hbYQYieYWWcO7wsnn-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDEzNCBTYWx0ZWRfX8RQ1nq+LS3d5
 B0wd5twKpXeXrcSB4P3Nfda6DCzdd9Wzhm89kn8FtAQImw454WxoY/UKjdUfUw98lGVJUxyr4PC
 8uNd/D4lmqXNYsTlHS0Wj7MRTIhHXkPUdH0HyoIlcws+7GrAGA68Y7jZgWzvgOoIOdTlQog/wK1
 PJPuFyaCaN+f9zfUsE0OcBZn1uKLU5IQugI6xgKi2Q1cnzEtPPOXVAMa1/mzXZ7CD83HBRYEG6i
 tku9XS8urX9x09zuU4RiBiz36/n/q/STUNRb4+psosmA+jZBYVXKmhcl3p+syrhLkooU4h132hn
 /o83GpDONtkIjQpQDa57vhL19eWWiJva2UhwWzOyo+ILhDgozOBRndOFj2eepGzDEjB9BQMLQ/O
 9H+dywYQ9fgmrEqZ2LZZ2F9Q6qOQ1mNy/UU+WxsmIrtrKce0AqMFF0Bags2hEN+K3Nr8OWHf+Cr
 SWo/vxP0jCToku0w/nQ==
X-Authority-Analysis: v=2.4 cv=YfyNIQRf c=1 sm=1 tr=0 ts=6a0f06f4 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=SNgwcZzc0U0EFhAFe-AA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: leDBSpjp5da-z4hbYQYieYWWcO7wsnn-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210134
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-109100-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[komal.bajaj@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 593825A64B6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>

Add the CDSP, LPAICP and MPSS Peripheral Authentication Service support
for the Qualcomm Shikra SoC.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 48 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index da27d1d3c9da..0101f1db6458 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -1457,6 +1457,51 @@ static const struct qcom_pas_data sc7280_wpss_resource = {
 	.ssctl_id = 0x19,
 };
 
+static const struct qcom_pas_data shikra_cdsp_resource = {
+	.crash_reason_smem = 601,
+	.firmware_name = "cdsp.mbn",
+	.pas_id = 18,
+	.minidump_id = 7,
+	.auto_boot = true,
+	.proxy_pd_names = (char *[]){
+		"cx",
+		NULL
+	},
+	.load_state = "cdsp",
+	.ssr_name = "cdsp",
+	.sysmon_name = "cdsp",
+	.ssctl_id = 0x17,
+	.smem_host_id = 5,
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
+	.proxy_pd_names = (char *[]){
+		"cx",
+		NULL
+	},
+	.load_state = "modem",
+	.ssr_name = "mpss",
+	.sysmon_name = "modem",
+	.ssctl_id = 0x12,
+};
+
 static const struct qcom_pas_data sm8650_cdsp_resource = {
 	.crash_reason_smem = 601,
 	.firmware_name = "cdsp.mdt",
@@ -1571,6 +1616,9 @@ static const struct of_device_id qcom_pas_of_match[] = {
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


