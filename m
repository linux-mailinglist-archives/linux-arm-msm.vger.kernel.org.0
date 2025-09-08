Return-Path: <linux-arm-msm+bounces-72554-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2201DB48A69
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 12:42:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 45FCB3C565C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 10:42:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 215AC2FD7C8;
	Mon,  8 Sep 2025 10:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="PJrcDL2q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83DF22FB98A;
	Mon,  8 Sep 2025 10:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757328096; cv=none; b=KAMEQV9D5gvDe01qvky5IgjLhYfiXYvTms/xIkTStfUjEDLB5O0ILpb/GivZnIb43NsYqmWe7OduGBmTbBD68/UYJdUH4lBLUD5+7i4azi506t1U7NpNvBPQ9fGUjnNWQEIk+tLYC2XEbRZ6aFromWCGqZg+VYLqBxz/BIKIvyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757328096; c=relaxed/simple;
	bh=n37k02mn7bPQP7PANpV1lLKMpq4zNqjUT50z3+gM40s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gETYKgsCSlfrMAVKA3zmt5+Owiqcve++X0cWbkr2Osq8NBo4LRI6Ij7PIs0sXtT6JCVF+D2ZqKxvOIFZm2v+Z/gQNZ/s81ovRl5E3YWBdBU5uPPAlKskFlTYc9gg/LXk0tMx6/l2vGpTgH0a9MMbfF9daAybS94zNTJpF8FfWus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=PJrcDL2q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 588915GG014127;
	Mon, 8 Sep 2025 10:41:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=iBjxeWvAjAp
	E7aIj6/oJL+rBWTiwT1U/SGuSGTnVP8k=; b=PJrcDL2q1mYVpgfD8zOz6/ZEAL4
	tbw/KAqHq333dxrVKZC3XsseCXg6vwAUAJtaWnAnSoZ0JCOgRvkxyXp7wOWGxEGv
	rzA+GuqaWJ6GYKg9TNiuwfWRXzE3uFuJ8eh4uInHObJiuohc6EdL/mG0J5rR2Yrq
	EdX3heqZ8BlCMHsyaWgC9TSRo/hD7tWCGb90rynLskGY5vRe4xeOMf5zZT4PMAhr
	fX+Lk2YkVN131mq10JFbzbd5Qpbd9ukddWkopY1O7NAKGdg+dbxaFJ3wTr9V8Fsb
	6+QM9EB00wwmRXUBVthofXFwxds/LHQm66Rxc8C1FD0wbkHi2kPv2H2Ck4g==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490bws4dpr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Sep 2025 10:41:30 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 588AfSUJ011988;
	Mon, 8 Sep 2025 10:41:28 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 490e1kh0pq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Sep 2025 10:41:28 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 588AfRHq011981;
	Mon, 8 Sep 2025 10:41:27 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-sartgarg-hyd.qualcomm.com [10.147.242.251])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 588AfR1j011980
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Sep 2025 10:41:27 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 2339771)
	id AA8655C9; Mon,  8 Sep 2025 16:11:26 +0530 (+0530)
From: Sarthak Garg <quic_sartgarg@quicinc.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        quic_nguyenb@quicinc.com, quic_rampraka@quicinc.com,
        quic_pragalla@quicinc.com, quic_sayalil@quicinc.com,
        quic_nitirawa@quicinc.com, quic_bhaskarv@quicinc.com,
        kernel@oss.qualcomm.com, Sarthak Garg <quic_sartgarg@quicinc.com>
Subject: [PATCH V6 4/4] arm64: dts: qcom: sm8550: Limit max SD HS mode frequency by default
Date: Mon,  8 Sep 2025 16:11:22 +0530
Message-Id: <20250908104122.2062653-5-quic_sartgarg@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250908104122.2062653-1-quic_sartgarg@quicinc.com>
References: <20250908104122.2062653-1-quic_sartgarg@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: vkxSwZXmKg0HvN-mCKZ6pq06Lse7xra6
X-Proofpoint-GUID: vkxSwZXmKg0HvN-mCKZ6pq06Lse7xra6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAxOCBTYWx0ZWRfX7VJaxySX45/j
 IoxT0irY6V6Pm0UWM85jC56fP4EvZwMu9gEjrUdXkEL76Vk8eSKwxnY19gpX6xak1cc3ZAKM2Hp
 qbV5LGkkzOd1MR1EJdgGlQCwtK7uTeRblchPXRmATEdrsvvNUEhL/6NpXD0b+Lh4VMOrc4fqP7C
 MPYWRpuyVzSnIRLUhCbjymWvRx+wCrRwmPRg9h5EwQySgyoSI1x/oQZK5/Y4w96h/3RaKaOr3P9
 HNQVIrpfAU0gTPp/SrGJEpPbHILmWwcSJfIqS7x9Y2EyvNXRZjaY6ha2iYxWRxAUoPICeyv78Uc
 jgc2QhpHIntC1jLE7jfHJrrAxnrBMJPVettJj3ixjnGmHvRomDI8/GXUz/OPJUKH28JlPR6ZhSc
 pHfGJDtl
X-Authority-Analysis: v=2.4 cv=G4kcE8k5 c=1 sm=1 tr=0 ts=68beb2db cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=gsFUoJjdds26VcGjwbYA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_04,2025-09-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 adultscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060018

Due to an implementation detail in this SoC, additional passive
electrical components are required to achieve the maximum rated speed
of the SD controller when paired with a High-Speed SD Card. Without
them, the clock frequency must be limited to 37.5 MHz for link stability.

Because the reference design does not contain these components, most
(derivative) boards do not have them either. To accommodate for that,
apply the frequency limit by default and delegate lifting it to the
odd boards that do contain the necessary onboard hardware.

Signed-off-by: Sarthak Garg <quic_sartgarg@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index 82cabf777cd2..3692a3a49634 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -3189,6 +3189,7 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 					 &config_noc SLAVE_SDCC_2 QCOM_ICC_TAG_ACTIVE_ONLY>;
 			interconnect-names = "sdhc-ddr", "cpu-sdhc";
 			bus-width = <4>;
+			max-sd-hs-hz = <37500000>;
 			dma-coherent;
 
 			/* Forbid SDR104/SDR50 - broken hw! */
-- 
2.34.1


