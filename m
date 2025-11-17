Return-Path: <linux-arm-msm+bounces-82021-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B0CEC6258D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 05:53:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 78B0435AB65
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 04:52:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED4B73161AA;
	Mon, 17 Nov 2025 04:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hq/iJ+ao";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="coq+xS0y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F89831618B
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 04:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763355102; cv=none; b=DAMqSGZDiThVI6mWigyIIZcKYNM7WEAM7IHcYTeXhn7Q31iNOAVJY2FO2YGFmy8vhQDj7iLNw0o8Prf7mcM/SD7QxGGXvM6fi76Pcjm1mbC8028exjA9Kfbe+TJDQd0AVRPirEnXWLWOgER3QQH9Pg96BrmOmXFEMj1Xp4pH864=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763355102; c=relaxed/simple;
	bh=pa9d3afcEU7rdyiag+yFCOwYXKlPvxLDQqnHicDZtTA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WS64Ds1Q5IlHrHnAFYUctlH8kSRYY/eSFFwTyIG/SI9O7qVNRvVzE+S/PEY/RhhW6nSyeDkATHZzQfcBGAE/lHOeO3zdhp4GkAQ5MzBbIslItVoWLK7eoGR+GUyHpuk4wJmoZ5Jspo0d0L4g/UuNni8A2iz+jeY45Bb1PqP7cIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hq/iJ+ao; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=coq+xS0y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AH4ngej2790605
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 04:51:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IenwDTcdotVvRFmse6YrodpUoGkzr8rtVWdJmTK04qw=; b=hq/iJ+aoAjZ0N2Tu
	rkRZm9jj4nESS7HCySpQpwwAWKv05OIfM+C/2CghAJcKRYGU6l4s2tSRbUJxp8G6
	MXmJwBrXwHs6P3tdXfu3NyGKFsT8yUwda1uxzsN6nzz0bjTNVh767RqIqKm6Bnoz
	a58Io4ruDeytoA4imbYTiJGcsTASApv7Ki0w2VpYroHd/RWamCAFq1putWKTvuvG
	ZvabRq3zbI1HnnhUpukCZrat10YhOelZO6WmBeTaziad9Lrt6AUr0WUz1Dh79vui
	kXcRHe38ID6LzLO5fb0eq0vOHU64Po+4Ff0f5vhWcc+WbmjA8MZStE5K4m62ZXlJ
	+SfwBA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4afu5bg830-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 04:51:40 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2954d676f9dso31028955ad.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Nov 2025 20:51:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763355100; x=1763959900; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IenwDTcdotVvRFmse6YrodpUoGkzr8rtVWdJmTK04qw=;
        b=coq+xS0y4zeKocOh5JhuiNlrhBskiOa63k4xxVHHhc6Hjddxn5TvHIMeq6NMWr3QMO
         luWW7K1gUUGOkMEqFG8pevw9QwA6SKxci5XUSpQrQPEFDG1794CeMOUdg4GHE5l7vLpR
         jmudZjyG9sCMY3PQ6DJPbWDtNsQFXTvboCeRKIQXmNTlxAKaumQOTrbGGQiPZdiuWLvS
         xSTYJSjMD4FieBotXXndjt/nA4WAknWXDlggRBBwG2qEhyLXxKFrIPG0gE/yc71Y36EV
         rVvGV7anYpaxEvql1EtJGz4yqs2umngj42BWh4RseaJVppb/+ect22SQ/Ct97mQyT4s1
         Mzig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763355100; x=1763959900;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IenwDTcdotVvRFmse6YrodpUoGkzr8rtVWdJmTK04qw=;
        b=ukYbAyNGC1R2CkUfrIPermBbWJhEeCgWqKRECpoZebjEV5Us4gehhEBfkGelgfbWBK
         0qcd6zIVklNzhiUneeTWswpiYhf0G02oSsQO8MMurgYgs6nGep+RyvEyTrJBhlFqMxLQ
         eN1fEOf0RMiawGG/VQ0Uyqh8uvGFYwtF6UjKI1GCuROc0RgIyIrXvDBBKz6r1YdCjrZ9
         JdR138XhqndC+CyoBiwY38C4Ljo+P/0VAVBO8yMVLjwexfXcQhUxYAMKM+kHEYcvWd+a
         Cl5ugmc9o8AbCNSHMYW4JrEG3FYplEZ7KKyLDUaQE6V/XoRT6ExPsjv5S5CKubLJFlmr
         ifrg==
X-Gm-Message-State: AOJu0Yw6srMZJrWzfxa70P7ICx5GfXmkTxbwtVXmr4jje4E58xRCeJHm
	D1MpiB/aM+Jc93Sy/UkV7ijVmQQklwKDK1n8Bsu5TC6lUjFmC4IGzYbnWkhjj9j7Z6/y+Q/2nJD
	IVY277pF1GfUT6kYfecetKEFEJ1fRGx1cCo8YA2OStyhfcuYUXJwOIHlWYMU3RnfsTlZe
X-Gm-Gg: ASbGncsfLo54bgeur/ZqYxQrgIeBz06RnhPuRT4mUrcK7e/2clgCHdQxCLifSuUwgRK
	HXiSLXQqVSrEvncejvqUYASFOWiOakWiIVB/fRnZ+mYe56s9PAchoGWJDSh9PW86e651Gnr7+Zx
	XM8ZTsC0xq5BKGxVrZlm8cvwPzDQnjqF+Z1sTwbYhnQY90S6Ay//iPK3wILAnl6kGlU0hGsH4kN
	jRxr+TmtNxHWLpkDvY0qgZs4PWUMgkKhZbJlKl9dMqt1ZJYRkylfCKCIilzNVDZhaYJn8KMd1v2
	mGyGOPROJMdxEx2ZKy10twfkH4nHpNtznfsq1QEVVpBOPG1WIvxtAoZpEUU25oLOzaYK/7m3ii+
	/Xx67WDo1jZQ4+bxVMEVk3C/OzPewSA1WPkCyazKmSzFAytCIjyAlmLyrU1YCIHl2hPBtmlkPnT
	LxfeMrVOtSxfli4+Ql9lb7vsaCdebMU4a4hAq//QDsvegF
X-Received: by 2002:a17:903:3b8e:b0:26d:58d6:3fb2 with SMTP id d9443c01a7336-2986a6b7b44mr134854275ad.12.1763355100053;
        Sun, 16 Nov 2025 20:51:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGEPk1/pe7/bkGD++xy1fxdHq535t0NMCl/VnN4HD0ACYyaIstpDjuso4/7YDIA8B9em8x6Ig==
X-Received: by 2002:a17:903:3b8e:b0:26d:58d6:3fb2 with SMTP id d9443c01a7336-2986a6b7b44mr134854075ad.12.1763355099547;
        Sun, 16 Nov 2025 20:51:39 -0800 (PST)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2346dasm124187105ad.7.2025.11.16.20.51.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Nov 2025 20:51:39 -0800 (PST)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Mon, 17 Nov 2025 10:21:26 +0530
Subject: [PATCH 07/10] soc: qcom: smp2p: Use __cleanup() for device_node
 pointers
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251117-cleanup_node_put-v1-7-5f107071d171@oss.qualcomm.com>
References: <20251117-cleanup_node_put-v1-0-5f107071d171@oss.qualcomm.com>
In-Reply-To: <20251117-cleanup_node_put-v1-0-5f107071d171@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763355082; l=1093;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=pa9d3afcEU7rdyiag+yFCOwYXKlPvxLDQqnHicDZtTA=;
 b=NCNan5OVrqF5z49K1bFMIkb1XMiX+qq++VGo8Tir5dgjCno98Q3LjRmZkr7nyWbK+nYzoe/kl
 k2nKSA1mhFjA/ySrlyWWypo6Khi5N6tzOXdYroMjXkOTWg6/P7ty0WH
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-GUID: 4jYQ5fn8nxrjFNSV_ba5HPhiqMIVeht0
X-Proofpoint-ORIG-GUID: 4jYQ5fn8nxrjFNSV_ba5HPhiqMIVeht0
X-Authority-Analysis: v=2.4 cv=Xvz3+FF9 c=1 sm=1 tr=0 ts=691aa9dc cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=6OMHi4lUxOtUDzKZSEYA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDAzOCBTYWx0ZWRfXyZtSwV2FnSnZ
 6I4kTi29wnP/B/deoxQtxI/DlpyaOw0/5f2bA6bz+CnRGZ5E4cfgwXRTi02KutXlWLsZ+iHhu7l
 F4trV3pT/+k9T1mKzgjYORR7XwIl4Ha9wIYXab+IrVK1dEZlFslwokSvXbnUBv0CH7GmdIbk8Z0
 cOy5UIlcxV+zMrqFgLgQBvy8vCJBbRIMdakyjwKndpyJByW6CHAg+RElSz1QGFWLtQD3M/GURjB
 5QqiYRa5gj+9Q3xhtF4KpYvlE1x8kkKF/DlA4mXgZDj0PmUTNViytSi5sD6ASVyhxXp03ZiO7gv
 H7RJWcCfeAAvfP6ZEZlyymXPjn/VueZJm7uHgvyKxOtkhPezZ9N34ASswB/yS0i3CHk+/zLRih/
 Jtg6BdevyR9xwIRGjzrrAIE19yqSDA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_02,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 phishscore=0 priorityscore=1501 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511170038

Apply the __cleanup() attribute to device_node pointers to simplify
resource management and remove explicit of_node_put() calls.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 drivers/soc/qcom/smp2p.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/soc/qcom/smp2p.c b/drivers/soc/qcom/smp2p.c
index cb515c2340c107e92ece1bb8cd3854abf9f03e4a..2e22eb4728b7412685138fc86e55058b047bcb75 100644
--- a/drivers/soc/qcom/smp2p.c
+++ b/drivers/soc/qcom/smp2p.c
@@ -501,7 +501,7 @@ static int qcom_smp2p_alloc_outbound_item(struct qcom_smp2p *smp2p)
 
 static int smp2p_parse_ipc(struct qcom_smp2p *smp2p)
 {
-	struct device_node *syscon;
+	struct device_node *syscon __free(device_node) = NULL;
 	struct device *dev = smp2p->dev;
 	const char *key;
 	int ret;
@@ -513,7 +513,6 @@ static int smp2p_parse_ipc(struct qcom_smp2p *smp2p)
 	}
 
 	smp2p->ipc_regmap = syscon_node_to_regmap(syscon);
-	of_node_put(syscon);
 	if (IS_ERR(smp2p->ipc_regmap))
 		return PTR_ERR(smp2p->ipc_regmap);
 

-- 
2.34.1


