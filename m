Return-Path: <linux-arm-msm+bounces-99869-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aA8jBvHXw2lwuQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99869-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 13:41:21 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 70F263250C4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 13:41:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9367B326DC0A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 12:09:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 753833D2FFC;
	Wed, 25 Mar 2026 12:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GdbYS4lC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OOPt50AT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 439E63D1CC5
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 12:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774440534; cv=none; b=nbc96ayHQruTw4z5AQ6AEcEfDjQaNnF9AEQd3XnWb3IhGf/oYauEFMdP9MNRZOZnAFPc/VCY2xznIHCSIF5ewrRza8EFIDC4X7PATnc7HeT1SMb4oiaZ5HOW6sqT95eRVW8qc0ndTUCDxwyPxbrgPSo/PhCRrbrqCJRnAVsEJYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774440534; c=relaxed/simple;
	bh=bUVGE+fPDVsuCMcFnX207e6TnYFSbCL5nLGr49Kd5gg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gu4ArdgNeAh2gEoh9bQOdCIeQtQUT9p2IVgeY5/Saugjd3FmMqjwhxXQ/u90s7vvStmiGFKioYhpaQQxM8SOS3JkEWEJ4RYLuxR5i7zz4xanCNNzJ74ozfI/Rn/rdKNjgQhJvoGOxCpW2umMz85b5FGnvY9j16U/vp8QFUHWE6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GdbYS4lC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OOPt50AT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PBGg24052109
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 12:08:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=gk8D9N//V6NyIqWRjsD1d+FQwLB2qTUIV9Z
	eLmilgV8=; b=GdbYS4lCe55HB6Ei9iYZxBavPWr083f5izbLqdP7ADCc5jnrdJx
	+4f2OlYKrJRJ3TFKRrnFdGESkCUwogkewPdiqCGBYmToceDaDJvydfKnByERSx2g
	Lxxd4hDAGC2El+CkZRcEQiPmOol4h6CoNpXQarr/Ag11Kz4qmYyr1bJsd88Kg7qZ
	3AUOJMLmobawzHqC+7G49Ust5Jb01xFJr37JFexShsCcoTeBOE9p5oe/ee2aCasD
	IPQuj2tSGQtkR6jAjQwgq5UH5HOS/VrmLdSwj0GKNrLpTkXdxqfXv4PA9IcKUswc
	jGjlpIEDbodpU4fWFIPBR9kr7tVija280+g==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d46tp1xu9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 12:08:52 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-5ffbf6d209aso30054203137.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 05:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774440531; x=1775045331; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gk8D9N//V6NyIqWRjsD1d+FQwLB2qTUIV9ZeLmilgV8=;
        b=OOPt50ATREUPjTWThJp8sj7ETrPMy+3ikm/L03kJUQwuXynf83yIit/NTg+GvVnNha
         y3DfIK1zUjV2tukFOTfFbtShEUWEy65mqSGoVNCJA9NjNUWxF9ibR7F3C1QDfxiOUkg5
         zY0PUqS77OwY99X/sHKIH4opSp8Masey2qnR4HA8pZtJtzRuC8UE0fNm1AmBRQxX3hw5
         fJEKuxKoWGIMmNAOSZENDLkKFlRYYNTus1/c5idfSoDSdLdBG2UE1HXKmJ1J3aPEakSm
         bxnAHoOiLNby/C5JT/BptjMUpJWrFJLq2hUR+Z+YwTukXVbQ7BuydIIgVrfSJrhxUEeC
         iyZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774440531; x=1775045331;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gk8D9N//V6NyIqWRjsD1d+FQwLB2qTUIV9ZeLmilgV8=;
        b=VWzVMGrwj2AGpT6eAGJ9KG9BIyG3r8JfnSV35PfcD5Gu5LoYlC0pCIFVVzPQJCiW9U
         vogrBVdLxXQ+q3F4MvZayBObq2hfHh9LY5fK4K1s8mzERh96oLr5y9TVh7jNj/Ghcsds
         naZnPUC8wwAxErzjKdk8MNRb7vJIpbqbA1Sqh/NwOxJAK7CsoYxbIhFIMGLqpX+lUz0Q
         f3FqUHC9TtaTiu4XD5A0CqEKGppbM3J2eefLQyscCqjnkr4n53Gp3kGQ40N5L0iWBuQn
         XEKjCL6Z26eaWe4nl5cLYeVGo0uPmlHlnxVPGQZkLjXsodf86rcJcGZBxmv6NWlr7xPw
         Z5Zg==
X-Forwarded-Encrypted: i=1; AJvYcCX7nF3KuZNRTNvEzZxrkYPEK2cRTRRcqytOwcn8qkCyed9hkjO9ZTv51UaXXBmM9nLgytjx1dHwn4QkyRCS@vger.kernel.org
X-Gm-Message-State: AOJu0Yze0eIBOIjTNkb6f8FPILiY5hG2En3uTGvkzX+Ib4kf/W+9uLEZ
	Xy28SnvKqqYU09mkEBFD7Ku69UdWtBBvEbK49MYoOm+tdl/opJHcIbljpwH9FeN16jsTs2vQHdL
	GUSqrwnwbEpuYPDObVEK4f0P109F0dOsUUbB7/Pq7yhPobj97CFIzQ5HHt3bTU8qo3YoUIGhJOD
	jw
X-Gm-Gg: ATEYQzzblOB/SUw+0l8rqAvqca9qzFZboaMQHPGa84VW1jRRYzh+yfF6fi+biEcHjq5
	bSxyWt1bRURgxS0U0EfaL7l00DorkZ8vS0aBe5hFHN8VLqSY/ur6f9ISPes61zOamUYTZm7zB4A
	aLp2oe7A3m2eBhBwCWKEBdyNilWdtzSGhlXKsrLn5PArrNqQoHRAAT3O4n5+Kwknr0O/+d0usEW
	N740tdLX0KtDNm421dnW30+khSdLUGmZgaeNrH+LBzzDHFraa8cdk5dwSicBiNDMpF6kaCcgkA/
	TevU4rq2F/eI2W+wvnF3b6IsMJtoVffkYm0S8VzX0ITQmgv5+GCguACqG2xyLs0NuyGO3Cmr2zE
	3TfS0VaePtCyHqXPt+EFG48EL8WPDyBGMgyxW
X-Received: by 2002:a05:6102:6c4:b0:5ff:ed38:1889 with SMTP id ada2fe7eead31-60386ebc6c1mr1673991137.10.1774440531182;
        Wed, 25 Mar 2026 05:08:51 -0700 (PDT)
X-Received: by 2002:a05:6102:6c4:b0:5ff:ed38:1889 with SMTP id ada2fe7eead31-60386ebc6c1mr1673979137.10.1774440530741;
        Wed, 25 Mar 2026 05:08:50 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4871736befbsm18162155e9.25.2026.03.25.05.08.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 05:08:49 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v2] soc: qcom: ubwc: Remove redundant x1e80100_data
Date: Wed, 25 Mar 2026 13:08:47 +0100
Message-ID: <20260325120846.139836-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1862; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=bUVGE+fPDVsuCMcFnX207e6TnYFSbCL5nLGr49Kd5gg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpw9BOC/IOyQ/X3M4bL0NljUF/HPwYTgohbmyne
 mSVyEl2u5iJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCacPQTgAKCRDBN2bmhouD
 11QRD/0Yd4cPrZ1yfEKy6HhyQqiuQG4TTVHFtgALX26oHev8T0BhtziQcfFMGchtS8rm80bKs0l
 H1BsfCBXf8IJtC/zQcmCt9m0WWBAlUnz248T12xVJBd1gcNype/WuWAYlzz7UlQvEVpkIqVFt+6
 0U81BbQ1Mz7Iq6t+m8briIFpbSs0XxIEo5Z3mfuWn3q9TySm5jicvvvqNKGCG+QMG/xjQc2bSqj
 crQ1WAbAWrfdcArekwerdsEnf1Fwlxb+Ftm6KYuxyH2jR+5x4ENQSv8W0N+W5o4CPDtPBI4btbl
 X+7KLW4wmZakYLEiMdUhmXhjhCq4tkKhepk3zoP1BieWPNUNz3Zm4b8SQ/j4Wk6IMa/slLJo11s
 xxYz4pRrdOX20yk3P/pvuqaT1ZyB/pICbMuGQ4u3+aNxXUHI3EaDtH4ejyssO4ghMfZBalvKzut
 934c/+wVZqoHum39Txn4UnB+7pBqe+9BdWNGkBuH+VZLxancRnZgMDnypLVCdUFWs3EI+pIEo/f
 G5UKoTsHiRIc/q7wC98oqbT6z8OA4PwB0CSCl5PaYodsCwYkx4EUuabP9ER7IRh1rlLekWxcXA3
 Z62HUcbVDuM9JoQpSoSYczhPvLFQl8Spi7jU2sTQV9fMtdDGTaaXKL62FL6cutCQbnBd7UWW08b 8e1TQOlmsFibu8w==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 6opnySBgMPFKV57_fOp3EPe7YB8rt-ET
X-Authority-Analysis: v=2.4 cv=F4lat6hN c=1 sm=1 tr=0 ts=69c3d054 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=GDC9wQWWSZwE6Pz_VsMA:9 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-GUID: 6opnySBgMPFKV57_fOp3EPe7YB8rt-ET
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDA4NiBTYWx0ZWRfX97PH77n7+9kD
 Z4fOXpl8vlSPZw90wXWzlsPCgOi1KdbKFW0I+5Q8UIg0QHisEQyh+Y3BL4c5MBHpb5ffU///bBU
 t4uBfvrbo9mL00Ia1dV3sGgudHOtfPCKFfLIjtypNhmabII1DqiFCHEOTSZmpeNiNTn39E1fuz7
 DrixcN5K9PsBS5BcpfNq4MaeLAbnMhsdi7iWYreZ1Pyi4jAWk+hCUcTMf/4rlvaQuemD0KbCj19
 dt+WLR5kKRdZ3U6qCj/zR9ec7DUxJxv29EIqHeEw6Pc1F4Zp4K2yIevKZYd10Ta0btL/k8eaIEh
 xmlyLWP9rSXU9kAIgEfzJdX3W5q8K8TBgh3BJMk3w1woCgldRp5BAybhmkbZ3dUBdW3rglaWl/n
 DMYr66gVWuqIOncu1bgmGlDPqSqnTSF3pKHfbhtM+ybxnU7AvfQYv13H8f9btP6IVOuvreG7P9Z
 zY+rWvcmc3zpdbasP1Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_04,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 malwarescore=0 clxscore=1015 suspectscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250086
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99869-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 70F263250C4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

UBWC data for X1E80100 is exactly the same as one for SM8550, so reduce
code duplication by reusing older entry.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v2:
1. Drop patch 2/2, thus sending everything as new posting.
2. No changes here, except Rb tag.
---
 drivers/soc/qcom/ubwc_config.c | 15 ++-------------
 1 file changed, 2 insertions(+), 13 deletions(-)

diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
index 1c25aaf55e52..63e77fceb6b8 100644
--- a/drivers/soc/qcom/ubwc_config.c
+++ b/drivers/soc/qcom/ubwc_config.c
@@ -217,17 +217,6 @@ static const struct qcom_ubwc_cfg_data sm8750_data = {
 	.macrotile_mode = true,
 };
 
-static const struct qcom_ubwc_cfg_data x1e80100_data = {
-	.ubwc_enc_version = UBWC_4_0,
-	.ubwc_dec_version = UBWC_4_3,
-	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
-			UBWC_SWIZZLE_ENABLE_LVL3,
-	.ubwc_bank_spread = true,
-	/* TODO: highest_bank_bit = 15 for LP_DDR4 */
-	.highest_bank_bit = 16,
-	.macrotile_mode = true,
-};
-
 static const struct qcom_ubwc_cfg_data glymur_data = {
 	.ubwc_enc_version = UBWC_5_0,
 	.ubwc_dec_version = UBWC_5_0,
@@ -294,8 +283,8 @@ static const struct of_device_id qcom_ubwc_configs[] __maybe_unused = {
 	{ .compatible = "qcom,sm8550", .data = &sm8550_data, },
 	{ .compatible = "qcom,sm8650", .data = &sm8550_data, },
 	{ .compatible = "qcom,sm8750", .data = &sm8750_data, },
-	{ .compatible = "qcom,x1e80100", .data = &x1e80100_data, },
-	{ .compatible = "qcom,x1p42100", .data = &x1e80100_data, },
+	{ .compatible = "qcom,x1e80100", .data = &sm8550_data, },
+	{ .compatible = "qcom,x1p42100", .data = &sm8550_data, },
 	{ }
 };
 
-- 
2.51.0


