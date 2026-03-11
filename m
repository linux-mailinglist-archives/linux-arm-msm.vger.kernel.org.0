Return-Path: <linux-arm-msm+bounces-96831-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iOTaA6rgsGkuoAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96831-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 04:25:30 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AADEE25B887
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 04:25:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0C954320E41D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 03:23:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23FA436F439;
	Wed, 11 Mar 2026 03:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fXqgKjRP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d0ZnhCeU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 224F5363095
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 03:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773199416; cv=none; b=IoHh/3OdC0yuA7jS40xaI5v8aRZ0JplfSsPbK7m1R9gO1JTIxVkcBY9YH2lr9hH4cILBkx8opO9CMkFuWJ+jgf1myA9wQj6D4bWlMS2YNq2ujnV9APal8Y6KDM0z9H8YeOkeh7H0tSmvkiawiugz4N/G6fhxypfThVa67x6+0HU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773199416; c=relaxed/simple;
	bh=DQjdkhkQRL9h9cv0XC/AXKUXCFPEB+rX9LBo0dUvSGs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=obJjkkev7BV4MYhnrAowFQtg1Pi/SMycgrsw3MPcqtMa+H5R18t7hJcYVc9VXCcU6TYM62EO7vFUGEtjzRV89w3THu0FwjWpbi73Go6/fej9/gRq4l4QMMxk/pYI2m2bqEKQ0jqW57AU+h9mviumrwyNsQNvt75UbTnRGZufBrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fXqgKjRP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d0ZnhCeU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62AIXLNh3759658
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 03:23:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sHFCV47opCKmI6D1ocvZj16p1AvAwvvCv03JYIx/BSQ=; b=fXqgKjRPT2g96Sfs
	PI9kT3cPX4Gb+6E7oUcXUay1CMt3ftGSTzqp4LyViJiQIKoyIRz+gDNaxfryTXPc
	xQtOTXQYl6JQ0+owetus342XUrGBjJg1QQH1qFgFe5O5ar8HgGR0gho4c7tJfuZk
	2HUuX36NeY0Zf9aGYM3seXbpJlg3XXqjGS3GQh+q2GvR/q9ph6OVyG7AHOedJGXy
	b0Hf9fYKPDD5CLcjFd+9adOUAQiDUGpknarwf3SANBYsGQrn6hLT4o8hY3EgMc5M
	etzV3BTHbXQbkWxhSEGtSzK6kw0EGLgFf0Mw6PZkDeN/CSHZ6UQbE1JhOgkMwL0k
	X5dDGA==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctk8uk0e0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 03:23:33 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-94ea014ec7cso2829663241.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 20:23:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773199412; x=1773804212; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sHFCV47opCKmI6D1ocvZj16p1AvAwvvCv03JYIx/BSQ=;
        b=d0ZnhCeUTrURpXRNvp1eNOPJNqYlgZ5w11yXG5a1t+lR8zC0iFHqi55jT1gacmEufs
         G6sdqZYn14GQv+7hgER2Sqr4sZOADNdfU4zpSz+qt9gO5dOJJXOAwf/jZUFt8rYde8tP
         6BStmx9R+fLdkr+cW5USMwQZEk2IEOtYDMyHDjwZu6HjqF1WySgu4VOQPoArbtWOBYPf
         WuSGc3bH14U+hN8kIY55ujg2H3y/baOwchzji2PNbiMhU4QyaC8Q5Hc6fGLxTtft3RZ5
         qbjBLXeavJcXQbmYjbMnoEGbpoV/COvKfanYVl6zKlzKTSK3f9zgzjGO2Jd7XhyUKH8p
         uhFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773199412; x=1773804212;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sHFCV47opCKmI6D1ocvZj16p1AvAwvvCv03JYIx/BSQ=;
        b=ZHNQTOwzIOOvOWRHGxJqo5jgJo494K8p4ncowVfitAf12D86wFA5KOAz/hLw1p3JPs
         e/sE2ekIGwrgQXn79+BSpZQBaUfVhVnrr4QBto37I8dezuRiMftsIqQJBbO3nQyQ8gn2
         MYLxJotqJe1Fn/SP1cSQjZqJV5yTGafzgzg7/2CSFGBtEfvDGXTXxg6fYN8be+9n8Gij
         DYQBDrFD4dT4X3T+JckTrD57Z+kijOMLmSaPguwV3bPi54TMiFptc2OePvtFZ1aIIpE6
         LQj+MLUWTGuJJBQyY4y640kyysJ0qsddGaLpOYIJ7bn07rhDarua7NF3D3VZdHE3j5g6
         HJsA==
X-Gm-Message-State: AOJu0Ywi+ACK/8ouTpiEKguwNa87bPQA+TcLNPoWgJdPybCC7fEXJeTS
	4YzFgqV9jD96HIkufSIjkbGpnscV0XLjWbIfmxtP8iZIaPShHkTgPhcztrBognr0HVii9ahEBpB
	XPyNxI1v5RVL666eU4ktnwJFO1OsDsWd/o0jCM8RiRFiM8dNdj2D6Haweqj/TTDnhUCNA
X-Gm-Gg: ATEYQzzPW0n8rwFWC0vwuIk/KzRLLL+Q1bGQLkG0EPC+S28HeGQ1flzf1FriaSq8BvY
	dxeOR10B7xRgEZ1/nqTkQ32bGWhu4/m2do0gMs6ZdLd/URuZgvv7Vs7xzFHFSUMe82g6WlZWxZR
	O6mSfEh61FjHm4VqVLpfzGtRFJQA2jCcuAg/Ov1YPULrw9yrKZq3YyEmNC3R/g/+ghOpo7Bnw2/
	ZcoVdxpl4fCinoMCL1qxpQnIX3S84pAqR8CU/Pnf3m2XLGgY0BovHvADLxtK+Gywz4VeU4TZXCs
	9ylfuYYQ8fVj19xmmiAXpKu647mt6tq+EDJ3GCOEDmboAqzaaZ8KswPM1OkPu/ONN/rQ0rPXsLh
	Q+NAZ7uBwSoCETFt2K4E1uvw+am9KfGjrAi2q8XrWFwRs4xAxswriZfi4PKwjRcH2OOfvp7+bSz
	HH/ILiGOX1mawcRXgrkL0y9EUStYY93aI+H8U=
X-Received: by 2002:a05:6102:3f02:b0:5ff:ea33:2c0 with SMTP id ada2fe7eead31-601def8944cmr439055137.33.1773199412326;
        Tue, 10 Mar 2026 20:23:32 -0700 (PDT)
X-Received: by 2002:a05:6102:3f02:b0:5ff:ea33:2c0 with SMTP id ada2fe7eead31-601def8944cmr439037137.33.1773199411918;
        Tue, 10 Mar 2026 20:23:31 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a67e5ed41sm1422721fa.25.2026.03.10.20.23.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 20:23:30 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 05:22:59 +0200
Subject: [PATCH v2 05/25] drm/msm/adreno: use qcom_ubwc_version_tag()
 helper
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-ubwc-rework-v2-5-69f718f2a1c9@oss.qualcomm.com>
References: <20260311-ubwc-rework-v2-0-69f718f2a1c9@oss.qualcomm.com>
In-Reply-To: <20260311-ubwc-rework-v2-0-69f718f2a1c9@oss.qualcomm.com>
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
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1565;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=DQjdkhkQRL9h9cv0XC/AXKUXCFPEB+rX9LBo0dUvSGs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpsOAdgfYeu6GQDLEeuxccJ1k6HQX8RtzGU0npY
 98s/E/1KTKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCabDgHQAKCRCLPIo+Aiko
 1UIaCACkHLHsytPdk4DlFH6siwOBvarPpL59dCFFX5HO2jq6Gdn72E8+dIRpPcDMqqpAR5A44Sh
 55f8l8+skl4IZDAQI4t3yiIAxrtiop3WDdDR27xOIV7+FtPRjBRKnmGMx4GYRpcOVAnJ351Dv2y
 cpZ5eCDfVU2AK7z0WR8gxwqO/QZnMNtWpzV6pRnZYkq7MNUFAeEBv/iRlal86F1fcB/NMnZLZ8L
 o04ysuS5qWT+baJFgON9493TQKzXw8NNvtC7z96K42oVOzQA5W02pdMHka6LRNPlBT/W8pjr0WI
 kqONI03oJvq1hsx8KbUxL97kpKiJLVkx/Yf2NX9GP0GefK7o
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: Q_t_RTU595m4yCyvYOaondmOjlq-Mpxu
X-Proofpoint-GUID: Q_t_RTU595m4yCyvYOaondmOjlq-Mpxu
X-Authority-Analysis: v=2.4 cv=YcmwJgRf c=1 sm=1 tr=0 ts=69b0e035 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=xoTxleRWwXRO4XdZWWkA:9 a=QEXdDO2ut3YA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDAyNiBTYWx0ZWRfX/BZyzJQ4lEHT
 Tz7fMLILQ9Z+xST191AIDxCB/ldw4Vptw+FLnOvVTRQCQ/EKJs945CKiD6dNDdJlRpSp0TwYvgP
 bXmoRl7fRFvAQaew5rlSDlDwc0R/2GZPwXE96BjsEWoIYLfcOefo63/5NZ0ZacbJ0FgB5DtRYLs
 XRsIQsOxv8VJF6rALwiq7QVh9bi/VER+kcSWy4Ubdon5//hFhBWwl0thTPDRAimgbnwzh47F2II
 nTMkotMusYo783529gKQg2ckpzrvXQVXnDYVaWg5utHFSRitG6rtqojjWqBq3Lztn7OacQgH5Pg
 vHrlm3WY2cHCDWTAmeoDT3QFUg9CHp5XeyVLdVypok/I9EZNttAt4SP2E0DdWwDKHerl/HV/X0T
 BNoqIoWnvf688FzOr4DezXvMEv+qegSgnKNOZhKTjjjZwaiM/54rE+ouaru0Wp8YXOGfOAjBonL
 n05taopsKT6YFP2mLrQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_05,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603110026
X-Rspamd-Queue-Id: AADEE25B887
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96831-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Use new helper defined to program UBWC version to the hardware.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
index b1887e0cf698..6dc1d81fcaeb 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
@@ -272,35 +272,33 @@ static void a8xx_set_ubwc_config(struct msm_gpu *gpu)
 	bool rgb565_predicator = false, amsbc = false;
 	bool ubwc_mode = qcom_ubwc_get_ubwc_mode(cfg);
 	u32 ubwc_version = cfg->ubwc_enc_version;
-	u32 hbb, hbb_hi, hbb_lo, mode = 1;
+	u32 hbb, hbb_hi, hbb_lo, mode;
 	u8 uavflagprd_inv = 2;
 
 	switch (ubwc_version) {
 	case UBWC_6_0:
 		yuvnotcomptofc = true;
-		mode = 5;
 		break;
 	case UBWC_5_0:
 		amsbc = true;
 		rgb565_predicator = true;
-		mode = 4;
 		break;
 	case UBWC_4_0:
 		amsbc = true;
 		rgb565_predicator = true;
 		fp16compoptdis = true;
 		rgba8888_lossless = true;
-		mode = 2;
 		break;
 	case UBWC_3_0:
 		amsbc = true;
-		mode = 1;
 		break;
 	default:
 		dev_err(&gpu->pdev->dev, "Unknown UBWC version: 0x%x\n", ubwc_version);
 		break;
 	}
 
+	mode = qcom_ubwc_version_tag(cfg);
+
 	/*
 	 * We subtract 13 from the highest bank bit (13 is the minimum value
 	 * allowed by hw) and write the lowest two bits of the remaining value

-- 
2.47.3


