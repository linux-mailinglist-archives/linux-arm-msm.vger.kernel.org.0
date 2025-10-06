Return-Path: <linux-arm-msm+bounces-76122-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EB2A2BBFAFB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Oct 2025 00:23:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 737C83C4595
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Oct 2025 22:21:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 923C32DF71E;
	Mon,  6 Oct 2025 22:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bEZcXWu8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BC8C2135AD
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Oct 2025 22:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759789225; cv=none; b=YGuhk7e+yA2r9ifLeZ0vlDGILMY4yNURm8BY67sGB37coZw5b/nNJn+2pOeVPBU4OQlokYI7/N5440W2f1TK5yqNx75XuNCIL+IDpxIty9njHJsSnn1e0QwD/r6nXwTUMGQS++51yUk4ZbXUDLErqglWRb4CWP98AxUEUwqXx7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759789225; c=relaxed/simple;
	bh=KRfbO68RqNXGYUxEscJ9pAB4g2zVH9KTs2sCuSCOkhg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RnNgNb8JYaHLTdo00AhrgVgnZmCUNMGRmXhJrVZoL7lzB+cIOy0C5Jw94lHrOuCPB0Q2asEi8M7eLQKFpyxZkj9hgrnE/8ITwziR1Vdj7xDDcWv/DZlgAIcAzoQrWJUqWVbp03mWUzsr+igHQN1c9j23rlcMOYoxGUU3LAVeA8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bEZcXWu8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 596EpG7o001179
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Oct 2025 22:20:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=NVYsIQDhA8R
	ySLuD9P7ecPi4IEalfEg3vxqe/TJrcfQ=; b=bEZcXWu8NYn46iYEKSdylzHMVZy
	gooOnhtZQeHCkoXjGF/y0SKEH7q34nM08Ra7APR3HaFpGpUfSRnymRLhRyRsd5HS
	utkBW1Wvn10t51JG9uRC7wrN66j9X7nRK3RRlf7CB5GDWH9hLW0wdDKRqu2Iv1Ap
	zSSVk3Cpom/EAnpcJWyMYo6XNTHm454L4Ab93HbU7OagYHNByUwYFypcu+/6Mfpy
	EEl8724bZapd/NQKFvUMpcfEfZaBTT02iuaxcKfnACJsEg1DxtQoLZh3C6wi4tu1
	enmxOhzdg7rtPBqZWcDR+P7FiUizwnSLDgrL2rVCfZKZdaIX+84nShcPcNw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jvv7n8xa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Oct 2025 22:20:22 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-780f914b5a4so4779130b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Oct 2025 15:20:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759789221; x=1760394021;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NVYsIQDhA8RySLuD9P7ecPi4IEalfEg3vxqe/TJrcfQ=;
        b=FyKf6nLo1Q8GfRaMNfigKsV7NpcU9OCwmgORldFo8N1Iv4l++xXWgDIQ0kOfdnVSIg
         5A9oumCPnr14Qjzi01TkB9RBdo3YjkoJxU77aCpBfNSX6MZgA3lX1E9RsHGeCDQOE92D
         sgkzUdaArEVNaz2nz0iOr/NNhVxLAgMzcYoQa26nh1Cg6kwn0nPKObnKtsamgfG5w0hh
         OfdIqNpVqvYZqlX+uch4TBSMExxVZMtbfmWiz7KRjbcABcvezqwPgUTlmU9+fIBV56jT
         x+uUykr0jTBD2fVagHenuU34QuMitn4+I4RqcDsgKY5GjvSIZF8ET2CQ/0e3hcZs4vUK
         v8Mg==
X-Gm-Message-State: AOJu0YzSROA1wrdpL3GgSkceF0vUzfZrcjU4T/pFENosxS6GVPsFipZ0
	Nkgsuf02agoUilH6iVQf1eUKr+r2LuWWaZRc2lUtSlv+yPxZi24qJUdN9dcSRXCZvp7RrpMR/L4
	O/ZefcIpc/wSDtH9O+K7UWZIQ1d4CYEgPTU12EkpSuWjjj27kyZL1/b1Ec5d6QjDb4S6Z
X-Gm-Gg: ASbGnct5T8WGLjLshhdxGKGa5J/Ns2w4Pxi5yTFXMxmnN9Jv0VI58wjhwCbyD5VbV6D
	8wElpK+4JWMb8lRayI1009DTkz5cQL1xfV6BIpXMnMMe3BfwW3bGD2sDAyJhQP4nYCV9dbVzkOM
	VNeRjQA5IQ77+6VuHug2vYYnjsXCez3OmrjG8yg1W5EtydeLzNVdL0guY6cfD2tREEMJKWTVSG3
	I03iQz0sWJcbr9YyefFkYGUCHcyhdYGP55N5E57z1p5T7F1erMTngSHPMZQDkDFGNP7Mrj7ccg9
	8HUkhKaPnrmtKPYJ6Hn1DUUNp4HhlljcxoFzyZbySRduxiqcn/3JgwVEMH5MYq/Wxpyx4cr0dfa
	4xkiCwDulrp7ZyKa6hj87pQ==
X-Received: by 2002:a05:6a00:2ea7:b0:781:24ec:c8f4 with SMTP id d2e1a72fcca58-78c98d3303amr13937019b3a.3.1759789221382;
        Mon, 06 Oct 2025 15:20:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEmbjvu8YGs2epcEfo1RGDSZj+PsWdieVwkMJHJiW2v7Dd75B2hyrpkavb8BTk22/5l9Ds/9Q==
X-Received: by 2002:a05:6a00:2ea7:b0:781:24ec:c8f4 with SMTP id d2e1a72fcca58-78c98d3303amr13936990b3a.3.1759789220852;
        Mon, 06 Oct 2025 15:20:20 -0700 (PDT)
Received: from hu-wcheng-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78b01fb281bsm13734968b3a.37.2025.10.06.15.20.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 15:20:20 -0700 (PDT)
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
To: krzk+dt@kernel.org, conor+dt@kernel.org, konrad.dybcio@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com, kishon@kernel.org, vkoul@kernel.org,
        gregkh@linuxfoundation.org, robh@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Subject: [PATCH v5 10/10] phy: qualcomm: eusb2-repeater: Add SMB2370 eUSB2 repeater support
Date: Mon,  6 Oct 2025 15:20:02 -0700
Message-Id: <20251006222002.2182777-11-wesley.cheng@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251006222002.2182777-1-wesley.cheng@oss.qualcomm.com>
References: <20251006222002.2182777-1-wesley.cheng@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAzNyBTYWx0ZWRfXyZG75i862cVP
 sUBJFNxWjboCB1FI93zXKuFtLwTeuSt+g04EMuaUJM6oNacEqfUfeHaxAimN51E69+CFk9wvf2M
 VOQK9TjuN+NWvJYquTaOiH3pLmvnCpfoyfh7hxsfUBX2knjhbCexGEEa7FjSsc2zdYRaoo0Wj3c
 qsd/96gGNF6AZpXkdOJ7CzLzmtgmHeEKbnHHmQiD8tZdOhLRXo8azkUmdfKv2FHPwRCiQmKIekX
 8bDlFzfKV4RQV5KRRKN8VK0l+Vyh/aDN8e02Lmwe7TZCLX9F7N8z9LqyYRukWMoudTVblkC+Bx5
 QsyYEQYHNy9HCfHbcuHV+01ZxvBLPybej6JIrsLQyHoDW1Y4No3HAWg9J//a7q9D61vmn+u7DaO
 /iYXnooTn3BU/MOHYm/1DxmV87unow==
X-Proofpoint-ORIG-GUID: ftwqlChe8JVeUGSZjTvVsX3eHBr9oyhM
X-Authority-Analysis: v=2.4 cv=WIdyn3sR c=1 sm=1 tr=0 ts=68e440a6 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=Zq12RZiOzp0PcbRnEbUA:9
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: ftwqlChe8JVeUGSZjTvVsX3eHBr9oyhM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_06,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 bulkscore=0 spamscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040037

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

