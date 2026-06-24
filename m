Return-Path: <linux-arm-msm+bounces-114424-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lavcFGVHPGpcmAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114424-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 23:08:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E6AC76C159B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 23:08:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=S0sSUk6Z;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="Xt/+3sIA";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114424-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114424-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5FA6C30065E5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 21:08:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A36113E5A25;
	Wed, 24 Jun 2026 21:08:48 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 191BC3E5599
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 21:08:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782335328; cv=none; b=q/w+qWikJ1OtxyUunN9AaT03/PdpJ5h0b4KSsU+cFu3s2gZHPIdpmh2fwrZzGC93/moN8qJxjfcLTyl2aP9Y9qIHfbP0898H8esvq6LgQzOaTxOOOKtqOMobhz9axk6z7GraSwr/4C+ws4cFwcvO0qgEwLhnTVQAB+RnCo27Phw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782335328; c=relaxed/simple;
	bh=Pjwum7Mu37SGUsunaTWf37R6DFsb2jzx4XAajClW+OQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=i5WI8660ECp0dQJ2E6PPa2fyTG6sZ3/LlUr/dgjnkJzhYrvKzounPk7T2oX845Ce9l6LYSyu2VseKMelPxbeTbkYAIolikyFFHYzRwnWxcPzTlzLxt+j5jfmjYx9X164HrqDSlyL97PdTTx3xjYlJ+PxhE5fDVSzmKqjPjas62g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S0sSUk6Z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xt/+3sIA; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65OJkNXw129054
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 21:08:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=NF98u5m0GQQqjMpcochC97YunhtCfm5cQBU
	9SMM1MoA=; b=S0sSUk6ZPVpbTTVHkgCEqN6NrMf86QEsRvckN6CEFqZGTWSY7bE
	SatDPG1P2jUm4JortNy62OspvSrafgfp3ojHAVsdS3yrf1YHhlNg/37a/J6FVkBW
	ald8d97dEZg02qXft2Z0Aw+qoCAOSFP23TEndFxtQhCd5AZbPTVcZtbcmVM/+/5l
	ailHfBe35IQfwLf/KL/JU0kx8iHGfp9oSQ1uUFsJ/7n4QZ2ebanJ3sXwgO29RzlE
	kDZs8sxRjBYCMXd/HGtJk+WmlujnXxhrvKQswQrIKUXi2GiJZjGnBKe2WetBNmcp
	nDOoD3d7FPbycoelp7536s7jStneujENitA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0d5g2ht6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 21:08:44 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9158f2c4b55so181927885a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 14:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782335324; x=1782940124; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NF98u5m0GQQqjMpcochC97YunhtCfm5cQBU9SMM1MoA=;
        b=Xt/+3sIADniznDJADTMCIyylipdPmXItDJA0ivWXmTM709Rz2OZipDKJHoMTSu9vj1
         v5di1pbaVraQQaWaYzBPV3fjjhlyf9YoghcoP+QVo8RefRQ9jNDf91KGwyQ8ZteJY+BB
         Ydzvzz7lMtzN228Y8OEQrO3x7iEVKojgIvup2xEOFrz4GwXbZEnuHoQnUBqCS/t82nFG
         SyTXeLcPvkWL6hC4GWTZnQBEoJvPp+06H2H5PVcX9tFqJEyte7tnoOJmEkj5vtjA9/gV
         SH77Ehgk4ub3UdJ9F6UyqkWeivugDFu2nC8zaVK65GEnn1ZdVLr9Ts7WF3KAHXul2yhm
         a3Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782335324; x=1782940124;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NF98u5m0GQQqjMpcochC97YunhtCfm5cQBU9SMM1MoA=;
        b=Ej6w6HPPn5srHexnP78mEiNo37MKJWJwRn6TXDftHBfc9k6rUGKuD/PeruI/qBjAO8
         CeUiMzOLfJf8MoagQ6QI4syDkupU19hpIuXC5uenX/RYeSKVtDQdA+IAo5Nh7cLuMgx2
         R9glLLylV1sz/PHamK5RP3iNgEZPNVDWBkH6ev/5ldRO60B+PvGvxfq9/6c1B6xHUi2y
         EUmKXUF2UqYOvYY+BCxDosUwmMlqpfmmkOLfvbvwyVj33To/iyJU31I7VJ4tCpzaXHmZ
         2VaaMcUMgiM2fCpOwWj/7g3PkoUYttERjBrKxzF0/n6u8KO6Oj6dtjsVfLXG4Ml7d4kD
         E6zw==
X-Forwarded-Encrypted: i=1; AFNElJ+OppZD6WAqr8gaORsMP3UsRdiNaG5h+tvgsPsRIl0Cj9LuR1WCyAqGp/dgYufCmKUy7Clh0Lmk9iu2+QOc@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2cKTAl7a44b+keG5J+xm5qkjxAXID+7/v17/vLhwI8km77gbg
	Vq8yEShaThJIxpHp8GJbIXAxrJVeLqRk6YtNsGByj+S9ZQ/G72INm5BPL85umU7aXLP1UKKAZxt
	aCgMhCeyBd7LyybW0SE7xQ2axoNeq6L0sv9NaGd+0o2TO/PlDM6bGsiIwR6klnMZIEQr2
X-Gm-Gg: AfdE7ckRJWO5bGavd7NHxKyREBPOWpPtHZGJ9wSK3hwgiynHtkpuqDlxc/Oo4TM2TFQ
	a1OWB5Bp2C+BdUb7YpSvosTmK77HKX0ZW+EEJHsHRUTqrOt0yeP2UXlbtoUEgNZ804w+NTNTvZA
	kJdy88OjY07wkmieQLsCxjCO6WLTGB1eETqfclrBqMQzRAS2RLURtcBR/EBbmSWPXthoh0miJ7y
	zOpxU/LU3ViQg6vK0I7HaK2U0CCibe94ibZwn401rosZ+/n2ZN6SOe5v1smJJoRPa6Se1TSXxyq
	l53e9AwocWVnOfDMS4vjhC+YbEukmKcK8fD00YXHSD6GBLCmWidlrBQHtUvvILk6qAxWAEOYA6q
	q8iIs6moj39XOZkuefFVvodpvy6rmqn6cQUQ8ihNyTeZPkw==
X-Received: by 2002:a05:620a:170e:b0:8cf:c106:faca with SMTP id af79cd13be357-921d29f8690mr3323305985a.36.1782335324233;
        Wed, 24 Jun 2026 14:08:44 -0700 (PDT)
X-Received: by 2002:a05:620a:170e:b0:8cf:c106:faca with SMTP id af79cd13be357-921d29f8690mr3323299885a.36.1782335323714;
        Wed, 24 Jun 2026 14:08:43 -0700 (PDT)
Received: from juillet.box.freepro.com ([2a05:6e02:1041:c10:91ef:5c1f:e854:38f1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46c1e840efdsm9455767f8f.5.2026.06.24.14.08.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 14:08:43 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: sre@kernel.org, hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
        linux@roeck-us.net, andersson@kernel.org, konradybcio@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: bryan.odonoghue@linaro.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v1 0/3] Lenovo ThinkPad T14s EC thermal monitoring and thermal zone integration
Date: Wed, 24 Jun 2026 23:08:22 +0200
Message-ID: <20260624210825.264454-1-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=LdMMLDfi c=1 sm=1 tr=0 ts=6a3c475c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=kbYhDkqKViOJv1L1JOIA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: Akug7HNiAM-gshlVJs7wy-1EgUZKBhBS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDE3NyBTYWx0ZWRfXzsRID+NS87B/
 +x4YtxY00wDcH9jTIhidhLroPihKPcv+z0TGTDysZKdYrhTN86lHaCWydWNfdW/op29YHE1CTYF
 N4GqEqjgxPIe4gj6hAyQ7A6qX8tcw+dc+9c9FISfXhyZiL/ArK935qo/uGYKyv23hxdwzmHJKfP
 lU6KiG5URJN3MUdSzVjXZn9WJaqFhM0jLwsyzQ2/4ItJWt3HDp0PpLHdyhEbK7ZkxwoErBEzne6
 3sSJPWt0ir1TfKgvrrTpyW2Pcw+NIz1SFRIXEJ7WeQWpHPoDPp+TTPiLjRsKcDphqnTThp5INUE
 UuN3bw7xGhhD/qXwIKqPQA+vocDhUVs96y3VqRd4BDeGxpfOdjAO2yM+Iet2T7Ocl20+aUzH5D7
 lFQji0cIvw6gYQgZVsd9Ba6ALFsdE9CixSqRC4vj8JRbpXbBM7MVgqpaj8C0w+OERK1wv0jeWig
 pIH1ZZ9LaO+Wf2piKHg==
X-Proofpoint-GUID: Akug7HNiAM-gshlVJs7wy-1EgUZKBhBS
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDE3NyBTYWx0ZWRfX7FLfyu/+pg5+
 CII29SCVJtjDolHuRyZDKQ4sz18qWR78uDoaJxVbzqJyMmw9WCD7b86OJFoE+wbap28DCb7zmNG
 pt0SCrkVClOucxpIzDmlaybOYEZ1CDM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_04,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 phishscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606240177
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-114424-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:sre@kernel.org,m:hansg@kernel.org,m:ilpo.jarvinen@linux.intel.com,m:linux@roeck-us.net,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:bryan.odonoghue@linaro.org,m:platform-driver-x86@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-hwmon@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER(0.00)[daniel.lezcano@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[daniel.lezcano@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E6AC76C159B

Hi,

This series extends the Lenovo ThinkPad T14s embedded controller driver
with environmental monitoring capabilities and integrates the exposed
sensors into the Linux thermal framework.

The EC provides access to several platform temperature sensors covering
the SoC, keyboard area, bottom cover, charging circuitry, QTM module and
SSD, as well as fan speed information. These sensors are currently used
by the firmware for thermal management but are not exposed to Linux.

The first patch adds hwmon support for the EC temperature sensors and fan
RPM reporting.

The second patch wires EC thermal notifications into the hwmon event
framework, allowing userspace to receive alarm notifications when the EC
reports thermal zone state changes.

The last patch exposes the EC as a thermal sensor provider in the device
tree and defines thermal zones for the keyboard skin temperature and the
charging circuitry temperature. This allows the generic thermal
framework to react to EC-reported temperatures and apply standard Linux
thermal mitigation policies.

With the latest patch, this series fixes thermal issues happening on
this platform where a kernel compilation leads to a system reboot.

Tested on a Lenovo ThinkPad T14s Gen 6 (Snapdragon X Elite).

Thanks,

Daniel

Daniel Lezcano (3):
  drivers/platform: lenovo-t14s-ec: Add hwmon support for temperatures
    and fan speed
  platform: arm64: thinkpad-t14s-ec: Wire EC thermal events to hwmon
  arm64: dts: qcom: x1e78100-t14s: Add thermal zones for keyboard skin
    and charging sensors

 .../qcom/x1e78100-lenovo-thinkpad-t14s.dtsi   |  68 +++++-
 drivers/platform/arm64/lenovo-thinkpad-t14s.c | 193 +++++++++++++++++-
 2 files changed, 255 insertions(+), 6 deletions(-)

-- 
2.53.0


