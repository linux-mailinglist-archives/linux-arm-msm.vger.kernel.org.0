Return-Path: <linux-arm-msm+bounces-81348-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B44A3C50FB0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Nov 2025 08:43:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1339D4E6003
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Nov 2025 07:42:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89BD52550BA;
	Wed, 12 Nov 2025 07:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YWIyzax9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bEwNj5dU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D83C42C21CC
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 07:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762933339; cv=none; b=WKCk75FYLnjGCLuc5AUyJvt9GgKPz8JcHR0+5ZISy3fmWmNBXKyAo9DTXpoI3RQBRWoPeFSxzbGIbafpgkJhms00LUQNlecNjD6Ic41ICw5cEm2PrXmy1i5I6i575NMF30q4+YPlgasjXMDinKT8ebITEvppBo/4gd4imMRA6hU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762933339; c=relaxed/simple;
	bh=qnRVyznIp2/9hXbw7y6c4CxmpQo/GrGH0lc7ReCMlUU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=naWt0nowaIEzrWnY51BoK2cnZXvqCSaZzIQp0x3hQcKPaCAPFBWoo2mkcUegdUzsk5jaoYrwnQKAD9j7E1RIkwIEPSVYXnusw98TDe8D3Chiyyv1rDPa05cKRgdGGTslEv4izpbXXTcCfcUfCRbQXp4vHXWG4uzkllzrWlbQrlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YWIyzax9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bEwNj5dU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ABN3FAm3921656
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 07:42:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=SRS46F7+myfHHV7nZlBsNh
	Dj7nA6bojeVEV1V5g3wDE=; b=YWIyzax9YUBwsaSonDzsKghEcyFx6/U1y4L8mW
	ban0xVOBCUoKlTcce2IG29NbgRhaRRyUmGpin5juhoFOuFVbSjYptMM6Lipu2rIY
	x5OLA4j+ps3itXz63ERxFFoxJZalA6TWi5DHG7zYXp00dbdntiP9eSP98L2Lqsgz
	T8er4KWq2XcUdn4WT4ly+2ZcbpmBnIVfY/vW/u3tRKBEgGR8y7qBJdvFBxkmty3p
	5cONehSYKPf7sIcF2ig1VeJKktqd0D6TQnYoRGkeT4V4A/5AaB7O8yZijBaJbiud
	jH4YOEq9HhHvRwirPNmZ06dcM0Z33AWvGoGa1MJ3WPWvKKZA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4acefus79p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 07:42:16 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-297dfae179bso13857615ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 23:42:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762933336; x=1763538136; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SRS46F7+myfHHV7nZlBsNhDj7nA6bojeVEV1V5g3wDE=;
        b=bEwNj5dUW2C0cGf1qM795quWS6aigjAGCEFw2t76ALB3sSYofBRM6auJtB6jOpa8Sl
         KHt+2pmTqlBiUZ9/NHxu3Aufe0SXYSeuXNd44jHKuT+BUvkTc0b/0bAEhFy3GL2luLU5
         HB5mpY9qoSeQEMKr0TASGQCqn9UePvOeXoWcyfkFwMeFWcdW0PkF6VQmqpnuDcjH14dW
         7gwpsjdsyFjVUh2B/wgYcb+xp2ktHZqdCN5fRPvhVIOTdXiaxqlYqRM4WcdnLkf244Oo
         GWpCYyTGU0gQlAcnveRaIgqv/UiSB9dWjWxntHZcTWENah/7MwACRU3RCpEbh482xrsA
         +FAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762933336; x=1763538136;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SRS46F7+myfHHV7nZlBsNhDj7nA6bojeVEV1V5g3wDE=;
        b=NCfhDN5b1wO4whCZ7MKVyWHZOpNkMdu7tjN/XW+5koNnFUeGwMb5QRjv7oZBm26kBB
         AhwKMpE6gLI+NJRtAyjbmkqG/XxPNXEfHmibCTOLrXTwKjH4IUfYFg1p5YqkTIYG7zRL
         agXIjTkMVt5Tg0FLKERNVSO4QAduSng2B3ZP4pCl+bOieoQa2skWfiYfDvRigTScq8J3
         3Skl8fDwyRi39x1zZQDfDsrt9CH1cYNTuWIrtppXMcSgr/jVHRI8Plk8RgV89btMwARe
         QCGL5ZQYlfEqTfJy2CHpmOiKclBiHWyepdoFQ2L+ARAmPG5ViJZYi+6pQv/AwN+w40ba
         kJ9A==
X-Gm-Message-State: AOJu0YzbBSoYgg+Ih35HwRDiBv0/V6Sp/5LUH2jim8YB8mexziPUN17l
	jLZJGMVqr8kVZkfI37ZXGNIre3ZylU/cNWG2ydLn6eZ5BGT20bUcWUqI+ht+wgxxw0taO4bZauE
	BRVCmlEUUJOfsjZDX1sN5XspIgJgDfVXLm32Aymzk9kgPDYnyCjlrr4XkuPo8btV+Eqq6
X-Gm-Gg: ASbGncs64Wfo3Q4ZlsKHP4gCKhQm4/aoIU/DI1zYbbXD3dueOVyjPHmIcIZPabnie+u
	Ll7sfDNO7rEFQDM6dzK3U4B8YJBdYK8EHz7x+5HM+gaJqWgzbHlUCPD84UZRhuBIhiPgWqdEg8r
	e8peuVxGgLXkRe7VMnc7GGdSEoFoiBHQ0g+usFFOTr/mJgZ5y1tpRSUZtqcR+M6j7SKCOFFOOlL
	aI1CgZMvL5mwxAzv45FPdYHQ3lT5doPI1FTyQ/IzVEAJ9q4AIWc4lX53irUImL48bm723Gc+V04
	fv4/zfrkI+fRRKGLXWneoL3iKc4SzNiS4UArOiLyarPAChTCsf4wtVg3ftO01ZrIIQKOlH7daCn
	XJqMdLxsQdjLWCzfkHlVmcWU6b8iCfCk=
X-Received: by 2002:a17:902:d4c3:b0:28e:756c:707e with SMTP id d9443c01a7336-2984eda94d4mr26638915ad.33.1762933335615;
        Tue, 11 Nov 2025 23:42:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFY/P0lC5DPYonYSA0luXIUsZtxf8uIzeBz3ZJrJSJzy3UVuUdgdDSnbIliXj9jNA4GRFaMOw==
X-Received: by 2002:a17:902:d4c3:b0:28e:756c:707e with SMTP id d9443c01a7336-2984eda94d4mr26638535ad.33.1762933335083;
        Tue, 11 Nov 2025 23:42:15 -0800 (PST)
Received: from hu-afaisal-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2984dbf097esm20457705ad.32.2025.11.11.23.42.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 23:42:14 -0800 (PST)
From: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
Date: Wed, 12 Nov 2025 13:12:09 +0530
Subject: [PATCH v3] arm64: dts: qcom: hamoa-iot-evk: Enable TPM (ST33) on
 SPI11
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251112-arm64-dts-qcom-hamoa-iot-evk-enable-st33-tpm-on-spi11-v3-1-39b19eb55cc3@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAFA6FGkC/6XOwW7CMAwG4FdBOc8oTijNdtp7TBzc1qURpClxF
 jGhvvsCpx12goul35L/zzclnDyL+tjcVOLixce5Bvu2Uf1E85HBDzUro02DqFugFPY7GLLApY8
 BJgqRwMcMXE7AM3VnBsnWQl4CxBlk8YjQO9vYoR3ZGVa1e0k8+uvD/TrUPHnJMf083ih4374qF
 gQE15GzXePGntrPKLK9fNO5loRtHeoOF/MHq2dPYgY0oEZyGt/bXbf/B1vX9ReW+/bGbgEAAA=
 =
X-Change-ID: 20251107-arm64-dts-qcom-hamoa-iot-evk-enable-st33-tpm-on-spi11-c8353d7fe82e
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762933331; l=1821;
 i=khalid.ansari@oss.qualcomm.com; s=20251105; h=from:subject:message-id;
 bh=qnRVyznIp2/9hXbw7y6c4CxmpQo/GrGH0lc7ReCMlUU=;
 b=hQK4ahqXPHRqTxFOZI2jgILKMQy08qbldZr4ZchvuRI0nuFSBaW1PhU3Aih2AeuXv0MNXOWFx
 il1jePjFzDvAZKUWV4TKSyyNUUZ0dwQr80Hn1xsoThSl07cIs5YxEfR
X-Developer-Key: i=khalid.ansari@oss.qualcomm.com; a=ed25519;
 pk=eBXrIUgTWV0cgG+GsNeZPPgvj1Tm6g9L2sfcoxMGrKo=
X-Proofpoint-GUID: YUUTHSiy8rfGxlsllndRlzj-B6MSdMGG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEyMDA2MCBTYWx0ZWRfXxnrIOlPbcOTA
 5BRZhpP3Z3LY23m2vYO62CENncxuwxI+u5uBD5QImQmOpwJwn9r1Nw71jitA/TNFKXrOrSbCzjx
 h+BspaKNIRb2L3fG98lG5cOejy1tpzl+E/ItKnwPtjeYfZygQGUOShFbgKwv9eXRfoo0Ge9Jo8X
 cvTv1i31Z4wmm7zsKfPhgdgGFIF7yPLlWb+uaJqJ36LNZZy6prFXtD9N3mCuFztGee7v3JfzW5O
 shCw+SWin6MZqNbYGg+DvBfA8UtwUcbkYQJGAvkNSnkvUQoS6FRzS0ZqgRRipwEpwfNDfIfV1VB
 RhJ14Zda2Tgn/k84YrQQHzRl0y6rhugYZUW3AAvC6bfgOWMynfbmgdRhUaTlwRDeAmIFRe6gSH7
 cdtXu1tNnple5tTfHKngRZnTm/QchQ==
X-Proofpoint-ORIG-GUID: YUUTHSiy8rfGxlsllndRlzj-B6MSdMGG
X-Authority-Analysis: v=2.4 cv=H8HWAuYi c=1 sm=1 tr=0 ts=69143a58 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=0o05X4pXTjTZH81ee54A:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_02,2025-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511120060

Enable ST33HTPM TPM over SPI11 on the Hamoa IoT EVK by adding the
required SPI and TPM nodes.

Signed-off-by: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
---
Testing:
- TPM detected via tpm_tis_spi
- Verified functionality using tpm2-tools (e.g. tpm2_getrandom, tpm2_rsadecrypt)

Depends on:
- <20251106102448.3585332-1-xueyao.an@oss.qualcomm.com>
  Link: https://lore.kernel.org/linux-arm-msm/20251106102448.3585332-1-xueyao.an@oss.qualcomm.com/
---
Changes in v3:
- Squashed patches touching the same file into one.
- Link to v2: https://lore.kernel.org/r/20251111-arm64-dts-qcom-hamoa-iot-evk-enable-st33-tpm-on-spi11-v2-0-101a801974b6@oss.qualcomm.com

Changes in v2:
- Use "tcg,tpm_tis-spi" compatible to satisfy dtbs_check (was vendor-only).
- Add dependency change in cover letter.
- Link to v1: https://lore.kernel.org/r/20251107-arm64-dts-qcom-hamoa-iot-evk-enable-st33-tpm-on-spi11-v1-1-8ba83b58fca7@oss.qualcomm.com
---
 arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
index 36dd6599402b..aecaebebcef5 100644
--- a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
+++ b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
@@ -917,6 +917,16 @@ &smb2360_2_eusb2_repeater {
 	vdd3-supply = <&vreg_l8b_3p0>;
 };
 
+&spi11 {
+	status = "okay";
+
+	tpm@0 {
+		compatible = "st,st33htpm-spi", "tcg,tpm_tis-spi";
+		reg = <0>;
+		spi-max-frequency = <20000000>;
+	};
+};
+
 &swr0 {
 	status = "okay";
 

---
base-commit: 9c0826a5d9aa4d52206dd89976858457a2a8a7ed
change-id: 20251107-arm64-dts-qcom-hamoa-iot-evk-enable-st33-tpm-on-spi11-c8353d7fe82e

Best regards,
-- 
Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>


