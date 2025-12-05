Return-Path: <linux-arm-msm+bounces-84417-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D35F1CA63B0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Dec 2025 07:32:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8E61430184DA
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Dec 2025 06:31:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 350A52E88AE;
	Fri,  5 Dec 2025 06:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pxVnqhVH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TxjUv4UJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69719EEC3
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Dec 2025 06:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764916312; cv=none; b=MR2BEsELH4en0sktPK3WuovW0k0e9yoGGW4zIEGlHjulOOnmaj+tyKLE8gRRgxswXYv3885m14z8l/HUgZjDQ7Uz+TT3LDw3G1oikDaor0rh2H5IoFEGlQhAgHuH/t6yNzEWrfL790FyqdNYm3y9OmC55PK/CcKcvwtIlBK/GP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764916312; c=relaxed/simple;
	bh=TV4Wh8DuBFLSn9iqiPpF9Yb11GTXnanrJJ/+jf2C6Ns=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=WBS5U18Wt8Q0kDppqxIV3GX2Fe3vKwl8QZqY5kNoEbIZItI+DezP6gAYqyyISOQ4PxzxcLY/52PyUFcYzDOa7sEpJg0NKHdZm8ebqmGdfD8f0Pwhh/2m/TnW2w1XoLzQ+MaiiFz4co8VaaziFlRfa2bLa5gmHcdxtRoUHwbgmX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pxVnqhVH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TxjUv4UJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B4Kxnwf2406756
	for <linux-arm-msm@vger.kernel.org>; Fri, 5 Dec 2025 06:31:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Q+9AHN9kEIgA2gD31kEpBA
	MjAzdaS6BKpf4Y3DogFgs=; b=pxVnqhVH/ziEvYkWHKXSKnBLJ5vooi+PqlZGsY
	OT+9rue+Ln3uv0/Bdv4rO0WXGimLpko0UWuTu3nXHtuPR3jXiPW+56lpi7kg++3v
	FIb47MUe5Zs+bLr+dTrwGc+HGEvFdYlaMsswBedtBytxeOZZXfMbd6MohnpMt+IW
	ZyPzfqxBCFX5CrMbZ1xUJ7sC4YIB+VKqALC7G6utAhlP1yyOBGdPZ0vQ7/B780q9
	O6sqKoolfBaJIU5rPACBRTMuSfeuzDxDiOmYutWEF6bDjGRv/x5FbKEJ5DLIIsKI
	63WHI5dor3VKYYyGhEVYpgICv8zUK9XXb7jsQ6eXLVgrdETg==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4auhty9720-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 05 Dec 2025 06:31:49 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-7c702347c6eso1727301a34.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Dec 2025 22:31:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764916309; x=1765521109; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Q+9AHN9kEIgA2gD31kEpBAMjAzdaS6BKpf4Y3DogFgs=;
        b=TxjUv4UJbfqFwtx2gZxe6LY24R6F0nJDv9M6WkI71KyILx1N807dWg++LVr24/u9aV
         KaDtwvxW7Edhu+L1g7Utgn1b7B1DjOkTbqdQD1CqVyFGDV/U6p0AtTrd5eRyJT4FLnhb
         Wg2Q4EPdWY5ti9Nq5T55SNDZqUkPJ0u5fdcL97sSVEPeOA40Z9UJxh4O5i8oY7pZE2Fg
         Jcp+D/uod0dv6XMfdK4dbRduiC38IezHy3MARAk5AxrLcNIkcOvrC6yMzGiJSiHzbbeH
         uyTupmOaPdK9/mOH/TeF8ta5wJORGdgLECfacMk+PW1Wbl61cXEXKq1gJjAf1FrqGd4a
         XKYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764916309; x=1765521109;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q+9AHN9kEIgA2gD31kEpBAMjAzdaS6BKpf4Y3DogFgs=;
        b=Biui05gTC2aBL6zvS3gkIfxx+BSVdtX/dhG0aG1vFwq0UDdVLuJX5ZZKvTtXSeJCjR
         EIBQhJVX439XopgtOMpb6i7wfJyOjjShxRffZXDuHFCBky+8kDl8srDAPRRioYhTlxSH
         T9MMmHHbKehoTRByc3+hXg71P6QPTLiPRX/4ZXKsvDmwbg8CbLKDafKPX+SEk8ypIo+f
         mDRll6pBrC7zloxeSI4/9LfuC3wr+GFtudNw4CTmOoMfC4msoRFet5iBbmlZfxPi2H5w
         vtGTuEFuaFOdtA8WBbznQMzd1kGmhfNWlW6kENGjDWUcD3k8POA4hXfr2ABCLwuGutG5
         OW/w==
X-Forwarded-Encrypted: i=1; AJvYcCVfCoGFP9/kqYiBrr9MEyI7SngroM3FQntf9U0dvcG6jrEtY4N/Sztz6sIwlPCIqr5Y9AglKfEhHI6KFyEj@vger.kernel.org
X-Gm-Message-State: AOJu0YwNDVcgLASSfwccDGSc22BDdL3fDOAoUtOPko7wbnX5yemFqQ18
	GyeCXVPg8GffFHXXjG9urkNVFWL1LNX1ZDhEwaLVRy7hJiHlu9SdGPPGgq0iNCQsX4OvucLB21G
	Qmmx9vGK5SECia9i4AobpP2STrjSklxccaCFrjBx7C6hk4OfVpjnzzu8IzVGipA+7Dadl
X-Gm-Gg: ASbGncsrMn05+PiGvoXRaXT3KV9C6cqxx08H6MOLYgAWIOj4kfN/Uehr1AcUoaI4vDX
	TcUUAdixkFWAzn/FAnNLM86nug/bHmA10MjRBTV9EMFOxfRWJy05xZV+8BRPjwBWN2Rp7879h1l
	gtMfjJ+ciuXcG1TLNtRKivU7Uu67l9l1W9I97hzYJ+q3iSYRWft8WVAobbNv0YO9P6JbMQ6lJz9
	J2Ohk/F0h3p56B3XcQbJGWg1ie4NiYrPTnwGBfyuSkIWjam79IZ5zHMthg22+dv2GGJ9CqhVxxC
	xXZGDN7z4yVokake1yQq+pi6iQBoegoHfE8smzzNG49r/FxthrFg56OGIQRnNbtpYJObWUyQfpn
	smCI6eIwjXO0cYcppUmNspRQsD0ng6vgb3QfDDA9PTeD6JvDH35xCtgrt5noM
X-Received: by 2002:a05:6830:44a5:b0:7c7:7882:8ec6 with SMTP id 46e09a7af769-7c94dc9477amr5038692a34.36.1764916308717;
        Thu, 04 Dec 2025 22:31:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGPVwES8GudKU0XEQvtFkd+1ki6b8AxbY/heLLd/ribBnNo7ujSYR1Vdj1ZUGH5dWz8ehKZjg==
X-Received: by 2002:a05:6830:44a5:b0:7c7:7882:8ec6 with SMTP id 46e09a7af769-7c94dc9477amr5038679a34.36.1764916308295;
        Thu, 04 Dec 2025 22:31:48 -0800 (PST)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7c95a8f85e7sm3223326a34.4.2025.12.04.22.31.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Dec 2025 22:31:47 -0800 (PST)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Subject: [PATCH v2 0/5] arm64: dts: qcom: Introduce Kaanapali platform
 device tree
Date: Thu, 04 Dec 2025 22:31:18 -0800
Message-Id: <20251204-knp-dts-v2-0-596d8398c6d3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADd8MmkC/31RS07DMBC9SpU1gzxjJ7Gz4h4IIXvstBY0MXEaU
 VXcHScgyoKysfSk9x1fqhymGHLV7S7VFJaY4zgUQHe7ig922AeIvuCKBNVIQsHLkMDPGZT1jQj
 Y1o2qq8JOU+jj++b0+FSwszmAm+zAh1VftHKlHWKex+m85S24kjdrYehqvSAIkL13rJwJ6PBhz
 Pn+7WRfeTwe78tTPX18RU7h7VQ6z1+518plwVoYCWHP/Pxi7WCTfY2wSLDOYEDR1M6rblHV76n
 fOkF6axMTMzROoTZ9u7p1i/ybjxs/eQZp6kAohMe67xb6j87p1JcFIJUyjjWTQHVDgut9flYkj
 gHS4QwSTaMdOTLY3NiCJLewPDK4OPg47ME0gVqjPfc+fMu2/1rvG+du54ip1Yqc1bWshXbCWyF
 Qt7YtKDhpTcO6b8s/fHwCT2P9NUMCAAA=
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764916306; l=4508;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=TV4Wh8DuBFLSn9iqiPpF9Yb11GTXnanrJJ/+jf2C6Ns=;
 b=X15Z+ZePnMC3JvXj0M4a+GlgGjuMkCJNavQpfV3PDxeTgUDjBmXQo0M9mMlLMSu2O0NQnLcZi
 C+vh8gvs5epBdtOui+AlAByJrfIfD+dyxML6qoXuBzu40pLGhCLF5gg
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA1MDA0MyBTYWx0ZWRfX0OyHrY51X/G9
 qNtrCHpPYgF1DPZktEUzpmG3WmPX83pJD3jYyGa1kM0CI+Co4am7jobLfsOKZxM0Mf8CpHxvJj7
 NVwYgH+9qqXgisL4ZqI/O/AH69DHBlG6Bg2NahC26t3vQQVztT9RT09Dta/3RR5Kp6amn2JuWZV
 /K9iJOxs6kfm+TOAeJ1ZIiX9yFi5eVVXdASiUIZzfTlQ9s8Z+ydijpZJcp/lFn5J6QUx2E7h7fJ
 WtvegkJJBD1z9hrS4j9rxcgX2Oy8SMmrjtW3f+Rq2PbsxbLQCOKOKWjNwJQ3kaeF11RmtVPh3kI
 EDPuUGPV5u7Gy1UJziLyw/6VZzJxdHSLNdAFhrg7vHx0O886S6+UOo2xRMS8JZUN7VKrvdtiI16
 KSwZIrl5CmyGm3G+r2Z3W0l/VWwMFw==
X-Proofpoint-ORIG-GUID: O7R2-csYpgzoHR8J0W7OVUqGOj-nXFjO
X-Authority-Analysis: v=2.4 cv=DplbOW/+ c=1 sm=1 tr=0 ts=69327c55 cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=bWsk7nGGAifYO06aIhUA:9 a=QEXdDO2ut3YA:10 a=eYe2g0i6gJ5uXG_o6N4q:22
X-Proofpoint-GUID: O7R2-csYpgzoHR8J0W7OVUqGOj-nXFjO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-05_02,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 spamscore=0 adultscore=0 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512050043

Introduce the Device Tree for the recently announced Snapdragon SoC from Qualcomm:
https://www.qualcomm.com/products/mobile/snapdragon/smartphones/snapdragon-8-series-mobile-platforms/snapdragon-8-elite-gen-5

Add device trees for the Kaanapali SoC, MTP (Mobile Test Platform) and
QRD (Qualcomm Reference Device), along with the corresponding defconfig
and binding, providing initial support to boot to UART shell with UFS
enabled.

Features added and enabled:
- CPUs with PSCI idle states and cpufreq
- Interrupt-controller with PDC wakeup support
- Timers, TCSR Clock Controllers
- Reserved Shared memory
- GCC and RPMHCC
- TLMM
- Interconnect with CPU BWMONs
- QuP with UART
- SMMU
- RPMhPD and regulator
- UFS with inline crypto engine (ICE)
- LLCC
- Watchdog
- SD Card
- PCIe(enabled on MTP board only)

build dependency:
- gcc: https://lore.kernel.org/all/20251126-gcc_kaanapali-v3-v4-0-0fe73d6898e9@oss.qualcomm.com/ - reviewed
- ipcc: https://lore.kernel.org/all/20251031-knp-ipcc-v3-0-62ffb4168dff@oss.qualcomm.com/ - reviewed
binding dependency:
- pdc: https://lore.kernel.org/all/20251021-knp-pdc-v2-1-a38767f5bb8e@oss.qualcomm.com/ - reviewed
- cpufreq: https://lore.kernel.org/all/20251021-knp-cpufreq-v2-1-95391d66c84e@oss.qualcomm.com/ - acked
- pcie: https://lore.kernel.org/all/20251124-kaanapali-pcie-phy-v4-0-d04ee9cca83b@oss.qualcomm.com/ - reviewed
- imem: https://lore.kernel.org/all/20251123-knp-soc-binding-v4-1-42b349a66c59@oss.qualcomm.com/ - acked

There is one remaining open discussion about the CPU compatible naming
which is not specific to Kaanapali so we keep the "cpu,oryon" compatible
for now.
link: https://lore.kernel.org/all/20251119-oryon-binding-v1-1-f79a101b0391@oss.qualcomm.com/

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
Changes in v2:
- reorganize patch, merge initial features in one patch
- update UFS clocks in GCC
- fix nodes order in boards
- enable CLK_KAANAPALI_TCSRCC for clk driver change
- merge tcsr and tcsrcc nodes
- change imem fallback to "mmio-sram"
- minor code style fixup
- Link to v1: https://lore.kernel.org/r/20250924-knp-dts-v1-0-3fdbc4b9e1b1@oss.qualcomm.com

---
Jingyi Wang (5):
      dt-bindings: arm: qcom: Document Kaanapali SoC and its reference boards
      arm64: defconfig: enable clocks, interconnect and pinctrl for Qualcomm Kaanapali
      arm64: dts: qcom: Introduce Kaanapali SoC
      arm64: dts: qcom: kaanapali: Add base MTP board
      arm64: dts: qcom: kaanapali: Add base QRD board

 Documentation/devicetree/bindings/arm/qcom.yaml |    6 +
 arch/arm64/boot/dts/qcom/Makefile               |    2 +
 arch/arm64/boot/dts/qcom/kaanapali-mtp.dts      |  754 +++++++++++
 arch/arm64/boot/dts/qcom/kaanapali-qrd.dts      |  712 ++++++++++
 arch/arm64/boot/dts/qcom/kaanapali.dtsi         | 1606 +++++++++++++++++++++++
 arch/arm64/configs/defconfig                    |    4 +
 6 files changed, 3084 insertions(+)
---
base-commit: b2c27842ba853508b0da00187a7508eb3a96c8f7
change-id: 20251204-knp-dts-4ad60e175645
prerequisite-change-id: 20251121-gcc_kaanapali-v3-ab91e1065bd4:v4
prerequisite-patch-id: 9a9cd779ee23419a023893f357decbe09da1e42f
prerequisite-patch-id: b7d46739fd97b16bbf635569018bdd809fd30966
prerequisite-patch-id: 0baee9ea7681fe6b4ab1c69f1e087427ad0050e9
prerequisite-patch-id: a7ee79adf85ce9c5aedca168a561a9560fa59b44
prerequisite-change-id: 20251028-knp-ipcc-6b4189f71121:v3
prerequisite-patch-id: 6cf08b941741eff023e37a6a8afd5478bdf0788d
prerequisite-patch-id: 0ad500fc45e104a874839181b5ae59a4867ba1cb
prerequisite-patch-id: 628073856ba29bc3ed64f801dda4c9c7d767f327
prerequisite-change-id: 20251021-knp-pdc-395e2100d15f:v2
prerequisite-patch-id: 91797dc6f0e455a546d73254df87fc0ca22aa142
prerequisite-change-id: 20251021-knp-cpufreq-3449bc8c2014:v2
prerequisite-patch-id: 6c96544a929e0633c39eec84bd77f872fa3327ed
prerequisite-change-id: 20251124-kaanapali-pcie-phy-31968b2b2916:v4
prerequisite-patch-id: 265d61c5de05beea27297c10299239faeef55816
prerequisite-patch-id: 94e3936a21c0e19e5f1990a5cddcb1474b9adc95
prerequisite-patch-id: 69f436a719908a2210b4a4074a0b92bdfef2efd3
prerequisite-patch-id: f0c39c4a4de3b45a66ec8916e8d86a8ad059ade8
prerequisite-patch-id: 389060752aa271d1016ec115f19c0edfd1f831f6
prerequisite-change-id: 20251123-knp-soc-binding-96e2798dcfde:v4
prerequisite-patch-id: 789208c9126c28643c289754cab1681ef3bd396e

Best regards,
-- 
Jingyi Wang <jingyi.wang@oss.qualcomm.com>


