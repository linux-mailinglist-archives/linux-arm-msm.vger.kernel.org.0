Return-Path: <linux-arm-msm+bounces-110177-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MMH3LxiTGGoMlQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110177-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 21:10:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BA635F6E87
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 21:10:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 16D86300D96A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 19:03:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04855340293;
	Thu, 28 May 2026 19:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Dok1X5Kv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TduevX06"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DEA93368A4
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 19:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779995008; cv=none; b=F2s0kbc0yw+0rs+mZ5meFlEbEifexBXbzY5oVPT30R5qNNiqLBdkEkYYifJNq6HZK+34fFAlNDxNz8JAAg3TwZX8iztl0SOk5vsVCzWwevnbMUY04cE7JPZq4AKcJy9Snd8eshikgxY4kbphVSChaMduIQsSnnvuEMAFXFpbojg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779995008; c=relaxed/simple;
	bh=paeGq+rWMQnSZAQfy3+y9zJjzTZ7DbWxJrLxFBILOy8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=JatQ5iUcTtyaijemGEdYPqH0FSnu7G1DFyfR15h5sOBIkR2AMoBURSjk5HPfuFicswQSrjNDnmJeRMDOLE2tGEBjWzssgmoiK1dTDqmSYSmTJz49BlWO/F9j5mZj9F+ogXHikf9BffY3HUiw/H0HknKTs8geV4Dl0S1/wjuSqn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Dok1X5Kv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TduevX06; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64SHpDEK2793653
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 19:03:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=OipNs2AfaqF81i04o0nadF
	204cKdQrRojdSAvovdFgs=; b=Dok1X5KveVEc0OVvIpsCQ2K2WsyUFGcxt35aUF
	lVRc2GexNMoXWqM01FX4JtucxWPTZ+r8F3ohgEtIT8JVjW6v6m6Cw8WDy1RiV2DL
	0T/oyURi9lCynFz8JDji8nd5qQVrjMh23aPtje9zfGRwbW82YnZ3IgiV+Zj0GTZG
	zPYI8X37tyGdS+EMaznqOeUatXzps1UbHpxpotqyM0r746DcmAElbO6Qy4GGcz5f
	z3QQ2LU18Ttoh8BznhH/+rIR7ndux28J9lJ9aXTuS1laQpTnrmLnNo8QON5KhGT7
	HrNa+eVe09YATDlo9qNJ+o7IepkxwVnZEquouD+h343eZ15w==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ee7y1va99-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 19:03:25 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-367f715cbd0so12547065a91.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 12:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779995004; x=1780599804; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OipNs2AfaqF81i04o0nadF204cKdQrRojdSAvovdFgs=;
        b=TduevX06azHELZhdCSqCNJmPcf+8ux6l+CYy/Vfh6u34/0UpPQsem/fZnnrydVqkvt
         pR+4Yw1Z1p3dLpq+HHn5FXu1p+SJ4tuhnRWY+F2WY+SUcLw7UXw2hO8EYKUKPeUNg0Av
         ohwjzNoBrp/AKYUVbaOLBNomhJs/rVn+9ad4IveoM8yPsv3SfpnGY1FDgzxjIeiSNeXa
         O+2DhOSvHOOjP12JPByekdOjAJVI0c2hZ3JiWAHQZla+xFSud/HUfrI/p0790fB/oxH2
         1FdBUmOWnEn6ohhPUS+GXKYeqCWZf64HLDHEuRfahaBZPAdaae7SVDYpNXDs+PhFXNFi
         5MZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779995004; x=1780599804;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OipNs2AfaqF81i04o0nadF204cKdQrRojdSAvovdFgs=;
        b=lgtbUv//tIhV1wlT2QVp+G9rUNeo9H6e22rQH+9zSgSZHxGfY03wt0vriI2rd7zk74
         /LSz+2LWQFND1fAeerD4VUVfL74SDjnAup/fcTqKOrAK10fhOPInv7PiYBp+ymluzhUB
         tpAcYd0NBVdfMGjAtAI1npN+ZF2w2jVB/0SwE1vZiuEio7AN4UDSBAlq6Y4q5JheKyaf
         cBEmm07C1F7OqgNU/2WPNCVSulgx5XRR41TBuxMAzIVR2hkrF/zjHavMxG3A6QXhuOLT
         1SP+s5Tt17r6KlkuDli7LLBLPG2Z/FIP88mA2npKLasVKTjg/fETDIFfKFhGqY+pdjZ/
         Kk+Q==
X-Gm-Message-State: AOJu0YymcssDbLDbB/IrH6P+rJM7cAo909ed/uT5jUg7mHo+MfqcAH6v
	DENjMUu7v4bVu1ScDN5UDL5DkbonmBPHykohWl4uqvr6ook9mw/w9dpSDF/jmZ/IwwrUCXlNskG
	H9HH/BQK93HF/fWDUKwwv2c0AvCA50BBk7RrX+vV2nfkZ40WqpqdpSIClxv8MJ+2iCT8e
X-Gm-Gg: Acq92OGCUT3f/jqKXNL/hc/tT9tE9VNqLY/J7yL7zHPA8Sbaxltll5tuoJhTnIAhuuV
	MsdorGvluL3P2oB+HNl9sBD5D/dNhDJP5I62b/uhmdmxoqdopqTVef4pQTzrDDHPoWjHPGZBztn
	eDRC4QKWBhoqgobO1hzzGmfZYqr+ZrTBxEaXCDwz6GIs0nzaCGsRZ/tjP/MxeQElA/0zQtBQfOm
	5pB2+USCJ3UsNvm9mszBSUHnwJy2S/l5TdBxDEvdMjd/gKpg9X95ATiB6HLwkELzdiPSjvSxIB7
	L7go3fQ8C3ao0OyefEAeVfIuLbeHechnVV1tp+k8OBYnuWnW/RLUzxOO6J4zG20VckkC7gkI/v+
	OBnSO9G41WfwUXf5eLOJhvhuBCBNwF8QpD0NMLf5j3PgQ1jAweit19sNhg7cfHMIKFLYH
X-Received: by 2002:a17:90b:5588:b0:369:b9db:b885 with SMTP id 98e67ed59e1d1-36bba8af135mr299561a91.15.1779995004119;
        Thu, 28 May 2026 12:03:24 -0700 (PDT)
X-Received: by 2002:a17:90b:5588:b0:369:b9db:b885 with SMTP id 98e67ed59e1d1-36bba8af135mr299509a91.15.1779995003470;
        Thu, 28 May 2026 12:03:23 -0700 (PDT)
Received: from hu-vdadhani-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36b90be1699sm2708341a91.12.2026.05.28.12.03.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 12:03:22 -0700 (PDT)
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Date: Fri, 29 May 2026 00:33:08 +0530
Subject: [PATCH v1] spi: qcom-geni: Fix cs_change handling on the last
 transfer
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260529-fix-spi-fragmentation-bit-logic-v1-1-3b30f1a3dd7d@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAGuRGGoC/yWNyw6CMBBFf4XM2klK66P4K8RFKdM6RgtpKzEh/
 DujLs9NzrkrFMpMBa7NCpkWLjwlgfbQgL+7FAl5FAat9FmdtMXAHywzY8guvihVV8XAgSs+p8g
 erVWmOxpzCaEDqcyZRPk99LC0cPtv5T08yNdvGrZtB8oQ+hKHAAAA
X-Change-ID: 20260528-fix-spi-fragmentation-bit-logic-880394337ff9
To: Mark Brown <broonie@kernel.org>, Jonathan Marek <jonathan@marek.ca>
Cc: linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779995000; l=3603;
 i=viken.dadhaniya@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=paeGq+rWMQnSZAQfy3+y9zJjzTZ7DbWxJrLxFBILOy8=;
 b=Pef9xiIMQLyIjLswkPJ5B7zJDZbFEO8mFAmRHVdDHXrPubIVJdUJca+jxpkd6UvTjEDu+OUmf
 EHoxlwILRiPDWyGDx+AsBHTSSEgqBYDhWxFS4qMyloPlwKY4XUZDP/2
X-Developer-Key: i=viken.dadhaniya@oss.qualcomm.com; a=ed25519;
 pk=C39f+LOIGhh/02LQpT46TsUSXRvBn9qXC8Xb26KJ44Y=
X-Authority-Analysis: v=2.4 cv=DsNmPm/+ c=1 sm=1 tr=0 ts=6a18917d cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=XIveKea9zlLi6OhspPoA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: 9CIe-SNhOBsPht31_2Sg_L3TSBRhXFzI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI4MDE5MiBTYWx0ZWRfX2WYWk/qdFhXv
 UohXStMyIeurW9Sq4MB3FkUiXXHy0cQG9l+DF0NHEkA/Q+7eNaymcGbpGWiq1LeF5ZJf8nA4Li5
 G5LWxT3TR7tFaUVCK2SU29LJYGdkhOuiyY11glJL/J7gdDZkt+kAyA67RHxel8rV2nKDkbud6Qg
 TP3l2STb8Ejsj/F1jI3Fl/R6hJyQ5GOzxrVG2xsgRbncpL6/m7JsrmmzBQkplNVfGt8UgaU35OP
 3tY1HNFGmPOHzAEE1skcAKDesd7ZR4eBv/T62FjQyKVAw+LGrf94gIRolURhEZP6G7oSIatpfBk
 XHMMXZmptC02LUutpHYRqz7vSl3IsHOlVFljpwjdPmfKBkAztmYGtGw98cXvIJ6fJB4WyzN0O0R
 bH4Phe/1efk/s8fO1qPoRbOnbVFe2zO0r/Dn74PJo82kfc9HcncWnorLLuwltQpNc+hzrfyeEep
 wj3xOwMg7OXhbO1aBWQ==
X-Proofpoint-GUID: 9CIe-SNhOBsPht31_2Sg_L3TSBRhXFzI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-28_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2605280192
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-110177-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[viken.dadhaniya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1BA635F6E87
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Commit b99181cdf9fa ("spi-geni-qcom: remove manual CS control") introduced
automatic CS control via the FRAGMENTATION bit, but missed the case where
cs_change is set on the last transfer in a message.

For the last transfer, cs_change means that CS should remain asserted after
the message completes. Since GENI SPI controls CS through FRAGMENTATION,
set FRAGMENTATION for this case as well as for non-last transfers where
cs_change is not set.

Additionally, setup_gsi_xfer() was storing FRAGMENTATION (BIT(2) = 4) in
peripheral.fragmentation, which is a boolean field consumed by
gpi_create_spi_tre() via u32_encode_bits(..., TRE_SPI_GO_FRAG). Storing 4
causes u32_encode_bits to mask it to 0, silently disabling the FRAG bit in
the GPI TRE regardless of the cs_change logic. Store 1 instead.

Without these fixes, TPM TIS SPI transfers deassert CS between
single-transfer messages that use cs_change to keep CS asserted across the
header, wait-state, and data phases, breaking TCG SPI flow control:

  tpm_tis_spi: probe of spi11.0 failed with error -110

Update both setup_se_xfer() and setup_gsi_xfer() to handle this condition.

Fixes: b99181cdf9fa ("spi-geni-qcom: remove manual CS control")
Cc: stable@vger.kernel.org
Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
---
 drivers/spi/spi-geni-qcom.c | 27 +++++++++++++++++++--------
 1 file changed, 19 insertions(+), 8 deletions(-)

diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c
index a04cdc1e5ad4..0618f6bd7878 100644
--- a/drivers/spi/spi-geni-qcom.c
+++ b/drivers/spi/spi-geni-qcom.c
@@ -449,10 +449,15 @@ static int setup_gsi_xfer(struct spi_transfer *xfer, struct spi_geni_master *mas
 		return ret;
 	}
 
-	if (!xfer->cs_change) {
-		if (!list_is_last(&xfer->transfer_list, &spi->cur_msg->transfers))
-			peripheral.fragmentation = FRAGMENTATION;
-	}
+	/*
+	 * Set fragmentation to keep CS asserted after this transfer when:
+	 *  - non-last transfer with cs_change=0: keep CS between chained transfers
+	 *  - last transfer with cs_change=1: keep CS asserted after the message
+	 *    (e.g. TPM TIS SPI uses cs_change=1 on single-transfer messages to
+	 *     keep CS asserted across header, wait-state and data phases)
+	 */
+	peripheral.fragmentation = list_is_last(&xfer->transfer_list, &spi->cur_msg->transfers) ?
+				   xfer->cs_change : !xfer->cs_change;
 
 	if (peripheral.cmd & SPI_RX) {
 		dmaengine_slave_config(mas->rx, &config);
@@ -858,10 +863,16 @@ static int setup_se_xfer(struct spi_transfer *xfer,
 		mas->cur_xfer_mode = GENI_SE_DMA;
 	geni_se_select_mode(se, mas->cur_xfer_mode);
 
-	if (!xfer->cs_change) {
-		if (!list_is_last(&xfer->transfer_list, &spi->cur_msg->transfers))
-			m_params = FRAGMENTATION;
-	}
+	/*
+	 * Set FRAGMENTATION to keep CS asserted after this transfer when:
+	 *  - non-last transfer with cs_change=0: keep CS between chained transfers
+	 *  - last transfer with cs_change=1: keep CS asserted after the message
+	 *    (e.g. TPM TIS SPI uses cs_change=1 on single-transfer messages to
+	 *     keep CS asserted across header, wait-state and data phases)
+	 */
+	if (list_is_last(&xfer->transfer_list, &spi->cur_msg->transfers) ?
+	    xfer->cs_change : !xfer->cs_change)
+		m_params = FRAGMENTATION;
 
 	/*
 	 * Lock around right before we start the transfer since our

---
base-commit: e7d700e14934e68f86338c5610cf2ae76798b663
change-id: 20260528-fix-spi-fragmentation-bit-logic-880394337ff9

Best regards,
--  
Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>


