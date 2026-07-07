Return-Path: <linux-arm-msm+bounces-117365-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bSkiO8grTWppwAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117365-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 18:39:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C9BF71DEDC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 18:39:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=mH+ttPrF;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=WMlyX23Q;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117365-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117365-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AFF043017503
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 16:37:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAFB03E8688;
	Tue,  7 Jul 2026 16:37:16 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 194423EB81E
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 16:37:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783442236; cv=none; b=hjR5j3zlnJsaAvB2QV206gTVjk6qRhQi9Y5ffrYZ68LRfFEAZlw7+HHNByTRqTqddbnu57TMkapPL0EYhpoZNccrdqZiVnOcoJ5LDuhpHVV+fvY2bsp8C5oK2MmoOgETtlX8KlwN2ifVvHpC3A8m8p3r9CH1jHRsH1cxN4EdERU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783442236; c=relaxed/simple;
	bh=Y+viPl6Si0nBgnbOpQgrpLEtz8pnhh8SMDQYSSO3ZQM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Pn/KxU5w950o+hNVokjcsWzHcGXXueG8MrKMu3NMKLpF24ESAAtB2GTYBMIYFQ2On6a6YsWgnfYJSJ9nBE08kABgwnXoOAobMzJmyCUpGExFv7DVYo2aO/MVDZteoXlRxOoMHVqqCxHdmjyFni8fKO5QKXzYq9WmvV/2sUzfgPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mH+ttPrF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WMlyX23Q; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667FT94x4194000
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Jul 2026 16:37:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=e8uxuDprRAd07UajXGAdVmKyLIRz9/hqxAH
	QmoOCFqA=; b=mH+ttPrFSbeiO8sjzgUDoCK7n90Kybp6vwt+50wCGvZORH7W+XC
	MDg6RPhpAN5ImnG3JjgADzpULVEafJNZNwBtA7NPJynIT1g+DcawqxuSIS2CcRHz
	Z4eHPNfzzgk4gMrub6kTx+uOxsZ5VyM8wNA4V7QtY+BAqrJGkNR5huEBxqehTbRP
	v2+VJchrXm/tyvf+T4jJvKVsm6UyyD80d+wvJWWo+U5cvLCgxGAMvExLA3ih5isn
	ETcpQrA+fpgLvraRJmscB3tHge+kyybw2JhrbKQ2Xd1gZwk5fC/tkIxhGZJqKnT3
	e/rAoosoIAKdiXHLWHgO1VsmwhI1L0sPCeA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8v9aagxr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 16:37:13 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5174a23afcbso45238191cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 09:37:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783442233; x=1784047033; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=e8uxuDprRAd07UajXGAdVmKyLIRz9/hqxAHQmoOCFqA=;
        b=WMlyX23Q8kASMra8uV2+Kx/JcIhDV+fGmvUTib4zjKEjYmHwXstkSJ60xMYD2ow3u9
         6iFjUEhh3m74mJBC1Kn+4o2G7OuwKnrhnOr2nUFP7mv2/ywsaMI3HO2Kg53xyS9lZMXp
         PJBnUGTNWtwHo+BKbRvbGVydsDtsk1NCnVog/cWTqtxaNAONoj7GeeE8gbc/4XysxCpp
         VB8j6eo/TU8rLjItF/9MD8/HYDz4wmoPYptqXCAspnvvjXkAnsChgbT/OC7uVPMzK7pf
         E94vv9QiV8+H+VGALDZr/9SpN8i7SD/5MVdwfTCHcueXshG2idWn1gG8nAIPUpnSssGZ
         9i5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783442233; x=1784047033;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e8uxuDprRAd07UajXGAdVmKyLIRz9/hqxAHQmoOCFqA=;
        b=eD2Ctdbof4DCFvBK/yYmLjr8/XobtCDruasexlTeLbcunA26E0mpWAfBfmERQHlVbI
         ELNHreM0FYm2RyP6cnlvD9K1P9a0FUNLsppS8+bMSTm9JiTu0y/2oI4XEnA3NP+cFuYt
         jygzTLNIUgb2KUAiY8mX61+sJB6UlRzvSe9isR0242IEC2ZoewLA2MQPLsmuO+qdNLkp
         ygiWmSQ5tFJe1c2FqkIfAi0y3JP1+p+X/WpZ5He5R4KBsJt8RLz4Y15J22udbvIeBphw
         dUzgehYqYdRCrG9A4BebncMFkgfBqusiwsSORD6gbSu6R1usX9BxhiuV7X4J4usjALgO
         B5Kg==
X-Forwarded-Encrypted: i=1; AHgh+RotLhnbiqm5YSoFWjjH10z1lZIfmmTJLKFpbvSvyq/IYpO8lDFwHn3ZWDdNANOQxICpwPGIJ+ci1gQhoXwo@vger.kernel.org
X-Gm-Message-State: AOJu0YyaCfnexO75ehzhVrXcTip2R7EmE/dc+/tZPlGu56pPRnGTiJKd
	uhNwWacnBJ2F1s/unyBMiDyXNAaIA7x05ADHesnYQf+Jv6AJKZWEG2YCvILT5pC0vfj1ca2tQJj
	7UWcpEYNg0pFk6fg7aCemSy30Zqised/h+loMiuzIY6LUzDx1uiUfS9FC6UDOgqQUKYgg
X-Gm-Gg: AfdE7clzNwOZh1Q9b3IcLhCM+oAT3OExWoomwfr2iCEfP/RiCcWXlki2bLXJMcyfAZg
	J6T9zrFUNvU2kkYR8YhnA8gEA0Q4ELLuaNMVroUqieLEKK3B0lgZ0A/IxTeMLPkJxm85A0yrqGt
	hnjf2cuhZPA3jbhesTPBGwdXoDPhsq3yCrwo7OvgT9khB45uFnIWwmspz9cJKGoQRomljj7JOmn
	K4crOG/zE47qbCg3kxdABtx8x85NxXEAYC8mpe+2NDBqrIu7JrRUDgKKW/2+yYsF6IT1d/xoNeK
	h8fMXZKg6Baf0A0AXWPnkjWeYVuDAbE8Es/AA8F+2Bg5Ic9cMUhbQv7qbwYX1V+/RpH4i3Y7WJ6
	axnslN4kQoOrcOHmRciwnTo23
X-Received: by 2002:ac8:6f17:0:b0:51c:84cb:b9b0 with SMTP id d75a77b69052e-51c84cbbdccmr12008411cf.81.1783442233157;
        Tue, 07 Jul 2026 09:37:13 -0700 (PDT)
X-Received: by 2002:ac8:6f17:0:b0:51c:84cb:b9b0 with SMTP id d75a77b69052e-51c84cbbdccmr12007971cf.81.1783442232597;
        Tue, 07 Jul 2026 09:37:12 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0f2186bsm34627699f8f.36.2026.07.07.09.37.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 09:37:11 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, loic.poulain@oss.qualcomm.com,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 0/3] arm64: dts: qcom: monaco-arduino-monza: Enable JHAT 40-pin HAT accessories
Date: Tue,  7 Jul 2026 17:37:00 +0100
Message-ID: <20260707163703.233405-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: IFq_l-ejEzD_CMWPDsnyoA7QIo_lh5gl
X-Proofpoint-ORIG-GUID: IFq_l-ejEzD_CMWPDsnyoA7QIo_lh5gl
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDE2MiBTYWx0ZWRfX5I1ILV3Sqr8x
 oeBRbnLmR14IeEvrdhEomTakjyAygk3+w6w/DF0C8BQMQ4B+QNedGL6DBCHpeoSzXTM2fvwpRL5
 NQevLMJOSrEBtw1YkCovBMfOaB0e9Do=
X-Authority-Analysis: v=2.4 cv=b9yCJNGx c=1 sm=1 tr=0 ts=6a4d2b39 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=3ufCqafKAAAA:8
 a=V4Th9uXqAAAA:8 a=NEAV23lmAAAA:8 a=J024qM1I-9LGbKqWfVkA:9
 a=kacYvNCVWA4VmyqE58fU:22 a=aIhU7PV4tMzn2raNFj2v:22 a=NPz-sUGDo_RSEfLfxCKS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDE2MiBTYWx0ZWRfXzi6L9cDMOJXj
 Aa4XaTZ1/DlwtkBcyAqWc2N8vveW346DIdyNNAgU1lkoQKvzqMkzEZ7q6oK6JZtb94UsyuXNwPv
 AvmNgnMy6YdNoMMVz2GRxkixIQqhJrqdGBbgphszhGyVCofAO1DMG1BrGDCvR2ZWmN3uETLErBr
 OD1OhZ/O06oAf2/UQwNdQ38ui+clJpaZyvVmgdMnLtg5PVTNC4Axth5oRIFizIyDUyFgJh1L2om
 +tEcIeKYvTkYfiyBK44dXDs4EyiWISfK6z1A4Njt/lrRRt4pCRummQu8hBwJ6LV9jSi6yCOiYjb
 3zigC+ie7rCtCt3QOBoR5AsmMVkVPS3WEtcBJEqIjyB1CIIs/hCSKtzKJMeZXq2M6htNQhLQgqS
 DKA6OHGNqD0YAc0PcKLOHEBHTKW4IqdSwpuB0LyCcIoA2PYrc2ouRVCLpKNZ2OenjK8GhLcd/i7
 sq6NamLHBHl1zHeQwXA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_04,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070162
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-117365-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:loic.poulain@oss.qualcomm.com,m:srinivas.kandagatla@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ALIAS_RESOLVED(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,pimoroni.com:url,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9C9BF71DEDC

The Arduino VENTUNO Q board exposes a 40-pin JHAT connector that is
pin-compatible with the Raspberry Pi HAT specification. This series
enables the I2C0 and SPI3 interfaces on that connector and provides
a DT overlay for the first supported accessory.

Patch 1 enables I2C0 and SPI3 on the JHAT connector and adds the
corresponding aliases, allowing HATs that rely on those buses to be
used. This covers accessories such as the Pimoroni Automation HAT
[1] which uses I2C for its on-board ADS1015 ADC and SN3218 LED driver.

Patch 2 adds a label to the sound node so that audio-related DT
overlays can extend it.

Patch 3 adds a DT overlay for the Waveshare WM8960 Audio HAT [2].
The overlay enables the WM8960 codec on I2C0, defines the LPI I2S1
pinctrl state for the JHAT I2S pins, and wires up playback and
capture DAI links to the Q6APM audio subsystem.

Audioreach tplg changes are at [3]

[1] https://shop.pimoroni.com/products/automation-hat?variant=30712316554
[2] https://www.waveshare.com/wiki/WM8960_Audio_HAT
[3] https://github.com/linux-msm/audioreach-topology/pull/67

Srinivas Kandagatla (3):
  arm64: dts: qcom: monaco-arduino-monza: Enable I2C0 and SPI3 for
    40-pin JHAT connector
  arm64: dts: qcom: monaco-arduino-monza: Add label to sound node
  arm64: dts: qcom: monaco-arduino-monza: Add overlay for Waveshare
    WM8960 Audio HAT

 arch/arm64/boot/dts/qcom/Makefile             |   4 +
 ...uino-monza-waveshare-wm8960-audio-hat.dtso | 100 ++++++++++++++++++
 .../boot/dts/qcom/monaco-arduino-monza.dts    |  14 ++-
 3 files changed, 117 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/qcom/monaco-arduino-monza-waveshare-wm8960-audio-hat.dtso

-- 
2.53.0


