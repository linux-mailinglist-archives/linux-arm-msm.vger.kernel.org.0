Return-Path: <linux-arm-msm+bounces-89111-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 21F25D22A06
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 07:49:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9599B30210EE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 06:49:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80C612F6594;
	Thu, 15 Jan 2026 06:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E/Rx1+/g";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kojdhDX3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 936002EDD57
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 06:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768459770; cv=none; b=Z7jEKeEH8/3USFz8L0U1BAYaLcUUED3Qkqk+35TAP7A/oDFgwcKFyodQr0ucwOjzF4O8nEUPYPhVEJsFwkPl89pYhyA0Oc2/Jr0VvAnOAciuhrmOroRAXu3a5QaYYX7h90Zv8XGuVLnDUDqzu88X8UAtnj94Bm4/bcpPWttzpu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768459770; c=relaxed/simple;
	bh=5DnXk2S52sWEVtNJ/ttHYGdMW9L6THeQWIL1S1NCvgM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aMIeRdaW4K/vNc8d42c9mLFdHHe9tClWo08+On1UdQ7XtXwjYYTAXyMZTuS1RQd80lCPAiYM4pFfxQvg6wT1FWd5w7x9AEk/0k3Ctv2hy2ktfyC6e7AwJrQnB8/tYlSQvK+e07HqtHT6GXAzymZDSYkDBQotSfUb7jKHt88/Quw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E/Rx1+/g; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kojdhDX3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60F6fw2O1991686
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 06:49:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	myE3VXCg3Qv3AsV6Oh5PQqG5rOIKLZUBUr0dVAJi+80=; b=E/Rx1+/gdLAPc+k4
	mmTLXnjtHJy9fKtgxLcTjylFel05MYixzkoZJ8bYcntNnBGBY44qQ9G4haKCWb8Q
	n1z7Avu4Q+LjB4r6QIBWxCNrhh6ZuIklveZn9jKNSy1IHxopBP+l2o2Onn09Cc4H
	wWfv56cA0+64OfidAdi9eM6hxvt2vVm36jVOLz/Tzy4+l6UHWqfSHktc/Gk3BtwB
	YFAhxCR0KQHmEfOmnLNiY33cJI2zJUNTYc/fCgo88f5AZnlqAH3Ql7UfglL/Ee9s
	ZGXSoKuawUxZzcR8U7A2rdiXAfjHiQj6qCXrMRu1PofPig7bQGDe5vVIlyKiJmqr
	DxhYTg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bpbdbtwnh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 06:49:22 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2ae26a77b76so1254732eec.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 22:49:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768459762; x=1769064562; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=myE3VXCg3Qv3AsV6Oh5PQqG5rOIKLZUBUr0dVAJi+80=;
        b=kojdhDX3lFQkFkEVHBVCnmayqBkReX9mKngd+cQZygFdi3VJU240ChLKpeK8jsgsZ4
         9Nb9w3TeJRoPuJbLwABxvYhiI8ZN5aLT0CDi8HDy+ZzwntFER2g10yM/H6DS5K4iA0Ji
         oGYNGO+fmAGz87cetErw8kY4JyKmCShlmlD5Gj+Cm+aXfhgXQnOxlq5mbe/QWuknmybz
         KZ8gJtAq5YzG/HGIGQuntgZBJy34oaqz64hYGwBwlznG6JiFYuQasnbLnwkTHR8XiJb9
         o5ne7N7XV/R5/7fTJFu905VE4Pi5/nsrKjcAm552nYVgmrkE2UpSwXPTAs3snz/G2jYZ
         4g8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768459762; x=1769064562;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=myE3VXCg3Qv3AsV6Oh5PQqG5rOIKLZUBUr0dVAJi+80=;
        b=g0XPoB03SwnjzivqGEmvz2q8t+K0OlzDksoBUkeUqFNPFFKykbLD6c+RtTQaQooZm0
         /JPv8WwzOjTYieWAPjokEzULsT7Ob4zq/eealTWZeqYWnoVWg99Ul+vW05FS9O9aE3O4
         iBxI+/HRodtmIWNWm2widXVBCUA6DIaoVe4bKp2/0Za+U82oZYPmtRCD/e5Nws0eOrvJ
         /jURMHWP94pQEld7eKTrPEGn/y1gRZuo01KD8wWB23qqxD7pRJ3sV9/gr9F3F685Gfyr
         u2SGsIIanQgKxOMmV+tgbYtYe4R8BkSTKN4cLeWTP73B/aVqF/tmMjQ6b/OJaH7T9Q3z
         Audw==
X-Forwarded-Encrypted: i=1; AJvYcCXXFctWytLuHr3P/ULBJjho2q8pzA/MDV6sMIZlzXoDvh1/ECS0mo+gOFkbRdMkXUkQ/svpTdPe5PQX7g2T@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2OSmAG19btB+Ge/SyP2LxZmwT6FzqR8rt5ZY3iMJ8CFC+fzAa
	wxWzBBVbWE678jGUf4oB0yPCcWCl54MEd2vkOGWD7bTmsY3qptUaCkvyDsv6yqpDRpY3Pz3I9yU
	LU8+MdHIouyqNCMExJkLlc2GC27l6jUxKGP5ij/SMWk95wMYe3TaNKy67dTZRyA2YJIkF
X-Gm-Gg: AY/fxX4ZRE5vqsAaR6YNJ3whNJyIo304rlCyyDXsHmT7QYh32bQHAD3lg5rxz6v/r/l
	1WeU7LSBXqZx0Zu2xtWc6v67bZBfO+vJ0ZMQJ74OFuTodG0TmVIxXc9g1/IV6Q63pZqpUdGO6Dn
	mLsl7sYlHBVJk9d9sGK4uvgfEjGbynsOQ5NIjoDrbDXJ+MTupg+j39kDHMzWn5uKV2LifzkPdXw
	EDrKoZW+i1Qo4Da2Gm/9lmV36lS3Bhgi4ghoPWI/K8Wdn4Ke1paWWWD0gWvUil7Ojs4hKWdjXNP
	zJUL7rNDjnDFfXZN4pFdJQTAIRBa7fzLGl+bmPg2hPhVrWpombb13sQlFungbNQoPiWsAsuCWV4
	tKPfgbquc5p53yQlZNRgXxownRXIvfnZD08IR+tNkVvZZ7m/tA1MID11sBZpv
X-Received: by 2002:a05:7301:5795:b0:2ae:565e:719 with SMTP id 5a478bee46e88-2b486b7294cmr6098602eec.4.1768459761751;
        Wed, 14 Jan 2026 22:49:21 -0800 (PST)
X-Received: by 2002:a05:7301:5795:b0:2ae:565e:719 with SMTP id 5a478bee46e88-2b486b7294cmr6098579eec.4.1768459761230;
        Wed, 14 Jan 2026 22:49:21 -0800 (PST)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b480dea94fsm3259143eec.24.2026.01.14.22.49.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 22:49:20 -0800 (PST)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Wed, 14 Jan 2026 22:49:08 -0800
Subject: [PATCH v3 06/10] arm64: dts: qcom: kaanapali-mtp: Enable ADSP and
 CDSP
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260114-knp-dts-misc-v3-6-a6cc9e45de93@oss.qualcomm.com>
References: <20260114-knp-dts-misc-v3-0-a6cc9e45de93@oss.qualcomm.com>
In-Reply-To: <20260114-knp-dts-misc-v3-0-a6cc9e45de93@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        20260114-knp-remoteproc-v4-0-fcf0b04d01af@oss.qualcomm.com
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768459754; l=887;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=5DnXk2S52sWEVtNJ/ttHYGdMW9L6THeQWIL1S1NCvgM=;
 b=RP41dZIPtI1R2J9rWmyKyAmXl226G3UAF/S19R24SjFYOmQgsqv7PCFruAo/OSgN94iHYknJq
 /Kg99I2vnRDCa1SMRBeygaIv2VboJ0cCEfHPcMAxmZQsCpCCkgmpzaR
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Authority-Analysis: v=2.4 cv=NvncssdJ c=1 sm=1 tr=0 ts=69688df2 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=6pSOtZClNuHiBGgWezYA:9
 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: DmUEUKGR_7rogr6zn7WS2gQ1HWveUUU4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDA0MiBTYWx0ZWRfXweXIyX/G2Q4l
 CBj+BFSkWL1OyktXy/xOUVRbT71EhsQ+30GKvyfih7NPi72ykyBeQx5C1HQB6ABG2CZXO3BVaJc
 BM/6CEL3PrTNjev0P/C8Cprd+6BuCeFNXwG9Eh8BRkqAXX2vqEJ4Pr0tFmOlpGeDjSbMePzHLnp
 iEhmA01JRNMdkQj3vUQy5It5iJJmwNJGEhByqaHJb/hmt6qrv1BUdd/xU36uo9hiNiLgE+Y+amT
 8OM4pob+TDTKImtKsHacuYT2G2vrdlZddx5caV7vVv2/B7NogvWotLr3F3en4kUkMVCRGr452gS
 M6GCsPEsEV46W2S6LMGiIBrmGZ2xelLT4HZOy0j11LjmOkj4GjmehvyYOayyUGNmOLFsKb61+W8
 ivLWlrjDHW1rJHdrNLCIcGj05N4omTeyDfTvJ6odo6IJWq0DPTPCtQjmdGan1Sbgb9M5dPkwftn
 HLn52KsV6taHzgORSwg==
X-Proofpoint-GUID: DmUEUKGR_7rogr6zn7WS2gQ1HWveUUU4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_02,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601150042

Enable ADSP and CDSP on Kaanapali MTP board.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali-mtp.dts | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
index 32a082598434..3544f744fd1d 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
@@ -684,6 +684,20 @@ &pcie_port0 {
 	reset-gpios = <&tlmm 102 GPIO_ACTIVE_LOW>;
 };
 
+&remoteproc_adsp {
+	firmware-name = "qcom/kaanapali/adsp.mbn",
+			"qcom/kaanapali/adsp_dtb.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_cdsp {
+	firmware-name = "qcom/kaanapali/cdsp.mbn",
+			"qcom/kaanapali/cdsp_dtb.mbn";
+
+	status = "okay";
+};
+
 &sdhc_2 {
 	cd-gpios = <&tlmm 55 GPIO_ACTIVE_LOW>;
 

-- 
2.25.1


