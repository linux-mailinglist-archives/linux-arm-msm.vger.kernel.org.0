Return-Path: <linux-arm-msm+bounces-77374-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 256C6BDE18D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 12:54:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 0C2654EAA9D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 10:54:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D88B831D727;
	Wed, 15 Oct 2025 10:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YUNq05bU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5558B31BC99
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 10:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760525597; cv=none; b=Lb7rGeNO6dzOAH36PIaDyr3s1s2oCC+s6WwFDMhJd5onIlgLsAQQ4DdKTWHKHnA+vvayBCgJB8HroGyRlDe9ESa5q49jkNropygeCsEdj6RCAyh8Mf+JyJjkFGyrtiTcSWNbjijbcSKF4CahYu4cnE5wgs9e6++B+iQqvAU5IdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760525597; c=relaxed/simple;
	bh=MHS8u7sUasvBS9lgafXSXHBip0anTOKGxbuZXAf0odQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Lo12aw0bY8fA8DTaMAo/qPqgnllR84nDn21rYZK4+O+KUckR87d0RAodoXqREfKqW4/uCmRlyNn2a6MSFBN1YSkj6BzKyIwPhnXl3p5l9atmfF8QF3F9zcxXxXg1NE9p3lzldZYotpda6WicdL9d3zr69HfbmlDs/uEZOAAGj5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YUNq05bU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59FAJf48003535
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 10:53:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=fQbIeL1NYHf
	9UHb1CwOW+nqwk/PLKyl/Gj01c0nPyCU=; b=YUNq05bUH1CMKlqX7gkwQBuNdhq
	Nxxa8BG+nD44hi1RSxZYTRrVQ+8EHpsevhRqQiSUgJOrkZ5HUWQe53ufxVo274p/
	PD6rlFaJErzlkyhydK9ozZUiAx9lwtCpTSDVqirQGi/ZQ+MIY2s3GQgB5MzAgQ1g
	7KmQ543NQsTsBM0orQM9zx5/3PhpNKSdagHsENMoj0VsvsPTnlJz1K9YGECxWsxj
	MoHpKOZbgSbJc0JKZacBQRLnhdpe2gZdD7ACtnnZNSl4G/3KGUOC8djyYjLGOgeO
	H7f2Ivo99aG/zNCE1rKUd9noBgMzZojQAiIb7rgzInhT4KxF9YU+zJP7gtw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49sua8jqe7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 10:53:15 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-27eca7298d9so268061845ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 03:53:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760525594; x=1761130394;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fQbIeL1NYHf9UHb1CwOW+nqwk/PLKyl/Gj01c0nPyCU=;
        b=BL2+JkU6+WKh4MUL6+jJmsdCrUdtGZLAu7JaFUPyUCAZDR4asvGvlvlNvFNv73sx4g
         EIAQjhSnrTIRfdgMyjxCtea2gotIfmhL14l3nRYOwUom6r84rWv6doxrEW5g9qKo5C6k
         t8EyOR7nwdKCDfKynQFbn2rNir3MRvwno7GLctQXRNzuR3KsI+Pt/QbiQjXWubyGXN92
         XofdFHGc7OJMzUdGD4cuG22qKc9iFnrH299xg1tB1ZtUUmyLpn8EbqBHRJjfg3xVodQy
         zGxihJX+jYJL04/fROzKANLiaEhFSvUiM6Km4sZa+boP9xF5nxzyzflKuln+XxVVb4cf
         xOPg==
X-Gm-Message-State: AOJu0YxXdTyOhYSxHhDP0XrgTB1+cc+Ad4oZ99T9WO1XY31oxTrY18rf
	uPNpXwKhZmWHG4HdiqOiDzVzcHFuCaM3h+cmWrd2dXLp/9qhmNZ+mAGVCY1Mx53YceLFKHJiSgY
	gQi4906QwSicQG8A9UErip9ypGf/ks4Ly9FRvbZ2g/B0eQd+uqNjRyTZMcFc+NpYHj2pk
X-Gm-Gg: ASbGncsZpVHKupi4vlSM1D3X0t3pDxRgRBjgI1rhc6rEQOnyDqJFJuy12o90qu+KCAw
	JY4xo0QYBajeM8c1J5Z+m6GzXOBSoq9LekfKLO7qkIk+e7Xf0DFWwarwD9+lW6NO3urUqB1tMkM
	mvrf+loRGH3OObrQjsaBkfDo2P7MqWXIwYHDrAHtG6RS+VvqX4tmNGoM8oo1nsWujZH7JDJNJKq
	E4S1UP6UEdgz1SRlxN5MQlIf1Q7E2qxiHwPtP1Z8o/+RX3Cwjs0Uh8GHe/fYEG1sFHFRgPHuIZu
	W9lCt95+FdcRYNraa9Up3Em88sHGqCZqHi0UNmgYHWncz/6KXF+v/r2hQl8mEnCDrMuhUniUZ4s
	B0Q==
X-Received: by 2002:a17:902:c94c:b0:27e:f201:ec94 with SMTP id d9443c01a7336-29027373e8cmr402296845ad.18.1760525593707;
        Wed, 15 Oct 2025 03:53:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG7UhX8xptIfvTz4g9frXK+vdn9Ssva+7MAMiKmWuSPnlkk6SggKkRgGndjbOlqjtzyury1Lg==
X-Received: by 2002:a17:902:c94c:b0:27e:f201:ec94 with SMTP id d9443c01a7336-29027373e8cmr402296575ad.18.1760525593231;
        Wed, 15 Oct 2025 03:53:13 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034e20f8csm193698385ad.49.2025.10.15.03.53.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 03:53:12 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Arnd Bergmann <arnd@arndb.de>, Nishanth Menon <nm@ti.com>,
        Eric Biggers <ebiggers@kernel.org>, nfraprado@collabora.com,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Melody Olvera <melody.olvera@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH v7 4/4] arm64: defconfig: Add M31 eUSB2 PHY config
Date: Wed, 15 Oct 2025 16:22:31 +0530
Message-Id: <20251015105231.2819727-5-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251015105231.2819727-1-krishna.kurapati@oss.qualcomm.com>
References: <20251015105231.2819727-1-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: f4jg5U34-DA78WQhpmZ9gdHfrjBk9N-i
X-Authority-Analysis: v=2.4 cv=e5MLiKp/ c=1 sm=1 tr=0 ts=68ef7d1b cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=ZS-ls5sy8mnZQVmeZLoA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE0MDEzNCBTYWx0ZWRfX1rGin96Sf+L3
 ixRRYFqK9XDeK7JapvH8gLCcm38T/rjjSTjkbKoLIoVQmGRwXp7RhTW7mMwWraTWx3dCSmks+mI
 nJKhz3Q19Mvppiko0hULgzuuGLZiUXiWOwg56zC5ndrB7pA4DCK7YrXxLstTpmM0D3aQTgEVMPC
 3mnu0jRg8MIv8i0l56L1YTfaL38S6hUH+/S1HGNwTIPXUUq0cldZ8HxTRdEKwFRLtYU4twpKmPL
 m8XrDmydAUPwUdxpGdxrXztl589UhzsBR8BOGHuD1ZKU0kW/xJe8YtMdhWL8lGLUYA//H6lk/R8
 HQApSAnnD4yWma4DwRl1ULktNXdHOyv3rdK7bMnqLwAb2Ga4kDz1SUh1oXGB3wU+OlrMmJe+D3m
 qJ1clwVaUPzlPbX6jl/ewBsRe7e60Q==
X-Proofpoint-ORIG-GUID: f4jg5U34-DA78WQhpmZ9gdHfrjBk9N-i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_04,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510140134

From: Melody Olvera <melody.olvera@oss.qualcomm.com>

The Qualcomm SM8750 SoCs use an eUSB2 PHY driver different from the
already existing M31 USB driver because it requires a connection
to an eUSB2 repeater. Thus, for USB to probe and work properly on
the Qualcomm SM8750 SoCs, enable the additional driver.

Signed-off-by: Melody Olvera <melody.olvera@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index e3a2d37bd104..24b1c943a7e1 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1641,6 +1641,7 @@ CONFIG_PHY_QCOM_QMP=m
 CONFIG_PHY_QCOM_QUSB2=m
 CONFIG_PHY_QCOM_EUSB2_REPEATER=m
 CONFIG_PHY_QCOM_M31_USB=m
+CONFIG_PHY_QCOM_M31_EUSB=m
 CONFIG_PHY_QCOM_USB_HS=m
 CONFIG_PHY_QCOM_USB_SNPS_FEMTO_V2=m
 CONFIG_PHY_QCOM_USB_HS_28NM=m
-- 
2.34.1


