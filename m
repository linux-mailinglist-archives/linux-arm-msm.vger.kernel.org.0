Return-Path: <linux-arm-msm+bounces-78760-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B46F0C08330
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Oct 2025 23:35:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 4D18D4E3F7A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Oct 2025 21:35:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CF8C309F0A;
	Fri, 24 Oct 2025 21:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TAmafXT5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B29C92F7AC4
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 21:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761341713; cv=none; b=Z+672O1Fyj6nNi3c9gI+1PpN1HSa6Bbt1fASFvQHrM5HlyACha15Zslr/N0yPiLbqIk+DTAdMFFRFBw178H+6HERhl8R+Mbmhs2VquV3JYFtwnLMZc6m0BN66Pxs/dUXC6de31I1fmsjoV9I/JbkIwbyHy665LGks6Gz7A4iYNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761341713; c=relaxed/simple;
	bh=WlbCj8/yFWNBZJSWw7I75oAu7ZGn1oMh3UBg4y5Eorc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=nMPs18RAapdnQc0NYREZW4CU4DYthPP510AudiaWEYksIzG+Mi403z6wBZ3eFLs4fJMFTz343jvX5in1MobbaRju3mi9ygGne14V0LqU5VLdDPzZAyaDR/d2Ac9jkZMHdewm9cebjupRDZFV9IZVYsaBRZfEk2UOPOM4DUlhPH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TAmafXT5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59OI9HBB028223
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 21:35:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=iYwGj867iebYBlUQ6FRlDd
	eZUCqI3oxDReWWqzN70+w=; b=TAmafXT5S06jW0SDovRjdXjMQv9Bw44tGc7IMJ
	l77VUoE36a9/qz29COj1pk5dmPSjzbzM+1PgbGNEZW73GwFqngec9VG+zBkWGqiM
	1HC3F0hBoH/AWRMAjyWtUh/v9CSFP9zxlWgoMpUxfTnEOA/Z4RhNXXGZM//YQOZI
	ctWWZIE9uunjy7syccPbUGxLg+F6P2HXKBYZtsTOaJvG5z5fEqwWVB6lyM/i/CGS
	X9AN9M8dLfvkm1WcfzfkHtMnZJX7nDWQ2rEF4LYsY8NPe9qIpFW4IAFXRo6Z+c40
	girjMSydIOvxJRD0ayutuFdpjQ7+bKOQuvdDsR5qQ51TbvTg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49y67qqb40-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 21:35:09 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-33bb3b235ebso5216631a91.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 14:35:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761341709; x=1761946509;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iYwGj867iebYBlUQ6FRlDdeZUCqI3oxDReWWqzN70+w=;
        b=CyySVEy9SO+IajgtG3IqfPOWHtWq0588lfDMEcj4RhQHQ0zMQjLstzPMAsaewUtUjO
         vLHyV614S3Jog1zu4Bas3ZbJNDed7tJYrjBd1CaoqeE5lYx2TGBgLRKxwVCr1WtyK/Dh
         /GiZAlj9Bwuc6OlzU7W17XVo0lJ6YZfdZsowgvIcNt74nGUjCxhVpO0ppxXVGbChpU7I
         jlPshbIj80BFO9KE4jWEbz2lQqlALGqjBRFAbb/mZEh8ppf4aafvp3GJhW7pbSRZmp0L
         jRWjrYPqZSWpyyIseb+b1/4UinDpYTrD1kiPrFJu3BRnIi9sguJaYzZIbYhhvT920VXb
         0oAg==
X-Forwarded-Encrypted: i=1; AJvYcCX+mQD4zKgTh1bbWJSjNFLT3gQQ7RsvzmKf4+UOuejGYfapDNSNNVjwqUtZZs/jXfWYtPOpzsKsJ+6Euy4L@vger.kernel.org
X-Gm-Message-State: AOJu0YwL2/dXI5Y2YB/plnTacnYGXbVXK3yq+YXLjnAPRq+7dIgKCPQE
	/cAfBVfleS8YXJqsLdh3XXEmJ2o00Gqo4MO6esHHsnSKHBfw+nJQqnXnBw6g1/VpXrfxtFeruzd
	eL+19jaI7Az52KO8g0m+1t3UZ+wRpVGiaTeY/4Pd0UPKP3veZOCbklJyAYRrQLb+2D7OuMYHIqL
	Fi
X-Gm-Gg: ASbGnctLgPb4qRMVpqkSt4iJrqrUjI7YEeLB9fGQXUo0vrKoja5bYE5sFALm9D1O6nj
	sHYiDIhHitF6W+wgei/GLBhsFINtUcvn/UceGnmn6kwVl3oqfxypwvnnoMOpyzpAIqinZW3E4Tw
	JV+xy6AG4ytcsv5GrfceiGDrrWId6GO8lh8xSJbdU9eDo8EefpKqYxfN6pnnw759Vq9vTZsGJJX
	ndE9bTTEqOKiomoP0gVYON/tMxakTnL79AYke0IOw9OjA/N7MMhYX+1zvX1LorXuRVt2v2Uo7dv
	D0apQEX67pQRL8GcJIb6VV0nWZ5z9XkgAt2DQCOYyHZjicfkxc7zhCGfGFT1z2no+iKmmW52QI3
	/k1absr932U0YJJ5qwCUju1lCiqKAVhbV93T2hPa8c54hsee+OEi8GRst/Q==
X-Received: by 2002:a17:90b:3883:b0:33e:2d0f:478e with SMTP id 98e67ed59e1d1-33fd64bae12mr4044668a91.3.1761341708906;
        Fri, 24 Oct 2025 14:35:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGWlQxqPCcIAOWXSzN5WR1fExwHDigmaUzlorQ8BuPJ5M6mU/xZjao9CQZDugQ5HMPoV6fhEw==
X-Received: by 2002:a17:90b:3883:b0:33e:2d0f:478e with SMTP id 98e67ed59e1d1-33fd64bae12mr4044651a91.3.1761341708473;
        Fri, 24 Oct 2025 14:35:08 -0700 (PDT)
Received: from hu-bjorande-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b712ce3a90bsm193546a12.25.2025.10.24.14.35.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 14:35:08 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Date: Fri, 24 Oct 2025 14:35:07 -0700
Subject: [PATCH] crypto: qce: Provide dev_err_probe() status on DMA failure
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251024-qce-dma-err-probe-v1-1-03de2477bb5c@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAArx+2gC/x3MPQqAMAxA4atIZgO1aEWvIg79iZrBqimIULy7x
 fEb3suQSJgSjFUGoZsTH7GgqSvwm40rIYdi0Ep3jdItXp4w7BZJBE85HKHtjRqC6Zz1Bkp3Ci3
 8/M9pft8PK4tbH2MAAAA=
To: Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>
Cc: linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761341707; l=1372;
 i=bjorn.andersson@oss.qualcomm.com; s=20230915; h=from:subject:message-id;
 bh=WlbCj8/yFWNBZJSWw7I75oAu7ZGn1oMh3UBg4y5Eorc=;
 b=CkJ0xxxNyWQYABSEWTZR5o42pHfUizLhi2bwdWincG9fpab3WpXn+18HW9DsX0Ysscl74ABcY
 OEyeqMj0UX3AhV33NCrKzdQMNO2S7WeVF1mcZ/CRUyBPijfmCCTjxOk
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=ed25519;
 pk=VkhObtljigy9k0ZUIE1Mvr0Y+E1dgBEH9WoLQnUtbIM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIyMDE2OCBTYWx0ZWRfXzyFeW1HV0zIS
 0YaDjrzHvAe8dubW7aNB4YHhBhzTIm69erY3TehkeBEfJcGnwH3xWAUHgh6lmuC+Z1C3JmUO1J3
 wvBrlnAapnJ3UooJzw4k4QhxBkhN/YYnDxZOnfPp0XiYKaKX70yGTaZLqsZ+gWg0qOt3TFz6wIK
 EX9H3AEVWljmokzwqpggxaUOQoo14D326sZ4C52jboR3GP4PjqkAViz2884IEdU4Mc3jxxwM54R
 wbMED4+moKB115Rx7EzYqBBf3K6bmDwWlTJ/yfBEvg9210KhlySJrgzPLO0EboOGpM4WnWs4dch
 v7kgQBgEilzjUMoHgPyA5nhExx1nVg5TCzlYz0TTouC6jzzLBSjgts1EWp1w2TAuczu0G26qnNw
 U2TrDVlgsXGCZPh0x+CYxLlM7B3fsw==
X-Authority-Analysis: v=2.4 cv=LMRrgZW9 c=1 sm=1 tr=0 ts=68fbf10e cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=9nxSR7a-VyI66LGa1BwA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: ascrKQC4Spbm4FTienW-vwrtT_6vKGsu
X-Proofpoint-ORIG-GUID: ascrKQC4Spbm4FTienW-vwrtT_6vKGsu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-24_04,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0
 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510220168

On multiple occasions the qce device have shown up in devices_deferred,
without the explanation that this came from the failure to acquire the
DMA channels from the associated BAM.

Use dev_err_probe() to associate this context with the failure to faster
pinpoint the culprit when this happens in the future.

Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
 drivers/crypto/qce/dma.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/crypto/qce/dma.c b/drivers/crypto/qce/dma.c
index 1dec7aea852d..68cafd4741ad 100644
--- a/drivers/crypto/qce/dma.c
+++ b/drivers/crypto/qce/dma.c
@@ -24,11 +24,13 @@ int devm_qce_dma_request(struct device *dev, struct qce_dma_data *dma)
 
 	dma->txchan = dma_request_chan(dev, "tx");
 	if (IS_ERR(dma->txchan))
-		return PTR_ERR(dma->txchan);
+		return dev_err_probe(dev, PTR_ERR(dma->txchan),
+				     "Failed to get TX DMA channel\n");
 
 	dma->rxchan = dma_request_chan(dev, "rx");
 	if (IS_ERR(dma->rxchan)) {
-		ret = PTR_ERR(dma->rxchan);
+		ret = dev_err_probe(dev, PTR_ERR(dma->rxchan),
+				    "Failed to get RX DMA channel\n");
 		goto error_rx;
 	}
 

---
base-commit: 72fb0170ef1f45addf726319c52a0562b6913707
change-id: 20251024-qce-dma-err-probe-a7609d65bac6

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>


