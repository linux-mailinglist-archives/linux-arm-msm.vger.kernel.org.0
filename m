Return-Path: <linux-arm-msm+bounces-112125-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mUjeBbHqJ2qh4wIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112125-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 12:28:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F39C65EE41
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 12:28:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=BPWiBrBF;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=O6kJfgRX;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112125-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112125-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9FD053089E41
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 10:23:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AB0F3F39CE;
	Tue,  9 Jun 2026 10:23:32 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E9CC3F164F
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 10:23:30 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781000612; cv=none; b=fByQCWqQ52zF/x5unrW8RSW7NnbfdMexLXthjLoVKEfRrNLW8AQ+puSQHTQv/7W+cUEiSHxLNCoHOq2Nu1IWaFNCotLKYWAirA2bMHSLjMMN8zmmwXzeizPVetwygZdGobf5eM5QaSvRXEZbASh/LWYxsTlzA3gbLZHoL/pzygI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781000612; c=relaxed/simple;
	bh=BvxkuRTTc6RczDjBRdbesg57KP2U9uES1GTmsj/95pw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=n1VJzKZG/Vo/tBD22e+fX0mGxHptu8NCt83pWen5C2D9b+5C1tT8wfV0WfTINypgjjMdolvvq1ENMhWtZwD6MlIkq6CjMEp4nWgCH4HJbVOcHZM1jDLgaADyGame3flaDLisLvB0pQ0f+4jDS1XV2rBW5eb/46KtaCOHDVXZAf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BPWiBrBF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O6kJfgRX; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6599xiah2245500
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Jun 2026 10:23:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CBp4YmVCo2tb2Dr4iSGajxExEgZ8osIa+4o52mx3Le0=; b=BPWiBrBFvdZFMzqd
	M/VOxLgQdF8PrCjGF1Ze0JNiqNrUrXbJNc0JuA4f6kme1EV1kVsxX1flis6JtOMN
	9ysY4ztqq00nV5hhpBwfOpIo8+JTOS9Uug5KDD/f7iHfPNIk6bwHbmLhMEGh2q0/
	PSkTkcja0NaugZ9KByw92J+MhULXVW8/WElVOkwakAjsx1SgnEzLNF36YV0RXn89
	It1NLK8L0dgK/+AihUKV+8hMQm1N0otd1OuSTO2HiutD2MztsFLAHgZ6qFFII6rO
	UfKW2mCweQzleyF4kjlzuzHKqlLw4pB7J4xLQhISIkAtqvoHOeFQi09IDNLbS0HA
	12EhoQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epdds911r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 10:23:29 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2beff6b6e74so54529045ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 03:23:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781000608; x=1781605408; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CBp4YmVCo2tb2Dr4iSGajxExEgZ8osIa+4o52mx3Le0=;
        b=O6kJfgRX2WfYLqOViFyBJO5ps9jbx2i7lxDoNrM4RzhoG44utgDq729E3Dqg2NecWT
         iOW2/N4opyU1viyosBorLfcbNpt/1bHmGFqcUSxT0l3iDIYIqQimugXmoywazveSuOFA
         xHrBJR3cB59PI33/Fs7tkMj8MSKkFrYEjbsJc/+nWO84ZW2TVm7PJlO1sfG1lE8OfnXA
         t72Ieli1Pviqj0O1qWNZnev8PlEE86wpPhRVR45RkfWYw1lfvWr8xRQ+caNg0xAapmO4
         VcMOukaw6qDtUGFvzvgipq6/xXKen240AriwyDk/RhBk3LNoS7b3FT4QGv9ocNQyR2uN
         8pUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781000608; x=1781605408;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CBp4YmVCo2tb2Dr4iSGajxExEgZ8osIa+4o52mx3Le0=;
        b=KBfBxi28L9TE2+GLOilRxrKKllNP0JDzC+FShbRfgtFNWZCNJFa7kl+VnCUO+Fx1g3
         s9u63w8Qo5TJuawV3Nn/DVYZLrk+AXMY4qRdKqSvImcRjE+LSZSRGkJTWjAUVyGiCMMs
         XTfaZOStbetGvsGk8b7GFxoJ0IisdXe87ea9cIIBK4CDOB+VY0oACknm721OYNv7fq8N
         GRT0J1AEwQiYDat4eUT2jS+pHo/rCEPG7j0P0xFf9HyNdOcBjZYTUSnsQc6onu0LOMCX
         Kil8XTreiSjIpb85cZ5jp1rf35LK/2y3HjHvKQfGyx4mW5gLsDVR6SiXC8U/8jWHkAeP
         2qMg==
X-Gm-Message-State: AOJu0YzwX2l1CBL4m0Qqc8AQTo90uzfPIi9e18jjhX5zpti1QGxok41l
	jT4N0GTGQmX96OdmRE3grWAIB1rw/3e4vKTLG0yHL07+cgGZ/6SK/irvMJTuZGpiYQjefsNIzkb
	MZ7xAOV68WsGRo8kloXKRtFx8zwaXVM50HiUbFqZ9tmstp4cqbsVGrYcHvHjA/1u2uZw6
X-Gm-Gg: Acq92OGqCruRMVh3ithDHZmdbxVgClXnJIeeHE0S4buzQEzHjEJ4wiuAjbBpEl6SsAH
	MjErtl/nGA/dS52MIJK8Z871el0xRBHvNtS1ptLjXxDWqsdAYC1rMxzl7A7b4NidnGDneTmx0eQ
	ryx7KlxLZ8piTS0V/q+K3cmR/iMOklqOa8xz5zg4G8Ih/z8a9rSdIeYFo0B7HDbZzMcxH8zkF3b
	84Z9kVNvi5hr4q3XB4qkbjt4XI9KJ8FwFa9kcyO1Ws2fPaR26sXUrT43kcG6T76HadGAs3Y4mdn
	KcDiB95Bqq52VZ5nCDy4tn6J50B6nCCIVNQVPlvtQYxu0z+ZMFt5/CAAuKeDsiwLUy4iA7/BAme
	B3HMhZU4z0tN1WRJat11snIJBQQE8w5sYosKYiHVmd+8ZCSyDlt1h19algDE9LA==
X-Received: by 2002:a17:902:f745:b0:2c2:2a8a:af69 with SMTP id d9443c01a7336-2c22a8ab1a9mr170322315ad.9.1781000608109;
        Tue, 09 Jun 2026 03:23:28 -0700 (PDT)
X-Received: by 2002:a17:902:f745:b0:2c2:2a8a:af69 with SMTP id d9443c01a7336-2c22a8ab1a9mr170321755ad.9.1781000607575;
        Tue, 09 Jun 2026 03:23:27 -0700 (PDT)
Received: from hu-gkohli-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c2a4a64e22sm14738915ad.61.2026.06.09.03.23.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 03:23:27 -0700 (PDT)
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Date: Tue, 09 Jun 2026 15:52:57 +0530
Subject: [PATCH v3 2/8] soc: qcom: Add support for QMI TMD cooling devices
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-qmi-tmd-v3-2-291a2ff4c634@oss.qualcomm.com>
References: <20260609-qmi-tmd-v3-0-291a2ff4c634@oss.qualcomm.com>
In-Reply-To: <20260609-qmi-tmd-v3-0-291a2ff4c634@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-hardening@vger.kernel.org,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Casey Connolly <casey.connolly@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781000588; l=20731;
 i=gaurav.kohli@oss.qualcomm.com; s=20260302; h=from:subject:message-id;
 bh=LfLWpK6/5X04uNpHzv0+wA4kNUoD/RsII6vsCeiT7gA=;
 b=bWTaM49xEAb7+3xnTjmu30tAPAMX4m+oZQhK4J44CiSEFRkAphFWDOb5qDb4SUuwJG80ZUFzJ
 9q4FRid1kVTB+aj4l+62r7BtzCgkSC5Enz5V4Joo+FV8MsUEgkedJVM
X-Developer-Key: i=gaurav.kohli@oss.qualcomm.com; a=ed25519;
 pk=IdNsqe8rWsF6dbpGHfwPEH9zM0nbOdRH72HxUT9qPak=
X-Proofpoint-ORIG-GUID: kSFhjWHuGLZS0ObQDfJfyMzMEqAYhTpE
X-Authority-Analysis: v=2.4 cv=EI42FVZC c=1 sm=1 tr=0 ts=6a27e9a1 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=gbibrS9mvRCYIXANk9gA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: kSFhjWHuGLZS0ObQDfJfyMzMEqAYhTpE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA5NyBTYWx0ZWRfX/wW5jMHwvOaF
 of2LVOYFt+Sp8ZbP1o4gBMZ8Q2XhFNyM7Tq2tUkcMshH2N7cQW4nJoH0GczDvcxjN4/ZEJmKcHx
 xFBFD+TqG/Sg9T9dByeFuPyo8pq7OyvIiddpMCkXxICfzX8zyuRlxrehVgWQk418byTJk6sTsRG
 7FQiuHbaSgEaESOPvDz3ZrSrZj+0FArDrS/pSHHsrjKeBrq9r4f+8t8+MQD+GZXDl77Fb3jM4gE
 DpzdFxQKwrX9CY90REctwn/qoq8HjUEzs7LvXd6VEavFUix+P7dMYzr2CBN3TV0PNtCVYIgwtJZ
 iSyFIQSmCejX+CxCHUE2uus8Mp9X7dPD48adpnRCqeR3Wq1AW1BNwWG7BGv69eEKNiNwJXTp60k
 RTAh3hJ9XN/jwyJIhP7u8SaQVQPiVEMBRJuqBrICLExPP4DmWV0ZTZym4SuVhs1jdBEutp5gVyw
 OpoLvyMkpP8OiI6A59A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 bulkscore=0 phishscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606090097
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112125-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:daniel.lezcano@oss.qualcomm.com,m:amit.kucheria@oss.qualcomm.com,m:mani@kernel.org,m:konradybcio@kernel.org,m:gaurav.kohli@oss.qualcomm.com,m:kees@kernel.org,m:gustavoars@kernel.org,m:cros-qcom-dts-watchers@chromium.org,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-hardening@vger.kernel.org,m:manaf.pallikunhi@oss.qualcomm.com,m:casey.connolly@linaro.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[gaurav.kohli@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gaurav.kohli@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5F39C65EE41

From: Casey Connolly <casey.connolly@linaro.org>

Add a Qualcomm QMI Thermal Mitigation Device (TMD) to support thermal
cooling devices backed by remote subsystems.

On several Qualcomm platforms, remote processors (for example modem and
CDSP) expose thermal mitigation controls through the TMD QMI service.
Client drivers need a way to discover that service, map DT thermal
mitigation endpoints to cooling devices, and forward cooling state
updates to the remote subsystem.

Co-developed-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
---
 MAINTAINERS                      |   6 +
 drivers/soc/qcom/Kconfig         |  10 +
 drivers/soc/qcom/Makefile        |   1 +
 drivers/soc/qcom/qmi_tmd.c       | 604 +++++++++++++++++++++++++++++++++++++++
 include/linux/soc/qcom/qmi.h     |   1 +
 include/linux/soc/qcom/qmi_tmd.h |  23 ++
 6 files changed, 645 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 57656ec0e9d5..3d60702a655a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22286,6 +22286,12 @@ F:	Documentation/devicetree/bindings/net/qcom,ipq9574-ppe.yaml
 F:	Documentation/networking/device_drivers/ethernet/qualcomm/ppe/ppe.rst
 F:	drivers/net/ethernet/qualcomm/ppe/
 
+QUALCOMM QMI (REMOTEPROC THERMAL MITIGATION) TMD
+M:	Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
+L:	linux-arm-msm@vger.kernel.org
+L:	linux-pm@vger.kernel.org
+F:	drivers/soc/qcom/qmi_tmd.c
+
 QUALCOMM QSEECOM DRIVER
 M:	Maximilian Luz <luzmaximilian@gmail.com>
 L:	linux-arm-msm@vger.kernel.org
diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
index 2caadbbcf830..a292ce57fd4a 100644
--- a/drivers/soc/qcom/Kconfig
+++ b/drivers/soc/qcom/Kconfig
@@ -128,6 +128,16 @@ config QCOM_QMI_HELPERS
 	tristate
 	depends on NET
 
+config QCOM_QMI_TMD
+	bool "Qualcomm QMI TMD library" if COMPILE_TEST
+	depends on ARCH_QCOM
+	select QCOM_QMI_HELPERS
+	help
+	  This enables the QMI-based Thermal Mitigation Device (TMD) library
+	  for Qualcomm remote subsystems. The library manages TMD messaging and
+	  handles QMI communication with remote processors (modem, CDSP) to
+	  exchange mitigation state and apply thermal mitigation requests.
+
 config QCOM_RAMP_CTRL
 	tristate "Qualcomm Ramp Controller driver"
 	depends on ARCH_QCOM || COMPILE_TEST
diff --git a/drivers/soc/qcom/Makefile b/drivers/soc/qcom/Makefile
index b7f1d2a57367..4544e61c74e7 100644
--- a/drivers/soc/qcom/Makefile
+++ b/drivers/soc/qcom/Makefile
@@ -14,6 +14,7 @@ obj-$(CONFIG_QCOM_PMIC_GLINK)	+= pmic_glink.o
 obj-$(CONFIG_QCOM_PMIC_GLINK)	+= pmic_glink_altmode.o
 obj-$(CONFIG_QCOM_PMIC_PDCHARGER_ULOG)	+= pmic_pdcharger_ulog.o
 CFLAGS_pmic_pdcharger_ulog.o	:=  -I$(src)
+obj-$(CONFIG_QCOM_QMI_TMD) += qmi_tmd.o
 obj-$(CONFIG_QCOM_QMI_HELPERS)	+= qmi_helpers.o
 qmi_helpers-y	+= qmi_encdec.o qmi_interface.o
 obj-$(CONFIG_QCOM_RAMP_CTRL)	+= ramp_controller.o
diff --git a/drivers/soc/qcom/qmi_tmd.c b/drivers/soc/qcom/qmi_tmd.c
new file mode 100644
index 000000000000..9d88ae48c864
--- /dev/null
+++ b/drivers/soc/qcom/qmi_tmd.c
@@ -0,0 +1,604 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2025, Linaro Limited
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ *
+ * QMI Thermal Mitigation Device (TMD) library.
+ * This library provides cooling device support for remote subsystems
+ * (modem and CDSP) running the TMD service via QMI.
+ */
+#include <linux/cleanup.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/module.h>
+#include <linux/net.h>
+#include <linux/of.h>
+#include <linux/slab.h>
+#include <linux/soc/qcom/qmi.h>
+#include <linux/soc/qcom/qmi_tmd.h>
+#include <linux/thermal.h>
+
+#define QMI_TMD_INSTANCE_MODEM	0x0
+#define QMI_TMD_INSTANCE_CDSP	0x43
+#define QMI_TMD_INSTANCE_CDSP1	0x44
+
+#define QMI_TMD_SERVICE_VERS_V01 0x01
+
+#define QMI_TMD_SET_LEVEL_REQ 0x0021
+#define QMI_TMD_GET_DEV_LIST_REQ 0x0020
+
+#define QMI_TMD_DEV_ID_LEN_MAX 32
+#define QMI_TMD_DEV_LIST_MAX 32
+#define QMI_TMD_RESP_TIMEOUT	msecs_to_jiffies(100)
+#define TMD_GET_LEVEL_REQ_MAX_LEN 36
+#define TMD_SET_LEVEL_REQ_MAX_LEN 40
+
+#define TMD_GET_DEV_LIST_REQ_MAX_LEN 0
+#define TMD_GET_DEV_LIST_RESP_MAX_LEN 1099
+
+struct tmd_dev_id {
+	char mitigation_dev_id[QMI_TMD_DEV_ID_LEN_MAX + 1];
+};
+
+static const struct qmi_elem_info tmd_dev_id_ei[] = {
+	{
+		.data_type = QMI_STRING,
+		.elem_len = QMI_TMD_DEV_ID_LEN_MAX + 1,
+		.elem_size = sizeof(char),
+		.array_type = NO_ARRAY,
+		.tlv_type = 0,
+		.offset = offsetof(struct tmd_dev_id,
+				   mitigation_dev_id),
+	},
+	{
+		.data_type = QMI_EOTI,
+		.array_type = NO_ARRAY,
+		.tlv_type = QMI_COMMON_TLV_TYPE,
+	},
+};
+
+struct tmd_dev_list {
+	struct tmd_dev_id mitigation_dev_id;
+	u8 max_mitigation_level;
+};
+
+static const struct qmi_elem_info tmd_dev_list_ei[] = {
+	{
+		.data_type = QMI_STRUCT,
+		.elem_len = 1,
+		.elem_size = sizeof(struct tmd_dev_id),
+		.array_type = NO_ARRAY,
+		.tlv_type = 0,
+		.offset = offsetof(struct tmd_dev_list,
+				   mitigation_dev_id),
+		.ei_array = tmd_dev_id_ei,
+	},
+	{
+		.data_type = QMI_UNSIGNED_1_BYTE,
+		.elem_len = 1,
+		.elem_size = sizeof(uint8_t),
+		.array_type = NO_ARRAY,
+		.tlv_type = 0,
+		.offset = offsetof(struct tmd_dev_list,
+				   max_mitigation_level),
+	},
+	{
+		.data_type = QMI_EOTI,
+		.array_type = NO_ARRAY,
+		.tlv_type = QMI_COMMON_TLV_TYPE,
+	},
+};
+
+struct tmd_get_dev_list_req {
+	char placeholder;
+};
+
+static const struct qmi_elem_info tmd_get_dev_list_req_ei[] = {
+	{
+		.data_type = QMI_EOTI,
+		.array_type = NO_ARRAY,
+		.tlv_type = QMI_COMMON_TLV_TYPE,
+	},
+};
+
+struct tmd_get_dev_list_resp {
+	struct qmi_response_type_v01 resp;
+	u8 mitigation_device_list_valid;
+	u32 mitigation_device_list_len;
+	struct tmd_dev_list
+		mitigation_device_list[QMI_TMD_DEV_LIST_MAX];
+};
+
+static const struct qmi_elem_info tmd_get_dev_list_resp_ei[] = {
+	{
+		.data_type = QMI_STRUCT,
+		.elem_len = 1,
+		.elem_size = sizeof(struct qmi_response_type_v01),
+		.array_type = NO_ARRAY,
+		.tlv_type = 0x02,
+		.offset = offsetof(struct tmd_get_dev_list_resp,
+				   resp),
+		.ei_array = qmi_response_type_v01_ei,
+	},
+	{
+		.data_type = QMI_OPT_FLAG,
+		.elem_len = 1,
+		.elem_size = sizeof(uint8_t),
+		.array_type = NO_ARRAY,
+		.tlv_type = 0x10,
+		.offset = offsetof(struct tmd_get_dev_list_resp,
+				   mitigation_device_list_valid),
+	},
+	{
+		.data_type = QMI_DATA_LEN,
+		.elem_len = 1,
+		.elem_size = sizeof(uint8_t),
+		.array_type = NO_ARRAY,
+		.tlv_type = 0x10,
+		.offset = offsetof(struct tmd_get_dev_list_resp,
+				   mitigation_device_list_len),
+	},
+	{
+		.data_type = QMI_STRUCT,
+		.elem_len = QMI_TMD_DEV_LIST_MAX,
+		.elem_size = sizeof(struct tmd_dev_list),
+		.array_type = VAR_LEN_ARRAY,
+		.tlv_type = 0x10,
+		.offset = offsetof(struct tmd_get_dev_list_resp,
+				   mitigation_device_list),
+		.ei_array = tmd_dev_list_ei,
+	},
+	{
+		.data_type = QMI_EOTI,
+		.array_type = NO_ARRAY,
+		.tlv_type = QMI_COMMON_TLV_TYPE,
+	},
+};
+
+struct tmd_set_level_req {
+	struct tmd_dev_id mitigation_dev_id;
+	u8 mitigation_level;
+};
+
+static const struct qmi_elem_info tmd_set_level_req_ei[] = {
+	{
+		.data_type = QMI_STRUCT,
+		.elem_len = 1,
+		.elem_size = sizeof(struct tmd_dev_id),
+		.array_type = NO_ARRAY,
+		.tlv_type = 0x01,
+		.offset = offsetof(struct tmd_set_level_req,
+				   mitigation_dev_id),
+		.ei_array = tmd_dev_id_ei,
+	},
+	{
+		.data_type = QMI_UNSIGNED_1_BYTE,
+		.elem_len = 1,
+		.elem_size = sizeof(uint8_t),
+		.array_type = NO_ARRAY,
+		.tlv_type = 0x02,
+		.offset = offsetof(struct tmd_set_level_req,
+				   mitigation_level),
+	},
+	{
+		.data_type = QMI_EOTI,
+		.array_type = NO_ARRAY,
+		.tlv_type = QMI_COMMON_TLV_TYPE,
+	},
+};
+
+struct tmd_set_level_resp {
+	struct qmi_response_type_v01 resp;
+};
+
+static const struct qmi_elem_info tmd_set_level_resp_ei[] = {
+	{
+		.data_type = QMI_STRUCT,
+		.elem_len = 1,
+		.elem_size = sizeof(struct qmi_response_type_v01),
+		.array_type = NO_ARRAY,
+		.tlv_type = 0x02,
+		.offset = offsetof(struct tmd_set_level_resp, resp),
+		.ei_array = qmi_response_type_v01_ei,
+	},
+	{
+		.data_type = QMI_EOTI,
+		.array_type = NO_ARRAY,
+		.tlv_type = QMI_COMMON_TLV_TYPE,
+	},
+};
+
+/**
+ * struct qmi_tmd - A TMD cooling device
+ * @name:	The name of this tmd shared by the remote subsystem
+ * @cdev:	Thermal cooling device handle
+ * @cur_state:	The current mitigation state
+ * @max_state:	The maximum state
+ * @qmi_tmd_cli:	Parent QMI TMD client
+ */
+struct qmi_tmd {
+	const char *name;
+	struct thermal_cooling_device *cdev;
+	unsigned int cur_state;
+	unsigned int max_state;
+	struct qmi_tmd_client *qmi_tmd_cli;
+};
+
+/**
+ * struct qmi_tmd_client - QMI TMD client state
+ * @dev:		Device associated with this instance
+ * @handle:		QMI connection handle
+ * @mutex:		Lock to synchronise QMI communication
+ * @connection_active:	Whether or not we're connected to the QMI TMD service
+ * @svc_arrive_work:	Work item for initialising when the TMD service starts
+ * @num_tmds:		Number of tmds described in the device tree
+ * @tmds:		An array of tmd structures
+ */
+struct qmi_tmd_client {
+	struct device *dev;
+	struct qmi_handle handle;
+	/* protects QMI transactions and connection_active */
+	struct mutex mutex;
+	bool connection_active;
+	struct work_struct svc_arrive_work;
+	int num_tmds;
+	struct qmi_tmd tmds[] __counted_by(num_tmds);
+};
+
+/* Notify the remote subsystem of the requested cooling state */
+static int qmi_tmd_send_state_request(struct qmi_tmd *tmd, int state)
+{
+	struct tmd_set_level_resp resp = { 0 };
+	struct tmd_set_level_req req = { 0 };
+	struct qmi_tmd_client *qmi_tmd_cli = tmd->qmi_tmd_cli;
+	struct qmi_txn txn;
+	int ret = 0;
+
+	guard(mutex)(&qmi_tmd_cli->mutex);
+
+	if (!qmi_tmd_cli->connection_active)
+		return 0;
+
+	strscpy(req.mitigation_dev_id.mitigation_dev_id, tmd->name,
+		QMI_TMD_DEV_ID_LEN_MAX + 1);
+	req.mitigation_level = state;
+
+	ret = qmi_txn_init(&qmi_tmd_cli->handle, &txn,
+			   tmd_set_level_resp_ei, &resp);
+	if (ret < 0) {
+		dev_err(qmi_tmd_cli->dev, "qmi set state %d txn init failed for %s ret %d\n",
+			state, tmd->name, ret);
+		return ret;
+	}
+
+	ret = qmi_send_request(&qmi_tmd_cli->handle, NULL, &txn,
+			       QMI_TMD_SET_LEVEL_REQ,
+			       TMD_SET_LEVEL_REQ_MAX_LEN,
+			       tmd_set_level_req_ei, &req);
+	if (ret < 0) {
+		dev_err(qmi_tmd_cli->dev, "qmi set state %d txn send failed for %s ret %d\n",
+			state, tmd->name, ret);
+		qmi_txn_cancel(&txn);
+		return ret;
+	}
+
+	ret = qmi_txn_wait(&txn, QMI_TMD_RESP_TIMEOUT);
+	if (ret < 0) {
+		dev_err(qmi_tmd_cli->dev, "qmi set state %d txn wait failed for %s ret %d\n",
+			state, tmd->name, ret);
+		return ret;
+	}
+
+	if (resp.resp.result != QMI_RESULT_SUCCESS_V01) {
+		dev_err(qmi_tmd_cli->dev,
+			"qmi set state %d failed for %s result %#x error %#x\n",
+			state, tmd->name,
+			resp.resp.result, resp.resp.error);
+		return -EREMOTEIO;
+	}
+
+	dev_dbg(qmi_tmd_cli->dev, "Requested state %d/%d for %s\n", state,
+		tmd->max_state, tmd->name);
+
+	return 0;
+}
+
+static int qmi_tmd_get_max_state(struct thermal_cooling_device *cdev,
+				 unsigned long *state)
+{
+	struct qmi_tmd *tmd = cdev->devdata;
+
+	*state = tmd->max_state;
+
+	return 0;
+}
+
+static int qmi_tmd_get_cur_state(struct thermal_cooling_device *cdev,
+				 unsigned long *state)
+{
+	struct qmi_tmd *tmd = cdev->devdata;
+
+	*state = tmd->cur_state;
+
+	return 0;
+}
+
+static int qmi_tmd_set_cur_state(struct thermal_cooling_device *cdev,
+				 unsigned long state)
+{
+	struct qmi_tmd *tmd = cdev->devdata;
+	int ret;
+
+	if (state > tmd->max_state)
+		return -EINVAL;
+
+	if (tmd->cur_state == state)
+		return 0;
+
+	ret = qmi_tmd_send_state_request(tmd, state);
+	if (!ret)
+		tmd->cur_state = state;
+
+	return ret;
+}
+
+static const struct thermal_cooling_device_ops qmi_tmd_cooling_ops = {
+	.get_max_state = qmi_tmd_get_max_state,
+	.get_cur_state = qmi_tmd_get_cur_state,
+	.set_cur_state = qmi_tmd_set_cur_state,
+};
+
+static int qmi_tmd_register(struct qmi_tmd_client *qmi_tmd_cli,
+			    const char *label, u8 max_state)
+{
+	struct device *dev = qmi_tmd_cli->dev;
+	struct qmi_tmd *tmd;
+	int index;
+
+	for (index = 0; index < qmi_tmd_cli->num_tmds; index++) {
+		tmd = &qmi_tmd_cli->tmds[index];
+
+		if (!strncasecmp(tmd->name, label,
+				 QMI_TMD_DEV_ID_LEN_MAX + 1))
+			goto found;
+	}
+
+	dev_dbg(qmi_tmd_cli->dev,
+		"TMD '%s' available in firmware but not specified in DT\n",
+		label);
+	return 0;
+
+found:
+	tmd->max_state = max_state;
+
+	/*
+	 * If the cooling device already exists then the QMI service went away and
+	 * came back. So just make sure the current cooling device state is
+	 * reflected on the remote side and then return.
+	 */
+	if (tmd->cdev)
+		return qmi_tmd_send_state_request(tmd, tmd->cur_state);
+
+	tmd->cdev = thermal_of_cooling_device_register(dev->of_node, index,
+						       label, tmd, &qmi_tmd_cooling_ops);
+	if (IS_ERR(tmd->cdev))
+		return PTR_ERR(tmd->cdev);
+
+	return 0;
+}
+
+static void qmi_tmd_unregister(struct qmi_tmd_client *qmi_tmd_cli)
+{
+	struct qmi_tmd *tmd;
+	int index;
+
+	for (index = 0; index < qmi_tmd_cli->num_tmds; index++) {
+		tmd = &qmi_tmd_cli->tmds[index];
+
+		if (!tmd->cdev)
+			continue;
+
+		thermal_cooling_device_unregister(tmd->cdev);
+		tmd->cdev = NULL;
+	}
+}
+
+static void qmi_tmd_svc_arrive(struct work_struct *work)
+{
+	struct qmi_tmd_client *qmi_tmd_cli =
+		container_of(work, struct qmi_tmd_client, svc_arrive_work);
+
+	struct tmd_get_dev_list_req req = { 0 };
+	struct tmd_get_dev_list_resp *resp __free(kfree) = NULL;
+	int ret, i;
+	struct qmi_txn txn;
+
+	resp = kzalloc_obj(*resp, GFP_KERNEL);
+	if (!resp) {
+		ret = -ENOMEM;
+		goto out;
+	}
+
+	scoped_guard(mutex, &qmi_tmd_cli->mutex) {
+		ret = qmi_txn_init(&qmi_tmd_cli->handle, &txn,
+				   tmd_get_dev_list_resp_ei, resp);
+		if (ret < 0)
+			goto out;
+
+		ret = qmi_send_request(&qmi_tmd_cli->handle, NULL, &txn,
+				       QMI_TMD_GET_DEV_LIST_REQ,
+				TMD_GET_DEV_LIST_REQ_MAX_LEN,
+				tmd_get_dev_list_req_ei, &req);
+		if (ret < 0) {
+			qmi_txn_cancel(&txn);
+			goto out;
+		}
+
+		ret = qmi_txn_wait(&txn, QMI_TMD_RESP_TIMEOUT);
+		if (ret < 0)
+			goto out;
+
+		if (resp->resp.result != QMI_RESULT_SUCCESS_V01) {
+			ret = -EPROTO;
+			goto out;
+		}
+
+		qmi_tmd_cli->connection_active = true;
+	}
+
+	for (i = 0; i < resp->mitigation_device_list_len; i++) {
+		struct tmd_dev_list *device =
+			&resp->mitigation_device_list[i];
+
+		ret = qmi_tmd_register(qmi_tmd_cli,
+				       device->mitigation_dev_id.mitigation_dev_id,
+				       device->max_mitigation_level);
+		if (ret)
+			break;
+	}
+
+out:
+	if (ret)
+		dev_err(qmi_tmd_cli->dev, "Failed to initialize TMD service: %d\n", ret);
+}
+
+static void qmi_tmd_del_server(struct qmi_handle *qmi, struct qmi_service *service)
+{
+	struct qmi_tmd_client *qmi_tmd_cli =
+		container_of(qmi, struct qmi_tmd_client, handle);
+
+	kernel_sock_shutdown(qmi->sock, SHUT_RDWR);
+
+	scoped_guard(mutex, &qmi_tmd_cli->mutex)
+		qmi_tmd_cli->connection_active = false;
+}
+
+static int qmi_tmd_new_server(struct qmi_handle *qmi, struct qmi_service *service)
+{
+	struct sockaddr_qrtr sq = { AF_QIPCRTR, service->node, service->port };
+	struct qmi_tmd_client *qmi_tmd_cli;
+	int ret;
+
+	qmi_tmd_cli = container_of(qmi, struct qmi_tmd_client, handle);
+
+	scoped_guard(mutex, &qmi_tmd_cli->mutex) {
+		ret = kernel_connect(qmi->sock, (struct sockaddr_unsized *)&sq,
+				     sizeof(sq), 0);
+	}
+
+	if (ret < 0) {
+		dev_err(qmi_tmd_cli->dev, "QMI connect failed for node %u port %u: %d\n",
+			service->node, service->port, ret);
+		return ret;
+	}
+
+	queue_work(system_highpri_wq, &qmi_tmd_cli->svc_arrive_work);
+
+	return 0;
+}
+
+static const struct qmi_ops qmi_tmd_ops = {
+	.new_server = qmi_tmd_new_server,
+	.del_server = qmi_tmd_del_server,
+};
+
+static int qmi_tmd_get_instance_id(const char *remoteproc_name)
+{
+	if (!strcmp(remoteproc_name, "modem"))
+		return QMI_TMD_INSTANCE_MODEM;
+
+	if (!strcmp(remoteproc_name, "cdsp"))
+		return QMI_TMD_INSTANCE_CDSP;
+
+	if (!strcmp(remoteproc_name, "cdsp1"))
+		return QMI_TMD_INSTANCE_CDSP1;
+
+	return -ENODEV;
+}
+
+/**
+ * qmi_tmd_init() - Initialize QMI TMD instance
+ * @dev: Device pointer
+ * @remoteproc_name: Remoteproc name (for example modem, cdsp)
+ * @tmd_names: Array of TMD names
+ * @num_tmds: Number of TMD names
+ *
+ * Return: Pointer to qmi_tmd_client on success, ERR_PTR on failure
+ */
+struct qmi_tmd_client *qmi_tmd_init(struct device *dev,
+				    const char *remoteproc_name,
+				    const char * const *tmd_names,
+				    int num_tmds)
+{
+	struct qmi_tmd_client *qmi_tmd_cli;
+	int ret, i, instance_id;
+
+	if (!dev || !remoteproc_name || !tmd_names || num_tmds <= 0)
+		return ERR_PTR(-EINVAL);
+
+	instance_id = qmi_tmd_get_instance_id(remoteproc_name);
+	if (instance_id < 0) {
+		dev_err(dev, "Unsupported remoteproc name '%s' for TMD lookup\n",
+			remoteproc_name);
+		return ERR_PTR(instance_id);
+	}
+
+	qmi_tmd_cli = devm_kzalloc(dev, struct_size(qmi_tmd_cli, tmds, num_tmds), GFP_KERNEL);
+	if (!qmi_tmd_cli)
+		return ERR_PTR(-ENOMEM);
+
+	qmi_tmd_cli->dev = dev;
+	qmi_tmd_cli->num_tmds = num_tmds;
+	mutex_init(&qmi_tmd_cli->mutex);
+	INIT_WORK(&qmi_tmd_cli->svc_arrive_work, qmi_tmd_svc_arrive);
+
+	/* Initialize TMD structures */
+	for (i = 0; i < num_tmds; i++) {
+		qmi_tmd_cli->tmds[i].name = tmd_names[i];
+		qmi_tmd_cli->tmds[i].qmi_tmd_cli = qmi_tmd_cli;
+	}
+
+	ret = qmi_handle_init(&qmi_tmd_cli->handle,
+			      TMD_GET_DEV_LIST_RESP_MAX_LEN,
+			      &qmi_tmd_ops, NULL);
+	if (ret < 0) {
+		dev_err(dev, "QMI handle init failed: %d\n", ret);
+		return ERR_PTR(ret);
+	}
+
+	ret = qmi_add_lookup(&qmi_tmd_cli->handle, QMI_SERVICE_ID_TMD,
+			     QMI_TMD_SERVICE_VERS_V01, instance_id);
+	if (ret < 0) {
+		dev_err(dev, "QMI add lookup failed: %d\n", ret);
+		goto err_release_handle;
+	}
+
+	return qmi_tmd_cli;
+
+err_release_handle:
+	qmi_handle_release(&qmi_tmd_cli->handle);
+
+	return ERR_PTR(ret);
+}
+EXPORT_SYMBOL_GPL(qmi_tmd_init);
+
+/**
+ * qmi_tmd_exit() - Deinitialize QMI TMD instance
+ * @qmi_tmd_cli: QMI TMD client to deinitialize
+ */
+void qmi_tmd_exit(struct qmi_tmd_client *qmi_tmd_cli)
+{
+	if (!qmi_tmd_cli)
+		return;
+
+	cancel_work_sync(&qmi_tmd_cli->svc_arrive_work);
+	qmi_handle_release(&qmi_tmd_cli->handle);
+	qmi_tmd_unregister(qmi_tmd_cli);
+
+	scoped_guard(mutex, &qmi_tmd_cli->mutex)
+		qmi_tmd_cli->connection_active = false;
+}
+EXPORT_SYMBOL_GPL(qmi_tmd_exit);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("Qualcomm QMI Thermal Mitigation library");
diff --git a/include/linux/soc/qcom/qmi.h b/include/linux/soc/qcom/qmi.h
index b9dcb437a0be..683d27cee413 100644
--- a/include/linux/soc/qcom/qmi.h
+++ b/include/linux/soc/qcom/qmi.h
@@ -96,6 +96,7 @@ struct qmi_elem_info {
  * Enumerate the IDs of the QMI services
  */
 #define QMI_SERVICE_ID_TEST		0x0f	/*   15 */
+#define QMI_SERVICE_ID_TMD		0x18	/*   24 */
 #define QMI_SERVICE_ID_SSCTL		0x2b	/*   43 */
 #define QMI_SERVICE_ID_IPA		0x31	/*   49 */
 #define QMI_SERVICE_ID_SERVREG_LOC	0x40	/*   64 */
diff --git a/include/linux/soc/qcom/qmi_tmd.h b/include/linux/soc/qcom/qmi_tmd.h
new file mode 100644
index 000000000000..75373eb09d61
--- /dev/null
+++ b/include/linux/soc/qcom/qmi_tmd.h
@@ -0,0 +1,23 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2025, Linaro Limited
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ *
+ * QMI Thermal Mitigation Device (TMD) library header.
+ */
+
+#ifndef __QMI_TMD_H__
+#define __QMI_TMD_H__
+
+struct device;
+struct qmi_tmd_client;
+
+struct qmi_tmd_client *qmi_tmd_init(struct device *dev,
+				    const char *remoteproc_name,
+				    const char * const *tmd_names,
+				    int num_tmds);
+
+void qmi_tmd_exit(struct qmi_tmd_client *tmd_cli);
+
+#endif /* __QMI_TMD_H__ */
+

-- 
2.34.1


