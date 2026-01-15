Return-Path: <linux-arm-msm+bounces-89261-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 60A00D284E3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 21:06:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F209C3024D4A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 20:05:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82D0A31ED83;
	Thu, 15 Jan 2026 20:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R4cd6SXh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MMY2AIE4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E1CD2E2679
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 20:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768507544; cv=none; b=QOowTrHc3HwjgovJ3eCtHINg9qk0P9r+piUgmPQLdTkb+O5EnRUrafS8ks2l1m+zCXTW17TfanHKQACNbvtENOjgaNXIQ173UEEKMCd8QrSVDHVgpe7Ft9nFzy6SaDcN4/HrPJt5XVghOMxmfOCQI7+2iRJhTsKB5KRG7bTog+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768507544; c=relaxed/simple;
	bh=v6eBzWIh2k7z8M+Jh09NruPQYjfkP6zXlTtfLnImWNI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=bjWWxZ56kOmjXP6kTGmfouSI6nYAc9Bfsbj44RxA06A9cdcyjFta6MjNbJQcZo7HeMhx++svta2u+cUQIYtenzQckKqAwVw0YgErd1SqRw4/rBhGoMKwwV0Kmo4fTaf3qG42FfoQ/1yp328/7VGa3FH1atlRgwWw1bolXv+SD6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R4cd6SXh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MMY2AIE4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60FFg1xs2312402
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 20:05:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=VOo2kj0sUGTYxzsW7Js58/
	HUzE5NNXh0gdcCpj1KifQ=; b=R4cd6SXhme8/6/IqtmWQRxioQSmRVB5w85Zq1g
	0D3vvZptotHWWg8xrgLiK9noBVhkW1MoaBq/CKj0n0ZAUIPWycoRHr1i+BZGXH7M
	R9vWDvlCogF5uD70Zi3hEi2KwE7owC/k2QQXcNckmDRL+zxbCPQi37bvOaL7ait2
	doo5j29xJjU3DwISyzo5OPVMSc7g2MRHknYtvRnttSZ5Hn3k3CRPfIfSIf67/80R
	0DIco/SSfX1128xmmG2Rv3RwkrOz6o74FjhjpZ+JAUmTDk1s/pGQFEFpNgGQKw/U
	MplHiwyGqwCtc0KBVf/Gb/b5Z3MFH1tmFN9UkCplA5clBgUw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bq340gwpt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 20:05:42 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c538971a16so322805885a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 12:05:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768507541; x=1769112341; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VOo2kj0sUGTYxzsW7Js58/HUzE5NNXh0gdcCpj1KifQ=;
        b=MMY2AIE4M0O1hVjJx3ka1MpuF8EyXZIqgy4ClvGCXbPMmj3eddywtk1wo44ZKiZykO
         W649XuLtpWMYGe7/bAhFiWSKnFW1OfItOi7adAeqVqOni+jIA69JkIQTWqBuQlWesUJ2
         urHhvsTO/dxHlR3tSXnPmuQQwuha3Ch5z7hyF0/A7crC4VLmVgX52OdzBlAo4IHS0Z+N
         Pk6NVYGTDO7KOzVMUCrMfnhjX1eFO+xli4NXswzfAeb2k7Y2SgJ0zvWWVKXE1g3yioZN
         SSV2lpuA02u2l22oqJ/yd9YlhEvSYTcXWivX7IsFzdyDjep3t6jQmmWeMuyz7z2C/b5S
         v+hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768507541; x=1769112341;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VOo2kj0sUGTYxzsW7Js58/HUzE5NNXh0gdcCpj1KifQ=;
        b=dKRnQQqEXk7Hn0w3lblCVqf4k8R3dL9jLxFKQRG0G3rpWjhaq2pwOxzXWUnzf23/Jw
         FfJj8KyHMF5/wzI/TSJF3IgtQSU42jOMfuQ+5Mkij229SS2MPkNjvsyjA6INgb1N9g75
         LWIZfvO7xZt0U28lZsogmJN+ePImeQ0CHIVmzhF8yJVduy65JMmhMqKLeCDZ/toOVXfB
         z9QgzpOAjy8LvqpnkCYcLvI10MbpGdp4kTkjvnreLLRjnDCWH/frcwcmW/p27is28rbX
         9/4yxRFkAg8Vh2REaiy7QD6fjojriaGS/sX/XS3D2jILhBw67QaDfrC/Jt32f6MmEgEx
         R6nA==
X-Gm-Message-State: AOJu0YzU4eiDverVG/5pF30dzZ/0ErxbvuIEMEQVlJz+31FthmMKQ6Jo
	c7Giya7xWRPWF3jkfR6CgZfScm2DGjBT+6RR2KLkx+cmHBhcKybIZegLZxV6lo8T7ildZjKcqB9
	5YOIWBaYGAAGYUBBduXNeEyjcw/hMG1nmBkxE6Jd8NwkmWHKdyoNgulIiqee0o4/gihGd
X-Gm-Gg: AY/fxX7nmysPKKLEvLi5uyWYFM9aD4AHCfQXYpOJqNcXo464a8xeyZGxretkJXLH55U
	Z/rys2S9S8TJGxwn9AFcl/yEaLZBhOy+v/lPr0FP+qy6vUCNSpssoEjJwfZGJRtH6VBA3hX/YnQ
	mplam30ySoe7YTOvbNwE0Q0Q1KqafzwFOaq5NbtNQAomCZZH77jCwNtRhB8XjLQVs47PsMQn3s5
	0WTz4l/Kpjb6eHtA0a5VlXws38d6QB/0DsSba8sn4mFPNczHIk0s287ALR3kjXXc/+8tHZHuAYX
	k+YksEdMYhnFOW6+98/feZXlgk+CO4i5aS9inFyq7o0Ca2FCE0fKtQr1FUvFND1jL2wRRoUFjv+
	9StT0fknGH8/Dvu+cdK64irmg05i/9eLSkhl6PDE/DV7LwjHLeR2FVs5aVeQRu+IMpQ+NfIAR7j
	TGWD5QXq1vnL+exPTXH2butXA=
X-Received: by 2002:a05:620a:298c:b0:8c5:2e83:d023 with SMTP id af79cd13be357-8c6a67892b6mr103954485a.64.1768507541184;
        Thu, 15 Jan 2026 12:05:41 -0800 (PST)
X-Received: by 2002:a05:620a:298c:b0:8c5:2e83:d023 with SMTP id af79cd13be357-8c6a67892b6mr103949485a.64.1768507540741;
        Thu, 15 Jan 2026 12:05:40 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38384e790casm1381901fa.29.2026.01.15.12.05.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 12:05:38 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH 0/2] drm/msm/dpu: improve LM allocation
Date: Thu, 15 Jan 2026 22:05:37 +0200
Message-Id: <20260115-dpu-fix-dspp-v1-0-b73152c147b3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJFIaWkC/x2MQQqAIBAAvyJ7bkEzJfpKdIjcai8mShGIf2/pO
 AwzFQplpgKTqpDp4cJXFDCdgu1c40HIQRh63XttjMOQbtz5xVBSwlHbQOTtYJwFSVImcf9uXlr
 7AOq5x/leAAAA
X-Change-ID: 20260115-dpu-fix-dspp-803dee634153
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=860;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=v6eBzWIh2k7z8M+Jh09NruPQYjfkP6zXlTtfLnImWNI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpaUiSxdpmEuL7vk9ftNWrYgnAQi6PH83uYG5uO
 M+rMT5+rs6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaWlIkgAKCRCLPIo+Aiko
 1eWqB/9FGJka78j5L5ntA9BCT/y6KBF5Wtu+YNWQr41iuEwpC2Ogw7wfnAv6iCMOVREHsuhhfUT
 j+AeoH9A8UZ7I7vFfNi3KSOvRgjwsUs7pLymjEWZWCanMNd1lADQhXKqIPdkQBvEPtTRxykseij
 81fPcuAcc4QLAH++4ms4ENFoe8OK9N7Z5+uGkXsbUwrnProD/LUb9OuHomcSfeFZavghFb5tTb+
 oZPi0Rjv49pDZbu6KdnYR+eYLUWxSNZi9gMtxCx/I6GygPDeHBqTeX2ZRCdA+hjzh4DqXA2ckU4
 O5SPs5ypqb8Ly+tBRbP1KlUNyUPJ46c97M+P7AsS9WUQRaMP
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: PjKeokiWYVHksBujwHj5bvfc5sHMiKIz
X-Authority-Analysis: v=2.4 cv=bp9BxUai c=1 sm=1 tr=0 ts=69694896 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=lK3UKzNOmJigaMNrkuQA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: PjKeokiWYVHksBujwHj5bvfc5sHMiKIz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDE1NyBTYWx0ZWRfX7zZNWb3OnAtH
 Dw02t9X+871B3rAMf2EidqKys0cgvbY8zZl3uJKbg8gTFnSf0Dc0N5RLPWlHYQrhBQXT33gKQbh
 yjO53ed0N1hDYoq7u5Z75I7C44tr7STg1gedynOVB/kuVL99wOA+MV8xNi8MhdGewoOH73dCeN/
 J9vqLUcPA8yH/QzC2jrIBKsI/MDvmi5PyK8nF9fdWS9Sl8YcySwTVl8q7vyuSlyPdg00V5NKeCG
 FJbSLaqE+2FqE/6DbZD9eEsuesDxkD+FgGASMYQajLjG/0Rl1v0chax9U7SDjZtaHCY4CBOjW+G
 rbBZS5AIYWAUlJ12vrsRL30tpFexDcNoFYQe7LNuExVustu+KCea02527gsaPP2jj69i5T9nIY+
 fGvqL2cM77v2JvBWfWDEd7XJUzcN2/iFfC8TL2G4AUultdsVb16GiSmbkY84CgCl/Co7ykNSl5z
 3BmN9shfxMIUCmG+2tQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_06,2026-01-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601150157

Not all Line Mixers have corresponding DSPP blocks, which are necessary
for CTM or Gamma Correction. Currently it is possible for CTM-less CRTCs
to get a grip of DSPP-enabled LMs, making it impossible to use CTM (or
GC, once enabled) for other CRTCs. Make sure that RM allocates simpler
LMs first, leaving LMs with attached DSPP for the CRTCs which need them.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Dmitry Baryshkov (2):
      drm/msm/dpu: correct error messages in RM
      drm/msm/dpu: try reserving the DSPP-less LM first

 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 72 ++++++++++++++++++++++------------
 1 file changed, 47 insertions(+), 25 deletions(-)
---
base-commit: b775e489bec70895b7ef6b66927886bbac79598f
change-id: 20260115-dpu-fix-dspp-803dee634153

Best regards,
-- 
With best wishes
Dmitry


