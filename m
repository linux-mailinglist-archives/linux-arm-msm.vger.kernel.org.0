Return-Path: <linux-arm-msm+bounces-85003-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 48C85CB5110
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Dec 2025 09:12:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C9FBD304793E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Dec 2025 08:08:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4376E26E6F2;
	Thu, 11 Dec 2025 08:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RSN0/w5I";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JT31QZWc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E0B92D7DCF
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 08:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765440506; cv=none; b=SQ4+TSRmKVXO/AAY+UT0JEUdTxWbNdpefHplqch5pOigqpRWr7/4VIwEZyJXaQUvtaJ8gSDe0hLQuwLn2upuS2zp41vDhWpRtZQhC4kz5Bi0+L7csUA3dhKQogP//+WqoStJk0VX7qITYeUa+lMqMmeTfC7Jg+EDCTn9dFmudZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765440506; c=relaxed/simple;
	bh=NlkYir/8FyFGAiYAdCRjIV0OzLp9wJ6DPVi8SHRJWiM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SLyGyTTiwEHJBR+aIuRl9HPYSK+CgB/945QJInCqrj8jkVTrkslRDG/GW25nx37hHONpXY3QHHq/BeGgn3O0APKaXkEzWU9QxMGFBd+SMVzi2vkxpj9RoZaE4T8TNdnKvYOkzX1gzSwLTWura3xa6yq7/W/mqWe8Z7/KbPY4NxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RSN0/w5I; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JT31QZWc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BB6Pq9x466838
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 08:08:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sEqAoQ6r2H9xlzz5Ish61QOkHfPRwyn1MiXBkc9CYoY=; b=RSN0/w5IMZsSnDK3
	nC3IOj6rmC3fbGiwSvYl1mhxz44zknZCBJ6ET/IsMzLGajO3imskqdcFTqSMxcNi
	EzzQC50Px1r+FhGmb1+YfjBYlceheuH3gIdQdVEW0ICOkALic856lWTIKSsB1dsM
	e+JR6xI5NdPWaWoKSbe1oyCs7/YU8kJLR1INL9Fl6o0r7eB6ssov1O5Kd57Y7IHk
	5QdG08moUfCSxfFFqarivtDmnCLiFVsmEbJt+3bR1pnHP3TxGyy+mbgua350QMVw
	03WUWbiCKWJIwAZD9JRYnvHmrD/PQt7C3aQH+MMY2g8gsz8tRX/c0GezTR7OKZ8a
	i/nkbw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ayrpag8x6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 08:08:23 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7bad1cef9bcso1476631b3a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 00:08:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765440503; x=1766045303; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sEqAoQ6r2H9xlzz5Ish61QOkHfPRwyn1MiXBkc9CYoY=;
        b=JT31QZWcFxx3BhPiEHVZWw5Lb3PXXitkJZU1ycDfa1z/gbhHRLN6mXmCOQcAk5Y6/u
         aN5QsUBTY+Jvyfe/cwpHHJw5QwQjexkTWoMzPL5G22B3ecHi+PEO02b2hRIl3gUxiPEF
         R7f2g4+8ZeeVlEs3becyLaaJgStBEkKMRnUFCAMct1ruhxYCIznsHr+3UOA+Brd7c2yW
         Z5LRIxXLt4PZyxwwo3sRviadOkeljb47OdJd4VJQFufxalcvrhc4TItlV1yyiYzoaDSL
         r4kYlx9WdyRKKJbaYad8krPSGOIpwl5LgZow0mE5WtkIuarshyyXDwRQ/S998uhEL5k/
         G5BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765440503; x=1766045303;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sEqAoQ6r2H9xlzz5Ish61QOkHfPRwyn1MiXBkc9CYoY=;
        b=KNkZOOGEDNKjax7PZLzEnkXFkajnoGP39medcyalNdSS47x5fJQ7tDEFc6un5sWfEI
         gexAWxKRc2ipayHo+4lo7x7iaTPDljrPUwcqtcfQ+Rwb8Nf825ktXkAETOTdwdC7wGVJ
         EEKud+BBC4OWgqUh5/hlgzAyJLNYpp6/5PXjPF+uQ+HttEMRN5zKBBTDMxEHR+dE42V5
         YfbbWdIc3WHLAZw0wYs8oyR9GWpwZQUnN2+88WIhty3ilMenpyaHmKKrGJ9fMwfGONAL
         mUL0ruvFV40oa0MHqqYFRhKq27zXjdXvZsGPRHBF3EyzTL50mRGne9v/QKEr/EAuBTdE
         JbNw==
X-Forwarded-Encrypted: i=1; AJvYcCW+vVb2pcVVWKYnU04lHQx7FQSHMsc9hmj5nmuXmvl5592VuNzoPp91+F9DsbGRpUOa+NEOisiKjlcLORq1@vger.kernel.org
X-Gm-Message-State: AOJu0Yzwij8YWTARyhACymS2ot4ZxfQFSWbfXlwbIVmcqlSM2gTZ0FZ4
	U4JilgQYcjqk5X0LofGvedPkW7JaeFtnrauQ933cS34jPOj+uJijgIM2YiPYC2jRdO4OJujOXl/
	+UGvB4cAFA2P6BAMX73VYaGjPkYIbfIikIQ0c0+aJM/sK5jvbxxfsICRKNVOCdlvIbQhU
X-Gm-Gg: AY/fxX65ypdu/am6Gr4AYOVpG8tBch7lI1cCSDuFkY4EcGYhy8ihu4o5a9AQPXMexVj
	Lr2GO2GidC5wXuLvVvPyCWK32qcnkJQSEGjtxbDjVKgnWY+itTpXV8eWdmFDzGnkEpoZYIIGOt0
	odw7aecwZtvXGreIhXJvPqFUzgxUtKmrTbaNAaBjEfpyBdG+O+ErmWB8FycOQYJgAIlcrnkJgHn
	mpKH0n8q4kMwu/rAYOpaJxh41WmF6Tr8wE4MS/RrTjTSBjbmEyVPaVvQ+uHjdukqFrDvP0IbP6/
	QR1LAcd7rhroHpgP39mBg6JE1CmWLtpOw3Eq5lIftrmKQ7THVvyuVrmAM9ATWxxPZmRfHWPBQr6
	h6BOQjQqcCRHBSATAAAa0EweByerNhXhQig==
X-Received: by 2002:a05:6a00:2e09:b0:7e8:4433:8fa6 with SMTP id d2e1a72fcca58-7f22fce5eeemr4802196b3a.46.1765440502539;
        Thu, 11 Dec 2025 00:08:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEiruUeUEYn4y7Q6fF47vYHEYI1a037FrAEyvlnbDt6J8GZ6q+JMCJWeh+jPpIaF8t0y7RUvw==
X-Received: by 2002:a05:6a00:2e09:b0:7e8:4433:8fa6 with SMTP id d2e1a72fcca58-7f22fce5eeemr4802023b3a.46.1765440497814;
        Thu, 11 Dec 2025 00:08:17 -0800 (PST)
Received: from [10.213.102.126] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7f4c22848a7sm1706651b3a.3.2025.12.11.00.08.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 00:08:17 -0800 (PST)
From: Sivareddy Surasani <sivareddy.surasani@oss.qualcomm.com>
Date: Thu, 11 Dec 2025 13:37:42 +0530
Subject: [PATCH 10/11] drivers: bus: mhi: host: Add support for MHI MAX TRB
 capability
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251211-siva_mhi_dp2-v1-10-d2895c4ec73a@oss.qualcomm.com>
References: <20251211-siva_mhi_dp2-v1-0-d2895c4ec73a@oss.qualcomm.com>
In-Reply-To: <20251211-siva_mhi_dp2-v1-0-d2895c4ec73a@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        Upal Kumar Saha <upal.saha@oss.qualcomm.com>,
        Himanshu Shukla <quic_himashuk@quicinc.com>,
        Sivareddy Surasani <sivareddy.surasani@oss.qualcomm.com>,
        Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Proofpoint-ORIG-GUID: WjLCqihrdfzYoNvvnIiX54w50nFYoLcZ
X-Proofpoint-GUID: WjLCqihrdfzYoNvvnIiX54w50nFYoLcZ
X-Authority-Analysis: v=2.4 cv=G9sR0tk5 c=1 sm=1 tr=0 ts=693a7bf7 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=553Pgk6suP4-RYi8odAA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjExMDA1OSBTYWx0ZWRfX9/H2B4b0+NYF
 VBqU1VWfTu8nCiQxVKe4u/IB7lPA6vK/Rhw+8fiJ7Gq+RDdeQCf2AhtbPK4WwZYZKwUPUp0c6tT
 s7IXeRWvASSrM34AD42LMiseInIVfAbc+NEYhUBRdeo4lge5eLvoFwCrNkFBLqoUoDvzzOZWE4U
 jQH+S3DTHH7XaAJ+33a1Z8bg1NleqNA0fnfvRjPw5+wFyZmxppEuMke1FGgKnA0zIb8wzUTO72P
 5vSatEr4uQO9hIa/uKY1TUshK7f1atWJoNGNmBZgfTpamoR39jhxQnl19myT1EEbioZ54pyPSnI
 KENIPPZTthSGvjB374cDQC3UT/Wjs6eNJ4G91Iplg0U0pDmBVj85DlcyRs3prljvykRyFBzSOh6
 /JsafiUz5TXTnai+AWiqPeCCYFjzrg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-10_03,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512110059

From: Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>

Read the MHI capability for MAX TRB length if device is supporting.
Use this information to send MHI data with a higher TRB length, as
supported by the device.

Signed-off-by: Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>
Signed-off-by: Sivareddy Surasani <sivareddy.surasani@oss.qualcomm.com>
---
 drivers/bus/mhi/common.h    |  9 ++++++++-
 drivers/bus/mhi/host/init.c | 21 +++++++++++++++++++++
 drivers/bus/mhi/host/main.c | 17 ++++++++++++++---
 include/linux/mhi.h         |  2 ++
 4 files changed, 45 insertions(+), 4 deletions(-)

diff --git a/drivers/bus/mhi/common.h b/drivers/bus/mhi/common.h
index 3b3ecbc6169f..4962035f4693 100644
--- a/drivers/bus/mhi/common.h
+++ b/drivers/bus/mhi/common.h
@@ -158,6 +158,8 @@
 #define MHI_TRE_GET_EV_PTR(tre)		le64_to_cpu((tre)->ptr)
 #define MHI_TRE_GET_EV_CODE(tre)	FIELD_GET(GENMASK(31, 24), (MHI_TRE_GET_DWORD(tre, 0)))
 #define MHI_TRE_GET_EV_LEN(tre)		FIELD_GET(GENMASK(15, 0), (MHI_TRE_GET_DWORD(tre, 0)))
+#define MHI_TRE_GET_EV_LEN_MAX_TRB(max_trb, tre)    (GENMASK(__fls(max_trb), 0) & \
+						    (MHI_TRE_GET_DWORD(tre, 0)))
 #define MHI_TRE_GET_EV_CHID(tre)	FIELD_GET(GENMASK(31, 24), (MHI_TRE_GET_DWORD(tre, 1)))
 #define MHI_TRE_GET_EV_TYPE(tre)	FIELD_GET(GENMASK(23, 16), (MHI_TRE_GET_DWORD(tre, 1)))
 #define MHI_TRE_GET_EV_STATE(tre)	FIELD_GET(GENMASK(31, 24), (MHI_TRE_GET_DWORD(tre, 0)))
@@ -188,6 +190,7 @@
 /* Transfer descriptor macros */
 #define MHI_TRE_DATA_PTR(ptr)		cpu_to_le64(ptr)
 #define MHI_TRE_DATA_DWORD0(len)	cpu_to_le32(FIELD_PREP(GENMASK(15, 0), len))
+#define MHI_TRE_DATA_DWORD0_MAX_TREB_CAP(max_len, len)	((GENMASK(__fls(max_len), 0)) & (len))
 #define MHI_TRE_TYPE_TRANSFER		2
 #define MHI_TRE_DATA_DWORD1(bei, ieot, ieob, chain) cpu_to_le32(FIELD_PREP(GENMASK(23, 16), \
 								MHI_TRE_TYPE_TRANSFER) |    \
@@ -206,7 +209,11 @@
 #define MHI_RSCTRE_DATA_PTR(ptr, len)	cpu_to_le64(FIELD_PREP(GENMASK(64, 48), len) | ptr)
 #define MHI_RSCTRE_DATA_DWORD0(cookie)	cpu_to_le32(cookie)
 #define MHI_RSCTRE_DATA_DWORD1		cpu_to_le32(FIELD_PREP(GENMASK(23, 16), \
-							       MHI_PKT_TYPE_COALESCING))
+								MHI_PKT_TYPE_COALESCING))
+
+/* MHI Max TRB Length CAP ID */
+#define MAX_TRB_LEN_CAP_ID		0x5
+#define MAX_TRB_LEN_CFG			0x4
 
 enum mhi_capability_type {
 	MHI_CAP_ID_INTX = 0x1,
diff --git a/drivers/bus/mhi/host/init.c b/drivers/bus/mhi/host/init.c
index 50f96f2c823f..b0982cb24fb9 100644
--- a/drivers/bus/mhi/host/init.c
+++ b/drivers/bus/mhi/host/init.c
@@ -500,6 +500,25 @@ static int mhi_find_capability(struct mhi_controller *mhi_cntrl, u32 capability,
 	return -ENXIO;
 }
 
+static int mhi_init_ext_trb_len(struct mhi_controller *mhi_cntrl)
+{
+	struct device *dev = &mhi_cntrl->mhi_dev->dev;
+	u32 trb_offset;
+	int ret;
+
+	ret = mhi_find_capability(mhi_cntrl, MAX_TRB_LEN_CAP_ID, &trb_offset);
+	if (ret)
+		return ret;
+
+	/* Get max TRB length */
+	ret = mhi_read_reg(mhi_cntrl, mhi_cntrl->regs,
+			   trb_offset + MAX_TRB_LEN_CFG, &mhi_cntrl->ext_trb_len);
+
+	dev_dbg(dev, "Max TRB length supported is : 0x%x\n", mhi_cntrl->ext_trb_len);
+
+	return 0;
+}
+
 int mhi_init_mmio(struct mhi_controller *mhi_cntrl)
 {
 	u32 val;
@@ -637,6 +656,8 @@ int mhi_init_mmio(struct mhi_controller *mhi_cntrl)
 		return ret;
 	}
 
+	ret = mhi_init_ext_trb_len(mhi_cntrl);
+
 	return 0;
 }
 
diff --git a/drivers/bus/mhi/host/main.c b/drivers/bus/mhi/host/main.c
index 6be15297829d..a11bddce2182 100644
--- a/drivers/bus/mhi/host/main.c
+++ b/drivers/bus/mhi/host/main.c
@@ -648,7 +648,12 @@ static int parse_xfer_event(struct mhi_controller *mhi_cntrl,
 			buf_info = buf_ring->rp;
 			/* If it's the last TRE, get length from the event */
 			if (local_rp == ev_tre) {
-				xfer_len = MHI_TRE_GET_EV_LEN(event);
+				if (mhi_cntrl->ext_trb_len)
+					xfer_len = MHI_TRE_GET_EV_LEN_MAX_TRB(
+								mhi_cntrl->ext_trb_len,
+								event);
+				else
+					xfer_len = MHI_TRE_GET_EV_LEN(event);
 				send_cb = true;
 			} else {
 				xfer_len = buf_info->len;
@@ -664,7 +669,7 @@ static int parse_xfer_event(struct mhi_controller *mhi_cntrl,
 
 			/* truncate to buf len if xfer_len is larger */
 			result.bytes_xferd =
-				min_t(u16, xfer_len, buf_info->len);
+				min_t(u32, xfer_len, buf_info->len);
 			mhi_del_ring_element(mhi_cntrl, buf_ring);
 			mhi_del_ring_element(mhi_cntrl, tre_ring);
 			local_rp = tre_ring->rp;
@@ -1288,7 +1293,13 @@ int __mhi_gen_tre(struct mhi_controller *mhi_cntrl, struct mhi_chan *mhi_chan,
 
 	mhi_tre = tre_ring->wp;
 	mhi_tre->ptr = MHI_TRE_DATA_PTR(buf_info->p_addr);
-	mhi_tre->dword[0] = MHI_TRE_DATA_DWORD0(info->len);
+
+	if (mhi_cntrl->ext_trb_len)
+		mhi_tre->dword[0] = MHI_TRE_DATA_DWORD0_MAX_TREB_CAP(mhi_cntrl->ext_trb_len,
+								     info->len);
+	else
+		mhi_tre->dword[0] = MHI_TRE_DATA_DWORD0(info->len);
+
 	mhi_tre->dword[1] = MHI_TRE_DATA_DWORD1(bei, eot, eob, chain);
 
 	if (mhi_chan->dir == DMA_TO_DEVICE)
diff --git a/include/linux/mhi.h b/include/linux/mhi.h
index 013bc2d82196..0d78a95c2fa2 100644
--- a/include/linux/mhi.h
+++ b/include/linux/mhi.h
@@ -370,6 +370,7 @@ struct mhi_controller_config {
  * @wake_set: Device wakeup set flag
  * @irq_flags: irq flags passed to request_irq (optional)
  * @mru: the default MRU for the MHI device
+ * @ext_trb_len: Extended TRB length if device supports (optional)
  *
  * Fields marked as (required) need to be populated by the controller driver
  * before calling mhi_register_controller(). For the fields marked as (optional)
@@ -455,6 +456,7 @@ struct mhi_controller {
 	bool wake_set;
 	unsigned long irq_flags;
 	u32 mru;
+	u32 ext_trb_len;
 };
 
 /**

-- 
2.34.1


