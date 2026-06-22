Return-Path: <linux-arm-msm+bounces-114037-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id dl7eLuBNOWpIqQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114037-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 16:59:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 21D826B08E2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 16:59:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="DydO/tk+";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=HEryQQ3M;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114037-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114037-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E5AC03084538
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 14:53:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E1543161BF;
	Mon, 22 Jun 2026 14:52:30 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E8893264F6
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 14:52:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782139950; cv=none; b=F7NK++r7zxpMYcddO+h0Swc+vBdOFdL6ynHoNQ/T0OPszm+X147h2SyqDq4W1fIGCl1VRf1MRy2CH7KVrCNar1OnXRGkcpH0AtDoG0fSGvhVaT8a0/UUxNAjMb1ZL/xwNd8Sju5rnrsT34kr41kPVnLVJE5B2IbDbGvQmenLDSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782139950; c=relaxed/simple;
	bh=gtdxpeDCPXJnoqczVLM4bqxIwx5PDjFJLCIseCO6uPI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KTJKpFwWh5pTGRE521HGi3VCZV8+UHWgFg6CT91WmqMRSBrzhrVTh5S+NQvp8yFWiwvw9NemXVUcvtVx9q8Q7L06zkYmOf3lUtddpYaFJ8W+CRn+6xl+EuWCmTgmXpoHYMHeB761HLuqlo091ib0PNU0N5kfeIzM+vfTggYk4YM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DydO/tk+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HEryQQ3M; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65MDFmjp3533433
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 14:52:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V0hnYSsyp9tNtKrK+c49aUINayymi5eAWdZv9/f/PLc=; b=DydO/tk+z+qjYb9n
	GLKgxHPv7VINzreYfuCjQEskDEG4Vh+JUVVJeN4FLiS9NqTS3eCMX6r5MaL4739L
	d2t2fmFo3DkXFrNe653l2vxD2twd7uTEGI9sNWzCPuZEnkDx9asqw/B7LTan5UVH
	g4tKcXcvs1im5NuEmJwtITSL8ftcPgGNvp0tJBDaX51do91gJpXoxsqzqU5oihSk
	TYIz38vzaIr8C19+enQN7hkxf6o6sgNNSpLNJOqfSa/RvNLewx7SUIbINwzQkeuK
	v7gcYxrZTyQZ+IHPZ2kvRq8B2tOe+oLHvRZILVkm3dx6sqsh30M8BeVQ/KDKiILZ
	1VYuSg==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ey2yhrym0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 14:52:27 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1399a989312so376077c88.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 07:52:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782139947; x=1782744747; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V0hnYSsyp9tNtKrK+c49aUINayymi5eAWdZv9/f/PLc=;
        b=HEryQQ3MedakLb23tA5l0TzZVpWPxjif8UYTAfEWpV6wB31XCQEC9m/ufGoz/HhFrB
         jBXQliwmBLYq7O90tistVBoYar6PQlmVqfkkCYaf78wTwJ1OTcZ7jvM+51U1df4XLZQN
         iS/wkXiTccF9MVdH96/e2I8eh2it3bKErskAr0n9l8tnn484A5W68ZT0ixvp52dKRbBg
         meQzkk/OI1LLLQCeR9W6PM09nmkTSoWP+EGPQgODyJLxDDJGxc+AF/lYhV2SYvmnew2U
         WSGxInhYHnWaJyvOMzCk14UI5wMe7yu4N4Emwrb+PA5US460i7MqVhyTqBHTf+rXTTX5
         jb6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782139947; x=1782744747;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=V0hnYSsyp9tNtKrK+c49aUINayymi5eAWdZv9/f/PLc=;
        b=Po+nfjAml8Ggdo8ftyE0Il6kgR53BV2NDGf66mupI9mHYqWPlPMPxrnjpmgtL4kaaS
         lJgD3wxvc3sszWhU6frmGruvaYoJ3aO6nE755x40EHuz0900r3rDFb9TMWQbXo28a69+
         JcHe8C7Goh+Qcjm4EgMyiqwdG6jd2xhHsSyBo4v35Awlk3SNxWIx9X/Fd3bnfBP5dZMi
         FhXPA9RCcJ//DnHfPwgdWnucxXT201QtkshfDCCYOGKhQ4s/ld03R6LyHbMBN8LSvfYd
         eaM86+qqgEITUfrtRJ9jEspYG5CrLiBO4tXtFT1sBtuvvnqhp0d/XAjs2mtIQGOqx6cU
         lb/Q==
X-Forwarded-Encrypted: i=1; AHgh+RoWzb45QnEVQgHcKkAeFzyJ6yiYkxbTmcn4VNPbXC8Q8nKnl4so1oeR2v/fjvoDU7vlr2TGsSvblGEa1r7g@vger.kernel.org
X-Gm-Message-State: AOJu0YxSThzpaT2fzxupQhyX8DsyHWZ9WRxFvI4NdcrHyLnk+pd1cxmw
	1xQmbtRErs+vRK2QQVcSfpKYduJJMZjeDB2QnqsxtGdoD5Fh2WawGzZt3dRPTC6cMSxWgP1EEhK
	DDnpg2eDRIVxPOnKGgPKm7BWZV6DQnESOExxSlaEJKiCCP5ZrFcOgsgrjI4CbUgv+5Cgo
X-Gm-Gg: AfdE7cmq+jZN9hvnP84MmmOdEECum2/ImeuJiVRBrG+D9cpR/Ox8kpE/z15QHYc7P71
	c+A69I/GZoDXVqlWKXHy7ZFbdy7a6cizkX1aLwvpspiHln2FybYozlxCZITAHy/YmnS5C7KNX+6
	cPNHTgT2+Fmi6L8d2ciN0TBwi3E5mqjKJsi25Yw3QVO35Qk4l0Ram8/g9/8JaMSXP0HVTcSd6WV
	S3Dm1Stt58rTwwaPmTmZN09mfkZDxREkdp6XtUAGtSdOBQNfUek1hBEU/CFnL7JMVfcCyDhSTeZ
	fKH57GGlCP4R8CF5lVKqG7JoF+UfeJJokS941ytBTZ8X0/9tVuuDwI//T279t9RGbZGQ6KgSE5Q
	/8xEp5dY4r9L/cByp5mwZ1krSbvEM9Oi3H/527knLMMflMH3Iqkn+VKqZ8Q==
X-Received: by 2002:a05:7300:c86:b0:304:3c33:7afd with SMTP id 5a478bee46e88-30c520988camr220554eec.1.1782139946490;
        Mon, 22 Jun 2026 07:52:26 -0700 (PDT)
X-Received: by 2002:a05:7300:c86:b0:304:3c33:7afd with SMTP id 5a478bee46e88-30c520988camr220526eec.1.1782139945704;
        Mon, 22 Jun 2026 07:52:25 -0700 (PDT)
Received: from hu-zijuhu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c1bddfe34sm12025561eec.20.2026.06.22.07.52.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 07:52:25 -0700 (PDT)
From: Zijun Hu <zijun.hu@oss.qualcomm.com>
Date: Mon, 22 Jun 2026 07:52:24 -0700
Subject: [PATCH 11/13] Bluetooth: btusb: Move struct btusb_data and macros
 into btusb.h
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260622-bt_bugfix-v1-11-11f936d84e72@oss.qualcomm.com>
References: <20260622-bt_bugfix-v1-0-11f936d84e72@oss.qualcomm.com>
In-Reply-To: <20260622-bt_bugfix-v1-0-11f936d84e72@oss.qualcomm.com>
To: Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Ben Young Tae Kim <ytkim@qca.qualcomm.com>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Matthias Kaehlcke <mka@chromium.org>
Cc: Zijun Hu <zijun_hu@icloud.com>, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Luiz Augusto von Dentz <luiz.von.dentz@intel.com>,
        linux-arm-msm@vger.kernel.org, Zijun Hu <zijun.hu@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDE0NyBTYWx0ZWRfX4W0i40FuS8uy
 v4RYus74z/+VekKvBIQnH2PtQTOta2JmbNo+6PeEscGPTcBJxEPFfEbqgwJyUbB21ibD/J6LIgf
 NzPA2B3yWigw3cdXFwvpzMrwIKZYQds=
X-Proofpoint-ORIG-GUID: LTReJoQLpnNSQ5Z9BlbOLsGWFll7ANF6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDE0NyBTYWx0ZWRfX7WkADawvYtn3
 H/5mh92At0kgna/JR6vI7ZQqymypuaPYKNRrRMO8FwzoEOE8bPxE1+BzCf9QyVoQGRt6HxPKC6E
 ZGgYYqAmcKztfdBa/ZU/jXWq3txY1XtzXnyTBhOtMLVWNDpO3EwUwrB23pblKyaDm33W+7IdPeB
 NBrBo92l+dsF0gvespvAI6NCJgd3B7umCmuK9wcblE8SGXkciuRey1gYS6RoL9d+S8+dV/p+XnH
 bXaTlFBrMCmtSoqJLUI5BtNddiXXK+Pj8eqZwzU7i0duEII1RrI+x9kalVRP9K6zcPFSoQh+am+
 w52tzeHj02uT4F5FrDj1y2Ao8Sumduea9NBHYxzRCzSKPE6yQvNsY6YLjsvsq/sAlr9vR4AjeRQ
 ZbRM+Ho3ZR+CO34iIJXE1w/ZSXuvM7MfDzvQVZnhlny0uqfyGEDBIxLRGiWdzP2XpWgTqQc4EuF
 OJPnc1fFGn6wxGTvRHA==
X-Proofpoint-GUID: LTReJoQLpnNSQ5Z9BlbOLsGWFll7ANF6
X-Authority-Analysis: v=2.4 cv=cKbQdFeN c=1 sm=1 tr=0 ts=6a394c2b cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=Dei6p5SHAAAA:8 a=7ErfrF5Y_EYtAn6cJgkA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22 a=M-Yerj1wOn-OpK7r_3ei:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_02,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 suspectscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606220147
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114037-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:marcel@holtmann.org,m:luiz.dentz@gmail.com,m:quic_rjliao@quicinc.com,m:brgl@kernel.org,m:ytkim@qca.qualcomm.com,m:quic_bgodavar@quicinc.com,m:mka@chromium.org,m:zijun_hu@icloud.com,m:linux-bluetooth@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:luiz.von.dentz@intel.com,m:linux-arm-msm@vger.kernel.org,m:zijun.hu@oss.qualcomm.com,m:luizdentz@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[holtmann.org,gmail.com,quicinc.com,kernel.org,qca.qualcomm.com,chromium.org];
	FORGED_SENDER(0.00)[zijun.hu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_CC(0.00)[icloud.com,vger.kernel.org,intel.com,oss.qualcomm.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,holtmann.org:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zijun.hu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 21D826B08E2

btusb.c is growing large as vendor-specific code accumulates. Ideally,
btusb.c contains only the default implementation while vendor-specific
code lives in separate files for easier maintenance.

The newly added btusb.h also reduces unnecessary data copies in hooks
like btusb_mtk_setup().

Signed-off-by: Zijun Hu <zijun.hu@oss.qualcomm.com>
---
 drivers/bluetooth/btusb.c | 119 +--------------------------------------
 drivers/bluetooth/btusb.h | 139 ++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 140 insertions(+), 118 deletions(-)

diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index 21e125db1b1f..0d0bd7b559c6 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -23,6 +23,7 @@
 #include <net/bluetooth/hci_core.h>
 #include <net/bluetooth/hci_drv.h>
 
+#include "btusb.h"
 #include "btintel.h"
 #include "btbcm.h"
 #include "btrtl.h"
@@ -38,36 +39,6 @@ static bool reset = true;
 
 static struct usb_driver btusb_driver;
 
-#define BTUSB_IGNORE			BIT(0)
-#define BTUSB_DIGIANSWER		BIT(1)
-#define BTUSB_CSR			BIT(2)
-#define BTUSB_SNIFFER			BIT(3)
-#define BTUSB_BCM92035			BIT(4)
-#define BTUSB_BROKEN_ISOC		BIT(5)
-#define BTUSB_WRONG_SCO_MTU		BIT(6)
-#define BTUSB_ATH3012			BIT(7)
-#define BTUSB_INTEL_COMBINED		BIT(8)
-#define BTUSB_INTEL_BOOT		BIT(9)
-#define BTUSB_BCM_PATCHRAM		BIT(10)
-#define BTUSB_MARVELL			BIT(11)
-#define BTUSB_SWAVE			BIT(12)
-#define BTUSB_AMP			BIT(13)
-#define BTUSB_QCA_ROME			BIT(14)
-#define BTUSB_BCM_APPLE			BIT(15)
-#define BTUSB_REALTEK			BIT(16)
-#define BTUSB_BCM2045			BIT(17)
-#define BTUSB_IFNUM_2			BIT(18)
-#define BTUSB_CW6622			BIT(19)
-#define BTUSB_MEDIATEK			BIT(20)
-#define BTUSB_WIDEBAND_SPEECH		BIT(21)
-#define BTUSB_INVALID_LE_STATES		BIT(22)
-#define BTUSB_QCA_WCN6855		BIT(23)
-#define BTUSB_INTEL_BROKEN_SHUTDOWN_LED	BIT(24)
-#define BTUSB_INTEL_BROKEN_INITIAL_NCMD BIT(25)
-#define BTUSB_INTEL_NO_WBS_SUPPORT	BIT(26)
-#define BTUSB_ACTIONS_SEMI		BIT(27)
-#define BTUSB_BARROT			BIT(28)
-
 static const struct usb_device_id btusb_table[] = {
 	/* Generic Bluetooth USB device */
 	{ USB_DEVICE_INFO(0xe0, 0x01, 0x01) },
@@ -943,94 +914,6 @@ struct btqca_data {
 	struct qca_dump_info qca_dump;
 };
 
-#define BTUSB_MAX_ISOC_FRAMES	10
-
-#define BTUSB_INTR_RUNNING	0
-#define BTUSB_BULK_RUNNING	1
-#define BTUSB_ISOC_RUNNING	2
-#define BTUSB_SUSPENDING	3
-#define BTUSB_DID_ISO_RESUME	4
-#define BTUSB_BOOTLOADER	5
-#define BTUSB_DOWNLOADING	6
-#define BTUSB_FIRMWARE_LOADED	7
-#define BTUSB_FIRMWARE_FAILED	8
-#define BTUSB_BOOTING		9
-#define BTUSB_DIAG_RUNNING	10
-#define BTUSB_OOB_WAKE_ENABLED	11
-#define BTUSB_HW_RESET_ACTIVE	12
-#define BTUSB_TX_WAIT_VND_EVT	13
-#define BTUSB_WAKEUP_AUTOSUSPEND	14
-#define BTUSB_USE_ALT3_FOR_WBS	15
-#define BTUSB_ALT6_CONTINUOUS_TX	16
-#define BTUSB_HW_SSR_ACTIVE	17
-
-struct btusb_data {
-	struct hci_dev       *hdev;
-	struct usb_device    *udev;
-	struct usb_interface *intf;
-	struct usb_interface *isoc;
-	struct usb_interface *diag;
-	unsigned isoc_ifnum;
-
-	unsigned long flags;
-
-	bool poll_sync;
-	int intr_interval;
-	struct work_struct  work;
-	struct work_struct  waker;
-	struct delayed_work rx_work;
-
-	struct sk_buff_head acl_q;
-
-	struct usb_anchor deferred;
-	struct usb_anchor tx_anchor;
-	int tx_in_flight;
-	spinlock_t txlock;
-
-	struct usb_anchor intr_anchor;
-	struct usb_anchor bulk_anchor;
-	struct usb_anchor isoc_anchor;
-	struct usb_anchor diag_anchor;
-	struct usb_anchor ctrl_anchor;
-	spinlock_t rxlock;
-
-	struct sk_buff *evt_skb;
-	struct sk_buff *acl_skb;
-	struct sk_buff *sco_skb;
-
-	struct usb_endpoint_descriptor *intr_ep;
-	struct usb_endpoint_descriptor *bulk_tx_ep;
-	struct usb_endpoint_descriptor *bulk_rx_ep;
-	struct usb_endpoint_descriptor *isoc_tx_ep;
-	struct usb_endpoint_descriptor *isoc_rx_ep;
-	struct usb_endpoint_descriptor *diag_tx_ep;
-	struct usb_endpoint_descriptor *diag_rx_ep;
-
-	struct gpio_desc *reset_gpio;
-
-	__u8 cmdreq_type;
-	__u8 cmdreq;
-
-	unsigned int sco_num;
-	unsigned int air_mode;
-	bool usb_alt6_packet_flow;
-	int isoc_altsetting;
-	int suspend_count;
-	const struct usb_device_id *match_id;
-
-	int (*recv_event)(struct hci_dev *hdev, struct sk_buff *skb);
-	int (*recv_acl)(struct hci_dev *hdev, struct sk_buff *skb);
-	int (*recv_bulk)(struct btusb_data *data, void *buffer, int count);
-
-	int (*setup_on_usb)(struct hci_dev *hdev);
-
-	int (*suspend)(struct hci_dev *hdev);
-	int (*resume)(struct hci_dev *hdev);
-	int (*disconnect)(struct hci_dev *hdev);
-
-	int oob_wake_irq;   /* irq for out-of-band wake-on-bt */
-};
-
 static void btusb_reset(struct hci_dev *hdev)
 {
 	struct btusb_data *data;
diff --git a/drivers/bluetooth/btusb.h b/drivers/bluetooth/btusb.h
new file mode 100644
index 000000000000..ad13c7d44836
--- /dev/null
+++ b/drivers/bluetooth/btusb.h
@@ -0,0 +1,139 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ *
+ *  Generic Bluetooth USB driver
+ *
+ *  Copyright (C) 2005-2008  Marcel Holtmann <marcel@holtmann.org>
+ */
+
+#ifndef __BTUSB_H
+#define __BTUSB_H
+
+#include <linux/usb.h>
+#include <linux/skbuff.h>
+#include <linux/workqueue.h>
+#include <linux/spinlock.h>
+#include <linux/gpio/consumer.h>
+#include <net/bluetooth/hci_core.h>
+
+/* driver_info flags */
+#define BTUSB_IGNORE			BIT(0)
+#define BTUSB_DIGIANSWER		BIT(1)
+#define BTUSB_CSR			BIT(2)
+#define BTUSB_SNIFFER			BIT(3)
+#define BTUSB_BCM92035			BIT(4)
+#define BTUSB_BROKEN_ISOC		BIT(5)
+#define BTUSB_WRONG_SCO_MTU		BIT(6)
+#define BTUSB_ATH3012			BIT(7)
+#define BTUSB_INTEL_COMBINED		BIT(8)
+#define BTUSB_INTEL_BOOT		BIT(9)
+#define BTUSB_BCM_PATCHRAM		BIT(10)
+#define BTUSB_MARVELL			BIT(11)
+#define BTUSB_SWAVE			BIT(12)
+#define BTUSB_AMP			BIT(13)
+#define BTUSB_QCA_ROME			BIT(14)
+#define BTUSB_BCM_APPLE			BIT(15)
+#define BTUSB_REALTEK			BIT(16)
+#define BTUSB_BCM2045			BIT(17)
+#define BTUSB_IFNUM_2			BIT(18)
+#define BTUSB_CW6622			BIT(19)
+#define BTUSB_MEDIATEK			BIT(20)
+#define BTUSB_WIDEBAND_SPEECH		BIT(21)
+#define BTUSB_INVALID_LE_STATES		BIT(22)
+#define BTUSB_QCA_WCN6855		BIT(23)
+#define BTUSB_INTEL_BROKEN_SHUTDOWN_LED	BIT(24)
+#define BTUSB_INTEL_BROKEN_INITIAL_NCMD BIT(25)
+#define BTUSB_INTEL_NO_WBS_SUPPORT	BIT(26)
+#define BTUSB_ACTIONS_SEMI		BIT(27)
+#define BTUSB_BARROT			BIT(28)
+
+#define BTUSB_MAX_ISOC_FRAMES	10
+
+/* btusb_data flags */
+#define BTUSB_INTR_RUNNING	0
+#define BTUSB_BULK_RUNNING	1
+#define BTUSB_ISOC_RUNNING	2
+#define BTUSB_SUSPENDING	3
+#define BTUSB_DID_ISO_RESUME	4
+#define BTUSB_BOOTLOADER	5
+#define BTUSB_DOWNLOADING	6
+#define BTUSB_FIRMWARE_LOADED	7
+#define BTUSB_FIRMWARE_FAILED	8
+#define BTUSB_BOOTING		9
+#define BTUSB_DIAG_RUNNING	10
+#define BTUSB_OOB_WAKE_ENABLED	11
+#define BTUSB_HW_RESET_ACTIVE	12
+#define BTUSB_TX_WAIT_VND_EVT	13
+#define BTUSB_WAKEUP_AUTOSUSPEND	14
+#define BTUSB_USE_ALT3_FOR_WBS	15
+#define BTUSB_ALT6_CONTINUOUS_TX	16
+#define BTUSB_HW_SSR_ACTIVE	17
+
+struct btusb_data {
+	struct hci_dev       *hdev;
+	struct usb_device    *udev;
+	struct usb_interface *intf;
+	struct usb_interface *isoc;
+	struct usb_interface *diag;
+	unsigned int isoc_ifnum;
+
+	unsigned long flags;
+
+	bool poll_sync;
+	int intr_interval;
+	struct work_struct  work;
+	struct work_struct  waker;
+	struct delayed_work rx_work;
+
+	struct sk_buff_head acl_q;
+
+	struct usb_anchor deferred;
+	struct usb_anchor tx_anchor;
+	int tx_in_flight;
+	spinlock_t txlock;
+
+	struct usb_anchor intr_anchor;
+	struct usb_anchor bulk_anchor;
+	struct usb_anchor isoc_anchor;
+	struct usb_anchor diag_anchor;
+	struct usb_anchor ctrl_anchor;
+	spinlock_t rxlock;
+
+	struct sk_buff *evt_skb;
+	struct sk_buff *acl_skb;
+	struct sk_buff *sco_skb;
+
+	struct usb_endpoint_descriptor *intr_ep;
+	struct usb_endpoint_descriptor *bulk_tx_ep;
+	struct usb_endpoint_descriptor *bulk_rx_ep;
+	struct usb_endpoint_descriptor *isoc_tx_ep;
+	struct usb_endpoint_descriptor *isoc_rx_ep;
+	struct usb_endpoint_descriptor *diag_tx_ep;
+	struct usb_endpoint_descriptor *diag_rx_ep;
+
+	struct gpio_desc *reset_gpio;
+
+	__u8 cmdreq_type;
+	__u8 cmdreq;
+
+	unsigned int sco_num;
+	unsigned int air_mode;
+	bool usb_alt6_packet_flow;
+	int isoc_altsetting;
+	int suspend_count;
+	const struct usb_device_id *match_id;
+
+	int (*recv_event)(struct hci_dev *hdev, struct sk_buff *skb);
+	int (*recv_acl)(struct hci_dev *hdev, struct sk_buff *skb);
+	int (*recv_bulk)(struct btusb_data *data, void *buffer, int count);
+
+	int (*setup_on_usb)(struct hci_dev *hdev);
+
+	int (*suspend)(struct hci_dev *hdev);
+	int (*resume)(struct hci_dev *hdev);
+	int (*disconnect)(struct hci_dev *hdev);
+
+	int oob_wake_irq;   /* irq for out-of-band wake-on-bt */
+};
+
+#endif /* __BTUSB_H */

-- 
2.34.1


