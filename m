Return-Path: <linux-arm-msm+bounces-59630-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B5F6AC5BF4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 23:06:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AA42B1887201
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 21:07:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C3E4219317;
	Tue, 27 May 2025 21:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XXLFu+zJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7B35218ACC
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 21:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748379910; cv=none; b=SFfPGy09NpYndt+gqx1IuyulM0FxLG0hTL4KLg7Ysf0GHGu8hZU+76z/huMpQvsMbCkg1Na9gQo0TBFbn7LYiD354/IwgkLCKu2kzyRbjCiCW32PWkajRFk2If4xGD1OYNkr/pIPjfiwFM2YUtr/RoC+5qiZZsIFXBoG8flI5O0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748379910; c=relaxed/simple;
	bh=SzHbHz5W+oX3YfTw8d3BpgFZXwsUINC/XLP2fP7cIaQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fpfspYeykffruPuKjMwCHHshrpmN0AH3ewwFw73hC4CqnYs3CBZJGTi6vodCbMyN9mlurz6RXXFlvpIjThSgdFdgyxWSNybZuFOdhQsznVSOMQvgj1TTSHpdOgQSv2EdgM561MZ9jLijvif3cK76hMH26HR1oh8I9XLC2DcEJpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XXLFu+zJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54RCntOj026623
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 21:05:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	teg98KnCXRHpbibmB3t0iTGw5Sr71vWVJCSu3Gc6TZo=; b=XXLFu+zJIXzaJOnH
	6MmY7OJEfvk+vqpjXwDNKNhnTFbtvufAnTxh0w43zpikEqqTLCYhUKVa5MY8XzVA
	XBJAD1aHs+NBai6fjOp52Bx1RzbDkUatBByTbzuPgJPwfMLFpVgb3Sg+OBnHvkA/
	oidME/ep06EwgmBqQCMHpldraWVqtH46MEqXGm/cDll02vDhM9tqtRNubME16HPs
	eXvwB16TAaTZTGAow/4+PY82BOZt+CAxfoeQ3g4lgi0gGrlOs+YoQG+zookZh7Qs
	0rEtKo694lDbsfnxz3eDjrRTZBJxvSeklAkL6fncQHDV5vP9IV+ZEF3QLKGRcvSq
	kKqKaA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u5ek0675-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 21:05:07 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7375e2642b4so2797363b3a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 14:05:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748379906; x=1748984706;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=teg98KnCXRHpbibmB3t0iTGw5Sr71vWVJCSu3Gc6TZo=;
        b=JdLiZUK51itJCWeCkbPu8FPO62X3E6lTmzt3JtMiUt6mRWAWzjbavprFN0bFBN+rup
         tzOQ8Qm42DfVYN6s34auhBpVPq0RBmqBT3fH07RoD9pphnoOziQvxvlo7LVLjAJL1eYe
         QKGmQBg8Jiar3guOEtXlW9/lKETlvYQ60l6R+nKuI8wXfhA3xbKkN0kAzjoKpxvXwENV
         vCgPJTyqq7Gfg4Gn89bZ7LTfe6rWBdhdVt2stx5kepgfpjbHqyVgfnk3s7rKGG/u4lJ3
         NlYgLE9jIVS7pp4C5SEguyndC7uDuZiuUEGXaJ/+jiGlU2c6E1aFhD76g1f/q23Q8fXH
         taHA==
X-Gm-Message-State: AOJu0Yxm192ATiuFx9+O63YUcNZWgLsfI0ZfdeYxVrskI9qdQAn/xqpL
	6e7T+t/dapu7Mww6LBMJWT6Jh71+WCZF0s8mkf9TlJFeyDu/dWwwr7cuEkwFtLXklEYqe+pZUoe
	zY4pWRegSLw0qho6FApefA2SWHXS6U8TV1muK6YuLlkb2vI099AhBKucYRxIorbAJQWzOSCHwG0
	Tp
X-Gm-Gg: ASbGncso15F3rTU9lXxW0TztYiDoybN+qXXDYo7kssUYsBPrzaeIjFKu3k7Y1LupbbE
	QD7/GL8uS+XAqjLwQ3j2yke4VfIJ8waJqTywYcrQ88lnBOAqVCXALlbM/CGOpNcCWpuScsqz2HE
	RiX5sm4LeAD2aleecnEF/7gXeSdFyn7Hc2Nwu6pJTGVfqPoMKOldI2TM9JnEwhn1d1yY+QEzsE9
	R2mDVD+wpIQIeI5fpFNULAyJKAkdR+cluYl31QZ1lzMXvjl4RzeASbX/ojrP5cqc9wPdIZokXlv
	D0Fn19M23uqFWFjYjHVCdalLcxusao5oBiR/yTfax6jQxIo4/OM1NGk2BLB0i5CitnU=
X-Received: by 2002:a05:6300:210d:b0:203:c461:dd36 with SMTP id adf61e73a8af0-2188c20df49mr23718631637.6.1748379906519;
        Tue, 27 May 2025 14:05:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFurMh4Ktwpp0qvzyqJkXxlrwd4QWROOgS0twx82tbgVIupB84blzpNgeeLHqbI8CEKvbsTDA==
X-Received: by 2002:a05:6300:210d:b0:203:c461:dd36 with SMTP id adf61e73a8af0-2188c20df49mr23718567637.6.1748379906065;
        Tue, 27 May 2025 14:05:06 -0700 (PDT)
Received: from hu-molvera-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7465e64836fsm29167b3a.26.2025.05.27.14.05.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 14:05:05 -0700 (PDT)
From: Melody Olvera <melody.olvera@oss.qualcomm.com>
Date: Tue, 27 May 2025 14:04:44 -0700
Subject: [PATCH v6 08/10] arm64: dts: qcom: sm8750: Add USB support for
 SM8750 MTP platform
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250527-sm8750_usb_master-v6-8-d58de3b41d34@oss.qualcomm.com>
References: <20250527-sm8750_usb_master-v6-0-d58de3b41d34@oss.qualcomm.com>
In-Reply-To: <20250527-sm8750_usb_master-v6-0-d58de3b41d34@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Melody Olvera <melody.olvera@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748379891; l=1355;
 i=melody.olvera@oss.qualcomm.com; s=20241204; h=from:subject:message-id;
 bh=Nx4I/ZG5m1Kxa6LCnqamndwPnsXvis3d+v65oICH37M=;
 b=Hp/G/DtacnwV0EhGyfZOVZRkpEebZE/+1C8caI/kuGc9Mek4iJ/VNGTuOQB6QRMqQZR9IOssZ
 3IGYp9vp5sFCd3IY2cf3mgW1K0ADTPQeQ0gcHgh7c9fof70ePb4DYOm
X-Developer-Key: i=melody.olvera@oss.qualcomm.com; a=ed25519;
 pk=1DGLp3zVYsHAWipMaNZZTHR321e8xK52C9vuAoeca5c=
X-Authority-Analysis: v=2.4 cv=GIgIEvNK c=1 sm=1 tr=0 ts=68362903 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=Tsvuh88POXG944tnl6EA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 0OhyciHEYRQJg4fqONLK_6Oty3cMA3H7
X-Proofpoint-GUID: 0OhyciHEYRQJg4fqONLK_6Oty3cMA3H7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI3MDE3OCBTYWx0ZWRfX6aIb8yGc9HTa
 qSceE6CU4Zg7sXf052VQihOjs1OfiNuZRCWFfczHJLyQ2iFlRG9p17hdgh8nK7/PhLe71Gst4rJ
 CwfEY2ToaAV2221Jd/4V7DQTRTJ+1jyV0/bjEW3RQAIfTDkF9y2jAqa18+5sm8lUdBgcAsXXijR
 j+2xYr0gIEgimMS9I7OAl2plKwIE81niTk15AJwhSPGTSdinX4zptpGOOcd/zb/DQO93DEVdFh5
 nNTKCotJn+v+z3hS84VlIxr8eLS1GtzYbuY+i6iGQVdlPZU1R8JxOIvnKY8hD/E9AHnVn/5NTEz
 oBL/aSV3m+gZlz3QTrtqS0vJNoOjsc1k1kTiQm+oj65gpTtfI5DblDAd0Q7pCF3stqSVRi30i3F
 fteOi7MoJIPSemzP5l3emOfcJKjNfy9haeqNPGVncv2IhalQTf2LfOU5b3TzcDw+anUbfb85
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_10,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 priorityscore=1501 mlxscore=0 phishscore=0 spamscore=0
 suspectscore=0 mlxlogscore=821 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505270178

From: Wesley Cheng <quic_wcheng@quicinc.com>

Enable USB support on SM8750 MTP variants.  The current definition will
start the USB controller in peripheral mode by default until
dependencies are added, such as USB role detection.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
Signed-off-by: Melody Olvera <melody.olvera@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750-mtp.dts | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
index 72f081a890dfe49bfbee5e91b9e51da53b9d8baf..d28e45111b8d01c2753493a7a4ee248bbb334aa8 100644
--- a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
@@ -814,3 +814,27 @@ &tlmm {
 &uart7 {
 	status = "okay";
 };
+
+&usb_1 {
+	status = "okay";
+};
+
+&usb_1_dwc3 {
+	dr_mode = "peripheral";
+};
+
+&usb_1_hsphy {
+	vdd-supply = <&vreg_l2d_0p88>;
+	vdda12-supply = <&vreg_l3g_1p2>;
+
+	phys = <&pmih0108_eusb2_repeater>;
+
+	status = "okay";
+};
+
+&usb_dp_qmpphy {
+	vdda-phy-supply = <&vreg_l3g_1p2>;
+	vdda-pll-supply = <&vreg_l2d_0p88>;
+
+	status = "okay";
+};

-- 
2.48.1


