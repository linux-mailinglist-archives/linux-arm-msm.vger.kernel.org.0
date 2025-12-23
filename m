Return-Path: <linux-arm-msm+bounces-86384-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A2DE8CDA101
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 18:12:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DB4AF30AAC9B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 17:09:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E83DD346FAD;
	Tue, 23 Dec 2025 17:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KXVpmBMF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fyaE2wrR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E934346E50
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 17:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766509731; cv=none; b=h6gqKSErLJEnKtBN0kcdIRO/eSSZ+GjjRdSbcU/uISrR5uJX9cQz5QrVncE2H4nfud8xMLdFzNegEVvp0vjKyOqVXGFIT3nVtGSN99O9JNkN57q8lIY1wsiJqGBPHpIi/+nPU6V0QrQ+OUsfqV+ruEFBETfJxce//GbTZU8g4OM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766509731; c=relaxed/simple;
	bh=djZF5UFBEvnca6xGc5FxK/x9Ur59exsc3OaeKnFwerY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ruO4pbUsvhwotzgfM9F0s5qAzsOb6qtCeEotOP15zGnTcCWVfhOdNsWD0by1ZfWCZNfDj60QyBukij5Vg225tjgoK1UDFHbPJ/gJ9JwF/Bzq6cKYMaMRF2va1BxEe7rc//cmFVFmOhaBy7cebD/OXnwZA69BRuVwokZPHKHtjCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KXVpmBMF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fyaE2wrR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BNFHcaV4045106
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 17:08:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pQNl6k9FVRxiRZu36Ul1H7qw6ya4whFcoD1DtYOJAek=; b=KXVpmBMFRvDzraWy
	FbO4NFJq2kfKoyUZpreawPEnEJn9egJWvU3Kk+tgbfjL0vxV9pHMj7ul5sDX+I/I
	PkZYsLHGz5CUv4+f3T94zQ1loDaG1ZH54vuANduNpY5hHZStDt3B745rrAkp1Daw
	rcVnEN1PK+jK4gSuNwlZFkWnrd2vix+Roq2koaqMmZrN0z8uwIxrkVMtZIDfbESv
	actDg2pJKGVMpzamXrpFyBOe0gJ4L4BQKJdA56AZTRHeZ5jH7hKaiU3kP/sGKRXA
	J16LGO5mr4FvTXNwCteCLFkTl0UZn75kmaJ3J1lGFhyh1rdqeaw9iYPjZbDnSxdw
	jHToVA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7cuhbecr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 17:08:49 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-29f1450189eso47114625ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 09:08:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766509729; x=1767114529; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pQNl6k9FVRxiRZu36Ul1H7qw6ya4whFcoD1DtYOJAek=;
        b=fyaE2wrR5uI/U6iJjM2IpIRTXppX930vrpwtZ5o0qp27LiXp6U/MEjadCBi99vmyso
         zI2ek86UsIYDfRM2YQON7khkwn0pKsyDe+GiQq69AnHy7nHLyPTWgWt6feT+7JBLjn/J
         Chyxi7Avhis+1Qai2Fkm07xBU6rI5CzWSx/HjigDoYNj7/3alkLxENKkrf0/9Nagdeq+
         2SmcKaxoOJrGpifhzk4zDmbcoWZwk47eRSSX60WnoK0xj1adgEyNcha2+5KKVn6b7lBq
         ugvunGWnQT8yslTX/03L9EaR572nXpDtWDw5CQXno9j9WwGVPUwk671GzPb8kSYPoueN
         6uTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766509729; x=1767114529;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pQNl6k9FVRxiRZu36Ul1H7qw6ya4whFcoD1DtYOJAek=;
        b=Et9b/O4e34Plno+bgHYkmHFuaeXneXQ7iQUbFLJFlczLU7EIiFJGkBB4Shch3WFuJ5
         vrPVQl6RUmkxX4rhq2havoFCkDBHslS2MOLt7cLp6yGBEr+OmcWQMicAobxaCQ/6Tnfu
         LrLaE/bLHtrIwkPEeITCaN3tiAPP7LxX8V07KSGyRM4ogTUFA3VTpscsdu7gqXS0+tRO
         Ajxk5veqYCGD4LWLj0aNDcI7x2Qf4dAcwj8IIWU77pyMvEWaeHVzQsfnWTjSFBoUM8B8
         kPPeZ1wnuhv4cKgv+6NgKojkv/bUD+e13opIoY2KwrIRGK8kPBvujlRvZ/7FEfwZmkBY
         toiA==
X-Forwarded-Encrypted: i=1; AJvYcCXyh3lJqk1UXC+ZeZTnK9GoggDrrKYx3SgqMv1hl7UhxIQnGcpKRyGI5yXO4btfpKfW5GEgoxJSiYLHsMR4@vger.kernel.org
X-Gm-Message-State: AOJu0YyUI0jFvI1FPz/V3aQbRHvIeteb6FiUonIbXP1Xg1x5mElzwhVU
	SJ3HQpGoyhTlW5ZCwDojboHu9dWlhrBMw5+j9rthHJutSYVRlJ6PSi767iWNudg7F6hNNBw0wZd
	hzCySVtnXhzP9AZkByUEcPsDqi+PNjjuUGZfnHdfdnCOJUu9+bP59aaLLG7d2D018aC7X
X-Gm-Gg: AY/fxX4BYlDds+oCvzah3RZqVS0sErtcePicBZncxrOEArZxR3A3Vl1zVRMnpeMDysj
	u1ObK0uKJNSsQ9twF/12EGyhE068lb89Teru5hb7BCDgoRuECEgoj71Stto1Me/3CL1q2axJ/ZC
	PVii0j0MmR3sFgSf2zdZK+4zfLTSG2owqmwkB+81dcAxWULjnKuhdxTxKjNho0kr95A+Bj4/GhU
	XUnGD9w5tcOUcQd0OmWJ2/ZkvmkZx5kSi83goLFHy7BHeX9acrFl11i2hPfmutTTakTxDzCX1Hf
	CggLLmfpav1gOXDPSzXZit/jm0iiiSL4osQuEAcdDhNOHd318boymgjFDISC3d20W+Dp49XsYQU
	GZkVahLGfm1tAQre+fEy4XNqHsIs3SkZP0n79GSJFZJCXLQ==
X-Received: by 2002:a17:903:94c:b0:2a2:b620:12d9 with SMTP id d9443c01a7336-2a2f0caa70amr189654585ad.5.1766509728817;
        Tue, 23 Dec 2025 09:08:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGnGtVcBotVXJAPKzHeYTY5P1Q/ScCn+k8fMmJH94TyRGtDjnZNOLRhMrDflhFYB1wXqlZYtQ==
X-Received: by 2002:a17:903:94c:b0:2a2:b620:12d9 with SMTP id d9443c01a7336-2a2f0caa70amr189654225ad.5.1766509728309;
        Tue, 23 Dec 2025 09:08:48 -0800 (PST)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d5d863sm130019325ad.80.2025.12.23.09.08.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 09:08:48 -0800 (PST)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 22:37:40 +0530
Subject: [PATCH v18 09/10] arm64: dts: qcom: monaco: Add psci reboot-modes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251223-arm-psci-system_reset2-vendor-reboots-v18-9-32fa9e76efc3@oss.qualcomm.com>
References: <20251223-arm-psci-system_reset2-vendor-reboots-v18-0-32fa9e76efc3@oss.qualcomm.com>
In-Reply-To: <20251223-arm-psci-system_reset2-vendor-reboots-v18-0-32fa9e76efc3@oss.qualcomm.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Andy Yan <andy.yan@rock-chips.com>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766509672; l=1066;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=djZF5UFBEvnca6xGc5FxK/x9Ur59exsc3OaeKnFwerY=;
 b=fmzIoBglPR6F2b9xO27gFGHEzXk6aliiIcIYRLz28MY/i0vm6glGgNgEGEYz0Cax97UIEIO9P
 coj/ZXRR+w3CIw5VLyIQLGln2qGDYB9897apH0CN3f9wWSXNzpmz9ZN
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-ORIG-GUID: xD1eRLsYQkwgB26DhPrKwboLRaw6rUVy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDE0MiBTYWx0ZWRfX8nQwKkVAJGQx
 8N4THcGJT7IYKb9xf6lPLEO704SlpKBBZg/cqE1+sOI2R9x6/xcC5d9scBxEZgrSLu9dDG6RKU3
 QYyMoPXJPniKAlyqMg8hWYV//fUT1nN0xd0J2G3O5N0DycWnGVJ86fFuFaFRjQ23XydRgitH67N
 lxtJs9YERrTxLFdQTecdyQHRU5iAvMUUEKbw514j4gGb7FkjhjsUxskIERm7ANRtH9Jl7nBDu1O
 T9IbjQ888FyS4DgS+r2kZAxF/88ylZQITz+ZkqXu4KwnvBtgeOEDTDLqj6EPN3S2nuwdH0QfRrA
 /q24zTDjjIyELl5b7whohphnib1PQuA/rpxxYr2mvSncwWlGQeJunhPhL3SHT9XjjTqRe3k0M47
 LBqP/+um5OcGf5KwB+ExvoVDwYmJ7mDqTcTEx2jIvnTBwdfjZu4jeuuOCNZOuqIqebIjVAjEaCN
 LzNvLl0RmU6Z8sXIyoA==
X-Proofpoint-GUID: xD1eRLsYQkwgB26DhPrKwboLRaw6rUVy
X-Authority-Analysis: v=2.4 cv=NZDrFmD4 c=1 sm=1 tr=0 ts=694acca1 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=_PJuSq69R3b4qrRYkJAA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_04,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230142

Add PSCI SYSTEM_RESET2 reboot-modes for monaco based boards, for use by
the psci_reboot_mode driver.

The following modes are defined:
- bootloader: reboot into fastboot mode for fastboot flashing.
- edl: reboot into emergency download mode for image loading via
  the Firehose protocol.

Support for these modes is firmware dependent.

Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index 816fa2af8a9a663b8ad176f93d2f18284a08c3d1..9c8087f870fc8889edffda63c62f4d5167729cbc 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -732,6 +732,11 @@ system_pd: power-domain-system {
 			#power-domain-cells = <0>;
 			domain-idle-states = <&system_sleep>;
 		};
+
+		reboot-mode {
+			mode-bootloader = <0x80010001 0x2>;
+			mode-edl = <0x80000000 0x1>;
+		};
 	};
 
 	reserved-memory {

-- 
2.34.1


