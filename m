Return-Path: <linux-arm-msm+bounces-97238-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iGR2M0vBsmmvPAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97238-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 14:36:11 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 71F98272B2E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 14:36:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 59B57307A12D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 13:31:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D84E13CBE85;
	Thu, 12 Mar 2026 13:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DMp3EMPh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GIOuSIqR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 829BE3CCFC4
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 13:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773322205; cv=none; b=WQs5og4LmgK09xDVjIjNSbAziRun37PryvhQkpcfle6GOELEM7z9q6zF96sac051YHz+ThDQLzMhkOX1D1+pcgQLNWv7uwPP1Rt1ZoTIoNQnAVgxqBu1ZyQI8v/KDbze/iKT/lw49dykTQ+HfcXBoxhjeSjBYq5PpVE7HorTa6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773322205; c=relaxed/simple;
	bh=hheiMl8VJ8rTRpyUKrTSw/T/7nX7ElA8etZcspaY4GU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jx8Xd7RNdT4Jvk8pajV0nlP6QnjYSd9NnXxmhDEJnz1uFLlO9Lg1X15BntARdZ561yfdLKKZFGkMFITTG75fOpc7ADnqtnIhIuKN7PfJRMb4H5tWUtCMzsll0Lb850NU6aObP5Y/KQUynSoIMeq5D64Jgg8oTNDxqLdYt12XFkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DMp3EMPh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GIOuSIqR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62C9nAQK263530
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 13:30:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h4ycaMV7nlSUQ5du4YcIwqCqGJ98D+lbtRqht+ED2K0=; b=DMp3EMPh8cH/zFJY
	yi/3ISCFm83kJOxjvjsEx+ECAD0V+iHYp+UDVd3y958Sk9/1vDct9vleEJF0FZMH
	pI160iOlSkzLIqqGSg7cJIHE0uG739yDRBXaHwyT/iOw78oq2kipQVdrPhXiHtk7
	1Uwzg3l+SHsSF1lVmxN4N/VHCY2fwd9Hpnq1+QDnrMpS0qGNnFBMfFpZT/NsQaAc
	i1OB5vs7C+/cpC7CDkEi/L9eOC1r4hpJJhwldHZVO/UNwA1KCh8YxMw/jngKL+k8
	U7sx9SQtiaRDMXBcsZjXFrXhfoWsuNfHbSgSUhpFX4gyYDiEwH/Xm+jxoehWBQfe
	gc5oFw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh4yj67h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 13:30:03 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd77e5e187so529010985a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 06:30:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773322203; x=1773927003; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h4ycaMV7nlSUQ5du4YcIwqCqGJ98D+lbtRqht+ED2K0=;
        b=GIOuSIqR4Y35bz8ZLvPSLT0/N/p6OmHurGzpUJTSxH36o6PrACABtebJIC9vaZC4ae
         Lz9FLyU7QQbO9CTC2FCV7zz85B4Msleyd+yubr5UwcHXDJENSKyAq1umw7e6zoxlnjAt
         3Pl6K84LbmbSyxsaFrWOlKE0pZD340w9rHWz7HvUgMFzD91VOk4+J1McEmo6tYYFShm9
         oc9NzikJoGdx/UteiwO3ujnM+f4xCJ1/dCcXck62ZhpFIkvb5BVnqCQZegmmftIU45jx
         +4VeVK6Gwg0ra3bHOxNGsqENDWqZXgdLBDJdM6S8B0V5clMqiBGahAFeTQS6Pf4K5Sks
         +OEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773322203; x=1773927003;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=h4ycaMV7nlSUQ5du4YcIwqCqGJ98D+lbtRqht+ED2K0=;
        b=Wkb2TaNX3pMKgde67KdGtvJluMgN6aixqKEFE6hWpVx/vMyE+82mR5NBXsu91Hieiw
         r9cZq03lNeivXG3FNi3SgVW4Sw43wkxkJA6IsVNPuMo29d40IK1bNDWab9W4dhZlfTWN
         6WhBm3OPfD0zvYw4J34jr/hydFh4cxwl46akXku56NtzV2oMB82po34wrnyTq3EEzLDx
         W0VBf6UGlxte0HhUdpu4Lh5TpGxsS3RuQ/4Rw+qKsSLlBO1a423ab5sW2pn6ahKtZkje
         LU0Ut8Wzc0rOX396IzUKVQBGRBvJlxTxjmxPCF3gDI5mpXQiu4lg0cSvn0hZH8c7c77v
         YJFA==
X-Gm-Message-State: AOJu0YwHf7roGhNXVfr1TKkcw1uP4XA/RVV1ka3VtyKwwzF1ZDWqjoDe
	fSnNOvXTuTBVRstFOrsnbb8Ly1vd4VEu40xhpoEPhh+xIkWBgdYiwW1LT8QG8NNuXjUseC1QRjH
	ra2V6g++mwKrjvQagUfsGy4MyoTpgzCn9gXmR0WrQF8ICrO4CXz+w283FUWFc03xsr/GG
X-Gm-Gg: ATEYQzzq4aclwfm0i4ecSmia4TPJ3yLNhKRIdx8qLSreF6BG4TToHZZKbSHRw4wmgdZ
	mw7s+CPrnNpSxkGHZczO7yuY18OYo2jV6BRzdYrKJnWm9fPjWUW9o7Wk12oGqk80bM5x8SeqhD5
	XhZiGdLUKQN3gPqIGQIGKTy+wJVkDgw/BJ5piV62jwwmKyMvZoLEnObRZpH73H6mkE81AdB3xhr
	jJGY/wF6zH4o04GGM9DZD6z3x2OeUUce06bYWZwtDE2NUKDSnOpKxwHVhnKAIYiIzzVwiIJa9MC
	yN/1lC2OMiBKxA1UhZJAoMtxWRU6W+9WC5xNp9JdEJd6teMrt9n1Mf+th+qoRrtjipZX4vhCaGf
	qjP78amtq6ZRdn2wX4ux5gCCOz0o9g42Mp43W+cuicR0ryvQr/M7o7C30laLYmRVSPMGPsmU2VT
	l2E7yJPUGapvqwg9+ywL9ZW7rUIJj3soFlR2E=
X-Received: by 2002:a05:620a:459f:b0:8ca:2a02:dfd5 with SMTP id af79cd13be357-8cda1976568mr766526685a.30.1773322202943;
        Thu, 12 Mar 2026 06:30:02 -0700 (PDT)
X-Received: by 2002:a05:620a:459f:b0:8ca:2a02:dfd5 with SMTP id af79cd13be357-8cda1976568mr766521785a.30.1773322202315;
        Thu, 12 Mar 2026 06:30:02 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a67d617e1sm8646671fa.9.2026.03.12.06.29.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 06:30:01 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 12 Mar 2026 15:29:39 +0200
Subject: [PATCH v3 18/27] drm/msm/dpu: drop ubwc_dec_version
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260312-ubwc-rework-v3-18-b7e8f800176a@oss.qualcomm.com>
References: <20260312-ubwc-rework-v3-0-b7e8f800176a@oss.qualcomm.com>
In-Reply-To: <20260312-ubwc-rework-v3-0-b7e8f800176a@oss.qualcomm.com>
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
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1070;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=hheiMl8VJ8rTRpyUKrTSw/T/7nX7ElA8etZcspaY4GU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpsr+3daaSStaL8hHElPZDYT+zGkLHda1WcyhLO
 u7SDeCf1mWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCabK/twAKCRCLPIo+Aiko
 1XORB/wNUAQ5nNTJ9ijZ5rhBsfM1jo1v4fNzrUbKr52xNsNp4w+nxyLRFcetCNG7nrzLksYTbtW
 IfqVhLIgDZfr9acdUtP2TbPnHbnuKkrdDkfgXIb44Lccjuq2cmXgsKNWfJOPsOEUXLgx3KGt1tu
 kb5P8pR2YSMWti8t43bZBMIMX4yRF44qAIDytVB5SCdENDhymNHFEmjqEJ3Yrsyy15tj6dN/fDb
 k5D+iJvr7T73ZtRM6ah4RUZL0lEI/3wAIXulWd60m2T7IQUhFG5WoYewujLft2KpJYJ/D7YemEY
 UaeSipoS11IoXIkdlqqZxKbpPri4ke+spdDUXbjZ74o4L3XB
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDEwNyBTYWx0ZWRfX2Xpdk8G5H6S6
 ePhmISUMHij9JAlapdvx1ukPD9lTl392WKdMEgk7qjruredQoeA984T6YSbAL7fCtNW+CbvBS3O
 3h/dzeqnp4EipeaJnVJiBqiLP/5QyUI7wETgJtUYgAbXj+ZpFvsrJFzfUmhue/9kUmUA4QYYuRY
 utgnkQtIS699umpJheSxGFdYJCRAEyMEHU9xBRIZBqIm9KMCrzAuG+U8JgGoK9qi1NJzXgK/1wy
 pM592dnjZR3xEf0DYAKGiXj1pqnmkaabFrUzUS8n3JgcamtQlY/CvjYhci1oTR7aY5hLvzei/Hg
 JsEvvgmXBnpULRTug27ALyHaxkAcKVXNlTFIhcgzCx1m+Lq0NHiKChn7uCcYIO9W9a7T1d2wKi2
 w1H7t4H00ocepDY5FAoetBfCfaLXxw5n9qy/fno2J7iUNsHCaFm2ruBLBs0i5i2jQZfyMvafLKR
 TWII2z4LIUSMpm+X3dw==
X-Proofpoint-ORIG-GUID: i5SElysK9zZQ6-nOSmp8F9as8HIJTINU
X-Authority-Analysis: v=2.4 cv=C+7kCAP+ c=1 sm=1 tr=0 ts=69b2bfdb cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=OFVxzADIxEWc22agC70A:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: i5SElysK9zZQ6-nOSmp8F9as8HIJTINU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_01,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 phishscore=0 adultscore=0 suspectscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603120107
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97238-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 71F98272B2E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Stop using ubwc_dec_version (the version of the UBWC block in the
display subsystem) for detecting the enablement of the UBWC. Use only
ubwc_enc_version, the version of the UBWC which we are setting up for.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 547d084f2944..f424be5ad82b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -1718,8 +1718,7 @@ static bool dpu_plane_format_mod_supported(struct drm_plane *plane,
 		uint32_t format, uint64_t modifier)
 {
 	struct dpu_kms *dpu_kms = _dpu_plane_get_kms(plane);
-	bool has_no_ubwc = (dpu_kms->mdss->ubwc_enc_version == 0) &&
-			   (dpu_kms->mdss->ubwc_dec_version == 0);
+	bool has_no_ubwc = (dpu_kms->mdss->ubwc_enc_version == 0);
 
 	if (modifier == DRM_FORMAT_MOD_LINEAR)
 		return true;

-- 
2.47.3


