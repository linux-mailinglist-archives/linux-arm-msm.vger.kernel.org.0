Return-Path: <linux-arm-msm+bounces-86785-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 96D55CE6006
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Dec 2025 07:07:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E1F2F300E790
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Dec 2025 06:07:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34F7127A122;
	Mon, 29 Dec 2025 06:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Bv5EslXF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A613eNB8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17FEB27B335
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 06:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766988456; cv=none; b=V/zIMbz6BA90RRCVThlWAfwybjUY/tS4yN3bGgarQdwogwUOLz/+753FouMzaD9lA5ikUdjRcIY0Othsfm2eiyeAiprB/CAyqhQqPJegnvBdEl6YJ7R5Cv8b7kuKrd5wmzrRD3qfGgVicl8Ikiq5QgacsxfCEHrVs0TuFqylxXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766988456; c=relaxed/simple;
	bh=jJ6O5KkP658Kzoen1OLLHGHGjbrUHLY0oOPUXGr5BJk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=j7aJD1146a7C/bp5KEoUEBFcOvnEDQp7j69OH+h8z5IR9yb/dvQfkAspn/v/elbY7HzCf/26LYmwf3ITJc1RNwJUotqbRh8vN755E6mXp4fYp/JZ2elvYvTdFlkLSQHtqccgbzhqIgIugeCTEjp6VGXAGuNXtyLv0pm+Ti2QTXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Bv5EslXF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A613eNB8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BSMd8NR018770
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 06:07:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=nzPReENl5jq
	P24RO4wk7cW8ZGHbcPiBK7hn8rIfW3pc=; b=Bv5EslXFCEeuAeS06DXCssX9aNc
	riVB7rXm0LP3DTP23mWH+PKJX9TCmMiSFfOEtnRHhuEsTUrbGydISujaG1/kYd3M
	yvSCNGTh9Rl+xH2N9gWq1KRFh8vyutEL+m6AV66Klgxz+KQs5kczI76EOsNLWNlW
	U9UimqgTh0JAa9HIdwfJSHlIE/2rnnDvphT8EgmSsJ8/MhDWsYBg+u1A6XyYoD9W
	VAlx5V5mnmkzqpdaPXN207s6mLxLR6DDLQh4w759YqNtnLCPI34dxrSfKYr8Rh69
	bJUcF3cKu9Z49q6FwT8YyT67BMoWxpB2FmIUjky9tg6VYLqqOOVLZjGxw3g==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ba71wuggy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 06:07:33 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7b8a12f0cb4so10234275b3a.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Dec 2025 22:07:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766988453; x=1767593253; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nzPReENl5jqP24RO4wk7cW8ZGHbcPiBK7hn8rIfW3pc=;
        b=A613eNB8qmYlRA4FkJ+f0tcg9epPigD8M1axR6GXMfcGFS1UPDxJYWVeaHUilIAkdW
         9WMiULY7FMOdJl0/d13FALiEEqk0VUDxD4RhL+QtTwmtO5+mTopJrAhENRDTbrJ7XNEJ
         oP1vsHid0m2Hkykgnr54YyLkvSk3h/DYO4lq/FCySap1dlumouDgNEVMXYIiTxtAzt74
         VVQ1fdKW1JAA2uCyiyOZKaJuetOOrj5RlWtIlWAkhuvyJUBVSD5vEwVpa/tFc2Bl5P/e
         pVqD54hn0dRj2M58vNgELljOakf/uADZ84jVOFYsR2xIcgnX5gXvjvfrZNYVbXbPwFIZ
         lC4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766988453; x=1767593253;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nzPReENl5jqP24RO4wk7cW8ZGHbcPiBK7hn8rIfW3pc=;
        b=NzMqJppb6G22Mj5NaGzCh1tqciV6rVXpvlrPoXBcjnDTHdc6Q8+k36dicvzgpZxssZ
         93MsfK8wiDAQ1hqTIQS1Vpicb9NQLCaJexNa0RHHb6HEvNw3ZikLMPm0JnwXGC0DON/+
         u39SgzqawWsAHSAA/wI41oA+N6eAUjKKzGrB0N8wfKPkflfQKGm3jQwsXcz2chIZLKbE
         4D35IGA8ImNjAxskKCyNYj5U8pFxTjbAvSbFNpj5x7DfBJjuTQpB4g8wZ8xdkEdQ0Lgn
         ug976J0gIUEYesWKVWGEe5WImYnFIOmULYwwlfKofed40JEomzp/O9lDdVyMKoOK/dhC
         LVJg==
X-Gm-Message-State: AOJu0YydxQDFMKBmxFILf508bB683mXKj5Omozw44tv0rZ8UmI+bDYms
	NRJmEdW0ooGrnGT0aeQYETHPPVMOWr1/PBompQPhOvA6XdFtHvKc/eLmBWC+ktC5INmPnj/FSOR
	1N+OoczdDqvEJ7qIlLBnTUbyvN6sCpJZQkxUqgfPVuyVo7XGDluNk/oBjtXtdHV6TUpW0
X-Gm-Gg: AY/fxX621IAUfFqGSnEeJLbzT9BJ0D21+9Zbb140bHuxXsVZq1HzN5mXuCeA8VrN4LE
	/oBL4FsLHwYNR1vzOsIsEq2Ylf6QbtEjQJK7VFWJn3uvaG6bY0LnLePSpjupeLRUJsDPXx9TzGA
	GNa/IMTIuXDs5VKNF7UdDm6P65ow8GO+0CBNIrjs/nez1BCd6NfIcz14p085ECXKl4mdZvK2oAr
	If2F0BL6o6wJB2M5GqLa2QkgVwba1UIxQLzgIpfqKQYyj0k7yH/qMMMjXgOHys3Eow8rihOqJHU
	cp3pAyGmMIY6oDVbM3PvZakdmDiMcGxeEVa3YdIONlSeZktFQiapRlnNKGStXiA360ZXsuNc4oV
	ZBJ7ZR37ASnS+nJGEN/mXJlMABn/97hiNuuiwE0rq5OMuQf74n5Ga
X-Received: by 2002:a05:6a00:1d14:b0:7e8:43f5:bd44 with SMTP id d2e1a72fcca58-7ff6725797emr27629176b3a.48.1766988452956;
        Sun, 28 Dec 2025 22:07:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFJ4QM4VdGN93Y3u+R4lE5nFnhu3cRd1IzjpC/9WxyY5qv/m4PWqlReb+ZwjHBPOzexW/VaCg==
X-Received: by 2002:a05:6a00:1d14:b0:7e8:43f5:bd44 with SMTP id d2e1a72fcca58-7ff6725797emr27629148b3a.48.1766988452500;
        Sun, 28 Dec 2025 22:07:32 -0800 (PST)
Received: from hu-pragalla-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7e8947a1sm27917763b3a.67.2025.12.28.22.07.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Dec 2025 22:07:32 -0800 (PST)
From: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
To: vkoul@kernel.org, neil.armstrong@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, martin.petersen@oracle.com,
        andersson@kernel.org, konradybcio@kernel.org,
        taniya.das@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, nitin.rawat@oss.qualcomm.com,
        Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
Subject: [PATCH V1 4/4] arm64: dts: qcom: hamoa-iot-evk: Enable UFS
Date: Mon, 29 Dec 2025 11:36:42 +0530
Message-Id: <20251229060642.2807165-5-pradeep.pragallapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251229060642.2807165-1-pradeep.pragallapati@oss.qualcomm.com>
References: <20251229060642.2807165-1-pradeep.pragallapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI5MDA1NCBTYWx0ZWRfX1b07j3q8TYhv
 J/lZ0lSYowom9LBWp+vs5G3PJt0E+wlccp1htZaa7fo9m+C4MlXnhaEKkWZlzTDIqrOfQry2jfq
 RCoqD4iai0UhiQP9ygnka2lZL/gUTBppvXwZlMUwKJx+BLYxtZMj3x+wuWQW70SYZnQBLkxaKg5
 DL9Detnqnlzys7QVvffCFGhg2sU3ND7y5cD85w2LPLXCP/9yXN4R+0TXEIFG9UyEeeXGiW0MK1s
 ngZE6jG6qY7+iNqcVMirBvUQZZCJKIDVTsH0wW126CFaK8vASEBugYt1cfDKEW9eireNkDzRheN
 a+c8JSoiuTmk7L1gOS4bTyTdAhnF9Ti043ayqE5IMCnla7pnQQd6wnUX14jceJD68iCfgV0mbW0
 d0t5uTyDznTaeALHfQlRzzr/3QH+w8RlUtMT+pK/O1bOjj0xHtTVsGmEQBJR6c5MCpGiSY64L97
 S1+mDv3MwwyEObSP07g==
X-Proofpoint-ORIG-GUID: dzmSqsIj1Z0dlbtRg8HCbtBUVzm58zGC
X-Proofpoint-GUID: dzmSqsIj1Z0dlbtRg8HCbtBUVzm58zGC
X-Authority-Analysis: v=2.4 cv=CK4nnBrD c=1 sm=1 tr=0 ts=69521aa5 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=FwCcbryfLnLJMkbT1zkA:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-29_01,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 adultscore=0 suspectscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512290054

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


