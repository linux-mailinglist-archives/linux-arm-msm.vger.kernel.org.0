Return-Path: <linux-arm-msm+bounces-83306-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 31254C86828
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 19:12:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id AA2DA34FCDF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 18:12:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AAA932C33D;
	Tue, 25 Nov 2025 18:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l9iT16eg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JaQLUj+o"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0E2032AADF
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 18:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764094370; cv=none; b=i3Gl0RLvqywdfcVfaufIS8GuFlSxcSp5+G2srw6cYhOka9zUE9hPkfOCifd6b5zZAGgXJ2beG/OII+NGOHrUD3YyRGS/pcGeAZoGMwBXfrkSAuvzC3V4TtsSGUc1LQGUa81HO24Yz0mJ3AffwLflpmrLoQ0mXL28t1ogaKn1jac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764094370; c=relaxed/simple;
	bh=gBufPdwavW6U2ZqCrZrrLJChklwQIYlECu6z1WXKxfI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=BQEaHB8obLVgq8bkdfBU7qhjfBEWYFUwUydGKu18azM5OICxWPRYahdU/KpzN25kriRhUIRl4NrS3KB+bMw3rGM+9U2H2w8jR+x0ga+u3Y97RQBn+t4U/KtIpmIpP+dEG9eyvbMl/vYz2+saCEcG2MHHLWPsmf9WtzlACggZuMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l9iT16eg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JaQLUj+o; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5APB5SMh3255870
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 18:12:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ffiIeLAJdv6cS9xI9Y5NVL
	Zft/4lfWwIZVjAvefCrUk=; b=l9iT16egQyOSs1pGayyxbfQtD4cKlhYiCzOblJ
	+hKXOpKT04GRz6V53pohEw5ncpOIDhvRhNpUSDSgbaUP6y4+J2C0410UpSfRte24
	1xeMUq3hDCnX59yvsGEY5WNIB1BnrPGJDuxFpkx0LAJPRCGylDTA3PBhPZemnMg7
	Fe7md7UBALTVkYNMYio3JLHs3/5qQj5iH4QKGmUeFPZR0yLrEM6PZ6s4Jv/O3x2v
	ZAIgtNWrsZ7UiS8A36dFdSiS/2qv3yBMOjsI+lfpil50XyWkjNjhhSU5pE3LpVgz
	i1YN35PVpvAw7MylfCh0vRwv/RcgB1XR35Oubmy+u/fhrVww==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4anb9c1800-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 18:12:47 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-297fbfb4e53so90119035ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 10:12:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764094367; x=1764699167; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ffiIeLAJdv6cS9xI9Y5NVLZft/4lfWwIZVjAvefCrUk=;
        b=JaQLUj+oI4QS+A4PSDhcNra6eVOFv3rlXz/yhYXD5MIqtYeZRrpSwoOUuMP5JoKUMT
         H6CB1HiXtP9tloUIHb587h9cXvlQ2kEbP0sXsGZrIlkhXomSS9hXsaFDE+3JSBkL0LTi
         6zlt9PuIHZwkYkzbxv4pL8DvhEGfM+IMCLi1S0PAGqZ4xgSWA9i4d0ee/oc/lIOKpH3b
         KnRMH5K4DoYnqEZo8j0Lad6OEN6SPzw8/ryPy3LYKm2eUc4Fg1f7N2u4v86X6RHj4Iw2
         I/cNzT9NeYAjnBQd59gYhjz1YVmyC59mY3Y6BsQFOoQWaaounjpsVYzGUNS31jFxajwe
         uRdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764094367; x=1764699167;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ffiIeLAJdv6cS9xI9Y5NVLZft/4lfWwIZVjAvefCrUk=;
        b=Cs4J0PEAODNnBmLj4HuF6LLiLKw6E3ILaPsc89NEvXLrnyf758f+X4MN7dcETrTiok
         Qap1N0k//bFOI4CI4ioOoQyIOc2d9V6qcLPUmWryU7SM/n0vCXaKtKK9Y8gFotsjK8CS
         RjGZ5/OJaYZUW8yZXwsLAgfUJgtsSSjl9iqCaEEkxXXhODArpBm+htRkptjOjrEhRtPc
         hJDmiGm3SoiPBiSgvUD11lkHa9pHgNaoj6/N8WVNSHhj/8OcqC8bn3nSec2zHYsQ1Nrl
         GoutibcxlImvTFvvAGswukjDKVaaaeCz5FMT4fsNVU4PcqWgl2QyBYoqOEhotgbvPPXF
         EAzQ==
X-Forwarded-Encrypted: i=1; AJvYcCUaYNrpd2MGgBJkznpHh0QMPfnlGYtlowJ+wH1G9HIGSwYd0C5OUD3rG7cVi3tpmHi26Pbkg+wP+zb6bpVk@vger.kernel.org
X-Gm-Message-State: AOJu0YwTHuZ38FgOslybgrMUA62JirSWExCgM44a6lYFwL5VpD37CvhB
	kHATuJkR9KIsqFa6o7Va05EyDtiDHlRPVLsXpVkyp+E46X3p3iT2LnLMIpZE9vLl261QKNCviOy
	2LRbzXyFLw8VS+vX7iPBPFpcdFxsDh+6XrZIwddvehr6bDr5RsRbGSWDzs3fbQbBEccGx
X-Gm-Gg: ASbGncsURC6PqrZgCoi8IWxyxniCHEkobDhIOKD1C8AkJ4o7XsnkRhC3oipVd8Jki29
	IJF4sveJJI90jwb7VSA+72jacDyxHbOrOsLBfdpWCBncHsU+OnLBiYtB9OLPNqV9zX9ns+4aXNy
	lHPFM8rVtK3LucajId0ACGxqT1XcrfuPzY4XsqDM1Q4vPc8npUq++e9GEXdIcbAwpZYkCJcEpD/
	3VdOybF+xJukxD/Ri2vxOZw/t5YmExRMvoLsgbcDEyTN1RNG0zjEVZoovPeCnBu1xlKW7YkqIjI
	GPb82aluXaCjggjJ6Sbr7xSRVN1EBOmnuQbEKSIlp2bfzDlqvnnywO99S0hFtnu66CJu+ymNmUD
	LTlNEa3EKQuOo32hwYnk=
X-Received: by 2002:a17:903:4b4b:b0:298:35c:c313 with SMTP id d9443c01a7336-29bab30b2c3mr41961025ad.61.1764094366623;
        Tue, 25 Nov 2025 10:12:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGzv9uEm51CAVvRe1WxPK35r9PQSvFFG0Ksqo7SaatwN7pky9nfkSZ0cu9KUDAbcwpfWxD3+g==
X-Received: by 2002:a17:903:4b4b:b0:298:35c:c313 with SMTP id d9443c01a7336-29bab30b2c3mr41960715ad.61.1764094366154;
        Tue, 25 Nov 2025 10:12:46 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b2bf63bsm171856955ad.100.2025.11.25.10.12.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 10:12:45 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 25 Nov 2025 23:42:39 +0530
Subject: [PATCH] clk: qcom: clk-rpmh: Update the clock suffix for Glymur
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251125-glymur_rpmhcc_fix-v1-1-60081b3cce7f@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAJbxJWkC/x2MQQqAIBAAvxJ7TkjDiL4SEaJrLZTJSlFIf086z
 sBMhoRMmGCoMjBelOgIBWRdgV1NWFCQKwyqUVpKpcWyPfvJM8d9tXb2dAvtjGk7I7H3HkoXGYv
 +n+P0vh+6W62eYwAAAA==
X-Change-ID: 20251125-glymur_rpmhcc_fix-5daa36a1e8ff
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-GUID: npGKm_7dcGDL2x5HIC8lh3hMaYdfvNFM
X-Proofpoint-ORIG-GUID: npGKm_7dcGDL2x5HIC8lh3hMaYdfvNFM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI1MDE1MiBTYWx0ZWRfXwwKG1CDlLXxj
 y6kARBnJTYV6ux5ptlvC6hsE6kar+UjfvzKJUXHKz5euWYGqxpL+NBNBlQ7NO56WVtcRKctO1Vo
 bpGS1p7rWtQ9KKZDFhtHwy9kj3722uB4jWjViuCoTi6cBblZr+kHAqJltXJ/OWyboNVSTuQK1hb
 Xhi/dWR/uppMi3VIQnOJ/MM6z9ZbYnEwAzwlvXgG63AitLcNjVHQZib4qKvXp6JOWrx670fydEi
 zPChuqCF11kqv7G1D5xlq40Xc0UJd4LTY8XBkDLnPOPZ7FZKqynHxGsjucvvoSwVlV9TUMMPjWf
 KAdPXn0MMXncscLJ8tBGT2kvbOJky53+kMaRpXrq7mmsxH88kHPPUJ5jDr+PUimEotD/qdxz0mJ
 IjZS7E+2WYF65sfhU1E8+8CLfoaeOQ==
X-Authority-Analysis: v=2.4 cv=VKbQXtPX c=1 sm=1 tr=0 ts=6925f19f cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=sNDe-mhSqTPY3e5eUCQA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 bulkscore=0 adultscore=0
 malwarescore=0 suspectscore=0 phishscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511250152

Update the RPMh VRM clock definitions for Glymur to add the suffix to
indicate the clock div and e0 for the C3A_E0, C4A_E0, C5A_E0, and
C8A_E0 clock resources.

Fixes: ebcb9db98bda ("clk: qcom: rpmh: Add support for Glymur rpmh clocks")
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/clk/qcom/clk-rpmh.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
index 1a98b3a0c528c24b600326e6b951b2edb6dcadd7..a370ab2d96c34fa8e7a090e8427b11008318c02f 100644
--- a/drivers/clk/qcom/clk-rpmh.c
+++ b/drivers/clk/qcom/clk-rpmh.c
@@ -390,10 +390,10 @@ DEFINE_CLK_RPMH_VRM(clk7, _a4, "clka7", 4);
 
 DEFINE_CLK_RPMH_VRM(div_clk1, _div2, "divclka1", 2);
 
-DEFINE_CLK_RPMH_VRM(clk3, _a, "C3A_E0", 1);
-DEFINE_CLK_RPMH_VRM(clk4, _a, "C4A_E0", 1);
-DEFINE_CLK_RPMH_VRM(clk5, _a, "C5A_E0", 1);
-DEFINE_CLK_RPMH_VRM(clk8, _a, "C8A_E0", 1);
+DEFINE_CLK_RPMH_VRM(clk3, _a1_e0, "C3A_E0", 1);
+DEFINE_CLK_RPMH_VRM(clk4, _a1_e0, "C4A_E0", 1);
+DEFINE_CLK_RPMH_VRM(clk5, _a1_e0, "C5A_E0", 1);
+DEFINE_CLK_RPMH_VRM(clk8, _a1_e0, "C8A_E0", 1);
 
 DEFINE_CLK_RPMH_BCM(ce, "CE0");
 DEFINE_CLK_RPMH_BCM(hwkm, "HK0");

---
base-commit: 92fd6e84175befa1775e5c0ab682938eca27c0b2
change-id: 20251125-glymur_rpmhcc_fix-5daa36a1e8ff

Best regards,
-- 
Taniya Das <taniya.das@oss.qualcomm.com>


