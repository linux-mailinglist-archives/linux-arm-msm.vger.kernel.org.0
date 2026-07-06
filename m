Return-Path: <linux-arm-msm+bounces-116952-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id BgiTHz/aS2rVbQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116952-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 18:39:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 37E0371364D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 18:39:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=XTtGgCGv;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=dU5b1OnI;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116952-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116952-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 47502313DB41
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 16:08:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A5933FE644;
	Mon,  6 Jul 2026 16:08:42 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D5FC3F6C4F
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 16:08:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783354122; cv=none; b=L1yRH8En0MmotrTON2lLeqvO09Y183OS2XBZpB3W57O5hcmxQpmEzhAzQGy9a2zqRUPUAYqqHC1FrtUfOoA56g0vRp8KsoUn9uRqKBPRYLKkwZri+2wMVzZbJqWWYONFUILqEYuCatcRSUKXWdH4JFEz8dbcEeUGxjeklMywUnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783354122; c=relaxed/simple;
	bh=csBCDgH3M6DZ4OQcPp6xjLvnA/f4U6oeBWnobJdNGXA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=VhYKlCFjZffOLthxc2tnNInoC1/Nha2BquWON+BDQxu54xu5jpPDTlUfDOrmNoC2bZ125JFe2VuRSL8P2sTbCiJnWqrkoxF0FbWe0hIBc++cG5khZZZJRZzKLZr7JAmfparXfgjDMH2zXhEmwAMwBNjsMN1uKuw1z7lo7l2MGNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XTtGgCGv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dU5b1OnI; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666FF1Vt980439
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 16:08:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Pf9tIRdfDyri9p8ozQjkuW
	mmRnclsJ800KP5REMMFqI=; b=XTtGgCGvGdLie3cMoJt2TWHkM60JPxucgH2NKQ
	m3eOHlToTMrTqcRPG31j2BvMX/MAJ/BjralgXjuEkxaaZPRCcD9oLcqpHShg6eui
	AvJ7rLhVB/k9L/pOGHZCn2AQygYlVc8ek0C+byEVtHxJObWkb2EvNzWpIq2VQH5k
	F1/+ALVQnnEb7+VsWpe+e2IpcyNCGJaw7V98tVBzwAs3d7cxH02mc4dK/KqCN6o2
	hZH33woLbRo8cT67vkba1ATPeo/zDukD/m/2jnwxeKsZBwc4wD60/YOYMKqQhkYp
	bWD3HhZAqhdqa2RJrt1PjxN2TYlfLuMlLuHXX3Vzjh3GBOZg==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f89kgsura-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 16:08:39 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5be0cfa2ebbso364739e0c.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 09:08:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783354118; x=1783958918; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Pf9tIRdfDyri9p8ozQjkuWmmRnclsJ800KP5REMMFqI=;
        b=dU5b1OnINFzA0L2L9K8Kkp5c946mtYMl+tN7rdVUGZQ1tHfb1skI5wcADZyLbLLuHf
         C6RUvbZXVW3C6OKcUoREdyfNzTm2B8zUT7V+uTzu2tmASQ79gJoC8DYPMDKq4fSfb5bp
         5JRUjm7wzNyW+UPso+9nhxdcur5Z/HZgmruA/KkKLlqrn0sBgpNgjOwj7SbOoibNaSC6
         pAhiu7mBAiCxjhLuOqJuF86916Gr1hslQzr7tZo0T6ybt5xY4KV9vmo/Xv3jHXGO4I5I
         IZYwMXyTqD8tXfPnTNKWn/WDj+R8LdFY4fGlIJfnb4Fgw00NV+VXoWk7kphEp6Qb90gl
         qlLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783354118; x=1783958918;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pf9tIRdfDyri9p8ozQjkuWmmRnclsJ800KP5REMMFqI=;
        b=Aam74FPXvR0tjj9fg91o35UaV4dQRvoWRaJDtAir+ctvvdRkJJKH7MDEIzEpUSp3CI
         edRbSNjU8ejTQ6hhiuic4w+kxPHPN3dXTfVXklOROZ9UxCmrpJJlaH06CtQIPXT0aOJI
         aiUv/xK6RDDDnZMjTrmbV3pLXc9QgryXwi1QEw8RdK1bLFAaL8IBYymU+9BT0RtVDAX1
         NVFai8kopr9Q4UgxFzf+i/fQGi8gPmpWpqlREUEjpIpglB2duQSopu855ovjRCQG6HCf
         i10it7w7L0PWv05aBfPls5L8XU1zrM5hy57jpekelFXGU2tnXZx/axf38GVAnt+hdvqI
         c17g==
X-Forwarded-Encrypted: i=1; AHgh+RqV9Yi6hYRt0WCPMBtm60AdNY+DpFbMCfGsHJQamxo+e3TQ7Bs+tOFYQrY39QExiP98kkcFOz0uTq+14Kg2@vger.kernel.org
X-Gm-Message-State: AOJu0YzUEQIq1+f4+WEqWuOBaAuJ8jWccOrrSjFaE5hiIadDlihQJeIY
	I0CfilpORb2CuqPE+AwG7SP4s2sbTwCVc41Wj6W5pSas10sNbWwW5VWlFvkMnLOedpQDOJrhT7d
	OFrS+vY6Ea676DS8CFSgdrBZPIKZ4wEUYOqyCPalVIbfgyeCOIGbDhlFbvpNoIJCVELFD
X-Gm-Gg: AfdE7clierV73Pgkt/VQp24R1Brr8N62ZDI1YFkamzkYa/OvkPDRmDxG12XlqgEicS8
	u5UrXDDX8SYhRA1zNy4rEW4LZiVQQb7aoLFnq40jYrOaXGYSHF/luc4CMwj1PJaVh9hL+BO6LxT
	0qrDKkMEwQhmdUvBcIU0C+NPBDSNp2SUtFvKWCihKXYqx6Byz11TAH1yZEaAH1kbQiHqkQMbZx8
	XHLfO9Ay/l21u18HUIOmFIbLjip1cEybIomREvZAEsm3cDblO0C2avZdsLleHmN1qx+UKFKxl8T
	hnJn6l49mUVVIOFs60W7E0W9Kc28rf5u4ljjWOi6D0wCTmw+itwrlhYTWPN+PNejNo2riJE41Wo
	0o30MSmGi2Gv6gq3hFXttIZHqYK0T5vlTaMPGh78HTxJhjA==
X-Received: by 2002:a05:6122:8288:b0:575:352f:eac0 with SMTP id 71dfb90a1353d-5be907a7cd9mr685197e0c.7.1783354118294;
        Mon, 06 Jul 2026 09:08:38 -0700 (PDT)
X-Received: by 2002:a05:6122:8288:b0:575:352f:eac0 with SMTP id 71dfb90a1353d-5be907a7cd9mr685142e0c.7.1783354117748;
        Mon, 06 Jul 2026 09:08:37 -0700 (PDT)
Received: from juillet.box.freepro.com ([2a05:6e02:1041:c10:8405:4a9c:95fc:4b8f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9e3e2702sm26071966f8f.9.2026.07.06.09.08.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 09:08:36 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: sre@kernel.org, hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
        linux@roeck-us.net, andersson@kernel.org, konradybcio@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: bryan.odonoghue@linaro.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        neil.armstrong@linaro.org, gaurav.kohli@oss.qualcomm.com,
        manaf.pallikunhi@oss.qualcomm.com, priyansh.jain@oss.qualcomm.com
Subject: [PATCH v4 0/2] Lenovo ThinkPad T14s EC thermal monitoring and thermal zone integration
Date: Mon,  6 Jul 2026 18:08:27 +0200
Message-ID: <20260706160830.17698-1-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: tH94kiLiH4s33HF2bJT45HlJeag5aHYM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE2NCBTYWx0ZWRfX0p2FTv+/XEzH
 NjDZkMiBgND2tFYIFlVoJOdWOsoSlF/upIH1vlWo2dNXTMeseWIBI7clrzlD+NHG3Fm3/TTudc3
 nteuICP8fhzUGxKT3eqa7NASbXkjJsJdNPwZZzWBVrynChFXWz7uUYybCqSFFVNDDBpI+eK1hu2
 paxlZoYsg1iUveCYMtXsjRBK2kTPJtbnTVc6c4nBH1AUKhlluqUMLoAIOW51zxGmUYvKuW5W5Rr
 BLS7yOd7PsSPvjeHqsb0f7bPEOwsDfQY7mzJQt/zdD6Bn17I6ZAjI3ReX0LZbi5NOPYIBURMF0P
 JpY9hYNOecRSBA8x2uBzNRLajipiU8KkscbBGHye+YdiT4U2X6GLQNm0memipny8TDdKdyXqRXg
 r11qfaMy4e2eDFCF+T0RNgGBbl9DZEdh4GJj0WV/lJlHXIwaqxXQ3ZJ/199dqmmhsa3JQPmeTSK
 sDEEnHP6pLPyD5ahHqA==
X-Proofpoint-ORIG-GUID: tH94kiLiH4s33HF2bJT45HlJeag5aHYM
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE2NCBTYWx0ZWRfX/hFIBOcmd3iH
 jPzq0PVlLO+Xn6cqMiZGJh4hbgG6QcIXVZcOJSxg3bcdK3vrzNu3++WJra3QAX3rZ+1qlydwv41
 eQ98wj6gxv4cf0SJadLmBOUENjpzlnA=
X-Authority-Analysis: v=2.4 cv=c6Sbhx9l c=1 sm=1 tr=0 ts=6a4bd307 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=Jz99LMs1rTwwAPREzXgA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060164
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116952-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[daniel.lezcano@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:sre@kernel.org,m:hansg@kernel.org,m:ilpo.jarvinen@linux.intel.com,m:linux@roeck-us.net,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:bryan.odonoghue@linaro.org,m:platform-driver-x86@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-hwmon@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:neil.armstrong@linaro.org,m:gaurav.kohli@oss.qualcomm.com,m:manaf.pallikunhi@oss.qualcomm.com,m:priyansh.jain@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_TWELVE(0.00)[19];
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
X-Rspamd-Queue-Id: 37E0371364D

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

Please make sure scmi-cpufreq.ko is loaded before testing

Thanks,

Daniel

---
 Changelog:
	v4:
 	 - Added the missing HWMON_C_REGISTER_TZ attribute (Sashiko)
	 - Fixed dependency with HWMON (Sashiko)
	 - Added tags
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

 .../qcom/x1e78100-lenovo-thinkpad-t14s.dtsi   |  67 ++++++++-
 drivers/platform/arm64/Kconfig                |   1 +
 drivers/platform/arm64/lenovo-thinkpad-t14s.c | 131 ++++++++++++++++++
 3 files changed, 198 insertions(+), 1 deletion(-)

-- 
2.53.0


