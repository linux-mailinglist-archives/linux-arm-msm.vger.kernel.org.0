Return-Path: <linux-arm-msm+bounces-82572-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id D1DBBC708F6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 19:00:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 979094E9E8B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 17:53:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CC612BF012;
	Wed, 19 Nov 2025 17:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JL2EvWSD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WxsZiUWK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFC5C30E843
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 17:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763574808; cv=none; b=ihZYURnEreBdPr1ppsSyh5qcL4e3Xy0ozqCC4uKJN7hsk3KxOnSQr6SZ6jL/GY/PIMy40VHi/eSIwFulSfGlBCfP6R3IdnofMcgmbHASm6nY3hpR0/rQ4hH/n6ZBmB02KvLOmhWlNqCviHN3mhR12pNHo4IueSctXE3ORXUlHI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763574808; c=relaxed/simple;
	bh=5DJxAMB/+wN7M4MmKg2hQpq0zf7NTLUJwJfPlRyXAqk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=i2zCM6v37omUg/Umn+V9I2cnCL5LBYmUrMtQsb5BLzgFzBcieO+BuJpRdheu9K9NQ/OV3Y02oWoyMOHKwRRhQXMoljuL7Q/xz4IuYmZGTyTD0XEVOhV1WvLCjgF8lI7pjJItP4qpkHElyCIyUOv/9bRXQ/tpwi/j9K+lw+bUKqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JL2EvWSD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WxsZiUWK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AJFkOD52061034
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 17:53:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=tEOQuI67oSvhJ6KyOa3Zdc
	BHGXMCzxtvgCXju+xHfCE=; b=JL2EvWSDCdLVL+6klueizo8lQ8cA7v/6YMEyS1
	PdEJR2XwKY+aK/vQN2cb2fprHjqrKZqdtTt9ts8sS8IqVcOOnVD/rlXUj87c3f2h
	wcXIaVGEmJezJxzM8ERISlmbFG67nueOmpLi1QTc3CUV4+hVBXuUS/07HBUPal5o
	oRR/bC7rZnG0HdszuzKlUnxuCOREfWV81ff57IFT33Cv/1r+l9hgQztFD2jI2YuC
	H3uS+IXqQItNWgVUqf56qiBlDPBQRbX2s8edwydEuuLUlNJIKC3SYRILFWR4gRXf
	KIg+1n2H9kWjj/+8zBSxrRx21+oQeip+12e9PtFmY3Gx68zg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ah9fu9wvk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 17:53:19 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7b82c2c2ca2so11695116b3a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 09:53:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763574798; x=1764179598; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tEOQuI67oSvhJ6KyOa3ZdcBHGXMCzxtvgCXju+xHfCE=;
        b=WxsZiUWKaGHgxbokNSQ7/mbQ68N4gd/by5/oCSQP6+LDNcl7xlNGvzFQHse3bq4/in
         cakdY42j+oW2pe+NGreacksY5jPcUufW6kS5s1y6+kwMtTb6TgIq5sJSAQgj2Sag2HBn
         1UkFHYkvWCJq3le06Haw+GNOnuXmdUmuyxaQ9gr3lBNDRDiuaqlZR4ZRmcbgUUmFcgJK
         jj/B022Uv46e09FHJVGwmimdZB0x7rkeYrJ1vn9BLVKzm3HJYocFALWBB3s5wqj0tJTU
         YRF/mLKz4u1aDgdxjTlWmEc1jFwR0d7U1Is4kr+8jx/TSAeTmR/f6mLQEklOgfBO9eGG
         FFIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763574798; x=1764179598;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tEOQuI67oSvhJ6KyOa3ZdcBHGXMCzxtvgCXju+xHfCE=;
        b=lqlp+vttnSbEqDcLT83PKrE7koVdnjJrdSDt9BYSrvQ3BMDdjxpMzNcgnFOMnJxShE
         npr8MxQ0kVKxr9NQ+XDR8IWL8PJqdSDYIgR4ClaqEJjk+mkv9rvCL9GkiBifnTH+CTmW
         HdKLaRrb9FEBNjpeAWCJ6jvL9HM+z4LweALHRh/wLTk/oXLK/CAlcvqAkFUt3xZkekBx
         b5HhYXR5BdxzSHOnOKOIOyuIYH1ww7CZWqjRDsjeHOtxcAP6zCjyyuf5uIUc5b1H2WG3
         lQhNiKyKLLtnqC/HoxgZKpN0bZitCnKPBVoEVW+eQnH4jkyBKx9Ku10AOZhFi1fVlI4F
         eXsA==
X-Forwarded-Encrypted: i=1; AJvYcCWNnKSbMvrL0dsf2GrOhhcJUgquN1+anizjsXwrsj3ehUtcaYJ+kq2/CEUYV0IC6+wV4/HKn4ArSa47kAy4@vger.kernel.org
X-Gm-Message-State: AOJu0Ywvnx0SS55k2FA4KpjcLRUkUIOSuJtq/F8MONHfES+9TfFvt17Y
	OF58mwgScSc0fbleoWzSCOXZVRNGC0Bdb6pynW89r3ieDfnseGTX4xM02myY0EtVD/ohwHKLcCE
	ygjnXgYabjisRG0+mRzH/dranXlh/T278rkRf/hFLRlDpUJsiqVflPtZcJbEzL4yzjsTf
X-Gm-Gg: ASbGnct2zea2Bm2gN4zcvQX/WeFORG2U+ieaYDqqJtEqA5nCEQ8RxB4FlmghawTsaDU
	HainXt4idTxyZN9FbwpNLERw/IT1gfP/FovjWYtCk2+wCAcylY2R+DXVM5RyYF0tAPggHlyVkt7
	I6+KihjSJSNBPQzl8ZnA9T8W/Qmf6EbQvQVjBjE97e2bPFwGU7cwNnEefofh9tjPG0/prVoZZZ0
	c2eo99mOPaxrw2AeVSsztblWkPNFuqC4DUWoM5HJ26sjWFpdq582xuvOMgQ44vHqJ4Fr6I5B2sn
	4TCSz7zRdqLcFrpcK9cnsenAPPRbe2aBeWrb0knkOSXU1lfkgKj9v5z+ZxY8ECEtW9vuNK4aRWt
	6s6DFkkdGPb/ezloAP+V2HQnm4kuII2OUvA==
X-Received: by 2002:a05:6a00:9290:b0:7a4:460e:f86a with SMTP id d2e1a72fcca58-7ba3c476109mr25375977b3a.25.1763574798422;
        Wed, 19 Nov 2025 09:53:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGiTG1EdAQXBxI0WBmHh7qkH4QpIOGDW+DSqXgDFNCT54Ka8RNp62wMrBj3efk9ibQxp7e4ZQ==
X-Received: by 2002:a05:6a00:9290:b0:7a4:460e:f86a with SMTP id d2e1a72fcca58-7ba3c476109mr25375952b3a.25.1763574797980;
        Wed, 19 Nov 2025 09:53:17 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b9271521a9sm20175483b3a.47.2025.11.19.09.53.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 09:53:17 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Wed, 19 Nov 2025 23:23:03 +0530
Subject: [PATCH] clk: qcom: gcc-x1e80100: Use BRANCH_HALT_DELAY for UFS PHY
 symbol
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251119-gcc_ufs_phy_clk_branch_delay-v1-1-292c3e40b8c7@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAP4DHmkC/x3MSwqDMBAA0KvIrBsw8UPsVYoMcZyYQUklwVIR7
 97Q5du8CzIn4QzP6oLEH8nyjgX6UQEFFxdWMheDqU2ntR7UQoSHz7iHE2lbcUouUsCZN3cq0/f
 W+tY2TT1AKfbEXr7//jXe9w99ZFWSbgAAAA==
X-Change-ID: 20251119-gcc_ufs_phy_clk_branch_delay-26688f483309
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Abel Vesa <abel.vesa@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE5MDE0MCBTYWx0ZWRfX8kyCDDDAK42o
 AEapd2K+FNg0CN/gKWvrRnjKnTtgrZA43E2gZbiNLyYSEjcReOFD5XMWkKd/CkU76eYJKWwB1Q1
 T8sa/ickC8oFl2MGxZXp9bhhh+3xTAg+hUCIwB/nakIdJK1CLYQCgkGVWRuIJiSn3SjWKbkfmdj
 wfbXfeO9f+8gU92tWCJH/HV+z7eyIevStzmlexKkPI9cL+UjSQDC3XYNh6/L2LMkT3uxHXrRFxW
 PZoaZ8UR4kUMHz5Z6Em4LPL/qS5S9GHnJK1/XBy/UEhq2IUsncCEmomIPvTdEqPn9zY3wpLY+Ww
 QUF96yVqFOgmaK2ey+8hSy+jm/Au2fFrg6jV9GuGQ==
X-Authority-Analysis: v=2.4 cv=KZTfcAYD c=1 sm=1 tr=0 ts=691e040f cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=DQCSaF5PRGMLdvYeXSEA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: zBPg-SDGi0bTtk5MlO0GR_UkPqE5MhWv
X-Proofpoint-GUID: zBPg-SDGi0bTtk5MlO0GR_UkPqE5MhWv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-19_05,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 spamscore=0 phishscore=0
 malwarescore=0 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511190140

Switch the halt_check method from BRANCH_HALT to BRANCH_HALT_DELAY for
gcc_ufs_phy_rx_symbol_0_clk, gcc_ufs_phy_rx_symbol_1_clk, and
gcc_ufs_phy_tx_symbol_0_clk. These clocks are externally sourced and do
not require polling for halt status.

Fixes: 161b7c401f4b ("clk: qcom: Add Global Clock controller (GCC) driver for X1E80100")
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-x1e80100.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/qcom/gcc-x1e80100.c b/drivers/clk/qcom/gcc-x1e80100.c
index b63c8abdd2fc24fc963f038f8cdcafd7598ba989..0ebcecd2b7e0898cd8803676cdd1d7d640f770a3 100644
--- a/drivers/clk/qcom/gcc-x1e80100.c
+++ b/drivers/clk/qcom/gcc-x1e80100.c
@@ -5148,7 +5148,7 @@ static struct clk_branch gcc_ufs_phy_phy_aux_clk = {
 
 static struct clk_branch gcc_ufs_phy_rx_symbol_0_clk = {
 	.halt_reg = 0x7702c,
-	.halt_check = BRANCH_HALT,
+	.halt_check = BRANCH_HALT_DELAY,
 	.clkr = {
 		.enable_reg = 0x7702c,
 		.enable_mask = BIT(0),
@@ -5161,7 +5161,7 @@ static struct clk_branch gcc_ufs_phy_rx_symbol_0_clk = {
 
 static struct clk_branch gcc_ufs_phy_rx_symbol_1_clk = {
 	.halt_reg = 0x770cc,
-	.halt_check = BRANCH_HALT,
+	.halt_check = BRANCH_HALT_DELAY,
 	.clkr = {
 		.enable_reg = 0x770cc,
 		.enable_mask = BIT(0),
@@ -5174,7 +5174,7 @@ static struct clk_branch gcc_ufs_phy_rx_symbol_1_clk = {
 
 static struct clk_branch gcc_ufs_phy_tx_symbol_0_clk = {
 	.halt_reg = 0x77028,
-	.halt_check = BRANCH_HALT,
+	.halt_check = BRANCH_HALT_DELAY,
 	.clkr = {
 		.enable_reg = 0x77028,
 		.enable_mask = BIT(0),

---
base-commit: 187dac290bfd0741b9d7d5490af825c33fd9baa4
change-id: 20251119-gcc_ufs_phy_clk_branch_delay-26688f483309

Best regards,
-- 
Taniya Das <taniya.das@oss.qualcomm.com>


