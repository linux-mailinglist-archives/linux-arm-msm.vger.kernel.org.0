Return-Path: <linux-arm-msm+bounces-44958-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id ABB69A10024
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jan 2025 06:07:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 633837A04B3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jan 2025 05:07:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A92623315F;
	Tue, 14 Jan 2025 05:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eHZYB7Gl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0498323D3CF
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jan 2025 05:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736831164; cv=none; b=leIl/u3Ycl38t+7JIDYWXTvro4AdRljaVxIKTCHLQPtn747jzU0kHiAIc15e4MEKgE22BtXOrRxnnMogFiYiogOTWAH/5rfqV/IHySkc46yAAfkR6fHjaC4tbwA6txxvhlG8gRtLP2LGpb3WeCJdqclJGjqLXhfgQyN3Gtos0Dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736831164; c=relaxed/simple;
	bh=eVZ1RmTHKgbnk1IWLkQv54xVHndrD+zNyODhTeRc7zc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NK9G4vrGEsRBrB2O79iKXAyP//+oGX6DCv+ZewM6qn8VFIHodbwGLbG0lxekM5gnTu7qnnc8YkOfKzoCjqdgHOKN/+XMgad9+Ln6YtJAJV0XvoG5THlZ/dDf8YyuKmfmbaXqq30hJCwZglcxKhKZw9RnuOxFOmoOiqL+wqLi010=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eHZYB7Gl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50DJLZ9P002893
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jan 2025 05:05:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZCBjS8nUjkynSvy/BD/OVnxm4MFnRm7rnyz4Vr/pees=; b=eHZYB7Glwk+E5V8E
	mkJ1nwlnJz80aUfH0ZOhqnp2OY1smKXahz1d7xSPL0OU63do33vxucxdR6w0VaTU
	02+wlX9EBYVu/7h28Z+VQu9ZYIx4zpOtMgDEcP75QgSDoKZDa79/wWKyX0Yv1AbV
	fhHUjLUNd/4FsxuZ8eh/MrHkTJpgqNtYn3GmJtUSdRX7a94Fq1m/oBMT8a4nJUJN
	pIu9tTY0gX364O1ZhfCyzD68luCCrmGX82YeDwOq+4RXuq+xcApn4a89KDobjF7b
	A7woH+GQcuTvHOZkWHxOxGVc+Zyq8Qjr3Ajb5VulL5yyAaRt4LgasEHoZjV8K0xd
	qR/vpg==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4458ww92d8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jan 2025 05:05:54 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-3eb81b5cbfaso3845177b6e.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jan 2025 21:05:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736831153; x=1737435953;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZCBjS8nUjkynSvy/BD/OVnxm4MFnRm7rnyz4Vr/pees=;
        b=tcAhjNMywxaoDJVF5I9FnJPAeB9mF+3sQHkSqYsMCAu1TEnBIb+ViPkYKhyPWyz0zj
         u6gj0tt3Ijt9ePB8oIEahp/2s9p0W++gCwYF5W8JhSP6/qeQGpT8aq4w/wB5O0Gh6WDo
         FYTS3LvCSuYo/GRBwANP/GcP+QmlhYwyiqsljzYsfUB6O5Bmq3RJYpJ7GNOg5UdALH0t
         D/FiQc9Z0s9joAoQrubz2n3jNhp+BwfO+dlwTzgwuQG9KOFF4JajyE8HmcG1IjGkQFJ3
         7inbulyAxyrWHenurgoYf8tmHvp6UVJ49Z7fmJqrfAX32f+nje1MelPHF0hJP99XBfvP
         oMzQ==
X-Gm-Message-State: AOJu0YzBAyMaOZy5zsDFqWPzS6gG52ttOicRXHUCM1v/4D/mul9H1BQY
	2ngsLH6IKF01ULCB189+PHEjcYyxuRaOkmz6ic/xAMUOPyluGxAwzf+L9vUwrAspotCrVBeZOXZ
	KWjkB2xPGhR/Xk7mp9kciPJCiDYMhxd/fh/G0ty/OdbLpdgbahf9osvDrVat1K52q
X-Gm-Gg: ASbGncs/VF0hV0D5E2ioSiSlbKykEUGbn7ZxGDhN/WopipJW+1MYODI+PhV+fNHrMJO
	/jQ61rl6aWV5egLZT4FQ/FW7ZF7u9dibaKwsX5RHiqbRxh9uJB8GC57lqDTsg65UTG1sgELT6lz
	AZ2wWfQe3/GgOZk0xdEuPa4Zw/uHoa5GA252LkTGNXEKRdS5nM30SdxXsxnVlhW6AgDV+B7cRJB
	fJTJOfox6QV4sqWmDCgaqNPaqAQD/DQ+IuFXfcoEtRDbXfTxpnICm3037H5lc12Laabf4aekni1
	atOvLMMpixn6vxHgyGVARxaC0FqUOVxbZKZsyoLFiFD1KH7QRMBahPoT
X-Received: by 2002:a05:6808:3c89:b0:3eb:5c27:f75c with SMTP id 5614622812f47-3ef2ec96edemr14883579b6e.12.1736831152085;
        Mon, 13 Jan 2025 21:05:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE3gmdick5K1Gwg79wayWgfEZvhcQpgGj6YFljRD0zzdMoEYGxZ3On2Jv9CnQU0ZS1XCvdvOQ==
X-Received: by 2002:a05:6808:3c89:b0:3eb:5c27:f75c with SMTP id 5614622812f47-3ef2ec96edemr14883544b6e.12.1736831151259;
        Mon, 13 Jan 2025 21:05:51 -0800 (PST)
Received: from [192.168.86.65] (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5f882756603sm4001750eaf.29.2025.01.13.21.05.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 21:05:50 -0800 (PST)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Date: Mon, 13 Jan 2025 21:11:39 -0800
Subject: [PATCH v3 06/12] of: overlays: dwc3-flattening: Add Qualcomm Arm64
 board overlays
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250113-dwc3-refactor-v3-6-d1722075df7b@oss.qualcomm.com>
References: <20250113-dwc3-refactor-v3-0-d1722075df7b@oss.qualcomm.com>
In-Reply-To: <20250113-dwc3-refactor-v3-0-d1722075df7b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=214742;
 i=bjorn.andersson@oss.qualcomm.com; h=from:subject:message-id;
 bh=eVZ1RmTHKgbnk1IWLkQv54xVHndrD+zNyODhTeRc7zc=;
 b=owEBgwJ8/ZANAwAIAQsfOT8Nma3FAcsmYgBnhfIVxXk4c5S99sHGdclgsEd3uMJt9gL9q7gAI
 8c9p2Hjw/uJAkkEAAEIADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCZ4XyFRUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcULfA/9FXfyNOveoYMJOWiVPF2SZ6dEW2h2Yeu/LLqawtu
 2rloO9Ra8GQ99E3yIQ700inj7TvN8hEq/VxphcDaN6VinhK6waXYKZyYh5qCyRaQu2LslQYa5b2
 EslXO8RtN/4kqiOsY4AGHUbwVZ1qVEjEFexMeZCjQ6voRhYH31t29inn1x7jEzofeXojPgrPEj+
 iooyDiXmHHT2+Q2PTSHDITG1FpFnXqHDlcehCdlcD6GIrDevUJwB7zEXoVrDxt9UCtasjcKWlYi
 P2oSMKiQJoXoE/Ksed8xwPjqh1CxQa0PmoqqEkLzFnr5kDvlewG6Jdnh7T91ekLNUDL1GmBBlnz
 1WJdm93W6nchqY2tcpyzFcu9B0OV0dmoU4rGivFMMboM6+0o1JgQra6z21CI+0f7qyldAegxbz0
 NBjrh7fHdk/mBJdyISJccBvYBPOiiqpb7xoYSRdhJ1iirS2G0h0W8NDuxyHtSTC0oeQ/eEnglJG
 XuIhLqoVb1RBNGIVyhswg4qOUEKJISVR0+eyuZAbGt3yL/ROdzJCutLHYcxm8scRQyxlI+f+2gT
 OARuIlkgwyXXz1Dprt02rxxgoGhjlrrPFf/N+uLrdBYhEgnuCOzzfe9Yk1CaukeOtaCaIwO17kn
 lVfivvLwqGfyWVyhtKRI6O2vI6B4q0PdfXEY+RAYB+Y0=
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5
X-Proofpoint-GUID: Ao3Rrp8VKxmX-BvqDrhSTtw0yUaMdppX
X-Proofpoint-ORIG-GUID: Ao3Rrp8VKxmX-BvqDrhSTtw0yUaMdppX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 mlxlogscore=999 mlxscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 adultscore=0 bulkscore=0 phishscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501140039

Introduce the overlays necessary for migrating Qualcomm Arm64 boards
currently present in the upstream Linux kernel.

Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
 drivers/of/overlays/dwc3-flattening/Makefile       |  84 +++
 .../of/overlays/dwc3-flattening/dwc3-flattening.c  | 588 +++++++++++++++++++++
 .../of/overlays/dwc3-flattening/dwc3-flattening.h  | 168 ++++++
 .../overlays/dwc3-flattening/dwc3-qcom_apq8094.dts |  32 ++
 .../overlays/dwc3-flattening/dwc3-qcom_apq8096.dts |  60 +++
 .../dwc3-qcom_apq8096_inforce_ifc6640.dts          |  58 ++
 .../overlays/dwc3-flattening/dwc3-qcom_ipq5018.dts |  28 +
 .../overlays/dwc3-flattening/dwc3-qcom_ipq5332.dts |  32 ++
 .../overlays/dwc3-flattening/dwc3-qcom_ipq5424.dts |  58 ++
 .../overlays/dwc3-flattening/dwc3-qcom_ipq6018.dts |  54 ++
 .../overlays/dwc3-flattening/dwc3-qcom_ipq8074.dts |  58 ++
 .../overlays/dwc3-flattening/dwc3-qcom_ipq9574.dts |  29 +
 .../overlays/dwc3-flattening/dwc3-qcom_msm8953.dts |  32 ++
 .../overlays/dwc3-flattening/dwc3-qcom_msm8992.dts |  32 ++
 .../overlays/dwc3-flattening/dwc3-qcom_msm8994.dts |  32 ++
 .../overlays/dwc3-flattening/dwc3-qcom_msm8996.dts |  58 ++
 .../dwc3-qcom_msm8996_oneplus_oneplus3.dts         |  56 ++
 .../dwc3-qcom_msm8996_oneplus_oneplus3t.dts        |  56 ++
 .../dwc3-qcom_msm8996_sony_dora_row.dts            |  57 ++
 .../dwc3-qcom_msm8996_sony_kagura_row.dts          |  57 ++
 .../dwc3-qcom_msm8996_sony_keyaki_row.dts          |  57 ++
 .../dwc3-qcom_msm8996_xiaomi_gemini.dts            |  56 ++
 .../dwc3-qcom_msm8996_xiaomi_natrium.dts           |  56 ++
 .../dwc3-qcom_msm8996_xiaomi_scorpio.dts           |  56 ++
 .../overlays/dwc3-flattening/dwc3-qcom_msm8998.dts |  34 ++
 .../dwc3-qcom_msm8998_fxtec_pro1.dts               |  35 ++
 .../dwc3-qcom_msm8998_oneplus_cheeseburger.dts     |  32 ++
 .../dwc3-qcom_msm8998_oneplus_dumpling.dts         |  32 ++
 .../dwc3-qcom_msm8998_sony_xperia_lilac.dts        |  35 ++
 .../dwc3-qcom_msm8998_sony_xperia_maple.dts        |  35 ++
 .../dwc3-qcom_msm8998_sony_xperia_poplar.dts       |  35 ++
 .../dwc3-qcom_msm8998_xiaomi_sagit.dts             |  32 ++
 .../overlays/dwc3-flattening/dwc3-qcom_qcm2290.dts |  32 ++
 .../overlays/dwc3-flattening/dwc3-qcom_qcm6490.dts |  63 +++
 .../overlays/dwc3-flattening/dwc3-qcom_qcs404.dts  |  56 ++
 .../overlays/dwc3-flattening/dwc3-qcom_qcs615.dts  |  62 +++
 .../overlays/dwc3-flattening/dwc3-qcom_qcs8300.dts |  62 +++
 .../overlays/dwc3-flattening/dwc3-qcom_qdu1000.dts |  38 ++
 .../overlays/dwc3-flattening/dwc3-qcom_qru1000.dts |  38 ++
 .../overlays/dwc3-flattening/dwc3-qcom_sa8155p.dts |  71 +++
 .../overlays/dwc3-flattening/dwc3-qcom_sa8540p.dts | 129 +++++
 .../overlays/dwc3-flattening/dwc3-qcom_sa8775p.dts |  90 ++++
 .../dwc3-flattening/dwc3-qcom_sar2130p.dts         |  39 ++
 .../overlays/dwc3-flattening/dwc3-qcom_sc7180.dts  |  39 ++
 .../overlays/dwc3-flattening/dwc3-qcom_sc7280.dts  |  63 +++
 .../overlays/dwc3-flattening/dwc3-qcom_sc8180x.dts | 109 ++++
 .../dwc3-flattening/dwc3-qcom_sc8280xp.dts         | 129 +++++
 .../dwc3-qcom_sc8280xp_microsoft_blackrock.dts     | 121 +++++
 .../overlays/dwc3-flattening/dwc3-qcom_sda660.dts  |  59 +++
 .../overlays/dwc3-flattening/dwc3-qcom_sdm450.dts  |  33 ++
 .../overlays/dwc3-flattening/dwc3-qcom_sdm630.dts  |  57 ++
 .../overlays/dwc3-flattening/dwc3-qcom_sdm632.dts  |  32 ++
 .../overlays/dwc3-flattening/dwc3-qcom_sdm636.dts  |  59 +++
 .../overlays/dwc3-flattening/dwc3-qcom_sdm660.dts  |  57 ++
 .../overlays/dwc3-flattening/dwc3-qcom_sdm670.dts  |  36 ++
 .../overlays/dwc3-flattening/dwc3-qcom_sdm845.dts  |  64 +++
 .../dwc3-qcom_sdm845_lenovo_yoga_c630.dts          |  67 +++
 .../dwc3-flattening/dwc3-qcom_sdm845_lg_judyln.dts |  67 +++
 .../dwc3-flattening/dwc3-qcom_sdm845_lg_judyp.dts  |  67 +++
 .../dwc3-qcom_sdm845_qcom_sdm845_mtp.dts           |  67 +++
 .../dwc3-qcom_sdm845_samsung_starqltechn.dts       |  67 +++
 .../dwc3-qcom_sdm845_samsung_w737.dts              |  67 +++
 .../dwc3-qcom_sdm845_shift_axolotl.dts             |  67 +++
 .../dwc3-qcom_sdm845_thundercomm_db845c.dts        |  67 +++
 .../dwc3-qcom_sdm845_xiaomi_beryllium.dts          |  67 +++
 .../dwc3-qcom_sdm845_xiaomi_beryllium_ebbg.dts     |  67 +++
 .../overlays/dwc3-flattening/dwc3-qcom_sdx75.dts   |  36 ++
 .../overlays/dwc3-flattening/dwc3-qcom_sm4250.dts  |  37 ++
 .../dwc3-qcom_sm4250_oneplus_billie2.dts           |  35 ++
 .../overlays/dwc3-flattening/dwc3-qcom_sm6115.dts  |  37 ++
 .../dwc3-qcom_sm6115_lenovo_j606f.dts              |  35 ++
 .../overlays/dwc3-flattening/dwc3-qcom_sm6125.dts  |  36 ++
 .../overlays/dwc3-flattening/dwc3-qcom_sm6350.dts  |  39 ++
 .../overlays/dwc3-flattening/dwc3-qcom_sm6375.dts  |  36 ++
 .../overlays/dwc3-flattening/dwc3-qcom_sm7125.dts  |  39 ++
 .../overlays/dwc3-flattening/dwc3-qcom_sm7225.dts  |  39 ++
 .../overlays/dwc3-flattening/dwc3-qcom_sm7325.dts  |  60 +++
 .../overlays/dwc3-flattening/dwc3-qcom_sm8150.dts  |  67 +++
 .../overlays/dwc3-flattening/dwc3-qcom_sm8250.dts  |  67 +++
 .../dwc3-qcom_sm8250_xiaomi_elish.dts              |  64 +++
 .../overlays/dwc3-flattening/dwc3-qcom_sm8350.dts  |  67 +++
 .../dwc3-qcom_sm8350_microsoft_surface_duo2.dts    |  67 +++
 .../dwc3-qcom_sm8350_qcom_sm8350_hdk.dts           |  69 +++
 .../dwc3-qcom_sm8350_qcom_sm8350_mtp.dts           |  67 +++
 .../dwc3-qcom_sm8350_sony_pdx214_generic.dts       |  67 +++
 .../dwc3-qcom_sm8350_sony_pdx215_generic.dts       |  67 +++
 .../overlays/dwc3-flattening/dwc3-qcom_sm8450.dts  |  39 ++
 .../overlays/dwc3-flattening/dwc3-qcom_sm8550.dts  |  39 ++
 .../overlays/dwc3-flattening/dwc3-qcom_sm8650.dts  |  39 ++
 .../dwc3-flattening/dwc3-qcom_x1e80100.dts         | 153 ++++++
 .../dwc3-qcom_x1e80100_hp_omnibook_x14.dts         | 149 ++++++
 91 files changed, 5782 insertions(+)

diff --git a/drivers/of/overlays/dwc3-flattening/Makefile b/drivers/of/overlays/dwc3-flattening/Makefile
index 248ddabd424e..afc509d97d1b 100644
--- a/drivers/of/overlays/dwc3-flattening/Makefile
+++ b/drivers/of/overlays/dwc3-flattening/Makefile
@@ -2,9 +2,93 @@
 
 obj-$(CONFIG_OF_OVERLAYS_DWC3_FLATTENING) += dwc3-flattening-overlay.o
 dwc3-flattening-overlay-y += dwc3-flattening.o
+dwc3-flattening-overlay-y += dwc3-qcom_apq8094.dtb.o
+dwc3-flattening-overlay-y += dwc3-qcom_apq8096.dtb.o
+dwc3-flattening-overlay-y += dwc3-qcom_apq8096_inforce_ifc6640.dtb.o
 dwc3-flattening-overlay-y += dwc3-qcom_ipq4018.dtb.o
 dwc3-flattening-overlay-y += dwc3-qcom_ipq4018_8dev_jalapeno.dtb.o
 dwc3-flattening-overlay-y += dwc3-qcom_ipq4019.dtb.o
+dwc3-flattening-overlay-y += dwc3-qcom_ipq5018.dtb.o
+dwc3-flattening-overlay-y += dwc3-qcom_ipq5332.dtb.o
+dwc3-flattening-overlay-y += dwc3-qcom_ipq5424.dtb.o
+dwc3-flattening-overlay-y += dwc3-qcom_ipq6018.dtb.o
 dwc3-flattening-overlay-y += dwc3-qcom_ipq8064.dtb.o
+dwc3-flattening-overlay-y += dwc3-qcom_ipq8074.dtb.o
+dwc3-flattening-overlay-y += dwc3-qcom_ipq9574.dtb.o
+dwc3-flattening-overlay-y += dwc3-qcom_msm8953.dtb.o
+dwc3-flattening-overlay-y += dwc3-qcom_msm8992.dtb.o
+dwc3-flattening-overlay-y += dwc3-qcom_msm8994.dtb.o
+dwc3-flattening-overlay-y += dwc3-qcom_msm8996.dtb.o
+dwc3-flattening-overlay-y += dwc3-qcom_msm8996_oneplus_oneplus3.dtb.o
+dwc3-flattening-overlay-y += dwc3-qcom_msm8996_oneplus_oneplus3t.dtb.o
+dwc3-flattening-overlay-y += dwc3-qcom_msm8996_sony_dora_row.dtb.o
+dwc3-flattening-overlay-y += dwc3-qcom_msm8996_sony_kagura_row.dtb.o
+dwc3-flattening-overlay-y += dwc3-qcom_msm8996_sony_keyaki_row.dtb.o
+dwc3-flattening-overlay-y += dwc3-qcom_msm8996_xiaomi_gemini.dtb.o
+dwc3-flattening-overlay-y += dwc3-qcom_msm8996_xiaomi_natrium.dtb.o
+dwc3-flattening-overlay-y += dwc3-qcom_msm8996_xiaomi_scorpio.dtb.o
+dwc3-flattening-overlay-y += dwc3-qcom_msm8998.dtb.o
+dwc3-flattening-overlay-y += dwc3-qcom_msm8998_fxtec_pro1.dtb.o
+dwc3-flattening-overlay-y += dwc3-qcom_msm8998_oneplus_cheeseburger.dtb.o
+dwc3-flattening-overlay-y += dwc3-qcom_msm8998_oneplus_dumpling.dtb.o
+dwc3-flattening-overlay-y += dwc3-qcom_msm8998_sony_xperia_lilac.dtb.o
+dwc3-flattening-overlay-y += dwc3-qcom_msm8998_sony_xperia_maple.dtb.o
+dwc3-flattening-overlay-y += dwc3-qcom_msm8998_sony_xperia_poplar.dtb.o
+dwc3-flattening-overlay-y += dwc3-qcom_msm8998_xiaomi_sagit.dtb.o
+dwc3-flattening-overlay-y += dwc3-qcom_qcm2290.dtb.o
+dwc3-flattening-overlay-y += dwc3-qcom_qcm6490.dtb.o
+dwc3-flattening-overlay-y += dwc3-qcom_qcs404.dtb.o
+dwc3-flattening-overlay-y += dwc3-qcom_qcs615.dtb.o
+dwc3-flattening-overlay-y += dwc3-qcom_qcs8300.dtb.o
+dwc3-flattening-overlay-y += dwc3-qcom_qdu1000.dtb.o
+dwc3-flattening-overlay-y += dwc3-qcom_qru1000.dtb.o
+dwc3-flattening-overlay-y += dwc3-qcom_sa8155p.dtb.o
+dwc3-flattening-overlay-y += dwc3-qcom_sa8540p.dtb.o
+dwc3-flattening-overlay-y += dwc3-qcom_sa8775p.dtb.o
+dwc3-flattening-overlay-y += dwc3-qcom_sar2130p.dtb.o
+dwc3-flattening-overlay-y += dwc3-qcom_sc7180.dtb.o
+dwc3-flattening-overlay-y += dwc3-qcom_sc7280.dtb.o
+dwc3-flattening-overlay-y += dwc3-qcom_sc8180x.dtb.o
+dwc3-flattening-overlay-y += dwc3-qcom_sc8280xp.dtb.o
+dwc3-flattening-overlay-y += dwc3-qcom_sc8280xp_microsoft_blackrock.dtb.o
+dwc3-flattening-overlay-y += dwc3-qcom_sda660.dtb.o
+dwc3-flattening-overlay-y += dwc3-qcom_sdm450.dtb.o
+dwc3-flattening-overlay-y += dwc3-qcom_sdm630.dtb.o
+dwc3-flattening-overlay-y += dwc3-qcom_sdm632.dtb.o
+dwc3-flattening-overlay-y += dwc3-qcom_sdm636.dtb.o
+dwc3-flattening-overlay-y += dwc3-qcom_sdm660.dtb.o
+dwc3-flattening-overlay-y += dwc3-qcom_sdm670.dtb.o
+dwc3-flattening-overlay-y += dwc3-qcom_sdm845.dtb.o
+dwc3-flattening-overlay-y += dwc3-qcom_sdm845_lenovo_yoga_c630.dtb.o
+dwc3-flattening-overlay-y += dwc3-qcom_sdm845_lg_judyln.dtb.o
+dwc3-flattening-overlay-y += dwc3-qcom_sdm845_lg_judyp.dtb.o
+dwc3-flattening-overlay-y += dwc3-qcom_sdm845_qcom_sdm845_mtp.dtb.o
+dwc3-flattening-overlay-y += dwc3-qcom_sdm845_samsung_starqltechn.dtb.o
+dwc3-flattening-overlay-y += dwc3-qcom_sdm845_samsung_w737.dtb.o
+dwc3-flattening-overlay-y += dwc3-qcom_sdm845_shift_axolotl.dtb.o
+dwc3-flattening-overlay-y += dwc3-qcom_sdm845_thundercomm_db845c.dtb.o
+dwc3-flattening-overlay-y += dwc3-qcom_sdm845_xiaomi_beryllium.dtb.o
+dwc3-flattening-overlay-y += dwc3-qcom_sdm845_xiaomi_beryllium_ebbg.dtb.o
 dwc3-flattening-overlay-y += dwc3-qcom_sdx55.dtb.o
 dwc3-flattening-overlay-y += dwc3-qcom_sdx65.dtb.o
+dwc3-flattening-overlay-y += dwc3-qcom_sdx75.dtb.o
+dwc3-flattening-overlay-y += dwc3-qcom_sm4250.dtb.o
+dwc3-flattening-overlay-y += dwc3-qcom_sm4250_oneplus_billie2.dtb.o
+dwc3-flattening-overlay-y += dwc3-qcom_sm6115.dtb.o
+dwc3-flattening-overlay-y += dwc3-qcom_sm6115_lenovo_j606f.dtb.o
+dwc3-flattening-overlay-y += dwc3-qcom_sm6125.dtb.o
+dwc3-flattening-overlay-y += dwc3-qcom_sm6350.dtb.o
+dwc3-flattening-overlay-y += dwc3-qcom_sm6375.dtb.o
+dwc3-flattening-overlay-y += dwc3-qcom_sm7125.dtb.o
+dwc3-flattening-overlay-y += dwc3-qcom_sm7225.dtb.o
+dwc3-flattening-overlay-y += dwc3-qcom_sm7325.dtb.o
+dwc3-flattening-overlay-y += dwc3-qcom_sm8150.dtb.o
+dwc3-flattening-overlay-y += dwc3-qcom_sm8250.dtb.o
+dwc3-flattening-overlay-y += dwc3-qcom_sm8250_xiaomi_elish.dtb.o
+dwc3-flattening-overlay-y += dwc3-qcom_sm8350.dtb.o
+dwc3-flattening-overlay-y += dwc3-qcom_sm8350_qcom_sm8350_hdk.dtb.o
+dwc3-flattening-overlay-y += dwc3-qcom_sm8450.dtb.o
+dwc3-flattening-overlay-y += dwc3-qcom_sm8550.dtb.o
+dwc3-flattening-overlay-y += dwc3-qcom_sm8650.dtb.o
+dwc3-flattening-overlay-y += dwc3-qcom_x1e80100.dtb.o
+dwc3-flattening-overlay-y += dwc3-qcom_x1e80100_hp_omnibook_x14.dtb.o
diff --git a/drivers/of/overlays/dwc3-flattening/dwc3-flattening.c b/drivers/of/overlays/dwc3-flattening/dwc3-flattening.c
index 0a3a31c5088b..d33cdf6661c0 100644
--- a/drivers/of/overlays/dwc3-flattening/dwc3-flattening.c
+++ b/drivers/of/overlays/dwc3-flattening/dwc3-flattening.c
@@ -21,6 +21,24 @@ struct dwc3_overlay_data {
 	const char *migrate_match;
 };
 
+static const struct dwc3_overlay_data dwc3_qcom_apq8094_overlay = {
+	.fdt = __dtb_dwc3_qcom_apq8094_begin,
+	.end = __dtb_dwc3_qcom_apq8094_end,
+	.migrate_match = "qcom,dwc3",
+};
+
+static const struct dwc3_overlay_data dwc3_qcom_apq8096_overlay = {
+	.fdt = __dtb_dwc3_qcom_apq8096_begin,
+	.end = __dtb_dwc3_qcom_apq8096_end,
+	.migrate_match = "qcom,dwc3",
+};
+
+static const struct dwc3_overlay_data dwc3_qcom_apq8096_inforce_ifc6640_overlay = {
+	.fdt = __dtb_dwc3_qcom_apq8096_inforce_ifc6640_begin,
+	.end = __dtb_dwc3_qcom_apq8096_inforce_ifc6640_end,
+	.migrate_match = "qcom,dwc3",
+};
+
 static const struct dwc3_overlay_data dwc3_qcom_ipq4018_overlay = {
 	.fdt = __dtb_dwc3_qcom_ipq4018_begin,
 	.end = __dtb_dwc3_qcom_ipq4018_end,
@@ -39,12 +57,372 @@ static const struct dwc3_overlay_data dwc3_qcom_ipq4019_overlay = {
 	.migrate_match = "qcom,dwc3",
 };
 
+static const struct dwc3_overlay_data dwc3_qcom_ipq5018_overlay = {
+	.fdt = __dtb_dwc3_qcom_ipq5018_begin,
+	.end = __dtb_dwc3_qcom_ipq5018_end,
+	.migrate_match = "qcom,dwc3",
+};
+
+static const struct dwc3_overlay_data dwc3_qcom_ipq5332_overlay = {
+	.fdt = __dtb_dwc3_qcom_ipq5332_begin,
+	.end = __dtb_dwc3_qcom_ipq5332_end,
+	.migrate_match = "qcom,dwc3",
+};
+
+static const struct dwc3_overlay_data dwc3_qcom_ipq5424_overlay = {
+	.fdt = __dtb_dwc3_qcom_ipq5424_begin,
+	.end = __dtb_dwc3_qcom_ipq5424_end,
+	.migrate_match = "qcom,dwc3",
+};
+
+static const struct dwc3_overlay_data dwc3_qcom_ipq6018_overlay = {
+	.fdt = __dtb_dwc3_qcom_ipq6018_begin,
+	.end = __dtb_dwc3_qcom_ipq6018_end,
+	.migrate_match = "qcom,dwc3",
+};
+
 static const struct dwc3_overlay_data dwc3_qcom_ipq8064_overlay = {
 	.fdt = __dtb_dwc3_qcom_ipq8064_begin,
 	.end = __dtb_dwc3_qcom_ipq8064_end,
 	.migrate_match = "qcom,dwc3",
 };
 
+static const struct dwc3_overlay_data dwc3_qcom_ipq8074_overlay = {
+	.fdt = __dtb_dwc3_qcom_ipq8074_begin,
+	.end = __dtb_dwc3_qcom_ipq8074_end,
+	.migrate_match = "qcom,dwc3",
+};
+
+static const struct dwc3_overlay_data dwc3_qcom_ipq9574_overlay = {
+	.fdt = __dtb_dwc3_qcom_ipq9574_begin,
+	.end = __dtb_dwc3_qcom_ipq9574_end,
+	.migrate_match = "qcom,dwc3",
+};
+
+static const struct dwc3_overlay_data dwc3_qcom_msm8953_overlay = {
+	.fdt = __dtb_dwc3_qcom_msm8953_begin,
+	.end = __dtb_dwc3_qcom_msm8953_end,
+	.migrate_match = "qcom,dwc3",
+};
+
+static const struct dwc3_overlay_data dwc3_qcom_msm8992_overlay = {
+	.fdt = __dtb_dwc3_qcom_msm8992_begin,
+	.end = __dtb_dwc3_qcom_msm8992_end,
+	.migrate_match = "qcom,dwc3",
+};
+
+static const struct dwc3_overlay_data dwc3_qcom_msm8994_overlay = {
+	.fdt = __dtb_dwc3_qcom_msm8994_begin,
+	.end = __dtb_dwc3_qcom_msm8994_end,
+	.migrate_match = "qcom,dwc3",
+};
+
+static const struct dwc3_overlay_data dwc3_qcom_msm8996_overlay = {
+	.fdt = __dtb_dwc3_qcom_msm8996_begin,
+	.end = __dtb_dwc3_qcom_msm8996_end,
+	.migrate_match = "qcom,dwc3",
+};
+
+static const struct dwc3_overlay_data dwc3_qcom_msm8996_oneplus_oneplus3_overlay = {
+	.fdt = __dtb_dwc3_qcom_msm8996_oneplus_oneplus3_begin,
+	.end = __dtb_dwc3_qcom_msm8996_oneplus_oneplus3_end,
+	.migrate_match = "qcom,dwc3",
+};
+
+static const struct dwc3_overlay_data dwc3_qcom_msm8996_oneplus_oneplus3t_overlay = {
+	.fdt = __dtb_dwc3_qcom_msm8996_oneplus_oneplus3t_begin,
+	.end = __dtb_dwc3_qcom_msm8996_oneplus_oneplus3t_end,
+	.migrate_match = "qcom,dwc3",
+};
+
+static const struct dwc3_overlay_data dwc3_qcom_msm8996_sony_dora_row_overlay = {
+	.fdt = __dtb_dwc3_qcom_msm8996_sony_dora_row_begin,
+	.end = __dtb_dwc3_qcom_msm8996_sony_dora_row_end,
+	.migrate_match = "qcom,dwc3",
+};
+
+static const struct dwc3_overlay_data dwc3_qcom_msm8996_sony_kagura_row_overlay = {
+	.fdt = __dtb_dwc3_qcom_msm8996_sony_kagura_row_begin,
+	.end = __dtb_dwc3_qcom_msm8996_sony_kagura_row_end,
+	.migrate_match = "qcom,dwc3",
+};
+
+static const struct dwc3_overlay_data dwc3_qcom_msm8996_sony_keyaki_row_overlay = {
+	.fdt = __dtb_dwc3_qcom_msm8996_sony_keyaki_row_begin,
+	.end = __dtb_dwc3_qcom_msm8996_sony_keyaki_row_end,
+	.migrate_match = "qcom,dwc3",
+};
+
+static const struct dwc3_overlay_data dwc3_qcom_msm8996_xiaomi_gemini_overlay = {
+	.fdt = __dtb_dwc3_qcom_msm8996_xiaomi_gemini_begin,
+	.end = __dtb_dwc3_qcom_msm8996_xiaomi_gemini_end,
+	.migrate_match = "qcom,dwc3",
+};
+
+static const struct dwc3_overlay_data dwc3_qcom_msm8996_xiaomi_natrium_overlay = {
+	.fdt = __dtb_dwc3_qcom_msm8996_xiaomi_natrium_begin,
+	.end = __dtb_dwc3_qcom_msm8996_xiaomi_natrium_end,
+	.migrate_match = "qcom,dwc3",
+};
+
+static const struct dwc3_overlay_data dwc3_qcom_msm8996_xiaomi_scorpio_overlay = {
+	.fdt = __dtb_dwc3_qcom_msm8996_xiaomi_scorpio_begin,
+	.end = __dtb_dwc3_qcom_msm8996_xiaomi_scorpio_end,
+	.migrate_match = "qcom,dwc3",
+};
+
+static const struct dwc3_overlay_data dwc3_qcom_msm8998_overlay = {
+	.fdt = __dtb_dwc3_qcom_msm8998_begin,
+	.end = __dtb_dwc3_qcom_msm8998_end,
+	.migrate_match = "qcom,dwc3",
+};
+
+static const struct dwc3_overlay_data dwc3_qcom_msm8998_fxtec_pro1_overlay = {
+	.fdt = __dtb_dwc3_qcom_msm8998_fxtec_pro1_begin,
+	.end = __dtb_dwc3_qcom_msm8998_fxtec_pro1_end,
+	.migrate_match = "qcom,dwc3",
+};
+
+static const struct dwc3_overlay_data dwc3_qcom_msm8998_oneplus_cheeseburger_overlay = {
+	.fdt = __dtb_dwc3_qcom_msm8998_oneplus_cheeseburger_begin,
+	.end = __dtb_dwc3_qcom_msm8998_oneplus_cheeseburger_end,
+	.migrate_match = "qcom,dwc3",
+};
+
+static const struct dwc3_overlay_data dwc3_qcom_msm8998_oneplus_dumpling_overlay = {
+	.fdt = __dtb_dwc3_qcom_msm8998_oneplus_dumpling_begin,
+	.end = __dtb_dwc3_qcom_msm8998_oneplus_dumpling_end,
+	.migrate_match = "qcom,dwc3",
+};
+
+static const struct dwc3_overlay_data dwc3_qcom_msm8998_sony_xperia_lilac_overlay = {
+	.fdt = __dtb_dwc3_qcom_msm8998_sony_xperia_lilac_begin,
+	.end = __dtb_dwc3_qcom_msm8998_sony_xperia_lilac_end,
+	.migrate_match = "qcom,dwc3",
+};
+
+static const struct dwc3_overlay_data dwc3_qcom_msm8998_sony_xperia_maple_overlay = {
+	.fdt = __dtb_dwc3_qcom_msm8998_sony_xperia_maple_begin,
+	.end = __dtb_dwc3_qcom_msm8998_sony_xperia_maple_end,
+	.migrate_match = "qcom,dwc3",
+};
+
+static const struct dwc3_overlay_data dwc3_qcom_msm8998_sony_xperia_poplar_overlay = {
+	.fdt = __dtb_dwc3_qcom_msm8998_sony_xperia_poplar_begin,
+	.end = __dtb_dwc3_qcom_msm8998_sony_xperia_poplar_end,
+	.migrate_match = "qcom,dwc3",
+};
+
+static const struct dwc3_overlay_data dwc3_qcom_msm8998_xiaomi_sagit_overlay = {
+	.fdt = __dtb_dwc3_qcom_msm8998_xiaomi_sagit_begin,
+	.end = __dtb_dwc3_qcom_msm8998_xiaomi_sagit_end,
+	.migrate_match = "qcom,dwc3",
+};
+
+static const struct dwc3_overlay_data dwc3_qcom_qcm2290_overlay = {
+	.fdt = __dtb_dwc3_qcom_qcm2290_begin,
+	.end = __dtb_dwc3_qcom_qcm2290_end,
+	.migrate_match = "qcom,dwc3",
+};
+
+static const struct dwc3_overlay_data dwc3_qcom_qcm6490_overlay = {
+	.fdt = __dtb_dwc3_qcom_qcm6490_begin,
+	.end = __dtb_dwc3_qcom_qcm6490_end,
+	.migrate_match = "qcom,dwc3",
+};
+
+static const struct dwc3_overlay_data dwc3_qcom_qcs404_overlay = {
+	.fdt = __dtb_dwc3_qcom_qcs404_begin,
+	.end = __dtb_dwc3_qcom_qcs404_end,
+	.migrate_match = "qcom,dwc3",
+};
+
+static const struct dwc3_overlay_data dwc3_qcom_qcs615_overlay = {
+	.fdt = __dtb_dwc3_qcom_qcs615_begin,
+	.end = __dtb_dwc3_qcom_qcs615_end,
+	.migrate_match = "qcom,dwc3",
+};
+
+static const struct dwc3_overlay_data dwc3_qcom_qcs8300_overlay = {
+	.fdt = __dtb_dwc3_qcom_qcs8300_begin,
+	.end = __dtb_dwc3_qcom_qcs8300_end,
+	.migrate_match = "qcom,dwc3",
+};
+
+static const struct dwc3_overlay_data dwc3_qcom_qdu1000_overlay = {
+	.fdt = __dtb_dwc3_qcom_qdu1000_begin,
+	.end = __dtb_dwc3_qcom_qdu1000_end,
+	.migrate_match = "qcom,dwc3",
+};
+
+static const struct dwc3_overlay_data dwc3_qcom_qru1000_overlay = {
+	.fdt = __dtb_dwc3_qcom_qru1000_begin,
+	.end = __dtb_dwc3_qcom_qru1000_end,
+	.migrate_match = "qcom,dwc3",
+};
+
+static const struct dwc3_overlay_data dwc3_qcom_sa8155p_overlay = {
+	.fdt = __dtb_dwc3_qcom_sa8155p_begin,
+	.end = __dtb_dwc3_qcom_sa8155p_end,
+	.migrate_match = "qcom,dwc3",
+};
+
+static const struct dwc3_overlay_data dwc3_qcom_sa8540p_overlay = {
+	.fdt = __dtb_dwc3_qcom_sa8540p_begin,
+	.end = __dtb_dwc3_qcom_sa8540p_end,
+	.migrate_match = "qcom,dwc3",
+};
+
+static const struct dwc3_overlay_data dwc3_qcom_sa8775p_overlay = {
+	.fdt = __dtb_dwc3_qcom_sa8775p_begin,
+	.end = __dtb_dwc3_qcom_sa8775p_end,
+	.migrate_match = "qcom,dwc3",
+};
+
+static const struct dwc3_overlay_data dwc3_qcom_sar2130p_overlay = {
+	.fdt = __dtb_dwc3_qcom_sar2130p_begin,
+	.end = __dtb_dwc3_qcom_sar2130p_end,
+	.migrate_match = "qcom,dwc3",
+};
+
+static const struct dwc3_overlay_data dwc3_qcom_sc7180_overlay = {
+	.fdt = __dtb_dwc3_qcom_sc7180_begin,
+	.end = __dtb_dwc3_qcom_sc7180_end,
+	.migrate_match = "qcom,dwc3",
+};
+
+static const struct dwc3_overlay_data dwc3_qcom_sc7280_overlay = {
+	.fdt = __dtb_dwc3_qcom_sc7280_begin,
+	.end = __dtb_dwc3_qcom_sc7280_end,
+	.migrate_match = "qcom,dwc3",
+};
+
+static const struct dwc3_overlay_data dwc3_qcom_sc8180x_overlay = {
+	.fdt = __dtb_dwc3_qcom_sc8180x_begin,
+	.end = __dtb_dwc3_qcom_sc8180x_end,
+	.migrate_match = "qcom,dwc3",
+};
+
+static const struct dwc3_overlay_data dwc3_qcom_sc8280xp_overlay = {
+	.fdt = __dtb_dwc3_qcom_sc8280xp_begin,
+	.end = __dtb_dwc3_qcom_sc8280xp_end,
+	.migrate_match = "qcom,dwc3",
+};
+
+static const struct dwc3_overlay_data dwc3_qcom_sc8280xp_microsoft_blackrock_overlay = {
+	.fdt = __dtb_dwc3_qcom_sc8280xp_microsoft_blackrock_begin,
+	.end = __dtb_dwc3_qcom_sc8280xp_microsoft_blackrock_end,
+	.migrate_match = "qcom,dwc3",
+};
+
+static const struct dwc3_overlay_data dwc3_qcom_sda660_overlay = {
+	.fdt = __dtb_dwc3_qcom_sda660_begin,
+	.end = __dtb_dwc3_qcom_sda660_end,
+	.migrate_match = "qcom,dwc3",
+};
+
+static const struct dwc3_overlay_data dwc3_qcom_sdm450_overlay = {
+	.fdt = __dtb_dwc3_qcom_sdm450_begin,
+	.end = __dtb_dwc3_qcom_sdm450_end,
+	.migrate_match = "qcom,dwc3",
+};
+
+static const struct dwc3_overlay_data dwc3_qcom_sdm630_overlay = {
+	.fdt = __dtb_dwc3_qcom_sdm630_begin,
+	.end = __dtb_dwc3_qcom_sdm630_end,
+	.migrate_match = "qcom,dwc3",
+};
+
+static const struct dwc3_overlay_data dwc3_qcom_sdm632_overlay = {
+	.fdt = __dtb_dwc3_qcom_sdm632_begin,
+	.end = __dtb_dwc3_qcom_sdm632_end,
+	.migrate_match = "qcom,dwc3",
+};
+
+static const struct dwc3_overlay_data dwc3_qcom_sdm636_overlay = {
+	.fdt = __dtb_dwc3_qcom_sdm636_begin,
+	.end = __dtb_dwc3_qcom_sdm636_end,
+	.migrate_match = "qcom,dwc3",
+};
+
+static const struct dwc3_overlay_data dwc3_qcom_sdm660_overlay = {
+	.fdt = __dtb_dwc3_qcom_sdm660_begin,
+	.end = __dtb_dwc3_qcom_sdm660_end,
+	.migrate_match = "qcom,dwc3",
+};
+
+static const struct dwc3_overlay_data dwc3_qcom_sdm670_overlay = {
+	.fdt = __dtb_dwc3_qcom_sdm670_begin,
+	.end = __dtb_dwc3_qcom_sdm670_end,
+	.migrate_match = "qcom,dwc3",
+};
+
+static const struct dwc3_overlay_data dwc3_qcom_sdm845_overlay = {
+	.fdt = __dtb_dwc3_qcom_sdm845_begin,
+	.end = __dtb_dwc3_qcom_sdm845_end,
+	.migrate_match = "qcom,dwc3",
+};
+
+static const struct dwc3_overlay_data dwc3_qcom_sdm845_lenovo_yoga_c630_overlay = {
+	.fdt = __dtb_dwc3_qcom_sdm845_lenovo_yoga_c630_begin,
+	.end = __dtb_dwc3_qcom_sdm845_lenovo_yoga_c630_end,
+	.migrate_match = "qcom,dwc3",
+};
+
+static const struct dwc3_overlay_data dwc3_qcom_sdm845_lg_judyln_overlay = {
+	.fdt = __dtb_dwc3_qcom_sdm845_lg_judyln_begin,
+	.end = __dtb_dwc3_qcom_sdm845_lg_judyln_end,
+	.migrate_match = "qcom,dwc3",
+};
+
+static const struct dwc3_overlay_data dwc3_qcom_sdm845_lg_judyp_overlay = {
+	.fdt = __dtb_dwc3_qcom_sdm845_lg_judyp_begin,
+	.end = __dtb_dwc3_qcom_sdm845_lg_judyp_end,
+	.migrate_match = "qcom,dwc3",
+};
+
+static const struct dwc3_overlay_data dwc3_qcom_sdm845_qcom_sdm845_mtp_overlay = {
+	.fdt = __dtb_dwc3_qcom_sdm845_qcom_sdm845_mtp_begin,
+	.end = __dtb_dwc3_qcom_sdm845_qcom_sdm845_mtp_end,
+	.migrate_match = "qcom,dwc3",
+};
+
+static const struct dwc3_overlay_data dwc3_qcom_sdm845_samsung_starqltechn_overlay = {
+	.fdt = __dtb_dwc3_qcom_sdm845_samsung_starqltechn_begin,
+	.end = __dtb_dwc3_qcom_sdm845_samsung_starqltechn_end,
+	.migrate_match = "qcom,dwc3",
+};
+
+static const struct dwc3_overlay_data dwc3_qcom_sdm845_samsung_w737_overlay = {
+	.fdt = __dtb_dwc3_qcom_sdm845_samsung_w737_begin,
+	.end = __dtb_dwc3_qcom_sdm845_samsung_w737_end,
+	.migrate_match = "qcom,dwc3",
+};
+
+static const struct dwc3_overlay_data dwc3_qcom_sdm845_shift_axolotl_overlay = {
+	.fdt = __dtb_dwc3_qcom_sdm845_shift_axolotl_begin,
+	.end = __dtb_dwc3_qcom_sdm845_shift_axolotl_end,
+	.migrate_match = "qcom,dwc3",
+};
+
+static const struct dwc3_overlay_data dwc3_qcom_sdm845_thundercomm_db845c_overlay = {
+	.fdt = __dtb_dwc3_qcom_sdm845_thundercomm_db845c_begin,
+	.end = __dtb_dwc3_qcom_sdm845_thundercomm_db845c_end,
+	.migrate_match = "qcom,dwc3",
+};
+
+static const struct dwc3_overlay_data dwc3_qcom_sdm845_xiaomi_beryllium_overlay = {
+	.fdt = __dtb_dwc3_qcom_sdm845_xiaomi_beryllium_begin,
+	.end = __dtb_dwc3_qcom_sdm845_xiaomi_beryllium_end,
+	.migrate_match = "qcom,dwc3",
+};
+
+static const struct dwc3_overlay_data dwc3_qcom_sdm845_xiaomi_beryllium_ebbg_overlay = {
+	.fdt = __dtb_dwc3_qcom_sdm845_xiaomi_beryllium_ebbg_begin,
+	.end = __dtb_dwc3_qcom_sdm845_xiaomi_beryllium_ebbg_end,
+	.migrate_match = "qcom,dwc3",
+};
+
 static const struct dwc3_overlay_data dwc3_qcom_sdx55_overlay = {
 	.fdt = __dtb_dwc3_qcom_sdx55_begin,
 	.end = __dtb_dwc3_qcom_sdx55_end,
@@ -57,13 +435,223 @@ static const struct dwc3_overlay_data dwc3_qcom_sdx65_overlay = {
 	.migrate_match = "qcom,dwc3",
 };
 
+static const struct dwc3_overlay_data dwc3_qcom_sdx75_overlay = {
+	.fdt = __dtb_dwc3_qcom_sdx75_begin,
+	.end = __dtb_dwc3_qcom_sdx75_end,
+	.migrate_match = "qcom,dwc3",
+};
+
+static const struct dwc3_overlay_data dwc3_qcom_sm4250_overlay = {
+	.fdt = __dtb_dwc3_qcom_sm4250_begin,
+	.end = __dtb_dwc3_qcom_sm4250_end,
+	.migrate_match = "qcom,dwc3",
+};
+
+static const struct dwc3_overlay_data dwc3_qcom_sm4250_oneplus_billie2_overlay = {
+	.fdt = __dtb_dwc3_qcom_sm4250_oneplus_billie2_begin,
+	.end = __dtb_dwc3_qcom_sm4250_oneplus_billie2_end,
+	.migrate_match = "qcom,dwc3",
+};
+
+static const struct dwc3_overlay_data dwc3_qcom_sm6115_overlay = {
+	.fdt = __dtb_dwc3_qcom_sm6115_begin,
+	.end = __dtb_dwc3_qcom_sm6115_end,
+	.migrate_match = "qcom,dwc3",
+};
+
+static const struct dwc3_overlay_data dwc3_qcom_sm6115_lenovo_j606f_overlay = {
+	.fdt = __dtb_dwc3_qcom_sm6115_lenovo_j606f_begin,
+	.end = __dtb_dwc3_qcom_sm6115_lenovo_j606f_end,
+	.migrate_match = "qcom,dwc3",
+};
+
+static const struct dwc3_overlay_data dwc3_qcom_sm6125_overlay = {
+	.fdt = __dtb_dwc3_qcom_sm6125_begin,
+	.end = __dtb_dwc3_qcom_sm6125_end,
+	.migrate_match = "qcom,dwc3",
+};
+
+static const struct dwc3_overlay_data dwc3_qcom_sm6350_overlay = {
+	.fdt = __dtb_dwc3_qcom_sm6350_begin,
+	.end = __dtb_dwc3_qcom_sm6350_end,
+	.migrate_match = "qcom,dwc3",
+};
+
+static const struct dwc3_overlay_data dwc3_qcom_sm6375_overlay = {
+	.fdt = __dtb_dwc3_qcom_sm6375_begin,
+	.end = __dtb_dwc3_qcom_sm6375_end,
+	.migrate_match = "qcom,dwc3",
+};
+
+static const struct dwc3_overlay_data dwc3_qcom_sm7125_overlay = {
+	.fdt = __dtb_dwc3_qcom_sm7125_begin,
+	.end = __dtb_dwc3_qcom_sm7125_end,
+	.migrate_match = "qcom,dwc3",
+};
+
+static const struct dwc3_overlay_data dwc3_qcom_sm7225_overlay = {
+	.fdt = __dtb_dwc3_qcom_sm7225_begin,
+	.end = __dtb_dwc3_qcom_sm7225_end,
+	.migrate_match = "qcom,dwc3",
+};
+
+static const struct dwc3_overlay_data dwc3_qcom_sm7325_overlay = {
+	.fdt = __dtb_dwc3_qcom_sm7325_begin,
+	.end = __dtb_dwc3_qcom_sm7325_end,
+	.migrate_match = "qcom,dwc3",
+};
+
+static const struct dwc3_overlay_data dwc3_qcom_sm8150_overlay = {
+	.fdt = __dtb_dwc3_qcom_sm8150_begin,
+	.end = __dtb_dwc3_qcom_sm8150_end,
+	.migrate_match = "qcom,dwc3",
+};
+
+static const struct dwc3_overlay_data dwc3_qcom_sm8250_overlay = {
+	.fdt = __dtb_dwc3_qcom_sm8250_begin,
+	.end = __dtb_dwc3_qcom_sm8250_end,
+	.migrate_match = "qcom,dwc3",
+};
+
+static const struct dwc3_overlay_data dwc3_qcom_sm8250_xiaomi_elish_overlay = {
+	.fdt = __dtb_dwc3_qcom_sm8250_xiaomi_elish_begin,
+	.end = __dtb_dwc3_qcom_sm8250_xiaomi_elish_end,
+	.migrate_match = "qcom,dwc3",
+};
+
+static const struct dwc3_overlay_data dwc3_qcom_sm8350_overlay = {
+	.fdt = __dtb_dwc3_qcom_sm8350_begin,
+	.end = __dtb_dwc3_qcom_sm8350_end,
+	.migrate_match = "qcom,dwc3",
+};
+
+static const struct dwc3_overlay_data dwc3_qcom_sm8350_qcom_sm8350_hdk_overlay = {
+	.fdt = __dtb_dwc3_qcom_sm8350_qcom_sm8350_hdk_begin,
+	.end = __dtb_dwc3_qcom_sm8350_qcom_sm8350_hdk_end,
+	.migrate_match = "qcom,dwc3",
+};
+
+static const struct dwc3_overlay_data dwc3_qcom_sm8450_overlay = {
+	.fdt = __dtb_dwc3_qcom_sm8450_begin,
+	.end = __dtb_dwc3_qcom_sm8450_end,
+	.migrate_match = "qcom,dwc3",
+};
+
+static const struct dwc3_overlay_data dwc3_qcom_sm8550_overlay = {
+	.fdt = __dtb_dwc3_qcom_sm8550_begin,
+	.end = __dtb_dwc3_qcom_sm8550_end,
+	.migrate_match = "qcom,dwc3",
+};
+
+static const struct dwc3_overlay_data dwc3_qcom_sm8650_overlay = {
+	.fdt = __dtb_dwc3_qcom_sm8650_begin,
+	.end = __dtb_dwc3_qcom_sm8650_end,
+	.migrate_match = "qcom,dwc3",
+};
+
+static const struct dwc3_overlay_data dwc3_qcom_x1e80100_overlay = {
+	.fdt = __dtb_dwc3_qcom_x1e80100_begin,
+	.end = __dtb_dwc3_qcom_x1e80100_end,
+	.migrate_match = "qcom,dwc3",
+};
+
+static const struct dwc3_overlay_data dwc3_qcom_x1e80100_hp_omnibook_x14_overlay = {
+	.fdt = __dtb_dwc3_qcom_x1e80100_hp_omnibook_x14_begin,
+	.end = __dtb_dwc3_qcom_x1e80100_hp_omnibook_x14_end,
+	.migrate_match = "qcom,dwc3",
+};
+
 static const struct of_device_id dwc3_flatten_of_match[] = {
 	{ .compatible = "8dev,jalapeno", .data = &dwc3_qcom_ipq4018_8dev_jalapeno_overlay },
+	{ .compatible = "fxtec,pro1", .data = &dwc3_qcom_msm8998_fxtec_pro1_overlay },
+	{ .compatible = "hp,omnibook-x14", .data = &dwc3_qcom_x1e80100_hp_omnibook_x14_overlay },
+	{ .compatible = "inforce,ifc6640", .data = &dwc3_qcom_apq8096_inforce_ifc6640_overlay },
+	{ .compatible = "lenovo,j606f", .data = &dwc3_qcom_sm6115_lenovo_j606f_overlay },
+	{ .compatible = "lenovo,yoga-c630", .data = &dwc3_qcom_sdm845_lenovo_yoga_c630_overlay },
+	{ .compatible = "lg,judyln", .data = &dwc3_qcom_sdm845_lg_judyln_overlay },
+	{ .compatible = "lg,judyp", .data = &dwc3_qcom_sdm845_lg_judyp_overlay },
+	{ .compatible = "microsoft,blackrock", .data = &dwc3_qcom_sc8280xp_microsoft_blackrock_overlay },
+	{ .compatible = "oneplus,billie2", .data = &dwc3_qcom_sm4250_oneplus_billie2_overlay },
+	{ .compatible = "oneplus,cheeseburger", .data = &dwc3_qcom_msm8998_oneplus_cheeseburger_overlay },
+	{ .compatible = "oneplus,dumpling", .data = &dwc3_qcom_msm8998_oneplus_dumpling_overlay },
+	{ .compatible = "oneplus,oneplus3", .data = &dwc3_qcom_msm8996_oneplus_oneplus3_overlay },
+	{ .compatible = "oneplus,oneplus3t", .data = &dwc3_qcom_msm8996_oneplus_oneplus3t_overlay },
+	{ .compatible = "qcom,apq8094", .data = &dwc3_qcom_apq8094_overlay },
+	{ .compatible = "qcom,apq8096", .data = &dwc3_qcom_apq8096_overlay },
 	{ .compatible = "qcom,ipq4018", .data = &dwc3_qcom_ipq4018_overlay },
 	{ .compatible = "qcom,ipq4019", .data = &dwc3_qcom_ipq4019_overlay },
+	{ .compatible = "qcom,ipq5018", .data = &dwc3_qcom_ipq5018_overlay },
+	{ .compatible = "qcom,ipq5332", .data = &dwc3_qcom_ipq5332_overlay },
+	{ .compatible = "qcom,ipq5424", .data = &dwc3_qcom_ipq5424_overlay },
+	{ .compatible = "qcom,ipq6018", .data = &dwc3_qcom_ipq6018_overlay },
 	{ .compatible = "qcom,ipq8064", .data = &dwc3_qcom_ipq8064_overlay },
+	{ .compatible = "qcom,ipq8074", .data = &dwc3_qcom_ipq8074_overlay },
+	{ .compatible = "qcom,ipq9574", .data = &dwc3_qcom_ipq9574_overlay },
+	{ .compatible = "qcom,msm8953", .data = &dwc3_qcom_msm8953_overlay },
+	{ .compatible = "qcom,msm8992", .data = &dwc3_qcom_msm8992_overlay },
+	{ .compatible = "qcom,msm8994", .data = &dwc3_qcom_msm8994_overlay },
+	{ .compatible = "qcom,msm8996", .data = &dwc3_qcom_msm8996_overlay },
+	{ .compatible = "qcom,msm8998", .data = &dwc3_qcom_msm8998_overlay },
+	{ .compatible = "qcom,qcm2290", .data = &dwc3_qcom_qcm2290_overlay },
+	{ .compatible = "qcom,qcm6490", .data = &dwc3_qcom_qcm6490_overlay },
+	{ .compatible = "qcom,qcs404", .data = &dwc3_qcom_qcs404_overlay },
+	{ .compatible = "qcom,qcs615", .data = &dwc3_qcom_qcs615_overlay },
+	{ .compatible = "qcom,qcs8300", .data = &dwc3_qcom_qcs8300_overlay },
+	{ .compatible = "qcom,qdu1000", .data = &dwc3_qcom_qdu1000_overlay },
+	{ .compatible = "qcom,qru1000", .data = &dwc3_qcom_qru1000_overlay },
+	{ .compatible = "qcom,sa8155p", .data = &dwc3_qcom_sa8155p_overlay },
+	{ .compatible = "qcom,sa8540p", .data = &dwc3_qcom_sa8540p_overlay },
+	{ .compatible = "qcom,sa8775p", .data = &dwc3_qcom_sa8775p_overlay },
+	{ .compatible = "qcom,sar2130p", .data = &dwc3_qcom_sar2130p_overlay },
+	{ .compatible = "qcom,sc7180", .data = &dwc3_qcom_sc7180_overlay },
+	{ .compatible = "qcom,sc7280", .data = &dwc3_qcom_sc7280_overlay },
+	{ .compatible = "qcom,sc8180x", .data = &dwc3_qcom_sc8180x_overlay },
+	{ .compatible = "qcom,sc8280xp", .data = &dwc3_qcom_sc8280xp_overlay },
+	{ .compatible = "qcom,sda660", .data = &dwc3_qcom_sda660_overlay },
+	{ .compatible = "qcom,sdm450", .data = &dwc3_qcom_sdm450_overlay },
+	{ .compatible = "qcom,sdm630", .data = &dwc3_qcom_sdm630_overlay },
+	{ .compatible = "qcom,sdm632", .data = &dwc3_qcom_sdm632_overlay },
+	{ .compatible = "qcom,sdm636", .data = &dwc3_qcom_sdm636_overlay },
+	{ .compatible = "qcom,sdm660", .data = &dwc3_qcom_sdm660_overlay },
+	{ .compatible = "qcom,sdm670", .data = &dwc3_qcom_sdm670_overlay },
+	{ .compatible = "qcom,sdm845", .data = &dwc3_qcom_sdm845_overlay },
+	{ .compatible = "qcom,sdm845-mtp", .data = &dwc3_qcom_sdm845_qcom_sdm845_mtp_overlay },
 	{ .compatible = "qcom,sdx55", .data = &dwc3_qcom_sdx55_overlay },
 	{ .compatible = "qcom,sdx65", .data = &dwc3_qcom_sdx65_overlay },
+	{ .compatible = "qcom,sdx75", .data = &dwc3_qcom_sdx75_overlay },
+	{ .compatible = "qcom,sm4250", .data = &dwc3_qcom_sm4250_overlay },
+	{ .compatible = "qcom,sm6115", .data = &dwc3_qcom_sm6115_overlay },
+	{ .compatible = "qcom,sm6125", .data = &dwc3_qcom_sm6125_overlay },
+	{ .compatible = "qcom,sm6350", .data = &dwc3_qcom_sm6350_overlay },
+	{ .compatible = "qcom,sm6375", .data = &dwc3_qcom_sm6375_overlay },
+	{ .compatible = "qcom,sm7125", .data = &dwc3_qcom_sm7125_overlay },
+	{ .compatible = "qcom,sm7225", .data = &dwc3_qcom_sm7225_overlay },
+	{ .compatible = "qcom,sm7325", .data = &dwc3_qcom_sm7325_overlay },
+	{ .compatible = "qcom,sm8150", .data = &dwc3_qcom_sm8150_overlay },
+	{ .compatible = "qcom,sm8250", .data = &dwc3_qcom_sm8250_overlay },
+	{ .compatible = "qcom,sm8350", .data = &dwc3_qcom_sm8350_overlay },
+	{ .compatible = "qcom,sm8350-hdk", .data = &dwc3_qcom_sm8350_qcom_sm8350_hdk_overlay },
+	{ .compatible = "qcom,sm8450", .data = &dwc3_qcom_sm8450_overlay },
+	{ .compatible = "qcom,sm8550", .data = &dwc3_qcom_sm8550_overlay },
+	{ .compatible = "qcom,sm8650", .data = &dwc3_qcom_sm8650_overlay },
+	{ .compatible = "qcom,x1e80100", .data = &dwc3_qcom_x1e80100_overlay },
+	{ .compatible = "samsung,starqltechn", .data = &dwc3_qcom_sdm845_samsung_starqltechn_overlay },
+	{ .compatible = "samsung,w737", .data = &dwc3_qcom_sdm845_samsung_w737_overlay },
+	{ .compatible = "shift,axolotl", .data = &dwc3_qcom_sdm845_shift_axolotl_overlay },
+	{ .compatible = "sony,dora-row", .data = &dwc3_qcom_msm8996_sony_dora_row_overlay },
+	{ .compatible = "sony,kagura-row", .data = &dwc3_qcom_msm8996_sony_kagura_row_overlay },
+	{ .compatible = "sony,keyaki-row", .data = &dwc3_qcom_msm8996_sony_keyaki_row_overlay },
+	{ .compatible = "sony,xperia-lilac", .data = &dwc3_qcom_msm8998_sony_xperia_lilac_overlay },
+	{ .compatible = "sony,xperia-maple", .data = &dwc3_qcom_msm8998_sony_xperia_maple_overlay },
+	{ .compatible = "sony,xperia-poplar", .data = &dwc3_qcom_msm8998_sony_xperia_poplar_overlay },
+	{ .compatible = "thundercomm,db845c", .data = &dwc3_qcom_sdm845_thundercomm_db845c_overlay },
+	{ .compatible = "xiaomi,beryllium", .data = &dwc3_qcom_sdm845_xiaomi_beryllium_overlay },
+	{ .compatible = "xiaomi,beryllium-ebbg", .data = &dwc3_qcom_sdm845_xiaomi_beryllium_ebbg_overlay },
+	{ .compatible = "xiaomi,elish", .data = &dwc3_qcom_sm8250_xiaomi_elish_overlay },
+	{ .compatible = "xiaomi,gemini", .data = &dwc3_qcom_msm8996_xiaomi_gemini_overlay },
+	{ .compatible = "xiaomi,natrium", .data = &dwc3_qcom_msm8996_xiaomi_natrium_overlay },
+	{ .compatible = "xiaomi,sagit", .data = &dwc3_qcom_msm8998_xiaomi_sagit_overlay },
+	{ .compatible = "xiaomi,scorpio", .data = &dwc3_qcom_msm8996_xiaomi_scorpio_overlay },
 	{}
 };
 
diff --git a/drivers/of/overlays/dwc3-flattening/dwc3-flattening.h b/drivers/of/overlays/dwc3-flattening/dwc3-flattening.h
index 57d7dbc94980..bc897db4dd1e 100644
--- a/drivers/of/overlays/dwc3-flattening/dwc3-flattening.h
+++ b/drivers/of/overlays/dwc3-flattening/dwc3-flattening.h
@@ -4,17 +4,185 @@
 
 #include <linux/kernel.h>
 
+extern u8 __dtb_dwc3_qcom_apq8094_begin[];
+extern u8 __dtb_dwc3_qcom_apq8094_end[];
+extern u8 __dtb_dwc3_qcom_apq8096_begin[];
+extern u8 __dtb_dwc3_qcom_apq8096_end[];
+extern u8 __dtb_dwc3_qcom_apq8096_inforce_ifc6640_begin[];
+extern u8 __dtb_dwc3_qcom_apq8096_inforce_ifc6640_end[];
 extern u8 __dtb_dwc3_qcom_ipq4018_begin[];
 extern u8 __dtb_dwc3_qcom_ipq4018_end[];
 extern u8 __dtb_dwc3_qcom_ipq4018_8dev_jalapeno_begin[];
 extern u8 __dtb_dwc3_qcom_ipq4018_8dev_jalapeno_end[];
 extern u8 __dtb_dwc3_qcom_ipq4019_begin[];
 extern u8 __dtb_dwc3_qcom_ipq4019_end[];
+extern u8 __dtb_dwc3_qcom_ipq5018_begin[];
+extern u8 __dtb_dwc3_qcom_ipq5018_end[];
+extern u8 __dtb_dwc3_qcom_ipq5332_begin[];
+extern u8 __dtb_dwc3_qcom_ipq5332_end[];
+extern u8 __dtb_dwc3_qcom_ipq5424_begin[];
+extern u8 __dtb_dwc3_qcom_ipq5424_end[];
+extern u8 __dtb_dwc3_qcom_ipq6018_begin[];
+extern u8 __dtb_dwc3_qcom_ipq6018_end[];
 extern u8 __dtb_dwc3_qcom_ipq8064_begin[];
 extern u8 __dtb_dwc3_qcom_ipq8064_end[];
+extern u8 __dtb_dwc3_qcom_ipq8074_begin[];
+extern u8 __dtb_dwc3_qcom_ipq8074_end[];
+extern u8 __dtb_dwc3_qcom_ipq9574_begin[];
+extern u8 __dtb_dwc3_qcom_ipq9574_end[];
+extern u8 __dtb_dwc3_qcom_msm8953_begin[];
+extern u8 __dtb_dwc3_qcom_msm8953_end[];
+extern u8 __dtb_dwc3_qcom_msm8992_begin[];
+extern u8 __dtb_dwc3_qcom_msm8992_end[];
+extern u8 __dtb_dwc3_qcom_msm8994_begin[];
+extern u8 __dtb_dwc3_qcom_msm8994_end[];
+extern u8 __dtb_dwc3_qcom_msm8996_begin[];
+extern u8 __dtb_dwc3_qcom_msm8996_end[];
+extern u8 __dtb_dwc3_qcom_msm8996_oneplus_oneplus3_begin[];
+extern u8 __dtb_dwc3_qcom_msm8996_oneplus_oneplus3_end[];
+extern u8 __dtb_dwc3_qcom_msm8996_oneplus_oneplus3t_begin[];
+extern u8 __dtb_dwc3_qcom_msm8996_oneplus_oneplus3t_end[];
+extern u8 __dtb_dwc3_qcom_msm8996_sony_dora_row_begin[];
+extern u8 __dtb_dwc3_qcom_msm8996_sony_dora_row_end[];
+extern u8 __dtb_dwc3_qcom_msm8996_sony_kagura_row_begin[];
+extern u8 __dtb_dwc3_qcom_msm8996_sony_kagura_row_end[];
+extern u8 __dtb_dwc3_qcom_msm8996_sony_keyaki_row_begin[];
+extern u8 __dtb_dwc3_qcom_msm8996_sony_keyaki_row_end[];
+extern u8 __dtb_dwc3_qcom_msm8996_xiaomi_gemini_begin[];
+extern u8 __dtb_dwc3_qcom_msm8996_xiaomi_gemini_end[];
+extern u8 __dtb_dwc3_qcom_msm8996_xiaomi_natrium_begin[];
+extern u8 __dtb_dwc3_qcom_msm8996_xiaomi_natrium_end[];
+extern u8 __dtb_dwc3_qcom_msm8996_xiaomi_scorpio_begin[];
+extern u8 __dtb_dwc3_qcom_msm8996_xiaomi_scorpio_end[];
+extern u8 __dtb_dwc3_qcom_msm8998_begin[];
+extern u8 __dtb_dwc3_qcom_msm8998_end[];
+extern u8 __dtb_dwc3_qcom_msm8998_fxtec_pro1_begin[];
+extern u8 __dtb_dwc3_qcom_msm8998_fxtec_pro1_end[];
+extern u8 __dtb_dwc3_qcom_msm8998_oneplus_cheeseburger_begin[];
+extern u8 __dtb_dwc3_qcom_msm8998_oneplus_cheeseburger_end[];
+extern u8 __dtb_dwc3_qcom_msm8998_oneplus_dumpling_begin[];
+extern u8 __dtb_dwc3_qcom_msm8998_oneplus_dumpling_end[];
+extern u8 __dtb_dwc3_qcom_msm8998_sony_xperia_lilac_begin[];
+extern u8 __dtb_dwc3_qcom_msm8998_sony_xperia_lilac_end[];
+extern u8 __dtb_dwc3_qcom_msm8998_sony_xperia_maple_begin[];
+extern u8 __dtb_dwc3_qcom_msm8998_sony_xperia_maple_end[];
+extern u8 __dtb_dwc3_qcom_msm8998_sony_xperia_poplar_begin[];
+extern u8 __dtb_dwc3_qcom_msm8998_sony_xperia_poplar_end[];
+extern u8 __dtb_dwc3_qcom_msm8998_xiaomi_sagit_begin[];
+extern u8 __dtb_dwc3_qcom_msm8998_xiaomi_sagit_end[];
+extern u8 __dtb_dwc3_qcom_qcm2290_begin[];
+extern u8 __dtb_dwc3_qcom_qcm2290_end[];
+extern u8 __dtb_dwc3_qcom_qcm6490_begin[];
+extern u8 __dtb_dwc3_qcom_qcm6490_end[];
+extern u8 __dtb_dwc3_qcom_qcs404_begin[];
+extern u8 __dtb_dwc3_qcom_qcs404_end[];
+extern u8 __dtb_dwc3_qcom_qcs615_begin[];
+extern u8 __dtb_dwc3_qcom_qcs615_end[];
+extern u8 __dtb_dwc3_qcom_qcs8300_begin[];
+extern u8 __dtb_dwc3_qcom_qcs8300_end[];
+extern u8 __dtb_dwc3_qcom_qdu1000_begin[];
+extern u8 __dtb_dwc3_qcom_qdu1000_end[];
+extern u8 __dtb_dwc3_qcom_qru1000_begin[];
+extern u8 __dtb_dwc3_qcom_qru1000_end[];
+extern u8 __dtb_dwc3_qcom_sa8155p_begin[];
+extern u8 __dtb_dwc3_qcom_sa8155p_end[];
+extern u8 __dtb_dwc3_qcom_sa8540p_begin[];
+extern u8 __dtb_dwc3_qcom_sa8540p_end[];
+extern u8 __dtb_dwc3_qcom_sa8775p_begin[];
+extern u8 __dtb_dwc3_qcom_sa8775p_end[];
+extern u8 __dtb_dwc3_qcom_sar2130p_begin[];
+extern u8 __dtb_dwc3_qcom_sar2130p_end[];
+extern u8 __dtb_dwc3_qcom_sc7180_begin[];
+extern u8 __dtb_dwc3_qcom_sc7180_end[];
+extern u8 __dtb_dwc3_qcom_sc7280_begin[];
+extern u8 __dtb_dwc3_qcom_sc7280_end[];
+extern u8 __dtb_dwc3_qcom_sc8180x_begin[];
+extern u8 __dtb_dwc3_qcom_sc8180x_end[];
+extern u8 __dtb_dwc3_qcom_sc8280xp_begin[];
+extern u8 __dtb_dwc3_qcom_sc8280xp_end[];
+extern u8 __dtb_dwc3_qcom_sc8280xp_microsoft_blackrock_begin[];
+extern u8 __dtb_dwc3_qcom_sc8280xp_microsoft_blackrock_end[];
+extern u8 __dtb_dwc3_qcom_sda660_begin[];
+extern u8 __dtb_dwc3_qcom_sda660_end[];
+extern u8 __dtb_dwc3_qcom_sdm450_begin[];
+extern u8 __dtb_dwc3_qcom_sdm450_end[];
+extern u8 __dtb_dwc3_qcom_sdm630_begin[];
+extern u8 __dtb_dwc3_qcom_sdm630_end[];
+extern u8 __dtb_dwc3_qcom_sdm632_begin[];
+extern u8 __dtb_dwc3_qcom_sdm632_end[];
+extern u8 __dtb_dwc3_qcom_sdm636_begin[];
+extern u8 __dtb_dwc3_qcom_sdm636_end[];
+extern u8 __dtb_dwc3_qcom_sdm660_begin[];
+extern u8 __dtb_dwc3_qcom_sdm660_end[];
+extern u8 __dtb_dwc3_qcom_sdm670_begin[];
+extern u8 __dtb_dwc3_qcom_sdm670_end[];
+extern u8 __dtb_dwc3_qcom_sdm845_begin[];
+extern u8 __dtb_dwc3_qcom_sdm845_end[];
+extern u8 __dtb_dwc3_qcom_sdm845_lenovo_yoga_c630_begin[];
+extern u8 __dtb_dwc3_qcom_sdm845_lenovo_yoga_c630_end[];
+extern u8 __dtb_dwc3_qcom_sdm845_lg_judyln_begin[];
+extern u8 __dtb_dwc3_qcom_sdm845_lg_judyln_end[];
+extern u8 __dtb_dwc3_qcom_sdm845_lg_judyp_begin[];
+extern u8 __dtb_dwc3_qcom_sdm845_lg_judyp_end[];
+extern u8 __dtb_dwc3_qcom_sdm845_qcom_sdm845_mtp_begin[];
+extern u8 __dtb_dwc3_qcom_sdm845_qcom_sdm845_mtp_end[];
+extern u8 __dtb_dwc3_qcom_sdm845_samsung_starqltechn_begin[];
+extern u8 __dtb_dwc3_qcom_sdm845_samsung_starqltechn_end[];
+extern u8 __dtb_dwc3_qcom_sdm845_samsung_w737_begin[];
+extern u8 __dtb_dwc3_qcom_sdm845_samsung_w737_end[];
+extern u8 __dtb_dwc3_qcom_sdm845_shift_axolotl_begin[];
+extern u8 __dtb_dwc3_qcom_sdm845_shift_axolotl_end[];
+extern u8 __dtb_dwc3_qcom_sdm845_thundercomm_db845c_begin[];
+extern u8 __dtb_dwc3_qcom_sdm845_thundercomm_db845c_end[];
+extern u8 __dtb_dwc3_qcom_sdm845_xiaomi_beryllium_begin[];
+extern u8 __dtb_dwc3_qcom_sdm845_xiaomi_beryllium_end[];
+extern u8 __dtb_dwc3_qcom_sdm845_xiaomi_beryllium_ebbg_begin[];
+extern u8 __dtb_dwc3_qcom_sdm845_xiaomi_beryllium_ebbg_end[];
 extern u8 __dtb_dwc3_qcom_sdx55_begin[];
 extern u8 __dtb_dwc3_qcom_sdx55_end[];
 extern u8 __dtb_dwc3_qcom_sdx65_begin[];
 extern u8 __dtb_dwc3_qcom_sdx65_end[];
+extern u8 __dtb_dwc3_qcom_sdx75_begin[];
+extern u8 __dtb_dwc3_qcom_sdx75_end[];
+extern u8 __dtb_dwc3_qcom_sm4250_begin[];
+extern u8 __dtb_dwc3_qcom_sm4250_end[];
+extern u8 __dtb_dwc3_qcom_sm4250_oneplus_billie2_begin[];
+extern u8 __dtb_dwc3_qcom_sm4250_oneplus_billie2_end[];
+extern u8 __dtb_dwc3_qcom_sm6115_begin[];
+extern u8 __dtb_dwc3_qcom_sm6115_end[];
+extern u8 __dtb_dwc3_qcom_sm6115_lenovo_j606f_begin[];
+extern u8 __dtb_dwc3_qcom_sm6115_lenovo_j606f_end[];
+extern u8 __dtb_dwc3_qcom_sm6125_begin[];
+extern u8 __dtb_dwc3_qcom_sm6125_end[];
+extern u8 __dtb_dwc3_qcom_sm6350_begin[];
+extern u8 __dtb_dwc3_qcom_sm6350_end[];
+extern u8 __dtb_dwc3_qcom_sm6375_begin[];
+extern u8 __dtb_dwc3_qcom_sm6375_end[];
+extern u8 __dtb_dwc3_qcom_sm7125_begin[];
+extern u8 __dtb_dwc3_qcom_sm7125_end[];
+extern u8 __dtb_dwc3_qcom_sm7225_begin[];
+extern u8 __dtb_dwc3_qcom_sm7225_end[];
+extern u8 __dtb_dwc3_qcom_sm7325_begin[];
+extern u8 __dtb_dwc3_qcom_sm7325_end[];
+extern u8 __dtb_dwc3_qcom_sm8150_begin[];
+extern u8 __dtb_dwc3_qcom_sm8150_end[];
+extern u8 __dtb_dwc3_qcom_sm8250_begin[];
+extern u8 __dtb_dwc3_qcom_sm8250_end[];
+extern u8 __dtb_dwc3_qcom_sm8250_xiaomi_elish_begin[];
+extern u8 __dtb_dwc3_qcom_sm8250_xiaomi_elish_end[];
+extern u8 __dtb_dwc3_qcom_sm8350_begin[];
+extern u8 __dtb_dwc3_qcom_sm8350_end[];
+extern u8 __dtb_dwc3_qcom_sm8350_qcom_sm8350_hdk_begin[];
+extern u8 __dtb_dwc3_qcom_sm8350_qcom_sm8350_hdk_end[];
+extern u8 __dtb_dwc3_qcom_sm8450_begin[];
+extern u8 __dtb_dwc3_qcom_sm8450_end[];
+extern u8 __dtb_dwc3_qcom_sm8550_begin[];
+extern u8 __dtb_dwc3_qcom_sm8550_end[];
+extern u8 __dtb_dwc3_qcom_sm8650_begin[];
+extern u8 __dtb_dwc3_qcom_sm8650_end[];
+extern u8 __dtb_dwc3_qcom_x1e80100_begin[];
+extern u8 __dtb_dwc3_qcom_x1e80100_end[];
+extern u8 __dtb_dwc3_qcom_x1e80100_hp_omnibook_x14_begin[];
+extern u8 __dtb_dwc3_qcom_x1e80100_hp_omnibook_x14_end[];
 
 #endif
diff --git a/drivers/of/overlays/dwc3-flattening/dwc3-qcom_apq8094.dts b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_apq8094.dts
new file mode 100644
index 000000000000..8ca699460ec3
--- /dev/null
+++ b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_apq8094.dts
@@ -0,0 +1,32 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+/ {
+	fragment@0 {
+		target-path = "/soc@0/usb@f92f8800";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		interrupt-parent = <&intc>;
+
+		__overlay__ {
+			compatible = "qcom,msm8994-dwc3", "qcom,snps-dwc3";
+			reg = <0xf9200000 0xd000>;
+			interrupts = <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 180 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 311 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 310 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "qusb2_phy",
+					  "hs_phy_irq",
+					  "ss_phy_irq";
+		};
+	};
+};
diff --git a/drivers/of/overlays/dwc3-flattening/dwc3-qcom_apq8096.dts b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_apq8096.dts
new file mode 100644
index 000000000000..f05d6c905e85
--- /dev/null
+++ b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_apq8096.dts
@@ -0,0 +1,60 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+/ {
+	fragment@0 {
+		target-path = "/soc@0/usb@6af8800";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		interrupt-parent = <&intc>;
+
+		__overlay__ {
+			compatible = "qcom,msm8996-dwc3", "qcom,snps-dwc3";
+			reg = <0x06a00000 0xd000>;
+			interrupts = <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 180 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 347 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 243 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "qusb2_phy",
+					  "hs_phy_irq",
+					  "ss_phy_irq";
+			phys = <&hsusb_phy1>,
+			       <&usb3phy>;
+			phy-names = "usb2-phy",
+				    "usb3-phy";
+			extcon = <&usb2_id>;
+		};
+	};
+
+	fragment@1 {
+		target-path = "/soc@0/usb@76f8800";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		interrupt-parent = <&intc>;
+
+		__overlay__ {
+			compatible = "qcom,msm8996-dwc3", "qcom,snps-dwc3";
+			reg = <0x07600000 0xd000>;
+			interrupts = <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 352 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 139 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "qusb2_phy",
+					  "hs_phy_irq";
+			phys = <&hsusb_phy2>;
+			phy-names = "usb2-phy";
+			extcon = <&usb3_id>;
+		};
+	};
+};
diff --git a/drivers/of/overlays/dwc3-flattening/dwc3-qcom_apq8096_inforce_ifc6640.dts b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_apq8096_inforce_ifc6640.dts
new file mode 100644
index 000000000000..1b9ae360f1ce
--- /dev/null
+++ b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_apq8096_inforce_ifc6640.dts
@@ -0,0 +1,58 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+/ {
+	fragment@0 {
+		target-path = "/soc@0/usb@6af8800";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		interrupt-parent = <&intc>;
+
+		__overlay__ {
+			compatible = "qcom,msm8996-dwc3", "qcom,snps-dwc3";
+			reg = <0x06a00000 0xd000>;
+			interrupts = <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 180 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 347 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 243 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "qusb2_phy",
+					  "hs_phy_irq",
+					  "ss_phy_irq";
+			phys = <&hsusb_phy1>,
+			       <&usb3phy>;
+			phy-names = "usb2-phy",
+				    "usb3-phy";
+		};
+	};
+
+	fragment@1 {
+		target-path = "/soc@0/usb@76f8800";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		interrupt-parent = <&intc>;
+
+		__overlay__ {
+			compatible = "qcom,msm8996-dwc3", "qcom,snps-dwc3";
+			reg = <0x07600000 0xd000>;
+			interrupts = <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 352 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 139 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "qusb2_phy",
+					  "hs_phy_irq";
+			phys = <&hsusb_phy2>;
+			phy-names = "usb2-phy";
+		};
+	};
+};
diff --git a/drivers/of/overlays/dwc3-flattening/dwc3-qcom_ipq5018.dts b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_ipq5018.dts
new file mode 100644
index 000000000000..44266816a50b
--- /dev/null
+++ b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_ipq5018.dts
@@ -0,0 +1,28 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+/ {
+	fragment@0 {
+		target-path = "/soc@0/usb@8af8800";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		interrupt-parent = <&intc>;
+
+		__overlay__ {
+			compatible = "qcom,ipq5018-dwc3", "qcom,snps-dwc3";
+			reg = <0x08a00000 0xe400>;
+			interrupts = <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3",
+					  "hs_phy_irq";
+			phys = <&usbphy0>;
+			phy-names = "usb2-phy";
+		};
+	};
+};
diff --git a/drivers/of/overlays/dwc3-flattening/dwc3-qcom_ipq5332.dts b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_ipq5332.dts
new file mode 100644
index 000000000000..6e6699e4f859
--- /dev/null
+++ b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_ipq5332.dts
@@ -0,0 +1,32 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+/ {
+	fragment@0 {
+		target-path = "/soc@0/usb@8af8800";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		interrupt-parent = <&intc>;
+
+		__overlay__ {
+			compatible = "qcom,ipq5332-dwc3", "qcom,snps-dwc3";
+			reg = <0x08a00000 0xe400>;
+			interrupts = <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 53 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 52 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "dp_hs_phy_irq",
+					  "dm_hs_phy_irq";
+			phys = <&usbphy0>;
+			phy-names = "usb2-phy";
+		};
+	};
+};
diff --git a/drivers/of/overlays/dwc3-flattening/dwc3-qcom_ipq5424.dts b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_ipq5424.dts
new file mode 100644
index 000000000000..e14dc85d8b39
--- /dev/null
+++ b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_ipq5424.dts
@@ -0,0 +1,58 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+/ {
+	fragment@0 {
+		target-path = "/soc@0/usb2@1e00000";
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		__overlay__ {
+			compatible = "qcom,ipq5424-dwc3", "qcom,snps-dwc3";
+			reg = <0 0x01e00000 0 0xe400>;
+			interrupts-extended = <&intc GIC_SPI 396 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 395 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 397 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 387 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 388 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "qusb2_phy",
+					  "dm_hs_phy_irq",
+					  "dp_hs_phy_irq";
+			phys = <&qusb_phy_1>;
+			phy-names = "usb2-phy";
+		};
+	};
+
+	fragment@1 {
+		target-path = "/soc@0/usb3@8a00000";
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		__overlay__ {
+			compatible = "qcom,ipq5424-dwc3", "qcom,snps-dwc3";
+			reg = <0 0x08a00000 0 0xd100>;
+			interrupts-extended = <&intc GIC_SPI 409 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 412 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 414 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 423 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 424 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "qusb2_phy",
+					  "dm_hs_phy_irq",
+					  "dp_hs_phy_irq";
+			phys = <&qusb_phy_0>,
+			       <&ssphy_0>;
+			phy-names = "usb2-phy",
+				    "usb3-phy";
+		};
+	};
+};
diff --git a/drivers/of/overlays/dwc3-flattening/dwc3-qcom_ipq6018.dts b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_ipq6018.dts
new file mode 100644
index 000000000000..14e7fa720831
--- /dev/null
+++ b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_ipq6018.dts
@@ -0,0 +1,54 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+/ {
+	fragment@0 {
+		target-path = "/soc@0/usb@70f8800";
+		#address-cells = <2>;
+		#size-cells = <2>;
+		interrupt-parent = <&intc>;
+
+		__overlay__ {
+			compatible = "qcom,ipq6018-dwc3", "qcom,snps-dwc3";
+			reg = <0 0x07000000 0 0xd100>;
+			interrupts = <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "qusb2_phy";
+			phys = <&qusb_phy_1>;
+			phy-names = "usb2-phy";
+		};
+	};
+
+	fragment@1 {
+		target-path = "/soc@0/usb@8af8800";
+		#address-cells = <2>;
+		#size-cells = <2>;
+		interrupt-parent = <&intc>;
+
+		__overlay__ {
+			compatible = "qcom,ipq6018-dwc3", "qcom,snps-dwc3";
+			reg = <0 0x08a00000 0 0xd100>;
+			interrupts = <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 220 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "qusb2_phy",
+					  "ss_phy_irq";
+			phys = <&qusb_phy_0>,
+			       <&ssphy_0>;
+			phy-names = "usb2-phy",
+				    "usb3-phy";
+		};
+	};
+};
diff --git a/drivers/of/overlays/dwc3-flattening/dwc3-qcom_ipq8074.dts b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_ipq8074.dts
new file mode 100644
index 000000000000..169da32fcd24
--- /dev/null
+++ b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_ipq8074.dts
@@ -0,0 +1,58 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+/ {
+	fragment@0 {
+		target-path = "/soc@0/usb@8af8800";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		interrupt-parent = <&intc>;
+
+		__overlay__ {
+			compatible = "qcom,ipq8074-dwc3", "qcom,snps-dwc3";
+			reg = <0x08a00000 0xd100>;
+			interrupts = <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 220 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "qusb2_phy",
+					  "ss_phy_irq";
+			phys = <&qusb_phy_0>,
+			       <&ssphy_0>;
+			phy-names = "usb2-phy",
+				    "usb3-phy";
+		};
+	};
+
+	fragment@1 {
+		target-path = "/soc@0/usb@8cf8800";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		interrupt-parent = <&intc>;
+
+		__overlay__ {
+			compatible = "qcom,ipq8074-dwc3", "qcom,snps-dwc3";
+			reg = <0x08c00000 0xd100>;
+			interrupts = <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "qusb2_phy",
+					  "ss_phy_irq";
+			phys = <&qusb_phy_1>,
+			       <&ssphy_1>;
+			phy-names = "usb2-phy",
+				    "usb3-phy";
+		};
+	};
+};
diff --git a/drivers/of/overlays/dwc3-flattening/dwc3-qcom_ipq9574.dts b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_ipq9574.dts
new file mode 100644
index 000000000000..ba644dde4845
--- /dev/null
+++ b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_ipq9574.dts
@@ -0,0 +1,29 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+/ {
+	fragment@0 {
+		target-path = "/soc@0/usb@8af8800";
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		__overlay__ {
+			compatible = "qcom,ipq9574-dwc3", "qcom,snps-dwc3";
+			reg = <0x08a00000 0xd100>;
+			interrupts-extended = <&intc GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event";
+			phys = <&usb_0_qusbphy>,
+			       <&usb_0_qmpphy>;
+			phy-names = "usb2-phy",
+				    "usb3-phy";
+		};
+	};
+};
diff --git a/drivers/of/overlays/dwc3-flattening/dwc3-qcom_msm8953.dts b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_msm8953.dts
new file mode 100644
index 000000000000..2c2d8e00ab78
--- /dev/null
+++ b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_msm8953.dts
@@ -0,0 +1,32 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+/ {
+	fragment@0 {
+		target-path = "/soc@0/usb@70f8800";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		interrupt-parent = <&intc>;
+
+		__overlay__ {
+			compatible = "qcom,msm8953-dwc3", "qcom,snps-dwc3";
+			reg = <0x07000000 0xd000>;
+			interrupts = <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 220 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "qusb2_phy",
+					  "ss_phy_irq";
+			phys = <&hsusb_phy>;
+			phy-names = "usb2-phy";
+		};
+	};
+};
diff --git a/drivers/of/overlays/dwc3-flattening/dwc3-qcom_msm8992.dts b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_msm8992.dts
new file mode 100644
index 000000000000..8ca699460ec3
--- /dev/null
+++ b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_msm8992.dts
@@ -0,0 +1,32 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+/ {
+	fragment@0 {
+		target-path = "/soc@0/usb@f92f8800";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		interrupt-parent = <&intc>;
+
+		__overlay__ {
+			compatible = "qcom,msm8994-dwc3", "qcom,snps-dwc3";
+			reg = <0xf9200000 0xd000>;
+			interrupts = <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 180 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 311 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 310 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "qusb2_phy",
+					  "hs_phy_irq",
+					  "ss_phy_irq";
+		};
+	};
+};
diff --git a/drivers/of/overlays/dwc3-flattening/dwc3-qcom_msm8994.dts b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_msm8994.dts
new file mode 100644
index 000000000000..8ca699460ec3
--- /dev/null
+++ b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_msm8994.dts
@@ -0,0 +1,32 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+/ {
+	fragment@0 {
+		target-path = "/soc@0/usb@f92f8800";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		interrupt-parent = <&intc>;
+
+		__overlay__ {
+			compatible = "qcom,msm8994-dwc3", "qcom,snps-dwc3";
+			reg = <0xf9200000 0xd000>;
+			interrupts = <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 180 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 311 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 310 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "qusb2_phy",
+					  "hs_phy_irq",
+					  "ss_phy_irq";
+		};
+	};
+};
diff --git a/drivers/of/overlays/dwc3-flattening/dwc3-qcom_msm8996.dts b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_msm8996.dts
new file mode 100644
index 000000000000..1b9ae360f1ce
--- /dev/null
+++ b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_msm8996.dts
@@ -0,0 +1,58 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+/ {
+	fragment@0 {
+		target-path = "/soc@0/usb@6af8800";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		interrupt-parent = <&intc>;
+
+		__overlay__ {
+			compatible = "qcom,msm8996-dwc3", "qcom,snps-dwc3";
+			reg = <0x06a00000 0xd000>;
+			interrupts = <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 180 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 347 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 243 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "qusb2_phy",
+					  "hs_phy_irq",
+					  "ss_phy_irq";
+			phys = <&hsusb_phy1>,
+			       <&usb3phy>;
+			phy-names = "usb2-phy",
+				    "usb3-phy";
+		};
+	};
+
+	fragment@1 {
+		target-path = "/soc@0/usb@76f8800";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		interrupt-parent = <&intc>;
+
+		__overlay__ {
+			compatible = "qcom,msm8996-dwc3", "qcom,snps-dwc3";
+			reg = <0x07600000 0xd000>;
+			interrupts = <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 352 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 139 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "qusb2_phy",
+					  "hs_phy_irq";
+			phys = <&hsusb_phy2>;
+			phy-names = "usb2-phy";
+		};
+	};
+};
diff --git a/drivers/of/overlays/dwc3-flattening/dwc3-qcom_msm8996_oneplus_oneplus3.dts b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_msm8996_oneplus_oneplus3.dts
new file mode 100644
index 000000000000..7a583de320cf
--- /dev/null
+++ b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_msm8996_oneplus_oneplus3.dts
@@ -0,0 +1,56 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+/ {
+	fragment@0 {
+		target-path = "/soc@0/usb@6af8800";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		interrupt-parent = <&intc>;
+
+		__overlay__ {
+			compatible = "qcom,msm8996-dwc3", "qcom,snps-dwc3";
+			reg = <0x06a00000 0xd000>;
+			interrupts = <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 180 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 347 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 243 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "qusb2_phy",
+					  "hs_phy_irq",
+					  "ss_phy_irq";
+			phys = <&hsusb_phy1>;
+			phy-names = "usb2-phy";
+		};
+	};
+
+	fragment@1 {
+		target-path = "/soc@0/usb@76f8800";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		interrupt-parent = <&intc>;
+
+		__overlay__ {
+			compatible = "qcom,msm8996-dwc3", "qcom,snps-dwc3";
+			reg = <0x07600000 0xd000>;
+			interrupts = <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 352 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 139 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "qusb2_phy",
+					  "hs_phy_irq";
+			phys = <&hsusb_phy2>;
+			phy-names = "usb2-phy";
+		};
+	};
+};
diff --git a/drivers/of/overlays/dwc3-flattening/dwc3-qcom_msm8996_oneplus_oneplus3t.dts b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_msm8996_oneplus_oneplus3t.dts
new file mode 100644
index 000000000000..7a583de320cf
--- /dev/null
+++ b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_msm8996_oneplus_oneplus3t.dts
@@ -0,0 +1,56 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+/ {
+	fragment@0 {
+		target-path = "/soc@0/usb@6af8800";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		interrupt-parent = <&intc>;
+
+		__overlay__ {
+			compatible = "qcom,msm8996-dwc3", "qcom,snps-dwc3";
+			reg = <0x06a00000 0xd000>;
+			interrupts = <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 180 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 347 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 243 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "qusb2_phy",
+					  "hs_phy_irq",
+					  "ss_phy_irq";
+			phys = <&hsusb_phy1>;
+			phy-names = "usb2-phy";
+		};
+	};
+
+	fragment@1 {
+		target-path = "/soc@0/usb@76f8800";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		interrupt-parent = <&intc>;
+
+		__overlay__ {
+			compatible = "qcom,msm8996-dwc3", "qcom,snps-dwc3";
+			reg = <0x07600000 0xd000>;
+			interrupts = <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 352 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 139 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "qusb2_phy",
+					  "hs_phy_irq";
+			phys = <&hsusb_phy2>;
+			phy-names = "usb2-phy";
+		};
+	};
+};
diff --git a/drivers/of/overlays/dwc3-flattening/dwc3-qcom_msm8996_sony_dora_row.dts b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_msm8996_sony_dora_row.dts
new file mode 100644
index 000000000000..da6e357b0cbc
--- /dev/null
+++ b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_msm8996_sony_dora_row.dts
@@ -0,0 +1,57 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+/ {
+	fragment@0 {
+		target-path = "/soc@0/usb@6af8800";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		interrupt-parent = <&intc>;
+
+		__overlay__ {
+			compatible = "qcom,msm8996-dwc3", "qcom,snps-dwc3";
+			reg = <0x06a00000 0xd000>;
+			interrupts = <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 180 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 347 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 243 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "qusb2_phy",
+					  "hs_phy_irq",
+					  "ss_phy_irq";
+			phys = <&hsusb_phy1>;
+			phy-names = "usb2-phy";
+			extcon = <&usb3_id>;
+		};
+	};
+
+	fragment@1 {
+		target-path = "/soc@0/usb@76f8800";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		interrupt-parent = <&intc>;
+
+		__overlay__ {
+			compatible = "qcom,msm8996-dwc3", "qcom,snps-dwc3";
+			reg = <0x07600000 0xd000>;
+			interrupts = <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 352 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 139 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "qusb2_phy",
+					  "hs_phy_irq";
+			phys = <&hsusb_phy2>;
+			phy-names = "usb2-phy";
+		};
+	};
+};
diff --git a/drivers/of/overlays/dwc3-flattening/dwc3-qcom_msm8996_sony_kagura_row.dts b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_msm8996_sony_kagura_row.dts
new file mode 100644
index 000000000000..da6e357b0cbc
--- /dev/null
+++ b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_msm8996_sony_kagura_row.dts
@@ -0,0 +1,57 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+/ {
+	fragment@0 {
+		target-path = "/soc@0/usb@6af8800";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		interrupt-parent = <&intc>;
+
+		__overlay__ {
+			compatible = "qcom,msm8996-dwc3", "qcom,snps-dwc3";
+			reg = <0x06a00000 0xd000>;
+			interrupts = <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 180 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 347 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 243 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "qusb2_phy",
+					  "hs_phy_irq",
+					  "ss_phy_irq";
+			phys = <&hsusb_phy1>;
+			phy-names = "usb2-phy";
+			extcon = <&usb3_id>;
+		};
+	};
+
+	fragment@1 {
+		target-path = "/soc@0/usb@76f8800";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		interrupt-parent = <&intc>;
+
+		__overlay__ {
+			compatible = "qcom,msm8996-dwc3", "qcom,snps-dwc3";
+			reg = <0x07600000 0xd000>;
+			interrupts = <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 352 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 139 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "qusb2_phy",
+					  "hs_phy_irq";
+			phys = <&hsusb_phy2>;
+			phy-names = "usb2-phy";
+		};
+	};
+};
diff --git a/drivers/of/overlays/dwc3-flattening/dwc3-qcom_msm8996_sony_keyaki_row.dts b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_msm8996_sony_keyaki_row.dts
new file mode 100644
index 000000000000..da6e357b0cbc
--- /dev/null
+++ b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_msm8996_sony_keyaki_row.dts
@@ -0,0 +1,57 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+/ {
+	fragment@0 {
+		target-path = "/soc@0/usb@6af8800";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		interrupt-parent = <&intc>;
+
+		__overlay__ {
+			compatible = "qcom,msm8996-dwc3", "qcom,snps-dwc3";
+			reg = <0x06a00000 0xd000>;
+			interrupts = <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 180 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 347 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 243 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "qusb2_phy",
+					  "hs_phy_irq",
+					  "ss_phy_irq";
+			phys = <&hsusb_phy1>;
+			phy-names = "usb2-phy";
+			extcon = <&usb3_id>;
+		};
+	};
+
+	fragment@1 {
+		target-path = "/soc@0/usb@76f8800";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		interrupt-parent = <&intc>;
+
+		__overlay__ {
+			compatible = "qcom,msm8996-dwc3", "qcom,snps-dwc3";
+			reg = <0x07600000 0xd000>;
+			interrupts = <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 352 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 139 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "qusb2_phy",
+					  "hs_phy_irq";
+			phys = <&hsusb_phy2>;
+			phy-names = "usb2-phy";
+		};
+	};
+};
diff --git a/drivers/of/overlays/dwc3-flattening/dwc3-qcom_msm8996_xiaomi_gemini.dts b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_msm8996_xiaomi_gemini.dts
new file mode 100644
index 000000000000..7a583de320cf
--- /dev/null
+++ b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_msm8996_xiaomi_gemini.dts
@@ -0,0 +1,56 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+/ {
+	fragment@0 {
+		target-path = "/soc@0/usb@6af8800";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		interrupt-parent = <&intc>;
+
+		__overlay__ {
+			compatible = "qcom,msm8996-dwc3", "qcom,snps-dwc3";
+			reg = <0x06a00000 0xd000>;
+			interrupts = <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 180 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 347 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 243 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "qusb2_phy",
+					  "hs_phy_irq",
+					  "ss_phy_irq";
+			phys = <&hsusb_phy1>;
+			phy-names = "usb2-phy";
+		};
+	};
+
+	fragment@1 {
+		target-path = "/soc@0/usb@76f8800";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		interrupt-parent = <&intc>;
+
+		__overlay__ {
+			compatible = "qcom,msm8996-dwc3", "qcom,snps-dwc3";
+			reg = <0x07600000 0xd000>;
+			interrupts = <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 352 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 139 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "qusb2_phy",
+					  "hs_phy_irq";
+			phys = <&hsusb_phy2>;
+			phy-names = "usb2-phy";
+		};
+	};
+};
diff --git a/drivers/of/overlays/dwc3-flattening/dwc3-qcom_msm8996_xiaomi_natrium.dts b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_msm8996_xiaomi_natrium.dts
new file mode 100644
index 000000000000..7a583de320cf
--- /dev/null
+++ b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_msm8996_xiaomi_natrium.dts
@@ -0,0 +1,56 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+/ {
+	fragment@0 {
+		target-path = "/soc@0/usb@6af8800";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		interrupt-parent = <&intc>;
+
+		__overlay__ {
+			compatible = "qcom,msm8996-dwc3", "qcom,snps-dwc3";
+			reg = <0x06a00000 0xd000>;
+			interrupts = <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 180 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 347 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 243 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "qusb2_phy",
+					  "hs_phy_irq",
+					  "ss_phy_irq";
+			phys = <&hsusb_phy1>;
+			phy-names = "usb2-phy";
+		};
+	};
+
+	fragment@1 {
+		target-path = "/soc@0/usb@76f8800";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		interrupt-parent = <&intc>;
+
+		__overlay__ {
+			compatible = "qcom,msm8996-dwc3", "qcom,snps-dwc3";
+			reg = <0x07600000 0xd000>;
+			interrupts = <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 352 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 139 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "qusb2_phy",
+					  "hs_phy_irq";
+			phys = <&hsusb_phy2>;
+			phy-names = "usb2-phy";
+		};
+	};
+};
diff --git a/drivers/of/overlays/dwc3-flattening/dwc3-qcom_msm8996_xiaomi_scorpio.dts b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_msm8996_xiaomi_scorpio.dts
new file mode 100644
index 000000000000..7a583de320cf
--- /dev/null
+++ b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_msm8996_xiaomi_scorpio.dts
@@ -0,0 +1,56 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+/ {
+	fragment@0 {
+		target-path = "/soc@0/usb@6af8800";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		interrupt-parent = <&intc>;
+
+		__overlay__ {
+			compatible = "qcom,msm8996-dwc3", "qcom,snps-dwc3";
+			reg = <0x06a00000 0xd000>;
+			interrupts = <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 180 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 347 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 243 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "qusb2_phy",
+					  "hs_phy_irq",
+					  "ss_phy_irq";
+			phys = <&hsusb_phy1>;
+			phy-names = "usb2-phy";
+		};
+	};
+
+	fragment@1 {
+		target-path = "/soc@0/usb@76f8800";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		interrupt-parent = <&intc>;
+
+		__overlay__ {
+			compatible = "qcom,msm8996-dwc3", "qcom,snps-dwc3";
+			reg = <0x07600000 0xd000>;
+			interrupts = <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 352 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 139 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "qusb2_phy",
+					  "hs_phy_irq";
+			phys = <&hsusb_phy2>;
+			phy-names = "usb2-phy";
+		};
+	};
+};
diff --git a/drivers/of/overlays/dwc3-flattening/dwc3-qcom_msm8998.dts b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_msm8998.dts
new file mode 100644
index 000000000000..75824abf794b
--- /dev/null
+++ b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_msm8998.dts
@@ -0,0 +1,34 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+/ {
+	fragment@0 {
+		target-path = "/soc@0/usb@a8f8800";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		interrupt-parent = <&intc>;
+
+		__overlay__ {
+			compatible = "qcom,msm8998-dwc3", "qcom,snps-dwc3";
+			reg = <0x0a800000 0xd100>;
+			interrupts = <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 180 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 347 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 243 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "qusb2_phy",
+					  "ss_phy_irq";
+			phys = <&qusb2phy>,
+			       <&usb3phy>;
+			phy-names = "usb2-phy",
+				    "usb3-phy";
+		};
+	};
+};
diff --git a/drivers/of/overlays/dwc3-flattening/dwc3-qcom_msm8998_fxtec_pro1.dts b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_msm8998_fxtec_pro1.dts
new file mode 100644
index 000000000000..4f3aded0142d
--- /dev/null
+++ b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_msm8998_fxtec_pro1.dts
@@ -0,0 +1,35 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+/ {
+	fragment@0 {
+		target-path = "/soc@0/usb@a8f8800";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		interrupt-parent = <&intc>;
+
+		__overlay__ {
+			compatible = "qcom,msm8998-dwc3", "qcom,snps-dwc3";
+			reg = <0x0a800000 0xd100>;
+			interrupts = <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 180 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 347 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 243 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "qusb2_phy",
+					  "ss_phy_irq";
+			phys = <&qusb2phy>,
+			       <&usb3phy>;
+			phy-names = "usb2-phy",
+				    "usb3-phy";
+			extcon = <&extcon_usb>;
+		};
+	};
+};
diff --git a/drivers/of/overlays/dwc3-flattening/dwc3-qcom_msm8998_oneplus_cheeseburger.dts b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_msm8998_oneplus_cheeseburger.dts
new file mode 100644
index 000000000000..3b331d0e5283
--- /dev/null
+++ b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_msm8998_oneplus_cheeseburger.dts
@@ -0,0 +1,32 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+/ {
+	fragment@0 {
+		target-path = "/soc@0/usb@a8f8800";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		interrupt-parent = <&intc>;
+
+		__overlay__ {
+			compatible = "qcom,msm8998-dwc3", "qcom,snps-dwc3";
+			reg = <0x0a800000 0xd100>;
+			interrupts = <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 180 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 347 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 243 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "qusb2_phy",
+					  "ss_phy_irq";
+			phys = <&qusb2phy>;
+			phy-names = "usb2-phy";
+		};
+	};
+};
diff --git a/drivers/of/overlays/dwc3-flattening/dwc3-qcom_msm8998_oneplus_dumpling.dts b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_msm8998_oneplus_dumpling.dts
new file mode 100644
index 000000000000..3b331d0e5283
--- /dev/null
+++ b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_msm8998_oneplus_dumpling.dts
@@ -0,0 +1,32 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+/ {
+	fragment@0 {
+		target-path = "/soc@0/usb@a8f8800";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		interrupt-parent = <&intc>;
+
+		__overlay__ {
+			compatible = "qcom,msm8998-dwc3", "qcom,snps-dwc3";
+			reg = <0x0a800000 0xd100>;
+			interrupts = <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 180 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 347 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 243 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "qusb2_phy",
+					  "ss_phy_irq";
+			phys = <&qusb2phy>;
+			phy-names = "usb2-phy";
+		};
+	};
+};
diff --git a/drivers/of/overlays/dwc3-flattening/dwc3-qcom_msm8998_sony_xperia_lilac.dts b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_msm8998_sony_xperia_lilac.dts
new file mode 100644
index 000000000000..4f3aded0142d
--- /dev/null
+++ b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_msm8998_sony_xperia_lilac.dts
@@ -0,0 +1,35 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+/ {
+	fragment@0 {
+		target-path = "/soc@0/usb@a8f8800";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		interrupt-parent = <&intc>;
+
+		__overlay__ {
+			compatible = "qcom,msm8998-dwc3", "qcom,snps-dwc3";
+			reg = <0x0a800000 0xd100>;
+			interrupts = <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 180 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 347 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 243 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "qusb2_phy",
+					  "ss_phy_irq";
+			phys = <&qusb2phy>,
+			       <&usb3phy>;
+			phy-names = "usb2-phy",
+				    "usb3-phy";
+			extcon = <&extcon_usb>;
+		};
+	};
+};
diff --git a/drivers/of/overlays/dwc3-flattening/dwc3-qcom_msm8998_sony_xperia_maple.dts b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_msm8998_sony_xperia_maple.dts
new file mode 100644
index 000000000000..4f3aded0142d
--- /dev/null
+++ b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_msm8998_sony_xperia_maple.dts
@@ -0,0 +1,35 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+/ {
+	fragment@0 {
+		target-path = "/soc@0/usb@a8f8800";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		interrupt-parent = <&intc>;
+
+		__overlay__ {
+			compatible = "qcom,msm8998-dwc3", "qcom,snps-dwc3";
+			reg = <0x0a800000 0xd100>;
+			interrupts = <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 180 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 347 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 243 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "qusb2_phy",
+					  "ss_phy_irq";
+			phys = <&qusb2phy>,
+			       <&usb3phy>;
+			phy-names = "usb2-phy",
+				    "usb3-phy";
+			extcon = <&extcon_usb>;
+		};
+	};
+};
diff --git a/drivers/of/overlays/dwc3-flattening/dwc3-qcom_msm8998_sony_xperia_poplar.dts b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_msm8998_sony_xperia_poplar.dts
new file mode 100644
index 000000000000..4f3aded0142d
--- /dev/null
+++ b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_msm8998_sony_xperia_poplar.dts
@@ -0,0 +1,35 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+/ {
+	fragment@0 {
+		target-path = "/soc@0/usb@a8f8800";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		interrupt-parent = <&intc>;
+
+		__overlay__ {
+			compatible = "qcom,msm8998-dwc3", "qcom,snps-dwc3";
+			reg = <0x0a800000 0xd100>;
+			interrupts = <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 180 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 347 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 243 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "qusb2_phy",
+					  "ss_phy_irq";
+			phys = <&qusb2phy>,
+			       <&usb3phy>;
+			phy-names = "usb2-phy",
+				    "usb3-phy";
+			extcon = <&extcon_usb>;
+		};
+	};
+};
diff --git a/drivers/of/overlays/dwc3-flattening/dwc3-qcom_msm8998_xiaomi_sagit.dts b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_msm8998_xiaomi_sagit.dts
new file mode 100644
index 000000000000..3b331d0e5283
--- /dev/null
+++ b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_msm8998_xiaomi_sagit.dts
@@ -0,0 +1,32 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+/ {
+	fragment@0 {
+		target-path = "/soc@0/usb@a8f8800";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		interrupt-parent = <&intc>;
+
+		__overlay__ {
+			compatible = "qcom,msm8998-dwc3", "qcom,snps-dwc3";
+			reg = <0x0a800000 0xd100>;
+			interrupts = <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 180 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 347 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 243 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "qusb2_phy",
+					  "ss_phy_irq";
+			phys = <&qusb2phy>;
+			phy-names = "usb2-phy";
+		};
+	};
+};
diff --git a/drivers/of/overlays/dwc3-flattening/dwc3-qcom_qcm2290.dts b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_qcm2290.dts
new file mode 100644
index 000000000000..4a43b3f1a51e
--- /dev/null
+++ b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_qcm2290.dts
@@ -0,0 +1,32 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+/ {
+	fragment@0 {
+		target-path = "/soc@0/usb@4ef8800";
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		__overlay__ {
+			compatible = "qcom,qcm2290-dwc3", "qcom,snps-dwc3";
+			reg = <0 0x04e00000 0 0xd100>;
+			interrupts-extended = <&intc GIC_SPI 255 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 260 IRQ_TYPE_LEVEL_HIGH>,
+					      <&mpm 12 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3",
+					  "hs_phy_irq",
+					  "ss_phy_irq";
+			iommus = <&apps_smmu 0x120 0x0>;
+			phys = <&usb_hsphy>,
+			       <&usb_qmpphy>;
+			phy-names = "usb2-phy",
+				    "usb3-phy";
+		};
+	};
+};
diff --git a/drivers/of/overlays/dwc3-flattening/dwc3-qcom_qcm6490.dts b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_qcm6490.dts
new file mode 100644
index 000000000000..c9c921d55e3f
--- /dev/null
+++ b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_qcm6490.dts
@@ -0,0 +1,63 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/phy/phy-qcom-qmp.h>
+
+/ {
+	fragment@0 {
+		target-path = "/soc@0/usb@8cf8800";
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		__overlay__ {
+			compatible = "qcom,sc7280-dwc3", "qcom,snps-dwc3";
+			reg = <0 0x08c00000 0 0xe400>;
+			interrupts-extended = <&intc GIC_SPI 242 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 241 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 12 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 13 IRQ_TYPE_EDGE_BOTH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "hs_phy_irq",
+					  "dp_hs_phy_irq",
+					  "dm_hs_phy_irq";
+			iommus = <&apps_smmu 0xa0 0x0>;
+			phys = <&usb_2_hsphy>;
+			phy-names = "usb2-phy";
+		};
+	};
+
+	fragment@1 {
+		target-path = "/soc@0/usb@a6f8800";
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		__overlay__ {
+			compatible = "qcom,sc7280-dwc3", "qcom,snps-dwc3";
+			reg = <0 0x0a600000 0 0xe400>;
+			interrupts-extended = <&intc GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 14 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 15 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 17 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "hs_phy_irq",
+					  "dp_hs_phy_irq",
+					  "dm_hs_phy_irq",
+					  "ss_phy_irq";
+			iommus = <&apps_smmu 0xe0 0x0>;
+			phys = <&usb_1_hsphy>,
+			       <&usb_1_qmpphy QMP_USB43DP_USB3_PHY>;
+			phy-names = "usb2-phy",
+				    "usb3-phy";
+		};
+	};
+};
diff --git a/drivers/of/overlays/dwc3-flattening/dwc3-qcom_qcs404.dts b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_qcs404.dts
new file mode 100644
index 000000000000..794bac913137
--- /dev/null
+++ b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_qcs404.dts
@@ -0,0 +1,56 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+/ {
+	fragment@0 {
+		target-path = "/soc@0/usb@7678800";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		interrupt-parent = <&intc>;
+
+		__overlay__ {
+			compatible = "qcom,qcs404-dwc3", "qcom,snps-dwc3";
+			reg = <0x07580000 0xd100>;
+			interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 319 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "hs_phy_irq",
+					  "qusb2_phy";
+			phys = <&usb2_phy_prim>,
+			       <&usb3_phy>;
+			phy-names = "usb2-phy",
+				    "usb3-phy";
+		};
+	};
+
+	fragment@1 {
+		target-path = "/soc@0/usb@79b8800";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		interrupt-parent = <&intc>;
+
+		__overlay__ {
+			compatible = "qcom,qcs404-dwc3", "qcom,snps-dwc3";
+			reg = <0x078c0000 0xd000>;
+			interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 318 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "hs_phy_irq",
+					  "qusb2_phy";
+			phys = <&usb2_phy_sec>;
+			phy-names = "usb2-phy";
+		};
+	};
+};
diff --git a/drivers/of/overlays/dwc3-flattening/dwc3-qcom_qcs615.dts b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_qcs615.dts
new file mode 100644
index 000000000000..52f94ce9c327
--- /dev/null
+++ b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_qcs615.dts
@@ -0,0 +1,62 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+/ {
+	fragment@0 {
+		target-path = "/soc@0/usb@a6f8800";
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		__overlay__ {
+			compatible = "qcom,qcs615-dwc3", "qcom,snps-dwc3";
+			reg = <0 0x0a600000 0 0xd100>;
+			interrupts-extended = <&intc GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 9 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 8 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 6 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "hs_phy_irq",
+					  "dp_hs_phy_irq",
+					  "dm_hs_phy_irq",
+					  "ss_phy_irq";
+			iommus = <&apps_smmu 0x140 0x0>;
+			phys = <&usb_1_hsphy>,
+			       <&usb_qmpphy>;
+			phy-names = "usb2-phy",
+				    "usb3-phy";
+		};
+	};
+
+	fragment@1 {
+		target-path = "/soc@0/usb@a8f8800";
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		__overlay__ {
+			compatible = "qcom,qcs615-dwc3", "qcom,snps-dwc3";
+			reg = <0 0x0a800000 0 0xd100>;
+			interrupts-extended = <&intc GIC_SPI 664 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 663 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 662 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 11 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 10 IRQ_TYPE_EDGE_BOTH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "hs_phy_irq",
+					  "dp_hs_phy_irq",
+					  "dm_hs_phy_irq";
+			iommus = <&apps_smmu 0xe0 0x0>;
+			phys = <&usb_hsphy_2>;
+			phy-names = "usb2-phy";
+		};
+	};
+};
diff --git a/drivers/of/overlays/dwc3-flattening/dwc3-qcom_qcs8300.dts b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_qcs8300.dts
new file mode 100644
index 000000000000..fa843e3ca9ff
--- /dev/null
+++ b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_qcs8300.dts
@@ -0,0 +1,62 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+/ {
+	fragment@0 {
+		target-path = "/soc@0/usb@a6f8800";
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		__overlay__ {
+			compatible = "qcom,qcs8300-dwc3", "qcom,snps-dwc3";
+			reg = <0 0x0a600000 0 0xe400>;
+			interrupts-extended = <&intc GIC_SPI 292 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 287 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 261 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 14 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 15 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 12 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "hs_phy_irq",
+					  "dp_hs_phy_irq",
+					  "dm_hs_phy_irq",
+					  "ss_phy_irq";
+			iommus = <&apps_smmu 0x80 0x0>;
+			phys = <&usb_1_hsphy>,
+			       <&usb_qmpphy>;
+			phy-names = "usb2-phy",
+				    "usb3-phy";
+		};
+	};
+
+	fragment@1 {
+		target-path = "/soc@0/usb@a4f8800";
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		__overlay__ {
+			compatible = "qcom,qcs8300-dwc3", "qcom,snps-dwc3";
+			reg = <0 0x0a400000 0 0xe400>;
+			interrupts-extended = <&intc GIC_SPI 442 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 444 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 443 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 10 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 9 IRQ_TYPE_EDGE_BOTH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "hs_phy_irq",
+					  "dp_hs_phy_irq",
+					  "dm_hs_phy_irq";
+			iommus = <&apps_smmu 0x20 0x0>;
+			phys = <&usb_2_hsphy>;
+			phy-names = "usb2-phy";
+		};
+	};
+};
diff --git a/drivers/of/overlays/dwc3-flattening/dwc3-qcom_qdu1000.dts b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_qdu1000.dts
new file mode 100644
index 000000000000..8d245859fae1
--- /dev/null
+++ b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_qdu1000.dts
@@ -0,0 +1,38 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+/ {
+	fragment@0 {
+		target-path = "/soc@0/usb@a6f8800";
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		__overlay__ {
+			compatible = "qcom,qdu1000-dwc3", "qcom,snps-dwc3";
+			reg = <0 0x0a600000 0 0xd100>;
+			interrupts-extended = <&intc GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 8 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 9 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 6 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "hs_phy_irq",
+					  "dp_hs_phy_irq",
+					  "dm_hs_phy_irq",
+					  "ss_phy_irq";
+			iommus = <&apps_smmu 0xc0 0x0>;
+			phys = <&usb_1_hsphy>,
+			       <&usb_1_qmpphy>;
+			phy-names = "usb2-phy",
+				    "usb3-phy";
+		};
+	};
+};
diff --git a/drivers/of/overlays/dwc3-flattening/dwc3-qcom_qru1000.dts b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_qru1000.dts
new file mode 100644
index 000000000000..8d245859fae1
--- /dev/null
+++ b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_qru1000.dts
@@ -0,0 +1,38 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+/ {
+	fragment@0 {
+		target-path = "/soc@0/usb@a6f8800";
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		__overlay__ {
+			compatible = "qcom,qdu1000-dwc3", "qcom,snps-dwc3";
+			reg = <0 0x0a600000 0 0xd100>;
+			interrupts-extended = <&intc GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 8 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 9 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 6 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "hs_phy_irq",
+					  "dp_hs_phy_irq",
+					  "dm_hs_phy_irq",
+					  "ss_phy_irq";
+			iommus = <&apps_smmu 0xc0 0x0>;
+			phys = <&usb_1_hsphy>,
+			       <&usb_1_qmpphy>;
+			phy-names = "usb2-phy",
+				    "usb3-phy";
+		};
+	};
+};
diff --git a/drivers/of/overlays/dwc3-flattening/dwc3-qcom_sa8155p.dts b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_sa8155p.dts
new file mode 100644
index 000000000000..408d42c1649c
--- /dev/null
+++ b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_sa8155p.dts
@@ -0,0 +1,71 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/phy/phy-qcom-qmp.h>
+
+/ {
+	fragment@0 {
+		target-path = "/soc@0/usb@a6f8800";
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		__overlay__ {
+			compatible = "qcom,sm8150-dwc3", "qcom,snps-dwc3";
+			reg = <0 0x0a600000 0 0xd100>;
+			interrupts-extended = <&intc GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 9 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 8 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 6 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "hs_phy_irq",
+					  "dp_hs_phy_irq",
+					  "dm_hs_phy_irq",
+					  "ss_phy_irq";
+			iommus = <&apps_smmu 0x140 0x0>;
+			phys = <&usb_1_hsphy>,
+			       <&usb_1_qmpphy QMP_USB43DP_USB3_PHY>;
+			phy-names = "usb2-phy",
+				    "usb3-phy";
+			pinctrl-names = "default";
+			pinctrl-0 = <&usb2phy_ac_en1_default>;
+		};
+	};
+
+	fragment@1 {
+		target-path = "/soc@0/usb@a8f8800";
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		__overlay__ {
+			compatible = "qcom,sm8150-dwc3", "qcom,snps-dwc3";
+			reg = <0 0x0a800000 0 0xd100>;
+			interrupts-extended = <&intc GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 135 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 11 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 10 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 7 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "hs_phy_irq",
+					  "dp_hs_phy_irq",
+					  "dm_hs_phy_irq",
+					  "ss_phy_irq";
+			iommus = <&apps_smmu 0x160 0x0>;
+			phys = <&usb_2_hsphy>,
+			       <&usb_2_qmpphy>;
+			phy-names = "usb2-phy",
+				    "usb3-phy";
+			pinctrl-names = "default";
+			pinctrl-0 = <&usb2phy_ac_en2_default>;
+		};
+	};
+};
diff --git a/drivers/of/overlays/dwc3-flattening/dwc3-qcom_sa8540p.dts b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_sa8540p.dts
new file mode 100644
index 000000000000..553e8ddb91ce
--- /dev/null
+++ b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_sa8540p.dts
@@ -0,0 +1,129 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/phy/phy-qcom-qmp.h>
+
+/ {
+	fragment@0 {
+		target-path = "/soc@0/usb@a4f8800";
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		__overlay__ {
+			compatible = "qcom,sc8280xp-dwc3-mp", "qcom,snps-dwc3";
+			reg = <0 0x0a400000 0 0xd100>;
+			interrupts-extended = <&intc GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 135 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 857 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 856 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 860 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 859 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 127 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 126 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 129 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 128 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 131 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 130 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 133 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 132 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 16 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 17 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event_1",
+					  "pwr_event_2",
+					  "pwr_event_3",
+					  "pwr_event_4",
+					  "hs_phy_1",
+					  "hs_phy_2",
+					  "hs_phy_3",
+					  "hs_phy_4",
+					  "dp_hs_phy_1",
+					  "dm_hs_phy_1",
+					  "dp_hs_phy_2",
+					  "dm_hs_phy_2",
+					  "dp_hs_phy_3",
+					  "dm_hs_phy_3",
+					  "dp_hs_phy_4",
+					  "dm_hs_phy_4",
+					  "ss_phy_1",
+					  "ss_phy_2";
+			iommus = <&apps_smmu 0x800 0x0>;
+			phys = <&usb_2_hsphy0>,
+			       <&usb_2_qmpphy0>,
+			       <&usb_2_hsphy1>,
+			       <&usb_2_qmpphy1>,
+			       <&usb_2_hsphy2>,
+			       <&usb_2_hsphy3>;
+			phy-names = "usb2-0",
+				    "usb3-0",
+				    "usb2-1",
+				    "usb3-1",
+				    "usb2-2",
+				    "usb2-3";
+		};
+	};
+
+	fragment@1 {
+		target-path = "/soc@0/usb@a6f8800";
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		__overlay__ {
+			compatible = "qcom,sc8280xp-dwc3", "qcom,snps-dwc3";
+			reg = <0 0x0a600000 0 0xd100>;
+			interrupts-extended = <&intc GIC_SPI 803 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 804 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 805 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 14 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 15 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 138 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "hs_phy_irq",
+					  "dp_hs_phy_irq",
+					  "dm_hs_phy_irq",
+					  "ss_phy_irq";
+			iommus = <&apps_smmu 0x820 0x0>;
+			phys = <&usb_0_hsphy>,
+			       <&usb_0_qmpphy QMP_USB43DP_USB3_PHY>;
+			phy-names = "usb2-phy",
+				    "usb3-phy";
+		};
+	};
+
+	fragment@2 {
+		target-path = "/soc@0/usb@a8f8800";
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		__overlay__ {
+			compatible = "qcom,sc8280xp-dwc3", "qcom,snps-dwc3";
+			reg = <0 0x0a800000 0 0xd100>;
+			interrupts-extended = <&intc GIC_SPI 810 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 811 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 790 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 12 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 13 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 136 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "hs_phy_irq",
+					  "dp_hs_phy_irq",
+					  "dm_hs_phy_irq",
+					  "ss_phy_irq";
+			iommus = <&apps_smmu 0x860 0x0>;
+			phys = <&usb_1_hsphy>,
+			       <&usb_1_qmpphy QMP_USB43DP_USB3_PHY>;
+			phy-names = "usb2-phy",
+				    "usb3-phy";
+		};
+	};
+};
diff --git a/drivers/of/overlays/dwc3-flattening/dwc3-qcom_sa8775p.dts b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_sa8775p.dts
new file mode 100644
index 000000000000..4f218dbbef8b
--- /dev/null
+++ b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_sa8775p.dts
@@ -0,0 +1,90 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+/ {
+	fragment@0 {
+		target-path = "/soc@0/usb@a6f8800";
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		__overlay__ {
+			compatible = "qcom,sa8775p-dwc3", "qcom,snps-dwc3";
+			reg = <0 0x0a600000 0 0xe400>;
+			interrupts-extended = <&intc GIC_SPI 292 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 287 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 261 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 14 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 15 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 12 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "hs_phy_irq",
+					  "dp_hs_phy_irq",
+					  "dm_hs_phy_irq",
+					  "ss_phy_irq";
+			iommus = <&apps_smmu 0x80 0x0>;
+			phys = <&usb_0_hsphy>,
+			       <&usb_0_qmpphy>;
+			phy-names = "usb2-phy",
+				    "usb3-phy";
+		};
+	};
+
+	fragment@1 {
+		target-path = "/soc@0/usb@a8f8800";
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		__overlay__ {
+			compatible = "qcom,sa8775p-dwc3", "qcom,snps-dwc3";
+			reg = <0 0x0a800000 0 0xe400>;
+			interrupts-extended = <&intc GIC_SPI 349 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 352 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 351 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 8 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 7 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 13 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "hs_phy_irq",
+					  "dp_hs_phy_irq",
+					  "dm_hs_phy_irq",
+					  "ss_phy_irq";
+			iommus = <&apps_smmu 0xa0 0x0>;
+			phys = <&usb_1_hsphy>,
+			       <&usb_1_qmpphy>;
+			phy-names = "usb2-phy",
+				    "usb3-phy";
+		};
+	};
+
+	fragment@2 {
+		target-path = "/soc@0/usb@a4f8800";
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		__overlay__ {
+			compatible = "qcom,sa8775p-dwc3", "qcom,snps-dwc3";
+			reg = <0 0x0a400000 0 0xe400>;
+			interrupts-extended = <&intc GIC_SPI 442 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 444 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 443 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 10 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 9 IRQ_TYPE_EDGE_BOTH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "hs_phy_irq",
+					  "dp_hs_phy_irq",
+					  "dm_hs_phy_irq";
+			iommus = <&apps_smmu 0x20 0x0>;
+			phys = <&usb_2_hsphy>;
+			phy-names = "usb2-phy";
+		};
+	};
+};
diff --git a/drivers/of/overlays/dwc3-flattening/dwc3-qcom_sar2130p.dts b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_sar2130p.dts
new file mode 100644
index 000000000000..582bcf1b13da
--- /dev/null
+++ b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_sar2130p.dts
@@ -0,0 +1,39 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/phy/phy-qcom-qmp.h>
+
+/ {
+	fragment@0 {
+		target-path = "/soc@0/usb@a6f8800";
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		__overlay__ {
+			compatible = "qcom,sar2130p-dwc3", "qcom,snps-dwc3";
+			reg = <0 0x0a600000 0 0xd100>;
+			interrupts-extended = <&intc GIC_SPI 347 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 350 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 349 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 14 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 15 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 17 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "hs_phy_irq",
+					  "dp_hs_phy_irq",
+					  "dm_hs_phy_irq",
+					  "ss_phy_irq";
+			iommus = <&apps_smmu 0x20 0x0>;
+			phys = <&usb_1_hsphy>,
+			       <&usb_dp_qmpphy QMP_USB43DP_USB3_PHY>;
+			phy-names = "usb2-phy",
+				    "usb3-phy";
+		};
+	};
+};
diff --git a/drivers/of/overlays/dwc3-flattening/dwc3-qcom_sc7180.dts b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_sc7180.dts
new file mode 100644
index 000000000000..cd4caa173891
--- /dev/null
+++ b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_sc7180.dts
@@ -0,0 +1,39 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/phy/phy-qcom-qmp.h>
+
+/ {
+	fragment@0 {
+		target-path = "/soc@0/usb@a6f8800";
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		__overlay__ {
+			compatible = "qcom,sc7180-dwc3", "qcom,snps-dwc3";
+			reg = <0 0x0a600000 0 0xe400>;
+			interrupts-extended = <&intc GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 9 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 8 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 6 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "hs_phy_irq",
+					  "dp_hs_phy_irq",
+					  "dm_hs_phy_irq",
+					  "ss_phy_irq";
+			iommus = <&apps_smmu 0x540 0x0>;
+			phys = <&usb_1_hsphy>,
+			       <&usb_1_qmpphy QMP_USB43DP_USB3_PHY>;
+			phy-names = "usb2-phy",
+				    "usb3-phy";
+		};
+	};
+};
diff --git a/drivers/of/overlays/dwc3-flattening/dwc3-qcom_sc7280.dts b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_sc7280.dts
new file mode 100644
index 000000000000..c9c921d55e3f
--- /dev/null
+++ b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_sc7280.dts
@@ -0,0 +1,63 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/phy/phy-qcom-qmp.h>
+
+/ {
+	fragment@0 {
+		target-path = "/soc@0/usb@8cf8800";
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		__overlay__ {
+			compatible = "qcom,sc7280-dwc3", "qcom,snps-dwc3";
+			reg = <0 0x08c00000 0 0xe400>;
+			interrupts-extended = <&intc GIC_SPI 242 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 241 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 12 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 13 IRQ_TYPE_EDGE_BOTH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "hs_phy_irq",
+					  "dp_hs_phy_irq",
+					  "dm_hs_phy_irq";
+			iommus = <&apps_smmu 0xa0 0x0>;
+			phys = <&usb_2_hsphy>;
+			phy-names = "usb2-phy";
+		};
+	};
+
+	fragment@1 {
+		target-path = "/soc@0/usb@a6f8800";
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		__overlay__ {
+			compatible = "qcom,sc7280-dwc3", "qcom,snps-dwc3";
+			reg = <0 0x0a600000 0 0xe400>;
+			interrupts-extended = <&intc GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 14 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 15 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 17 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "hs_phy_irq",
+					  "dp_hs_phy_irq",
+					  "dm_hs_phy_irq",
+					  "ss_phy_irq";
+			iommus = <&apps_smmu 0xe0 0x0>;
+			phys = <&usb_1_hsphy>,
+			       <&usb_1_qmpphy QMP_USB43DP_USB3_PHY>;
+			phy-names = "usb2-phy",
+				    "usb3-phy";
+		};
+	};
+};
diff --git a/drivers/of/overlays/dwc3-flattening/dwc3-qcom_sc8180x.dts b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_sc8180x.dts
new file mode 100644
index 000000000000..e875fb9a39aa
--- /dev/null
+++ b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_sc8180x.dts
@@ -0,0 +1,109 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/phy/phy-qcom-qmp.h>
+
+/ {
+	fragment@0 {
+		target-path = "/soc@0/usb@a4f8800";
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		__overlay__ {
+			compatible = "qcom,sc8180x-dwc3-mp", "qcom,snps-dwc3";
+			reg = <0 0x0a400000 0 0xd100>;
+			interrupts-extended = <&intc GIC_SPI 654 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 656 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 655 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 658 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 657 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 59 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 46 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 71 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 68 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 7 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 30 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event_1",
+					  "pwr_event_2",
+					  "hs_phy_1",
+					  "hs_phy_2",
+					  "dp_hs_phy_1",
+					  "dm_hs_phy_1",
+					  "dp_hs_phy_2",
+					  "dm_hs_phy_2",
+					  "ss_phy_1",
+					  "ss_phy_2";
+			iommus = <&apps_smmu 0x60 0x0>;
+			phys = <&usb_mp_hsphy0>,
+			       <&usb_mp_qmpphy0>,
+			       <&usb_mp_hsphy1>,
+			       <&usb_mp_qmpphy1>;
+			phy-names = "usb2-0",
+				    "usb3-0",
+				    "usb2-1",
+				    "usb3-1";
+		};
+	};
+
+	fragment@1 {
+		target-path = "/soc@0/usb@a6f8800";
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		__overlay__ {
+			compatible = "qcom,sc8180x-dwc3", "qcom,snps-dwc3";
+			reg = <0 0x0a600000 0 0xd100>;
+			interrupts-extended = <&intc GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 9 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 8 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 6 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "hs_phy_irq",
+					  "dp_hs_phy_irq",
+					  "dm_hs_phy_irq",
+					  "ss_phy_irq";
+			iommus = <&apps_smmu 0x140 0x0>;
+			phys = <&usb_prim_hsphy>,
+			       <&usb_prim_qmpphy QMP_USB43DP_USB3_PHY>;
+			phy-names = "usb2-phy",
+				    "usb3-phy";
+		};
+	};
+
+	fragment@2 {
+		target-path = "/soc@0/usb@a8f8800";
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		__overlay__ {
+			compatible = "qcom,sc8180x-dwc3", "qcom,snps-dwc3";
+			reg = <0 0x0a800000 0 0xd100>;
+			interrupts-extended = <&intc GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 135 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 11 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 10 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 40 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "hs_phy_irq",
+					  "dp_hs_phy_irq",
+					  "dm_hs_phy_irq",
+					  "ss_phy_irq";
+			iommus = <&apps_smmu 0x160 0x0>;
+			phys = <&usb_sec_hsphy>,
+			       <&usb_sec_qmpphy QMP_USB43DP_USB3_PHY>;
+			phy-names = "usb2-phy",
+				    "usb3-phy";
+		};
+	};
+};
diff --git a/drivers/of/overlays/dwc3-flattening/dwc3-qcom_sc8280xp.dts b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_sc8280xp.dts
new file mode 100644
index 000000000000..553e8ddb91ce
--- /dev/null
+++ b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_sc8280xp.dts
@@ -0,0 +1,129 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/phy/phy-qcom-qmp.h>
+
+/ {
+	fragment@0 {
+		target-path = "/soc@0/usb@a4f8800";
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		__overlay__ {
+			compatible = "qcom,sc8280xp-dwc3-mp", "qcom,snps-dwc3";
+			reg = <0 0x0a400000 0 0xd100>;
+			interrupts-extended = <&intc GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 135 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 857 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 856 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 860 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 859 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 127 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 126 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 129 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 128 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 131 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 130 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 133 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 132 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 16 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 17 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event_1",
+					  "pwr_event_2",
+					  "pwr_event_3",
+					  "pwr_event_4",
+					  "hs_phy_1",
+					  "hs_phy_2",
+					  "hs_phy_3",
+					  "hs_phy_4",
+					  "dp_hs_phy_1",
+					  "dm_hs_phy_1",
+					  "dp_hs_phy_2",
+					  "dm_hs_phy_2",
+					  "dp_hs_phy_3",
+					  "dm_hs_phy_3",
+					  "dp_hs_phy_4",
+					  "dm_hs_phy_4",
+					  "ss_phy_1",
+					  "ss_phy_2";
+			iommus = <&apps_smmu 0x800 0x0>;
+			phys = <&usb_2_hsphy0>,
+			       <&usb_2_qmpphy0>,
+			       <&usb_2_hsphy1>,
+			       <&usb_2_qmpphy1>,
+			       <&usb_2_hsphy2>,
+			       <&usb_2_hsphy3>;
+			phy-names = "usb2-0",
+				    "usb3-0",
+				    "usb2-1",
+				    "usb3-1",
+				    "usb2-2",
+				    "usb2-3";
+		};
+	};
+
+	fragment@1 {
+		target-path = "/soc@0/usb@a6f8800";
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		__overlay__ {
+			compatible = "qcom,sc8280xp-dwc3", "qcom,snps-dwc3";
+			reg = <0 0x0a600000 0 0xd100>;
+			interrupts-extended = <&intc GIC_SPI 803 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 804 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 805 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 14 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 15 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 138 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "hs_phy_irq",
+					  "dp_hs_phy_irq",
+					  "dm_hs_phy_irq",
+					  "ss_phy_irq";
+			iommus = <&apps_smmu 0x820 0x0>;
+			phys = <&usb_0_hsphy>,
+			       <&usb_0_qmpphy QMP_USB43DP_USB3_PHY>;
+			phy-names = "usb2-phy",
+				    "usb3-phy";
+		};
+	};
+
+	fragment@2 {
+		target-path = "/soc@0/usb@a8f8800";
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		__overlay__ {
+			compatible = "qcom,sc8280xp-dwc3", "qcom,snps-dwc3";
+			reg = <0 0x0a800000 0 0xd100>;
+			interrupts-extended = <&intc GIC_SPI 810 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 811 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 790 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 12 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 13 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 136 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "hs_phy_irq",
+					  "dp_hs_phy_irq",
+					  "dm_hs_phy_irq",
+					  "ss_phy_irq";
+			iommus = <&apps_smmu 0x860 0x0>;
+			phys = <&usb_1_hsphy>,
+			       <&usb_1_qmpphy QMP_USB43DP_USB3_PHY>;
+			phy-names = "usb2-phy",
+				    "usb3-phy";
+		};
+	};
+};
diff --git a/drivers/of/overlays/dwc3-flattening/dwc3-qcom_sc8280xp_microsoft_blackrock.dts b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_sc8280xp_microsoft_blackrock.dts
new file mode 100644
index 000000000000..ce33abdccccf
--- /dev/null
+++ b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_sc8280xp_microsoft_blackrock.dts
@@ -0,0 +1,121 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/phy/phy-qcom-qmp.h>
+
+/ {
+	fragment@0 {
+		target-path = "/soc@0/usb@a4f8800";
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		__overlay__ {
+			compatible = "qcom,sc8280xp-dwc3-mp", "qcom,snps-dwc3";
+			reg = <0 0x0a400000 0 0xd100>;
+			interrupts-extended = <&intc GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 135 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 857 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 856 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 860 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 859 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 127 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 126 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 129 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 128 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 131 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 130 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 133 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 132 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 16 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 17 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event_1",
+					  "pwr_event_2",
+					  "pwr_event_3",
+					  "pwr_event_4",
+					  "hs_phy_1",
+					  "hs_phy_2",
+					  "hs_phy_3",
+					  "hs_phy_4",
+					  "dp_hs_phy_1",
+					  "dm_hs_phy_1",
+					  "dp_hs_phy_2",
+					  "dm_hs_phy_2",
+					  "dp_hs_phy_3",
+					  "dm_hs_phy_3",
+					  "dp_hs_phy_4",
+					  "dm_hs_phy_4",
+					  "ss_phy_1",
+					  "ss_phy_2";
+			iommus = <&apps_smmu 0x800 0x0>;
+			phys = <&usb_2_hsphy0>,
+			       <&usb_2_qmpphy0>;
+			phy-names = "usb2-0",
+				    "usb3-0";
+		};
+	};
+
+	fragment@1 {
+		target-path = "/soc@0/usb@a6f8800";
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		__overlay__ {
+			compatible = "qcom,sc8280xp-dwc3", "qcom,snps-dwc3";
+			reg = <0 0x0a600000 0 0xd100>;
+			interrupts-extended = <&intc GIC_SPI 803 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 804 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 805 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 14 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 15 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 138 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "hs_phy_irq",
+					  "dp_hs_phy_irq",
+					  "dm_hs_phy_irq",
+					  "ss_phy_irq";
+			iommus = <&apps_smmu 0x820 0x0>;
+			phys = <&usb_0_hsphy>,
+			       <&usb_0_qmpphy QMP_USB43DP_USB3_PHY>;
+			phy-names = "usb2-phy",
+				    "usb3-phy";
+		};
+	};
+
+	fragment@2 {
+		target-path = "/soc@0/usb@a8f8800";
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		__overlay__ {
+			compatible = "qcom,sc8280xp-dwc3", "qcom,snps-dwc3";
+			reg = <0 0x0a800000 0 0xd100>;
+			interrupts-extended = <&intc GIC_SPI 810 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 811 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 790 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 12 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 13 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 136 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "hs_phy_irq",
+					  "dp_hs_phy_irq",
+					  "dm_hs_phy_irq",
+					  "ss_phy_irq";
+			iommus = <&apps_smmu 0x860 0x0>;
+			phys = <&usb_1_hsphy>,
+			       <&usb_1_qmpphy QMP_USB43DP_USB3_PHY>;
+			phy-names = "usb2-phy",
+				    "usb3-phy";
+		};
+	};
+};
diff --git a/drivers/of/overlays/dwc3-flattening/dwc3-qcom_sda660.dts b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_sda660.dts
new file mode 100644
index 000000000000..9628fea2adff
--- /dev/null
+++ b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_sda660.dts
@@ -0,0 +1,59 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+/ {
+	fragment@0 {
+		target-path = "/soc@0/usb@a8f8800";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		interrupt-parent = <&intc>;
+
+		__overlay__ {
+			compatible = "qcom,sdm660-dwc3", "qcom,snps-dwc3";
+			reg = <0x0a800000 0xccd0>;
+			interrupts = <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 180 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 347 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 243 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "qusb2_phy",
+					  "hs_phy_irq",
+					  "ss_phy_irq";
+			phys = <&qusb2phy0>,
+			       <&usb3_qmpphy>;
+			phy-names = "usb2-phy",
+				    "usb3-phy";
+			extcon = <&extcon_usb>;
+		};
+	};
+
+	fragment@1 {
+		target-path = "/soc@0/usb@c2f8800";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		interrupt-parent = <&intc>;
+
+		__overlay__ {
+			compatible = "qcom,sdm660-dwc3", "qcom,snps-dwc3";
+			reg = <0x0c200000 0xccd0>;
+			interrupts = <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 348 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 139 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "qusb2_phy",
+					  "hs_phy_irq";
+			phys = <&qusb2phy1>;
+			phy-names = "usb2-phy";
+		};
+	};
+};
diff --git a/drivers/of/overlays/dwc3-flattening/dwc3-qcom_sdm450.dts b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_sdm450.dts
new file mode 100644
index 000000000000..3970f8e38e0f
--- /dev/null
+++ b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_sdm450.dts
@@ -0,0 +1,33 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+/ {
+	fragment@0 {
+		target-path = "/soc@0/usb@70f8800";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		interrupt-parent = <&intc>;
+
+		__overlay__ {
+			compatible = "qcom,msm8953-dwc3", "qcom,snps-dwc3";
+			reg = <0x07000000 0xd000>;
+			interrupts = <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 220 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "qusb2_phy",
+					  "ss_phy_irq";
+			phys = <&hsusb_phy>;
+			phy-names = "usb2-phy";
+		};
+	};
+
+};
diff --git a/drivers/of/overlays/dwc3-flattening/dwc3-qcom_sdm630.dts b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_sdm630.dts
new file mode 100644
index 000000000000..eaa7ed8f8062
--- /dev/null
+++ b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_sdm630.dts
@@ -0,0 +1,57 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+/ {
+	fragment@0 {
+		target-path = "/soc@0/usb@a8f8800";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		interrupt-parent = <&intc>;
+
+		__overlay__ {
+			compatible = "qcom,sdm660-dwc3", "qcom,snps-dwc3";
+			reg = <0x0a800000 0xccd0>;
+			interrupts = <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 180 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 347 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 243 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "qusb2_phy",
+					  "hs_phy_irq",
+					  "ss_phy_irq";
+			phys = <&qusb2phy0>;
+			phy-names = "usb2-phy";
+			extcon = <&extcon_usb>;
+		};
+	};
+
+	fragment@1 {
+		target-path = "/soc@0/usb@c2f8800";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		interrupt-parent = <&intc>;
+
+		__overlay__ {
+			compatible = "qcom,sdm660-dwc3", "qcom,snps-dwc3";
+			reg = <0x0c200000 0xccd0>;
+			interrupts = <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 348 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 139 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "qusb2_phy",
+					  "hs_phy_irq";
+			phys = <&qusb2phy1>;
+			phy-names = "usb2-phy";
+		};
+	};
+};
diff --git a/drivers/of/overlays/dwc3-flattening/dwc3-qcom_sdm632.dts b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_sdm632.dts
new file mode 100644
index 000000000000..2c2d8e00ab78
--- /dev/null
+++ b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_sdm632.dts
@@ -0,0 +1,32 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+/ {
+	fragment@0 {
+		target-path = "/soc@0/usb@70f8800";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		interrupt-parent = <&intc>;
+
+		__overlay__ {
+			compatible = "qcom,msm8953-dwc3", "qcom,snps-dwc3";
+			reg = <0x07000000 0xd000>;
+			interrupts = <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 220 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "qusb2_phy",
+					  "ss_phy_irq";
+			phys = <&hsusb_phy>;
+			phy-names = "usb2-phy";
+		};
+	};
+};
diff --git a/drivers/of/overlays/dwc3-flattening/dwc3-qcom_sdm636.dts b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_sdm636.dts
new file mode 100644
index 000000000000..9628fea2adff
--- /dev/null
+++ b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_sdm636.dts
@@ -0,0 +1,59 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+/ {
+	fragment@0 {
+		target-path = "/soc@0/usb@a8f8800";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		interrupt-parent = <&intc>;
+
+		__overlay__ {
+			compatible = "qcom,sdm660-dwc3", "qcom,snps-dwc3";
+			reg = <0x0a800000 0xccd0>;
+			interrupts = <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 180 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 347 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 243 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "qusb2_phy",
+					  "hs_phy_irq",
+					  "ss_phy_irq";
+			phys = <&qusb2phy0>,
+			       <&usb3_qmpphy>;
+			phy-names = "usb2-phy",
+				    "usb3-phy";
+			extcon = <&extcon_usb>;
+		};
+	};
+
+	fragment@1 {
+		target-path = "/soc@0/usb@c2f8800";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		interrupt-parent = <&intc>;
+
+		__overlay__ {
+			compatible = "qcom,sdm660-dwc3", "qcom,snps-dwc3";
+			reg = <0x0c200000 0xccd0>;
+			interrupts = <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 348 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 139 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "qusb2_phy",
+					  "hs_phy_irq";
+			phys = <&qusb2phy1>;
+			phy-names = "usb2-phy";
+		};
+	};
+};
diff --git a/drivers/of/overlays/dwc3-flattening/dwc3-qcom_sdm660.dts b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_sdm660.dts
new file mode 100644
index 000000000000..eaa7ed8f8062
--- /dev/null
+++ b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_sdm660.dts
@@ -0,0 +1,57 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+/ {
+	fragment@0 {
+		target-path = "/soc@0/usb@a8f8800";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		interrupt-parent = <&intc>;
+
+		__overlay__ {
+			compatible = "qcom,sdm660-dwc3", "qcom,snps-dwc3";
+			reg = <0x0a800000 0xccd0>;
+			interrupts = <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 180 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 347 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 243 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "qusb2_phy",
+					  "hs_phy_irq",
+					  "ss_phy_irq";
+			phys = <&qusb2phy0>;
+			phy-names = "usb2-phy";
+			extcon = <&extcon_usb>;
+		};
+	};
+
+	fragment@1 {
+		target-path = "/soc@0/usb@c2f8800";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		interrupt-parent = <&intc>;
+
+		__overlay__ {
+			compatible = "qcom,sdm660-dwc3", "qcom,snps-dwc3";
+			reg = <0x0c200000 0xccd0>;
+			interrupts = <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 348 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 139 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "qusb2_phy",
+					  "hs_phy_irq";
+			phys = <&qusb2phy1>;
+			phy-names = "usb2-phy";
+		};
+	};
+};
diff --git a/drivers/of/overlays/dwc3-flattening/dwc3-qcom_sdm670.dts b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_sdm670.dts
new file mode 100644
index 000000000000..baf418df6b54
--- /dev/null
+++ b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_sdm670.dts
@@ -0,0 +1,36 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+/ {
+	fragment@0 {
+		target-path = "/soc@0/usb@a6f8800";
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		__overlay__ {
+			compatible = "qcom,sdm670-dwc3", "qcom,snps-dwc3";
+			reg = <0 0x0a600000 0 0xd100>;
+			interrupts-extended = <&intc GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 9 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 8 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 6 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "hs_phy_irq",
+					  "dp_hs_phy_irq",
+					  "dm_hs_phy_irq",
+					  "ss_phy_irq";
+			iommus = <&apps_smmu 0x740 0x0>;
+			phys = <&usb_1_hsphy>;
+			phy-names = "usb2-phy";
+		};
+	};
+};
diff --git a/drivers/of/overlays/dwc3-flattening/dwc3-qcom_sdm845.dts b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_sdm845.dts
new file mode 100644
index 000000000000..292ea571e040
--- /dev/null
+++ b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_sdm845.dts
@@ -0,0 +1,64 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+/ {
+	fragment@0 {
+		target-path = "/soc@0/usb@a6f8800";
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		__overlay__ {
+			compatible = "qcom,sdm845-dwc3", "qcom,snps-dwc3";
+			reg = <0 0x0a600000 0 0xd100>;
+			interrupts-extended = <&intc GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc_intc 9 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc_intc 8 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc_intc 6 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "hs_phy_irq",
+					  "dp_hs_phy_irq",
+					  "dm_hs_phy_irq",
+					  "ss_phy_irq";
+			iommus = <&apps_smmu 0x740 0x0>;
+			phys = <&usb_1_hsphy>;
+			phy-names = "usb2-phy";
+		};
+	};
+
+	fragment@1 {
+		target-path = "/soc@0/usb@a8f8800";
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		__overlay__ {
+			compatible = "qcom,sdm845-dwc3", "qcom,snps-dwc3";
+			reg = <0 0x0a800000 0 0xd100>;
+			interrupts-extended = <&intc GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 135 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc_intc 11 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc_intc 10 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc_intc 7 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "hs_phy_irq",
+					  "dp_hs_phy_irq",
+					  "dm_hs_phy_irq",
+					  "ss_phy_irq";
+			iommus = <&apps_smmu 0x760 0x0>;
+			phys = <&usb_2_hsphy>,
+			       <&usb_2_qmpphy>;
+			phy-names = "usb2-phy",
+				    "usb3-phy";
+		};
+	};
+};
diff --git a/drivers/of/overlays/dwc3-flattening/dwc3-qcom_sdm845_lenovo_yoga_c630.dts b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_sdm845_lenovo_yoga_c630.dts
new file mode 100644
index 000000000000..4226f03daba5
--- /dev/null
+++ b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_sdm845_lenovo_yoga_c630.dts
@@ -0,0 +1,67 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/phy/phy-qcom-qmp.h>
+
+/ {
+	fragment@0 {
+		target-path = "/soc@0/usb@a6f8800";
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		__overlay__ {
+			compatible = "qcom,sdm845-dwc3", "qcom,snps-dwc3";
+			reg = <0 0x0a600000 0 0xd100>;
+			interrupts-extended = <&intc GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc_intc 9 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc_intc 8 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc_intc 6 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "hs_phy_irq",
+					  "dp_hs_phy_irq",
+					  "dm_hs_phy_irq",
+					  "ss_phy_irq";
+			iommus = <&apps_smmu 0x740 0x0>;
+			phys = <&usb_1_hsphy>,
+			       <&usb_1_qmpphy QMP_USB43DP_USB3_PHY>;
+			phy-names = "usb2-phy",
+				    "usb3-phy";
+		};
+	};
+
+	fragment@1 {
+		target-path = "/soc@0/usb@a8f8800";
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		__overlay__ {
+			compatible = "qcom,sdm845-dwc3", "qcom,snps-dwc3";
+			reg = <0 0x0a800000 0 0xd100>;
+			interrupts-extended = <&intc GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 135 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc_intc 11 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc_intc 10 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc_intc 7 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "hs_phy_irq",
+					  "dp_hs_phy_irq",
+					  "dm_hs_phy_irq",
+					  "ss_phy_irq";
+			iommus = <&apps_smmu 0x760 0x0>;
+			phys = <&usb_2_hsphy>,
+			       <&usb_2_qmpphy>;
+			phy-names = "usb2-phy",
+				    "usb3-phy";
+		};
+	};
+};
diff --git a/drivers/of/overlays/dwc3-flattening/dwc3-qcom_sdm845_lg_judyln.dts b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_sdm845_lg_judyln.dts
new file mode 100644
index 000000000000..4226f03daba5
--- /dev/null
+++ b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_sdm845_lg_judyln.dts
@@ -0,0 +1,67 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/phy/phy-qcom-qmp.h>
+
+/ {
+	fragment@0 {
+		target-path = "/soc@0/usb@a6f8800";
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		__overlay__ {
+			compatible = "qcom,sdm845-dwc3", "qcom,snps-dwc3";
+			reg = <0 0x0a600000 0 0xd100>;
+			interrupts-extended = <&intc GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc_intc 9 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc_intc 8 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc_intc 6 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "hs_phy_irq",
+					  "dp_hs_phy_irq",
+					  "dm_hs_phy_irq",
+					  "ss_phy_irq";
+			iommus = <&apps_smmu 0x740 0x0>;
+			phys = <&usb_1_hsphy>,
+			       <&usb_1_qmpphy QMP_USB43DP_USB3_PHY>;
+			phy-names = "usb2-phy",
+				    "usb3-phy";
+		};
+	};
+
+	fragment@1 {
+		target-path = "/soc@0/usb@a8f8800";
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		__overlay__ {
+			compatible = "qcom,sdm845-dwc3", "qcom,snps-dwc3";
+			reg = <0 0x0a800000 0 0xd100>;
+			interrupts-extended = <&intc GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 135 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc_intc 11 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc_intc 10 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc_intc 7 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "hs_phy_irq",
+					  "dp_hs_phy_irq",
+					  "dm_hs_phy_irq",
+					  "ss_phy_irq";
+			iommus = <&apps_smmu 0x760 0x0>;
+			phys = <&usb_2_hsphy>,
+			       <&usb_2_qmpphy>;
+			phy-names = "usb2-phy",
+				    "usb3-phy";
+		};
+	};
+};
diff --git a/drivers/of/overlays/dwc3-flattening/dwc3-qcom_sdm845_lg_judyp.dts b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_sdm845_lg_judyp.dts
new file mode 100644
index 000000000000..4226f03daba5
--- /dev/null
+++ b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_sdm845_lg_judyp.dts
@@ -0,0 +1,67 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/phy/phy-qcom-qmp.h>
+
+/ {
+	fragment@0 {
+		target-path = "/soc@0/usb@a6f8800";
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		__overlay__ {
+			compatible = "qcom,sdm845-dwc3", "qcom,snps-dwc3";
+			reg = <0 0x0a600000 0 0xd100>;
+			interrupts-extended = <&intc GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc_intc 9 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc_intc 8 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc_intc 6 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "hs_phy_irq",
+					  "dp_hs_phy_irq",
+					  "dm_hs_phy_irq",
+					  "ss_phy_irq";
+			iommus = <&apps_smmu 0x740 0x0>;
+			phys = <&usb_1_hsphy>,
+			       <&usb_1_qmpphy QMP_USB43DP_USB3_PHY>;
+			phy-names = "usb2-phy",
+				    "usb3-phy";
+		};
+	};
+
+	fragment@1 {
+		target-path = "/soc@0/usb@a8f8800";
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		__overlay__ {
+			compatible = "qcom,sdm845-dwc3", "qcom,snps-dwc3";
+			reg = <0 0x0a800000 0 0xd100>;
+			interrupts-extended = <&intc GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 135 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc_intc 11 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc_intc 10 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc_intc 7 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "hs_phy_irq",
+					  "dp_hs_phy_irq",
+					  "dm_hs_phy_irq",
+					  "ss_phy_irq";
+			iommus = <&apps_smmu 0x760 0x0>;
+			phys = <&usb_2_hsphy>,
+			       <&usb_2_qmpphy>;
+			phy-names = "usb2-phy",
+				    "usb3-phy";
+		};
+	};
+};
diff --git a/drivers/of/overlays/dwc3-flattening/dwc3-qcom_sdm845_qcom_sdm845_mtp.dts b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_sdm845_qcom_sdm845_mtp.dts
new file mode 100644
index 000000000000..4226f03daba5
--- /dev/null
+++ b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_sdm845_qcom_sdm845_mtp.dts
@@ -0,0 +1,67 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/phy/phy-qcom-qmp.h>
+
+/ {
+	fragment@0 {
+		target-path = "/soc@0/usb@a6f8800";
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		__overlay__ {
+			compatible = "qcom,sdm845-dwc3", "qcom,snps-dwc3";
+			reg = <0 0x0a600000 0 0xd100>;
+			interrupts-extended = <&intc GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc_intc 9 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc_intc 8 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc_intc 6 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "hs_phy_irq",
+					  "dp_hs_phy_irq",
+					  "dm_hs_phy_irq",
+					  "ss_phy_irq";
+			iommus = <&apps_smmu 0x740 0x0>;
+			phys = <&usb_1_hsphy>,
+			       <&usb_1_qmpphy QMP_USB43DP_USB3_PHY>;
+			phy-names = "usb2-phy",
+				    "usb3-phy";
+		};
+	};
+
+	fragment@1 {
+		target-path = "/soc@0/usb@a8f8800";
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		__overlay__ {
+			compatible = "qcom,sdm845-dwc3", "qcom,snps-dwc3";
+			reg = <0 0x0a800000 0 0xd100>;
+			interrupts-extended = <&intc GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 135 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc_intc 11 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc_intc 10 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc_intc 7 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "hs_phy_irq",
+					  "dp_hs_phy_irq",
+					  "dm_hs_phy_irq",
+					  "ss_phy_irq";
+			iommus = <&apps_smmu 0x760 0x0>;
+			phys = <&usb_2_hsphy>,
+			       <&usb_2_qmpphy>;
+			phy-names = "usb2-phy",
+				    "usb3-phy";
+		};
+	};
+};
diff --git a/drivers/of/overlays/dwc3-flattening/dwc3-qcom_sdm845_samsung_starqltechn.dts b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_sdm845_samsung_starqltechn.dts
new file mode 100644
index 000000000000..4226f03daba5
--- /dev/null
+++ b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_sdm845_samsung_starqltechn.dts
@@ -0,0 +1,67 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/phy/phy-qcom-qmp.h>
+
+/ {
+	fragment@0 {
+		target-path = "/soc@0/usb@a6f8800";
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		__overlay__ {
+			compatible = "qcom,sdm845-dwc3", "qcom,snps-dwc3";
+			reg = <0 0x0a600000 0 0xd100>;
+			interrupts-extended = <&intc GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc_intc 9 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc_intc 8 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc_intc 6 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "hs_phy_irq",
+					  "dp_hs_phy_irq",
+					  "dm_hs_phy_irq",
+					  "ss_phy_irq";
+			iommus = <&apps_smmu 0x740 0x0>;
+			phys = <&usb_1_hsphy>,
+			       <&usb_1_qmpphy QMP_USB43DP_USB3_PHY>;
+			phy-names = "usb2-phy",
+				    "usb3-phy";
+		};
+	};
+
+	fragment@1 {
+		target-path = "/soc@0/usb@a8f8800";
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		__overlay__ {
+			compatible = "qcom,sdm845-dwc3", "qcom,snps-dwc3";
+			reg = <0 0x0a800000 0 0xd100>;
+			interrupts-extended = <&intc GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 135 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc_intc 11 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc_intc 10 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc_intc 7 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "hs_phy_irq",
+					  "dp_hs_phy_irq",
+					  "dm_hs_phy_irq",
+					  "ss_phy_irq";
+			iommus = <&apps_smmu 0x760 0x0>;
+			phys = <&usb_2_hsphy>,
+			       <&usb_2_qmpphy>;
+			phy-names = "usb2-phy",
+				    "usb3-phy";
+		};
+	};
+};
diff --git a/drivers/of/overlays/dwc3-flattening/dwc3-qcom_sdm845_samsung_w737.dts b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_sdm845_samsung_w737.dts
new file mode 100644
index 000000000000..4226f03daba5
--- /dev/null
+++ b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_sdm845_samsung_w737.dts
@@ -0,0 +1,67 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/phy/phy-qcom-qmp.h>
+
+/ {
+	fragment@0 {
+		target-path = "/soc@0/usb@a6f8800";
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		__overlay__ {
+			compatible = "qcom,sdm845-dwc3", "qcom,snps-dwc3";
+			reg = <0 0x0a600000 0 0xd100>;
+			interrupts-extended = <&intc GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc_intc 9 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc_intc 8 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc_intc 6 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "hs_phy_irq",
+					  "dp_hs_phy_irq",
+					  "dm_hs_phy_irq",
+					  "ss_phy_irq";
+			iommus = <&apps_smmu 0x740 0x0>;
+			phys = <&usb_1_hsphy>,
+			       <&usb_1_qmpphy QMP_USB43DP_USB3_PHY>;
+			phy-names = "usb2-phy",
+				    "usb3-phy";
+		};
+	};
+
+	fragment@1 {
+		target-path = "/soc@0/usb@a8f8800";
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		__overlay__ {
+			compatible = "qcom,sdm845-dwc3", "qcom,snps-dwc3";
+			reg = <0 0x0a800000 0 0xd100>;
+			interrupts-extended = <&intc GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 135 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc_intc 11 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc_intc 10 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc_intc 7 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "hs_phy_irq",
+					  "dp_hs_phy_irq",
+					  "dm_hs_phy_irq",
+					  "ss_phy_irq";
+			iommus = <&apps_smmu 0x760 0x0>;
+			phys = <&usb_2_hsphy>,
+			       <&usb_2_qmpphy>;
+			phy-names = "usb2-phy",
+				    "usb3-phy";
+		};
+	};
+};
diff --git a/drivers/of/overlays/dwc3-flattening/dwc3-qcom_sdm845_shift_axolotl.dts b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_sdm845_shift_axolotl.dts
new file mode 100644
index 000000000000..4226f03daba5
--- /dev/null
+++ b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_sdm845_shift_axolotl.dts
@@ -0,0 +1,67 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/phy/phy-qcom-qmp.h>
+
+/ {
+	fragment@0 {
+		target-path = "/soc@0/usb@a6f8800";
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		__overlay__ {
+			compatible = "qcom,sdm845-dwc3", "qcom,snps-dwc3";
+			reg = <0 0x0a600000 0 0xd100>;
+			interrupts-extended = <&intc GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc_intc 9 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc_intc 8 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc_intc 6 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "hs_phy_irq",
+					  "dp_hs_phy_irq",
+					  "dm_hs_phy_irq",
+					  "ss_phy_irq";
+			iommus = <&apps_smmu 0x740 0x0>;
+			phys = <&usb_1_hsphy>,
+			       <&usb_1_qmpphy QMP_USB43DP_USB3_PHY>;
+			phy-names = "usb2-phy",
+				    "usb3-phy";
+		};
+	};
+
+	fragment@1 {
+		target-path = "/soc@0/usb@a8f8800";
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		__overlay__ {
+			compatible = "qcom,sdm845-dwc3", "qcom,snps-dwc3";
+			reg = <0 0x0a800000 0 0xd100>;
+			interrupts-extended = <&intc GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 135 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc_intc 11 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc_intc 10 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc_intc 7 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "hs_phy_irq",
+					  "dp_hs_phy_irq",
+					  "dm_hs_phy_irq",
+					  "ss_phy_irq";
+			iommus = <&apps_smmu 0x760 0x0>;
+			phys = <&usb_2_hsphy>,
+			       <&usb_2_qmpphy>;
+			phy-names = "usb2-phy",
+				    "usb3-phy";
+		};
+	};
+};
diff --git a/drivers/of/overlays/dwc3-flattening/dwc3-qcom_sdm845_thundercomm_db845c.dts b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_sdm845_thundercomm_db845c.dts
new file mode 100644
index 000000000000..4226f03daba5
--- /dev/null
+++ b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_sdm845_thundercomm_db845c.dts
@@ -0,0 +1,67 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/phy/phy-qcom-qmp.h>
+
+/ {
+	fragment@0 {
+		target-path = "/soc@0/usb@a6f8800";
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		__overlay__ {
+			compatible = "qcom,sdm845-dwc3", "qcom,snps-dwc3";
+			reg = <0 0x0a600000 0 0xd100>;
+			interrupts-extended = <&intc GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc_intc 9 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc_intc 8 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc_intc 6 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "hs_phy_irq",
+					  "dp_hs_phy_irq",
+					  "dm_hs_phy_irq",
+					  "ss_phy_irq";
+			iommus = <&apps_smmu 0x740 0x0>;
+			phys = <&usb_1_hsphy>,
+			       <&usb_1_qmpphy QMP_USB43DP_USB3_PHY>;
+			phy-names = "usb2-phy",
+				    "usb3-phy";
+		};
+	};
+
+	fragment@1 {
+		target-path = "/soc@0/usb@a8f8800";
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		__overlay__ {
+			compatible = "qcom,sdm845-dwc3", "qcom,snps-dwc3";
+			reg = <0 0x0a800000 0 0xd100>;
+			interrupts-extended = <&intc GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 135 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc_intc 11 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc_intc 10 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc_intc 7 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "hs_phy_irq",
+					  "dp_hs_phy_irq",
+					  "dm_hs_phy_irq",
+					  "ss_phy_irq";
+			iommus = <&apps_smmu 0x760 0x0>;
+			phys = <&usb_2_hsphy>,
+			       <&usb_2_qmpphy>;
+			phy-names = "usb2-phy",
+				    "usb3-phy";
+		};
+	};
+};
diff --git a/drivers/of/overlays/dwc3-flattening/dwc3-qcom_sdm845_xiaomi_beryllium.dts b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_sdm845_xiaomi_beryllium.dts
new file mode 100644
index 000000000000..4226f03daba5
--- /dev/null
+++ b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_sdm845_xiaomi_beryllium.dts
@@ -0,0 +1,67 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/phy/phy-qcom-qmp.h>
+
+/ {
+	fragment@0 {
+		target-path = "/soc@0/usb@a6f8800";
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		__overlay__ {
+			compatible = "qcom,sdm845-dwc3", "qcom,snps-dwc3";
+			reg = <0 0x0a600000 0 0xd100>;
+			interrupts-extended = <&intc GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc_intc 9 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc_intc 8 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc_intc 6 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "hs_phy_irq",
+					  "dp_hs_phy_irq",
+					  "dm_hs_phy_irq",
+					  "ss_phy_irq";
+			iommus = <&apps_smmu 0x740 0x0>;
+			phys = <&usb_1_hsphy>,
+			       <&usb_1_qmpphy QMP_USB43DP_USB3_PHY>;
+			phy-names = "usb2-phy",
+				    "usb3-phy";
+		};
+	};
+
+	fragment@1 {
+		target-path = "/soc@0/usb@a8f8800";
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		__overlay__ {
+			compatible = "qcom,sdm845-dwc3", "qcom,snps-dwc3";
+			reg = <0 0x0a800000 0 0xd100>;
+			interrupts-extended = <&intc GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 135 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc_intc 11 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc_intc 10 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc_intc 7 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "hs_phy_irq",
+					  "dp_hs_phy_irq",
+					  "dm_hs_phy_irq",
+					  "ss_phy_irq";
+			iommus = <&apps_smmu 0x760 0x0>;
+			phys = <&usb_2_hsphy>,
+			       <&usb_2_qmpphy>;
+			phy-names = "usb2-phy",
+				    "usb3-phy";
+		};
+	};
+};
diff --git a/drivers/of/overlays/dwc3-flattening/dwc3-qcom_sdm845_xiaomi_beryllium_ebbg.dts b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_sdm845_xiaomi_beryllium_ebbg.dts
new file mode 100644
index 000000000000..4226f03daba5
--- /dev/null
+++ b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_sdm845_xiaomi_beryllium_ebbg.dts
@@ -0,0 +1,67 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/phy/phy-qcom-qmp.h>
+
+/ {
+	fragment@0 {
+		target-path = "/soc@0/usb@a6f8800";
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		__overlay__ {
+			compatible = "qcom,sdm845-dwc3", "qcom,snps-dwc3";
+			reg = <0 0x0a600000 0 0xd100>;
+			interrupts-extended = <&intc GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc_intc 9 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc_intc 8 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc_intc 6 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "hs_phy_irq",
+					  "dp_hs_phy_irq",
+					  "dm_hs_phy_irq",
+					  "ss_phy_irq";
+			iommus = <&apps_smmu 0x740 0x0>;
+			phys = <&usb_1_hsphy>,
+			       <&usb_1_qmpphy QMP_USB43DP_USB3_PHY>;
+			phy-names = "usb2-phy",
+				    "usb3-phy";
+		};
+	};
+
+	fragment@1 {
+		target-path = "/soc@0/usb@a8f8800";
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		__overlay__ {
+			compatible = "qcom,sdm845-dwc3", "qcom,snps-dwc3";
+			reg = <0 0x0a800000 0 0xd100>;
+			interrupts-extended = <&intc GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 135 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc_intc 11 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc_intc 10 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc_intc 7 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "hs_phy_irq",
+					  "dp_hs_phy_irq",
+					  "dm_hs_phy_irq",
+					  "ss_phy_irq";
+			iommus = <&apps_smmu 0x760 0x0>;
+			phys = <&usb_2_hsphy>,
+			       <&usb_2_qmpphy>;
+			phy-names = "usb2-phy",
+				    "usb3-phy";
+		};
+	};
+};
diff --git a/drivers/of/overlays/dwc3-flattening/dwc3-qcom_sdx75.dts b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_sdx75.dts
new file mode 100644
index 000000000000..b1ce092b3231
--- /dev/null
+++ b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_sdx75.dts
@@ -0,0 +1,36 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+/ {
+	fragment@0 {
+		target-path = "/soc@0/usb@a6f8800";
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		__overlay__ {
+			compatible = "qcom,sdx75-dwc3", "qcom,snps-dwc3";
+			reg = <0 0x0a600000 0 0xd100>;
+			interrupts-extended = <&intc GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 17 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 9 IRQ_TYPE_EDGE_RISING>,
+					      <&pdc 10 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "dwc_usb3",
+					  "hs_phy_irq",
+					  "ss_phy_irq",
+					  "dm_hs_phy_irq",
+					  "dp_hs_phy_irq";
+			iommus = <&apps_smmu 0x80 0x0>;
+			phys = <&usb_hsphy>,
+			       <&usb_qmpphy>;
+			phy-names = "usb2-phy",
+				    "usb3-phy";
+		};
+	};
+};
diff --git a/drivers/of/overlays/dwc3-flattening/dwc3-qcom_sm4250.dts b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_sm4250.dts
new file mode 100644
index 000000000000..a05c49f22fd3
--- /dev/null
+++ b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_sm4250.dts
@@ -0,0 +1,37 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+/ {
+	fragment@0 {
+		target-path = "/soc@0/usb@4ef8800";
+		#address-cells = <2>;
+		#size-cells = <2>;
+		interrupt-parent = <&intc>;
+
+		__overlay__ {
+			compatible = "qcom,sm6115-dwc3", "qcom,snps-dwc3";
+			reg = <0 0x04e00000 0 0xd100>;
+			interrupts = <GIC_SPI 255 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 302 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 260 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 254 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 422 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "qusb2_phy",
+					  "hs_phy_irq",
+					  "ss_phy_irq";
+			iommus = <&apps_smmu 0x120 0x0>;
+			phys = <&usb_hsphy>,
+			       <&usb_qmpphy>;
+			phy-names = "usb2-phy",
+				    "usb3-phy";
+		};
+	};
+};
diff --git a/drivers/of/overlays/dwc3-flattening/dwc3-qcom_sm4250_oneplus_billie2.dts b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_sm4250_oneplus_billie2.dts
new file mode 100644
index 000000000000..f250d65b780a
--- /dev/null
+++ b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_sm4250_oneplus_billie2.dts
@@ -0,0 +1,35 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+/ {
+	fragment@0 {
+		target-path = "/soc@0/usb@4ef8800";
+		#address-cells = <2>;
+		#size-cells = <2>;
+		interrupt-parent = <&intc>;
+
+		__overlay__ {
+			compatible = "qcom,sm6115-dwc3", "qcom,snps-dwc3";
+			reg = <0 0x04e00000 0 0xd100>;
+			interrupts = <GIC_SPI 255 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 302 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 260 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 254 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 422 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "qusb2_phy",
+					  "hs_phy_irq",
+					  "ss_phy_irq";
+			iommus = <&apps_smmu 0x120 0x0>;
+			phys = <&usb_hsphy>;
+			phy-names = "usb2-phy";
+		};
+	};
+};
diff --git a/drivers/of/overlays/dwc3-flattening/dwc3-qcom_sm6115.dts b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_sm6115.dts
new file mode 100644
index 000000000000..a05c49f22fd3
--- /dev/null
+++ b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_sm6115.dts
@@ -0,0 +1,37 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+/ {
+	fragment@0 {
+		target-path = "/soc@0/usb@4ef8800";
+		#address-cells = <2>;
+		#size-cells = <2>;
+		interrupt-parent = <&intc>;
+
+		__overlay__ {
+			compatible = "qcom,sm6115-dwc3", "qcom,snps-dwc3";
+			reg = <0 0x04e00000 0 0xd100>;
+			interrupts = <GIC_SPI 255 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 302 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 260 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 254 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 422 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "qusb2_phy",
+					  "hs_phy_irq",
+					  "ss_phy_irq";
+			iommus = <&apps_smmu 0x120 0x0>;
+			phys = <&usb_hsphy>,
+			       <&usb_qmpphy>;
+			phy-names = "usb2-phy",
+				    "usb3-phy";
+		};
+	};
+};
diff --git a/drivers/of/overlays/dwc3-flattening/dwc3-qcom_sm6115_lenovo_j606f.dts b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_sm6115_lenovo_j606f.dts
new file mode 100644
index 000000000000..f250d65b780a
--- /dev/null
+++ b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_sm6115_lenovo_j606f.dts
@@ -0,0 +1,35 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+/ {
+	fragment@0 {
+		target-path = "/soc@0/usb@4ef8800";
+		#address-cells = <2>;
+		#size-cells = <2>;
+		interrupt-parent = <&intc>;
+
+		__overlay__ {
+			compatible = "qcom,sm6115-dwc3", "qcom,snps-dwc3";
+			reg = <0 0x04e00000 0 0xd100>;
+			interrupts = <GIC_SPI 255 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 302 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 260 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 254 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 422 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "qusb2_phy",
+					  "hs_phy_irq",
+					  "ss_phy_irq";
+			iommus = <&apps_smmu 0x120 0x0>;
+			phys = <&usb_hsphy>;
+			phy-names = "usb2-phy";
+		};
+	};
+};
diff --git a/drivers/of/overlays/dwc3-flattening/dwc3-qcom_sm6125.dts b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_sm6125.dts
new file mode 100644
index 000000000000..a01921cc6c13
--- /dev/null
+++ b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_sm6125.dts
@@ -0,0 +1,36 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+/ {
+	fragment@0 {
+		target-path = "/soc@0/usb@4ef8800";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		interrupt-parent = <&intc>;
+
+		__overlay__ {
+			compatible = "qcom,sm6125-dwc3", "qcom,snps-dwc3";
+			reg = <0x04e00000 0xd100>;
+			interrupts = <GIC_SPI 255 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 302 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 260 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 254 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 422 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "qusb2_phy",
+					  "hs_phy_irq",
+					  "ss_phy_irq";
+			iommus = <&apps_smmu 0x100 0x0>;
+			phys = <&hsusb_phy1>;
+			phy-names = "usb2-phy";
+			extcon = <&extcon_usb>;
+		};
+	};
+};
diff --git a/drivers/of/overlays/dwc3-flattening/dwc3-qcom_sm6350.dts b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_sm6350.dts
new file mode 100644
index 000000000000..b5063b99fe64
--- /dev/null
+++ b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_sm6350.dts
@@ -0,0 +1,39 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/phy/phy-qcom-qmp.h>
+
+/ {
+	fragment@0 {
+		target-path = "/soc@0/usb@a6f8800";
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		__overlay__ {
+			compatible = "qcom,sm6350-dwc3", "qcom,snps-dwc3";
+			reg = <0 0x0a600000 0 0xd100>;
+			interrupts-extended = <&intc GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 14 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 15 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 17 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "hs_phy_irq",
+					  "dp_hs_phy_irq",
+					  "dm_hs_phy_irq",
+					  "ss_phy_irq";
+			iommus = <&apps_smmu 0x540 0x0>;
+			phys = <&usb_1_hsphy>,
+			       <&usb_1_qmpphy QMP_USB43DP_USB3_PHY>;
+			phy-names = "usb2-phy",
+				    "usb3-phy";
+		};
+	};
+};
diff --git a/drivers/of/overlays/dwc3-flattening/dwc3-qcom_sm6375.dts b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_sm6375.dts
new file mode 100644
index 000000000000..a6d83c3d913b
--- /dev/null
+++ b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_sm6375.dts
@@ -0,0 +1,36 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+/ {
+	fragment@0 {
+		target-path = "/soc@0/usb@4ef8800";
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		__overlay__ {
+			compatible = "qcom,sm6375-dwc3", "qcom,snps-dwc3";
+			reg = <0 0x04e00000 0 0xd100>;
+			interrupts-extended = <&intc GIC_SPI 255 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 302 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 254 IRQ_TYPE_LEVEL_HIGH>,
+					      <&mpm 94 IRQ_TYPE_EDGE_BOTH>,
+					      <&mpm 93 IRQ_TYPE_EDGE_BOTH>,
+					      <&mpm 12 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "hs_phy_irq",
+					  "dp_hs_phy_irq",
+					  "dm_hs_phy_irq",
+					  "ss_phy_irq";
+			iommus = <&apps_smmu 0xe0 0x0>;
+			phys = <&usb_1_hsphy>;
+			phy-names = "usb2-phy";
+		};
+	};
+};
diff --git a/drivers/of/overlays/dwc3-flattening/dwc3-qcom_sm7125.dts b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_sm7125.dts
new file mode 100644
index 000000000000..cd4caa173891
--- /dev/null
+++ b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_sm7125.dts
@@ -0,0 +1,39 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/phy/phy-qcom-qmp.h>
+
+/ {
+	fragment@0 {
+		target-path = "/soc@0/usb@a6f8800";
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		__overlay__ {
+			compatible = "qcom,sc7180-dwc3", "qcom,snps-dwc3";
+			reg = <0 0x0a600000 0 0xe400>;
+			interrupts-extended = <&intc GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 9 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 8 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 6 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "hs_phy_irq",
+					  "dp_hs_phy_irq",
+					  "dm_hs_phy_irq",
+					  "ss_phy_irq";
+			iommus = <&apps_smmu 0x540 0x0>;
+			phys = <&usb_1_hsphy>,
+			       <&usb_1_qmpphy QMP_USB43DP_USB3_PHY>;
+			phy-names = "usb2-phy",
+				    "usb3-phy";
+		};
+	};
+};
diff --git a/drivers/of/overlays/dwc3-flattening/dwc3-qcom_sm7225.dts b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_sm7225.dts
new file mode 100644
index 000000000000..b5063b99fe64
--- /dev/null
+++ b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_sm7225.dts
@@ -0,0 +1,39 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/phy/phy-qcom-qmp.h>
+
+/ {
+	fragment@0 {
+		target-path = "/soc@0/usb@a6f8800";
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		__overlay__ {
+			compatible = "qcom,sm6350-dwc3", "qcom,snps-dwc3";
+			reg = <0 0x0a600000 0 0xd100>;
+			interrupts-extended = <&intc GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 14 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 15 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 17 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "hs_phy_irq",
+					  "dp_hs_phy_irq",
+					  "dm_hs_phy_irq",
+					  "ss_phy_irq";
+			iommus = <&apps_smmu 0x540 0x0>;
+			phys = <&usb_1_hsphy>,
+			       <&usb_1_qmpphy QMP_USB43DP_USB3_PHY>;
+			phy-names = "usb2-phy",
+				    "usb3-phy";
+		};
+	};
+};
diff --git a/drivers/of/overlays/dwc3-flattening/dwc3-qcom_sm7325.dts b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_sm7325.dts
new file mode 100644
index 000000000000..04a9ba7a63d6
--- /dev/null
+++ b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_sm7325.dts
@@ -0,0 +1,60 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+/ {
+	fragment@0 {
+		target-path = "/soc@0/usb@8cf8800";
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		__overlay__ {
+			compatible = "qcom,sc7280-dwc3", "qcom,snps-dwc3";
+			reg = <0 0x08c00000 0 0xe400>;
+			interrupts-extended = <&intc GIC_SPI 242 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 241 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 12 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 13 IRQ_TYPE_EDGE_BOTH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "hs_phy_irq",
+					  "dp_hs_phy_irq",
+					  "dm_hs_phy_irq";
+			iommus = <&apps_smmu 0xa0 0x0>;
+			phys = <&usb_2_hsphy>;
+			phy-names = "usb2-phy";
+		};
+	};
+
+	fragment@1 {
+		target-path = "/soc@0/usb@a6f8800";
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		__overlay__ {
+			compatible = "qcom,sc7280-dwc3", "qcom,snps-dwc3";
+			reg = <0 0x0a600000 0 0xe400>;
+			interrupts-extended = <&intc GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 14 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 15 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 17 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "hs_phy_irq",
+					  "dp_hs_phy_irq",
+					  "dm_hs_phy_irq",
+					  "ss_phy_irq";
+			iommus = <&apps_smmu 0xe0 0x0>;
+			phys = <&usb_1_hsphy>;
+			phy-names = "usb2-phy";
+		};
+	};
+};
diff --git a/drivers/of/overlays/dwc3-flattening/dwc3-qcom_sm8150.dts b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_sm8150.dts
new file mode 100644
index 000000000000..7ce8433b3f85
--- /dev/null
+++ b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_sm8150.dts
@@ -0,0 +1,67 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/phy/phy-qcom-qmp.h>
+
+/ {
+	fragment@0 {
+		target-path = "/soc@0/usb@a6f8800";
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		__overlay__ {
+			compatible = "qcom,sm8150-dwc3", "qcom,snps-dwc3";
+			reg = <0 0x0a600000 0 0xd100>;
+			interrupts-extended = <&intc GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 9 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 8 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 6 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "hs_phy_irq",
+					  "dp_hs_phy_irq",
+					  "dm_hs_phy_irq",
+					  "ss_phy_irq";
+			iommus = <&apps_smmu 0x140 0x0>;
+			phys = <&usb_1_hsphy>,
+			       <&usb_1_qmpphy QMP_USB43DP_USB3_PHY>;
+			phy-names = "usb2-phy",
+				    "usb3-phy";
+		};
+	};
+
+	fragment@1 {
+		target-path = "/soc@0/usb@a8f8800";
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		__overlay__ {
+			compatible = "qcom,sm8150-dwc3", "qcom,snps-dwc3";
+			reg = <0 0x0a800000 0 0xd100>;
+			interrupts-extended = <&intc GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 135 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 11 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 10 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 7 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "hs_phy_irq",
+					  "dp_hs_phy_irq",
+					  "dm_hs_phy_irq",
+					  "ss_phy_irq";
+			iommus = <&apps_smmu 0x160 0x0>;
+			phys = <&usb_2_hsphy>,
+			       <&usb_2_qmpphy>;
+			phy-names = "usb2-phy",
+				    "usb3-phy";
+		};
+	};
+};
diff --git a/drivers/of/overlays/dwc3-flattening/dwc3-qcom_sm8250.dts b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_sm8250.dts
new file mode 100644
index 000000000000..874569a52924
--- /dev/null
+++ b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_sm8250.dts
@@ -0,0 +1,67 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/phy/phy-qcom-qmp.h>
+
+/ {
+	fragment@0 {
+		target-path = "/soc@0/usb@a6f8800";
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		__overlay__ {
+			compatible = "qcom,sm8250-dwc3", "qcom,snps-dwc3";
+			reg = <0 0x0a600000 0 0xd100>;
+			interrupts-extended = <&intc GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 14 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 15 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 17 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "hs_phy_irq",
+					  "dp_hs_phy_irq",
+					  "dm_hs_phy_irq",
+					  "ss_phy_irq";
+			iommus = <&apps_smmu 0x0 0x0>;
+			phys = <&usb_1_hsphy>,
+			       <&usb_1_qmpphy QMP_USB43DP_USB3_PHY>;
+			phy-names = "usb2-phy",
+				    "usb3-phy";
+		};
+	};
+
+	fragment@1 {
+		target-path = "/soc@0/usb@a8f8800";
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		__overlay__ {
+			compatible = "qcom,sm8250-dwc3", "qcom,snps-dwc3";
+			reg = <0 0x0a800000 0 0xd100>;
+			interrupts-extended = <&intc GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 135 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 12 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 13 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 16 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "hs_phy_irq",
+					  "dp_hs_phy_irq",
+					  "dm_hs_phy_irq",
+					  "ss_phy_irq";
+			iommus = <&apps_smmu 0x20 0x0>;
+			phys = <&usb_2_hsphy>,
+			       <&usb_2_qmpphy>;
+			phy-names = "usb2-phy",
+				    "usb3-phy";
+		};
+	};
+};
diff --git a/drivers/of/overlays/dwc3-flattening/dwc3-qcom_sm8250_xiaomi_elish.dts b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_sm8250_xiaomi_elish.dts
new file mode 100644
index 000000000000..52fe5eb3f40e
--- /dev/null
+++ b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_sm8250_xiaomi_elish.dts
@@ -0,0 +1,64 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+/ {
+	fragment@0 {
+		target-path = "/soc@0/usb@a6f8800";
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		__overlay__ {
+			compatible = "qcom,sm8250-dwc3", "qcom,snps-dwc3";
+			reg = <0 0x0a600000 0 0xd100>;
+			interrupts-extended = <&intc GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 14 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 15 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 17 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "hs_phy_irq",
+					  "dp_hs_phy_irq",
+					  "dm_hs_phy_irq",
+					  "ss_phy_irq";
+			iommus = <&apps_smmu 0x0 0x0>;
+			phys = <&usb_1_hsphy>;
+			phy-names = "usb2-phy";
+		};
+	};
+
+	fragment@1 {
+		target-path = "/soc@0/usb@a8f8800";
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		__overlay__ {
+			compatible = "qcom,sm8250-dwc3", "qcom,snps-dwc3";
+			reg = <0 0x0a800000 0 0xd100>;
+			interrupts-extended = <&intc GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 135 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 12 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 13 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 16 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "hs_phy_irq",
+					  "dp_hs_phy_irq",
+					  "dm_hs_phy_irq",
+					  "ss_phy_irq";
+			iommus = <&apps_smmu 0x20 0x0>;
+			phys = <&usb_2_hsphy>,
+			       <&usb_2_qmpphy>;
+			phy-names = "usb2-phy",
+				    "usb3-phy";
+		};
+	};
+};
diff --git a/drivers/of/overlays/dwc3-flattening/dwc3-qcom_sm8350.dts b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_sm8350.dts
new file mode 100644
index 000000000000..f25c7d330eb2
--- /dev/null
+++ b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_sm8350.dts
@@ -0,0 +1,67 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/phy/phy-qcom-qmp.h>
+
+/ {
+	fragment@0 {
+		target-path = "/soc@0/usb@a6f8800";
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		__overlay__ {
+			compatible = "qcom,sm8350-dwc3", "qcom,snps-dwc3";
+			reg = <0 0x0a600000 0 0xd100>;
+			interrupts-extended = <&intc GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 14 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 15 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 17 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "hs_phy_irq",
+					  "dp_hs_phy_irq",
+					  "dm_hs_phy_irq",
+					  "ss_phy_irq";
+			iommus = <&apps_smmu 0x0 0x0>;
+			phys = <&usb_1_hsphy>,
+			       <&usb_1_qmpphy QMP_USB43DP_USB3_PHY>;
+			phy-names = "usb2-phy",
+				    "usb3-phy";
+		};
+	};
+
+	fragment@1 {
+		target-path = "/soc@0/usb@a8f8800";
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		__overlay__ {
+			compatible = "qcom,sm8350-dwc3", "qcom,snps-dwc3";
+			reg = <0 0x0a800000 0 0xd100>;
+			interrupts-extended = <&intc GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 135 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 12 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 13 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 16 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "hs_phy_irq",
+					  "dp_hs_phy_irq",
+					  "dm_hs_phy_irq",
+					  "ss_phy_irq";
+			iommus = <&apps_smmu 0x20 0x0>;
+			phys = <&usb_2_hsphy>,
+			       <&usb_2_qmpphy>;
+			phy-names = "usb2-phy",
+				    "usb3-phy";
+		};
+	};
+};
diff --git a/drivers/of/overlays/dwc3-flattening/dwc3-qcom_sm8350_microsoft_surface_duo2.dts b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_sm8350_microsoft_surface_duo2.dts
new file mode 100644
index 000000000000..f25c7d330eb2
--- /dev/null
+++ b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_sm8350_microsoft_surface_duo2.dts
@@ -0,0 +1,67 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/phy/phy-qcom-qmp.h>
+
+/ {
+	fragment@0 {
+		target-path = "/soc@0/usb@a6f8800";
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		__overlay__ {
+			compatible = "qcom,sm8350-dwc3", "qcom,snps-dwc3";
+			reg = <0 0x0a600000 0 0xd100>;
+			interrupts-extended = <&intc GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 14 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 15 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 17 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "hs_phy_irq",
+					  "dp_hs_phy_irq",
+					  "dm_hs_phy_irq",
+					  "ss_phy_irq";
+			iommus = <&apps_smmu 0x0 0x0>;
+			phys = <&usb_1_hsphy>,
+			       <&usb_1_qmpphy QMP_USB43DP_USB3_PHY>;
+			phy-names = "usb2-phy",
+				    "usb3-phy";
+		};
+	};
+
+	fragment@1 {
+		target-path = "/soc@0/usb@a8f8800";
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		__overlay__ {
+			compatible = "qcom,sm8350-dwc3", "qcom,snps-dwc3";
+			reg = <0 0x0a800000 0 0xd100>;
+			interrupts-extended = <&intc GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 135 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 12 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 13 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 16 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "hs_phy_irq",
+					  "dp_hs_phy_irq",
+					  "dm_hs_phy_irq",
+					  "ss_phy_irq";
+			iommus = <&apps_smmu 0x20 0x0>;
+			phys = <&usb_2_hsphy>,
+			       <&usb_2_qmpphy>;
+			phy-names = "usb2-phy",
+				    "usb3-phy";
+		};
+	};
+};
diff --git a/drivers/of/overlays/dwc3-flattening/dwc3-qcom_sm8350_qcom_sm8350_hdk.dts b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_sm8350_qcom_sm8350_hdk.dts
new file mode 100644
index 000000000000..a68a5bb194b3
--- /dev/null
+++ b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_sm8350_qcom_sm8350_hdk.dts
@@ -0,0 +1,69 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/phy/phy-qcom-qmp.h>
+
+/ {
+	fragment@0 {
+		target-path = "/soc@0/usb@a6f8800";
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		__overlay__ {
+			compatible = "qcom,sm8350-dwc3", "qcom,snps-dwc3";
+			reg = <0 0x0a600000 0 0xd100>;
+			interrupts-extended = <&intc GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 14 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 15 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 17 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "hs_phy_irq",
+					  "dp_hs_phy_irq",
+					  "dm_hs_phy_irq",
+					  "ss_phy_irq";
+			iommus = <&apps_smmu 0x0 0x0>;
+			phys = <&usb_1_hsphy>,
+			       <&usb_1_qmpphy QMP_USB43DP_USB3_PHY>;
+			phy-names = "usb2-phy",
+				    "usb3-phy";
+		};
+	};
+
+	fragment@1 {
+		target-path = "/soc@0/usb@a8f8800";
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		__overlay__ {
+			compatible = "qcom,sm8350-dwc3", "qcom,snps-dwc3";
+			reg = <0 0x0a800000 0 0xd100>;
+			interrupts-extended = <&intc GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 135 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 12 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 13 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 16 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "hs_phy_irq",
+					  "dp_hs_phy_irq",
+					  "dm_hs_phy_irq",
+					  "ss_phy_irq";
+			iommus = <&apps_smmu 0x20 0x0>;
+			phys = <&usb_2_hsphy>,
+			       <&usb_2_qmpphy>;
+			phy-names = "usb2-phy",
+				    "usb3-phy";
+			pinctrl-names = "default";
+			pinctrl-0 = <&usb_hub_enabled_state>;
+		};
+	};
+};
diff --git a/drivers/of/overlays/dwc3-flattening/dwc3-qcom_sm8350_qcom_sm8350_mtp.dts b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_sm8350_qcom_sm8350_mtp.dts
new file mode 100644
index 000000000000..f25c7d330eb2
--- /dev/null
+++ b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_sm8350_qcom_sm8350_mtp.dts
@@ -0,0 +1,67 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/phy/phy-qcom-qmp.h>
+
+/ {
+	fragment@0 {
+		target-path = "/soc@0/usb@a6f8800";
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		__overlay__ {
+			compatible = "qcom,sm8350-dwc3", "qcom,snps-dwc3";
+			reg = <0 0x0a600000 0 0xd100>;
+			interrupts-extended = <&intc GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 14 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 15 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 17 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "hs_phy_irq",
+					  "dp_hs_phy_irq",
+					  "dm_hs_phy_irq",
+					  "ss_phy_irq";
+			iommus = <&apps_smmu 0x0 0x0>;
+			phys = <&usb_1_hsphy>,
+			       <&usb_1_qmpphy QMP_USB43DP_USB3_PHY>;
+			phy-names = "usb2-phy",
+				    "usb3-phy";
+		};
+	};
+
+	fragment@1 {
+		target-path = "/soc@0/usb@a8f8800";
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		__overlay__ {
+			compatible = "qcom,sm8350-dwc3", "qcom,snps-dwc3";
+			reg = <0 0x0a800000 0 0xd100>;
+			interrupts-extended = <&intc GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 135 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 12 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 13 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 16 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "hs_phy_irq",
+					  "dp_hs_phy_irq",
+					  "dm_hs_phy_irq",
+					  "ss_phy_irq";
+			iommus = <&apps_smmu 0x20 0x0>;
+			phys = <&usb_2_hsphy>,
+			       <&usb_2_qmpphy>;
+			phy-names = "usb2-phy",
+				    "usb3-phy";
+		};
+	};
+};
diff --git a/drivers/of/overlays/dwc3-flattening/dwc3-qcom_sm8350_sony_pdx214_generic.dts b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_sm8350_sony_pdx214_generic.dts
new file mode 100644
index 000000000000..f25c7d330eb2
--- /dev/null
+++ b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_sm8350_sony_pdx214_generic.dts
@@ -0,0 +1,67 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/phy/phy-qcom-qmp.h>
+
+/ {
+	fragment@0 {
+		target-path = "/soc@0/usb@a6f8800";
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		__overlay__ {
+			compatible = "qcom,sm8350-dwc3", "qcom,snps-dwc3";
+			reg = <0 0x0a600000 0 0xd100>;
+			interrupts-extended = <&intc GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 14 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 15 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 17 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "hs_phy_irq",
+					  "dp_hs_phy_irq",
+					  "dm_hs_phy_irq",
+					  "ss_phy_irq";
+			iommus = <&apps_smmu 0x0 0x0>;
+			phys = <&usb_1_hsphy>,
+			       <&usb_1_qmpphy QMP_USB43DP_USB3_PHY>;
+			phy-names = "usb2-phy",
+				    "usb3-phy";
+		};
+	};
+
+	fragment@1 {
+		target-path = "/soc@0/usb@a8f8800";
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		__overlay__ {
+			compatible = "qcom,sm8350-dwc3", "qcom,snps-dwc3";
+			reg = <0 0x0a800000 0 0xd100>;
+			interrupts-extended = <&intc GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 135 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 12 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 13 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 16 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "hs_phy_irq",
+					  "dp_hs_phy_irq",
+					  "dm_hs_phy_irq",
+					  "ss_phy_irq";
+			iommus = <&apps_smmu 0x20 0x0>;
+			phys = <&usb_2_hsphy>,
+			       <&usb_2_qmpphy>;
+			phy-names = "usb2-phy",
+				    "usb3-phy";
+		};
+	};
+};
diff --git a/drivers/of/overlays/dwc3-flattening/dwc3-qcom_sm8350_sony_pdx215_generic.dts b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_sm8350_sony_pdx215_generic.dts
new file mode 100644
index 000000000000..f25c7d330eb2
--- /dev/null
+++ b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_sm8350_sony_pdx215_generic.dts
@@ -0,0 +1,67 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/phy/phy-qcom-qmp.h>
+
+/ {
+	fragment@0 {
+		target-path = "/soc@0/usb@a6f8800";
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		__overlay__ {
+			compatible = "qcom,sm8350-dwc3", "qcom,snps-dwc3";
+			reg = <0 0x0a600000 0 0xd100>;
+			interrupts-extended = <&intc GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 14 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 15 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 17 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "hs_phy_irq",
+					  "dp_hs_phy_irq",
+					  "dm_hs_phy_irq",
+					  "ss_phy_irq";
+			iommus = <&apps_smmu 0x0 0x0>;
+			phys = <&usb_1_hsphy>,
+			       <&usb_1_qmpphy QMP_USB43DP_USB3_PHY>;
+			phy-names = "usb2-phy",
+				    "usb3-phy";
+		};
+	};
+
+	fragment@1 {
+		target-path = "/soc@0/usb@a8f8800";
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		__overlay__ {
+			compatible = "qcom,sm8350-dwc3", "qcom,snps-dwc3";
+			reg = <0 0x0a800000 0 0xd100>;
+			interrupts-extended = <&intc GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 135 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 12 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 13 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 16 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "hs_phy_irq",
+					  "dp_hs_phy_irq",
+					  "dm_hs_phy_irq",
+					  "ss_phy_irq";
+			iommus = <&apps_smmu 0x20 0x0>;
+			phys = <&usb_2_hsphy>,
+			       <&usb_2_qmpphy>;
+			phy-names = "usb2-phy",
+				    "usb3-phy";
+		};
+	};
+};
diff --git a/drivers/of/overlays/dwc3-flattening/dwc3-qcom_sm8450.dts b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_sm8450.dts
new file mode 100644
index 000000000000..c3454cc229cf
--- /dev/null
+++ b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_sm8450.dts
@@ -0,0 +1,39 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/phy/phy-qcom-qmp.h>
+
+/ {
+	fragment@0 {
+		target-path = "/soc@0/usb@a6f8800";
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		__overlay__ {
+			compatible = "qcom,sm8450-dwc3", "qcom,snps-dwc3";
+			reg = <0 0x0a600000 0 0xd100>;
+			interrupts-extended = <&intc GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 14 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 15 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 17 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "hs_phy_irq",
+					  "dp_hs_phy_irq",
+					  "dm_hs_phy_irq",
+					  "ss_phy_irq";
+			iommus = <&apps_smmu 0x0 0x0>;
+			phys = <&usb_1_hsphy>,
+			       <&usb_1_qmpphy QMP_USB43DP_USB3_PHY>;
+			phy-names = "usb2-phy",
+				    "usb3-phy";
+		};
+	};
+};
diff --git a/drivers/of/overlays/dwc3-flattening/dwc3-qcom_sm8550.dts b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_sm8550.dts
new file mode 100644
index 000000000000..3d94046e75ae
--- /dev/null
+++ b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_sm8550.dts
@@ -0,0 +1,39 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/phy/phy-qcom-qmp.h>
+
+/ {
+	fragment@0 {
+		target-path = "/soc@0/usb@a6f8800";
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		__overlay__ {
+			compatible = "qcom,sm8550-dwc3", "qcom,snps-dwc3";
+			reg = <0 0x0a600000 0 0xd100>;
+			interrupts-extended = <&intc GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 14 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 15 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 17 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "hs_phy_irq",
+					  "dp_hs_phy_irq",
+					  "dm_hs_phy_irq",
+					  "ss_phy_irq";
+			iommus = <&apps_smmu 0x40 0x0>;
+			phys = <&usb_1_hsphy>,
+			       <&usb_dp_qmpphy QMP_USB43DP_USB3_PHY>;
+			phy-names = "usb2-phy",
+				    "usb3-phy";
+		};
+	};
+};
diff --git a/drivers/of/overlays/dwc3-flattening/dwc3-qcom_sm8650.dts b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_sm8650.dts
new file mode 100644
index 000000000000..dd0f6a727d5c
--- /dev/null
+++ b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_sm8650.dts
@@ -0,0 +1,39 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/phy/phy-qcom-qmp.h>
+
+/ {
+	fragment@0 {
+		target-path = "/soc@0/usb@a6f8800";
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		__overlay__ {
+			compatible = "qcom,sm8650-dwc3", "qcom,snps-dwc3";
+			reg = <0 0x0a600000 0 0xd100>;
+			interrupts-extended = <&intc GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 14 IRQ_TYPE_EDGE_RISING>,
+					      <&pdc 15 IRQ_TYPE_EDGE_RISING>,
+					      <&pdc 17 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "hs_phy_irq",
+					  "dp_hs_phy_irq",
+					  "dm_hs_phy_irq",
+					  "ss_phy_irq";
+			iommus = <&apps_smmu 0x40 0x0>;
+			phys = <&usb_1_hsphy>,
+			       <&usb_dp_qmpphy QMP_USB43DP_USB3_PHY>;
+			phy-names = "usb2-phy",
+				    "usb3-phy";
+		};
+	};
+};
diff --git a/drivers/of/overlays/dwc3-flattening/dwc3-qcom_x1e80100.dts b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_x1e80100.dts
new file mode 100644
index 000000000000..231c9b3c0357
--- /dev/null
+++ b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_x1e80100.dts
@@ -0,0 +1,153 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/phy/phy-qcom-qmp.h>
+
+/ {
+	fragment@0 {
+		target-path = "/soc@0/usb@a0f8800";
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		__overlay__ {
+			compatible = "qcom,x1e80100-dwc3", "qcom,snps-dwc3";
+			reg = <0 0x0a000000 0 0xd100>;
+			interrupts-extended = <&intc GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 370 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 58 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 57 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 10 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "dp_hs_phy_irq",
+					  "dm_hs_phy_irq",
+					  "ss_phy_irq";
+			iommus = <&apps_smmu 0x14a0 0x0>;
+			phys = <&usb_1_ss2_hsphy>,
+			       <&usb_1_ss2_qmpphy QMP_USB43DP_USB3_PHY>;
+			phy-names = "usb2-phy",
+				    "usb3-phy";
+		};
+	};
+
+	fragment@1 {
+		target-path = "/soc@0/usb@a2f8800";
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		__overlay__ {
+			compatible = "qcom,x1e80100-dwc3", "qcom,snps-dwc3";
+			reg = <0 0x0a200000 0 0xd100>;
+			interrupts-extended = <&intc GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 245 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 50 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 49 IRQ_TYPE_EDGE_BOTH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "dp_hs_phy_irq",
+					  "dm_hs_phy_irq";
+			iommus = <&apps_smmu 0x14e0 0x0>;
+			phys = <&usb_2_hsphy>;
+			phy-names = "usb2-phy";
+		};
+	};
+
+	fragment@2 {
+		target-path = "/soc@0/usb@a4f8800";
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		__overlay__ {
+			compatible = "qcom,x1e80100-dwc3-mp", "qcom,snps-dwc3";
+			reg = <0 0x0a400000 0 0xd100>;
+			interrupts-extended = <&intc GIC_SPI 307 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 313 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 314 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 309 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 312 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 52 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 51 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 54 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 53 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 55 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 56 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event_1",
+					  "pwr_event_2",
+					  "hs_phy_1",
+					  "hs_phy_2",
+					  "dp_hs_phy_1",
+					  "dm_hs_phy_1",
+					  "dp_hs_phy_2",
+					  "dm_hs_phy_2",
+					  "ss_phy_1",
+					  "ss_phy_2";
+			iommus = <&apps_smmu 0x1400 0x0>;
+			phys = <&usb_mp_hsphy0>,
+			       <&usb_mp_qmpphy0>,
+			       <&usb_mp_hsphy1>,
+			       <&usb_mp_qmpphy1>;
+			phy-names = "usb2-0",
+				    "usb3-0",
+				    "usb2-1",
+				    "usb3-1";
+		};
+	};
+
+	fragment@3 {
+		target-path = "/soc@0/usb@a6f8800";
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		__overlay__ {
+			compatible = "qcom,x1e80100-dwc3", "qcom,snps-dwc3";
+			reg = <0 0x0a600000 0 0xd100>;
+			interrupts-extended = <&intc GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 371 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 61 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 15 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 17 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "dp_hs_phy_irq",
+					  "dm_hs_phy_irq",
+					  "ss_phy_irq";
+			iommus = <&apps_smmu 0x1420 0x0>;
+			phys = <&usb_1_ss0_hsphy>,
+			       <&usb_1_ss0_qmpphy QMP_USB43DP_USB3_PHY>;
+			phy-names = "usb2-phy",
+				    "usb3-phy";
+		};
+	};
+
+	fragment@4 {
+		target-path = "/soc@0/usb@a8f8800";
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		__overlay__ {
+			compatible = "qcom,x1e80100-dwc3", "qcom,snps-dwc3";
+			reg = <0 0x0a800000 0 0xd100>;
+			interrupts-extended = <&intc GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 372 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 60 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 11 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 47 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "dp_hs_phy_irq",
+					  "dm_hs_phy_irq",
+					  "ss_phy_irq";
+			iommus = <&apps_smmu 0x1460 0x0>;
+			phys = <&usb_1_ss1_hsphy>,
+			       <&usb_1_ss1_qmpphy QMP_USB43DP_USB3_PHY>;
+			phy-names = "usb2-phy",
+				    "usb3-phy";
+		};
+	};
+};
diff --git a/drivers/of/overlays/dwc3-flattening/dwc3-qcom_x1e80100_hp_omnibook_x14.dts b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_x1e80100_hp_omnibook_x14.dts
new file mode 100644
index 000000000000..29e9a870c20c
--- /dev/null
+++ b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_x1e80100_hp_omnibook_x14.dts
@@ -0,0 +1,149 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/phy/phy-qcom-qmp.h>
+
+/ {
+	fragment@0 {
+		target-path = "/soc@0/usb@a0f8800";
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		__overlay__ {
+			compatible = "qcom,x1e80100-dwc3", "qcom,snps-dwc3";
+			reg = <0 0x0a000000 0 0xd100>;
+			interrupts-extended = <&intc GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 370 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 58 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 57 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 10 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "dp_hs_phy_irq",
+					  "dm_hs_phy_irq",
+					  "ss_phy_irq";
+			iommus = <&apps_smmu 0x14a0 0x0>;
+			phys = <&usb_1_ss2_hsphy>,
+			       <&usb_1_ss2_qmpphy QMP_USB43DP_USB3_PHY>;
+			phy-names = "usb2-phy",
+				    "usb3-phy";
+		};
+	};
+
+	fragment@1 {
+		target-path = "/soc@0/usb@a2f8800";
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		__overlay__ {
+			compatible = "qcom,x1e80100-dwc3", "qcom,snps-dwc3";
+			reg = <0 0x0a200000 0 0xd100>;
+			interrupts-extended = <&intc GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 245 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 50 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 49 IRQ_TYPE_EDGE_BOTH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "dp_hs_phy_irq",
+					  "dm_hs_phy_irq";
+			iommus = <&apps_smmu 0x14e0 0x0>;
+			phys = <&usb_2_hsphy>;
+			phy-names = "usb2-phy";
+		};
+	};
+
+	fragment@2 {
+		target-path = "/soc@0/usb@a4f8800";
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		__overlay__ {
+			compatible = "qcom,x1e80100-dwc3-mp", "qcom,snps-dwc3";
+			reg = <0 0x0a400000 0 0xd100>;
+			interrupts-extended = <&intc GIC_SPI 307 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 313 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 314 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 309 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 312 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 52 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 51 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 54 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 53 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 55 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 56 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event_1",
+					  "pwr_event_2",
+					  "hs_phy_1",
+					  "hs_phy_2",
+					  "dp_hs_phy_1",
+					  "dm_hs_phy_1",
+					  "dp_hs_phy_2",
+					  "dm_hs_phy_2",
+					  "ss_phy_1",
+					  "ss_phy_2";
+			iommus = <&apps_smmu 0x1400 0x0>;
+			phys = <&usb_mp_hsphy0>,
+			       <&usb_mp_qmpphy0>;
+			phy-names = "usb2-0",
+				    "usb3-0";
+		};
+	};
+
+	fragment@3 {
+		target-path = "/soc@0/usb@a6f8800";
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		__overlay__ {
+			compatible = "qcom,x1e80100-dwc3", "qcom,snps-dwc3";
+			reg = <0 0x0a600000 0 0xd100>;
+			interrupts-extended = <&intc GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 371 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 61 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 15 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 17 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "dp_hs_phy_irq",
+					  "dm_hs_phy_irq",
+					  "ss_phy_irq";
+			iommus = <&apps_smmu 0x1420 0x0>;
+			phys = <&usb_1_ss0_hsphy>,
+			       <&usb_1_ss0_qmpphy QMP_USB43DP_USB3_PHY>;
+			phy-names = "usb2-phy",
+				    "usb3-phy";
+		};
+	};
+
+	fragment@4 {
+		target-path = "/soc@0/usb@a8f8800";
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		__overlay__ {
+			compatible = "qcom,x1e80100-dwc3", "qcom,snps-dwc3";
+			reg = <0 0x0a800000 0 0xd100>;
+			interrupts-extended = <&intc GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 372 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 60 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 11 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 47 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "dp_hs_phy_irq",
+					  "dm_hs_phy_irq",
+					  "ss_phy_irq";
+			iommus = <&apps_smmu 0x1460 0x0>;
+			phys = <&usb_1_ss1_hsphy>,
+			       <&usb_1_ss1_qmpphy QMP_USB43DP_USB3_PHY>;
+			phy-names = "usb2-phy",
+				    "usb3-phy";
+		};
+	};
+};

-- 
2.45.2


