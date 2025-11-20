Return-Path: <linux-arm-msm+bounces-82662-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9557EC73973
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 11:59:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by tor.lore.kernel.org (Postfix) with ESMTPS id 7DB142A8A5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 10:59:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D81CB1400C;
	Thu, 20 Nov 2025 10:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nmSzkbrf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gm7b5nVx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 970DB5CDF1
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Nov 2025 10:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763636352; cv=none; b=GsCw4/NB46yj4LVEkcKOQ8SzTx0nw5l2q6+mp6lmKecoiFCgSUejeXPYnZX9nbBgksfyi9+HvNKslS3FvZJVOq9fMnmhu+IHUsn612Ll615Dd8Si79gK7Ipe/jhpltD/OMqFZg5IyE86D8rOlGUMphrnymn+CLVstpwMfJULMGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763636352; c=relaxed/simple;
	bh=MMyrdWJs9/Cpwx2SkJSHBAAFvYmJOo8X+L3Zus3SxS0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=sjaTHFmpJhFZdVVML+YdRMsO7a+wv7ajNERU3Y85/Goh7gB+fTLAb2aOMSgWMteiUhEa+wKKH2y8IY95jEb3o/dWU1YwMbn5h53j9NCMMazP+unuZd1kywoxfC9EkYECpMASzkkc8D3eU904781m5VWjOJVI7Xmts9cTldT+KlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nmSzkbrf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gm7b5nVx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AK4pacw3757679
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Nov 2025 10:59:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ltEfc3tmTg5NVbX80+9NV2
	1uXXJef16Jqb96lgnMHMA=; b=nmSzkbrf37JA7OHfnPb0ctT6bPI47qXlNsR79u
	yE7qrh4LSUcYLkHikc5XkY1ZB8jVcWlNUqCVnY3621vqsaSVfWImB9oUC3ga+Dxj
	GRltLZT06nR8zBtajgap4dloMcmvKKYuRdRPDLLo5b/P6vroGS1b3PZ7d+ul0qOF
	JKg09Zx+xzCYC579NMx6nGh82b0KQQEUQdSZvJpewm2BcTxUfsGuEKBQh9f00eb1
	DpUxRaVyzFUtpinqG8xKN1NqSW3336IRsKrkS75BysvDGtoV6tf4j1qCyPxH50oC
	BY9xV+n/q21RyMCXiyUH3bkncdM0F2tBCb9c9+jTltRTW1lw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ahs2e1n8g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Nov 2025 10:59:09 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-34361480f51so197814a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Nov 2025 02:59:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763636349; x=1764241149; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ltEfc3tmTg5NVbX80+9NV21uXXJef16Jqb96lgnMHMA=;
        b=gm7b5nVxloZ3I6NkkTd9DrhH0Lj5JWCHFrBphryBSlkO52XXR1Nol52lueMdp4natk
         etJRqmRrIVCiTfQmeksvrLczVpc9j5P1RB+S8lz5AEWnV7wpbbYfEu2RbGx9nkxcHXf4
         OBzVtzEpCP2gXmwXPSUiukQ86g+MQ224a6pRYvaXGDtc6hRVNxf8Vuc7koxKdOcRjiTz
         TabrTOi6TJ+9pZfQSSJzybtEqudZp3mvz8y3gBz/Q6rG9Zf61QTk5WnkOzz3w7zEQ6XD
         BZ8FllUoYpibV079gdYowyORllEwzIzpGWsobpGTUgGBPeBEAr9r/L69qqhNYjkEIDzp
         II6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763636349; x=1764241149;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ltEfc3tmTg5NVbX80+9NV21uXXJef16Jqb96lgnMHMA=;
        b=vcBDsOcqtjbZn5r5m0U8+45LpOwmjfbna/CSkzSXMh1RaWvks4TxSg9rnsBI3smMbh
         SK7iwQy9xnLflN7VWoSKhkdkECSQ2JKjiPLMg4YSDTVAN8jqxrjYDbk4/nUP3+rsesMQ
         cxJc4HAexsBpz5cmv4qFY9ggl12TbyUMPuGH/YnvcuVpV2GfVA7hJQ4R+meLMcUPuKsB
         rekwIeU8u4oFgdF9rFTNzT5rxIPQJWonSvGU6xYMzXEpGfGDTFOdwjpowXqptFWpE5Cu
         OgBCiGlP/w2LH8LSk1nzsyDYJ1niOqyshbximcfYIjpTYG4Wh0mKu7Dx4avi9n8BLDmj
         ezRw==
X-Gm-Message-State: AOJu0Ywgl1kMUETEhLUm8wxxrsQPxF1q5DZbKHTgJz3loOy72mazHJeH
	jltlL6WDcGohZsCbuXek7W1GAe/+w5pChsz41tfK30//GpvKhi8c8+VrQNZHwbdcWBQO/bJSbdK
	Q3r3I1/dbuSX7IdDde6JAFyPWVOHm94/KNTXrgUijdTGU29UnK92qMPbZDm7AfJHeEIaE
X-Gm-Gg: ASbGncuzhwoGN7XYbbqgOph0bk6KcL+jCazyV/I9U9fw3iyDJoqAHzSGDjMkGvvsU6+
	/ZrshUFzxEUj2D8q60JxLLnUMXoYXBezhwBtq8ymhh8sLWukMAsZHCkRlbjA3Xm/teee4MiJx3A
	YXO0kMUw1IFaXQHFvNKmCf9v9j0C27/Y8GgpO2OR9bbFPbyYOprViZvSW4Su35pDimqP0R3YyTD
	xt10EnM2DUChaAS+hB/lx/ekNyGcz8SUTlijz2huvsEJz5yoyLzxtUFCFle99g21QWyjHtBdXgT
	rpxQ3MQMg1p8dBCPaEQX6OwJexyAHTNuvJNBqsztMZKqPFXyBgOl2FzNBPKUGXVdDef27m2rFj3
	Xz/dvDF9SoKXe3uQvhcPZLo33j3xGIC5tcR7L8dQJyI7kKWwRhP7367MhAqyaRS6jMUMP1vKGFc
	ePkEPoVR6LN+k2043CKf8jHdqAR/jExQ==
X-Received: by 2002:a17:90b:38cd:b0:340:b501:3ae2 with SMTP id 98e67ed59e1d1-34727a37604mr1794742a91.0.1763636349291;
        Thu, 20 Nov 2025 02:59:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE+x9/NmEoJpG8eZlQA/oqHm5RP2EdYKUawRVhEB0Hq9eDfr5B+V84IIJ+0Mx1WxHjdDFca1g==
X-Received: by 2002:a17:90b:38cd:b0:340:b501:3ae2 with SMTP id 98e67ed59e1d1-34727a37604mr1794728a91.0.1763636348779;
        Thu, 20 Nov 2025 02:59:08 -0800 (PST)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3472692e5d3sm2248944a91.9.2025.11.20.02.59.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 02:59:08 -0800 (PST)
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
Subject: [PATCH 0/2] Enable lt8713sx bridge with displayport for monaco-evk
Date: Thu, 20 Nov 2025 16:28:04 +0530
Message-Id: <20251120-lt8713sx-bridge-linux-for-next-v1-0-2246fc5fb490@qti.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAD30HmkC/22Oy2rDMBBFf8Vo3QmSxolkU0oX/YsSih6jVuDIs
 WQbQ8i/V6mXzWbg3gvnzI0VypEK65sby7TGEsdUg3hpmPsx6Zsg+pqZ5PIohOQwzFoJLBvYHH2
 dh5iWDcKYIdE2A3KN2h2NVKJjFXLNFOL2J/g87znTtFTPvJfsg66UfIEx9c3rrhEK/Fy+Jlc0c
 g6rAg42tNJjR0pL/T6WcpgWM7jxcjnU8/ZQPQPpf//6HFfKsEoQII/Gt53U3AjxnGlNIXg0ce4
 bdOh1ZSI/CdtR23mPkqtgrXV4QtGqtrUBAzvf7785MIL5WQEAAA==
X-Change-ID: 20251120-lt8713sx-bridge-linux-for-next-30838c5a2719
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Vishnu Saini <vishsain@qti.qualcomm.com>,
        prahlad.valluru@oss.qualcomm.com,
        Prahlad Valluru <vvalluru@qti.qualcomm.com>,
        Vishnu Saini <vishnu.saini@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763636345; l=655;
 i=vishsain@qti.qualcomm.com; s=20251113; h=from:subject:message-id;
 bh=MMyrdWJs9/Cpwx2SkJSHBAAFvYmJOo8X+L3Zus3SxS0=;
 b=vxCcPO2xe/HqtbMTtycvfmQ9oEFuF/7esoeivmQV/9lf8sOP8riQ5VF6yvl96ehGqiMyfzVSy
 aL8DK1aGk50CgTZ8M04xkFBmSennmSRE4Fr5GkHLwwdeB7pl+cNcWhK
X-Developer-Key: i=vishsain@qti.qualcomm.com; a=ed25519;
 pk=8hlXlF8j/3GeOaDK3w2LYhkv9FanCQru0c7kRH/It7k=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIwMDA2NyBTYWx0ZWRfX5LsWLa7Z43JW
 dQYFM7zZh49C3h525YRDI/71KTGKeXlDmg39TZ9CivI8qcz7M5s33iZcCU1CjDrSiWcmjGg5mxM
 P4cugkRJzs7Dh1oBb7FCaJAOu3bSlkPXQH0g0fQ9WANuvErJSvVgk+5zTngkVEjW6hIoSMt5G1a
 UecsiOWYbyoRXBpjFdhEAfe01Fddi8Wu7Kt2ClzZB0v8JjDbp/yHG6zM5jpC6pwgv0ysPUUp3DT
 fyoZ9sxKSNdYPpfMwYF+wgdkhFQ3e1dUr5E705HRyNZsy/FlXXs5rd0hLVRD6WZJmyBCcXtxmmB
 1AjGwK02fzxVYrt0fFu9DFqWe3DcOiGtZ7vs8ivaFhcmZTkcNsxD/BvGFVk1JSyLpPE9sNsO32l
 rEXpW0Vq0zeANLIC+RyTlMm5LusP5Q==
X-Proofpoint-GUID: ZVLF37sfYc1CZAsci-a2agQl2fRZbGRG
X-Proofpoint-ORIG-GUID: ZVLF37sfYc1CZAsci-a2agQl2fRZbGRG
X-Authority-Analysis: v=2.4 cv=AujjHe9P c=1 sm=1 tr=0 ts=691ef47d cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=lAZRUm_3gAaAaoMg1eQA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-20_04,2025-11-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 suspectscore=0 phishscore=0 spamscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 clxscore=1011 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511200067

This series enables lt8713sx bridge and displayport on monaco-evk
platform.

Signed-off-by: Vishnu Saini <vishsain@qti.qualcomm.com>
---
Vishnu Saini (2):
      arm64: dts: qcom: monaco: add lt8713sx bridge with displayport
      arm64: defconfig: Enable Lontium LT8713sx driver

 arch/arm64/boot/dts/qcom/monaco-evk.dts | 44 ++++++++++++++++++++++++++++++++++++++++++++
 arch/arm64/configs/defconfig            |  1 +
 2 files changed, 45 insertions(+)
---
base-commit: 3c3d81183061b9e49dd3207fbbbc36314744bf3f
change-id: 20251120-lt8713sx-bridge-linux-for-next-30838c5a2719

Best regards,
-- 
Vishnu Saini <vishsain@qti.qualcomm.com>


