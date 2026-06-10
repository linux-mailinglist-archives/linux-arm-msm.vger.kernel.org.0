Return-Path: <linux-arm-msm+bounces-112291-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5lZtOxL8KGroOQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112291-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 07:54:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 61731666057
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 07:54:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=l9+GZBpd;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=RzgLYtxx;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112291-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112291-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4ABA6313331E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 05:52:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AFA93438B7;
	Wed, 10 Jun 2026 05:52:57 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 998621465B4
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 05:52:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781070777; cv=none; b=DMUBz+c7kbZDNHyfFbthI7d8Svjewrk0wcx1ht2k8QUMg4hBMW2j+nDbLOtkwKgJWOUGQ3fiB2xtOWY8Dsfgy8SsIZc5Sky4zLNGg+5VO6DgI0pFMkDwCIJN8QknoFAlKxiFxgwT3bDQc6fkWIrwboz/GXL+HonzX8VoUvradaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781070777; c=relaxed/simple;
	bh=SCb5JdpwwyhuPYxgnCpTsUjM/m5K7yjby9KZ/2wyEu4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YDRlMBxeJdFYDq1JPVrJQMTEUTvhS+zXvTaKdIgbit4a7Uc8ou/vKkQVoCYCnZvMwhitO9g83aaez66wnr+18UK1nkyEU/NOulq4nyaNW34dmSkJWNYwvwAOod5I6gFIKX5Plyds4ZIryY/ZvDRdYD9vF6s0JyiKTWWVYmtu9oE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l9+GZBpd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RzgLYtxx; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A2ehxJ3999688
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 05:52:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0RaNe1EFZcr7pe+M0opguIhKZAP/A4Gj9NbfkvE3bNQ=; b=l9+GZBpdx/IMyHBt
	oFftq8PD5DcOfIhMxdf1Z7e5J4ZlvqG4xwUB8L2eqq3G0+ecexO9MZX36G7aaXrM
	JZVeRc9EWCR9tIgGs3rDrpyHZAkP/ypEaclwXn+gkQIS23aFzQBMtu5tg87CTiNA
	aqPQgLB8wSFpbFI+XBxbXGP+e4OzE5+NhZDpkqjr1LGaGYqh0ZBkVye7RXILmd87
	/ET3kQ7JoLfWhZG0IoGZbDTTmwFdY5sbO1/vA/QCN6ZAMY0NU6+U+gcH1i9SIrzy
	25mJTbIspTi/UUiGI01eSSU0gQIoZSDjKzQsmBCGyO8iOl2dIvfUGYt7u7KK2kll
	X7lxvQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epxuvgnua-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 05:52:54 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c0c36f1cc0so117808885ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 22:52:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781070774; x=1781675574; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0RaNe1EFZcr7pe+M0opguIhKZAP/A4Gj9NbfkvE3bNQ=;
        b=RzgLYtxx0gmymb4D0hjM0poH95J8mYK0s7rxuI7YDbpQg+CSFYiM1QA19DyM96JbtN
         7XTT1XV7JOhzjBCPH7d2T/tIeP4uCNEnvTi4j6Dv+FUU3yK/ez7Q0wQYWSKzyQwzg5vn
         JJ1/5k1vB8aplcXsVES0V5Ya4jFIDwZOoeSEqnPSrmfRqW8jR6ptdmTdbVaLAlulWLIR
         GPWZu3kehiiT4unBQo8o3lWh2arYpj+3lM+7U6vZWcNRuO6VCS7t2HM9EvEvBy9hiS0u
         aIkwcotGuCCfcj7BaxlVIcg7hk3cwzxwYqr/TSq+GYqYm2MPwwEg+vuFjT9PSg4N7tQb
         cT8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781070774; x=1781675574;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0RaNe1EFZcr7pe+M0opguIhKZAP/A4Gj9NbfkvE3bNQ=;
        b=OkTLkERqj3sjMEvJOLGIHNsNfdOku1+0cvBRB8ssIPb0rAmae24xXW21g3+7ZOtTYh
         FUa+QsqM4bkcLOR7vBE+JxLa6ZREB1UcdswS5y41xIrBZN7OTximd/P7XuAMr+bIdiaB
         1jOFtyM1yjXRQO7uzLldIyxD5gBp9PeaqOthsc1gDj48nkEqsMvtUEd0ajDkUgZL9sHm
         mzwXjR2Pwcp2C7daxd47Dzu9sttdisW4BTVEj8oHWXxz6nGpG9jRe53g+VK9iJs5eXaA
         ghsKeEdHAZdKWm6s4MCKxzdXxUuJHztcMB/fGLSEZeGnuXj6mGGe5v/ohAqqf4c75olr
         Xevw==
X-Forwarded-Encrypted: i=1; AFNElJ+gz0YSgVqeUemm0PVyKKZcqL/MnexlTZEyoiRwzHMxe/KxFE5EIK2rC3h4bGs0zdjzQwEDv5pRwD9Dov2v@vger.kernel.org
X-Gm-Message-State: AOJu0YxQnDNYIg/T+w5drZdECkZ3BIZA07ROpG8IFm+aL2TWBBunfSWG
	YVv7h+6FYcooziJ57BDmEz4tAKBffmqVxs6wObsl31Rbtwp7qXFju2KJR/bGje8hs1Vw0wBH5Sa
	v7JhJ6BB3fGvSSe39BYyyLQTYy7Ex3cIbhiZuCVqFZyoQeMToKGbcZbcg0pNQ9NB6sl0h
X-Gm-Gg: Acq92OEXlKwYx/iZPvnfeEcD6Sat237IJbpwuUrX2ybS/qC08U5H1G0bSdKdmepDC18
	A65Rg3ypmFdhsgbW8rsQDct1IirrV3uWvZwRoq+Cqa8YMjzwXi9PUuCoca9fGaKoHYm6i20F7Dk
	65sF1hbfE/8pc02ICdx54nk/yWraXA35PKJvC8XlqC6NdVPzjaCIL8VC1dUb6tafm3yDcp8Hv7f
	5/u+Ym/fWG330fHxsQHwvcTao+Kt4NUmytn9L8bJAu1/l88TFt4162pmNzOQOnH62sr2IZq7dQY
	Tq42aPYsuun72byZO6BqgihE/aBvTfLMTytiwzFjZAz+HEXeKRwA/0CTH0EqbcTjQ+e/9gbWUsV
	cLEjqz7SZzBm/yQ78Dhpi38APxDQz2TVZ6MoC+dgukPZ675v9uepdXVVn6g==
X-Received: by 2002:a17:903:3c48:b0:2c0:eee2:fc40 with SMTP id d9443c01a7336-2c1e80cede0mr273610965ad.3.1781070774275;
        Tue, 09 Jun 2026 22:52:54 -0700 (PDT)
X-Received: by 2002:a17:903:3c48:b0:2c0:eee2:fc40 with SMTP id d9443c01a7336-2c1e80cede0mr273610625ad.3.1781070773718;
        Tue, 09 Jun 2026 22:52:53 -0700 (PDT)
Received: from hu-sumk-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c24edc8acasm108601105ad.45.2026.06.09.22.52.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 22:52:52 -0700 (PDT)
From: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 11:22:27 +0530
Subject: [PATCH v3 3/3] bus: mhi: ep: clients: Add loopback driver for data
 path testing
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-loopback_mhi-v3-3-a733c0cef61a@oss.qualcomm.com>
References: <20260610-loopback_mhi-v3-0-a733c0cef61a@oss.qualcomm.com>
In-Reply-To: <20260610-loopback_mhi-v3-0-a733c0cef61a@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sumit Kumar <sumit.kumar@oss.qualcomm.com>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781070762; l=7042;
 i=sumit.kumar@oss.qualcomm.com; s=20250409; h=from:subject:message-id;
 bh=SCb5JdpwwyhuPYxgnCpTsUjM/m5K7yjby9KZ/2wyEu4=;
 b=uHKlPIIHk3sZ4Hmksb0hNEK7d4tgAZm1RgXWtX6c2UdT7jJUFFaUDZFI1Q2z5NWZYDHVbSfGt
 UtwoUNsfsgiCum+DK0gpzhlckCvp6o1CGkxhrIezi+7PqQDrZBfg7/m
X-Developer-Key: i=sumit.kumar@oss.qualcomm.com; a=ed25519;
 pk=3cys6srXqLACgA68n7n7KjDeM9JiMK1w6VxzMxr0dnM=
X-Proofpoint-GUID: YMJGEeoXtnNGkioUozWZoqFiff8PJUll
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDA1MiBTYWx0ZWRfX91/rC2sZb5WF
 xB60BVaqb9vBHO5pulj6wjzJkTWOMhL4wfL6NrKhIOTS+on7B5bYxCk6DUajWtv8WNyMUt0mUHU
 yjVlwbTz2eHemIMX0solcctvglFqfjlkn2+wwdmq/Q4CLQkmGF4WR6vVM65Y0/ttkAjfvMI5hJS
 H5AWXSHT0o4z31xKM/rJ+iuDrlNS0goTi6+EwrQdeEYo2JffLpF/DgN6bAX/2H4YTr9JuCWdrEW
 TIOt0vwYEESp9jYSA6LP2RZsxnxW9N5tEX30f36R4mluuATu8debREdxhC8St3Ti0Trhx5fxccz
 SY/+hU+LOvczyExiYu9pwteXv7BFQj2vy1sp/XHBsbmJcAFPdylj0QALPjR0lIlDTs8tdRfqzr2
 xrbhI54vDc43Kd9R32ztPf9aiM0y494fCTdmDAiXPup/KZUH71do9LnvHsvAivcNo7aTdaUOqdd
 hlPkUHzyTmyaLzTe3zw==
X-Authority-Analysis: v=2.4 cv=Co+PtH4D c=1 sm=1 tr=0 ts=6a28fbb7 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=F9PWhn0UeK7EsyOwsFYA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: YMJGEeoXtnNGkioUozWZoqFiff8PJUll
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100052
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112291-lists,linux-arm-msm=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:mani@kernel.org,m:mhi@lists.linux.dev,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:sumit.kumar@oss.qualcomm.com,m:krishna.chundru@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[sumit.kumar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sumit.kumar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 61731666057

When an MHI endpoint device runs Linux, there is no firmware to implement
the LOOPBACK channel echo that real modem firmware provides. Without an
endpoint-side driver, the host loopback test has no software echo partner
and cannot exercise the full end-to-end MHI data path.

Add an endpoint-side loopback driver that binds to the LOOPBACK channel and
echoes received data back to the host. An ordered workqueue is used for
asynchronous processing to preserve packet ordering. Together with the
host-side loopback driver, this enables complete MHI data path validation
for Linux-based endpoint devices.

Co-developed-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Signed-off-by: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
---
 drivers/bus/mhi/ep/Kconfig            |   2 +
 drivers/bus/mhi/ep/Makefile           |   1 +
 drivers/bus/mhi/ep/clients/Kconfig    |  16 +++++
 drivers/bus/mhi/ep/clients/Makefile   |   2 +
 drivers/bus/mhi/ep/clients/loopback.c | 122 ++++++++++++++++++++++++++++++++++
 5 files changed, 143 insertions(+)

diff --git a/drivers/bus/mhi/ep/Kconfig b/drivers/bus/mhi/ep/Kconfig
index 90ab3b040672e0f04181d4802e3062afcc7cf782..9edb81b39890e093a51138465a4d7705767eafa5 100644
--- a/drivers/bus/mhi/ep/Kconfig
+++ b/drivers/bus/mhi/ep/Kconfig
@@ -8,3 +8,5 @@ config MHI_BUS_EP
 
 	  MHI_BUS_EP implements the MHI protocol for the endpoint devices,
 	  such as SDX55 modem connected to the host machine over PCIe.
+
+source "drivers/bus/mhi/ep/clients/Kconfig"
diff --git a/drivers/bus/mhi/ep/Makefile b/drivers/bus/mhi/ep/Makefile
index aad85f180b707fb997fcb541837eda9bbbb67437..ab36ef2a40ab8174e5ddae44a3e6ccb8eb31168d 100644
--- a/drivers/bus/mhi/ep/Makefile
+++ b/drivers/bus/mhi/ep/Makefile
@@ -1,2 +1,3 @@
 obj-$(CONFIG_MHI_BUS_EP) += mhi_ep.o
 mhi_ep-y := main.o mmio.o ring.o sm.o
+obj-y += clients/
diff --git a/drivers/bus/mhi/ep/clients/Kconfig b/drivers/bus/mhi/ep/clients/Kconfig
new file mode 100644
index 0000000000000000000000000000000000000000..4cf27184058ca2be020885b6f57b4cc44b5054b6
--- /dev/null
+++ b/drivers/bus/mhi/ep/clients/Kconfig
@@ -0,0 +1,16 @@
+# SPDX-License-Identifier: GPL-2.0
+
+config MHI_BUS_EP_LOOPBACK
+	tristate "MHI Endpoint LOOPBACK client driver"
+	depends on MHI_BUS_EP
+	help
+	  MHI Endpoint LOOPBACK client driver that binds to the MHI LOOPBACK
+	  channel as defined in the MHI specification. The LOOPBACK channel is
+	  implemented by MHI-based endpoint devices (modems, WLAN) in the field,
+	  where the endpoint firmware echoes back whatever the host sends.
+
+	  This driver receives data on the uplink channel and echoes it back on
+	  the downlink channel for testing the MHI endpoint data path.
+
+	  To compile this driver as a module, choose M here. The module
+	  will be called mhi_ep_loopback.
diff --git a/drivers/bus/mhi/ep/clients/Makefile b/drivers/bus/mhi/ep/clients/Makefile
new file mode 100644
index 0000000000000000000000000000000000000000..71dc91cc63b02592b177cf66db6090748c0653a6
--- /dev/null
+++ b/drivers/bus/mhi/ep/clients/Makefile
@@ -0,0 +1,2 @@
+obj-$(CONFIG_MHI_BUS_EP_LOOPBACK) += mhi_ep_loopback.o
+mhi_ep_loopback-y += loopback.o
diff --git a/drivers/bus/mhi/ep/clients/loopback.c b/drivers/bus/mhi/ep/clients/loopback.c
new file mode 100644
index 0000000000000000000000000000000000000000..f346ad9ffca9eb957680b1d259c9789e55cffae9
--- /dev/null
+++ b/drivers/bus/mhi/ep/clients/loopback.c
@@ -0,0 +1,122 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/mhi_ep.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/string.h>
+
+struct mhi_ep_loopback {
+	struct workqueue_struct *loopback_wq;
+	struct mhi_ep_device *mdev;
+};
+
+struct mhi_ep_loopback_work {
+	struct mhi_ep_device *mdev;
+	struct work_struct work;
+	void *buf;
+	size_t len;
+};
+
+static void mhi_ep_loopback_work_handler(struct work_struct *work)
+{
+	struct mhi_ep_loopback_work *mhi_ep_lb_work = container_of(work,
+								struct mhi_ep_loopback_work, work);
+	int ret;
+
+	ret = mhi_ep_queue_buf(mhi_ep_lb_work->mdev, mhi_ep_lb_work->buf,
+			       mhi_ep_lb_work->len);
+	if (ret) {
+		dev_err(&mhi_ep_lb_work->mdev->dev, "Failed to send the packet\n");
+		kfree(mhi_ep_lb_work->buf);
+	}
+
+	kfree(mhi_ep_lb_work);
+}
+
+static void mhi_ep_loopback_ul_callback(struct mhi_ep_device *mhi_dev,
+					struct mhi_result *mhi_res)
+{
+	struct mhi_ep_loopback *mhi_ep_lb = dev_get_drvdata(&mhi_dev->dev);
+	struct mhi_ep_loopback_work *mhi_ep_lb_work;
+	void *buf;
+
+	if (!mhi_res->transaction_status) {
+		buf = kmemdup(mhi_res->buf_addr, mhi_res->bytes_xferd, GFP_KERNEL);
+		if (!buf)
+			return;
+
+		mhi_ep_lb_work = kmalloc(sizeof(*mhi_ep_lb_work), GFP_KERNEL);
+		if (!mhi_ep_lb_work) {
+			kfree(buf);
+			return;
+		}
+
+		INIT_WORK(&mhi_ep_lb_work->work, mhi_ep_loopback_work_handler);
+		mhi_ep_lb_work->mdev = mhi_dev;
+		mhi_ep_lb_work->buf = buf;
+		mhi_ep_lb_work->len = mhi_res->bytes_xferd;
+
+		queue_work(mhi_ep_lb->loopback_wq, &mhi_ep_lb_work->work);
+	}
+}
+
+static void mhi_ep_loopback_dl_callback(struct mhi_ep_device *mhi_dev,
+					struct mhi_result *mhi_res)
+{
+	kfree(mhi_res->buf_addr);
+}
+
+static int mhi_ep_loopback_probe(struct mhi_ep_device *mhi_dev, const struct mhi_device_id *id)
+{
+	struct mhi_ep_loopback *mhi_ep_lb;
+
+	mhi_ep_lb = devm_kzalloc(&mhi_dev->dev, sizeof(*mhi_ep_lb), GFP_KERNEL);
+	if (!mhi_ep_lb)
+		return -ENOMEM;
+
+	mhi_ep_lb->loopback_wq = alloc_ordered_workqueue("mhi_ep_loopback", WQ_MEM_RECLAIM);
+	if (!mhi_ep_lb->loopback_wq) {
+		dev_err(&mhi_dev->dev, "Failed to create workqueue.\n");
+		return -ENOMEM;
+	}
+
+	mhi_ep_lb->mdev = mhi_dev;
+	dev_set_drvdata(&mhi_dev->dev, mhi_ep_lb);
+
+	return 0;
+}
+
+static void mhi_ep_loopback_remove(struct mhi_ep_device *mhi_dev)
+{
+	struct mhi_ep_loopback *mhi_ep_lb = dev_get_drvdata(&mhi_dev->dev);
+
+	destroy_workqueue(mhi_ep_lb->loopback_wq);
+	dev_set_drvdata(&mhi_dev->dev, NULL);
+}
+
+static const struct mhi_device_id mhi_ep_loopback_id_table[] = {
+	{ .chan = "LOOPBACK"},
+	{}
+};
+MODULE_DEVICE_TABLE(mhi, mhi_ep_loopback_id_table);
+
+static struct mhi_ep_driver mhi_ep_loopback_driver = {
+	.probe = mhi_ep_loopback_probe,
+	.remove = mhi_ep_loopback_remove,
+	.dl_xfer_cb = mhi_ep_loopback_dl_callback,
+	.ul_xfer_cb = mhi_ep_loopback_ul_callback,
+	.id_table = mhi_ep_loopback_id_table,
+	.driver = {
+		.name = "mhi_ep_loopback",
+	},
+};
+
+module_mhi_ep_driver(mhi_ep_loopback_driver);
+
+MODULE_AUTHOR("Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>");
+MODULE_AUTHOR("Sumit Kumar <sumit.kumar@oss.qualcomm.com>");
+MODULE_DESCRIPTION("MHI Endpoint Loopback driver");
+MODULE_LICENSE("GPL");

-- 
2.34.1


