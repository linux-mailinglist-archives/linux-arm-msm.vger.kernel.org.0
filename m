Return-Path: <linux-arm-msm+bounces-108352-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qNtaOhsHDGodUAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108352-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 08:45:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F4015784AE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 08:45:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4A8EA302EBB7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 06:35:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B748C38E124;
	Tue, 19 May 2026 06:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a2kXfKGX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="foM0N+N+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 575A0377577
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 06:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779172532; cv=none; b=NRz2lR4J0sc3scgcO2moLjPRrH8hV/ZE+5IAheTi91YCiwYGZTo3QvAWt3BhwJ4Fow2b+Jb73wRuE6/o9xbeWWXm7LF6dyWsnbNZYbR8cvyCdp4h9fOxlJo02Vqxk3OoR7bPjlDxo0YABexpEb4MMJp0UepBN7YLEmqYoOQ3IHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779172532; c=relaxed/simple;
	bh=NC/ZY+idUIZlGAn73lQ1rgtFKQ5JJg8HqlNadEGzgaE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=VgvOZRc3Ia48orjcXOzQeDO99FwYStoMPPbeNRQJqwnyGYBOekgpYi4zpkBmBo9XBqi5x2kmx49jX1v17eOAwlVdTe5KATX7qggoauCQoB/JuOHnoOFoX0LR9AfuWbZP+1dA8ulkk0j3hsjL/oeaCAgB0QA3Byo0UuqVUnIDWPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a2kXfKGX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=foM0N+N+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J5a8oI867050
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 06:35:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=R+tevW8hmJ6cwfeoghQQ+v
	saziQ6etj+POjKImStc6A=; b=a2kXfKGXI0wxv3ADNBYbtqLPHr1Sxli5q6pDIL
	ulQBMeFjQ0mPz/b+BP+aUi+RoHap77eY+yD5qbqCSAy1/oQT/bhqUVnNRyH0qZT0
	9TwMeqxJgp3O2W9rhZ++04yxhTys/WvOjThW99qOlNmmTYM+UIxDc6Vyoy7btcFJ
	vRnmJrcU/yM3quQ15c8wwUSQGHT1GA6awSkWuvvOgukrJygQXE946LzFgBCw8tGn
	1ZTRNxYTBQpm3JNYD4u2UVnTTE1QZFcjSZu8JXqH2AI6mkkRx5SRYQy/JZUtA9/R
	G2+1W+4cNomtCz8KiRC+dZetmX0OLEfsZr32oTu526LBjv4g==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8hv1g7mm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 06:35:28 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-12dc3d81736so2418908c88.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 23:35:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779172528; x=1779777328; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=R+tevW8hmJ6cwfeoghQQ+vsaziQ6etj+POjKImStc6A=;
        b=foM0N+N+AkBlSHCc5v5OO6isW+TWRt0sPhDlPBQ8WIt2Wjtn5WLTa35K+Ex1qMGxgy
         wKG2ZeMdcnfQworx2MGoDVY/qDxkZoOvpRlZ0Ttk+mwQQi9rejCTgd7492h/76be8ekA
         Iybx85pjM2teVa42juUMBNMJbqjwkCN7YzJ2dc689OyouV5TckdYk88Jwo6jc3FMHlcX
         fLNW7UzCnzoLzNxBd6dGkM2dQar3x0+Z3wbx7wcFyLiA3jBSKLksRXhCc5n0tO7bn9Ym
         kvNzZ9bDWYl0JOmp93m8YPM2OW6bwj2IOhqZh9DkS2TWQ3PmxJ79ES0Lq0nd2U9c0SPC
         Rf1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779172528; x=1779777328;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R+tevW8hmJ6cwfeoghQQ+vsaziQ6etj+POjKImStc6A=;
        b=Gcy/xgxTUs7M7MqugJTopLjfXXnnwB2tPJqG6h5plTQiEs8jpiw/wzk4GkeT6zvNTw
         fTnOOkpVGraM9g531UWrae9fmwoTc1U+ErrcoASDQzzllCeWviidNQfeYJpGIGDUQDSx
         aPjAtOTx1IeLs0H3UmZ0HmnPH3bwfgpk+x/cWVS1itzy83N5OtAEVbXgMpCX7ul7kl2Z
         COM2qUdIluNK+zc6LGKu7n05ED1MGOTBD+XjFG9Dkbd2JM5wq5xffm2XNRouUFKr3Xdr
         N5YXfky0DpdCGhEGoeicz1lm3fZjnd26uP945eFj6qaUtUbE4lQ3cIFk5BHyeL1TKrKc
         LW3w==
X-Forwarded-Encrypted: i=1; AFNElJ/aVkbKQvM8hesnDwjX5N7G8WCW3bvyBoXEJEjCEygB1PWKybkyCt3j6CS/CZWqHNx7fMfLn7A6fg/lT7N0@vger.kernel.org
X-Gm-Message-State: AOJu0YxyAZrN56b3J7RYqesIoWdIu6ncHJIzzzjTTTRYilaqAqLNMBXh
	gNOjP10OC/Cxl66qqPE3LP+V2SOKzSoOREFZiEObPn2IPK8gDotvvWrrs49YSMcMYDtIrBH7F2H
	hkAPaXmG3nHYIDIfJBl+VOpVdaOGke2OjS9V7Xe6BOkqWgpTwkAjPVovOF0Lw9APHyNH/
X-Gm-Gg: Acq92OEe0uwtLrRS/iJlKFH8NepPoHKCUDK8Rg8Y5ZcI9Tm1/1T1/KTsXqPipUWHrMa
	crjzpYbT6EE6JFuDq7UJIVVSA6ZiwGqZ6CEWyzfcC6+1kik0OpZB2LltQ+X87I2pfWZIIiqUoOS
	7hIlokrlkADDv2jwt9ubmNTARiSAipHDOTate1sWuyPgl+7ik10Ec0i4kEe2qzdhWyLQrpg957f
	uJ95spfiVwksCrJg45tz7sWDfwsoMnh1aWZVSRYtHqwO8L3RKs+llyRYy2X70RIwjPCk2ctcgG4
	QZUKZ90+uMS5Il2JsjXyrdyAY5EggMrIliZR7AelyAIQZtZyOJpMkk0B7+Fx4cKFfPhgWS5g1Ya
	7HSdyqnlAltRz+1Vv2IaxuXobRWXYBOPNOhFNxYUse/zz+YfawhI+6eTt7gSfOLoKDa8W0boU8r
	IHVmBGXA==
X-Received: by 2002:a05:7022:6082:b0:12b:f616:1a4e with SMTP id a92af1059eb24-13504740a2fmr7007233c88.23.1779172527831;
        Mon, 18 May 2026 23:35:27 -0700 (PDT)
X-Received: by 2002:a05:7022:6082:b0:12b:f616:1a4e with SMTP id a92af1059eb24-13504740a2fmr7007207c88.23.1779172527288;
        Mon, 18 May 2026 23:35:27 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cbdcf140sm22614537c88.5.2026.05.18.23.35.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 23:35:27 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Herbert Xu <herbert@gondor.apana.org.au>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v2 0/8] Add initial device trees for Nord SA8797P
Date: Tue, 19 May 2026 14:34:57 +0800
Message-ID: <20260519063505.883379-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDA2MiBTYWx0ZWRfX75gxaW+RgH0J
 X8bgj78jan5rSmxMpcg9sjvlkZi0BWFVieTLc94XoCKroG2Tc7H+Nk+sEe+AdvWAtCP5sn3cE0t
 lczydDgJDoYoKyb9uPQO3wXyFFgyFXamNJ+txHVIAXAVoth8YghgoaAYF0MbpXaoOM8qGLKD48s
 ymyT69DbYfXl739+Pat6gpvZapgkxbdL+K3gIb0feKe78LhRwH/kLcMU/NIzUuQb9tOeDns8FkK
 Hbma/0bb99VHuv1QtUqqvdjvBzPCWwE45Zq6QNAMBn47Pqk0EQfXmyVLSGvfdxyVFSNvHOhCFLp
 y1nZufpaSTwp94iM61v3caRH1oi3dZOBmRQl1pkK2lh9H7bVJf1YrDl8zwJRPt5aOODZDWACKlf
 HAKX7SbZPPNy+pfXDz6XqSr321W9o5d8CpYlGkhRjQOWJoucSx9LfvS/ereAvJ5covz3jnfLUWy
 CNy1EB1gGaR+T3oeXsg==
X-Proofpoint-GUID: iyezSY0qYeLpxvCdb8Hg1n8JezsWB8ko
X-Proofpoint-ORIG-GUID: iyezSY0qYeLpxvCdb8Hg1n8JezsWB8ko
X-Authority-Analysis: v=2.4 cv=WZM8rUhX c=1 sm=1 tr=0 ts=6a0c04b0 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=rvxB5pMcHL_gHO18BLkA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 phishscore=0 spamscore=0 impostorscore=0 adultscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605190062
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-108352-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:dkim];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	PRECEDENCE_BULK(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3F4015784AE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series adds initial device tree support for Qualcomm's Nord SA8797P
SoC and the SA8797P Ride reference board.

The Nord is a new generation of SoC series from Qualcomm built around
18 Oryon cores (qcom,oryon-1-5) organized in three clusters. SA8797P
is the automotive variant in the family.  The IoT variant IQ-10 will be
added later, by sharing the base nord.dtsi with SA8797P.

Dependencies picked up but not hit next-20260518:
- CPUCP mailbox: https://lore.kernel.org/all/20260427005236.230106-1-shengchao.guo@oss.qualcomm.com/
- TCSR: https://lore.kernel.org/all/20260504081122.825635-1-shengchao.guo@oss.qualcomm.com/
- TSENS: https://lore.kernel.org/all/20260504081236.825755-1-shengchao.guo@oss.qualcomm.com/

Dependencies to be picked up:
- RPMH powerdomain: https://lore.kernel.org/all/20260414035909.652992-1-shengchao.guo@oss.qualcomm.com/
- APSS SMMU: https://lore.kernel.org/all/20260519013950.873105-1-shengchao.guo@oss.qualcomm.com/

Changes for v2:
- Rebase on next-20260518 and drop dependencies that hit linux-next
- Include SoC ID changes into the series
- Include ICE binding change into the series as the prerequisite change
  from Harshal [1] was merged to qcom soc tree instead of crypto
- Improve commit log of SA8797P Ride binding change
- Use label in nord-sa8797p.dtsi for referencing nodes defined in
  the base nord.dtsi
- Link to v1: https://lore.kernel.org/all/20260427023455.236410-1-shengchao.guo@oss.qualcomm.com/

[1] https://lore.kernel.org/all/20260416-qcom_ice_power_and_clk_vote-v5-1-5ccf5d7e2846@oss.qualcomm.com/

Deepti Jaggi (4):
  dt-bindings: arm: qcom,ids: Add SoC ID for Nord SA8797P
  soc: qcom: socinfo: Add SoC ID for Nord SA8797P
  arm64: dts: qcom: Add device tree for Nord SA8797P SoC
  arm64: dts: qcom: Add device tree for SA8797P Ride board

Shawn Guo (4):
  soc: qcom: socinfo: Add PMIC PMAU0102
  dt-bindings: crypto: qcom,inline-crypto-engine: Document Nord ICE
  arm64: dts: qcom: Add device tree for Nord SoC series
  dt-bindings: arm: qcom: Document SA8797P Ride board

 .../devicetree/bindings/arm/qcom.yaml         |    6 +
 .../crypto/qcom,inline-crypto-engine.yaml     |    2 +
 arch/arm64/boot/dts/qcom/Makefile             |    1 +
 arch/arm64/boot/dts/qcom/nord-sa8797p.dtsi    |  937 ++++
 arch/arm64/boot/dts/qcom/nord.dtsi            | 4511 +++++++++++++++++
 arch/arm64/boot/dts/qcom/sa8797p-ride.dts     |  306 ++
 arch/arm64/boot/dts/qcom/scmi-common.dtsi     | 1918 +++++++
 drivers/soc/qcom/socinfo.c                    |    2 +
 include/dt-bindings/arm/qcom,ids.h            |    1 +
 9 files changed, 7684 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/nord-sa8797p.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/nord.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sa8797p-ride.dts
 create mode 100644 arch/arm64/boot/dts/qcom/scmi-common.dtsi

-- 
2.43.0


