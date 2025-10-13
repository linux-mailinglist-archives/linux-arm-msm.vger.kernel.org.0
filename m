Return-Path: <linux-arm-msm+bounces-76946-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F3383BD212F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 10:35:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C0B943C2364
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 08:34:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70BD32F90C9;
	Mon, 13 Oct 2025 08:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TDe+QfG3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C59352F8BE7
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 08:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760344498; cv=none; b=bELZ9zI/gnUdsSvVn2qv0OOFpz5xzAj7ginoQMSxQfgwMXOO8ekd1Iwdkj/yJQ7BRj8+8v8xKtLcFkDXuZmVCUVw00rzyTdiFlBRoioxUJ4Haq6OHRJbySGHEmMyQ2gYMV2E+YAOxU6PrLprP97Ib7y5EyhgUvn0ITBYU8G6OjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760344498; c=relaxed/simple;
	bh=8N6JuyoDxEqzzX4bFNy5c5k0RGnFdELyNLGvZ2MUVOk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ll5Ssz3W75OjxULsRXAHYrjDUdwFtDd4gXu4w0FG7vqYQEMyDHwTGgd4YUZ1c2RV+Vmd+j++D4NI9aSFMKirF0Y0HwtRAm1SszjfF6xA8QITO2C5bzpHFk8IhjYeTxTcIoYYe30iJkvGqChOa1xZTi3maZfOMy0Cty87K6E0QHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TDe+QfG3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59D2nPvX018067
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 08:34:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=qePY1UHlkzuDJ9kRye75Pn
	muoq1wKjyrBK5aF/cS62Q=; b=TDe+QfG3DSfdqwCx296DQ7FZ0Xx2pQkR823ql3
	Ggmq0pbjmGuGoZKFwUHqRHraEFnt8b/1VKlLUyMHkqUZJoZFQ+z38K3xB9s6ahYj
	eJDRW1BCYe8ysSQMJUvVXzaibBxN1g7u9RTcZR28CqE0j5D9F3KD8Q7GHhjm8Z3c
	lMATX0TwacEeKtIlPQTrnGKF1xfH4EWNBKHrxrWduZPEiQ2BdZNiRxPErw44cI3z
	c/jxmn6nSEAuNSRanRRuaPeUeA4WDtD8PCJUKsAJ1Tjo0Iu+yzd0LvX/oglMR2wh
	HHIr1tRKq6hWWsmMVvJtFv04m6OW3tBHgqspV4fvrbjUV8/g==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfdk3vkq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 08:34:55 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-78108268ea3so8038087b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 01:34:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760344494; x=1760949294;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qePY1UHlkzuDJ9kRye75Pnmuoq1wKjyrBK5aF/cS62Q=;
        b=oOvCbRm8K6zAXs7VDYYP7KYd5bMdTz2SACq+Aa2brsqUIq0yp2OdL0s/M7G2kYwvwE
         UIjBPbucZS/G1Um2aZGOqWEbku0MtdoiEQofaH3F3UmSCnb71Zg6yNGoynSaoFFV0z3x
         uSTVawDooKAlaAJgEAfZkNYRnrhEFVl8xGKkYrpuu57aNr3hT5l39Q4RXX+HZdpedLGU
         8lmeSJtQg+uBmA8nZ7v9LDZAkdxIN00VB9PfArjB9lcoWxT4A9t56BEDQP+ZMTGhpLZx
         kQczXCirPxBxxaUoQsFIEc1CZLEVTNzVqmBK9SezqqX8eCOJ9SmMBQTnDX9gN652gh5z
         WQsw==
X-Gm-Message-State: AOJu0YwNn8jr7eFvzzEGPPpzJx7dGiaafxlaRPzXFeEW/YJz+pOwEIIi
	RuM5P1z3s6Q+9abpftBZ0v+WWK4vwFPHrmoVdPxAL3e3trXsruZ1XGQDDNY9r4R5QIvz17DJaKa
	G1bz2j59SgtOAYZ6ERJOgxAUwc81pIljuGweVOaS8ktaXwVWotTtDdnqiDCXX5w1y2L6B
X-Gm-Gg: ASbGncteDtqHsMMIoxmaHJbTiaNZi2YRJ3EBIIvQ2llOnvYEFVIINzTa2zQwEU4M2t0
	cDEhD7T68wPvHwM0crl6ngIDK5RK+UaoNpe8MEJ4D3WKSHl1LYzQr/P8YfXPYMHNkUSE+6CUa7r
	wIVDd8EygYfCSRqbmEoTFnP3EDp655U95NVefjuYi308Yv8kfwk4A+FsLrKZlCH4hrZV+2/NBXP
	O2EQ3wNMh9I3MlE0xzUqfLcIFhjDznisrtciwKG3ILqGsKNVG+53oiqXNWH7Mni83UsQCV0Ghif
	WGkq6EO4xrajzeMU/TnPmmhIX+HOJkveRWXCcDbo7j3DaenOM//upeSqPfxbh+btd1gGsrxji/X
	mfsQTWz5nOfvK8NRVzN7MraZ5r/E=
X-Received: by 2002:a05:6a00:a15:b0:76b:ecf2:7ece with SMTP id d2e1a72fcca58-79231df6680mr25873007b3a.12.1760344494260;
        Mon, 13 Oct 2025 01:34:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IERV8N7NBi1nNuzIUr3/wdzTu8NLNE5G5dPZcctm7j/03i0JAZc/m2v/3H2x785lew0TsCKng==
X-Received: by 2002:a05:6a00:a15:b0:76b:ecf2:7ece with SMTP id d2e1a72fcca58-79231df6680mr25872972b3a.12.1760344493774;
        Mon, 13 Oct 2025 01:34:53 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d09a87asm10773251b3a.46.2025.10.13.01.34.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 01:34:53 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Subject: [PATCH v3 0/2] Enable CTCU device for QCS8300
Date: Mon, 13 Oct 2025 16:34:36 +0800
Message-Id: <20251013-enable-ctcu-for-qcs8300-v3-0-611e6e0d3085@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJ257GgC/x3MQQqDMBBG4avIrDuQGAyhVxEX6firAyVq0paCe
 HeDy2/x3kEFWVHo2RyU8dOia6pwj4ZkiWkG61hNrWk7a6xjpPh6g+UjX57WzLuU4IxhSHDeW3R
 RRqr1ljHp/z73w3lekvzAfmkAAAA=
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Jie Gan <quic_jiegan@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760344488; l=1382;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=8N6JuyoDxEqzzX4bFNy5c5k0RGnFdELyNLGvZ2MUVOk=;
 b=Dxbu0m74+ExtDuCGfb/jHtefhFrQyDeNasjLJIZgNUvkIyl/vb6yB7Wvpe+DaVF39ceksDB8I
 MVnXQrcNPwVBICQgf0/xKwUdDb/ZugfIQh65tLcFpi6qqOs5HIdCZdE
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-ORIG-GUID: sqv4nUY8WVNAehKVtjFaCAqNdGA6Wxgh
X-Authority-Analysis: v=2.4 cv=MrNfKmae c=1 sm=1 tr=0 ts=68ecb9af cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=YHNf7BNBHiJKSF8-TtAA:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: sqv4nUY8WVNAehKVtjFaCAqNdGA6Wxgh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfXyHsmggjR+RWu
 owtsaw702YKtqQZ8AeTB04CFLG9YqQnM49fnsnNjRqr/aFu5U+4FG1o6NSIxJBv2MRzm2LG+DFI
 N01SggY/y8KPcg9VPxBLPDLd6rb4o0Xx0oCNGQAR1AGrWioVDJJaLIqhWYXfm76wff5n+sLo8ES
 xEqTxu5oUTHvNHNteo/6EmoyRZEMLXZxfcizYsOp10kp1t/uyM0qH9zdgjCCLIEN3/RWWk0cINv
 cc6FcmlMOAt9bCH7cmWfzxOsLmkJDcKedcGIIZDZDpNvaKmaKcLzg4B99YuGaFYFO1nwGjLWMyx
 M79vMH/N5J1FJRDSwcBXu5zdjDWPLvaBRglCEYr82drrprB3A9eTmQzvYQkDXk6l38xWPsk46Eu
 hU7pcmevYlyfGP5yiLl4rZBG8UhqhA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_03,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110018

Hi Suzuki, Mike, James, Rob

Can you please help to review the dt patches? The dt maintainer needs
your comment before apply this patch series.

Thanks a lot

Enable CTCU device for QCS8300 platform. Add a fallback mechnasim in binding to utilize
the compitable of the SA8775p platform becuase the CTCU for QCS8300 shares same
configurations as SA8775p platform.

Changes in V3:
1. rebased on tag next-20251010
Link to V2 - https://lore.kernel.org/all/20250624095905.7609-1-jie.gan@oss.qualcomm.com/

Changes in V2:
1. Add Krzysztof's R-B tag for dt-binding patch.
2. Add Konrad's Acked-by tag for dt patch.
3. Rebased on tag next-20250623.
4. Missed email addresses for coresight's maintainers in V1, loop them.
Link to V1 - https://lore.kernel.org/all/20250327024943.3502313-1-jie.gan@oss.qualcomm.com/

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
Jie Gan (2):
      dt-bindings: arm: add CTCU device for QCS8300
      arm64: dts: qcom: qcs8300: Add CTCU and ETR nodes

 .../bindings/arm/qcom,coresight-ctcu.yaml          |   9 +-
 arch/arm64/boot/dts/qcom/qcs8300.dtsi              | 153 +++++++++++++++++++++
 2 files changed, 160 insertions(+), 2 deletions(-)
---
base-commit: 2b763d4652393c90eaa771a5164502ec9dd965ae
change-id: 20251013-enable-ctcu-for-qcs8300-ec83661e5acd

Best regards,
-- 
Jie Gan <jie.gan@oss.qualcomm.com>


