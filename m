Return-Path: <linux-arm-msm+bounces-44952-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D2A79A1000D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jan 2025 06:05:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B67EE18880E2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jan 2025 05:05:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A91E923354D;
	Tue, 14 Jan 2025 05:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hsqJ44nR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36E5923099D
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jan 2025 05:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736831148; cv=none; b=VqAIpEHIRR+alXK87IHowgShSxzXF4AnmQxrmJht/YjcMa7mgWkmzZgNlmdlLfz2Dm9rfbucQh/fdSNw2cevXZNB2uspXc/TXcLM+/wjYqG6cGDlDyWHVc7pTyvO9+ib8OTiKxkUH+tdaYW7wpncNhEwUTg4OtPmaVTrvkwvsh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736831148; c=relaxed/simple;
	bh=y85RoveN+CkGvlTwThOP8q+nyxhvG95+kpXnACiuUFc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=TOKu3+D3YtP4ctbC6/QCZ3bXvyU2ynoMjH25d24GVOT2L3Z0paGbkC0XZ5yyKwMK4kZGDP3Auh4iSbYq2P3QRLd+PGu58jcNW2cc8WTnVVSComP8/spFxU1bDYDN8Hkc0Ktdz1nm4Hm/NUNmdd8IYdpNjpFeRIFSr5JOGNWEPBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hsqJ44nR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50E259TQ020273
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jan 2025 05:05:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=9v3nb8bCKLADEut/fYx1ig
	Angj9NwOisvVHcd9E4C+g=; b=hsqJ44nR7I/8flD1W79fEYScb07aq3B2NoXXwy
	GOdRPd9xw33DARst468amG32+DkgXX2Ix1ke9IPWiusFZxBnxOvT2OrEfETw/UT7
	0Xi5A9pdBw1ISyM3OyCoH8LggWWaz/xjWZcrqyKsLr28PaNQn5gpRcQfojSf98z9
	GvxDcOufJOJjWf1upVZ0Q5/sZ5QiFD+10cYoA+pZQxl5xxbH9n3SHWVFUV5U+vBb
	XOpORN1End5j40j8USO4ZKcGU/VCEvxS/edMm4HOOy/Mp2Rmr2LvOCOmHuue4P0Z
	K6EzuNb4S3AIjkmFygOnI3ygTc0KfzPSYb5owoM9DpdUhuKg==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 445eu48bdn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jan 2025 05:05:45 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-71e3d574ab6so3390315a34.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jan 2025 21:05:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736831144; x=1737435944;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9v3nb8bCKLADEut/fYx1igAngj9NwOisvVHcd9E4C+g=;
        b=qzxHqciTIiU4QHpJ3d+u5pOZvZyMLsYQ5sUgXrqQnnyfejtsZkb3SDtvUTTV38AUah
         v3h56/m9a5hbpxPYj9k7+GpLkXbu5SMp3j8OrH/K/EtNsMRfTJkh+cpai+ZlecXhPdCc
         jSGr2BSA10f7hhLFqOPSl7+lJsT/kU3IOGrokK0icaiXNlKpnrDFyz+gHl0TZOZXg2af
         EU1t1rXBCsenRGyKCbPuvU34GZrTIh++W1ic6E2/TaAagZjAPfUHd5cOueizPWEAJ2t+
         JZw3QmSxnibISdSXy7V4NhFFfPZcyk4V6vQ7WBWPFdBUrSyFW7gkI9S8avtXzGSCQm5s
         EchA==
X-Gm-Message-State: AOJu0YxixSDrXlhasNGHS9x1ErtaOAlRuqQBRFf4b7ovf/0sqPyngQkx
	4V6D/k13qH9uEd8CD7+0kvY28Wmj1SDzmx0Cu6WBWX/2MQ42+F3D+RGVmA14KGYJCxSuhLJGF2H
	5ndBGpi7PWvQlxGg15SVctLlYykpk/A+SDcGNfaP7nbsmdnMlEbSgZcITkoVme8D5
X-Gm-Gg: ASbGncutZdm8mRkVpknKcQ+llW1Rcv/MSTv3kmGVDrzWqPNNxRBoFQ+AYyMbJD4FhG/
	w0FSg/k8UbMB0zsYbVK00cyT7zcnWecIAY3Zdt/57jfF0xEHk6ZhcR4IjeUL1zNgkfxLiW+lPDe
	/83KYbMGsnrl1ClBXAaOC+TtoT3b9voetFkzsrKv0CPT/MFLVDCPPsCHHOeBg0W1EBgUZ8LkWC0
	Bn9oYXZItPcNnfn1ZpEEbj22Mt6KcY8k0CZZaTloo8XXkri2OVlGuXk8aXoMx0LXYKhvwCJEsuP
	BNtKxZNa0ox1MsXgDrlUBETC1yrE6L2WakobTOecnWj5sJUiyZ3nOV8d
X-Received: by 2002:a05:6830:d02:b0:71d:4086:6072 with SMTP id 46e09a7af769-721e2e38670mr14087590a34.7.1736831144107;
        Mon, 13 Jan 2025 21:05:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHt5AZ0fj0UY9ddr5rLNg8AGLs5/ocvWbFkPQjRtuD9zABP2QbCQbyduWHZs40CV2KBNaNXVA==
X-Received: by 2002:a05:6830:d02:b0:71d:4086:6072 with SMTP id 46e09a7af769-721e2e38670mr14087579a34.7.1736831143729;
        Mon, 13 Jan 2025 21:05:43 -0800 (PST)
Received: from [192.168.86.65] (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5f882756603sm4001750eaf.29.2025.01.13.21.05.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 21:05:43 -0800 (PST)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Subject: [PATCH v3 00/12] usb: dwc3: qcom: Flatten dwc3 structure
Date: Mon, 13 Jan 2025 21:11:33 -0800
Message-Id: <20250113-dwc3-refactor-v3-0-d1722075df7b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAbyhWcC/12NzQ6CMBCEX4Xs2ZpuaxA8+R6GQ/+QTbBgK6ghv
 LsLR4/fZL6ZBXJIFDJcigVSmCnTEBn0oQDXmXgPgjwzKKk0SiyFfzstUmiNew1J1BqDtrIyla2
 BHWtyEDaZ6Dq24tT3HI5cp89+cmuYO8rsfvfPWW3pNn+SFeLf/KyEFDW2+ix9icar63MiR9Ed3
 fCAZl3XHw8SWA7BAAAA
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Felipe Balbi <balbi@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Saravana Kannan <saravanak@google.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.li@nxp.com>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=11300;
 i=bjorn.andersson@oss.qualcomm.com; h=from:subject:message-id;
 bh=y85RoveN+CkGvlTwThOP8q+nyxhvG95+kpXnACiuUFc=;
 b=kA0DAAgBCx85Pw2ZrcUByyZiAGeF8hShax2/V7rKhVtQtZY9ma42sCyEwZbgIXadZI/ZD2O7x
 4kCSQQAAQgAMxYhBAXeA8xfNepPCWbVJQsfOT8Nma3FBQJnhfIUFRxhbmRlcnNzb25Aa2VybmVs
 Lm9yZwAKCRALHzk/DZmtxWjcEACezs220XwA2IqrM3D3ikUH8qmiPSsrMLyBiuG3/ifxrF+khMb
 XvOatlogd18/nlzpgnNy5dCRTYuWLVWmWJJA57vSDKbkk5VJpmRrIASwnklK1GLU7wiZMvFeeD8
 EhK3zfGV0RzOug/zi58B9WmjUvyOxZvqvO7a2xOArJO3SDwR1ptMWVNRtsMpcKDJpfpwIPUc5s+
 zsjotq+5N3HmMFvy9RUejORPrJOm1iFjF6l5uXJ8hlu0+N2eU1NUmbbPENWgFHiapw9Nr18Bu13
 BLbt9TpqoTXnLFZdkgqbE/CM+9tdfsFd6JygjWERNREjedWEjT14/cDxaeK60hWJhmIw1BxwFb6
 U5zJ2/93dvkN6QgSrTB02Hmh0aNS7iCg1smhp8xh46a/PdtoQWpsf+wtFIipCTT/Y1/0K3i1HC0
 EAUFqiRXpI1pWx33EPVcR2J3EgnLScpLYnr30g4fRVIsfGRa0yjA/gpUvjmbGDL+6mIJXv4fq+n
 dTp/yoKrz8kTJNm/nf1I9gmE/e2bX3P865fxZGqHEz0VnLvMeWXeVNeNjuKHyNArnwjCFQzzndS
 yRlXTxxsCNkh7OOiu25Lzee7dkGaiP3uxQ8CaszCGmUXG6KHtxLJvTkmqdiPuaOBOR0SjGY2aOZ
 poH2R7W5ksLidiOojSoj4FS4rHvdItZSroQ==
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5
X-Proofpoint-GUID: trbJsjDeGB2wAfWYC9LKhge3eyXKdwj4
X-Proofpoint-ORIG-GUID: trbJsjDeGB2wAfWYC9LKhge3eyXKdwj4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 malwarescore=0 bulkscore=0 phishscore=0 adultscore=0
 impostorscore=0 mlxscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501140039

The USB IP-block found in most Qualcomm platforms is modelled in the
Linux kernel as 3 different independent device drivers, but as shown by
the already existing layering violations in the Qualcomm glue driver
they can not be operated independently.

With the current implementation, the glue driver registers the core and
has no way to know when this is done. As a result, e.g. the suspend
callbacks needs to guard against NULL pointer dereferences when trying
to peek into the struct dwc3 found in the drvdata of the child.

Missing from the upstream Qualcomm USB support is proper handling of
role switching, in which the glue needs to be notified upon DRD mode
changes. Several attempts has been made through the years to register
callbacks etc, but they always fall short when it comes to handling of
the core's probe deferral on resources etc.

Furhtermore, the DeviceTree binding is a direct representation of the
Linux driver model, and doesn't necessarily describe "the USB IP-block".

This series therefor attempts to flatten the driver split, and operate
the glue and core out of the same platform_device instance. And in order
to do this, the DeviceTree representation of the IP block is flattened.

To avoid littering the dwc3-qcom driver with the migration code - which
we should be able to drop again in a LTS or two - this is now placed in
drivers/of/overlays.

A patch to convert a single platform - sc8280xp - is included in the
series. The broader conversion will be submitted in a follow up series.

---
Changes in v3:
- Replaced the handcoded migration logic of compatible, reg, interrupts,
  phys with overlays.
- Move the migration logic (and overlays) to a new drivers/of/overlays
  directory and apply this at postcore, so that it takes effect prior to
  the relevant platform_devices are created
- struct dwc3 is embedded in the glue context, rather than having a
  separate object allocated
- The hack of using of_address_to_resource() to avoid platform_resource
  being stale is removed (thanks to applying migration at postcore)
- Link to v2: https://lore.kernel.org/r/20240811-dwc3-refactor-v2-0-91f370d61ad2@quicinc.com

Changes in v2:
- Rewrite after ACPI removal, multiport support and interrupt fixes
- Completely changed strategy for DeviceTree binding, as previous idea
  of using snps,dwc3 as a generic fallback required unreasonable changes
  to that binding.
- Abandoned idea of supporting both flattened and unflattened device
  model in the one driver. As Johan pointed out, it will leave the race
  condition holes and will make the code harder to understand.
  Furthermore, the role switching logic that we intend to introduce
  following this would have depended on the user updating their
  DeviceTree blobs.
- Per above, introduced the dynamic DeviceTree rewrite
- Link to v1: https://lore.kernel.org/all/20231016-dwc3-refactor-v1-0-ab4a84165470@quicinc.com/

---
Bjorn Andersson (12):
      dt-bindings: usb: snps,dwc3: Split core description
      dt-bindings: usb: Introduce qcom,snps-dwc3
      of: dynamic: Add of_changeset_add_prop_copy()
      of: overlays: Introduce dwc3 flattening overlay
      of: overlays: dwc3-flattening: Add Qualcomm Arm32 overlays
      of: overlays: dwc3-flattening: Add Qualcomm Arm64 board overlays
      of: overlays: dwc3-flattening: Provide overlay symbols
      usb: dwc3: core: Expose core driver as library
      usb: dwc3: core: Don't touch resets and clocks
      usb: dwc3: qcom: Don't rely on drvdata during probe
      usb: dwc3: qcom: Transition to flattened model
      arm64: dts: qcom: sc8280x: Flatten the USB nodes

 .../devicetree/bindings/usb/qcom,dwc3.yaml         |   13 +-
 .../devicetree/bindings/usb/qcom,snps-dwc3.yaml    |  618 ++++++++
 .../devicetree/bindings/usb/snps,dwc3-common.yaml  |  415 ++++++
 .../devicetree/bindings/usb/snps,dwc3.yaml         |  391 +----
 arch/arm64/boot/dts/qcom/sa8295p-adp.dts           |   12 +-
 arch/arm64/boot/dts/qcom/sa8540p-ride.dts          |    5 +-
 arch/arm64/boot/dts/qcom/sc8280xp-crd.dts          |   12 +-
 .../boot/dts/qcom/sc8280xp-huawei-gaokun3.dts      |   10 +-
 .../dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts     |   11 +-
 .../boot/dts/qcom/sc8280xp-microsoft-arcata.dts    |   10 +-
 .../boot/dts/qcom/sc8280xp-microsoft-blackrock.dts |   18 +-
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi             |  157 +-
 drivers/of/Kconfig                                 |    2 +
 drivers/of/Makefile                                |    2 +
 drivers/of/dynamic.c                               |   20 +
 drivers/of/overlays/Kconfig                        |   15 +
 drivers/of/overlays/Makefile                       |    3 +
 drivers/of/overlays/dwc3-flattening/Makefile       |   94 ++
 .../of/overlays/dwc3-flattening/dwc3-flattening.c  | 1552 ++++++++++++++++++++
 .../of/overlays/dwc3-flattening/dwc3-flattening.h  |  188 +++
 .../overlays/dwc3-flattening/dwc3-qcom_apq8094.dts |   32 +
 .../overlays/dwc3-flattening/dwc3-qcom_apq8096.dts |   60 +
 .../dwc3-qcom_apq8096_inforce_ifc6640.dts          |   58 +
 .../overlays/dwc3-flattening/dwc3-qcom_ipq4018.dts |   36 +
 .../dwc3-qcom_ipq4018_8dev_jalapeno.dts            |   38 +
 .../overlays/dwc3-flattening/dwc3-qcom_ipq4019.dts |   38 +
 .../overlays/dwc3-flattening/dwc3-qcom_ipq5018.dts |   28 +
 .../overlays/dwc3-flattening/dwc3-qcom_ipq5332.dts |   32 +
 .../overlays/dwc3-flattening/dwc3-qcom_ipq5424.dts |   58 +
 .../overlays/dwc3-flattening/dwc3-qcom_ipq6018.dts |   54 +
 .../overlays/dwc3-flattening/dwc3-qcom_ipq8064.dts |   40 +
 .../overlays/dwc3-flattening/dwc3-qcom_ipq8074.dts |   58 +
 .../overlays/dwc3-flattening/dwc3-qcom_ipq9574.dts |   29 +
 .../overlays/dwc3-flattening/dwc3-qcom_msm8953.dts |   32 +
 .../overlays/dwc3-flattening/dwc3-qcom_msm8992.dts |   32 +
 .../overlays/dwc3-flattening/dwc3-qcom_msm8994.dts |   32 +
 .../overlays/dwc3-flattening/dwc3-qcom_msm8996.dts |   58 +
 .../dwc3-qcom_msm8996_oneplus_oneplus3.dts         |   56 +
 .../dwc3-qcom_msm8996_oneplus_oneplus3t.dts        |   56 +
 .../dwc3-qcom_msm8996_sony_dora_row.dts            |   57 +
 .../dwc3-qcom_msm8996_sony_kagura_row.dts          |   57 +
 .../dwc3-qcom_msm8996_sony_keyaki_row.dts          |   57 +
 .../dwc3-qcom_msm8996_xiaomi_gemini.dts            |   56 +
 .../dwc3-qcom_msm8996_xiaomi_natrium.dts           |   56 +
 .../dwc3-qcom_msm8996_xiaomi_scorpio.dts           |   56 +
 .../overlays/dwc3-flattening/dwc3-qcom_msm8998.dts |   34 +
 .../dwc3-qcom_msm8998_fxtec_pro1.dts               |   35 +
 .../dwc3-qcom_msm8998_oneplus_cheeseburger.dts     |   32 +
 .../dwc3-qcom_msm8998_oneplus_dumpling.dts         |   32 +
 .../dwc3-qcom_msm8998_sony_xperia_lilac.dts        |   35 +
 .../dwc3-qcom_msm8998_sony_xperia_maple.dts        |   35 +
 .../dwc3-qcom_msm8998_sony_xperia_poplar.dts       |   35 +
 .../dwc3-qcom_msm8998_xiaomi_sagit.dts             |   32 +
 .../overlays/dwc3-flattening/dwc3-qcom_qcm2290.dts |   32 +
 .../overlays/dwc3-flattening/dwc3-qcom_qcm6490.dts |   63 +
 .../overlays/dwc3-flattening/dwc3-qcom_qcs404.dts  |   56 +
 .../overlays/dwc3-flattening/dwc3-qcom_qcs615.dts  |   62 +
 .../overlays/dwc3-flattening/dwc3-qcom_qcs8300.dts |   62 +
 .../overlays/dwc3-flattening/dwc3-qcom_qdu1000.dts |   38 +
 .../overlays/dwc3-flattening/dwc3-qcom_qru1000.dts |   38 +
 .../overlays/dwc3-flattening/dwc3-qcom_sa8155p.dts |   71 +
 .../overlays/dwc3-flattening/dwc3-qcom_sa8540p.dts |  129 ++
 .../overlays/dwc3-flattening/dwc3-qcom_sa8775p.dts |   90 ++
 .../dwc3-flattening/dwc3-qcom_sar2130p.dts         |   39 +
 .../overlays/dwc3-flattening/dwc3-qcom_sc7180.dts  |   39 +
 .../overlays/dwc3-flattening/dwc3-qcom_sc7280.dts  |   63 +
 .../overlays/dwc3-flattening/dwc3-qcom_sc8180x.dts |  109 ++
 .../dwc3-flattening/dwc3-qcom_sc8280xp.dts         |  129 ++
 .../dwc3-qcom_sc8280xp_microsoft_blackrock.dts     |  121 ++
 .../overlays/dwc3-flattening/dwc3-qcom_sda660.dts  |   59 +
 .../overlays/dwc3-flattening/dwc3-qcom_sdm450.dts  |   33 +
 .../overlays/dwc3-flattening/dwc3-qcom_sdm630.dts  |   57 +
 .../overlays/dwc3-flattening/dwc3-qcom_sdm632.dts  |   32 +
 .../overlays/dwc3-flattening/dwc3-qcom_sdm636.dts  |   59 +
 .../overlays/dwc3-flattening/dwc3-qcom_sdm660.dts  |   57 +
 .../overlays/dwc3-flattening/dwc3-qcom_sdm670.dts  |   36 +
 .../overlays/dwc3-flattening/dwc3-qcom_sdm845.dts  |   64 +
 .../dwc3-qcom_sdm845_lenovo_yoga_c630.dts          |   67 +
 .../dwc3-flattening/dwc3-qcom_sdm845_lg_judyln.dts |   67 +
 .../dwc3-flattening/dwc3-qcom_sdm845_lg_judyp.dts  |   67 +
 .../dwc3-qcom_sdm845_qcom_sdm845_mtp.dts           |   67 +
 .../dwc3-qcom_sdm845_samsung_starqltechn.dts       |   67 +
 .../dwc3-qcom_sdm845_samsung_w737.dts              |   67 +
 .../dwc3-qcom_sdm845_shift_axolotl.dts             |   67 +
 .../dwc3-qcom_sdm845_thundercomm_db845c.dts        |   67 +
 .../dwc3-qcom_sdm845_xiaomi_beryllium.dts          |   67 +
 .../dwc3-qcom_sdm845_xiaomi_beryllium_ebbg.dts     |   67 +
 .../overlays/dwc3-flattening/dwc3-qcom_sdx55.dts   |   38 +
 .../overlays/dwc3-flattening/dwc3-qcom_sdx65.dts   |   38 +
 .../overlays/dwc3-flattening/dwc3-qcom_sdx75.dts   |   36 +
 .../overlays/dwc3-flattening/dwc3-qcom_sm4250.dts  |   37 +
 .../dwc3-qcom_sm4250_oneplus_billie2.dts           |   35 +
 .../overlays/dwc3-flattening/dwc3-qcom_sm6115.dts  |   37 +
 .../dwc3-qcom_sm6115_lenovo_j606f.dts              |   35 +
 .../overlays/dwc3-flattening/dwc3-qcom_sm6125.dts  |   36 +
 .../overlays/dwc3-flattening/dwc3-qcom_sm6350.dts  |   39 +
 .../overlays/dwc3-flattening/dwc3-qcom_sm6375.dts  |   36 +
 .../overlays/dwc3-flattening/dwc3-qcom_sm7125.dts  |   39 +
 .../overlays/dwc3-flattening/dwc3-qcom_sm7225.dts  |   39 +
 .../overlays/dwc3-flattening/dwc3-qcom_sm7325.dts  |   60 +
 .../overlays/dwc3-flattening/dwc3-qcom_sm8150.dts  |   67 +
 .../overlays/dwc3-flattening/dwc3-qcom_sm8250.dts  |   67 +
 .../dwc3-qcom_sm8250_xiaomi_elish.dts              |   64 +
 .../overlays/dwc3-flattening/dwc3-qcom_sm8350.dts  |   67 +
 .../dwc3-qcom_sm8350_microsoft_surface_duo2.dts    |   67 +
 .../dwc3-qcom_sm8350_qcom_sm8350_hdk.dts           |   69 +
 .../dwc3-qcom_sm8350_qcom_sm8350_mtp.dts           |   67 +
 .../dwc3-qcom_sm8350_sony_pdx214_generic.dts       |   67 +
 .../dwc3-qcom_sm8350_sony_pdx215_generic.dts       |   67 +
 .../overlays/dwc3-flattening/dwc3-qcom_sm8450.dts  |   39 +
 .../overlays/dwc3-flattening/dwc3-qcom_sm8550.dts  |   39 +
 .../overlays/dwc3-flattening/dwc3-qcom_sm8650.dts  |   39 +
 .../dwc3-flattening/dwc3-qcom_x1e80100.dts         |  153 ++
 .../dwc3-qcom_x1e80100_hp_omnibook_x14.dts         |  149 ++
 drivers/usb/dwc3/core.c                            |  167 ++-
 drivers/usb/dwc3/dwc3-qcom.c                       |  149 +-
 drivers/usb/dwc3/glue.h                            |   22 +
 include/linux/of.h                                 |    3 +
 118 files changed, 8389 insertions(+), 670 deletions(-)
---
base-commit: 6ecd20965bdc21b265a0671ccf36d9ad8043f5ab
change-id: 20231016-dwc3-refactor-931e3b08a8b9

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>


