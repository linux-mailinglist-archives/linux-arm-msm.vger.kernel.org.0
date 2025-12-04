Return-Path: <linux-arm-msm+bounces-84320-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C083CA2E65
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Dec 2025 10:05:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2AB363071AAC
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Dec 2025 09:03:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FDE43346AA;
	Thu,  4 Dec 2025 09:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I3FVCiU8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ApMZslYY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3032256C8B
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Dec 2025 09:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764839012; cv=none; b=H+tdGhq+NDh31HzyO1d+OZWHpv6ynjmPrFAl84GbN+B/g0o4GQIb1BWU69UFL+JCOGAzolTvX7jE4+/2lurocgau1VqNGtKauW1CeOg3y91zoSmyoNZxHXCBTtcjw1J8/X0eu/QS0eXdFW7ugBs1NYAwtnQswW3L8CZApHmQu34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764839012; c=relaxed/simple;
	bh=wsc+Oe3Sx9BWvselyA5E0E9rZE33s5bP3hYuZZv4orA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=B+mpMiH+12RObenFXoC9okZZ52azHsqzFgKQL5Fx5dnQhOO2rjyKngGKXoleiNLiD8xi+kgRKL4Yh0UyvpKXef/zXMy+tpXe7hXItJj10emADhncbwNmPGlO/MXPZKOXKh9Mnk62blA4UbCyDDzGlx8+HLvbfN3+m60vnIQaVVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I3FVCiU8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ApMZslYY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B468lF2599201
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Dec 2025 09:03:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=zguyslqrcaP5wEteKasvoSc/KQMTcZmC2hc
	vKR1cr8g=; b=I3FVCiU86gA2940V1w51Zt5ZMXfvlImoQlsyNRfO99SR1IPYooO
	UeIWPboUa2O1cWQPQkLCfP9Tmhp/8DjbNRLwJIPf4Jc5vjxamUW1YwicKv6dZ+ji
	8ErQOvidcjWssZsFI5NojmI6MSasuG2nwILlEE2plihuoBY2lGU6o1RBK1M1BK0D
	9zKYwKP2BqLl4t1tSML4fkXrpg5IB0j+WUSi0Hgfr6I+hioohoLlVeIa6/t2tAtx
	VXDA4ylYEGoKEo2cPZO3dtlPcixfZ5y9VsVC8jrUMM8zHgRXnhSwlprnEh9CwquR
	Jx/BPLw3OsS57287ZdHedGSOTYTbqkbwhxA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4au1f0118g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Dec 2025 09:03:28 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b2e235d4d2so239639785a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Dec 2025 01:03:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764839008; x=1765443808; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zguyslqrcaP5wEteKasvoSc/KQMTcZmC2hcvKR1cr8g=;
        b=ApMZslYYd+/Ex2Z9uCAFqLZYjm3ox+j8Q+wr6K4g9E6FL08Sksu0ceEo+tAjTRJvO1
         f62WzEyN54IXkEAKfK3YCLDyrFL7g5rR1+iOozs/zFnJ64Rmy4zVTZYShpfxg+6CLZpT
         FbN8/NJJXYcu6BsT1BG+YyocEpZfxD4RMhZF1qMImDPlgPzqmx7EZRRjqD/dQvOxu74Q
         sZfODzcaZ+0xKAv62NFj3mzmZd7Tq6ylWW1U22uBxpj6A1ebRQMR6gs6TAnWFptMUrOW
         uh9BHzhxTGCChn5Q5pDD/UArNE74/mXxu7p/SoVo5GaR4Rhhi7MuoA10l1t70U9vbx6e
         xFlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764839008; x=1765443808;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zguyslqrcaP5wEteKasvoSc/KQMTcZmC2hcvKR1cr8g=;
        b=FlvRY75n+SYpZRQdI4NCtENnBmFiydXk8Rufr+agnlT36AfknrPTflQJ0xonujFe0A
         +FeTZlDuj2KiewLQ1siJK+5Xsz/Ft2I5DqohWjc8n/NivGT96kU5Lt041lMUfRR68IuS
         5VA7wI3ynMOYxv1+pWazA4/86OjtRd3G5kpPfjDVRb6YFbgpwcgHy8lcKSnC8hvNRIJc
         cmX/oSs6BUUawePEyqd6NrIyqNM3yY40lAjpq5OiFBvqaNsCas4E9hTYZwNeNr186Npe
         WvJJiwsF+0MrRlMt0MHJc76wWbxZePkCrWPGPdA1nOP+uWFWTwz8j4+P4yqCTlT/vnHS
         WqDA==
X-Forwarded-Encrypted: i=1; AJvYcCXyo+xhJfgK0syRbeH8StOgKWsN9c4yskQplnvPwkLGCmnvJKu9Jan72D0KWnxAe8SDUNo17ajMUH2tf/o0@vger.kernel.org
X-Gm-Message-State: AOJu0YwVyI+couh5V2XoR5GbflXxCjXH3Kif2UQRKWy0dhYeR1E7CHEx
	XecFUUWtFfE4rFmfcPlrCtaIudypzai34mInsORdwtOYi5G5ooAVLT8xcuLODmFUGrWw4nQBMJg
	B10HXFzlYEDhco+svp9twX96WLuqabCXeHHMiCeK30A7zTXcrnVWmWeZ7wx+HxiNWzBs7
X-Gm-Gg: ASbGnctGQtnJNgDrEpQ8muRKL+Z/pcAiVdkJP2YaY3nQ2VwWBRSEAsQG0AK+aH0VnWD
	KwzdFzTPrVs8cgqrToTLcgk8Ejc6fqX1QTL933C6FDe+xMFW9BkPuwgKN3GnJQxpf7tDEJbGh6w
	ygGN7FFM2ecSaY/Exu0/hiTApfuPLb2GQaw7+RhdDHkyCnIVaAAEu09hnElM2h+jmC5YofayWIU
	qrO0sKa0oM9yDCIB/ez5HuCx0T/lGFqjyySljxt8xF0pdj7aFT+RAttu9tvxLSe7adb6f1SglaY
	+nUwurgu1o4XzZTnLzQBz5I9akPfekz8mD1iNSEkBorLY0D07l9htlhnTJ3NCzvsXgV9HbKvRNI
	bcWf1M79jV8awPb5DMPOh7LwGWkDKiizdDFpiVkG/84POwgdiuXvyX8ovvcnbsGSu5Yn21YSaaX
	ny
X-Received: by 2002:a05:620a:440a:b0:8a3:b6a9:d3c2 with SMTP id af79cd13be357-8b5e6a92271mr710544185a.44.1764839008078;
        Thu, 04 Dec 2025 01:03:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFLArSQz+yioi16kVc+PO9ATH8eO3eiC7xSnXodgZ8Suwlzg6CqzZbOPtnw1VcLj2LpabJQdw==
X-Received: by 2002:a05:620a:440a:b0:8a3:b6a9:d3c2 with SMTP id af79cd13be357-8b5e6a92271mr710542285a.44.1764839007671;
        Thu, 04 Dec 2025 01:03:27 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:82c:5f0:f840:4916:e7c3:a857])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47930cb6a96sm21146195e9.15.2025.12.04.01.03.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Dec 2025 01:03:27 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: bryan.odonoghue@linaro.org, mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vladimir.zapolskiy@linaro.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v2] media: qcom: camss: csid-340: Fix unused variables
Date: Thu,  4 Dec 2025 10:03:25 +0100
Message-Id: <20251204090325.82140-1-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 2id0uQ6YHA_M2nYjbIdkHvfofV84t4gy
X-Proofpoint-ORIG-GUID: 2id0uQ6YHA_M2nYjbIdkHvfofV84t4gy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA0MDA3MyBTYWx0ZWRfX2FUAf38eepMk
 3ezWJ1iFyaNFZdr67V8jtVNnTswoVfB80CjH4wXYxIyMOhS7CsFvNeqQ4tic8qR5QR3dRcpQorw
 yCHM3EQRWgCNAIjNuZKj9r9fXKnAAwAdJeixlmWTSrdjQDvEgT97c9969CgVb1J7btjnrk2r9Op
 kbpFAihbTuqEtC/65bBWKZ/jTXBJIUb5ByjupQ9YkADzaKn81ajJvkELzTAD+q96oxnwMC5rCaG
 /NsIhTMykqm/uj094usQTjhzKzSMKRkJ8LLSWoJZi7GBgAqip1DEE8JVb8UWA/AHxBW4VzRIUeW
 kuwi3k0f5n/W1sqkFfoIihId/Mu2FrMTU+x4NdWCmHFnPm3TUIgELPF030Na6mZGujbLiZ2N0E1
 ux/wAaoA8PL5X82ayAgjvLHwtRoNyA==
X-Authority-Analysis: v=2.4 cv=Scz6t/Ru c=1 sm=1 tr=0 ts=69314e60 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=KTbTtSzwl6QXNmdirioA:9 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-04_02,2025-12-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 impostorscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512040073

The CSID driver has some unused variables and function parameters
that are no longer needed (due to refactoring). This patch cleans
up those unused elements:

- Removing the `vc` parameter from `__csid_configure_rx()`.
- Dropping the unused `lane_cnt` variable.
- Adjusting calls to `__csid_configure_rx()` accordingly.

Fixes: f0fc808a466a ("media: qcom: camss: Add CSID 340 support")
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 v2: Correct the commit ID in the Fixes: tag

 drivers/media/platform/qcom/camss/camss-csid-340.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-340.c b/drivers/media/platform/qcom/camss/camss-csid-340.c
index 22a30510fb79..2b50f9b96a34 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-340.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-340.c
@@ -55,8 +55,7 @@
 #define CSID_RDI_CTRL_HALT_AT_FRAME_BOUNDARY		0
 #define CSID_RDI_CTRL_RESUME_AT_FRAME_BOUNDARY		1
 
-static void __csid_configure_rx(struct csid_device *csid,
-				struct csid_phy_config *phy, int vc)
+static void __csid_configure_rx(struct csid_device *csid, struct csid_phy_config *phy)
 {
 	u32 val;
 
@@ -81,13 +80,9 @@ static void __csid_configure_rdi_stream(struct csid_device *csid, u8 enable, u8
 	const struct csid_format_info *format = csid_get_fmt_entry(csid->res->formats->formats,
 								   csid->res->formats->nformats,
 								   input_format->code);
-	u8 lane_cnt = csid->phy.lane_cnt;
 	u8 dt_id;
 	u32 val;
 
-	if (!lane_cnt)
-		lane_cnt = 4;
-
 	/*
 	 * DT_ID is a two bit bitfield that is concatenated with
 	 * the four least significant bits of the five bit VC
@@ -120,10 +115,11 @@ static void csid_configure_stream(struct csid_device *csid, u8 enable)
 {
 	int i;
 
+	__csid_configure_rx(csid, &csid->phy);
+
 	for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS; i++) {
 		if (csid->phy.en_vc & BIT(i)) {
 			__csid_configure_rdi_stream(csid, enable, i);
-			__csid_configure_rx(csid, &csid->phy, i);
 			__csid_ctrl_rdi(csid, enable, i);
 		}
 	}
-- 
2.34.1


