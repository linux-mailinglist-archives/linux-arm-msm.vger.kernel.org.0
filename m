Return-Path: <linux-arm-msm+bounces-104628-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kOqxBZML72n14QAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104628-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 09:09:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FEF946E1C2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 09:09:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 592B63020A64
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 07:02:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54764390CAB;
	Mon, 27 Apr 2026 07:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zd4iM+vi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="chG2wffM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0373283FC8
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 07:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777273280; cv=none; b=GGfSTxqfAmODWQD3Kr2oJgii6kUetU7cZCRGT6leoEMD08iZbR1OfMTjuefPNQHxJ/wYNAzqGrkyqODqEv7GKajqjAVC3SPaIU7NSlEj6ozTMF7e9HUMBdTYygndSmONLvyd/8TxNu+eB+9jYwroodZuJh5mGJHjYaU0rwDP0p8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777273280; c=relaxed/simple;
	bh=Bw0A39DlntBuduTu/MLowZk8+b8BQpeOHYacLHEZNpA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kMeAQm0xeJTns2i54KQrHikYz9Llilm/MBW2nIc/wromgV/bEvRzGCd+B86KcsNh4IFtAA6eWsK1g9bgc6CJbYdmgdkdThUXZMVc31H4oq5/qW0H5HCXL+VWYUzqtI43jjAf+UCcPfQK+7fhVsezS9qwRBIIIiqetFybbl27h/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zd4iM+vi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=chG2wffM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63R6waLr454000
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 07:01:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=utoMcrAnVH3MP0nlvQm8R+DGZQI/nr9rXo0
	lfRDfqqI=; b=Zd4iM+vi9Dslozb2IrQsv9q/SObyOmI4zunvWNyMPvmtkxA6ZCo
	MZU8RS9LLqi1I3lp0y8biZvey1qqG5amQYQrQo9Ag6gY5NMucjmj0hwJO+fzrf13
	UFj4blIMg/pl5Ldt5lyGwDlJScUafGcTdl6aGVlBw/Nk8Fu2E4tN4KFToYURgO/3
	KIXC5/LSP+o6Bq4QLkpgopV6+2Q+NUjkHcjwK6DL00KIXk9Oipzp2XR1NChRdRhw
	cGtQFs6RgDc1vJZ2cbdqiv+htWuD9Wxls4dTM4Mh1FRe8WfbAHZut4GUGyf9ei1V
	lS68Yh1/o20skpeFl5Vy72E4Zu3lsCjzJUQ==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt30n00f9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 07:01:18 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-953f6e0f1e0so12617446241.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 00:01:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777273277; x=1777878077; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=utoMcrAnVH3MP0nlvQm8R+DGZQI/nr9rXo0lfRDfqqI=;
        b=chG2wffMc44BlNpTVkMvrY7a3FNJ7I/z8jjJc0+0bUpVpSC39VEwMW/VViNWUz5qak
         ZREHiMby9N7tpD/0ud6AZaqsJD1Z8l18DJ1GEtbvXJ8w0rApu0X/JCH5o+0j8taI7zln
         OuEIae8sYpoW4TTfAgBlG2TMvf3zEjbtqAiqh8SqUM1SjMvSL4xci16dMhNGSB20UMpM
         orEe7YkCZFcm/trwHCm017Z+6jpSKWoOFIizR/siiupDjYxCj00fL3LqZCuCLCiYySBO
         Dd1Tn5FEWgENTydh3TgSIZhhCIyTZtF7ksGxY/iOBYVnVSqKK4412TJCufwi/AVAbH8k
         79NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777273277; x=1777878077;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=utoMcrAnVH3MP0nlvQm8R+DGZQI/nr9rXo0lfRDfqqI=;
        b=f9UIvo1kpoHtRUNGWxuDZULbiyxhxuWLk5gtND9WIUeRNocwy8PxTB1rnb9dact71B
         M5Wb25oSw82FrCJgHBjzB2qSiYzmaA5DpvujS2NzZ3squVS4uo1mWnU08wfoSpeBUhFK
         PQlRZzaLxkRmocFZE2NAgSO8sIBj/4oJZFUHmq1Wn57eyY79Rk9ZxzTIts4PM9W4aQ2C
         r6x3Vd0gBwjWQHiRxM8L7Hyeql/mcD53iHTt+E6TPT8Njcnqyeadd/YiBBTcU/yjy2hZ
         NQg8wHdBKM6FC6LG0Y6ehKWtAPN07LYmcSZOf2YI1Wlof97maK16wq8j/wkN7tCkTBhQ
         4jaA==
X-Forwarded-Encrypted: i=1; AFNElJ/p0lVHW6RZ57rpLAcSKLGMu0wCUjCPxUBbkVpcq1qZF8lplXv8yjat8RY6P6qX6DMUAg4OSqITOeJVVqwZ@vger.kernel.org
X-Gm-Message-State: AOJu0YzbUEsxmew1tESK51VVcVQ43DQMl39ImZdVzWCTrkI9rL0jSbmM
	9ODTYqvUus4Uj5/6+rTPZxXenVYL2Si5KJ8BXJKpUBzjFT3nccpIOmvc0vYiGK+4QeUetg9R3/Q
	1wppDdnl2ColFuEAJBUn71t4G5cCjSG+rja4k3YQ7T4OiV2iJOHAzpNADodYrKvb9oaYH
X-Gm-Gg: AeBDievwq3E9eLnHkUw//79fMwM0WJuGQ/EP3E5r3jB2UmozDLddYDo7FPb8h5fnkNu
	NRT6AGJ5a6Hcla97qKa3d1Sd6071qp5kK7/mpFDEIC7R/3txagrCxHH9Fn5bEKZLl10musORWyu
	gKqI9BOUTY4PpHCFFzbAJMArYCllmyL7wFyPH0Fnbjp/t/Bm6dn7bauzN36Qr9+YTEJF5jJkZaA
	1HD2SdP23MGl0QMQtwyAO/A+MhyUtFvSF9/uOrSzJR2sZGa5Kf87dxL0T2OHaJBFir87eGSi/uT
	bbdH/Dlxkh6/1HHIQLlRLmGlzZuB0U76oFMK/mS5pbrpSETNnE3+CdQiwoKlQQ4BCHVESCTUstT
	Bav6dpg7naR5s4pRnljWKLyZ+74lNCpA4g7SBuQCPz0bMGFba81bM9aMnXwYvnZ26PwwTRq0xkx
	Dj93uIHI5UAg==
X-Received: by 2002:a05:6102:41ab:b0:612:13af:f5e8 with SMTP id ada2fe7eead31-616f73fb7cfmr20458154137.25.1777273277433;
        Mon, 27 Apr 2026 00:01:17 -0700 (PDT)
X-Received: by 2002:a05:6102:41ab:b0:612:13af:f5e8 with SMTP id ada2fe7eead31-616f73fb7cfmr20458138137.25.1777273277083;
        Mon, 27 Apr 2026 00:01:17 -0700 (PDT)
Received: from quoll (5-226-109-134.static.ip.netia.com.pl. [5.226.109.134])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e3a79esm82058294f8f.17.2026.04.27.00.01.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 00:01:16 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Jassi Brar <jassisinghbrar@gmail.com>, linux-kernel@vger.kernel.org
Cc: =Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] mailbox: qcom: Unify user-visible "Qualcomm" name
Date: Mon, 27 Apr 2026 09:01:14 +0200
Message-ID: <20260427070113.18317-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1561; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=Bw0A39DlntBuduTu/MLowZk8+b8BQpeOHYacLHEZNpA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp7wm5cGe1IjFJdXL8E6h1pepvBhmGjIstDMESF
 oAgC/kNzWmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCae8JuQAKCRDBN2bmhouD
 1+BoEACXr5fuOB1OZQW0xgoOnXUw5a4ilsMVMqgBpcccMKYIyjZ8sa9AdsFMlfxXc5EGANRzGFo
 +aHqyJDEEwkRcKodK0m37rFReLA2qKRYgL3r3DvU0wz0Bzax3ctTAYVaD0FXtQw9HUE6TqtthQ5
 vDmAWRHJ1573jtIk1FnZMEYZWCs9tUfH6lB/2CpNRnf7QiSgA/aIE1K2CuwozyLWW9o3YJFyotW
 +SQIjDuePywMSTPdVKOkSmwlYrKOHYzerlJrvWU/lUsYWgjlhReREMXzQQfS5LHtlxu5+uSblPA
 778hnZIw8W/xj0RjrbRQeHA6boWPWyuU5hZKbDQbPmn7wmkfx2I0gNPeyI92FFZSVsUbjG1ufKA
 EbM6Fdi1DiC+a438kiuNiCOhODSCo/ciMfFZrHF3Q3odOmQDJ4Bf4nMhUdWxbnblRBlV+QjjyYl
 rxgzMyB0aTFLGoyhUYpqu09kJjvkI++/zXg3pz6yKHkYp3n3Ded8KFfv0GBvccbeMGPGgpVmjtc
 1KfddnxmYh+yT0mCIHPKhDcndefJM0gJU20jYjo3oBuFxopGoZYPHvrSsg0shQ64AXzGYvYaE0e
 OScGNnyw7o2tEtkolBgQf7cW9wA54XHCywYcCss3CrZHTzC7V6A4p3Qc1AeRa0/Z2jyR44w1zVX LXqmXhxq8fk/nBw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDA3MiBTYWx0ZWRfXz6amYtNci5eM
 EiCzecLmgFA5Hl5eCo0dnW1VP48Il/Rlk0sd8wcPpcRaDDypauqRwgMZv1POur+1axGGrYAhIPf
 nrnHq33mA3hbtnKx4g2SBn78a9gN4QPfEj6kkpPdvHb2s8ogQG6baT3MY3cFAEfc7hI+sCRwqwE
 7UWHFZOZEXEnB/+Ih1jelQKWD5HhYTKzGwaFUFtEH5OGd10xuKUmCEzzshfVTroAOR1ZDJHIq01
 Esa8DA9XmunQEbF5DvCtD+tiFwoZlA/OqE/Yd1DAbsSq2C4UYy6vvwupbGyUEBxsoqUBo36uwCd
 en2wc1OG1zNvFBC6vpG+zGzM4RoecJoqVTOQvPMHlz+ic1+PfG7ON3tL3+zeAqslBkh9G0MAzn3
 KbsGAhVXSqu4zhe5V5pV0odd9zP9EFOS2oaXKJ5aGXS3aDuTm9/hcWOjfF0qWd3ti3SnKpsSZJa
 nFjJh5QFO7YrC/T8yow==
X-Proofpoint-GUID: 3Ekqpy4t9qjA4rDYZQ3ZZ6-OIGZMd-Sm
X-Authority-Analysis: v=2.4 cv=efANubEH c=1 sm=1 tr=0 ts=69ef09be cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=nnYKl1aPHK5ktf5uHVwi7Q==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=nFrL8gjwWgtlWvRPAVgA:9 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-ORIG-GUID: 3Ekqpy4t9qjA4rDYZQ3ZZ6-OIGZMd-Sm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 adultscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 spamscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604270072
X-Rspamd-Queue-Id: 7FEF946E1C2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-104628-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

Various names for Qualcomm as a company are used in user-visible config
options: QCOM, Qualcomm and Qualcomm Technologies.  Switch to unified
"Qualcomm" so it will be easier for users to identify the options when
for example running menuconfig.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

And "Qualcomm Technologies" has even variations over the tree:
Qualcomm Technologies
Qualcomm Technologies Inc.
Qualcomm Technologies, Inc.

I am doing this tree wide:
https://lore.kernel.org/all/?q=f%3Akrzysztof+s%3A%22Unify+user-visible%22+s%3AQualcomm
---
 drivers/mailbox/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mailbox/Kconfig b/drivers/mailbox/Kconfig
index 5bf4155b090a..3062ee352f78 100644
--- a/drivers/mailbox/Kconfig
+++ b/drivers/mailbox/Kconfig
@@ -341,7 +341,7 @@ config SPRD_MBOX
 	  you want to build the Spreatrum mailbox controller driver.
 
 config QCOM_CPUCP_MBOX
-	tristate "Qualcomm Technologies, Inc. CPUCP mailbox driver"
+	tristate "Qualcomm CPUCP mailbox driver"
 	depends on (ARCH_QCOM || COMPILE_TEST) && 64BIT
 	help
 	  Qualcomm Technologies, Inc. CPUSS Control Processor (CPUCP) mailbox
@@ -349,7 +349,7 @@ config QCOM_CPUCP_MBOX
 	  Y here if you want to build this driver.
 
 config QCOM_IPCC
-	tristate "Qualcomm Technologies, Inc. IPCC driver"
+	tristate "Qualcomm IPCC driver"
 	depends on ARCH_QCOM || COMPILE_TEST
 	help
 	  Qualcomm Technologies, Inc. Inter-Processor Communication Controller
-- 
2.51.0


