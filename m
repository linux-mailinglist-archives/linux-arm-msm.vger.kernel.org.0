Return-Path: <linux-arm-msm+bounces-77373-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 05E00BDE17E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 12:53:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B1C414812AF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 10:53:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBF40319615;
	Wed, 15 Oct 2025 10:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jUcA2ciG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 577C731D371
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 10:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760525589; cv=none; b=Qu1RyIV7HFjrMbhYsgG3K0zAL/n+ReH+ASgpcDybj9spkdMlTqei3DmkA3gfwBndSxddYxBq9OotgrCGM3O6SL9MIRbhAksggyHwCoKuewB81rizcej+cVgLKmEHw2qNFCU8+suvEdBXjxQRlQodxVk86nJCEqw26R54y2IjDmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760525589; c=relaxed/simple;
	bh=FiZWKtwOY9Jr5BZSeyKiibtBbBMRoJPxKcH+WMAHIwA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Bmc7EbrbLdao8E6GAoYMTuD7OWwrG2moJiD0Q8xkqXdEXujhdXnBGB4XqyGU03aB32u6/haV+9jkcOTRYXHdDh/aP9DOx2PyJxde3yVEM8B/tmepCngpRwFfdmZUPaWllxsLuKWVcoCjilgfMi/hnK/tqWGACKucPR9E7ubHqcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jUcA2ciG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59F2s6Gq004284
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 10:53:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=mrkw9gI6cWU
	Jhtm17vDeWcRDNXPNLRYq7s1YQ5mZw3I=; b=jUcA2ciGot8kohRGVeJIsTFDwIM
	5oefWSEdpA1jv+ErOtzGc48ubsd9AqWlM1G+CnM/NaE/z3PpKYjOAak49u9VsljX
	wIUOz5qDaJeUO3yo5gP5ZvE1HXtbHkjBWhGZodi6axQEucHcIUzsSZCDcI43prnx
	YNO8HbYaiXaTU5eK4RuEiJwWd0juY+FIuuhpmlsHXQL/ub7pfWWFeEg3ZkT8sEMJ
	YAlT7bJAf15uhQJBio1qMfEMm19KAG1nqY+IXMZqX+iyeXmfCYaihlqRMHgVa9Vq
	C8ue8+8YKvsdEVdwOQsEivsUrItEO9RqEXTnSZuayFCfMn2bLEDeqVnq15w==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49rw1agdsc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 10:53:07 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-277f0ea6fc6so224480085ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 03:53:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760525587; x=1761130387;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mrkw9gI6cWUJhtm17vDeWcRDNXPNLRYq7s1YQ5mZw3I=;
        b=QT4njWxW4IympB8oUPgfdyu5Kdlhm/rhrZ3EVfgAGfH2W/Ac4HhbIf9GCG7sRlc2Zj
         C5BXROqBZnNbmGmDdNaj2uBaZ429XiiFNeknaqRQ/PkjWbtVnPj49hKjAAn+B74CCQCV
         VLIcG5+eIJkKAXDGwLVV4xnG+Art96mR+gChWcHMz9nIBwBLeqpWa1ZrhMOWcWLUCNoa
         VTJzmuZ2EaFHq/jKLiq4iEHo0zRPp170qCiZVBI/zv5bu6QBnndhQONv5f3Fg31HLZBJ
         BvKqAxBq0b/gQQIsQijP5mp8QJyZvFOoxXDYGuGmYrr6fvLwBYimDn1EYrKzm31JGuBS
         dJXw==
X-Gm-Message-State: AOJu0YyIqR/JKPVG0S4Ba7x33JxrfbSOaB3Ggd8mzBeSVvzONapHhNSt
	1M+w6/5uk5/rVebJ/C4AL8+sgjlboXIs42Y/hMMdHBPTvuSZeJq1esvM6v5ypKrlBGpnC7bcp0G
	3XFbtz09pFiYFLy6o+GP/hD5E2KGxAqSA81Y5SnIwyAvwobzPkOsH0ohKM5La46Xli/5a
X-Gm-Gg: ASbGncuriTlLdLGF5BPWhTMprRwAeubVmxIiRMKd+kughNcIIMiGCKNYLufI/YVRFa9
	WZMAtZ+Q76izYinycVXuZJUXjshcNCgyzR5zIZZWb5pTWWzXIDbUG5LeIDAKxwf6b5gCUgtu6Uo
	4i7G+vb8yJqtzyYcyISkV2YiUEUpBZXtkpUIn5bu1T0zHBCbzX8u9oDnnpDukT/BDCSPZ5OFgfb
	RgPpQQ/vzlU0XrmxCvPUTbOZZeYFu3xqC58ojddBJ7Mrjhp6EvHLQ8L1N5E82EOzCCdQXPZBFmd
	syYJw3VAdv25+3mRyMk3Z94QrP9KH7gJqffkRRjHSyjNv2vxd3BIk8OdZkSIX/GWH5AX535ypQ0
	s6g==
X-Received: by 2002:a17:903:910:b0:258:9d26:1860 with SMTP id d9443c01a7336-290273ffeb7mr386954115ad.40.1760525586799;
        Wed, 15 Oct 2025 03:53:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGR8xjz/k5XFLLDdMqPKDjnU+itUdO0fqH6mjDSaolwg56TKlZ6p9EGiaz6+5/FZwrM0jZ0zw==
X-Received: by 2002:a17:903:910:b0:258:9d26:1860 with SMTP id d9443c01a7336-290273ffeb7mr386953665ad.40.1760525586281;
        Wed, 15 Oct 2025 03:53:06 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034e20f8csm193698385ad.49.2025.10.15.03.53.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 03:53:05 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Arnd Bergmann <arnd@arndb.de>, Nishanth Menon <nm@ti.com>,
        Eric Biggers <ebiggers@kernel.org>, nfraprado@collabora.com,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Wesley Cheng <quic_wcheng@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Melody Olvera <melody.olvera@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH v7 3/4] arm64: dts: qcom: sm8750: Add USB support for SM8750 QRD platform
Date: Wed, 15 Oct 2025 16:22:30 +0530
Message-Id: <20251015105231.2819727-4-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251015105231.2819727-1-krishna.kurapati@oss.qualcomm.com>
References: <20251015105231.2819727-1-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=K88v3iWI c=1 sm=1 tr=0 ts=68ef7d13 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=EoOMd-xwxZjzz6zYUw0A:9 a=uG9DUKGECoFWVXl0Dc02:22
 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: N5ekCmVA8mghOIhKOprXoTjysDy9wEZ_
X-Proofpoint-ORIG-GUID: N5ekCmVA8mghOIhKOprXoTjysDy9wEZ_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEzMDAzNSBTYWx0ZWRfX1jLC42i3YMUr
 6rr2LKx2pM46wMO+/ewVuK7DfYLebLxIbJwEAuUx6FVnIWPNSkNW9CVd2oZj9Rp19ZppB/tYIfo
 F+91YSR2kbk3HzhUACve8jWQOoo7a2cwoVhlETT7X/auj9DkfoIb8uRnvoas5RG/+cw9YjVjTit
 nkhWVLmMji7y+beE5jJkWBKUpPJ7ZVR5Zy1lZ5WMGx/oNcjo0hSSfGwrQPhr8CwrYSjg5+uKX/j
 pr1hM1UUtRKBwtZ21USwJlsWJ/njHGcsv9gQ7kN9DxFJJUShhOEVsLj5fK42jyzvoNx3XAbA9U8
 DIauzcChy4cM7dA1fFygaTpaMgJmulzmUK0+N8E/sFYIgcL+7OX28WjtxPcDkWYaBPAujsldwXk
 1vNB4pBOXwL7AKTZCgVxdNmLRiAhAA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_04,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 adultscore=0 clxscore=1015 bulkscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510130035

From: Wesley Cheng <quic_wcheng@quicinc.com>

Enable USB support on SM8750 QRD variant.  The current definition
will start the USB controller in peripheral mode by default until
dependencies are added, such as USB role detection.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Tested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
Signed-off-by: Melody Olvera <melody.olvera@oss.qualcomm.com>
Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750-qrd.dts | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750-qrd.dts b/arch/arm64/boot/dts/qcom/sm8750-qrd.dts
index 13c7b9664c89..1949b28c90d0 100644
--- a/arch/arm64/boot/dts/qcom/sm8750-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm8750-qrd.dts
@@ -1037,6 +1037,30 @@ &uart7 {
 	status = "okay";
 };
 
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
+
 &ufs_mem_phy {
 	vdda-phy-supply = <&vreg_l1j_0p91>;
 	vdda-pll-supply = <&vreg_l3g_1p2>;
-- 
2.34.1


