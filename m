Return-Path: <linux-arm-msm+bounces-37151-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 23BAC9BF5C0
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Nov 2024 19:52:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5F1AE1C20F6C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Nov 2024 18:52:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B71C209691;
	Wed,  6 Nov 2024 18:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="blP6g9jP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED27B209672;
	Wed,  6 Nov 2024 18:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730919034; cv=none; b=CPMj084srI+gmhiCDk1GDkDQhsMfRTttCnaGBHtPsDL0uaf/X5ikJ9InxiE/SFE3KckCkjPIDShMFMSqYOxQFJDAAkReKVOW+vxdoIgQwl5A5Am7+POus9fyQbbKkz1AMHa4LFpESDMTTf5aQN3Qhvx1MIgtKJ4U11SZ2SO87Fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730919034; c=relaxed/simple;
	bh=8EgA8/jKaQZYVGTitXQyp83fdWzIVo6bBfVUa4oHg3Y=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=LmFSqiHHgf3QIQwCb2Qrp0pU4al4gVlAkCTSo8bgrOq8hTIcGG+FUIVPi5IMbOOaPHtW7FBbrPJeiveR/+DQ+YZbdhjsXw158rTn3rlhoII5tMjOebWjgnNzqCyTOhCgKu+zELBBmp/8fubrrvPesrTVqylbXNQpr3dXdPQwqa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=blP6g9jP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A69sQLH003824;
	Wed, 6 Nov 2024 18:50:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=8Qz4numb2Xqkwjcg0wo71Q
	2hwwqXkB9PmX53vHJeawk=; b=blP6g9jP13Di1EXhhGiWuCpmdodBYSfQbeyz1h
	x8heLyCPndZjc+dOybBfrwFK7JDnYM890nrARzoLDvu/7+PUkgPoNXD4H07Ym4xv
	MB/0twXhOMUeZsl5vYtYoNzMW7DY+4BM4RZ8D/A9fTUkRCDGckBKwffTkMUco3+K
	FU8paOOkGaXAnJ3rTd5Ako3lZmZ3SmuuDSrEae08wtuRp8HZpQ5EN1HalaJXzQk6
	5AP7bT0N8uiXNja2qVfIyqatcMEynvPkWKYo5i6CbkXs/sCo5cfu+S8qsfEgt/Tq
	cx6UV3u3U9Df8Lhg0Y5daX9ODqgLD034UL1143zU2wD26z7Q==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42qhbucv49-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 06 Nov 2024 18:50:28 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4A6IoR9g006661
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 6 Nov 2024 18:50:27 GMT
Received: from hu-srichara-blr.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 6 Nov 2024 10:50:24 -0800
From: Sricharan R <quic_srichara@quicinc.com>
To: <andersson@kernel.org>, <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_srichara@quicinc.com>
Subject: [PATCH] clk: qcom: Remove unused freq_tbl definitions
Date: Thu, 7 Nov 2024 00:19:49 +0530
Message-ID: <20241106184949.801819-1-quic_srichara@quicinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: -ALZJ9h1aZkSbslwkKqhdg5F47gJrWdF
X-Proofpoint-GUID: -ALZJ9h1aZkSbslwkKqhdg5F47gJrWdF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=999 clxscore=1015 priorityscore=1501 adultscore=0 bulkscore=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411060145

From: Sricharan Ramabadhran <quic_srichara@quicinc.com>

Q6 clocks are managed by Q6 itself, hence ftbl_gcc_q6_axi_clk_src
is unused. ftbl_gcc_qpic_clk_src and ftbl_gcc_qupv3_2x_core_clk_src
are unused. Hence removing all the three.

Fixes: 21b5d5a4a311 ("clk: qcom: add Global Clock controller (GCC) driver for IPQ5424 SoC")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202411061537.anSkNwoR-lkp@intel.com
Signed-off-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>
---
 drivers/clk/qcom/gcc-ipq5424.c | 18 ------------------
 1 file changed, 18 deletions(-)

diff --git a/drivers/clk/qcom/gcc-ipq5424.c b/drivers/clk/qcom/gcc-ipq5424.c
index 3458c1c98bb7..88a7d5b2e751 100644
--- a/drivers/clk/qcom/gcc-ipq5424.c
+++ b/drivers/clk/qcom/gcc-ipq5424.c
@@ -494,11 +494,6 @@ static struct clk_rcg2 gcc_pcie_aux_clk_src = {
 	},
 };
 
-static const struct freq_tbl ftbl_gcc_qupv3_2x_core_clk_src[] = {
-	F(200000000, P_GPLL0_OUT_MAIN, 4, 0, 0),
-	{ }
-};
-
 static const struct freq_tbl ftbl_gcc_qupv3_i2c0_clk_src[] = {
 	F(4800000, P_XO, 5, 0, 0),
 	F(9600000, P_XO, 2.5, 0, 0),
@@ -954,13 +949,6 @@ static struct clk_rcg2 gcc_qpic_io_macro_clk_src = {
 	},
 };
 
-static const struct freq_tbl ftbl_gcc_qpic_clk_src[] = {
-	F(24000000, P_XO, 1, 0, 0),
-	F(100000000, P_GPLL0_OUT_MAIN, 8, 0, 0),
-	F(200000000, P_GPLL0_OUT_MAIN, 4, 0, 0),
-	{ }
-};
-
 static struct clk_rcg2 gcc_qpic_clk_src = {
 	.cmd_rcgr = 0x32020,
 	.mnd_width = 0,
@@ -1061,12 +1049,6 @@ static struct clk_regmap_div gcc_qupv3_i2c1_div_clk_src = {
 	},
 };
 
-static const struct freq_tbl ftbl_gcc_q6_axi_clk_src[] = {
-	F(480000000, P_GPLL4_OUT_AUX, 2.5, 0, 0),
-	F(533333333, P_GPLL0_OUT_MAIN, 1.5, 0, 0),
-	{ }
-};
-
 static struct clk_regmap_div gcc_usb0_mock_utmi_div_clk_src = {
 	.reg = 0x2c040,
 	.shift = 0,
-- 
2.34.1


