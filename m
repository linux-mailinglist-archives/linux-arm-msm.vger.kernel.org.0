Return-Path: <linux-arm-msm+bounces-58381-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 88459ABB74A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 10:34:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ACC663BA12F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 08:33:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF79026AA82;
	Mon, 19 May 2025 08:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HGF4TJCO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2972526A0CA
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 08:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747643601; cv=none; b=upAfQn9RNf0UNKl3E7dUdrRgnb6xJOGcKvB5FqXal9XWqiRgLyUYdIHuSNboIUFsCiFtlTMN3PXtDPuNav/KZOyioRmy6Irfz5gga4ZjKmQ9/1VvWAy/2YePdn2ckKeJsTmD7nShxi3Lw5ElhI/vEdbPl/j0qwCcxXrR8oeT3GU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747643601; c=relaxed/simple;
	bh=BCY95S5YwyhuN7eprWN+F7brDc0QM3mQom5N5iyKPjQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BVo4GDdWN1cBa+iBnoDlyvX2vjlj54wONVOiYxQm7p+Vfu3HUpXF+Fxxu40pT02/jyz40WZWY5tI9v4ZjuNyhS76ScrQSe7DxCcKwi+LyMQMYcrn4gNnOWZrgSJtxIZ20x2Er3Kalto2nVpA718K+3jUh55DwFD/DHWXSuCg2AM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HGF4TJCO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54IJnQ6s005909
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 08:33:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=BsvjJCHHiTx
	Tor+DpQ8GKlT0ZZeN/JEv0ETifCmbtVc=; b=HGF4TJCOB58H8VfjEUyt3c1jeT+
	1veTtGVBFp3jqXFjZ3dSvBryT1efjThfW+8F9V6WEPTE3+uRbVGBVGxXSicx64ui
	QjsGh/uLNtrpWvvc/NebhrpYK8tfKYXBzsoEDQ92aB8XUiGgM7btkbwncg3vGvYl
	2h/YPF+HtO/z+D+u6Cx/q2fo/BoQJcJp+njhA8LyeymcbPOBGRqp0k0so2dReK3v
	MxUvjMT9oWmc6nerR36QYl8BWx0A8J1Cdub1RQikNheSGIbzjUDxooqhkuboMCP5
	dldKV/+MDa0b2Kgu2MkCLjYvdVv6ZuDsdvPTkaZncAdoLKK7TLFc/XajRvw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjm4up1c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 08:33:19 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b26db9af463so4053979a12.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 01:33:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747643598; x=1748248398;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BsvjJCHHiTxTor+DpQ8GKlT0ZZeN/JEv0ETifCmbtVc=;
        b=Em+pUiAOk69VzQ6s+DPlO0AMu8leTfxJFb9yUQwAPGzcSRAOEbXPgnZ6pPSFWEl99l
         TAIpTbUFH3OOycoLPrKDmyfAUMypPEHuDWvoNdI4fuvych2ajItRrqBng6Px6VF1dmbJ
         RF/TKiWPTgOkPSwD2j5qMeHNKybU3d1u9US7KC1nT2cl7N5zXC9JL739UNFqEw+C+MfO
         Cdadi8J/vDvW5qP6HSVCm78CKacMP4szAE2BVWQPTyfN8SEEzzWDsnnZWcZRHc2DoAcc
         ni48OK69plmd7tJTiycYFMVUT7Nrfu6qPYJE+aFM5i1C4LSEs27kzgZLzyrPlb/AkDME
         Z5OQ==
X-Forwarded-Encrypted: i=1; AJvYcCWk9g/7jXWOGKnCH4iuJYquWk805PfE69W+dSFEwbG2CEJk6MKEhEA3LcZAsKf7iIvLyUvp+C8hhEcojpJx@vger.kernel.org
X-Gm-Message-State: AOJu0Ywu6eDojvZnOdJ0A8TOFh/QC50amWvegXfRkRs8vrrBMLrjUFP8
	VhiRlMGnGsqrOmlaBAQjSGNe4Fc7WWFCEVduZQREfnOv6ta46J113MgCDM1FfwkTpI5AL/DI7GF
	/HvMPuvO/fekRbg55YiJHNLOG7AlYRd7je6bBpcGb5vLUjjF10ZYdq5bxX0WexjELXeW7
X-Gm-Gg: ASbGncvNTgLNMRlN5NJ31iF/Ete08IUkuVFiaHi8qiZhqf92A4yy/kEg3j3Ypq/UINi
	6hvMzqZxP8eTOEuG1juWH2bBfMDWglC0XkISpnwCSfE2hj0Jf2Fpmjltdk/05Ql+R0sdpRARLQ2
	9+FwUJK443HqmoqsYqMRC82FpN3rKFlQrUdNvwtxuArbkuuWcNj/DcFEfL6GTXWAUaglPxtWTNk
	Ju4+AG3coR5F3te2tkjwuywBkyxGbVekrPvUKyNPYsIr1bnhBDw1r3QKy1wiqkBubG5a5q1bgsP
	UrGyf2VKIVQrTq61Om7q3TrY2/+O8OCr/HPvUN+ebC9UtfdR
X-Received: by 2002:a17:90b:28c5:b0:2fc:3264:3657 with SMTP id 98e67ed59e1d1-30e7d2ded9bmr22199429a91.0.1747643598430;
        Mon, 19 May 2025 01:33:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGK16vnqAO96Pzvim2OZIqPkjJATrLQNDQbP19YpepwUrlpJVdSfxpSAk8bvv0p3I37g+7Cyg==
X-Received: by 2002:a17:90b:28c5:b0:2fc:3264:3657 with SMTP id 98e67ed59e1d1-30e7d2ded9bmr22199395a91.0.1747643598063;
        Mon, 19 May 2025 01:33:18 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30e6af9d586sm7003887a91.11.2025.05.19.01.33.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 01:33:17 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_pkumpatl@quicinc.com, kernel@oss.qualcomm.com
Subject: [PATCH v1 1/2] ASoC: dt-bindings: qcom,sm8250: Add QCS9100 and QCS9075 sound card
Date: Mon, 19 May 2025 14:02:43 +0530
Message-Id: <20250519083244.4070689-2-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250519083244.4070689-1-mohammad.rafi.shaik@oss.qualcomm.com>
References: <20250519083244.4070689-1-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=dIimmPZb c=1 sm=1 tr=0 ts=682aeccf cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=kbphIXzXdx9KadpZM_wA:9
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: LLioWM3N_BvAdvDjvrRoCgwGkoZZe3vq
X-Proofpoint-GUID: LLioWM3N_BvAdvDjvrRoCgwGkoZZe3vq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDA4MCBTYWx0ZWRfX5N11xp32Z3uc
 G9mpVjvZOj81DI29MTmn2mWGhcPotzzHejxaxmSTtXWMEZdn3UZBtx9Mkya5bn8AiUi5ueEpfxd
 86G0DKcqIRMXClRcrBRI50cS0Wf0leNmikkTKE0UqMoofbz3T3vmfA36aUyjWFljxAqDmRXYZ05
 csi5ZYkWGIFwn5nYAP8qigF9NZXQpVDrTuc86GjWv+RUr87mDo7gYJydSuiS1PH3Ud8Ah8GmRqj
 vNKJgMUTTRqypQF8Avk2qewNS+T/ONxoKN5b2Q0CEUvPq3LVPDxAg/N0wLAv3IIm6hTMuzDiV+O
 YwId5ZP2jUj6QKe8cW5wEXsbjv+Cn2WkuhE9h9fKOnyKU+8+d24dmp+mxsVQj0vwN54pM1PuJzn
 V/mHAIVLnqY50c6imlSF2VlIj/OXJTlszOZqCOBFkTgztR8u7H5HUMsTiXXXj73lNgERKAa+
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_03,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 clxscore=1011 phishscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=999 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505190080

Document the bindings for the Qualcomm QCS9100 and QCS9075 board
specific sound card.

The bindings are the same as for other newer Qualcomm ADSP sound cards,
thus keep them in existing qcom,sm8250.yaml file, even though Linux driver
is separate.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
index 4e208cb7f6c6..5c6e990dc55c 100644
--- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
@@ -31,6 +31,8 @@ properties:
           - qcom,apq8096-sndcard
           - qcom,qcm6490-idp-sndcard
           - qcom,qcs6490-rb3gen2-sndcard
+          - qcom,qcs9075-sndcard
+          - qcom,qcs9100-sndcard
           - qcom,qrb4210-rb2-sndcard
           - qcom,qrb5165-rb5-sndcard
           - qcom,sc7180-qdsp6-sndcard
-- 
2.34.1


