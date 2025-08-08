Return-Path: <linux-arm-msm+bounces-68072-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 95396B1E1B1
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Aug 2025 07:30:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5821D189BA42
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Aug 2025 05:31:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32D522153CB;
	Fri,  8 Aug 2025 05:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WBn9bP5P"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EC1320C494
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 Aug 2025 05:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754631027; cv=none; b=YOxWCEWu2abyOC6Tavq7IkbUBZ2NORsMjkpETzdVpW5ahzrrk8ndXJqaP5jwlGxuSJr/gK1fhq2oVgbLsBt9OhtdKkKl3LhvXdGe1jBV6NEpOULw7fK5clBEYV0uQyhnP749BCcJWlvFSudChhEXS/zIY+zGnAoZBm0LWefip0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754631027; c=relaxed/simple;
	bh=vudh6ChWfb+QAp63DxN/31q2MEqtFSevu7JbiruqA44=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YmttMTNN1c4q/am0OUTmmSRfIviX2hJhRv7Q84kZ+LEgUzCnF2zkKoqJCWUhRuIK/3Z1WWO9IMpJVRg4ValGRKjKgWuIVOezt8wfKFbVnftupUCBL3EgfMH+7tB7kjnujWmD8DPsm6lfUaRNQfspaNqyzd4rdpyxtypKEvykbBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WBn9bP5P; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 577IIVWx024853
	for <linux-arm-msm@vger.kernel.org>; Fri, 8 Aug 2025 05:30:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=j0/NbC6Dz3I
	Sr1wnPGqDAmCICjCJoiyEDtY+fN1XBu8=; b=WBn9bP5Pv6wjkiTgkiMnxIDcsTK
	iJFDyvg4NcR5yVnOo7RRjGMl6z5Nlo7nnL7uiLP+6cFhl4QUKqiKYbx1fDSHWZS8
	dsp6IxyaHZ54eCAHrmAAkyChQIg+vQxPN+LA6HbFwFFs/17OoERFqu9pYer8oDql
	E/vF0hUYxFYK3VIGDc0ydL4ERlu7X1avjGfy05oOYcVySm2UbFs44/7SNS3f4+7u
	kV6smLhpOo5kZ0s8RraDxmDs06K3RBfuhXotcV96U6/X28BFc55byHE/2fjzL/4S
	JEhwPfET5tX8BjkQtZ7sacigyVVkee6aJJgv44A0VKxFoVOru2dqi383W4w==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpw1gkm4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 08 Aug 2025 05:30:24 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-76bfc40bdceso1274133b3a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Aug 2025 22:30:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754631023; x=1755235823;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j0/NbC6Dz3ISr1wnPGqDAmCICjCJoiyEDtY+fN1XBu8=;
        b=PzFNsBQaUOdtUopbFBlE7iLOEoUwmYcXDKHBcIHReAMTUEqzUcHkhzGN4xoPJFwn+n
         gYCqHIfSFvYaLFK6SajcFQela2ZTvpDpLeOcDRwQhfxyhwAW5+/x2fJIJTKxaBCoK7+j
         O7vfcKYD57FhAkzfEHdMxvHX8V1SSQb5GTix7DJ4sBuO9PMnIbsN8x6hnOb8jdCcynmA
         erRc/XMvc0rFmfqkr2jHgVb+LWDQsDhMdLzfZj272o05p5B6jZDvI7xtsUaHG+iMK98f
         1tvtgjo5wf/CNyMA4veOYsYP09u+/3jNur+CcT0Cy3Dx4ZPs9o9IxAc43j4tceW99jYq
         99ww==
X-Forwarded-Encrypted: i=1; AJvYcCV0sMGXR1uT9ilFdX46PU5E48lxpR6ZTNJHRt2WywmkrFjP6AL0uT51UOddPc9NJcD0C5+2xd/X+rhM6064@vger.kernel.org
X-Gm-Message-State: AOJu0Yzdpv4V7AdqBoWNTTrUNlNjA8Ul7wS0V6tpozFpB6mFfwTkfF+J
	qSBzzYZuAEhx4pRY7uO0s2x0twIhTaAyz0NwhoL18fw8x7Hd4emrays57AZCO2QmhpGe1tW0bmW
	9vHVamQR9rw9qdAoum8MqhZWgRtet0AlCapMh3uCSOZg2CvHyO+eAZ2hFJ6ZdyEUWbDYz
X-Gm-Gg: ASbGncvqEQKkpDPKSi/nVQj3JOU2bBKu73x64suHHJEO4lyv+i2ONZZacjdwkCt6QXc
	DCLl1opRDXo8ijExOtRLSv18+tJR5bpZPOt7XMc5J+5GyK6jfp79WIwi0LitHxME7QcpS+yEIGQ
	TCt3plrKUgNTMJ1UI++dYtbClDAahutQV9I8nH7+8diIl1vaPoqZQ1nMlG7yG3OJLjb992jDywt
	wlHetHWtyn84NWfcPdfF5tSgn93YK0ddVpApS9N/mG6xALhfhYdz5VInve27oaDto0asnjAsbKK
	KmgyaGl0dhPheS295dgZSUkJBE9YmE9BkHh2mu6k5sCAgLWupw8wcfPTRiJFpbCucVv9SiBA/J7
	L
X-Received: by 2002:a05:6a00:3d4b:b0:76b:f260:8614 with SMTP id d2e1a72fcca58-76c460ded44mr2946491b3a.3.1754631023397;
        Thu, 07 Aug 2025 22:30:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE322Xtuer1nSvLoooPflfHEOze81sggfs2Qy/lSDwJaYopil6xUbkHvvn+WnhQgau0g52mJQ==
X-Received: by 2002:a05:6a00:3d4b:b0:76b:f260:8614 with SMTP id d2e1a72fcca58-76c460ded44mr2946439b3a.3.1754631022958;
        Thu, 07 Aug 2025 22:30:22 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76bcce8f483sm19278662b3a.31.2025.08.07.22.30.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Aug 2025 22:30:22 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@oss.qualcomm.com
Subject: [PATCH v1 1/2] ASoC: dt-bindings: qcom,sm8250: Add lemans-evk and monaco-evk sound card
Date: Fri,  8 Aug 2025 10:59:38 +0530
Message-Id: <20250808052939.1130505-2-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250808052939.1130505-1-mohammad.rafi.shaik@oss.qualcomm.com>
References: <20250808052939.1130505-1-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOSBTYWx0ZWRfX/SnYjnrTZ/Uf
 SkKSAvsra2NK4Sp7N2CFZaq3utknf2ESjLZnsW4L3hU2MeNmB77jrlQMAlhfP62hll47y0IMddn
 5S4obp4skb2OTEWkS63CdozBqojqPOS/o5I2X1gM0ROTmqDgm2NulIUQEMWFkZqw74A8Eo9U+5Y
 rkpYswzxyQQ0rRVn199pFPFm4C38vB/mZX2tKZkRJxJfWw2wyVoUKpa8aXcz9ooD3losdBMRp5C
 r7bc0EQDIFgzWr1SU7nHCyz9VZ9wQ/422rHXWnDa7bzR5HuOuWWrRKIsAz1cVtkDQOospCeTC1G
 cRTxRBdxOs+6fJ1CxEhnjD+zkO2zlC6PaSwy10eVT2dl5sGvfc9SSGWNgzesj75XykIQoolDsh2
 tRdo/CPM
X-Authority-Analysis: v=2.4 cv=Ha4UTjE8 c=1 sm=1 tr=0 ts=68958b70 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=kbphIXzXdx9KadpZM_wA:9
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: _eTxOsZuJQrZAhEf2jTtCUPE_KdPLvHe
X-Proofpoint-GUID: _eTxOsZuJQrZAhEf2jTtCUPE_KdPLvHe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-08_01,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 phishscore=0
 bulkscore=0 adultscore=0 suspectscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508060009

Document the bindings for the Qualcomm LEMANS-EVK and MONACO-EVK
board specific sound card.

The bindings are the same as for other newer Qualcomm ADSP sound cards,
thus keep them in existing qcom,sm8250.yaml file, even though Linux driver
is separate.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
index 5d3dbb6cb1ae..c63bfe031b57 100644
--- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
@@ -31,6 +31,8 @@ properties:
           - fairphone,fp4-sndcard
           - fairphone,fp5-sndcard
           - qcom,apq8096-sndcard
+          - qcom,lemans-evk-sndcard
+          - qcom,monaco-evk-sndcard
           - qcom,qcm6490-idp-sndcard
           - qcom,qcs6490-rb3gen2-sndcard
           - qcom,qcs8275-sndcard
-- 
2.34.1


