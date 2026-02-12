Return-Path: <linux-arm-msm+bounces-92710-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cHs1JSjqjWnG8gAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92710-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 15:56:40 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 383CE12EAC2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 15:56:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 075A8304CA60
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 14:53:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 993A435CBB9;
	Thu, 12 Feb 2026 14:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FWe1v2Jk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XEBGYoEo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54FAA21ABC1
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 14:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770907977; cv=none; b=umFhfaQagKGCooecfmwIn6QwUldPtUO2LHebr8Q3U+QxYOzU8LLXDlDbmOG6mFHBwFKtQ+ioniKzihI0lfhPUKHcvCpZMvgTjMtEK82c9Dd2b96OpSPY+fEPgbnvQAssBbXV+Aa3Ggle9cywPxDb5hRaMtL/txTvhjR9rJpcaZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770907977; c=relaxed/simple;
	bh=YH0qLB//qQ7m/horvPIK27mISPuge4JVMkCyR+WpoSo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=r8vxeX0n42bU2hTotvZQhwF1vuvCZY5k2LdL8drKYTC36p+8UwLh5w7aoApoP90v8DxYhfJwztbcmELXA4R5rkqTJQOmh/G1hiwEpq3BNvIg2IDJ10Qq727tr20rlc35YMX+Hzd8OLMkdeoMe1DL+3ZAlPGx6Rv7jB9YmFGocr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FWe1v2Jk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XEBGYoEo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61CDRiWl1580898
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 14:52:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=MBgjDmZh+H3sq7sNeAtoBF
	hewZCG+YCTubP3p9PnOD0=; b=FWe1v2JkXX+O1J/mQiEiCcC++BI2v1m5Er32DR
	Qs4y/34uTg+a+w36YRCMaByWWXAZS5XIeJKkzx5NZkEKadf7sEV4Ju5ZUn7l5I3W
	ZPojMR8a6tDFeqJXLkXlG1Z2mdMp9u2uKpYbzDOEh0JbFxDnWSoMluBvZth0iQnR
	kBjBcVOfbKmCiuui1rBUEHjwNixWRXo+5yq4qRfaxV43HgqyT1Ws1WjE62SSnigR
	HJeFhn9xNKWUu1/Mmaff9QvNzIasmInFsoLaFgoKhRgPnPPE29ox4EyCh3G1pbvx
	k8/wqdc4sk8+WoOx1EFiwN8eSwtD3BGHNlnXcikLqr4iJ8fg==
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com [209.85.160.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c8y9buc99-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 14:52:55 +0000 (GMT)
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-4088136faccso16195329fac.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 06:52:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770907974; x=1771512774; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MBgjDmZh+H3sq7sNeAtoBFhewZCG+YCTubP3p9PnOD0=;
        b=XEBGYoEod/75HN7i+yEOhCwx/xbc4FlwpXoPOoueHO3Fu2IRxOBfG4WbT9gwJjFOyg
         bb74p9CBM1V4aGx0NCJFeaAg7pMIxAJ6gjtEDUAD54KrkrbAM+fA8DnOcKwe0bHxoaVI
         lYgherbyzfLHGPKzowaQhItrC3ExNAhaDFkviz/Hot8sg/Xs9lF8D550yi5z7vymSvi3
         Orth/w70diHZgnjr/1XokkPI/m8KMkxoKzn6DyUMEqAKNjVgwBz5ke7lUuufgemaOE0A
         KWGP4wqr8y0hbTKwd+abxIE+BFLNmJPJT0jlU1c8DIn//PFdo5SP6dn44NsiF0LgMDUB
         HguQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770907974; x=1771512774;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MBgjDmZh+H3sq7sNeAtoBFhewZCG+YCTubP3p9PnOD0=;
        b=sAR+MpOpg4ICMwu0A41PBEi7t0e4MQ04/A76hrRDC1jGKfNftcNPQgEmMOOng+kc3p
         O20NAslsOijVmMGlPNRXOA6ez5MXruMIBlxrrOOwlj+JlBXJwh34nsShsb3Lw5mi1t6L
         KE4KmejMHrxTun2TFKRowVP4DtXUvr178FUmwf6uQn908SWcZev2aacWc45/P3fJW9sQ
         MP/MMJ47yyunuaSvwC2rh+TW7ynP2k5TG9Ebd6vgiDauhWjRuevhqkl7Y1MMZTWOKFGr
         nagE1U2vf6EWv6QzFVKhB0P389vjc8EaE8IuAQcBoyjyMBdW+OSwrmhfEJKR0j3D4MsM
         2n1Q==
X-Gm-Message-State: AOJu0Ywcscde9nF5QpVwEE+K+HqvSDs3WUq+9Esw3Bk0hoW6VmAywupW
	ML5Gy8nux3SID0zGh74BRjFS383YCgKj4BcJlPZ/a9rg44g4DqcoYIWSF++g9xFh6M8vmd52MyA
	z9RtKcsnfV6kPGjl7Zeh2A1X9oiE7I8j5whjQj6lgRxkxV1zTOdgvYNluGkcr4YVK/gNH
X-Gm-Gg: AZuq6aI4yWAcNVPSd7gvY15Ov77K9+V1SxevrKXorlUkXOdTPLW8nym8ywLnrKFUpn1
	fGQhyE3KR0cyDpgxGf8hVH0bHrRSkVqxrLsHpfSE72khWSAwFIBuNwmBzUWPcQoZ9h8TZpKm3n6
	xbJMNjeCWuf8aCktd7z6U4nGDB6mkmWBWX0jFpTgp3RUwLleB4xKuaSTsQjBvf0xj+vym4nEMCu
	5K+m/tV0VtAgQgc0ZeF+M+xWfrd4ClUj9KkIBAF5Y52CKfiVtb8y2jpoBpJm2zRInBGG9IeUo3Q
	3itaPizvQr8hf/JbbcBcOZsapu+8Pejrx6qZoQab6tbnHTFLEED9JyuyTHJX7UiuuTjZxW7ddpG
	HAj7Ks4Zwfw96bsc1eYclA6xQ/zJd+9MrdpFl/HC9SSHVxJgaC9BZC8oMny1ZKiiOkwjUv5KnFY
	WqfFUS5jyhBsfGVAKDH0+R
X-Received: by 2002:a05:6820:6ae6:b0:65f:7470:38bd with SMTP id 006d021491bc7-6759b9b5adfmr1154803eaf.58.1770907973993;
        Thu, 12 Feb 2026 06:52:53 -0800 (PST)
X-Received: by 2002:a05:6820:6ae6:b0:65f:7470:38bd with SMTP id 006d021491bc7-6759b9b5adfmr1154790eaf.58.1770907973566;
        Thu, 12 Feb 2026 06:52:53 -0800 (PST)
Received: from [192.168.86.59] (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-40eaee45d12sm3972026fac.1.2026.02.12.06.52.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Feb 2026 06:52:52 -0800 (PST)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Date: Thu, 12 Feb 2026 08:52:52 -0600
Subject: [PATCH] wifi: ath11k: Silence remoteproc probe deferral prints
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260212-ath11k-silence-probe-deferr-v1-1-b8a49bb3c332@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAEPpjWkC/x3MQQqDQAwF0KtI1g2YSIv0KqULzXxrsIySKaUg3
 t2hy7d5OxWEo9C92Snw9eJrrpBLQzYP+QX2VE3a6q1VUR4+s8jCxd/IBt5iHcEJEyJYe9Nrp6O
 ZJKrDFpj8998fz+M4AWwbtQNtAAAA
X-Change-ID: 20260212-ath11k-silence-probe-deferr-28c2532bcc1d
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath11k@lists.infradead.org, linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1664;
 i=bjorn.andersson@oss.qualcomm.com; h=from:subject:message-id;
 bh=YH0qLB//qQ7m/horvPIK27mISPuge4JVMkCyR+WpoSo=;
 b=owEBgwJ8/ZANAwAKAQsfOT8Nma3FAcsmYgBpjelEIncAHdd+PJNineoJBlT0bNSaEOVScRXPC
 pe7AzA9t+uJAkkEAAEKADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCaY3pRBUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcVUOhAAtOzj7Ka31JGpJKXMb23IuzgITB63HmmhUV/df4i
 hHd5XW4OeWU99vZaNY4Tzw1tOBKXeNu4RKwT+HzK9w7gTmlPzBbNzOTXlRHp+rKnk76Lb5lCXdE
 DO9B4zKEaMXa+hzmM17uolcIKM/J6VBW4rt6N0Ti0dwCpaQRPSwH7R0MBafJGA92+Q1km8h6Mk0
 CVk95IwjCJG+Nc+obZcKJsdT5JUl5MgYO7Bqiak2b1apfgi9bQZ+cavyJFi+FKOKW10m96METy8
 dqPghuDQJDQxyRrbuh4wMPXHiRZKNo3lzlZUidhJEilWQdN7yD6jc488YyRN9f7FsyUGRhm0jGL
 CKpODLovGU/x6C7fFHphnNg7GGDVFRpeLEieMuzjZ+aVtnqZqMfnRUIo5o9/k7lZr/gLp+7pW+0
 mm4UzHV7N2nDecMSRvkzzvKJjFFOfCs9K7frrpaEb87v5GXk1brR8j1PFKZEmFpfL6PNE5giAys
 fXb0JWBhx2rTU6o9vvE7JJwrp7X7xoQ7ZOgsj0jBDFq4l4P0fPr8h8pu5ydDNDLHyZ3p17nXYj9
 b1t7rjbTQUT2TSwLU3iR7E4IyorHPPr0swdQyxJ+/czpoNALWdPHNN6V2eeJRnyIcN9xBT4682l
 hpsQHwQ4HOskkay1+kco7PK+uZ99u8AZE76h5RH2HjWY=
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5
X-Authority-Analysis: v=2.4 cv=BbPVE7t2 c=1 sm=1 tr=0 ts=698de947 cx=c_pps
 a=Z3eh007fzM5o9awBa1HkYQ==:117 a=DaeiM5VmU20ml6RIjrOvYw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=12A6hGN33XcstJ_aBzoA:9 a=QEXdDO2ut3YA:10
 a=eBU8X_Hb5SQ8N-bgNfv4:22
X-Proofpoint-GUID: wCbSLjvB6mBiTjC1QzAp3lc7_pMQbi0s
X-Proofpoint-ORIG-GUID: wCbSLjvB6mBiTjC1QzAp3lc7_pMQbi0s
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEyMDExMyBTYWx0ZWRfX5ORnIdEsDzS4
 q9dKSyC+NzIfVcwBY/nhvdLY3bigf/Zq65HXBYv4+XjebmNcMsokK9NDza06xz4F4jDKH+f6FvP
 hzoO4TycNZ62ZzRyrk+SLBk2eQ8WBmaruP/mqdvqO0f+jrhuDirrCAtr59LVBufUlXvMuSJokik
 PLRG9b4L0sk2ORR29jkvR67UgE2SU+GY3e3QosZTUV7BESX3dZVKmG/Ho5xWSLWWuKgjxFnxlk5
 82It0tAJbvl9TyQnYlZBxCTqDwmYmNS6LGo2bqNBVCvIeYtP0NrL/lAHuzYkBBdNqQtPr+m0bv2
 htgpK1mG9cUO2t5pxdqys7JzkR5l8vVwgh2JUSPG6lQIGe5sHxRdiNEdl6881287xJoi8EyOPlZ
 v7a+8vRjkAp9lbv2gWiuA7BJHDhbCOfEMjdocbWYa1sOAzHEoY4ueVaQAegx3uVbUXEAQHY42Tl
 PGrWYXMscdGiY2I1fLw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-12_04,2026-02-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 phishscore=0 spamscore=0
 impostorscore=0 malwarescore=0 suspectscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602120113
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bjorn.andersson@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92710-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+]
X-Rspamd-Queue-Id: 383CE12EAC2
X-Rspamd-Action: no action

Upon failing to resolve the remoteproc phandle one ath11k_dbg() and one
ath11k_err() is used to tell the user about the (presumably) temporary
failure.

Reduce the log spam by removing the duplicate print and switching to
dev_err_probe(), in line with how ath12k handles this error.

Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath11k/ahb.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/ahb.c b/drivers/net/wireless/ath/ath11k/ahb.c
index 8dfe9b40c12626649639fc1dd9da0e5e0c2dcaf1..08d3a0c8f105b26b1548c5d6006f6ea162fe58ff 100644
--- a/drivers/net/wireless/ath/ath11k/ahb.c
+++ b/drivers/net/wireless/ath/ath11k/ahb.c
@@ -807,10 +807,8 @@ static int ath11k_core_get_rproc(struct ath11k_base *ab)
 	}
 
 	prproc = rproc_get_by_phandle(rproc_phandle);
-	if (!prproc) {
-		ath11k_dbg(ab, ATH11K_DBG_AHB, "failed to get rproc, deferring\n");
-		return -EPROBE_DEFER;
-	}
+	if (!prproc)
+		return dev_err_probe(&ab->pdev->dev, -EPROBE_DEFER, "failed to get rproc\n");
 	ab_ahb->tgt_rproc = prproc;
 
 	return 0;
@@ -1190,10 +1188,8 @@ static int ath11k_ahb_probe(struct platform_device *pdev)
 	ath11k_ahb_init_qmi_ce_config(ab);
 
 	ret = ath11k_core_get_rproc(ab);
-	if (ret) {
-		ath11k_err(ab, "failed to get rproc: %d\n", ret);
+	if (ret)
 		goto err_ce_free;
-	}
 
 	ret = ath11k_core_init(ab);
 	if (ret) {

---
base-commit: fd9678829d6dd0c10fde080b536abf4b1121c346
change-id: 20260212-ath11k-silence-probe-deferr-28c2532bcc1d

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>


