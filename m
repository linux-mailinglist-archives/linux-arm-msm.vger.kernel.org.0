Return-Path: <linux-arm-msm+bounces-90433-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kLcWAU7/dWmMKQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90433-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 Jan 2026 12:32:30 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 46001803FE
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 Jan 2026 12:32:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A6E6F300B076
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 Jan 2026 11:30:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0047231A7E4;
	Sun, 25 Jan 2026 11:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CE8xiR7T";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cxJ+Q+RR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54C3E31A065
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 Jan 2026 11:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769340623; cv=none; b=EY6FBDzO1uhbbzSkQpdR9et9dfuUskQPKebYYGoznvWCuHZW/WwL+WN3/g06vwNEoCIXP5DgYtadwgvZ47rsn5yM5Q9wmh0GnecQyWH2efZ4EXG1J8vjVY9vkRj5/NjTUstz61FqjQNYhusqp8+OXTB/u3f4Yb6IfASCfVyJN4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769340623; c=relaxed/simple;
	bh=mcq8fy61nNX/KrrW1JUbvq89CB28wRxCq24uyk1o/ls=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fNgmy2I3peegmdyK5zLgAG/eALGjKnenwXGpwz+s42ribeq6f+8r/4UwMAIbHFrXF5rWzE/beIHMzPSZvtO1jiXb1n8rTjhFSA8vmrFusbFgRKEK8CNrA+yrobttt3st1EX7TZB3aCdY7MTQ2VebQZgOeYvoYlFdIL6u321lOng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CE8xiR7T; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cxJ+Q+RR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60P6UH4l2250932
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 Jan 2026 11:30:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bra7g2q0HW951sIO8bL8XJstduNpKmclsTNcEgSH384=; b=CE8xiR7TaaJDqZ4J
	ziv47uJOJ+TaOcmRJTU72saCxNT0x8JkgfqazW82hByDYo+4cGiCiFDmOEjs+qB/
	Cq905Lreky86WoHJhiz6/LA9FT4RZ7vfI4keZxwpERwZDtXbQurpUxjEaTFTvfy/
	Ly4SLD5xb6LmADuiMAkm0ej40mEYH2ZN5RpctpnOieVl8eNthUgv5YVifrbc1G5J
	0SxLILSQgbKY30vjsnJtaoQX3WizIKJpUgSvR6wxx3rp58IUCraFXrwcq2w5SMEs
	As9RLFa5icUple2qirTiEjsYFD5pBMw9YWLMsqyvx8ptwElEk2pQ2ia3bQw11raQ
	XyLPeg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvq24j1g6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 Jan 2026 11:30:20 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-88a2e9e09e6so176013216d6.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 Jan 2026 03:30:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769340620; x=1769945420; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bra7g2q0HW951sIO8bL8XJstduNpKmclsTNcEgSH384=;
        b=cxJ+Q+RRwTV9+/PxjfSWTdWYUH/wCL76ogacGHflz7IIp1iLvcVdzJBMN1/Ye30MGr
         5/lXzYeX2DqmpZDhkZHlFNbwSU+iSuwsQJezDKgr6HecEOB99GGHrtIr084RElNLwkIn
         /TPQ4pxeR3R/Pzj/L1EM5qu2VZjCqoOjztiixyYgJnzwGGctzNPTJoVJrfXdsoJ/I/AG
         S5i1RWA7g42Of48Xy/V56nZweglaUcFVhdHUpZ9FWa1CDJo4doLO4/yTAkuk6siQLnV3
         VEf+n7TXO5bAsRCtQWQy6+ULcdc7va5/jGA3JzX4y8RO5ePsoC+8qcq9KGUZhHi/8x0F
         gRQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769340620; x=1769945420;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bra7g2q0HW951sIO8bL8XJstduNpKmclsTNcEgSH384=;
        b=psfqm0KMMkV5d/UAFfp2BE000I9wXglDXJ8ObGjK6tUOecCRvyXVFw4cr3BKXDIXdv
         CyuoUP38bC4EH+B30bY27DTdXUWM+GVTTdQmcG2QebRDRqPXHegA5PiYO+p+nvMHiKnd
         JJk7vZ9GWwA5MCzq276o43cUGQCF1HGy6Dj+H1M3V/dZDvxkhuB11BYYQVaW83mKTpUR
         A3RBDowtuJrLLYZgEi9qVrKqsRGWi2SmUdij9Nr+uRlWnOrCmTNLpK1KMGHMq+LHhzib
         VtdpX94t0nPhHLiDYZUqXmiKW2rHf/BgIMZeO4IEkMIuemf9pmK+jgKXINuhhzN1S0d1
         5Nag==
X-Forwarded-Encrypted: i=1; AJvYcCWIFwEdCECDeJA9iC5QWModeVgvPtvowGTvjRe+c5XQjpETXhqRHWij5hVN/pC1R5j5CJHkrDtxkwlT3+7L@vger.kernel.org
X-Gm-Message-State: AOJu0YwxDMphHXNiM6BqgCuYL/qe3JHqzN8eajLIwRyqlIbpoJ8dzmR5
	V9wsquDFRFc6bJ8FaxTnHBLtk8MnKGhwBK2fBB4famcECVrDBvLxgQVoio2cU4GPbXT0/SDpK5M
	W3OcDwgndSEQsKzmkGhNTCeZjkC3no/OUS7TMqNnQK5seDawAz8fdOfMvJZN/e0Jwgkl/
X-Gm-Gg: AZuq6aJBHjwX5MGkAW60J3DR/uvc7cxuPoNIktgR9O8zM/6hUdubsQA5+81b+tl2BCL
	ow9sRpfm/b4vam3m3LNsXSHpN2+EgFtJkRU+8r6NcIdv4E2fjTz17q6aozCiCq/qUPzNQovPKEN
	PBYmy18l1V2aMsXcHCPldFbLyj7HOJNg9VXFTF+NdoJ11YA5DjqwwhTMex9Hn8lIfuvPJyYlT7c
	m/0kg/hF4VK6yFxd4ylTJ3omdDawPmDy3ysHp1yadl1+U52csbUCppwMuIwqpiKB2qDRK02Zt74
	+wvMdbYmdMjzzoUbbGnnfboqbDWPIDEnrKNAD4U0tklJgINCAhmCid1mLjklvmQ73sS3A/LAYYN
	jD0vdLoNJAZdXbtZn9gqYRlP6NMcmrf2vrfjcWiKfyNEtzq3+lbubL+tnlCTxSpKmfKK5tgSPjA
	K2CEe9jwpTczrSysbgVpVh4UQ=
X-Received: by 2002:a05:6214:2a4f:b0:894:6cb7:da9b with SMTP id 6a1803df08f44-894b0704cfcmr15283856d6.26.1769340619809;
        Sun, 25 Jan 2026 03:30:19 -0800 (PST)
X-Received: by 2002:a05:6214:2a4f:b0:894:6cb7:da9b with SMTP id 6a1803df08f44-894b0704cfcmr15283496d6.26.1769340619379;
        Sun, 25 Jan 2026 03:30:19 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-385d9fec3c9sm18583451fa.15.2026.01.25.03.30.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jan 2026 03:30:17 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 25 Jan 2026 13:30:05 +0200
Subject: [PATCH v4 3/9] media: iris: retrieve UBWC platform configuration
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260125-iris-ubwc-v4-3-1ff30644ac81@oss.qualcomm.com>
References: <20260125-iris-ubwc-v4-0-1ff30644ac81@oss.qualcomm.com>
In-Reply-To: <20260125-iris-ubwc-v4-0-1ff30644ac81@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3331;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=mcq8fy61nNX/KrrW1JUbvq89CB28wRxCq24uyk1o/ls=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpdf6+lbMPCjA0QH1RNMgeHfzcM/XGXqeAn260Y
 tAEM3hEHoeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaXX+vgAKCRCLPIo+Aiko
 1TzZCACNnMq7tmHBTPGuLTSr3885KQC3fdu23yrk8T2C0MRvdzQlP/1sk18N9Sd6NP0KzbVAAX1
 WCPn3s+1hDD4NQY32nuicuw8Kf6oIQ8XkNO0CQ25h7XccnNG0sLtw2M9mdZU3v+ecPFnYCPg8Vs
 UY4AoKkPk8Pr1a6sSGFDtK420ZuNFi7m1b/FtQmOWWLH/VySBCZSVaJkTj2e+hV0svQ4eboHe3z
 tR9wsMsp79LydD5l0hAjweJQb2I7IbeY52ULkS+VGJHTeyJ19XGAkdMr+hfz6U1YDNUvycoNFKr
 khUeQ98rp1pR4KawE37qqBNcIxxbPOvs6txmbcR1mOASjFwD
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI1MDA5NSBTYWx0ZWRfX+q0WS8QlFPhd
 u5FcgRGyazyfEtaeCyFX0HbYmp3rwW8YC73H2p46xS6cpAF/lE/uBneZ3gJc9fbQQFQLSstMYvz
 4BVFqIqvESt/KveqZNCVM2Lyqr6RZRPBShgXq7uurHRL+yEx5SMu/4wXiS4yFZX/eKeP3yosRHj
 947gK0MY6RB0rqEam7WrMauTXuVAgTqhy59DiFXPbpIfQ4yvoMBFtqvLcQluFds9M14doHf3JjH
 REwSCIBAswYcmPRnpQkurgf+GtJUVSOXqbP/HgKYMzSIgT2xu9Djw52cnhuLxfBLO24bQANPeEo
 wGyTOxrRBkzDiJYSf4p3we6nB4/Jp2FYQLvhcMtR3N9DXkgEZO1zvSLFtTaBHvbvTgHqYEdSPwv
 iA4ZuYdBU+DbDMPrUXN1rGINbWpliEN8FsO2PF6y3jZndcBNLYB18GemZ/6C3M7HvHLEkSEKhq2
 ZQe6Bpba6cbPBg7rdZw==
X-Authority-Analysis: v=2.4 cv=EsXfbCcA c=1 sm=1 tr=0 ts=6975fecc cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=KZIT3C-7-F78qrtZtU8A:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: NVPZdevAiDF2rt84sPiwuzIYqLx0Yeq7
X-Proofpoint-ORIG-GUID: NVPZdevAiDF2rt84sPiwuzIYqLx0Yeq7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-25_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 adultscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601250095
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	TAGGED_FROM(0.00)[bounces-90433-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,oss.qualcomm.com,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 46001803FE
X-Rspamd-Action: no action

Specifying UBWC data in each driver doesn't scale and is prone to
errors. Request UBWC data from the central database in preparation to
using it through the rest of the driver.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Tested-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/Kconfig      | 1 +
 drivers/media/platform/qcom/iris/iris_core.h  | 4 ++++
 drivers/media/platform/qcom/iris/iris_probe.c | 5 +++++
 3 files changed, 10 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/Kconfig b/drivers/media/platform/qcom/iris/Kconfig
index 3c803a05305a..39b06de6c3e6 100644
--- a/drivers/media/platform/qcom/iris/Kconfig
+++ b/drivers/media/platform/qcom/iris/Kconfig
@@ -5,6 +5,7 @@ config VIDEO_QCOM_IRIS
         select V4L2_MEM2MEM_DEV
         select QCOM_MDT_LOADER if ARCH_QCOM
         select QCOM_SCM
+        select QCOM_UBWC_CONFIG
         select VIDEOBUF2_DMA_CONTIG
         help
           This is a V4L2 driver for Qualcomm iris video accelerator
diff --git a/drivers/media/platform/qcom/iris/iris_core.h b/drivers/media/platform/qcom/iris/iris_core.h
index fb194c967ad4..d10a03aa5685 100644
--- a/drivers/media/platform/qcom/iris/iris_core.h
+++ b/drivers/media/platform/qcom/iris/iris_core.h
@@ -30,6 +30,8 @@ enum domain_type {
 	DECODER	= BIT(1),
 };
 
+struct qcom_ubwc_cfg_data;
+
 /**
  * struct iris_core - holds core parameters valid for all instances
  *
@@ -52,6 +54,7 @@ enum domain_type {
  * @resets: table of iris reset clocks
  * @controller_resets: table of controller reset clocks
  * @iris_platform_data: a structure for platform data
+ * @ubwc_cfg: UBWC configuration for the platform
  * @state: current state of core
  * @iface_q_table_daddr: device address for interface queue table memory
  * @sfr_daddr: device address for SFR (Sub System Failure Reason) register memory
@@ -95,6 +98,7 @@ struct iris_core {
 	struct reset_control_bulk_data		*resets;
 	struct reset_control_bulk_data		*controller_resets;
 	const struct iris_platform_data		*iris_platform_data;
+	const struct qcom_ubwc_cfg_data		*ubwc_cfg;
 	enum iris_core_state			state;
 	dma_addr_t				iface_q_table_daddr;
 	dma_addr_t				sfr_daddr;
diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index ddaacda523ec..492f85f518eb 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -10,6 +10,7 @@
 #include <linux/pm_opp.h>
 #include <linux/pm_runtime.h>
 #include <linux/reset.h>
+#include <linux/soc/qcom/ubwc.h>
 
 #include "iris_core.h"
 #include "iris_ctrls.h"
@@ -244,6 +245,10 @@ static int iris_probe(struct platform_device *pdev)
 
 	core->iris_platform_data = of_device_get_match_data(core->dev);
 
+	core->ubwc_cfg = qcom_ubwc_config_get_data();
+	if (IS_ERR(core->ubwc_cfg))
+		return PTR_ERR(core->ubwc_cfg);
+
 	ret = devm_request_threaded_irq(core->dev, core->irq, iris_hfi_isr,
 					iris_hfi_isr_handler, IRQF_TRIGGER_HIGH, "iris", core);
 	if (ret)

-- 
2.47.3


