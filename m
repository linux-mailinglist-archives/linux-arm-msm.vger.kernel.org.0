Return-Path: <linux-arm-msm+bounces-83650-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DD322C8FD5B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Nov 2025 19:00:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 11A843AE718
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Nov 2025 17:58:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B7B22F746F;
	Thu, 27 Nov 2025 17:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M+mqgTp/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HbvWoxuq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDBF02F5A0A
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 17:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764266330; cv=none; b=KZWm7mlHoLdKOtXFPkoQL9k1Dapq4msI9SrGNMAgtzR2Qli2hAw2lZ3jui4DWtPKyS3qvM7aIg7frvhNCs1zqO3JagHnWtgZZi9sQ7BNMuaoyR+/EFO4isUMrC1qxDxxvbhYWuxWXfCu7adBHw1Ra14jL9SiafvJZmwuG15xkSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764266330; c=relaxed/simple;
	bh=wvUKX78LiTbGFtfGxc7RQrpsiXmPUP6wRpGyg5bx/4c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rHAheS9lG9/B7vyu8/WP1RWzdlkXcFElVRgb9v3vsRMHsq+phEBCj24epFGDPfvSmrl8+JOm6Sl8YX0d04OseD+SmYFTq/apgG2nxA/huGuWv56t7R8TfnA13AxKTubpdPc1b+plnNCB9PiGuF4kzg12AWef695tUuFq52ak6Zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M+mqgTp/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HbvWoxuq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ARAQ7aT288155
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 17:58:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	udh09WOE0ghG8srPavAWZ0k9nJwsCNDir1QVW+/HVZo=; b=M+mqgTp/jyzjWZ6C
	FGQWVacGkW4YV/IwDXu9Ffle/ZNfesNF4WQWwmBiyigrHn/OukIy0xGW/pRpKbqt
	Q3ZIQiJ9xQF+bfLSAmliUEXoTn/upxLtt4QXm+2HKNMTmDdg5910betB83xnVaak
	dKnnLc/y5lpHRE6QCGHJfU1+L2Fjy6Yq8EJOQg/SaDJHPm6ITmZIzldFOf9p6o/U
	wjS3BM97INYNr3xBeIrU4+Gkjh5bVWgREMzvtyHJdS+qOrC4g6P8mAeu/ZVkinUG
	IWDC9pNvVrW40O2GhX3xiENwIU0wuFx+8ojoTgJ+eUJbbMR2wS6esyTMWYes/Asi
	0mKQZw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4apmvxh1jj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 17:58:48 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-29848363458so19005045ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 09:58:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764266327; x=1764871127; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=udh09WOE0ghG8srPavAWZ0k9nJwsCNDir1QVW+/HVZo=;
        b=HbvWoxuqbZHVOlh6SLHJPiS3bAIKiX3VRRuN6aBZ3ns2ROk+hekiRz/t8z46Bi6fUF
         oZMUULLKfg0jzGyugcG6v55KK5DMqzpbzJeBNlhM/C4LS90Cbxz4cCbVJTPCd7j9g2CS
         dJgZ0I0ipDPpWy/H01ejE9jJcqKUberot91hj0MFBLGnXTt0ZBPzWN5witbvlioa99cn
         XC9kaTJp8xN1tAa1w0wKCPn8DBxPNfPBkMk7bYI6izuGt4ir/ZaSx1I4vHJcyFSmse/P
         kCmutve/Oko1L7s8XTPJrDXCGXxhz7uJQ8ZTidXMALKjW66YsR1e2xAIeklV3LPcltr4
         TBuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764266327; x=1764871127;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=udh09WOE0ghG8srPavAWZ0k9nJwsCNDir1QVW+/HVZo=;
        b=MYtqu+hck4NFBDUhmG81qr3FsM2UoW48qbB8fvy99qllvQ8xVw6bs9EW6byCUm1qDj
         iKmmazF7vGgl4dst1N0Ownb2Xdpf5O6nn85/JYNIdK1Bv5WVPlZLtb+RMRlwFjgS4ws6
         YaWVw+num+ERY35ZASLWXMTb4xU4kvRcexS/OG9jcOj8pnN2Hexbx4oF+1DpUZY2oMDF
         7h3l8x9fJ4q683E4n4j7+ViN+UN2r6BgB64p1+W6iewoa1EfAS7wbnyoU9dXZl7f/qPg
         uSitaRNcHL5nShh4IGPumcpdAVbVdDYquwEoFRxUfq8r7t8NaKjs4k1LGOSbH3dtkxvD
         /THA==
X-Forwarded-Encrypted: i=1; AJvYcCXRFRJg4eSBpKdHweY/C4qFWm3nfbr1r00t5TezpTd3QB6kRIOLY+Kpu8dEKrUu8aFS09Y4jKDh+3MEkbdu@vger.kernel.org
X-Gm-Message-State: AOJu0YzcJVrRvaAoq4gqpOqMU3kTaN58nvD414C7U9mJy4gGvWt7eFLH
	yBl52r6MUBwVAiUYYSxq27x6TLJ4qURaunhmub55T2lbW5w+zpY+arlAf2B/1c377bmYgnIreBA
	N8k55GtMRnRBj1wZ9GQ66XXblUV5A+e2InbQGwyvTs08F4Vxx6ZFu4upxAya7y8aAcNGJ
X-Gm-Gg: ASbGncty35ZYZq8mXmRN0eEw2sfO717hrUiugOuk7VLKercXYITTlzQjv+kxFdVkJ7G
	EHN3fxUH3WxQTWpUTV7Q3qv6bt66X0a6L4dz5vYCQRTclGZZWBm5TNrx8/zTeBU2mAGjjogahJE
	+W0NvJ01YYoBa0ToGRHKdZqmUGPmWv3tNyM6z2zEMIW9Mv2M+rSxWgPYf/22BwwZcKeCOqB0SsV
	d41FL9jFcKrhH9S5TORVO/D0xHKS9RO+tgpf3SlQ2+5MlM5jWYU19AOcSO7i8oW695d0jlF9s+M
	oUOgGSfJFPa7AkvPEeIFHtBs/94e4tiqI6KDzbkL8KEvWhozn3ZsbjAdd7CtuB9b8A3aYgQEoln
	VTC6RSI9BPR8mnmEoXEERZuhM1mengEiOehovckYg
X-Received: by 2002:a17:902:f68c:b0:295:6427:87d2 with SMTP id d9443c01a7336-29b6bf7f2b6mr287688935ad.53.1764266327438;
        Thu, 27 Nov 2025 09:58:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFaQLjYmGgkpZhAOj2ajlPkbG3wlnuW7BX8H1nU5OCobr8ulYwTVJQ+y/y8bFgtJAQhb4qy9w==
X-Received: by 2002:a17:902:f68c:b0:295:6427:87d2 with SMTP id d9443c01a7336-29b6bf7f2b6mr287688615ad.53.1764266326921;
        Thu, 27 Nov 2025 09:58:46 -0800 (PST)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bce445927sm23785535ad.37.2025.11.27.09.58.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Nov 2025 09:58:46 -0800 (PST)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Thu, 27 Nov 2025 23:27:41 +0530
Subject: [PATCH v2 6/8] clk: qcom: gcc-x1e80100: Update the SDCC RCGs to
 use shared_floor_ops
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251127-sdcc_shared_floor_ops-v2-6-473afc86589c@oss.qualcomm.com>
References: <20251127-sdcc_shared_floor_ops-v2-0-473afc86589c@oss.qualcomm.com>
In-Reply-To: <20251127-sdcc_shared_floor_ops-v2-0-473afc86589c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Abel Vesa <abel.vesa@linaro.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=Vtguwu2n c=1 sm=1 tr=0 ts=69289158 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=zMYJHzIRwYooi4bGa2EA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: IDI9qKVq_fNKndHcC_VunvWjSDFAwvvY
X-Proofpoint-ORIG-GUID: IDI9qKVq_fNKndHcC_VunvWjSDFAwvvY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI3MDEzNCBTYWx0ZWRfX4gWexqrsqzfW
 /k6PYvXrDu9tTtgMK5pLOj0tpAVpmlqT9r6GTrSOb6WPOotVq2bZs62Z1Eq205uw/5GU0Ncd7dz
 Mlb246JOC2eVWorkkJ7ufV6Ede3SZhLBzGK4DkHE0n43TQB0zlijdKE3DinDJ2bDwbFzA0Eo+DH
 qyYQLoRwNjQGsF481qhXstYiG3K8qYLjx6xds9UVbe89n/Bbe6a9KkdDIQ2EtuLitWnkxuE/oRJ
 GJO6ptbofm2xSit93+v+ZtFv9QREL9+lPCL9/eN3RJVs591kB3v4na3yzXa5wh1qkfqkmwJ6JKi
 knL8vnB4GD+G+ffeo/mEj/GNM0E8makTHmhakJemlJ9FyWsp+TxEXhb5cloTQ5V+phyJYODWzOh
 Lu0iNLIAENzTrc/nbI92lINKVIjUtg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511270134

Use shared_floor_ops for the SDCC RCGs so the RCG is safely parked
during disable and the new parent configuration is programmed in
hardware only when the new parent is enabled, avoiding cases where
the RCG configuration fails to update.

Fixes: 161b7c401f4b ("clk: qcom: Add Global Clock controller (GCC) driver for X1E80100")
Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-x1e80100.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/gcc-x1e80100.c b/drivers/clk/qcom/gcc-x1e80100.c
index b63c8abdd2fc24fc963f038f8cdcafd7598ba989..e46e65e631513e315de2f663f3dab73e1eb70604 100644
--- a/drivers/clk/qcom/gcc-x1e80100.c
+++ b/drivers/clk/qcom/gcc-x1e80100.c
@@ -1516,7 +1516,7 @@ static struct clk_rcg2 gcc_sdcc2_apps_clk_src = {
 		.parent_data = gcc_parent_data_9,
 		.num_parents = ARRAY_SIZE(gcc_parent_data_9),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_floor_ops,
+		.ops = &clk_rcg2_shared_floor_ops,
 	},
 };
 
@@ -1538,7 +1538,7 @@ static struct clk_rcg2 gcc_sdcc4_apps_clk_src = {
 		.parent_data = gcc_parent_data_0,
 		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_floor_ops,
+		.ops = &clk_rcg2_shared_floor_ops,
 	},
 };
 

-- 
2.34.1


