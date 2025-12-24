Return-Path: <linux-arm-msm+bounces-86569-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EDF1CDC1F5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 12:24:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E37B0300CCF8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 11:23:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F242329E62;
	Wed, 24 Dec 2025 11:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FmUftDGz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IhE6ei9G"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7229C32D448
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 11:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766575395; cv=none; b=pURgdmAELS57SkOK0ZNFb7VH7kAQhJ7EJhWr8VpfC1EC98b+JGuJzdxjMKJrQRNjSvlH75Tr0kqtt/pxj38yy1b6M5ZKuXOjxkV8s73oCQULWSVR3N8COuCagrVoOECfYk7zZp3aSXo4Fk8MpF29XQhCZnujFpoWbQXToi9cOJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766575395; c=relaxed/simple;
	bh=ZMVOyXAKDHXImMTOExvhVc/+4OkDYf0+fZoUxWd2zlo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Uyn8jddfU8UGViCHa57kBQAEmO4zosukwR/93shCqZl4L0giN6fYBEWkOpH7LwD0+8T2rM5ftzNR+9AYcnZz9iQjYfudHjnHyVxCvLe8q+F18iLqbz1Sf3UUX23tOIeXf4QeU3MzxCb0kTVGRbYXh4tnEIfnQjBSYZS3ZRZF8fU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FmUftDGz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IhE6ei9G; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BOA4auV700694
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 11:23:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=sdLS9CEE0HwHJgDPYNBXXmzaVvIC0AYTFVp
	9ie9xAzQ=; b=FmUftDGzUUPaZTt14QFfJqgHnbbj6oOuRZMj7MVTF2WK3jZiyy4
	71UVJDy4Jlz7Ov7KucB0+FpzLD25K2SeAEImj8lWbBGSUSeq5+H8Nq3oy74sqm/S
	bJusd0qZZ0DvKYMY9sBmtB+LSxQayPMToMuvRyIwh+xJtaYf9SzE7zoG9DmGXml8
	0OEjZsv7d5dB2PYuVMAPIKuyanrrMwueAgwyCVcgCAzSkpcWmQex2afdNqGFs+Qv
	w/HOwKEowduYuERrWTh19vKpFdYntrvIp4in0vC4NxrKHmiNQ6SD6oCn7mwi9eFM
	7T01qBaiRUuf+GdGAqAdOfY7Im6UQ/QK7IA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7t7jujba-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 11:23:05 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8bb3a245d0cso1284293685a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 03:23:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766575385; x=1767180185; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sdLS9CEE0HwHJgDPYNBXXmzaVvIC0AYTFVp9ie9xAzQ=;
        b=IhE6ei9GT3P04o+zUEKRCUYmVd2v3Djc9hOM3/p86CsV1wwqz2YsEuTjfkfhP+6u9a
         Hck0+PK0nmjTn0akX+FmBvV4FxqZacJPVMUAdXE63peDzIKBslXwfhcmIeWXSDcgd8VA
         Fin0XlFtLCNM96H+HVZB2hkUCJKCUTNY0PuS1rcvWQApc/z6J4XhQe+Rt8BklpHWq7EZ
         rnLsKfo/SVSijnOL9ZTYz+NL/ERV1JObU9Ajk3qlra1cpwRIN4ekBOGVCovSnLc2TdrP
         Y/cffaW1elefVlk0XGSeIdT5WNiaBbyd7g9QetfZVtbtXnH8kCDn5F/rqFYHi1HpgtWI
         L8Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766575385; x=1767180185;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sdLS9CEE0HwHJgDPYNBXXmzaVvIC0AYTFVp9ie9xAzQ=;
        b=PdXIxte41DcblcMHdL1O5C4Klx8Som8lJUNoIODwq/hk3ZrgHg3uZ3e+pZH3YSMdCh
         onX887zp7fDsM6z+LEqH1aDZLEA5Ot0Mf/MiC6lQk3uSxi1XACn3FjnzoqZdYp73FIdj
         08q9EP9Dgp/2muXyO6DqIBgU4FAT7/4PR7EeBSdpVPhMUSxw9xtyhFNY9I4bFSUB1nkE
         nlh0m6Zo7Ir5MP2/j6dRkSLYPZG9AvL95mRXMhBGf13DVqalFMf9/yC86gP1B2KoBFKg
         MFv1CitBPJvmTmsAjMH7ULcYCBbqVkmADx9OQjsFEQ1ePgTx26ms4pOgg5gWDX7rIVY7
         Ja8w==
X-Forwarded-Encrypted: i=1; AJvYcCXwfh5Vy04Pj+3ee0G0jUxE9ChSgQQoufNZDYJBNSk27BFJd//RZjrNw2INb4Ql1z5RT3dx0kdDVnA0cwBU@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9CtQkivL/bQCp7HphJkECN4j7kwpQIhtSs/d6PQsYqKyvxzwV
	Qs2bSbCAiLvF2p0pOMrrRAbxpUw8iqON32jfiYOQXMkGIehmyq77BwmhXQ8oT75Ab3YfvbqinOQ
	pQARBMswfeQ4TypBh7TPrgeOWwgsGJOykzNqm5I558yNoeZmSLULRdnrsxHJeKbpvvylb
X-Gm-Gg: AY/fxX4rYNEt7leEnb6T1RT9VnTwQI+RWC7ErJCfcX+4YYXbo7YNJEcoI2RFVnd5YoF
	BKgU9qN6Y8nS2VFvgXuPQlDEU4xt+BuPHZ5xntE6MFjYRvL241m4/NDS/TlVSTMETqTXSIWkQ4W
	tvtef+7zqPzGqlr5MJcW/OItxK19vLnYPqowyPiISIvRdKkcsgIDQU8p91xr7AaH1fpYLTHU967
	bR4RIWu7cig0Z70Uh8ktFjijQx+zp2bbSAmrEK8PT0RIXdFFCZAf7n7DqhYgVISuYo5+Y1Y6aRJ
	6UaSHjU5nvgTBJx6hgoh7/nU3Tv4ljN7Imj1BXePJsM5oe0n3aXovV//Er3MPGW0+vNE4RtpIX1
	UeeF/+Gydnc6Uk35B5D4ukP0xY5eanEy1bNDOvchUy0awbWWI+AWJu0ZwYTZlBzLHn9llsA==
X-Received: by 2002:a05:622a:1e85:b0:4f1:b712:364a with SMTP id d75a77b69052e-4f4abd9588dmr278045351cf.56.1766575384916;
        Wed, 24 Dec 2025 03:23:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IELeq6AHWkZvQTJUxbSXF13F6qpL5K/huUFrxvWFbhaAGm3AhlXEbdbvVOtB68sRTEW+yL+pA==
X-Received: by 2002:a05:622a:1e85:b0:4f1:b712:364a with SMTP id d75a77b69052e-4f4abd9588dmr278045151cf.56.1766575384487;
        Wed, 24 Dec 2025 03:23:04 -0800 (PST)
Received: from quoll.home (83.5.187.232.ipv4.supernova.orange.pl. [83.5.187.232])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b916b66e2sm16864955a12.34.2025.12.24.03.23.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 03:23:03 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 1/2] clk: qcom: gcc-kaanapali: Fix double array initializer
Date: Wed, 24 Dec 2025 12:22:58 +0100
Message-ID: <20251224112257.83874-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1208; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=ZMVOyXAKDHXImMTOExvhVc/+4OkDYf0+fZoUxWd2zlo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpS80RA/NEfksD+AcDKiE4nnSKYnZrjTi1IJxzz
 HFC21yhUROJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaUvNEQAKCRDBN2bmhouD
 11fSD/0ahVEkVIblIKo/HWJohvDv+/qaEUKSr522WjDaQGFoiNfDo04QHmVPOm3VC9lTAK6oIuF
 SvSSLB+N5rvWoBOgMTpYG/96BzT3i+M6OumFHG9A7vwjc57xBPfziHJRxbD9T4C4ijdCGGFdnpH
 WvQ2fPPaME/Y1VC19xUCVs4G6tWZK4G6Y+3G/ZpwUNLtEglzjKFUzC1xWlokI1b55r1hsT8JBjX
 THZ81Oa7WO1mE6AFyPEBt1PK+Ip1u7Oys5ouPUZvVt6KiOE5Gm7TqTHaKF5Rb6umyhw8F0RzXVT
 +l6hpMRSny0QvPLUfxQhlx6po1IOpSynFvThJ0vgCzWZpFwTqiLLaM6aw70JskOusZODc4rOlBZ
 fMz7jpsgBWwiWg6xts66CfqVTeKMtLT4+Vh8R9xe3qbu/OoafU2TbuuWAhsq1MwbLD0QmUIfYZx
 z27GtKEVvvz0aD0OZYMFAoxle57g+ucvibHXrh7BFryHY7aEUbBiwh+3TXWudbYlXMhvk1f1Sib
 yenVCcfGnJVYWF3oBWrMnSNjWLvNuVu5J8wwzlrm04XE0r5+065PK3rETvisWkI4qZ4gi+yBIk3
 xp+72jH4yEKWcHhEreSh9mqe60t7PBuStsQz9MBa0mtT+JRLNyTwAF5lFDe/1pHiUo5ehTJaz9W G4m7NZOSwXikdRw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDA5OCBTYWx0ZWRfX0q8TOWM+kLmV
 dwbMd8QEmUzRCUbOAbFMkTAIfEDyKzjjtlWBd0rxGx9R1xBHVma+IEL0HE4n2/70RT6EXjGn2TE
 9d0aWaGG+neQM1hiikDLDkRs9eJI7I6OdkcpKRGmcPxPXE5iX+4FS/nI0KsUjdPLj7GA8MY7yiw
 q41BfHb8PE7XPq+XXleg3ARNxx0VYjQbdxZRQgD7JKulwE4p9NXvRS3MtJ7DNEdGHQFCoxRIsCl
 sJMfOi6QF7ZfCm2QtAvspeOd5442b9wCU5/EUptIGiMl6gQSbKBCv+zHLw/yZAcYVE/YGQ+99o6
 rInaTbl2B0mHgDTa065++fyYIVWAWao74Y60FPyMIsBXWP+6iOGhtP1q/Z/vOiFom4BFVduTBmw
 7WB/++Vyv0ZCyVpFqd34Y7iwvRMw7NSVOOKgT35Z2yLLbnR50VtzAFPfSdjyzJ1ZoIajsnA5/Qv
 Gqt7P5RpAat5Ll+SFjQ==
X-Authority-Analysis: v=2.4 cv=IvATsb/g c=1 sm=1 tr=0 ts=694bcd19 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=urQ9wjG1USoGuMoDBEOPbA==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=Oyzp-MmrXw3c9cDLh70A:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: B1m96Dy1I1-hZOtTKnPVbggJJ7zHw9Et
X-Proofpoint-ORIG-GUID: B1m96Dy1I1-hZOtTKnPVbggJJ7zHw9Et
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_03,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 bulkscore=0 malwarescore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512240098

[GCC_QMIP_VIDEO_VCODEC_AHB_CLK] element in clk_regmap array is already
initialized, as reported by W=1 clang warning:

  gcc-kaanapali.c:3383:36: error: initializer overrides prior initialization of this subobject [-Werror,-Winitializer-overrides]

Fixes: d1919c375f21 ("clk: qcom: Add support for Global clock controller on Kaanapali")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Does anyone even build this code before sending it to upstream?
---
 drivers/clk/qcom/gcc-kaanapali.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/clk/qcom/gcc-kaanapali.c b/drivers/clk/qcom/gcc-kaanapali.c
index 182b152df14c..b9743284927d 100644
--- a/drivers/clk/qcom/gcc-kaanapali.c
+++ b/drivers/clk/qcom/gcc-kaanapali.c
@@ -3380,7 +3380,6 @@ static struct clk_regmap *gcc_kaanapali_clocks[] = {
 	[GCC_QMIP_VIDEO_CV_CPU_AHB_CLK] = &gcc_qmip_video_cv_cpu_ahb_clk.clkr,
 	[GCC_QMIP_VIDEO_CVP_AHB_CLK] = &gcc_qmip_video_cvp_ahb_clk.clkr,
 	[GCC_QMIP_VIDEO_V_CPU_AHB_CLK] = &gcc_qmip_video_v_cpu_ahb_clk.clkr,
-	[GCC_QMIP_VIDEO_VCODEC_AHB_CLK] = &gcc_qmip_video_vcodec_ahb_clk.clkr,
 };
 
 static struct gdsc *gcc_kaanapali_gdscs[] = {
-- 
2.51.0


