Return-Path: <linux-arm-msm+bounces-108803-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KNPoDGrNDWrh3QUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108803-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 17:04:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C05B590709
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 17:04:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9C96230BC069
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 14:54:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AD5C3EDE4C;
	Wed, 20 May 2026 14:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HJz1z26r";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cBu59zD6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EBE23F4DFD
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 14:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779288715; cv=none; b=aZUR61wfyi6fm20ywRjRqsuBZWNXicB87Zb4ByqZZWg/mVL5uCj+C1SsSruJ8RXniylVU7Pe0TVZ9avJSPqydoi+W91jGUqKGBssZ3m+FqRQlvt9BvwBaFLBiAtWPnRfm0LvTa9PP9lwynZ9xg6Pjcewc5P3XlDO4mx63h/ulw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779288715; c=relaxed/simple;
	bh=BW3z4eXt9jEN8c9nQYgd/mUMJSPQ6cxnVEJl20A8eKk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kzUF6AOtHzFFt1XXS6gzOs9+wDikgv7SC15qqrOkPt3eAn9tiIPznGSh7KwFq+gapcTx7OUMGZBFFrtmKc9k7hNpIr1wESuizJrMiOxuawuY8VzBbN25gq2DtB+vF8o0vkJd9vsjgUFuaF7ICLhHI6xbVr6X9fy8rK/JvSvi6EA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HJz1z26r; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cBu59zD6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64KE6TB4118986
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 14:51:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K4BBNxAe0Vo4ZyzoRvicUmzhc+J3e3nthdb1jV77IEw=; b=HJz1z26r0pEKobRh
	N5ZVpUabHoZ48+25h6+5EMBOAaB9UVxgU7l6/gozTd8Hw65fn4iX21+tWIz22xsm
	i/tqZ4yoaVgRfVCPQLaLsjXxvc8D9VCsDMmM5Ngk85K8/NgGgox6jXB+7big1CRt
	TDo4cGOAMzsTc+RGQAVwPbaCO/sjHthh6Bj3sZB9Jl4rHjTuf20DkMoVpXiykRF1
	Ame4yb2et7bApPZVLQ/JIkxgl1T84QW4995QRgp1tEUNEa0aKU9OjoSpuBB/1CFL
	sDEr6dHQ9tml2LlzZGgKPfZ46rs6pnNJqdpH7C7qHFxdckRsrhbd+OEKClAeOmlD
	djriYA==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9ee886g9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 14:51:53 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-6314220f28eso11166305137.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 07:51:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779288712; x=1779893512; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K4BBNxAe0Vo4ZyzoRvicUmzhc+J3e3nthdb1jV77IEw=;
        b=cBu59zD67sy2rAwQlz+XIAKVLExhQxynynuBguPgYs507VPBS+AOB6vCp0nt1A1FD1
         VtOOAWxDdHcwd9FaLX9kHLnrGPGyGk24ZGDvDl9IPC755fjtYZ4vvAb99JBENXNUHcY2
         e0rvolzn+If/BD259qw7Y1+x+L0eucV31UJd2eiK3j5aWD+pJxtBJPVWb7JbAW5hKkm7
         lqvgbeaojnNRBdcW+nXVyRG6tL9K1X5LKWEf9IRRu7mS8r1RAAff6WWXg99NB6fmWKhQ
         zQIax/cLmk0f8dIDAVk/lMbu3biT3oAlP0Z6sAneKRV83VqI6V1fscs2O0TDbvXsmmLv
         o5rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779288712; x=1779893512;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=K4BBNxAe0Vo4ZyzoRvicUmzhc+J3e3nthdb1jV77IEw=;
        b=c6ZkVqBRQBNwJn2YnbUWTCHJz995fH7+6I3fnuTgJLQI/f2krPUhh3DIc665jM+YRE
         7p3IlsvaawsDF2oUZ+ISIFgWA0Vy8riyYVfcQE4j++UEQd7p0TSiMdCOK4d8Vvvfmz+J
         tr8GL+UOl56Jf7EuKqN3lr86gCsW2WhsHQrsfTHBt0lLp9v7Y/rAedUUaK+heRh+bSUC
         v7FiqtAaG4g7adKx5leOo/M4GAGh0Ms/EqejdglixQs+v43xgxqzZr8+FWZLhJzQvl/M
         XthZAFIInBhSPU+zZmDoF+ig64Ip6AUWTBcpkAKGM/VyjDXSfNHdEzzC+onmQ10RJMuJ
         QPKQ==
X-Gm-Message-State: AOJu0YzjdceA3MU4HM5idLbeO/vsFEH83f5cqpDzIJc8ZBjm1nT2BKHO
	6IgHZdorjoxSPPu1vnIoX0/pD8q2Cv8tKwzv7bfGDjG9mMKPpEcwjyYaJ0O0aBvzp5rVSNLrfkw
	gKvP40e8bpENb3/WhBG3INr+P3dEuUOpy5MErBfEQSdVYceuhFxHMABP5JoScKRHu5S79
X-Gm-Gg: Acq92OGo2mTVwRUEGHaujY3XsFqTaZ5l5HyRecDvDbP0edbnmXQNpgpWFUd/fuQQiWU
	t+mnCjBjgumKrYsGQo6Y5/+o3V4q/9qKNyVpZr01zbQsJSPY+IS7MmAOkMWGPQXNTSDshzXJdav
	TFTN4zfkg8CeNSFR5rFN53YDkocGC+PdanJ7KLlwovHfWbxaruxZeETQRchShexxmoqBvGATf4x
	Vlkf22ngEn+WOiQy86liSB2S+aJwwTObOt/ubCj1I84YeCsAH89VN82y9h2Rg1AAKtFZl5vn8OP
	P0+EWndS8E6r3JLI+1tQz7LtjgAzZiARHAckTFAH1GLdyZxpuC8Lzj3GvXgFuDIv6/HvFf4kwIv
	VuLsn3BcDiZb8cONtuy2GU2TCNfi5U1tCMMFoGbPzba5L5RE7hQl0XNRyJVuUR87tkxtZ6q9xUX
	FYzhpDR9BSv9pcf2sQN12seEzqSz29BROw+Sk=
X-Received: by 2002:a05:6102:4412:b0:634:eb91:695 with SMTP id ada2fe7eead31-63a3c801a1cmr14222496137.5.1779288712010;
        Wed, 20 May 2026 07:51:52 -0700 (PDT)
X-Received: by 2002:a05:6102:4412:b0:634:eb91:695 with SMTP id ada2fe7eead31-63a3c801a1cmr14222459137.5.1779288710884;
        Wed, 20 May 2026 07:51:50 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f10c78csm5128907e87.14.2026.05.20.07.51.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 07:51:49 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 20 May 2026 17:51:24 +0300
Subject: [PATCH v5 17/28] drm/msm/adreno: use new helper to set amsbc
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260520-ubwc-rework-v5-17-72f2749bc807@oss.qualcomm.com>
References: <20260520-ubwc-rework-v5-0-72f2749bc807@oss.qualcomm.com>
In-Reply-To: <20260520-ubwc-rework-v5-0-72f2749bc807@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2366;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=BW3z4eXt9jEN8c9nQYgd/mUMJSPQ6cxnVEJl20A8eKk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqDcpoKycU3HSHYK4pK2svQbS8VRsMJsLilPiVC
 l+gehuZI42JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCag3KaAAKCRCLPIo+Aiko
 1TPXB/4qS1tYjmNE0CLTAsPA24fES3n1dsid+JsBkf59+1D8nFIf+TrtzJP3DGCZKKTdHRlEMVH
 z6+AbIzKQ5cpst9ruJXHEw5yIPt5DYNdBVPJo8B3MYrc/IWjLLq+DQ9hU1HRrO5m55oh4PPLgJb
 gV9uvkLW/hqlVx6gVlriH1c8OV3XbbbBf9joz9+um+Lxk0LsB1I5aYEmjSft/bztemww/d98l0s
 rOETkwmvZqBa1ebqBovryUIMYYSGiJiEI7Uvmw9tUvs1tP1zT28sZJTuKgNfDzXqKSkbQoX3da4
 TvAMgb+eOChd6NpKJr+8rB3QzNquVVlKLN3icZGOKXathLxT
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: diAo5sa0hk94BXBa_SIqypJVxikgXrWu
X-Authority-Analysis: v=2.4 cv=e5k2j6p/ c=1 sm=1 tr=0 ts=6a0dca89 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=ZxXxw7YCAI2S9HbMwnMA:9 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDE0NSBTYWx0ZWRfX+BR4UQ57uKNs
 S6zRhzpeAOWY45/AAUK5UHxmF1RTDb9cMw2LIyuyA/xJbunL/FMSyTUqqOZ4Bzenx8yKN8pGpfF
 i8FI7VknPwOT45cVr8sKLrG93O3+E3lZlMsbcX1L808zm516kNZ3z4fFwcQckFNp8VT7tEsTrlx
 t7up4JoER/7lxLykW0WOI7oxKRN4XHVSRTSdbniqWYdvM0ZZdjNJsFcPz1NGX/2/nia7xDWWCc3
 AjMeZD6MuB3Ilq2qjffSJQJWKz3DG5cxLlW3dH+bY+gtHb0uJaLVUTYHnEUYAujoG7MXOEqdj/s
 WtH5IIczYTzdW7oHAHdSM3M5iSDNNvc809WeTe9dLCZKse7cRfHcMBFKJNBGxz0MnqgdpuJwRHS
 nqmdouFdt4b1zRFl/hDMXBoc9bDhFWF60fy/8KoaBjGJKwWNozT99s4U+QIX+iEdNR6MTmUi58n
 DJB/O62SvfmgKi2NFmQ==
X-Proofpoint-GUID: diAo5sa0hk94BXBa_SIqypJVxikgXrWu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 adultscore=0 suspectscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200145
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108803-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0C05B590709
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Use freshly defined helper instead of checking the UBWC version
directly.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 2 +-
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c | 7 ++-----
 2 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index e7a0d315e022..1c5ad3e83cc2 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -747,7 +747,7 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
 	bool rgb565_predicator = cfg->ubwc_enc_version >= UBWC_4_0;
 	u32 level2_swizzling_dis = !(qcom_ubwc_swizzle(cfg) & UBWC_SWIZZLE_ENABLE_LVL2);
 	bool ubwc_mode = qcom_ubwc_get_ubwc_mode(cfg);
-	bool amsbc = cfg->ubwc_enc_version >= UBWC_3_0;
+	bool amsbc = qcom_ubwc_enable_amsbc(cfg);
 	bool min_acc_len_64b;
 	u8 uavflagprd_inv = 0;
 	u32 hbb_hi = hbb >> 2;
diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
index 867c7d05f670..5c73a9ebb22b 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
@@ -279,7 +279,8 @@ static void a8xx_set_ubwc_config(struct msm_gpu *gpu)
 	u32 level3_swizzling_dis = !(qcom_ubwc_swizzle(cfg) & UBWC_SWIZZLE_ENABLE_LVL3);
 	bool rgba8888_lossless = false, fp16compoptdis = false;
 	bool yuvnotcomptofc = false, min_acc_len_64b = false;
-	bool rgb565_predicator = false, amsbc = false;
+	bool rgb565_predicator = false;
+	bool amsbc = qcom_ubwc_enable_amsbc(cfg);
 	bool ubwc_mode = qcom_ubwc_get_ubwc_mode(cfg);
 	u32 ubwc_version = cfg->ubwc_enc_version;
 	u32 hbb, hbb_hi, hbb_lo, mode;
@@ -288,21 +289,17 @@ static void a8xx_set_ubwc_config(struct msm_gpu *gpu)
 	switch (ubwc_version) {
 	case UBWC_6_0:
 		yuvnotcomptofc = true;
-		amsbc = true;
 		rgb565_predicator = true;
 		break;
 	case UBWC_5_0:
-		amsbc = true;
 		rgb565_predicator = true;
 		break;
 	case UBWC_4_0:
-		amsbc = true;
 		rgb565_predicator = true;
 		fp16compoptdis = true;
 		rgba8888_lossless = true;
 		break;
 	case UBWC_3_0:
-		amsbc = true;
 		fp16compoptdis = true;
 		break;
 	default:

-- 
2.47.3


