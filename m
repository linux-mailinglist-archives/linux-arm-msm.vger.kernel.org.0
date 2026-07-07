Return-Path: <linux-arm-msm+bounces-117135-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id WZ3gCimWTGqcmgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117135-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 08:01:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 75404717B31
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 08:01:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=n0Apdhuh;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="e/jZzT2d";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117135-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117135-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 78DC73007AE4
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 06:01:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF085386C2C;
	Tue,  7 Jul 2026 06:01:01 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 845893242A4
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 06:01:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783404061; cv=none; b=rnq4AoANnBnFXXDpnRuGUURCW4fbuelwatNo32XdbqajRP/ydzpvCpI41FqNSoVg+kl3i26ysvwKbW/J6MHNGFnws/G32+veHsgyj69xP6YkNy4LWOlGWFlf2dgFWM5Wjv9E0rXS2S8+p6VQ2DbSnXYX+QWLnj8Olm5EFcrbNQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783404061; c=relaxed/simple;
	bh=ItwCbmWsj6AQt86CTG3cT1m8y7/7Igs+Gjo1UIAf4gg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=hpmgY80Z+jIvLQzvs66PJAx69UTPbTyyrw0YbglQVrnstyYQ+gNdX7PeGQkJp3UAWEwvFsjTI/aL13vZXhMOSZOraGPpM8PkWgq7rwv5bW6QBKH8LQVDoIdjsNGRyRx5ZLQqPXtZ2lMpge0qBlOhD4FVS7x9Jw3CCyYUAWUII+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n0Apdhuh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e/jZzT2d; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66748tNR2675481
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Jul 2026 06:00:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=JWlutRrYKOzdkHSofX/D7x
	KoU1P8XHuqfOBVq0HfqrE=; b=n0ApdhuhJ58J+Sc52tPzqnd2XnEzEGkR7hRX4f
	HXlMev4qL/KmbMWNtl2w0xwMDL8rG0JcjXN8rK8CEtPxznpZx2SKGwv74s35iXl6
	sqjZo1DcuNBkZGl1j140BjkkZh0MAbs2XNA6pgOvFNZoK83Fr4o8iBKW2Mv6c/lG
	emQDVaP70wnWCpvBqjtYzYSr74/oTg4U1V0iuFnjW0X5YG5V3RNY00dyBn7gWg1G
	6udhjRLmq1RjefYpp4l6+DITKM2LgsnBa93pFi8wGA2Y7JiDPu9hKRe0AVT1m0sk
	dFYL6qT+SqhnxfRT884H9Ic1ajkOdmo+5KVSFGM7SZNR/HxA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8qj78ur2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 06:00:59 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c892143db7fso3317940a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 23:00:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783404058; x=1784008858; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=JWlutRrYKOzdkHSofX/D7xKoU1P8XHuqfOBVq0HfqrE=;
        b=e/jZzT2dt3b6fm/5B+885dg+t5NDTb1EZA5yq/jGqeM6SIksoOg5QSIsRcaiq8NILD
         bcfABqw690AYk5G2RCx7UCbgblnVQ7wPTEJVoFmi8vmP/mJYUr01MMReyh47KtYAcT2V
         5Vwn/IM/QIm3pxqcqt5lq8ar3MCl67mSuM2/b2to+gH0QZGJKClihNcgnJUwywZqxeST
         UqOO96k2csK5VRRY6ACnSvYMj1ppdZE36OJySRCPKw8zHw3YBav1svpd4Qbo3P/9Gs/B
         3Q2JYAZloGYX++bDWCJJeCLllaPei+PDc/kLwHVWVYa1f+YGNQvaCqHI66GZlbBrqIYe
         9AlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783404058; x=1784008858;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JWlutRrYKOzdkHSofX/D7xKoU1P8XHuqfOBVq0HfqrE=;
        b=rmvDgPI5MPcVgCSvBxCZVcBXnHkN6hkj3rI6GCYc9lc1PEopM3PX5fBv0Uh3U19bez
         fTLetgzJVL6TLzRpeA+TVq5KdXW0/9tBIjq1g66UXKp4xxzSnYsbFtWzB8bh3HeSs7Wh
         4qoB+jIYGCcezvsJF10ntpPUoIH76E8EEUjqWiITV3H+Qw6afs7+ab5BEPV7o7Xi8O5B
         dj0Egdgghm7tDSxpcuWI1WOqUalE8+E7bzUFZbHVtCqnXiQkqAcbFbqDBq7jEh/5GR5Q
         XTidBhR+y+CttOyFsMxmauY6sBDlaNeXFCR+Mv5Kr+paMAvKwkdqdx32W9tKmDMHb0Yp
         KwAQ==
X-Gm-Message-State: AOJu0YxuENGT4AoLUnDrqLN2YN8bnDyyHykpw1H5m+OkClFj0anmGmKF
	8LCTpPKzxrmbhG880GBqs5OjOLJYyrLosRWDiAmp3W3X2fAWsLVbrbhEBwgwKf/2Z9qVZcl4mUT
	8lfl2IrePeh1fj25GNSPFZNMpc7LcgF2cF24LvfVF+gR05t0UQY9yW+wXiYtew75fwJchnRRp61
	f8
X-Gm-Gg: AfdE7ckkaeNgGgASx27BGdapQawhFAMsFSDBcGVFbo7B7yd4RApwMRVoCMusdJjOh6F
	EFNw7NuoXCYhFwRqu1CeJqeAQymR3a7JJu5EDAJjy+YdjMCHGo7NqGz/m0VIJyB1b/j40mTcwDP
	NHcl0vNCcHymXhoslbCYS8m1IWcFbgY8DFm6ZScgYsltm02s+a5krvLmo6pBid2OeG0ZfLN+1A2
	jy7yejkbCVY2D/LDxlTlOhUTqtDkq1HisJsscsZZ6zqsMhKIjHNaQhdVLpxqVQitPpj/4oQBRiO
	Bo32EJ7kC5CDX3ZOgmU56JA+XP/n5aSwMEeg8daYm6hRL+gHAl8aEyKINb4IP3uTlKJP1ZffvPO
	6gii3oHpPXKA+SEBp6y1yFyibclxcr6miDuQVN6EZol7+t+fsqR9JkxUstR+Utn9y+TwRaZN68R
	/6fIRSA6L3hIZOukpX+gDzgiHXZT1k3GuLYJz+e0tN
X-Received: by 2002:a05:6a20:d494:b0:3b3:4406:202c with SMTP id adf61e73a8af0-3c08ec75508mr4773014637.10.1783404058324;
        Mon, 06 Jul 2026 23:00:58 -0700 (PDT)
X-Received: by 2002:a05:6a20:d494:b0:3b3:4406:202c with SMTP id adf61e73a8af0-3c08ec75508mr4772931637.10.1783404057695;
        Mon, 06 Jul 2026 23:00:57 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174a5b26csm4105919eec.15.2026.07.06.23.00.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 23:00:57 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Subject: [PATCH 0/2] Enable mutliple peripherals in IPQ5210
Date: Tue, 07 Jul 2026 11:30:42 +0530
Message-Id: <20260707-08-dts-v1-0-fce82e14cd1d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAqWTGoC/6WSy27DIBBFf8XyumPxBkdV1f+osgA8NLTxE8dKF
 OXfS+Ius3DVBYMuwxzuaLiWCaeIqdwV13LCJabYd1nQl6L0B9t9IsQm65IRpogmCoiBZk6AhhP
 nmPaauTJfHiYM8fwAfexXPeF4yrx5PSydTQi+b9s474oOzzP8Mvm9vsWU7OO1XfH6SEgqIHoPc
 RglowQWCgSczAVNcCgUee9TqsaTPd6hVQ5vz0GKCFITyUyluWRcAYXFTrbJ68t2VZf3i+1st5l
 HJTHZkqmoYJQL/X+ggsFHhOFwgUXkNiURSmvPG830Vsp9OGMYpr6FhWVLQTY12kBZI+V2BoXWx
 qPrzytEokLnjRYocDuEgx1SAn/8hoXndoQ2Ek1tay/NX6z44RTyL1pHXxsllW0YCYE/gexvtx+
 aBzITzQIAAA==
X-Change-ID: 20260706-08-dts-e830bb27c72b
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: OtjWtaF_-7InzXmHIB7Y-lQoT7USMmJs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA1NCBTYWx0ZWRfX23LTbt/5LC8T
 8AeNFBdJ9KewpvxOLmxdaAb8A5oTmQEhDm4xRQ2fluJMs+7UG4YjtSxqDdCXc8fD6akQAwGwIcX
 ALYK7cWjXX3YYa3AjXRcYeDYPlm2cvIXHS57ctuZB5tpeD3pWpqOW2p5iNpx5XG4aVk86GDJWr9
 3P/qAoBEED8WbIVf0v8tvNa1k4fs3+8kBxByhiifUDhzemCeyd+DVYkJxkxTO+/RELPjsf2Dbbd
 GDV5j/P/E14hqXhi0TeGnTDYwI+6/FUVM46DIuBU6FxeRCXBDDBHPGLJRHisDRaa//b+GdaO+aF
 fw69kJJZYW00PQDKltRmkUlTW+7WNTuRota5VqUgW5ruHzcHiyYUFMciGAsa9uO30z9NWn93lFV
 /u/CoRwso/SIgB+ZUkE6LLYUHwkll8i9pIhZkuPHaCtgLSq8pqCTYxN+35DFbvw90QY01nYXSve
 OGejPG3xR9iLsZ9pO1A==
X-Authority-Analysis: v=2.4 cv=PIM/P/qC c=1 sm=1 tr=0 ts=6a4c961b cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=v1hZQnKUEnapy_KJ6JEA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA1NCBTYWx0ZWRfX+bZqoYJcORVN
 byThk3E4sd+NDtAL4gMCT837s4+JDf1qxiOY9F0pJ38SNCdOM+JaEENNbFGIhsreLgUSNdYuOsN
 CaNtKwH/bYWLPHBlaOjKKKwhIghj55I=
X-Proofpoint-GUID: OtjWtaF_-7InzXmHIB7Y-lQoT7USMmJs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070054
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-117135-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[varadarajan.narayanan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:varadarajan.narayanan@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[varadarajan.narayanan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 75404717B31

This couple of patches enable mutliple peripherals like USB, PCIe etc.
Additionally, it enables CPUfreq and thermal tripping points.

Please refer to [1] for initial review comments on the PCIe related DT
changes.

1 - https://lore.kernel.org/linux-arm-msm/20260514-pci-ipq5210-v1-0-a09436200b35@oss.qualcomm.com/

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
Varadarajan Narayanan (2):
      arm64: dts: qcom: ipq5210: Add nodes for multiple peripherals
      arm64: dts: qcom: ipq5210: Enable USB and PCIe on RDP504

 arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts | 131 ++++++
 arch/arm64/boot/dts/qcom/ipq5210.dtsi       | 616 +++++++++++++++++++++++++++-
 2 files changed, 741 insertions(+), 6 deletions(-)
---
base-commit: b96de4afaea292f70aec05d40def1d993c04d71c
change-id: 20260706-08-dts-e830bb27c72b
prerequisite-message-id: <20260514-icc-ipq5210-v1-0-b5070dfbe460@oss.qualcomm.com>
prerequisite-patch-id: 0b6145b6635b18fe79fbbff5815041b43778c5ed
prerequisite-patch-id: 924c6ff7baf4283ac7991ee94c803a00fc5cece4
prerequisite-patch-id: c2fe1800fe769dccd37f94c19860a07f979e3c4c
prerequisite-message-id: <20260604090528.735236-1-varadarajan.narayanan@oss.qualcomm.com>
prerequisite-patch-id: 5aca3ddeccbd470bbfd0c6a54358338fb8cb8336
prerequisite-message-id: <20260615085218.1421347-1-varadarajan.narayanan@oss.qualcomm.com>
prerequisite-patch-id: 66aa95814074faffb61393faa30396c42af41126
prerequisite-patch-id: 0a03dc1c91a2f0c03af823aa43f59a9005eb8607
prerequisite-message-id: <20260616-pcie-phy-v4-0-504677c3d727@oss.qualcomm.com>
prerequisite-patch-id: 7c93e925f6b3932bb699a66180b49336225dd999
prerequisite-patch-id: 5d3ab24adced9ec6e5a0d302b021e9d36d353975
prerequisite-message-id: <20260706-qfprom-v2-1-f5d9eaf12d55@oss.qualcomm.com>
prerequisite-patch-id: 9159005897e044423b7b72b695c3e31907f8d381
prerequisite-message-id: <20260701-mailbox-v2-1-5e6ebc874e4e@oss.qualcomm.com>
prerequisite-patch-id: 956b405a71f384354b5c35a44b97a0a2dcf65eb3
prerequisite-message-id: <20260703-apss-clk-v3-0-4785e89a9c58@oss.qualcomm.com>
prerequisite-patch-id: d9efdd8a09b028b1343243c5f0e78cf3e8b1e253
prerequisite-patch-id: 36cf721e00f3f5bbc3ccdc0d39503c5899771085
prerequisite-message-id: <20260701-cpufreq-v1-0-98656ad20ff3@oss.qualcomm.com>
prerequisite-patch-id: 35e083bb85434a34d86467e53b9eae14f78da125
prerequisite-patch-id: eb94fa7598d7d17822e0acf534c3a960f30c14c9

Best regards,
-- 
Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>


