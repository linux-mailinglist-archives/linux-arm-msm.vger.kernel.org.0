Return-Path: <linux-arm-msm+bounces-56948-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C1DBAAC4AF
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 May 2025 14:54:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9EAC3189AA7B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 May 2025 12:54:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BC728F5E;
	Tue,  6 May 2025 12:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QdkUrvRc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C585727FD66
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 May 2025 12:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746536034; cv=none; b=JVvvS6MqZRVsP7a5aoIC4rNmEyENyScuYiP5ELqLXjkTQ/f/FKc4KiAyzjafiWnTNWBv4ja9xzQ7R2I5kNhf6uUjGs6AMaUzeZKCP85ItD6pdrI74d2YTNRyRiqQILQ9jxUlJuG7von7ANAfsAr/HA1u8bYusacYQrSTvhCL6+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746536034; c=relaxed/simple;
	bh=QNUblXVSMmZgL7JmtCsIII2N/2s3Wei3lTTLIoLz1yg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=g/LAc+k/EhV6Yt0OeAbnvAxHmb949x6zuue1xH3S/bEaIK0eAhVyfqlA5/MAojAq9TzZsMBhEXR1E5Sk7cMtS0qtqnUH2kLSFISXLDZRMRZ+tu4YBuyrPNOUU8slU1lzKAGJYPowQ24ME9kPzJwPXZFOplMw03+b2fvMYYTmohM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QdkUrvRc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 546A7MYT016506
	for <linux-arm-msm@vger.kernel.org>; Tue, 6 May 2025 12:53:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=AgmcAWolgCiPWNjO4wriq7
	aohKZcAwprjCNfGs2zXa4=; b=QdkUrvRcGUMl+tnKigTOVSVpUZ/sKfBbjRwWxV
	sTqicwSp3duCZaLX14bY4RySYzPhFK1/BRTSlQx+06rKhJmSlkrf1hsN0uN8Dd99
	ox4EWtqD4aHmbhuA/t+duN+TeFo4Skxv6HXndvSFitGvCOtu8qAYFxZamz25F0H1
	nCKPevvnQdSmr/RykTyHyBvNjXO/n0UNBIQsQ2GmWkPqjCL8D/Qj04FEAhMnqCI+
	pRB1HCQAKb+JB1hI21Flw+yZZbiXHRxklOXGQVeGOzc6lTbT1AclMOM9ymR5N1s1
	j/hoA7+3r7snI2TEbPJ6OnbJgzqsdzU5TuHAW+nMPt2AT1Hw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46f8gv1y1w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 06 May 2025 12:53:51 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4766e03b92bso100301341cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 May 2025 05:53:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746536030; x=1747140830;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AgmcAWolgCiPWNjO4wriq7aohKZcAwprjCNfGs2zXa4=;
        b=kBU4ASNK6INnr52Ce7WqdTHJ+0xBOnniutF8oE2BovRYM2pS2mS4AjyAekxkCA3PR5
         /D0y2F/dzoxOjx0yPzcDiMqb7ICZm6VFJa7xVTjDsK+b9hA5Fv31Ct/AxP9Zt7Eip6QP
         1/8Z7254iA1JvUDqBOrv4jWrHi6fSv2VjeeO34BGInvp7uLNheC4QdzV8sWyZ6pfTIhv
         43pbRivnR4L/wqVZMNpzryCnn29nbS4gN/JeTf2eVfvWfGIJ/6wPAkMQ/xMbq68nC9eH
         OgLbxk6XPgtbIZCCqOgXgXvrUzZdiOnRSTKrcnAbXpGLO8dYh7LT+rkPRJUAM2mncxTz
         XZeQ==
X-Gm-Message-State: AOJu0YwzZ+vA+s6i74xNGwlRoW83I0KslOOU0Vy/H8JjuujTGIe5rYbr
	x2HLey3i/+elPtdREMnrKFnJJGqQ6ZBn2kH0VS28GfnSQz4Xwv/9n623ZaAkW5MfhC7VIzqGrcO
	bwwTMWd8QwVwM24M/ghsgBHjzubZwTpxUs4WPIpN21YsEFc7VsoqR8d1bvv7EgPVF
X-Gm-Gg: ASbGnctH/2bZGrz9KocNDMp8N/gUscMy+A+biHNpb/yWT+xOAtc360Z7pHtaQwHrCds
	5S2NjZ4YMTMTmuv8JIjZYnC0xidhyPyhyAgtmA1E2ZSkffaVcbDcdZzXEH94ZdJ6zYRuFLA4dJE
	802HJLGAvqeZzXOFm+/+0sUbcddSPcMjg1SQuspFiho4VatyHTLXohEQIO8ERZ2mHImrldpcd2L
	gR6Y9jB3zHybPE63tP0kqHkZOvsl/Zb4qASWtrRyz/w8v0ABwnaFtG1tqpkgLmBrRyk2k6NladS
	SbtRWbRb/lolha51rg/J1xK0Fi6gktOeLqz6CaE2LEZw3msKByD/PVwCiuftIKC4VbBBprUS/Pc
	G9yN5YmxA8rIhNdtWHu51OpAT
X-Received: by 2002:a05:622a:230a:b0:476:838c:b0ce with SMTP id d75a77b69052e-4910c3954d4mr48099171cf.13.1746536030547;
        Tue, 06 May 2025 05:53:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEXsqKKERRcPxEdrvqstmJGewVow5qWh99rnHUM6amWIecro3btKP0XXWIMwlYB2tixxvB4cw==
X-Received: by 2002:a05:622a:230a:b0:476:838c:b0ce with SMTP id d75a77b69052e-4910c3954d4mr48098721cf.13.1746536030166;
        Tue, 06 May 2025 05:53:50 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3202a89f22csm21568221fa.84.2025.05.06.05.53.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 05:53:48 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 06 May 2025 15:53:48 +0300
Subject: [PATCH] drm/msm/dpu: remove DPU_CTL_SPLIT_DISPLAY from SAR2130P
 CTL blocks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250506-dpu-sar2130p-no-split-display-v1-1-b619c0fddea5@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAFsGGmgC/x3MQQqEMAxA0atI1gbSamWYqwwuqo0akFqaURTx7
 lNm9Xmbf4NyFlZ4VzdkPkRliwWmrmBcfJwZJRSDJevIUYch7ag+W9NQwrihplW+GKTUX9i2lgc
 aXs50DsojZZ7k/P8//fP8APu7NDlvAAAA
X-Change-ID: 20250506-dpu-sar2130p-no-split-display-442eb0b85165
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1806;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=aCKhQ5Lb1Tbcv2cIcyI7sgot7I/f5b0mNTjY2gFri0Q=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoGgZcZXlpZXsBrmJ6mYd8gCprsu5r3HsOH21/f
 Qun5IG99seJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaBoGXAAKCRCLPIo+Aiko
 1fbpCACk67EUrszUXYFDfhykF/xPSvfXYmeLZ7SoRQp1KkTZCkL5HW/yZmgOCklEiDpvHlz5HeK
 NcACb+qSoOFki/bm1i8iau3yUYd5eIalGF5caokG8SIJH1wEqM4xVlvMfUvZQX+VMab31levnYa
 VD0cMGuGL8OcRbCErhmT6PRDfF2wKUC73lJhURmqpYC7zTOSO5hY/y9Bq+zJXaMUY+Gs/tF4Rmi
 YE2hNx4y6UXT7iAFRFEmJGjKQWAJViipg4pom/NW1ynDO9F0SPjnitUZInizwsm4sI3nGF0+BUG
 w2nIuCDnJHz1nmcSa1Xxaj5uSaHmvZU5ktNOu4cCRnfhxj+v
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=dYmA3WXe c=1 sm=1 tr=0 ts=681a065f cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ApOX_RYdNeUh17kXzE8A:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: T9gLDrPDShEN-_xZNx9JfHiMp7CBW0jG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA2MDEyNCBTYWx0ZWRfX3ER4aE1mFoNi
 /MJIVObO32ZoZxAroTegI3K4HEhgXTNzTdEnwO4N/9/tLdPuIiXQT7RW0H+CRu++nqOfLTinH5R
 rGUXvGfyTMMu8r/bng6hBs19B0gk0cSJQUPqhS95vB3NQGYANu38BiL76wOu6tld11wA450bz/Y
 Q+PTktTD/Ao+Lk+F45DqH039ePD0e/yeSilyqNjaR/tzaUqlQT0cGMzLCDDnxM6+I1zWTJKoGAW
 M1JyBqp8MGI1isp5zyG1+qoG8dP+cQ8vlwRVk9Ji9ZEXi2vj3Qu9KzHiyTvDiyTJepzu6syO3F2
 oI7Xp151vWIH6KYsWgY5Pz/fIlpX/afEKKVc2APHiIQfcyuKMizx2OaNPLGBOv/cCwaafVc91Hv
 fD+IN1ZoMJPZzNkTgqvC71FpjobhI5XJWY7AeFnrH8uNoCnY9w7Zj1o0a0HRVTzunIIT4WOc
X-Proofpoint-GUID: T9gLDrPDShEN-_xZNx9JfHiMp7CBW0jG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-06_06,2025-05-05_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 mlxlogscore=999 impostorscore=0 malwarescore=0 mlxscore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505060124

From: Dmitry Baryshkov <lumag@kernel.org>

Follow the changes in the commit a2649952f66e ("drm/msm/dpu: remove
DPU_CTL_SPLIT_DISPLAY from CTL blocks on DPU >= 5.0") and remove
DPU_CTL_SPLIT_DISPLAY from the CTL blocks on the SAR2130P platform.
Single CTL is used for all interfaces used by a single path

Fixes: 178575173472 ("drm/msm/dpu: add catalog entry for SAR2130P")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h
index 22dd16c6e210e9520ecb7a851bee402032fa1ee2..5667d055fbd1d8125c3231302daa3e05de5944c9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h
@@ -27,17 +27,16 @@ static const struct dpu_mdp_cfg sar2130p_mdp = {
 	},
 };
 
-/* FIXME: get rid of DPU_CTL_SPLIT_DISPLAY in favour of proper ACTIVE_CTL support */
 static const struct dpu_ctl_cfg sar2130p_ctl[] = {
 	{
 		.name = "ctl_0", .id = CTL_0,
 		.base = 0x15000, .len = 0x290,
-		.features = CTL_SM8550_MASK | BIT(DPU_CTL_SPLIT_DISPLAY),
+		.features = CTL_SM8550_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	}, {
 		.name = "ctl_1", .id = CTL_1,
 		.base = 0x16000, .len = 0x290,
-		.features = CTL_SM8550_MASK | BIT(DPU_CTL_SPLIT_DISPLAY),
+		.features = CTL_SM8550_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
 	}, {
 		.name = "ctl_2", .id = CTL_2,

---
base-commit: 0a00723f4c2d0b273edd0737f236f103164a08eb
change-id: 20250506-dpu-sar2130p-no-split-display-442eb0b85165

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


