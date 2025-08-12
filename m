Return-Path: <linux-arm-msm+bounces-68649-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D3AD7B21DB5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 07:58:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C3B5F18944A3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 05:57:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0FFB2D46B3;
	Tue, 12 Aug 2025 05:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IayR9ZM0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F1C32E2839
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 05:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754978164; cv=none; b=t0TIlmD0aIt9ih9fDyWHwTCRcn6Ju6b+K7K3zPb8eBlbMfxsakfeU/tvCnzEB1PQ4gFJBcjyFIFxHj+OGjnRXM4qVvZ0RhrovBtzKptbEnt+fSIg9AoA0J7qGabY9yNJtBsR0oxxxLnb5Lo02Ew/sqI5JEd4L8p8GIBNhIZlnhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754978164; c=relaxed/simple;
	bh=7C5wlqfUGlNAOlcMWP3UIoJSoU7F5CfXh7HAySLy7vw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BMY/ut3whosegf2Gk2utWhWQrvkbE03sVNzY7euCYUqZePUBKJEIAo7RQFD/nRs3fNQiJNiyY3Ul9bPV+evpX1NNF5GrSQdw+l4YD5AataMoI9b+wwDIupeAapGyesawv+xPfC0j6tz2fPyvCo7wHzoQfpaQx23erN9x6I8n6uY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IayR9ZM0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57C44S6H005721
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 05:56:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=B19nWzff1hv
	gEWIyyHXO3w1PVc/KbOyGfSQee+KWYZs=; b=IayR9ZM0ZasSV6SoP4/tcbHneSA
	CVzONprqFBAFD6bBAkrxYqFEfh4bGnVflf2uM08l9ltjaPyn00a89SiO5QsHMEv9
	C3ouXICSo8JfKqDPRJIXTf/ZWxKRin1rDGfsKYItEHzbCC7OxF3yQ4QvyHL/06+c
	yxP7rNht9+3msR9KNWbDRYr36NakZrH5fcweXekorA8WeNdtsOBe/wuj4Pd/zIYH
	u1RLUOOhnNNjQbTDw/bUBQ7mcJBFIL6J3nqsfcBUVhv2T+y1xBcYH7P/o35y66N0
	u2Ddo/J5Hp7VL6wgnJCEgzMP9tFjJRVjMm/DrIjPtaa5T0dGQBoWPUbVVoQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48fjxba40a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 05:56:02 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-31ecb3a3d0aso4965269a91.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 22:56:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754978161; x=1755582961;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B19nWzff1hvgEWIyyHXO3w1PVc/KbOyGfSQee+KWYZs=;
        b=fu6RSeuDbTGbTtlDM5FVeXOVeDNz8Q/reX6efLBYqXEiyxn5o9uXWQuNVrSNf/rwiw
         OHa8M62st8lhFBIvieIQCgPkdT6ZT/7u+Rs2fxUwUt1ftuulZZnEujfFh7on7fd0Vo3H
         8rxdlUBt1BwMVbiZTVCBnDZpb+2PUb1wW36n7Jtcb3MGpsfcikjyQMNQhBQbWoSOp0H7
         EU8X9kw0ZxdcP/Dggjjs5wroFLS9XvCs+tiGlD+zJdn5u1xlkMUbigksbNuvNLuWAiPg
         m0pO1UPKSSojy7rjvg3LHkax4QXTlz9OCo0YSa030ZGa5RgP29QAuk7c5TQfGFCONQtR
         rFtQ==
X-Gm-Message-State: AOJu0YxFhS+dEwxHBdx3/gQC5rD9NovW/UsbNyS4DQPF14Zkk7zsLKHt
	QJ4lTRnX9p5bBQT/asoM/LdBZykCIN6FqC5TxdLqj33XWxM7ZRpr0T0Jq6XG0n0GMw4EC/Fsg22
	LEeBxdA6w4uBW/vAojYYYTVIqEthmFGQMLHSmiwB7eJTKTzYo/RHcCX1gsaQoNdnQiPqL
X-Gm-Gg: ASbGncv0Zfu7ogLC/XwmkWVT2fxWwkJvASfMp/TDBtaR7jXqp5lGnt0eQhbwj34JXhC
	2GtY6g8FuARkKr0YnvGZLGJdShamBPFUPQZw5JpRfmQYoNoYsaGdYxlRymgWiCDMP0KYXEcWQn0
	zaSx62rCQf+qcHFj+w+1TgwTME8IH9jcvougqOMZkpXg5XYP/RvrlhZT61L0jqmfjUP+PuH3uc4
	e9nQ8oq0/MN0rLDiLWIvMrngDddLDjXiRx5rwxUuLTEicY+osEGMLRCydt1awbjYUZuNS8PWKMo
	91CKcDXxtEMrvdUUoMIDtxEEBnxb1pHrvAVcek4CdSiFqT13HzZQcHexTFle0ulBXplWJfaWMCR
	EhQ==
X-Received: by 2002:a17:903:b0e:b0:242:e0f1:f4b9 with SMTP id d9443c01a7336-242fc28758cmr25282695ad.20.1754978161576;
        Mon, 11 Aug 2025 22:56:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF4e8kQp0IrRtj31bzCgS5V3rsipa7Z4QR1lRYTKeX+/QFVw7wAbbooXEt16J/B1HRK7sYNcw==
X-Received: by 2002:a17:903:b0e:b0:242:e0f1:f4b9 with SMTP id d9443c01a7336-242fc28758cmr25282425ad.20.1754978161106;
        Mon, 11 Aug 2025 22:56:01 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241d1f0e585sm288585985ad.40.2025.08.11.22.55.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 22:56:00 -0700 (PDT)
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
Subject: [PATCH v4 3/3] usb: xhci: plat: Facilitate using autosuspend for xhci plat devices
Date: Tue, 12 Aug 2025 11:25:42 +0530
Message-Id: <20250812055542.1588528-4-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250812055542.1588528-1-krishna.kurapati@oss.qualcomm.com>
References: <20250812055542.1588528-1-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=G6EcE8k5 c=1 sm=1 tr=0 ts=689ad772 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=dywq_Bg9ifu0WOeA0n0A:9
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA5NyBTYWx0ZWRfX21iEo8HfmqdS
 zIWpzRAUfJFlfmoOrXoAkmdpeL0vCY3G4g8HbdZrq+CkeXeYlZOK4aRIm37QccWJVlC7TVcDPZt
 itBFMzmf1pJ43k6GxTZ3uk8LRzhUMlbzUuM+hIbyCc4rIEHvwYL2WAACPH4gvjJRiSJjOUtyG7M
 ZWPw1kVfZhNlthbjg9M7eRB8PqhO2Fjk8Twy8q+r6wvh3KvIHza18+J0uFjQiQ8QVHJ23M1heFY
 dT5heLGeAYlJfnFDf8ZJcij76KmoJ5G0vLT/1vQgON4paxclqnw1TI2QRzsfGWERf9CfrbC36Ik
 IoZbUwKOkl7Bu7lpWBYvcJUT2FV7Q2QN43jsqxdbjOjrwEeQTQ7gvSgUFwiA/2kJad/hbF9PjaZ
 YAv+pbuk
X-Proofpoint-ORIG-GUID: 0mUxc16f3Qutrvdz_deg5Mm9AZaxXws0
X-Proofpoint-GUID: 0mUxc16f3Qutrvdz_deg5Mm9AZaxXws0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_02,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 bulkscore=0 spamscore=0 phishscore=0
 malwarescore=0 adultscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508110097

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


