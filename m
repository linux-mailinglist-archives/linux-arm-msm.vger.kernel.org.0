Return-Path: <linux-arm-msm+bounces-103667-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2LTJF//E5WkGoAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103667-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 08:17:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C5E414271BA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 08:17:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2A6803031EA2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 06:13:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85D7B3822A5;
	Mon, 20 Apr 2026 06:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CKvV8oFO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QmsclRMJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0121A382365
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 06:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776665622; cv=none; b=PGAAHcLQHZSIS0HBTb54AcICdmkSwhjYRfi/VwOjCQCte2/6ixpHpFzK+hoaYvaF6fvj5uLBnVv/ssZht4HzpS9gq8IcugEBdww72ou+1VztTKD2w7D71EcthET/qcZl53R8Klh+iPoRBPrzofgLk9A4yxBddaYDxwtvnDXjy/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776665622; c=relaxed/simple;
	bh=Wf4eoT8CejtfLR/935yK88aKHtjDjhsg711zXr8huUg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PYfpzN/CgHuzeyA1nGOaXimx0tGEONwiXd6ee+Emwdk7XyWEFa0AIrMDmbPW5YbsfSn7dWqs7B+Va4VB7HHm1ltyVN0IXOs6MX7HNi1x8lgBxCuu1pOr7Uk+2vwf2q2FyN+KFpdEsGzCXuYQ9rVXsrX9kbjlUyNxVQph22h6Ll0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CKvV8oFO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QmsclRMJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63JJSjjU2048765
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 06:13:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7AnPSWOf86A1fqAksVkU/F+AvJQfOIsEXvB48sq4Z1g=; b=CKvV8oFOaUMQpb2m
	6LvMiwH4uW+iQBa3docolhqZzl111edN1sx2vV1TTSFTs81EC1kstlwifCExbtJI
	HLcYH8EzlkIBBZEcEXqHcI2onJmeJv/ZQxmPgtStU0F31B16Ls+mlaTp1BXQB4Sz
	EryP4xj52BLzjVPDIWijoHJYhAYZ5Fwxjj7+BLZUS5GBnGD0/3exonmIQ0jkb2B3
	AtVkes16yhTxROWB9fgBhTLajvDr3ADKwq2RSB/nUE7pkEWWuhaMas0QBlMualHl
	RsEiPb3zKCsjOHISHUax8PJd8wV+TQ07+qRXcc9MnG/XiAX3/hcD4tVNkYbQz5jz
	pTxmVg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dm2qambph-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 06:13:39 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c70dd30025fso3180953a12.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Apr 2026 23:13:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776665619; x=1777270419; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7AnPSWOf86A1fqAksVkU/F+AvJQfOIsEXvB48sq4Z1g=;
        b=QmsclRMJPYsWHpPedFERINs60oINS6pmJSeRpIOs4CorKh9qQzgE25BsyPJM5Skuko
         D89MtHkCiYF1UMXt4hBWTY3CWhTY22M6ewVF0vu+j7fF4ohYUfItkD0h9GhSxEC+brf1
         B2cmIFacZHbGKQWMR/8vjrT5z57PMJllj5V8wx/ICrrOgLK5xnztJX2qUST4FoXBIUjL
         f19Etjnu9jPOr/j6lEoAY/htYRELLr0/TgvhlcIhG7sPuJG3ufyUOfy3wIyYNLfKovJj
         UkCy0lDcnAiSRLeLXgzJ05d78R/zSJvTs76xwb8QRvZFElGdXLmGErtxinAL2Tko/tOK
         RoZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776665619; x=1777270419;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7AnPSWOf86A1fqAksVkU/F+AvJQfOIsEXvB48sq4Z1g=;
        b=TLKZpezyoD704U+NCEyJomyw5iW5tWCc8H+Y2mbmGuFe9F7DauHpDCR74lSRKmErLS
         XcX8IouaBawTO2CiGGWYbnUaFCZNB5vk2qosx4LIvcYqZiNzbplqxa7Pu/SPt8fVrX4y
         fDQIQFPRe7SAX0UkedO7MZr5aXa+H5nS7zhNwnUlrRONGy2LVmLaJ31wZEH3ZjBLLDEb
         mnwarxVVhB+EFhkLR42lt/9gLl2MihKcpqf5+BouKgvAJ33dVeOq1o5NMTPee2X0uEj2
         ILE4RBvVIv2Btp2wJL7pBfGpk3k8/RUZG1C0M863lqQGJgNVtykZ4bMFpVSiTM/Sk8HZ
         vLfA==
X-Gm-Message-State: AOJu0YxwEu3XEXP9NuauRPVQQNUb1qXU3er3xv34cLo3eGJg/fCzayVY
	whmwuwarNeUaTD+R2OyGrGpaJwphPySOapdGeZRHfLZZNo/HC8zxnL/ZLcAI8KgzZpwMf6H3Y+D
	hKRvjc6OFxgKXcyU6VHFyF2v7lvqXUa3wUjQNYrcJfPLM70hM7w/ti8F2tL8EP7a7D+TG
X-Gm-Gg: AeBDievmaRaHbDp3zaoMyM4xYU/GULnfSbko0c86yCYLBwh1M1d2domuxQJj04551ip
	uS+hFwJm5mO/PAqx3HNnVckX5De0ULFIg7byp+Of54L0QREQvcPqYN3PVfgjpc7gt8aS6MW1VIH
	th880BJlmCezksTnbU0xxCeiTtSOvSU3+e6CuQnqQiXcf6p1PDwbcdXpWeN2Lq5jQHVikx64z0I
	bmGyoK0YA15PNeY6o9nZvjS8gSKOLUyP/i8WO2eQG3BQn4Pr6alqfeBx8+mz5gy8BcGQTgtFsO/
	JjC3UGXxf5+7NlN9ST/d4n67VShVAKxHLXR0j2PlUb8GgYoa/KqAh2z49+6WGxlipOw8AaPMGUE
	W93kH2QAFiTe6MOAajEfm5CMrEQjeLHQDXzv8S/PnSF3flRZAEoaZSbXfdMje3s5nRIz5
X-Received: by 2002:a05:6a00:929b:b0:82c:7335:4f71 with SMTP id d2e1a72fcca58-82f8c8e8d78mr13418538b3a.36.1776665618753;
        Sun, 19 Apr 2026 23:13:38 -0700 (PDT)
X-Received: by 2002:a05:6a00:929b:b0:82c:7335:4f71 with SMTP id d2e1a72fcca58-82f8c8e8d78mr13418511b3a.36.1776665618298;
        Sun, 19 Apr 2026 23:13:38 -0700 (PDT)
Received: from hu-vdadhani-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8e9cbb28sm9018034b3a.13.2026.04.19.23.13.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2026 23:13:37 -0700 (PDT)
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Date: Mon, 20 Apr 2026 11:42:54 +0530
Subject: [PATCH v3 7/7] arm64: dts: qcom: sc7180: Add QSPI memory
 interconnect path
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260420-spi-nor-v3-7-7de325a29010@oss.qualcomm.com>
References: <20260420-spi-nor-v3-0-7de325a29010@oss.qualcomm.com>
In-Reply-To: <20260420-spi-nor-v3-0-7de325a29010@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776665582; l=1341;
 i=viken.dadhaniya@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=Wf4eoT8CejtfLR/935yK88aKHtjDjhsg711zXr8huUg=;
 b=SAwSWLIeWNAXNjiXxnGpHx/1U/G5POQn5aYBtIoSaWPAkRUZJpewt86/zz0dcgsYSEIsvnArT
 mjTXs4YLXRQC6mkKWAt2iv7+xdV0CWNwg7fNHWJROY+sxs7y+XZnKwO
X-Developer-Key: i=viken.dadhaniya@oss.qualcomm.com; a=ed25519;
 pk=C39f+LOIGhh/02LQpT46TsUSXRvBn9qXC8Xb26KJ44Y=
X-Proofpoint-GUID: ptTV9pltZF0oF9wdpJezbQVSqeXSS4pN
X-Authority-Analysis: v=2.4 cv=KdDidwYD c=1 sm=1 tr=0 ts=69e5c413 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=va74t0jcI0ebB8ul8YAA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: ptTV9pltZF0oF9wdpJezbQVSqeXSS4pN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDA1OCBTYWx0ZWRfX7i9L1dX/rU3K
 GWTx2CpARy5Ibxhdu/4kzhlpk/4UVtAFodlt0t0Vh43iVsYyp5rjhU4XXF/Yc28m7fuUAEx6NI9
 LHlkqhY5cgJJbvlPMoDKf7oqjpjmLDnDlRKv+4I+4nxig3yXTskyvfchhoms8HMo6etz2/unZT3
 Frw8Y7vw4fhbisEKmCCXD1PNm1d1v3wDePqJNBolWJ5TDaXclqjuAXpblVi/iIUx9ZRo2q5eOtz
 FcnhRpI2dM+Nyf1Zl0AeZaf5monc2VFnZFRE6/0+2PAm8PPEGf/jNPiz8ZNVpGZhEsTHSgOH/7d
 BlMdXWyTOXEE/1jdvovTC3JXkwInn0NOZkZCdzd4Yif+/SthN9PDWAT9vaMWjTEEvMMTIPE0SHc
 9FL+wBQ1mQuhQxzg/lmWwnE07AX/cTMKkUCn46k2GUNYhYBYvXJSxmWxxi08fn3FKBrA7L+Ig/Z
 ++xx6Oy22ihb1s4bvsg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_01,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 suspectscore=0 adultscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200058
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103667-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[viken.dadhaniya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C5E414271BA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add the missing QSPI-to-memory interconnect path alongside the existing
configuration path. Without this path, the interconnect framework cannot
correctly vote for the bandwidth required by QSPI DMA data transfers.

Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sc7180.dtsi | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index 45b9864e3304..7515d982b38e 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -2864,9 +2864,12 @@ qspi: spi@88dc000 {
 			clocks = <&gcc GCC_QSPI_CNOC_PERIPH_AHB_CLK>,
 				 <&gcc GCC_QSPI_CORE_CLK>;
 			clock-names = "iface", "core";
-			interconnects = <&gem_noc MASTER_APPSS_PROC 0
-					&config_noc SLAVE_QSPI_0 0>;
-			interconnect-names = "qspi-config";
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_QSPI_0 QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&aggre1_noc MASTER_QSPI QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "qspi-config",
+					     "qspi-memory";
 			power-domains = <&rpmhpd SC7180_CX>;
 			operating-points-v2 = <&qspi_opp_table>;
 			status = "disabled";

-- 
2.34.1


