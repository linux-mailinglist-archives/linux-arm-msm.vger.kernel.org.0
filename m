Return-Path: <linux-arm-msm+bounces-74759-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A475CB9C9ED
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 01:35:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E1DE0382F32
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 23:35:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D44F42C2377;
	Wed, 24 Sep 2025 23:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X07ZGBNh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED9382C0F91
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758756921; cv=none; b=f3yM+WssD3mrrxYv4Whsa4ejy2WIdcrxMnjfhy5FkoWA7mdCyzRrVu1Nwabg+54KO9QfGXOxSHnR+5rYhzA6xcIJwWzy4NQwRVlplJdvKmnEXzIgFpXKrLTNIpINpRaT3hjhxJD4AFyrDKqdTveHxWkn5rbK4v0wh5jiJcwSRVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758756921; c=relaxed/simple;
	bh=Q7Y5sKrFJYAcd7JLFQleIjbeTi6scSpI9zSmmOVIXBE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UnA6DPFqpq5BesKOeX5YDswkCmpwsjUNCYYuRvTgAFt9nkwdYMGBHoq/vPOnMswSXStAx3zMTha7IvIdFhdwyIh6TW1bafQ2lksKPpk5rH/3LFFPVELSfywtBImdOkKa8imMVwpPeVLZUuwteKx3oFRrv0mISXa4ToF3ZGNI7Mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X07ZGBNh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ODQ8fh001992
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:35:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QaWO9DEgDqVIwBTC8sgSyuuxsW+ioYv5Qng3RAcDRvY=; b=X07ZGBNhrkJS4Hfw
	hG9PrJmBLalpsAsTYTZwFlUwoy6qJc5mjZjhZoOq/b73ACt7C2QLh+shY1ijYTdQ
	Kk+6AVuaqCrIxJnyrkqm3Ape5SVp3ZZmUa/BEhQPEWOqnttXdZkkikb73tPuRIEt
	svuuBStU9+sgTRYVI2uiGhuCJ2lPw4l3ZyVJXCiLE+JoLOAmHo5HGWKvVBZgNQOu
	22aMbLxf5fzM55mYVbo//OPevCskz3au9EyJn07rrW8GgDiMiZap7ZrpgEm9q/b2
	etH6I+p4rPs4e+u3NsEkxtXcwsW0p7rY3IbnWvyXXFCI1y20prNa8DFlShQt/2/J
	I+OM1Q==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499k98p2aw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:35:18 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-780fdbbdd20so315434b3a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 16:35:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758756913; x=1759361713;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QaWO9DEgDqVIwBTC8sgSyuuxsW+ioYv5Qng3RAcDRvY=;
        b=pdaPOjZbtJlVJmrgrYbIDqImu3759rg/CUaUFq67oO4mhaehwrjN34EDPpm51Wgu0k
         5zmN5p0tEZ9lcWgROhv2d9WOh+rbK6yM7MFh4B66IvPX4PeL+1i1O0VFoWKwbkR3J35q
         7Imz9yBYed9aV67Y2b7Gz0cvEHcEzMZxOsBOIeor/GT24KgswseNlTQkMNW46mXiy5uq
         Tr62INo6FlhDa0rTW/SOPHQNiTC+LYGRIgxxlIfd950zPPjbPzQ/cFi8TN3IWnc8gSuT
         VmN+ddAPBNIBnV2/HrxkjpqYa2BnRxkj/BcU/Zkw7NWqvwz3siaeyH91yNSmFKdPdX8B
         5JVQ==
X-Gm-Message-State: AOJu0YxDMcXQNkxFYLk6S4ub1QL3wlmlniAbe0Z83Vpgrg5/oyKe/I/a
	mSjK/V+A2jANLZ1IG1ZaN50BbUkbHxSCcTIkL+sFehrGppvRoH/+FlISX58IZ/6SXo9oHW2oqVJ
	PkjOo6z8hyzjctoA1mvwv4jnvoKf4eIJBJ1A7xxYC9E5oOA7GixUC9G82OvAPIccr2PyV
X-Gm-Gg: ASbGncvcZx0r43MwJsg4kahLz8gQ+WIWBVggCZJE9acwUWTYmxkCoKojJpX6RVu0x9v
	ZrzpXq6Lna8tS7S8i3MgLPYL2dglsqTHkQ5RsfostwVMp8mKj8/H56kvuyFNL0blG9hkobpcGM0
	QJJYRxTQVVWOXRI+4HYCeoNiTcf6jPEL+esJ8PXx1gbF8AQfmhflF/ldy6rpqm782MGBxFq3SVD
	aFb+aELLmkeo1wuBk+Mo8VCty9wAqoiudj4qUuSfAC1kZEbeeyte/jqenyjJzdE4n9U71IXfSiz
	mWo2kB5JrLt2+ZnTbOXean4JadLgdGJNK/6uUwYkh2galkgWuohePzisW/xN2rkCfsQ80RuUD+s
	USIrQ2G9EGhMGWdM=
X-Received: by 2002:a05:6a00:3e03:b0:772:45ee:9ba6 with SMTP id d2e1a72fcca58-780fce17efbmr1909186b3a.8.1758756913522;
        Wed, 24 Sep 2025 16:35:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEBpn2lzR5gwMTN21ScTg1+Ioghs8Ao0Bl/JBGqmTWGzBcRYnazeZu1NEI/aAE8+KZ7s8VCEw==
X-Received: by 2002:a05:6a00:3e03:b0:772:45ee:9ba6 with SMTP id d2e1a72fcca58-780fce17efbmr1909167b3a.8.1758756913098;
        Wed, 24 Sep 2025 16:35:13 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7810238e9a9sm212379b3a.15.2025.09.24.16.35.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 16:35:12 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Wed, 24 Sep 2025 16:34:57 -0700
Subject: [PATCH 4/4] arm64: defconfig: Add M31 eUSB2 PHY config
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250924-knp-usb-v1-4-48bf9fbcc546@oss.qualcomm.com>
References: <20250924-knp-usb-v1-0-48bf9fbcc546@oss.qualcomm.com>
In-Reply-To: <20250924-knp-usb-v1-0-48bf9fbcc546@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        Melody Olvera <melody.olvera@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758756905; l=989;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=WnYe8cHS28Bdfzb1400w3Q/pQBsMgEBstbc7oiSATRU=;
 b=7uAglFkbwYo4jHhD7gwM2JVXFmP/o4yxCs15lZZSvumjLdI84vH7Fpy9ZL40trCRHSUoqDUDW
 CEe4pD6KhtvCG9NhhXIm71MfIYHuq4t01BYmmCRhc4C4Hro4PFs8IQP
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-GUID: tGLK5MtwZd02flFx-WFTNAP8XHp7hrk_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAxOCBTYWx0ZWRfXxBra4BKZW7us
 dx7951jxSkuzEdwAFTenhXGQJxtJgJ5fGxzkO/lPkWOycnQywfvAq5tgrge/mSeFMHBsrYBPhH9
 93BJeOc8AisEGqQAl75uF+lX7yiqyAb2XORDeNx7jKOT/kzRBjggTY1zWJaferGbChvSOAEa8P7
 PpnZOqxj+Y2+CgNXv6VWQIjqC6ju3nOOX5Feh9TAD2gg44yM5+JV8QaGb1jUssF8vLMJ8oGi1Xx
 6pOFOLT6Hs/vuE42Dz+NSoS1kA4G910tJ6U/wOgg0NLR7SQVVQR53yQKkWVaFgKjNEd+ynkouSy
 5P3W8QxmXruLmIDxde9TqiMp1mwbWQjmcv5oWG0WBWqhtzQL2IkVjh4JJQrm4qWWsLS7oHcBitc
 gPMJaSkE
X-Proofpoint-ORIG-GUID: tGLK5MtwZd02flFx-WFTNAP8XHp7hrk_
X-Authority-Analysis: v=2.4 cv=Dp1W+H/+ c=1 sm=1 tr=0 ts=68d48036 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=4ROhr7NTa0bsJorruOEA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 bulkscore=0 impostorscore=0
 phishscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200018

From: Melody Olvera <melody.olvera@oss.qualcomm.com>

The Qualcomm SM8750 SoCs use an eUSB2 PHY driver different from the
already existing M31 USB driver because it requires a connection
to an eUSB2 repeater. Thus, for USB to probe and work properly on
the Qualcomm SM8750 SoCs, enable the additional driver.

Signed-off-by: Melody Olvera <melody.olvera@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
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
2.25.1


