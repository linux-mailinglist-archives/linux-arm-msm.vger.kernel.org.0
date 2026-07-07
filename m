Return-Path: <linux-arm-msm+bounces-117397-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id k6VdIWRTTWqiyQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117397-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 21:28:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D0B0571F350
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 21:28:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=V8o96PGj;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=GvgoOik2;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117397-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117397-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 05A1130A86D5
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 19:22:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B652337BE60;
	Tue,  7 Jul 2026 19:22:35 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1562631A7EA
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 19:22:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783452155; cv=none; b=ATETrF9yyBeyBGA+SXmn+i2fEq1BvxBe0EY/raSFa5orWwJyPwhOl538zqc73FOTQU0qrlPdOTyIMoBdhaJ8qC6vo4lNCTq1+WRewmQhR0JqmiLLS+P42i+BnLwiGa/bRti8Jk/OgKt5ggQ2Jc8QWq/NfhZTqurts4ANpWEyJnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783452155; c=relaxed/simple;
	bh=+Rcs9tqTLxY6uz2CPrBVs8k8aFNAm68QFL8TI+SEKms=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=JA42sAD5xIQVjO46ondwXyp8z6OvvnTxZUTTm13rGrwa7ckSe6KfBXSnnizhqDRQOqDmy0uqfkK5TS98zfD7f0gMnoDjO2qVTU5H1lPylfoYugcWvcGwjoA5tY8Uoy80kDSo6NXuWOdIfZuUndMuGGRsrfmv8/T14nLnFLu8U6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V8o96PGj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GvgoOik2; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667J5D1n472176
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Jul 2026 19:22:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Mt/L0C8c6aeHx2BoFJgmqf
	geH7twNz10xR7G3mGjzkM=; b=V8o96PGjmOHMv/kdEpPU+p0n2EmDXPCOhZT8fJ
	r3g65l8/TlVmyoGX4eNfiflPXPAZEN+z2s+Yk3MgFk1DdJiM7EKbHPbonchNS+nH
	/FWDfoKmOAEMzEgyLdrmEJvHTK6o2+L4YdlWA6Wrd3iDCgKUUIeCYE9XgISN4Nvt
	3bU91WWaV2NzoYr/JfNPRr2hJaDpza7RgS/f2VUdzPNRKl0YBBdvBcnr467vd7Bu
	ffxBxQi04aP8xD9P0BWHVlq9D5MSnKRhypTVw5q0rovIlDhPE/PmoaNJEX9JHAHl
	BJErLrzHHsKBq+s/Ad3kWTDl9EKMMEZSqHs8/Wp6MZ8tPiBw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f95fd0ps0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 19:22:33 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c1a97644aso61683541cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 12:22:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783452152; x=1784056952; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Mt/L0C8c6aeHx2BoFJgmqfgeH7twNz10xR7G3mGjzkM=;
        b=GvgoOik2hYpK4jE8zfnE2vF1XDOvAJc03NhPEX7VW5nzfDwpp2ZXb0fbnoisuruSKE
         455bSESEqRX8jzQI/1iYCzSyzg32iy31yi/UqVeYYIbMCFhABtbDIko4Vv/3sfZ3PxKk
         pPgOfOG9+r1sYw1YOGHLhd24+AmjVxV6JRg+rarzNBn+8u5rsGkSOueD8Xu4yGnOLMCw
         2p6Y+Y7hyd55wWHQBFXKJ0d5F34gLR6o6lDU03wl3ebovlskSmQJZ2/5Ynws7Rcvn0Pz
         gIcSrLXjTXeUTHzF9QW65bZFDOHxTK0gm6sv4j48h54oqE3oodt7AgBlQcnz897w64VJ
         jD1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783452152; x=1784056952;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Mt/L0C8c6aeHx2BoFJgmqfgeH7twNz10xR7G3mGjzkM=;
        b=DT9MakhG11oXIDpDYOVbvltBV9sXmkg2hiySQPY/imvoh889h9iTROENKj7KPih0Tk
         7At+r/g46LEo99jYabcG+d++t3EH6M+TufUF26VUn0Rq8B5URNafndllJW+E/XSO44a1
         AmM+l2djMvy/R4BQ/YLcyif5Y5xeM/XnVsrAcfgDsoEZ7WPCcqoee+jSKwqJ5roXnDXW
         7c0SUCDpG/c3kyp3ns+KTPsksTQ18ZfJvM3wDQVcXM1XvNQImFMqksY118+kUsINwzxe
         UCfM9qN5oNNH+FGvchOzadPX6lvoLsJtSMJaC4Pk6Bj2v9IusNU+4Z/Xd1mwM5GDTDJm
         84XA==
X-Forwarded-Encrypted: i=1; AHgh+RqJ48hpNWFF/ff3iBhxlD6BHrpYNMocFfx+gKRrOQoNd5Dpgt9oe83yQEkRYahKX0TKuYbp1RferHNQOkc5@vger.kernel.org
X-Gm-Message-State: AOJu0YxmeJXCPfuN32YZtnIgzo9jqfl7Hviwbv3V+MuoZMReK/ExYNBp
	0/jSo/H0Fq/8OR19J9FLtQb23wg3hRfoC5vzXz0GyhUgIO0SdNjcpI5zkwIEZ4KWCsk2+qI6fod
	0KLDbKJYMMRLeVTTdKxpgxGw3eCVJ54OcamVzckqfeWpZVfyk1ofKUT/jA2ZCr9sWP1Sb
X-Gm-Gg: AfdE7ckSBdfBgnKCS1tLn8SeLR7vavYq84SV+bbiniZY1KDV/0q9k2Q06tT9RawfYuX
	+Q2amtNt8BJLGflekmZb0085D1IT2pRH/UsYxb6E1hLzgmpJyesHcj5qIWhHZ6w15mxyXFz8lFd
	a/SgQ+IvOGTxLExSB1ZT9AlOfLSbcIXhVLXhaYQb475HnJbmls1hoj5KuZV1aeKxdYIxWDHh8QM
	hmlVEdD8DPI2a7AZZ9fgdbweLvVffuA5wotB+pYAm4o6c2Sz0XddOrEjuOzQAfVwj00t2OBqCNk
	0RDEf/X1affXij5evbt2ivFGDAvr4qJzwNixgwMP945CV39KJC/xtgbNx8mki5tP6CAE18Pe5rY
	I8IT++LoY2oL0qzZNLDBhuVVI89j8+A0yKsge5lKPGjU=
X-Received: by 2002:a05:622a:60c:b0:51a:8d31:9a06 with SMTP id d75a77b69052e-51c74800786mr68202841cf.16.1783452152108;
        Tue, 07 Jul 2026 12:22:32 -0700 (PDT)
X-Received: by 2002:a05:622a:60c:b0:51a:8d31:9a06 with SMTP id d75a77b69052e-51c74800786mr68202241cf.16.1783452151242;
        Tue, 07 Jul 2026 12:22:31 -0700 (PDT)
Received: from juillet.box.freepro.com ([2a05:6e02:1041:c10:8029:bbc1:63:ed84])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0f3677asm70025515e9.4.2026.07.07.12.22.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 12:22:30 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: sre@kernel.org, hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
        linux@roeck-us.net, andersson@kernel.org, konradybcio@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: bryan.odonoghue@linaro.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        neil.armstrong@linaro.org, gaurav.kohli@oss.qualcomm.com,
        manaf.pallikunhi@oss.qualcomm.com, priyansh.jain@oss.qualcomm.com
Subject: [PATCH v6 0/3] Lenovo ThinkPad T14s EC thermal monitoring and thermal zone integration
Date: Tue,  7 Jul 2026 21:22:25 +0200
Message-ID: <20260707192228.14647-1-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDE4OSBTYWx0ZWRfX6NkvVnAycmTp
 gE3UNmt32P1DG/twe45QzikVJ3casp0qfPua6AGd+BwQxB9oT8DJJq9rolY/aRcyzq1BIDgcehJ
 Y+U4GTTlanI2ga9saBQChwUp6eO4YtAFw7KB6nBsTTnTsm+i7FWB09pzrvQ5Q1UJvIl1/YNm8Bt
 vOjH9clvj2SdSSHyAkxVSEPbgQLFmIHCJVghdz011ao1tDIZEaryk4YchR9N5r/uI1luvRr6Que
 haonqfRHXwHRSw6LziWgjNzWvnCFWHsNtpTKzs/D4VX6uHwfBgCyG/x3JrUE6J81YbZnIU04cXh
 xE9LXRbaji2QTs8OJhq4XyZzZSsEtj+Li9TAektqJ3tG3qo23dAQZUh+B4xyURPnhFB5mcnkfLy
 OsofCLcKXo3pxko2fzS1lsmhTPey6xX/Vqh9IeFrcu+DVHBMFu28X9cONPY4zlOggCzNUfCJErI
 h0u69bWnVA+C9l/mlRw==
X-Authority-Analysis: v=2.4 cv=VZLH+lp9 c=1 sm=1 tr=0 ts=6a4d51f9 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=Jz99LMs1rTwwAPREzXgA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: EA6tVWbON4mgaVf8LC_fJ3HBNnvdOEDc
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDE4OSBTYWx0ZWRfXyy/WF0roeeol
 F78OYrMdykPoWgjfy/d26p8urn4/yYhIYlFfqARLfxEh+f5t5DwjjsxmuSN5gG+z/08cSsCQnJd
 ZlEwZaIu6dE4cmtom5ffoXwUl01Ni5o=
X-Proofpoint-GUID: EA6tVWbON4mgaVf8LC_fJ3HBNnvdOEDc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_05,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 adultscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607070189
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
	TAGGED_FROM(0.00)[bounces-117397-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FORGED_SENDER(0.00)[daniel.lezcano@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:sre@kernel.org,m:hansg@kernel.org,m:ilpo.jarvinen@linux.intel.com,m:linux@roeck-us.net,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:bryan.odonoghue@linaro.org,m:platform-driver-x86@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-hwmon@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:neil.armstrong@linaro.org,m:gaurav.kohli@oss.qualcomm.com,m:manaf.pallikunhi@oss.qualcomm.com,m:priyansh.jain@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
X-Rspamd-Queue-Id: D0B0571F350

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
	v6:
	 - Added Reviewed-by tag (Dmitry Baryshkov)
	 - Removed required property for #thermal-sensor-cells (Krzysztof Kozlowski)
	v5:
	 - Added Reviewed-by tag (Ilpo Järvinen)
	 - Added the '#thermal-sensor-cells' property DT binding (Sashiko)
	v4:
 	 - Added the missing HWMON_C_REGISTER_TZ attribute (Sashiko)
	 - Fixed dependency with HWMON (Sashiko)
	 - Added Tested-by tag (Neil Armstrong)
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

Daniel Lezcano (3):
  dt-bindings: embedded-controller: Add Lenovo ThinkPad T14s thermal
    sensor provider support
  platform: arm64: lenovo-thinkpad-t14s-ec: Add hwmon support for
    temperatures
  arm64: dts: qcom: x1e78100-t14s: Add thermal zones for keyboard skin
    and charging sensors

 .../lenovo,thinkpad-t14s-ec.yaml              |   4 +
 .../qcom/x1e78100-lenovo-thinkpad-t14s.dtsi   |  67 ++++++++-
 drivers/platform/arm64/Kconfig                |   1 +
 drivers/platform/arm64/lenovo-thinkpad-t14s.c | 131 ++++++++++++++++++
 4 files changed, 202 insertions(+), 1 deletion(-)

-- 
2.53.0


