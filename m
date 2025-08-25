Return-Path: <linux-arm-msm+bounces-70624-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B1574B33E68
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 13:52:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A3E6E7A62A6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 11:51:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8672C2E7BD3;
	Mon, 25 Aug 2025 11:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U7jazKps"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBF212E7F39
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 11:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756122739; cv=none; b=p1V8IQIuB80neb+KUiXH5EmXQAwcxXim/jXOLwpBfE1U9s4JmuKpANr3vKSHOGQFJY95VcZtnF66lmywrGlz+NJRSpQ0dzLjY5AvhtHYtyga4oFPhsS9rTvBYWT1IQICbafXDaOLo8uc3AU2JsEPQBtWOQ0spOOIIybxVWS2A00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756122739; c=relaxed/simple;
	bh=y5Bq2C2XFu4tjzarifro/c1pTg5lvkE0QF25A4Uh1EY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=k+WUObXWzgCZaRsJYD0aQ74VwADKWMy6+BQux+RZ1B4BTvZ6b3ZjqcfxJQ4MDIYkNNGgEokAoDIlJ2Q1sMfWmtrE10m8t25peWN13/WxUY0xqTJnoWL9ugn3xcyMvdib/vn+LOjmzO9jtKaQz6jET9ooaPpGTMcCq4XDKfie7bU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U7jazKps; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57P8ZY1j032292
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 11:52:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HpYASGZZmsu81nylw1xU5enO2W10dco2kzYUMmfi47I=; b=U7jazKpsZDXXnFpp
	bpXf9dA3wQ3+RLo6cy5nsIr9jH0A+fZJu9ecSGUclxGo4pep2aUhDXYsFI9Nno2f
	AasAc7WhtKeezpxohqPF3VhAhmBoh4bBXWim2yokuGTwt2RyO2fp19l/7IqLN7Cq
	oNNGTojrzGVTrxvYs71ZL7obyuBaRrAgigpOnuhu71SIxRl4PEETqUj7cIKo+HrM
	fdRQWLH5KfKRwtYS2CTHtC1dkdzRNNoU4D5fMXt8S6b1DQ0qKs1F+wF3+0nE8NTY
	xNx0VwOFjeTxXcDhB2i717xVtrXaIuPvsG++veTrcKD7lVGw3peagHF3p5ulQhYO
	9CtOOQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5wdvv0j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 11:52:16 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-24457f59889so44959835ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 04:52:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756122735; x=1756727535;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HpYASGZZmsu81nylw1xU5enO2W10dco2kzYUMmfi47I=;
        b=Kjai8CwhUvp8RBc278wCKTkq/Ld7bmRi1biiw6PP6eOG1D+L5W7txROo2/o66rGLen
         bzfMCD6AkgCSQD2LRuS5wnsCA8j6qACKBvNsnKd5PbzRPdc858Zdn3TFNzxKv9uvS8bM
         gd5A1vSDBQXhuPJtaxMUwc2OpJkaZ2ImQzM5RmLgb13ruNfw84dGEGRa6IqzJIUv1MJk
         oDAAPW1EBaWZhPjw8DwcLF770i+jQ/XyD3rsZKIV92nLv3ah081nnOjcc94vXH+oo7td
         Km19MYkAdWf5Za/gzovpHvpPSvrsSD6kUE7ZYtClHdPskIf2DlzNTlQ8+QeaUYFjBPnX
         7r0w==
X-Gm-Message-State: AOJu0YxihD5HmgVDaQCXLrS8Hava7zHbLTzMvWXtbs+V+hDa9J2SpGZo
	Tzxtnt+zahwAiO95mg26ylZgQ6UDf0umGNxdYAaAhG7a/dQkhQk2LmDcabe1rYfrYetfrbOkrh8
	SZXp6Fd8trMvTEuIJUxPa0GwupMW9C8LcZOVNv7BHYC5Uff/a8NsfbStrdnOY5+6QYFoR
X-Gm-Gg: ASbGncvQMWB6PYvCGQ59+jtzGX6bkfxA74QBMpBHqi5tXefs2qCSgAHPxV3vRl84kWI
	5WYRPdBiFeBz6tE5L0vwfLa1jGyll9Rj5V42ue1xwu4Tr1vAQT3JnGMOWKYpqFZWFnkPGACbeFz
	9IDvnugBG2sEzBbaOoWqDCCxS1Ml57+7B9FFA3Ishm6quuqiNhGDC4jS3xuK8rAiM0N5Jx6u6m2
	DECrZXLTdj4q8QVAXZTZgLU4LsjXXuYyBFeBa5CBK67EYqzqIlh/fmYEOv7yaNg/Gk9iwlimpTS
	17rXnzNc0JmMYJj1DAq+eKSWtgPS3M+Bos36El/T86wzwza5/UwynfZK4bsOTNnCv4IA0rb+JYL
	ChTMIr/9VmGzZmXYsKWirId2FTGSZZCyt7/MJIQhhGwMzDaDtaPPkJJ7bBbr/j/EqreygsSrsnI
	g=
X-Received: by 2002:a17:902:d603:b0:246:a42b:a31d with SMTP id d9443c01a7336-246a42ba453mr73367075ad.44.1756122734552;
        Mon, 25 Aug 2025 04:52:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHf+8bmXr8Korpvwp3mX4WK/6McGdstI2tyTFrLp1MRPj7QLOOcYirhdLAQzg0QNUqxZUKcpA==
X-Received: by 2002:a17:902:d603:b0:246:a42b:a31d with SMTP id d9443c01a7336-246a42ba453mr73366755ad.44.1756122734086;
        Mon, 25 Aug 2025 04:52:14 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-246687b521bsm67081015ad.60.2025.08.25.04.52.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 04:52:13 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Mon, 25 Aug 2025 17:22:02 +0530
Subject: [PATCH 1/3] phy: qcom-qmp-usb: fix NULL pointer dereference in PM
 callbacks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-qmp-null-deref-on-pm-v1-1-bbd3ca330849@oss.qualcomm.com>
References: <20250825-qmp-null-deref-on-pm-v1-0-bbd3ca330849@oss.qualcomm.com>
In-Reply-To: <20250825-qmp-null-deref-on-pm-v1-0-bbd3ca330849@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Poovendhan Selvaraj <quic_poovendh@quicinc.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756122727; l=2291;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=5tHHmTTWnCLhPgSdJhVTTRMV12QfK1s/7g0qLan1GPM=;
 b=+4h5dOsKc93rJTyxtpkASa9VdaD7psJ6QMS6m9i1mhrHVmyUqXzUcMpMjcXA2aa3vT7uXpa0F
 VdoBdRAqnuNDB1vN7nu0jdjIoAsFEZ+3XsCh4rwsmmT8F4sKZ2dsDpl
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-GUID: mwKTJhaRpIQIOo1771gTu-N62SbbImWR
X-Proofpoint-ORIG-GUID: mwKTJhaRpIQIOo1771gTu-N62SbbImWR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfXwxYd8h5Sy5H/
 g5A6SSoy1f7ksesvlV6UhGvbwkG1ZDc5SBI0Zo8iKPA5Vmm/VgUIx2PEKIzRs/waJcbEci/50Rr
 zfN4JK+sw23bUJ323raOU8cB9I7bjfmkBHdqI854U1xxZzHgvHNiuT+O8XlJmvn+Dk+CI6yzszN
 kIIWGBYh5KQdQxaNgtsIcJgJnhLsX0atM5gApuDOc1OqAF6Nkki0QS9qD6rYTSdKPWzt/3NnIP3
 a6aFbXyT3WGVGGPttwbquwhY0z8JW4nRrnbbL1pAL3xMQ1LLoA6aq+HYPURZ400v5NHZHdD8uHT
 JSvK0Yz/xz6ldm6fIPcatpW+H1OYH/xvcHApoV3NCpoYvoYZiFUMpH7dBCA1WV75CYRj2Xyd0CB
 0qf0Jy/o
X-Authority-Analysis: v=2.4 cv=BJazrEQG c=1 sm=1 tr=0 ts=68ac4e71 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=qjlM38Vp9SSmJgUIidoA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_05,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 bulkscore=0 phishscore=0 suspectscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508230033

From: Poovendhan Selvaraj <quic_poovendh@quicinc.com>

The pm ops are enabled before qmp phy create which causes
a NULL pointer dereference when accessing qmp->phy->init_count
in the qmp_usb_runtime_suspend.

So if qmp->phy is NULL, bail out early in suspend / resume callbacks
to avoid the NULL pointer dereference in qmp_usb_runtime_suspend and
qmp_usb_runtime_resume.

Below is the stacktrace for reference:

[<818381a0>] (qmp_usb_runtime_suspend [phy_qcom_qmp_usb]) from [<4051d1d8>] (__rpm_callback+0x3c/0x110)
[<4051d1d8>] (__rpm_callback) from [<4051d2fc>] (rpm_callback+0x50/0x54)
[<4051d2fc>] (rpm_callback) from [<4051d940>] (rpm_suspend+0x23c/0x428)
[<4051d940>] (rpm_suspend) from [<4051e808>] (pm_runtime_work+0x74/0x8c)
[<4051e808>] (pm_runtime_work) from [<401311f4>] (process_scheduled_works+0x1d0/0x2c8)
[<401311f4>] (process_scheduled_works) from [<40131d48>] (worker_thread+0x260/0x2e4)
[<40131d48>] (worker_thread) from [<40138970>] (kthread+0x118/0x12c)
[<40138970>] (kthread) from [<4010013c>] (ret_from_fork+0x14/0x38)

Cc: stable@vger.kernel.org # v6.0
Fixes: 65753f38f530 ("phy: qcom-qmp-usb: drop multi-PHY support")
Signed-off-by: Poovendhan Selvaraj <quic_poovendh@quicinc.com>
Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-usb.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
index ed646a7e705ba3259708775ed5fedbbbada13735..cd04e8f22a0fe81b086b308d02713222aa95cae3 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
@@ -1940,7 +1940,7 @@ static int __maybe_unused qmp_usb_runtime_suspend(struct device *dev)
 
 	dev_vdbg(dev, "Suspending QMP phy, mode:%d\n", qmp->mode);
 
-	if (!qmp->phy->init_count) {
+	if (!qmp->phy || !qmp->phy->init_count) {
 		dev_vdbg(dev, "PHY not initialized, bailing out\n");
 		return 0;
 	}
@@ -1960,7 +1960,7 @@ static int __maybe_unused qmp_usb_runtime_resume(struct device *dev)
 
 	dev_vdbg(dev, "Resuming QMP phy, mode:%d\n", qmp->mode);
 
-	if (!qmp->phy->init_count) {
+	if (!qmp->phy || !qmp->phy->init_count) {
 		dev_vdbg(dev, "PHY not initialized, bailing out\n");
 		return 0;
 	}

-- 
2.34.1


