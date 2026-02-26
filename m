Return-Path: <linux-arm-msm+bounces-94333-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QGZKCvqJoGlvkgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94333-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 18:59:22 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A9CC1AD259
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 18:59:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E55FC306A2D4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 17:06:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1A8F3290A9;
	Thu, 26 Feb 2026 17:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cAlmcSzD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ada8WXCG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41E733290BA
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 17:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772125207; cv=none; b=MAnnlc4IvrbaFzMwpVjYUHvi04wMVQnMYUIVYAq0DO2Bo+HChic+NOnKXo9xHG+0Lszu2CaIt9NFwNirVKHWd5loR46sGQOgp4Pp47mjmEA4aOh6n/+uq6GUMWpckbAI+M7Hq56uHwXcrjVzkZNmHC6YPL5XuNInemeEYZP+Z9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772125207; c=relaxed/simple;
	bh=6Fee7+x2CpYKxxzavdQpk3tVNfJGvkPuDAkp3K1SF9A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RMQ5wtWYdjDfYkJmp0aEmtfi53LYmtmSLSgsnXOUv1BWK4w57KjE+8QeIhqHJkq84BrgjBvf/aTPBC5EyYPpCIGDaxxcgsBgvQELbAh7X1OiCgjG7ZRnjdFUjhO6BqyaYA7NshmnSXbY6hFCbYHTGpX5BjkzA64fmDyTQIkIwHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cAlmcSzD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ada8WXCG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61QGiM8M1171643
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 17:00:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9Q16nQkOnRJHOXiE4YfbTbTmYN1CH7kro/6L9igRkpo=; b=cAlmcSzD4QAgnBhQ
	3z3LReSRHCbMem74WZearzFzbS+vJWG0Yr3WE8FMM1X2QWYJyjbARkppbnLh/c4d
	G1S2WMcsAJ1x8yCFJJQDN/vO8qv6JLBUuIhvr+vTJAu4G3jDJDFHOPD89Eexi40A
	92lBdInEdGKamkezoBdEIT0N+VC47N3KGWCtqioAm6KEVKdt/1AJwazJw8nmLY4R
	PEWK9rj88T5iOGvC0QqGjKSpHBsRg6ZysNeP7AlBFVgpRf4HRQGRHOIS2LoppIK/
	coD4+ZWcRUKrF9qIbNN7Uce31gearSO8tKAhdwdB4vAor/IvM10L2hagWUPkxzhU
	jFLfCw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cjae0u3bn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 17:00:04 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2adb085735bso12682345ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 09:00:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772125204; x=1772730004; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9Q16nQkOnRJHOXiE4YfbTbTmYN1CH7kro/6L9igRkpo=;
        b=Ada8WXCGcgnCKMUzsQ58Hr/WYRYx8/FWCvnSUqFj6UQCWqbqnRnXjIcEPgortXCO/g
         I/JN9lb750vy6vngCdn0PY6KDCjEXX7ogqAMalu81oLEjaD7x/0RfRbx1BEQINrB/Tj3
         izF2NeZsrp6mnKI2buJASuDw6B6EXMsNUTDIZscY1pQSO8n+rHj/zUMZl+DDeZJhns3l
         iF9s9zpqBf0ZiTVBZVImjzORc5EPooMbUX21TKyC3lgaFNUVsotVVWayZryBp8tyQrw4
         KYMQvuJaGgSNOc9R96YmTWysMyHkXtoH9TuALFZhaNr+cDS78pnimp9b9EuPsi29D3sQ
         xYpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772125204; x=1772730004;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9Q16nQkOnRJHOXiE4YfbTbTmYN1CH7kro/6L9igRkpo=;
        b=BhAAhVXAoFVxXeDUPMhUXjrhO9FlXS6lt2ZZqr+7vZBsY4BmK66W/w60wbPv7s+eUN
         nuusGQUTlRRDmZ/UA6KkPZeE9kB6gy5pikfAMUXX69bEeEWgteuBu8cZ7lTXyiKElSU6
         hmFi1Zx6OXx9Ynf0ACEgFsbL1jdjRmD9pwW3E3sGqZCvn2OxiDPGy8OcVdF2n96awgZj
         pLw3jwzKLhvwAJwg/Joj/bFNQxq10zWHu6jS93hzIap8WN12vFHN/9jKdBS6EkWyGNGF
         jqLoxquAINBMpo6UHHMoHn+uuSiA1DIVuduHlJaMaL6QuMusnLStJPP86Po7Y9x16KMS
         Wlaw==
X-Gm-Message-State: AOJu0YycLZq76O4JGUvjLvjQDCNPzX/HFQl8pE+mGBSFCNYe2MmOYfMf
	JABZPC8hLNrNC5+/GQlHWGzqm5Jo82z0t0pNhng2qGQy/443J9QbKhDx8fIpN77PFPA5tyeklbI
	xX2CI6Jd0NU2l6n7k2BBJzKSeaBmKvlcobH/wpx1NNOSn1KixFrVDjPeMKfPlnB5LkhoO
X-Gm-Gg: ATEYQzzblacavXmXBgnvojUcw1Qnj8qc28Ke2/PuYD6bmhvNo2EJonjsMf6TkK0/1Cr
	QaGD2YQLFJtE7gdk6FLuQHSSVTc/z+1aJcZd3pmzR6qHsgpCIE7jvcC9IfC2e5K4hv4Wp09Kq+h
	WBNpyzH+bM5GHWb7tfcW4AY+/R6t+0oUbo9BYM1D2xI9jdRukaRs5gnIC7na9ydLhdC1ELQtVHS
	CGa6f1Fijsx1D913JB3PrMrSotQ0+wG+XNuzZ13JIINO5LlEHXj/1WtIRTOjg07P5UjFyIhyZgK
	8xTHJKSjMGQzoKx8xwLmzQIT5Irv7P8WNizzrNJJ4kd4GsGEYJKBcZS3+pAX+Xs15MsGU40paT/
	9p+JeBEoE8FgEuLwps8qhs/15n44/DSQYIvZGYOncJq0/9LnbIEc/k4kZX2LSjANYJ+po5b+Q3Y
	fH6wNVK+1h8sHIcf/Kkq3OT8dLRd/UINMXqEIB+efkLQ/XzwRM9boVRnQM
X-Received: by 2002:a17:902:d54c:b0:2a0:e80e:b118 with SMTP id d9443c01a7336-2ad74418adfmr202249775ad.7.1772125203679;
        Thu, 26 Feb 2026 09:00:03 -0800 (PST)
X-Received: by 2002:a17:902:d54c:b0:2a0:e80e:b118 with SMTP id d9443c01a7336-2ad74418adfmr202249475ad.7.1772125203190;
        Thu, 26 Feb 2026 09:00:03 -0800 (PST)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8273a01054dsm3626286b3a.43.2026.02.26.08.59.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 09:00:02 -0800 (PST)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Thu, 26 Feb 2026 22:29:39 +0530
Subject: [PATCH v8 4/5] watchdog: qcom: add support to get the bootstatus
 from IMEM
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260226-wdt_reset_reason-v8-4-011c3a8cb6ff@oss.qualcomm.com>
References: <20260226-wdt_reset_reason-v8-0-011c3a8cb6ff@oss.qualcomm.com>
In-Reply-To: <20260226-wdt_reset_reason-v8-0-011c3a8cb6ff@oss.qualcomm.com>
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
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772125179; l=4295;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=6Fee7+x2CpYKxxzavdQpk3tVNfJGvkPuDAkp3K1SF9A=;
 b=thnjRai3jt11X3QyYVbmsPcVAnbvcJGpXoWlJ8DSuJ/X72rsKQOYU1H7nBH9M8b9uzVMg+ILH
 4aCQlmZVuA6AEMS/CNZHUxrUcwBANXKfWsYRnt6eqy3wDHrNP83iULJ
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDE1MyBTYWx0ZWRfX6kShfteftiig
 Ri459AUDFbdFXw27RVpFG0adr28HcQsT5N5cpl051OeEmCptPwIlJohTzZwJXWFGOxwi1Tk3CAt
 AUfC2Trlwq34pw/UQ+pavvwtdYy/2izEPbiLW+fQA7FFxbkG8fiSYCoejj9kc7BBZ4n+V/H5Eg8
 VEMEhk6SqCSDIqqdiuYQZkWbEqgLwsHgs9bDOPwRsF9JE3SafiqbRdhxIYdsTIp5YXNsDi2KHM6
 eYzoCjIaEktfiGP624cc5Nbkr8DWIPa6WJ6DZv1yN48PtfcWBkuTrzBXD1AnUtGg4+hOM5Vw7pO
 oTlRqFL+cmHNhhA7CcvgwFyYvHk+H14Z7iM9vQVyMu3S+hUoJoY49x4R3Cwgmog2mXB9NpTdnBH
 zE30lNd76SFZMyFlHrzSa4Hu3LNoz1fD6T2hxRyBe1O1rvjwMJlc+0wuFjifsYBs2WAoISVL+EJ
 bU5OtOMoX7OeH/9yiAQ==
X-Authority-Analysis: v=2.4 cv=O7Q0fR9W c=1 sm=1 tr=0 ts=69a07c14 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=qKWHfwwlgvfnR6H4MV8A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: 60fgaBAkAXhCkUMnrDUuQHjcUNZIODbL
X-Proofpoint-GUID: 60fgaBAkAXhCkUMnrDUuQHjcUNZIODbL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-26_01,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602260153
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94333-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,0.0.0.0:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3A9CC1AD259
X-Rspamd-Action: no action

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
index dfaac5995c84c1f377023e6e62770c5548528a4c..bbf229a7b5840714b9429f4b092ec3f7a6a26961 100644
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
+		return ret;
 
 	/*
 	 * If 'timeout-sec' unspecified in devicetree, assume a 30 second

-- 
2.34.1


