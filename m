Return-Path: <linux-arm-msm+bounces-98316-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0HkIOkwlumk3SAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98316-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 05:08:44 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BCB42B5B46
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 05:08:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EDD6F30C453C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 04:07:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AB4F33D4FD;
	Wed, 18 Mar 2026 04:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TjhtNSGq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d69wqIVp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECAEF33AD8B
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 04:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773806835; cv=none; b=gbAe+u0EyO8/K/m0kGDqrRL0R2jSJpQGP+KtoZePdsw0QU+4qZ86Krcia536UslpYNqJDOXXdGTF1KgW/T2d7Kv3YvoOGrQYAba13IKE7XPsFjY077n5GeXQdQw7HYG+U2BJsJIh4CvBdip/XALo/ZIkzFd3t9joUciK7+ukqdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773806835; c=relaxed/simple;
	bh=GPwqLap2AqjKntszJyBQlnZUONIvKyOQb2B8o5DQIok=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jj//QofTZcmD4fvX8F3PXPPW846RntuDIzwxEoPfF96+nXOHHuhF9iv42g0tA9X0WUiqtcjg4GX3QtoTDyjtG5/nRNx5zWdN/AxfNODMz7kAlaXTLFuRvGp1j6O9KpvBifqSPE0+qDTvAT1u1QjREJPfvDnO5k4ykDuQJ2XKSCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TjhtNSGq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d69wqIVp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62I3FHkB402541
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 04:07:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=OS56w3hHM0d
	LLz07kLbPeAZUVB3ZNANQNMn7opENYkc=; b=TjhtNSGq6WSwTVIF6CxwHJfSAeI
	VN7HIFjZweDUvahIxi6QxnNXoJSa/1MDBzIRLggRbRFPCF79Lhsn63Km4foXYJm+
	ElGA4DnpTJ2UI8uKXtzuvrdo/wamgG2Gx5SmWSiEQoni8SHxLZ+Jl+xBfFgJC0UC
	6p51RFwNunpTuEUIZAq/asIkV6QazPWahdHtOf8a2JVI7Dg4LkiKLVmHnXmON4RP
	1y8fB8amtfjSh7z5CFxY+8k4gMWbhXsvbDYyohYei1Q0edzyy+6zUeD+L2jsnZcJ
	ykNEfge3isCK2ht026wrOEpgoWXUBTIO1E1GM4Mso+6VZugm5kREHoHMHFw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyc4dsvfc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 04:07:12 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b0554888cfso45873895ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 21:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773806832; x=1774411632; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OS56w3hHM0dLLz07kLbPeAZUVB3ZNANQNMn7opENYkc=;
        b=d69wqIVpUvp9tGwEM4EFLCCG2Pc1C4Sgb1Kcct6D1nNaFfqt1gmt5Vvt88WHb0ZLV+
         buP+9EbOixDAhxLeX4qBTvPKscewoLHKzF/giTv++9AP5ouYKxsk2K4ywuc0RLRc5Pme
         CuCH+zlwaukOwI2DhT/cCSWvodYXKAcx0mjxa41BBhYZw8x/Pq/3mBuUj98aikpj9sVU
         Z/XUVPgWT/ZHrVAYVz/yywWD6KFHls26Ok9sTDGhb35kkLxrJUErUFYUGeOKNywWda0l
         aalypKdlN6WtZ8igGN6fY7y+t6x8DsT97heScY3SU4t8A0nAE2RMz+8FPUkfx5bSa0hN
         iaOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773806832; x=1774411632;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OS56w3hHM0dLLz07kLbPeAZUVB3ZNANQNMn7opENYkc=;
        b=lMPYiKRIA9X8cq23ssH0/iaDPQbprCCfj4KK4uplrvsDvx87L5W+DH9eVP1FN04OSK
         fH0piDlfE2jbpXCugULHvg04N7RPtYmhQhqkqs02tUs5d8Vi/yE73ck0UWgCdwwsA0kX
         nRqnC7tSE0ewXRjv89ZNNCbSLMpsB2f48BYGlOQU3v366iymtTzGT+QPKvVdMrY0UKjR
         MpeIZ7Dx/pyd/25/tPNda8bjmYUADUtnO/mXyEPOD83xD7gXhiB2dD+d7dYbf5d3dgKP
         xfe9hOiHUEqim1gg9+sRyw0kuIYFwvw1u4XlkqgQ9whzO4AuiAZY8VG9cl4weORtMT+P
         Li1Q==
X-Forwarded-Encrypted: i=1; AJvYcCUmZJ0A0fxSUOuFQ6DSP9l1nz+u5b1Cn8Pa5yd1+ecNizluEUHZDQKd6+nMCfU0WmKNXv2FplTdscIN1ja5@vger.kernel.org
X-Gm-Message-State: AOJu0YxcsZUXroP5Ubw/v6Su/6oMesh9qvnXSpTdwphSsdCNLYWWJavv
	l4wSJ4LFbDubMYeKR+nBbpPOWSOCD++7kEFGQpewribc8wLqoJ8fGVRI6D2PrCUt7ZUjfPEnudm
	xO10eaefhPbZR/KDxfL4Q5DejxhATvn+5bwd4/v9bsaEumxGhOzyYcTpvRhuTM8k75Vuz
X-Gm-Gg: ATEYQzy2pbF8xYvvyvl2SDSD8FMgg0wr01yQ44IG1YJqge/OyW9htyUwmChKZgjPAQs
	hG0xjIyURbd0Uv8i8k0DxRf+lwYDsd0FvD+QWOx7t6B03ZGy3jGOoXnNgREgEdZTA1N4i+/cXJV
	jzR5ZY/GSV0S0heOfhv0hQ6jTw/niGt75uUCV2dhsVGWvoCLXjNO2kkruiUd3zcv9zloAwzL9lP
	o1i62v6k5PFOnMUs9GMLAIxWCKLb1Vy8mVvKhtAdMRV8t/nw2+9bi4GQuTMS8gVPpLX2KQO8zQp
	XdanYbqaa9YB4OeBGKXa5bn05N5wE7SupPENkYZzfHbqlkm5k5utIVSe4lx+Az5ZULmZY2b+9cM
	24zkEBQz7Jj2/eQAKArpzjJPzqEWhgCzmbVXpwEyxXGPJx1DTQgG0bkE=
X-Received: by 2002:a17:903:984:b0:2b0:55cf:5e9c with SMTP id d9443c01a7336-2b06e394ab3mr18956985ad.30.1773806831705;
        Tue, 17 Mar 2026 21:07:11 -0700 (PDT)
X-Received: by 2002:a17:903:984:b0:2b0:55cf:5e9c with SMTP id d9443c01a7336-2b06e394ab3mr18956645ad.30.1773806831238;
        Tue, 17 Mar 2026 21:07:11 -0700 (PDT)
Received: from hu-swatagar-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b06e5f12cesm10243425ad.41.2026.03.17.21.07.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 21:07:10 -0700 (PDT)
From: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Icenowy Zheng <uwu@icenowy.me>,
        Matthias Kaehlcke <mka@chromium.org>,
        Mike Looijmans <mike.looijmans@topic.nl>,
        Pin-yen Lin <treapking@chromium.org>,
        Chaoyi Chen <chaoyi.chen@rock-chips.com>,
        =?UTF-8?q?J=20=2E=20Neusch=C3=A4fer?= <j.ne@posteo.net>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Swati Agarwal <swati.agarwal@oss.qualcomm.com>
Subject: [PATCH v6 2/4] usb: misc: onboard_usb_hub: Add Genesys Logic GL3590 hub support
Date: Wed, 18 Mar 2026 09:36:42 +0530
Message-Id: <20260318040644.3591478-3-swati.agarwal@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260318040644.3591478-1-swati.agarwal@oss.qualcomm.com>
References: <20260318040644.3591478-1-swati.agarwal@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDAzMiBTYWx0ZWRfX4cRy/AvwngPw
 oGgKTLTDNiPcpYxzEwK8BKhIiGRaTfeZ8elmsosWYZuUdBoqGhENK03oQmtmBTJchMAjpBCyPYS
 s0UOXCHlNeKpYfD6CReyKzQNIVOsp4TRDyKuDdGUD7tBruYqga3GiDoD/2Q7oGSvsQLewaHXX6u
 5pe3i7regt+z7Po5rEDYArHBLtjTBEpsIiIQh08EUKcEIyVwi8l6G1cfCCAgUefFSzJLtOYwM7q
 uvQilmk7qTLndrHv7hdxIow0FJkr1+68YOi6oH9hPyrKPmgR6TtJYU9EipdZtS1aXRkx3vPC2WQ
 6qG5VlbX26xZ1O1l7gUopsDH3uwe3TQOBT2HSHKfriUcjhjn/BBqaqb1weq9w4pVJJdOcl251KU
 U8xttBgR6BnxWN7AapyK9+XiLiRMWgZUvxFjDajwsiL/xfqurhytfmZYJprZRLgmRev9d4v65rV
 Evr6rA0Guc93KWLckkA==
X-Proofpoint-GUID: bBoiQ-6hhUgEjFBRl9l1T95RBfo6NO3R
X-Authority-Analysis: v=2.4 cv=DfQaa/tW c=1 sm=1 tr=0 ts=69ba24f0 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=OYpQ5T_13xl2kP2VnJ8A:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: bBoiQ-6hhUgEjFBRl9l1T95RBfo6NO3R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_05,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 clxscore=1015 spamscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603180032
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98316-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[swati.agarwal@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5BCB42B5B46
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add support for the GL3590 4 ports USB3.2 hub.

Signed-off-by: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
---
 drivers/usb/misc/onboard_usb_dev.c | 1 +
 drivers/usb/misc/onboard_usb_dev.h | 8 ++++++++
 2 files changed, 9 insertions(+)

diff --git a/drivers/usb/misc/onboard_usb_dev.c b/drivers/usb/misc/onboard_usb_dev.c
index ba37eb99efba..b52dafeefcda 100644
--- a/drivers/usb/misc/onboard_usb_dev.c
+++ b/drivers/usb/misc/onboard_usb_dev.c
@@ -661,6 +661,7 @@ static const struct usb_device_id onboard_dev_id_table[] = {
 	{ USB_DEVICE(VENDOR_ID_GENESYS, 0x0608) }, /* Genesys Logic GL850G USB 2.0 HUB */
 	{ USB_DEVICE(VENDOR_ID_GENESYS, 0x0610) }, /* Genesys Logic GL852G USB 2.0 HUB */
 	{ USB_DEVICE(VENDOR_ID_GENESYS, 0x0620) }, /* Genesys Logic GL3523 USB 3.1 HUB */
+	{ USB_DEVICE(VENDOR_ID_GENESYS, 0x0625) }, /* Genesys Logic GL3590 USB 3.2 HUB */
 	{ USB_DEVICE(VENDOR_ID_MICROCHIP, 0x2412) }, /* USB2412 USB 2.0 HUB */
 	{ USB_DEVICE(VENDOR_ID_MICROCHIP, 0x2514) }, /* USB2514B USB 2.0 HUB */
 	{ USB_DEVICE(VENDOR_ID_MICROCHIP, 0x2517) }, /* USB2517 USB 2.0 HUB */
diff --git a/drivers/usb/misc/onboard_usb_dev.h b/drivers/usb/misc/onboard_usb_dev.h
index 35d15b034664..15fcf3ff2031 100644
--- a/drivers/usb/misc/onboard_usb_dev.h
+++ b/drivers/usb/misc/onboard_usb_dev.h
@@ -108,6 +108,13 @@ static const struct onboard_dev_pdata genesys_gl852g_data = {
 	.is_hub = true,
 };
 
+static const struct onboard_dev_pdata genesys_gl3590_data = {
+	.reset_us = 50,
+	.num_supplies = 2,
+	.supply_names = { "vdd", "vdd12" },
+	.is_hub = true,
+};
+
 static const struct onboard_dev_pdata usb_a_conn_data = {
 	.num_supplies = 1,
 	.supply_names = { "vbus" },
@@ -153,6 +160,7 @@ static const struct of_device_id onboard_dev_match[] = {
 	{ .compatible = "usb5e3,608", .data = &genesys_gl850g_data, },
 	{ .compatible = "usb5e3,610", .data = &genesys_gl852g_data, },
 	{ .compatible = "usb5e3,620", .data = &genesys_gl852g_data, },
+	{ .compatible = "usb5e3,625", .data = &genesys_gl3590_data, },
 	{ .compatible = "usb5e3,626", .data = &genesys_gl852g_data, },
 	{ .compatible = "usbbda,179", .data = &realtek_rtl8188etv_data, },
 	{ .compatible = "usbbda,411", .data = &realtek_rts5411_data, },
-- 
2.34.1


