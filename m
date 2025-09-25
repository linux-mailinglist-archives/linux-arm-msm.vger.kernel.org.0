Return-Path: <linux-arm-msm+bounces-74802-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B02A7B9CC49
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 02:02:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B08E91BC0A4E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 00:02:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77B311F2BB5;
	Thu, 25 Sep 2025 00:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iUBilzg5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E02C91D31B9
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 00:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758758493; cv=none; b=ROMaagXlOAwpLoRCvii8aLdasVKQMpRQbGWPAngkr6WuFHUnqOy7ilTttx/6RiFfE8Hoq3qb7UDZ9r7aEvyxft9iyRaMuWYwdIWpMxWBgkkAp0bhjq/MJ1oiASEb6877Pb17GYj5389V6zRvOKE0WeRUjmttN7Us0+5n7q4+/4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758758493; c=relaxed/simple;
	bh=wUjm9tiuEjm4WDKMtLaEVjupuwrzCUIqav7naVhiw54=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jMGSiP4+gNyEHw7nWYI8Lb9w3dcF4r+yrUyCneZM3LLqo0N4hO4rRaJSGARlmfSlUrrQDzRYHO/BcALYBveTjbINeiyZ+JySeWxcY1WxjszicwNHsZzCT/9P1GBkqEFACBExJrFpbWCRIDFQtjxObMZM+dFSgoipXfFQ8OPCQC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iUBilzg5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58OCl5AH016458
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 00:01:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K+VNJSBTVMlxlPAe2fqelqrYwMmiJ5bopSAQ68gbNL4=; b=iUBilzg59EP6OYTr
	+nXBQ7d4JD08A9ShBno9C8B9WG4hf0zL6L9w52Jk9PWj57txMH7gBrkAKkba2N8M
	ROPvus/m+FpfOFFAcALRj4TIHzB5p5tIZZWWhYm7KLxKMW6QuyeZLS+mNpY9JIqa
	stDxsGHhawjUzwC4XFAFv4xXqlV0C5uVjOLiQmfLp90M2Gqr9kMYitlQULtkGvuB
	PU8VX7UAsNNVibpO697lAuVrJ/F3BgZZWHc/o78KKh2RIjQrlFyEH1Vpey3TXPk5
	e8kBWMrzZNM5voSowbKCHNe815ib1k3UXB80hG2hRzgX6sxFxau/fjNYtiCrjr8S
	olsjGA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49b3nyhwxp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 00:01:30 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-77f14f6a553so1373004b3a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 17:01:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758758489; x=1759363289;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K+VNJSBTVMlxlPAe2fqelqrYwMmiJ5bopSAQ68gbNL4=;
        b=RmteQDBSJ3uiHnxmoalqKGDd+HnMgGa/y1AxSsN6aArvgdCjuJQuUTbRkpBQd4uFLn
         i/zF9pdApp+uxTN3yVZRrGvb1xNZI5QDlvaH6SM1dJYmTyMxJk/z5lk2eHrv1yafKUJv
         ZB49pUHwR7mSb/VaNS5E5YBb/KZHeYVqZTowtBGfaYJYs9Sfzftp2kFO/sWTxVgYX8mR
         xenvNTYEKp/5lhCs9dZte0gIz1siaLjT3ZowoIaOuTbXly/5Pic9LlSsKEaKduRhhx0B
         5Z8EpxsWxqtjWSffXMOMHdpRQwtlLUc7X5I/6p57Bi9WvX3n3lZWdt3ot64uZ/M97Zr3
         Dp/w==
X-Forwarded-Encrypted: i=1; AJvYcCX7rveSAxAMOerQnixdh6v5xJKLYvnK9QkxRWenjrJH6VEVp7tj3ynMLgQINZGwMaKpwWmabXiQ6In1am4Y@vger.kernel.org
X-Gm-Message-State: AOJu0YxTbiKg6CC5YCjw6sFKAlHItjD5nUEj30W9aeKDRjHiUOmT8rka
	lmgBWl59KRY1ILH6oi7MDn2+Lu34UM4/AGJZzySTWS+GFPEbJ1oApQ1dim2Hm+6ciaYGWBxOxt9
	W4553bYKc6L9Nf3D67yxD8My5kXdtaaZl+xUiYmpYK4VBt6xGb2zf7QVmTxzAR5yxFC/n
X-Gm-Gg: ASbGncsqh8w9vwTkfcE9jf3yCwu/mv+nlH+dFt7EjvhcKnrupm9Sg6ZcXnetP4aKN7A
	Pn3qKKFp+IsRKO7cKJxcqYapWmSBvo9/U+NAXBRULpPAFmEnNfdIYUUQYAyji2TEbdc0SWIWY0n
	PILDewNBunwmvXOrl+KRPnizEB5WzFOfgmBpkTZRAHGh+MNjuITspUQanOAMph3chSPtlxLb+zC
	CVdvEHQ0UOMcaqAODs2IvkwD4lcAPXP03mis8OgqbzVJ8EFtaLlJ4XWodb0OP/eJztz4qclpFlm
	Num+HXC8aF8l0XAaUYbhB9si5fNHmQGDYT27xA+BFiIU+y7EdRc2FIiQ5CwirENdv452Eoii9rt
	9rtn31HE52NYy0qk=
X-Received: by 2002:a05:6a20:9151:b0:240:1e4a:64cc with SMTP id adf61e73a8af0-2e9a4162879mr933806637.12.1758758489178;
        Wed, 24 Sep 2025 17:01:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGeVc0LEM1JDvlKULdAll28E9OqkAmHpBcwknBmGejhHBznxK+9gemEW+VfwDBgDToKJcZJQA==
X-Received: by 2002:a05:6a20:9151:b0:240:1e4a:64cc with SMTP id adf61e73a8af0-2e9a4162879mr933742637.12.1758758488646;
        Wed, 24 Sep 2025 17:01:28 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b57c55a1bafsm423152a12.43.2025.09.24.17.01.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 17:01:28 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Wed, 24 Sep 2025 17:01:17 -0700
Subject: [PATCH 3/5] ASoC: qcom: sc8280xp: Add support for Kaanapali
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250924-knp-audio-v1-3-5afa926b567c@oss.qualcomm.com>
References: <20250924-knp-audio-v1-0-5afa926b567c@oss.qualcomm.com>
In-Reply-To: <20250924-knp-audio-v1-0-5afa926b567c@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rao Mandadapu <quic_srivasam@quicinc.com>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758758482; l=763;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=AGoAWCmgVcAO74JQoXvSUhPyLCFGBo7GIPrJwjsAmHg=;
 b=OWGKP048rWsxPP8OlddpC+6pb0UowE1EXcygO5YxeDAWbovUNlwPXlHNZmtYU24Rp2LhrI6QJ
 v+fmQcJW4/SBjG3dYBMgxRb/eqeRMjZwHOTvvqmwOpF8wi9jUNaK0hh
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Authority-Analysis: v=2.4 cv=EuPSrTcA c=1 sm=1 tr=0 ts=68d4865a cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=GNlvlv8D5CiX1CDg2F8A:9
 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: 9v8AZtwNL6UGAjeur4UzfDJ7sPyxy9F7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIyMDA5MCBTYWx0ZWRfX/s88s6WzLj1h
 r8k/P4FCLwrBIDrEv/FGqBrTrAedKgc5o/y1wgYqTEb3XgiVx01Rsu8X/iCUD/B88nB6tWthgp8
 GX16bg69yR8o4dz0jODTFNDpPt+pj+2Oh0n1MQx+ff02xTkL4yIKDIa82Y50JXxYaeL87NRXYS1
 IXWvXmEeNEwcxzhQRZsxVPXcCjeBR4lgjHjaOag8SoCUVc5DC4oyAvx9606qtsGB8Rx9c/sZ46j
 Fx9v59NHLhn6H8ArY6I34vFffvpj04Vaibblq8fzEx7kq3QHww2Xa3b7D1JXmyMZ7tNx7+J19dq
 5vFYEV9ixSw9sfI2wBGZagF0AQmYqRFi6K5URM5BnZh7Eek6NREmP7paOzPqvKscJPNLomf/nD5
 FmbT0nj9
X-Proofpoint-ORIG-GUID: 9v8AZtwNL6UGAjeur4UzfDJ7sPyxy9F7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509220090

From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>

Add compatible for sound card on Qualcomm Kaanapali boards.

Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 sound/soc/qcom/sc8280xp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
index 288ccd7f8866..e231112175d9 100644
--- a/sound/soc/qcom/sc8280xp.c
+++ b/sound/soc/qcom/sc8280xp.c
@@ -198,6 +198,7 @@ static const struct of_device_id snd_sc8280xp_dt_match[] = {
 	{.compatible = "qcom,sm8550-sndcard", "sm8550"},
 	{.compatible = "qcom,sm8650-sndcard", "sm8650"},
 	{.compatible = "qcom,sm8750-sndcard", "sm8750"},
+	{.compatible = "qcom,kaanapali-sndcard", "kaanapali"},
 	{}
 };
 

-- 
2.25.1


