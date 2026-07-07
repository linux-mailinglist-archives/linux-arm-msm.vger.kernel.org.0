Return-Path: <linux-arm-msm+bounces-117396-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Dsc9LwhSTWpeyQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117396-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 21:22:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BA5AC71F28A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 21:22:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=hipbacNZ;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=FJE0ntUY;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117396-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117396-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 44BA23002505
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 19:22:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCE4931A7EA;
	Tue,  7 Jul 2026 19:22:28 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B07732D47E9
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 19:22:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783452148; cv=none; b=MdgvP7dreYyNPCrCDvrXd6pft48fjDzG/9aRg+mihPsNk6p0J2m4HfR/3RoK6YtF/i8qpJZ6GnMz9DyzATFdsvGKrTAl2Hwm4oBuMXZ9k57O0SaoOnCsYHbs6MVDGlsngR2SRWiPlYy0Cpt61nXp2LA88buw0wrNoo/SWkRsBGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783452148; c=relaxed/simple;
	bh=+Rcs9tqTLxY6uz2CPrBVs8k8aFNAm68QFL8TI+SEKms=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ib265uAvj8TfKoODzA2tGLhcdj8gyZNE8dKK552zz0CHy0hQX6dxYIk4vNsysrO2lqR3Uv59+VkAdhih3ayKC04CNGgH1FuLsv48EPnlyv53qGsGIHqXwWQzRhTmgHhiNVjwL2SifSHt2Ymy6AynggOcLcGzJNVME0KTDwl81Ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hipbacNZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FJE0ntUY; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667J5QkW490911
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Jul 2026 19:22:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Mt/L0C8c6aeHx2BoFJgmqf
	geH7twNz10xR7G3mGjzkM=; b=hipbacNZIKnbOIiuL7Ija/REMd/Qsr8oDEC4x9
	Sma7nBVS6fC+E/CwoO+vJ8KyblEMZK9nY0q4c60G/n7KruCB06+qG8RlC/RgvV5c
	Qdk+3ZW6G4xSh/zsW7o7kd13nQx6+jqqEn5E8Aov+R+jHCDA5A+5Wr8azUO8Age6
	j7V7WM4CgvIWbyH3c40usP7tp3cygG911zSAV7szQ8c6clkhDOdyS199Sw6c5NK7
	WaNH0iB/YXJnSuivIdV1j2EWjMohbIkAemdcqmcLl0Eprp7ghTDPpRbMF9m+rjZZ
	7lHufJaDnW9odRFKCxInYBnyAm1MJZhwCOdI1QBE2jwHdemQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8v9abb50-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 19:22:25 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c20762d21so56125651cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 12:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783452145; x=1784056945; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Mt/L0C8c6aeHx2BoFJgmqfgeH7twNz10xR7G3mGjzkM=;
        b=FJE0ntUYBtY9PKBQ2MxZYWuWXJUs8nKIQtds2c3EEGXPyjLzSEWsH49aQ1xz5qPvjl
         7ptEWF6ZKgRR2FU+auw2yhZtLpCHss3CLcAF6J44rGbwgnOYjQCyCIYe+AVTD70GupB/
         tC8yov7hrrMPMyLJuHDagw0tpc3qbzMdDRUNaO6C30l1UWLEGgkA4ZYeR0QMJX+F+5T8
         Ghc101X3BNfRYX9UsYxJvU72j06nsRr1bd6cdutiEm9O3WCCcoyXlyX2TfFOy+pJ0Z4V
         ofj51KHApsbQN5qgecaURgy2M9QnpxSGLIuPASjAfDAI+0/wZnspVgDpXtRjCbWzIaX+
         HcyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783452145; x=1784056945;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Mt/L0C8c6aeHx2BoFJgmqfgeH7twNz10xR7G3mGjzkM=;
        b=FqXUXD/D7rtJpmM2uBFhpn5rz8gT8vVdvM8qCg0SVA5Tq1/FeDFBC/NZ52zOU57j/H
         AqsUY+rxlE48zfR8rchykPL/bfpI2cebyuIylkxgqqEpEbFsZnX5L7xZLQ6bU9Fn8oPT
         MFDiRGbgP7pmoebJZ4RzGGQUwfjaSpEtd4c4AJJglP2xkcQ2u8sjRsYAD5bb2LL6j1Tb
         a1bdOB9twB0abn6aKTxQS/NFgMlTaW1Lw6dNWhFnY5oH7G5WkigpTvvq9s78OnJK9o7D
         AS5YqlHiPatlpL37M/TDK2pa7XTPZW1AmdjDlKQC9RUD7vnE5xVdroKPw6csnNj/1nGF
         RhaQ==
X-Forwarded-Encrypted: i=1; AHgh+RoqfAzUjMOMEpFpvQ+IG0Fw9VhjqfeEhVtVWLaMKe0Ry0OLJUtkI7Pit23TUdBp023tRWfLfDL0rRB8cbou@vger.kernel.org
X-Gm-Message-State: AOJu0YzEafyejK1P3cY9NUvvGF2h3Bg3Cy3/yr2md7a8gJNNjnVVK3gC
	giZOxNjVvg6OEbL4f+J+xxy+YPoas5UQaXu9j4sEgZ20BVGdANPXF5YvY7jNNXY+6dqsS6aos9g
	JRWVhFMSZ9GIaBejjayDeAEw+vtknHNCJb5UNhOE2hbZqwCVjccVFsBsDrkQ1RWahJmCr
X-Gm-Gg: AfdE7ckdDuey7YvoWNCnJfJsX2af+mS2QJKad1FLZ2hThywNYh/s6KV2aCmTd0GzWcM
	dgmfjFwWiOxZYyoi1Bo7eRqzDpXNUeoTkffiOi+IbN5vwvsqO0nq+TD5DPPNLX0dJ29fA1WnJ4t
	kyzct0YbH9s8U61c4mdDDIgO/BrFqDMyYvKMBzDA+/M7Q9ZYXwKR0z/0YBoWpgrnDNLLTLPOhpO
	eHJkWShNV0I11cQg1ezmlLZTw2+QW9t/dW+Cowd67ETuYnZejW/DpLZbKWRydOHU4cV6U17FDrb
	q35k6ISNb/0ZOeBuQYavM058u90RRQyrJMNKapnQIbh/1Rj2Mvw1B0K2aNa4Vhyh23eJcX+3aqa
	/JOunCuHx0MBM1Y943ndfG5RKLLlCcodpTPUYT84+h/c=
X-Received: by 2002:a05:622a:53c6:b0:51c:1e69:bcc8 with SMTP id d75a77b69052e-51c7479f5ecmr70651281cf.10.1783452144741;
        Tue, 07 Jul 2026 12:22:24 -0700 (PDT)
X-Received: by 2002:a05:622a:53c6:b0:51c:1e69:bcc8 with SMTP id d75a77b69052e-51c7479f5ecmr70650781cf.10.1783452144006;
        Tue, 07 Jul 2026 12:22:24 -0700 (PDT)
Received: from juillet.box.freepro.com ([2a05:6e02:1041:c10:8029:bbc1:63:ed84])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa039ae4fsm37218836f8f.18.2026.07.07.12.22.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 12:22:23 -0700 (PDT)
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
Date: Tue,  7 Jul 2026 21:22:16 +0200
Message-ID: <20260707192219.14605-1-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: -4L_jNewzSoSHosshc1BKvNz-24j-GtO
X-Proofpoint-ORIG-GUID: -4L_jNewzSoSHosshc1BKvNz-24j-GtO
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDE4OSBTYWx0ZWRfX5zyzHGDbufTL
 C0n6Ov5qIM+z9A/eBM3EVrFYh6fVE+W4W1PSfsEwqEyOOpGB7mrIuQ0lAnQgWpRsyLiDowezoFT
 tUZvNaOPYjwMWFey9CiTe/YnquC/1gA=
X-Authority-Analysis: v=2.4 cv=b9yCJNGx c=1 sm=1 tr=0 ts=6a4d51f1 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=Jz99LMs1rTwwAPREzXgA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDE4OSBTYWx0ZWRfX9dyscuvTFpRj
 NwUkxQrx1DKEMjSt+NG4kyZfjUVTuFdRA8cq27y0VOWVRO1SElYz61v33OZw7ZO5n4qomZHzb3K
 tnhhD15LlEjL5GgtTO1i9RKax7itek6t/g4VW8EHxnOscEl0yvaQHXiXZE1StWwA3b6njCDM66M
 vBjVFYtlSuvU9Ig8Nk8Gobhb+yl9i/MUTn3LWdakkId25qIyn3zPEoKKcv9qiopcvWJZAqyZ5d8
 /GZBZT9IKcGVPl9iQIv3GwfWj7e+Po1W8qV4KP0QjB56Te1HVosXhWTU8zjLSnYX4zQwisnTQde
 QUVwfh7TsA+0wCFM+LDKkQQMhMzlh9+DZynbqt6ye13jnACcZxUFyt0+RMUL7DR2MB2SLe9PUKu
 /L8vWhsCh5KOHoaUnbYF0udx2rjQTZyrZpJxJhWkOWXj6Em7lu2R/LUnn4b2h6n6wpu4uP5bbmT
 YMFrd8XxOKDyZWyxUBQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_05,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070189
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117396-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim];
	FORGED_SENDER(0.00)[daniel.lezcano@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:sre@kernel.org,m:hansg@kernel.org,m:ilpo.jarvinen@linux.intel.com,m:linux@roeck-us.net,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:bryan.odonoghue@linaro.org,m:platform-driver-x86@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-hwmon@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:neil.armstrong@linaro.org,m:gaurav.kohli@oss.qualcomm.com,m:manaf.pallikunhi@oss.qualcomm.com,m:priyansh.jain@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
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
X-Rspamd-Queue-Id: BA5AC71F28A

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


