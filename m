Return-Path: <linux-arm-msm+bounces-107650-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sGQhFb7fBWr4cwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107650-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 16:44:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 98CCD5435E3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 16:44:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id EFE343038AD3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 14:27:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AC733FA5F5;
	Thu, 14 May 2026 14:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R+2C2e50";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gH129KGq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 803FF38B14F
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 14:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778768843; cv=none; b=IIbrWCnRdDDM3gzWb2TfevFuHvP08H4IICNAiyM2gAT/4kQdwC3tjv6yCiqZ2CfK6nfxDmiz9PsnAXlIiXwHv5X456xLheCKP+n99d4Fbwdkp3AtiirdPswgGxfCLi6tbNVVBLQYrVX/osQ3dpSswLVMjpBkfXn19A7DPSTddsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778768843; c=relaxed/simple;
	bh=B0ZtyTNgrcb6Ah4fiJ7wnTmXZKRQjY+hrvqL1+z4Iq4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=E1Zrm0W8tQYx3qst1qnMaVVmxr8Mzd3mI2dRgiCCpPz1uYxhNVJvLfsxlUOVMyFa9KWaEoM8gfdCqO9+oXWdEXvZFUSk/DyMd8jRMeWae+LgBV4t+5R5umCPq4o2g+mg14I4fr3JOv1r0v5Z125yhGerd3/dGPlFCsIeSISZy8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R+2C2e50; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gH129KGq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64EBeV8d2713286
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 14:27:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2bW6YUTzOuvBu0eaOmgGwPbSA1PvpkOTNmX5GKSvx7s=; b=R+2C2e509qoekEce
	bZ2+7KiT8IkfXYxYalO9rmWw0aiqjQY9d0dZU20J9hlylPmSsuWeKo01sU36YYui
	U25fAcrou+Wwe1j9fqswsYasZ3Yhp0caScniO4X5b2hO1IomYAv367rmQEeIJ2PS
	JFhtOwuQ3MDg/38n837LBRKmKbKpGdsc6PZP/rnJNTblN7CZOZn7QifKTTtkKuNr
	woaohcEbr5YkeIheVjrvB/81TViaYFsLWsU8vkiCk9zoMsEenn04oQ95Lv7B2JcF
	C2bSOP8Q9kK/pHG+BN47bKPIQHokMR45JlS21T8epCaG7Lz2w2qNiN92UbbF54KV
	NSeYqw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e58v89pfn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 14:27:20 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b2e8bba2e6so104869395ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 07:27:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778768840; x=1779373640; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2bW6YUTzOuvBu0eaOmgGwPbSA1PvpkOTNmX5GKSvx7s=;
        b=gH129KGqDqTMPUDdjLyiN67d9UJwRLrNA2YV1cfdggswNGPdEJVLNHDYBF3B8kgVG1
         cy4KKIkRGuqKJZKjruZEE8JIm/Wi752Y4+6sbsenD6FQM8LQdXvlcFkgpHzcQLtidwe3
         Hpdc8jJjQpeZGcfKFMD4XTGTfdyC2tWrfIBrfqIo1sS9c1RSqUZ8M73Gsm8s4bRM0QnE
         GDxCMSIZ1EvElTBNFG0hqUMAeYU3aeW1yqaPTQlJbP6EdY8hUBBsKlbBhWLJhtZ60QHx
         KtZBxFuZuVN7AdM8K+1O9p2WJuVmOUwsKwH8SMrBAMfe682qAhtKtO104Y3R/y+QHIr8
         jThQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778768840; x=1779373640;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2bW6YUTzOuvBu0eaOmgGwPbSA1PvpkOTNmX5GKSvx7s=;
        b=YmeEy+btAZpkFygxIJX5tlr5oVGIGFo7VpaUw40o9TRdS1dOALrsS+9Upr5AaEIo1P
         bs3RKBkGGgf/8he3bXwB3SVyNKg1vnDdvPG1jo0tt13Fl6TitYVtbulZKeD9TT3SI2WF
         uaVrZFKJm/qTArH+tn/Ns3aR3xeUVLNpPeBF0LKVSYSXReSCPlxZuuHSSO0LCgftN82c
         Ad2Z/ClRBr/GIugomt/uetQhhGWkGpkwSNk3Ajcg9V292w8X24WlNLvVV2PotH8YdOck
         Hf9N2bdCUzUQkmQxGkIkB5rOk0mJslLHFiYJVbyVX56rKxs9wQKSONVu9w2BYmG1paCI
         3uIg==
X-Forwarded-Encrypted: i=1; AFNElJ8Bv/2aeZaZiIqbCTl4lmq6jqGx3BCxomBtYQ2o6eoBM6bGlecTWU/98VigV6pmWykwEE1G33BJNZy7ObGQ@vger.kernel.org
X-Gm-Message-State: AOJu0YxVyfwl3PrryL2Nl/XLf6vOSU+m3JS9bkTtWCLXEdBHdf83BdVW
	uIa1Jw/b8Pf9gqXDaDvrvo5TC4BEWloeKSxtSX4+SWSU5nInRM1WsmkyU4Ko0xipIcJoF8C+NhH
	t5Hvp30C+cquDtdvKR64NRIzC1y33hLDhwiRrnjVYktFGepmjniE6I3WZbC0I3tmIwSDc
X-Gm-Gg: Acq92OF4AsIpFp2uydS2hX2QF/ihMkQFXZFObRV54D/rFG1mEdqkDp9hFbrBl52R3hu
	ncp2m6w7qoupNhhc8INPOg20am6MLL7a2Ma/xtnDmxhSp8nbIMVgg4OouHEID4cb1hPDdqAQ0nH
	CNwFLp8nxlIiq/YtRHRw12oAL4Y3/lOyaLQUDiRchOiA+ZKgGcqOwhkyLIQkwXvT/b+APHKu03C
	4q2Dtjl3beLiJU977JmmvndNNJ4RkIOiX1tZ5CYhOlORDHvhThJtQlLDm225ii0/hhsZ5zr9VBw
	ZUoUACk1gax2FHTSBhFgbYWD7+Xi5DHq/OhdwdBRoBkjjytMLsiLBKabCgS/CoRvYbuM4h7v7yW
	eY/mPU4TsB1klIiWXOd+OkLiIO0jW9edCPU4ie8PLl3fJdYNwlNLXPmrv8w==
X-Received: by 2002:a17:903:3e25:b0:2b0:6a22:5165 with SMTP id d9443c01a7336-2bd2718bf33mr68336855ad.7.1778768839512;
        Thu, 14 May 2026 07:27:19 -0700 (PDT)
X-Received: by 2002:a17:903:3e25:b0:2b0:6a22:5165 with SMTP id d9443c01a7336-2bd2718bf33mr68336245ad.7.1778768838912;
        Thu, 14 May 2026 07:27:18 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5c05ffbesm28566485ad.27.2026.05.14.07.27.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 07:27:18 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Thu, 14 May 2026 19:55:43 +0530
Subject: [PATCH v22 02/13] power: reset: reboot-mode: Add support for 64
 bit magic
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260514-arm-psci-system_reset2-vendor-reboots-v22-2-28a5bde07483@oss.qualcomm.com>
References: <20260514-arm-psci-system_reset2-vendor-reboots-v22-0-28a5bde07483@oss.qualcomm.com>
In-Reply-To: <20260514-arm-psci-system_reset2-vendor-reboots-v22-0-28a5bde07483@oss.qualcomm.com>
To: Sebastian Reichel <sre@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Lee Jones <lee@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Andy Yan <andy.yan@rock-chips.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778768806; l=7663;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=B0ZtyTNgrcb6Ah4fiJ7wnTmXZKRQjY+hrvqL1+z4Iq4=;
 b=HifSlQTw1nZj2bR6K1yArNohiisd4k/0HAIfMlCLb3nui1xiTM2XU6zK7HvyiYUoablEHqTK3
 JNQpO/hl9YLAalBlclzFzd1yht+VBoc2HceBdu3evEOXSfE1duZ/8mS
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDE0NiBTYWx0ZWRfXxzknjcl0bPaZ
 ZrloJkRIrsN2GHU2DZ7MpzRfCdiAVuvzmPNv0dbb3Z2xLbkb3dzYiSWZG1DFQlQxhn1fH8pf6ww
 fLVVr4o5AWpJY9wl/yIy42ebmWiF/A/RufYkNFdFSbRQlrjRDFmZKNzelhLC05tkleLWXpGVomz
 vIusoZ+zc4pBr6okAowFv3DZS7CJ5VQFhmm5gPpvIMRQQti0adDJZkzOD7q3MIcbxCAF8lbzRWf
 1VBv0KwDMhXbChroSk1g9V4z0bd25dgosipSm8fxL2oQegDWXBYWvLQhIHLIOZV9ACyuVTxSpRY
 Zaz0cGGZgYrOkoVms9xYKaiMvVj1XXkZyKhHsXOQhz6IozqeIaaRJ3WbtLGAfctjK5shP6mz30u
 j2BsqW2N/LKaYTH0yS4WPJmJ5Ghh9QZFaP1OG4ZoOGpNMkeSMzXXWh1mMEZZu+KgaGBFFHGyi8Q
 qaZTN7MHJfImPct8qnQ==
X-Proofpoint-GUID: 5O6sA_CuS8a4MupUWqSZhotrwWQYehmX
X-Authority-Analysis: v=2.4 cv=YZSNIQRf c=1 sm=1 tr=0 ts=6a05dbc8 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=QX4gbG5DAAAA:8 a=MO_J9Aa4ypbE8kPWTcIA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-ORIG-GUID: 5O6sA_CuS8a4MupUWqSZhotrwWQYehmX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_03,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 bulkscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605140146
X-Rspamd-Queue-Id: 98CCD5435E3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107650-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,collabora.com:email,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[kernel.org,arm.com,arndb.de,rock-chips.com,gmail.com,linaro.org,ettus.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[38];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shivendra.pratap@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Current reboot-mode supports a single 32-bit argument for any
supported mode. Some reboot-mode based drivers may require
passing two independent 32-bit arguments during a reboot
sequence, for uses-cases, where a mode requires an additional
argument. Such drivers may not be able to use the reboot-mode
driver. For example, ARM PSCI vendor-specific resets, need two
arguments for its operation – reset_type and cookie, to complete
the reset operation. If a driver wants to implement this
firmware-based reset, it cannot use reboot-mode framework.

Introduce 64-bit magic values in reboot-mode driver to
accommodate up-to two 32-bit arguments in below format.
|    Higher 32 bit  |   Lower 32 bit    |
|	 arg2	    | 	    arg1	|

Update current reboot-mode drivers for 64-bit magic.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 drivers/power/reset/nvmem-reboot-mode.c  |  8 ++++----
 drivers/power/reset/qcom-pon.c           |  6 +++---
 drivers/power/reset/reboot-mode.c        | 19 ++++++++++++-------
 drivers/power/reset/syscon-reboot-mode.c |  6 +++---
 include/linux/reboot-mode.h              | 15 ++++++++++++++-
 5 files changed, 36 insertions(+), 18 deletions(-)

diff --git a/drivers/power/reset/nvmem-reboot-mode.c b/drivers/power/reset/nvmem-reboot-mode.c
index d260715fccf67f9f072bb56c5defbf885750650e..bd05d660490c686b43134f82f1eadd7665403d20 100644
--- a/drivers/power/reset/nvmem-reboot-mode.c
+++ b/drivers/power/reset/nvmem-reboot-mode.c
@@ -17,10 +17,10 @@ struct nvmem_reboot_mode {
 	struct nvmem_cell *cell;
 };
 
-static int nvmem_reboot_mode_write(struct reboot_mode_driver *reboot,
-				    unsigned int magic)
+static int nvmem_reboot_mode_write(struct reboot_mode_driver *reboot, u64 magic)
 {
 	struct nvmem_reboot_mode *nvmem_rbm;
+	u32 magic_arg1 = REBOOT_MODE_ARG1(magic);
 	size_t buf_len;
 	void *buf;
 	int ret;
@@ -32,10 +32,10 @@ static int nvmem_reboot_mode_write(struct reboot_mode_driver *reboot,
 		return PTR_ERR(buf);
 	kfree(buf);
 
-	if (buf_len > sizeof(magic))
+	if (buf_len > sizeof(magic_arg1))
 		return -EINVAL;
 
-	ret = nvmem_cell_write(nvmem_rbm->cell, &magic, buf_len);
+	ret = nvmem_cell_write(nvmem_rbm->cell, &magic_arg1, buf_len);
 	if (ret < 0)
 		dev_err(reboot->dev, "update reboot mode bits failed\n");
 
diff --git a/drivers/power/reset/qcom-pon.c b/drivers/power/reset/qcom-pon.c
index 7e108982a582e8243c5c806bd4a793646b87189f..57b36e6186f80aff947fd7f5aae5ce280c65dc6b 100644
--- a/drivers/power/reset/qcom-pon.c
+++ b/drivers/power/reset/qcom-pon.c
@@ -27,17 +27,17 @@ struct qcom_pon {
 	long reason_shift;
 };
 
-static int qcom_pon_reboot_mode_write(struct reboot_mode_driver *reboot,
-				    unsigned int magic)
+static int qcom_pon_reboot_mode_write(struct reboot_mode_driver *reboot, u64 magic)
 {
 	struct qcom_pon *pon = container_of
 			(reboot, struct qcom_pon, reboot_mode);
+	u32 magic_arg1 = REBOOT_MODE_ARG1(magic);
 	int ret;
 
 	ret = regmap_update_bits(pon->regmap,
 				 pon->baseaddr + PON_SOFT_RB_SPARE,
 				 GENMASK(7, pon->reason_shift),
-				 magic << pon->reason_shift);
+				 magic_arg1 << pon->reason_shift);
 	if (ret < 0)
 		dev_err(pon->dev, "update reboot mode bits failed\n");
 
diff --git a/drivers/power/reset/reboot-mode.c b/drivers/power/reset/reboot-mode.c
index 7a74f72a8313b73c3e0930a426ebcf7ef6eed99b..f1372dc700e48043320812c3d3619ab1539e1854 100644
--- a/drivers/power/reset/reboot-mode.c
+++ b/drivers/power/reset/reboot-mode.c
@@ -22,7 +22,7 @@
 
 struct mode_info {
 	const char *mode;
-	u32 magic;
+	u64 magic;
 	struct list_head list;
 };
 
@@ -74,8 +74,7 @@ static const struct class reboot_mode_class = {
 	.dev_groups = reboot_mode_groups,
 };
 
-static unsigned int get_reboot_mode_magic(struct reboot_mode_driver *reboot,
-					  const char *cmd)
+static u64 get_reboot_mode_magic(struct reboot_mode_driver *reboot, const char *cmd)
 {
 	const char *normal = "normal";
 	struct mode_info *info;
@@ -107,7 +106,7 @@ static int reboot_mode_notify(struct notifier_block *this,
 			      unsigned long mode, void *cmd)
 {
 	struct reboot_mode_driver *reboot;
-	unsigned int magic;
+	u64 magic;
 
 	reboot = container_of(this, struct reboot_mode_driver, reboot_notifier);
 	magic = get_reboot_mode_magic(reboot, cmd);
@@ -175,16 +174,22 @@ int reboot_mode_register(struct reboot_mode_driver *reboot)
 	struct property *prop;
 	struct device_node *np = reboot->dev->of_node;
 	size_t len = strlen(PREFIX);
-	u32 magic;
+	size_t count;
+	u32 magic[2];
 	int ret;
 
 	INIT_LIST_HEAD(&reboot->head);
 
 	for_each_property_of_node(np, prop) {
+		memset(magic, 0, sizeof(magic));
+
 		if (strncmp(prop->name, PREFIX, len))
 			continue;
 
-		if (device_property_read_u32(reboot->dev, prop->name, &magic)) {
+		count = device_property_count_u32(reboot->dev, prop->name);
+
+		if (!count || count > ARRAY_SIZE(magic) ||
+		    device_property_read_u32_array(reboot->dev, prop->name, magic, count)) {
 			pr_debug("reboot mode %s without magic number\n", prop->name);
 			continue;
 		}
@@ -195,7 +200,7 @@ int reboot_mode_register(struct reboot_mode_driver *reboot)
 			goto error;
 		}
 
-		info->magic = magic;
+		info->magic = REBOOT_MODE_MAGIC(magic[0], magic[1]);
 		info->mode = kstrdup_const(prop->name + len, GFP_KERNEL);
 		if (!info->mode) {
 			ret =  -ENOMEM;
diff --git a/drivers/power/reset/syscon-reboot-mode.c b/drivers/power/reset/syscon-reboot-mode.c
index e0772c9f70f7a19cd8ec8a0b7fdbbaa7ba44afd0..9f4b18c5e46f6a8bf197773ceceb80b250f57541 100644
--- a/drivers/power/reset/syscon-reboot-mode.c
+++ b/drivers/power/reset/syscon-reboot-mode.c
@@ -20,16 +20,16 @@ struct syscon_reboot_mode {
 	u32 mask;
 };
 
-static int syscon_reboot_mode_write(struct reboot_mode_driver *reboot,
-				    unsigned int magic)
+static int syscon_reboot_mode_write(struct reboot_mode_driver *reboot, u64 magic)
 {
 	struct syscon_reboot_mode *syscon_rbm;
+	u32 magic_arg1 = REBOOT_MODE_ARG1(magic);
 	int ret;
 
 	syscon_rbm = container_of(reboot, struct syscon_reboot_mode, reboot);
 
 	ret = regmap_update_bits(syscon_rbm->map, syscon_rbm->offset,
-				 syscon_rbm->mask, magic);
+				 syscon_rbm->mask, magic_arg1);
 	if (ret < 0)
 		dev_err(reboot->dev, "update reboot mode bits failed\n");
 
diff --git a/include/linux/reboot-mode.h b/include/linux/reboot-mode.h
index 4a2abb38d1d612ec0fdf05eb18c98b210f631b7f..2ce189fdfff4b396d7cc6f175b30016781ae4fe9 100644
--- a/include/linux/reboot-mode.h
+++ b/include/linux/reboot-mode.h
@@ -2,10 +2,23 @@
 #ifndef __REBOOT_MODE_H__
 #define __REBOOT_MODE_H__
 
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/types.h>
+
+/* Construct 64-bit reboot magic: arg2 in upper 32 bits, arg1 in lower 32 */
+#define REBOOT_MODE_MAGIC(arg1, arg2) \
+	(FIELD_PREP(GENMASK_ULL(31, 0), (arg1)) | \
+	 FIELD_PREP(GENMASK_ULL(63, 32), (arg2)))
+/* Get 32 bit arg1 from 64 bit magic */
+#define REBOOT_MODE_ARG1(magic) FIELD_GET(GENMASK_ULL(31, 0), magic)
+/* Get 32 bit arg2 from 64 bit magic */
+#define REBOOT_MODE_ARG2(magic) FIELD_GET(GENMASK_ULL(63, 32), magic)
+
 struct reboot_mode_driver {
 	struct device *dev;
 	struct list_head head;
-	int (*write)(struct reboot_mode_driver *reboot, unsigned int magic);
+	int (*write)(struct reboot_mode_driver *reboot, u64 magic);
 	struct notifier_block reboot_notifier;
 };
 

-- 
2.34.1


