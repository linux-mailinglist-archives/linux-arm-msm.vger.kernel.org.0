Return-Path: <linux-arm-msm+bounces-109084-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SIfdIDEJD2rREQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109084-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 15:31:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D9EED5A5D2B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 15:31:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BE6CC31648F5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 13:13:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 621F83FCB22;
	Thu, 21 May 2026 13:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kWNE4Rq7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Kf4A5Hc7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 054393E1714
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 13:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779368876; cv=none; b=k0E4dfMYtXefRObITAKJl7+U1Krj3zya1/VkKvtPnOqIa+sweAToItlAM/7Z2d9xc6J8ihrwxVtI6Wp8hXbBDYnJposF3Byley7xh7AZHbJaz/ZVkwuQTWVq397mNp73zr0qDbasKxBQ4w6qm4yqRnv7Cgy10xrZIpLbzuJvZ14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779368876; c=relaxed/simple;
	bh=YWQTnwwuDj6jKqmNIBBOM458HqBbqXiHVkCLAkWhTu4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OOwcY6H8sQTLUMSsmKf0JvGqK1B7w4nEClxph1vJ3Fx8xySFNUzGj8qGr9Qf8DV/CtspJFZmUNSvphXrGNVGPyqldgVhIJ5NdX4WOldO8KqFpT8EkkC563G5dPVzo1RpZPYxwsJOg1hGzM01xmxc3xT2p6LT1n1J3+b3VFUhhKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kWNE4Rq7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Kf4A5Hc7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L99k0K3527682
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 13:07:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gxffwanfGPhkL4TX4Kfzzu4TaWJkNBos2KiB0FBhCVM=; b=kWNE4Rq7OWCtxnEV
	vHXJeCJOWb+m3I7UAGWvVG1DLpIjFop3pgCcueJTcmXRxdxJ0CtpRuAVaO4sb4k5
	UxAJ5+Yfaa15HElmfCDSzmRFRoal2+/SR3nbShgHD+LZdJ5XnyNkg5D5XAHVkJ1F
	HaC2myu89GomQgTrndF1uCshyBwtwrk9X9ve0ZnukS3ZjZWeWMlxHwTCdmS6Go+N
	rPJ7w2gepbvnob60E1LHi7l3+tMPofshmBtAr4lTOaJOd00BpUHUipurWD78GCd3
	dGrUZ33N5S7ij6nqR4c0yJVGSXt33SZoj8K8mpG1++nKxcb79VIibilUD2Ci/kAV
	CnP6NA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9vhbhpg6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 13:07:54 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c8514f8ed5dso423091a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 06:07:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779368873; x=1779973673; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gxffwanfGPhkL4TX4Kfzzu4TaWJkNBos2KiB0FBhCVM=;
        b=Kf4A5Hc7gCnUdVXF5I4YkjMe650Vgg70lxWfPNFBA2so9QMY4MKD4yFur5S2/Gsowh
         4Ppa3sOygijDl9ogm7Rfesy460jECv3Lvqc9ky1Rg38NXf3cJXjCnFbYPy6HaNOlXHli
         jI5cnkaNTPYz8qGUq2xcp6BmsT/s/v8nvDrUeq/Bl2cJIs9xIukChopjgYk2uQpGfsqR
         dkBSvPpmx5B0sE6KXL9FHGBfwrkyTb2nquiRdFWpY68RoVaBFgjNzB7hWWcPM5OJuAF1
         22ke8ncwxRufIC8PlrqCGR8PejnymLNHenqIwtvuyAfEj30eDXcyBOm7YkWIFeKPngK7
         AZ0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779368873; x=1779973673;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gxffwanfGPhkL4TX4Kfzzu4TaWJkNBos2KiB0FBhCVM=;
        b=hdX4eIIuS4kYZvuSrvXf1Ghw2kNeowzUf7XZ6Y3VDuLBkQAazSOJEJDU5geqm1x4gd
         HdtRMnW2bKVLjh5lj1sGrZ5D5p9ho3icZj0xBnoUZr/cxX4BK4Cwf5CHqDtwHtjNoakB
         FtdAETJ4RPVPVkjSykLWUEGOf2UPUtCgysfQlWB0g6GAFblsJaWMPN3+gITqC1L+fxR3
         dZZK3JpFPMCS3lpTuqjVvb46uSmQebZJbm2jhRDwmK3uT9B2QaX5eQMKANCu0q+j3JBh
         Kmqub2Uca1uFOSkMju+HVJEhjhhXnydxXqlUzIewWrvS3hhtUq6eHR3VvTJQ3Fqr4ij8
         NGqA==
X-Gm-Message-State: AOJu0YwlWc8SQ+6V5XwD87KgPueV0F2Naq4llJH7g2DOpC9OtbR9SBvn
	hJSoJFyfQsDde/YFPm2LGQgIb0aQ0tnD7k1F7RDu7fxbG7E0ugjfMTVoraGhebV4b2YRXFt6nq5
	RFWrkP/9in0JOkQTi4Ny+oEw6wqtNh+yfkyP6l/MkacXQ20AvXPXu/o+7J5PCyJuZv7aO
X-Gm-Gg: Acq92OHdGm/bfJZmDvG74BR3NL7ide2TrhdS0pMDiD57KznMR3CC1QxqpxhtW4JusCz
	9mE+nTKshvFNPGO7GH8xK1erI4QegG/xVmuvmX9lZammKmxqeO0C+vzfV+vkYHnaXqugSMS10N0
	1qofogjE91lgEprZ/jQZ/JAkxNoGVXgCO8XroURHSNb3FAwL5x19zs8Ac0ymPJmJSbL4znYuoH4
	sFwJ/KRgxoEeLJfVOpx2J8t0zrGAzva0FAmgMWCl0XIbUydYHhzUBCvWhLIXVHGC9/vl1szUPO+
	35vxX6e6Xaty+e0nkuweh/kqyninrQNiioSuQkLGnEEYmA0XBWm4RocW2LoUdLIFZ1UUbi9Z+Kw
	uk/OY6GewvgMDXckTBeItwlJHuQKxFT5hSnTd/Cf78zaHLf4iaL/6kTFWJKiwb8cvfUU=
X-Received: by 2002:a05:6a21:3390:b0:39f:1f92:28e with SMTP id adf61e73a8af0-3b30874e6ddmr3504162637.27.1779368873146;
        Thu, 21 May 2026 06:07:53 -0700 (PDT)
X-Received: by 2002:a05:6a21:3390:b0:39f:1f92:28e with SMTP id adf61e73a8af0-3b30874e6ddmr3504117637.27.1779368872548;
        Thu, 21 May 2026 06:07:52 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c851991ab10sm294602a12.22.2026.05.21.06.07.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 06:07:52 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 21 May 2026 18:36:47 +0530
Subject: [PATCH 14/18] arm64: dts: qcom: monaco: Fix PCIe wake GPIO
 polarity
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-wake-v1-14-d822567be258@oss.qualcomm.com>
References: <20260521-wake-v1-0-d822567be258@oss.qualcomm.com>
In-Reply-To: <20260521-wake-v1-0-d822567be258@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779368813; l=1812;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=YWQTnwwuDj6jKqmNIBBOM458HqBbqXiHVkCLAkWhTu4=;
 b=7Z9bIiI413fVVHiiSsNDh+c22qDCxGBUm+fOW8z6qvb3YllEqq5QGUQpJw8LSV36/RrRmSZoD
 eV7Z0Ud1C/bBP9Fh1jKNZbIAHyDQr99k9R1KLVCgepWjkotHfyEiK5r
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDEzMSBTYWx0ZWRfX73O0WBIyi+y2
 ZoqYapCfjLA8RfHvd/GM3CBvcTqZ5Sd6UzfriHOhGITvCvY2pZQ8cXc1psEcr6abR1Z+b+JS/VT
 Kn4dbpkQQD2OaqefqI5EJaappGlo6YqH5cCXtXOGz+x2eYNoCnrWV4OdC8c00/2fROI7oOiBg+n
 uyDCSZdtgU4kzcXev1yOvC3Oy3sxM4GTNRd1KfCoc0u7W0TKBanYqw8pTe6v4fesg2/xhSp7duW
 r4HeP7EaOeR/Hq79pUk5gkEXE4chhcAcGa+g1aBjW9Zsi9zeA4RF/4BUBu6YfN8Mvbz5wzNZsHQ
 8bhH/Li74HAjyJLDeN4atvq9D1w/GDIVH/VFNmtmyQrd9KumQOl7qgeeIok4xOYOm/Iq5Z0P4Px
 NnOaum6jdpjoEv6T37Y5BGXYfkLrRnksW7pqKt16Gt1HXVFeBueIk4UOTRriShjx19Yzvlm78nw
 +R1/VlHk4K3Rm1yilsw==
X-Authority-Analysis: v=2.4 cv=GYAnWwXL c=1 sm=1 tr=0 ts=6a0f03aa cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=TRJGHeO7bdl8qYu8Ap8A:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: 2v4ipE5J240NLdLcPYalHsslkmgijoUh
X-Proofpoint-ORIG-GUID: 2v4ipE5J240NLdLcPYalHsslkmgijoUh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210131
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,0.0.0.0:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109084-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D9EED5A5D2B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The PCIe WAKE# signal is active-low as defined in the PCIe Base
Specification. Fix the wake-gpios polarity by using GPIO_ACTIVE_LOW
instead of GPIO_ACTIVE_HIGH.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
---
 arch/arm64/boot/dts/qcom/monaco-evk.dts   | 4 ++--
 arch/arm64/boot/dts/qcom/qcs8300-ride.dts | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/monaco-evk.dts b/arch/arm64/boot/dts/qcom/monaco-evk.dts
index 9d17ef7d2caf..b30fc7ecdf32 100644
--- a/arch/arm64/boot/dts/qcom/monaco-evk.dts
+++ b/arch/arm64/boot/dts/qcom/monaco-evk.dts
@@ -643,12 +643,12 @@ &pcie1_phy {
 
 &pcieport0 {
 	reset-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 0 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 0 GPIO_ACTIVE_LOW>;
 };
 
 &pcieport1 {
 	reset-gpios = <&tlmm 23 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 21 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 21 GPIO_ACTIVE_LOW>;
 };
 
 &pmm8620au_0_gpios {
diff --git a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
index e9a8553a8d82..f9891fbcca90 100644
--- a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
@@ -615,7 +615,7 @@ &pcie0 {
 
 &pcieport0 {
 	reset-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 0 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 0 GPIO_ACTIVE_LOW>;
 
 	wifi@0 {
 		compatible = "pci17cb,1103";
@@ -651,7 +651,7 @@ &pcie1 {
 
 &pcieport1 {
 	reset-gpios = <&tlmm 23 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 21 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 21 GPIO_ACTIVE_LOW>;
 };
 
 &pcie1_phy {

-- 
2.34.1


