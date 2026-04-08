Return-Path: <linux-arm-msm+bounces-102295-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KBKMOUcf1mluBAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102295-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Apr 2026 11:26:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 646E03B9DCC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Apr 2026 11:26:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 60A22306BA7D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Apr 2026 09:25:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7692D3B27D2;
	Wed,  8 Apr 2026 09:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ckYXAHeX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jnZcUu3d"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D06653B27E8
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Apr 2026 09:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775640297; cv=none; b=EM3IZhwe0233OCnb23kh3SVKyNNR0qir9QSvwYIqvXJ/zrbi1YkbDo7EK+2/D9y/sntB3pSTKlKxmuq6hRAccDyzS1tsAYljCYh192ihnc8xIU2y8+2Sb7eikZRP8D1fBBqrBovBXIQ/wJ6Sb1xPw4A2w1c1GPTYVkX7AbsNS4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775640297; c=relaxed/simple;
	bh=CyI3VfpN7ZvgkmfHWVT3f4/oL+YMTP8zz6uM1V5D2I0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UFyTPBIddMUw7vi7EgND/G/wUGY4ODUUW6QUVAEjpvQzBaPA4j0dqSZlC2Fjxjq9W21P2Dl2EwFGJhjse8YXdxZSpas8JjhpceKCToskao/eTSivfJSmHqVZFxG5Knsb7hltTExeDcuupMD/VJ/C+MRw3kh61jcyiOW+JRwsk5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ckYXAHeX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jnZcUu3d; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6387fsLs1259641
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Apr 2026 09:24:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sDvhAf2B9DrbLm4bHF1kl57Fvn2pa47nhjegElwkOHo=; b=ckYXAHeX2DZAVL0h
	T1oL24KRmw433Q2fXGuZzfpimH/Op1Q7IDiKVUyjumU5Y/E6bR4VkMMycXfJPKmE
	5Vl8Q9Kwt93tvKNyorZexvZMtxICZh/EZ4l1ec/4I8eJLGRBFnVhLhxSjf0TZ1Xl
	mMgOXBY2Dd1u8gaQPQ9p8NfDfvp5VUiyQM1vsKGTl92S5HZoNSJxbwUa8dy4Zti3
	XRtrsdWCHWxP+qsC7iLoWJC7FlxEYgklG/eHGmQxMtmsj7xxGUuwdLfWxSQ0Tur5
	/noXrfEI5Eievoa0pHBjUyV0N1wF4mpntXnqQ1kfxPM4JCJl585h5rqLnlo2ME/8
	q4/MGg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ddbttsumt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Apr 2026 09:24:54 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c741b950511so3363632a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Apr 2026 02:24:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775640293; x=1776245093; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sDvhAf2B9DrbLm4bHF1kl57Fvn2pa47nhjegElwkOHo=;
        b=jnZcUu3dCLN08uKd2F5HpVj6ibdNjFLMFPxBdRYqAx7SwjjeJuIwK54R0Ej1Y3fOMS
         VTKWnsC0XxNd3/yskX0VPMv3xopWyDZEu9NuHvGySzKSNh7XAqJ8/Oiyhnq+QYv+EYf5
         ITp6Qur5HDuYgnx0VzQPx9yq8uFsxy8tRBlx0/uTXciCszM1+7TkIPj4y70IwCjrSl2t
         osCLq6srSmhlkoq3TimAojs/iQhSWJH0wwZDeCiTsDooZkuyCKXjNKa9GnQ62QJSOZEK
         UwAQ2S+oPJUgDO6K+FsAhJgUQgg0ULo7drhhyJ1MLBCAjI8dMSbJyZjWusrncV3NaKfU
         DZzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775640293; x=1776245093;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sDvhAf2B9DrbLm4bHF1kl57Fvn2pa47nhjegElwkOHo=;
        b=ERahbKpP6Hr9nUA36LsORb5jd82NlHGoeFC2HyLGSxXA2SXq/ESdhuYUQ0+/+rF7og
         P5gfH+yiyoTBTbsrVbSWC+Z6seaX8W2R27N22cErXHCRObd/99LHmwjM+dtgvUz48RhZ
         d8KeXCbQrAPECdijYDoKmjYqeyIeDHNR6qOKfbcNnfBbqwEb4mhecn66Dq9uBO8HhEzq
         424YaZIQ6yxAnL9tmfy7qzNsk9dxpGKMkkig9ZHrsTnLY8Y5235gigkFHVEgH8WA/FIy
         O9m67WloVIp2WOKZJ2coxARB+DNvDBKZmuITForGC1m0Yu1+6kpkvS7CgvN8dPSjx+0T
         I0gQ==
X-Gm-Message-State: AOJu0Yxu9ZcLCgxceZ+5z9r6UCEbdiSZLfiTFpp+hianWmqGJnlDAbsm
	DM8TpR+D84mDdZzSwtErIT6ZKc5EtVCO+otNXOpt1uQM52DtBE09tM2z9+ry0qBpxGCu7xc2GXf
	mR3Vo4LSYOiIQ2vhos0AYZoTdsu1Ej/vklNiFvOEdZ0n+o/xFUCNt6uiBpFVCvUXH/ij6
X-Gm-Gg: AeBDiev7q3DxodUtTq3rSbWl0P283eWvUUxZ0K9rITD8BCoz1sGtsO08t1CBRI95+j2
	LU/tnrJ2ik/MoVwNJrsM/i6anjf3iXmH+i8z7zptZMQPZRYRdqldDBVnS7JPwvQC5ZHf19yCmT6
	QnMqUXK9LA4973mOCFMcxMJcqudXP6XlU3D8kSdOrCqKJhtlAuwEuiTHskaYgGjgNkGWUgLZrtk
	ecRThUEQorEIb8j0Kzz5WBABlLl3MCqkO3zdjgPJK2gcT6+lhEpuaxT5grSlLrL6W4TzQFksS/Y
	wD1nkOKiGPmJt5fGCdVHwD0024/+BsB/pvvm4lnZ8OT5lriwbuxLs0NU5bMMPiSSntvQ2Uzuybo
	8X4lsfc+pYNjnEyjmGyWaDHLC0JeAmVHNfVNOfx4kctnSmd5oRuzGT6Dhg0Ji8NP1myjotc4Ku4
	wmOzrV2Bx4EeyECtIniP7n0LZccynizS4dj6G5woLgN8/UOS5+7J1RzPfG
X-Received: by 2002:a05:6a20:7346:b0:39f:24ad:ad11 with SMTP id adf61e73a8af0-39f2f046df4mr20634361637.9.1775640293506;
        Wed, 08 Apr 2026 02:24:53 -0700 (PDT)
X-Received: by 2002:a05:6a20:7346:b0:39f:24ad:ad11 with SMTP id adf61e73a8af0-39f2f046df4mr20634329637.9.1775640293018;
        Wed, 08 Apr 2026 02:24:53 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c76c65a3f08sm18274413a12.31.2026.04.08.02.24.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 02:24:52 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Wed, 08 Apr 2026 14:54:38 +0530
Subject: [PATCH v10 2/2] watchdog: qcom: add support to get the bootstatus
 from IMEM
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260408-wdt_reset_reason-v10-2-caf66786329f@oss.qualcomm.com>
References: <20260408-wdt_reset_reason-v10-0-caf66786329f@oss.qualcomm.com>
In-Reply-To: <20260408-wdt_reset_reason-v10-0-caf66786329f@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rajendra Nayak <quic_rjendra@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775640279; l=4422;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=CyI3VfpN7ZvgkmfHWVT3f4/oL+YMTP8zz6uM1V5D2I0=;
 b=dQg7F/41tHFheDpFaSfZTB3oEOJJt/EN7mICP0FotiZPPuCTe0ltklrG6bCQqTlQ/VDk/lNWg
 e3JDu6gdXkcBjCYOs/q4jEzgI6kSgNusosSqdN3pG7KkyixcwZePuvK
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-ORIG-GUID: cVGp0VJlV2DaWj6fLF2tw08ObejRLq2A
X-Proofpoint-GUID: cVGp0VJlV2DaWj6fLF2tw08ObejRLq2A
X-Authority-Analysis: v=2.4 cv=TOt1jVla c=1 sm=1 tr=0 ts=69d61ee6 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=qKWHfwwlgvfnR6H4MV8A:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDA4NSBTYWx0ZWRfX1IUX8kE0ioGD
 K0E8VYl+GHIhDoezUSWUt2s2xqCyIJa/Buf1kvDJN3E9Oot+4CH7137AvXw5AQ0VhaErbpoVOIO
 mKnyV3kWbw+JtJq9G3Ah/4HEs/gmSnn8s9MTMcpgmTrPzVVNLeODqq6ayvHXvvtYrAzXDDT8V79
 ucnuhSOjAQKqcJDk6eCQOaOoxBNLVqe4wmGOMZt/wE1dNoPJnOzV6ktITrc4xrny2NQVLqD/gtS
 eC78ZNCevoapIw5gJrgDlzf8NCQBBtr0Q0rD65u69RjUeHZsF1lMWIr1uNJrFqq8ci+upiMH2gS
 MC6+Vdn/jtO8RNZMfJN8pWmfhFa42kMCJb80aLkqJKosqBYf24QAzSj1uU/AMyTf2QlzHUEIaEJ
 o8mdeP++lNBpwpUSpI7fl+x0OtK0Vexp7QuYlOuCnQ1rLGJJQnxtQeDN9O7+vZpRmUbRYUU1lvz
 7ad2zMEJmpOBefzs8mg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_03,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604080085
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102295-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,0.0.0.0:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 646E03B9DCC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

When the system boots up after a watchdog reset, the EXPIRED_STATUS bit
in the WDT_STS register is cleared. To identify if the system was
restarted due to WDT expiry, XBL update the information in the IMEM region.
Update the driver to read the restart reason from IMEM and populate the
bootstatus accordingly.

With the CONFIG_WATCHDOG_SYSFS enabled, user can extract the information
as below:

cat /sys/devices/platform/soc@0/f410000.watchdog/watchdog/watchdog0/bootstatus
32

For backward compatibility, keep the EXPIRED_STATUS bit check. Add a new
function qcom_wdt_get_bootstatus() to read the restart reason from
IMEM.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
Changes in v10:
	- no changes
Changes in v9:
	- Log the error message and continue with probe instead of
	  returning from the probe
Changes in v8:
	- Picked up the R-b tag
	- Updated the comment as suggested by Konrad
Changes in v7:
	- no changes
Changes in v6:
	- Reworked to get the restart reason code from SRAM region

Changes in v5:
	- Use dev_err_probe instead of dev_err

Changes in v4:
	- Kept only WDIOF_CARDRESET and dropped other codes
	- Renamed qcom_wdt_get_reason_reason() to
	  qcom_wdt_get_bootstatus()
	- Moved the existing check inside qcom_wdt_get_bootstatus()
	- Dropped the device data and put all the details in the DT node

Changes in v3:
	- Split the introduction of device data into separate patch
	- s/bootloaders/XBL - for clarity of which bootloader is
	  involved
	- Mention the sysfs path on to extract this information
	- s/compatible/imem_compatible in the device data structure to
	  avoid the confusion / better naming

Changes in v2:
	- Use the syscon API to access the IMEM region
	- Handle the error cases returned by qcom_wdt_get_restart_reason
	- Define device specific data to retrieve the IMEM compatible,
	  offset and the value for non secure WDT, which allows to
	  extend the support for other SoCs
---
 drivers/watchdog/qcom-wdt.c | 42 ++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 40 insertions(+), 2 deletions(-)

diff --git a/drivers/watchdog/qcom-wdt.c b/drivers/watchdog/qcom-wdt.c
index dfaac5995c84..49bd04841f0c 100644
--- a/drivers/watchdog/qcom-wdt.c
+++ b/drivers/watchdog/qcom-wdt.c
@@ -9,6 +9,7 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/of_address.h>
 #include <linux/platform_device.h>
 #include <linux/watchdog.h>
 
@@ -42,6 +43,7 @@ struct qcom_wdt_match_data {
 	const u32 *offset;
 	bool pretimeout;
 	u32 max_tick_count;
+	u32 wdt_reason_val;
 };
 
 struct qcom_wdt {
@@ -185,6 +187,7 @@ static const struct qcom_wdt_match_data match_data_ipq5424 = {
 	.offset = reg_offset_data_kpss,
 	.pretimeout = true,
 	.max_tick_count = 0xFFFFFU,
+	.wdt_reason_val = 5,
 };
 
 static const struct qcom_wdt_match_data match_data_kpss = {
@@ -193,6 +196,40 @@ static const struct qcom_wdt_match_data match_data_kpss = {
 	.max_tick_count = 0xFFFFFU,
 };
 
+static int qcom_wdt_get_bootstatus(struct device *dev, struct qcom_wdt *wdt,
+				   u32 val)
+{
+	struct device_node *imem;
+	struct resource res;
+	void __iomem *addr;
+	int ret;
+
+	imem = of_parse_phandle(dev->of_node, "sram", 0);
+	if (!imem) {
+		/* Read the EXPIRED_STATUS bit as a fallback */
+		if (readl(wdt_addr(wdt, WDT_STS)) & 1)
+			wdt->wdd.bootstatus = WDIOF_CARDRESET;
+
+		return 0;
+	}
+
+	ret = of_address_to_resource(imem, 0, &res);
+	of_node_put(imem);
+	if (ret)
+		return ret;
+
+	addr = ioremap(res.start, resource_size(&res));
+	if (!addr)
+		return -ENOMEM;
+
+	if (readl(addr) == val)
+		wdt->wdd.bootstatus = WDIOF_CARDRESET;
+
+	iounmap(addr);
+
+	return 0;
+}
+
 static int qcom_wdt_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -273,8 +310,9 @@ static int qcom_wdt_probe(struct platform_device *pdev)
 	wdt->wdd.parent = dev;
 	wdt->layout = data->offset;
 
-	if (readl(wdt_addr(wdt, WDT_STS)) & 1)
-		wdt->wdd.bootstatus = WDIOF_CARDRESET;
+	ret = qcom_wdt_get_bootstatus(dev, wdt, data->wdt_reason_val);
+	if (ret)
+		dev_err(dev, "failed to get the bootstatus, %d\n", ret);
 
 	/*
 	 * If 'timeout-sec' unspecified in devicetree, assume a 30 second

-- 
2.34.1


