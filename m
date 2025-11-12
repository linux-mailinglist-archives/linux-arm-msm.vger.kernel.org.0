Return-Path: <linux-arm-msm+bounces-81343-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A1AA1C50DFC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Nov 2025 08:12:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5EFF418976F0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Nov 2025 07:13:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 131EE2857FA;
	Wed, 12 Nov 2025 07:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gvTDzYVg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CUzXQJqh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 476B525DAEA
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 07:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762931568; cv=none; b=FjIg74UOmt9pi/fZzkSV3YufdJtiltqMK8sKVNlqtxxOH/GNzW16q2yUSGJNNd3QDNZRQfqUhuDXw0Xus7uhwFRqv/UIFH4tK6peiv+B5tsYBSdsMD4A1MZoPIFzV8dqfalpoxcjGqhsaw5IDZbG/G3yhKLKNgQxOIXSaJ7SVVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762931568; c=relaxed/simple;
	bh=nm2Ff6jo8I+QGuD3PQnqbmzX4vD+x9n9obxne1ccimM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=iKxqDSvDHDj0GZmM3w7t1b3A8l76Tqq1tUOmGQuGgJj8/EwI9mfYIGlVStp+6Y/3Z0IEWKNvvwpYP5+ff+svitggmKzbSU5ILSvRmXjJomVKH37oW6gHwS0l7qo7q1K6aVgilCIO0cFiDWAJ8nupwZzTVEe/732cFHfb5WQqb0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gvTDzYVg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CUzXQJqh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AC0vRS34006643
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 07:12:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=cTUtPl+F/Wsa2a4a3fwMU2pSucYtfz3vonO
	DrbZBpqI=; b=gvTDzYVgC58SDEn3SJOa90vgLPsdtqItCt5LsSLBFFGE+xxceAK
	ZaRjUVGVY8ceh0t6ciZG6gORwB/3QTpkOd1mA20AIgAi0Wu/pdWmws+QoUbFOmNT
	V3j5z6sR46pMtRozoA1nXnQmxku/83fpghn6DnIDrA17ef0bXJNrWUQf5KiSaBdm
	W+/GMMHgECRQnUdBiYLnl60FUIIzk2N/L83oCHpiE4hCZg/u/Mqw6n/5vDhE1unk
	mHDNZ25eXZcYgSwxXcaE3kScdjlRW2aFSNv600VQp5Hm3xX6j+J03ZmC8XnkGKna
	cwYPYRNEPGn63D6Stp/TFY8hkyQdSqfP2Qw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4acg5bgwtk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 07:12:44 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7b0007167e5so181862b3a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 23:12:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762931564; x=1763536364; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cTUtPl+F/Wsa2a4a3fwMU2pSucYtfz3vonODrbZBpqI=;
        b=CUzXQJqhfH53ZFHB0PLdHMZbrY1ckYdAbEKd+EEWGCiYW+KVH19lSUpRTriUUn8GCE
         nEx8rc/Vc81K/tKzKSxt1N0P/VHJosuKIfr7JMAhf4HZHKUL+RxijGyt/yp+yckoMNJm
         n8hVczhdc/bgxjBvWgSZWg4lWbx1mqFsC49K9omrw0nQV9aiYsjjn/vqaWTYxVBBBnSb
         5YoTuyL4rMKE/C9LYJbbxfeIaJ8LomcZTQhUhQSly0dOGUtlm77CSi2mcU33/729IWpT
         GT56rK5y4o6W510qzZnenxUhoDGw3CRxplVadGGaZhVnjXMgE7Wt+Z6K5apbI9uiDWk+
         3S7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762931564; x=1763536364;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cTUtPl+F/Wsa2a4a3fwMU2pSucYtfz3vonODrbZBpqI=;
        b=N33l+OlcWuMWicZRdQtdHA17Ss4b+Q2gmxgHog9ur2E0i+yoxuoW6jhTHOyn1zCX7v
         R4qz3b2tE1im90DqV3bLd48yWBaeCGFHq05cCOTKNL/AP37the0eUV6D8jff9xAOuNhe
         Xw9H0be3IVjJW6Z7SPt5VwPxe8q0227x7EzsoKzoVlDeVX0gZRsCtesIvYlA/S74YFIq
         upShhKJPCKJtywRgMj8ogps+m0h+NpR+7LOLfFCV+8SAg6O/jEZXlS+AVdzP2ifT/Lbi
         xxIN5Wy4a3saFGfPDGVS9tGv8tKKbG3UPM5b17Xf26XsGSPPQCifooJVmXPTdlOcmWk+
         j7iA==
X-Gm-Message-State: AOJu0Ywsu33BJsPBS/Zv64pL1I0zQpuUrXlRAeLt7mUQvnexqzQg6wqp
	1xdibrmaZc+1KryXA1VmVUV3aUIG14lvzHR2Axm5YJ+lY7yMm+sMauo9I/izUxO/xSXs72UDxng
	1gXCqXYT8Gu4AUnWe9YXTeuVbO2Lhmp6RZ1VgDiMax6yFwbvEy3iOjztAFpNEV5fyPjo=
X-Gm-Gg: ASbGncsXQ8E5DB5F1Btrr6TxBIcGJDMuaFYpdPbiT+BgYZ+P/+s0d9MVxcPibjjfSEQ
	B+j422c3RSasbs3gldlw30d7UNtCcqDvptfyhzADY/d0xi3zldb0x2Om9IGfAzgPAHJO3GOdvBu
	g0cmZVIejxVy38e8hMC35M/D5n57qGs7UtGVeUhvZHAKBQeGWjhtl+380FVEYan16Ro3N+XJ6G4
	zFRHq8wrSUxi8gRQKoP8al31nB1N4SXXH+4jOz3uILDp4hOiQj7avpMGg2iXRw/FdN4lsxdNj9q
	RlLsB6O5nH7QJx4MCTITiir8C7WhD7L1Y8V1rpI7ydzXI4RUfQ2Yv4YRPud53OKvsv2yPXVYE7M
	74hwj2/KFDUbeRDx3R6UG98rS522Ubg==
X-Received: by 2002:a05:6a00:3e21:b0:7a2:861d:bfb with SMTP id d2e1a72fcca58-7b7a59978c8mr1337973b3a.7.1762931563647;
        Tue, 11 Nov 2025 23:12:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE8/WVzXtZC81bsT/lVupwJpWgLlYk4J1uvkWrhn84yol6tDqvbdYjpuCd7yrTjhx/IcgUuVQ==
X-Received: by 2002:a05:6a00:3e21:b0:7a2:861d:bfb with SMTP id d2e1a72fcca58-7b7a59978c8mr1337946b3a.7.1762931563095;
        Tue, 11 Nov 2025 23:12:43 -0800 (PST)
Received: from hu-sartgarg-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b0c9632e22sm17949037b3a.8.2025.11.11.23.12.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 23:12:42 -0800 (PST)
From: Sarthak Garg <sarthak.garg@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_nguyenb@quicinc.com,
        quic_rampraka@quicinc.com, quic_pragalla@quicinc.com,
        quic_sayalil@quicinc.com, quic_nitirawa@quicinc.com,
        quic_bhaskarv@quicinc.com, kernel@oss.qualcomm.com,
        Sarthak Garg <sarthak.garg@oss.qualcomm.com>
Subject: [PATCH V5 0/3] Add SD Card support for sm8750 SoC and boards
Date: Wed, 12 Nov 2025 12:42:31 +0530
Message-Id: <20251112071234.2570251-1-sarthak.garg@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 5umFAQHa-svkIyze3Is3yBpU0S8IFlIs
X-Proofpoint-GUID: 5umFAQHa-svkIyze3Is3yBpU0S8IFlIs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEyMDA1NiBTYWx0ZWRfX/jcjgv/ylplg
 2BZOmdH6eXW3uaGjfdE6MvYHXcB0TiwODmO8Z+OZCYCo5/d+6Vpk4NoVNpcqi91EU5WiccAKHG+
 POGsfha6IlHP7x45fBGBh+z8JlJiLSL6gp+WQBuNWXNq1JzR/RIKGs/5Q/7ptlCso/s63H30Hcs
 WK1x/nQ7skfcOkBDY6QT1xFDCSWqnmcrxrYiI4M6J7+++KapuucV0LLBRR3MX7G89Y9XuPBdeX4
 n0PwJOveUaAghkI0S2Y9Shfk7N53T/r8ZGYjIcN9bIH2tA4Y9qja9CpRZRg7n3kRWGYE3TKHiPR
 E6inqai6OOFgY0F9Dqa4oWK0bhsDeD1g+s0vBM/DAvf7YoWVDV1IpC4iFo8zHGkR3FVKWLrdZHv
 DyFr0WBT904KXRxy8eFnEwuqHFfPGA==
X-Authority-Analysis: v=2.4 cv=YYawJgRf c=1 sm=1 tr=0 ts=6914336c cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=rfq7y1KLf-xer_pzc54A:9 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_02,2025-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 malwarescore=0 spamscore=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511120056

Add SD Card support for sm8750 SoC, including MTP and QRD boards.

- Changed from v4
    - As suggested by Konrad Dybcio sort nodes with a unit address
      (numbers after @) by that register address.

- Changed from v3
    - As suggested by Krzysztof Kozlowski refactor the code to follow
      DTS coding style and use hex everywhere in reg.

- Changed from v2
    - As suggested by Abel Vesa move the GPIO configuration for SD card
      detection (specifically the pin settings for gpio55) from the
      SoC-level device tree (sm8750.dtsi) to the board-specific device
      tree files.

- Changed from v1
    - As suggested by Konrad Dybcio the patch into separate commits per
      board and did formatting improvements (e.g. aligning < symbols,
      placing each item on a new line).
    - Addressed Konrad Dybcio comment to use SVS_L1 for opp-202000000.

Sarthak Garg (3):
  arm64: dts: qcom: sm8750: Add SDC2 nodes for sm8750 soc
  arm64: dts: qcom: sm8750-mtp: Add SDC2 node for sm8750 mtp board
  arm64: dts: qcom: sm8750-qrd: Add SDC2 node for sm8750 qrd board

 arch/arm64/boot/dts/qcom/sm8750-mtp.dts | 23 +++++++++++
 arch/arm64/boot/dts/qcom/sm8750-qrd.dts | 23 +++++++++++
 arch/arm64/boot/dts/qcom/sm8750.dtsi    | 54 +++++++++++++++++++++++++
 3 files changed, 100 insertions(+)

-- 
2.34.1


