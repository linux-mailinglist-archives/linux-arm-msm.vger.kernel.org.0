Return-Path: <linux-arm-msm+bounces-106552-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sI+sDmEY/WlLXgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106552-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 00:55:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id AA4214EFFFC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 00:55:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A642F30AE0B0
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 22:51:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB35F3D47BD;
	Thu,  7 May 2026 22:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JMfRawXS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f4+pxWvd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8734E3D88E8
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 22:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778194240; cv=none; b=aeKG8mLWDQq4V9+bKwaj8fmbIl0WuUvRRZYyTsjSD4scUxpHmPbkdM+E5i5vAZOUqvSFe/a0/+L8iPx4bmFEkLPGuqmBWodxd/xxh4K0NeW4YD4Ox6k6FO2riSg83SwA2ZbD0Kvk1j7S4wG1ALnSq0YPcAyj9Be4LJvRrbSvbF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778194240; c=relaxed/simple;
	bh=to/mt8DVhWYg+PxpdqvrCs2worc7HH9azPMfci+8vno=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XhZahoR9auOgFLExO6Vwvn2G8GpKQnaP1KUQptqmlct20Bm/AuWax/q5vCyg+3qdJ9n/jei/sK2qVTIuTtacbsDMCcBlacYDmcvRai7zhpO1K+ZTarOF2lVmhRhFh0W5F49HCvV991Sj1LNoV9e9LxUCrB+OX65wmkVDtJKnSrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JMfRawXS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f4+pxWvd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 647HbOiH1971798
	for <linux-arm-msm@vger.kernel.org>; Thu, 7 May 2026 22:50:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	niYYIC3IDYsrggvEJkZ+xh9PaeYuDpO3NXqcH2ayGgo=; b=JMfRawXSv9QljR4f
	bqyCyWotnAiHLkD+GdZPIG1ly1Ti7cPUFD/VSa609y+Bka8FRxLZFJDXdQkXRa+l
	ivyZd/zWh3at6druFCXLg97FZNgzE01ge5JmgbXKJvsY6++CmYZVZJwmQOoWqw1B
	32e1e840D3buKyhKiEDzJ9CgafHXAyKmY2NB4rpUQud7KKtXkNhJu1LQ/69o4sAi
	4J33dqFqfZwriuHLmVq0AM/FsHveHYuxFg7eHWKYkhGaUQgW0w1b6hXojgs0bF2W
	57yZ3CipxukRrIlbCoUg99MWW1IomkQ9OEH6AuHcJs0pDyLTmZyH2mO5mEDRwt2D
	fU4NoQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0tejacfr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 22:50:38 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-6312ba5c81aso1226130137.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 15:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778194238; x=1778799038; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=niYYIC3IDYsrggvEJkZ+xh9PaeYuDpO3NXqcH2ayGgo=;
        b=f4+pxWvd2NNpTzGM92AnI5MAEmrRth+n+4fOflfARGtzLo6QSmNmlF6HStLu1g6nYq
         rsRibi/g6dRG79qsPJWpTNPS5xD160RZmu0I9ajVU9m4JnMTNLt/Ps+73E/QBsXD0ErJ
         QlIYgkq7KvUcMHDRh7dO6avXCFxcAJ5hTq7j9EvFCiUGm/6sc1mPqCsulQEXQEONfh/8
         BQjMmvaOVxtjAQo2BRCoMvd7lYRe+7O2KQyxGc5wxqNKcNjQVToh7AgBwqZjoQ36dkmA
         vqExyQd8zZS9RuSXqxas1lBYr9ux054mzpi1vQ1nQesp14DBVmC70TKGIkr66jS78Iuf
         6h2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778194238; x=1778799038;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=niYYIC3IDYsrggvEJkZ+xh9PaeYuDpO3NXqcH2ayGgo=;
        b=Rtx/mg9/OgCEx42aFTf5En3Kryok5G8VghUIOWZm3+z1AjIp6aZTCu0wA72aXuwsDc
         1reFWyQWYJzr4B0j4Ehf2FFkpfBTFbMG4TJmR9u/FtNIOGtLvDlTmoMIXaj8QELzcdVz
         OqycuIR5BiCezxGe++JeyRjX9Si3Mdrn2FGL/DsrUR7m/6aakLDsdI2YVYJZVUogJakF
         oyII/wkfho5Pii7nUgf2iV1zDfEF9En7Bd4jxAe0iEFLONyuxcpVOnnH32xRgjflMTcI
         FEDAJdlBBxOgk8ngfcIciEaEJ4/+zhe1uyBWclbOvNvdqqGlUIcfJzmFsk6eyBfPpmvX
         0TsQ==
X-Forwarded-Encrypted: i=1; AFNElJ9tezsClZJNTuxM/yjy9D04U+65Srttd4K0av15on/cjHl2Pr6rnBn8hdDpppAqywbCTgmHIbL57FzPm2bB@vger.kernel.org
X-Gm-Message-State: AOJu0YzyxFQf4cky8cWA1K22uRfyxROCaZnEwkGgUN4buE7nzDdqyx/l
	GShlivEpFP9B7vr8XyLzswh39CohmGCH/zJNCPFTB4zKzfRlQ6McyVYle1Y8Hh9hSjAz+/vUOmH
	RFWXOm8j+oaCjAQ8XYN8jLuTZh7A4Fx4mtptUf4n8YtaGUz7JTFPW6JNxgF5dgmJrA81D
X-Gm-Gg: AeBDies5m8jIi2YKd8U87Yry3jV8Me+NYjKiJ5ZkoY9jHXS8F3H8xIzUVaDBou2aZ1F
	M4fGIUCDzavGkrXpDXZmMEa7fVK/Wi7HsgzD4y5aDCKR+hG+wiB8v5xxlCZKj7iqFcUNh/VgCer
	Qo9wQBv46+4E0YiWRS3anBuHQEHvDOoferI6wm4nEwxoi5K9aVNqImlMhXawj/eFgReINh3lm/u
	z1RhAqlNkzr22Els+KZ4HtgcnUxoVHOyPOtS/iAh2tEZDC+98s8WC+JS/E8oEU02Gm7pTLbjsv1
	Y9plFFHfQLaVrLs4OsEHA85XQVQtrJrmzH4euE6jhuC/QItAlXkm/zrzUsDieDTZ2NfiZ3hsWWK
	3B5kj3430EcLly9AhxjTRc7M1YZjCbfSeF/b73iqyCZsGmJhL5Bbwtd6Xhqqjx1hDSXNt6hu1Cl
	s7qkGgBG9J4WnXd+tu
X-Received: by 2002:a05:6102:4408:b0:5ff:c5c8:2734 with SMTP id ada2fe7eead31-630f9017661mr5371532137.25.1778194238030;
        Thu, 07 May 2026 15:50:38 -0700 (PDT)
X-Received: by 2002:a05:6102:4408:b0:5ff:c5c8:2734 with SMTP id ada2fe7eead31-630f9017661mr5371528137.25.1778194237657;
        Thu, 07 May 2026 15:50:37 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:b16a:3475:ec42:bcfa])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bcac4359dbesm102466b.48.2026.05.07.15.50.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 15:50:37 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 08 May 2026 00:49:26 +0200
Subject: [PATCH v3 11/15] media: qcom: camss: Populate CAMSS child devices
 via DT
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260508-camss-isp-ope-v3-11-bb1055274603@oss.qualcomm.com>
References: <20260508-camss-isp-ope-v3-0-bb1055274603@oss.qualcomm.com>
In-Reply-To: <20260508-camss-isp-ope-v3-0-bb1055274603@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        devicetree@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        kieran.bingham@ideasonboard.com, johannes.goede@oss.qualcomm.com
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDIzMiBTYWx0ZWRfX9AomGQ0pTs4w
 O8nlioHnz7a9OU2tK4uLQ7UYanafX+V1hXNBJi7TXnX7KdumXc31T9dPpQUwWeZz6GftRGW/Vav
 b/vlh8mTquaXGgdzZ+xYkTHInxkTLNMs/6GRr1c5OBqk8AoXbK2AkfKLlNzEEgnjIDkj0USEY6z
 KS92phq7N+FbHMM05VvEvF2dEg0ujbmD4jxeWrIRLmGFtH3U/dewRoiNakVCpJDDBtR+HU0pCMO
 K3ZMV/LS5xnotkCaRqW3tTvfCgJp9dpxyGkcS6QwnOstQznYT1D/TcZujS7ZSuGFXful4v5Z88a
 eP71FHIgZmE60CW+Q4zu0RxnXfzbf7u0nrT4tyDtaC+jYXXJnCr7CFM5jasYqIMaCCOQ50YufT1
 XQD9NYOWC8kmhYsLXVjVCuKmwF6VRfBWRe1QLhnZagFbhsPpSzL8Rr0Q1D8o9+pCej5eG3BrQ+6
 0a97okTmeLeg3MvffAA==
X-Proofpoint-GUID: hZONJRvjEieqALntW39xjJYpfqcNUBpu
X-Authority-Analysis: v=2.4 cv=VNbtWdPX c=1 sm=1 tr=0 ts=69fd173e cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=5bRy6lfvdnCUHtv4pvsA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: hZONJRvjEieqALntW39xjJYpfqcNUBpu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 bulkscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070232
X-Rspamd-Queue-Id: AA4214EFFFC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106552-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,linaro.org:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Use devm_of_platform_populate() so that child nodes declared under the
CAMSS device tree node (e.g. OPE) are automatically instantiated as
platform devices. This is required now that CAMSS is modelled as a
simple-bus and ISP blocks such as OPE are described as child nodes.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 0ceab12d573ee7521d44b77d23ee563930d6aac3..6d65b1e08e30246389657a0e46477d33bb5ac27c 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -16,6 +16,7 @@
 #include <linux/of.h>
 #include <linux/of_device.h>
 #include <linux/of_graph.h>
+#include <linux/of_platform.h>
 #include <linux/pm_runtime.h>
 #include <linux/pm_domain.h>
 #include <linux/pm_clock.h>
@@ -4631,6 +4632,8 @@ static int camss_probe(struct platform_device *pdev)
 	if (!camss)
 		return -ENOMEM;
 
+	devm_of_platform_populate(dev);
+
 	camss->res = of_device_get_match_data(dev);
 
 	atomic_set(&camss->ref_count, 0);

-- 
2.34.1


