Return-Path: <linux-arm-msm+bounces-88775-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 98724D18BC8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 13:33:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CF968302FCFD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 12:33:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 786C538F923;
	Tue, 13 Jan 2026 12:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mY5ZlBeQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Mt2UWkNQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 150D8214813
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 12:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768307608; cv=none; b=ULuSFxf2HxJBzR7SHtcxSjwcQ78Ww7yA7pbxDqIIcMsyp138GlEgqYg6AMPrzd2/UVYYY4WIFoM1HX5IhqkuBy4ypH1hoCLt8RAtdNjk1KfnP9VGNTOqyDd2edMC/E9F3mwv919kLu5UkWbWHqDvC3FK6LQdQYyt/xqOQJhDv3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768307608; c=relaxed/simple;
	bh=/xE5IZwOJNy/bZmOyHGkvxn+Sahx5gFiANgrHvoGfBU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=X5cXYTMoRIZ3MknJbi88323QU0Bsq8E0PeZjYeMpam3sGYZMbQsK4Mib5lG7C49ucyjoFcPrIfcwEM8vig80G4LygWqKZ+JBfqnwgXhW2XqoPwjGPKFf9aSHUKWoNsQn6gKNBciChXQfG75J4sTOQoaRli0p3jthIvfoXpAFnS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mY5ZlBeQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Mt2UWkNQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60DA5snu3799083
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 12:33:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=moh1Z10dbVgoTyZDWco1zc
	SC3LSJOQ0mHP6WMPyuws4=; b=mY5ZlBeQoSdqO4KCLkubijytLQahBL109vsc0H
	RRQyWet6YtULFyjfHiNgU2FXY2gbwJPagDiKMHzN7QleEsl1ikzMnOhrp25m+vhW
	6yRBULVmq/G0yHfer7QFerBe/F4s60J++qsWUagBME+7nUN5/skwJDnzqXc/Ft4X
	3yr335kehwtkM07Ergctq56WNLPSzuzAzrqXWWmSsdswZ6vZfshebPVhQ4IooG63
	0CRuJnZ+zLhPmkLoCdMbdvlP6696UnvNC2PKWD/5bSRkt8w3vnxVAib7Suax5cVS
	+1mbtyC6/46+kmQJ2c5IaX0X9iOAV8z7Xrtk2H3nT/MYVdNA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnm0drea8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 12:33:25 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8bb3a245d0cso1890580485a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 04:33:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768307605; x=1768912405; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=moh1Z10dbVgoTyZDWco1zcSC3LSJOQ0mHP6WMPyuws4=;
        b=Mt2UWkNQL6Trs/E9XUF/0YrFAkw1D7NuiGQyMQ49mzr03izcD0bTy6Y7y9Skn/n0Hv
         Ynok2fL940DYOn5CfKAzpMiKCRqtvSGsi4IObc1f0v2Z6YrO7Joh3GapGFFjz+Z168Ye
         NvB+s/QzYAIZTCz22iyhSX+eplbGfWba44K1hRmRydzz41OQ2XZ4Xzmux4tythh15+re
         oz4035HmreOsaNp4/hvhEjo/pH7jz2QIHExpXTR+d9SCMnr67JlYZiM9zOSZud9SF8Kb
         NEzS1YiE5vOBgZEoU0WJSNvg2Na0DgZXk0FYoobGKG0lRLzPURs2DZ8/Go93Et5ysuhF
         grug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768307605; x=1768912405;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=moh1Z10dbVgoTyZDWco1zcSC3LSJOQ0mHP6WMPyuws4=;
        b=pN/6z45r2wv6b6ktK91dClaWfM6k5EOE6AiZP/z9X8yyBwRYlU/lfCSKngehRCsq05
         JoEqI3zNG6ivB+yvZZkesfYbH70ruIPTaCR016HLYBAd3Cvh8GSZGy5KT2etaaTWPso9
         11jMvnPtuZFXhjRfHtjMUmSzLiBt8U/TmLtCxtXJThG+gGOIC+uIFGAVloxk6UKE1Dtx
         lFGkSiwBPUot76rmeNH9c1+0nmehxAcRX7+PIsFiWG2ezIUGBrGuFiZG8HPYbyYW34y3
         WhN0/0vA3a8FB55l6C5x2gTQKhyM3oh7WUyOXloCThqG0nTZrTXhDng+hT4kw/rmsSLz
         oHjQ==
X-Forwarded-Encrypted: i=1; AJvYcCUEOWkwbvvRwl63MJYCFED76RFhbztFhCpxTD2uOs3EbhvKuK11i3V9bzqBQngi5D72Bk7l7m6tPUbEDCM0@vger.kernel.org
X-Gm-Message-State: AOJu0YyFxtXTrCV0rFkC5DjE8T8D88HMpzZMWbg8FKpTUxEd4gpSaN7F
	EP2GBjRQNoSWK/b/AacPY2qqhM24vRnVVTYfUk1+rz++l9ewhOygvSHP2f9R15K9Ggu9SOJyMmr
	FGUIu0mx8rdWD53ImSn98Vun4A/WdDsL+05fjPoR6p2OSnV6lgjeIjc5ACxpubmryfU6y
X-Gm-Gg: AY/fxX6ZR+EDqu6PtKsE6UTuqnw8Fk7iADns4TSu7cZSEHJoflhy24r7N6t5As2/dG7
	Z7HDOTFycmL1mp8CrBieygiY+h8U5t9WcDGtJ2jMgQNlPFuaRlzfNopmPMeYAb5U2WAlMxQyhaX
	rKdGVhWKh0hzVcAf1YgSgWlqg6gubMTrAUA8QgZH+4YvL1ihL0Y8lPwNhEiYPZxRFX4n7DxWLMa
	aWfz/4MZMdUtXV9vgbGaFNguT7A2UeI56bV0Zh/7T6IbkDwJYzJdUwbD2K8kRyTMlrfMgiW2oxj
	0jly93Mmc6ChbIvPVIG5UMnDcVrnc1nJ4rwrUBkLXrWG2tLG22UQlGYFNJeFveUhDA3Z0qWXwOc
	Z/eejGx3Y9+M32dKGzA==
X-Received: by 2002:a05:620a:25c6:b0:8b2:1ee9:dd03 with SMTP id af79cd13be357-8c38938de9cmr2985294785a.1.1768307605176;
        Tue, 13 Jan 2026 04:33:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF7AW9kea33GVtMnrLa+sZ4EpUwM9M+9BDWog+7V1IUyCbfKEMURf+ItQEMpSCdPvcNFo32DA==
X-Received: by 2002:a05:620a:25c6:b0:8b2:1ee9:dd03 with SMTP id af79cd13be357-8c38938de9cmr2985289585a.1.1768307604528;
        Tue, 13 Jan 2026 04:33:24 -0800 (PST)
Received: from hackbox.lan ([86.121.163.152])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8715952fc3sm635303166b.50.2026.01.13.04.33.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 04:33:23 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH RFT 0/3] arm64: dts: qcom: glymur: Add USB support
Date: Tue, 13 Jan 2026 14:33:03 +0200
Message-Id: <20260113-dts-qcom-glymur-add-usb-support-v1-0-98d6d387df01@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAH87ZmkC/22PzW7DIBCEX8Xi3LXADnbsU059gKq3KoowLCmRf
 1mw2kZ59+Ikx1xWmtFovtkrI/QOibXZlXlcHblpTEK8ZUx/q/GM4EzSrOBFxQVvwASCRU8DnPv
 fIXpQxkCkDijO8+QDVKLuKtMYXhaapZbZo3U/d8IX+3j/ZMeHSbG7oA5b9zPmcYmJH57ZAYnUn
 d9miS5FIRqIMwWPajit5ekx4OTG4CcTdUjLYS2BQ1kUtbDCVntpDhNRvkTVp8lDns4Ge1Fdcyk
 rKfOq3MtmBwLUeMHeLRHzAXscDf69rOoUIWyGC21md+n52lrdoWXH2+0fI8dzo14BAAA=
X-Change-ID: 20260109-dts-qcom-glymur-add-usb-support-617b6d9d032c
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Cc: Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=1826;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=/xE5IZwOJNy/bZmOyHGkvxn+Sahx5gFiANgrHvoGfBU=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpZjuOUrXZyO9vxu/vOxPqBD/OmcaWSc+kzf1w4
 qaKUEsylM6JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaWY7jgAKCRAbX0TJAJUV
 VuBzEACpIgVu4zliJv6FvNLm1DicEOu9SRnteHCF+DGMECtd4teyVZIkgLamP+7fZOVdtIhjIQy
 oeZUSl+QJ4nnMljzMYoSerWU1gEGN8I2M0y9XiDuyxe7rxvGqQxqLVQY03jvtqTZRh9+IvdZ0pp
 eYb9VJScXhlmVVN4sWDGDe0MEbhzu0mplNEnS6mhGU4cC2RvlvaZq7FqAO/4owaNOvlg/HIAHa6
 ge/kgvKhrh92RXy9P7CCIed49kTaxQ1VD9l5U+EP9TGYEK/HaXXgkyBsJwDVLNy70tOmtVin31B
 lnxOpmexTTVgB4l02Hq+R0pWKumSkZhp6T1K0ZoOO6xO4blPAobe3DhOVZo3URmfqZKVAQ+IdwW
 hPR6TZL7tKsnDDRBj6VpZRU5UAs2C6Xd8xLfQRjCjqhdh+UYcFIXJk03PzrOpU+RPxWoWKPoQyB
 XDLFBPX7XgOz6X2llPcouajy1t3rlQGaaxAhQgtw52KTZm2H6tf4SRVjzw/e6ZLLBDxX1Gq00Lo
 cFOZoOLo7aYiIt600dcVk7pB9VhEW0fLddtFrFy+0c3wBnJTDlOP5AR2b0jJTT2WCZtYCEJPwIs
 sB/lceNloGvYxrqP59BauqpVzJUtG3QclnddSrkspi68C0dAS4PYVyu13SJrmW4gzKjWo3KcX+W
 kdqk6lf6K6+2iKg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=BYXVE7t2 c=1 sm=1 tr=0 ts=69663b95 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=RUlelSpolvTNyr7Sls5SJA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=JIkswloRB9mE-LgSPU0A:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: ABQdVRnG1Pnc-ofxAyWnb182OPVaWCpi
X-Proofpoint-GUID: ABQdVRnG1Pnc-ofxAyWnb182OPVaWCpi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDEwNiBTYWx0ZWRfX2lRIiYNYBcoi
 FnvAdw68Zqm6SIBuCbjiQJqFNtW9RolF9Gd9xSMgWm+JVQiagLpJW8KP2ndkMzhYuQ2JHBC5uap
 dr3oMYHpIwqZ48EChvajBOw9pBgPLqstqZ3Sx3V3ZAgtpCTrgb4k3zci5b04xBn7Ii+VWGiblEw
 ktiw9X63sWhwPSTbMWr5HrO0b0PWzdV5x2K6CWZ3/N7wohlyszigHoO1ZOKshWPYeMtqt3b6BPa
 IcnZUE/ifnsv3DNLSCHND2Hnyh2uCWp0h1pF4BUikhN0etZ0MBxzuY6YW0U1QqTi0B5Ap9h8tk4
 QnxtgnVgvmNehu5Y4q1erZQTNo9KCs/U+6KOmJAFE8u/HdMM4oM1LcAOyL5mMC4AhCRuDiEqdf4
 d3zv+ntXxoQd+ZyI5QAkyBMNPfqazTfkESwfR69WATe7dmqacKFROQmxF38qICZ2db0ac/13Guw
 tfctZq9hrTRXuwfyLUg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_02,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 impostorscore=0
 spamscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601130106

Add support for USB on Glymur SoC and its Compute Reference Device.

This based on the following patch:
https://lore.kernel.org/all/20250925-v3_glymur_introduction-v1-23-24b601bbecc0@oss.qualcomm.com/

It adds the usb_2 controller on top and addresses all comments.

This unblocks the upstreaming of the display support, since 3 DP instances
rely on some clocks provided by the combo PHYs.

Sent as RFT since the latest tests have only been run on a remote-only
available device.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Abel Vesa (1):
      dt-bindings: usb: qcom,dwc3: Allow high-speed interrupt on Glymur, Hamoa and Milos

Wesley Cheng (2):
      arm64: dts: qcom: glymur: Add USB related nodes
      arm64: dts: qcom: glymur-crd: Enable USB support

 .../devicetree/bindings/usb/qcom,snps-dwc3.yaml    |   2 +-
 arch/arm64/boot/dts/qcom/glymur-crd.dts            | 283 +++++++++
 arch/arm64/boot/dts/qcom/glymur.dtsi               | 663 ++++++++++++++++++++-
 3 files changed, 942 insertions(+), 6 deletions(-)
---
base-commit: f417b7ffcbef7d76b0d8860518f50dae0e7e5eda
change-id: 20260109-dts-qcom-glymur-add-usb-support-617b6d9d032c
prerequisite-message-id: 20251219-upstream_v3_glymur_introduction-v3-0-32271f1f685d@oss.qualcomm.com
prerequisite-patch-id: 2d0427a6e5a9310d8dd547eb3e2d9667ade54083
prerequisite-patch-id: adc6c3714b1636b0758d479b647389519e5199cb
prerequisite-patch-id: a60d247607692a62f8f1ad53697101f1845337d9
prerequisite-patch-id: 178e4c849a063a1e945155b6e5765150137a718c
prerequisite-message-id: 20251217055655.638594-1-anjelique.melendez@oss.qualcomm.com
prerequisite-patch-id: 41fcc7298bf432b7a268762b71dfa2fc331c9d30
prerequisite-patch-id: 79ca16f835091115da3fe81327b3f58a3818ce12

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>


