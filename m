Return-Path: <linux-arm-msm+bounces-87716-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 17E50CF92C2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 06 Jan 2026 16:52:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 16FD03026A87
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Jan 2026 15:51:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBAE53451B0;
	Tue,  6 Jan 2026 15:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ePgiS/tZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ObIFVDXE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26A7E3446C2
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Jan 2026 15:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767714166; cv=none; b=j2ltNNBhuhrds51+ePCkK7xzCsFa0BBz31HgoG66CGKx+FhbCEduT4DkSoYqlpeAi601jPDp/GkUcHWF+bMUFANJBYTL++v4Wg8inSmY17mcpeTUNItByd52j45HuShmcXS2xHJ+H3Njqp5eCN6RayXDH8wcyihH8pSFmYMQwJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767714166; c=relaxed/simple;
	bh=3LB0cITSfH4Noq7m1s58c2osN7yIye+Lx3PTEFp67co=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SvaW1SN5VuOV47/yoQVUor2YZsx1YemO8tfdS6Q4Vxs1AVh820FsTLGdMCBPiJyo/2C9S9w4TlTbgCmrRok9SqwSQseySIm712J7wwFTgnqXxZfuJHQQFqbPsCaLdbI/ZrPsLWgt7O84gHlaM9+FpeUQXnH1MsxKqRxu4lj7KPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ePgiS/tZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ObIFVDXE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 606AU9Q63052743
	for <linux-arm-msm@vger.kernel.org>; Tue, 6 Jan 2026 15:42:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Mty9CPP7Jsu
	pHUVUgRA6WjTGLkSoSb22qlCPdm1xAOg=; b=ePgiS/tZBFbikeLjSU9HogSMWFk
	XlDRXeV1rtYk3U+ALiJtQPVKfC0Zc9yeNzS5ImKK3/s3mSFA27O7MceSlbbFvJsS
	sk/CvnISTKzDfOREzOgN8CA3OoFSVkCcYCE1nGl1BIxkHgHFCtFXwVSDcaqchprt
	bM9xJAkp22LNu2Q3B669WD6SC/7dyPD2tDk/yyeSa5h9LapK613dT2anMFgaXB1B
	Wlu7XTF0gpJL6vcuhM6K1yhKqEM9QvjsFRi1QLMk4npZ+Hsv0rC2j97CFUbqKiIC
	Z/9xUgVc55VzVYMExb8aNLzX707+6uUJvBBnFJ0kI14Y6JqpagTSKpYN80Q==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgpn9thtf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jan 2026 15:42:40 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2a351686c17so23371685ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jan 2026 07:42:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767714160; x=1768318960; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mty9CPP7JsupHUVUgRA6WjTGLkSoSb22qlCPdm1xAOg=;
        b=ObIFVDXE5WotAMVJ9dTW+rtkjRZSpMwo6C8vknKWlHYV8Q24cKXlbFt+x5gndseMbo
         JXDl5esnhv6kJbg74kguaTaqVZJQXXR16yxZ0wEkbi2V4VA21VEMglgu7UWJPNHUT8Xs
         ZBEYRDUNFJP8CpaSuCG71LJKn+vKMech5njisp2Ub7gE6py63VGpUcCnyILE6SGOoEk2
         /cAIQHMV21iGlbeTi6yKtO5CzqEf2Hb117TTSErADHLvUWrKkBfdKD67KT1yMbPhAsYs
         2sP/T8JVMHl8ijYvcrtVHpKmIi6uWzdFwuGsgUf6rx76ZAyczYxGkRZQ600x/yJlKTrs
         B1QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767714160; x=1768318960;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Mty9CPP7JsupHUVUgRA6WjTGLkSoSb22qlCPdm1xAOg=;
        b=BR7caQNJdOQxpl4MuM2JgFAKqlWfd7aXTOsv1Qo2Jko2nxRo2IUIyqATQjazOLywUE
         zh9Wznl9ymvlgxqNgX7Rw28iEVMnxlhJhe4iNyopA3f2hn5TPBpBep52itvgDjyF85ka
         ma+LA0iknr2oOUSazl30CXybAhtXsWt3NX+vatNZqwMWZmObJ2KsBdD0io/HTiZZr0dy
         21BLZDuAHlYpEhBzp5K05nwFzprmPrtHHKoTfHpYDJVdAPFN0F7Tx38uHUSrtCN6PTe6
         FXmTRRQdypJUdfkjtUC3Z9/41gFiBWYfEf4ciC77+xriAC4XbG/ZS5XNiff7YCSG9Jzq
         9yBQ==
X-Gm-Message-State: AOJu0Ywh1QAMlgqr/UNHTBIBMfVW7GoiPxx9Hgu+KlBSMt0AWC7gh7el
	UouyJlxurO03DVMgZ7AzIiK4FQvLOqIhSE2xexCShILHVen2nUO2n8xY97MLJDmUc9KnMwPzTdR
	gpuCTTqBVZ1vVf0rUa8LV2g9CDKaKWWsdNkzI1NsnrUFuE2TzwFUV+4jvIpguCuaZEK27
X-Gm-Gg: AY/fxX74anlSIljafHUPj2Nqgs3BQiNGtJWWdP5x48vUEBc1Ff68x8DPs1REhnzKbEf
	lSs9vPGBixQyNV5JEU5C75oXb1iQP7/htCa/a8D7L2xj8yybI/+HjUWwQ8vySNXOm2KiCYRiUPK
	HhziLcv2RlVTvGPRxOtZugrNKlrGX+aAgyKRGIwRyKehVZllGa+8rFj23HzdEJpmjzN+TCeaL3I
	h2GsfXUaND6gulSZf4cHVd8wo7YaktfmtOkUgtSnGJGwiU/M27Ai/Df6rIFfg+tpGVXRT/YoG5M
	Mo77+tVmYCJfBeiCyrcNO5KShW77ZJ0VVmGwM9Udw02VUzHdCnaI6H8jHzskSQ5hH7v2Q8/y53p
	WmDyQSO5H797zOMgSo49rwYkCxGpuunRmShc8j0lI7kHiCRmTR0dC
X-Received: by 2002:a17:902:c40f:b0:2a0:c5b6:67de with SMTP id d9443c01a7336-2a3e2e1e671mr35426855ad.52.1767714159728;
        Tue, 06 Jan 2026 07:42:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG667pmkGDth+EgwS5JLYw269C1+n+LtMnapVQaOfdQaxrvpwZx4BYdJ10YbUoQ+a3wnQQjaA==
X-Received: by 2002:a17:902:c40f:b0:2a0:c5b6:67de with SMTP id d9443c01a7336-2a3e2e1e671mr35426545ad.52.1767714159218;
        Tue, 06 Jan 2026 07:42:39 -0800 (PST)
Received: from hu-pragalla-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cd492esm26606395ad.98.2026.01.06.07.42.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 07:42:38 -0800 (PST)
From: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
To: vkoul@kernel.org, neil.armstrong@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, martin.petersen@oracle.com,
        andersson@kernel.org, konradybcio@kernel.org,
        taniya.das@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com,
        manivannan.sadhasivam@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, nitin.rawat@oss.qualcomm.com,
        Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH V4 4/4] arm64: dts: qcom: hamoa-iot-evk: Enable UFS
Date: Tue,  6 Jan 2026 21:12:07 +0530
Message-Id: <20260106154207.1871487-5-pradeep.pragallapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260106154207.1871487-1-pradeep.pragallapati@oss.qualcomm.com>
References: <20260106154207.1871487-1-pradeep.pragallapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 8aHEtarIaPRn-p1hctuR2SYCW9d4-2W_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDEzNiBTYWx0ZWRfX1P8fI7rbiGBm
 cZLyj8+Ub4O5d6JlVM8CwKVDPZRgmSZMs2gdu98aqdYjLiaLg4b8G4ds7mme0JOFcczngpgsyRp
 /TuvkmNBf6Lsr51IsELhHnbFP7BrYe6YUNhPF7YefcAdbyG3aKkZrg/ezNXEN1BL5GEeNdWgwz/
 W8LXcSe/jI5GfbtK8nmPtrP067YXGQK3+dcQex5rzwlQ5vsPV4ItVQQp9ym2C1zZMnrnM4TQgDZ
 V3k0pUjJVBEf9DWgyC484N64Rdgf6wnAw2Cqblxab1LeTnTp8eDLw1/Whge7dmRtppyAVv/gdvf
 BEMjjGe6iCZh9yC4tYJIArPZzhRjZVvttCyEynKgRDNe+lZH8X/S/6Ws1wmo1VM7e2y2F8Gwm+2
 5ruNTginig+Zwr5dhp6r3p26GF/vsFZJTYW39I22ZTcMq7eWgM3mm7nM9XtUHZ1977ibhPwNiHE
 2CwhabSEk77q1I6Y4JA==
X-Proofpoint-GUID: 8aHEtarIaPRn-p1hctuR2SYCW9d4-2W_
X-Authority-Analysis: v=2.4 cv=KfnfcAYD c=1 sm=1 tr=0 ts=695d2d70 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=cMKPt8sKVRzp0kMMbBYA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_01,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 spamscore=0 adultscore=0
 suspectscore=0 malwarescore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060136

Enable UFS for HAMOA-IOT-EVK board.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
index 88e3e7bed998..23cd913b05f5 100644
--- a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
+++ b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
@@ -1253,6 +1253,24 @@ &uart21 {
 	status = "okay";
 };
 
+&ufs_mem_phy {
+	vdda-phy-supply = <&vreg_l3i_0p8>;
+	vdda-pll-supply = <&vreg_l3e_1p2>;
+
+	status = "okay";
+};
+
+&ufs_mem_hc {
+	reset-gpios = <&tlmm 238 GPIO_ACTIVE_LOW>;
+
+	vcc-supply = <&vreg_l17b_2p5>;
+	vcc-max-microamp = <1300000>;
+	vccq-supply = <&vreg_l2i_1p2>;
+	vccq-max-microamp = <1200000>;
+
+	status = "okay";
+};
+
 &usb_1_ss0_dwc3_hs {
 	remote-endpoint = <&pmic_glink_ss0_hs_in>;
 };
-- 
2.34.1


