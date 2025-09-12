Return-Path: <linux-arm-msm+bounces-73315-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D565B54B38
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 13:40:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C64F94848A0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 11:40:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DE22301038;
	Fri, 12 Sep 2025 11:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZLLgVOkZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC71F2F531B
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 11:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757677188; cv=none; b=le4nL6vAWPk9gvH7XFZiVBClCImWmaEpx3+FSFtUmqBMa/1y9RfdiZywUJ3+cwlggSCcAJ2sYSsOOyvHhtWFiH+a8bc7LFrmBmkFwT9QBhwjP4M2cH83ZxHX8YtJInogMFslCE3gw8bhrzhKvaHfiUClTOpe0g+6CNEcEhsppdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757677188; c=relaxed/simple;
	bh=iXID0C097LlDUB/zo7wU7HLlfkLmr4ASRlNP6RgIyjA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ivfdKUwDKCh67MrX78cWPAr2U1TVGu3LdKbmLSpr0JBiQN3LX2PiBdOAJvgKmmSbe/w1veUvp8H8dvVmKbawCxFGH2ZF+xDUvgK8d5I52fz6lNO4s3KFrsZbKzfLu0BOrT0eWSCTOsxYyEpPoxPxZls7Sc25hbuHRWWiz7WsGTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZLLgVOkZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58C9fLZB015470
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 11:39:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	59rj00Uo3zScXl9anw4BJDMpejse5yew5Wz5zTlZCs0=; b=ZLLgVOkZwD/EGXgm
	dwIgV9pApQ6cleVbKK/6af2p+jTjrCAf0btvIdQt1Gq59Q5onQ40i0l2fftMY0Uy
	bYXxTC6pMBGGGs4MDMse1hoxCl7qp6s4827o67SpP4PAbhtr+jV3JYHrQY2OwN4p
	+hZnyDluBu46ibXlKN/9NRnC7B9mpX811b0UnyHrT+iId5//9RRiKOYpUt7tpg1g
	5L21OvWn5MYRQFRLU318bQmJ0Jh6AflzMCYVB1+B+bVsc5tPp9Dqpi74fTmuBmlY
	7trrIUyTiD7WZIyDymViiP2uZl4hXwgx8scU7EBpA6nh4WkqaEOG7tEda/MwlFH2
	ecN2Bw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490aapursd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 11:39:45 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-32b5f6d5292so476475a91.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 04:39:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757677184; x=1758281984;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=59rj00Uo3zScXl9anw4BJDMpejse5yew5Wz5zTlZCs0=;
        b=FPZiXmpHNbi4LFfhx+r4QG7mRoxEZkzZygWG7jlvPrcr6iA08Bdzsktt4fEDPWgqs7
         KM3t/fTiDKUkwvmlFosiEeoS7FvdhiHAiR3lAwRhNWOEIu2CuSYqfg7PxwQAffapX/Uu
         06yidAPkN4ON2s4qrrtiK3lv1WwEbOwYxtlB5bOd/zaB0vrHQ6PaCQZyeV7HieNwwjdo
         unIrbEW+7yR2v3iT/ybIlxijEE5OR//Hg+ZEAGn965ccd5bWrkLenx3MFJNlrPyD8gmm
         N+Xrin2da3CwW68CFvuJTyOGZSfGOCbuZo533/n431ltQmDBA3tWkUMLhVdwo/7yWVLs
         J5zA==
X-Gm-Message-State: AOJu0Yxndtrz2lLF2JOQzsU8oSPIWBQl1O54uwjSW01w6dFLrmLyV3SG
	nwa3bpCubTOUvESeXvdSI1PWvY8OzeFWyVrXPQWIyTNnTPP3SGjXt935SOFYEELijkPjBsNmERa
	iFszVO9ejSnBxYQhDXqJoxnldxwc7P8d5TOi8VFGY9jpBr1xVM5eY1HM0ApDOfk1+dlFe
X-Gm-Gg: ASbGncvb+Jqcs2KJMJVlnFTnJu6l9vx4zUEEm4RkJB+QappEgYDBNoqlz0f72ZpQCrL
	xCXx8rdeE1czL1nl6pRrIetuVEBk0p2FzRUdgcFGB2UYcxAv7ioD4Yw784qOVcrEwChTiY8yqsj
	3/vWKMHyH3/bfD7V2qfyP4Rs/rNW2Sd9DtOiuftFpFKMn8WdZFoOmwbd4YH0UB58udIjV0kHd1Z
	xoHd2x0Fp86GlM+CAfZkXTGvXCbQ8xt+thLLH+ZhPohIVZy9Apx7Aw3+QRlPTC9I1HYZVaoq9Uo
	geR/3XWC+DFbvh6iDlMw9xQ0L/4bJMn9gJc/BHvQzNAlQfB3LCg8w4vhrD+k2Bx05EQFnr4kSpG
	MUgFA3LPy1wbJg9gqK9w89eoBkyuOWPfHzXcnLo4nMuxuXdstxBh0KvpO
X-Received: by 2002:a17:90b:1c8c:b0:32b:87ef:5faa with SMTP id 98e67ed59e1d1-32de4f80998mr1685175a91.4.1757677184268;
        Fri, 12 Sep 2025 04:39:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEN8J7dSHJlf1bK3eu79lm+dW5G5Xfjiiq4Mp8bFzHbfNDPDpKNxRTqTagtKWQGq9O7pdVh8A==
X-Received: by 2002:a17:90b:1c8c:b0:32b:87ef:5faa with SMTP id 98e67ed59e1d1-32de4f80998mr1685136a91.4.1757677183700;
        Fri, 12 Sep 2025 04:39:43 -0700 (PDT)
Received: from sziotdisp01-gv.qualcomm.com.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77607c45e34sm5278760b3a.91.2025.09.12.04.39.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 04:39:43 -0700 (PDT)
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Date: Fri, 12 Sep 2025 19:39:16 +0800
Subject: [PATCH 1/2] dt-bindings: display/msm: dp-controller: Add SM6150
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250912-add-dp-controller-support-for-sm6150-v1-1-02b34b7b719d@oss.qualcomm.com>
References: <20250912-add-dp-controller-support-for-sm6150-v1-0-02b34b7b719d@oss.qualcomm.com>
In-Reply-To: <20250912-add-dp-controller-support-for-sm6150-v1-0-02b34b7b719d@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, fange.zhang@oss.qualcomm.com,
        yongxing.mou@oss.qualcomm.com, li.liu@oss.qualcomm.com,
        Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757677171; l=1295;
 i=xiangxu.yin@oss.qualcomm.com; s=20241125; h=from:subject:message-id;
 bh=iXID0C097LlDUB/zo7wU7HLlfkLmr4ASRlNP6RgIyjA=;
 b=CP5uTwRTZhS0ty2t+/L3sSCKvXc3+Xx3YfkllA0kqvsxBtN84bm7Wx5HahYy8qmEBjjDQ6yiA
 coC/qz/R7eIA9rz6ilS1Q6EwxYQAyEH5WSf4CprNO34jp9ZMzzCVT7I
X-Developer-Key: i=xiangxu.yin@oss.qualcomm.com; a=ed25519;
 pk=F1TwipJzpywfbt3n/RPi4l/A4AVF+QC89XzCHgZYaOc=
X-Authority-Analysis: v=2.4 cv=eMETjGp1 c=1 sm=1 tr=0 ts=68c40681 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=2t1bcwrjeadYucq94KYA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: Z8xTRvsxLHlZzWex-QISAOooA_4GbYKy
X-Proofpoint-ORIG-GUID: Z8xTRvsxLHlZzWex-QISAOooA_4GbYKy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAwMCBTYWx0ZWRfXzh063lClDKBx
 3hl2+Oajsjez+QzEonXoubQju2YvWQVxrwyqqDvQYeYitm1vBjVON4jPFFt/TOo0XGyfq2+Unai
 WxFfHu0/NhYtLlRHW+V6P/dXpjQqwfTo8CrTIXJB4tfc9E/saCfueCTRuehgxJm50idJ+y3kZvw
 xZHnbe2aCQtoIzgvIe09clq6QvIMsPvuPE7Nvs0PdHvZTVAFeFqh2iaUhF2k4gHi7ASr8nWB+F9
 Pc8b/PsJXP0lqyKdn9cP6CjfA1K0AYcuQG1q5VT8p4Y/f0Kv9SGY6xz29KnbJxMicP8z+Wbcl5v
 kCBAjbwzicTaGQcRwWOh9IcGaoL58bHq4UQBKwknQ0nQHkFESUoYS9HU30rL00dH+ucSb0bCdd5
 FHIKNgfU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_04,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 adultscore=0
 bulkscore=0 phishscore=0 spamscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509060000

Add DisplayPort controller for Qualcomm SM6150 SoC.
SM6150 shares the same configuration as SM8350, its hardware capabilities
differ about HBR3. Explicitly listing it ensures clarity and avoids
potential issues if SM8350 support evolves in the future.

Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index aeb4e4f36044a0ff1e78ad47b867e232b21df509..2bebc182ffe348fd37c215a6bf0becea11e5ac15 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -46,6 +46,7 @@ properties:
       - items:
           - enum:
               - qcom,sar2130p-dp
+              - qcom,sm6150-dp
               - qcom,sm7150-dp
               - qcom,sm8150-dp
               - qcom,sm8250-dp
@@ -261,6 +262,7 @@ allOf:
             enum:
               - qcom,sc8180x-dp
               - qcom,sdm845-dp
+              - qcom,sm6150-dp
               - qcom,sm8350-dp
               - qcom,sm8650-dp
     then:

-- 
2.34.1


