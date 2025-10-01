Return-Path: <linux-arm-msm+bounces-75729-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 98DADBB1F0C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Oct 2025 00:08:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 22E4D188A8BA
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Oct 2025 22:08:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 897D7313E32;
	Wed,  1 Oct 2025 22:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NcV4KpZY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7C692D9EC9
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Oct 2025 22:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759356357; cv=none; b=qMIc5FJQcrHK3Sdyacx5kcoF/q9vOmsSqSie5kPfcz4drAopsmkHmjqtoqAN/Cg9cv49Mnmd4r43RbelO9mraH42CvSjz5yXQQscd07cuxDVlR0mMnONm7JkRuXB0R30PmORlIDoLH00Rs+vF7WCPUyW98A0NFm7EnGKmYRG4Jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759356357; c=relaxed/simple;
	bh=KRfbO68RqNXGYUxEscJ9pAB4g2zVH9KTs2sCuSCOkhg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=EhLXV4/abPiW+YXcGEI5vKpkEjGzHovLtrwErdy+3v2GPhmx0MEW0tkif+5dB8I68BD49A+sal1+VUmWFhGKqHWTn9qJpPf/lER2p/UD1HntfljwiH/qwo9Ms/ELRXqTXURj6Yz5TAcm7IB+LG15V9FROGYvTz5JMGgcxJL9YU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NcV4KpZY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 591Icjgf024967
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Oct 2025 22:05:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=NVYsIQDhA8R
	ySLuD9P7ecPi4IEalfEg3vxqe/TJrcfQ=; b=NcV4KpZYz8Xya/lAqkwjI8Lx14D
	feryq2JW3z6hAaS8oD8wcT5f/SPxN0osxdtXPEIPBBnPB8NsFTfQR8bGh4MC66K6
	pzWZ14yvwe5T5aTtlwZKBG0E0J966qKCrqfDvGTgG1XASKrZe1KoxS7mdjHcofb3
	QoV19uLa0TZgpuVBo8j29s7ghiVIFIjxf7I0QWhP2r/Q9n/xEFeRZP850dG7gvd0
	rx+ZD2wV6Nuw9Jn02vfTDEPF6U6mtrvIgECbq1J9G4cnyh7pr8v0ZWW73PBTqg6D
	+41JHmW7wKFSUaWhK9HfSNXhdW/zTWuojaJQm1Ibm5378miKohr2XGeiOvw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e977wtyc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Oct 2025 22:05:53 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b57cf8dba28so262386a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Oct 2025 15:05:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759356352; x=1759961152;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NVYsIQDhA8RySLuD9P7ecPi4IEalfEg3vxqe/TJrcfQ=;
        b=KbtgZhp3s6/fSs3GiNhUIAXoPU3Mw0dEiGNs/f5LP/ZvtonPxEWi562n0OjbHc970g
         S4CwLI0gB/cDfJFDmbtxFz5uYD9G6hRHAXVlN+aY7BrVrAzy1QK0FbrtuPSNwXNZylsf
         efy64X1MoIRLNB4YRC1OCskEiiOX8bccsS9+dhME+xN9XLZ4uLx+oJxjtqpiFe+ujBSc
         VyZcPjxpmgO6bPnBKEx9sfhlyWv87tgfx+N3VRsYNsWeT1BlecI1sxpyWY2vxRjEGHeO
         ose7F/t/V/KBbN82KQgbcEqgnYV62+ht9S+UhzgVCzP4MKToYHIjP+0BwlgVjJAFcTlf
         pjJQ==
X-Gm-Message-State: AOJu0Yx2i5fTwg7Mkvk/K+9qB6xAyw8b8YzCemkttMA5Kimh5B+FWsPr
	cK9FrsSx00cDckYkZ14lWAuzEUGzxxkN2wzlbRZ/a9mKYv3mckg5P4jq39utSfcRYAjvDZteKFW
	2JBdU/IfLV0zixNTwmdO0kyJ60gZgmfWMOPt4XWEDdPzl/GjXbjM+SOZvyAB7tNLuJq3W
X-Gm-Gg: ASbGncsKRjE53iiE5uTn636AMlw7EB6LIQPTk0DT2dXyTQo9BEhNDNwvmGjebvJcqaD
	AEmi823FKNSOEa01lIzf/sveJiU/noNJ0DRYsJQ42+zGn1N5rCyEIyAYK1rKXnJUmRGYFVCazSn
	405HzXwi9I2qtaG8Hf5ChIEeNii0F2i7pVrNl5zgCf4XYzTpAAIFVFaR8dMiy41blrskv8Hqrwc
	/YHAEi3FEnnt0Qn3i8BF3fbr+fa6+OWg+xI2gCZCUaNocykC9N/1HW5mqRuEEcoKQOFSjsR5pAy
	DP3ZXrYwK7+HrB0+gWH+KrJTWdgyPp3FxwF4mpWpJsjfdr4Wf5Zvclz4JJmNjPl6PMbV3Ctturg
	aUbJlrfbWn+qyKrqIP+H9MQ==
X-Received: by 2002:a17:903:22c2:b0:25c:46cd:1dc1 with SMTP id d9443c01a7336-28e7f31092cmr55935935ad.33.1759356352127;
        Wed, 01 Oct 2025 15:05:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHqQqqXsWfsPcB2aMVgjy1eDaAlKWRk/y5Tw9L6ueOyV8a1NgF119HAYRfaqcXDXa4fmR6VmA==
X-Received: by 2002:a17:903:22c2:b0:25c:46cd:1dc1 with SMTP id d9443c01a7336-28e7f31092cmr55935695ad.33.1759356351699;
        Wed, 01 Oct 2025 15:05:51 -0700 (PDT)
Received: from hu-wcheng-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-339b4ea3c3dsm702085a91.5.2025.10.01.15.05.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Oct 2025 15:05:51 -0700 (PDT)
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
To: krzk+dt@kernel.org, conor+dt@kernel.org, konrad.dybcio@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com, kishon@kernel.org, vkoul@kernel.org,
        gregkh@linuxfoundation.org, robh@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Subject: [PATCH v4 10/10] phy: qualcomm: eusb2-repeater: Add SMB2370 eUSB2 repeater support
Date: Wed,  1 Oct 2025 15:05:34 -0700
Message-Id: <20251001220534.3166401-11-wesley.cheng@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251001220534.3166401-1-wesley.cheng@oss.qualcomm.com>
References: <20251001220534.3166401-1-wesley.cheng@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: s0aUjJvh6xALVDq0_ZuplzBkZFQWFCoz
X-Proofpoint-ORIG-GUID: s0aUjJvh6xALVDq0_ZuplzBkZFQWFCoz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDA0MyBTYWx0ZWRfX485nSDsfWgQO
 MmCpxcMfjAk2XP5vJ/5XkNoDvpa4cYan2VMuKhUju/UGCuMtNG3hKFU4JQhwMupT4G1sfttI9VT
 f+xaV9zWLHeyJaCPkK6yj5Y0vXJFMFVhFofgOthEKNON+uNZMLjaR8LZUUcKjet2I8E7Bz5hTYp
 pi/Q5r16o6WFbROyt4CR21CiwBhryafNz6BeXSJ6ygfasFZBIsZ4ndtjzHnBnSUlSZv3QucnvmA
 lxEqYGdw4jgP6JEGWOAFqVTaUfWsHLDinzfyO5Nv0+wqtymTqyD08oRuERWCvm4HfRuoi5VX6Mn
 6nER/OrpUIaTcoiQpkGMqCSOGJKxq3wjWj34MGFC1Lv7DgnUoZOx48fe06Jh6nXP7iVK/AnkAq7
 K1qCJeeUglr5HDSN7lKOZqNuYVmcvw==
X-Authority-Analysis: v=2.4 cv=Sf36t/Ru c=1 sm=1 tr=0 ts=68dda5c1 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=Zq12RZiOzp0PcbRnEbUA:9
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-01_06,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 suspectscore=0 adultscore=0 spamscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270043

Introduce support for the SMB2370 based eUSB2 repeater.  Configure the
proper repeater tuning settings, as if this is not done correctly, it
can lead to instability on the USB2 link, which leads to USB2
enumeration failures, or random disconnects.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c b/drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c
index 651a12b59bc8..441996480a67 100644
--- a/drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c
+++ b/drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c
@@ -75,6 +75,13 @@ static const struct eusb2_repeater_init_tbl_reg smb2360_init_tbl[] = {
 	{ EUSB2_TUNE_USB2_PREEM, 0x2 },
 };
 
+static const struct eusb2_repeater_init_tbl_reg smb2370_init_tbl[] = {
+	{ EUSB2_TUNE_IUSB2, 0x4 },
+	{ EUSB2_TUNE_SQUELCH_U, 0x3 },
+	{ EUSB2_TUNE_USB2_SLEW, 0x7 },
+	{ EUSB2_TUNE_USB2_PREEM, 0x0 },
+};
+
 static const struct eusb2_repeater_cfg pm8550b_eusb2_cfg = {
 	.init_tbl	= pm8550b_init_tbl,
 	.init_tbl_num	= ARRAY_SIZE(pm8550b_init_tbl),
@@ -97,6 +104,13 @@ static const struct eusb2_repeater_cfg smb2360_eusb2_cfg = {
 	.num_vregs	= ARRAY_SIZE(pm8550b_vreg_l),
 };
 
+static const struct eusb2_repeater_cfg smb2370_eusb2_cfg = {
+	.init_tbl	= smb2370_init_tbl,
+	.init_tbl_num	= ARRAY_SIZE(smb2370_init_tbl),
+	.vreg_list	= pm8550b_vreg_l,
+	.num_vregs	= ARRAY_SIZE(pm8550b_vreg_l),
+};
+
 static int eusb2_repeater_init_vregs(struct eusb2_repeater *rptr)
 {
 	int num = rptr->cfg->num_vregs;
@@ -278,6 +292,10 @@ static const struct of_device_id eusb2_repeater_of_match_table[] = {
 		.compatible = "qcom,smb2360-eusb2-repeater",
 		.data = &smb2360_eusb2_cfg,
 	},
+	{
+		.compatible = "qcom,smb2370-eusb2-repeater",
+		.data = &smb2370_eusb2_cfg,
+	},
 	{ },
 };
 MODULE_DEVICE_TABLE(of, eusb2_repeater_of_match_table);

