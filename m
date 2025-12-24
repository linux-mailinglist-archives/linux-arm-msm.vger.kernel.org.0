Return-Path: <linux-arm-msm+bounces-86449-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EDDD3CDB0C7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 02:10:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 646DF300DA7A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 01:09:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38BD8256C8B;
	Wed, 24 Dec 2025 01:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DjK9IiYY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JLg7zNCe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9163C1DE4CE
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 01:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766538562; cv=none; b=nlPy3IuxByKkvOkBa/MkafhQ6ocNzEAxYK9T8EQMF+eTNTHiHFpJsP/2iROkuiMgWIuauXX6RfH9tLPPDeAwadsOWbNxXp8qhfA5EPVW7FThMcqPFbPJczb8aKIhWDNdPHGvzvKZg5s9OghSlDmEWI1MywdqtEjpvlTlf/gCCPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766538562; c=relaxed/simple;
	bh=ms8hkx6yRFZVL2v2SQda4XtASsVbepuC88qlLAURmR4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=fmVjSGEZ2nGLy6Q5+5sGJ0f5HgxxaCN99H8BxcuBzEDGfiwAjQNJTOyOfsz0FX1cGYQjzQeY1Ea9JL3/OPChywgmh3RBUw9Nb6aLpYP8jHfa74EwVzg+p3eMfgA7YKt97D1nw7D8FDc4ttgm17Qi7QcPeN1mJaqSsoxW5gA6HZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DjK9IiYY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JLg7zNCe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BNJCwJo1056400
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 01:09:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=BnAmHq7JdBMPLG8aGGN9TQ
	KrHg+XnKczcopwEj2UWqM=; b=DjK9IiYYXXobTTMQPtBJIbdKW7nGz3iyC+X/t1
	ho29pgd5TveNax0/FF+Fpt5vCzZB6khLFoGKeFL4RA9UrxohjSd6FSD1PIfVeDUD
	9zG6DpmPsSSxQada3ZUs6Td3CvHc6n4b9NetjSQX4LIyO17FfooSlenwdqufJPIN
	ExfU9KgUXj4M0p4fpaNxATjDh1+cJzdy7zqnlSdnYqPIiX8pxCCsetnXYReZ1pZv
	jmGf8RY4gaUWPdhTFImVpUxzan1vL4GZbGnqQHDwOif1y5QRaWhKcD5mVSR3MI2h
	WA88phPEj9IVwlSgtvS8zVgv3QfjgjO0fFMilseWHDo85gCg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b811v0ura-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 01:09:19 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ed79dd4a47so117182111cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 17:09:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766538558; x=1767143358; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BnAmHq7JdBMPLG8aGGN9TQKrHg+XnKczcopwEj2UWqM=;
        b=JLg7zNCe+cEEEc29gciBBK5P6i6TQTs42N/aPETrL8DX2cTBWsXsFHhp1YmJ5pL3hg
         X0+hT4EEoDKQiOM5tOjJCIZjzx1OFqotC+EL9UyflNKAgiFI9A8Mmr5F6II8/cIVg/ow
         dsKZvFxoMC5tqY2ydhIZ3TSHfXTWi1Os5l+4oP4v+Jftn2qhdHCCLPlBG4DRSWv364m8
         xiLrYHQVM/I2Or1SDFxZWcWUUVCNq0eTzwOrOhTC/AJATVIVmFu75N//n+uor2sNvwtL
         JvN4Ycxp2mNvj+NL8+P5L/8qV3RNVel/IHDHX/zTXCaxx/9hnSveGWi0DWbGs4tb1A1r
         xF5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766538558; x=1767143358;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BnAmHq7JdBMPLG8aGGN9TQKrHg+XnKczcopwEj2UWqM=;
        b=li8k0EDW34Fh476wb08zhaHQMg9AXMnxQJjXxgG1xhiCbGbw5p7nhJyqBJUJ9iR3Yh
         5f97BFJ0XKKuBYkEzGvUba9LmjOFYyoUixFV+nBmfZcJ4dvz8msOaRaMrPWLyveYdstI
         GaVVR6a7m8xQvxbTxRFq4yTJjm0taNHedsznHEweeasAiBfjhMO2XAxcNmqoXK1fCjM5
         OhP3AkSeurWdl32drEHnGljcMR5dn7nJsfBrPF9ghRhi8Jg/x3CraJ3gQ+uoJxq3SdSX
         cqiph2BYHuyt+DEmbxFHFYs5tyRm+01anXR6gvYhr4EIg8GN0/gueZ7wyQ3Yei4ZDu/G
         yDfg==
X-Forwarded-Encrypted: i=1; AJvYcCX0phIAeZmklJa/8BkGAYLd1CVWKwhV1s4W0dH8Hsg+wiVv0WFmO5X6DujzuDbYDrQYDGszbRQsVx8A0pnr@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2kgUcpMtWXflt01wrR7sWhZpvYvztn5P9qtuFqEfBbo7jscJy
	WzoQ9N5/1/kJdnCPhzjI8R/tI6EvDpJfcTtOs/Xt7WknD/42sEHH3pVKKH2/nP8veLrmcrOZXzc
	mABdeiIOZXRplAuLG84BjLMnSdqjVUzjzRIqpxtramhw0Fo/wY2vaWcWUWPaFARbCzaE1bnZBF3
	tA
X-Gm-Gg: AY/fxX7GsM34b7icumoR2K8TyBpE+98Akqi5278AvyJ5jDaiHiEwXhUC6gdZvwF1bmX
	Ec1iYdlur+zOxkqzdrDkjZdhQaP0oAiSWLqKSa5eYrjOnuqp81SI2WATKiEkr08LxuOwpt/cO3c
	Prw5HxTwyy8j0peynAMo2Z6N9H8uh0OBxC0Nonah7bbPP36Gh1XX0MMdz7Q63im+4hqpcrf/Jwy
	h7Dslf02/d0UGDPRXaPH37szd8gkFzAINKM52JVc/H2h9Pcm86ARQg+XNp8SIqiPQppftztjMmD
	qVuvHo2tDswss4NCqEqQVBhiEu795ubOMw8Q956sldg5B/bqSZyCEcc4Z+aY0CZLUmMmRIKUM5T
	STvKiKlr4fMtz3rl8sVWFRU7mc5XGq/kBWxjFvaAhDOqnV5hclK7e/HxfFXUfOn/2/QFgQZQV42
	9N5uL/CZNx+qeYRL2cfXnQskE=
X-Received: by 2002:a05:622a:250:b0:4f3:5346:5d54 with SMTP id d75a77b69052e-4f4abd78d8fmr236352081cf.50.1766538557925;
        Tue, 23 Dec 2025 17:09:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE9Tkonl31Kuq842ZeOwpBmaqimqgP5Qq4Dl36Ol/CYmxvAB1e9CnKoo/PZY/pXwuFY/xTDJQ==
X-Received: by 2002:a05:622a:250:b0:4f3:5346:5d54 with SMTP id d75a77b69052e-4f4abd78d8fmr236351791cf.50.1766538557444;
        Tue, 23 Dec 2025 17:09:17 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a185d5ee4sm4639479e87.17.2025.12.23.17.09.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 17:09:15 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 24 Dec 2025 03:09:13 +0200
Subject: [PATCH] arm64: dts: qcom: x1e80100-medion-sprchrgd-14-s1: correct
 firmware paths
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251224-fix-medion-v1-1-305747dff79a@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIADg9S2kC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDIyMT3bTMCt3c1BSgMl0jY4NUY1PjpERDAwsloIaColSgLNiw6NjaWgA
 smC7LXAAAAA==
X-Change-ID: 20251224-fix-medion-230e353ba108
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Ettore Chimenti <ettore.chimenti@linaro.org>,
        Georg Gottleuber <ggo@tuxedocomputers.com>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2063;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=ms8hkx6yRFZVL2v2SQda4XtASsVbepuC88qlLAURmR4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpSz05rvDIvnXJCXyt+KXFC1UPYbeVnNTDXcEIV
 VAJmJrAmEKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaUs9OQAKCRCLPIo+Aiko
 1T/vCACqGnw9K0OvdzESY0mqq96XH0Ja6PXvKkBugxZf2enZUlrZyUlFuvlgsdAC0dyJXf/saYN
 kUsICdsDFNY3uhJ3q774cc8FfQqloWlE8ldkgRtgdxUdFhBXgkIMxUbowx4Ko4iBAuF4HtGtFwg
 mkwduxLYmpZpMvwuft6JABAKWeM9HsI94mFD/23sO5bHvzw1RiN9RaGxqD9G4X+lrWHGVWwk7qE
 xx4gmcnijwge8/fXZEsj/SHt1lnZkdXb/qDZtYrbVrtgF2059B3mWGNW0HnxOC3YsdnXTPdwvCU
 DnIXpQcvEj255zEhMpdM/JZ/QWI9E1tDDOCyzgqY4jWmsD0K
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDAwNyBTYWx0ZWRfXx8MF6BPOtudU
 7xJtcvQcgx0AdRg+sAJ9ZGqlOxpO7YcE7BGEdtcUBkaNDKti/oUBGFVk5dlJ8n3cTzCR9iPqUav
 /wvGh8/3qLEZwX74pfyT7dpSNTqxDJHWevdLJe7PNeN95UNCK0FYvqdz5GUtmEccEjqOX7kvU57
 KHTbexC5LpMytY9/GhBmw4SKRVLBhp/yd0xWAKwTnPJywyigeDlboWa5v0QxHoTCIiGfx8XOISa
 vHk6lrBUKV7F8iYdS4Idv5ukyc4vmUAAhU4Ord+/88qjySTrrVz0UnmsoYvRmkoYZ3G7a0J2tUT
 q/RDSWuQ312pMmLrNhlvNuF0GOtoe4nKmFO1k6uSfjLloaL/hsq4aY8IRtQGdPyBO7ViKGZQmGS
 +02WR/b5RKkw5KdGW/CFikmgd8iTM0OTnvZPzaBMLOxVCQyCcqAJnFE1P4fyJX2ZEVbzEy9vogW
 9ZCeKibmZoYP6ovPjYA==
X-Proofpoint-ORIG-GUID: y2tXeRVv76hbfvSv0QLrcsO-8OfYcMfS
X-Authority-Analysis: v=2.4 cv=WegBqkhX c=1 sm=1 tr=0 ts=694b3d3f cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yDUiu3_GAAAA:8 a=EUspDBNiAAAA:8 a=T0bVrXGnBZen2JVLHZsA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=gafEeHOdjwYkg5oUpzAY:22
X-Proofpoint-GUID: y2tXeRVv76hbfvSv0QLrcsO-8OfYcMfS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_05,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512240007

Per the agreement, the firmware paths (even for devices not supported in
linux-firmware) should follow the SoC/Vendor/device pattern. Update
firmware names for Medion SPRCHRGD 14 S1 to follow that pattern.

Fixes: 8cf65490cdb0 ("arm64: dts: qcom: Add dts for Medion SPRCHRGD 14 S1")
Cc: Georg Gottleuber <ggo@tuxedocomputers.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/x1e80100-medion-sprchrgd-14-s1.dts | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-medion-sprchrgd-14-s1.dts b/arch/arm64/boot/dts/qcom/x1e80100-medion-sprchrgd-14-s1.dts
index 9155435484fb..20a33e6f27ee 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-medion-sprchrgd-14-s1.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-medion-sprchrgd-14-s1.dts
@@ -793,7 +793,7 @@ &gpu {
 	status = "okay";
 
 	zap-shader {
-		firmware-name = "qcom/x1e80100/medion/qcdxkmsuc8380.mbn";
+		firmware-name = "qcom/x1e80100/Medion/sprchrgd-14-s1/qcdxkmsuc8380.mbn";
 	};
 };
 
@@ -937,7 +937,7 @@ eusb6_repeater: redriver@4f {
 };
 
 &iris {
-	firmware-name = "qcom/x1e80100/medion/qcvss8380.mbn";
+	firmware-name = "qcom/x1e80100/Medion/sprchrgd-14-s1/qcvss8380.mbn";
 
 	status = "okay";
 };
@@ -1141,15 +1141,15 @@ &qupv3_2 {
 };
 
 &remoteproc_adsp {
-	firmware-name = "qcom/x1e80100/medion/qcadsp8380.mbn",
-			"qcom/x1e80100/medion/adsp_dtbs.elf";
+	firmware-name = "qcom/x1e80100/Medion/sprchrgd-14-s1/qcadsp8380.mbn",
+			"qcom/x1e80100/Medion/sprchrgd-14-s1/adsp_dtbs.elf";
 
 	status = "okay";
 };
 
 &remoteproc_cdsp {
-	firmware-name = "qcom/x1e80100/medion/qccdsp8380.mbn",
-			"qcom/x1e80100/medion/cdsp_dtbs.elf";
+	firmware-name = "qcom/x1e80100/Medion/sprchrgd-14-s1/qccdsp8380.mbn",
+			"qcom/x1e80100/Medion/sprchrgd-14-s1/cdsp_dtbs.elf";
 
 	status = "okay";
 };

---
base-commit: cc3aa43b44bdb43dfbac0fcb51c56594a11338a8
change-id: 20251224-fix-medion-230e353ba108

Best regards,
-- 
With best wishes
Dmitry


