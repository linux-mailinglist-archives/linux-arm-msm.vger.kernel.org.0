Return-Path: <linux-arm-msm+bounces-102090-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AKPyI1LP1GmtxgcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102090-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 11:33:06 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A3103AC0C7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 11:33:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CC492301577A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2026 09:32:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8B703A6416;
	Tue,  7 Apr 2026 09:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n9lNxdUU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b4yHqyDv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 920F83A4537
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Apr 2026 09:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775554326; cv=none; b=piv3yV2Hx9rhiUnrJGIKghmQMmkHRlBBMI7/vpCSeytriKLfPAONaVZDUEtXzijHm50GovdbQ0C7j0Rm7aKlROOWC7aPb9z79bu05dRlBawK06mAxrIFbHgStDAjY9hZRxJkO3rO45qhcjMYPeNQOQTd9IQiQJk4THAswtLTpNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775554326; c=relaxed/simple;
	bh=ebt+DlIxFYdZ58+Dz/1bcwNcBFyftHvLSrZPhrp4eDY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PaJjvaIH+spp99CEMHXu4kZ+7SNLH1ck0iVINeRi4KHlktqNkQ1t9R+eHCLUXD/eS6tBwbt2vWruBAKc8uoJW49ifciFIk44P2AefEH2ZVj5S53XXYzUHxjx5n7AwUEYrP0u1Ibt5u7QI/LEbzf2i/vIENubzfB0QP/FVfWwC4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n9lNxdUU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b4yHqyDv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6376Ksb31405815
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Apr 2026 09:32:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qzC8dA/21UMvhLjLYCfzr/+6i+/FSPhWX2hchnV7imk=; b=n9lNxdUUZhqiN7Wr
	dqJnk/9BBJRZ/D4SR6SDMY76gA1GgHx17IOWRnyhUpy/by4fKdTGN61eloGcmcFK
	jT9ldeFQq0K4KZpiaE1vWx5qSudZaQBizulgBgcXsjo5PGtkf+Ta4vQBlJ5wRpbO
	Hwg5DGztVYrboGJcarsf8gmfWWgihn43kCum76FS/plwGxZNguPQfcpCkWiSU77f
	P1MbnwjZACZnPbG50DLP7dtsgBzhmEAmlO2ou7G42bAIkh+cIMz3gBucE5htDBTx
	ljeMmOaY61H/UjSIkrCtXZfGSUMGpAzsrPISRFIj+gccEN27IgNzrvaWyN1fYpAh
	Z2eF4w==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmrat26q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 09:32:04 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b249975139so122124975ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 02:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775554324; x=1776159124; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qzC8dA/21UMvhLjLYCfzr/+6i+/FSPhWX2hchnV7imk=;
        b=b4yHqyDv2gZXJvykgY/guP8mATHZwsLvp7Yx18vc7aZIbiSv1AqPuI2GGbtGNPJZoz
         /0+BPs+gZRwAHZtZclcCBeD7rYVLud5DuI8YAkcjaVHajHlD7C2cWGW5CWWQm1ri73Zn
         7Fk+qDitrMt0iR0vcK80HF7clGrvy22P9D2lyWS/8Ss+7YSkoZS/XN0saIrPVpDfuT10
         SIOHhgSZOCeFiRMuDhqUjz8k9zk33NjmsFOy8DGbyD1eKzSWoMegFalabnzjfdLTxXAd
         SmUXE1lqmk7OG77sJX3j3RFQQHmZTjWMQCnv7yvtljaJKoJCiFmtw5QnmdJs5dBlerSv
         Bwgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775554324; x=1776159124;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qzC8dA/21UMvhLjLYCfzr/+6i+/FSPhWX2hchnV7imk=;
        b=X7kxVAGi0y5x9CaiGihBud5QooEoGmf6sjCWP1fXCSMmIeTSCa6bHwn9g6jrsCi23z
         8Lcluc9VSODTAFGjbZw4u8AXFZr0/GTnxKVy2ahnI3TUZH+KgIC/mF6qYgQJ7Z1dGhsJ
         YdfacMjmmPpakDRY2yWNoiAZuOZtQFHMzxQNoyV8iLhhAs0TXnt5m41oU37LwkW3YmFD
         F+CzQRghY2jWA5YZweKTlrhgdWJfZx00b2Q4gP0S6nJ0q4MYBZVhIfY/yOHeA4Tjhh1z
         2DQCaUdwcbgno1eoCGxhuBUCnEXQNmdNga7hd641GbgSRo5M+EIvTE9B17BIzwqTx3/v
         cGMA==
X-Forwarded-Encrypted: i=1; AJvYcCXJmAZA84H0dRWUZrleKXTjdG3V45feW4G7rye2Y7OB7nAPMA3McnC+PJJhIdX42PIqjHRvdNJfUA7ZB9Yo@vger.kernel.org
X-Gm-Message-State: AOJu0YzAAXssHtBhKliiYf/9tRYF0HVOioNwxACvxhCJqGLC2zqDoUGi
	qnQnVKxcP/hpbylOw58YaHm7mlozVWPEFm8Ey9F2IH/jMhjEYD6M3U4Ebt911WcEfF7JVajuMhJ
	LucEagoH3bSmEUwphR128fM/8fMGDUTW4U534x3IQyEA7b5zrzRcRvW9jxzHqyKdPro5K
X-Gm-Gg: AeBDievy5tDxQ1wpatngwnApAVwncMaRw5QuRkYl8VmyoKWhmWWSBDKukeedo1EUZyF
	oQq//5XESxTf35OseIoCmRelVhUsl0MgNsbsPSYopX3oyJ5dLD05DCupsQl46ohEA1lxopYtr86
	g/9UohsZXerjCK7D68u5NsC+v4YyQNiDFrr2GeCOkKw0yi2t42CnLOPEEJTITunUcLrzebaffWK
	ZGgogyAQkMXcPSt5vHqwLKb+ZBWknJvfqX7FqscgTsXQJgfQROxPCL9mXhP6Ea3AHeGtnkpIqJq
	p+Tnlgt9f9DkJetO3K1jgvyLvanjlcnO+hJvxqmfjciW5Odu9JDUA7KK3CVxF1O9/JmO5SHNyWP
	UrZN53ZyTQpS9C51x1mMMNE0Iej3fsSULtTS4qqLi/Aae5w==
X-Received: by 2002:a17:903:3586:b0:2b0:b325:748a with SMTP id d9443c01a7336-2b281705e9fmr171104835ad.22.1775554324148;
        Tue, 07 Apr 2026 02:32:04 -0700 (PDT)
X-Received: by 2002:a17:903:3586:b0:2b0:b325:748a with SMTP id d9443c01a7336-2b281705e9fmr171104335ad.22.1775554323620;
        Tue, 07 Apr 2026 02:32:03 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b27478bc96sm172888365ad.33.2026.04.07.02.31.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 02:32:03 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 07 Apr 2026 15:00:56 +0530
Subject: [PATCH 6/6] drm/msm/a6xx: Limit GXPD votes to recovery in A8x
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260407-gfx-clk-fixes-v1-6-4bb5583a5054@oss.qualcomm.com>
References: <20260407-gfx-clk-fixes-v1-0-4bb5583a5054@oss.qualcomm.com>
In-Reply-To: <20260407-gfx-clk-fixes-v1-0-4bb5583a5054@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: YZEwyfihpgbC41xrTnHYmUfMYSFdlvqb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDA4NyBTYWx0ZWRfX3l1h7v51Vn2q
 1gskVIVhZrq5npo8xypFS/D/OwjA22wIWsC8gCx4nY5h/+6KBcQ+6wOneIvMYQ+Y1kaoEuYymrR
 lTrErb3KsUpzgaVxCqnxthANKjTqDNP4CsqZzR5kWaD2sAlg9tEuLvYh8fNIrGz6HwUZRLD6Jsi
 gPw/vovj1oPTC3RhEvBjEZ/HJewx9ilVkaSQg9SBjRI+7ZVOmgoKKEsXPO3FhSiQ6QerdutoiAO
 RXacWSF5uFUeBv3DZT0K0tP1jBwrMANU9mm4ZP3nDekw4+Wzv+2C9EcVsVz4lgVN3C5ybaEXdsY
 bV60jGhZBswICu9/V76cvxcm8XXXHpRErCGvYfKliZF4oIhLl64GZ6jzT9W1lAhbCWYFXZH6Whb
 P26APOBab9Py0rHp9bgHnJtQ+jDIvsajtFwKBejpn+rEeVKBhKYRAYcF7ImupB4Mqm1I/aRQCpk
 Wi+yLp9DRFV5/RwutTA==
X-Proofpoint-GUID: YZEwyfihpgbC41xrTnHYmUfMYSFdlvqb
X-Authority-Analysis: v=2.4 cv=D/d37PRj c=1 sm=1 tr=0 ts=69d4cf14 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=wUjT8lVc3dO_4AMqBZcA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070087
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102090-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,oss.qualcomm.com,poorly.run,linux.dev,gmail.com,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
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
X-Rspamd-Queue-Id: 8A3103AC0C7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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


