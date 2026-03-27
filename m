Return-Path: <linux-arm-msm+bounces-100175-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KFAFMj/NxWm5BwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100175-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 01:20:15 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B1F033D839
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 01:20:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7A67D312020A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 00:15:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 276A91F9F7A;
	Fri, 27 Mar 2026 00:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LMx42Wk2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hxR7iOqi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D63CA23D7D4
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 00:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774570552; cv=none; b=SuKnaCiuH3X1nWpYkHfhN1TxsO4wsEvJUh5+C+n7BRu7NBjJAOnhYRPoHpRU0gEVAK/Oa9HggGLB7PVJJg7gXdo481hxeEqPVKcNO5gfj1AxfM3BtRLmVO+lfqHSQmxkOqO0KIEysTdApf4gyeQdH7CnYqY00Z+OgenqKrmsGYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774570552; c=relaxed/simple;
	bh=PUfJzyNArQI3h5XcBjXHQ1RFq+B5YaZxrCRhqSF83Jk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EN6yMKanC6pzy4kTEkml4JOIOf7SNkXjuTRjfnk1UYEIl/Ck7ZTmWWoDlvBLbOCfz/FS6vmgnYu0EdgsDElrvKNVQTeKvErluU1Axmz9Kfr6PHI1CwSttJSiAXJNNXQfNKPyEemfhjbgCtCyilsMDO6ekq1Ex+ERabYRIwDWfOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LMx42Wk2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hxR7iOqi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62QF9dfO334195
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 00:15:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VOQ4Y62EHYJ3YJ61bmCQpHn6cJNcJ8k7qwN5aLk8g5Y=; b=LMx42Wk2pkKhiLzu
	lURGMjsEMSkxjupkl5z+qhKnGBEyLb0Zy0MN+QbzndxHJpZNjQXwbULkaoRnXd4+
	qvEb4qslr7sArzuOS8CoE72WOh3RHJCCFZK6daVJ+P65oYLsntR902zvsbEMEAsL
	CU2mTRibpd5Q1Q3cheQyuCboYXdXS7Tzg6D7Urz7WWw4lVJa5KIMMRgAKxuoxg6M
	GsLl1CPrO8lx4+yjCnlGR3krYlLDjulsluZ3izdu6Kr+VKA3CVNGT8Gdda9AGEj7
	sIQG/kvpiN3bdMyH4G537pCmPa3DcOsfvIkdxUVvcwguaTKxo3QblwbXxK4bd2Rf
	tcWWsg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d527ytuy0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 00:15:49 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35c0abf427aso2102121a91.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 17:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774570549; x=1775175349; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VOQ4Y62EHYJ3YJ61bmCQpHn6cJNcJ8k7qwN5aLk8g5Y=;
        b=hxR7iOqiZP6luRMixblHylLwLNkCpC+STYtCXvm7psId3VVrZWUIdehMOvbVPwNpK+
         jfvMLYbQKhUt/DGMe8ASDoQA+9BBPSe0OBU0LXTx2S4r39zlHARc288YT/rgf1xTQMgI
         nfe+jc64BqaWdQ9pGFgc0ynahaIHO3xDhS0f/udIz+wr0y3nIwR6UU234ufayjHR1eA6
         SKfhFfS0lKxjwBWJtpnuaVeBw6KyyUcNGjiSSVBbVpwMbo7VwX8Iow1aUnMayUw/6gRb
         AxYB82rG6hqdkYmNiKeIv8/nw6PhG+hAvZj+c8HAtGSlhbMY7i2V0wWmeCNtN9GT8TQ1
         uVog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774570549; x=1775175349;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VOQ4Y62EHYJ3YJ61bmCQpHn6cJNcJ8k7qwN5aLk8g5Y=;
        b=YMcYXuQkgWxip2euRj5eHhCx8DXSlL1UpRYqK5VHKNpsQYpXdY8YpRJ3fmV2RBX5r/
         4qarSLmsY5sPo2sMEVTbcrcAmReHQ1rwuFrk20/QtjFPruMJJum7eNq+hQ8HaIrgpEMo
         1ucoEuG+Tv8qLu6SadLAYSC5pufglXY6uHW+9zTMg3wRaexe2BZ/L4cpOSc7NAUGProB
         3Ry1e4ejNoXoSObvkeV3Y4GjXY4fjhA3VT9MnvfSpgvOOPa6sX2apLdTT33ZR4tfo3yR
         WB0jHGM1D8+5Qmd9VGWrQuo48iGA0f+l6oBkPlcUwHlrolaeOJPCuHW/BVEUEO5gUr2H
         xFdQ==
X-Gm-Message-State: AOJu0YwCGnIvhq+iY2xGvnw69rHgExP8TToeZU8O8xTgPtgza7cSy64t
	seGRqWbn/moO4zYfV8pBVJwa/AzC5KgaTJyANWvfKe3qmq55cbvYuyL7E70IfQxBhtqK5W0Uo6/
	XsCT/0HVj9PpkzB5Dy4FafWONfHybWon43SJvTdvFpuvS1TkoVuqBAST8WZx5/61nrVVW
X-Gm-Gg: ATEYQzy7RPmo3FCkw2xjPXWaPV1MxeRtCikbWY+Ij8/VaA5qtnkoTtvRL5yaYaIPQLj
	BIBbhdGqxKB1Lm14B1bUiNM1dQvCP6HABpnmaBsAR6c9ORAJ5ebEm8DFk9yUK/gj5V8FdX32grZ
	LXlxpGIM7W08g3WEhyFQmZ+8CGQBfbn6Fg01ZORSiytFlTsFEUNvi+kAPvUMPjJTOfNKEXpibay
	eQWMh+rVE+cvYO0wrnF2FST4bZt+hJfk3AtEx7CGPEK4PekExntMXjN8wYoBbkhzB9KIBnnqZKq
	UERMjorr/NpPRaji3kzj7m98rBWyHgh6VwYJ0EwkFkL9xCNSMb6xjiSouvk2U4acVUvlHtOzJjn
	4J2pQG4BnVN0rekc6DtMN5bVWducUeAxH5PswYbEKuTz1ww==
X-Received: by 2002:a17:90b:35ce:b0:35b:945d:752a with SMTP id 98e67ed59e1d1-35c30076feemr497452a91.17.1774570548642;
        Thu, 26 Mar 2026 17:15:48 -0700 (PDT)
X-Received: by 2002:a17:90b:35ce:b0:35b:945d:752a with SMTP id 98e67ed59e1d1-35c30076feemr497422a91.17.1774570548158;
        Thu, 26 Mar 2026 17:15:48 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c2ec799eesm163155a91.10.2026.03.26.17.15.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 17:15:47 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 05:44:02 +0530
Subject: [PATCH v2 13/17] drm/msm/a6xx: Add SKU detection support for X2-85
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-a8xx-gpu-batch2-v2-13-2b53c38d2101@oss.qualcomm.com>
References: <20260327-a8xx-gpu-batch2-v2-0-2b53c38d2101@oss.qualcomm.com>
In-Reply-To: <20260327-a8xx-gpu-batch2-v2-0-2b53c38d2101@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Connor Abbott <cwabbott0@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774570466; l=1332;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=PUfJzyNArQI3h5XcBjXHQ1RFq+B5YaZxrCRhqSF83Jk=;
 b=P1B2RUowmqZGJeydikp1wJtnTK1U4dJUKCSowScytIyUjvaNcfYDMudWpXQ6wvb6M8KGzinjR
 hiEVcqoXKvHBueA8nPoIXm2FbdPGg8DFVwJUyrK6M7Ea1v57HJOATg+
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=dLurWeZb c=1 sm=1 tr=0 ts=69c5cc35 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=3_AEj1X5-8Kox2uyKc4A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: UVDr6SdsBunCD7xD_zwpx1KDa-GEclLD
X-Proofpoint-GUID: UVDr6SdsBunCD7xD_zwpx1KDa-GEclLD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDAwMCBTYWx0ZWRfXy9SyeXj/IyBe
 pJwQTT1vjCsy+EmpBCSlcAj5kasJgGWS341pVbXOY9NT9/uib0dSey4ufdLFaqK27yUYMjaauZA
 +Haya5hlKKw61C7IYgHxwmMlh/8kyUClJ8PAPNXOB49B0fXpizTKm4hsLNqArP3r3G9ATRQ4zlO
 LUCISJntDw/EduxXUe6BK4j6JHuSXEnKuPex1H0LARtpNuk1Xfzuf5TIBVR8g5Jf729ECj92X5S
 fNp4s9A7OLyeOOLSKKMrMzV0O696J6ZoXzLxOZ2nP9xpQ71IWsbSLQZ5LadsRZp2c0egF5rvbtn
 MYuuXeBv28Lc6PYWaop0LbmXx66BgJOcZybdnHkj0rR4F9DvrTaAi3EAvCKovbSDytWADw8bY6u
 2YA2hPo9fWQZTBsmhl6zUEkoixPI4GqF4DH3GEekAkS4TDWKe1TX5PAmsZDYwejf0ey7oiFyOZs
 ICfJdQhQ4MqdMD722oA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270000
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100175-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4B1F033D839
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add the Speedbin table to the catalog to enable SKU detection support
for X2-85 GPU found in Glymur chipset. As this chipset support the SOFT
FUSE mechanism, enable the ADRENO_QUIRK_SOFTFUSE quirk too.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index f6b9792531a6..758bc7bd31f6 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -1902,7 +1902,8 @@ static const struct adreno_info a8xx_gpus[] = {
 		.gmem = 21 * SZ_1M,
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
 		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
-			  ADRENO_QUIRK_HAS_HW_APRIV,
+			  ADRENO_QUIRK_HAS_HW_APRIV |
+			  ADRENO_QUIRK_SOFTFUSE,
 		.funcs = &a8xx_gpu_funcs,
 		.a6xx = &(const struct a6xx_info) {
 			.protect = &x285_protect,
@@ -1922,6 +1923,12 @@ static const struct adreno_info a8xx_gpus[] = {
 				{ /* sentinel */ },
 			},
 		},
+		.speedbins = ADRENO_SPEEDBINS(
+			{ 0,   0 },
+			{ 388, 1 },
+			{ 357, 2 },
+			{ 284, 3 },
+		),
 	}, {
 		.chip_ids = ADRENO_CHIP_IDS(0x44050a01),
 		.family = ADRENO_8XX_GEN2,

-- 
2.51.0


