Return-Path: <linux-arm-msm+bounces-85917-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4241FCD0638
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 15:53:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9A9B230B9BFF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 14:47:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B4AE33A013;
	Fri, 19 Dec 2025 14:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NaJ0+wa8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T/3inuWH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 489F033A9DD
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 14:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766155660; cv=none; b=J35EyKNfIRz9EYtAUOAFKYGoaMzsR85/Q0L8Alf3NvTkP120ASdX+TEIylM5ip5MT7wtO8UyWSlEOQ9ewqDMJkEjx9/GSc/yJcZUV1jl9XTD26W4lQV56EczO8TXypbn6SnGlDl5mQttk9j49tonzR5H6GeqFZS318n3in8AIuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766155660; c=relaxed/simple;
	bh=REbU3xbh4FhgmPEXDqlxy22tlOdJMrBnjksJAi1Cfuw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HPjIJr2acQ0G6s/RA4vJGR1wHuGEnUI4d0Udx220FU7lAg2ZqwU9Bf0mu/DuZAIQFvuqKRUrLNsayM3bLf6oo47AZIPLvQchZq7cm/HCe7n9uGHX4nhiWluM1ibUX/GB1h1MjJgiT8yCTot5LojCbi2cvDLJdSDtss9q+HwaDlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NaJ0+wa8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T/3inuWH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJBl4lV3992033
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 14:47:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YvyklULcBWONHB6zHUzf6hIC7VGn5yKC57kVjZLZUrQ=; b=NaJ0+wa8mq+8xVGB
	nueinR9AlcG+JmTzvY5kIlUEDlSDjAwGRe6bEaNuFYZQSCFkJPhHEJFu59EYsXB1
	J5pa3kIqErYESI+NCtbzRz3U9UAyO2zEvmma32h3RKFob9MvISRDRjOeHB+HWdU1
	DVtGUZLbVnPXWVO+yAhfklCTVsg394yk3kg+LXCSd4tejOwc/q2TvOLM7qA0lAu8
	uLWFivRlamOTEmb8gZQYhgfP3rv5LKkcErXe4N7JQOHdAc/uBlShzhJzAW6hBT2R
	sMX+T5+QfQsP7n/f0wIpEEEoqOrEf8Vr1k9XjroKBXeaxkNUzcDqkq+25/NeitD3
	NLsgxQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2dax1m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 14:47:37 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-29f27176aa7so34085105ad.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 06:47:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766155657; x=1766760457; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YvyklULcBWONHB6zHUzf6hIC7VGn5yKC57kVjZLZUrQ=;
        b=T/3inuWHt0Zc8NBA7uEdoQ6qH96bT0HcOqonVDgUsPmoysaZy8N72REFTxaUVWXGcC
         q8/Fspi3TAkm3GMpmyq5pmfLzlIdJWVB97UzyOcNozVB3csIYju9N8hXmv/TjGIRzRmg
         q9Ked+CP/Xke0hh52sNZ52RvMwdry7y3MXYOHrggREej3tNsdaNtryJKt0nu0AZohe5K
         I2U9NkUnoXFGCqm7S39cd6WhriZPZF+5BVCcQ2ePLs10CeXAnEJX0F2CN5byuiEMtQCr
         V/0gNAv2Tap1tuNZuxF3pZkvtlt62rfIKD+XjG1yhMyo0pLpo9UGyfqjWqf5Y63EcmZl
         qUkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766155657; x=1766760457;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YvyklULcBWONHB6zHUzf6hIC7VGn5yKC57kVjZLZUrQ=;
        b=wy7k0DMlCn3/ihSectMO/sgsYr30EJhOb2eH8ptStBB3oH1tP0qWFzEvpFb01U9kro
         V1Pxg+RfOhEmMRpvpjwgvdYyjvIaQJ+2PWInoKnlEzyjEiqO/QtCL0RiUxrl7SUmwM1t
         HtZrsj3pGHNPvUuGa2NGscjoqSyixZw8f48rFJhAinblBy/g/+++G7d9PUhowzJksAGV
         YpscrfpfBkX36cxYKDlaPq7ahzTko+O9j26iFsPzpJRB2CQVw8N8Tw7e+DjPmVBRp8Q4
         Uk1Sm2+1cSctE0ChRhQ4jE6HGYF6PLIxV7WaipqE5oYF7DC/lJCBTtcq/7j1dAyXQ0Y4
         3RMQ==
X-Gm-Message-State: AOJu0YwUd3SQM7ZKvVm2CEl8QBJmd6zdITvP4lcMz9exkefK+B0rWyFo
	L3b9SFmVJUGrAIyicSUv0osMfnWRkeXX5FfDm1s/Y/t2FS5UahtVplNLaVj82UbnjfNgX3SLals
	ER0EWbHsFMzZ/496KxQDBrpAkbBurE2hCc5B0kfWz6qpmTeHE8ydFpnGvHrzzYp3NVWfo
X-Gm-Gg: AY/fxX42f5mrph68CwVetVdi/+jfp5u41ECN8qElOEco0xTTCqx4MuWWSfJDa9HT7Pl
	iigHQ1xY43tRWCzHs2iLm/MxhSDDws9/zXUS5DNVs4LWO5wShZKqKfbc9FzqqzaDLZBdbmhXin2
	WWqLA0OnNE4ypEu7Nby2O5+GucIbUUZHGrXGM0TlBFBb1dqkYNfx03Dbh2Q+pMq4VEg2sHbwDCs
	3uVyx2lVTxKOv8lzDHon4NgiMp40sHnE2safnYnZbnRqFPS+yQQDn5wNAE7P3OscRurKIqwcTHM
	aqH6w6VisKnSEhzLXKzyR7r7b0K8QGLnXJ4ZJpNPwfvtFMgGGL1Z7ofpWF4w0IB/9xHlfw9uhFh
	6pkAnbDBTQAYTZhXlc56bHqLldqEt0uh5AsXYYMhAi2Cobun3Rhy/Ook6dvAvsZyN0LOjARrOB6
	JY6j52TBgmcwc/NrjKjWzADd+AK8Tpzw==
X-Received: by 2002:a17:902:ce82:b0:2a0:c1ed:d0d9 with SMTP id d9443c01a7336-2a2f29359b3mr33327495ad.46.1766155656869;
        Fri, 19 Dec 2025 06:47:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFU/iBbketQynSkW5giGh3TgnwEV/xNF/jMruv4fU3BZmlZCud6GMasORULASLC2d3XegdmiA==
X-Received: by 2002:a17:902:ce82:b0:2a0:c1ed:d0d9 with SMTP id d9443c01a7336-2a2f29359b3mr33327115ad.46.1766155656325;
        Fri, 19 Dec 2025 06:47:36 -0800 (PST)
Received: from hu-pankpati-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c8286esm25433855ad.33.2025.12.19.06.47.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 06:47:36 -0800 (PST)
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Date: Fri, 19 Dec 2025 20:16:55 +0530
Subject: [PATCH v3 2/4] arm64: defconfig: Enable Glymur configs for boot to
 shell
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251219-upstream_v3_glymur_introduction-v3-2-32271f1f685d@oss.qualcomm.com>
References: <20251219-upstream_v3_glymur_introduction-v3-0-32271f1f685d@oss.qualcomm.com>
In-Reply-To: <20251219-upstream_v3_glymur_introduction-v3-0-32271f1f685d@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        rajendra.nayak@oss.qualcomm.com, sibi.sankar@oss.qualcomm.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766155644; l=1510;
 i=pankaj.patil@oss.qualcomm.com; s=20251121; h=from:subject:message-id;
 bh=REbU3xbh4FhgmPEXDqlxy22tlOdJMrBnjksJAi1Cfuw=;
 b=gMQ0yi5n9c4RyldA44ZJieq/ULb41pM0Dv14bCeLu0YMKnJGdxbzQbHAxAvl599L1dvo0QoPy
 KarCiGx1DBGDMwjJL/5XoNbKJmrWzypQB5XNQ0E26eE1ap+luu+rMrL
X-Developer-Key: i=pankaj.patil@oss.qualcomm.com; a=ed25519;
 pk=pWpEq/tlX6TaKH1UQolvxjRD+Vdib/sEkb8bH8AL6gc=
X-Authority-Analysis: v=2.4 cv=AcG83nXG c=1 sm=1 tr=0 ts=6945658a cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=G4s3PgB1coGp2Q1p4bUA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDEyNCBTYWx0ZWRfXxPWdd3qsjJfR
 j5qBJDQ/4oeZG+6ePUodsMCNvBOwAPrlvAvyW8f3opYX59zL9QQFhEDRqIvKYBlFvp/pjvmwG7G
 NnfdeODY2hRLYvosuTAd54BsgAvkkbJPr+VnsoGOWrp4NuQhr3sDg59vvmwgl0vSQAycj5YF9bn
 F+zoo5mFd4IUzKj53aoKpPv8GCGX3bD+kxeA/0aWU4tghD+fI7eprNqeTmOZuXlXXfvh+CKT315
 +HL91fHYeG8EHJWXIGpGSy3DL2Se8/HR+Q+KYJcSzmS3e2GEIXr5OP/OBs8t0pXIEcxYeDUdb9P
 2fO3UyImnrTWQVdHP+Dvl+X0uvwCvqMhN1Vaxg47629Pg0QupKT2D+duisROSmIXBdKmukLJvwn
 BSo2Fi4SlzooJLqlJFSFF+fiOVexHBYh07ZQFQhI3CSPebPz7EAPLko13y78DENQdfupFg+1weu
 qz06TgXgfg0MKpfiSYA==
X-Proofpoint-GUID: HH0fz7bqdEoj6yiSJdYDTj-xNAWWWI_1
X-Proofpoint-ORIG-GUID: HH0fz7bqdEoj6yiSJdYDTj-xNAWWWI_1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_05,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512190124

The serial engine must be properly setup before kernel reaches
"init",so UART driver and its dependencies needs to be built in.
Enable its dependency clocks,interconnect and pinctrl as built-in
to boot Glymur CRD board to UART console with rootfs on nvme storage.
DISPCC enabled as module, used for display.

Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index cdb7d69e3b24..1272422eb727 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -636,6 +636,7 @@ CONFIG_PINCTRL_IMX91=y
 CONFIG_PINCTRL_IMX93=y
 CONFIG_PINCTRL_IMX_SCMI=y
 CONFIG_PINCTRL_MSM=y
+CONFIG_PINCTRL_GLYMUR=y
 CONFIG_PINCTRL_IPQ5018=y
 CONFIG_PINCTRL_IPQ5332=y
 CONFIG_PINCTRL_IPQ5424=y
@@ -1425,6 +1426,9 @@ CONFIG_COMMON_CLK_MT8192_SCP_ADSP=y
 CONFIG_COMMON_CLK_MT8192_VDECSYS=y
 CONFIG_COMMON_CLK_MT8192_VENCSYS=y
 CONFIG_COMMON_CLK_QCOM=y
+CONFIG_CLK_GLYMUR_DISPCC=m
+CONFIG_CLK_GLYMUR_GCC=y
+CONFIG_CLK_GLYMUR_TCSRCC=y
 CONFIG_CLK_X1E80100_CAMCC=m
 CONFIG_CLK_X1E80100_DISPCC=m
 CONFIG_CLK_X1E80100_GCC=y
@@ -1801,6 +1805,7 @@ CONFIG_INTERCONNECT_IMX8MN=m
 CONFIG_INTERCONNECT_IMX8MQ=m
 CONFIG_INTERCONNECT_IMX8MP=y
 CONFIG_INTERCONNECT_QCOM=y
+CONFIG_INTERCONNECT_QCOM_GLYMUR=y
 CONFIG_INTERCONNECT_QCOM_MSM8916=m
 CONFIG_INTERCONNECT_QCOM_MSM8953=y
 CONFIG_INTERCONNECT_QCOM_MSM8996=y

-- 
2.34.1


