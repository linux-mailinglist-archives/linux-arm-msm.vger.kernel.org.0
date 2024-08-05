Return-Path: <linux-arm-msm+bounces-27939-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A314947FFC
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Aug 2024 19:08:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8D35F1C2152C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Aug 2024 17:08:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E444A15FA74;
	Mon,  5 Aug 2024 17:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="MRTo3DYf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2177F15EFB9
	for <linux-arm-msm@vger.kernel.org>; Mon,  5 Aug 2024 17:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722877701; cv=none; b=XUuDYzHVYR79L9vxbTWlwlohdMkObK2vr2IfPJHgRZg+5NdDgRjpgArhi/Z9iSyFDyltxPYp5/nT6Vdrfgxz1knIDWfvsbYGVM2vP3lsG3oOI+ex79ItVUlJAfDPyckrlUnnzOd9E35suPzneG3QEnmqg8NMFSY9UjWO13LfF80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722877701; c=relaxed/simple;
	bh=zkyHCANAfQl+HZA9ITq+SlMIlYs6YGHJTXZs1COJCP0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Zkm/6+tdWE1P5dfcQKRsErUhu4QYerdUd3ovMN/gXa+cnHC8NNmy1tcvE6Q5/Aj/HfvMa1QsGsALHkCc2mC7vn0oSKsVUQctPAYJP8LyYoc02bwrz93YBtJDXhoB+9nBJlSPjcC0UyGZyvRcDNJJe1eqSRHP0ivpjWp7nkyPvAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=MRTo3DYf; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4257d5fc9b7so98081725e9.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Aug 2024 10:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1722877698; x=1723482498; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a8qXi0AmLbuERLsyqttkRIlZ8eb7lceW7IwVCJnKdis=;
        b=MRTo3DYfghELWCvOdZIDBqskGlcmX/OwoJxQMHt6bDnhlIZL5dukcFsLgRpHEKlTRD
         /Ke953qJhX0HrRilXQS0mz+xMBoeOI1T4d5rzZTNAzchz3W+SEqFe2fhJRzhZypVEuxz
         zU+VUYHXwEMG5VFKhetUc6wC4t8H3CXbwu5rGac2ilGGwTbawYBQ6fJl3P9hJSe9UIuv
         cFWBgXIGGzFtHrCM3CDG6H/AJMwebb1bKsqVHSkTq33Pfm0jBmTZloSvIMtQuCcTiL/f
         dh950WCg2PfUR+sf0QBuV5dTtYiqVJ8V6y7D8GYFGxRJmJixWwwmdRTsTKI46n94kL8S
         ZZQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722877698; x=1723482498;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a8qXi0AmLbuERLsyqttkRIlZ8eb7lceW7IwVCJnKdis=;
        b=eokIr8tg1eVzhUeTlluwrr2as83+Nmcnxj7SPfRoOnaljvgZp0GBnI1LA8IN6VWBfD
         NwBsK/6R0uirO5bQ1XU+GWvXfv3//k+wk81mfXWSm7bjbRr16LHV/G5yWSYn9wV3PmQi
         i3x6Uw3jhQ/OrdYIRRyV/KVeKqU3KzofiFHqeymQk0Qot1JHFij4JGXNbHCeoDtKnQHW
         C/0yNEcPR9cLLv0DaFs9M+7ezCKgpbBwEK+h4GLeniW6czkvATUgZUee23EA/xkFAPhY
         UJKMTmFuFz2bv23WR86Hg8NvHORF9k6ljVJh052EDH/kgcTWqHih2SC7i50RACzLG1aA
         dC4g==
X-Gm-Message-State: AOJu0Yw6Ko/AW+d+uBnFLuE0Z11qW5gGS4a8vZgbk6dpCFLAzObcCLHY
	bLEcwvDQytn2aSSfJLllypc73ss7bC+w5pzpfVwPxr3YvAqX6ue8mC3VOMqNQhE=
X-Google-Smtp-Source: AGHT+IGNnjvxPKNqFTpGRneCXiQ9ZfANtwC8Yo0t9+UB+vvcrfHUe+s1PfoKYEVEU99MdqkHe0JlVw==
X-Received: by 2002:adf:e389:0:b0:367:9d4e:8861 with SMTP id ffacd0b85a97d-36bbc1c7d09mr9650450f8f.57.1722877698373;
        Mon, 05 Aug 2024 10:08:18 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:1068:b792:523c:3f73])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36bbcf1e97esm10356486f8f.37.2024.08.05.10.08.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Aug 2024 10:08:17 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 05 Aug 2024 19:08:04 +0200
Subject: [PATCH v4 3/6] remoteproc: qcom_q6v5_pas: Add support for SA8775p
 ADSP, CDSP and GPDSP
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240805-topic-sa8775p-iot-remoteproc-v4-3-86affdc72c04@linaro.org>
References: <20240805-topic-sa8775p-iot-remoteproc-v4-0-86affdc72c04@linaro.org>
In-Reply-To: <20240805-topic-sa8775p-iot-remoteproc-v4-0-86affdc72c04@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Amol Maheshwari <amahesh@qti.qualcomm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Jassi Brar <jassisinghbrar@gmail.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-remoteproc@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 Tengfei Fan <quic_tengfan@quicinc.com>, Ling Xu <quic_lxu5@quicinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4033;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=sCnYyInCe8lgzoxKSYmHX0iIoLAhYHzdQ49FJhIALKQ=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBmsQb8Buyxua0eEvFkZkMIzdnMz5Hdp6nEJ2DwB
 TQQb8aCUh6JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZrEG/AAKCRARpy6gFHHX
 cjeJEACtfTt0lpBabZYmZj+a5tIm7JrdrtK1Rm0FcuGt8l/MfI5EAy8QPVzp2vngtIpB4BPmdEp
 v1BIurFWPFvSB2wPqlj4ioDBAAYWuBs4g7xWnq7Ud21k0pD873125dg9YyJV8kL5mM2krEk1q7x
 869EPEhufJW2HaxpDLDEhBGlrlABcQGU7FrhrrQY8bHtJmfSF8+Qq9FsOPZN92CgcGCKGOoYG78
 Bg89/vB1dM8LELe3m3cFwyQvADgoOJav4aqvB0cTc4ZcW8sTe2QX3FLfQkHle44W+VxydlTdedD
 +9EXmEM+Oi8Mx4NGUGawtGMnQ5Y5+LVRs0n1ZkgqyK14g/sLrDd3vLr/ovMhY1rHs7GF5zJtgcI
 h2X7/LU/dDuTJBP3Mt/X8mxOvbW23C/M8HZ7xeYzFcEDV594xClKii7Tg6OSjrs0AFcUtxMaVRO
 2dIMikWPYGuMEmLPlooZSc5d/DXA6SAeYJVhpPsJIE2ipSoc2IlDI+Pz/SAUdzICEvD4GWanVPh
 jbVmYxEvkHwqD1zJaFt8B+I4DYP0kn56+Kml6TL8hH82sDOtJwdVjqpkofnQBaKP7LHLnfJnAKZ
 +M/R00vUD8SsY9fGiXOwAYdpNBszbuXuqmzUPhGrln1rTlsLJEonXhY8PnMvqhdfWHOd6hLvaMT
 rJMPaE8ZHmL2Y5Q==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Tengfei Fan <quic_tengfan@quicinc.com>

Add support for PIL loading on ADSP, CDSP0, CDSP1, GPDSP0 and GPDSP1 on
SA8775p SoCs.

Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
Co-developed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 92 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 92 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 88e7b84f223c..1ec1accddde7 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -829,6 +829,23 @@ static const struct adsp_data adsp_resource_init = {
 	.ssctl_id = 0x14,
 };
 
+static const struct adsp_data sa8775p_adsp_resource = {
+	.crash_reason_smem = 423,
+	.firmware_name = "adsp.mbn",
+	.pas_id = 1,
+	.minidump_id = 5,
+	.auto_boot = true,
+	.proxy_pd_names = (char*[]){
+		"lcx",
+		"lmx",
+		NULL
+	},
+	.load_state = "adsp",
+	.ssr_name = "lpass",
+	.sysmon_name = "adsp",
+	.ssctl_id = 0x14,
+};
+
 static const struct adsp_data sdm845_adsp_resource_init = {
 	.crash_reason_smem = 423,
 	.firmware_name = "adsp.mdt",
@@ -942,6 +959,42 @@ static const struct adsp_data cdsp_resource_init = {
 	.ssctl_id = 0x17,
 };
 
+static const struct adsp_data sa8775p_cdsp0_resource = {
+	.crash_reason_smem = 601,
+	.firmware_name = "cdsp0.mbn",
+	.pas_id = 18,
+	.minidump_id = 7,
+	.auto_boot = true,
+	.proxy_pd_names = (char*[]){
+		"cx",
+		"mxc",
+		"nsp",
+		NULL
+	},
+	.load_state = "cdsp",
+	.ssr_name = "cdsp",
+	.sysmon_name = "cdsp",
+	.ssctl_id = 0x17,
+};
+
+static const struct adsp_data sa8775p_cdsp1_resource = {
+	.crash_reason_smem = 633,
+	.firmware_name = "cdsp1.mbn",
+	.pas_id = 30,
+	.minidump_id = 20,
+	.auto_boot = true,
+	.proxy_pd_names = (char*[]){
+		"cx",
+		"mxc",
+		"nsp",
+		NULL
+	},
+	.load_state = "nsp",
+	.ssr_name = "cdsp1",
+	.sysmon_name = "cdsp1",
+	.ssctl_id = 0x20,
+};
+
 static const struct adsp_data sdm845_cdsp_resource_init = {
 	.crash_reason_smem = 601,
 	.firmware_name = "cdsp.mdt",
@@ -1083,6 +1136,40 @@ static const struct adsp_data sm8350_cdsp_resource = {
 	.ssctl_id = 0x17,
 };
 
+static const struct adsp_data sa8775p_gpdsp0_resource = {
+	.crash_reason_smem = 640,
+	.firmware_name = "gpdsp0.mbn",
+	.pas_id = 39,
+	.minidump_id = 21,
+	.auto_boot = true,
+	.proxy_pd_names = (char*[]){
+		"cx",
+		"mxc",
+		NULL
+	},
+	.load_state = "gpdsp0",
+	.ssr_name = "gpdsp0",
+	.sysmon_name = "gpdsp0",
+	.ssctl_id = 0x21,
+};
+
+static const struct adsp_data sa8775p_gpdsp1_resource = {
+	.crash_reason_smem = 641,
+	.firmware_name = "gpdsp1.mbn",
+	.pas_id = 40,
+	.minidump_id = 22,
+	.auto_boot = true,
+	.proxy_pd_names = (char*[]){
+		"cx",
+		"mxc",
+		NULL
+	},
+	.load_state = "gpdsp1",
+	.ssr_name = "gpdsp1",
+	.sysmon_name = "gpdsp1",
+	.ssctl_id = 0x22,
+};
+
 static const struct adsp_data mpss_resource_init = {
 	.crash_reason_smem = 421,
 	.firmware_name = "modem.mdt",
@@ -1329,6 +1416,11 @@ static const struct of_device_id adsp_of_match[] = {
 	{ .compatible = "qcom,qcs404-adsp-pas", .data = &adsp_resource_init },
 	{ .compatible = "qcom,qcs404-cdsp-pas", .data = &cdsp_resource_init },
 	{ .compatible = "qcom,qcs404-wcss-pas", .data = &wcss_resource_init },
+	{ .compatible = "qcom,sa8775p-adsp-pas", .data = &sa8775p_adsp_resource},
+	{ .compatible = "qcom,sa8775p-cdsp0-pas", .data = &sa8775p_cdsp0_resource},
+	{ .compatible = "qcom,sa8775p-cdsp1-pas", .data = &sa8775p_cdsp1_resource},
+	{ .compatible = "qcom,sa8775p-gpdsp0-pas", .data = &sa8775p_gpdsp0_resource},
+	{ .compatible = "qcom,sa8775p-gpdsp1-pas", .data = &sa8775p_gpdsp1_resource},
 	{ .compatible = "qcom,sc7180-adsp-pas", .data = &sm8250_adsp_resource},
 	{ .compatible = "qcom,sc7180-mpss-pas", .data = &mpss_resource_init},
 	{ .compatible = "qcom,sc7280-adsp-pas", .data = &sm8350_adsp_resource},

-- 
2.43.0


