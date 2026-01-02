Return-Path: <linux-arm-msm+bounces-87177-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F3F08CEE175
	for <lists+linux-arm-msm@lfdr.de>; Fri, 02 Jan 2026 10:44:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3D808301D0FB
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Jan 2026 09:43:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4EBC2D838C;
	Fri,  2 Jan 2026 09:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Rx7sDcN1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N/0rG5kq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30C8D2C3278
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 Jan 2026 09:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767347027; cv=none; b=k6rsR16G/b/+ocKY4J15nWkxhpbcK7fVv70TF6+B1DTvCsLEVJLKZmu8v5A0EOTWWTGZ3KKdpuByqZzL+6MU+Aqk0dlGTsVPDvWtcjxHi6CLLSkIksZIh7TxEeN8ndt/CtUgG/9soQJCLW0czwf/lBX4rI7dUnSCPUcmttl07AE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767347027; c=relaxed/simple;
	bh=za17AyB+OVyeZLPZNTqwYBIrPw/xf4d5/jl5MyUbBm0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D0b0a8owYWKmF0Re9qQidtFOFybUVNlgpJA6LDJ5boGju7DlQ6yGLfse/YuZgF3T1A3l2wBSyMwW5b9eWmRaUSvlf+dX51hPo2E6bOsMRPQOqI3CWs+D4ycWHnCIRZ/WeRQVCNFG67YDhxwX4575YGRjwT61RGZZ4KGM4OxsHBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Rx7sDcN1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N/0rG5kq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6029Vvp2808919
	for <linux-arm-msm@vger.kernel.org>; Fri, 2 Jan 2026 09:43:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V6AViQbxqIjmWyoB7J5651UUNS9Vltag56jF+QUUjts=; b=Rx7sDcN16xgEg9NZ
	O/JlvYTDierU4FrvSARTnsmy7AkUmdwMI+335Ie0NpnBHpJuGn5/NZdrW/17r9p3
	bvqbd79x8eArbzRvFt+xxdDP4r9k00No6D7ob2edjsKAOb+uTp18LtP4HWUZd23t
	FtptWE79hfDa4jSmRkDMVYvGSBXG2gwiYRAEy0sbDFaUnsrN5BLTan453HWsmcXd
	Hj3TVKPKtVRPU6/vwAiTxfZw3krbJrx0X9pjYMiOpvOADQur9iE5kjq+FXp0zPws
	49bzS3O6pWPcBDF2TIdwkceMPi//N1K8i/6tRt5jCtBPzf7ikexCI5YYozFPXByE
	osyuiQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bcy6am1gc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 02 Jan 2026 09:43:44 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-29f27176aa7so258196055ad.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Jan 2026 01:43:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767347024; x=1767951824; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V6AViQbxqIjmWyoB7J5651UUNS9Vltag56jF+QUUjts=;
        b=N/0rG5kqy/R6s46/kHzLNTMbvitWwFLh9RRTvlgsAYRbNKIkQdzk1vE7Yb6w7TFlGf
         Mvq7SI1OU44Uzp6qGagf5xNGktZqdvYytbiE3tgwUzHqz+vB/MWJKoIs65CgMWQMlOqZ
         zHgTdxyxiPDQ2Pc8FlSl7T/fjBUX93vtc2x1fZG9Jw7tc9C4NZrVhMDeXe9SuVTfOPq5
         P7xLy9UgkQq2J8boxCTGSVoE2QceklBXLOXJbBE2RY0rN0FIp9zr+uHP/uL4bWoaY2Lg
         0RQsd08WgWM42tbw5Si/IsZRQsiqZCnr9tW+PkoiLlAVtms8j+288eV5Mv4tUme4HgOh
         EufQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767347024; x=1767951824;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=V6AViQbxqIjmWyoB7J5651UUNS9Vltag56jF+QUUjts=;
        b=HTeSVIX2bzSBo3F1tZraZUTcpx+leSzTksg1Z9zvSJqIqI0jkhZVUYseiCEUxbJJn6
         QXe/0kV5w3DvuI3Ea+psKlgyyCfn+akwSbHPWVdZZh/zz4Gl8tk2vrBdZkuK8I60ZxOU
         cI1Q7I1ovIdEIFGRqkUdnpzKiSK1F/9Vwa3QUKWmPN9wtwuJrwHeLx+RCVbeOr+WgPec
         A9NTkiUXNHvthUMzNgYKra+Q6HrMoCtq2iGUhbQ2cSo9Lq0Vg4STS8Y8M30QXEOKrp6k
         OjhIuMTd3iq/UjUtbuH8RLd/jMxicWPPioqPn1pqruqAzj1PIOqxBfdenOg6y13Npfxj
         hixA==
X-Gm-Message-State: AOJu0YzFG0+MnlLD6lMSPoKOnTWb3kH3fcynSst1SIqe9MTfSi8C5WyD
	lAqf9HCbhVPaBs5Yy/Jb6rJcYZwvp0zkmZHLUfuGUbqqHGuAKjnTfGbkKWiXF/wy0/KtX2PgZEr
	eMI2jYUBLU4w8kVsRd2NLBIeCbyyb5PmxjQ/5Yj2Kf2sVlRm8LrpzbEW2XDhWQy2KGKPi
X-Gm-Gg: AY/fxX7rVyD+DK1IOlqGjv1OqB4Ve35bIzK3qEr7au9bjIOraEeMdZhSvNYoIDc7xmu
	kaB8Xuph7SOLCit51kGQdLrptEsGvdXW2CpnJoW7uAHWB13UzGRdayqVhqEv0+wp4FbpXi2pi/m
	J3iyxMHFp3WFsrGrBeAfzZjHYP+bYQQBBvJN/Ep210knTPZCBMxBkpfvqrUfm5KC4smxP7iEBrd
	1gLgc5FYiYyqkhTj4dpEyo/AA/UK6+RlaEL2qSD7k7Z2H8x/jvEV9GP0m9ZfrvcREiMbJn7C4bg
	9prjBqW+0YtFge+Hd1GGMks5Tc8BGJFS+QNwuhfONjYL45qK6XTnggwaIZaWK1dPh9333pAoPbr
	hk1VBzfANQfMrcKYsMJIxZnw70+Y6SwF9fgqKk90GzrVf
X-Received: by 2002:a17:902:ce82:b0:2a0:c1ed:d0d9 with SMTP id d9443c01a7336-2a2f29359b3mr405469905ad.46.1767347023952;
        Fri, 02 Jan 2026 01:43:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGEidZlQEw2lZuB/a9A1tSdgI/rgTD2eYdotce7/zJyLNRyh1DHBKjtZsDc7imB5NUctN0yew==
X-Received: by 2002:a17:902:ce82:b0:2a0:c1ed:d0d9 with SMTP id d9443c01a7336-2a2f29359b3mr405469765ad.46.1767347023495;
        Fri, 02 Jan 2026 01:43:43 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c66829sm376154255ad.10.2026.01.02.01.43.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jan 2026 01:43:43 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Fri, 02 Jan 2026 15:13:04 +0530
Subject: [PATCH 4/7] clk: qcom: gcc-glymur: Do not turn off PCIe GDSCs
 during gdsc_disable()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260102-pci_gdsc_fix-v1-4-b17ed3d175bc@oss.qualcomm.com>
References: <20260102-pci_gdsc_fix-v1-0-b17ed3d175bc@oss.qualcomm.com>
In-Reply-To: <20260102-pci_gdsc_fix-v1-0-b17ed3d175bc@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Shazad Hussain <quic_shazhuss@quicinc.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        manivannan.sadhasivam@oss.qualcomm.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767346994; l=2871;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=za17AyB+OVyeZLPZNTqwYBIrPw/xf4d5/jl5MyUbBm0=;
 b=I1uC5RFV0qWbiD9rxeFWOBy+/xhlePZID/MCvmI9h6Rgwup6M6VvJhkQbEM1/Wj0OCPz3TDb1
 Ld0VVOBH/hJDrC2RAjJzg76gwUSycPdFg+ke2a5u1LLhtgXF2hxfnBN
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-ORIG-GUID: OVxEYxxyX_gyULeOgLEVaTdzzuaiCzpD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAyMDA4NiBTYWx0ZWRfX4J5Rvu3ex/00
 PZ/jISU+SdHWclRy37KttM90j2PWcvRpatIv4m3hJZ4RsDg+DhzgAEy3SB0aRPo6OG/WB5LEYiz
 eIpcAE3FfuSHeWRWc+PSeC0fh6PYEk/QMuaYVhbXBlC6YECInowLZk6KyPT3qDLCFFPRfdE2Z9C
 eaEyWdYiSg8mqqi2W2cYCKfAAtPW0lKx2oR3BovkSqUe5mhJ68DdSo9H0M2s7YkqwdlT8Ifdld5
 /cPQ3JYGTFrTxeA+D1nbNY6GB4UWDWtMwE531mKd4IfIsSEF+fHbelihLLuhyBpoju5e1bMnwP7
 /LKcgDl7UmCrajMqOEkT5qKjuNAfPRS685pfqE+kBZQlgN+G94phQ9I3bX+QP6y/lwtNuf1lUPR
 gzZwrZ4UK4GDksfNssMjEscSRaSetU3Q8N7fMxZyKlz+RAxuW7uPk9fp4doSshSiYCkWsL3LZ1H
 uBkyFkHdEvqymNdXXpA==
X-Proofpoint-GUID: OVxEYxxyX_gyULeOgLEVaTdzzuaiCzpD
X-Authority-Analysis: v=2.4 cv=J9GnLQnS c=1 sm=1 tr=0 ts=69579350 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=APsdKiKIpUGVn09es9MA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-01_07,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 adultscore=0 impostorscore=0 spamscore=0
 suspectscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601020086

With PWRSTS_OFF_ON, PCIe GDSCs are turned off during gdsc_disable(). This
can happen during scenarios such as system suspend and breaks the resume
of PCIe controllers from suspend.

So use PWRSTS_RET_ON to indicate the GDSC driver to not turn off the GDSCs
during gdsc_disable() and allow the hardware to transition the GDSCs to
retention when the parent domain enters low power state during system
suspend.

Fixes: efe504300a17 ("clk: qcom: gcc: Add support for Global Clock Controller")
Cc: stable@vger.kernel.org
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-glymur.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/qcom/gcc-glymur.c b/drivers/clk/qcom/gcc-glymur.c
index 238e205735ed594618b8526651968a4f73b1104e..5c66c1264f35b083d046d2c11f430f0f113001ef 100644
--- a/drivers/clk/qcom/gcc-glymur.c
+++ b/drivers/clk/qcom/gcc-glymur.c
@@ -7647,7 +7647,7 @@ static struct gdsc gcc_pcie_0_tunnel_gdsc = {
 	.pd = {
 		.name = "gcc_pcie_0_tunnel_gdsc",
 	},
-	.pwrsts = PWRSTS_OFF_ON,
+	.pwrsts = PWRSTS_RET_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE | VOTABLE,
 };
 
@@ -7659,7 +7659,7 @@ static struct gdsc gcc_pcie_1_tunnel_gdsc = {
 	.pd = {
 		.name = "gcc_pcie_1_tunnel_gdsc",
 	},
-	.pwrsts = PWRSTS_OFF_ON,
+	.pwrsts = PWRSTS_RET_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE | VOTABLE,
 };
 
@@ -7671,7 +7671,7 @@ static struct gdsc gcc_pcie_2_tunnel_gdsc = {
 	.pd = {
 		.name = "gcc_pcie_2_tunnel_gdsc",
 	},
-	.pwrsts = PWRSTS_OFF_ON,
+	.pwrsts = PWRSTS_RET_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE | VOTABLE,
 };
 
@@ -7683,7 +7683,7 @@ static struct gdsc gcc_pcie_3a_gdsc = {
 	.pd = {
 		.name = "gcc_pcie_3a_gdsc",
 	},
-	.pwrsts = PWRSTS_OFF_ON,
+	.pwrsts = PWRSTS_RET_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE | VOTABLE,
 };
 
@@ -7707,7 +7707,7 @@ static struct gdsc gcc_pcie_3b_gdsc = {
 	.pd = {
 		.name = "gcc_pcie_3b_gdsc",
 	},
-	.pwrsts = PWRSTS_OFF_ON,
+	.pwrsts = PWRSTS_RET_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE | VOTABLE,
 };
 
@@ -7731,7 +7731,7 @@ static struct gdsc gcc_pcie_4_gdsc = {
 	.pd = {
 		.name = "gcc_pcie_4_gdsc",
 	},
-	.pwrsts = PWRSTS_OFF_ON,
+	.pwrsts = PWRSTS_RET_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE | VOTABLE,
 };
 
@@ -7755,7 +7755,7 @@ static struct gdsc gcc_pcie_5_gdsc = {
 	.pd = {
 		.name = "gcc_pcie_5_gdsc",
 	},
-	.pwrsts = PWRSTS_OFF_ON,
+	.pwrsts = PWRSTS_RET_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE | VOTABLE,
 };
 
@@ -7779,7 +7779,7 @@ static struct gdsc gcc_pcie_6_gdsc = {
 	.pd = {
 		.name = "gcc_pcie_6_gdsc",
 	},
-	.pwrsts = PWRSTS_OFF_ON,
+	.pwrsts = PWRSTS_RET_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE | VOTABLE,
 };
 

-- 
2.34.1


