Return-Path: <linux-arm-msm+bounces-79749-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E6A5EC21C04
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 19:23:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 459224F1B10
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 18:21:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72B4436E346;
	Thu, 30 Oct 2025 18:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WnCRZxTu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fwnQ8T9m"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B24283081CB
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 18:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761848427; cv=none; b=dnQVr21cdDnMOPMc33PXN6bn8k44/n1aoBw4ZRnL6bCR9S7mWaFjoMbvksa3obRzHUVDJqxCSwrxHuB0fX6bOxu1PfRMJZlGQwDdxY1p3JglBhcFObo7OqIDFB0sw8GbuuuUx/0mwy4EdtW8z+naDviSlemBUvPUuzA6jWKcnhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761848427; c=relaxed/simple;
	bh=LSKl2PjqKWTMSPFQ2sZ2xVB5LwaW1ucaMm6IaJaxU9Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AQgQj8HUd75i0EOq6hVU6pCX7TjsM3zPr7PJctGyt4fh2JhFDn3s9vYHHFtsb8m6MbY6PEejweYiopHgcEWmdsUuaJXAnonY/en9zca2cx44WUvCigXCfMz7xXzqNBG4TZUkP2KTrt4ihcTloqviZ4YLNBnTp5+ZwWjAgzMm47Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WnCRZxTu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fwnQ8T9m; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59U9Xh941994685
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 18:20:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2BjoQpo66MX4RBPD1J//ejDCFqWKyHgH23m6SbE4d3o=; b=WnCRZxTuTu40NQOF
	lBIOjx+pLyR3jQBNHLqlIoZt3JuWF+Lk6X+LNTZ40hj9H9s946wuErnFVyNJZQ4x
	HkSgHaECb/CorJdT0G8Yom1/DbtxRiLtH3S3tu0c3vBHdDkQBMgcqabj+ZwBNs74
	1/HdmPCFaDWegz3MI0H4XDQnVbETgk8MssyG4IO1jrU/idnYwDGw7vHLIREMZuzh
	hfoUSRAs25+HMuHjej2mOk5braPDkuhn9qGvPFPpKfLszduCrj/SO/4V00jy3UCi
	W4lMcmdzuL94CJegqeRcgvGmdLaDNHTTWeahR3h77gRCKQ2CGQNSGvrGAwFuF/tv
	GsGfhQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a3wr72u96-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 18:20:24 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-87c1d4f68fcso54725726d6.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 11:20:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761848424; x=1762453224; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2BjoQpo66MX4RBPD1J//ejDCFqWKyHgH23m6SbE4d3o=;
        b=fwnQ8T9m5mas17yGElJVcBoPFHr2jmg0nzDi/lJpNI0G3sD/Xb/cA2acvWTl5ICAr1
         nYC2E9gilRbbkqyfGOXPT8F7x4gsliThV7lxohLYW9gtBNb4KGqqBMtDs7OvGdhdOSsv
         slHg1bvwCpwB8CNRlA0MBubtICbsbUbgcg+1WQgSfrIKm3qQX/+5eC3SJzKNN1NzKGvg
         jGGKLdmK7UnBOqfCEo7IOXT9cWijKfXtnyVAT7qo42sigLy3soQIhnaNCMqntsMwJB/s
         Ak/HN6iSaPIk3NjJ5nfMQxvVZe6i3I5wCy2fDpEFecQV2ft8oEkcfWnJTtqqK5Qi8h4l
         IUgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761848424; x=1762453224;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2BjoQpo66MX4RBPD1J//ejDCFqWKyHgH23m6SbE4d3o=;
        b=j37i488p4xkgN698R8qvqr5u7y+qiFpOuz+aPnfsSmsAN54A7/5wuAC0X3fD2aaiad
         KAz2alSOGTSKPBmJp//Ux27KetSR3WcJuz3yJ2qRN1JKW9MvYlA4/+XZoObFGq4LNQaA
         LP3Kr4vs35eKffRRI+YYo3MB17Mkg/fcqCEfp+0zhGs5XXP5VcySJ0vw+lA0/Bw7QFwR
         uU8AFrG/CR69j7TzzKOg91PSeLyVPQa//vMbCfUC7nHnQ+PwJ3UBbOyBG+hxZgckpmmb
         VAEG/oklOlmjluZ3de8cXKC9OkffRCpgTwWrswadX9aKPX4KwO27OijlBW0HaaVD7PHr
         RC8A==
X-Gm-Message-State: AOJu0YwwPloDSAiRQtXLjD1ivIwG2w++P3O3SwzkFRTwvShp9bxCbrXA
	1akiB3ubczRSHRMrd1bTd6S92Gkq/3brcWneDqvfj1zfESeRKplySDdZSJKYsHSZS94ZH+wTo2c
	YalpwWxm0LJncrCzTOvk+4q8uO8avUlySbL+6t98dvQDAPTiX7t//H7a/AGQ4cOoOisbKM88Phh
	Hg
X-Gm-Gg: ASbGncvQ7qaNNdPNP9esmQ4cGQ5I23b4rzmdN13YwBq1LYGwdAagho7bXgQAFuyPABb
	NTECGkI/7s9UAlmVaOs1jTcePB6NXHBRoUSYCSErHWKTBKYD6vWlfSi8G2GDdxAj6/n3pSsYqRb
	4FlTEIoYywdqeWwQLosNvl2zWc4HdpkCkM3MCpfpNCoEerhbj4l/IWmjAweWTLwSvt0ol0dS5Qo
	Bx0ZgJy+GdcJLmKNNTuc0pC+wN4BrzLSi1jSq8WM003h3N5VaZ5jfhRN9QLnIg7RRMEALBaO8Rp
	IImbi2PoJQAYKAj2oyZrlRfHr5vu+Woa7tuADg7pOgtkzCNetLsi4shwS2koWX7GGf4Sfs6qD1i
	oLC36MQHzP07mWrEkgN1/eeSshqbO4vhyOg1sLWReZ/0zuXdKkQ9VYkI6llsDZbQWpsQEQITQlw
	OgABlArtt6qPUV
X-Received: by 2002:a05:622a:1808:b0:4ed:68b:c73b with SMTP id d75a77b69052e-4ed30df1f24mr7434331cf.20.1761848423748;
        Thu, 30 Oct 2025 11:20:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFg53vFt/wxX7XgRVuOoGjcDeXf8+BA3RTyOb7nixzgVp+OQtWDIXNHKc5a/D4iZBysbnwk+g==
X-Received: by 2002:a05:622a:1808:b0:4ed:68b:c73b with SMTP id d75a77b69052e-4ed30df1f24mr7433951cf.20.1761848423175;
        Thu, 30 Oct 2025 11:20:23 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37a15c5436dsm3843171fa.33.2025.10.30.11.20.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 11:20:22 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 30 Oct 2025 20:20:15 +0200
Subject: [PATCH 3/3] arm64: dts: qcom: rename x1p42100 to purwa
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251030-rename-dts-2-v1-3-80c0b81c4d77@oss.qualcomm.com>
References: <20251030-rename-dts-2-v1-0-80c0b81c4d77@oss.qualcomm.com>
In-Reply-To: <20251030-rename-dts-2-v1-0-80c0b81c4d77@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2830;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=LSKl2PjqKWTMSPFQ2sZ2xVB5LwaW1ucaMm6IaJaxU9Q=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpA6xf8lZ4BOw8LbH/gGhhVFlni2fFOzdAKMZhu
 r1Oc3fFUvyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaQOsXwAKCRCLPIo+Aiko
 1eVhB/9hABR8mh38NK6Wp602w28wtT+jmInBmG48iFFMoU78jg9DimHgh2+fOJTe4SB/xg8Wok0
 yvfZjiXXWUmrrLm7rJ7ItMg1aYb9ORo6qsMxHu5Ex6tCnMdLpKGn/8B2h1kfH8GriNTiXuXmCJP
 Dr0U9rXNfl2nkYUnRD2Y/b47u4aunhb0af2Qde11AiPxa9wmpiLC2Yui/r+Cl2gd6ODFiP4Abnb
 0ehrR7eLJhWcy1LDXgOQqIcXxXLqRqHz0UFau/OwkoXCgAJLOmjXLxNZT7OLP+TFdJU2rwVGcJw
 vlkVj7LBOY/xGiAkyORZzZmGmgcqJ0N3cXHhheyqIM3m0Xvk
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMwMDE1MiBTYWx0ZWRfX//gggYb7EiIb
 6wRy9hyirqaqh5Atn/3O71uVmuaW/DNCVtk7RbP1DLrv2vrusW9I/SfFDeHoaomaC/xVxhbLGZd
 Tjp1jZGCW3TLOS35NFyPf2J8NBx2QkmiTkgUSnGA77rQyvWt01QzTl4TC/FjYOgBrRY9OIzgdZl
 hdPs68Rc8i02KUieJzCRbd+e99lzq8QRNVOQrbP8FwB/Yv4gnEnvuGl3KoeRIg5+x1BiotDDP9Y
 znIyoy7TWC2b8yDKNmYrndfIlx2C/7OV9yAY908Vf10RuCw68mPauoV+vw3hkcOHuW+SSzJBxhu
 LGSx3qZeIt3Sq45u/xP+VGSKUvSI6ekOoR8yCSXBnFeOj8asFlbxcXz0BI/IAwaVdivuDgRo6tn
 TbyvsF7UNqsTZ24McJ+GvN6Yjl3qrA==
X-Authority-Analysis: v=2.4 cv=P+Y3RyAu c=1 sm=1 tr=0 ts=6903ac68 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=pyz-jCWVrRGVM9sSjrEA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: uQrvRSWUq9Lz0KlB540zIvGayiWVaEbt
X-Proofpoint-GUID: uQrvRSWUq9Lz0KlB540zIvGayiWVaEbt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_06,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 adultscore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2510300152

Follow the example of other platforms and rename X1P42100 to purwa.dtsi.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/{x1p42100.dtsi => purwa.dtsi}    | 0
 arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14.dtsi   | 2 +-
 arch/arm64/boot/dts/qcom/x1p42100-crd.dts                 | 2 +-
 arch/arm64/boot/dts/qcom/x1p42100-hp-omnibook-x14.dts     | 2 +-
 arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dts | 2 +-
 5 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/x1p42100.dtsi b/arch/arm64/boot/dts/qcom/purwa.dtsi
similarity index 100%
rename from arch/arm64/boot/dts/qcom/x1p42100.dtsi
rename to arch/arm64/boot/dts/qcom/purwa.dtsi
diff --git a/arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14.dtsi b/arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14.dtsi
index 7ccb2076bab66c64e693e6a1ce570d025fe649f7..22470a97e1e3968bda1de22340985f4778632498 100644
--- a/arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14.dtsi
@@ -6,7 +6,7 @@
 
 /dts-v1/;
 
-#include "x1p42100.dtsi"
+#include "purwa.dtsi"
 #include "x1-asus-zenbook-a14.dtsi"
 
 /delete-node/ &pmc8380_6;
diff --git a/arch/arm64/boot/dts/qcom/x1p42100-crd.dts b/arch/arm64/boot/dts/qcom/x1p42100-crd.dts
index cf999c2cf8d4e0af83078253fd39ece3a0c26a49..7ed4116b95904071e89a50464ef9e8d85d20b2f8 100644
--- a/arch/arm64/boot/dts/qcom/x1p42100-crd.dts
+++ b/arch/arm64/boot/dts/qcom/x1p42100-crd.dts
@@ -5,7 +5,7 @@
 
 /dts-v1/;
 
-#include "x1p42100.dtsi"
+#include "purwa.dtsi"
 #include "x1-crd.dtsi"
 
 /delete-node/ &pmc8380_6;
diff --git a/arch/arm64/boot/dts/qcom/x1p42100-hp-omnibook-x14.dts b/arch/arm64/boot/dts/qcom/x1p42100-hp-omnibook-x14.dts
index 47ab0c5b30341ee791fd3976da50ada54617a8af..0f338e457abda98be9198f2d5e2d0a3290dfd98d 100644
--- a/arch/arm64/boot/dts/qcom/x1p42100-hp-omnibook-x14.dts
+++ b/arch/arm64/boot/dts/qcom/x1p42100-hp-omnibook-x14.dts
@@ -2,7 +2,7 @@
 
 /dts-v1/;
 
-#include "x1p42100.dtsi"
+#include "purwa.dtsi"
 #include "hamoa-pmics.dtsi"
 #include "x1-hp-omnibook-x14.dtsi"
 /delete-node/ &pmc8380_6;
diff --git a/arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dts b/arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dts
index f7d372d2e96129eaee072504514272f8ae34cb32..3186e79e862de67cbda48a4b85a459e6e965ba65 100644
--- a/arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dts
+++ b/arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dts
@@ -13,7 +13,7 @@
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 
-#include "x1p42100.dtsi"
+#include "purwa.dtsi"
 #include "hamoa-pmics.dtsi"
 
 /delete-node/ &pmc8380_6;

-- 
2.47.3


