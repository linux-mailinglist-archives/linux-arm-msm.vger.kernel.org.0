Return-Path: <linux-arm-msm+bounces-58398-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FB61ABBA17
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 11:50:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EF9FF3AF5BE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 09:46:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C71DD270ECE;
	Mon, 19 May 2025 09:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kKKAZkPI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30BE127056A
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 09:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747647780; cv=none; b=FKRx9C8UZ37iUnnoaxPTbaHwsybXw8J2TTpLIpOrUvhdrWyyLH3vxfkQdK9Mmr6Ch0TKHSS5JHMbAyaUT0A/FTeOSRrksWvuFz9MbZoDNGsmO19ZYXAbRxCbH4P2Duzw0it727aZ6tZ60k0t3lnSq8Ji2o+GhaY1ZpIfCCz4a2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747647780; c=relaxed/simple;
	bh=MfTQ3eSGE1lsQsEKDfhk3n4vHJQjv6X96tSeWcGlv9o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JdQsgdJLGqfLPE6VecDH2bYUZV7dQknh1Bmshq4G5F4KPkviVAvX3H1LBr3xqca17GI62omuZOKnMIX7cwseLHwXbqzHaNGbBKsR0UQiXt8x6YVwl77WRc45jYHPm/5fTcnuwd3XCFCdxgh/xlTg0RyVOJzFrbzYLb/ljnNVcrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kKKAZkPI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J9DCU6025567
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 09:42:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J1/73SEf4ytXoZ1yrIlcLZ+v5wHcPMuVTgw0lx2XQTo=; b=kKKAZkPI6RNDjmuv
	H7XiYRa14vGzrsv8xoWeuBl5p9PkYLjXZjfgj2farMRVSOKTrJvtAcSUOyZIA2Tk
	gr5SDApVc0yZ0cBJOS7SeY6oPQ2zdxwlhpK+ovGFSxvdjNjQCp2yQlZvREG2nawD
	FhG+siBqr34WwgYXCOik3NDK7Vhr+FWyQEbvuqCOabyK6CPzTJTSXuoO9u+NZ1j9
	gDskj05FmwZrVo3Q2wxMs2/6QkIJ6cW0LTb3BL1mSP03wku10Glv4rib8/lB9PTX
	bx7UU6sw14ByggecxvDtPmriXj7Yzje8EdBnYEVYZEwptYv8/jjYGF11UOUi9P4d
	bknKNg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pju7but3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 09:42:57 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-742c6140589so836210b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 02:42:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747647776; x=1748252576;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J1/73SEf4ytXoZ1yrIlcLZ+v5wHcPMuVTgw0lx2XQTo=;
        b=tODKACU0vLpsUbLpy2VvMyjN+9PYh0r/JGa/CX9uYbWdOb0RIO8/wMLJLj34YyHqy4
         s+5A+s2V9dRnIOxuzphY0WPQOYP/9cI3RCZF/CQjKqMPiIM3BRIUWUg/2Ok3isR3TZjd
         dRRmYnS1IlP/DqknhyErwC15I7h8verNigQX45+yyK4tiWicVXaEfoAU5sns2CW+IJk3
         QzJ3BN0Vjs0flLvZKeDPP0qaHXjmyB+Eh1zm6YzlD6CGJWTVnAewPXch2X9I8pd2POFI
         OwT+CF5IAz9zACySFbtqcXhMA0LtIqTNswz3E7/N8oq5xgmI2OnmWmm/i6dHcD5V6tCp
         9zGw==
X-Forwarded-Encrypted: i=1; AJvYcCUNaHxocHQcTW8LsuF3Yu8uScxkX1n1jeRx9XKvbIV3KIOSaCDON1Y1eJ/8Vnx4bOPVrkNcjkzly4IOTOq/@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6FpjSM9lJ4jFQIXGYYgs4RAomixV68LlbEXJVv+I1zfiNreZa
	mkeqaPwIY338csX8aBAzn9wFDfwmhk/f1PtlWIvBibTh2RTvGorzzkAt0Lm1b59rPt6dLxN2B+g
	mLnWF+rG0W+ZUoDCEfoIRxT6a8H9PFwD2jyanGAQeCxGwekwiRutVnFJvuRrYY17c6fvgtosIHN
	Gu
X-Gm-Gg: ASbGncstcD8rTm+qXtNfVZhnRzIPH//U1mJc3btK3rR5S6mkhhvufGhjUmmE8E6Pp6d
	p9F1ObpcRLjX3P2p9hi4wmL9FchzOP8MGR57fCOMJ/fatS1AZ9p0eCA3GQEEPMWFNxtW06jMTic
	m/ifTiUufuSTjy2khMzbB0JziKD/GfSFR2Oi0lnTH/Z2NwxP03otBhkO2AsBPUuUtFGAS6ZxoQV
	OKfjR6S/RqqFhZcKFHkp0aFqNjSGM/MUfU2oXE2cxoaIxxBCP6zDFTpuulibZ1k98ynCTewHBmV
	9M1axLZvo4OyLUlvTUmWdLcfSToA0KSCXFb/QFmSLKOyrRI=
X-Received: by 2002:a05:6a00:ac1:b0:736:3ea8:4813 with SMTP id d2e1a72fcca58-742a99fab76mr15619569b3a.2.1747647776271;
        Mon, 19 May 2025 02:42:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH6FoWtfS3J3KvBeQkijcvhEZQEo0F73rDNyaSDtfdrDQW3C1qk8ZesN/i6Mh3j6GEYFvr+HA==
X-Received: by 2002:a05:6a00:ac1:b0:736:3ea8:4813 with SMTP id d2e1a72fcca58-742a99fab76mr15619544b3a.2.1747647775854;
        Mon, 19 May 2025 02:42:55 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a97398f8sm5809092b3a.78.2025.05.19.02.42.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 02:42:51 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Mon, 19 May 2025 15:12:17 +0530
Subject: [PATCH v3 04/11] PCI/ASPM: Clear aspm_disable as part of
 __pci_enable_link_state()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250519-mhi_bw_up-v3-4-3acd4a17bbb5@oss.qualcomm.com>
References: <20250519-mhi_bw_up-v3-0-3acd4a17bbb5@oss.qualcomm.com>
In-Reply-To: <20250519-mhi_bw_up-v3-0-3acd4a17bbb5@oss.qualcomm.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
        Rob Herring <robh@kernel.org>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        qiang.yu@oss.qualcomm.com, quic_vbadigan@quicinc.com,
        quic_vpernami@quicinc.com, quic_mrana@quicinc.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747647743; l=1002;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=MfTQ3eSGE1lsQsEKDfhk3n4vHJQjv6X96tSeWcGlv9o=;
 b=Yem+nDFvzc6dsaIOAR4b6zXLoldPziYHuM1lIowV7FV6LiFHouh58R4R3CqoekwHVIv/w/HTI
 vxXIWwGg9BDBlBKkBDVhf2SY+qlPn4lRdA9jAvQfk0MP/izsfcAVMWG
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=XKEwSRhE c=1 sm=1 tr=0 ts=682afd21 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=JOcJ30pghDwnvxMqNTgA:9
 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: oGC48cqOHmfVdB7CIu-LQds0GCgMfvLA
X-Proofpoint-GUID: oGC48cqOHmfVdB7CIu-LQds0GCgMfvLA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDA5MSBTYWx0ZWRfX2aIl7lFKLSz5
 q6F6P2oZcrk4G6D2oPr4Y4Mt9u+8mRB3XprYHCMIqvoe8Gtf6Ekg/QqQWDAMWV06lH+0SPAsQRD
 uX2Z/ho02MRG/hMWhS1uA2Nm8CoIgGLcGKzETcUkXGgXVCQ7ypmZ0VmlZ+xcIEjxujcbWMTttFH
 s9w/rZIV5dEAFiJJRvq4rVXbJ8mCuohXVFD/vgFLt4G3WrBiX1A+4Wh8/T8pOZnlZKGcx8YH5Yz
 Gc0wsUlL0vttcij/wS2xWTniR/0wroNdehInN91CfJBcJHPCu0i3WbW85ppMBY/LWKJLORVE/3B
 iAckklUhr5dqPzMF54ahlRdWY5PPV0Ch6GO/brlegcm6Q2V7IkR+rZuYryzH1jFPxL8k7YiFmiT
 +sgquvoUrdC7TPHBNKICmYsbDgY4rCB4QaYVDwoZEF1zNSKsRP9jeerzBorQvwd0GjSCpObB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_04,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 spamscore=0 suspectscore=0 malwarescore=0 adultscore=0 mlxscore=0
 mlxlogscore=975 phishscore=0 bulkscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505190091

If a driver wants to enable ASPM back after disabling ASPM for some
usecase, it is not being enabled properly because of the aspm_disable
flag is not getting cleared. This flag is being properly when aspm
is controlled by sysfs.

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


