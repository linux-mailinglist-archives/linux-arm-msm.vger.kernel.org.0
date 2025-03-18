Return-Path: <linux-arm-msm+bounces-51732-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 313F3A67505
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 14:26:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D552D882CD7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 13:24:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DECBF20DD50;
	Tue, 18 Mar 2025 13:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LqcDrKJW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B64D120CCD7
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 13:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742304159; cv=none; b=gkKf9CSPL/1HtZ7T45I8sBHWM43mhw5sbl+6NKlHkd+HTLEMvKAXUUjttHS2KWoS6EtTf7eCAuqPWECVIEizcs49ejM4DcE3f+slVIPJ3xhldyf/zN+CpIuwelhzevtyQsdHVYx1vtt2F3z9doeoUNPO7hyMQESvsLkWzjl3g8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742304159; c=relaxed/simple;
	bh=rGO8ljRJj2lTMiYab3pEL79ThIPqrqw2LC84J1Wlwas=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Kiry2ImLoQoEkE7GfitBNLxQ54TuKx5exkSihsMJMPIOyVFW53QXlDHKMHKI2jIOUulE1Q4gXFRqdtgrjVHwo1aHifU71E2ugEcTWchxCWzQ6Gf88We3lZEFcNIj9SUnx27gEj936InNBj/Od85QaMrpEqX1qLb86ot7bmBxx/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LqcDrKJW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52IAcp5g027513
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 13:22:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	L8yxRMa5j4oUptRKWHe6HWZoaMIYXuESwxb2I3uAvtU=; b=LqcDrKJWDWR39x5w
	dVWo3BD5DFu3bY8ZR9VASJLckV5qn4RXK3z4sIA1mJ06roz1cXizmhhClfLVj1+Q
	VdNGhjQ/zXoMEBHIqAc1PFZ23YULE9Cr3ztRPcy+82NQ31acR64XepBBwS2bFFVC
	QJc0dGbMmixU+54RDONmm81JCebs+8n75f3kQ0TKJOkvZoFa7rx4nkE14VSDSkRE
	gJGugN/R9k7ba61Km/ivRAUE7SavwcYjL8dnw2Ij4olj2Xn1rxit/cZ0muM6eIVr
	SOBodE/Lqyiv/nMFzA433N8szA1u8Ip3V3qbmIp8xKYlipCvltL8xhR67TpS7K/h
	yn0aVw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45exwtj1gu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 13:22:34 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4767816a48cso162889151cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 06:22:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742304140; x=1742908940;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L8yxRMa5j4oUptRKWHe6HWZoaMIYXuESwxb2I3uAvtU=;
        b=k0OaGORV28GamMkFAEmkufylzoIe6Y2QV8yuX2UuJq7pkd3fnMSrxb0ev2pbp9NwHj
         2VQWxy6rzOgxk516DtojcvIu2kqXNYjqJWCJeKI6d9+UTG1pfXRW08FL1/KwMVVtHjlA
         mby7gSeAwkgEhPgWUw18AdqYB1ZIeeNT1nFtdSYEQuf3llhF7oG/KXPzTkC1yJl7fTq2
         kQ/IMIkZe7szATBfERimoHdoTSoBBGbnvv1njvZMlRyct9XoIPJNw01HXqGRGwLcJ0/E
         p/2bIE6iUgdoE2zoli0a+zWx9Nn6xyMmZOprp7LXX0Q5M+FHR198j4V6NpLVh/hm6lhA
         Tkzw==
X-Gm-Message-State: AOJu0Yz2LRMB0l5sro7AE0wudnJaB2XioYHumx7KDuLb3+j6RqrVV4P1
	QoMqteRcQ4uIvEMpbdCnc438Sr0zckucn7smtmeD7e6FDNIcq5GVUTn/hVAsdOPjU/Jh8aMFztx
	gPgOggs5s+/3ED4VoQjtmKkcmkVFC2zC8TmX6N0XJz5TPWx37O7SZ0xWFqQxQ52uKtRMchKzDoE
	Loeg==
X-Gm-Gg: ASbGncua0FCHbHA+yOieALj7HmuwTP43f9ria1r5PHZkX6zVuSmLFiC3StaWKtQYGtH
	MrZu9pu0GsS1Aqx1q/6CGOEkOkbOWEt1dh3ibko7g0wipbGOnG7Hu+VoLcEjH4U98Ewk/WdGc9k
	5seTpVl3njyZVgs/CRlXy2LxhvFttgaMEmKCZU4QiyUuZYzikjvTy7OrcDrSrc0eyHcgSsORZ5/
	oJN0YnFEUH0PNrycEbPmb5+Jr5XbLsWcbAYeUBeNnRx0TN/2F9u98JKfzi5XYxLueUmua75KrZv
	tS6UiEqafqHVNynK+erteG2F9KiccWoRkz8Il67IOShN4E4cYexC7ZrbHDbHNCug4jhDA4WoRFG
	kADS8EliUst4yRCGVAbYU4RXm+uB6
X-Received: by 2002:ac8:5802:0:b0:476:7e72:3538 with SMTP id d75a77b69052e-476c81d8e94mr316429171cf.50.1742304140070;
        Tue, 18 Mar 2025 06:22:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEwyFkJjOgyoKomBt2wYBMfOH/z1hPsNpjFOhgy61zIEiVBQ6NRmiZvk/992/PdhTpr5TKEQQ==
X-Received: by 2002:ac8:5802:0:b0:476:7e72:3538 with SMTP id d75a77b69052e-476c81d8e94mr316428741cf.50.1742304139749;
        Tue, 18 Mar 2025 06:22:19 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549ba8a79c4sm1664831e87.226.2025.03.18.06.22.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 06:22:18 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 18 Mar 2025 15:22:02 +0200
Subject: [PATCH v2 09/10] ARM: dts: qcom: apq8064: use new compatible for
 SPS SIC device
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250318-fix-nexus-4-v2-9-bcedd1406790@oss.qualcomm.com>
References: <20250318-fix-nexus-4-v2-0-bcedd1406790@oss.qualcomm.com>
In-Reply-To: <20250318-fix-nexus-4-v2-0-bcedd1406790@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Lee Jones <lee@kernel.org>, Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Leo Yan <leo.yan@linux.dev>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=918;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=rGO8ljRJj2lTMiYab3pEL79ThIPqrqw2LC84J1Wlwas=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn2XN2VlgxbD3pLVZFmEWmBFECbSfg1LbnAQwzl
 9Crg6fK9pCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ9lzdgAKCRCLPIo+Aiko
 1QPGCACpysEPjxlYldEhFTaYVNzCM1Sc/vDP7O+jCuj3Hs3CN+4o0HMa4k9V/p38QfeW2BEmEcG
 KVmH1uIBVD0ss2Uwy/8iqXQc4dzUNB188/NwxH2Hs3u08DTqhf3GzbwXko7/g21D1pJkxlGEvCs
 G4SvhXRsBAcgzprYbN4GYTpmjFfATfjXT5U3xNQzvEQvsIFNBoFteNlP7Y8gzUx1xgpZKR6QNxM
 nQOLiBulGpduDFsPUDpB/nL5JoeSZs4qoXbW+jeeQG3FIDmki0o7XYO+jhYEZSmPzSTeARYxw0Y
 Yiz1ZcvjNRLgxItgEP/f8Vt83nPbP7PnEfcBnPbwYzMN6FfC
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: okllGpfrBcbnwL3cyedwrAXIUQl1e8KW
X-Proofpoint-ORIG-GUID: okllGpfrBcbnwL3cyedwrAXIUQl1e8KW
X-Authority-Analysis: v=2.4 cv=UoJjN/wB c=1 sm=1 tr=0 ts=67d9739a cx=c_pps a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=p_EMIZExALG5VSdhSekA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-18_06,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=585
 phishscore=0 adultscore=0 clxscore=1015 spamscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503180100

Use new SoC-specific compatible to the SPS SIC in addition to the
"syscon" compatible and rename the node to follow the purpose of it.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm/boot/dts/qcom/qcom-apq8064.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
index a5aad4f145dd368aabed44cf520ffc037018b37e..b6533630e347c8fc5e3f0791778cd05760b3f3c8 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
@@ -402,8 +402,8 @@ saw3_vreg: regulator {
 			};
 		};
 
-		sps_sic_non_secure: sps-sic-non-secure@12100000 {
-			compatible = "syscon";
+		sps_sic_non_secure: interrupt-controller@12100000 {
+			compatible = "qcom,apq8064-sps-sic", "syscon";
 			reg = <0x12100000 0x10000>;
 		};
 

-- 
2.39.5


