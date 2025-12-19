Return-Path: <linux-arm-msm+bounces-85948-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C5187CD12AA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 18:34:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CDCE13070C13
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 17:31:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D708E316917;
	Fri, 19 Dec 2025 17:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Cks+pymi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DTWZHOJ6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFC4D31ED81
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 17:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766165502; cv=none; b=R7UnGMb1pIjyEQuZrLJoS5R56tXQLf9xnB0lt6lahRklAskCGZZgRYxhc97CO7SeUTWEnbgSrR1rD+eQCJWC+7lrAia1YNpyvmcjqhOii6sqAV0PWotcml1jDoihs5Xrd50pnHsg8sLKjrKBhDbKms/QlzTqWluKuDYr/eYZ5fU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766165502; c=relaxed/simple;
	bh=pP26+1wUMnMr1Tozf4bynlfcpdn4IpokB44y8hg/gY4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Px7mZAFXTIGB//QXn5i1lP+1BtVmgf1WNb64oddQtqbseikiKlP8N03GmO5Vu/VYwJwYTIqZKSNMelK6PhNSpPaHasL8tCUBKGYpj7skXS21qokTNosvyKf338AGEnpwnoOOdqGHpqjcskNw6G4kb/90HlLQFA1QQmflUlLlp+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Cks+pymi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DTWZHOJ6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJFjVu71744893
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 17:31:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=9rRpr+2lGVf
	GO2ynoRNZ3+oyjhCVAZtHgCMk/WRUehc=; b=Cks+pymiEH+Pk8kSf4FSNR096X9
	UkWSo4KzcTg9M5BHtki8/n/CsG3NXAJ/NcAfMgRfRsKIhuIaWm+UDCjsr7flseMF
	Sor14s0DAojjmdpdtcSkyEaQblGwFIweSgaEYNfJjcP/TgmaD43mdmAy4cavIMhu
	mP75OSnI0DpDrHD5oEDY27dGF0nnd+kS1o+Igr22s9XrNKzh6Ge9W70+6Usun++V
	6fIpf7UvMl05R+IlL7INjFgncs03oGOTbYnT8LNDCNPr42e7/DoWi/D5CMoieoY/
	OJtZGwCccuy3MVzPSPmdfozK38isHHolGl9D4NCcks+LqH2p9cDCEAhQoVg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2dbdyq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 17:31:39 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2a09845b7faso27314445ad.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 09:31:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766165499; x=1766770299; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9rRpr+2lGVfGO2ynoRNZ3+oyjhCVAZtHgCMk/WRUehc=;
        b=DTWZHOJ6KizTcpxDZYK3+iKts6HE78GbEE3WMLuBFQ7koD5ix9y3564IQEMn0kWavk
         ucvX80qnvJUBgF3Gyi76gxy/lvc4dtct50cuOV9wN3Ob4UV/cGxTYDUksUKszrAIM8E1
         XiEaOl2SOU41B5F9vf64scbKxlrmUMJIqqot3YNXZQeVtRv72CMhHk/nchTEFpLLd8XL
         kASAKZ7fe2uxh5rcHtO9TLjUvTeJhV6l4DjKp2OvD9wcakUN5NphjSjd5hs+LqREU4HH
         UbKQ2Ud38TWFr5zNz6aCuvrxQ6TxDtXKuk7uiCdalApuLqltrm2zZ67JeaKgaGnVVKVs
         s23w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766165499; x=1766770299;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9rRpr+2lGVfGO2ynoRNZ3+oyjhCVAZtHgCMk/WRUehc=;
        b=g+rn/HufogZz/ZIza9CGxNveOsruvARC+x4STPVzA+sd0G8iLAzjXAyH73pMibkyrG
         RahZsjE+PTz3h+pymu3uaFbG9B2tHWoPiBURcHpV9zvH6z8yqBD6YMlbud3+DSmRCtNr
         0n3xmf5XB+lNL0yuG9QiIDintygqgB9VQGxAVGMZ5zG5lCQotKCJXhlXzFDtlcODvuzx
         pm8pKHkFI2bzDpRDojWozcAsBGHYH8B1npdmkJ99UVwf7HPss0VOMnRd8zxrd3v+KHnp
         wg0uktCV3UB9dBYDa6Qp1/JmwujudTb0iIKK/L/PZ+WXdbLwRf76TYPRM8kwVYHXBRul
         NqwQ==
X-Gm-Message-State: AOJu0YxqWuqZL8Yx6kWqRBEc9rd312lTXwheS6EmpxDSZjDiIl9jwntI
	IPp5i98dVNdZuaIR/Y+WxnNlZVHNnRhnYVaEMW7YxVGS7KN505Zd3oncIC/nq/8cTipkA1cn3pH
	Kj/zR1comvrkWuvA9ceuW2o8G8YhY4WYuUlqgq2xxMm/SXpy0DRxzsvFyciE6UACSyjpQ
X-Gm-Gg: AY/fxX4tOX7zo+HcbVaRMhdUllDH19AsIxlNbSshhzyLogDhXwbkwJfR9vEC9mCXn/F
	w9aVt3+r/wrCmV6CyihFI/Wdh4uSBIwKeeT6KPLPwTbN+jKJRf8ofZCZV/z/nbnjfMkJpJ7zAEa
	IduJe/rVDGntrck0aPNBdT9qq++WUVoaHfFQYcnQfPAerU4MXnqF3i0onPASRiGR7IEnzZ9Rdt+
	dxd2EeN82ueEEFDI+jTaHqcNUGqkOPZxHSsBwTTbh4PME84jU3QbbyYy/gJoR6Hb5G7o2ieXa57
	gOTXKgfJCTyasyW4N6sZ2Ctyk9as1xE8va4KHDTHX9NnnpgiCzBaAzrb3MvHFoyQ4SdMnzN4L6d
	4YsEgWvhjJzXALieKtDrQTx2OWlGPQ275R1uViZZgPbLNGSw=
X-Received: by 2002:a17:903:3d10:b0:2a1:388d:c084 with SMTP id d9443c01a7336-2a2f282fb33mr35306305ad.42.1766165498891;
        Fri, 19 Dec 2025 09:31:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHkdGvhSvHIucDXnFNADNvwoJ2Phvw2oT21ZR5c1W3WAQHaZ4DaZrpeVugAoWJynpe0OMwzmQ==
X-Received: by 2002:a17:903:3d10:b0:2a1:388d:c084 with SMTP id d9443c01a7336-2a2f282fb33mr35306005ad.42.1766165498357;
        Fri, 19 Dec 2025 09:31:38 -0800 (PST)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d5f5dasm27568705ad.82.2025.12.19.09.31.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 09:31:37 -0800 (PST)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Pengyu Luo <mitltlatltl@gmail.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH v3 3/3] arm64: dts: qcom: sm8750-mtp: Add eusb2 repeater tuning parameters
Date: Fri, 19 Dec 2025 23:01:08 +0530
Message-Id: <20251219173108.2119296-4-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251219173108.2119296-1-krishna.kurapati@oss.qualcomm.com>
References: <20251219173108.2119296-1-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=AcG83nXG c=1 sm=1 tr=0 ts=69458bfb cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=EBPEhcQlbJxYYk3eU1cA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDE0NiBTYWx0ZWRfX5Qh0lYN6iyTY
 6pkPh7F3ONU1yWL1SYLk3M1DoQTNbgH7OhDIPXz28T/Le4f11Df8qp2uF2w9BaohXJ6GiY3ExH0
 GV6CLc1c68+PihIzBablqaVnIwwQmBAPHyzMrR7I9G7hmbpyIRgzbEsv/Dw/J0wajK5NvIJzYZP
 6uLGMaxvkslVTeingZld29h3qUXv0nYYFtPgGeQMHBFCfqV1O9j+CSAbpId91EE6CM8qZ3HUQIa
 iBk7ob5ZuN6DxPLYWo1dR604/u+KgLIDhe3I+4A03LjsXWdxq0XOnjsBhHxWo9kuGY2nT7MOEqZ
 DrAVIL1TLKB8EzglRMC3F7nh4wI2Y96V5/NUnSJ7SlDFROZClvcrJFPWPHpuUmLYcQoZbd8+Iz4
 Iu1uxrbCxm7GEhT9NEtzeS3+9fzpQUa5QSxgQUVJZx6egcGmkIRr497AjNpW2k/BcOSkQ0VWTNB
 g1QgcAhbO49X1FkHSog==
X-Proofpoint-GUID: fpCxvVJ1sfuwDoXnAgQj1uFXaDvNTuDV
X-Proofpoint-ORIG-GUID: fpCxvVJ1sfuwDoXnAgQj1uFXaDvNTuDV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_06,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512190146

Add eusb2 repeater tuning parameters for MTP platform.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750-mtp.dts | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
index c8cb521b4c26..e28faee466aa 100644
--- a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
@@ -1039,10 +1039,14 @@ wifi@0 {
 };
 
 &pmih0108_eusb2_repeater {
-	status = "okay";
+	qcom,tune-usb2-preem = /bits/ 8 <0x3>;
+	qcom,tune-usb2-amplitude = /bits/ 8 <0xa>;
+	qcom,squelch-detector-bp = <(-2000)>;
 
 	vdd18-supply = <&vreg_l15b_1p8>;
 	vdd3-supply = <&vreg_l5b_3p1>;
+
+	status = "okay";
 };
 
 &qupv3_1 {
-- 
2.34.1


