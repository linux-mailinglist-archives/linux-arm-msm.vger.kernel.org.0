Return-Path: <linux-arm-msm+bounces-94048-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AODCEfGnnmmrWgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94048-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 08:42:41 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 051AE193A9C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 08:42:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D5B6C300F944
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 07:42:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D96982FFF88;
	Wed, 25 Feb 2026 07:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EPYgKety";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cuh0t7gS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60EDA2F4A0C
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 07:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772005355; cv=none; b=VeEX2p3wZ1LPOnG4UtChNr5nrnx8YkiygFbQXjVcQ/C424wxFf3OeTsnfbnMBnqCJ4BImJwtOacWs3lqr6delcxrIcPpBKu8ZOOZDN+zjFg+iIqKEdpccrml+p4v8nIlxrxMPnJvu3yFjIuBUgocM6+rAxZsUecL72lhTA22hsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772005355; c=relaxed/simple;
	bh=J3GZ7dzqZ1AcdI0/dHMdYTU0hkgLk6CGn3qfq3mlT6I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=sPLHpqHksjqLO7qufGO3UMuyLnq2EvUY4xkCdAx//I6ck+y+/aadOxunfZixaSZK3mjP1NaluifKget0Ni61HVX/k1dJBNlkMKURI3vZGxUVAT4JqXiES+VkH5biyPO2fRK0bPEeWyioIsNggdOSqEOpGGILpPjhWDmW1vosIMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EPYgKety; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cuh0t7gS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61P18Uoq4150740
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 07:42:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=U+vqTvzL08oUPkG0pMAzCq
	HOh982jZJf7ubG7c1Z69Y=; b=EPYgKetyn525mInCE9ZPJUyzmns/5mZClS2JrU
	evfiJuNT+QjDexyhZ6HAu7+RcUf3YIbKAwOyVK0EQNTJ+pAFfd3Ds5Q7QfSdORF+
	jwOsEMgotIjP/97u/5nbUOiSp4qMmCpGUX/qh6ZTQzYJ3nJPmspYj/ihVMoqI+Ln
	kd3l/AsOx5ynFNRzNyWwnjiTIHP9Gs7QhO1gie4qYgwQkto5K1LxKzy9FKIdlRNX
	PMtV0pxvB5lzDcs5IsDnGoNJqB9EV31gmP7RZ6FPs2oUZwwmnB7Y+iLg6zCIMffe
	yDwL3zH6ul6apVLtepUOTo1n8FoDzlyPt41YadHC//W9/1tg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4chq57rwq0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 07:42:32 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-358dc09b43eso1682028a91.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 23:42:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772005352; x=1772610152; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=U+vqTvzL08oUPkG0pMAzCqHOh982jZJf7ubG7c1Z69Y=;
        b=cuh0t7gSHR3KUKtEWhOEVCSCXUGKfFsBLr0lfXx88Es5NQX7wKH8L5l34g5UB7LBc5
         S9oNZqt5G086QEHmulyse6LtCQoSVZN5SFfXgeAQGjPu00YViJLbn3onisz0MSXpT5oR
         70p8UySGyK+N9LOZGoA5571K6uH9IuPkQB34S7AAEitp/u667QTzXxZ3gC2MpOB4BQAO
         QimQJfrmEX8PMozO/2d6fPK2zHrBWwcSNo5RDKt6S/UOM/9bBj+9eB41Z0VM67R/wwlA
         7Dje8yVhGU24vbnKC4787y4FvoPmanSMPUR802FqumgZJhsGTr3Fx6JhhzD5dQCUPNLV
         y7WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772005352; x=1772610152;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U+vqTvzL08oUPkG0pMAzCqHOh982jZJf7ubG7c1Z69Y=;
        b=DvfZPRMSH5Ijp5ptJN1JaJMDiW7lXzSO4CuGHmFon5nL6Uk6gIrjMkefWxWSZNNxNR
         aw4tU5KLEbJwpoRI6xVWCq7gCWmE6sQEeGpB620CBlVJdWt4VoE4zRIuPUtBEgAmm5es
         MeU/dNFfcWJFSQi5IdmNAHlgBLqKtxWJcE5vR6pqdjwDptHmnXtZcNNumqJ/dFCv6zx6
         BEYpOZZ/gEJHkMU/C7zUWg5qSfoPtpyc2z8uzuixM2MTs1cBerEiY++LePkJBs84I/AB
         1rgPqKglI86zPi9I2SJ318xPRPktJoRARii8OQTgTMgQSBadAHIDrPkZcXML40+qyrQ+
         Cn1Q==
X-Gm-Message-State: AOJu0YxnwBRmE1v7vhdRiSFTz4CnWUUttOazAqOLmSBL5303HpWPGYqb
	ocUrmz5rM9aCGu/TmVgpullsc2oNWKLTuFBy6k8oMiN1l0O7cECJR1htMyhUd3BFenPVRIl+V0J
	F2IPjpouguuLWxD4hre2/T8sHbss9E59IwHlTffWf/SN/qmQxdvlZgqn2RUJuFxASuXojbSNc6v
	H3
X-Gm-Gg: ATEYQzz5/Qo3crX3cnI8/1kwyoEJXF1pbA/HO51kbt+5KAWCau2DjKrn9CsryLzU/R/
	mI0zprt3+gJHF8o7atGpfIG3N9F/49xVLc/CNKh5yQPVGBIog7hdX+0V12JD9jQZDa9/sbwTy8g
	rGvPj7a9YXD/+BvS/77g64NEzbew6oedK7madD8PrEWW/04uaVY6w9dM7azfKw4DbPNAjYbdfol
	tOB3sb5GqPKGfMbLopkUVL1ii4LhN0yqWq/LzU1FTa5tXWel/qq66h1NyIwZ0/DRgw2CcV02BJX
	rdlF3CBict5aDeTFwlAdmx13rugOKFH2EGM6ob5zCWyKI7d5Y/sKx65aclhEBY/OhrULlCtCE2D
	bIilSJ8yX+m3YUhIrVMffqCagE72W0BwZuojS9LXpiS1YLw==
X-Received: by 2002:a17:90b:5185:b0:340:b912:536 with SMTP id 98e67ed59e1d1-3590f1f3c09mr1234217a91.31.1772005351816;
        Tue, 24 Feb 2026 23:42:31 -0800 (PST)
X-Received: by 2002:a17:90b:5185:b0:340:b912:536 with SMTP id 98e67ed59e1d1-3590f1f3c09mr1234196a91.31.1772005351377;
        Tue, 24 Feb 2026 23:42:31 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3590158f91esm1927304a91.4.2026.02.24.23.42.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 23:42:31 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Wed, 25 Feb 2026 13:11:57 +0530
Subject: [PATCH] drm/msm/a6xx: Fix the bogus protect error on X2-85
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260225-glymur-protect-fix-v1-1-0deddedf9277@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAMSnnmkC/yWMQQ6CMBBFr0Jm7URoggpXMSzaMuAkluK0GA3h7
 k7s4i/eT97bIZEwJeirHYTenDguCs2pAv+wy0zIozKY2lxqY1qcn9+wCa4SM/mME3+wa9zNXX1
 L3WRBxVVI73/0PhQWem3azuUEZxOhjyFw7qtRAoYUzjos3nAcP4xza5mZAAAA
X-Change-ID: 20260225-glymur-protect-fix-91b8b7c5e9fa
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772005346; l=1838;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=J3GZ7dzqZ1AcdI0/dHMdYTU0hkgLk6CGn3qfq3mlT6I=;
 b=PoyQmorEsIc22SUrz1GbWovaZ8y+5pprIsoIsAOY0gtLA/IuQ9aPpSNQI0mWdYtRLMRHUDPFA
 Ujpy3kmfDWXDS0pf8lGrPQi018H7SvZOTgGGpnf/Vbed399bpyws9Ip
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=faOgCkQF c=1 sm=1 tr=0 ts=699ea7e8 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=kDI2okBShA6p0kcQ2G4A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: nOcHHJdB5nlHQEIZIHMCePBuUW8HgNcl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDA3NCBTYWx0ZWRfX2NMXQV/ifsQh
 ca90MEndp+r5XQwL8M42QgSFCrlX4pJNeusoqMGzcEfWVyOJO0ZQyYQYbLscsT83XoIpMSUVAnE
 r3Xh0I481SZhoASPs2eeu7cyFkQRIvVM3j5noszAUU99yt80XgeXrsYxsrLg2YpIToKEHK64/An
 zkmMrE22IFVQDyc5/IXtGg2BJnhxUX1DmjWdI0vuKibZMM8C43Hx+M7c1d9NO0jEVo2mY7QQbVF
 RNrvoIa1dJfjIM7reMQzxG6WFH1qMloD9mPR8KDoXBOF6YTGTQ1q6ucrcmdD7ErkYNmecBbyn1U
 Z9W9UR/g+G+5JMQxP7hu7wqK0Pqd/G9O8+iR8gAaastB5LIoNQ5b0Gqa60QB/Xamzf+UWlsS0ix
 vdT6+//Tp6kHJlV5JyMN3W4ZVdg24LVNMYhtJxx4BtcPwkPgMh12evFjNq7Dt/6vTQap5AaIbj6
 blQJsPdvwSFENaPgQMw==
X-Proofpoint-GUID: nOcHHJdB5nlHQEIZIHMCePBuUW8HgNcl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_03,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 impostorscore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602250074
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94048-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 051AE193A9C
X-Rspamd-Action: no action

Update the X2-85 gpu's register protect count configuration with the
correct count_max value to avoid blocking the entire MMIO region from the
UMD.

Protect configurations are a bit complicated on A8xx. There are 2 set of
protect registers with different counts: Global and Pipe-specific. The
last-span-unbound feature is available only on the Pipe-specific protect
registers. Due to this, we cannot use the BUILD_BUG sanity check for A8x
protect configurations, so remove the A840 entry from there.

Fixes: 01ff3bf27215 ("drm/msm/a8xx: Add support for Adreno X2-85 GPU")
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index 550a53a7865e..38561f26837e 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -1759,7 +1759,7 @@ static const u32 x285_protect_regs[] = {
 	A6XX_PROTECT_NORDWR(0x27c06, 0x0000),
 };
 
-DECLARE_ADRENO_PROTECT(x285_protect, 64);
+DECLARE_ADRENO_PROTECT(x285_protect, 15);
 
 static const struct adreno_reglist_pipe a840_nonctxt_regs[] = {
 	{ REG_A8XX_CP_SMMU_STREAM_ID_LPAC, 0x00000101, BIT(PIPE_NONE) },
@@ -1966,5 +1966,4 @@ static inline __always_unused void __build_asserts(void)
 	BUILD_BUG_ON(a660_protect.count > a660_protect.count_max);
 	BUILD_BUG_ON(a690_protect.count > a690_protect.count_max);
 	BUILD_BUG_ON(a730_protect.count > a730_protect.count_max);
-	BUILD_BUG_ON(a840_protect.count > a840_protect.count_max);
 }

---
base-commit: ac47870fd795549f03d57e0879fc730c79119f4b
change-id: 20260225-glymur-protect-fix-91b8b7c5e9fa

Best regards,
-- 
Akhil P Oommen <akhilpo@oss.qualcomm.com>


