Return-Path: <linux-arm-msm+bounces-81453-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 59AF8C53618
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Nov 2025 17:26:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 39C9E4A3C80
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Nov 2025 14:59:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B504C351FC5;
	Wed, 12 Nov 2025 14:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JB97MKGv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LlaL2ZGq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10C3633EB11
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 14:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762958918; cv=none; b=LXzyfLo5a/g+9lLhLWnhkrQlvA36mhIVAAK4mHdLJ9l71TPUH6nC+togaHik+55XC4lTW2egAzE7ryScDXqPuLsGABpvhhYFNYyhFiwZVaFdOH9j4ZW7L+r5Id87n4k6t/hsBQL3n6Z2MJJijLIJwr4eGNYubJNITwLcAribrgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762958918; c=relaxed/simple;
	bh=Qs4er2hr/+T56uOBc6ouWcD8kx6jWka+YYpKp1dnXMs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AzKnIrjgOieAN93ZOQjZEt2reXWkf+wUMkexuZCtfiUbNxdPrqgcKXlHCR2I7tLQCBFAM20lyliTaC7FRBlR74WxIDykVcI/3HkPGhsF7Ru6IOgnA7SrwfsQu40Iq+vpdRVbC9a4pPjOaJ+9L2jhvq3KYnRVG5gneS5Rp/TFu0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JB97MKGv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LlaL2ZGq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AC9X3gx1001824
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 14:48:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+NRoHwCSxaMf980uG4MgVlLpp2Qeo3tytVe/hv/KALI=; b=JB97MKGvC0iOpBBD
	3ILVda37QLgeEc6+sV97Uak7qRVY2bo72Nvh1+9GDnHSaObX6o/d0inkq28MAi2H
	m3eVfYbVKrroCGVMhbc+vvlZUlYsbU2IpvZA2Y9Jl7njidv7Q91/cuowkU+iTGI7
	1nmc7W7QiLjqAGyEy1ExS+M4zot2OowRvoY6OMM4DoFbviTXgY7V1ODwZuffQPRH
	3DCyjWAjORGBpo7UwfKSxRLCXkKDAim9Ye/UpI1FYRJzbfbXiGNKaYky5/K5ORp8
	o6FokVr0TH8dv+W1S2Bkl5VPq/VHwazDtTo4FX2woQJWS/57L+h16jULebn+kLox
	egQlFQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4acqq20xju-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 14:48:35 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7900f597d08so940393b3a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 06:48:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762958915; x=1763563715; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+NRoHwCSxaMf980uG4MgVlLpp2Qeo3tytVe/hv/KALI=;
        b=LlaL2ZGqbCBpC+TucFv5Aickalg8LH7q7i1RFG+K3CiAMMxReiHuFMH1ORwoae6qM6
         CaLz7HAura6+VM3WrwilQRyw1mWdlYe4V+iFvW83PJym/Igqj9T9SdtiS9PqNNJIzbsb
         bnakHP4HGdGjnx/HyXNIgjpM7ei3+dKdFrct/3eBLroTU0dHxlXC9Kw8HVKirUwkb77o
         ZZS4OD2xTSFILSpAS29I5nebvrOhlv9qzbNqu9CFU/bXroe7qqwqOAXqWxMXTeqK8xQB
         1uGbNWemPnBIjq5UujGxhSNmDchAAIz/aHClMA+JV3sPNNV01mtmMvrnvCA684jCn12s
         o05g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762958915; x=1763563715;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+NRoHwCSxaMf980uG4MgVlLpp2Qeo3tytVe/hv/KALI=;
        b=iootoWtlgj2zVVsZ/lDJ1pPGonr74vpHKC7Jw8FnG+ksSaYuxtjppXlfUpZbjsyCDr
         aLJDx/icH/srRZxcyOFXCJoYlBdFP48z4p1D0IM5bISPlzyb4PTPweilMPsAG9N4HQ8l
         rV0XCcU/MbZu8stRV7QREJx7RN/VHc1zGJhhT/27UmY5DlWdz6MppZYJK5rHSbGtidWL
         s0pbNNIg+aACOIfZzuG8K31Y9lr9Bv73UFORdeEVSIF/mO78YAKCxQ3FzkN1QroJYHPt
         gynzxKZsv2v+dmtelYoTcdWLHN2fh7VfBHz6a2qL7M2b6gT2awmJbezpc6l566NJwJsA
         9e7w==
X-Gm-Message-State: AOJu0YwYiZb+PQ1sXKwAnJsBBUp7Gs07AsgsXDhgTDBZklL0vdToLwq0
	XmIqJu+cak+t88Z6W5pwi4cz8+P+gnI95TwtEl2NDckfxWsU5cWWZaZerpfJO35dc1mwVK4Pdi6
	C4lT+UZC1K1oeZCtb1m8m6T0hq9pElTza7tHzHdcORojsoGwA29Q9ojJRKJ5ERPThDaXs
X-Gm-Gg: ASbGnctPVe+xj39bscXOGbPNP4Ib1rV+kEtfNIyVH6rN9JP/vEHGM+5l4kKiElqWVck
	a9w81qVk1hShMmkN1ROfRGxNJUo7kTxkM+vprN36ovSFGVn1n79QLZ9IQGMfTTveToK2GJY3Oii
	1f7j+NdeXyre+xe314RTePOriw34BytYtVOvXaXJUlO9u6F43BJXV8OzmD0+1zzBaBNeM40Wx33
	8FDoGRqqgpjwYJLI/k0+3h7MuGlYA1Dfo/T37myqzxQ6GgDCLKoFnzqJe64pzD3JS4meXcFa5Z0
	zge4oG8ot0iQYxsvBzivOjQU5ZYweXIl9BXHlCqxVd2xWdL6sg9PHiatx904oKJcRE5IAagX6cI
	Gs95H6oiqGDzF5YpYxIZdoGAA+NJv8Jx1UdBvFjQ=
X-Received: by 2002:a05:6a00:1acb:b0:772:3b9d:70fb with SMTP id d2e1a72fcca58-7b7a55b730fmr3983190b3a.31.1762958914726;
        Wed, 12 Nov 2025 06:48:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHsQcNoH8/Bz9doC4REuyQm72O0ucf8zwpssH1d3yrMPbsIFu0id9YEE/3pxyTUQrIJDttbiQ==
X-Received: by 2002:a05:6a00:1acb:b0:772:3b9d:70fb with SMTP id d2e1a72fcca58-7b7a55b730fmr3983150b3a.31.1762958914219;
        Wed, 12 Nov 2025 06:48:34 -0800 (PST)
Received: from hu-botlagun-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b0cc17b0c4sm19098234b3a.48.2025.11.12.06.48.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 06:48:33 -0800 (PST)
From: Gopi Botlagunta <venkata.botlagunta@oss.qualcomm.com>
Date: Wed, 12 Nov 2025 20:18:12 +0530
Subject: [PATCH 2/2] arm64: configs: Update defconfig for DSI-LVDS bridge
 support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251112-add-lt9211c-bridge-for-rb3gen2-industrial-mezzanine-v1-2-6eab844ec3ac@oss.qualcomm.com>
References: <20251112-add-lt9211c-bridge-for-rb3gen2-industrial-mezzanine-v1-0-6eab844ec3ac@oss.qualcomm.com>
In-Reply-To: <20251112-add-lt9211c-bridge-for-rb3gen2-industrial-mezzanine-v1-0-6eab844ec3ac@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Gopi Botlagunta <venkata.botlagunta@oss.qualcomm.com>,
        venkata.valluru@oss.qualcomm.com, jessica.zhang@oss.qualcomm.com,
        Yi Zhang <zhanyi@qti.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762958903; l=686;
 i=venkata.botlagunta@oss.qualcomm.com; s=20251110; h=from:subject:message-id;
 bh=Qs4er2hr/+T56uOBc6ouWcD8kx6jWka+YYpKp1dnXMs=;
 b=aTdkTjo5QskKOjMfq1dM452l2jeNPiuGe0xeEWvCVwTSXwYvFKzW+TFpbO19OpUOc9NkFOXC8
 0mXQXfuxYPZADWOiyl8uYspS+af95+CZrpSMKKN/7mKbX2p/qzPWbHR
X-Developer-Key: i=venkata.botlagunta@oss.qualcomm.com; a=ed25519;
 pk=/SnYBwlkTzDCLnHFgEY0qFwPgKIV+aQWRbc3naiLzrk=
X-Authority-Analysis: v=2.4 cv=EbHFgfmC c=1 sm=1 tr=0 ts=69149e43 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=75P26NDa4d-1MZpC9DUA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: swAeYDuEEjsqF4kaWel4ksHqJv-l-XXz
X-Proofpoint-GUID: swAeYDuEEjsqF4kaWel4ksHqJv-l-XXz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEyMDExOSBTYWx0ZWRfXzvN+kq1+IIK4
 yGvvKWzhAh9cuyEdHiT2RUEMWwuw5A9Sr4vy20nEiBuK18occBLPZQDB1gFDTh9ulz80ai32w0l
 1PkB6rgaFImPM1odIHqCdzOEweXZe9Bx5BV8XvE/cxqPlcJW/evW1iKbHKhzD/5Kpt77pXef4BX
 vNCbGBi1QvQRc5Xcq+7KTKI7EFL7UL7I5WPdN9W+seRe3f/FKKqVqg56QMsxHb8Iqpws7Hdyxql
 Z9IZgaKbnFHUmhLv+SEY0+bXnSNgajQvqH4eb8gKYveXJSy2insn7rxmp6mAtwr/l6cukOSxleB
 D6GN+ZSnyMq3Iup80v5hbUqqN4i6HltrqTy0mqdp2nejL0IY6/TY3WEiLQb+4nsJ22vOaa9X2Co
 7sT/UM3GFnAKOtgO726fx9C6Ibw5OA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_04,2025-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 adultscore=0 phishscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511120119

Enable LT9211c bridge driver.

Signed-off-by: Yi Zhang <zhanyi@qti.qualcomm.com>
Signed-off-by: Gopi Botlagunta <venkata.botlagunta@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 00d15233a72b..1d35af618159 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -959,6 +959,7 @@ CONFIG_DRM_DISPLAY_CONNECTOR=m
 CONFIG_DRM_FSL_LDB=m
 CONFIG_DRM_ITE_IT6263=m
 CONFIG_DRM_LONTIUM_LT8912B=m
+CONFIG_DRM_LONTIUM_LT9211C=m
 CONFIG_DRM_LONTIUM_LT9611=m
 CONFIG_DRM_LONTIUM_LT9611UXC=m
 CONFIG_DRM_ITE_IT66121=m

-- 
2.34.1


