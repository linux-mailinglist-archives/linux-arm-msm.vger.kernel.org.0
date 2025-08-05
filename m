Return-Path: <linux-arm-msm+bounces-67748-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CA66AB1AEA3
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Aug 2025 08:46:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6B70918A118B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Aug 2025 06:46:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2F88248894;
	Tue,  5 Aug 2025 06:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cp4beBu9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C258242D9A
	for <linux-arm-msm@vger.kernel.org>; Tue,  5 Aug 2025 06:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754376292; cv=none; b=LW12CsLoaI9Zw2BoY1MBs/ZbaFA+vtQIncXxQQxbLNLSYLzW9aJpIjxjMevGzDNGgT3Ti33D9BuYRLCyv4EPLBK5Ye1HTIQoEo1UlVGjDMKtRDxsqVC7BWx2no6J7nvbInFEplZV7aQ44ysPW5G9fd7J+vpg7WeQjh7q0TT0EeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754376292; c=relaxed/simple;
	bh=QGTu9QxACBWwGBtZKQkCZpc1XZafgh+NUqcrEBKsWfY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SsXmg8bGJ4I4wAOXLQthFpCsVcWtt5FS6eW+UZar59+ldBO28K2FjUkUUwRfUPyb4VKutKJbCIT0dq2mYVLkkcCf+FUNCsmLZ1KbJ/IQusy9H6KDDO6Kx6ZwW33+y4OjrolB6c+PtxT44ydS//Rq1hrIdk9VgOUUuInUGhMoBRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cp4beBu9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5755J5CV007793
	for <linux-arm-msm@vger.kernel.org>; Tue, 5 Aug 2025 06:44:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=rzzUExB5oi0
	2Ea7zkpkwb/zIf32msjJwgM31Jx4lZb8=; b=cp4beBu9BPseW8mxCUvuttbsqZs
	uonNeKVqqQ5ZKCNrVMmidhnEK4fAMo7yIoYyIY9jknHJEjo/kMLeXNgQdSLvURtf
	DELe0Xwc3FABU3aZkvSeDS12XsbTf8xZ1QLNW/52m+Ru5SQ9WnozpFkZkqIfWt0b
	871em1YiDkZuvEGSqecpIvJKBVX4i6jsiuQH4VnsVMKSsnbdH0a1b/gWwjpfHTOe
	bsVE73jBt0pNyp2Fm7tUsUja2YOx9hKy8T1kXiNdU3SSG2zwxHCmG3VWBGJ9UcI1
	HX1FfgK149wYVyp/YfHjXh/klV+vKDl1mOTI/ZSWYBaCuHqDGtU1SziCSDg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 489buqqfbk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 05 Aug 2025 06:44:50 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-70771c19c64so100298946d6.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Aug 2025 23:44:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754376289; x=1754981089;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rzzUExB5oi02Ea7zkpkwb/zIf32msjJwgM31Jx4lZb8=;
        b=avTxwoeJgsYABuKRUtFEmUhtFemVoXxoA+kXwaZyyCt834Jy/phKF4r00YzX/PE/Ve
         AQGABStXScKXNXshJq6NvpWtI8ZFkR3Qvg9GssGM0ZXIOwNkiGOSKSYLwYPs3jJ0tlgp
         uHNAi1T2tENdICVdZp+RexTMy+KGXdbYwhHoWuuTAwXRR24Oew7qMvX/WbeafQEvz3gh
         WSRKeZxwj6R4gyBIxKUq22IUkl7MwfmuUmWFIH5TPmKU000bZRox/lPLfzFlnX508vrO
         cQTB/2pvhKPKsEzwNMjNfzJgM3SFOYmFVN21zVNeO7di18NpP3YSLda5YAqk+g/4g2gs
         bglA==
X-Forwarded-Encrypted: i=1; AJvYcCWtmvANLzBu5BRJlqRNtWgVTJekg0w8b4O0HD415lSPQCJXGJXZ+zLiobg5D93r/UFsqmv2tP0T1bbAOJEG@vger.kernel.org
X-Gm-Message-State: AOJu0YzFk3vUG450QI7/2jpvVsuNHsK8kIixl4+QB+wFXZrgUImOZ7ss
	ki/N/qaVjC6UxzPNWVsxnLKxP+qcG1Xgp14G/jwswMa6QKJ/Bbj/gLYTKcc3j1mISe4NzgGLJLY
	q+NR2oQyqpSRO6jkEMebqbedqEIfHlE1j9jAky0or+NV2SLfy8PG6F4YtoHG1sCg2q9UE
X-Gm-Gg: ASbGncvIBTj4wkk+kCcDfKWJL8T9W+DIsg0gXRsOjdoZQ96ipWLaNaEzIhajt1SVoB2
	vIYHO6cA4PtfZb4hg+78u3HrEq6CHXp7Sz3opSEpgVHOKh+opqMi6ev5miQhbspgzvS6wrd1e/U
	8gILscok0geBEdqi87tRZP66+dwryrJkwpuFl1fyWiThlyl0KxWS8/EhD5XDwPYLk2kPiR1WrWS
	zWCycd2v5tU3Vea6OnMQK/NqWYaFB5/cPvVWaDHdOiy0mRgMehpHfFBvIo8tObK+GErxTRPN8rP
	8iZ2uDKADhNXQvmDoGOM1LVrP8wbxWasSKGLtyHWIEOkrlY3tG5YLJStrGQW8jUFjzuSPEhQgH4
	sv/vZ/jI84Zwt
X-Received: by 2002:a05:6214:248d:b0:707:6cf8:5963 with SMTP id 6a1803df08f44-7096697fb56mr30657446d6.9.1754376289011;
        Mon, 04 Aug 2025 23:44:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE65nbtLDD/3t/KLzicnVLGSD/iwnbyxdIJGzB2Ftm964kvRn4z2OK8EPLsDfgZP6N4VYmTpQ==
X-Received: by 2002:a05:6214:248d:b0:707:6cf8:5963 with SMTP id 6a1803df08f44-7096697fb56mr30656486d6.9.1754376286385;
        Mon, 04 Aug 2025 23:44:46 -0700 (PDT)
Received: from trex.. (205.red-83-60-94.dynamicip.rima-tde.net. [83.60.94.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4589ee57922sm194015815e9.22.2025.08.04.23.44.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Aug 2025 23:44:45 -0700 (PDT)
From: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
To: jorge.ramirez@oss.qualcomm.com, bryan.odonoghue@linaro.org,
        quic_dikshita@quicinc.com, quic_vgarodia@quicinc.com,
        konradybcio@kernel.org, krzk+dt@kernel.org
Cc: mchehab@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v8 7/7] arm64: dts: qcom: qrb2210-rb1: Enable Venus
Date: Tue,  5 Aug 2025 08:44:30 +0200
Message-Id: <20250805064430.782201-8-jorge.ramirez@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250805064430.782201-1-jorge.ramirez@oss.qualcomm.com>
References: <20250805064430.782201-1-jorge.ramirez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: bdmAaTFcQ6IWFu4J1NkaTjG2TfxuNY9k
X-Authority-Analysis: v=2.4 cv=VZT3PEp9 c=1 sm=1 tr=0 ts=6891a862 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=Rr2dNH5/fcnoRoBmcVUeRg==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=Qms5JgQ9tnEuTiNUcoUA:9
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA1MDA0NiBTYWx0ZWRfX8CaW/r3qNXuQ
 n31am9RUWuMQQNMtRuLiy3b/hm+tIDMHA5n3TIPsr79Ybi3zKRcg01FhfKVYyjjoNmYV+F+z6ld
 XXs0EFPxztF8H2BcW4V6ey68dEZx4kQgokOJnHOgzJhjjNcwPeuv3axI3yWD8rm4FGX3/ZeFckM
 kCrBG/JaWhMtlFYryiPiOjLaHO9HY8ozuk5hxLcZcxhjUWfcy6B9CVDXuQWIePyDhfqD0GYTj+z
 5KKDPFaugOfLMaq6nsgUGplp5Lo4UEaYV4FHtkT+2ZAEv9CWr8t+8UqipPkkXknU38qPMGa1Gtd
 2cxTSGYFUjAmti08ebdvwKM5fNLbj7qEaBRDvaoife7o8/DvjNCg+9rtgsfeWOKipW3u7/SAroy
 8WymgN+xTMthhnlcufm34+4TWCbUnrGkbmL8iFQqQTJG99dGTZrC23Nscc95k+KThgxfWySm
X-Proofpoint-ORIG-GUID: bdmAaTFcQ6IWFu4J1NkaTjG2TfxuNY9k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-05_01,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=636 malwarescore=0 bulkscore=0 phishscore=0
 spamscore=0 mlxscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2508050046

Enable Venus on the QRB2210 RB1 development board.

Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qrb2210-rb1.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
index b2e0fc5501c1..e92d0d6ad1b8 100644
--- a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
+++ b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
@@ -698,6 +698,10 @@ &usb_qmpphy_out {
 	remote-endpoint = <&pm4125_ss_in>;
 };
 
+&venus {
+	status = "okay";
+};
+
 &wifi {
 	vdd-0.8-cx-mx-supply = <&pm4125_l7>;
 	vdd-1.8-xo-supply = <&pm4125_l13>;
-- 
2.34.1


