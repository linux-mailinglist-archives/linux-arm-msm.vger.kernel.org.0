Return-Path: <linux-arm-msm+bounces-77300-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A2376BDC874
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 06:42:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 489573BAAA3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 04:41:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D14BE2FF176;
	Wed, 15 Oct 2025 04:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hxs2r+8S"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F4872FF66C
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 04:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760503249; cv=none; b=cXH3MM12XqriUxLGDlCl0YKQUcvVhd64QfrStuoRhoG8UzIbKUSkNdglGdABz/ArpOWO/3IOpqF3zsGx50R0VyfdDLP9fiF4VuxdBY51+hm/UpeMmlhcZJCcleEf0sPiXCg1VULBmPDlPz5ckkmw5IXxWIEr52rukXijbXpV9Vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760503249; c=relaxed/simple;
	bh=q1pRzkuBh9GAg1JcwXGzO3FL3XRWgrlscAgQj90ENvE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tGivungA1x+uumJ5BBzcsRPWIAWkUR1IB9cuEQnxNcwct6CLHMkA0FtnkjMDfgn0WfNwC+4yS5FmShpItunpS1Wk67LbuPqhGdA0PglOJltJ7rePwccgraXNAGJONhjdCsaCm7JnCpBM4qRkTbsbFN/f9rne2BGEtnTzmKPNxLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hxs2r+8S; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59F2s9I3016687
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 04:40:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gBo9gZrkew51yYf4IHpWDN66o41yYqQF87bJGWuNb/k=; b=hxs2r+8SAYSKqgeT
	uAZNpqBlEcK6bBPzYZ5zcv8abNZFHrNMkkFFCSPx8K8IIyRARkIGLrTOPXAqDF/n
	qZp5bk41wfi2JAhOAerQ/gzaNeZKOMKe0+ao48SwoB8F0jVO8VGz2suDEWTaKeDP
	J83RV++aCKvWtMtJEjQgMIZcXWIZi7gOz8MkBDDA9j3XCIKlaf11bs8U3BZx49x7
	pN05oHm3WL4XOd+RN9kp3jgnEWfzcVTmVkCM8pRMt6XCy40+rjLbyh1LsBkT7xCn
	Ybb/QhPBDJIGuzlRTMgSDqZ9T2FUOMOYfSLD20UkNWEcVKsrZ3zH2EvD+AEnbMYL
	OI9xXw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49rtrt80e0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 04:40:46 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-33428befc08so21851926a91.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 21:40:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760503246; x=1761108046;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gBo9gZrkew51yYf4IHpWDN66o41yYqQF87bJGWuNb/k=;
        b=u6kcDbcLCW9T+HAHAY9dPGSOQmTxU2BHbh+OIP8oLWPB8oNBD5CjuBwKmTr0/qs20Z
         st33hC14cA4sd7cUrAOCHtkh0BnVIiO+hCQ31A+TsJPcxOZ/scBg/4vyomm3UExPrTYk
         i+l20TvawRu2UVSSx34uysveg7O+uzJsL+VMg6CLCLslPAusm0cMzCymgi15z0MVyMCt
         h7TtzMvxZ2q9dZOLib/vplID/+jXgh/+/mXOifp7CLOCIeUykjXH3s4qqvAzyTZc67R7
         XQUXMxSKKXEtcy5TCpRKoidrfMZtTtE0P2nKUuj6xTn7RVfB/uHtQe0PQlbC6ynYDhTp
         aNYQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+G0OqUXZ+JVPfWjd2YzdJQdsHuLr2KY2XM5MGKOKdp84W0KwpYYIOVVks07wNqT4NkUfmY1k5pozs9X+F@vger.kernel.org
X-Gm-Message-State: AOJu0Yzek1xLtA0MQd/fg1pxyWxmR+0FGGmT62G2/ijERa8dBLbrYH8s
	NKp3iL801I8obcFCqb9D/Y+sStMZzEjt4H/i9o9m/snLbHZF6/NYzGMuvNdRWzRYc7SGQ8If+1t
	9cZhWMQ20N0NIEMbbWNQoH89G+cPaBxg7JouxzZ7y0dks6R0cRuAfxqkTUsloAJX/jyjM
X-Gm-Gg: ASbGnctwUeJyZWUclNyGvcB3Je/WXwFycAUMSVeekpiwR3QbqNjHfYQPBVzCvxOizAF
	Nye0OWMzib85MO6E+yDzEAcbKWnCPUBV7w49M3WXgH/Jil6jnddYD2tI8E1NDlZ/d/PBICfJdMV
	HcSuzLOhHB6/vl70sGYBQiD4bhzviOPXoF3MnGQNbebky9TeSmdsM2u+dZtk7Vi8v0H7DDhqQkV
	dql7ix5FaLzvMKRPD9fDANtTkllky+/tf1ysNR1/JSMNbcuefuhs0DfyYwetmFiNAjxkIsLOv7R
	3lUZpVWOlc0qjckOY2P+cdvUYM48hgEAAtl0pPMA+jY3AF1DoXbWy97PIb0+YLTcxyQ0hKrGPdj
	X
X-Received: by 2002:a17:90b:1c88:b0:330:a454:c31a with SMTP id 98e67ed59e1d1-33b51386573mr36050554a91.32.1760503245581;
        Tue, 14 Oct 2025 21:40:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHl45T5gEGBYaChkWOQqwIOqGUS/zz2WbvtwiMkJgYFYDoxb2M6+A0u7nW/BBPu6hBROJZsvA==
X-Received: by 2002:a17:90b:1c88:b0:330:a454:c31a with SMTP id 98e67ed59e1d1-33b51386573mr36050499a91.32.1760503245015;
        Tue, 14 Oct 2025 21:40:45 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b9787af5asm705406a91.20.2025.10.14.21.40.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 21:40:44 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Wed, 15 Oct 2025 10:08:29 +0530
Subject: [PATCH v16 14/14] arm64: dts: qcom: qcs615-ride: Add PSCI
 SYSTEM_RESET2 types
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251015-arm-psci-system_reset2-vendor-reboots-v16-14-b98aedaa23ee@oss.qualcomm.com>
References: <20251015-arm-psci-system_reset2-vendor-reboots-v16-0-b98aedaa23ee@oss.qualcomm.com>
In-Reply-To: <20251015-arm-psci-system_reset2-vendor-reboots-v16-0-b98aedaa23ee@oss.qualcomm.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Yan <andy.yan@rock-chips.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, Vinod Koul <vkoul@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        John Stultz <john.stultz@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Andre Draszik <andre.draszik@linaro.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org,
        Elliot Berman <quic_eberman@quicinc.com>,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Song Xue <quic_songxue@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760503106; l=1528;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=st897fJ7jTPYQ5eppZ6+OrlCOSPDdAnpzJ0eoXTLNbM=;
 b=gWz6wC5KS4Z9D59qmU8+oPQ+ydpoZURhG6YTecv1VL1HdeQY4r8X5AuEshLZFDnnQNu2P7OnP
 ETCaaC08bcmCbxRY4EyrQJoana5MwZKnS0RbAX/G9ftaPPfaG17phQc
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-ORIG-GUID: VXEu2YXZGB4tX4n4gV9Z5arCEOwDpAiw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEzMDAyMiBTYWx0ZWRfXwj2kpYd9dCx4
 iCmoo7xuGp7E6JroWtSgfMvzrxbnpzTNfZPUpagPvfew+yeHvzdWbQijd5aLeEIrSZ3RYvgCSZ9
 hzmgHv2JreuLdWVs7sgz4rdDXuZzUnCyQ5CHS0ZQWs/uumCGOrGNygC+SQYpdjOWspX0xfIWb2Y
 eYC8pUXBeGNJpl/slPQ2eMUG8epO0ujx5o32VaM7RerToiLNKWH9Ok270IRJJkkV+KSBoRkdqD5
 TQ/Jqk3FY3aA+GdF75IBn6M4VqAOF51bismIDludfNRbcAPX96utsWVyAN4bpZIUGAmErPvxZHI
 0qn79nZxxtbrnMCiJ1gDsE78AXZJIww+rcHgQWfVHFVxDx8a2Pc4PXvS/Z12pMxckHy2ptsnsvB
 leiX26REFKQ0w17UMypRiz3Qj1mtAQ==
X-Authority-Analysis: v=2.4 cv=SfD6t/Ru c=1 sm=1 tr=0 ts=68ef25cf cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=pkXgoPqwvIc8jTsVjBcA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: VXEu2YXZGB4tX4n4gV9Z5arCEOwDpAiw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_01,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 phishscore=0 lowpriorityscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510130022

From: Song Xue <quic_songxue@quicinc.com>

Add support for SYSTEM_RESET2 vendor-specific resets in
qcs615-ride as reboot-modes.  Describe the resets:
"bootloader" will cause device to reboot and stop in the
bootloader's fastboot mode.  "edl" will cause device to reboot
into "emergency download mode", which permits loading images via
the Firehose protocol.

Signed-off-by: Song Xue <quic_songxue@quicinc.com>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs615-ride.dts | 7 +++++++
 arch/arm64/boot/dts/qcom/sm6150.dtsi     | 2 +-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
index 705ea71b07a10aea82b5789e8ab9f757683f678a..bfb504db43368fe73ff200476ff5220334872c8a 100644
--- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
@@ -343,6 +343,13 @@ &pon_resin {
 	status = "okay";
 };
 
+&psci {
+	reboot-mode {
+		mode-bootloader = <0x10001 0x2>;
+		mode-edl = <0 0x1>;
+	};
+};
+
 &qupv3_id_0 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/sm6150.dtsi b/arch/arm64/boot/dts/qcom/sm6150.dtsi
index 3d2a1cb02b628a5db7ca14bea784429be5a020f9..9df5e94069f604e5393350f5d8906097d6d01209 100644
--- a/arch/arm64/boot/dts/qcom/sm6150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6150.dtsi
@@ -416,7 +416,7 @@ opp-128000000 {
 		};
 	};
 
-	psci {
+	psci: psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
 

-- 
2.34.1


