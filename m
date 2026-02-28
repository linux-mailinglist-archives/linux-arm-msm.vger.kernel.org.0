Return-Path: <linux-arm-msm+bounces-94631-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cPtKFx5ao2nW/AQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94631-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Feb 2026 22:11:58 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A17D1C8D85
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Feb 2026 22:11:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 84E3A306FE07
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Feb 2026 19:54:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EA413B448D;
	Sat, 28 Feb 2026 18:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y8GEup6Q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XE8pFeiB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD6A2326952
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Feb 2026 18:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772303673; cv=none; b=PLmsGVFjWjl4G4abkzf9RxB1NSN6R7srM8XJDZT4hWMQtuXgxGaWo2UjBUkPtAxlLEvJ793fLFX3Xgf1hF8TGYFpp08fGijChh8i3MOq/GSMn7r5G6XK+9Wi00Um7SdguaZRb7ySbNxF9UG59N0ourWPuCveNU6ObxhDX0BDnU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772303673; c=relaxed/simple;
	bh=ojECMsCKKy+KTenQ3Mc9h37WlE7phcMG4ulUUjpKDks=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Q/NeWz7hj41NV0buUlaJuohlG3E/3Rsd38wRbhnGmaZIqsIRGzND8kO3cJR4rV+kYhJThNC9OFcfYGM1Sc52TMEarhx+CeDKJcbR5hWsC1lngxnqQ64p4UGXb5mLI6eAyQgeKZ5aduSv+ANDtgwwwIZ2jcZEzrB1IV4pInFAwLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y8GEup6Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XE8pFeiB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61SH011f2648296
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Feb 2026 18:34:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ah6wszVM5reetHUoCuuROG
	+hKB+QzPNnm5de9gAc2JA=; b=Y8GEup6QrpiRd+EaBZ5PY+NqgvdCMQ/hVT8CJT
	pqapmT3/ydO/Dcx2n0m8Dbgz3aeUTPCzQTHtgau9JwBSXuXoTCl9nmue9tzCE8BP
	ugLc9oQ1kL2w4QDUDVhzGcYnoj22GmpmmKUCTT+7cqxKarUSPTfbYSN7bcpfYHvV
	PaESoK5ta69IhgH++N9DgK4S+lilLgDgsnxliHmSFgEPXkwmU3IsAYlalJEZC8gN
	KFjQE8GCOuZwDgCyMoWyQVo4aUDi1Ft7K55qjitQlTKIErcDJPT2wlYDyI7l+svF
	MOW768n5XZwDRPz0yccKoQHa+9papjzmQyN4NU7ZoV37x4Ig==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ckshksbrk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Feb 2026 18:34:30 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8ca3ef536ddso3220667385a.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 28 Feb 2026 10:34:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772303670; x=1772908470; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ah6wszVM5reetHUoCuuROG+hKB+QzPNnm5de9gAc2JA=;
        b=XE8pFeiBVWKJKMRMRyyMw2ioBHn3B2tgpn1eJMuqEymyvBdsPUnxwp3IiKkboCvgc7
         HAda7qOyHpX16hzWx4oFXOHvp8iEZ1MhOmyFmWmUE9/tAGKuK/pZ17f2fg1viOQpC1ai
         tsCaHHbrmMglTLHqzOI5pqgw3K1KVK3ZXHH4qjm6HGYAJh4O8NVRYu105TQiZX/ug8P1
         iXXVlPU5v0oRwp7ucozmjHHJ/6S2Kda2boWsWRMjYfooFvg71pS9hTqTXfM8oMGrtCBZ
         MCuOb4zZCxDL5fcGFdtWzHJigSO9q8m3O/DXGGDDD0yUPHXwiFCETVfQ18rX+qG9TUIi
         XLVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772303670; x=1772908470;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ah6wszVM5reetHUoCuuROG+hKB+QzPNnm5de9gAc2JA=;
        b=CdW5FrDW0QCr0X2hBkhqOh2DJZEfT5TR2OGNmUZKQexVbjpG1qZ8ZHKAn2SM7OOuJ9
         CGcdEew7Mi6pHvgVPTYSWhVo/FZdhL3RHPEsX9iUEiaqdNgk1SJ6qGkBWEfYA2mYgfXL
         KXC+ayHXe4YRMfmAjfawayhblIVx2j24UfZLKPijOhzmtF7CN7ONoO7X4bmiBh4FI1Gh
         O14an8eMQcAjhvV47a8XbXcy0VWO1VC9cq2xtbAkbQTCRrM6/H1mtq5x7nZTE0EK+73O
         MEqdBRNLnvjjq3E+v+/tJrS6qiM7E4HwodMKqALT8dcF5+FdxqVebjCGxcezCORtXBho
         Gabg==
X-Gm-Message-State: AOJu0YzrUxgrTOSNemUQyfPpuy9yAV0QibzZrVc1VLBB7L2rBEOEGt+i
	C9gvg4oD02aitEIb+Jxiw669buumDs2cdI7ESUrYfeZzd3uXFL3ieKDvtOewvgKGI0edUwges2l
	zDwVgp83uBNnS4W0eQlFfw+dDPXFhC1YlUAUB3ZDx7IAScKdjqsM3d6Ehb+j1sBrPhuSQ
X-Gm-Gg: ATEYQzwKI4uHwaR+zLHjAuERt+C2DbqGOTGQ7c5aYmgHD++3MS0CTp1oOcONmcOwgTR
	PoP/Ta6Igz+xGslGMOCncgerPRgwSjEi7sHtJLmdbWxWJL9jpJfjNymfSgdtQkhe3idPwIOCy1L
	aNQIc4PITDav/SZcsfylAa6G9QlGkX+jEDycpOIrtFLFlasB6LudWeCgN7Yc3Hti+PD2025g3TI
	DFF6STxbnD+cxwUkX48k3pxPedOkVeHnND0AnI+9FSlFhFOJsnNb4aYkwj/YTPGvwSIrlK7Q48d
	gnCZLF9l9e3dWWOX5rYmvP1GdxtSdvFyuLGaPHwN5tELKqPS1s6FAVYUo0SQ+u73573GZhT3H56
	xxEzRqKFGgZLRYlve8AoFdFPG42w4yLHTil5k1mtX/YQLXksdHKrIGoSdIg+AReHsxa7YoLBNod
	S91mq1c0CSUdvJyucPtaauLzUynPDKOtIu/p0=
X-Received: by 2002:a05:620a:7109:b0:8ca:3c67:891e with SMTP id af79cd13be357-8cbc8e05146mr819837285a.42.1772303669892;
        Sat, 28 Feb 2026 10:34:29 -0800 (PST)
X-Received: by 2002:a05:620a:7109:b0:8ca:3c67:891e with SMTP id af79cd13be357-8cbc8e05146mr819834485a.42.1772303669314;
        Sat, 28 Feb 2026 10:34:29 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a109df84e8sm2624900e87.58.2026.02.28.10.34.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Feb 2026 10:34:28 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 28 Feb 2026 20:34:27 +0200
Subject: [PATCH v2] soc: qcom: ubwc: disable bank swizzling for Glymur
 platform
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260228-fix-glymur-ubwc-v2-1-70819bd6a6b4@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIADI1o2kC/3WNTQ6DIBCFr2Jm3TGAUUlXvUfjwsKoJCIVCq0x3
 r3UfTcv+V7ezw6BvKEA12IHT8kE45YM4lKAmvplJDQ6MwgmGiaExMF8cJw3Gz3Gx1vh0LSVrlX
 Paskht56ecuRcvHeZJxNezm/nQeI/9/9W4shRS0bVQEwr1d5cCOUa+1k5a8ss0B3H8QXLoppNt
 QAAAA==
X-Change-ID: 20260228-fix-glymur-ubwc-f673d5ca0581
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1323;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=ojECMsCKKy+KTenQ3Mc9h37WlE7phcMG4ulUUjpKDks=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpozU0dy/Bjpwo8TYfBr05ABEHmOM5Q1xqy1XGl
 aP1hfQbYHWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaaM1NAAKCRCLPIo+Aiko
 1cliB/oCrt9/Eq6gMkfJ/sXlfJ9MZzsV/nIK+V+oekIF8J7cSVs97PlT6vSNteSCk3hvlEbZmEP
 JNRrscQhNfqQpr4QCStqgp93wybwoJ86Y9Z07rcA20nUujv2VE8XsmynVhzUgOGsLYELYepzQ/V
 g6OOgmfXPB+SrqxP1C789jGj0SgwWMHK+2fub99jemaxzRtOrHkHTTafkY2gBb81keHynAWNFG4
 7kb83qLyoeD2n+f8HnFh6z/kOc3+Yzl6hOuuvie3sRkgt91pXJtUDEysXnOrD/nIe/XZMKn2Y/4
 5rtbpvfzxpiFkPFKkiC0/ZcTEKR7N8ScZJtH89jOfzCKJnb6
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI4MDE3MiBTYWx0ZWRfX+1pgO11rbDXf
 ktA3iaFa7yXwZpnUukXE8lvG4w1DIa6GqeO1qeeDBluScaIefP1KYz6sYsY6VcVa1Qc48dBTmCq
 xzJym2qEfkGHqOO+yOf83hyh39WXaunnztccdKw7oflUoqTZVZFPYKJ7n1nWnrWYHAFsIJcyPLR
 Hk0HhRKOEDyFiRkv4gnFPx1rntJFzgezpU6fGCYFNbXv48IiJHT0JAszYH3G9Xgg3kgZVqjgRr5
 fpZqVrDihw2Ho1cEcdQaYTaE8Fc3pnUjqlvQ+VYjouH500rw/ruIeHcDrqhJwNYI8+6QdOUAxU6
 IX48wy+btXzj4R6xA3AbDLa9FUVHryGZ7/oA0FediEk+cqu2Q7MUNaVS34QrBahMr+BbpQM6kAx
 CR2YevQSqAfYmWzvNd2fYE7qlaXFWJxG2GJgp918pCQtZ8FTBdy44SG/8QtFr7UmJyd3qheis1v
 wFIgQJYLJBpMWxQVQPQ==
X-Proofpoint-ORIG-GUID: sBEMGWSMEsNUh4JqfNO90SWIIALNz9NP
X-Authority-Analysis: v=2.4 cv=EvbfbCcA c=1 sm=1 tr=0 ts=69a33536 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=_smvvQv66ppQ9i0oH1EA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: sBEMGWSMEsNUh4JqfNO90SWIIALNz9NP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-28_06,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 adultscore=0 impostorscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602280172
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94631-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5A17D1C8D85
X-Rspamd-Action: no action

Due to the way the DDR controller is organized on Glymur, hardware
engineers strongly recommended disabling UBWC bank swizzling on Glymur.
Follow that recommendation.

Fixes: 9b21c3bd2480 ("soc: qcom: ubwc: Add configuration Glymur platform")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v2:
- Fix the syntax error...
- Link to v1: https://lore.kernel.org/r/20260228-fix-glymur-ubwc-v1-1-d80e3fe0dcc7@oss.qualcomm.com
---
 drivers/soc/qcom/ubwc_config.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
index 1c25aaf55e52..8304463f238a 100644
--- a/drivers/soc/qcom/ubwc_config.c
+++ b/drivers/soc/qcom/ubwc_config.c
@@ -231,8 +231,7 @@ static const struct qcom_ubwc_cfg_data x1e80100_data = {
 static const struct qcom_ubwc_cfg_data glymur_data = {
 	.ubwc_enc_version = UBWC_5_0,
 	.ubwc_dec_version = UBWC_5_0,
-	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
-			UBWC_SWIZZLE_ENABLE_LVL3,
+	.ubwc_swizzle = 0,
 	.ubwc_bank_spread = true,
 	/* TODO: highest_bank_bit = 15 for LP_DDR4 */
 	.highest_bank_bit = 16,

---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20260228-fix-glymur-ubwc-f673d5ca0581

Best regards,
-- 
With best wishes
Dmitry


