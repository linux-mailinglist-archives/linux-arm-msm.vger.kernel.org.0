Return-Path: <linux-arm-msm+bounces-74013-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 48334B82AB7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Sep 2025 04:42:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 02F3A581871
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Sep 2025 02:42:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DE4321C9ED;
	Thu, 18 Sep 2025 02:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oAc84+HF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85879238C03
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Sep 2025 02:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758163325; cv=none; b=BbPp09Hp0RCaHXd7NKHmx0OoqJ1SJ1jXhMA4piuLQLDY3hakY+RS9fPMdbwAuxtnBuvtoljbzq5a1D8FE23WEwLIg9XTUrodfQPGynGO6c1MPjObBhroyprMCxMCdn77FxUSLQAN0QNS4f8NisFxwHlMRBrLsO2tkuyOnb+AsEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758163325; c=relaxed/simple;
	bh=vcPhLAlZIjQ8nYPWFC0ERVGh3IRmBm+uheguvXogRZM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=D+XY9JwMDF6vzYaoIYVxMA7Ztp1K0OATNEG8a1jSiwAXg0F7DH4hovCQC+hPDtGSP2Egp/yH+iOOVGCh9XaFcqiYeIFgZwsnysgo7aZMlOeDtQyy76AcTaK3b3FlP76Ph6cxvkTNzBg6cK9s/uraVBO/I8KQM0bYmGAj2Zp5kDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oAc84+HF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58HGFrHC027424
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Sep 2025 02:41:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=NlR/R4t6BjnegHrv08pGhH
	YCzQ6yM1Tm6ZRvAHgdasU=; b=oAc84+HFBrHJHffOIKpcEEkplnTXbCf9TPviB4
	pLcST5xnQh2VPXwlzQdY3jM2j3pPhR6t6N+0vFoaaB8h9Tfjun+x0fULU6oUmyUs
	dOhYIsOr3TAzG+I9UN/fooM3EC2gyQnTMX9aOyAUrjElCrlpYXpM98E8Da/Q+Vfn
	b++XMtjN8e5rY4xp4vBtU8x65eeHO4eqlIKIaCDVfexL/2xPMvHASt5WBvWtOXDw
	RIRGAkEl5H28yd0Qe8s4+rqptEY2pf+SxhTl8r4xi4fvi7Kd07K22/lq6lt6w/bQ
	G1MrDRR5PoFm4LNnUORCC1Hp6UXtpD3p3sxyyi9PWMImaFIw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fxt4nrt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Sep 2025 02:41:58 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b5ee6cd9a3so10265741cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Sep 2025 19:41:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758163317; x=1758768117;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NlR/R4t6BjnegHrv08pGhHYCzQ6yM1Tm6ZRvAHgdasU=;
        b=sSFCuHXObpxCXLtdsCM/kq8sRzRU2pHmNb4C8rJl6/aUsQWSIqCx9iKxq03n0YP/mN
         6F42C1CCNleQBfe1a5BggRfqa0ukUinwup6dtpmZJ9uaI2dHS1BcecdulNHz2E9nLUtz
         kpX+i7XSfz67taFgecsEg0SFF9dwQm8EbMtet35XzcA3apCwEsdOzxwBK/2YggNJTIkJ
         AIgIP3aAnBzA3EagMhSPxplVUvk9nBDXdtGEyFin9TFkEGbbdIsC5IcGhmme3dFJDUsL
         eqqsjj+PcPYNu3CT+Hs1bbHttxH9XhqrcYNaysAd7xrrYV0iOqEVab+0+Vl4Bs+N0fnI
         64JA==
X-Forwarded-Encrypted: i=1; AJvYcCXg7ZIG0ILifslAD5Ez8RHj0lMs/8xz5y0aApHt8CPkAnJWtonokUk2kz/RETG878szojJgg/QmOIaZ+Aee@vger.kernel.org
X-Gm-Message-State: AOJu0Yxf8UhO38KDxVtaGRC6eaIDOHsFB05IFPnLm+wKjDlak179JEkH
	Cx6AyVvj3WT4/M90iCgR/PFyVKr/rLqQDi+vmL6Ky1cXmRVdMczkLAuRgOp4lzuJI+E4A6G/+hY
	SmkVu8xiz/T6PHfa+HgpomUiSXqusUI0FF5+Kd8xAVaYtm8rIx0j5SkbBGPD1/OdhzWWe
X-Gm-Gg: ASbGncvN3KcyC9LiusXVUTto9bD8HhfcjTz2GVfmu6J4SLFDNB6ZefHHobi6UJVQ3uP
	ZP30WvagQQevB78TJTCsnm2QHkmz78CClV7OJjhlQTYdwfDJSLOcg772SeS9WVViV1UObI40Dkt
	AlsugkWubtaZe+d7v1Kk9DQuxsMirAI4sXknMokgpo/FFq6yuNCSOyZI0PwYisNlV1Lcwr6Hiex
	CZeDoYVRMHkutU9JiakmjtZowJDsDZHTFLNbuYS2MWj6IcIUkniIEXHMON0+t8FwFxjk0mY8OLI
	ZLHFhxMEwrw0/RdptaJpY8Dho6FZKFhy5azZllYeqVWUVhbJ2ZBu3l0GWr7K16Pi0f6toADnP02
	NdeikByp6fvHAxbmmO3QJhq8DXXoNMWBH8mBa2ueiYo5pj1wiX+FS
X-Received: by 2002:a05:622a:4887:b0:4b7:98d9:60aa with SMTP id d75a77b69052e-4ba6bc225a5mr54329551cf.72.1758163316887;
        Wed, 17 Sep 2025 19:41:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGr3s2G9NErkhIpml+NwAW6LKF5Msqi5VVo9rP8NPR7U0YesZ+V0R2KLsSk9CJbpd9SPl96UQ==
X-Received: by 2002:a05:622a:4887:b0:4b7:98d9:60aa with SMTP id d75a77b69052e-4ba6bc225a5mr54329391cf.72.1758163316437;
        Wed, 17 Sep 2025 19:41:56 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3624319eb49sm982201fa.50.2025.09.17.19.41.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 19:41:54 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 18 Sep 2025 05:41:52 +0300
Subject: [PATCH] sound: soc: qcom: use sa8775p/ subdir for QCS9100 /
 QCS9075
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250918-lemans-evk-topo-v1-1-9680600e62d4@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAG9xy2gC/x2MQQqAIBAAvyJ7bkGtKPtKdJDaaqk0NCSI/p40t
 znMPBApMEXoxAOBEkf2LosqBIyrdQshT9lBS11Lo1rc6bAuIqUNL396nDJNOWojdQW5OgPNfP/
 HfnjfD2bzIPVhAAAA
X-Change-ID: 20250918-lemans-evk-topo-dddd73c29024
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1641;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=vcPhLAlZIjQ8nYPWFC0ERVGh3IRmBm+uheguvXogRZM=;
 b=kA0DAAoBizyKPgIpKNUByyZiAGjLcXCiD5+oTP1Rpt1f992r+5520MEVrO32D27XR9hCNcC7Q
 okBMwQAAQoAHRYhBExwhJVcsmNW8LiVf4s8ij4CKSjVBQJoy3FwAAoJEIs8ij4CKSjV33UH/0Du
 iIWrEdfqU2r77SF6qSWMmz8eGRaO7RHHOMyxjGfrSGPFVIUEsBTFHkPhJVHIq6HYXUri6qIYzRl
 3HI6CyE98FwX9To5XEgycfitIwJF4OvMvehqRoQ8hGtqi7u/bWy6oTi7NrAH5MB5Z1suPXwYtbs
 A1ng3jFPEK9v45n7kMZyast8E1vGDOXXD1vQGuTZQORoAe8pQNP0FMI8iRSlRuS3sUoJY6zuej9
 TeTUv2ljHP6yY2TM+aOlYrRwbBu+dPbMoDw+ZeI3KwRXXVfe82oxYFZFUVZB3TINlxa9xRxUeHy
 JVlM3Yw7cyuC2rGuTsJiO6tB5/2E+iL2GZXUYtI=
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: QKqt5Yb-pa80nF7Xal8t9wD8MH2vXHN3
X-Authority-Analysis: v=2.4 cv=bIMWIO+Z c=1 sm=1 tr=0 ts=68cb7176 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=KGRU7LGiJR5Q1pf3Q6AA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfXwP0at3cvmcOB
 bAE76HiqB3w0iGXkfr1kYF3k+Nwt/slhMbCURQC8IS+q3JoDjTFHu0DPPMGrkvfQdNTq+BnLuPR
 hIInPy0OK0E+OvcduxTSRJ8Y77P1uO6Bgrm8ZvYWp3hZjJZTM+gXrg64EI9YvyT3VG7ZiAWNIMu
 OvdcomZwgFiplu5KWq2HM0Lp3z2hrJPbdYtmObfCsRqkliH3PgVsgHLXPuCQkYbO6BsjL4qOhOc
 av8Jq8lWijDwLNKicsHn+IE+KAPRNbawZ0wMHpqU+tgg1x9Zxalk2B7rcTRAcC75U06i6DD3URz
 AB0uuKO9mU5SBO/Cx4RCiGOvHkbn3MvETU8XXF1Pf1Dw8H6NgXZVaFLDxOX04+6gavf54qTRVVD
 HFCJoFoh
X-Proofpoint-ORIG-GUID: QKqt5Yb-pa80nF7Xal8t9wD8MH2vXHN3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 bulkscore=0 phishscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509160202

All firmware for the Lemans platform aka QCS9100 aka QCS9075 is for
historical reasons located in the qcom/sa8775p/ subdir inside
linux-firmware. The only exceptions to this rule are audio topology
files. While it's not too late, change the subdir to point to the
sa8775p/ subdir, so that all firmware for that platform is present at
the same location.

Fixes: 5b5bf5922f4c ("ASoC: qcom: sc8280xp: Add sound card support for QCS9100 and QCS9075")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 sound/soc/qcom/sc8280xp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
index 73f9f82c4e2581c132e6f6468740a33a6f2ec0c8..0d482d8eb1dd41a3a93d8a6d5cc4b419b8c45dbd 100644
--- a/sound/soc/qcom/sc8280xp.c
+++ b/sound/soc/qcom/sc8280xp.c
@@ -187,8 +187,8 @@ static const struct of_device_id snd_sc8280xp_dt_match[] = {
 	{.compatible = "qcom,qcm6490-idp-sndcard", "qcm6490"},
 	{.compatible = "qcom,qcs6490-rb3gen2-sndcard", "qcs6490"},
 	{.compatible = "qcom,qcs8275-sndcard", "qcs8275"},
-	{.compatible = "qcom,qcs9075-sndcard", "qcs9075"},
-	{.compatible = "qcom,qcs9100-sndcard", "qcs9100"},
+	{.compatible = "qcom,qcs9075-sndcard", "sa8775p"},
+	{.compatible = "qcom,qcs9100-sndcard", "sa8775p"},
 	{.compatible = "qcom,sc8280xp-sndcard", "sc8280xp"},
 	{.compatible = "qcom,sm8450-sndcard", "sm8450"},
 	{.compatible = "qcom,sm8550-sndcard", "sm8550"},

---
base-commit: 05af764719214d6568adb55c8749dec295228da8
change-id: 20250918-lemans-evk-topo-dddd73c29024

Best regards,
-- 
With best wishes
Dmitry


