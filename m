Return-Path: <linux-arm-msm+bounces-82135-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 51D06C65264
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 17:31:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id C29EF381EF1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 16:24:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 845EF29E117;
	Mon, 17 Nov 2025 16:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="COZz9BkX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SXT4idqW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA117273D75
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 16:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763396583; cv=none; b=fba7cbIAalAdDw89sl2EYaXjwAKWnkEw3PzjNlJrWsUNoTuv01etXm/RG3L/QZZIeuXLFxY4/cwAaobMlUKprMBg9+6o1Vm9RtzCtO2SGtY4UyRbtUu2Ln8RQ9CoU5o4JixkaHtI/GS7OlodJri09qw5htnjLK5XOR4vrN1DAJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763396583; c=relaxed/simple;
	bh=GRv+OgmZqr9WuANHSfZbS1DVJRHeOc4x/LMiQstDn6A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Jt4PQAucRulu1EnS1vdQLcELeY0LYWvfqprqnLDdkDx/kZu+EzFPd8OQuKbqinkXK+2Fwo5U8EjkJinAleXECwHIIcoKP+XE/C/skuwVY0Xh7/wjbudEE1Lnq7afO63Q3xcPQGwmmxca3FwfVdFGQeACANVnkX2R1JvI5fpx4lM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=COZz9BkX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SXT4idqW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AHB3apF3517236
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 16:23:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=GEDPf0dSRA/rIzrOWNr3jG
	W8qWLig0SWtECgPvdVTyY=; b=COZz9BkXb9rf1XTzfE9LoixR0PeRSoDVhPethN
	RbS+9v66pe8d+PVPrqExinNHR6a9/9gfxQ3dILAo/Csl0HY9d2vmdwkpncEHuX29
	fm7nm9MIhHAcUFdih/9c63ibERLHQTTTkObt3m7UXm2nyZwgi6VEzDRl2YK/eOo1
	ClqXPtkxAvyyciUk9Chg1btUKH0qNKqB655458CSmTEdaGCvtyAic+74/KSsmt7x
	rCe9Ee+YFrO6IOmH42+/hjbBzOCYVTJY6KTmqb2fWPeaKeDAzQKwko1aRME5SZrV
	mJWhOmTzIjMHLtAOJrab1hH5/DJ5zvuQqOhEYENOtkcb5veQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ag2gg8wnp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 16:23:01 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-ba265ee0e34so3907308a12.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 08:23:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763396580; x=1764001380; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GEDPf0dSRA/rIzrOWNr3jGW8qWLig0SWtECgPvdVTyY=;
        b=SXT4idqWz78kFDbW2rk4NVV2D+A4CjTveO0Vw20orKXafpiKJRfBDTybO+7w27U33/
         ft2Kr6Pr3oknNCI+QTtOxiaymmTpa5zou9GicfaT5+EaatC2uoxdR3iKwnqEPVgLiGYN
         Z8Sn45soixGKg4bvQ2mYy2AByIUz+Kg4vBWf9Zdswq8CZhDsSJOcam53YbN0//3n0awL
         bMMPIe9alUm9y7uZCZKwCtaYaxR9Fsrv+yQtf2j5Vf6VMRvik1oPgz/Y5Enj2pTheAsx
         f0sHFzaXJUYipO0BuRn+jDyHmUrd0tOSkJ3VUleQJ4vU51JQt/Vwaqc6pVoK+Gwo1v0v
         uBSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763396580; x=1764001380;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GEDPf0dSRA/rIzrOWNr3jGW8qWLig0SWtECgPvdVTyY=;
        b=oNSrnGcYvuikPLvvh6ds48TK/0Rz+Kr0iLHoi66rCxAaIehM9Cn9/UL3ZcmNIlW8sH
         5YdDmzSiHyT20qP5tOMrt5VHjQoWk6JhJ8rQiHwtR8br0lOa9GveXNsElLWlk3nD+qLq
         bES29ED/56y+09v/Pwn24ivMJqbaI+qR+eGP9wiaCEopK7nLeGBpygRFnEI/G5DXj+vM
         Dnqknf6juaiJfm8JT34D0meuS852SDKOPydKxt1xlkaZG68ERMWulIrFhwNeTaSEwhYO
         ZMFRgvUcz/QCYMDzG0oYGMT/hhp60ALb7RUz75RFTAGxDeoZeZB8AyQl0jmPNgWQDFQa
         1m5w==
X-Gm-Message-State: AOJu0Yyzo/iCOqboG5gEbuF1LwF3FN1rKKWO0GnqL+6CjuSBl8SYEu7F
	O1YfQE2lRmuc0ocbZmxzdULwzCeB/LT/hDFfe+ZLSQg5qUfOmgj38vrb6SM3pPHOeeVHdRPGmNb
	7MVSMpsfN+iMTrbsv2ggbvhK4knb3vjythaoZwNXULRqsvgH2mtTkZ0hHv+eax7APvMmPwM3PYi
	Ks
X-Gm-Gg: ASbGncvbW0Zs2GqIrX37e+OVWSwFdtzfd5BvjIqhjrjeRGVD6UOzoKHJ/65RSdTL7/w
	KzR3w/qknegg2xxJmHhGD9utCXL5EBHCSwXmbtY1V/HiHQvge8CNTnM5BoX+KOcbIUucpi6/5rS
	mUQz/ua3EQ0kkRQouCZpiy/dmeyneY0sJ/lEcz34TVvNDZ3nTtQpRIiWJR6cbJ9TBzOGTr5TptY
	OmBGDm2lWXLFxNoY2cBRkMhjxuu4lb7E3OPQoKLMgkW94lts0tCFGIUHMBbheBYR+ShitwFffZt
	xKuxFt7DUnuzceZ5MmXvCP70MyrM2y5XKMxorPCaItfeftZ3PxUAGw8mwsnJRlVPcx7wgNxGRLR
	I2NRy8kjEBgoVMC4307f84CaONz6f4au+4QZPod0IsTF31mOMsQm1sOJJ1Vg2iaV9a23GfPKmbA
	lxrxl1C4wLou+K1ebMn59D9R9/A6ibvfMmaYXAoFW+P8uJ
X-Received: by 2002:a05:6a20:3d1c:b0:35d:a2c1:3a15 with SMTP id adf61e73a8af0-35da2c1d84bmr7148498637.4.1763396580185;
        Mon, 17 Nov 2025 08:23:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFrg7dqfCrgKZXmPVFE3NO5SL+fBj0OTKre8wGliG58Y4pfYy8rM9Mxl8+upv1WZYREN74UOw==
X-Received: by 2002:a05:6a20:3d1c:b0:35d:a2c1:3a15 with SMTP id adf61e73a8af0-35da2c1d84bmr7148468637.4.1763396579661;
        Mon, 17 Nov 2025 08:22:59 -0800 (PST)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7bf4d30e1a3sm4110357b3a.36.2025.11.17.08.22.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 08:22:59 -0800 (PST)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Mon, 17 Nov 2025 21:52:55 +0530
Subject: [PATCH] firmware: qcom: scm: Use __cleanup() for device_node
 pointers
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251117-scm_cleanup_of_node_put-v1-1-307d36d6b849@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAN5LG2kC/x3MQQqAIBBA0avErBMaoaKuEiFlYw2UimYE0d2Tl
 m/x/wORAlOEvngg0MWRnc3AsgC9TXYlwUs2yErWiNiKqA+ld5ps8soZZd1CyqdTNLrDWmIz42w
 g1z6Q4fs/D+P7fmWDYalpAAAA
X-Change-ID: 20251117-scm_cleanup_of_node_put-6c915216b1bf
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763396577; l=1891;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=GRv+OgmZqr9WuANHSfZbS1DVJRHeOc4x/LMiQstDn6A=;
 b=V9Z+NdtQXcFuXacpGaORPdwmnDmXq6O9IaOimWLTgx1wsj5LkZCSXdB+KXRReDKQ/eCwILEly
 G4BVsNkMH1FCi1eXUYfuYXOEcCsq6LNj3kyltmFP0vACWf4Vhx2SglH
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-GUID: gf0-de70DwXluO1Y66zrHgSrTmd5NCwj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDEzOSBTYWx0ZWRfX1W0k+zaRyr/L
 tLBJjMU3tTAtyuPOEeecPR5jiG191HrTi6l/wsQivSSPmsndZRedl5Sq2EfU9Ax5ec0irBOQ62R
 hhQ6a2w9pRcXJKWReerKwrEPKWmSxy181sL4KloTASDDEjTRkfkdPeOhSOqcwJUXVBHdlx+xAZ3
 ZkWoV0v4RZvONd9AKFvIx1i0NiDu13KL+TUGeLcIxMQJvuC8ui+qpi4sK5pPgs4B4JDyS25zqSc
 exzQ9n5GurrQ2pG3P2Bc0X7NfzTBVN9UdJa9YAYu3kxcexdgohIqP1qm4//H42errOCJE8IGfBc
 FM9sGCkIrlKzM2TPvSoXMsz3/Vg5o2WIuw7koGDoEUzM02Y0xnn9p9eFURzhZqg4vTLXqMFH3bS
 Kb3EeFkbrK3CrM9qIU3+iaaAFOPyTg==
X-Authority-Analysis: v=2.4 cv=Cryys34D c=1 sm=1 tr=0 ts=691b4be5 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=N6yGlkIinVOkEIgh37gA:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: gf0-de70DwXluO1Y66zrHgSrTmd5NCwj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_03,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511170139

Make use of the __cleanup() attribute for device_node pointers to simplify
resource management and remove explicit of_node_put() calls.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index e777b7cb9b127944fe112f453cae9cbc40c06cae..7c1fffa8e7ad48b294b90e7e63f726d0ba7d55e1 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -1746,7 +1746,7 @@ EXPORT_SYMBOL_GPL(qcom_scm_gpu_init_regs);
 
 static int qcom_scm_find_dload_address(struct device *dev, u64 *addr)
 {
-	struct device_node *tcsr;
+	struct device_node *tcsr __free(device_node) = NULL;
 	struct device_node *np = dev->of_node;
 	struct resource res;
 	u32 offset;
@@ -1757,7 +1757,6 @@ static int qcom_scm_find_dload_address(struct device *dev, u64 *addr)
 		return 0;
 
 	ret = of_address_to_resource(tcsr, 0, &res);
-	of_node_put(tcsr);
 	if (ret)
 		return ret;
 
@@ -2020,17 +2019,12 @@ static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
 
 static bool qcom_scm_qseecom_machine_is_allowed(void)
 {
-	struct device_node *np;
-	bool match;
+	struct device_node *np __free(device_node) = of_find_node_by_path("/");
 
-	np = of_find_node_by_path("/");
 	if (!np)
 		return false;
 
-	match = of_match_node(qcom_scm_qseecom_allowlist, np);
-	of_node_put(np);
-
-	return match;
+	return of_match_node(qcom_scm_qseecom_allowlist, np);
 }
 
 static void qcom_scm_qseecom_free(void *data)

---
base-commit: 0c1c7a6a83feaf2cf182c52983ffe330ffb50280
change-id: 20251117-scm_cleanup_of_node_put-6c915216b1bf

Best regards,
-- 
Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>


