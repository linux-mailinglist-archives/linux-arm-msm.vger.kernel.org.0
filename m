Return-Path: <linux-arm-msm+bounces-71118-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E127BB39CBC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Aug 2025 14:17:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9CAE4A0003F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Aug 2025 12:17:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5372B31E0E5;
	Thu, 28 Aug 2025 12:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ErOIrdgr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 957A031CA7E
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 Aug 2025 12:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756383069; cv=none; b=jD7w7AVuSaAg/VLxBG4zJfilGK76swxUwjOtz4ErOVBFOnCian5G7fj59JtzX/9dSEiiPTUeNYXUOuNDdFqk6OZuYSjjDpYGXk1I7wBH4YmaulzkKXq6svFbGiKAz56XBrp9qUtXvVfDj59G9TnqgbzITeZzXbvAFrLL69nh3TE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756383069; c=relaxed/simple;
	bh=tq3IuL7wCC29pby6qPkuO/RCGMkeEsQAVfNt3fPCWAQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SDTQtu/CoLsERcn/JKB9LURYdzOu3nMV3W/vcsDtp/8CyYJwJinqFIn4Lr5kkK2Pp+rPrCWxoyRMY5u7cVKalJCkUjW+7oqnKq8kgJrRoQkhFrHRo3ugB1pZQct4GjDhyMooWstM2OSvdJXprMYZnY9aKAJWS3Eg0swcJ7LQxb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ErOIrdgr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57S5YJrG031273
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 Aug 2025 12:11:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PhePwHpEAaOWHj8GxjUD4EtV9ZXNnl5MLU1KHln2exc=; b=ErOIrdgrwTfY3tXl
	y32VFyZbmwxIbH4eBcHEKhNvVwFOlvexYYFNjCmIVygluAkXDzMaYceLP/rHqREb
	JaWv6kBmuIPvNogTo/f4h7yK3G1LxtA3D1wet2NBmZ6ttB42OFkzLhEBE2mAHFah
	drXmeEGI8RZ1FRGXMdrYTu1JHaHQb94GJX6ARX+mKL1n4JCayKnXyFWl+XT718sL
	JzcMzkysTw/etmKG23Sq1i9OJwSkAQw6+RxyB3O7os0Iujokrdk3GGWdEl1z11Jy
	PtmWNqcZTV6feLg+KPUFUjEYFeCYljRKteXouith/glPoRUa8JI0sL3yXMqZ1iJ9
	o1pyzw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q615r20r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 Aug 2025 12:11:06 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3276575ae5eso1042691a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Aug 2025 05:11:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756383065; x=1756987865;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PhePwHpEAaOWHj8GxjUD4EtV9ZXNnl5MLU1KHln2exc=;
        b=n1Hh4u42vSAEh2u/VDFQ9m/5H7YpITkpd+sCIEgdQ9rbYiuRY6PujfqVmmmCapPs2+
         ulPV8dDw90SRTaPTrzs4DxN0LSDm9iQLF9fpbDd/zUAlKkPi1QwRaiFAaLqQxxtuNaED
         z23P5jMsj2g8f8zpTv6Asm5rUQpbkZVTBwKp/zkS0/gCpXJimWg1wVeQujtzA0WYJCFW
         NMs0POjAqaSIt4i9YUWJMw/PGqf+VN0sKbhRFZVQIbIDsq7yRtR4L5JijrE5ylUgLrzq
         utZm8uGkHqPDzM0JRdTJINMM/44k0qfb+yj29bfJ8AwD1LNTlr2dljsarPrSptiy+54R
         AC9Q==
X-Forwarded-Encrypted: i=1; AJvYcCW7nGq6BKN2eWh9Cf11o3WgnrzpdfR9uVTbwSgaQn2cDLD5jQM8cThbv7cLteZRlY6t+zBDCxoTg41pkaIe@vger.kernel.org
X-Gm-Message-State: AOJu0YwGOvnuIjARk8+75Ot3ewDj1lr2uqLfCm1AwqUT6WhWffUiZN2A
	CxF53VdsAcHi93pshe0jY5Rip3Z0gt4IxgS5bysxhygDtbhC8rB7DRe1JElpO6J286l6LRSCD/q
	xKlDjulElU1NRaVj3dTKsxceHtBjGnX7zkmgxcprdY9N9bNrWcOJpiWw42IwXjtpx1JGt
X-Gm-Gg: ASbGncuQlB3nCgsavuHNJB6lhqvbwcOfUCdeZaUuYaB9w1sib6rRRh1WhmUjScYAb6C
	vWgJFhHb2JoY+l0GROeVoyh8Yz5LR+45KkD3gEjkC0L5TM82GS2PgF9G+t9vgh0WjRc+eSpZ5c/
	wfxiLDKyMbKcgBEk3CYT/iPzTgWJFOJ+lKZkhyxryD1htEa/kkavfiyN7Iw5iVZ5BIvG7ySlrdA
	njWa86atOAGbZedqUzv35Vqt1U50x8GUcOkaAVx4lioPJj0Z5lCoCO0Vv1Ka0GN/G7aEZx8m12m
	APmbvfyQJLddmEW/40Vn+u4Chdx8xQ9G5IP/OHI/KQds+nvZJD2ftZF68T8+mmDUUnkK8Bzc/U4
	=
X-Received: by 2002:a17:90b:3d86:b0:327:c934:e5c5 with SMTP id 98e67ed59e1d1-327c934e9c6mr1060058a91.0.1756383065269;
        Thu, 28 Aug 2025 05:11:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFzP2wU+CuvXGok9xOucMGBvgqE6LOekvba8Nillw6XuZ8T4Bb1geXsLXy7ey8/aUya6rM7Yg==
X-Received: by 2002:a17:90b:3d86:b0:327:c934:e5c5 with SMTP id 98e67ed59e1d1-327c934e9c6mr1059974a91.0.1756383064683;
        Thu, 28 Aug 2025 05:11:04 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32741503367sm4019070a91.0.2025.08.28.05.10.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 05:11:04 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 28 Aug 2025 17:39:06 +0530
Subject: [PATCH v6 9/9] arm64: defconfig: Enable TC9563 PWRCTL driver
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250828-qps615_v4_1-v6-9-985f90a7dd03@oss.qualcomm.com>
References: <20250828-qps615_v4_1-v6-0-985f90a7dd03@oss.qualcomm.com>
In-Reply-To: <20250828-qps615_v4_1-v6-0-985f90a7dd03@oss.qualcomm.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        chaitanya chundru <quic_krichai@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, Jingoo Han <jingoohan1@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: quic_vbadigan@quicnic.com, amitk@kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, jorge.ramirez@oss.qualcomm.com,
        linux-arm-kernel@lists.infradead.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756382994; l=898;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=tq3IuL7wCC29pby6qPkuO/RCGMkeEsQAVfNt3fPCWAQ=;
 b=bavBQG/YKidnGf9CN7mjFGyftQOzvdExbFhBzxCH8ftSQSOg9DBCr7nJhMBt8rLSZldn4ZdKy
 nnFvOpxZRgTDmfvPkhinzKckUm/4tsly1FDV1zqyHupee0Wu6jTglxx
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzNCBTYWx0ZWRfX95lo1h5ho5tc
 wmOmEq9biw8zoGQjBj4zrI5V28T9kNEzL9gKK85bzNTsWQDVpYcKHFMTDtSiiy3+ZMgBTBf6nqh
 UXGG3fSm+tbdOi3jByVh4rOp4YydW47iF+0VK0mj0Y4xTp3nZ6LljZS9Gc80x4/RRYsJz4lFoR+
 4qd/H53A5xA3xSQIxrcNitjMr8IWRHvirRdtIYewHyLy7m0FJKZhcReyEKJuI5Wjh76tWpPQBCv
 PNkFBjEo1tKndww8aTLbesXcsUlGy36OlthMgJXW2aDZh5LWGIryXqYZr7PaH35/WOvEMYdAJcZ
 4PEEjbo6x/qUDr1Xhc4gE26/0PK6Wcrh0teGLtMep633XoZ3LJnFTIBVVTVzOgZ5E4R0tbRoEvQ
 xSz7HNmm
X-Proofpoint-GUID: lYk001dg3Er4bNZNsPzkveesIlEMfhWc
X-Authority-Analysis: v=2.4 cv=K+AiHzWI c=1 sm=1 tr=0 ts=68b0475a cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=5PcvmwL3LSb495PBagkA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: lYk001dg3Er4bNZNsPzkveesIlEMfhWc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-28_03,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 bulkscore=0 clxscore=1015 adultscore=0
 impostorscore=0 priorityscore=1501 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230034

Enable TC9563 PCIe switch pwrctl driver by default. This is needed
to power the PCIe switch which is present in Qualcomm RB3gen2 platform.
Without this the switch will not powered up and we can't use the
endpoints connected to the switch.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 58f87d09366cd12ae212a1d107660afe8be6c5ef..c4cc2903c13c526168b592143a81b5e6333b6c07 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -248,6 +248,7 @@ CONFIG_PCIE_LAYERSCAPE_GEN4=y
 CONFIG_PCI_ENDPOINT=y
 CONFIG_PCI_ENDPOINT_CONFIGFS=y
 CONFIG_PCI_EPF_TEST=m
+CONFIG_PCI_PWRCTRL_TC9563=m
 CONFIG_DEVTMPFS=y
 CONFIG_DEVTMPFS_MOUNT=y
 CONFIG_FW_LOADER_USER_HELPER=y

-- 
2.34.1


