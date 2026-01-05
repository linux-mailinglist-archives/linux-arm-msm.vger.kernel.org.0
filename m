Return-Path: <linux-arm-msm+bounces-87446-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DDCB6CF3CBD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 05 Jan 2026 14:28:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 916A630BB264
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jan 2026 13:24:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8417B33E352;
	Mon,  5 Jan 2026 13:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HzM9zAqy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CvRebB7j"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ABE933E36C
	for <linux-arm-msm@vger.kernel.org>; Mon,  5 Jan 2026 13:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767619454; cv=none; b=OdhZsdSRWfmZxq/1yUV3H+wEHWzHE5gKT5GxfybKek2SSEmnVq6yqUwHcb74kq8a1tqcEa1g8gSfdiXTXmgGik9wlGe0trbybdi7zvEsF3OEOOO/FlwOqWu6HipPQAS0D6LaWn4Tfyv6OawpznhlcOsJMJkxDgB2PN2Zdv2Jz0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767619454; c=relaxed/simple;
	bh=hVruzQlgdHdjQ5OuxF50jHVIPoW3+xPAjhmK2sqqKSU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RLTJOEJ7B26ERt4PRLkCcigavqNtqzK/B4S0QEK4L0DqwRECp331B/PFz3Q/iIK00MNTg8MMDhgmK/ZCQSptx9SZLpKx65S3s+D2m8jeBwct3qXuR1GYW++Xh8DFnCHN5DVmM9uwfqaWiDX/3xbAS9phN70pjcthBBfGqg6B4cQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HzM9zAqy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CvRebB7j; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 605A6DYY3541659
	for <linux-arm-msm@vger.kernel.org>; Mon, 5 Jan 2026 13:24:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UA93deZRnndDjRzALR0KX/sfEJyUyvlslIGZIsSaPvI=; b=HzM9zAqyZ/cFSRNm
	XmIsbzBjesB1mJ7Yqx3/bXd1Hd2ZCMJ2ptV5Fnp7AujiJ7I8VEvnEP06p8BBnDw5
	wsqcyWN2EAB6g3+2W9xBjoI5SjN4trPtZuXKmytYd6Ho7NBR2E2xdxQSTS+1sN/u
	hQaKQ5E9/9GeO72ndnbtpy0VPVxn99MJ+tz6GCZ77LbvoU4PJSyRGNTdMa3ZROS8
	nOVOVy74X0JTq5di6C2F97Z2uwIfHBs/9VWWssX18SoaDAZRv/qLzDjbZ/2cQ/p2
	9P4xcSj+3jj5/TRx3xR9b9iZe+K4NNv8rpRhxR5IeuuulpRUZV6HSslMNlurBx0I
	P5HaSg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bg57shkha-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 05 Jan 2026 13:24:11 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-815f9dc8f43so2343911b3a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Jan 2026 05:24:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767619451; x=1768224251; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UA93deZRnndDjRzALR0KX/sfEJyUyvlslIGZIsSaPvI=;
        b=CvRebB7jWBGdf6Gp685VYGTNB9GQTa+wYDhU1vRI6z1REHekGfmqA998vdSPHDKeFt
         QQ9cnM8UachquK7wMMIYyAzgMDUDNdtLcxY3vwZ6005TWEfBepU4vTf7cF2EnlvsYo6Y
         Z7gTiS4BMVl7QJaCE4rhVxwujyaaQDoUIra03K1N6WVlskQZAKKe6NSCthSd1jKQuqys
         5tNfE8k4vcUZUM5rMCA7L55KSRROJQGJ96JChextRZzQsAOaaSAEoGtbeVcN2PHRXiUl
         V4YmEr177is9oEtdSy964c8t6exobLhrytuYbi4cYZpbv9J1jtOMglUmqOGoZ9r+JEbK
         OU4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767619451; x=1768224251;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UA93deZRnndDjRzALR0KX/sfEJyUyvlslIGZIsSaPvI=;
        b=BofkCBUbfjR0Eqz0W5ncmtZlRA+dLzl9y5/PbD07n+P8/lXtAkDSNN8Ts9mCiEblpn
         3ff3WDT4tXk43ar4x+h3UUtombeecIysloSuwE6zIrv43MSDxZJ/8FWJZqo6VE2rJ7J+
         InJELG/1r1Z78dYKi9NXkuS+yyMd7CttO40ju1HFj4UkjOiTjHsGmVtIENJ1/Ew2/q/0
         xV+Hn1xJm6UZ8dPq5zPpwiINcQ16eRLKKDhxtTXWJbgRSfzymKkdF4d+vK8sp6gD5pcU
         jhdUGEsoOoOszBFNHmhRs9j9Lb3YVhO4clk+g/Tvj6K/1GFsvyM73rFnR8e4MsckfRno
         Q2Jw==
X-Gm-Message-State: AOJu0YziTq9q2c+KxBmP60o9Z4OX7kaVA4J2cjRVIdUjze2Tl7+srR8y
	mgekTNIELdJGuO1NYLUZaEm3rF3zWz4Y5KASIJA7sMBNn6yLG2/KtHIPvAw00DlyOIcnCGH2gae
	q8dsnzeEE7TghQgF0RHkuB95uAf3A643LBAASYJEFya5FZQEg4YPWfc/qiRrySRYQE7rX
X-Gm-Gg: AY/fxX6yHxu22tv79YHz2JEM4lMQl+8fnuRHTkVl7orX/k/QVUxl6LP6bsXCwFRmXth
	QHOremVCzCuWbIUdGqSeDcCSHHC6oaTk/BCSs6qlKht2zKdSscxhOHAXyT/Nc5BdRRyeAfIrod0
	QcZQ7gUyEzy3Vy5vQagC+cSmsu7OfOCwiX6ue/aKimMZSAA/kJWuOfLbHKdozETWIo1j+H5gdha
	1jwHcZ10z3BShvxx8gYrT85BIjNrpTNTPAyJnX4luw6NNz5fkzTx0Aols6JYCdItGOe7uK2EWG1
	wxZqiwqHfjfDt+gwxZVW3sjG1vZyysuz33+Qh6gqQKICe35ZK254U2KoS7/3a3PSxsTGTLkLTFl
	UJqO/VyFppa9aNYWoFRV/t3HQQYpvFi2Jfamv
X-Received: by 2002:a05:6a00:9156:b0:7ff:8346:7357 with SMTP id d2e1a72fcca58-7ff834675d7mr36204594b3a.0.1767619450803;
        Mon, 05 Jan 2026 05:24:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE9JExeJ05vZzubae1xybrU3aOxwYJajTf1lt/sbnoAiVpbIVrbU8FxGMaTuoyMc7l6x46k1A==
X-Received: by 2002:a05:6a00:9156:b0:7ff:8346:7357 with SMTP id d2e1a72fcca58-7ff834675d7mr36204574b3a.0.1767619450240;
        Mon, 05 Jan 2026 05:24:10 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7b127b00sm48426542b3a.21.2026.01.05.05.24.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 05:24:09 -0800 (PST)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Mon, 05 Jan 2026 18:53:02 +0530
Subject: [PATCH v10 14/14] arm64: dts: qcom: Add EL2 overlay for Lemans
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260105-kvmrprocv10-v10-14-022e96815380@oss.qualcomm.com>
References: <20260105-kvmrprocv10-v10-0-022e96815380@oss.qualcomm.com>
In-Reply-To: <20260105-kvmrprocv10-v10-0-022e96815380@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
X-Mailer: b4 0.14-dev-f7c49
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767619390; l=3099;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=hVruzQlgdHdjQ5OuxF50jHVIPoW3+xPAjhmK2sqqKSU=;
 b=eT8U2rJZOrf7bF5JddHHgc+6KF0cAGVdravLhiOm++r+7EL9qtiGTDVrHvjTrUCXQgjyFnp4n
 gG4r1kccBZmCrjKjbSxDtmo5cLV/The9uP39atLdTGYQuHZUi4g3cPA
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Authority-Analysis: v=2.4 cv=UJ/Q3Sfy c=1 sm=1 tr=0 ts=695bbb7b cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=OUqdy03oI2q1KQI58CwA:9
 a=QEXdDO2ut3YA:10 a=eSe6kog-UzkA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDExNyBTYWx0ZWRfX44cSxVVXs5Pv
 iNqOxSrDr+WC/GIdlRjLdk7niJU08pGfnwm7QC1U6e6evmOu9/oky3kqmsKv3sv8F+TROxNpT4P
 ycEvBDEYJNI+uf1Aw+7UBk5zqPjN3v/nuBVgdHFNRNCPsPiOnZjkrk9N+lcdqT1xIehbXwhZ72r
 fVcachPNoUFQE8kRcSbwvUOagmW++fum53+tscCGuovAqHhb5ZIoDXhHLWRh55PtyXuwR82M3HU
 D9bU9sq66XFneF0go7oO4rBpaLgX3VCLyeMWW5t/2BGU4yWyKSWwOlP9UumSLS7W7JqAVBthlez
 Rf7Xj7n9DSsp1OBbf44h5BhzQvufSw6SL22dlLPH6rVjK58YBsgVmASI6H626So3gJ80E75Lh9v
 dNunfoh2xGgkznQ1WiFz+TumpO4OWiFcRvF51cOkjn6GKcgvkTI5/uTsQcuU7AAL7yfnSPT10Md
 Ebm59yYgcPsKjVYT7qw==
X-Proofpoint-ORIG-GUID: PxQmd6x2ESV3fZENbjfi_IkJaCWhVpe7
X-Proofpoint-GUID: PxQmd6x2ESV3fZENbjfi_IkJaCWhVpe7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 spamscore=0 bulkscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601050117

All the Lemans IOT variants boards are using Gunyah hypervisor which
means that, so far, Linux-based OS could only boot in EL1 on those
devices.  However, it is possible for us to boot Linux at EL2 on these
devices [1].

When running under Gunyah, the remote processor firmware IOMMU streams
are controlled by Gunyah. However, without Gunyah, the IOMMU is managed
by the consumer of this DeviceTree. Therefore, describe the firmware
streams for each remote processor.

Add a EL2-specific DT overlay and apply it to Lemans IOT variant
devices to create -el2.dtb for each of them alongside "normal" dtb.

[1]
https://docs.qualcomm.com/bundle/publicresource/topics/80-70020-4/boot-developer-touchpoints.html#uefi

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile        | 10 +++++++++
 arch/arm64/boot/dts/qcom/lemans-el2.dtso | 35 ++++++++++++++++++++++++++++++++
 2 files changed, 45 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 565e9b317a37..f9a2cfab5a8f 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -39,6 +39,10 @@ lemans-evk-camera-dtbs	:= lemans-evk.dtb lemans-evk-camera.dtbo
 
 dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk-camera-csi1-imx577.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk-camera.dtb
+
+lemans-evk-el2-dtbs := lemans-evk.dtb lemans-el2.dtbo
+
+dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk-el2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= monaco-evk.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8216-samsung-fortuna3g.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-acer-a1-724.dtb
@@ -144,6 +148,12 @@ dtb-$(CONFIG_ARCH_QCOM)	+= qcs8300-ride.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs8550-aim300-aiot.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride-r3.dtb
+
+qcs9100-ride-el2-dtbs := qcs9100-ride.dtb lemans-el2.dtbo
+qcs9100-ride-r3-el2-dtbs := qcs9100-ride-r3.dtb lemans-el2.dtbo
+
+dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride-el2.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride-r3-el2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qdu1000-idp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qrb2210-rb1.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qrb4210-rb2.dtb
diff --git a/arch/arm64/boot/dts/qcom/lemans-el2.dtso b/arch/arm64/boot/dts/qcom/lemans-el2.dtso
new file mode 100644
index 000000000000..ed615dce6c78
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/lemans-el2.dtso
@@ -0,0 +1,35 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/*
+ * Lemans specific modifications required to boot in EL2.
+ */
+
+/dts-v1/;
+/plugin/;
+
+&iris {
+	status = "disabled";
+};
+
+&remoteproc_adsp {
+	iommus = <&apps_smmu 0x3000 0x0>;
+};
+
+&remoteproc_cdsp0 {
+	iommus = <&apps_smmu 0x21c0 0x0400>;
+};
+
+&remoteproc_cdsp1 {
+	iommus = <&apps_smmu 0x29c0 0x0400>;
+};
+
+&remoteproc_gpdsp0 {
+       iommus = <&apps_smmu 0x38a0 0x0>;
+};
+
+&remoteproc_gpdsp1 {
+       iommus = <&apps_smmu 0x38c0 0x0>;
+};

-- 
2.50.1


