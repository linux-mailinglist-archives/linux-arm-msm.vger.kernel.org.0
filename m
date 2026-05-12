Return-Path: <linux-arm-msm+bounces-107213-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id APh1MlGTA2qP7gEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107213-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 22:53:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B056529A36
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 22:53:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2BE763037F51
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 20:53:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D0F43C8714;
	Tue, 12 May 2026 20:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OeVVG+Lj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OMFBdB/X"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0701C3C8733
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 20:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778619214; cv=none; b=kF2ESxaj9E8vLbzJ/vii/K5FUmZTuHZ/U1GXWSNG6VBc0RttGWtC2PIqVlM1pE9BqgL5pbXCUJnfZbj/TfAD3iffAJml4HsnG94zYNwV3Bpg3zoew3jpa+lqzJvqXr2cTX4ZWu92kahPVi2IEpGUW5yB4fFpYQiu5IDD25xYTXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778619214; c=relaxed/simple;
	bh=gXeWiA6W9piE+ObDgMzSw8HmOPRVkifD1pJGObyFyig=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kQGVv39Rv5DiiUWELVG058AXtGF2viocGPr82AXAfdz/EEZ9jkIjn3ftLJbmexpHtPzciuFZvGLkvNFXYtGBocnvlhiPe5cIuWNRH4uIa2OUpfUArxOV31Gr0WTGg5BgP2yam1jFw8fYqt4aRW/m4HD/GsQKINURb9a7qF21DdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OeVVG+Lj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OMFBdB/X; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64CGmj1t740774
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 20:53:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wf9Q8Tx2vrt+yE2FnC2WSG2BLgxkvQB3xumvit79ifQ=; b=OeVVG+LjCHYxyTsG
	s2PJjNJuFwmll4NxxgdmnFpJUBYIrOTPQlPogMlVwqlAzstpqPl0bYc6MG5QimaG
	mCw2T5HeVjtlTv3HSLrQueoNFtcSHaVbsthAnpic01M9c8hS953Ly4mcchQVdFEV
	rhK53gnAp8tqTfx9xB6dT6pXHnVMjbBiwKKfaj1g/KJKnLCQmZa2Ol3CkDA/pQLO
	w4WT2QPQ3flOBnT0BT+fR/79Ut0/fD6q7RJfJxT2oJ0tly3jnepBSxCWnmgGbjQ1
	g2fqbPAgdF+QahE9pwMlbl+LPsozhGejEUT9WE/gDWkaQsRhcPAjjECBGGe8Bfz/
	426xBw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e42rhtfev-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 20:53:29 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8386367b23cso4641630b3a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 13:53:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778619208; x=1779224008; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wf9Q8Tx2vrt+yE2FnC2WSG2BLgxkvQB3xumvit79ifQ=;
        b=OMFBdB/X4G1nhyuH1yihEhRSP67x96Xdm9NhluTeJELTP1iS2Gqz/v/kcxvUheIBv7
         y/rSiYzIyUawPBCQzeKPiGVZEJ405dR9uyagJ1TsdG7AyCCsbAOhECdvd2kwHg0rmpdK
         7HcnBclQw51Zwx3tRG4S2nM/07Lliwe6tMOmBbPpG/q2x0CaBbiA26rCdFPOVy8sNEUi
         LphgOWQLBsXdhwt/zyK1Y0Jm9pKrKE2HcrJIK6h4htAhP43mJYmHhGvPqQPpqk8K6Jgo
         cBhDJt6tLy0V0u93FPJKutRndv95QaxcDHZNAW0ydySvJcM5RJdnqfyNOJ0nwQml34kD
         27zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778619208; x=1779224008;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wf9Q8Tx2vrt+yE2FnC2WSG2BLgxkvQB3xumvit79ifQ=;
        b=Xp9Un8MTOro3UK96W5tH8IZzVQ6aODpgSH7jbZv/lTbckPO4oIZZb1jyZJO3VusQbz
         X1HJ5rU0jkyR7315psXLPwXXRGLpkXEphqvgPLRvHoIC7fz0BP93lYhdiBBSAGktqRSa
         v+1HsJLdHXeW3o7Zsqr/jWWsFyKq1tYhkJztvPoIW7scUFBbPZbGibmRg+Zt8RZmC+2S
         9ckpN4MhUOrCgEREjdl512bwFndKaEwgdPTPAAG5XCHnVnJ8o6YvH+ug9v+9z+iU8VuJ
         tIgayAcEjFKzobgRX8N3MM+F06rlHk/6pDlIxW5Vgy8VeKph13bHRa8wkJJ2i40YMApB
         BdwQ==
X-Gm-Message-State: AOJu0YwHhhrPHzoGJKBTgOdBwQ3KWJMGd40ZHgAGDI5VR+KpQIxZf6+y
	jgMs1WzHYhl9wmczaw27xMSW00KAazwQI9DhxPtiPoTGCcq7Y0pdzv6GQBj5z0Z3tuczMP5oz/1
	OBUQqg6+suFI338t/0CP24fE1G8pKGmlYq9pwKUoJIOBrRsTB4mL+6BEdQOEiCnZauThu
X-Gm-Gg: Acq92OHREDBjqfQdLI+e2c9gVEl3J0tWpkl+haT8aiynddM/tgGUYGoLDBZLfVx1A80
	/oY6DDK3JpLmTUI7snY4TvzgM5M6KsypnXEyyfRzDX0Bel8Uj53zan6P0VNq9KXYdg0DZyZ5Rp9
	2ee5Vif7R5k+WJeQP7KyoziT7AlpeDyZ2NwAdQJPRZHfhwhJau0usew8tERYoenw0mFyWDybBS2
	tUrSNY0RQH2lamT2+OmDy9PkQ8ZQl7sFrBsLCuWZ2pSM6x21fu5iynKcuTaJBfyXKKnI+RpeQSA
	q3LxK+HsqDAQhAsETjxLrqTih6WcP0/SiVNfC6+FQ7V5gGi3cV635ECnJ1k5iVX7eJVNK3+2GDB
	tYKzIdiodInBVxr6rWZyuNU81xz69h6pzoLy8c1Mbckem5A==
X-Received: by 2002:a05:6a00:3d0d:b0:827:2ee0:411f with SMTP id d2e1a72fcca58-83f03e910b4mr310254b3a.4.1778619208151;
        Tue, 12 May 2026 13:53:28 -0700 (PDT)
X-Received: by 2002:a05:6a00:3d0d:b0:827:2ee0:411f with SMTP id d2e1a72fcca58-83f03e910b4mr310223b3a.4.1778619207592;
        Tue, 12 May 2026 13:53:27 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83965945c1bsm25453004b3a.15.2026.05.12.13.53.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 13:53:27 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Wed, 13 May 2026 02:22:57 +0530
Subject: [PATCH RFT 2/5] drm/msm: Centralize the standalone drm device
 check for GPU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-gmu-sync-state-fix-v1-2-6e33e6aa9b4f@oss.qualcomm.com>
References: <20260513-gmu-sync-state-fix-v1-0-6e33e6aa9b4f@oss.qualcomm.com>
In-Reply-To: <20260513-gmu-sync-state-fix-v1-0-6e33e6aa9b4f@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778619193; l=2896;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=gXeWiA6W9piE+ObDgMzSw8HmOPRVkifD1pJGObyFyig=;
 b=jNm6AYPxND8Zd4dPFVsxuXQS2tAXO1YMWVaUgc2bEor3uuvHaEHqTnIyU1BQASaNPUYfC9EoR
 JlM8miS7CVUBxPAPkkYwGHkaGVmooKRJjvL4Nm9SYS4QJXly0UaVMaN
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDIxNCBTYWx0ZWRfX1r2SuLZreiKG
 ECJgi7s0tqskNAiiLJjNyE88oXigprUH2oCISH15M+PkbETxXCdtSNUqDDQ/WJBStwXDjZsVPU3
 LgVLq50bXEDv/Kxqv0gpyAQMKIgZkbrI0yKwtieJbFyStUqR9CSvDIhieg1p8WCa0hRGj5k4UMy
 qn/vQ7oQtQf0polNNdjxDlIV0JCfwNvBFF3lIvhZBD3Y6VPPe8e6aPWku7xrCJ4w0LO30jh8k44
 YnpDb0G4An9aCJ9WxALlBsYudnMppdF+eknThQOa3trvUW+UV5Hh/83PXrXGqSwZpNpTWpsFt1Q
 TyIbtAKlQhpDm9dLBJPt3l1dVaue7DML50HkUAhEgEfTTUpYS5UVBeb29XBbGOEerHnMOZF0VQ3
 /3mv1gF4bmkfh0gpoSqj0dhmmxwce704F77GLFoIgylKvQ26LaQP0Ik4WBIH2ZzzodfAJAKcpk0
 FsUZr/UQ6SXUulgYH9w==
X-Proofpoint-GUID: SpYMo_U_U859WR9qur9wfZKOAXIHABzj
X-Authority-Analysis: v=2.4 cv=GbMnWwXL c=1 sm=1 tr=0 ts=6a039349 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=Qn8wcy66etf9Ddiq8R4A:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: SpYMo_U_U859WR9qur9wfZKOAXIHABzj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 bulkscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605120214
X-Rspamd-Queue-Id: 6B056529A36
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107213-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Replace msm_gpu_no_components() with msm_gpu_use_separate_drm_dev() and
move the platform-specific check for "amd,imageon" into the helper so the
policy is centralized and reused by both the core driver and adreno probe
path. No functional change intended.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/adreno_device.c |  3 +--
 drivers/gpu/drm/msm/msm_drv.c              | 11 +++++++----
 drivers/gpu/drm/msm/msm_drv.h              |  2 +-
 3 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index 4edfe80c5be7..3052f3e36de0 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -271,8 +271,7 @@ static const struct component_ops a3xx_ops = {
 
 static int adreno_probe(struct platform_device *pdev)
 {
-	if (of_device_is_compatible(pdev->dev.of_node, "amd,imageon") ||
-	    msm_gpu_no_components())
+	if (msm_gpu_use_separate_drm_dev(pdev))
 		return msm_gpu_probe(pdev, &a3xx_ops);
 
 	return component_add(&pdev->dev, &a3xx_ops);
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 195f40e331e5..b61deafd02c3 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -61,9 +61,12 @@ module_param(separate_gpu_kms, bool, 0400);
 DECLARE_FAULT_ATTR(fail_gem_alloc);
 DECLARE_FAULT_ATTR(fail_gem_iova);
 
-bool msm_gpu_no_components(void)
+bool msm_gpu_use_separate_drm_dev(struct platform_device *pdev)
 {
-	return separate_gpu_kms;
+	if (!pdev)
+		return separate_gpu_kms;
+
+	return of_device_is_compatible(pdev->dev.of_node, "amd,imageon") || separate_gpu_kms;
 }
 
 static int msm_drm_uninit(struct device *dev, const struct component_ops *gpu_ops)
@@ -1035,7 +1038,7 @@ static int add_gpu_components(struct device *dev,
 static int msm_drm_bind(struct device *dev)
 {
 	return msm_drm_init(dev,
-			    msm_gpu_no_components() ?
+			    msm_gpu_use_separate_drm_dev(NULL) ?
 				    &msm_kms_driver :
 				    &msm_driver,
 			    NULL);
@@ -1074,7 +1077,7 @@ int msm_drv_probe(struct device *master_dev,
 			return ret;
 	}
 
-	if (!msm_gpu_no_components()) {
+	if (!msm_gpu_use_separate_drm_dev(NULL)) {
 		ret = add_gpu_components(master_dev, &match);
 		if (ret)
 			return ret;
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 6d847d593f1a..6fcb696ceb7c 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -555,6 +555,6 @@ void msm_kms_shutdown(struct platform_device *pdev);
 
 bool msm_disp_drv_should_bind(struct device *dev, bool dpu_driver);
 
-bool msm_gpu_no_components(void);
+bool msm_gpu_use_separate_drm_dev(struct platform_device *pdev);
 
 #endif /* __MSM_DRV_H__ */

-- 
2.51.0


