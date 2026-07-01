Return-Path: <linux-arm-msm+bounces-115645-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nX0FJn/uRGrO3QoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115645-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 12:39:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B6966EC451
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 12:39:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=AzAmDLpl;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=cX5ugZ+5;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115645-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115645-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 964EB30D4214
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2026 10:37:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 882F041C30F;
	Wed,  1 Jul 2026 10:37:25 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D2F2421F10
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Jul 2026 10:37:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782902245; cv=none; b=BQ7DTOeYR5N4vUkLVBID40A2mhlrFSXLz9bdcydPnzByWIzw7UPJd1OMigxccyKqHkZ7MPV9UBxkc15hBZC82DlYHpmyePdRvdPXvThzfDYiT1hRbxNjNxveSoYXF+mpqV9W9C2mOZ1vDeIFtndBvK5KlsoiCt2XATeQk3u8J50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782902245; c=relaxed/simple;
	bh=3eTtRbYeYc2Ucl4oM9OL99IuKEACdQbDk9OneYUz3hM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=e7M5iNHwP87Y+ojaJX57oAqRpN791EMtZO0eSJwuUtQA6IPXxdqEMOGfdbvIe6bFrkgcwWNyn0WDE4uaR98tkopjn6Vaeq5w//4547YwUrWBz6Vs79BzsIA/qGtgXrI2BBhYQGjH0Hg4zxRjyn9jsce3An7yxVmg6YdRqz/X6Dk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AzAmDLpl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cX5ugZ+5; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661A9043753610
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Jul 2026 10:37:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=HBLQidyajdO9oG1GsqnmdD
	1EP+Zn0eFu7AAq13az6os=; b=AzAmDLplePkHG2aHzBiQkXwaXpsA4fHSoEcQyt
	Xcp8NdJew09OhYrjHM1Fk1dtn23RKC7B1e9ZHerhq6+Qcm0wtfceEGHnN8Fel8ec
	tILh15t2g1n+vMBrtNyQtrbzyubyS9UvY2zW2/3I72Z3pwPls227p3sd8qt/62zz
	XQtzjnK2PgREh3+o8e5PNj/0F01wt0sjIuEUB0YK1w7jSu4kbx47fqbI+Mkl+AwW
	KxDEErpIDDCQI7qucaBRX+FaUSBthQUHjs8022Scpo/vKXceN5AK85otNYR/C7eL
	CkBz0MiPDUVhrIo/UQfoTtxUXgI/5sdvzmB9Sh/Hy8RyAf1w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4rsy27me-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 10:37:18 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92b4b575561so63655885a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 03:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782902238; x=1783507038; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HBLQidyajdO9oG1GsqnmdD1EP+Zn0eFu7AAq13az6os=;
        b=cX5ugZ+5ZqJBZzADFzlO415Snhe44xSZvtLNYweoDDQjrQxbP6GmuWvijZ2n48d8nD
         MIBAyByyo+g3ppLhiVm9HxRstDF80FfL8G0sIFpXm41nBmYUa50kQPkelYvZ/MLxXZMn
         uy49e4RSOJqAYpmYzYy5x1/3ZuLEfVrbviiU0KR/UfDqhf8axFCHVZAGq1Y8wCZf7M/s
         uzb+0m4FQOG938dXgHBsuhDtv3nWGCO4HXTKsc+htDvDkGSO4VGFNgcHAogowflTIzxC
         3JV0wfPmsEpHSRL2fJ0if/glvDaqlLVnVpolyli5BxHiyi+OafcDX5/GQW5CF8zEyXkk
         nZhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782902238; x=1783507038;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HBLQidyajdO9oG1GsqnmdD1EP+Zn0eFu7AAq13az6os=;
        b=eLD8B/Od/bcC5y1x4LDzVaBQOOMq8fqleSOlnJh5Zz7OeiWeybN0eaF5NZHmgVcmV9
         kLHXfbM8/8zrcmYquveZlgn/R6pJZXm6a3tfYqS+5aenRLtpL0hsKckOc0P0t+hz9RLz
         a/3gi9dZ8WOAn5vxQYhTIpwszi4jDaAfShX47zaCdmMVcVnm6MUWq+l0KtlRPWCCQ5hl
         SW9Tv2U9X/2TP6gCNgdGKWVr2Fha8jwflvlyqThSy9DaB8xzx8D32LJNDMAxRbMBuZN6
         dEgaLFc+DhD+9jNcbsEqJpe0Ji0eqMIqBw2rq/6EDQNVyfSu2TNlDwKNs+xEEVqwE5PZ
         q4zg==
X-Forwarded-Encrypted: i=1; AFNElJ8EZuKbqavM8UHhWPkiKOjoEJLFjb3PWZBndy30zOZQ/WNJy6nhV0s4qeJryILvvrLhBubNb8LMesIRtaex@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+LLtdjQ5GV1rpPWIgeU1UCTPl1EMC7FoZP/je7oNDbrLZ6s/7
	IrytacKNSNs8DXwSWv9qtdPdmz5XuPioqOjwjj5Q/dI3SjZAEKx11n8pGC3Sk6zKNrgWN3Dvs1T
	ykq4NVyih5Yj44rD3jOQixcTQy8GWC7az9MoxMn82fqxLDDzHC8hhyQX0lQ+x3xE+Trn7
X-Gm-Gg: AfdE7cnV7pQF+vkDVQtcaUMZeTzbrV7XLgOZN1x+3N62eF13gtmyPeI8VoFT34ynzJW
	MmVj2e74DUpdR3sdybAWWTxAYeG9UqYhISU6AMKDACjNTR7VytGdfZG5uJeIIq8jdkmQN+E0sXA
	EsfPWFYFt7f2xGxCPdWfwuBrbZVW6sJMMPs/PjAa/Er4yQ7flgAFReih/27F7ge286BrcoUusbV
	iytPNBJHwooxWtOjsVunuJNQF073DiyIwAf1JMSiXV3/MwGR+QEVJOE8aOXvRK9UFQ7WbjtMZAw
	kNkCFlxGSyMu0Fp4mdpEo2EchNXeJ0rlI3rpU4X4k0uSk+U1d/G0AR8wpjxovdaCS4Na0wFTr+O
	P0g2PlJkvDtSMWa6L6UlX6rNltwBd23quB5bQG0WHgiA=
X-Received: by 2002:a05:620a:390a:b0:92e:68f1:db9b with SMTP id af79cd13be357-92e696e9173mr787223885a.16.1782902237884;
        Wed, 01 Jul 2026 03:37:17 -0700 (PDT)
X-Received: by 2002:a05:620a:390a:b0:92e:68f1:db9b with SMTP id af79cd13be357-92e696e9173mr787221185a.16.1782902237505;
        Wed, 01 Jul 2026 03:37:17 -0700 (PDT)
Received: from juillet.box.freepro.com ([2a05:6e02:1041:c10:cab:bdb4:a76b:614])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493be4d2bc5sm69130655e9.5.2026.07.01.03.37.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 03:37:16 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: sre@kernel.org, hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
        linux@roeck-us.net, andersson@kernel.org, konradybcio@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: bryan.odonoghue@linaro.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v3 0/2] Lenovo ThinkPad T14s EC thermal monitoring and thermal zone integration
Date: Wed,  1 Jul 2026 12:37:09 +0200
Message-ID: <20260701103714.22583-1-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 4K8JmcKbcwO4H6zkmc_xivEeZZ9qXCIy
X-Authority-Analysis: v=2.4 cv=fLgJG5ae c=1 sm=1 tr=0 ts=6a44edde cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=Jz99LMs1rTwwAPREzXgA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDExMCBTYWx0ZWRfX/iSGZICXIVF2
 48qUa397KU9pfVba09ZHXvgN0jaWxCMsp/dWVlim7YjV/B8BOsy0eYotvxQX8pbvLOFedSK3xzV
 mNPkOiGTcDRKyFCzfxiWXZe3b+36SZUp03fti49swownl5rXc6h2jg6CP2tXqHrVGfS6WLTUW7n
 4c+TWdUuhZk2GZjpGy0wcLJB3jQ3eWUzJ0nTWwBib47Q3hU/BBK70HA69VYZFeUMYB4iV4oHjz3
 QAch7ByKdIaY7TX37YxyFufZ/b0MmOw7vXXYGPY4sAiohX7HRJHBZ0jgwtuBt3l8ZmiM3NxLQ+c
 A/OoYAbmbQYfQQx1G5JTzPgMkz5PwwI94+cvyqE6PRzDZsDfPO9pQ8uGBNDPHuxF2eOIKuFkA0t
 TKvwlhYfURc2sBicS3XWFJdJEJLRv6o4ieEIdQ0ShdqLoM1aHS58J0V9cV3vN+jswStRZJo/k9r
 40n4d//Dq2Emo4Y6mjw==
X-Proofpoint-ORIG-GUID: 4K8JmcKbcwO4H6zkmc_xivEeZZ9qXCIy
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDExMCBTYWx0ZWRfXzKyzbV2+n9da
 EkPQ1rW2B06EPJXY3LUdkgXL8YR3GX3gxqV8sysMKEKOyorJIwh6MWt92YyaVvb2ilgC0DiHnzl
 olm34uzU9A7Ht2tTsqyKAE/JhnRtoi4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010110
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115645-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[daniel.lezcano@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:sre@kernel.org,m:hansg@kernel.org,m:ilpo.jarvinen@linux.intel.com,m:linux@roeck-us.net,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:bryan.odonoghue@linaro.org,m:platform-driver-x86@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-hwmon@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_TWELVE(0.00)[15];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel.lezcano@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3B6966EC451

Hi,

This series extends the Lenovo ThinkPad T14s embedded controller driver
with environmental monitoring capabilities and integrates the exposed
sensors into the Linux thermal framework.

The EC provides access to several platform temperature sensors
covering the SoC, keyboard area, bottom cover, charging circuitry, QTM
module and SSD. These sensors are currently used by the firmware for
thermal management but are not exposed to Linux.

The first patch adds hwmon support for the EC temperature sensors.

The second patch exposes the EC as a thermal sensor provider in the
device tree and defines thermal zones for the keyboard skin
temperature and the charging circuitry temperature. This allows the
generic thermal framework to react to EC-reported temperatures and
apply standard Linux thermal mitigation policies.

As the EC protocol is not fully decoded, the passive trip points
get/set actions are missing, so it is not possible to program a
threshold and receive an interrupt when crossed the way up or
down. Consequently, the thermal zone related to the charging circuitry
is polled every two seconds until we can set the trip points in the
EC.

This series fixes critical thermal issues happening on this platform
where a kernel compilation, or heavy workloads, lead to a system
reboot.

Tested on a Lenovo ThinkPad T14s Gen 6 (Snapdragon X Elite).

Thanks,

Daniel

---
 Changelog:
	v3:
	 - Removed event based because trip point are not yet well supported
	 - Added an empty line after variable declaration (Ilpo Järvinen)
	 - Used MILLIDEGREE_PER_DEGREE from units.h (Ilpo Järvinen)
	 - Made switch consistent (Ilpo Järvinen)
	v2:
	 - Fixed patch 1 subject prefix
	 - Removed the fan information part
	 - Added HWMON_T_ALARM
	 - Fixed DT change description to reflect what it does really

Daniel Lezcano (2):
  platform: arm64: lenovo-thinkpad-t14s-ec: Add hwmon support for
    temperatures
  arm64: dts: qcom: x1e78100-t14s: Add thermal zones for keyboard skin
    and charging sensors

 .../qcom/x1e78100-lenovo-thinkpad-t14s.dtsi   |  68 ++++++++-
 drivers/platform/arm64/lenovo-thinkpad-t14s.c | 130 ++++++++++++++++++
 2 files changed, 197 insertions(+), 1 deletion(-)

-- 
2.53.0


