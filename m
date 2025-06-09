Return-Path: <linux-arm-msm+bounces-60577-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CD27AD1BF3
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jun 2025 12:55:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C2A357A75B6
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jun 2025 10:53:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25F6825A341;
	Mon,  9 Jun 2025 10:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kaTz+2TT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28B7D25A331
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Jun 2025 10:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749466337; cv=none; b=mVEmIhcJRrcIsM2A3p8jde11fak1x4VbN75TPIZ4LCFmKNAkVg2Nq88VDWSSyX6o2D2awGY/cWXGjnsBz0vTQPC95F9PWso9K2+27Rz4p0DdfME+r3BssRL73iXZBShEShtfCir6YpnX08V28XLTG7QRiVabeuLClNkhfC/KJjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749466337; c=relaxed/simple;
	bh=ZDtM21/VpYgUVrvDvFCvhbVFgnDB7/qixYXvJx5tN8c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gkkHnQgD2kpr85w0NoJ1rdnJEFp4OgdXPR99xIIisXw7sLfJNNUgTZ7T6Vgy0R7EyME/B5ZzgSSlUgFkSRe3K1rLv4MJ7pAibGz0sDcqdADEd8+8mGaouVXDdghy2RP8OKNTw59JQq2Y8Ea8J7Do/1tZzrELp7HnurDMU69F67U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kaTz+2TT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5599LILl029821
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Jun 2025 10:52:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zPgT8D4IPTgaAa3s6UuMsQfkwr2chND+bSAhzKGs8QU=; b=kaTz+2TTUluP90gA
	qb9bfQgIP0wW0hGU3JlT/vLppkNQR67FLVqXxBuPRuqfnyQhOZP4NcMsF/PbBTqt
	YZDhuAMryCkvy4o/Sku6P11w4w5E0pTL262yT19N6n7kuiTu5Wrncy42gwyF3bz7
	Lu+hvPUbMASH0L91vY6gHhE8L2KrkS5hEsx3SToZF00AG7jLRdKgrd8rPofuenl4
	26dwj2pJ/o2Oou4sMJY6KdMwG3BGlAotuUSfQaqRa7miYAWEI+w5yKsRq4WNXVOG
	K0B0TvIZG14yB/0P4B8nITsBYRhRXpTugwAP8LlBc6NSDGmr98nT9adP51dFQ4pQ
	QBLbjw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474d11wxpt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Jun 2025 10:52:13 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-235f77f86f6so27339785ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Jun 2025 03:52:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749466332; x=1750071132;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zPgT8D4IPTgaAa3s6UuMsQfkwr2chND+bSAhzKGs8QU=;
        b=LHzWmuLItDLikJ6lIVyIQpobFYmNtMwNpPndbBaFRW10fUZwRNIuc5uT3ES74GFA/Z
         GrnwvqfwXShTr3onL0Zys/6VlDZFRtWe69X0y3PDwMcY5TgNK20CpM06npcnlo8OmOaS
         GDiJMpq5dBuPooygiQJ3sqszhr0h78hlPTM+SFGVzfD87PIQIWMYrEExkkDEAv049wyr
         rgZOUd8VtQ+ZEnDWloJ98StT0WCg/VCFRda7ZLKnAQKQXJ/caqxktSq61ifmsKBkfzP9
         qbmSvY0i76DxVecJcZmwQ4r5KP0O3B/EDpWO/gtj6Bwjy8Gr+WYsjJVxIBgy9bl0YJXT
         8rZA==
X-Forwarded-Encrypted: i=1; AJvYcCWq9zU2wLL+nOoB6r885f0nJPOCbqRs5ERcKzpD6fDolHx5Jz7xcNB/ZKWfMrUKylMB6Mz0QImXHeohhRqf@vger.kernel.org
X-Gm-Message-State: AOJu0Yyi/bK/woHSc8r/BMbdiRsBURXz5Ac4a/YJR1iCheOgmHvICHju
	WyfRfHxPLVtvoUjgd9en9CY82aTd2mdkTJ38llD7i2OvkME51lO7KiC5/YTCmAQ6BEfK2A52kcY
	2SGupKN2HFCL93ex9ErKVBOQ9brpUcRcDrjfI+UDkeZ7Z5lMpm3QXmFr/xxVorI0uM7n4
X-Gm-Gg: ASbGncv3W14V13OQF+ach5z14svVB6eSzRtTpyUT6L/mSLmuRq/IfxL8D5Q3swk08zL
	QMmEegtx4vEK1N02Hz5d/eCLYPtuXcRWlkT4d5DAPAhDJJRUnOqCwXQipbTX9cuXZPpsekXZ4dB
	gyIrkWQTqgSzCVJqpDHSnBojDMZ5cucUlM8gFQo582Mqr5Sm27qNuY/9Bsdm4DJiDPoOtKE65o6
	aqrIcBvPxJNiEazpBmTOwBCZnUrlj0ihXaKpG7/WG/3VkbZXG6I9Q0Y3RWFv5fRTobye1lzLaae
	2TGy9OpBYthCmw9Xe6gnifKyO4wLBcpw/WRM10qf8fJ68fo=
X-Received: by 2002:a17:902:db0f:b0:234:f182:a734 with SMTP id d9443c01a7336-23601d24a79mr172681385ad.31.1749466332584;
        Mon, 09 Jun 2025 03:52:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGo/wXnrK3iji5yZk8aH4OcOGyMUm+fPqYmD5eHGzL0faoq492bZ37GElru7QLbpXFgJf0IYw==
X-Received: by 2002:a17:902:db0f:b0:234:f182:a734 with SMTP id d9443c01a7336-23601d24a79mr172681045ad.31.1749466332182;
        Mon, 09 Jun 2025 03:52:12 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23603092f44sm51836465ad.63.2025.06.09.03.52.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 03:52:11 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Mon, 09 Jun 2025 16:21:27 +0530
Subject: [PATCH v4 06/11] PCI/ASPM: Clear aspm_disable as part of
 __pci_enable_link_state()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250609-mhi_bw_up-v4-6-3faa8fe92b05@qti.qualcomm.com>
References: <20250609-mhi_bw_up-v4-0-3faa8fe92b05@qti.qualcomm.com>
In-Reply-To: <20250609-mhi_bw_up-v4-0-3faa8fe92b05@qti.qualcomm.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Rob Herring <robh@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Manivannan Sadhasivam <mani@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        qiang.yu@oss.qualcomm.com, quic_vbadigan@quicinc.com,
        quic_vpernami@quicinc.com, quic_mrana@quicinc.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749466291; l=1156;
 i=krichai@qti.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=ZDtM21/VpYgUVrvDvFCvhbVFgnDB7/qixYXvJx5tN8c=;
 b=LirUNXKSmX3ebHFBXXCn4igrV12r9SfiTvWKTR2nB6rgsDGG8kxtC4uNmZtMHaceWbMcscgcs
 fEN00pM7t4NAA6x0mbb4IpyHc7lmWammFasxXqtmtx8STYc7YUguKj6
X-Developer-Key: i=krichai@qti.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: n0imDYd6e5IpMnyMUz4OpicYq7iBY3jO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDA4MiBTYWx0ZWRfX8w8CSx/iLhhQ
 5z5n7YgDImhj9pMh5JRnv2nUf2R2tEcqHY60FrjIpBhubTegOcomSdB4GOK8v0MNwZ2nW4EVLUR
 D7GFFM1euynnyl8FOiF8voKDTxeW6tidBY6WpK8WAIr96Srb7VZIr8I1jCOyP2X7nE3EQKfB+fn
 e4ToF/+fQZvogNaYkPUwRkmg/lsm3O7NL0yD/FqE8gHq+Hb+w5BOd03J5oiN7kAeZJDEmFTrv/s
 QPk333cElf91ReUZZY5B0NfEWK5zR0DK/XImobIg72q/HK8zH6zI5/ItbQjkJt7mkUpRgr28zWV
 vLbhe6Ivdn0M45vfqrOfrxj31c9E7VSHLiRypNw6ATPwVQKcwUFstRoIvjBTwzALpHR2h/Snxrx
 TDuZPorlq2OSVW22jK/bTNndo5ThbEJTtaPtlP4nl8NR3oUAvU3ESDVzubjwzkrRJu4MZYgm
X-Authority-Analysis: v=2.4 cv=GYkXnRXL c=1 sm=1 tr=0 ts=6846bcdd cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=rcts_Xg4tTJKaDXoMsUA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: n0imDYd6e5IpMnyMUz4OpicYq7iBY3jO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_04,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 mlxlogscore=921 bulkscore=0
 impostorscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 mlxscore=0
 adultscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506090082

ASPM states are not being enabled back with pci_enable_link_state() when
they are disabled by pci_disable_link_state(). This is because of the
aspm_disable flag is not getting cleared in pci_enable_link_state(), this
flag is being properly cleared when ASPM is controlled by sysfs.

Clear the aspm_disable flag with the requested ASPM states requested by
pci_enable_link_state().

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/pcie/aspm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/pcie/aspm.c b/drivers/pci/pcie/aspm.c
index 94324fc0d3e650cd3ca2c0bb8c1895ca7e647b9d..0f858ef86111b43328bc7db01e6493ce67178458 100644
--- a/drivers/pci/pcie/aspm.c
+++ b/drivers/pci/pcie/aspm.c
@@ -1453,6 +1453,7 @@ static int __pci_enable_link_state(struct pci_dev *pdev, int state, bool locked)
 		down_read(&pci_bus_sem);
 	mutex_lock(&aspm_lock);
 	link->aspm_default = pci_calc_aspm_enable_mask(state);
+	link->aspm_disable &= ~state;
 	pcie_config_aspm_link(link, policy_to_aspm_state(link));
 
 	link->clkpm_default = (state & PCIE_LINK_STATE_CLKPM) ? 1 : 0;

-- 
2.34.1


