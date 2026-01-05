Return-Path: <linux-arm-msm+bounces-87509-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 39438CF43F2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 05 Jan 2026 15:53:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E31793043A4B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jan 2026 14:47:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 704C0286412;
	Mon,  5 Jan 2026 14:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ai0FGE58";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AZoJo8MP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C4A029B793
	for <linux-arm-msm@vger.kernel.org>; Mon,  5 Jan 2026 14:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767624428; cv=none; b=QCR9C2K6Sfifa7TjB7/Qd2MDYxCD6jbZ5IMhRwkFaC5az7pp3UB8fprDVd3osHYIy52y0apnFl0qxMDJU6ksPMcdD2c9c5dv66Dv6ewe64mH5oEXY1/FAtY29O9m3Xa3xStgxcW68xolpa8U6pZUa36mD5Ub5SHNh+WqsQy1v0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767624428; c=relaxed/simple;
	bh=D4EdTDjAofl/keSmVTh77/IigDjeFsACMhK9OOnUjuc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pB3nTJ5gFsqDniaYJehkplrIIKIBq9PTzoA9PtByN1ygu6D1bkt+jgaIjMg5snPK2kQ7U12/0+9FGlBo2WR3+dx43GaWkRhzCmucU25dKyWesqZHUksf8p9/+vcKguzlAu06UuxfrC5BaJUwp/oN/T17mVklhQWlC23mx7IKYKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ai0FGE58; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AZoJo8MP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6059d0KC610666
	for <linux-arm-msm@vger.kernel.org>; Mon, 5 Jan 2026 14:47:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=JhBKVlQJz49
	+u6EBIZsBHwU82kPiFaw4dCGsqDxkSPM=; b=Ai0FGE58MpUcrqs8vOV2GOuMKxc
	szUJlwEjGUoH0ctemgjsogNFWidmd8+xghDuDAjWPMELWwhBkeK+wLYfF3bcqslo
	e8Rluf6FETVTGKkkmz4kp6DrLb3J5uuZqLbFQbOrTkl4Z9/3H0/imgfnFIwPlseY
	wJcE4tRibZwlUIAIFiXNgKkcl7Eo7kWAeqIRY9TxeajF4vAIQ6Dwqv9XvEBS4gWd
	foEtqh9pkdris/MK99VKJW8FTAlqrMLc2R/qGWdMkReq1P5xRLg7Yc9zWkH4y15g
	y5cLGSg66FRpYxPD0tK6bcJyXuVntQ0zbmbXm4licw7Q4ja7Woc3UOI+R4Q==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgaus0rp3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 05 Jan 2026 14:47:04 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-34c38781efcso20087a91.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Jan 2026 06:47:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767624424; x=1768229224; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JhBKVlQJz49+u6EBIZsBHwU82kPiFaw4dCGsqDxkSPM=;
        b=AZoJo8MPoJKZnVcoYCZu2GFxZQZuGhhkInSBnBeN1p7ZMzO081pAWXEMCwCH4bgZIn
         yPjGPc3z+gJ9GT+wBz9kUPyfaptLFHettkT0LUqEli/mAy/YwYFwSA1Gs/NKH2j7odfw
         fAfzfWiIz6yzqP4SQmBWeV8FTQ/spxNi8M4zrO92Ca/x8EiUmChXiwvRkXRDhr4Oh017
         LqlayNzkMkprf5Ambdh4N0TEhGP4M5NSKZyLxae+dKDZwK70SXMfvDRajrqcj8HU5Hhp
         8/iiR4bXh3UYmnpEy1DiWcegfyBrPZY0JmdnCAltFY+EdTHdodP2corWyryIzbzX7uKX
         7jEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767624424; x=1768229224;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JhBKVlQJz49+u6EBIZsBHwU82kPiFaw4dCGsqDxkSPM=;
        b=vCnY7WOvXrZy8g8BJldBJz3CIKqwyQad8/yf9IYbd4RutlvmnDE2L//mQO537e4q4n
         T/5TuybgLNovs3JDVgub1EVUtu5IPS4NpqmF0CprQQdlN2VIm1IswKZcoA4b7Qsf6wyO
         C3HH9TCPX4oxsgUtDvCLvDPO4VR9zm36hiICB6rmI0j/gTwipAv8mjDvFMv9zJeFkVSJ
         QAoWYioQ4ymgyNf4f6jMer1uZLThpX74sKuZH3HR37/p+ypZldkGndoWjaYPy7v6hScP
         tsGEn4eDcnxUwn6UmHL0e7dnjTARca4yV23oMmNl7IUXwkn+z061WMVJ9Ou2NFwr09en
         FLTw==
X-Gm-Message-State: AOJu0YyUSZ9n1baAAhgxoEi62ve55vkgIcUHX2++uZrsI2kUgn3c9VnI
	20Bmru2I1IKcDZTw3B6AKrXEMxozHZFLVy6n6ZqfUO53fg8yYCiQRNZWgfdYy6gcDlbvLSXmsyW
	PGIKg7a4F8NXsNBQi9/fxGZ9X75n51ew18GZ4uW37uXtx/TB4IMwXyjBJ/0+al7X49lR7
X-Gm-Gg: AY/fxX6DScNCjJ7lHQwh+fRuaF+WQG/J8oD1J+DutlslT6uSd82pmG2pgssqW/AceOs
	g0Xa6RwFeCYId26gDa/ZEF/lDDgLqZUe8sP5Nbjqk+Zo6MxoRbDA0H3IRdZbMJ0YYCkxqRbbp3T
	/X8RoCKIcHVQL6LmhV8zygOr3DDwamNq3BCKsFXIZ7e9Wal/xdppixIA4JpoYmh1p6mwX7nRDdl
	SvmUB/AGg+mTCHk4Y0mtHF7uNFbEqFyCxJmx31jOTflKFYTXb6lG7XL/65Sj0kpmh+CNxahNpJv
	e4BaHoEg7cMNIMLZoK9GdrhMMV0ibn6sgnEhHswfu160pL+SDecgU4i8CHwjowfH6RaMnb00lRu
	8zykkqBgWooDDG0aLlfHchOvIMSypX8xnYAKoWky6S7rL6inqhAWA
X-Received: by 2002:a17:90b:298:b0:34c:7183:e290 with SMTP id 98e67ed59e1d1-34e921eaf5dmr29670302a91.31.1767624423795;
        Mon, 05 Jan 2026 06:47:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGSOJMt9LPpStimWUWAc3THDarK/RDjttBLCdC3rkMFxijAsvfUDvaknO3V83tRQ9PNeE5XzA==
X-Received: by 2002:a17:90b:298:b0:34c:7183:e290 with SMTP id 98e67ed59e1d1-34e921eaf5dmr29670272a91.31.1767624423306;
        Mon, 05 Jan 2026 06:47:03 -0800 (PST)
Received: from hu-pragalla-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34f476ec311sm6634868a91.4.2026.01.05.06.46.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 06:47:02 -0800 (PST)
From: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
To: vkoul@kernel.org, neil.armstrong@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, martin.petersen@oracle.com,
        andersson@kernel.org, konradybcio@kernel.org,
        taniya.das@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com,
        manivannan.sadhasivam@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, nitin.rawat@oss.qualcomm.com,
        Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
Subject: [PATCH V3 1/4] dt-bindings: phy: qcom,sc8280xp-qmp-ufs-phy: Add QMP UFS PHY compatible
Date: Mon,  5 Jan 2026 20:16:40 +0530
Message-Id: <20260105144643.669344-2-pradeep.pragallapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260105144643.669344-1-pradeep.pragallapati@oss.qualcomm.com>
References: <20260105144643.669344-1-pradeep.pragallapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: PdITqDbGmeDc3SRLwlNVwU6WWPE9MUCc
X-Authority-Analysis: v=2.4 cv=DP6CIiNb c=1 sm=1 tr=0 ts=695bcee8 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=0Nzjj2pCF3-L_PL3nR0A:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: PdITqDbGmeDc3SRLwlNVwU6WWPE9MUCc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDEyOSBTYWx0ZWRfX3J/lhz7zzeF0
 UNArkx3h+8U9U8ep4JjGv5CXfzfJPM4UlWBrxZtDy3h3eaqcj9kXGAJY5I/VfNOuHV4EdvExBwA
 RIYlnd94PXQZl71EVUpVzKAlKUhMWMhWqwKROTNgjGt9RBD4iz1RWQ/qeSLPs/uf/XHBPXrhagc
 VOcyUW8aVsIZANkaNu3hJ1sb6mdbLFFf2y0BzS7B1Jm3lAcCjicJDaxfzEeYZlHaOV5LkGRlUPW
 8VwNxThEbuhIzp6P8AbLq60e42g502kUwXXo2qC9cewNEeJpvDC6MfXylgeasU2AT+JGcMbk8uf
 EQRfYwUQw3PvgixVM3K/WFPT2DyAWASBh0kRoG3Cia76e582STL+wVvLX+hiVD6qI1nS5JG0IHE
 UN7dcognxW1iQ8tWXkeVgTmODH+ZdWwmeDJhZfFVBCX7jOR9v+i8wf5tKYGWNRWRuaxuz5uQO6a
 d+F+/UC4B57+AunDpEw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_01,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 malwarescore=0 phishscore=0 adultscore=0 spamscore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601050129

Document QMP UFS PHY compatible for x1e80100 SoC. Use SM8550 as a
fallback since x1e80100 is fully compatible with it.

Signed-off-by: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
---
 .../devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml    | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
index fba7b2549dde..166e3787db58 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
@@ -20,6 +20,10 @@ properties:
           - enum:
               - qcom,qcs615-qmp-ufs-phy
           - const: qcom,sm6115-qmp-ufs-phy
+      - items:
+          - enum:
+              - qcom,x1e80100-qmp-ufs-phy
+          - const: qcom,sm8550-qmp-ufs-phy
       - items:
           - enum:
               - qcom,qcs8300-qmp-ufs-phy
-- 
2.34.1


