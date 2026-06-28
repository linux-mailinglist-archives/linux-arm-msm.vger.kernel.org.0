Return-Path: <linux-arm-msm+bounces-114782-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id AuHMCEszQWoimQkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114782-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jun 2026 16:44:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 130266D4274
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jun 2026 16:44:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=MX1iarhT;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=gqkX5Oi+;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114782-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114782-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1BAB8302FC9A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jun 2026 14:39:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B78D43AEF3F;
	Sun, 28 Jun 2026 14:39:25 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 725E03AE6FA
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jun 2026 14:39:23 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782657565; cv=none; b=HBepOku2ShHDm7rhYCq+yAycF5Vp8ZsYZY8vv9rcEBBczojEosnrBIrcXWOQXuA7SmdzO+vsycC0pceBCLaJTJ3Ca6vw9DLY+4Gr2TokXBw4Yn2Cya/Md0q7m99EaOOx6WAohk7qV3PnHASuivr1220mrkRf1zQZsux+ckN1JoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782657565; c=relaxed/simple;
	bh=zHmVfAe/QoH8dkGO6upLce+VppcVYE6rNiyRQs5qJps=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ecqseQuFx+o26so7ZTp/4FM/Bp0CpVyY1HDLuw/mlwvac7pIwEZV1Em/MBfm6/DRL87VP4s1KCI2whOc+z4SPfmo2Q7JBkcwd4Lvh8hKvlEzowZ1C3DDKpyS6dVmciGMzEGrmbvWE91tytJ5Wmuj5UlPNcLCxucfzEPvhhRkjUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MX1iarhT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gqkX5Oi+; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65SESiea041557
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jun 2026 14:39:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NvhMyXPSYkmseMSSaOmMTZ9HIIIjCgryT8Ls0hmxH2M=; b=MX1iarhTlrtB9MdI
	Q+jgzuHcIO4t6PrxQDdkn6Qkz7q1v/3l03v8oHzNQxF6g2JStBo/Md64eXB2Kgik
	1tFnTtlfKPt67e43Eo6jxGh1/xHmqpd9INCtoIBzVsBaiiZ1e+ppH0y/eoJuAt9M
	f6jEOSEUQZ24HPGuXzC0aOVh95aAzmBbFdetyrZELMxzcbOox+NcLdqZVWnbkYw1
	WI23MHrEB236/6qwbm9yS/AJH2AWKnSsj9s/yCVdU1atwKzPzRKvIpJyiYq6wmTK
	KRHISulwLS3jA0Pt4OLdCtWMa73fhvaqhZMr0wGMJUSWd2dcVENlPCUZm4awfSiM
	j+owxA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f270831gj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jun 2026 14:39:22 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30e773699d6so1113451eec.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jun 2026 07:39:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782657562; x=1783262362; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NvhMyXPSYkmseMSSaOmMTZ9HIIIjCgryT8Ls0hmxH2M=;
        b=gqkX5Oi+AvHekvef2nIfJSpG6B4S7LD8x1IqXOcLIi5apmDosZ1nP3lAMflqg+Iw6m
         sPXvGJfgxAfu29H1VVbJmRU4DGrdTTk/wXkklx7JjfpZYHzpcC72uGktZKicgcGUrmYS
         hUfyA4znwwE+HKfPofslGYenWC1VYU7EpQojlgQ9KMzaBeZB+NRW/3w/ecLwDqTnZ9R4
         VU3um5bi2DMchhy5FHaf9GyBkInNogIQNswQMz4GvzQpmYfOf91IWkO9BzSJos7U6Ha4
         erdluwmHRbwYIu0xhzSEaPlI6UG0vqPjPnQwpo49BfbJbHdeqCk2cSvN/dnfT+dbraid
         i2Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782657562; x=1783262362;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NvhMyXPSYkmseMSSaOmMTZ9HIIIjCgryT8Ls0hmxH2M=;
        b=ApwbWu1ljJEkSCwS+N1qgSKTakgKKLUXNCMK1jeZZL7QPMpHx5iBpnLaGaT033NSQ5
         Dc4Vqp8MqZNHgfkVrBMaiio9f3RryNEc9p3uYMEP9fnyG/pblQV/nIPPnodoIq10nuBW
         AjvBXOZKVlj+0DbsnHNhCs8kTVffcYfCRkkdKcI7kro2HkMoTH786jcLg0pmmXyu1HPn
         MY6hPbi1FyfYaqbP6bePBDiEmZyxZhCTyY3q7abNsUQqf55ncgOuaCFZqjxgvanTXBU2
         dnbh+2cxvPThesqeKsuTE9uEwvP3NaZycvhj67olLGm6bUSAg4ccCrt/1mgJnPL2DKts
         9z5w==
X-Gm-Message-State: AOJu0YzEylTN39HWNe7XaRObJrWYGYjw3om+0PY5Ykt0HJ2hclb0YgdJ
	ZMZyirVRDUDdGxYQxY7FRdpbOgUXxrT5u9q+D6ys3yrstKYIn/4lX/rcBlgvBjaq7qfdNnAaBN9
	t0ZUWMpKYPfJQ9Yh+ymnMrnngEy6ZKmXOuqw2co6E3OVNnWAmQmLjVdvaiIBayrs0HMx5
X-Gm-Gg: AfdE7ckcMLhizesVkXw9NvVa1qKt2WMPUkOlzaUZsU1YqelScDLlxEm3CXQ4yF2ps52
	OFgU0SAyWDRp5qcn1KbLSk+4nRzELnOcXUd4AWOJ3mw9wgEKsNG2bqcHo+4owmflTd1m+uiKuLP
	ZebFSUB0mDUGdsHiwVPfi5MedjqW9Namud3Ti/PUD8LHfSQ1WLJjH+BsycFx/MQAfbt2oMeMBBS
	Pvqsvk0+YzxyIK5nCt1iQV2kW7z5rAr69KS4vSTug/omSPqRFSEcfnJw6uT8zXUDj2Qat9HlKUu
	2Gm2FpAH3IJyFANq7AQhOhq20lnqFyYiNPD9G00fJ1SPYZQJTQs+7X6tFGFGFwX2jMiJzijkOxy
	AeTnfHnzovOsw6GYfZmMcqyLKUygEBEILQQP5pKLy1+kacbI=
X-Received: by 2002:a05:7300:a485:b0:2d8:7302:d3d with SMTP id 5a478bee46e88-30c84d5034emr11843697eec.8.1782657561535;
        Sun, 28 Jun 2026 07:39:21 -0700 (PDT)
X-Received: by 2002:a05:7300:a485:b0:2d8:7302:d3d with SMTP id 5a478bee46e88-30c84d5034emr11843671eec.8.1782657560785;
        Sun, 28 Jun 2026 07:39:20 -0700 (PDT)
Received: from hu-vdadhani-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c4ca240sm39300591eec.4.2026.06.28.07.39.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 07:39:20 -0700 (PDT)
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Date: Sun, 28 Jun 2026 20:09:05 +0530
Subject: [PATCH v1 2/3] i2c: qcom-slave: Add driver for Qualcomm I2C slave
 controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260628-i2c-qcom-slave-v1-2-8b0a5c01f9f6@oss.qualcomm.com>
References: <20260628-i2c-qcom-slave-v1-0-8b0a5c01f9f6@oss.qualcomm.com>
In-Reply-To: <20260628-i2c-qcom-slave-v1-0-8b0a5c01f9f6@oss.qualcomm.com>
To: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782657549; l=27740;
 i=viken.dadhaniya@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=zHmVfAe/QoH8dkGO6upLce+VppcVYE6rNiyRQs5qJps=;
 b=DmEdxeZDU0aWQNjv25KPUXcqNhchabtJkrtXj/rQpxQJeZCVGEX/6dYGAwfl+LrJEUw1cesBI
 jN5yyccm7N6CRKfHew2OCRysPAkV/n4M+3N5CXJ0HG4bdg2SPkzAnJS
X-Developer-Key: i=viken.dadhaniya@oss.qualcomm.com; a=ed25519;
 pk=C39f+LOIGhh/02LQpT46TsUSXRvBn9qXC8Xb26KJ44Y=
X-Authority-Analysis: v=2.4 cv=ObKoyBTY c=1 sm=1 tr=0 ts=6a41321a cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=2M-EzQDrxB51E6wGW1MA:9 a=CRhpW8p5OYahybeS:21
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI4MDEzMCBTYWx0ZWRfX02PBaFpGw3Rb
 Jy5zhXNYIN15LetZZ98OfpLP7U8XUPdt/HEdEcPN8hD9V+nc0bmH/wMzRLqThHxD/24tNRX71S6
 d7vFHLdTMb6AglBcOGJiyUP/egNhV/l4Zqn5Wg1yegtcQ52nsuzHXiv7XjssLCEHOg2fBSzHoVN
 PSx1ypeEImhnPLGIsjdhtebIOyhFTRwPPhQJdHumWfca2p2ykQjZ/6UKl3aU+fUhvDTK+wizB3N
 4fhp5Ap6GDk45ww/Cd5ulEIqVwuXYIuHcUwBx98VqhRGnCHQYVHVhc0yyK69qLV7CrBIGq4iD0l
 asKcYgz9nNjXbdNsq8/7i7pNtvADAmxhLsK5feBjhdbfLFIMuRjxkeozZcTFH7NWuj1VFhCMl6J
 QzBZZnBp+fV/TZZInD21Ax/p5cEAdgj1a1QJsRgG3D0pD3XNEYzCw/XD+J9NR2CbIHloM8+5eBs
 WYmPiAl9Lm0/ZncB9LQ==
X-Proofpoint-ORIG-GUID: SNHn-DGfSJq5jyw-vD0oITBjlvgiOJDV
X-Proofpoint-GUID: SNHn-DGfSJq5jyw-vD0oITBjlvgiOJDV
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI4MDEzMCBTYWx0ZWRfX96B9aVVfSoC2
 o1juGFxOMOvteSiA6lnbyMSBacq89IlifGJJue1Xnii4nJJNnwP+12Wam3HCiGsNeHHvOCJENWm
 ud4BjHymgGNabu7OPGkw1Opl1WX7Gaw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-28_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 clxscore=1015 bulkscore=0 malwarescore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606280130
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-114782-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[viken.dadhaniya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:mukesh.savaliya@oss.qualcomm.com,m:andi.shyti@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-i2c@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:viken.dadhaniya@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[viken.dadhaniya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 130266D4274

Add support for the dedicated Qualcomm I2C slave controller found on
QDU1000 and related SoCs. This IP block operates only in slave mode and is
separate from the existing Qualcomm I2C master controllers, so those
drivers cannot support systems that need the SoC to respond as an I2C or
SMBus target.

Register the controller as an SMBus adapter and support byte, byte-data,
word-data and block-data transfers through the standard /dev/i2c-X
interface. Handle the controller IRQ events for RX and TX FIFO service,
STOP and repeated-start conditions, clock stretching, and error recovery.
Enable the required AHB and XO clocks, vote for interconnect bandwidth, and
restore the hardware state across suspend and resume.

Read the initial slave address from the qcom,slave-addr device tree
property. The controller node already uses reg for its MMIO resource, and
the slave address is programmable, including through the SMBus ioctl
interface.

Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
---
 drivers/i2c/busses/Kconfig          |  14 +
 drivers/i2c/busses/Makefile         |   1 +
 drivers/i2c/busses/i2c-qcom-slave.c | 777 ++++++++++++++++++++++++++++++++++++
 3 files changed, 792 insertions(+)

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index d7b89508311f..fd7f9c3a67c3 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -1070,6 +1070,20 @@ config I2C_QCOM_GENI
 	  This driver can also be built as a module.  If so, the module
 	  will be called i2c-qcom-geni.
 
+config I2C_QCOM_SLAVE
+	tristate "Qualcomm I2C slave controller"
+	depends on ARCH_QCOM || COMPILE_TEST
+	depends on COMMON_CLK
+	depends on INTERCONNECT
+	help
+	  This driver supports I2C slave mode on Qualcomm Technologies
+	  SoCs. If you say yes to this option, support will be included
+	  for the built-in I2C slave controller on QDU1000 and other
+	  compatible Qualcomm SoCs.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called i2c-qcom-slave.
+
 config I2C_QUP
 	tristate "Qualcomm QUP based I2C controller"
 	depends on ARCH_QCOM || COMPILE_TEST
diff --git a/drivers/i2c/busses/Makefile b/drivers/i2c/busses/Makefile
index 3755c54b3d82..209523685d9b 100644
--- a/drivers/i2c/busses/Makefile
+++ b/drivers/i2c/busses/Makefile
@@ -101,6 +101,7 @@ obj-$(CONFIG_I2C_PXA)		+= i2c-pxa.o
 obj-$(CONFIG_I2C_PXA_PCI)	+= i2c-pxa-pci.o
 obj-$(CONFIG_I2C_QCOM_CCI)	+= i2c-qcom-cci.o
 obj-$(CONFIG_I2C_QCOM_GENI)	+= i2c-qcom-geni.o
+obj-$(CONFIG_I2C_QCOM_SLAVE)	+= i2c-qcom-slave.o
 obj-$(CONFIG_I2C_QUP)		+= i2c-qup.o
 obj-$(CONFIG_I2C_RIIC)		+= i2c-riic.o
 obj-$(CONFIG_I2C_RK3X)		+= i2c-rk3x.o
diff --git a/drivers/i2c/busses/i2c-qcom-slave.c b/drivers/i2c/busses/i2c-qcom-slave.c
new file mode 100644
index 000000000000..ce16aa9708c3
--- /dev/null
+++ b/drivers/i2c/busses/i2c-qcom-slave.c
@@ -0,0 +1,777 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/bitfield.h>
+#include <linux/clk.h>
+#include <linux/i2c.h>
+#include <linux/interconnect.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/spinlock.h>
+
+/* Register offsets */
+#define I2C_S_DEVICE_ADDR			0x00
+#define I2C_S_IRQ_STATUS			0x08
+#define I2C_S_IRQ_CLR				0x0C
+#define I2C_S_IRQ_EN				0x10
+#define I2C_S_CONFIG				0x18
+#define I2C_S_CONTROL				0x1C
+#define I2C_S_FIFOS_STATUS			0x20
+#define I2C_S_TX_FIFO				0x24
+#define I2C_S_RX_FIFO				0x28
+#define I2C_S_DEBUG_REG1			0x3C
+#define I2C_S_DEBUG_REG2			0x40
+#define I2C_S_SW_RESET_REG			0x4C
+#define I2C_S_CLK_LOW_TIMEOUT			0x50
+#define I2C_S_CLK_RELEASE_DELAY_CNT_VAL	0x54
+#define I2C_S_SDA_HOLD_CNT_VAL			0x58
+
+/* I2C_S_CONFIG register fields */
+#define CORE_EN					BIT(0)
+
+/* I2C_S_CONTROL register fields */
+#define CLEAR_RX_FIFO				BIT(0)
+#define CLEAR_TX_FIFO				BIT(1)
+#define NACK					BIT(2)
+#define ACK_RESUME				BIT(3)
+
+/* I2C_S_SW_RESET_REG register fields */
+#define SW_RESET				BIT(0)
+
+/* I2C_S_FIFOS_STATUS register fields */
+#define TX_FIFO_COUNT_MASK			GENMASK(15, 0)
+#define RX_FIFO_COUNT_MASK			GENMASK(31, 16)
+
+/* Enabled IRQ bits: 0-6 and 8-9 (bit 7 GCA and bits 10-11 SMBAlert not used) */
+#define QCOM_I2C_SLAVE_ALL_IRQ			(GENMASK(9, 0) & ~BIT(7))
+
+#define I2C_SLAVE_MAX_MSG_SIZE			32
+#define I2C_SLAVE_BYTE_DATA			1
+#define I2C_SLAVE_WORD_DATA			2
+
+/* Interconnect bandwidth vote in bytes per second */
+#define APPS_PROC_TO_I2C_SLAVE_VOTE		1190000
+
+/**
+ * enum qcom_i2c_slave_irq - IRQ bit positions in I2C_S_IRQ_STATUS
+ * @STOP_DETECTED:	I2C stop condition detected on the bus
+ * @RX_FIFO_FULL:	receive FIFO has reached capacity
+ * @TX_FIFO_EMPTY:	transmit FIFO is empty
+ * @RX_DATA_AVAIL:	receive data is available in the RX FIFO
+ * @CLOCK_LOW_TIMEOUT:	SCL held low longer than the configured timeout
+ * @STRCH_WR:		clock stretching during a write (Rx) phase
+ * @STRCH_RD:		clock stretching during a read (Tx) phase
+ * @ERR_CONDITION:	unexpected start or stop bit detected (error)
+ * @RESTART_DETECTED:	repeated start condition detected
+ */
+enum qcom_i2c_slave_irq {
+	STOP_DETECTED = 0,
+	RX_FIFO_FULL,
+	TX_FIFO_EMPTY,
+	RX_DATA_AVAIL,
+	CLOCK_LOW_TIMEOUT,
+	STRCH_WR,
+	STRCH_RD,
+	ERR_CONDITION = 8, /* bit 7 (GCA_DETECTED) not used */
+	RESTART_DETECTED,
+};
+
+static const char *const qcom_i2c_slave_irq_names[] = {
+	[STOP_DETECTED]		= "Stop bit detected",
+	[RX_FIFO_FULL]		= "Rx FIFO full",
+	[TX_FIFO_EMPTY]		= "Tx FIFO empty",
+	[RX_DATA_AVAIL]		= "Rx data available",
+	[CLOCK_LOW_TIMEOUT]	= "Clock low timeout",
+	[STRCH_WR]		= "Clock stretching during write (Rx) phase",
+	[STRCH_RD]		= "Clock stretching during read (Tx) phase",
+	[ERR_CONDITION]		= "Error condition: unexpected Start/Stop bits",
+	[RESTART_DETECTED]	= "Repeated start bit detected",
+};
+
+/**
+ * struct qcom_i2c_slave - Qualcomm I2C slave controller private data
+ * @dev:	driver model device node
+ * @base:	base address of HW registers
+ * @adap:	I2C adapter for userspace access
+ * @ahb_clk:	AHB bus clock
+ * @xo_clk:	XO reference clock
+ * @icc_path:	interconnect bandwidth path
+ * @lock:	protects rx_count, rx_msg_buf, tx_count, tx_msg_buf
+ * @slave_addr:	current I2C slave address
+ * @rx_count:	number of valid bytes in rx_msg_buf
+ * @rx_msg_buf:	receive data staging buffer
+ * @tx_count:	number of valid bytes in tx_msg_buf
+ * @tx_msg_buf:	transmit data staging buffer
+ * @irq:	interrupt line number
+ */
+struct qcom_i2c_slave {
+	struct device		*dev;
+	void __iomem		*base;
+	struct i2c_adapter	adap;
+	struct clk		*ahb_clk;
+	struct clk		*xo_clk;
+	struct icc_path		*icc_path;
+	spinlock_t		lock; /* protects rx_count, rx_msg_buf, tx_count, tx_msg_buf */
+	u16			slave_addr;
+	u8			rx_count;
+	u8			rx_msg_buf[I2C_SLAVE_MAX_MSG_SIZE];
+	u8			tx_count;
+	u8			tx_msg_buf[I2C_SLAVE_MAX_MSG_SIZE];
+	int			irq;
+};
+
+/**
+ * qcom_i2c_slave_dump_regs - log all relevant controller register values
+ * @slave:	controller private data
+ *
+ * Dumps the current values of key hardware registers to the kernel debug
+ * log. Intended for use during error recovery to aid diagnostics.
+ */
+static void qcom_i2c_slave_dump_regs(struct qcom_i2c_slave *slave)
+{
+	dev_dbg(slave->dev, "I2C_S_DEVICE_ADDR:               0x%x\n",
+		readl_relaxed(slave->base + I2C_S_DEVICE_ADDR));
+	dev_dbg(slave->dev, "I2C_S_IRQ_STATUS:                0x%x\n",
+		readl_relaxed(slave->base + I2C_S_IRQ_STATUS));
+	dev_dbg(slave->dev, "I2C_S_CONFIG:                    0x%x\n",
+		readl_relaxed(slave->base + I2C_S_CONFIG));
+	dev_dbg(slave->dev, "I2C_S_IRQ_EN:                    0x%x\n",
+		readl_relaxed(slave->base + I2C_S_IRQ_EN));
+	dev_dbg(slave->dev, "I2C_S_FIFOS_STATUS:              0x%x\n",
+		readl_relaxed(slave->base + I2C_S_FIFOS_STATUS));
+	dev_dbg(slave->dev, "I2C_S_DEBUG_REG1:                0x%x\n",
+		readl_relaxed(slave->base + I2C_S_DEBUG_REG1));
+	dev_dbg(slave->dev, "I2C_S_DEBUG_REG2:                0x%x\n",
+		readl_relaxed(slave->base + I2C_S_DEBUG_REG2));
+	dev_dbg(slave->dev, "I2C_S_CLK_LOW_TIMEOUT:           0x%x\n",
+		readl_relaxed(slave->base + I2C_S_CLK_LOW_TIMEOUT));
+	dev_dbg(slave->dev, "I2C_S_CLK_RELEASE_DELAY_CNT_VAL: 0x%x\n",
+		readl_relaxed(slave->base + I2C_S_CLK_RELEASE_DELAY_CNT_VAL));
+	dev_dbg(slave->dev, "I2C_S_SDA_HOLD_CNT_VAL:          0x%x\n",
+		readl_relaxed(slave->base + I2C_S_SDA_HOLD_CNT_VAL));
+}
+
+/**
+ * qcom_i2c_slave_write_fifo - write staged TX data to the TX FIFO
+ * @slave:	controller private data
+ *
+ * Writes all bytes from the tx_msg_buf staging buffer into the hardware
+ * TX FIFO and resets tx_count to zero.
+ *
+ * Context: Must be called with slave->lock held.
+ */
+static void qcom_i2c_slave_write_fifo(struct qcom_i2c_slave *slave)
+{
+	int i;
+
+	if (!slave->tx_count) {
+		dev_err(slave->dev, "TX FIFO write count is zero\n");
+		return;
+	}
+
+	for (i = 0; i < slave->tx_count; i++) {
+		dev_dbg(slave->dev, "Data to TX FIFO: 0x%x\n",
+			slave->tx_msg_buf[i]);
+		writel(slave->tx_msg_buf[i], slave->base + I2C_S_TX_FIFO);
+	}
+
+	slave->tx_count = 0;
+}
+
+/**
+ * qcom_i2c_slave_read_fifo - drain the RX FIFO into the staging buffer
+ * @slave:	controller private data
+ *
+ * Reads all available bytes from the hardware RX FIFO into rx_msg_buf.
+ * Stops early if the staging buffer is full.
+ *
+ * Context: Must be called with slave->lock held.
+ */
+static void qcom_i2c_slave_read_fifo(struct qcom_i2c_slave *slave)
+{
+	unsigned int rx_data_count;
+	int i;
+
+	rx_data_count = FIELD_GET(RX_FIFO_COUNT_MASK,
+				  readl_relaxed(slave->base + I2C_S_FIFOS_STATUS));
+	if (!rx_data_count) {
+		dev_dbg(slave->dev, "RX FIFO empty\n");
+		return;
+	}
+
+	if (slave->rx_count >= I2C_SLAVE_MAX_MSG_SIZE) {
+		dev_err(slave->dev, "RX data buffer full\n");
+		return;
+	}
+
+	for (i = 0; i < rx_data_count &&
+	     slave->rx_count < I2C_SLAVE_MAX_MSG_SIZE; i++) {
+		slave->rx_msg_buf[slave->rx_count] =
+			readl_relaxed(slave->base + I2C_S_RX_FIFO);
+		dev_dbg(slave->dev, "Data from RX FIFO: 0x%x\n",
+			slave->rx_msg_buf[slave->rx_count]);
+		slave->rx_count++;
+	}
+}
+
+/**
+ * qcom_i2c_slave_set_bits - set bits in a controller register
+ * @slave:	controller private data
+ * @reg:	register offset from the controller base address
+ * @mask:	bitmask of bits to set
+ *
+ * Performs a read-modify-write to set the bits specified by @mask in the
+ * register at @reg without disturbing other bits.
+ */
+static void qcom_i2c_slave_set_bits(struct qcom_i2c_slave *slave,
+				    u32 reg, u32 mask)
+{
+	writel(readl_relaxed(slave->base + reg) | mask, slave->base + reg);
+}
+
+/**
+ * qcom_i2c_slave_clear_irq - acknowledge and clear pending interrupts
+ * @slave:	controller private data
+ * @mask:	bitmask of interrupt bits to clear
+ *
+ * Writes @mask to the IRQ clear register to acknowledge the specified
+ * interrupt sources.
+ */
+static void qcom_i2c_slave_clear_irq(struct qcom_i2c_slave *slave, u32 mask)
+{
+	writel(mask, slave->base + I2C_S_IRQ_CLR);
+}
+
+/**
+ * qcom_i2c_slave_hw_init - initialise or re-initialise the controller hardware
+ * @slave:	controller private data
+ *
+ * Flushes both FIFOs, enables the supported interrupts (QCOM_I2C_SLAVE_ALL_IRQ),
+ * the slave address register, and enables the core. Called from probe and
+ * resume to ensure the hardware is in a known good state.
+ */
+static void qcom_i2c_slave_hw_init(struct qcom_i2c_slave *slave)
+{
+	writel(CLEAR_TX_FIFO | CLEAR_RX_FIFO, slave->base + I2C_S_CONTROL);
+	writel(QCOM_I2C_SLAVE_ALL_IRQ, slave->base + I2C_S_IRQ_EN);
+	writel(slave->slave_addr, slave->base + I2C_S_DEVICE_ADDR);
+	writel(CORE_EN, slave->base + I2C_S_CONFIG);
+}
+
+/**
+ * qcom_i2c_slave_interrupt - top-level interrupt handler
+ * @irq:	interrupt number
+ * @dev_id:	pointer to the controller private data
+ *
+ * Reads the IRQ status register and dispatches handling for each active
+ * interrupt source. Fatal conditions (ERR_CONDITION, CLOCK_LOW_TIMEOUT)
+ * trigger a full controller reset and return early. All other events are
+ * handled in order with the spinlock held.
+ *
+ * Return: %IRQ_HANDLED if at least one interrupt was processed, %IRQ_NONE
+ *         if the status register was empty.
+ */
+static irqreturn_t qcom_i2c_slave_interrupt(int irq, void *dev_id)
+{
+	struct qcom_i2c_slave *slave = dev_id;
+	u32 irq_stat;
+
+	irq_stat = readl_relaxed(slave->base + I2C_S_IRQ_STATUS);
+	if (!irq_stat)
+		return IRQ_NONE;
+
+	dev_dbg(slave->dev, "IRQ status: 0x%x\n", irq_stat);
+
+	/*
+	 * ERR_CONDITION and CLOCK_LOW_TIMEOUT require full recovery.
+	 * Return early after handling to avoid processing stale irq_stat bits.
+	 */
+	if (irq_stat & (BIT(ERR_CONDITION) | BIT(CLOCK_LOW_TIMEOUT))) {
+		enum qcom_i2c_slave_irq irq_type = (irq_stat & BIT(ERR_CONDITION)) ?
+						    ERR_CONDITION : CLOCK_LOW_TIMEOUT;
+		dev_err(slave->dev, "%s\n", qcom_i2c_slave_irq_names[irq_type]);
+		qcom_i2c_slave_dump_regs(slave);
+		qcom_i2c_slave_set_bits(slave, I2C_S_SW_RESET_REG, SW_RESET);
+		qcom_i2c_slave_clear_irq(slave, QCOM_I2C_SLAVE_ALL_IRQ);
+		writel(QCOM_I2C_SLAVE_ALL_IRQ, slave->base + I2C_S_IRQ_EN);
+		qcom_i2c_slave_set_bits(slave, I2C_S_CONTROL,
+					CLEAR_TX_FIFO | CLEAR_RX_FIFO);
+		qcom_i2c_slave_set_bits(slave, I2C_S_CONFIG, CORE_EN);
+		writel(NACK, slave->base + I2C_S_CONTROL);
+		return IRQ_HANDLED;
+	}
+
+	spin_lock(&slave->lock);
+
+	if (irq_stat & BIT(STOP_DETECTED)) {
+		dev_dbg(slave->dev, "%s\n", qcom_i2c_slave_irq_names[STOP_DETECTED]);
+		qcom_i2c_slave_read_fifo(slave);
+		qcom_i2c_slave_clear_irq(slave, BIT(STOP_DETECTED));
+	}
+
+	if (irq_stat & BIT(RX_FIFO_FULL)) {
+		dev_dbg(slave->dev, "%s\n", qcom_i2c_slave_irq_names[RX_FIFO_FULL]);
+		writel(NACK, slave->base + I2C_S_CONTROL);
+		qcom_i2c_slave_clear_irq(slave, BIT(RX_FIFO_FULL));
+	}
+
+	if (irq_stat & BIT(STRCH_RD)) {
+		dev_dbg(slave->dev, "%s\n", qcom_i2c_slave_irq_names[STRCH_RD]);
+		if (readl_relaxed(slave->base + I2C_S_FIFOS_STATUS) & TX_FIFO_COUNT_MASK)
+			writel(ACK_RESUME, slave->base + I2C_S_CONTROL);
+		else
+			writel(NACK, slave->base + I2C_S_CONTROL);
+		qcom_i2c_slave_clear_irq(slave, BIT(STRCH_RD));
+	}
+
+	if (irq_stat & BIT(RX_DATA_AVAIL)) {
+		/*
+		 * Intermediate notification only — received data is consumed
+		 * in the STOP_DETECTED handler. Acknowledge and clear.
+		 */
+		dev_dbg(slave->dev, "%s\n", qcom_i2c_slave_irq_names[RX_DATA_AVAIL]);
+		qcom_i2c_slave_clear_irq(slave, BIT(RX_DATA_AVAIL));
+	}
+
+	if (irq_stat & BIT(STRCH_WR)) {
+		dev_dbg(slave->dev, "%s\n", qcom_i2c_slave_irq_names[STRCH_WR]);
+		if (slave->rx_count < I2C_SLAVE_MAX_MSG_SIZE)
+			writel(ACK_RESUME, slave->base + I2C_S_CONTROL);
+		else
+			writel(NACK, slave->base + I2C_S_CONTROL);
+		qcom_i2c_slave_clear_irq(slave, BIT(STRCH_WR));
+	}
+
+	if (irq_stat & BIT(TX_FIFO_EMPTY)) {
+		dev_dbg(slave->dev, "%s\n", qcom_i2c_slave_irq_names[TX_FIFO_EMPTY]);
+		if (slave->tx_count)
+			qcom_i2c_slave_write_fifo(slave);
+		qcom_i2c_slave_clear_irq(slave, BIT(TX_FIFO_EMPTY));
+	}
+
+	if (irq_stat & BIT(RESTART_DETECTED)) {
+		dev_dbg(slave->dev, "%s\n", qcom_i2c_slave_irq_names[RESTART_DETECTED]);
+		writel(ACK_RESUME, slave->base + I2C_S_CONTROL);
+		qcom_i2c_slave_clear_irq(slave, BIT(RESTART_DETECTED));
+	}
+
+	spin_unlock(&slave->lock);
+
+	return IRQ_HANDLED;
+}
+
+/**
+ * qcom_i2c_slave_write - stage TX data and write it to the TX FIFO
+ * @slave:	controller private data
+ * @buf:	data to transmit
+ * @count:	number of bytes to transmit
+ *
+ * Return: 0 on success, -%EINVAL if @buf is NULL, @count is zero, or
+ *         @count exceeds %I2C_SLAVE_MAX_MSG_SIZE.
+ */
+static int qcom_i2c_slave_write(struct qcom_i2c_slave *slave,
+				const u8 *buf, size_t count)
+{
+	unsigned long flags;
+
+	if (!buf || !count)
+		return -EINVAL;
+
+	if (count > I2C_SLAVE_MAX_MSG_SIZE)
+		return -EINVAL;
+
+	spin_lock_irqsave(&slave->lock, flags);
+	memcpy(slave->tx_msg_buf, buf, count);
+	slave->tx_count = count;
+	qcom_i2c_slave_write_fifo(slave);
+	spin_unlock_irqrestore(&slave->lock, flags);
+
+	return 0;
+}
+
+/**
+ * qcom_i2c_slave_read - copy received data from the staging buffer
+ * @slave:	controller private data
+ * @buf:	destination buffer
+ * @count:	number of bytes requested
+ *
+ * Return: number of bytes copied on success, negative error code on failure.
+ */
+static int qcom_i2c_slave_read(struct qcom_i2c_slave *slave,
+			       u8 *buf, size_t count)
+{
+	unsigned long flags;
+	int ret;
+
+	if (!buf || !count)
+		return -EINVAL;
+
+	spin_lock_irqsave(&slave->lock, flags);
+
+	if (count <= I2C_SLAVE_WORD_DATA && slave->rx_count < count) {
+		dev_err(slave->dev, "Data not available\n");
+		spin_unlock_irqrestore(&slave->lock, flags);
+		return -EINVAL;
+	}
+
+	if (count > I2C_SLAVE_WORD_DATA)
+		count = slave->rx_count;
+
+	memcpy(buf, slave->rx_msg_buf, count);
+	slave->rx_count -= count;
+	memmove(slave->rx_msg_buf, slave->rx_msg_buf + count, slave->rx_count);
+	ret = count;
+
+	spin_unlock_irqrestore(&slave->lock, flags);
+
+	return ret;
+}
+
+/**
+ * qcom_i2c_slave_xfer - SMBus transfer callback
+ * @adap:	I2C adapter
+ * @addr:	slave address (used to update the HW address register)
+ * @flags:	I2C client flags
+ * @read_write:	direction flag (I2C_SMBUS_READ or I2C_SMBUS_WRITE)
+ * @command:	SMBus command code
+ * @protocol:	SMBus protocol type
+ * @data:	pointer to SMBus data union
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+static int qcom_i2c_slave_xfer(struct i2c_adapter *adap, u16 addr,
+			       unsigned short flags, char read_write,
+			       u8 command, int protocol,
+			       union i2c_smbus_data *data)
+{
+	struct qcom_i2c_slave *slave = i2c_get_adapdata(adap);
+	u8 buf[I2C_SMBUS_BLOCK_MAX];
+	int ret = 0, count, i;
+
+	dev_dbg(slave->dev,
+		"SMBus xfer: addr=0x%x flags=0x%x cmd=0x%x rw=%d proto=%d\n",
+		addr, flags, command, read_write, protocol);
+
+	/*
+	 * The SMBus command byte is not used for transfer routing. As a slave
+	 * controller this device responds to whatever the master sends;
+	 * command interpretation is left to the userspace application.
+	 */
+
+	/*
+	 * The I2C framework resets the slave address to 0 on every open/close
+	 * of the device node. Only update the HW register for non-zero values
+	 * that differ from the current address.
+	 */
+	if (addr && addr != slave->slave_addr) {
+		slave->slave_addr = addr;
+		writel_relaxed(addr, slave->base + I2C_S_DEVICE_ADDR);
+	}
+
+	if (read_write == I2C_SMBUS_READ) {
+		switch (protocol) {
+		case I2C_SMBUS_BYTE:
+		case I2C_SMBUS_BYTE_DATA:
+			count = qcom_i2c_slave_read(slave, buf, I2C_SLAVE_BYTE_DATA);
+			if (count == I2C_SLAVE_BYTE_DATA) {
+				data->byte = buf[0];
+				return 0;
+			}
+			ret = count;
+			break;
+
+		case I2C_SMBUS_WORD_DATA:
+			count = qcom_i2c_slave_read(slave, buf, I2C_SLAVE_WORD_DATA);
+			if (count == I2C_SLAVE_WORD_DATA) {
+				data->word = buf[0] | (buf[1] << 8);
+				return 0;
+			}
+			ret = count;
+			break;
+
+		case I2C_SMBUS_BLOCK_DATA:
+			count = qcom_i2c_slave_read(slave, buf, I2C_SMBUS_BLOCK_MAX);
+			if (count > 0) {
+				data->block[0] = count;
+				for (i = 0; i < count; i++)
+					data->block[i + 1] = buf[i];
+				return 0;
+			}
+			ret = -EINVAL;
+			break;
+
+		default:
+			ret = -EOPNOTSUPP;
+			break;
+		}
+	} else if (read_write == I2C_SMBUS_WRITE) {
+		switch (protocol) {
+		case I2C_SMBUS_BYTE:
+		case I2C_SMBUS_BYTE_DATA:
+			buf[0] = data->byte;
+			ret = qcom_i2c_slave_write(slave, buf, I2C_SLAVE_BYTE_DATA);
+			break;
+
+		case I2C_SMBUS_WORD_DATA:
+			buf[0] = data->word & 0xFF;
+			buf[1] = data->word >> 8;
+			ret = qcom_i2c_slave_write(slave, buf, I2C_SLAVE_WORD_DATA);
+			break;
+
+		case I2C_SMBUS_BLOCK_DATA:
+			if (data->block[0] > I2C_SMBUS_BLOCK_MAX)
+				data->block[0] = I2C_SMBUS_BLOCK_MAX;
+			for (i = 0; i < data->block[0]; i++)
+				buf[i] = data->block[i + 1];
+			ret = qcom_i2c_slave_write(slave, buf, data->block[0]);
+			break;
+
+		default:
+			ret = -EOPNOTSUPP;
+			break;
+		}
+	}
+
+	return ret;
+}
+
+/**
+ * qcom_i2c_slave_icc_init - initialise the interconnect bandwidth path
+ * @slave:	controller private data
+ *
+ * Obtains the interconnect path, sets the required bandwidth vote, and
+ * enables the path so the controller can access system memory.
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+static int qcom_i2c_slave_icc_init(struct qcom_i2c_slave *slave)
+{
+	int ret;
+
+	slave->icc_path = devm_of_icc_get(slave->dev, "i2c-slave-config");
+	if (IS_ERR(slave->icc_path))
+		return dev_err_probe(slave->dev, PTR_ERR(slave->icc_path),
+				     "failed to get ICC path\n");
+
+	ret = icc_set_bw(slave->icc_path, APPS_PROC_TO_I2C_SLAVE_VOTE,
+			 APPS_PROC_TO_I2C_SLAVE_VOTE);
+	if (ret)
+		return dev_err_probe(slave->dev, ret, "icc_set_bw failed\n");
+
+	ret = icc_enable(slave->icc_path);
+	if (ret)
+		return dev_err_probe(slave->dev, ret, "ICC enable failed\n");
+
+	return 0;
+}
+
+/**
+ * qcom_i2c_slave_func - report the SMBus functionality supported
+ * @adap:	I2C adapter
+ *
+ * Return: bitmask of I2C_FUNC_* flags indicating the supported SMBus
+ *         protocols (byte, byte-data, word-data, and block-data).
+ */
+static u32 qcom_i2c_slave_func(struct i2c_adapter *adap)
+{
+	return I2C_FUNC_SMBUS_BYTE      |
+	       I2C_FUNC_SMBUS_BYTE_DATA |
+	       I2C_FUNC_SMBUS_WORD_DATA |
+	       I2C_FUNC_SMBUS_BLOCK_DATA;
+}
+
+static const struct i2c_algorithm qcom_i2c_slave_algo = {
+	.smbus_xfer	= qcom_i2c_slave_xfer,
+	.functionality	= qcom_i2c_slave_func,
+};
+
+/**
+ * qcom_i2c_slave_probe - probe the Qualcomm I2C slave controller
+ * @pdev:	platform device
+ *
+ * Allocates driver state, maps registers, enables clocks and the
+ * interconnect path, registers the interrupt handler, initialises the
+ * hardware, and registers the I2C adapter with the kernel.
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+static int qcom_i2c_slave_probe(struct platform_device *pdev)
+{
+	struct qcom_i2c_slave *slave;
+	struct device *dev = &pdev->dev;
+	u32 addr;
+	int ret;
+
+	slave = devm_kzalloc(dev, sizeof(*slave), GFP_KERNEL);
+	if (!slave)
+		return -ENOMEM;
+
+	slave->dev = dev;
+	spin_lock_init(&slave->lock);
+
+	ret = of_property_read_u32(dev->of_node, "qcom,slave-addr", &addr);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "missing qcom,slave-addr property\n");
+
+	slave->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(slave->base))
+		return PTR_ERR(slave->base);
+
+	slave->xo_clk = devm_clk_get_enabled(dev, "sm_bus_xo_clk");
+	if (IS_ERR(slave->xo_clk))
+		return dev_err_probe(dev, PTR_ERR(slave->xo_clk),
+				     "failed to get and enable XO clock\n");
+
+	slave->ahb_clk = devm_clk_get_enabled(dev, "sm_bus_ahb_clk");
+	if (IS_ERR(slave->ahb_clk))
+		return dev_err_probe(dev, PTR_ERR(slave->ahb_clk),
+				     "failed to get and enable AHB clock\n");
+
+	slave->irq = platform_get_irq(pdev, 0);
+	if (slave->irq < 0)
+		return slave->irq;
+
+	ret = devm_request_irq(dev, slave->irq, qcom_i2c_slave_interrupt, 0,
+			       dev_name(dev), slave);
+	if (ret) {
+		dev_err(dev, "request_irq failed for IRQ %d: %d\n",
+			slave->irq, ret);
+		return ret;
+	}
+
+	ret = qcom_i2c_slave_icc_init(slave);
+	if (ret)
+		return ret;
+
+	slave->slave_addr = addr;
+
+	qcom_i2c_slave_hw_init(slave);
+
+	slave->adap.owner = THIS_MODULE;
+	slave->adap.algo = &qcom_i2c_slave_algo;
+	slave->adap.dev.parent = dev;
+	slave->adap.dev.of_node = dev->of_node;
+	strscpy(slave->adap.name, "qcom-i2c-slave", sizeof(slave->adap.name));
+
+	i2c_set_adapdata(&slave->adap, slave);
+	platform_set_drvdata(pdev, slave);
+
+	ret = i2c_add_adapter(&slave->adap);
+	if (ret) {
+		dev_err(dev, "i2c_add_adapter failed: %d\n", ret);
+		icc_disable(slave->icc_path);
+		return ret;
+	}
+
+	dev_info(dev, "Qualcomm I2C slave probed at address 0x%x\n", addr);
+	return 0;
+}
+
+/**
+ * qcom_i2c_slave_remove - remove the Qualcomm I2C slave controller
+ * @pdev:	platform device
+ *
+ * Unregisters the I2C adapter and disables the interconnect path.
+ * Controller clocks are disabled automatically by the devm framework.
+ */
+static void qcom_i2c_slave_remove(struct platform_device *pdev)
+{
+	struct qcom_i2c_slave *slave = platform_get_drvdata(pdev);
+
+	i2c_del_adapter(&slave->adap);
+	icc_disable(slave->icc_path);
+	/* clocks are disabled automatically by devm */
+}
+
+/**
+ * qcom_i2c_slave_suspend - suspend the controller
+ * @dev:	device associated with the controller
+ *
+ * Disables the interrupt, releases the interconnect bandwidth vote, and
+ * disables the controller clocks to allow the system to enter a low-power
+ * state.
+ *
+ * Return: 0 always.
+ */
+static int qcom_i2c_slave_suspend(struct device *dev)
+{
+	struct qcom_i2c_slave *slave = dev_get_drvdata(dev);
+
+	disable_irq(slave->irq);
+	icc_disable(slave->icc_path);
+	clk_disable_unprepare(slave->xo_clk);
+	clk_disable_unprepare(slave->ahb_clk);
+
+	return 0;
+}
+
+/**
+ * qcom_i2c_slave_resume - resume the controller
+ * @dev:	device associated with the controller
+ *
+ * Re-enables the controller clocks and the interconnect bandwidth path,
+ * restores the hardware register state, then re-enables the interrupt so
+ * the controller is ready to handle transactions.
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+static int qcom_i2c_slave_resume(struct device *dev)
+{
+	struct qcom_i2c_slave *slave = dev_get_drvdata(dev);
+	int ret;
+
+	ret = clk_prepare_enable(slave->ahb_clk);
+	if (ret) {
+		dev_err(dev, "failed to enable AHB clock: %d\n", ret);
+		return ret;
+	}
+
+	ret = clk_prepare_enable(slave->xo_clk);
+	if (ret) {
+		dev_err(dev, "failed to enable XO clock: %d\n", ret);
+		clk_disable_unprepare(slave->ahb_clk);
+		return ret;
+	}
+
+	ret = icc_enable(slave->icc_path);
+	if (ret) {
+		dev_err(dev, "ICC enable failed: %d\n", ret);
+		clk_disable_unprepare(slave->xo_clk);
+		clk_disable_unprepare(slave->ahb_clk);
+		return ret;
+	}
+
+	qcom_i2c_slave_hw_init(slave);
+	enable_irq(slave->irq);
+	return 0;
+}
+
+static SIMPLE_DEV_PM_OPS(qcom_i2c_slave_pm_ops,
+			  qcom_i2c_slave_suspend,
+			  qcom_i2c_slave_resume);
+
+static const struct of_device_id qcom_i2c_slave_dt_match[] = {
+	{ .compatible = "qcom,i2c-slave" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, qcom_i2c_slave_dt_match);
+
+static struct platform_driver qcom_i2c_slave_driver = {
+	.driver = {
+		.name		= "qcom-i2c-slave",
+		.pm		= &qcom_i2c_slave_pm_ops,
+		.of_match_table	= qcom_i2c_slave_dt_match,
+	},
+	.probe	= qcom_i2c_slave_probe,
+	.remove	= qcom_i2c_slave_remove,
+};
+module_platform_driver(qcom_i2c_slave_driver);
+
+MODULE_AUTHOR("Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>");
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("Qualcomm I2C slave controller driver");

-- 
2.34.1


