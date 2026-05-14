Return-Path: <linux-arm-msm+bounces-107655-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wA92LTLdBWokcgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107655-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 16:33:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3218D5432A6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 16:33:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 65DBC30B2371
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 14:28:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CC0640627D;
	Thu, 14 May 2026 14:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bo6UGY3d";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Urxi/C0k"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97BBD3FA5D6
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 14:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778768893; cv=none; b=AeEe/7MwV4D7gzRRuVCe+pK4hp3kOCjGC/6+xFiEvWEfB1AsWZfamv+QAICoABBY2tG8Ww1sczUear5hH9xOXcOwPB7pxvIL7Gk+nUMR2Yhm8rfBTg5zL3kkciUGFnC6CO65WV3rldTlrkGeCh5n1pa5bzv2Azbn930OzyGqw7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778768893; c=relaxed/simple;
	bh=3BU+OmQY7vwCKgtP7JgVodTFXWx0p5HRBbSXZG9v7s4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BD9aEVWylt7lLP5dsNoI3mGqVJpv1QO87y3TPBq/MvLr3DtDAJD0FkU8JVO9/J/WOP/tqp+kxibLArNuwaZed6AlpzYPw7VFUPPjScVj00l6r6D8wjL71yVgGnLwj5Oa98uQQVr6OcZnmsebhZU2mPK5pMbeAMdKdotTIWxST8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bo6UGY3d; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Urxi/C0k; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64EBeToq889388
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 14:28:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	e+wctK5RZ9TRw0ESOwHfyBsEr+rYwllu4QgRLTyrtk0=; b=bo6UGY3dqyOl8c3l
	8g9HWrYTAUoTWrEDIQfx0wSB2ZG+T+Svkxwi4ZpPPr/RdSN24VkVc9ZV2MYKb5lH
	lbacdMZ2SgbGim17+UK/gAVlVEH8tjjFHBNVqbq8IjGVNj914W6WwjeZOsbmDe+5
	wYVK2Ec3MwThhd7bb8lHktSfiDg4T/E2F6/G1KyvTL/mz+vEOe55YrGDSLDLZ0QJ
	d/IvHWV8kW26wGrEfvXAAm0xRT9nKLOV6Udwz4tnJ0+AMNthdmY54jHntI1KVRAE
	1AWVjQGn9bOpmuXt42jMlwu2gQOANr89N2ag38elj53trshzo84kLzyeVpAURaI3
	Z8Us/g==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4vkjm92c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 14:28:10 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2bd5b20aaa6so9688805ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 07:28:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778768889; x=1779373689; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e+wctK5RZ9TRw0ESOwHfyBsEr+rYwllu4QgRLTyrtk0=;
        b=Urxi/C0kwv9W4TkpWSwxWlKIfAp2OEd9Qx+dOOgHkaypQvLq63YrasxzZgNmwHibFf
         NosY12lA+P7MJ+5Atx+fMMe0wPWIlfOkyJN4MHBb1lylX+B461MBQ5/WugLTP2Mn2gwZ
         ne4YDjr4f5RaMBcVdU2Y+DfKHHxRoutBhBWZWPeGQd57BEIsY8HOkkWlyZbOLgs/+tTx
         cKvXWtWWUNPSUVmOQ2HFWMwjZKcHEBqCzPE/g7Pvq5Fn9GW8lbq3n7/zuHP4hKNjfJ5K
         NSrW7wNz+zFDisUKZUkH8kmm177FhKyYT7a6+YkgomyPXl6LVVvQhj6/axse6zYTsFGq
         ljbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778768889; x=1779373689;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=e+wctK5RZ9TRw0ESOwHfyBsEr+rYwllu4QgRLTyrtk0=;
        b=jFtcYCUBJmfd7RurLriS1Y/XUJj5I5QYKmnb6zsrbJP03qMxcpBPSjdNIl3HyXyhqe
         3qaKJUjYT49HBF3sbTbcm2Tlbih3GUZ1f63DTqyl9AQNQPh2gNar1YaqICHvgKXyoN02
         vAbO4f1SfVasAaTYCtwKVPdg1KBLF2jaFcc3ub6+sQr1EwgB+mJYqvBHPFwQOq4IF8cp
         EClMj4UEWSkxhn2iCpnA9k++X1NsdW8c2kTo/xzZTrUxyIMP0Q7RvCSR9V+IjsopbMAG
         e0Dm9/5+6ftDl7rRPB864895T6XmmesFXA2YvY7soDhKOb6T/t2iIBvPQ8KTV1WDwF7d
         ET7Q==
X-Forwarded-Encrypted: i=1; AFNElJ/mC29RhZ7AXYKaMtGqIrbocGwBgKBm+0cwIjVphuMh53Z8WDWLeiJnMhR+C4tO6YvHByIPA4p5OLpW0rDi@vger.kernel.org
X-Gm-Message-State: AOJu0YwMge8s+KAfMVH2+FTbGPPT+7cDvFwj02rv2J7BYHe48Lt28cUL
	gj2txImK5iVczdwhNnN+1m/72anfOButj2DiDJeFZrmX8rUlN3B3j5aCHHm8O6HSkFOuaBVfyZd
	Sa1O7zpBvYMJl2xJbEbr47+KB/GV7AUjuPIb+Gnm2tSYQJrEDzW2m+qtd6Qr8b5VNtlB7
X-Gm-Gg: Acq92OF64VklQ4ZmYddfIFqSo1DXPfEaMHKi4k0v7EEUfgbpaFvj1ABA/TJobYKn18o
	8ZBk2Ops/TAWmsYSWJZGzFevXQFzGFDQnhXeOl3wkgxRqGK0F2/KjJI4ytkiEE9uniUns/LXC7c
	PuIs6NKg4yfwS2qlCF0Wl3kkUHs8QC41mb/teN3GdIExtzsym2pHxEklvwHZS3iGI5ybdWr0HiE
	PYjV814Z218LjOqxB4mhndxzTUrnsqF333jvoXkWO1otWhTTeoORVbfvhE2AO3RHMdNOYmZfaD2
	RDLartYbYRCSVcjRmI1fE62nlyanTVVK/Cl4DUhl1ij2F5/wMnUAprHTJAovg/09k33Aq2bMxeG
	BxcxJkJ7Oy7U69KhdrMuQ6oE104vUdf1D1Jx4w0Y5Bh+aVLKhKSk19ezlOA==
X-Received: by 2002:a17:902:da91:b0:2b2:67ca:5fff with SMTP id d9443c01a7336-2bd275dbdbfmr86312105ad.28.1778768889324;
        Thu, 14 May 2026 07:28:09 -0700 (PDT)
X-Received: by 2002:a17:902:da91:b0:2b2:67ca:5fff with SMTP id d9443c01a7336-2bd275dbdbfmr86311445ad.28.1778768888758;
        Thu, 14 May 2026 07:28:08 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5c05ffbesm28566485ad.27.2026.05.14.07.27.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 07:28:08 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Thu, 14 May 2026 19:55:48 +0530
Subject: [PATCH v22 07/13] power: reset: Add psci-reboot-mode driver
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260514-arm-psci-system_reset2-vendor-reboots-v22-7-28a5bde07483@oss.qualcomm.com>
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
        Srinivas Kandagatla <srini@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778768806; l=5430;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=3BU+OmQY7vwCKgtP7JgVodTFXWx0p5HRBbSXZG9v7s4=;
 b=O+mpM9uK5VeT9kC1EvBdS580IgwUL/WKhmZyQHzqE6bMvpgOGlDCcxQInGtEf9FjtiyLgNt0O
 0ePmlrWLCBEDsrZLPPtYJj3kDH6ciDztOjQttWT3OwntVA9B/fPs4yD
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-GUID: TRZfAUodgkmSmdV1KE5k03xFg6CV97sP
X-Proofpoint-ORIG-GUID: TRZfAUodgkmSmdV1KE5k03xFg6CV97sP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDE0NiBTYWx0ZWRfXwnyizKVSKr10
 EDEE9mYb9KxOpGHa4OuNJa6y6X2OR3dXZdKRJNVpejQH9ipPXpZnRim8ocZ0d/ibwSSYqoNRohk
 FF2VvWbz0iQ6w6qyrh19iZA4pLonbvRscNGbjFY78eqI+hY+4y1T4ic4ssftGT2q2WdguwzKaPU
 vkMMPSn49h2N0u3FUSXD5c2pmReawpsPNytyi7Wl+S9Qm7bD9+AUKp8syWOHsZc9BcfQixWtdPb
 AMRVMCgYhSyIcmT2v3LqJhuDe1cTTUJ4Ah0ta89fypQdxPYszYTumiu8/dU6SQerEj3aXLXG3qG
 ejO+zPS2+19aHLn/7Ae1Pa8HAF61lgQe4OzQnf+Mu/b499eZhMK+dLBFrUfDJstbCYYbb5HktLw
 k8EMRvNEl0O+5t/ZnZkYiydUm8f8jFQtHxvOepphvpjpK/4xvdXXKKP5LvyaAyGIwO6OvKFgxoi
 3tZn9Z8tF0vlt0/rIAw==
X-Authority-Analysis: v=2.4 cv=PbDPQChd c=1 sm=1 tr=0 ts=6a05dbfa cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=5CqnhzuZLWPXzHx0y-cA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_03,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 malwarescore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605140146
X-Rspamd-Queue-Id: 3218D5432A6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107655-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[kernel.org,arm.com,arndb.de,rock-chips.com,gmail.com,linaro.org,ettus.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[36];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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

PSCI supports different types of resets like SYSTEM_RESET, SYSTEM_RESET2
ARCH WARM reset and SYSTEM_RESET2 vendor-specific resets. Currently
there is no common driver that handles all supported psci resets at one
place. Additionally, there is no common mechanism to issue the supported
psci resets from userspace.

Add a psci-reboot-mode driver, and define two types of PSCI resets,
predefined-resets and vendor-specific resets. Predefined-resets are
defined by psci driver and vendor-specific resets are defined by SoC
vendors, under the psci:reboot-mode node of SoC device tree.

Register the driver with the reboot-mode framework to interface these
resets to userspace. When userspace initiates a supported command, pass
the reset arguments to the PSCI driver to enable command-based reset.

This change allows userspace to issue supported PSCI reset commands
using the standard reboot system calls while enabling SoC vendors to
define their specific resets for PSCI.

Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 MAINTAINERS                            |  1 +
 drivers/power/reset/Kconfig            | 10 +++++
 drivers/power/reset/Makefile           |  1 +
 drivers/power/reset/psci-reboot-mode.c | 72 ++++++++++++++++++++++++++++++++++
 4 files changed, 84 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 36ba42209c0b332813a296880cd55798a5592d2a..4b0815c31679550f5ab719de4a5852990c7cc643 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21342,6 +21342,7 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/arm/psci.yaml
 F:	drivers/firmware/psci/
 F:	drivers/mfd/psci-mfd.c
+F:	drivers/power/reset/psci-reboot-mode.c
 F:	include/linux/psci.h
 F:	include/uapi/linux/psci.h
 
diff --git a/drivers/power/reset/Kconfig b/drivers/power/reset/Kconfig
index 124afb99febe92450b6ae322aeed3b63fa2070df..d9d1f768b8691abc3b32f2675519f2ddbaf19b84 100644
--- a/drivers/power/reset/Kconfig
+++ b/drivers/power/reset/Kconfig
@@ -348,6 +348,16 @@ config NVMEM_REBOOT_MODE
 	  then the bootloader can read it and take different
 	  action according to the mode.
 
+config PSCI_REBOOT_MODE
+	bool "PSCI reboot mode driver"
+	depends on OF && ARM_PSCI_FW
+	select REBOOT_MODE
+	help
+	  Say y here will enable PSCI reboot mode driver. This gets
+	  the PSCI reboot mode arguments and passes them to psci
+	  driver. psci driver uses these arguments for issuing
+	  device reset into different boot states.
+
 config POWER_MLXBF
 	tristate "Mellanox BlueField power handling driver"
 	depends on (GPIO_MLXBF2 || GPIO_MLXBF3) && ACPI
diff --git a/drivers/power/reset/Makefile b/drivers/power/reset/Makefile
index d7ae97241a838fe1b536b2f911868e7590d12e3b..02948622fe3d00e165f941108ab92ecb66b0f0e8 100644
--- a/drivers/power/reset/Makefile
+++ b/drivers/power/reset/Makefile
@@ -40,5 +40,6 @@ obj-$(CONFIG_REBOOT_MODE) += reboot-mode.o
 obj-$(CONFIG_SYSCON_REBOOT_MODE) += syscon-reboot-mode.o
 obj-$(CONFIG_POWER_RESET_SC27XX) += sc27xx-poweroff.o
 obj-$(CONFIG_NVMEM_REBOOT_MODE) += nvmem-reboot-mode.o
+obj-$(CONFIG_PSCI_REBOOT_MODE) += psci-reboot-mode.o
 obj-$(CONFIG_POWER_MLXBF) += pwr-mlxbf.o
 obj-$(CONFIG_POWER_RESET_QEMU_VIRT_CTRL) += qemu-virt-ctrl.o
diff --git a/drivers/power/reset/psci-reboot-mode.c b/drivers/power/reset/psci-reboot-mode.c
new file mode 100644
index 0000000000000000000000000000000000000000..845b2a1816ce53451dea8dfc4bffffda0d3e9293
--- /dev/null
+++ b/drivers/power/reset/psci-reboot-mode.c
@@ -0,0 +1,72 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/device.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/psci.h>
+#include <linux/reboot-mode.h>
+#include <linux/types.h>
+
+/*
+ * Predefined modes:
+ *   reset_type = 0
+ *   cookie stored in magic[63:32]
+ */
+#define PSCI_PREDEF_MAGIC(cookie)	((cookie) * BIT_ULL(32))
+
+static const struct reboot_mode_entry psci_resets[] = {
+	{
+		.name  = "psci-system-reset",
+		.magic = PSCI_PREDEF_MAGIC(PSCI_RESET_TYPE_SYSTEM_RESET),
+	},
+	{
+		.name  = "psci-system-reset2-arch-warm-reset",
+		.magic = PSCI_PREDEF_MAGIC(PSCI_RESET_TYPE_SYSTEM_RESET2_ARCH_WARM),
+	},
+};
+
+/*
+ * magic is a pre-encoded value:
+ *   reset_type in low 32 bits
+ *   cookie in high 32 bits
+ */
+static int psci_reboot_mode_write(struct reboot_mode_driver *reboot, u64 magic)
+{
+	psci_set_reset_cmd(magic);
+	return 0;
+}
+
+static int psci_reboot_mode_probe(struct platform_device *pdev)
+{
+	struct reboot_mode_driver *reboot;
+	size_t count;
+	int ret;
+
+	reboot = devm_kzalloc(&pdev->dev, sizeof(*reboot), GFP_KERNEL);
+	if (!reboot)
+		return -ENOMEM;
+
+	reboot_mode_driver_init(reboot, &pdev->dev, psci_reboot_mode_write);
+
+	/* Skip PSCI SYSTEM_RESET2 modes if unsupported */
+	count = psci_has_system_reset2_support() ? ARRAY_SIZE(psci_resets) : 1;
+	ret = reboot_mode_add_predefined_modes(reboot, psci_resets, count);
+	if (ret)
+		return ret;
+
+	return devm_reboot_mode_register(&pdev->dev, reboot);
+}
+
+static struct platform_driver psci_reboot_mode_driver = {
+	.probe  = psci_reboot_mode_probe,
+	.driver = {
+		.name	= "psci-reboot-mode",
+	},
+};
+
+module_platform_driver(psci_reboot_mode_driver);
+
+MODULE_LICENSE("GPL");

-- 
2.34.1


