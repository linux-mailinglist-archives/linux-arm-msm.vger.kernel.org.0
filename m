Return-Path: <linux-arm-msm+bounces-84759-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 64173CAF542
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Dec 2025 09:49:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D6CAF301618A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Dec 2025 08:49:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 524CF2D5924;
	Tue,  9 Dec 2025 08:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EtYEUWXz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PPFR3oyb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7C911A9FA8
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Dec 2025 08:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765270179; cv=none; b=YNUt5pergLo+DHVu2sVs/FzXTwU2vIGwZzk0dbXKVdhA6qaYyZtDJsss44KZxP8GXsndz5fOiQHoyPiA2Yus1VDm43bdJoKwTXWpc+vWLwqSSJeuva/x/1Ld9o6k3rgJ7tkV8MTzzo8fAX2ovY7eY/h6KEZnh3Q/49vOXsy1OGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765270179; c=relaxed/simple;
	bh=a5Vim0BrbcwPv8QgKJG+3wBLnVVhBbQ9TN0/S48DZIc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=pCKHVQkBAkvKXsw09dcjs6l3hLETvXO7uuO6bjwrsCALqm49fXPupVyCsvXpMdt9aVegd5ofaHzQ4tciTVE6gQhYygN01a5E8KxFy/yUXZNLJWBV42P6ko9Vl4PKzg3G8J4YExWV7rZsCdoNdKVnR+SOm79h21V6P+PaHs/V608=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EtYEUWXz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PPFR3oyb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B98jVbG2474961
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Dec 2025 08:49:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=X46Wu3saShZQkcIo66VWxt
	Gdqg36MXA2fn1P6BA7hFM=; b=EtYEUWXzjvEzDi0qfA2QLcfPiLqWzSeSkuNNDZ
	R0CuOEtRXgMKxkrCofiNEZ1Q4A9yJ+2KOYEe6Okc5e/B7xPPCZLmPqaOiKu7C/Lp
	7fdefeQjrFaeTAplpaF7Sl16BtZgA5aZHGjLnIMyvB2wudzbuppVWtwlQhOvExXP
	YHAoG8z8qFzwrGY2h31dMhTIA6FPYfBq85jAeOPQw5WR3zkODehE4LkYCTsZmgSo
	xsAIwOsaNJJgzzK96xs9xRppNWDQLjSJ3o0xHC2Mw/2xM5/34tSexnuiMCHSDvDf
	k6/f7PzRdkbAx8gT09UOTaTY7K6tUwBtbSlgmZQS7XbGRV7Q==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4axesf0b32-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Dec 2025 08:49:36 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-29806c42760so160845295ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Dec 2025 00:49:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765270176; x=1765874976; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=X46Wu3saShZQkcIo66VWxtGdqg36MXA2fn1P6BA7hFM=;
        b=PPFR3oybR6MBdQxLvqKZgXREN1f9xk/3A9y1f9771U949/dAILsk+HoQsxKd0gsKd0
         HTr0UZTks1EJ58L66GZI98g2ZXfMRUGGV+SJZ2N0+2QANM+pqLOlxfBv16jJMOB9p/Yk
         ysCVlA9UI2xd/+qCNuG9bWuGoxsOpvLmk6HkTl6AvLgQsYhDpZZOEYjsW/u/WCxZkrCA
         1hgw7RDR1zHb0/izkUO3iVVNADGMFG4mx+/C6p4MZ13CH7w48PgfLIhzPSK8g3YS3R02
         pTSd0qVIh7r37Z059nBZG9C5zlJIacZ6m97fJV4YLYSsGFL9GiuR2mSqNNSNQe2NFZLH
         /CpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765270176; x=1765874976;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X46Wu3saShZQkcIo66VWxtGdqg36MXA2fn1P6BA7hFM=;
        b=M6rhXlfE04yNv7EWYfb/TZsmnsC0kLs7bn6kSLgbCA6KutKEJm8OZBwXpJCIlK4xlO
         X697/UwB2De+m+jIFCUNPuPrAXPrXdHV3N/NchxaJVHZQzxMAGplxbcXkw/tDvjF57Z5
         57oYzlxcobZvCpXk419mZoOv6EABrH54vf5CN3tOcTi4G19y8xT1AZa1mqVxhatCcrNp
         r0upCXMQ0xOsB0nS3Qu2ITJe0GR0Mmm/d2iD6fp/8z2TReyqRHdtz9cXtgXcD2XeZs+h
         KwOkxJwvcfN51LzWJxjACuWS+iKjww69w11BKTXe1px39a4htrZzX8bQD0ljgUpL5mKx
         RpnA==
X-Forwarded-Encrypted: i=1; AJvYcCVFAIPpIvVdy+fSvicP/OSBElwVa5zmBlJXZq4w4jVYWMPkyeuZYJrEVJQ0w3elOy8/idlXouMXDKgXw65Y@vger.kernel.org
X-Gm-Message-State: AOJu0YzR6Be4Tz+8NPD/pXY21WuoM0FM5rw4nQ6htQTz5Ce9o1t7iwL4
	qW2IsIqbZggQZ4l2ZhbTwPDG+/mNp9L5xxNrRWs04Zt3UPgfZTjCYdBB/x1fG6+XbyGhC02Bive
	+cQ0ffjRHbnMA73C3fadiFcmcKeVJm+QpZpFaHuhocKqc7ku21oHYnvkkopXnpMyq2x55
X-Gm-Gg: AY/fxX6kPGdZYvHMDSOHj6mjpspAwYqPJqEPsE6zttPyAp03xSHnnaj0D+4ulspo5bW
	3VGjf4dTMhwcUqRZBPYRUgKLz1+MtTzJHndKqeuglVG/NZfGPNE+r+610iP8dThRDIw8uDwGXGl
	3pYNRUzosYHw85UhaqEvBBRTb8Sjv1xthk3jy3nxpik2uXKQ/fjYnPigUJE1sHhDprcuyqT7ncP
	Yr/VTh/aFPIjs79n7TGxKcjmMY6L0t1dv97PLdxpLivxMBilS51GkoRSWixGhyvz531ISrxUT1U
	lEpHS09DK0BsEV/XTyQMWtmaMS++xEWIrnakCbML9Ol7f9FvV0nbFm3qZugLVjV0Ct9amCLjtHL
	OTfbqHM73e3y8gn9f/UgdBtB/hGpApFeRYg==
X-Received: by 2002:a17:902:ce06:b0:290:c516:8c53 with SMTP id d9443c01a7336-29df5deb202mr110515535ad.40.1765270176049;
        Tue, 09 Dec 2025 00:49:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGNWr1TINzdKiqUQJUgVV9jp3nBa/qM+wfoA5AKaoT1hxzDBA//SZsVb7LDQkMOU7ySs0gVvQ==
X-Received: by 2002:a17:902:ce06:b0:290:c516:8c53 with SMTP id d9443c01a7336-29df5deb202mr110515285ad.40.1765270175577;
        Tue, 09 Dec 2025 00:49:35 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29dae99f1cfsm148615065ad.55.2025.12.09.00.49.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 00:49:35 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Subject: [PATCH v5 0/4] Add support for Clock controllers for Kaanapali
Date: Tue, 09 Dec 2025 14:19:23 +0530
Message-Id: <20251209-gcc_kaanapali-v3-v5-0-3af118262289@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJPiN2kC/33N0QqDIBQG4FcJr2doqdNd7T3GGCezklU23WQje
 vdZV7uIweHA/8P5zoyC8dYEdMpm5E20wboxBX7IkO5gbA22dcqoIAWntKC41fp2Bxhhgt7iWGK
 oFDWUCF7VDKWzyZvGvjfyck25s+Hp/Gf7EMu1/YOlIVgq4IopyYGJswshf7yg124Y8rTQakb26
 4gdhyWHNOZY1kIqadSOsyzLF9xpjTL/AAAA
X-Change-ID: 20251121-gcc_kaanapali-v3-ab91e1065bd4
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-ORIG-GUID: 2SWjwA5qsqtPWTs9l8JII7AQILOxu28w
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA5MDA2MSBTYWx0ZWRfX6eft3kyNax/i
 vXL/O7CireWbQYH8Q4nuG2uma02Lu5higCR8irPbR33yH/YGTDOm4yALjJZ61TNeV1s6efUDSiq
 zt75MZtO5j1okE/o5mb/UWNeH24vdWBfmQOlJt/2gJiHozEfpUGam8WE2AKShgzaKBzcmjo4/gp
 o0yJzg+/hJua1hLE1wetg84IDJDhgv6LD/XokJ6ZqOjPJh4Cm0kYYWnF1hClAgJM8hEUFYO33KR
 /ud+/XqKAM6IjXpzGtWQZ5LnF4T0mxUNjXsGJ4Aq8O16Gj7RArZXipz9WYREPA27DOpCHSkPHqb
 a6hw0eWryYcwOPJ26Dv9wQ8WSwwBVTDS6pZ6+83y8lNYMeKcHVxf1wVTcTMkU6HiLtFKLkn2tMr
 hTVi7Rvqcdcf9U8YlVjLI9E++Ki1Rg==
X-Authority-Analysis: v=2.4 cv=fMc0HJae c=1 sm=1 tr=0 ts=6937e2a0 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=Loy5EBZihN6W5EKTTqQA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: 2SWjwA5qsqtPWTs9l8JII7AQILOxu28w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_02,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 suspectscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512090061

Add support for Global clock controller(GCC), TCSR and the RPMH clock
controller for the Qualcomm Kaanapali SoC.

Kaanapali(Snapdragon SoC from Qualcomm):
https://www.qualcomm.com/products/mobile/snapdragon/smartphones/snapdragon-8-series-mobile-platforms/snapdragon-8-elite-gen-5

Changes in v5:
 - update the commit message for the glymur clock pmic resources to
   describe the problem statement. [Dmitry].
 - Move the clock definitions for clk1 & clk2 before the clk3.
 - Add RB-by tag from [Konrad] for RPHCC for Glymur and Kaanapali
 - Link to v4: https://lore.kernel.org/r/20251126-gcc_kaanapali-v3-v4-0-0fe73d6898e9@oss.qualcomm.com

Changes in v4:
 - Add the patchset from https://lore.kernel.org/lkml/20251125-glymur_rpmhcc_fix-v1-1-60081b3cce7f@oss.qualcomm.com
   to this series.
	- Remove the 'fixes' tag comment [Dmitry]
	- update the clock names in the glymur desc.
 - Update 'max_register' for tcsrcc to 0x3d000.
 - Add RB-by tag from [Konrad, Dmitry, Abel] for TCSRCC
 - Link to v3: https://lore.kernel.org/r/20251121-gcc_kaanapali-v3-v3-0-89a594985a46@oss.qualcomm.com

Changes in v3:
 - Update the new RPMH clocks to use 'clkN' convention which was not
   moved completely in v2 patchset [Dmitry].
 - Use lower case of the target name in Kconfig and Driver code [Dmitry]
 - Update the TCSRCC clock offsets as per the latest discussion for
   mapping the TCSR base to '0x1fc0000'.
 - Add RB tag from [Konrad] for GCC
 - Link to v2: https://lore.kernel.org/r/20251030-gcc_kaanapali-v2-v2-0-a774a587af6f@oss.qualcomm.com

Changes in v2:
  - Update the commit message for all dt-bindings to incorporate
    "SoC/platform" inplace of drivers [Krzysztof]
  - Add RB tag from [Krzysztof] for dt-bindings
  - Split the TCSRCC to a new driver instead of reusing the SM8750
    driver with offset updates [Dmitry]
  - Update the new RPMH clocks to use 'clkN' convention [Dmitry]
  - Add RB tag from [Dmitry] for GCC
  - This series does not have any strict PLL code dependencies [Bjorn], thus
    drop them and will be added in the Multimedia clock controller
    series. Drop the following patches.
	- Update the PLL support for cal_l
	- Add support for controlling Pongo EKO_T PLL
	- Add support for controlling Rivian PLL
  - Link to v1: https://lore.kernel.org/lkml/20250924-knp-clk-v1-0-29b02b818782@oss.qualcomm.com/

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
Taniya Das (4):
      clk: qcom: rpmh: Update the clock suffix for Glymur
      clk: qcom: rpmh: Add support for Kaanapali rpmh clocks
      clk: qcom: Add TCSR clock driver for Kaanapali
      clk: qcom: Add support for Global clock controller on Kaanapali

 drivers/clk/qcom/Kconfig            |   17 +
 drivers/clk/qcom/Makefile           |    2 +
 drivers/clk/qcom/clk-rpmh.c         |   60 +-
 drivers/clk/qcom/gcc-kaanapali.c    | 3541 +++++++++++++++++++++++++++++++++++
 drivers/clk/qcom/tcsrcc-kaanapali.c |  141 ++
 5 files changed, 3751 insertions(+), 10 deletions(-)
---
base-commit: 88cbd8ac379cf5ce68b7efcfd4d1484a6871ee0b
change-id: 20251121-gcc_kaanapali-v3-ab91e1065bd4

Best regards,
-- 
Taniya Das <taniya.das@oss.qualcomm.com>


