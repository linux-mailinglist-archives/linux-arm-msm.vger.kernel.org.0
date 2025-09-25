Return-Path: <linux-arm-msm+bounces-74801-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7675AB9CC37
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 02:01:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B8AE64A0D62
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 00:01:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C1BC1D63F7;
	Thu, 25 Sep 2025 00:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J3JG/jjX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DAAA15665C
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 00:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758758491; cv=none; b=qWY9RoT3S/Gw0vPoqQqh9vpfImDpFFuzb7/3IB2gSIfk6JbxkaQwauWJxWj+mAYllX+Y/cIF0f56GvxtYRLiCve+cc4nf5WSCSx4UKupd3cVksabWB+EAy7mfVkvq6jsQ20sRr5/SU+P62IV2IcxAW4l+P0dZlQYbnKUMTW6eLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758758491; c=relaxed/simple;
	bh=2S7wvWXh52vu+wnRGR4BJ3o9wnSisMc90P+h+1e08P0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Cw7R4BPkMpT09QwLRkV550Eh5qYywT4q+UsQLJpk9L38f3xPyFTBnxQfzlwu14YO+J0ZeCJO3qtQitROPII6cYHiIKfTsqOQlO3TTWA0b8CXabclkmTWzeYktzaozFEFz3hQCSFb/b/F09G34mkvOcPI2nqcUdnDnn7U8rZyODw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J3JG/jjX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ODdFLq017430
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 00:01:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n0OEBm1RnS26Z+eRtG67meW0s1XrkCDmtmh5F61o6fY=; b=J3JG/jjXnjU9J6kh
	HRWik2cqrz3L5uXVC0Xarh43HNyE2gxAxt66SDMNXO2wN2KwSzTkjscx7RDH2ypT
	OQzUA/mD3Qi/jXrydDFlXgSYMcBB7FPQBwIfm+4fdqSd+Fr0XhJHje2a1BIWzDWY
	S3onsTiYMY80V0396B7iT0tmYN89vIaK96ccpG4p64YMZKV4B+N25+mdVCQVwo6J
	GQWzVrTgDwSoGUHSn/ZSBoQ06BdxhZCcXYN+ZLe4pg8yxqQiXZqHm7tEiwXow3DY
	Drrs6snLHqfcYa4tUxvWTMdtd9iqFq7i+8QAkadvETPF8WPMzd3zOghPuWFfrtDQ
	dJ841g==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bhvjyek5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 00:01:28 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-77f2466eeb5so256991b3a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 17:01:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758758488; x=1759363288;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n0OEBm1RnS26Z+eRtG67meW0s1XrkCDmtmh5F61o6fY=;
        b=fO6sk9cLAUUVKz7V802HcpQpqWn6j1hNxOFk2qsIrkjJdfK1CDUpQ7i5bz6khDnii7
         xYGfNS4dS7y2bZ0OBpGk9LxdcAZ4N2ViM2BKtD/nsiobzhpW7syz3ORYyCIcak4XArAZ
         084s4qGxHeQCgqSNK3DSUMSia+oAdQCxEzTmqgM2QKwxBO1c4Y7VH0ZEZKKiGsqRL5ws
         DBU3tYjCQfR5eNZBPewEuSN1Rhd9b3oKAWIElrn0A/mFwnGo7chvXU14DQuT+vKF6/T+
         Yia5rPEE5vZ9JpyxbNjrJgADJ/cas+8xefs8J+xEKJl4XXYFligPukHhAm1CfPYCfsU3
         jBqw==
X-Forwarded-Encrypted: i=1; AJvYcCXNT94ECw2gH5qVanSKClU+3F/42eWXk7qW8w/Dy8KA4rWNFf/3Rr158N6MN0W3ayWX2dIY72UztMRRogI1@vger.kernel.org
X-Gm-Message-State: AOJu0Yyf6opPPKoxHPpeCffUGfPA2InH7gC0gX6Pa+mtPkmLlEekarOG
	iXQ9mbtMAOYBOY+Cep1tQ12bzWMmRLrc9HyEi0KEtd+tjAGMd1G1H8PUIWnzJmIIP7i7USmVNlJ
	zJ47Lu+8zjl18QXCcMDCeWGnnyZlxd7RbXGIn549NNDv+2+boWhvn9s7yFtWNnbSNHpKh
X-Gm-Gg: ASbGncsMX6D0Yv51dKLsF9LU6XKv97yy4+YgaradEx58ToXW1nZptt6RMVaxYmIQk0p
	vXx+FUOsQiISVFQvPzcB7gB8SUyz1DhdnCybnbEhb76iDg227yrnPPke4jOCLJpvrjtkpbYnL3x
	9tjvL07dK897N33teJDJv58k7SrVtbFliJ2wTBlmMz6Y+ahPZ/gnPd63SGvrKLqZs+VyZRllKyL
	hiCrITSiXW0WuMjxnU01X+cxfPdKCbFBwr/6KVXpI6Ojx/AwxfbUDR00WVrk3DtlLMp0FQU7mll
	aJczzzFcyx3ti57BbzVtk2X/rdTasmDcU+9TbLhNdIfXzu93qoNouyNGcSQ8N6pJi5Zh/3Iulbl
	6sCofpUdpj2+yMkE=
X-Received: by 2002:a05:6a20:6a26:b0:251:a106:d96c with SMTP id adf61e73a8af0-2e7bf478c02mr1819137637.10.1758758487669;
        Wed, 24 Sep 2025 17:01:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGzNuh3Av7R4gC2b8bh95S8AHR2YvjRgTYw7k8EaoMUcQxNqLDTZ5+Kh+DD6EFGVU/5rSBkGA==
X-Received: by 2002:a05:6a20:6a26:b0:251:a106:d96c with SMTP id adf61e73a8af0-2e7bf478c02mr1819075637.10.1758758486852;
        Wed, 24 Sep 2025 17:01:26 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b57c55a1bafsm423152a12.43.2025.09.24.17.01.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 17:01:26 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Wed, 24 Sep 2025 17:01:16 -0700
Subject: [PATCH 2/5] ASoC: dt-bindings: qcom,sm8250: Add kaanapali sound
 card
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250924-knp-audio-v1-2-5afa926b567c@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758758482; l=903;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=/I5Gh2eYLKEy7ErQmMVLe2xAiiZ0xMLF0xKldvwzBHo=;
 b=bPIPTCEb/BeOXHS2eoDQIMQ8sca42xqvYdM4rkqZt569KYm880F8rolGAlZZ8emwzp8bsy4jQ
 qob/B10CMOlDWm5qg2BPkSn3LkOJjHLFK5byvJmjZi4uZX37sIRdAEB
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-ORIG-GUID: eWXnbQGWBhFuQLQUx9QacRheFZAAUzWF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDAxMSBTYWx0ZWRfX8QyXhpHTI1XN
 zbGvPPdp6NRZuD1TlHQJ7b4obcvb6PelHDafxfaltw8xN/NESDBNsm8OxEyRx+/7GM8SuFqKCoQ
 eFuEq5DD9Zn8Anf01enMd734vV/2WPDybAYZjAw5Yvzu4FTtd2RM0ZHi1xgtVxXe8OOXYZr0oYF
 TGTijL/2PdpLm4RfVtyFqn2zz+v7+/sAW9z+KN0HDWhUPrzqRLx5Gpk+qXvqF0J47JEs9NHAr6w
 pLRw29sdz9koGyv/fGfNco3nODDzP09UR7TnSyhJF1/2jFRis7yHHtQdmorX0vskksB6n9OXZPM
 26IYZ/BuGgxUUoy5DSG6o5z/M6MnQVGj3qJ4zVhArM+ncj66Pm/68ofW5/AO0Tv+WtKPKD935DK
 ouNFNlxs
X-Proofpoint-GUID: eWXnbQGWBhFuQLQUx9QacRheFZAAUzWF
X-Authority-Analysis: v=2.4 cv=Csq/cm4D c=1 sm=1 tr=0 ts=68d48658 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=MCV5zX6qGx6s6p2FbZwA:9
 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 adultscore=0 impostorscore=0 phishscore=0
 clxscore=1015 spamscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509230011

From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>

Add bindings for Kaanapali sound card, which looks fully
compatible with existing SM8450.

Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
index 8ac91625dce5..708bae805403 100644
--- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
@@ -23,6 +23,7 @@ properties:
           - const: qcom,sdm845-sndcard
       - items:
           - enum:
+              - qcom,kaanapali-sndcard
               - qcom,sm8550-sndcard
               - qcom,sm8650-sndcard
               - qcom,sm8750-sndcard

-- 
2.25.1


