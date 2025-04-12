Return-Path: <linux-arm-msm+bounces-54090-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3150FA86A4A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Apr 2025 03:54:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EC87519E455E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Apr 2025 01:52:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C750C14A4F0;
	Sat, 12 Apr 2025 01:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qj92Yo8e"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54A2F146A6F
	for <linux-arm-msm@vger.kernel.org>; Sat, 12 Apr 2025 01:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744422674; cv=none; b=g7MwLOitLGXB4hsXDRDuv2qDfNLT4i6bbfHOH7EJ6WChWlfosWWQRbcu82B8UnFnWAHPIHgNzxiMNvk7IYb6kHvmplreCFvVUYOP50d8X3PlasHlueY2/PBrac4AbDfYvQmXlNg0egyPTLE6TUIos/Qd4mqqxVB6768EeTCa+us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744422674; c=relaxed/simple;
	bh=Oaw5BYsMpa1UPPlpLdEixtK2JB8A6yxRcZwiYYqmxCw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CRza8cv4FWtlsxyaRNY/Ib26DlAMtD9htB+foRGAKNdctFvlLpu/7ujcp1NqA6yCuQG0SV6PjQfIBlFoy59HUtc/XgSoBUZDd9YQStsZHaVgFU21XGg3bsBhpcjj79ZVGCUQxRUCSKGpvgIvvAcEkYOVtGJDSqYtDWfnGydWqBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qj92Yo8e; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53C1pCum006807
	for <linux-arm-msm@vger.kernel.org>; Sat, 12 Apr 2025 01:51:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wXDjDnI/vwlLbmgczBFD5lMgP76iqExSvHFDjdjU4aQ=; b=Qj92Yo8e/+N91FRy
	/T5/wDDpZPvwR8QhdIIph/NCtA/cH4Fa9SHTXJZA05QG1Ot1HfDc5pFtcY8p45Pc
	NDQQE2MuMYAxsKR3F82AykN0reKjWA5i2tA8Oq8LVlyUqhY6i0zJ1zGyPtfkolog
	Eb//UkK07m8D1bsc7ZiPwLvPdeWnM9a1Nmf4McTVJc2vS//gq7obAisgmkAhg6Fz
	Lt7rczteIiiEZTFCCXgj6gv2poHVCZ6XZztyAYJWF/uOkYFcuhmn2/YDG5n5ahWZ
	ol0OrncIWSw66v5v7q4Tz6enwNYVbi6X3nhfWRVtWClnBUQv6QWgd9bZEOhoEe51
	1pFqQg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twpmm0jn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 12 Apr 2025 01:51:12 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-736b5f9279cso2219934b3a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Apr 2025 18:51:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744422666; x=1745027466;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wXDjDnI/vwlLbmgczBFD5lMgP76iqExSvHFDjdjU4aQ=;
        b=d0qnRG2ssgxv0DmbrwSOSCO7bK80voVXKbYGC7AuoNNXYiKazkhA60pdP8d9yXI20b
         QsABXzvE48AK/68s+YHadvp1GglM6e5IPQqsTSvkJcOIhrs3ocRrIuWFBedhM36iLKT9
         43qJEhO94xFr2VE5nIDwfa5JYeXfo60OB6qAzZ7Py5KoUy7ySjtozwRzdY5VFj8BHJdM
         uZkOBhXQR8SBjMPAIUTaKsmTxuNU/iC/nDilLVeZTRDbDMZ0l920CPOyQVoO+rIYw6v4
         hGTkpuAj84vvR0fZ3+pPYe8uIfz1A9UiOeU83wmJQ5UnjavWeB1QtBx/f21jgKSibwii
         nuYQ==
X-Forwarded-Encrypted: i=1; AJvYcCV4GxVM2dfYbZRBXSiyf2MfuIgqMLybcQFJQARkncTBD/sjJla1u4inutJuwjts2nYDqafED12twb3DZ2EK@vger.kernel.org
X-Gm-Message-State: AOJu0YzLIH3dnS3mCU0p7n4p1mwlqyvFe7NLkHo1j8s4ogRvofVkVJND
	Bng2PUvOJ990chUT/ozNvxosjWszBuY2BWqwjSoDQ2vHyfsj0zmBxQWv4S29M4llVgzS+SDeyjV
	TQoa4Mv4MEWueoJRcEG+rSOjr/KiCXuI6sZV7ZPbKcU2LV89zIfinGs3Z51SFBgCP
X-Gm-Gg: ASbGnctlL7WKy+01q7L+xJza95cyrtwO98lTX01iXlX2VnK9/7XWkvd7s5PxJ08cbV8
	nf6ZWJx6kGQUU3GchxwtcHk2KCRkZ2CJ56VJORMXDy7wip/21Mm2mNvjtANkXuMc4U0uxK8PPvV
	rFtJXpdjQJKe0ldMQpXXUzVyDbMUmsXeOvBU8hQYsN1cGKuQm/Id4ht6q52uY/AkhysfCYO2ZXm
	P6Zwf6qH+qYsOXixqiveovwMXAbuA99qWw4R2kPSriRRLotVGF4roRz1BWsU3Qvj6aB3bCOb8dS
	M+7cy8bVm2dNsa0HYokGgSu63Co4UkKE+ONyLpl+rWA29CE=
X-Received: by 2002:a05:6a21:1346:b0:1f5:63f9:9ea1 with SMTP id adf61e73a8af0-201797a2f99mr7734241637.13.1744422666153;
        Fri, 11 Apr 2025 18:51:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGhQZCbkxSI6PDwHyqW4ekFZNhMWVyKXBuUhJd4fpDyIEb/nfuhTQtDM0Fm4R/yM1QyukaHVA==
X-Received: by 2002:a05:6a21:1346:b0:1f5:63f9:9ea1 with SMTP id adf61e73a8af0-201797a2f99mr7734204637.13.1744422665819;
        Fri, 11 Apr 2025 18:51:05 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b02a3221832sm5516825a12.70.2025.04.11.18.51.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 18:51:05 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Sat, 12 Apr 2025 07:19:58 +0530
Subject: [PATCH v5 9/9] arm64: defconfig: Enable TC9563 PWRCTL driver
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250412-qps615_v4_1-v5-9-5b6a06132fec@oss.qualcomm.com>
References: <20250412-qps615_v4_1-v5-0-5b6a06132fec@oss.qualcomm.com>
In-Reply-To: <20250412-qps615_v4_1-v5-0-5b6a06132fec@oss.qualcomm.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        chaitanya chundru <quic_krichai@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, Jingoo Han <jingoohan1@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc: quic_vbadigan@quicnic.com, amitk@kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, jorge.ramirez@oss.qualcomm.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744422605; l=898;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=Oaw5BYsMpa1UPPlpLdEixtK2JB8A6yxRcZwiYYqmxCw=;
 b=JL52Wfo8pw6/UQa9GHkETh5g5ITH7gQC8LdiDoKxamZX6i+6eyllC8XztRV8oSG5TFAo1JJWZ
 wIqXMoNPmYOAbk0D/dg0FiI8ZOyVMCK0Y/WT2UnCaiux3Sxz3X94WtI
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: UMNPHkI1IGNjOA9d9wsBbSH_ggQoLib2
X-Proofpoint-ORIG-GUID: UMNPHkI1IGNjOA9d9wsBbSH_ggQoLib2
X-Authority-Analysis: v=2.4 cv=MpRS63ae c=1 sm=1 tr=0 ts=67f9c710 cx=c_pps a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=5PcvmwL3LSb495PBagkA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-12_01,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=871 clxscore=1015 priorityscore=1501 impostorscore=0
 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0 adultscore=0
 phishscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504120012

Enable TC9563 PCIe switch pwrctl driver by default. This is needed
to power the PCIe switch which is present in Qualcomm RB3gen2 platform.
Without this the switch will not powered up and we can't use the
endpoints connected to the switch.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 5bb8f09422a22116781169611482179b10798c14..b974098910d5b3656404bb839176baadd059ae9e 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -245,6 +245,7 @@ CONFIG_PCIE_LAYERSCAPE_GEN4=y
 CONFIG_PCI_ENDPOINT=y
 CONFIG_PCI_ENDPOINT_CONFIGFS=y
 CONFIG_PCI_EPF_TEST=m
+CONFIG_PCI_PWRCTRL_TC9563=m
 CONFIG_DEVTMPFS=y
 CONFIG_DEVTMPFS_MOUNT=y
 CONFIG_FW_LOADER_USER_HELPER=y

-- 
2.34.1


