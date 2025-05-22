Return-Path: <linux-arm-msm+bounces-59116-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 469BCAC1459
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 21:09:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AC22B17062F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 19:09:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 391D32BEC4A;
	Thu, 22 May 2025 19:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KhpLG+sq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0DDF28BA98
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 19:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747940649; cv=none; b=Sww+vpLnXk5GN7hEWklqvlQVnG9+oEAHAvaQSmKvapDShOaKtxA86fr0MAeAY/gHdMPRF2pecxPwS1z6wRn9qMq8fHwONbhsf9GJC50TLI+vSStdEysJZrTe62J0IdQ4c0A5VOmqBS2xA4Bifnx+iULLCTpTX/1uBc0GVBhCWF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747940649; c=relaxed/simple;
	bh=BWvuJG5du6uXeVO2i4s5QVwpOOM2vebWTzYrE63jd94=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fLF3mmwHWxuAiuugir/cCXyGodcIZsJ6nxoWwWGTbF2lnMgb70lFcQyE6Zo/dOvU7ZITSFuUI7PcOy17FXFpKpBh7hSWqjFnvIAvXKH69KiOH3J12nm7X0Ev2dTDEE4zhaSLSvVoOxcuWZNFze/zj44zk4ZsBP2Hanv3sSqDKu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KhpLG+sq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54MFaU6x013427
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 19:04:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	520oFGgAVIHzUGYZ4vVIsy4Q9fI3b2Y3ZlgCsgK2yUc=; b=KhpLG+sqWiXdcRLC
	BWyw2duimxDxkvLngJpTkpPY/00G1Wg9QUTYOT4JgSn8PuRUl8i0VwbnBVX0Abeu
	95MCov5VQ2xoH997/J/6O4Y+ZK+X27769+ZYtwFZ3SRA2IAQgAtz38TIwFRLfIMK
	pcfKyxThBe/cpR6h8vGrE88eAyYNhVQuBaYm5IJmMCEYT3fJMiF3uZ2Zyjj0/0K9
	4eMPckThdV0Nbc/l1o4tLlkY/Fa34+ci7Uc8dM2gZBJHwVO6nYp8DYO/tBdTwMIa
	K3zP3LnByqwPNpN9nJytwAbZesjgGc/B5CS9JeMsALr0ftkQToaxNIPlFzxIPV7U
	TRAPCw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwh5fnpq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 19:04:06 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5c9abdbd3so849422585a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 12:04:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747940643; x=1748545443;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=520oFGgAVIHzUGYZ4vVIsy4Q9fI3b2Y3ZlgCsgK2yUc=;
        b=k1zEeJsDvtBADx028JlNkmUNoSdrHcUjIqKWFR2D1KaeZn5hA7S9xifr2Ck4A4aO2T
         QzIsp9O510ESNWbMFgfHu5Nf886SQYblF4EVqfOcKf8MrGi2Y0MopIqbHYAAHmlZ3Rl9
         h1O1GiB8V0umezfLweB8AlszLZmTQsEGuFTmzz7+TV+u8Q9Xj+VupTQzm4nRmFgD5m9z
         Y5UqhVjLl3EQM97I0pYDW4nf8yAosCteZqgAyetxAIEIxpgemgbg9MaODV0WPriTh2lk
         /1LjSU+5boh3ZWjQDEJY0cLWXihcSFKpneOm5yxpibIQlf+hbnQRvrCKYOVV4YkbgGQw
         KS7Q==
X-Forwarded-Encrypted: i=1; AJvYcCWmJhxM2hDhIp03OJSNi2mOBaD7qjh7oRnN9U6s1OWPRgeEWxfxPYN9YHzQyAgMwenkuuwuYqlpug1hX/XG@vger.kernel.org
X-Gm-Message-State: AOJu0YxsqrQxr5oxrF3WQrci5Ols0HjXEPn2/Sq8y7qH/tDlGPhj2Wx/
	Go+ibvxyNAgPcuVPYyHLa5aEQxi81uzqBliCEfzQrY3b29z1c246VAQ9ISArx5Dn+R3ebD1w0ah
	DSHs6WJmPoTAYPXrU1Evj11KE8VTUqa42AOV6j6sjM3ZmoDgNwIjv3xNpdeBG/qt3Gap3
X-Gm-Gg: ASbGnctKIP/cML6WAh65PakQ9rpz8LlUsu8CfLq3TCtsKs0wa9g+ioG3JJnDhbqjsSq
	bOt5SlPRgjK6lg2XvDUjgmPrbMkP1XdkE9DW0kPvV238w62t38S7Hahl9vOmmNOw6SV1miL0dHy
	3DVEsfG4cCkFtdgwleHfUjASlUOyN6kCoyy5Bx0X5/cCxSMRuJvIttoinIXQmcrNrRK7FG8b27X
	IjQ61pdRFc+64qfpCX2Cf4j4wZExYV+BbWf0071yigcrn/pzPP9LRn15lweDH2/XLWg3m/DKu+k
	tho2j66hXv0WC1YzcBsC2pQ7oF5iwMwnBD6zXhr0xx+boK2bEs5q2obnKAeiNTLH1LqSnGMpHwx
	Ma5+iWEb1f+ljLgXqxuYswhgp
X-Received: by 2002:a05:620a:25c6:b0:7ca:df2c:e112 with SMTP id af79cd13be357-7cee326c929mr6910885a.45.1747940642868;
        Thu, 22 May 2025 12:04:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFzxquIY8HhNhqWCNPDmBe+j5FWdsACOdAapT72f/I0iKVGXenxbZCexTv1LjK3ndZUkz5kFw==
X-Received: by 2002:a05:620a:25c6:b0:7ca:df2c:e112 with SMTP id af79cd13be357-7cee326c929mr6906585a.45.1747940642445;
        Thu, 22 May 2025 12:04:02 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e703c2f3sm3482506e87.214.2025.05.22.12.03.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 12:03:59 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 22 May 2025 22:03:30 +0300
Subject: [PATCH v5 11/30] drm/msm/dpu: get rid of
 DPU_CTL_DSPP_SUB_BLOCK_FLUSH
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-dpu-drop-features-v5-11-3b2085a07884@oss.qualcomm.com>
References: <20250522-dpu-drop-features-v5-0-3b2085a07884@oss.qualcomm.com>
In-Reply-To: <20250522-dpu-drop-features-v5-0-3b2085a07884@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2781;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=R2pfqwbiufRy26Qr61RXns309s3JHy9UAH0Tqdyv7QE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoL3T95UgV39T4ep2h1SCm0PcapDyxtsT11KWVj
 05MDktyaQCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaC90/QAKCRCLPIo+Aiko
 1cgdCACccb8v+ZZmGPkgp6/u9+Y0q/lteJhu/gtu0N1swCzsf6TSIejBwxhN3hXB0QniQYc01ii
 olrJpEPhQMDysiBdkPLX4+xicK3NOFy5Fgw+HGLgxKfN4/4dYS6/OWqYcfBC5d0N/fGZ9mtqlBF
 CztSUKRQLC3wh7bkEjiPAcQwPn6N5Pcne2BobCrW7haNU4Fm3I2UMyoJ6l+N3gmED/NcyvjDQxj
 +mTdZnPle9yLLA9OII/QQGYyQ+rFKIZtNRxjs82zYbw0xFY5Yvkahq/OHH4M8ILYzdWcMMd6GTI
 zSCNJoTeh3AGRv5yiP/Q5A6tuXgQahGdG6LbOsOoAjpugz3O
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDE5MiBTYWx0ZWRfXxxSVyEDQ6fIw
 wh/mNjGk+puwJuG1Q2zsQbuaETfaXnPu5eSMCmJdY79Nh+2v+n3mmDQ1Ip1fFJWcL6TdjKb/HyZ
 eXs7YevnRwzzWkWa7XAAb2yD43Y1qIqMxbb82wacBvmS+mUiIIK23CqylSl8RrEuajd294mnOed
 +Dj7agK8M2gl1HzaApWMh3uFVI5R2hqaZR0ucYCpRmDGT/FjjN5WcDqDHaDuDT0DQYZ1mL7pPHt
 e90S5CdLxv8JJpXDFFeAPo6qA+zDQ9QFZ+G3gk1zUDo+9XjHyys0zuqosMMraAos449adwHC4s+
 LGJ++6naZ2Kl3YDkHAq3iAYcShjurebURyL+MNznpYL58rq6qKflrtuMULZsSSCqa8VjfEJKgeB
 D3PTY9fHaiagjFLG/6Y6oYwZwtvp6qLrWkbBz9VnC5PxvDvQEfvB5PZe3rf0ikNsU3oisAGL
X-Authority-Analysis: v=2.4 cv=XeWJzJ55 c=1 sm=1 tr=0 ts=682f7526 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=Yf7QHpgQJbPwferW474A:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: sJWwGfGHyuE_94e8y_oLgE0vjbNjgENq
X-Proofpoint-ORIG-GUID: sJWwGfGHyuE_94e8y_oLgE0vjbNjgENq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_09,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 mlxlogscore=999 mlxscore=0 bulkscore=0 spamscore=0
 suspectscore=0 impostorscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505220192

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Continue migration to the MDSS-revision based checks and replace
DPU_CTL_DSPP_SUB_BLOCK_FLUSH feature bit with the core_major_ver >= 7
check.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 3 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 2 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c     | 2 +-
 3 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 6fed2cce082c476c1f7f8ee683f2a6f3eeaa5231..19a859e2a1f80c2321789af4ec7c5e299f0fb873 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -105,8 +105,7 @@
 	(BIT(DPU_PINGPONG_DITHER) | BIT(DPU_PINGPONG_DSC))
 
 #define CTL_SC7280_MASK \
-	(BIT(DPU_CTL_VM_CFG) | \
-	 BIT(DPU_CTL_DSPP_SUB_BLOCK_FLUSH))
+	(BIT(DPU_CTL_VM_CFG))
 
 #define INTF_SC7180_MASK \
 	(BIT(DPU_INTF_INPUT_CTRL) | \
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 82f04de6300eca7d05ece3ac880c26f3a56505b9..1e5fc1d5873975189a1759212b8a6c6078de22f9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -133,13 +133,11 @@ enum {
  * CTL sub-blocks
  * @DPU_CTL_SPLIT_DISPLAY:	CTL supports video mode split display
  * @DPU_CTL_VM_CFG:		CTL config to support multiple VMs
- * @DPU_CTL_DSPP_BLOCK_FLUSH:	CTL config to support dspp sub-block flush
  * @DPU_CTL_MAX
  */
 enum {
 	DPU_CTL_SPLIT_DISPLAY = 0x1,
 	DPU_CTL_VM_CFG,
-	DPU_CTL_DSPP_SUB_BLOCK_FLUSH,
 	DPU_CTL_MAX
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
index 772df53bfc4fcc2ff976f66ef7339be1ae3da8f4..edb82c81b0a449b1a7273fc258961b9447be8d9d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
@@ -804,7 +804,7 @@ struct dpu_hw_ctl *dpu_hw_ctl_init(struct drm_device *dev,
 	c->ops.setup_blendstage = dpu_hw_ctl_setup_blendstage;
 	c->ops.update_pending_flush_sspp = dpu_hw_ctl_update_pending_flush_sspp;
 	c->ops.update_pending_flush_mixer = dpu_hw_ctl_update_pending_flush_mixer;
-	if (c->caps->features & BIT(DPU_CTL_DSPP_SUB_BLOCK_FLUSH))
+	if (mdss_ver->core_major_ver >= 7)
 		c->ops.update_pending_flush_dspp = dpu_hw_ctl_update_pending_flush_dspp_sub_blocks;
 	else
 		c->ops.update_pending_flush_dspp = dpu_hw_ctl_update_pending_flush_dspp;

-- 
2.39.5


