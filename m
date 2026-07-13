Return-Path: <linux-arm-msm+bounces-118677-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NPNiOoaiVGo8ogMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118677-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 10:32:06 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 00253748B8A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 10:32:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=LmvaZee4;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=NKcBvTB4;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118677-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118677-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 28D7E302AA43
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 08:17:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 591873A7F69;
	Mon, 13 Jul 2026 08:17:15 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1F253A7F75
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 08:17:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783930635; cv=none; b=GwaVldmhxmIfMEE0W8uPre1zaKmhF1fj/CCHWP5g5A8JIfNUC3sIYlFMysSs07wRxH20r2aqkz9x5DANDIqQx4NsUWNY0/HGThzRNRhjr517n0rP0sJTCqZNmzm/q1WZP/QiBZEYRXHmofHdsCEA5+Thbb18DOpP/gIWswGhmzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783930635; c=relaxed/simple;
	bh=EkS2NxhaF1JLdwk74M/0qpNfkeKcSxyAcb6Dva9JVqI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=fW5DwRxqvZ1RuZYSBSk0KT0A3nbdn0WSrRXvLjp+SrVH3cAh4WAattHik1LOzemYXRT9gE3Bel/VRncRwhR3YFdh7yX+dy+ZIJf8AwU/1cbF/91zN9Mj/1resG7qDuxKcOb5OfTpprjaUaOCMm5UnQsF9gch6528+S1DlPb8m1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LmvaZee4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NKcBvTB4; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D6Nuqx568062
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 08:17:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=GKCYIswJ1jHXrqBY3IaNQU
	AcZZL3eg2SpL6mGB+kCpI=; b=LmvaZee40QRGf58z47ZC0R9tbQGPDaYQnSblAZ
	5u7QQrbbhUn+uEFTaM6udvuWhathjdhYoiSwJQtgUFBdqV7lyjRRRmArEnmkKty5
	hSDrJ0nodL2or0C2DLjuemovqjyzF06DMFN2vJdd+3hPHue7Uz0jpfYUq9ZMNO6l
	UiVRYKT1NeHU42mTCnFSdK1LfsfwFeGVgSxpUwbyKmqOcHye0bZAGgkYVKApUyWC
	oGR3Av1Sxkk8zD2NwEa2W1ESGgEvWOVV5jkJnaTcPl3RMp3eZp4+89Df4hG0Cv82
	1dvVe2ReUOJ4Pg+8nO9XegNWrMg3o3vT4DWeiOUHcrnwcRsQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbe91555f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 08:17:11 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c89704da8c7so4549526a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 01:17:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783930631; x=1784535431; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=GKCYIswJ1jHXrqBY3IaNQUAcZZL3eg2SpL6mGB+kCpI=;
        b=NKcBvTB4hjbvUD3plHLC/84UlMPrTivg00tgV8nyc3RO9AWLn5FUxDTX1qH9ZXeI5Y
         Fo6Sm1N0a2kCRBG9ZR3kip/dBT3cZS279Ebd/WPH/qZLUv6EyTJ08dCps33YvRbofAfz
         fbV7pxbR7DMaKj009t6FN8EV+WVWPD0xFgXIK+fT20JniNYLconC59h6zpUKRA8qiJ4S
         LRSaiahVgOHi1tdX/EEtFW/u2iwsoQ524xAQ/kLLIoU6JQ2TQDP7Xm6LVSKy1H0L0k0u
         U6JVtrqeL8b31l60BJtXV9dR4EL7qvG/wmS50I2wrWhxrt8mgu/laNozJSv0+NACKaSJ
         o8RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783930631; x=1784535431;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=GKCYIswJ1jHXrqBY3IaNQUAcZZL3eg2SpL6mGB+kCpI=;
        b=qegZTGHX9zxMk3vZNmdPRy14RM6eY/5p1TTBQEYmS7tSPiCpn1s0C9nkTl19S+DpI8
         pM1HVZp2Q1MKTMh3QXtb6T+vlPUAdgzbOzcFYPaKCe5QoDVw1XmjXg/xzeC8XQDY1xOR
         AnP3NyQmecw0NJl/StMdEnehVdwPCtEjR3aB4bfhWzR97nm1cOZpz2JMY11F+fyyJV5l
         4XS2Lq1x075YV/IaH7uNSY1yjl6h6KyDtK1NC4lu7fYxntdlMCmOytOQB6+qAsd+ltwN
         pCoAe8gMGz+BHwEUcl12qPu2i+NSQtF3HMsFUKPh6Zq/ubXsYekP1/PEt8q1V6QzSNwh
         APYA==
X-Gm-Message-State: AOJu0YySYGMaJcnyNC0g5+atMohy2IcTPB+Bz4pMriFOzuBmcls9UfuT
	VmmNuNN1ob2Uz2ezvgA4wzczwkVR+qzt+apFUtxc9uyjPeyZNTU5dTna4CIwjTqOOH+fv382SwB
	C5Wvh0PZAVMDNFn/CwZL6zy/XrlsKzuJcdZeDlvTrUzYJl/dN08VP2q983ZHCi64zgEOg
X-Gm-Gg: AfdE7ck1VuddNZbuQlgnM2CUmhBG4XR/qmNAUlMJHNXMItfplsfZFWVcjC2hv7D3960
	dG1QtHw3Dzvgrbz5p1gLfWzFgKy/E7r+1ih2epAkC+CowrQk4GbUZugyBGfclfRl9GVf8hQtw61
	ugdEOFrnWpMNhXIyijJ5NRdCbLDm/QoMk742BYh/cwqu5kZRMnDv8nLCbLGSb5oPGdBHUkFelO/
	S7xOJQwvjEywbPQ35pWAo9XHJZlad0eo1qyZLXjTN1Og9P51+msVGD+FPpwo2XPnXXqZ8lyEKeO
	DIp8uwdYv/QXBwyaz40BUbq+mJ2IvfWWkCgMZDVdiGpGproBYc4THRIsSiDn4LDao7XLeLfPq6f
	IFiUpEk0juy7DLEy0ZZYekULLmCoWOHNJCL27d3Mh
X-Received: by 2002:a05:6a20:939a:b0:3bf:9fe1:c27 with SMTP id adf61e73a8af0-3c110b4566dmr8834347637.40.1783930630624;
        Mon, 13 Jul 2026 01:17:10 -0700 (PDT)
X-Received: by 2002:a05:6a20:939a:b0:3bf:9fe1:c27 with SMTP id adf61e73a8af0-3c110b4566dmr8834315637.40.1783930630186;
        Mon, 13 Jul 2026 01:17:10 -0700 (PDT)
Received: from hu-smankad-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca79aff904dsm6283954a12.6.2026.07.13.01.17.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 01:17:09 -0700 (PDT)
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Subject: [PATCH v3 0/3] Add subsystem LPM stats support for Shikra
Date: Mon, 13 Jul 2026 13:46:53 +0530
Message-Id: <20260713-shikra_stats-v3-0-4be17121729d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPWeVGoC/23MTQrCMBCG4auUrE3JT63FlfcQkTSdsUHbaKYGp
 fTupnWj4mbgHfiekREEB8S22cgCREfO9yn0KmO2Nf0JuGtSMyVUKUpVcGrdOZgjDWYgrlFIlLr
 EurAsTa4B0D0Wbn9I3ToafHguepTz9w1thP6GouSCC2MEWImm0rDzRPntbi7Wd12eDpu9qD6N6
 sdQyaihXitUBUps/hjTNL0AuO1kcfMAAAA=
X-Change-ID: 20260624-shikra_stats-3f01f136fb4c
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maulik Shah <quic_mkshah@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783930626; l=2924;
 i=sneh.mankad@oss.qualcomm.com; s=20250818; h=from:subject:message-id;
 bh=EkS2NxhaF1JLdwk74M/0qpNfkeKcSxyAcb6Dva9JVqI=;
 b=4ZCjN/N83A+u3npQyJdTtNl/C14XjtDFuMlH4SdU9cI+wFC4qMKdm+sMEiMR30VbodD75i9yp
 JFcfPuBfdpFBcW45qIiiqFlDx7YNeMU8HCR3Ka0ly0jhogJ8AbOnRtJ
X-Developer-Key: i=sneh.mankad@oss.qualcomm.com; a=ed25519;
 pk=sv57EGwdcfnp6xJmoBCIT1JFSqWI+gawRHkJWj/T2B0=
X-Authority-Analysis: v=2.4 cv=TbymcxQh c=1 sm=1 tr=0 ts=6a549f07 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=feAlyiVJtFiAF33yB5kA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA4NSBTYWx0ZWRfX2vW9QKWhNWGE
 VSGY7rBW/o/+cpggduwU6dLybm28PguFz60LsSeGnada8YaJ4B24g0BUTLKFAY1InNO+OnAloQq
 /nMriueD1TebYNgsKfqAx7YRIdgRYCM=
X-Proofpoint-GUID: s0MT1Xcu_b6U3tD8XF3CbgiyLer0AAfn
X-Proofpoint-ORIG-GUID: s0MT1Xcu_b6U3tD8XF3CbgiyLer0AAfn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA4NSBTYWx0ZWRfX7KeVejqqUbIN
 xujnejOF6+TM5uVQrt3WyblD93dlx7WjC3T6WbqMTCirqxP0tUNFis3wQKiceWYApmQUK3mtw/g
 l26lxP7NAP8E6fj9wvufsOi66ZFBqmaYyYquo0vI4/goNGlKiB9YZtQV/exLlk1721QX1sVV1MF
 qIb+ZSoF1EV3SsIt4Se4IyefflIXAuAiP5uVcQWlTTXF9Pkfe8tjzZidMPEjsbf6+nQNY7ajcuR
 Q6kLzZjIZJZ45Z/DmYPVuy1SPB/XlwG72/kBHbPnvUx5zSSiqcFMXbyKEZB2niZ94JOthDyQAui
 taV8DrU53Zfd74U0iM1zanMkgpRMGCbMbvxWdAjRuirHqr1HqXdY3n3YRti8wFvZC76r/iCZBvC
 tDfuyKSy1dG3jin5NzbwDGcKeIfl+DiItZsV1pvxYR4ovji1JYzceE+ke0PuiNdReDTPF8Qk/ML
 MmLcSkToKO3d5UfFGVw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 adultscore=0 lowpriorityscore=0 phishscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130085
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118677-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_mkshah@quicinc.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:sneh.mankad@oss.qualcomm.com,m:maulik.shah@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[sneh.mankad@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sneh.mankad@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 00253748B8A

SoC LPM stats are present in RPM MSGRAM and subsystem LPM stats are
present in SMEM for Shikra.

For earlier targets using RPM processor like msm8974, rpm_master_stat.c
was used for subsystem LPM stats since those stats were populated in
RPM MSGRAM.

Here is a brief summary of previous targets and their stats configuration,
along with the drivers used to display them.

+---------------|----------------------------|---------------------------+
| SoC           | subsystem LPM stats        | SoC LPM stats             |
|---------------|----------------------------|---------------------------|
| msm8974,      | RPM processor MSGRAM       | RPM processor MSGRAM      |
| msm8226       | (rpm_master_stat.c)        | (qcom_stats.c)            |
|---------------|----------------------------|---------------------------|
| sm6350,       | SMEM (DDR)                 | AOP processor MSGRAM      |
| sdm845, etc.  | (qcom_stats.c)             | (qcom_stats.c)            |
|---------------|----------------------------|---------------------------|
| Shikra        | SMEM (DDR)                 | RPM processor MSGRAM      |
|               | (qcom_stats.c)             | (qcom_stats.c)            |
+---------------|----------------------------|---------------------------+

qcom_stats.c supports both the configurations for shikra, reading subsystem
LPM stats from SMEM and reading SoC LPM stats from RPM MSGRAM.

A generic "qcom,rpm-stats" compatible only reads SoC LPM stats like vmin
and vlow. Add shikra rpm compatible and config to read subsystem LPM
stats too along with SoC LPM stats.

Below is an example showing LPM stats for "apss" subsystem with this
change:

cat /sys/kernel/debug/qcom_stats/apss
Count: 2192
Last Entered At: 5498618336
Last Exited At: 5498708046
Accumulated Duration: 2046572620.

Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
---
Changes in v3:
- added back "qcom,rpm-stats" as a fallback compatible.
- Link to v2: https://lore.kernel.org/r/20260708-shikra_stats-v2-0-beb52f24f1fd@oss.qualcomm.com

Changes in v2:
- Edited commit texts to better explain the changes.
- Link to v1: https://lore.kernel.org/r/20260703-shikra_stats-v1-0-0aa0ec1fa83e@oss.qualcomm.com

---
Sneh Mankad (3):
      dt-bindings: soc: qcom: stats: Add compatible for Shikra
      soc: qcom: stats: Add stats compatible and config for Shikra
      arm64: dts: qcom: shikra: Update rpm-stats compatible to SoC specific

 Documentation/devicetree/bindings/soc/qcom/qcom-stats.yaml | 1 +
 arch/arm64/boot/dts/qcom/shikra.dtsi                       | 2 +-
 drivers/soc/qcom/qcom_stats.c                              | 9 +++++++++
 3 files changed, 11 insertions(+), 1 deletion(-)
---
base-commit: 4c9d9db1697a873f78d236b4ce304272206238ac
change-id: 20260624-shikra_stats-3f01f136fb4c

Best regards,
-- 
Sneh Mankad <sneh.mankad@oss.qualcomm.com>


