Return-Path: <linux-arm-msm+bounces-69506-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B5F47B29C0A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Aug 2025 10:24:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AD5621961CEB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Aug 2025 08:24:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC77C3019A6;
	Mon, 18 Aug 2025 08:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Trfu9uoq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16DC6303CBB
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 08:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755505407; cv=none; b=VSOwUQ538xllsSqcxwkqnfGDksml4Zzwq0+qbKDwdU5L2M1BrDkuZcV0L6eFqGjtZc+lTv0L4DidQs6Tk0MApyuDGMYWDAsbqgIrOjrluHdaI0SmjnTq1vSiG1WwfICSiLK3wP2xSCN55MCuP/oszKqUwKilP4y13k+hxKRIq7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755505407; c=relaxed/simple;
	bh=r1P5XOZ9xenxmIBMJEe17CUSV641Nz0efcyuB6UGa2k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CSi1LmYv3RNAvAM7LW/N/ONa2eWS5vq31rW+LnvDYMMK9pvzaGRcJonCXnvepsjVKfs1r5P5Es7Q4QYC25NiVDQxJHK8xHIt9sFGSU5/hVizKUtct8nYr8VMMSAUmvRILMF8+UhQQOBEH6CNndNR0CQfjTSNHOgqbzvEIaOp/80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Trfu9uoq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57HM02xB021396
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 08:23:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YA2b9PAvdXRmG3Yuf64IGVHkPXHXY02Aav+qtOoDO0w=; b=Trfu9uoqWNmuDAZp
	dgQT+DNWP7ceg/uWTWqS8ycztNGXI13n4/uE5bYLdZxm/L9fVhYF6wM6j9pqO0mD
	J1TixYrRUv2bqDdk4Hv8R1Lb19zs9KSDZ2fGIWUWdZS+TyzLFpJIJfSphQ6cyiEA
	gtNB0SDWxAVJMJkuu52NiS0SPdBU155RL+yXWAKGkC3jZzGTrmZ2/nk6uRzg1uIU
	TGQC8hJCrjEdpfxj4kpz8Rim7n4OQkubd08zaUYFN3BqZftINjX+zvK8rukQ4Inz
	IXf0wWAJYc+SHz4h3ewIJrf0VPo17oTzqFx4jb4V6A5L1PArNkFNR2i+ETyfmfvd
	a++a0Q==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jh073x3s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 08:23:25 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-32326e6c74eso3919918a91.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 01:23:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755505404; x=1756110204;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YA2b9PAvdXRmG3Yuf64IGVHkPXHXY02Aav+qtOoDO0w=;
        b=ikm+DUCRFkHbsNffr3o6Sb2TYZh1ts1I1tKaHBAIX7Ebu9hbe8pCqHC2NW08UaMLf9
         /6zvEaNXZ9+FJ2VPgqZARYeV4GZusFUnZk5FVd/c/67qYY5zPAtVW8YX7T3EujK8rOkW
         2wBQmW0ylYcyiH7mgoJIdw32u1tqqBvoQ9tQjAVdTAPnp8LP9ZEEK1aGV0GEsbaPAryU
         mS3vcITYWEcsqO00WuuSAs+4zld92xd8+rPzxL6ziyLJQyVSd8PDl7vfKulqmq5XqVbA
         78se73RgJwG99pyNzD8haqPEV9Re7LS4YLwcr+5vSWv4rnsM7NN9dBn+7hI+F5csHViY
         iBCg==
X-Forwarded-Encrypted: i=1; AJvYcCXyuacrvrN2nwFyLu/LS7c1HRaWASsbnq7kcgfBXcsa7SGR8vE/TgGXLxr7npAj+B32CeSS4g/1euLx3N1f@vger.kernel.org
X-Gm-Message-State: AOJu0YySaMSp3gtMPHGPGx25L+kk+B4kUXnO7xNEFcotcflZO+HnIDOy
	/wJdwatJ/Fc4lgHp/O2x+MSknY//wboH4cysGqRtA1SG2/iGSi3/VQrmdIWSg0DZ0TGbKf+W0w5
	jCPjRBZig/GmWjxz1JkGziYrut/7OwVecLVZxf0ZT3MWEnxDAdWMGt7HjQliCubASheK/
X-Gm-Gg: ASbGncsjjHq3hPuy4yf7g14HQof0nt9cV+U/jROo7O3tW1kzmrpmh7eLSupjCUfjD1w
	UZoTOjLUv3QeQWGzO/w8wJ+ujysbDriGFgflVsIHlCnLNwNXiwkVXwbKLEmaL1d6airSPnZcy3f
	xKJFPPk1QQtFD1ewsm4HUhWStSJaAqu+SjFD68p248WVNQ5KfgVJKbOnXtIXlW7oGLZR7J9EKgc
	MKuzt42YAfVPDcYaK0y6MLiRfQgY8xSAseL0EoxQHVp/ncIpoASZ/czuNoOAvgTasuQk8hdtiAh
	FhbDZeE8Rt9+ZvIBvA4kUVM2yd6VjAz4jt+Bf3V3IKJ6A2RJDWJCUSvY8wQU7P/4mtyo/bkN8KQ
	=
X-Received: by 2002:a17:903:37cd:b0:240:70d4:85d9 with SMTP id d9443c01a7336-24478cd29c1mr101023075ad.0.1755505403878;
        Mon, 18 Aug 2025 01:23:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHYuBoM4owvivfKknYahmOIJgp7qidwojBn4u8QZooyQId72Yf/YGItXF9hitSi0rTk8Kblig==
X-Received: by 2002:a17:903:37cd:b0:240:70d4:85d9 with SMTP id d9443c01a7336-24478cd29c1mr101022735ad.0.1755505403431;
        Mon, 18 Aug 2025 01:23:23 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2446d5536c3sm73225155ad.137.2025.08.18.01.23.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 01:23:23 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Mon, 18 Aug 2025 13:52:55 +0530
Subject: [PATCH v2 3/3] PCI: qcom: Use frequency and level based OPP lookup
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250818-opp_pcie-v2-3-071524d98967@oss.qualcomm.com>
References: <20250818-opp_pcie-v2-0-071524d98967@oss.qualcomm.com>
In-Reply-To: <20250818-opp_pcie-v2-0-071524d98967@oss.qualcomm.com>
To: Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        Stephen Boyd <sboyd@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755505382; l=1213;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=r1P5XOZ9xenxmIBMJEe17CUSV641Nz0efcyuB6UGa2k=;
 b=yIhj5/flyrKcPzl2sJmHXf4IYpP87Kd3PzPby7h3mDHr2w3wwdRaowv/CYbZlukjY53rlE0WV
 t8sMccGGJAlBnKRYYFnGhVi+7QJBVVH0ErrAJh7QHWOlzcOXc3+RhS7
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-ORIG-GUID: 5kA-KMI41TRWRTaFiIJ-pKimPfOEvg7K
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAyMCBTYWx0ZWRfX6w3hjMm+8/J2
 163FD2eCkPJdWFBRBKZuA8LDTJCC7oIpc8qLtjIeYhi2aQC/9Q50HGJmRx0nzdQumK/nMhmRcCw
 umgDdX7oUBRhNPcH/Zcu51HVf6YHO8wPCtzsz4Yrv7EYI3rHWNexshFhtbBZwtB0GAW6Ek2xC9S
 sJMP2UmMWCi2i4doeV0EW5/+lj8Y68+hQwa+RA70abCIulu9pBudBzlzSQLBgUvAFlVleqjgosy
 b4n0b0kzb/C8QOvSsEBdlIjLlPx0H4PafONpYQ6M/nBPcZoijYjpbktRSwmgb+GacnB4cE4AP5z
 u78ybJD4kfwPUkX6PV7uGX9Bar+q/i8v18MEMi2tyAq4LBbUuPrqJ3a6Wvs0uZbavg+SosWkyAk
 cjGYS1Lr
X-Authority-Analysis: v=2.4 cv=a+Mw9VSF c=1 sm=1 tr=0 ts=68a2e2fd cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=Py5lcOcq67Lbq8UMOfUA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: 5kA-KMI41TRWRTaFiIJ-pKimPfOEvg7K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-18_03,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 suspectscore=0 impostorscore=0 phishscore=0
 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508160020

PCIe supports multiple data rates that may operate at the same clock
frequency by varying the link width. In such cases, frequency alone
is insufficient to identify the correct OPP. Use the newly introduced
dev_pm_opp_find_freq_level_exact() API to match both frequency and
level when selecting an OPP, here level indicates PCIe data rate.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pcie-qcom.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index 294babe1816e4d0c2b2343fe22d89af72afcd6cd..698209b5c13d99c639b09ca05bcd05767a2b9be1 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -1582,8 +1582,7 @@ static void qcom_pcie_icc_opp_update(struct qcom_pcie *pcie)
 			return;
 
 		freq_kbps = freq_mbps * KILO;
-		opp = dev_pm_opp_find_freq_exact(pci->dev, freq_kbps * width,
-						 true);
+		opp = dev_pm_opp_find_freq_level_exact(pci->dev, freq_kbps * width, speed, true);
 		if (!IS_ERR(opp)) {
 			ret = dev_pm_opp_set_opp(pci->dev, opp);
 			if (ret)

-- 
2.34.1


