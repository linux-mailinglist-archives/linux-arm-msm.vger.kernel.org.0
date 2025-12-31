Return-Path: <linux-arm-msm+bounces-87091-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A922CEBC88
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Dec 2025 11:23:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6076830463A2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Dec 2025 10:21:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D41A631AAA7;
	Wed, 31 Dec 2025 10:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gJMz9/Kx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cDQpU87U"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 531DA31B836
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 10:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767176477; cv=none; b=akO/Gv1K8zgIw1b1fd/uLGoIcRAkEzVyrHxEDw0UqkXNXeUo5MuHwy0ybrtzKP+5QXiJbGBcp0XMWNQ4v7BOSc/CGvZV3TspUVV6y+9sGlwTR6eB81tAgw14XAY8Ti1z5ReoyRZ931NvDUifx2FnIysYlx6uUs8+SofM/6gcZJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767176477; c=relaxed/simple;
	bh=jJ6O5KkP658Kzoen1OLLHGHGjbrUHLY0oOPUXGr5BJk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UEks4OHdy3O2JdV/sDvJcmE0hwmvi0mD2Fqo5iF+lRGm0HaDjp2qIxPKZDJEfZoZT/kF6GkGrH/N+2daGQED0vSEtUtANZIlLA0kUi5IXvdweaHoPWfOy5Uv7wpe2GbRTAYFj7cp+Z9nVz4QK9LSBURXZiV6zgipSIhkgx+L69g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gJMz9/Kx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cDQpU87U; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BV01eF82723214
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 10:21:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=nzPReENl5jq
	P24RO4wk7cW8ZGHbcPiBK7hn8rIfW3pc=; b=gJMz9/Kx28vsyy5jyipqEuoI3ru
	eNTFhuImHSb/mV/yQoxTRXxGyS6g18f5u6TyOCH6c6m0VdFl5UyawL3BESdOqy/p
	kp1/K/lCV5+A4oUN/eEJcp+dMmWd6I83RnjZRkFEg75CRSXYOECFGOTgMolvEqgx
	FriUwsTaVW3b9YFmkkfCQfAyN8t6QsvlkmynlPxnyS/NR601vLXGwpvOWI969ZD/
	Fhqxi6WOlYGGcLirzIQQ3zMIWXVAmxm3KU6zIrihLHQcfGwyTWz6Xu3/e1uX5lzF
	DQ9O40LUfowITMQ41rq82/jO/LBFnOAJ5JZLu5ROM8djaG+cgR02JefPOcw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bc0vdm48d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 10:21:15 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-34c21341f56so31671981a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 02:21:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767176474; x=1767781274; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nzPReENl5jqP24RO4wk7cW8ZGHbcPiBK7hn8rIfW3pc=;
        b=cDQpU87UeLLYIA0Msp0qHtXugxjzcUIKvLUUw6+L3tcPI59tWTcp5DG0u5EqiW80Ai
         i2+wBDX5BvkPDKI9vZCx3kk6UUOn+J7OiEBGfPxbWXOaO/V/NgVWs9kBPWNh6QdunQEW
         BXbNNA16Mq1d/LUls6F+T7w5LiqRWbBDFcnhbzxpykHpMOag2UC4b2vihartiv0wDffu
         8oMOwJt7V4XmZa4aHV04lfltYjJ8s+HJyVm7RxI4cQtVPDsKMxgDXm7kJwsOnQY1Zcln
         fEBpaGXUqzhkTJsDNeiEDs11gj8MlBknLXCND+TXT9TyxsJVo5az4dJ2N9lnLKUigHhZ
         liDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767176474; x=1767781274;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nzPReENl5jqP24RO4wk7cW8ZGHbcPiBK7hn8rIfW3pc=;
        b=VkLOA4PRPltXu2bO465CWnvOC3hDjMO7qO50rw1jnLz9QocH2uzUyXOPVtx8wajYba
         vtqAtbbqMtDWs90Z67HjVdYjSeFPgDgk4t2a9KJIx/s1dkCGjmelVoqmOUSH0xMZoDD5
         yhx8/94EVvk/8UlRtBLuZeDfoBH3HpJfw7Cw4nHDtiWkIb5IeZ6zmvi3VcfrJsH7TE/C
         tatoXJVJJMItXwjgXO3STWwE1zHd9TQYqofgITYeTS7fqFiPF7ybBfx4mxkVgMYckBVA
         nHhp7Y0UhrL3z3hHotMDE79Q6UKedbm4WdOK2URG0FFsmxWcfkhDh+nYkwUFGbK/Idlb
         G7nA==
X-Gm-Message-State: AOJu0Ywu4ftR8bH7hV7nqsSMbh12RTVgqahhH77GRPGpVMG/IDBM26Ky
	vxntoayWzh/gIV2XdPhaDgzbfOPwfYZIts+ssa/jT8i/fmzHy3S2CpQCnpeX5ipq0kUE9GM6nLh
	W+Cz+F/xJWeduQT/kyuXJdh+HOyMhwFDVhzTuWole3UAsoNSYex46Zx0UgYy4iC6X7EnX
X-Gm-Gg: AY/fxX7BkvukKIomuG6byFrfe6j+6pKbfDIyByL0yYhNaCDjmxsx0XG9TcLvGF1J6ik
	3PxZtdrZZcVlDNT8FdkBhKSV0co6uWku+e/Ve4YN4r7XMgJIgdBnXKhf55vQUfPSCqlaaz1q2PD
	0rVNOHC46a02QYxa82V+d8VuQ0Y4CHa8GApudeY8sRGikUiET28Hmu2wESTTmezaWEVVqGRd53k
	TPlGftLFjAVbhgZRn2pqbIjWkE3BFSh9oW6j9Bioy2+cobZ0FdUTtgj5aUJrrTKw+rNvTXlxPhq
	28tQDfksT7jPzB7762Vkg7JnI6ar17RCBXJPHFJW0BkeZEY60OF+1sfBWrlfNLPSotmNFdcKHuQ
	Wc4EwneyrvYcfnel2gPUPY42KlfP5ERbdgkvOckAQBjSj4u8DK/um
X-Received: by 2002:a05:6a20:258b:b0:366:14b0:1a3e with SMTP id adf61e73a8af0-376ab6cf789mr30573501637.76.1767176474041;
        Wed, 31 Dec 2025 02:21:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFy2a0ud3renotrFDPVYfZzPw7C12wYHHNp4u5pkRVwHNh2m7YvZ22IXQudwiY9TrqklLPVXw==
X-Received: by 2002:a05:6a20:258b:b0:366:14b0:1a3e with SMTP id adf61e73a8af0-376ab6cf789mr30573474637.76.1767176473559;
        Wed, 31 Dec 2025 02:21:13 -0800 (PST)
Received: from hu-pragalla-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34e9223ae29sm32163920a91.16.2025.12.31.02.21.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Dec 2025 02:21:13 -0800 (PST)
From: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
To: vkoul@kernel.org, neil.armstrong@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, martin.petersen@oracle.com,
        andersson@kernel.org, konradybcio@kernel.org,
        taniya.das@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com,
        manivannan.sadhasivam@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, nitin.rawat@oss.qualcomm.com,
        Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
Subject: [PATCH V2 4/4] arm64: dts: qcom: hamoa-iot-evk: Enable UFS
Date: Wed, 31 Dec 2025 15:49:51 +0530
Message-Id: <20251231101951.1026163-5-pradeep.pragallapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251231101951.1026163-1-pradeep.pragallapati@oss.qualcomm.com>
References: <20251231101951.1026163-1-pradeep.pragallapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=dfONHHXe c=1 sm=1 tr=0 ts=6954f91b cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=FwCcbryfLnLJMkbT1zkA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMxMDA5MCBTYWx0ZWRfX3HxddI+V1TmJ
 5GcfHY7G5soGq5Bz+iZz29K+vbTjgeaJHgRdQdxzuYO+OVUh0O//oq2tbweVGjytuOkD4wcW9le
 SZ8VoNhg/NDrEU726RaGgbkc0eKm9L6j93NXjtAZo8X+7NkHxwgZkxJv4HgHAyIn/bT+Gn8Jm40
 JDDExGVXuQ6YZHHB0PC1lJykuKOTGITjLZcMz/unLeH2YwycE1EOmSyA7fUW+pXI3BCil1mhooS
 6gXpi7i6ovmxdP8iwQHQJ5PCDrykSYVt5KwCjDbeOX+lZNN5GTbDfEI/pRK6rVOwtqwW719tSoi
 6Cpc9otHdn9XkhwwqHjKiio4rIfLy2hHMklxHw1yBJY/3dGaiLTynhXfUEqGVQuxLMMlhyDMFtc
 VaJRHSAyBypr+UrNssiM75aCwxqP2Cdh9tpJUOsfDAkndxkbRTpjpcj68WjdM1zJuLfevhL6T/+
 N009ycFjBh4VAcf9GnQ==
X-Proofpoint-GUID: ZEcaTvjVoKDhRJlhoMDqMDtFk_MALv13
X-Proofpoint-ORIG-GUID: ZEcaTvjVoKDhRJlhoMDqMDtFk_MALv13
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-31_03,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 phishscore=0 malwarescore=0
 suspectscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512310090

Enable UFS for HAMOA-IOT-EVK board.

Signed-off-by: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
index 36dd6599402b..2b1e643975d9 100644
--- a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
+++ b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
@@ -1190,6 +1190,24 @@ &uart21 {
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


