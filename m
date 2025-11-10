Return-Path: <linux-arm-msm+bounces-80923-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C1E79C45274
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 08:00:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id B6F0F346C6F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 07:00:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C1E02EAB81;
	Mon, 10 Nov 2025 06:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Mfq5Ae+S";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Iuay4f2K"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C41142EB5C6
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 06:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762757992; cv=none; b=lHmybUmuTUVaTmCuwKWsJfiwoxlljds03aN7fw/JELWxxHT88DNV0UpTnfD2KY+IFKNBg5gJ7xInMZwwNZl66uPhc3fCTjUFirRagcUeglBMFPMRznnqeg4tKQfjQQTnK1YWvV9EN9IysmGnIi0gJQkEvY+a3uCaiCV3lv1j6Xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762757992; c=relaxed/simple;
	bh=FEATCEIhTHMz7b3SDtTSGozMG3s3HSCmKvUHkBi8n1w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=H/7YuRU8RocZRN2ab+sSYvNCVdM68g/kDmKV5LADhaK3drAVfZkhT3TXAcQNfp4Ad7H3ZsNxhsGo4pfXpFGZuV/zRHkDwDA4zF319DAPjzCoKeDFg8dSb8+/aRpieBTCzEqY3I1vMBDJqZQ6WsfVciu3AeTTVhsNMYbBOqGWRl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Mfq5Ae+S; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Iuay4f2K; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A9MlbYs1731552
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 06:59:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rLpEAKj005z2AVaIsDA+4OzjbLyJv2txT17XxeH5bAw=; b=Mfq5Ae+S14LyzdMo
	9HJLI8eMFX5mLYmfdE+GLug0rB26Hgy0U7cJiZGx2BJKCTmyixDJ/OXl2/6DonLc
	HMKKJyhGd9QiRR/QF1JdRgUSQf1Bud4TAlnzRvC+vu5ri22/05Cqw5Xz+p24U4rS
	a4g44ru0SkEir7ne+dGbmA5wLACO12ACaTUPGyCUxS3GLUOUY9u0uTcDscNDPWat
	AMhZnAf7eCreD84DKaz61PWiw7582GkZEQZHZMumMNsJH2H9TFq1nPmlWbNhfNrL
	gUrMrCdh2828B4Jl6ZLQOUohctUgNXS/8EU2MHlaM0QBYB8i1/WlUgUMTCVV/ZvB
	8a4k6w==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aad2a2h0n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 06:59:49 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b92bdc65593so5837713a12.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 09 Nov 2025 22:59:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762757989; x=1763362789; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rLpEAKj005z2AVaIsDA+4OzjbLyJv2txT17XxeH5bAw=;
        b=Iuay4f2KOCO7briXd4wcKw7kNyBRxJT9ilPl/ZI4uxlSE8eTvOQC4WKTNOWzxtEiBT
         rOU4Ft3TL8AIHeyJCxlaFO0FM+VtP9EWtp07LKFLs5G/Tqn/fwGkMQUgQTdrA/8mFMgd
         hvEf7hRw5hXkpXD81hdPwf4Pg8RdWhslb2V04aJPJ89V8JDkBi0uqtOp8H83yV2CxQW8
         Rjko7pr5XXlB920ZRBwaOepd3wKMo35Oud1jPlpfTwGu59MAVZr9zB0AgUAdv6XmSuYP
         YxJaI8LLQUZUr2kpl8mwUhiuftwYkO57ivbWKWypFcJ2tWWwRzWJex+MXXyxPDnMYxap
         BQcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762757989; x=1763362789;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rLpEAKj005z2AVaIsDA+4OzjbLyJv2txT17XxeH5bAw=;
        b=vl68eQFaDlfM16IRGlx+zbrEpMfB8iEegtdvNJqBTgNy2DShyVwbyL3XWGEHZmN1i8
         4sud9deeN5XRkCrzjeKsKS3IOV7qTpTXFJC+i2FFae9Sq13OTLZ3v8yrq/vDFpYH3yq1
         5ktiXDv2IiUCPPWFNsv3t448AEqIG8Qn7q1oQbLqlrtsxZXwG9Plvi7t6uabtH/pjUxH
         2tLI7q7QWKGWkBPQIrR+u+agyzhngTMYgyW3xI5tEVX64mEZeMy3RpY+JZhUg//gW7IR
         bvdpEdi29fwbtAEHFmRVXfUvB8X686mBp3UxWnY6HtZVDgxtlXs19pmcbrByxhsH+u0H
         MtHA==
X-Forwarded-Encrypted: i=1; AJvYcCW/g8DmD+VQKAU1jmkaUw9trpoxjlAvTKPlaHkOyyV+KNVFa8lOy8iInHrwoCw8wuqXPzUjb8hQLI9El2z2@vger.kernel.org
X-Gm-Message-State: AOJu0YwOQruxUClu2/uR/aXsGNxd88S9XouNbmRB6jtXn5bJTzUNBj7h
	XmBFknuVgNPzWOcq1LFNaD8IMGB1P7EHS4fBeRCeYkcXMz3WWiR7HdSA3AdQTmt/GVh0xOyFkUm
	bCacKiv7Nbmt4LT0X2Dv8Q78IUL22rF8SPovUpmcezMofxGUHb3gUn4LvfyNjDl3Ceyn+
X-Gm-Gg: ASbGncu1zy31tBIBedJGW2wsjIXnT1paBYxBQJn4PjDNm0UuevoV96vgvQOcJ4YhEO8
	m5dUy3sJr4KrcYQ4ZdClQdXBYkejasNP9Uw1XuoQJZTCTJUgG0gYl+AvW93469lvoEnr3s1e/uH
	Eggf45dmey8cpu8ZdkXQQAVzRtyxWBNHMtRfxZ3BgzdZEEZngGmHZlKXuINTI1Ui9vB3H7y93nb
	UpGx3PP+MZom0KyJAEl9seOzWorJUn9m5Sw28/a49aPAlnXKFhs88bfhMf7/yvwZmIrvZZ6lPM2
	IJ5irokXY3p6AD7/CA/k7wk4IaByODebX697lfcTai04h3ksojcPpFHUmMnG1Eo2n7PO9hqImzl
	/mZyYDp0mORnCqtunID5ExFHcpMJh1VOTgpeKVZe/6JKavg==
X-Received: by 2002:a05:6a20:3d82:b0:351:2c6e:6246 with SMTP id adf61e73a8af0-353a3d56f88mr10141643637.56.1762757988718;
        Sun, 09 Nov 2025 22:59:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH9d1kkatJ20pVQSTVs+EbB1h3xArAS1XPRCq6+wqezpcPrpWDk3hkhBM5GKsQi5YCcod6Ojw==
X-Received: by 2002:a05:6a20:3d82:b0:351:2c6e:6246 with SMTP id adf61e73a8af0-353a3d56f88mr10141607637.56.1762757988234;
        Sun, 09 Nov 2025 22:59:48 -0800 (PST)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b0c9c09f22sm10565900b3a.20.2025.11.09.22.59.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Nov 2025 22:59:47 -0800 (PST)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Sun, 09 Nov 2025 22:59:44 -0800
Subject: [PATCH 5/5] PCI: qcom: Remove DPC Extended Capability
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251109-remove_cap-v1-5-2208f46f4dc2@oss.qualcomm.com>
References: <20251109-remove_cap-v1-0-2208f46f4dc2@oss.qualcomm.com>
In-Reply-To: <20251109-remove_cap-v1-0-2208f46f4dc2@oss.qualcomm.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>, Jingoo Han <jingoohan1@gmail.com>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Wenbin Yao <wenbin.yao@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762757982; l=1170;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=FEATCEIhTHMz7b3SDtTSGozMG3s3HSCmKvUHkBi8n1w=;
 b=7LHbWxRs1CZJ6up1opRxZmF8nyfMw1R5TXGUaO+VWMOWI9Cdw76BRGYMkj2u2t6JT8UTIFEXQ
 woxRuWtw+t+DQ56tVmZCnsVjxR0YX7zCcTHOEddtozmDDVD+0lkXXrT
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Authority-Analysis: v=2.4 cv=aedsXBot c=1 sm=1 tr=0 ts=69118d65 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=LA3sOWcMmZYsM6F2gv0A:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEwMDA1OSBTYWx0ZWRfXzl6DPrgZDfBP
 bJLoIuUftq5Bh27lpjsgE1REyaqCuCh95NhB/qJewSiQ8LQYaH2UlQPb9Z70sdQxWcNOlXqxk1s
 PB621whhjgMC1dtiZ3LSr+zbrbO4VBzzmVuWvPSzhyIdER6LSa0poxCEWF3Bd8wKYxbZLYmcYk5
 oYSKSgJljGdfwt9AEutPW4Sd0VVizhyv2tQBE5yeA9usY3x0Xgb0h/u0QeXND9R2qK1McG58/0E
 TFWFI+rtR8d06WAmuCOYX1UF4YZJTOri/m2X86jr3APL2llvOmaCxex7Tg5Kx6XjetSrA6JuVQs
 PGypWmF69ZBgMwaimeQCwqqRPw99GF8EieUZXCDYJqX24nvk/y+LW5DP3efEebMtUZ3zKCeUa+X
 NOXfe4B27i4hixcHg58LMeEPg7QMJQ==
X-Proofpoint-ORIG-GUID: WegjNmb9vKvNCqXyj3Ul096hERNt93qM
X-Proofpoint-GUID: WegjNmb9vKvNCqXyj3Ul096hERNt93qM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_02,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 bulkscore=0 suspectscore=0 spamscore=0
 phishscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511100059

Some platforms (e.g., X1E80100) expose Downstream Port Containment (DPC)
Extended Capability registers in the PCIe Root Port config space, but do
not fully support it. To prevent undefined behavior and ensure DPC cap is
not visible to PCI framework and users, remove DPC Extended Capability
unconditionally, since there is no qcom platform support DPC till now.

Co-developed-by: Wenbin Yao <wenbin.yao@oss.qualcomm.com>
Signed-off-by: Wenbin Yao <wenbin.yao@oss.qualcomm.com>
Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pcie-qcom.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index 09443ffbb150e9c91bfd3b2adf15286ef2f00a2a..1b0f72bc38d912ab46739aa7f904ceca617c668d 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -1351,6 +1351,7 @@ static int qcom_pcie_host_init(struct dw_pcie_rp *pp)
 	}
 
 	dw_pcie_remove_capability(pcie->pci, PCI_CAP_ID_MSIX);
+	dw_pcie_remove_ext_capability(pcie->pci, PCI_EXT_CAP_ID_DPC);
 
 	qcom_ep_reset_deassert(pcie);
 

-- 
2.34.1


