Return-Path: <linux-arm-msm+bounces-78807-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 77017C0A6A5
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Oct 2025 12:19:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 00D584E60B3
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Oct 2025 11:19:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECFC02877EA;
	Sun, 26 Oct 2025 11:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iuFGb4wn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E840A25785D
	for <linux-arm-msm@vger.kernel.org>; Sun, 26 Oct 2025 11:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761477516; cv=none; b=FJo4bDoJkZ1WKD1G6byoESWMl4DzRNCMxmi5mqizv3fFf9n1xnF7+fDtL5qur+UQ+Umt1quAGCT2P66Ym8skbb3+EyDsWY2mH4D6N71iamRy3Brxt0IQX8nkcApyGq/LJoQ3ItnC1kHgRBrMqifUbrNWkiMslGc0nGs9NcZnYLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761477516; c=relaxed/simple;
	bh=/5tkY59HXh8B8aDdyVmmItvuIc+g3lCV6AksjjSsun0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jQkB4mscmO8NvFRTo19RysLb091DPw8xrPQx7N4x9tJAnjKnDCmtpAAyxuEkNbRz8ZXa3MxLTuI9ZjNvLJbmsXVa5u6VViIV0CkgMMmLuv9DaKdyQ1SvyjBvi/cunmHZ+emWUp19vTflESwksbcpGq+u8uHv1ojd0WqTIE0Sruo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iuFGb4wn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59QBGwWb3902331
	for <linux-arm-msm@vger.kernel.org>; Sun, 26 Oct 2025 11:18:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=orf99F9rIUd
	Vj3nTu8FkMX0cNvOcZ2dsYnrafF4Soko=; b=iuFGb4wnZRTxfqpFu4ioIOxnmfC
	EJ9UgF3cuqo/M3qL2v/CrxQ3PlrUWRhVTtu2Zan4fUfVprPX6jpaOvQUnQQD4wuN
	Ru+MCNNGiIfYSE4Thjmb7aeQyK+5m/0yNbP8dkMTftbJoRhlFRu8+scXO9aObiKI
	ENlK2okkRbqg5rk8F9qFYZ+SN1W/+SFP7xUsJKDUV0jlEhs2J8YgRCP4sWhrhlII
	kyGuiCvlVRlr/mhnbNa/rD5FW88+Z6+faphAa+B1Bu8EtZlMCtyQtpWhgodiO67M
	37g2smx4NIud51ZPme/qafh0mHeYsd3xXgu1LzTi34VeN2S+IcIajo3GKNg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a0nnxt0sf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 26 Oct 2025 11:18:32 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3327e438680so788922a91.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 Oct 2025 04:18:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761477511; x=1762082311;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=orf99F9rIUdVj3nTu8FkMX0cNvOcZ2dsYnrafF4Soko=;
        b=UyAa3pkC724RXUKZMZDKfUneKGRXjs7Z9MKyjZHWHw8qujHzZ5PRKPWzdt6Vtt0aSX
         YYKsGNcJPtijXxO9gOGiam87GOeeQ0ir0nFBMFHrzq50IBSmNVYlkbCMTKo2q5Bprnze
         CIqWZ1N9x6s1PufuebBTaNbdkhrBDcs0XSNa0kPlZyUwDAlDepu7SLbN3+BWxeq1Ou0g
         KZUcbbrjkl6RAswt9Hz+bxvqSqdMrgRGRRo6xD33vUSvw3JGY9kTJNPnJkgac8dN7bMp
         7eDffRZSUnYgUbDMhmyVNgdMdkHyBp/zmyPdrwhAu0yi8b2IDvBcrnARqUpx964wxJhJ
         or7w==
X-Forwarded-Encrypted: i=1; AJvYcCW+w7wuzICLsR3NLdlcm6+tsjPqzji4xwtuhB1KNwCRK9jyOsYhDmhKCf3I6typleTUQdvGRJXzazfXfCPJ@vger.kernel.org
X-Gm-Message-State: AOJu0YzrweT4jm8PhDf8rReYlvq8ApyhGyVOSM1ZrvaADWo9ao9pgCCw
	/f28CvBoYQQ1htZsob9hfbeXIXCDlXa+P7vWCBu2kEK1yMc29ijAyMWkDsJ+jq+jTsLOsDpj0CN
	G0q0B23y47InHZxHuQ0zTBRYLXLOd+YOE/thmH0y/X5oX0WQXt3N2nnTYEUoXIlPU9Jw=
X-Gm-Gg: ASbGncspin+AHD2e7ziPn4q32qpBhluObzG0OppX9Ek8NOVQkYMINFiwatYDHNKoFHz
	Ck+gmVTaP+IQbnN286ppjQOhWj2qZlpZUAUVuTaDlXzSdyYwbMjVZQFvNe7YcZr75MWC2REB2Ey
	mn6uz1HBZPaIshL8kHDNVTUR5bKAL9/Ur07cRQv9DQNc0Y5phd/B8VYIWXY6vO9OTl39i1pjhp8
	p1MMSYNX4FCijX+FTnBwpYHhALFmKcz/6NoDsX+I3Q9c62mjvYEPNj7sBrym052OpoiDzQt0scw
	f5GjtZI3W3lUDvpOYCEsrhtjpMFqkoJaV72kd8xanLcLTforgRf6oH8gynwcJreKCMoisE/TxnB
	6c4UiqgDZiwcBa9v5FR8KwPXOyJhejA==
X-Received: by 2002:a17:90b:1e07:b0:330:7fd8:9b05 with SMTP id 98e67ed59e1d1-33dfab84b06mr12871769a91.3.1761477511150;
        Sun, 26 Oct 2025 04:18:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG0zlO8ZyzF/mK+UtlqGE2zq64/vgrPf3aWsH3pYbKg+KXxudz8b5pvQbKCX53QRCjaE86Ukg==
X-Received: by 2002:a17:90b:1e07:b0:330:7fd8:9b05 with SMTP id 98e67ed59e1d1-33dfab84b06mr12871745a91.3.1761477510670;
        Sun, 26 Oct 2025 04:18:30 -0700 (PDT)
Received: from hu-sartgarg-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a4140301f7sm4707829b3a.19.2025.10.26.04.18.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Oct 2025 04:18:30 -0700 (PDT)
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
        kernel@oss.qualcomm.com, Sarthak Garg <sarthak.garg@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@linaro.org>
Subject: [PATCH V3 4/4] arm64: dts: qcom: sm8750-qrd: Add SDC2 node for sm8750 qrd board
Date: Sun, 26 Oct 2025 16:47:46 +0530
Message-Id: <20251026111746.3195861-5-sarthak.garg@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=Xc+EDY55 c=1 sm=1 tr=0 ts=68fe0388 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=Fl7qsps3WXD_dGGssnYA:9 a=mQ_c8vxmzFEMiUWkPHU9:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: v-jPVNB8CjIXjIl2npeLifadIj2mpxuJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI2MDEwNyBTYWx0ZWRfX6H8DC/cCMILd
 BdBezo2CqYzPVNdDDgwiXs5+YuEabb1VAGRsDL9bEpdAc2u9f0GeZresNphSjzURb/+NMdZD7EJ
 Yq4nc/r1FuH57lBLvs9+Xp+s21/OdV+eF94XUqjfmHTr2L9S2nTSK9VEWpkEmCR78oqXNINbDqz
 oHk7tYd++FQg3A+Ee0ToPMXJWy6JgWvkQ0nswLjwveEBQ28uwVny8XGPOHMKENcl/9XqWplcPCQ
 jnMYJR6dpQqoCtb2suzEgwus0vf7nsmgsx+Av+lSpl1XNNkZ2TBlHT0M1lg01vCEvNfz5hqRil4
 jt2v25Lj6VRD5xPdIMeA8eZ0I02yM3vx7lW3V5E/iPpO9FqFl8UbnhCIZb/2o2J5O6D0YoxZOxT
 LA2mZK+v1+bPWwBoAwLtVU4yd7g5Bw==
X-Proofpoint-ORIG-GUID: v-jPVNB8CjIXjIl2npeLifadIj2mpxuJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-26_04,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510260107

Enable SD Card host controller for sm8750 qrd board.

Signed-off-by: Sarthak Garg <sarthak.garg@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8750-qrd.dts | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750-qrd.dts b/arch/arm64/boot/dts/qcom/sm8750-qrd.dts
index 13c7b9664c89..c2ab39744a0c 100644
--- a/arch/arm64/boot/dts/qcom/sm8750-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm8750-qrd.dts
@@ -1031,6 +1031,29 @@ wcd_default: wcd-reset-n-active-state {
 		bias-disable;
 		output-low;
 	};
+
+	sdc2_card_det_n: sd-card-det-n-state {
+		pins = "gpio55";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+};
+
+&sdhc_2 {
+	cd-gpios = <&tlmm 55 GPIO_ACTIVE_LOW>;
+
+	vmmc-supply = <&vreg_l9b_2p9>;
+	vqmmc-supply = <&vreg_l8b_1p8>;
+
+	no-sdio;
+	no-mmc;
+
+	pinctrl-0 = <&sdc2_default &sdc2_card_det_n>;
+	pinctrl-1 = <&sdc2_sleep &sdc2_card_det_n>;
+	pinctrl-names = "default", "sleep";
+
+	status = "okay";
 };
 
 &uart7 {
-- 
2.34.1


