Return-Path: <linux-arm-msm+bounces-66543-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DEB2FB10BC2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 15:42:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 311473B2A81
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 13:42:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 125ED2D948E;
	Thu, 24 Jul 2025 13:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MSVN/Ph5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8806C2D948B
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 13:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753364573; cv=none; b=qrVlZY6sXgILYQNEeUXDAuOBtUBarw5+DBIQmIo0g4GD5RGPEgB3mQS6V/s+cOV4lobd1tXjITO+4pagZpd0+pMti4nw4Ibchjkv93pDPTlHSX5vYo6iDfpgKPqnwkYtLIoM9+To2nFwtbFT1U5UmvHGzhjjlpQ1S5aIuu/nrIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753364573; c=relaxed/simple;
	bh=vGRgVTOfDssnsSqYnvBFvPNY1C/z3DVIT6+xrGICpvg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EF5miDi2MtYVbl4aWc4bJFDaF/ogYjTZQfniX3SXgHNufYYsEzKx2ItJfSFU2K4R08AMnvroCImWM5IaFH1v3A7QUx4XeeWjSf4W4WEglEt2mbKaDGQ6XhOxdDuyyjtyXYFhNdqMsfnXAhzvzQ72pyh2s/ddwG9p6l43QgEBT5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MSVN/Ph5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56O9iuFG029489
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 13:42:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=sZth73oB8B1
	222ELpFTANlY4LXWFy5IwxIszsgN5J0g=; b=MSVN/Ph5IOY2qxNn8k+r7kq5wVv
	XnVMNrIaGps/EdquNHpYCT/T48JSXcTAi9Z0gRik8oZ0orKowceMlaIWRUPIygfT
	5nvNrfIatRI+e2cdqnVX6kaHydHb17YqJ20e/0xjzzlwGsp7WGPCNWIypu+jaHJ1
	3As3wNLrH2C/IOzBQYSIcmTSroSuR15ELA53A3ZAvcWWhspx87ccvfKP8gM1VEin
	ja1lwe4J8iyKti+aYzdBWLiqqYRm62/Lxxw2zKCY4GA3Vga2P42fXiU2THfUI1Wy
	1T+ssj1gRPVbU2f/sX9PB49/TShLyXReWuMz9eA9CIYCOMOGbVQu23vL6mw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4826t1g74a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 13:42:34 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6fad9167e4cso24426436d6.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 06:42:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753364554; x=1753969354;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sZth73oB8B1222ELpFTANlY4LXWFy5IwxIszsgN5J0g=;
        b=VRB3dX67GMvpjJahy6p8xJzdebI/pfBOLaq1DG1DsmsvQMrG5PrCMQKvJbfRLT7Vd9
         hnXimX3qIR7uvzUt8Rj4deEYDnVv5Vw6aCHx2DnGjIF5Dg97W7UjFb7C5hy47MVsjWSF
         Ij4AsbCRJvMLcKkdV7LZWDnPCJDVthm/4/JFML5aLab/vDVDulxRgc9kyvUyEql94D4M
         /hYEaSpk+bSeUjV3zyNPwEM4UxXgxkbKKyCnwoMIVDTzFQXwqfY0drolu3MCQ0bP1AIA
         qUnoYiLDe7VoC3PtcsllzIoSH8yCRU4dzE1x+3bS5GXJxKYjUwtYp8t3v9jvwpZGrCQk
         IfQA==
X-Forwarded-Encrypted: i=1; AJvYcCWQN5WiTeK3D3y6y82BxXXEztFQ0zf4UW20ueGVoREGOus4ggejT6cmbL9My0dDVkADx1SMD8vpZG5etFAK@vger.kernel.org
X-Gm-Message-State: AOJu0YzAt02lOaJRr9dlP3CbHjUIGByTvBw2G00ebZR1F7isVdoWTav8
	WaVU4uvbDIpIXd09WozW840guBnUZ3EfDRYt5iYgqOX+d31RzNNeE8VbJN+hA3oox7YHwGFx6el
	cTHRjfMFw+08KT1gWyVC/cmwaA/M99ALQkW1+QzrfJeU/QPe3ezmX913MVgvSdwGUs6+V
X-Gm-Gg: ASbGnctvDT5EBfocJL08XO46RrpNaSUbUIoAB9IuPNs6/IPqrRkqDsM5TjcOPdIo/AJ
	TvmKPcYh3wnyjrx+KpyfNvvFO3IR/eKwKdo9FbsEfWMvqm0RKkMVFfdRxE62bSwg7gDEq1QcPYK
	n5ipCgHWCxqZVpVtYDz306Jw8IVWCCMZOCcPPazd37xVLA0qhdhxY2izz+y1am18wQnN4JU8iqb
	fpXi7kBrNQaQ3BDRHWgCp/GxK//5Yf4ZfZQEYfUrsO/5PhCYJ2kMzqkAs7ujHuSgQm7HdYxvmW8
	9xEFt3sojtWJ1AL/cPHyanMJIOHjjGnM/Rb/KmKg6NTEYT7pRd9SRQ==
X-Received: by 2002:ad4:5ae5:0:b0:704:f7d8:703a with SMTP id 6a1803df08f44-707006e3bebmr113655116d6.46.1753364553686;
        Thu, 24 Jul 2025 06:42:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHGwZCs1ZXKsn8nvGRMR6iJSS+ZcmyQZ1l84AjZ3RmhPlugzRsIO+22IOdFC4rpCj3UyNAasA==
X-Received: by 2002:ad4:5ae5:0:b0:704:f7d8:703a with SMTP id 6a1803df08f44-707006e3bebmr113654516d6.46.1753364553099;
        Thu, 24 Jul 2025 06:42:33 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b76fc7885esm2228471f8f.35.2025.07.24.06.42.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 06:42:32 -0700 (PDT)
From: srinivas.kandagatla@oss.qualcomm.com
To: andersson@kernel.org, sboyd@kernel.org, broonie@kernel.org
Cc: mturquette@baylibre.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, srini@kernel.org, lgirdwood@gmail.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-sound@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 1/2] ASoC: dt-bindings: lpass-wsa: remove un-used include
Date: Thu, 24 Jul 2025 14:42:28 +0100
Message-ID: <20250724134229.103001-2-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250724134229.103001-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20250724134229.103001-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 38WbWzef8v04tG4BwSktlujcBwfIWOyL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI0MDEwNCBTYWx0ZWRfXzv0AeWnFHXdn
 h8RSU2cI7FsAljMCZHFjQJ61AGbf3HeKR9bR3vbxNpddXDIiWa2s2AYvszf69eHAUvIAI2qk8mP
 xMV9GyYD1vzefT17GNoVS+HKwKK3a+mtbATz6XF5hGT9pGZL5LrDw8L7ukIJPpSLgA5xv8CcYMK
 fevJYrMsRIEh1umzR7tF2F41XhB2BuEhZTmZzxyvgQ0hmN5d1L2D3g4DES/TCQ8xLUGzaUgMi1X
 /vdOnNpt1mcDwSaBDNRrBo7srvHqSzaUUOgJJ6k36zD+XwqNWj9dBIoAm/PXFmouqiO/D51Ao70
 FU7CKcpGTPosCnwHbkSIvKtxnIj6Yi3RbSyvjvRVIv75eXi+QUBeh/OiwT+7riFXVR5f8jR4p05
 haWTRymSY6FKl+QmWyOscfvzoOka/Glhg80rtGEWuSDg1Q5xSgZgoB0b8mmsicbMXB4+0RkD
X-Authority-Analysis: v=2.4 cv=E8/Npbdl c=1 sm=1 tr=0 ts=6882385a cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=ZRooaDHkeuqK4k2OZnkA:9
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: 38WbWzef8v04tG4BwSktlujcBwfIWOyL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-24_02,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015 phishscore=0
 mlxlogscore=984 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507240104

From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

qcom,sm8250-lpass-aoncc.h is really not used in the bindings, this patch
removes it, this also enables us to cleanup some of the dead code in
kernel.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 .../devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml          | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml
index 9082e363c709..00d9813d72bf 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml
@@ -103,7 +103,6 @@ unevaluatedProperties: false
 
 examples:
   - |
-    #include <dt-bindings/clock/qcom,sm8250-lpass-aoncc.h>
     #include <dt-bindings/sound/qcom,q6afe.h>
     codec@3240000 {
       compatible = "qcom,sm8250-lpass-wsa-macro";
-- 
2.50.0


