Return-Path: <linux-arm-msm+bounces-84964-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C905CB47D8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Dec 2025 02:53:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 906F230433F8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Dec 2025 01:53:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64BE7274B40;
	Thu, 11 Dec 2025 01:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cL0bxpAI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ybxc+gtj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68C4D2727F8
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 01:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765417986; cv=none; b=N/iMHvIniyM5gAFbTGgNC0TisN/Z0RYbDQAvbk7zcE3e4y0qFPGmLOa0jDBLWc0d5ECuYBakZsnN4KCoN4iI4JjIvEebBXau2JSJcxHkyWV+pUkf8HQ2Idko3ZCTf9EuKRvElXQbXVSACExEzZY7IMyZq2Rh/NdfnHelzM13XrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765417986; c=relaxed/simple;
	bh=mI8OHz1a+H+1J1OvBA9S8STtqd7mREjQc8uhNszk4wc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=psUmyflbpvxJXnOMxz99IlOyk77tXKzsGR4TGv3xSgY4e9tBGTKqVduuJb1/Xaa4pVU5h+bUuednNhjEKRFvxamRi1mJvF7QRzqNJNIGZBwz7WRx5elfsZTiRp39XYMXrx3UCmGm+bD4m8pc5MjGxPM6scRZ4QOk60Nj0AeIvoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cL0bxpAI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ybxc+gtj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BALP4qI4126319
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 01:53:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5gXVpspFZ0ce69k6KqGIee7CnwdYFvfJN28a2Y4i1qY=; b=cL0bxpAImUcJ9C8Y
	OnizvQ79khoHGu468MGYnAPCjRgfO6SOGKkYaJvU+tldUuD3CRa2kAB9wUr425vt
	tTYwMnd9M/33uAmdLmDryr1JI91atsbdlt+6hhE85xntgFsD2pTWr5J12mTzcBBn
	DjZqpp72yG9rlO+/uiGSGW9jRqLzk0XFaoCB0GO+xf+c+7lQOBikNQzJFcagH/eW
	9H9rE575eipXmm/zamjxAgTDMdawvWY3eZFz8XdmzRQPEDRx1bf5tMhBg6GMVdH1
	TkzzDVAjD6fw5DpbBgTJSZOZBod8D/2MdqKqonCLFA4f4+ZOSXokQaXI2OregkhV
	xt6vtQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aybhp9snp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 01:53:03 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4f183e4cc7bso7452551cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 17:53:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765417983; x=1766022783; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5gXVpspFZ0ce69k6KqGIee7CnwdYFvfJN28a2Y4i1qY=;
        b=Ybxc+gtjkYzTfRqROswv7dPc8K6jscXcH8GtyifMc1CYdMG4ZqT/hwJtQDkD5M5oTi
         0f9bxLXRVPR5OU/zYa0zkrWUp/hvSWTwcXWLK4qdOBvZgSAhidIBRC2kmILDVTRnlQcc
         mt9Al4dUEfqq9jCAeE85nFiPt4wFgHLC+dNiXeqQ3k2CcMwq3RgjDSMftKQgwuAg5k8p
         8EJK8Lrxg+0vgJYyEXpEYd6jwP4sKMXBcOVbOt9aR1eTScYPhnlCx2WY+WaiPgsi7Vm8
         L65uLkKrMeCfrUoGXSlVDP6HHGXPMXy59veG1/QAZVK8uii4KTVfDMf0w70hgynD7g+1
         aMcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765417983; x=1766022783;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5gXVpspFZ0ce69k6KqGIee7CnwdYFvfJN28a2Y4i1qY=;
        b=JLPeHZkr+XlNtY+GbUTsec5TL2dcupRXsuUaXOKVqByKnaivvy/4mYjYVCgIeNZ5x1
         FUU44LKs79jkjpVlxidrb5hVX+0fJq0qNhgJsMSk45s2X2kcGe0QBnCu6E2g+IkBq/Sl
         h6lWFNj1jmopO6ril2F3OaIAezYZ/aQ5KeJPqU3YlUjbgSJ/DNo6H7wFIxwrQeGgBreZ
         beA3pJeLZE4AyE3mwzW1XM9bsFFQMM6yfDcl9oGRz00DxcwJt9yhGAytJmKmL5bTXgWP
         74Kqw2xrOam+f5Rz7Q79yT42BOj0xg3mOi787QYOMKIcw3YMAi0HjRZa/JPsjVfjNkI5
         q0uA==
X-Gm-Message-State: AOJu0Yz79yIGIyzYY/UXteZJ4/OTkzKpKmEfXo2cnsDFm1kWqzfoSR/b
	lc3svSrokZdnPUT8zHBKJYVknWHvMF9jA07BkolRkTexoZoNdlXu8AhMVx6zLXcP02gxz4Hki9+
	BwyVTc5g+rj2LjsWAcfk9RQzBja8wlcOBe9jIsk5H84bIqTGJCD0xpuodkI0/TI6Y2w3c
X-Gm-Gg: ASbGnctTUoTy0jEnTul9p8er9XlUKqhzAipz9QktgXVHM8O1fjMJJuNuF4cgqpPC4Aq
	DJrKQZhADU3iTyj5VmVWQxqumAiCDLiZ1y08rUoiiJ/5p6YHujeMBmmkvUKBqKS6LoS3e7SFonQ
	QkydfsNPh9bhsQ3srxGEMPjZoRmIoXO5OgZ8cIcQ7yudQXJpjB/xbpatEaEhXL4WiGI212NeM08
	8bByVobRyPdfDaHLAXUiRr3dW4aVFlwWFmk6L8eLi+YEVF8WevHJo66f9I/tFxqAU79TZSDGh8Q
	3jxl1ErcTlfGXHUjNdNuBoyB4TNs7NZbAW9k1fGsP3DyFYEhl92bMdkyULAGHhEkvGaNEdHvAT8
	KMSgf1KvOE1yOnGJ+PKRl/p5X1D39ifBILfCk32YZ8uOOm/ZUeoTD6OQ0o497oC/O3GzmENd3Bx
	qz5uoGxut+SktCGSLFPy0rz6U=
X-Received: by 2002:a05:622a:7e0e:b0:4f1:b9b3:9c2c with SMTP id d75a77b69052e-4f1b9b3a24dmr23944061cf.24.1765417982710;
        Wed, 10 Dec 2025 17:53:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGl86fqSultrWYGOxYBjlM9DzZ7sPvLXB4dJeS/cgnQ1nBs2+206U39R5QGLp8lXu/aBMEC7w==
X-Received: by 2002:a05:622a:7e0e:b0:4f1:b9b3:9c2c with SMTP id d75a77b69052e-4f1b9b3a24dmr23943871cf.24.1765417982058;
        Wed, 10 Dec 2025 17:53:02 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-598f2f95416sm393252e87.57.2025.12.10.17.52.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 17:53:00 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 11 Dec 2025 03:52:53 +0200
Subject: [PATCH v2 2/3] ARM: dts: qcom: dts: switch to RPMPD_* indices
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251211-rework-rpmhpd-rpmpd-v2-2-a5ec4028129f@oss.qualcomm.com>
References: <20251211-rework-rpmhpd-rpmpd-v2-0-a5ec4028129f@oss.qualcomm.com>
In-Reply-To: <20251211-rework-rpmhpd-rpmpd-v2-0-a5ec4028129f@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1265;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=mI8OHz1a+H+1J1OvBA9S8STtqd7mREjQc8uhNszk4wc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpOiP0bpb7ioUP3xiUxp8vodF2+RgbCAX8m/XvZ
 ezkj5Ntr2yJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaToj9AAKCRCLPIo+Aiko
 1Z/7CACVhcCnufNdrghAP8OyFwikc2v1/RyWZzl0hoaVhVa4ynzTVpM8nEcM+BkHxIZUh+K7g5l
 L1cbqD2zSO5XSJjUn7m/0CtcNv5602sF5kz1VjCpgHZkuKbN5rxnMZjUmp/1OE3HTo9ndPyRyQ6
 3SqAyzAUMhhYs8StSNhOTamUorTtnqy91onNfEVfPyG0msXN36b7KE2xUBp5P8fY4E5aXDWBtF1
 SB9pQyuO4O2K3opJ3CatG/E12Orv26UFoNn3wgGzmP239XZ2wj5k4vlQ6vU35+wQE896hm1/bIg
 bNXFhnuwS0taa9mBUN4hDmiZiM11cymTb9ENZxGrTqPCbwKN
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjExMDAxMSBTYWx0ZWRfXzcFKah5TIa3S
 lqYab9Dimv4lhWbsp1atOeULRRakzTxznfd9Fgus91y/FNQ3gScpyOvhRLSWBuhwr2kaGjS/jPu
 g6EiHpD3jCE14siwgn7fI7q3AR+wHtbzb1suaW3sNfQSriOtaOibGvbwoX8jUAJuNji2i0jGUeA
 uP7/3uj6mmDQOZSRmDdBqzDbm3e4H3sK6ybs1KO+L2E2zPZnIAGmwFvRK6OUrqYfQ7Z4qOq9hUB
 Bbb65QY1jLMP5TLiKfE7fNM3lF/L3hkF209rsHEMGz+IiMXGSiI5P+HoQHMtBzy2N1ge2h6F4cP
 MP7DJfhRsxDQCjqRDWoWUx9Xujy56qBqS7roaXl8h+B5TTw6jnkO4rmGt3yIExg60MWvnmhDFVH
 sJeHEOIo/Njoud861bi5PYFaXduSzw==
X-Proofpoint-ORIG-GUID: OIqp-98O08GPAAFXBT0K1odtO1rTVrGu
X-Proofpoint-GUID: OIqp-98O08GPAAFXBT0K1odtO1rTVrGu
X-Authority-Analysis: v=2.4 cv=LJ9rgZW9 c=1 sm=1 tr=0 ts=693a23ff cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bH1gikAX_8Q3Q33Jyh4A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-10_03,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512110011

Use generic RPMPD_* defines for power domain instead of using
platform-specific defines.

Reviewed-by: Bjorn Andersson <andersson@kernel.org>
Acked-by: Bjorn Andersson <andersson@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8226.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8226.dtsi
index 51a7a3fb36d8..bcf14a3b13a1 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8226.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-msm8226.dtsi
@@ -959,7 +959,7 @@ modem: remoteproc@fc880000 {
 			resets = <&gcc GCC_MSS_RESTART>;
 			reset-names = "mss_restart";
 
-			power-domains = <&rpmpd MSM8226_VDDCX>;
+			power-domains = <&rpmpd RPMPD_VDDCX>;
 			power-domain-names = "cx";
 
 			qcom,ext-bhs-reg = <&tcsr_regs_1 0x194>;
@@ -1372,7 +1372,7 @@ adsp: remoteproc@fe200000 {
 					      <&adsp_smp2p_in 3 IRQ_TYPE_EDGE_RISING>;
 			interrupt-names = "wdog", "fatal", "ready", "handover", "stop-ack";
 
-			power-domains = <&rpmpd MSM8226_VDDCX>;
+			power-domains = <&rpmpd RPMPD_VDDCX>;
 			power-domain-names = "cx";
 
 			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>;

-- 
2.47.3


