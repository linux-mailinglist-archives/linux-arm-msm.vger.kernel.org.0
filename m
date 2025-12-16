Return-Path: <linux-arm-msm+bounces-85320-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D36C8CC1924
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Dec 2025 09:30:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 137DE30312F7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Dec 2025 08:27:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D24533A013;
	Tue, 16 Dec 2025 08:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cui2aSIP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Dc60way4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D7903385BF
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 08:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765873649; cv=none; b=fpDOfnH+n0NkF5gSl5qbTL58fUlPVUNUJW28MEtYvI9txBsn3qsLLCC6Phu1lqrPHc81D52RDldJFY275s/nMTYFmyYXlQG66Civ0FHlq2wrxPs0CKk29s4zWpVhr8lKFQGK4LwzeOZxrPb8/aAvAQLGo3yMpEhdFk8Sj92YD1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765873649; c=relaxed/simple;
	bh=X+Wi/7dfYFuQjLETokYHwl55pAtRQD39RkfFKO3yGwg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=At9D0KrneXP08feD4aXxy4H+Hmmyx/u7nWD8dmKZf2EvUuLSqtEv8uaq0dGHT+N2DWw+dJyX5frKK6bbYNsEAfMeNVhkIEhR0Zfli1qGcpGyy9k4XEe6JPOkuOrSAnzlTcBHemzZUvEiDA2SQd75HZvgoKhXD4qPiXPnXD1bOC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cui2aSIP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Dc60way4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BG48lE11841950
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 08:27:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=oyaTY0kBanBmC4VLaFLugg
	ssvQQcgigTDjGjs2S/ih8=; b=cui2aSIPoNTOhQgZ804MoSlo1FUN74naoydohp
	vvHstMoLVtGhKUmSKwoFWgS4g2S4mrV/F2ZrnW6sIAKMkoBSqcn8+SKmuKlB8ysK
	7gd0z7jvebW8kbgZD7ErKfgZCjVkmZ4Xn2Pz4HC5YCvH/toQmN8K9IXPbNO1tfX7
	BkkHXx74bIy/2fi7gSHE0Ov2n2v7S0hfPftwcHtCwQ8wnsfr2kcInzGh+3ukUaiF
	w9DMorHD4Kh2u/XZIcuu5GZ4jeAZJgil9FYiv/NDF07ENCTSCQIu9GUuFjN7mn4I
	qy6d6L/h//i440zWBOuFCPKnFQFNa3CdMzwYaqaLuheqm7sg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b2p46jyus-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 08:27:26 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4f1f42515ffso42129251cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 00:27:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765873520; x=1766478320; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oyaTY0kBanBmC4VLaFLuggssvQQcgigTDjGjs2S/ih8=;
        b=Dc60way4bu6+uSUv53246tY2dOLFBOdfMedN+/z89dhf5T2lubUZPeBviGMk07ksm/
         wtVw60lKhwqPAiZvVdwSCBjrrejWbNd+Bk6m/I16Z5/3PwhhmDo/YIMHnDsr8UsknHYy
         bpgQHaqLyFn6aOL5d8BQ6Dh+dtS884jDRrWXpYcBBRUTXCFr6gkhwJ89z8roFIxbhiQW
         Lq95fsJB5kogkEci/5a4FGpYsw0TRUeaYHqaH0JxcCvwbFRCJj1b7GsmwRe5FQAzjjEm
         8gxm9nuFOLoyAG4ZG+MeOMrLDj/xUA/nxXnN3a/ElB2NjyR/iJuDKcECaYF9N8fEaWJq
         AfOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765873520; x=1766478320;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oyaTY0kBanBmC4VLaFLuggssvQQcgigTDjGjs2S/ih8=;
        b=lxUnuVeWohPUKeCyUMNcBS5W4hvnyLiXUaGkid1l8fEP/dIVZJRtST+JparJ6WJHp0
         Kk+FDXddII5nRnMnhOMyuOqTxUaKgxjWZNEgXuWDB2WXGDeOsn1x6PcDRcNPPS4mnK8s
         N1JAzSvaUTWgqCSnHIX3Md8zzfivINo1i/VPI73lWrVmYZ9hdxcqqCeKF+ReQ9s44U/n
         +9mSliDHfrI/OBCHZmsGiYQ9D5KswWx/Nar/CAgq7ql8SqDTr5y80eiiEygMedaZiDSl
         XvfXGoOX20buHS5cjTR+4qKI7etAitbFcymIEYI60M51tSaREOZ44dvsramL2PDH7SWT
         w5GQ==
X-Forwarded-Encrypted: i=1; AJvYcCV0pEgzJlTVC63nN0nigkP4I/XwWZj/KeRF6WTJjaB8uT/OEaZ4CWMX9YS+eQt5BsD2nr0dUyMU4DKtM6Cl@vger.kernel.org
X-Gm-Message-State: AOJu0Yx55MSlT75yqpqPuS3ncwe3aKB847yI3NSyWhMfDCeQC/TIWgvt
	2dF4Vefct6mHLEYIOHcyZL7dPErDVA0XrdeTXtDmeSQgA2trHoLc1ixfs+I5Od1mRSBf1FCfEcS
	c8Z6WV5CjF9C/b73yIUxg+0xrmZc7ETtKHqUQE4Kq3DhP/uGvNDkwTpngL8AB7HMqQU7e
X-Gm-Gg: AY/fxX5XO0z5gVDr4BlKqtCgJi6sujXZysnkq5ie9v6Vm5XhbvuQbVJBGoiKYBFwJjc
	RvjbSHRdH0hcbyPR3e2GmqoxpfZG0lXdL8f7dSGEM1PcLErHxIZwuqIZEA7GLphK9BWfUf5rT3q
	5REjLd0X2Uw/EvBozMBI6C7sQVBIcJHZJbU7yyTrx5JEj2ahdu+COy1C5PsF7piEZ2Wcd/8ZOpj
	nUbJUw8EaIltf5n1JYXiz5UwaCK4NL/J7krPPNfFK5R6Kawk7V2wOWileUa2LFoWx89LZlNyMtM
	4cljtrp14964bQHgZfOgWSQivIbB399f8/STlu7ZysymVytuHAJJAZrN2OcgKyQDihYoMHPeXPd
	SCytBBVcj6xmHFVw=
X-Received: by 2002:a05:622a:124a:b0:4ee:5aa:9c26 with SMTP id d75a77b69052e-4f1d060ee27mr177541831cf.55.1765873520305;
        Tue, 16 Dec 2025 00:25:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGZLjYQHWWjOBFVoqLKEI6xhAvdwz8gex573C8G2rYnDfL09RnGGOU7r1VAReLBY0wXhN+jYw==
X-Received: by 2002:a05:622a:124a:b0:4ee:5aa:9c26 with SMTP id d75a77b69052e-4f1d060ee27mr177541711cf.55.1765873519776;
        Tue, 16 Dec 2025 00:25:19 -0800 (PST)
Received: from hackbox.lan ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6498210fceasm15134381a12.24.2025.12.16.00.25.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 00:25:19 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH v2 0/2] phy: qcom: qmp-pcie: Add support for Glymur PCIe
 Gen4x2 PHY
Date: Tue, 16 Dec 2025 10:25:03 +0200
Message-Id: <20251216-phy-qcom-pcie-add-glymur-v2-0-566a75672599@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAF8XQWkC/42NSw6CQBAFr0J6bZtpECKuvIdhMc4HOgEGepRIC
 Hd35AQuq5JXb4PohF2EW7aBuIUjhzFBfsrAdHpsHbJNDLnKS1JU4tStOJsw4GTYobYW234d3oK
 qrp6VrUvy2kCaT+I8f470o0nccXwFWY+nhX72j+hCqJC0v3pLF6+K4t7zqCWcg7TQ7Pv+BUFRM
 BTBAAAA
X-Change-ID: 20251015-phy-qcom-pcie-add-glymur-096b6d951fac
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: Wenbin Yao <wenbin.yao@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abelvesa@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=965;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=X+Wi/7dfYFuQjLETokYHwl55pAtRQD39RkfFKO3yGwg=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpQRdhheuvPn5TFdQkL+Sq3gVQamzhs5ELdjXdk
 D8g/PcARZOJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaUEXYQAKCRAbX0TJAJUV
 VrMqD/92rCTQwllXb+RrYwrczOPKXjE/M5hJ3weNGf6hUcZgDMOeoG323xl4OjbHzuOke7uxTVC
 W+/NQIAO+CY3E55Ry63drpjmYLtdBGbnPHI0YnxE9PALAL3GmO14W+GJQPoDqKL4nKeLTTFhfC8
 5jbtBhjJLJKY/DBEFckVL6Ogo1772CCaKbic+3kPYd/XqBVGFG0AWUOVDpX2t9Eg5UJeWpeVBx2
 qzWspPkCadG30o7TWir/i1NWcy1eriRr/BoloLWCMSmmh3AisBY8dGqE0hY+a/mhwsbK4ya8Ib5
 EWrlnNCggkf7NEM4rdqZmOcyr9toKTnUatLtUPHWnAC5iavY4mv6VvzJXAM0Gl/YhHIZwjSeuCT
 53qUnwM+1Oxy79/m1x7ZelM72OS1609lHdI0/imWQDNxn7I04katAzrEieMXeTwOb9e3+eBB230
 E0yFFpWIvcYnCLXlPm0A8nQoJ48HKrm3p4vC9Cecl66gQfi/MjX6EMqtcTFgUN1vINGHx4KdQ5G
 Col+12mhXsTg6ThGdT6rwXvA5FCMk8LRd/hr45PB5eaTIwa9c5JNnHf2D+JlKkTzXtOhyjIM5DS
 cduvX5llJpmqXju52BiuIP2VDtwOec9tIED8qXQagTRhsLT3o6T16VAUHibFDWW7obX8S19RS8Y
 dR6a7z5EOPSPalA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: QYH9_GMJbCOR8TZ1gCmzD4Af829pwFBb
X-Proofpoint-GUID: QYH9_GMJbCOR8TZ1gCmzD4Af829pwFBb
X-Authority-Analysis: v=2.4 cv=TcybdBQh c=1 sm=1 tr=0 ts=694117ee cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=DdBtMnqNxkYIvXj6ev4VzQ==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=LUK--ORpqSMM-KfJUm8A:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE2MDA2OSBTYWx0ZWRfX2dhnTrG8KMbV
 pd+bNBdAQ3reok+ww6O+kcTvy1q0YfLuvUQ8LV+aPZ0u0I6OtI2hsSnQblvFhVPuMoDjoRGL9r6
 1hKjDQ7VsoqOO4DmphECB4OZ821rpUYxIE5nLm7x8N8iU9N19l52xu76kmd4tfY1WlGCvkbFIrW
 g85+su9mazJbeyizmJTNfVISBrvHZ4ee/AEV5oIACL2rpbl8ZkZBx1COXwuE1ENK+NfZgJb7KbM
 JCJZu1gxvpeoHOt4r4XMFe7vcaAZ/0L0jX14OfaV4EpckArGkbOiiAInoYKBn1hmh+JdkRu5XB4
 sfbEEoOEmlEWsB8u6sWma1Wo6qfwh39t+h+7zswvb3XV1moYXRLSJMCiz+aIW9qvVL7Ptc2zO0a
 RxGnhFTw72oM72o+LKc0RigiSKWORQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-16_01,2025-12-15_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512160069

The Glymur platform comes with two PCIe Gen4 2-lanes controllers.

Add support for their PHYs and document the compatible.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
Changes in v2:
- Rebased on next-20251215 
- Dropped dependency since it was merged.
- Picked up Krzysztof's R-b tag for the bindings patch.
- Link to v1: https://lore.kernel.org/r/20251015-phy-qcom-pcie-add-glymur-v1-0-1af8fd14f033@linaro.org

---
Abel Vesa (2):
      dt-bindings: phy: sc8280xp-qmp-pcie: Document Glymur PCIe Gen4 2-lanes PHY
      phy: qcom: qmp-pcie: Add support for Glymur PCIe Gen4x2 PHY

 .../bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml   |  3 ++
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c           | 34 ++++++++++++++++++++++
 2 files changed, 37 insertions(+)
---
base-commit: 4a5663c04bb679631985a15efab774da58c37815
change-id: 20251015-phy-qcom-pcie-add-glymur-096b6d951fac

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>


