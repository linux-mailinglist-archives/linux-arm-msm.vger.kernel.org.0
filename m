Return-Path: <linux-arm-msm+bounces-55328-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4623DA9A83A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 11:37:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C7D4E446A77
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 09:36:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69942221DB2;
	Thu, 24 Apr 2025 09:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lU1fROQD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C2D5242D93
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 09:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745487082; cv=none; b=PyuVx52A6x4dh06ECWrRyCb3Yh8S8CULlZm6eeWBDU6Vm6sPfupRsKlcTcqLdkSFUoAIebVYnKs+tGltq7AFYGwA0dPUebj22fD/ItHaNyCvrnvSkYZtrofdUlMARelPzAqtTnUBLwyfI5O7Nk7d4T3K5mc9axTDTucGAIg7hok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745487082; c=relaxed/simple;
	bh=WHnH4u7CToI9+YcbwmPKzSr4/S0NqPJ62h/AKSWsURU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tWvVxUnyypiGoJoS7Ncdwxtc9GZYuXL5oLiUdEIZY/XvYXcUlJc3ql9jZ2Foez6Ik4/aYCWdSlakHgEwMPkjoLxp3YzSjtxx5VPAWXnL860q97Br056dzQHRpXtEPI/7ioy7eZwvF53bp3j7WEFu5/Z1aKwQqfQYMdR317pTVRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lU1fROQD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53O0FEwZ010792
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 09:31:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nMj4nXb+FNu6Q2Juv9wtWeinh7kszmTJRVSM9T4R8Nc=; b=lU1fROQD7IA0YtY/
	PVDZZzpgrSfPXrqoOmJjOkMNPX+2GY2ZmoSFjgXQOJFQccsA+BmgvevLw6CXBBjY
	gXmjkhU8yzf+wjBGwBPYz4l+HwbiYmy+5XX3YxLCU1DPX0C+HLkR+dl3LnLR7NZ4
	plxlDKkECNxT02/qaU9Uyx6GR2EebEv1Hneo6Fw+JjGAiYDJ4kN31BBB7GyA3X97
	qMdDCLdF2nDUy+POGik2xnSzrrtMGt40K9MviT/ZmdzC3KBBrHl9YRAkhA+lygo6
	0nyIJzVhVIEe3UUD98inH6VbViEue9nV22GaJoru1lyoMd5bpxtSv13lNx75gQ06
	/5J2yg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh0d1hy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 09:31:18 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6eb2480028cso13601616d6.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 02:31:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745487077; x=1746091877;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nMj4nXb+FNu6Q2Juv9wtWeinh7kszmTJRVSM9T4R8Nc=;
        b=tDxcj8CNJMvmddgDMQHza1wF02ZyJGXlGnZMQe4qUv/N7aJ2RYYgmHHcAyDuw+9EJu
         HEcZ//7DITsH/4kLukaUALVneXTiNAH6gUsdoQOQd/NX94y2Gdo1W+YnKAMAIh9Qiz+F
         gnzKYR1ymzBaM8h8SrHhgJLEmyK37IokWhXgcUECHxXN6FkC8PEa5HMQdmKGoow0dwOZ
         8GtokOSl9Vy9oW7fnH9CTrIMLcdQIN5BHMtthF2Sl2ziWDpredxYBlHQtsTr+VrHShZB
         4HTUjYAPI53yM6icXJ6DBu1fjTfPeiD6hMw7B582HVqCQyBJnnkH/xJOgEMj9/YBVjju
         TsUw==
X-Gm-Message-State: AOJu0YyJle77MA0Kxeks31zr8X9yooSQWuIix2HiRNljw0Y43LAp+5X/
	pQwk0wi8FPrPKrbEl9YGB5PJKenfX7+lQDNrXfOqSKyuDapeOx3Ca1le03gSuWdi9Waf5jDGCzd
	ZTHFU06AsZfbLCqPSXj27tBkLCqJSokiLoYT1eIGjNwyV64ZgBb4IStNCmoKgvfBF
X-Gm-Gg: ASbGncvcs8Ve+N2n40WFKe5SqrwzM7knnqNfDe+c1EgzkdnsO5PtCkFuIqrD90Ph1xP
	wgq2zv6uoppp3AWnKVipaNmCANy05H2AchNcorsueALZ4/yGlVc/rBkbqm5rhYTEBce0EefOtKy
	STgSICLCrlkyDs/Ee5vxZwwsOmYFU4DZTg2NRwykStTOIdLETziU3+ZyZvfEc8sH+bnOtfeePJ9
	BQD8zQZ4OJEhrC0ySKpLFSyA9zZig30EWM7U/2sym3JA0r0rn0jAXD1BPkECGrbZovXpqLuqBW/
	9RuvMCUdAAo11Anc/imaJzZbB72946TjXgxUKtvF/QcLETHx6fvRcNSwjeok1PzW5G+GBwVRRB/
	qGmq5ZTqAFWIcupAICMP0qibb
X-Received: by 2002:ad4:5d6c:0:b0:6e4:3ddc:5d33 with SMTP id 6a1803df08f44-6f4bfbcff8cmr27765606d6.13.1745487076955;
        Thu, 24 Apr 2025 02:31:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH1W5a+5gc6B7AlIvLZnfYHMfxB9iNdzMWs0zrgULP7xrYOYblEfMRe+GXwsC4GjPCz78vlVQ==
X-Received: by 2002:ad4:5d6c:0:b0:6e4:3ddc:5d33 with SMTP id 6a1803df08f44-6f4bfbcff8cmr27765316d6.13.1745487076645;
        Thu, 24 Apr 2025 02:31:16 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-317d1b9a304sm1820461fa.99.2025.04.24.02.31.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 02:31:15 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 24 Apr 2025 12:30:31 +0300
Subject: [PATCH v3 27/33] drm/msm/dpu: drop unused MDP TOP features
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-dpu-drop-features-v3-27-cdaca81d356f@oss.qualcomm.com>
References: <20250424-dpu-drop-features-v3-0-cdaca81d356f@oss.qualcomm.com>
In-Reply-To: <20250424-dpu-drop-features-v3-0-cdaca81d356f@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1025;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Rp2b7HkiPFY5uR85fuuwlCMt0ynxuJbG+1cuM8N4RUw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoCgSwjwuCAQPtAtKCggMXBPwUBGbkT7v7GHf+a
 Z9r2u+vdYWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAoEsAAKCRCLPIo+Aiko
 1YWgCACFeezcUqdWJOjr5b9efrq41SoCRN+Gl3gbB3ibrA7vRHOKAhyutBCN0y/vk2IOE2GRDzC
 qkud11KikADnf22r+/abp0uHrRWrLvISbb9aHl3QLsy79fH2HgN1kxYqhLpvx/udJTnqARkyAmW
 sJXnmAKArZllViW/LmxbDDJFHNy3GwT4PXvanCV5a05EQDmPu8ArtgpagqAauykLpJbhnKTtt3m
 3AsKQj6T5dpauSOMmC03gTNpc2gXuzi2r02mPVECpfz9hnsvbGvpf8yOJkIBqJlbR/BNRoeEsgf
 SohlW13/BA3b04T0rthak5t+q76AbJ6J0jhPZCcKytBiuQHE
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: nbfzTnGBNxnbOaroB7aigfjryRqisYWi
X-Proofpoint-ORIG-GUID: nbfzTnGBNxnbOaroB7aigfjryRqisYWi
X-Authority-Analysis: v=2.4 cv=Fv0F/3rq c=1 sm=1 tr=0 ts=680a04e6 cx=c_pps a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=8brcGD95nZB0FecW0AkA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDA2MyBTYWx0ZWRfXz+bu40cTtpuk dn33601C/Ar5JB8J61vaGI0oO1HyfxdQyZOWrjiKWeiRWylhl5MAfhV+ZO+3U6ZSYdMTh3kQDuF POPpOD5AL00v//ybq7CV5t5s6rO+FN8FMt6SlD9SHD+bnrU08KOBHS7KhK8tT9Q9BVLvMooGtlx
 q1kAjaQoVDBFG9wBRBO+pyJty9VbhbpdsoXW7Mk+FmeA0F4j5fKLiI+cGGfXyxht4Qu0IU61Brv YvQlltkCScsjalMY8z9DqOGQXDSOupATxo57BLzaiO4qK8y23zPrZ2jt7jgkoHSumzclaHM2tLM a6PE8xF+2qRlWa2JibJlEMped4cxI4SA/8NcUomk06ic61jh0moJ+Gqcy56AfivtKf66Xp0RT+n
 tvwk2QWMl9OOMmJ3d7ydqDzLrNoFRETLwMCeqDoCbFP8B8qGNdNRmqWIwrYn8r1hu35HQuqu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_04,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 malwarescore=0 mlxlogscore=723 priorityscore=1501 suspectscore=0
 adultscore=0 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240063

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Drop unused MDP TOP features from the current codebase.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 01763e0bf1359527b0c441ca36b27264dad636c0..4b6af58429361c49b71f6067dce8ca1daa6493fa 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -28,19 +28,6 @@
 
 #define MAX_XIN_COUNT 16
 
-/**
- * MDP TOP BLOCK features
- * @DPU_MDP_PANIC_PER_PIPE Panic configuration needs to be done per pipe
- * @DPU_MDP_10BIT_SUPPORT, Chipset supports 10 bit pixel formats
- * @DPU_MDP_MAX            Maximum value
-
- */
-enum {
-	DPU_MDP_PANIC_PER_PIPE = 0x1,
-	DPU_MDP_10BIT_SUPPORT,
-	DPU_MDP_MAX
-};
-
 /**
  * SSPP sub-blocks/features
  * @DPU_SSPP_SCALER_QSEED2,  QSEED2 algorithm support

-- 
2.39.5


