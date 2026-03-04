Return-Path: <linux-arm-msm+bounces-95327-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4E7WE8g1qGm+pQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95327-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 14:38:16 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B4F36200863
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 14:38:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 591F9305DA84
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Mar 2026 13:34:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FFB4383C89;
	Wed,  4 Mar 2026 13:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O/ztgHKf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KQQgQG+w"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8CFA377EC0
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Mar 2026 13:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772631296; cv=none; b=La2ZfpnYZGmQAAGbyKka/L2zXTN3IcQA6RfQYu0Pw6xxFTZZxoHFK2BI0+30os2zaMDxRlB119XQjE1bE/ow13AE3CJBSrE14tIMvDhky8qewLV8ige316qUUyBZ58emaIXA4UmUSD9OSNDBv1chzPbvo2aSHRvXNk2Ncxvhzjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772631296; c=relaxed/simple;
	bh=kD9iQZhrDCzY4iHY2Yf+yM62TAsQ6gaeXZOVKSytBo0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=E4aTd7l7E3rN55WpEXV6Z1vUaRthwriHmWzmKi+KU3AUSx4hj89O9+3oBqb3GNCm1N6mg8u/wKZ6x1F39YSUOUnlwHitgKqIIK/jYrcHxxYOCTMlMy5FtDBp9NovxGr+Ryt+T2Wk1i85Vhc8AEb8mEIk+sU2IHyNI13BOQPVpn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O/ztgHKf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KQQgQG+w; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6249KcLt1455832
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Mar 2026 13:34:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=HLipzHtNz0347Atzc2Kkxo
	r/aWoCZHXx6S5h1We9pxs=; b=O/ztgHKf4sJ3GTya0BMnCjbcEojVV8FLSJD2xH
	M4151s99hWeeXSVyNSzlWwWQh90oAFV3nS87YpxP+FPDVTtAouzfJMoHiLlTgqbI
	UA5i1HJoIXEsCKodTQnZliSnAJTYPKx7yEGog9jdpYuoLzn1R3lJ+bKnbUNyODAT
	ipUMU45gf+99e1OI5zpr5NKo0kHSj0rngNFA4w/eKKDlpPCyv7e8yU4G8nV1uYuL
	j6vmye3cfYq2PnCX9a+U31HJ8Z1vXUySRD/lYjGZEuiK+ZTEYG1sURVxOMaU1bHR
	sYafzXGiZOfS48NtA9WRkITrY+SkZ6Vto9WQq7Bwg4wpNQ7A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpj180qfa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 13:34:53 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c711251ac5so4213615685a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 05:34:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772631293; x=1773236093; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HLipzHtNz0347Atzc2Kkxor/aWoCZHXx6S5h1We9pxs=;
        b=KQQgQG+wPvZf1L9jIWbv512Le8pqj/U0ZNuNy3LvSj3Mcoext5Kbm1aE2AzMsl319A
         Ag4X3IWQDKsckxNrgBU1aSdqv5f7HHv6xqaK8+Zwut9509+wxtC+eB8MgcIlECrkHqGd
         4u4f14dylXLNtgLw8OkKCiTClbS0MmSrwVe//a9tU6VyOQBjy7FhQx7lSJbfoLxg/0Oa
         vmU38kXPdBnutWDEb6AXN18ZTbg4z/cmEqwN8xqLsFmlZoeETQ6/4NO42G47uncJZFR1
         IEHd2rlj7YpBff17FK8q8fdued9gq6O7dczASTRevOjTPp7AlYmLUUnfxoF+zficypst
         7S7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772631293; x=1773236093;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HLipzHtNz0347Atzc2Kkxor/aWoCZHXx6S5h1We9pxs=;
        b=iK8pPRfJCbfFRgLYkx3cpjKQ1GN1ziV4TIaHOxTPg5c8/KyAjSqKcBujio6POGs4Yk
         YPQYnXwiOY2reoK7VXqIP0scd/DCt10FZvlir82G6o5+yKmYY84RahR/TfrQ9o8jsLx/
         KZKmhKj3iIHLKTE4PDu09nKMArOyhmQA/gQJnckRjFMLWTDuDG94lLwCskAFxN8rGkpC
         9T+txWwkumJLGQ9k9UvwEXcBv0pt5wZdrA6/wzRxtECs5z/xc62n7KXW/dsJx+oyVn1k
         Yx2rMlUoh2AKfooA+J/gsvTn37EgStC0Ms7BAxFKwJFQr0VDwmbkG46vtEa4yiq8qRKv
         cRXw==
X-Gm-Message-State: AOJu0YxQeALvAPRiL8O5EwwvREkapnRYmkuS63NkK4MUAh2pAwkp+Bin
	VQjCljsgG+FRGZAAuJAFgmHC61aXZ7zNhCkc7MXSRIXa0mOG8QQmxNt38P5vU/ngircYpsbecVU
	6o2pFHZG4XGjog6wNTvhdW+gGy5weDiUT2FB9USZHzLUM0Q1JNegiDxUhhM1b2DJMg4Nd
X-Gm-Gg: ATEYQzwq0CnjIttIYZ7a9rndDA9G6D/zfTJA2D9XXN2BTv5cALmeQUaI2aCZ8ecgYj6
	mdP0EksNXW+n7py0tMLy/c8VZpI66zAKSR9zMYzyHMNcEzENKyE+7N2lLJlEYA5w42plrvjQINg
	F0V2uChs3OZRZYh+EJ0FxFK30cSEydgRDlaNhn6/Vh9YUkgPj8cNnOlYLiiwI6vCgcbQ+ZjTdbP
	0yIVfxHhpb3h0FXUj+vrp5s5NayUf3AT1zTLQPKBFdbw5SIiGo+rITN5wIw5OGvHWwM5x5BtmpE
	TC9awax1K1HVMVoOuV3AQU7skvKvVNxbwR25eJkgUS6ptErTqkjGu2lo7uZtA06ctvdxzSOYfoH
	htDPxwJ8GpaXgZoUthn5QyijWzZWvluCPha1NkhaqCUjqyY2HQTLgcXbH7r8AwBSHKel1yuOs3P
	ySFIOePXcedLAg7JppOYMlI4pRb3dHg/k1nqI=
X-Received: by 2002:a05:620a:460b:b0:8c9:f996:81f7 with SMTP id af79cd13be357-8cd5afcaf8emr196316385a.81.1772631292946;
        Wed, 04 Mar 2026 05:34:52 -0800 (PST)
X-Received: by 2002:a05:620a:460b:b0:8c9:f996:81f7 with SMTP id af79cd13be357-8cd5afcaf8emr196312585a.81.1772631292360;
        Wed, 04 Mar 2026 05:34:52 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a12e0c9027sm227974e87.73.2026.03.04.05.34.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 05:34:51 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 04 Mar 2026 15:34:48 +0200
Subject: [PATCH] drm/msm: restore GEM-related IOCTLs for KMS devices
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260304-msm-restore-ioctls-v1-1-b28f9231fcd2@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAPc0qGkC/x2MQQqAIBAAvyJ7TlCLor4SHaS2WiiN3YhA/HvSc
 RhmEggyocCgEjA+JBRDAVspmHcfNtS0FAZnXGtq0+hTTs0od+Si4nwfop23Xe9qa73poYQX40r
 vPx2nnD/PtDhtZAAAAA==
X-Change-ID: 20260304-msm-restore-ioctls-2a1792311a09
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2402;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=kD9iQZhrDCzY4iHY2Yf+yM62TAsQ6gaeXZOVKSytBo0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpqDT7RUX3NLufZ0XzdhId4k4XcUaqtMAx9YB+X
 2ukgNDM1IKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaag0+wAKCRCLPIo+Aiko
 1e6YB/9DA+I0kSqsifjh+vpUo4Lg0gT2NC6G3GAAgwINLAKvRXg2wdNEggQ1KY68yjXoVD2mT49
 dn+O11mRX9ph6tBpRYsHUB/kz6USnQdQi5wmuBM4MVj/w6a/LOBEse+/BDtyD9igyyrx9ANeRiC
 qHRF0Liii2oAUyjhGnLbNj/0C+WayA1b6P7FJzNjfA6Zbpoi6hq5aXAH6lGolOFG79qeWcRXGf6
 oc7ZGXlpNVYlTxdvgN3aZsCgaYhPDzeN1CCuADX9kvMp9hIeGXBnK4JpwCh/ymTztoSlucNcQzg
 gQI9OMK7kC2p5a7zu7AF2I9NuF7QXyueDHMj/sbjCk3s19ad
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: ISROpzpqk-JrquTSu_ztsaSM37qI7uBq
X-Proofpoint-ORIG-GUID: ISROpzpqk-JrquTSu_ztsaSM37qI7uBq
X-Authority-Analysis: v=2.4 cv=Ed7FgfmC c=1 sm=1 tr=0 ts=69a834fd cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=WIlXRQO1osv3555SrS0A:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDEwOSBTYWx0ZWRfX+Ox48+aXJQtM
 Hk2Wm8niAtNBXbFe6rMJDgypWJ4MF59co1hTRc6/NuGh3hQnG4EN9m0fVcIHw8Edp3/hcAIBvvF
 PpiPZBhaAG2myTk0zsxkTy5t4HEOHPgK22pvR0YVpPPOJbqqcYUBMCZxJrhENQ7hkciosjLyBmi
 aBiKTJbOy2Mqjf1FPaqykU9kMBVhMWB/wy3OI0+N7fg+C+Y9HyGqBybXtJmrvZz+AFTQNqhPfFS
 ww/Fjj13Qkp3pGvanc0S4yqU0ML+WqSc1vHbYtwsOXEJAVupzzdYxVKRfyuKZx9OW32VNkWv7oP
 4tIOKbbcCJCBwF6s/JZQE5yEQiTfJTbs8mxBCQgDER9T8Fy8K9ZN7C5yPg8aWWCYVSB1dUqKe23
 pY+acHAj5bYKhhYCfdVrbkkt9ln9+cZGI2lrvmEIh8AePv4898P83jSeDB2m9GlFtwyiF5duHbL
 uCrBMkggG2y8n93Mw2A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_06,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 impostorscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040109
X-Rspamd-Queue-Id: B4F36200863
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-95327-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

The MSM GBM backend uses MSM_GEM_NEW to allocate GEM buffers from the
KMS driver, imports them into the GPU driver (msm or kgsl) and then
uses them for rendering / blending. Commit 98f11fd1cf92 ("drm/msm: Take
the ioctls away from the KMS-only driver") dropped all IOCTLs from the
MSM KMS devices, pointing out the need to use dumb buffers, however dumb
buffers should not be used by the GPU for rendering. Restore GEM-related
IOCTLs for the KMS devices.

Fixes: 98f11fd1cf92 ("drm/msm: Take the ioctls away from the KMS-only driver")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Note, here I assume that dumb buffers generally should not be used for
rendering. That doesn't seem to be complete truth as Mesa kmsro on MSM
devices uses DRM_IOCTL_MODE_CREATE_DUMB to create buffers for resources.
---
 drivers/gpu/drm/msm/msm_drv.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index ed2a61c66ac9..f82c9a36a166 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -799,6 +799,14 @@ static const struct drm_ioctl_desc msm_ioctls[] = {
 	DRM_IOCTL_DEF_DRV(MSM_VM_BIND,      msm_ioctl_vm_bind,      DRM_RENDER_ALLOW),
 };
 
+static const struct drm_ioctl_desc msm_kms_ioctls[] = {
+	DRM_IOCTL_DEF_DRV(MSM_GEM_NEW,      msm_ioctl_gem_new,      DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(MSM_GEM_INFO,     msm_ioctl_gem_info,     DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(MSM_GEM_CPU_PREP, msm_ioctl_gem_cpu_prep, DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(MSM_GEM_CPU_FINI, msm_ioctl_gem_cpu_fini, DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(MSM_GEM_MADVISE,  msm_ioctl_gem_madvise,  DRM_RENDER_ALLOW),
+};
+
 static void msm_show_fdinfo(struct drm_printer *p, struct drm_file *file)
 {
 	struct drm_device *dev = file->minor->dev;
@@ -868,6 +876,8 @@ static const struct drm_driver msm_kms_driver = {
 #endif
 	MSM_FBDEV_DRIVER_OPS,
 	.show_fdinfo        = msm_show_fdinfo,
+	.ioctls             = msm_kms_ioctls,
+	.num_ioctls         = ARRAY_SIZE(msm_kms_ioctls),
 	.fops               = &fops,
 	.name               = "msm-kms",
 	.desc               = "MSM Snapdragon DRM",

---
base-commit: ac47870fd795549f03d57e0879fc730c79119f4b
change-id: 20260304-msm-restore-ioctls-2a1792311a09

Best regards,
-- 
With best wishes
Dmitry


