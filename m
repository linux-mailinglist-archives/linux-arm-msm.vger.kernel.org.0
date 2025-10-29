Return-Path: <linux-arm-msm+bounces-79514-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08002C1C706
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 18:29:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7329D586D6E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 16:04:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B919355029;
	Wed, 29 Oct 2025 16:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cOTLRBIW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eBQ1l0eU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5FF4354AE5
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 16:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761753680; cv=none; b=RaqwxjF189zx7yGMirkhAiX9d9JSIcT1+Xikm36P3XmSyXgvbC27Vghlfih0cnbUAy/tLaH3LcmskbE3tP6QS4d/pdC1dsmhT8drACUzs/IUTFTGqSkLDSZ9KKbb9mHA753R75GW6EIbk58/sC3AGZm/qItOwRgoeuN96/MhQyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761753680; c=relaxed/simple;
	bh=emhALl942H3lDPK8rcbv0sOb2ovgQxu1VqmRMFsRjcI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tp7sD9CQ2PUWvs5qeDlGqhoPWLYtTd10/ZRtATONrNs7yw0y3w7MxYzF+e9tiNuE/Dhg3O9XbQqeavyQs5iZJEpZAMyjiYld44nMgR/TFLvKOT0H+aqeFYQoY4Q6LYBgctCovSXdTWg5XI0fJeaJaSlYkR6Db2qu3HO7a9z60cE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cOTLRBIW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eBQ1l0eU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59TCIXUj3663640
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 16:01:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=MiehR/zHYH3
	DNrg1Zd+xw78LsI7244OS19/slPbVvZI=; b=cOTLRBIW7bnHGKxAjI9tFkwG0Uy
	DP5728IY+c8nUiJRB4U5rBSxLhwG9v7gsjbvZ+BJVSqN1O7/qYUpfKilUUh3m9Sw
	kAAROdE4Wr/KKAhQEbbfGeu/DGS0/RiQwbPckxNFYMdt4uhkb1iKCmiGUMOZnT8s
	RPVBuLhL8zgMqpp7aW3sM3UCk//6XD3Es2twVGs+kot/kQ0KUv5xFTxkLnnu6UE6
	ods7gzO7gEjBGMiKxyV9yFNVtrioSPrx3tJgZoTSHKRH3J4ygzJ1gjkEwSIptqdu
	QksEUJ7jpqPTRPipdkp6nVX7BtQd34zrsaJvu628GbNmSox5ePgeV5d6QmA==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a34a1u5gj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 16:01:18 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-54a87b8f9c6so4002563e0c.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 09:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761753677; x=1762358477; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MiehR/zHYH3DNrg1Zd+xw78LsI7244OS19/slPbVvZI=;
        b=eBQ1l0eUMlfodgAmG9SvIFjFkb/vA5BtwMmFYZl1eUUGsP6yOEYjRhndKGagNdSqm4
         v7ASTZHnceNB7wnfQirTz+Bhx46B2Hknr0zpvtz9XpvBU+hxcYnTMUFWxr7/LCTbFrIR
         Tw884OLgonf5vhk96DpE7/cc6v1eQ03c5/slPqhXviLahQ+iMb1mXdwRRVtjfB4PK5kD
         AbUqPLgg+WcGGPwmwkty9laAveEecsmuEzP85cBo8YVSmAQqnBzOmRpxJKu9/rkBWnDe
         IAXwH9rs7U+hHUUF837P8aS9m/TsA3/mA8crLqGUn+Ph12LXZ1Dgq2tN1SBRf460oUMC
         F87w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761753677; x=1762358477;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MiehR/zHYH3DNrg1Zd+xw78LsI7244OS19/slPbVvZI=;
        b=BS+SjwOjbG+JLq72+x36OVM3M5N4pnBdVW1Mz3tbN9FDre7gtpJdVtxOvIEaVYef33
         W5EFjWQ6xZmAgUnBhxiYVT2NZAXHz/bRCwkb5gcudUbEaEcuTs892N3Gyz3hMYfpWgBB
         gsPXO+vxYMQFU1sj4pS1VqWmU35CS0zwTUXwHnG0rtQNfIgb9+MGttoT3SGhQwgg3U3v
         0J4po0dQqvYyVWthf6Vi6bXCQuCL9/UKDiS6yRv9BTPsrcLg5Fx4Zz9ApjcfqMmbpeSX
         OHaGQoqpY5hXuuakZEzRvauGC4WuheGfP7Q7moWCvX/to4dKe17ixFuJNmDas9wAWXhK
         s7ag==
X-Forwarded-Encrypted: i=1; AJvYcCX6y+tQ2qPggCT8NM9hpJHeqgMqDvPTbC4YC6qDcx2WmaONbWGCnbbrZadbZ2xy6ryL+2SOiaOJeA7zgUpy@vger.kernel.org
X-Gm-Message-State: AOJu0YyPt8KHiZGxpNSNBU2er8oKICVoUj07dVYG6VN86xeA6PEW9QY6
	oM4CahPLD6oDTdnffVBzQmTLh+P+hZ+p6K3NcXCMBCpexY8ZgPg8XsSm00xTQGjynAuxjB9fURk
	6fHue7JB09hA4u3fjR9n1iu5SVsP45UiykbPgGHfNs0+ozO9mOYdcD/5joNsuE6pUwMpF
X-Gm-Gg: ASbGncuHaih+h9fy/f09OKTMayPmLaSu/SGiOR1EMrY+BjeMJuxrwDeErBNQxYJIlTd
	BzPOi7nC4t/L1joZxwWn0jqSbGF7YN5OEVL0ridZwfgtUCbMj9vF0GtSVB3sfy54iZzPmk46+Ss
	blBWGsNaugYitPoYD8v+fdXvnw1GOTQZQFbkP+bUF2J2pEkrgeRc/+KS81/v6YLb5Thm2UOVqFp
	tvkdpoHw5DWZNEu7uN0yFzHmMCLNQYksC835pvBwLOkqWpfn8MMwA1B48w0f21bJuXOmt6zXtDm
	Zk6qO6XxDTP1vbh52AgchyxXJkSdv0P+RTGnhJiBHgxkaka615y0MSkurDmRs0oVN1+4RwfFfNO
	AvZ62Lr+OEZJ1
X-Received: by 2002:a05:6122:201e:b0:54c:da0:f734 with SMTP id 71dfb90a1353d-55813ec34a2mr1158795e0c.0.1761753676916;
        Wed, 29 Oct 2025 09:01:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGnL4ne9FLkQ/VZ3estDP2bnXka+Spc42s99A8l5vSxio3Yq7f+MpwzMX3IWzU7vWy3vH7Mig==
X-Received: by 2002:a05:6122:201e:b0:54c:da0:f734 with SMTP id 71dfb90a1353d-55813ec34a2mr1158485e0c.0.1761753674726;
        Wed, 29 Oct 2025 09:01:14 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4771e27f7b8sm57154535e9.0.2025.10.29.09.01.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 09:01:14 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: robh@kernel.org, broonie@kernel.org
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
        perex@perex.cz, tiwai@suse.com, srini@kernel.org,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, alexey.klimov@linaro.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 2/4] ASoC: dt-bindings: qcom,lpass-tx-macro: Add sm6115 LPASS TX
Date: Wed, 29 Oct 2025 16:00:59 +0000
Message-ID: <20251029160101.423209-3-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251029160101.423209-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20251029160101.423209-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: j_HDqDqEQZ9-X-PfMAbeOwwpk35j21kY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI5MDEyNSBTYWx0ZWRfX1R+ZR5zzB0ee
 UyliFNrDn604jsJW0YVkV6L8sug7j82tiJOHzrQ9cuC7qAMPNjZvQ160JiM/CGzGr2rB9kvmQ5z
 mOAVMcbK0qTfpaOYwJ4HORHSQmdOsCrCPV2KH+pJVEfBxtPhJSOkeWL5LR4HZHxAWv3ViMJYC31
 JAOTSgsRDun3bh5NAguLOsXKzxT5W466i3wK4/DzZ+4ES4eK9N40qlillsq+SgJaEWoOdGkTWAw
 KOb6hUfaJGPh54+rnrYZLA7cWGna2FEN0PY5XvLr2kDue81nXtRvvg1bGA0kbplMHYPmtjl56qO
 tt4n2ZcWAJjcN7UAPOrxKbIGwAOMI/BL7ACLBKEOzVBPmFogl9A9T3CFtWiA39xb7nRiuiFTmGT
 W+uzgu6oQSLXvgRE+QDrlwbmbC2Rag==
X-Proofpoint-ORIG-GUID: j_HDqDqEQZ9-X-PfMAbeOwwpk35j21kY
X-Authority-Analysis: v=2.4 cv=UObQ3Sfy c=1 sm=1 tr=0 ts=69023a4e cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=ggwc2drRBbIiG4O-mS8A:9 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-29_06,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 bulkscore=0 priorityscore=1501
 spamscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510290125

Add bindings for Qualcomm SM6115 SoC Low Power Audio SubSystem (LPASS)
TX macro codec, which looks like compatible with SM8450.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 .../devicetree/bindings/sound/qcom,lpass-tx-macro.yaml       | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml
index e5e65e226a02..8dd8005d73d6 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml
@@ -14,7 +14,6 @@ properties:
     oneOf:
       - enum:
           - qcom,sc7280-lpass-tx-macro
-          - qcom,sm6115-lpass-tx-macro
           - qcom,sm8250-lpass-tx-macro
           - qcom,sm8450-lpass-tx-macro
           - qcom,sm8550-lpass-tx-macro
@@ -26,6 +25,10 @@ properties:
               - qcom,sm8750-lpass-tx-macro
               - qcom,x1e80100-lpass-tx-macro
           - const: qcom,sm8550-lpass-tx-macro
+      - items:
+          - enum:
+              - qcom,sm6115-lpass-tx-macro
+          - const: qcom,sm8450-lpass-tx-macro
 
   reg:
     maxItems: 1
-- 
2.51.0


