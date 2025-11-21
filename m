Return-Path: <linux-arm-msm+bounces-82898-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C8E7C7B24D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 18:56:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id E242135DE1B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 17:56:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68701302CAB;
	Fri, 21 Nov 2025 17:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Jb+JRjff";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Fg2JaNmd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC7002E7BD2
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 17:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763747803; cv=none; b=M6z1ZRCRrYAhsmarJZX/l8Z8neDCJge+2oiJ7VGrs3RygvhmEAVGc/ROrrtkx7JgCq0CWt3Lr1E/Bb/iIMRhoxmHPPXnt+RjvFuwwAy1MzxNWXSYmIugP8k1xBTbAOnj4JeOrVXVZWdodAY9EURyQ1sg5ZTEHYi7HYRkKPGSTnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763747803; c=relaxed/simple;
	bh=fy1OAyiWQ8tXXNz1A9JL1EaMw9CTUDiIXUySzIRwG/M=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=aJQKJjKm+T3lkLgmnOtF+lMAqTaSSAQ5cA4QIaZ2GijVKuVGkahhPLSowUAPNrHz5GYwKZuMe77XTJV0RLDQHv2H8m0r4U/d2P16R6HdoFd9ZGNOZi7P1It96LbHzksRe8DvEEguYeRP8zKwKihmO7P6C2WeJpuarKlmOEnFTmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Jb+JRjff; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Fg2JaNmd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ALFCTKK1390896
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 17:56:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=hF45yioN2i80AO+xrs7lpU
	uXfS68L4/pxMqxakhD/Yk=; b=Jb+JRjffRGqLIe1I9+zF+9nu691NBuVM4wZU6Z
	HAfcumlpTYe8JxyoHMFJ1gvy3wHfZCdWZZLaCEzInBq91UR/nv15Q1z938DNIH2B
	oXuWGoKdOutbu3bYnnmKa+mlh9b94zRQaID6WpvM2Eor1s33ZNZb6PD1T163Voon
	CyiDHnsAwKT918eSOHIqpkHJcvK1Vxg0FWc74O6cuH557L2dJdAkv93bWMLmpZAp
	ZUJZQJgJUerhE1DX1XPD78o0FN4uV1gnyndjnQA9cb2gtE67XufdvK4bueFyUaeS
	2lJinrbCDofNAI59VH71F8rAE+anqPV3M2olw6eXMs6VrSgA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ajb533h2b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 17:56:40 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7a998ab7f87so4243252b3a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 09:56:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763747799; x=1764352599; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hF45yioN2i80AO+xrs7lpUuXfS68L4/pxMqxakhD/Yk=;
        b=Fg2JaNmdignCyvWG1NR7oR/nb49ZdlQkfpO71YIuGwyTbatJlXG1U93qHweIv71vL0
         CEYjp1/eduM/AhBJkHp44a/xh9f4etYhP9FwSJuUxnDWSy3qptzmnbpDdfyUaqMzu4ET
         3GyDo/k+OVyoyxIYWIxGEqesKneHJoXAxDJaVePz+Ae4g4TxABwSL/QtIs4xZYYDWFAk
         m1P5TFtYax9bE+DqNSqXTbqIU6I6tNrJ/HTzA8A/GtPBvGRKGwbSJgvmRatWZ9zNA6A1
         ExrdssFTcl78KbUd/esDD5RBNfuCklCDaYZk+URo6A7ty7/8rMnP/7W9JjGqWNysVU/Y
         grxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763747799; x=1764352599;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hF45yioN2i80AO+xrs7lpUuXfS68L4/pxMqxakhD/Yk=;
        b=T2/d8gIzMLEKEP7nK48GtUwKedfMLxx1u6VhTeVfpCO/ScY787gVrFfAVH1f//v5Bq
         xo4a3PC14ZeDu2Ag8IxeqMC4DAjyDesRvlqS4LHGHMEUtUnqpjy8qcilWDRCecqMm6BH
         lmXDREMI7HFxcF4lR5FOOG8HGwOhIWu7LloOMXcwokL6aY+uhUZBe7/5mqbx22XpLkYk
         4zQ/Wci+IawQuGUtUXka6aSl1FTXFDagD/gfzUjIx2iBR9j1tBW0gVSvmfZ/vaf59TQf
         1DsP3UzMaADXNVeo2tnnrh0dDz77n0ulCS2xIHI0FBWQOh1IDwgyoYaoXtlVBOLPo1Th
         zZ7A==
X-Forwarded-Encrypted: i=1; AJvYcCXb+wd3GFvVuEMKyIPEGYMNj/L5oS69jJ+H3B814WGKxe8+KBdxoPgiwyItARV5EJYm0DZ4LrpErsZJGtkW@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+uTIGroOpE3gAGOWJfpehja5C6YvTeGCOxVroAHYJfefoGPrb
	HvxAQ1hI5LMWOuZyg/D3k1D8e53ClvJbiv9fzoGQSN1stMLmdTMjycjRkctIFSme5zz9tJY4Acx
	e1gdEuQIxAA8y7uO+8N7HIJR3g3P2nHsm5rxphOeSVgQDn36I6rc9qIwv5oxGw7tzCU2e
X-Gm-Gg: ASbGncvM+ZIi4w4wDNxWNtDu900QA/noHGRvovxlHKWJj7OR9/rwifP0J3K9m0NylUh
	p2LgG+f5JqnUWh2ecHyZVOoP6PH8qH+dhqz4Jwx3DbYBYGgWVTFnmisa5fqXkxjoiygEYsUTaM3
	muF015WiUVSQ7774XVe9eO9/j6UbZLFwP9xZTQw9paZmDPCxcEwDbjhoubpLV0aOS/cfjYRRpwa
	m4Osr24Yn/dBGQz/tKyfYsCRnpwhKplEVFieNg2W4wmOB304Mhmg660/f1NYBGA5k4lvPPHPCt/
	w3FPgr2bwfUPBwiD4Psj+m5c9si2GpqWJpwqbXRNpIVSKX3lXUfBCT018t8BIUfopytlbqB2YbV
	buTB130nY9njmPA+cDMM8pH2bh6IUw8reag==
X-Received: by 2002:a05:6a00:18aa:b0:783:9b67:e96a with SMTP id d2e1a72fcca58-7c58988f790mr3572981b3a.0.1763747799366;
        Fri, 21 Nov 2025 09:56:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFia0ajsNrlxP3jp5L8oHybsoZjqxRqeOSII1csnsLzjtyHZxIWW/jRb0d9MR0h8htoND6VPw==
X-Received: by 2002:a05:6a00:18aa:b0:783:9b67:e96a with SMTP id d2e1a72fcca58-7c58988f790mr3572945b3a.0.1763747798832;
        Fri, 21 Nov 2025 09:56:38 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7c3ed471060sm6727883b3a.15.2025.11.21.09.56.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 09:56:38 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Subject: [PATCH v3 0/3] Add support for Clock controllers for Kaanapali
Date: Fri, 21 Nov 2025 23:26:26 +0530
Message-Id: <20251121-gcc_kaanapali-v3-v3-0-89a594985a46@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMqnIGkC/x3MQQqAIBBA0avErBMaraCuEhGTTjUUFgoSRHdPW
 r7F/w9EDsIR+uKBwEminD7DlAXYjfzKSlw26Eo3iBrVau20E3m66BCVjKK5Q8aqbWZXQ86uwIv
 c/3IY3/cDEG/aqGIAAAA=
X-Change-ID: 20251121-gcc_kaanapali-v3-ab91e1065bd4
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Taniya Das <taniya.das@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-GUID: yvnV3Kxe0ouorImD2je3lmNgQge1hmC-
X-Proofpoint-ORIG-GUID: yvnV3Kxe0ouorImD2je3lmNgQge1hmC-
X-Authority-Analysis: v=2.4 cv=Wugm8Nfv c=1 sm=1 tr=0 ts=6920a7d8 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=pU5keNj5C49EkLXuPzUA:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIxMDEzNCBTYWx0ZWRfX0Spc8MPZlV++
 OKqxo+SFHLmB3g3gIF591a0q8gcfwxVIRO0vETZnEd7SnszK3bkEpv2sQTEYc0V2tEI6TWgHaAb
 Rik6yNbjb9ZbJtvcXW31Bth2/CMfJIL4OxZGh4ct1WLR2K8jMD6bE3HiICAq+J19DrrMAu7r0ch
 2qCFXq0V50kKaxfolY+q7XwTIXozUQJpTmXZUDnQCp39xeT8xkzcYV7oncvVPM48ZMn8n5OjTKY
 baifWbCLGH9YnUSOdV9U66Fv5O0y9CZIsHnlYX/XUxaUiCccmo680wcVH9PwBzT1Fc63Bf+j9HZ
 DhrnoVssBQwscfGF8AenTOkd5CHTJBeHkxp6NOoFrEKlPSiVIdA+X5jIoLehpi/nwpaDV8r6mk8
 qe39+aZ/JrSvUF4l3CpA/kgnQwmv1g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_05,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 phishscore=0 bulkscore=0 adultscore=0
 suspectscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511210134

Add support for Global clock controller(GCC), TCSR and the RPMH clock
controller for the Qualcomm Kaanapali SoC.

Kaanapali(Snapdragon SoC from Qualcomm):
https://www.qualcomm.com/products/mobile/snapdragon/smartphones/snapdragon-8-series-mobile-platforms/snapdragon-8-elite-gen-5

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
Taniya Das (3):
      clk: qcom: rpmh: Add support for Kaanapali rpmh clocks
      clk: qcom: Add TCSR clock driver for Kaanapali
      clk: qcom: Add support for Global clock controller on Kaanapali

 drivers/clk/qcom/Kconfig            |   17 +
 drivers/clk/qcom/Makefile           |    2 +
 drivers/clk/qcom/clk-rpmh.c         |   41 +
 drivers/clk/qcom/gcc-kaanapali.c    | 3541 +++++++++++++++++++++++++++++++++++
 drivers/clk/qcom/tcsrcc-kaanapali.c |  141 ++
 5 files changed, 3742 insertions(+)
---
base-commit: 88cbd8ac379cf5ce68b7efcfd4d1484a6871ee0b
change-id: 20251121-gcc_kaanapali-v3-ab91e1065bd4

Best regards,
-- 
Taniya Das <taniya.das@oss.qualcomm.com>


