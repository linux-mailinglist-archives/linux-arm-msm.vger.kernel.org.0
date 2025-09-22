Return-Path: <linux-arm-msm+bounces-74433-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 38A1FB917BF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Sep 2025 15:44:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D98F716D59A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Sep 2025 13:44:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61A7C283FE9;
	Mon, 22 Sep 2025 13:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OqFk9OyQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD09330E832
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Sep 2025 13:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758548545; cv=none; b=tzm3/mOPpKVPXlHgWsqxFLjinR2EFoTgx33YTWdXtML7aooSvzAcFKKqaDPDthZYLD2HKKcrrPUgYnpkXVA1hRj0uXJUscPeN/mZcY4yNhy7TuN+AkxXWaq4xNw/yHjybLj5/zKItgFmnsDiqqEW+pIcfGzqp98zJgpTA9kP9Ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758548545; c=relaxed/simple;
	bh=1jBpq+iZuKpAQm2NP3JS82veq+AIv0X5C7ExNAj56cU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=I71cz3BbmHKgpVcD0TpSXRxIsrPgJVSFWO2xeKy8cDJqgb11NRPD9fjFevLWfnyRCJHdsiUY+kZCiMYQ6bRFs6Zb92xAdAtImLyL38aEkCq7Kfr3rtT3hH3Q00P3tVJjRPzm4S+GmuKpYgY3+zyHZErLAyJEXpoR7ekCzGZ14n4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OqFk9OyQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58M8vYVh017365
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Sep 2025 13:42:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aaEbjaznfRKEBXAo6DFolWZjwipbscJpuOwEOXljFb8=; b=OqFk9OyQD0bojcrD
	6CGV3Hmzs4zqpcpHvCAhRiiLafSENQFuOxR+rV3JrKvWvMBzpauFacz9A1ZcXkSe
	qfknBiEnEzoc+4Uf40SCTH3QgfT1ytxDAuBiJaXIrzxlWpWVzEwVzfdf5J/A/86E
	I1jUbjUsuTbqAgDM+hFWa0r5+0cNwP+1IpFzNVqXfQyC2B9o/JLaRdLAhWaZ/v4+
	6SRAjGYgLuEh15shauDEKmNAdP87bvNxQvgIcEWLxks7+sWruwVpkcmyrugwg33L
	sHUgd6xxi2xv/S1WB3ZfY0y4aSND8+/uj6rUht5q6GGNI7AMAWkQaQas1bOQrV3x
	z83BRQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499k7sw1n5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Sep 2025 13:42:23 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b552f91033cso3173816a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Sep 2025 06:42:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758548542; x=1759153342;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aaEbjaznfRKEBXAo6DFolWZjwipbscJpuOwEOXljFb8=;
        b=hq9KVhTtlHNBbAHJ4/eYqe+oTZIpFu22/ubixAtZIMuJAleFDbgAMY6aS3B7x+rkGr
         GHOTFm6FB5IWmv7rDtUozdg4gxz8xAAR/pOYxxpgJVn6YKK7MwMTke8UagK1TckxFquP
         TEpCtIFw6uVpGAaw0NUikn+X6lELd8CRuzcEkNKoG7xuKStC3keIROyj4mO4j7VwicNB
         uy25hT2pC5SNrtlglQGXpZR2GnItJ4/P44GDwvAp9jmuxbhJUNNdIozHZ3ni4xfwl7sO
         mOPCh7LlL+Lak3/pqj8DVXeKJiqNYaS0IYgsGBh2fmYb9vxnywvrT6t9fi3R2Da6lipL
         W+Lg==
X-Forwarded-Encrypted: i=1; AJvYcCVuV4azmgmLSEzGdQH8i74Qngo6qd6NvcBzfjohlA3JxkkeVwxf+/sWA9/Qs+tiUkODYGeDr9G1yT2UJFAf@vger.kernel.org
X-Gm-Message-State: AOJu0Ywhqhoc3qo4CTAWPYZLHmbx4bYoRrfM5T1l0CmeLsMx839Mryus
	HgZOFpEwC/EMsUHWZfJ1IMbYcQfU1xngVu91b1ZiKwCtNwsjm59pooBkkB6+aJJDklypPEdzmpm
	+l/GiFuW89ioEsdLFFJRKkGu568rY75fgns8+qliXu40hzEntV/SLPj8bsI+QXWOs79Gu
X-Gm-Gg: ASbGncvHXA/KH39mHoaDbnB1CyzJatWBk5pGBd/FXeXx3FkVUM+E8tj3Q6mEe3rRfkI
	kqVMU4guss+MXm+1hpWFT1mGtw87oTvITNoF1SY5uZOaLLl43F+o7oyAR3KCvs42+9qjWxDRAKm
	dl9WGCYNj45tscmFciYBcTECa20PwFdfYZmFaqGUjt/jdZLJe4zLCbrwvHlljTcz7fl1TEPQMiE
	ltmh536mS7RPMSc932ET1lDZdbiG17Sg4ZMk5fRPrAUU7TSfR/Y+PV52iOjRYCdkuqCvSuuk6Sc
	K+zfGjn6ExlxRgkw2Knt4hxY/blj9ubJ2rxb/KXbFuZ7ODhk+m48QWEeR4bWsD4m48KSe3kdNhD
	6
X-Received: by 2002:a17:903:40c5:b0:24c:cb60:f6f0 with SMTP id d9443c01a7336-269ba5892b3mr158901335ad.58.1758548542357;
        Mon, 22 Sep 2025 06:42:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGYaq8oly26Ao9AwkHXBiB7SkRKPK/ArZ104vPbq6lanvIWpYVCmWpjrPeli8srR+MQ0I6aZg==
X-Received: by 2002:a17:903:40c5:b0:24c:cb60:f6f0 with SMTP id d9443c01a7336-269ba5892b3mr158900825ad.58.1758548541893;
        Mon, 22 Sep 2025 06:42:21 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2698016c13asm134246755ad.46.2025.09.22.06.42.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 06:42:20 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Mon, 22 Sep 2025 19:10:21 +0530
Subject: [PATCH v15 11/14] arm64: dts: qcom: lemans-evk: Add PSCI
 SYSTEM_RESET2 types
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250922-arm-psci-system_reset2-vendor-reboots-v15-11-7ce3a08878f1@oss.qualcomm.com>
References: <20250922-arm-psci-system_reset2-vendor-reboots-v15-0-7ce3a08878f1@oss.qualcomm.com>
In-Reply-To: <20250922-arm-psci-system_reset2-vendor-reboots-v15-0-7ce3a08878f1@oss.qualcomm.com>
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
        Srinivas Kandagatla <srini@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758548419; l=994;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=1jBpq+iZuKpAQm2NP3JS82veq+AIv0X5C7ExNAj56cU=;
 b=mqVVIESE4qG7LRS83vpCr3o4bWFn4SxgH4lxwuXGeOaww6B7yxmQGhmpCOj8eRJuKPkyfTyrK
 /NYlyvyI69bBCqQIJAx+wnZ+vdGIO/1FYRx9IKisQTRrT+MovMwe/xf
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAxOCBTYWx0ZWRfXygXOCXg8gGSI
 VX3D7jPO0zvO6RX1ELwRSW7hmik53V0trrVZgzEuxrOpz16gKA37lTcW9stz8b5KhobaKEMlXWe
 XPFWjRpFAkxXPfKykxu7BY+wvLu6kwpho3AVecgcknqVUfNKaMSvDpT8rJQAfxSZv7YFnUFMuy0
 WSU0dwaZonUqXDjNDv3bsqDiebkB6z4GCaY1qatMdM4E49SxbxgQPV4gloGSIQOT9XzsKDGBKrx
 5SQ+ufjN+0u6OUW0CWr60tM6PXIeR1eKWy5oORQiybv7GENB5/09ICxCyHYblvby0FmuZ73N5SO
 9bR7f1sJe9LReT0jISdcDe+7nPQghROyOUmn08u73JbVydxYummx5Wij3/dy1YgRlSM69Uoxbpp
 /ols3Hyq
X-Proofpoint-ORIG-GUID: WUXHeCAI8zL5duNrFD2vjaEJLQCdr_AQ
X-Authority-Analysis: v=2.4 cv=bvpMBFai c=1 sm=1 tr=0 ts=68d1523f cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=JGo1Z14By4IpQyqbhUIA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: WUXHeCAI8zL5duNrFD2vjaEJLQCdr_AQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-22_01,2025-09-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 impostorscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200018

Add support for SYSTEM_RESET2 vendor-specific resets in
lemans-evk as reboot-modes.  Describe the resets:
"bootloader" will cause device to reboot and stop in the
bootloader's fastboot mode.  "edl" will cause device to reboot
into "emergency download mode", which permits loading images via
the Firehose protocol.

Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-evk.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
index c7dc9b8f445787a87ba4869bb426f70f14c1dc9f..09460441888a7011ff613c4fe9fa4b6872e12172 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
@@ -587,6 +587,13 @@ &pcie1_phy {
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

-- 
2.34.1


