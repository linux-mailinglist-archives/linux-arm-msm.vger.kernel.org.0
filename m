Return-Path: <linux-arm-msm+bounces-67879-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 627A6B1C3F1
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Aug 2025 11:59:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0B49C3A5A8E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Aug 2025 09:59:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19AB228B507;
	Wed,  6 Aug 2025 09:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O0FWgY0j"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1A7C28B4F8
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 Aug 2025 09:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754474333; cv=none; b=Xrk10pPeaNhFLQ2isc3p3Cyz4RNoq5H3wW7sDmI83jCkYnSIo0Q15uCOm8OfSoFyp3YNKgWd0iV7ieHstm1uQGdLTJPfGdhJhIEm7z2s8dn66b5/AFYSZ5cH0ssX+W5ascEKyLt3rKz0yAziDEeG3HnpQxRrv6ayq0NaD1yN6Zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754474333; c=relaxed/simple;
	bh=7C5wlqfUGlNAOlcMWP3UIoJSoU7F5CfXh7HAySLy7vw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=TWvNe+2YboKrQXkvh+QO+nVfzh2CukjUnnfPxAGq3XOBI7EreAnnHvdNGiZcfu4ltlO8JWPVYDc/S/YXmMLWUwg1coh2Z+shwW/sD4HY/bqG1Jy7EEJH1UbBw3QdCoe08Z7k5+K0egeelPPA3lL601iI1IszK3x6udQn8k787Ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O0FWgY0j; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5765xDIA004768
	for <linux-arm-msm@vger.kernel.org>; Wed, 6 Aug 2025 09:58:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=B19nWzff1hv
	gEWIyyHXO3w1PVc/KbOyGfSQee+KWYZs=; b=O0FWgY0jMXuZvT8INsirFECgW5K
	yAvTdwuWQpyn+n+3PbrSYZfbh9xUk5G+1zIamaYqLy3mmuB/9a1XkqsA4p+K0ZfD
	tk632x+Q96nyU08O5uBtOota5YhqzwYOFbYlpYQdhdeNZIuzM+8TfZMkJ2k3jXaH
	zAFOFEdouJCxRI0KuhlNCIgaFq0tNR9YEXcuv+6uK4WbbWpIlOmB+Rjx5+zsXKCt
	MVyeesfOaQdOUN03gx3/Myawm614X5Tw2yJiiMLZpKMAZYGgojEXH67bf+8WF0Jn
	KxXUsEuKyXV6wKOHb+q9WqOEO9b5AkXstsASyu3+HenRO2sQtBgjTJKiHgA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpy6t7t3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 06 Aug 2025 09:58:51 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b42218e4a59so4475646a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Aug 2025 02:58:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754474330; x=1755079130;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B19nWzff1hvgEWIyyHXO3w1PVc/KbOyGfSQee+KWYZs=;
        b=iYq0tOx51WEuvWR1eETf/kXZ/3VwyjbThi0Oku2Itev9hiBX55jHAXm+de6PNoU4UX
         ZnLIHPmmf0soI/4+tVp0MoCazVKoMjkUoe5+MtGHJNNQcib/1yX8rO7pKzUC7hMxJpYI
         FQ7mZk0LaWQZqgvHrmiZoerHQO4cMDsNOgVTlwelCw1bGOlKEAzTBGmj+v7ItwFFvfsG
         hw4hxxDgfSAjzujJuwzQK8b4vC7xX5UnYsLg33wqig0NVtOZFaGl9U5F14t9dEHTx8Hl
         FVwXjervezM3kd0NkmcGK5Vb9EsQ9vbiKwGmlkBGRwshos27egmSyywsWGEJoNjdVuJx
         rpcw==
X-Gm-Message-State: AOJu0Yz+Yqy/Za/JMF7vAYSQDPhNRxHpdbU5ojG204fuFexxqTuiDR3W
	P/SVBLrFSSqdqQpZ+KA9q6G7LjvRxnl7OqQcxjWFpBFbH8B64mFeZv0hRRDHaX8BVywysdmLQ5/
	IG7mxOpM5xVXkmdodBm4ZVOqoYtxHWyLF5gcH3cNlJHxpMxE3i8ewadjenc8vnJPlMaPa
X-Gm-Gg: ASbGncsmfmNUE+crpp0CE5aXgSYqVQhECAsSk7udALZEX0GSxLw9ZspjJ97ByKdtBTM
	59XJ0ZDCTUniUX/EBdXjgVlO5JHusm2NCg04zzN6YiQMdFcQZ7ZqGR3wVNcbx9Meuhr3RyWL8ov
	mkh73cv7TquEvM4KR44bpPLi29MYqe6TeHPEjJyHlmsICX7ThTGNZzq71aQE/3DTKEpvysShJ7v
	5uxV+L4XIlDLDT+8YNy0p+19T6KdbzbEsU1KT6EVsqSoYHTfUqoQUZ3HNei8LWtwd9aJrqzlEAx
	YFJ59F4kdRgqjdohOMQjRW7XxLg0oeUXOPS3wSh2CykPKSdKaiPoaoNRORKEokktS2MOGN4/ghT
	Q7A==
X-Received: by 2002:a05:6a20:2444:b0:240:168b:31b with SMTP id adf61e73a8af0-240313ba206mr3530578637.16.1754474330165;
        Wed, 06 Aug 2025 02:58:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE/N/vlYYg4Dqy9ayFzEBj2EPPs7KLWGVpyO2t2adkmVNL/8seoql8c6zh6YHE7zaDAdVt5Bg==
X-Received: by 2002:a05:6a20:2444:b0:240:168b:31b with SMTP id adf61e73a8af0-240313ba206mr3530546637.16.1754474329760;
        Wed, 06 Aug 2025 02:58:49 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b422b7bb0c0sm12908799a12.20.2025.08.06.02.58.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Aug 2025 02:58:49 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH v3 3/3] usb: xhci: plat: Facilitate using autosuspend for xhci plat devices
Date: Wed,  6 Aug 2025 15:28:28 +0530
Message-Id: <20250806095828.1582917-4-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250806095828.1582917-1-krishna.kurapati@oss.qualcomm.com>
References: <20250806095828.1582917-1-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: GHFO7cZ37k__Hyr4XOfi5p4ww4nEF93A
X-Proofpoint-GUID: GHFO7cZ37k__Hyr4XOfi5p4ww4nEF93A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOSBTYWx0ZWRfX8sftGaFTXpXh
 KsCUopX5NUEfG85wC0UcfwP1Z3/TP4SQCpOFJA1h1txkplhiBqEplhKUlpLaIgxle0XtIWBKMF1
 SEl5ONxZ8O3E1LfwdC+QWwPIeI3uUDEuLmAyFa8fRIRsErIJgf9hdGXl+U8PKykARzyCfywyE0h
 UkEBaOm+5qN2CZQdP1tFRrSrMBlLOF6hjQG6LgelkejaBOdnDFoHkIUKUa124k6y5WDP879ZDED
 KrQ36Nm63z3i0Bj2gtT1E+e+rBB6TD6jjec+3mbYq85ocBE0M/XYjmZxJE2GyYzMAUPjBTgw7y/
 QJiLrbOgTzc5Eh9ZYHW+HL+o6H1ltcMq7x5CWwUpOSopJog/vkmFZwwb3/W7xUfS9qN5rGKxATr
 G+hLra3H
X-Authority-Analysis: v=2.4 cv=LNVmQIW9 c=1 sm=1 tr=0 ts=6893275b cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=dywq_Bg9ifu0WOeA0n0A:9
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-06_02,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 malwarescore=0 adultscore=0
 phishscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508060009

Allow autosuspend to be used by xhci plat device. For Qualcomm SoCs,
when in host mode, it is intended that the controller goes to suspend
state to save power and wait for interrupts from connected peripheral
to wake it up. This is particularly used in cases where a HID or Audio
device is connected. In such scenarios, the usb controller can enter
auto suspend and resume action after getting interrupts from the
connected device.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 drivers/usb/host/xhci-plat.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
index 5eb51797de32..dd57ffedcaa2 100644
--- a/drivers/usb/host/xhci-plat.c
+++ b/drivers/usb/host/xhci-plat.c
@@ -171,6 +171,7 @@ int xhci_plat_probe(struct platform_device *pdev, struct device *sysdev, const s
 		return ret;
 
 	pm_runtime_set_active(&pdev->dev);
+	pm_runtime_use_autosuspend(&pdev->dev);
 	pm_runtime_enable(&pdev->dev);
 	pm_runtime_get_noresume(&pdev->dev);
 
-- 
2.34.1


