Return-Path: <linux-arm-msm+bounces-74337-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C1A24B8D665
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Sep 2025 09:14:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AEC792A0220
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Sep 2025 07:14:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C605E2D94B7;
	Sun, 21 Sep 2025 07:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fkrkJs6F"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 178F72D8776
	for <linux-arm-msm@vger.kernel.org>; Sun, 21 Sep 2025 07:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758438715; cv=none; b=JDSE0RXnBjhHfLh2V8rkoEbh+NMe5LEakSdyWJGekvMnJAVqLoRhV+uhq9rLMzMLx3q/QLb7CWmdEqN3ODuqZY90lmRIhjrgLtl0slAnkWTXa1l1wi3M5Hm/U+X7twHN+dQF2WzxnPSN0JHWvkYMvgZcJwJI3AwnKV65WRxmMxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758438715; c=relaxed/simple;
	bh=/QHwbDoTi5wW6cdd1I+mhx3Q59Y4Fm5DvGoBCJEJzFg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kLBCSDyGiIZGn3QFy1WkBzEkQgbdirZY4CPJYzZU347n7kLKuSZNeAx9kK+ORtppLpgfPN7q/Dwd4C5ABmeG8GzjEaZV2KogqXhkKN88Fa996u9zQcT561ISLr4vt2NmAu+VBmFow5TbyN7IUUXom1YLLsSBx7n3rr2mhHu81zU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fkrkJs6F; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58L1xb4v004365
	for <linux-arm-msm@vger.kernel.org>; Sun, 21 Sep 2025 07:11:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WNO6qfEc+6PKUrnB6XpQmcLQEeyRjf+SgntraIaohbY=; b=fkrkJs6F6jxKajPW
	IZNJOhPskt66i3yoTbgZCfdkAYvS+E25sKWN/kw7NgswOJ3FWqx0GULNxal8THVi
	QRHkWkSkioc+PsjEMeD8iV2Kce6wpcDuND4aTLMavArEBYbkD8natEdXRi60qW33
	4G6KZufANhUmqSDQCYzuuQk70rvXYB9HcqnSbE6WXwMJKJA31b+Y6vJzT/34URhx
	E+sV4aUAdypdDasrxU5Zx8dN9OtfWZ1+5mRnlNKWcv7SFPpQXnN3ZEB3PvzWbmj5
	f0siRzR3SgxMKCDmgDOClhix/YlqW/Lgyij4eAYNAgdeGyPH8lkcOe0fveZRdjxH
	DH99Eg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499hyej2g0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 21 Sep 2025 07:11:53 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b5f31ef7dfso79778971cf.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 Sep 2025 00:11:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758438712; x=1759043512;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WNO6qfEc+6PKUrnB6XpQmcLQEeyRjf+SgntraIaohbY=;
        b=mncelUq4jzSBltW8HvrifsTCO581bBtvUV/RSwg/XqOJ//PUHQ3USWVecz3IBgDtjh
         9NsoMFyeG7PXCl8ASCnSJVKZPu5nrhLMdKC3NAXLuAaa969YOLyEM5mGSRAJygwEw3Mq
         kW6oS9mlufdr4KP6xsW22rU2n7la+BJX5DL4AyV1mJvXMccNcOCBGQsiobGmc4EmZYyG
         75c6ckyserYc3hlMMOk4RXcyhnrf9BOsH2PX4bvPY2tahyReDo5QqzzdYZSVgMK81DwE
         /MEDm9plzhS00Na/CMamNX8fSzybO/q5hiB1RTss2DLp4RFpCOX+kKaw5pf9kRFIFbMS
         0Ldg==
X-Gm-Message-State: AOJu0YxkcwTWnh/lthkHBOGFojDQTt0DwePCJARDRoEEWXilNnrZPpif
	jR/OD0d9dujnUBjEYeEhuS0EbdKpINjpQYjzH5XtCrIl+RYIx2T1Tp/Cp2zKCJF8C3CsUPMKPZ9
	uZS0TYFWlGMiTkt6VrU9lHXBeyH0myAvhBP3W9//CTgvtx5C4zhiYzp7I6q/QwiuEQXo5
X-Gm-Gg: ASbGncuKlQ1+sEvWGMZVrFv5MHa1QAo7eg/cflKJk6xtVNR7Qqz11b8blxK8eSsHL5e
	6K9psEdmRaRNQFjHHORMBI8VSa32Yf79RIG/QzNDTjNNT3hBUTQFCuH2jVm3Wstt+EFS6wCG0ol
	f7L2EDD1T/1XTQU1q+trjnliCYg0++hG/DruC9CbK6ae+5+Z6EuEzbcJ+BI+BYlmmDfSWdE+EIO
	yzUTKBL1X3lXjZ9tS1UYf5fDuFyjexujmgPwF7oZjpjQfUUXFJKecvWEmX8InHmv8t/AHmnCayr
	rTul9ApcEIYc0XT2SfYBosSFwTlf+ntL/B9tjh6CNxN6s3vOov0e/B3vunGiyL0b1ohJ1bF4Qpp
	Me1tbCrzmf4hwVUegn7udejnv3X+yAn1Gchtb5bowutOs8E+I4xYi
X-Received: by 2002:ac8:7c56:0:b0:4b5:de5c:deac with SMTP id d75a77b69052e-4bdab6283f3mr147616131cf.18.1758438712028;
        Sun, 21 Sep 2025 00:11:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFDRWhpZlkfIwmMTkXvlHvgomXfFSoTuICFZX7PRpCn5+cU1Hhoq6TgWscPQw2LAa9lar65Uw==
X-Received: by 2002:ac8:7c56:0:b0:4b5:de5c:deac with SMTP id d75a77b69052e-4bdab6283f3mr147615941cf.18.1758438711578;
        Sun, 21 Sep 2025 00:11:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-57e06875c2csm144031e87.4.2025.09.21.00.11.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Sep 2025 00:11:50 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 21 Sep 2025 10:09:28 +0300
Subject: [PATCH 12/14] arm64: dts: qcom: qcs8300: add refgen regulator
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250921-refgen-v1-12-9d93e64133ea@oss.qualcomm.com>
References: <20250921-refgen-v1-0-9d93e64133ea@oss.qualcomm.com>
In-Reply-To: <20250921-refgen-v1-0-9d93e64133ea@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=925;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=/QHwbDoTi5wW6cdd1I+mhx3Q59Y4Fm5DvGoBCJEJzFg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoz6Ui3l27NWtQ9pqIE7bGtey4+lPJSOgpajN9q
 Ghkdxn3tyKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaM+lIgAKCRCLPIo+Aiko
 1Rb/B/9Ub6EVmRH1d2TRiBg2TcjeDzyJfTFqPKbMy0Enit8BvwfH7I/AktW3AOI7NETg42OO6hb
 WRJVVfhvHZbk/Lc+CMTME+oFukmf1+aH8i3RAqqcVognCiLqxIov5GY+ShzVqx8o6aQpbXSlWt0
 g/bOV5BdKURuHAY2yzRevgtSEab8xV+4z0RPMLTMAogq6eF2atY0FpNSewUgOaNfyU0NFBjlgMK
 KYMQOj/bUmXCyvWdxa7mbA4OEnN8T2oRK5esaOYWU1b/DnrvlG3mHEnz1hhzmAqz+lsKjOqOtOB
 6gvhvfjZK0UXYF+hQuHIuOsl5tqIlCybGijI3FxXkiHEqdZM
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: OyHYcoM9fgaQxKK58c5yGw8_6-URyQ1j
X-Authority-Analysis: v=2.4 cv=YMOfyQGx c=1 sm=1 tr=0 ts=68cfa539 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=_aY1h3XTHFwvbdx92S8A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAwNCBTYWx0ZWRfX9JQu6dKKaGSq
 aq4w5zb7f8T9rFKvhtIWxi1DvxA19t0FQvaA7285XXEwhum1v8guZb0gPz3mvUtETyM7hx44yil
 IxLl4YSWgDVv/hAgzvtxSR13CUxkdaMeuz8j1An1ycpUaYeMoOHqx9SyNMMZXsmsZ0K+evKuAgL
 7mRVjN5lli9d4m8Rf7y8eqFrM6lL6ShEw07IIVFbpEnz6/HhGOntVSog64b4sc1gydlOdEa3rsk
 wPAU3EIeihDI95YLAn6k1o0fKiF2iYe7EaJ/4dwUo4wqdmYnM25lAlQOB8za+QxabDwmiqL6vhQ
 bi914u1FqaUseWhEFVGEl4d1th9mVd/YY0X9/3CxFebXNdS8G0uvM3vzef137IMx+MEKcei5bvh
 NRrBk1/k
X-Proofpoint-ORIG-GUID: OyHYcoM9fgaQxKK58c5yGw8_6-URyQ1j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-21_02,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 suspectscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200004

Add the refgen regulator block. It should be used for DSI controllers
once they are added.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs8300.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs8300.dtsi b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
index 8d78ccac411e495592a6ff532c99e7aba087d18c..1bcbac852c8aee6b7a68f5f90eac6831e67d8caf 100644
--- a/arch/arm64/boot/dts/qcom/qcs8300.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
@@ -4294,6 +4294,12 @@ serdes0: phy@8909000 {
 			status = "disabled";
 		};
 
+		refgen: regulator@891c000 {
+			compatible = "qcom,qcs8300-refgen-regulator",
+				     "qcom,sm8250-refgen-regulator";
+			reg = <0x0 0x0891c000 0x0 0x84>;
+		};
+
 		gpu: gpu@3d00000 {
 			compatible = "qcom,adreno-623.0", "qcom,adreno";
 			reg = <0x0 0x03d00000 0x0 0x40000>,

-- 
2.47.3


