Return-Path: <linux-arm-msm+bounces-51281-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DCDF0A5F2BE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Mar 2025 12:44:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 10A5C16CFFF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Mar 2025 11:44:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30333268680;
	Thu, 13 Mar 2025 11:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Eg5R5OUd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ED5C1FAC5A
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Mar 2025 11:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741866084; cv=none; b=f6r61oYuXlOMjno0cokAKV0gUAsTCtn/2nl6jW7fZHCyPkEN1ql9fA2kaTa9kBkU6fEF3yypmI7XQo/ncC6MDdlc2XNvJTYyF2fdmlIUkf3LzYVGrzyPENG3nJmwINMFV0uJ6b5z0hNpnThDqhzd54s8bucZY1fTN5rK6bunAL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741866084; c=relaxed/simple;
	bh=YqqLhB2sDmeRf0yvSJdYtwvNNWc93ZsNkQgc1bLXWOA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e1gKTnTIld/jG1hnx3CDR1DK3ivsOj9DGMPhE7spfD3vEGdxQlG6c2YJAPqU9/2PRWbkLSWvAjEuHJ3NxJnGEnkEUQxZIHvbexQLEJEzjU4HvwUWhRSYRL5sTKoQgLykHIPuuQSU6woNiQC6ckRGzcF9UqwYBECqUH3INseN7vY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Eg5R5OUd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52DAImaE009124
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Mar 2025 11:41:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b66c7trNFzZoQyrgHszRHq0+mVYbdCkWT7Z8WHwPyWo=; b=Eg5R5OUdQy8jNCEN
	0VRV4pCIdH2ZAv4vYoi8UxipxY+HxxUIvBIxlkFhfNyJLpZ++iaUASj9L7nnAKuk
	9agqdC9uTJnmnfiTgx8boHYqwtafRDLhGII1MBBD+Cf46BUB/+L+8cXelXc7tUCh
	0gB6G+j1Wo55WTPJZbU2JGfy7tlR0MMWMeS4qtBCqGVz7oOHctsA6KQQYS9nQJT/
	yM5UWOizBiQo8K+5Hh54P0xzQiCBHLiyBL77UxjHcjUSvlWX1bNMGnltvV0drNT4
	ntTGelCrpYvOLN1wKu+yDx+i5bSt1j02XN90i4+GJyqOqItDeCVBWyj59vcN7Ek/
	RCdQZA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45au2rdp75-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Mar 2025 11:41:21 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-2ff581215f7so1566292a91.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Mar 2025 04:41:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741866079; x=1742470879;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b66c7trNFzZoQyrgHszRHq0+mVYbdCkWT7Z8WHwPyWo=;
        b=j8VVRuy/MNZcX8hDzTfkstcL9aW2fsAH6aBITnBJP8kceiOpiP88Yvz1YIguKgDu3f
         3ZeNqxtKoOkfm0Lb20lbk10UHvHxVL7UiDj/hpUAcbIce/3Y0sBwUxL0JDcnwzzZH6zD
         cjGHUcYytAeANigjYO/t3vqfvvHNHgTbt+jn5jdkNmpYIqzZ5yQ5j0b96/ZUuD6K87U/
         jzAhFsCeCmNIS1M0gicb7btu0Gzh/hGR8FeLCvHx4AHOWUoP1g9KAWFbgdnzyBJ5fKlQ
         +lRhdfl8wePLvbr0Vi8qizFPbPxRPcl0gYHIjbhWD1dhlPGB3A0H4uOIojHjcAv+2K+J
         rlOQ==
X-Forwarded-Encrypted: i=1; AJvYcCUx/mCbAWGu/BGPA/UUMzc0V1dqcywa6VBxF2r8mwCP1rvFCW96a+oK5h/JC9k+m4m/zjxj2i3z7XpQh287@vger.kernel.org
X-Gm-Message-State: AOJu0Ywp7LgF/7JqjlQxuKg9ZAh12CRTh9wcAPyTIq8KblgltUowL4CV
	mY8wR3GblPynWc5Uv1x6QKC7klkhzGDUpLMWs+Js8FlgetwYHJz6bJFENCd1cLv5CdSmWngjtRc
	1PsVo9G+r00F/dCaNVVHlOavd6mieiWNiCBzKdLf6DJzbBb5cyyTYJwANwru4hN/b
X-Gm-Gg: ASbGnctstyUyKIE63u+IHMFDWEe113eu/QcW2D5k3Ox/Pt7DnwiDov00CN8Bgs/s31y
	rGpTT7MaJYbU7KbjnqpHAoa2wLdZU0wdEh6RmdyoEtxbAa4mK1AKUoZxbOAqiUYKIQynQaAEtA+
	cRwow/qFIhepzuib/eNc2FeiM1Wm3jkmve1ppdavvLfraS62KsT9uxqB21wBBlbsAKcfUuBrcic
	g7xL2hkZLPfmA4y/+7Kl1qpOxKAohc8L5Jc3fNjeKNXFdZX9A/s6+HsgtKRNJGMpPg5Vp815/CS
	TBp1fYwBczoeWpJ6XbpuaX0KFPsW88/nLN0Yzqo5eCo5spTsOjs=
X-Received: by 2002:a05:6a21:150d:b0:1f5:51d5:9ef3 with SMTP id adf61e73a8af0-1f551d5a599mr32029797637.20.1741866079490;
        Thu, 13 Mar 2025 04:41:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHyqb7Zqga/alnBVVjkfYTwBJb/FL7B8cMycyybsa0F6n3AwQrzJM7hwVPKpY5cioC6dQOrZQ==
X-Received: by 2002:a05:6a21:150d:b0:1f5:51d5:9ef3 with SMTP id adf61e73a8af0-1f551d5a599mr32029748637.20.1741866079107;
        Thu, 13 Mar 2025 04:41:19 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af56ea964e3sm1063219a12.76.2025.03.13.04.41.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 04:41:18 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 13 Mar 2025 17:10:13 +0530
Subject: [PATCH v2 06/10] bus: mhi: host: Add support to read MHI
 capabilities
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250313-mhi_bw_up-v2-6-869ca32170bf@oss.qualcomm.com>
References: <20250313-mhi_bw_up-v2-0-869ca32170bf@oss.qualcomm.com>
In-Reply-To: <20250313-mhi_bw_up-v2-0-869ca32170bf@oss.qualcomm.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
        Rob Herring <robh@kernel.org>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        quic_pyarlaga@quicinc.com, quic_vbadigan@quicinc.com,
        quic_vpernami@quicinc.com, quic_mrana@quicinc.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741866038; l=2486;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=nMXDxyNhjI58pEdLUQqctmcAdSRLINO8la+ypV3eSj8=;
 b=IQFrsWjbiSFkhhFBnz/9ECFoXIf7GbLmM1L6/nMA8GY8bq3hdf6o2GCxsl0IkRddYfEnufKMF
 7l0la06C7++BPXkI71ClW+XSU+tDbkr2gtqK0EIF/oHROpwpoeEt/nS
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=D6NHKuRj c=1 sm=1 tr=0 ts=67d2c461 cx=c_pps a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=8tVK0NU1EB3xojDYR3gA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: Afh0jfBVjrfPUJCWD2R1mMBATv-hr4uR
X-Proofpoint-ORIG-GUID: Afh0jfBVjrfPUJCWD2R1mMBATv-hr4uR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-13_05,2025-03-11_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 priorityscore=1501 mlxscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 adultscore=0 malwarescore=0 mlxlogscore=999 clxscore=1015 impostorscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503130092

From: Vivek Pernamitta <quic_vpernami@quicinc.com>

As per MHI spec sec 6.6, MHI has capability registers which are located
after the ERDB array. The location of this group of registers is
indicated by the MISCOFF register. Each capability has a capability ID to
determine which functionality is supported and each capability will point
to the next capability supported.

Add a basic function to read those capabilities offsets.

Signed-off-by: Vivek Pernamitta <quic_vpernami@quicinc.com>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/bus/mhi/common.h    |  4 ++++
 drivers/bus/mhi/host/init.c | 29 +++++++++++++++++++++++++++++
 2 files changed, 33 insertions(+)

diff --git a/drivers/bus/mhi/common.h b/drivers/bus/mhi/common.h
index dda340aaed95..eedac801b800 100644
--- a/drivers/bus/mhi/common.h
+++ b/drivers/bus/mhi/common.h
@@ -16,6 +16,7 @@
 #define MHICFG				0x10
 #define CHDBOFF				0x18
 #define ERDBOFF				0x20
+#define MISCOFF				0x24
 #define BHIOFF				0x28
 #define BHIEOFF				0x2c
 #define DEBUGOFF			0x30
@@ -113,6 +114,9 @@
 #define MHISTATUS_MHISTATE_MASK		GENMASK(15, 8)
 #define MHISTATUS_SYSERR_MASK		BIT(2)
 #define MHISTATUS_READY_MASK		BIT(0)
+#define MISC_CAP_MASK			GENMASK(31, 0)
+#define CAP_CAPID_MASK			GENMASK(31, 24)
+#define CAP_NEXT_CAP_MASK		GENMASK(23, 12)
 
 /* Command Ring Element macros */
 /* No operation command */
diff --git a/drivers/bus/mhi/host/init.c b/drivers/bus/mhi/host/init.c
index a9b1f8beee7b..0b14b665ed15 100644
--- a/drivers/bus/mhi/host/init.c
+++ b/drivers/bus/mhi/host/init.c
@@ -467,6 +467,35 @@ int mhi_init_dev_ctxt(struct mhi_controller *mhi_cntrl)
 	return ret;
 }
 
+static int mhi_get_capability_offset(struct mhi_controller *mhi_cntrl, u32 capability, u32 *offset)
+{
+	u32 val, cur_cap, next_offset;
+	int ret;
+
+	/* get the 1st supported capability offset */
+	ret = mhi_read_reg_field(mhi_cntrl, mhi_cntrl->regs, MISCOFF,
+				 MISC_CAP_MASK, offset);
+	if (ret)
+		return ret;
+	do {
+		if (*offset >= mhi_cntrl->reg_len)
+			return -ENXIO;
+
+		ret = mhi_read_reg(mhi_cntrl, mhi_cntrl->regs, *offset, &val);
+		if (ret)
+			return ret;
+
+		cur_cap = FIELD_PREP(CAP_CAPID_MASK, val);
+		next_offset = FIELD_PREP(CAP_NEXT_CAP_MASK, val);
+		if (cur_cap == capability)
+			return 0;
+
+		*offset = next_offset;
+	} while (next_offset);
+
+	return -ENXIO;
+}
+
 int mhi_init_mmio(struct mhi_controller *mhi_cntrl)
 {
 	u32 val;

-- 
2.34.1


