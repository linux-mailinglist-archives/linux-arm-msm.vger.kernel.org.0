Return-Path: <linux-arm-msm+bounces-104614-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qAO0Me0E72ma3wAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104614-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 08:40:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D56AB46DB55
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 08:40:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C71D5300B2B4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 06:39:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5208F2749ED;
	Mon, 27 Apr 2026 06:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SfzCHpGM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HHOv1xPo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04C3735B653
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 06:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777271985; cv=none; b=Cy5pvBaf35ZOAUsSTFDl9AyFtmYhjOMkrdz9SAtNy17B9w70oNSr7tWvquW1JT/X00lFUiwUExxhO/IgQO50JY2QUK2TQfrUMz01vgJWy7d7hOVa82iMk/nhvAOL+x1rwMTGRpMlKNV5vRLWfc214PzDBYbf/7N94rIK+S0oIfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777271985; c=relaxed/simple;
	bh=sU5/bKTcHz4y74cRJJQThCJj6V6cFUUTODgu5MX7PSA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b4+raZoukLeXzFL4PoAC1CoavdIF+lVVSErJESyWVOfs6G3QUdBZJampKu60Ly2BuPebUkGZ6QB8BfxX8jjEkrH3ynDEmDLjljEU3fZ4cOCT50GqXpVT22Zc0YK9i/VgdqU8LSTyg5T9Rsp2z5zof2NAw+0UyV6bI94QdNgtRBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SfzCHpGM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HHOv1xPo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63R2jnDq2884490
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 06:39:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Spu2aZ7sZlC2v6vcrcvt66Eq5ch+u67lu57CxDRsDh4=; b=SfzCHpGM18QafocW
	NPb1KXvoKnxgHgJdKWoyUsKg4zsfSgvO6I5f2HH89DpFL5sQEc+ZcccvLXjCbFps
	VqH8xscCrWKjP9KZRAYSjFusMKws3LOJA4K8p+jjCbfWryXOOZqou0HCS2rRxijh
	2WkRC1xw5Xy5Vqzvx7dBvWVJmDyEWgeXkIYpB0ZhKkNBoqrxQWJx3RSBzHwbn9cN
	AE31ci29FE4nBT3uyRxvv194sKXXUPwZrL/vc7ilvsxRrwlBYDWPoyHRtePR2BPi
	j6pjXkOzkoNBeoYVpLMYq4gqy/OqefYWfZf4ZhJpcIvu+i1ff3QmHRqodsj+lSSE
	DBtAjA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dsya00na7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 06:39:42 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-362d9dd9a49so4221574a91.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 Apr 2026 23:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777271982; x=1777876782; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Spu2aZ7sZlC2v6vcrcvt66Eq5ch+u67lu57CxDRsDh4=;
        b=HHOv1xPoICZJM45L0PgNbbhpCZG8aQfdIIA9qmd+Xg3z2J4Mv6V6c6O/CYA4oJ6WUZ
         mEXdv5SDjq86Eg8blxq9xuJYH8sX7M3S+qE533UMTdYltl0Fg32sp8Bj9xx+rR5Ue06g
         TIbVWJbLcHvm6MdoEVzhK+YS7BzRkzVTyIFFulYoiK9+rtSI6LOV8AyIvyv9IG8rmUxF
         eypQE2HdcXNGGPUYh8qOMSP23rU1G+Tm6QDtYH1aUrAz21wNkdYbUvJLMvnxxeaKwZs7
         lMIXC7l695MICU9efE2qxSn+qZ4isuLzw59QC/h/M/ZmfD8VC+kpWMpYf95dnRAjyswg
         NKAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777271982; x=1777876782;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Spu2aZ7sZlC2v6vcrcvt66Eq5ch+u67lu57CxDRsDh4=;
        b=RaW3CpTj68qnnIH4yeOsXhk5s9jy++BEp25bddjBIb/6mybhpeERw6h4v4pXuEmrRO
         37uiHnCGz8DT1LeHEXPXu5bb0PPCiL/Q7HTWy5rTQOt27LJ6w1bKPGaqH0Y7/1ZE9TfH
         T6+dNiC6wkJ9Yu8mdumiR4l78AL0EL/IElpB9/+bHt9VI4KB5ow6UoD5Sc3YeJe31gq/
         /HYJ95Hw/UAa2YBd18cZ8h+5jR2+SrqXdPloYaZJJOl+DKqnSa9qigQmSuJjG7zfSijZ
         rEAIKlcsS9OIRK9MwwYJUe6dcXGtxUVon92pHdRdrGb8+fbZ+eFGEu2tB0APVYRDe7Bo
         yJvQ==
X-Forwarded-Encrypted: i=1; AFNElJ+DahuaRnKUd5khhOcCOxRJPeWRmcWgIvelv6815yoNoWkvt4nUqCkT2qMialuuy/CkYsJ+NHOrZabFTuf7@vger.kernel.org
X-Gm-Message-State: AOJu0YwizGBDY42UGouIg5pugy4s4Lc/OjBSsTfwQpq4VIFu7AEQqfw3
	z5uP6Xuhw/3of/xuSfy+qpxUXIVtKQr4VifU8WaiQWBI9yhrFAvv5QPprwrks8ymuPk7ac++9Sd
	SlKBaYrFUsb6Z+mXsUH7JSVITYYWTTpqgRuXJQeIi/qCJ4kCsLBwAOsmYPeArkzKrHOl7
X-Gm-Gg: AeBDiesn83PaveBSt48bGS2uSdUN+GHithJPAHJ7LR6t/VCcZvXzthNUF9PfC723C/a
	ekCyTfQTwvf1d36d2aeWyh2Y4U6N+MAFHs3xhHpkZ1OoOgziDWwl0c9Ye8tyrO1OyKxzkZOfKIC
	G49JRHdVz9kW+2uovOrLI2KIU3lhHCh+uMBzh7xrVKMogd/c1Y9dprTniEkM7lsQUfJihP/88fj
	phjfzcoeTfp88NqlIVyYLx2i7NZ4Yhtux+DMb2fnkm1oiXJ59WnUkxGJHRi/WWNFJy5qpUGpeBj
	/7buBrbsiRe0zHegNh9D18pXE3A+Abj+OxkJm3fEkxCFRxcSjnx/Kek41qeiJIR1jcH5Hyripu7
	78TRhK7x4WFMXsaZ226sfF7++EC4jbmsauoZEqvj4Hu5NYG1dsdTsGCrt
X-Received: by 2002:a17:90b:3f4b:b0:362:e7e5:a20a with SMTP id 98e67ed59e1d1-362e7e5ac9amr12823662a91.4.1777271981947;
        Sun, 26 Apr 2026 23:39:41 -0700 (PDT)
X-Received: by 2002:a17:90b:3f4b:b0:362:e7e5:a20a with SMTP id 98e67ed59e1d1-362e7e5ac9amr12823621a91.4.1777271981496;
        Sun, 26 Apr 2026 23:39:41 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-361410a7ab7sm38628234a91.10.2026.04.26.23.39.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 23:39:41 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 12:08:59 +0530
Subject: [PATCH v2 5/6] drm/msm/a8xx: Make a8xx_recover IFPC safe
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-gfx-clk-fixes-v2-5-797e54b3d464@oss.qualcomm.com>
References: <20260427-gfx-clk-fixes-v2-0-797e54b3d464@oss.qualcomm.com>
In-Reply-To: <20260427-gfx-clk-fixes-v2-0-797e54b3d464@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-GUID: EJzf8IzkMiRCHO4V5NIrAd8NFO2uzMp6
X-Proofpoint-ORIG-GUID: EJzf8IzkMiRCHO4V5NIrAd8NFO2uzMp6
X-Authority-Analysis: v=2.4 cv=DZEnbPtW c=1 sm=1 tr=0 ts=69ef04af cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=6racf7IOMx3K1H64_JMA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDA2OCBTYWx0ZWRfXxqS1op4kcVsO
 zXLDcUKYAATO5zmm44XGrtM8KYf7jGey3nRSWFkl0GBXiMKr9gEP0dx8bfogwK9+tQdIHGY8Svz
 ToAXchvoSDfiS0wMSxmSa5uPeE3wWQc98Y/PhHo34Ab8uMz6Y8HAXwjFuIBiQWLsjjMsDFqEOt/
 DyugLKczfS0+iD94BTA4rzHRk8xmbTfwwumYYL9Du02xTjsHuCPldneMrdDCjGtOH3PZxFNHuhq
 dG7HgtPF8ZP0QFD5S9XGZcYpoNtAIPEDYtvG5ZkepcXYQfqiggobgJc7A5VNd+kppgs2Rk3uuAW
 ufZ6x+L8xCnM3G3Dvks+jLvP6fjXlf6qC00w4hWrtPHWZaa6TU+sqwcdY9lpg831K3B4Nrwdlrq
 EjB4zWQ7NCLonDf3VbZIFi++sxEb0yFrXNgghKjnevHj29JBT9eMpQRDaS+Dr0bbFn+hXrIFlSm
 XD6C6t3gkzeC2D29tbA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 spamscore=0 adultscore=0 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604270068
X-Rspamd-Queue-Id: D56AB46DB55
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-104614-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,oss.qualcomm.com,poorly.run,linux.dev,gmail.com,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

From: Akhil P Oommen <akhilpo@oss.qualcomm.com>

Similar to a6xx_recover(), check the GX power domain status before
accessing mmio in GX domain a8xx_recover().

Fixes: 288a93200892 ("drm/msm/adreno: Introduce A8x GPU Support")
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
index ccfccc45133fda53168d3475ebd3d543f10268af..9b99ec5ceeb5826fbd5cd1059febf5bc5ba468b5 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
@@ -886,17 +886,22 @@ void a8xx_recover(struct msm_gpu *gpu)
 
 	adreno_dump_info(gpu);
 
-	if (hang_debug)
-		a8xx_dump(gpu);
-
 	/*
 	 * To handle recovery specific sequences during the rpm suspend we are
 	 * about to trigger
 	 */
 	a6xx_gpu->hung = true;
 
-	/* Halt SQE first */
-	gpu_write(gpu, REG_A8XX_CP_SQE_CNTL, 3);
+	if (adreno_gpu->funcs->gx_is_on(adreno_gpu)) {
+		/*
+		 * Sometimes crashstate capture is skipped, so SQE should be
+		 * halted here again
+		 */
+		gpu_write(gpu, REG_A8XX_CP_SQE_CNTL, 3);
+
+		if (hang_debug)
+			a8xx_dump(gpu);
+	}
 
 	pm_runtime_dont_use_autosuspend(&gpu->pdev->dev);
 

-- 
2.34.1


