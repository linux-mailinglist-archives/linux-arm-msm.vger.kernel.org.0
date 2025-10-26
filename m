Return-Path: <linux-arm-msm+bounces-78804-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BC8FFC0A679
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Oct 2025 12:18:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1EF2218A0416
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Oct 2025 11:18:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4837526E719;
	Sun, 26 Oct 2025 11:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DKi4clLe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4FD61DA60F
	for <linux-arm-msm@vger.kernel.org>; Sun, 26 Oct 2025 11:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761477494; cv=none; b=Dqe4N2tsY2zpCb82ckISViElFcxv/2OMlAkcapn+T4+WWpLKbonYiaTtyT8SoBWIcLjBro43v9SbG8jnGrJTVv6+kbdOEqlahc2ZPeuCpnicGezHUsyx5HESgbi4h+WtjO1gBmSDnjJMnAynYRW+lYwajAoZHGaClsPsjjchvr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761477494; c=relaxed/simple;
	bh=O7f0ov9vTfLRbLjUh2RSJGZyEQmlwikWpzB+7BwXE+c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KGFVkT5QwfQpfjygwJKDaixao9BL0vmH6IpyGNqdo92HMCih2wXB6X6P4CrOHHlDp/uYmXynSUS+mwkue/ReSGTXfzAcsoTawUId6Uf4GGG1hkXXyy8tZ4cO4XHG4ZGovBoS/F4UWFNbQaMYjWl2W/1nrtZUpjG1lAtBYuT48tA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DKi4clLe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59Q6jmxj3334096
	for <linux-arm-msm@vger.kernel.org>; Sun, 26 Oct 2025 11:18:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=P8mfvs0DoXJ
	oaXO7wXqvtVIblGXbDsNop1/adqmTvLc=; b=DKi4clLeZbGVVdYeKpTPwJILIqt
	xLkAk834FJrryVerh7Mrl6cAvai+/JKisHDxLO0fsZWJGN6WKGwc+HP8wlz7kAkB
	bM6kkwgQ2uL4CH6c2wms8dngs/lV+uKZWFlNh0R6iVQFNvKeYr6EHhnhyvds37Ni
	xqgqnZnmx6maHmFuHdn1qr/M0YryCq7ZwndSGaWt7EHuZcRn4CIKA0C51qcwOLRV
	2DrNq1ayIAvMKTEXQciW6IY9r4GVxlFuBAtsicApE6vE0KrB+dYZOpIgetKkWKx1
	MaD90haXUfCfiskvUhIEjqMSaqu7nZEIhwqKUTeadvuxOPS7fIjpNVC5lgg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a0px6hwan-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 26 Oct 2025 11:18:11 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b633babe5b9so742760a12.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 Oct 2025 04:18:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761477490; x=1762082290;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P8mfvs0DoXJoaXO7wXqvtVIblGXbDsNop1/adqmTvLc=;
        b=lmAjWqnGvhD3B0GzhZ/GsOFYhtDgP+mwTMJHvUQqapG/f9gBUWwjhak9QDKtLMqTDb
         OsFngndZNQATgKIyKIwx15bQ1fl+dlmgIhg7TwIorTX0RPOPqVdzr4cZ1t0Z5WvfEKi0
         auvluuur8Y3ZATU9oO4/6tanCjU5xTowjo1/72UvZjRJcZ4NryzIRciTzLvvL5Xro/jz
         4KrQCnEZ9IJSlOmFmc73zYtqUsRhWezfJF4wPTaiAxzwrNZjR4cysZERsuE/eBoaj0Yp
         usMMHr5il+JLhjxbxJ+BdpcwlOMDmSSNv181oe9389o6bNQW1bAuX16Tc+so1iqjEKxG
         8fyw==
X-Forwarded-Encrypted: i=1; AJvYcCV5vsBnQpOFEzSsduqM+6U88LnVGxgpP5f3R+Xqfc/yQeXRMPOnRaIWSAXfi5uPKQC7ZbAJn6WpRxiOxVsY@vger.kernel.org
X-Gm-Message-State: AOJu0YwgI3fKZyY8zS1MWmVZ9D9ZqxDQ9y6HKiRVDLEwCuWUtj5A+8qq
	+H1SsveFaoB2yK7II9JbKHDOlfhzH9Kho1cK3s6n9ezS9AkfW4agJIq4YKHWRKaG9fQxdEjKPda
	XzMv/g6iC0N0XcnB9VcUw83TssPvbuxIifVKwD896GTMC1V27tQhfPKhAjysCJ+a94xI=
X-Gm-Gg: ASbGncttnYBqVYG/uYJjmhqTKyNWLbxzPsKi7jCMl8bqDzIbRv0eDplKVLy65liP4hg
	SMPRU6D0edx3Kgdtf+87XT+JQVk87mXHp72+Wh0A4DonS730YuHYsi8BKFRQgg/ZgQO+BGL5ElN
	quY7VCD9pwHFu0qeCfMFJq/D/iBFhU1MX1ZgWL/yDAughIoAzyYOmg9W4v2YZxzFQnge13uQ1R7
	kW/eE0kilhOVIorR1liM6MgEY/lwOag4ZAlQT6tRo2PQCcgSozvrTjV9mjBrMpmKgQL/9MLIKDz
	c3C2vVsLBEudJQeoL4hz2Xmhh95366EgneKYrh8crRS8OI+IrIzG1gOP+dqSgBaBKY2nicn39Q8
	nyZJtuS+R3JfuckEp61/jVPzdZlYRMg==
X-Received: by 2002:a05:6a00:2395:b0:781:1f5e:8bc4 with SMTP id d2e1a72fcca58-7a220aaf4d1mr21273901b3a.6.1761477490507;
        Sun, 26 Oct 2025 04:18:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFNQ6EVFYhzFH0yOaaPaFygjEcZd5WgQfQ13uWqgn/4cx6r/RKDbAVe0Xx5/gvvysn+ksiu/Q==
X-Received: by 2002:a05:6a00:2395:b0:781:1f5e:8bc4 with SMTP id d2e1a72fcca58-7a220aaf4d1mr21273880b3a.6.1761477490059;
        Sun, 26 Oct 2025 04:18:10 -0700 (PDT)
Received: from hu-sartgarg-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a4140301f7sm4707829b3a.19.2025.10.26.04.18.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Oct 2025 04:18:09 -0700 (PDT)
From: Sarthak Garg <sarthak.garg@oss.qualcomm.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        quic_nguyenb@quicinc.com, quic_rampraka@quicinc.com,
        quic_pragalla@quicinc.com, quic_sayalil@quicinc.com,
        quic_nitirawa@quicinc.com, quic_bhaskarv@quicinc.com,
        kernel@oss.qualcomm.com, Sarthak Garg <sarthak.garg@oss.qualcomm.com>
Subject: [PATCH V3 1/4] dt-bindings: mmc: sdhci-msm: Add sm8750 compatible
Date: Sun, 26 Oct 2025 16:47:43 +0530
Message-Id: <20251026111746.3195861-2-sarthak.garg@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251026111746.3195861-1-sarthak.garg@oss.qualcomm.com>
References: <20251026111746.3195861-1-sarthak.garg@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI2MDEwNyBTYWx0ZWRfXzIV4XubeX1PL
 VCLE89AgcRvKilkRXsXcLVYrF+/MwsMw+4lG7f0IQhWFnOkuPwAzjU1Hwu9Xv4GEEP1BasRwf4L
 JXt5gPq1mIbQRHAUnp6rk/9gmp98uCHG7/a12V7Nagsg4DzMp/X3HK09ojohSd+6o0iP7vnYDGN
 d8KG+Ge0Ts732yPHmme2Xb8dxqLgIsu6a1awd21gh9FdJjAKSoQ36L9Yh3f6D7+Ev985bb5LL1o
 oTy3aM0garS3j396V585Cc61QL8ABWis29yPzlNyC5wzBIRpaPqlqNc/iHWGxan7zoLfc7UhGhX
 drCpSJiXB0rjNDAsA7JsH9UbJH0T7rVfR02Rbj/OHN5tgAokxxyusFPz06RxVMszt3bAa9DUSr2
 NaJWZtgk6Wm09QnV2BFI7mgLZmTAvA==
X-Proofpoint-ORIG-GUID: 1h9imPpd8b0egO5GB7yHg_clt8lZHxnm
X-Proofpoint-GUID: 1h9imPpd8b0egO5GB7yHg_clt8lZHxnm
X-Authority-Analysis: v=2.4 cv=WqMm8Nfv c=1 sm=1 tr=0 ts=68fe0373 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=yU21l3sC3bVkzOeoNhsA:9 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-26_04,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 spamscore=0 phishscore=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510260107

Document the compatible string for the SDHCI controller on the
sm8750 platform.

Signed-off-by: Sarthak Garg <sarthak.garg@oss.qualcomm.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/mmc/sdhci-msm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
index 594bd174ff21..027011223368 100644
--- a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
+++ b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
@@ -70,6 +70,7 @@ properties:
               - qcom,sm8450-sdhci
               - qcom,sm8550-sdhci
               - qcom,sm8650-sdhci
+              - qcom,sm8750-sdhci
               - qcom,x1e80100-sdhci
           - const: qcom,sdhci-msm-v5 # for sdcc version 5.0
 
-- 
2.34.1


