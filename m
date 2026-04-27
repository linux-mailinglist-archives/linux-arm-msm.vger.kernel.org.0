Return-Path: <linux-arm-msm+bounces-104615-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ILZeJRMG72ma3wAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104615-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 08:45:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 28EB046DCBE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 08:45:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3A956305B5B0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 06:39:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8AD3374E4E;
	Mon, 27 Apr 2026 06:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Nvom64kR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EE55X/SM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D3F8280CF6
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 06:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777271992; cv=none; b=cXhILTVS22cnCixAjGIXTQksgY3ewE0JeQT/pKjqYBYJKBC6ijndQOqQPq6hW6AfMQYOK7BVynjMu4EuUnM0e+IzbD3CFAXSXnAH8WLciq+2u+rRbJCsroQiWvE7PzICNeKTBjaygfxMS5qIDmGDLUi1hH2DyJVPxvS/NKDYUcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777271992; c=relaxed/simple;
	bh=ebt+DlIxFYdZ58+Dz/1bcwNcBFyftHvLSrZPhrp4eDY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kvt9F9CQrXwPSnu3PVEfKPleVswb9ZyFttIHytNDHTIZbyzvwg1SokMdsOnfZzGo8zb7vtjyqlVw2qALQjOB5PQtARqvDNHu1t9YdfvzPkkFAPmRrEeoohJUOrdP4lVRIHVWrHSx45iwBeQ90tez/4dxA3PW9y6DYL0dG7ayufU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Nvom64kR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EE55X/SM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63R64E7l2582820
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 06:39:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qzC8dA/21UMvhLjLYCfzr/+6i+/FSPhWX2hchnV7imk=; b=Nvom64kRl3CVEg9v
	VxzjqyKzMgv4wplcqD02BaPhFVqe2fyTtYCnOb+UYSakQJMGOZC6MwSyhr57OaVX
	7NHeQRYVmTve4d1AGhHmwQ0RkVqbaOXVPChTKYjIKWum4DU708aMBbIwRxxhmGRc
	i5rd9Az7NSlAPLXx8EqNzebqLRuM43iA/dJnBYQHyY6Im+qeyAZUOYgYivKf78Mn
	n7GhnrsAH+s1q8do/quUagvVdwMj5CYboMCY1eo8sdcSI7qYkYcSwWLTQ38pqaAm
	Jx1Fh/jCkRTRpBOekU6TU9Xhno0ZwVSgp82/RknRP4f4dRFWQJ9FgCABGiRE+ft6
	hxlxJA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt26xg3x3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 06:39:50 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35e59791605so10496797a91.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 Apr 2026 23:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777271989; x=1777876789; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qzC8dA/21UMvhLjLYCfzr/+6i+/FSPhWX2hchnV7imk=;
        b=EE55X/SMyHbmXXYVPTFpP43ypOCzQvlVBXyUnyBlmOkRiL8MMryaUK3iQFcPq6ec0x
         VxFWvN1lA31hsNsAPcxW3kms8LaMSchW59qlOvWUBvdPh83acT0Ck/A9DCsYnxP1mVHU
         0OtMcUjApgSMTvQEQHtNWQlCzUfCdly/04MRFzYLJvn5LUzzKhKCKF0cJVDcRK7B/rbd
         /OhdGwU2g9FOKfm5+hHWyPV1XBSrx1ntZ7ZiKiPoyNUOZNZRlCIKTQTPj3BO/Fmvkr+F
         dgoH/kpX8Rprc9TZ/4mW5i4hyzCTYVF2fUW0+3hWwea389NCqdjHxjgw1SqPkZEXsF18
         m5vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777271989; x=1777876789;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qzC8dA/21UMvhLjLYCfzr/+6i+/FSPhWX2hchnV7imk=;
        b=UL++rDIprI0nDrRuMh3MJYfV/nT/OKYpwHscM1SYQdt0OePJOIVLt+vLX0WImMenWi
         l9O8u0zDq4+Xs4ORQTqnp60VqS2U8984UKeMTlg+DiiRgw8X8ti5Ylx9K/phR4QnrmIV
         jPbZw+tysnaX44H7KoYq86OIo6mAHUUMPI7duJbcOuQaLHq8Y0/a74VCaLZmbVstVPpy
         DvtQwgJH2znoAJjBu8nZHyqd7edU0cu47VGTjBHherFgaOHQv+ryOj7jjsTryRplYd/a
         Qxyi8j5lJaKffsciYB/RqnH8bXZtiMGLZYbIPqJH4t/oEm4VrswknsUXs+gjr8I+vnIR
         lJSQ==
X-Forwarded-Encrypted: i=1; AFNElJ+yaE2KeuaMPAYwA85Tz3YUhByyd20oh79IoRiNpIc6mjTsY5oAViA6gJ9zGItAt4TumMqRNnQ5P7c3J9fh@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9eko+oheoR1PB67MCfBzdDfaOQHumhNgtlyGRB2BxTI4DI0uJ
	xpdqwrtfy+QcOYs3jAvpBx8sxq1WBQTyLW1MDpMVLfz164grxtL5ZwWIx3Sr1lhsWHzgj4wv8XJ
	IK7ZFyZTETnb+W+iRsjz6/kp0g18aBRWm/i43c0CbJRmOHA9Ov0nhexbgP/wykALNLhcc
X-Gm-Gg: AeBDiesxQ4FgpLvSDmgxOfRpT5Nn1STVSnpDjhmxg7CbrY4yCSJ4MIgOpeehpf85h3q
	qX2pKlt5uHfJSEaNndx+IwkVPI2D11K7NbKYLOzwaI0/44X3DTDNWp+VzlvE0yBkNgD3p1AzMdg
	6IMYuV5BEqhFsa18IJBW5nOrnb28fesxxVl2qj/H+h4CabNEL6h0X3J3YbiDgZP0aa13bISKz64
	6TfO+xBdd67k5peBrThYva7eQv/L2piJ5eYGTHvYce0dq1YiyoIDBpagnptuCt0XE9i5ati57hm
	bGAUeyiXiEqXDz1HgUPTu5cpZIz64+32sj7HdQqYOhi0YeyefDkOXr+OExchEB4M3qHfWjqXM5w
	e4l00Rh9AxAncJUgg5I8tR5WrFDTMPVesh1Ac4KzD/nUvks3Ax15SPB8o
X-Received: by 2002:a17:90b:164a:b0:35b:96bb:47ba with SMTP id 98e67ed59e1d1-361404c0ca8mr41138532a91.26.1777271989270;
        Sun, 26 Apr 2026 23:39:49 -0700 (PDT)
X-Received: by 2002:a17:90b:164a:b0:35b:96bb:47ba with SMTP id 98e67ed59e1d1-361404c0ca8mr41138449a91.26.1777271988319;
        Sun, 26 Apr 2026 23:39:48 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-361410a7ab7sm38628234a91.10.2026.04.26.23.39.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 23:39:47 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 12:09:00 +0530
Subject: [PATCH v2 6/6] drm/msm/a6xx: Limit GXPD votes to recovery in A8x
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-gfx-clk-fixes-v2-6-797e54b3d464@oss.qualcomm.com>
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
X-Proofpoint-GUID: 2d2Q_nJ1r9zJ9A5oMfC-8BVAkXTOP-sr
X-Proofpoint-ORIG-GUID: 2d2Q_nJ1r9zJ9A5oMfC-8BVAkXTOP-sr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDA2OCBTYWx0ZWRfX/B061oQbnyF3
 wO5pMMfFO6QXvqG4clAO9XknQ5STbfZ4G7F8OygCx5EdjSUBhO5L/S07Pfe7thTv57HuGSmBstc
 CZeVFdr3xIeSs++MYmVJRDfWXBRO3ZzFuNisM3E3Y8wj4So5wSDfJGA/mauw1EZdgfcIbG/7WOw
 KuxVVrZQHQjVUb8jS6ybSQtX4u8sppIiS+kIcviuOR6VLzqfPckP7HXtEFwPg0sz1IvHrzAX7ZK
 mS4GWSiyKlFlT9eu2n35S0zoRSD0EwAkqoiNvDMvJmqkQGShfWPuExRzKLruxzIaisLuqU2jFze
 2q4R+XLIaEb6mDH7khImvvbQfCVK71ZC5IaQLM1difRTgp2b5Hfkoic0IBDnTESK/AhiLoi/lwg
 EPKzok19bae2VvsgvgrtbMt9a5Un94vuw3HG5FppUvFKlTcukZQQJDN6aleJIgyM+uJeDjJs6lI
 IJPfr/2ZQTj0lk1/orA==
X-Authority-Analysis: v=2.4 cv=FM8rAeos c=1 sm=1 tr=0 ts=69ef04b6 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=wUjT8lVc3dO_4AMqBZcA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 bulkscore=0 phishscore=0
 spamscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270068
X-Rspamd-Queue-Id: 28EB046DCBE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-104615-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,oss.qualcomm.com,poorly.run,linux.dev,gmail.com,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

From: Akhil P Oommen <akhilpo@oss.qualcomm.com>

In A8x GPUs, the GX GDSC is moved to a separate block called GXCLKCTL
which is under the GX power domain. Due to the way the support for this
block is implemented in its driver, pm_runtime votes result in a vote on
GX/GMxC/MxC rails from the APPS RSC. This is against the Adreno
architecture which require GMU to be the sole voter of these collapsible
rails on behalf of GPU, except during the GPU/GMU recovery.

To align with this architectural requirement and to realize the power
benefits of the IFPC feature, remove the GXPD votes during gmu resume
and suspend. And during the recovery sequence, enable/disable the GXPD
along with the 'synced_poweroff' genpd hint to force collapse this GDSC.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 64 +++++++++++++++++++++++++++++------
 1 file changed, 54 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 1b44b9e21ad868e6454b9140284cc7ebedc4f59a..b7166a883b018f459caae742e9a589f32167f8d2 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -1250,6 +1250,56 @@ static int a6xx_gmu_secure_init(struct a6xx_gpu *a6xx_gpu)
 	return 0;
 }
 
+static int a6xx_gmu_gxpd_get(struct a6xx_gmu *gmu)
+{
+	struct a6xx_gpu *a6xx_gpu = container_of(gmu, struct a6xx_gpu, gmu);
+	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
+
+	if (IS_ERR_OR_NULL(gmu->gxpd))
+		return 0;
+
+	/*
+	 * On A8xx HW, GX GDSC is moved to a new clk controller block under GX
+	 * power domain. The clock driver for this new block keeps the GX rail
+	 * voted when gxpd is voted. So, use the gxpd only during gpu recovery.
+	 */
+	if (adreno_gpu->info->family >= ADRENO_8XX_GEN1)
+		return 0;
+
+	/*
+	 * On A6x/A7x, "enable" the GX power domain which won't actually do
+	 * anything but it will make sure that the refcounting is correct in
+	 * case we need to bring down the GX after a GMU failure
+	 */
+	return pm_runtime_get_sync(gmu->gxpd);
+}
+
+static int a6xx_gmu_gxpd_put(struct a6xx_gmu *gmu)
+{
+	struct a6xx_gpu *a6xx_gpu = container_of(gmu, struct a6xx_gpu, gmu);
+	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
+
+	if (IS_ERR_OR_NULL(gmu->gxpd))
+		return 0;
+
+	if (adreno_gpu->info->family < ADRENO_8XX_GEN1)
+		return pm_runtime_put_sync(gmu->gxpd);
+
+	/*
+	 * On A8x, GX GDSC collapse should be triggered only when it is stuck ON
+	 */
+	if (adreno_gpu->funcs->gx_is_on(adreno_gpu)) {
+		pm_runtime_get_sync(gmu->gxpd);
+		/*
+		 * Hint to gfxclkctl driver to do a hw collapse during the next
+		 * RPM PUT. This is a special behavior in the gfxclkctl driver
+		 */
+		dev_pm_genpd_synced_poweroff(gmu->gxpd);
+		pm_runtime_put_sync(gmu->gxpd);
+	}
+
+	return 0;
+}
 
 int a6xx_gmu_resume(struct a6xx_gpu *a6xx_gpu)
 {
@@ -1266,13 +1316,7 @@ int a6xx_gmu_resume(struct a6xx_gpu *a6xx_gpu)
 	/* Turn on the resources */
 	pm_runtime_get_sync(gmu->dev);
 
-	/*
-	 * "enable" the GX power domain which won't actually do anything but it
-	 * will make sure that the refcounting is correct in case we need to
-	 * bring down the GX after a GMU failure
-	 */
-	if (!IS_ERR_OR_NULL(gmu->gxpd))
-		pm_runtime_get_sync(gmu->gxpd);
+	a6xx_gmu_gxpd_get(gmu);
 
 	/* Use a known rate to bring up the GMU */
 	clk_set_rate(gmu->core_clk, 200000000);
@@ -1339,7 +1383,8 @@ int a6xx_gmu_resume(struct a6xx_gpu *a6xx_gpu)
 disable_clk:
 	clk_bulk_disable_unprepare(gmu->nr_clocks, gmu->clocks);
 rpm_put:
-	pm_runtime_put(gmu->gxpd);
+	a6xx_gmu_gxpd_put(gmu);
+
 	pm_runtime_put(gmu->dev);
 
 	return ret;
@@ -1455,8 +1500,7 @@ int a6xx_gmu_stop(struct a6xx_gpu *a6xx_gpu)
 	 * domain. Usually the GMU does this but only if the shutdown sequence
 	 * was successful
 	 */
-	if (!IS_ERR_OR_NULL(gmu->gxpd))
-		pm_runtime_put_sync(gmu->gxpd);
+	a6xx_gmu_gxpd_put(gmu);
 
 	clk_bulk_disable_unprepare(gmu->nr_clocks, gmu->clocks);
 

-- 
2.34.1


