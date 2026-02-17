Return-Path: <linux-arm-msm+bounces-93172-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uIYpFa1nlGlFDgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93172-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 14:05:49 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AB6E14C56B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 14:05:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9651D3099C7D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 13:01:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDAB335770A;
	Tue, 17 Feb 2026 13:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NliCbb2P";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U/tuRoK7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98EB135A923
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 13:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771333254; cv=none; b=DjqaLBeIboOU+kY8ji+2/zCjAIvBj/moEnsD1bGQ4TUGIfHxVGjH/1TNnLqjgNRWc5b5ZmzOUNkWfY6J4jQUqNdzN+F/c9SgTYGFw7QV/JrwuK+bG/j/pLGwLyDdsHlaU+7ttZ8TLlUWiD73T0zefTGU893gguERIl3V5PC1TnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771333254; c=relaxed/simple;
	bh=EzkTHDadVnOE2NfigixNwb2wSzI+jRdeOn659JJ4Y1o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pmRUufo5MlWXcsEmO4ZQXVTV0z4Ki4fh1tEGMPEZtlRqlC6iuwF3vJ54sprgZeEFD2KjCAZmvNQIwxKK5PDlTHn2Sl7VT1AzriEht8MTBXkAq9x/X9qVeDZCnK6cu/cr32b8rr+PSuFbv4P+Dat9q82Wv54TluZpt3ZaZMqtxI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NliCbb2P; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U/tuRoK7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61H54oUR2112149
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 13:00:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=bC++DKedS7f
	bs1KMQy0E+YAY3hYXEPrJJ1jNOPM9ySc=; b=NliCbb2PGIvWvO463CFDT60Prb4
	XsygZnUdCazJ3fOw4bRamK85YS3vHWnf8TychkH97NFztijK25sXrke6xglXiLuK
	nKmWSne0v3VhIB9se2iIKvHnwByZsU1J7ivTv5/kVAvaQNYUUhUeHv/rLcIjPIey
	Uc2jXGL89mqeGhjc5vrD8U4aYYb55w08nRLgu9QAqoZBuju53umWIjsxxmP3CCyt
	FJPze3hHVHvuIBqZPvEegUz1tVwWbYuhaCTQMC35x6/2Ly5PTEdenz8lnSE5Z03B
	gq1E6xYHTt30H9SmwPOoiZW84r1gCFT6VNtc7nQE/fNTqlXy5dNZHB9Quow==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cchv4h4g7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 13:00:52 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c711251ac5so2374699885a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 05:00:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771333252; x=1771938052; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bC++DKedS7fbs1KMQy0E+YAY3hYXEPrJJ1jNOPM9ySc=;
        b=U/tuRoK7QQjNeJHdl3iLpjwORe07JNq1u+j4qfVOqe/Qej2M0puPLGVL1LwwoGhS4L
         mDwyNSWDe4A041VF1lzYkJudj5Isx7DjayshVSGe9iU1957+tkUy2Y6c4OBhRcMi59n/
         3i9Mj+Nj3YJ9ByMwgonLnh4Khp6O0gXrZJh2yxQMKWlce3+L9pnAyQYxo8xQ1f+gOY1e
         vhJvgUV1uUkdfn9hvuoMj46DP6M6ZwNeMB1Vlt/F8ButhQDDjZ3coy7G8HxMdWUrzNa9
         uXHbjIyau+2iSVatA3WSXoXnbrMTSvacEj39rJtcKc/pS9Gxgbka1gVPIlKwvbJ8utPK
         khkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771333252; x=1771938052;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bC++DKedS7fbs1KMQy0E+YAY3hYXEPrJJ1jNOPM9ySc=;
        b=mwaan14qCNx5iiO55QUtDpJDyoeFCxLr5VSYhNpfb5HKDIFIHZNzm3TJzkagowJjA8
         othrL5NFGwj8wywCF5fVqHYeYlUobfZctIaULipfAm8VBn/cO1Xr936/EncFaw6j/ng3
         yCkxJXojPgDGhMKfd0oCBuxLxW9B5eCsI6/E8q8SrNqv2bZxrNagXzuypORY3rdjtoqL
         kJeXM1dM+xQi9udLG/0phT8/f3PKsDzTwFyWd2AJGiP3dpmMZ/OsBN+ePIQx/ZfBmYPr
         0utX1gZb77L8DD7oZ7D2F8rxwZyfgxFqvqwEFY6qKTTXQ7sLey6jnzUvl09y3udMAZHI
         Vrfg==
X-Forwarded-Encrypted: i=1; AJvYcCX5w6kwsOse5AZr4CWSqZuKFES4TIb/X3X+FdAMCVGzep1/FDGp868rkkytVkJRZF43CMIcM796B5Ntujas@vger.kernel.org
X-Gm-Message-State: AOJu0YzlbiCiMqOZTUkCHpcRJN9njpWNsDWUNfaSDpLspOZvGffkvObz
	AalXfc1GFJfaObcunM8qa9PKTooNn9T3e/lN9OEOKqN0PGSz1jY4QVghGA7CmKb/klPbB7WbKg/
	XkcauhuSDVmz8YYOcVeZC27NezFiKoE8OU1qJ9B02+6VQ1bno8zwonZ4R78v5mokaLws/
X-Gm-Gg: AZuq6aJTQxjktzKW6G83dfvK6iSWUxDjniJrJVlj52aqdkGD7xNn5PoF8TWYjK9uPbU
	InPRjRj4Pr7rjzrXEztiC+dcv9RqCn1rIcH0dLeqK/eAqz+wTC+t51pFXgDbOp61rGj77BWDqgX
	+stlmWRPKtZSwbWBTraSKSALxRk/1WwozhS0aenNWYiXrhQa0c7wi4vCcF5nhL2TwfYXHVoAHDR
	QKuDlkZfqyNYUjf2eF8k+FNjhpLNo5+V/FtAXWcKJDGWuosip15VBPjfvYDX5lDF10idSrpx0g8
	DFznWl4iQBhRKPCpes81zsqfn1fDl+t/6cy/qBPFUTU8SKRic5a2w1u9tJamn3uEhfb+8nkePDZ
	yVhFCu+znqLnpMj37NrC28J8TL7xv0EW/fEN8cw==
X-Received: by 2002:a05:620a:3947:b0:8c7:106c:cbd4 with SMTP id af79cd13be357-8cb4081fabdmr1564975885a.12.1771333248006;
        Tue, 17 Feb 2026 05:00:48 -0800 (PST)
X-Received: by 2002:a05:620a:3947:b0:8c7:106c:cbd4 with SMTP id af79cd13be357-8cb4081fabdmr1564921785a.12.1771333243774;
        Tue, 17 Feb 2026 05:00:43 -0800 (PST)
Received: from quoll ([178.197.223.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48371a44ae0sm100240045e9.29.2026.02.17.05.00.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 05:00:43 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 2/2] interconnect: qcom: De-acronymize SoC names
Date: Tue, 17 Feb 2026 14:00:37 +0100
Message-ID: <20260217130035.281752-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260217130035.281752-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260217130035.281752-3-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1624; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=EzkTHDadVnOE2NfigixNwb2wSzI+jRdeOn659JJ4Y1o=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBplGZ0wIofTUnkIovkhI60z3g9Ux8dN60mwyDXz
 RsJr3BYwcSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaZRmdAAKCRDBN2bmhouD
 18NpD/oCJxlG/+6xPVXgrNjQ8dEkszRg0xg60tsRI0zvjl5stBh9s6/OmZRvsrauRh1l0nSONj+
 Fujm5eTRGZIUYyQzrT+NLj54lMWJBpx4mhsD8F1xOmhhoFgCSX/v03AkJ7hGPzPT/4wdYhZUBEt
 EQDF5Y3IUfOTo98NJpN8QI3vFUtCeva4g99+VIZGprgCz5/0o+F9aw43Y6if5USfHCbwE/1UOM4
 LChDggWzTRxyy7MILzPZPxX92acVZlWd9shLeqROOjB5Jto+NH53f7u6s3hcwxq/TwFi/kpsuRl
 BsE1o3knO0EOLdbgF5zXvEKZdSI8mBK1ggQy18lgGBKcaiVItbE4awDRsOrrUR4eegvW9Pd/UF1
 dGb4YL498sdQFF+YBI6zHdpMpqxdpa3T1rrnJJyWlEuGIkNoJvLr7GoGsm7/OewJRRThdbnGasZ
 S2U3kvjy24ZLEm53ze89WDS8bIoWCQket9JQ+yD8NuDtMy/EN2z34qz2xM8avRXbzlKeBRTggx1
 +UEMDWvnpr0ogPUeargkQ17GeErSjXuRFr1XZkFfxs9d52S8Yb8qVq3td71hhAnYMvPrx1Ziofm
 AbpMyRLoOiQNyPG1LiBanjnC57ygo7aair7OMC9WB3Rs9b0nVLCfxqfhRV/5K3gEr0EgkUdCXDH RCK0vrfzeXCn/cQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=eYAwvrEH c=1 sm=1 tr=0 ts=69946684 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=6nO30s3o7FuWeffXwhKHTA==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=h0AwHwagC81chbRYmVIA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDEwNiBTYWx0ZWRfX034SzhguD6BF
 0YPYld6a2sVZ2UKc070FtxHyzHMqzYEZzvVfzFTkMBn2nZiQT2YLU4PCbTGLXUzeBEk9SJutgaB
 OfVFxNCEhouiu1w2Usak/5xshsyUtIv/Op8SB7fUIYKvLLq64syN85k5eLMVKs9KMGxTggiAvlL
 u6WfggLpXSvafgiFvd0E/Etg473UShvwQ/KSTtYieb3u+oMFWZiMI+TpdeuBq2/lbMkxrjgRD4U
 4vrY9A8IOtNKkoHclmgOhUkZRbtNyvuxuD3fzHeHNqjjBh11qWJQ8FCzvWsHIJVkTo7HTc1FYwi
 l0egdr7WoBp1DIEpdGweCPoh93SFVnLLvhU/RensZhCOeShJzUUAMB00gZQGFn0nJEqqCTbRHuS
 bWtGEsKEYs+A4Uc1WVXUQj108ZC+NaALndnQK+ZjEnoXCcsszzCVF5bkOqUluOLm8qRlWsVRjZ+
 R1ATQhIdSXdhUa1+uUw==
X-Proofpoint-GUID: FxG_AxDmq320eEsF3Xgj8xrOvYyIC10f
X-Proofpoint-ORIG-GUID: FxG_AxDmq320eEsF3Xgj8xrOvYyIC10f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170106
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93172-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0AB6E14C56B
X-Rspamd-Action: no action

Glymur and Kaanapali are codenames of Qualcomm SoCs, not acronyms.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/interconnect/qcom/Kconfig  | 4 ++--
 drivers/interconnect/qcom/glymur.c | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/interconnect/qcom/Kconfig b/drivers/interconnect/qcom/Kconfig
index bb1cb8a640c1..425686f4ec50 100644
--- a/drivers/interconnect/qcom/Kconfig
+++ b/drivers/interconnect/qcom/Kconfig
@@ -9,7 +9,7 @@ config INTERCONNECT_QCOM_BCM_VOTER
 	tristate
 
 config INTERCONNECT_QCOM_GLYMUR
-       tristate "Qualcomm GLYMUR interconnect driver"
+       tristate "Qualcomm Glymur interconnect driver"
        depends on INTERCONNECT_QCOM_RPMH_POSSIBLE
        select INTERCONNECT_QCOM_RPMH
        select INTERCONNECT_QCOM_BCM_VOTER
@@ -18,7 +18,7 @@ config INTERCONNECT_QCOM_GLYMUR
          platforms.
 
 config INTERCONNECT_QCOM_KAANAPALI
-	tristate "Qualcomm KAANAPALI interconnect driver"
+	tristate "Qualcomm Kaanapali interconnect driver"
 	depends on INTERCONNECT_QCOM_RPMH_POSSIBLE
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
diff --git a/drivers/interconnect/qcom/glymur.c b/drivers/interconnect/qcom/glymur.c
index e5c07795a6c6..4fa8be6375e7 100644
--- a/drivers/interconnect/qcom/glymur.c
+++ b/drivers/interconnect/qcom/glymur.c
@@ -2518,5 +2518,5 @@ static void __exit qnoc_driver_exit(void)
 }
 module_exit(qnoc_driver_exit);
 
-MODULE_DESCRIPTION("GLYMUR NoC driver");
+MODULE_DESCRIPTION("Glymur NoC driver");
 MODULE_LICENSE("GPL");
-- 
2.51.0


