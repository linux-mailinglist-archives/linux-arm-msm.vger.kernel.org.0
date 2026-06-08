Return-Path: <linux-arm-msm+bounces-111943-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Mv10CmoHJ2rVqQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111943-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 20:18:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C252659A04
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 20:18:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="WgUc/81c";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=gRI37CbY;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111943-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111943-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 826713196642
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 17:54:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA8ED23EAB0;
	Mon,  8 Jun 2026 17:54:14 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4A5B3AB27C
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 17:54:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780941254; cv=none; b=pffrW1ButP+9f59XOHp2sc0RgDE86rBuq2sWAJKs9j1ikhDrMfZ/AedXTHsIjuBxk/fTOV+ntZaoc3TOGkHyHQIOdrB2QA5OW6TrJ3msIedIRKwHKGnPRLHptlT4CN3E5CFtcdoljALNzUJWE+rIob/pYNaWW/FABooQJR2ymeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780941254; c=relaxed/simple;
	bh=LfhnTSE/G1T8B/h3kxwLBybzUKV/tBEsJgG9HLknHEI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NRVJkCnxq416PouTa/wGQd02BtjEpqctTNHTTuthaQrk0g0wjbrPUigUIoH5J2VztCty7QQFLXqG2Ktr9wb3oHAzfZi3j7YFuK5jhA2nptu17wpFmKsMkr5kMpOC3+D52C9PUbOyB/TtGsWV0i93Ou+A5QwgcVPD2aSZsZ95ZYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WgUc/81c; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gRI37CbY; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658FFTE04041662
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Jun 2026 17:54:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=zkiCxaDpqw8
	LU9keubfzfjw/GkQ1e/JBsqf5XRh45Hw=; b=WgUc/81chQmEnATc7sZTPfEhLF2
	dRqQqgQsj87bmGyKBgMmNVwFF6+pn/grdYSQcem9+8oSc8i1AuinCtFIKhrUd6B0
	Jh2wswv4d7cOIwfZAtNo8zgGS5G1ubhnIJVXP6nWVxHunCUgtpEn723EbZdV0qs2
	Q8fzbbeyk1JNAShP0rAliWm6GMVLMBhD7ShiOlWl1nh8zN/EVP97Z+oJkAO3wfCU
	tuNavXcsM3P+Ym3WQ3YDABr6lEI0nTKG1dl9yxPWpnlK3tzUHspFlYARm3npjyUC
	/bIIlg9YEW+FC+0C7rWOj/b3d1Es8JR+Pb+ZhoY+gn7/4sXxqVmFjxfZj5Q==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enwsv9pf6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 17:54:11 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2bf0b7425bbso90851605ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 10:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780941251; x=1781546051; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zkiCxaDpqw8LU9keubfzfjw/GkQ1e/JBsqf5XRh45Hw=;
        b=gRI37CbY1/cZHj1VhXTOxwMMMgAwhRVUuSlr9iZhdBRX5+ja7TqIjNfaeXNMySDEAg
         4fZv1viPECSnTEZRzkYNhezVNu2+P4KZdsHQI3yFilHGVk4KpZHJCFD4oHiDHXHeR9sE
         UZkK1aT7GwsFb58dTQ4Cb918xsR2gxUz5UC27ZLDLIKGjVH/f2H4D3A839bbyuDDIlR+
         CBnWUlwwehPK2frw3V1YiZQ/oRgQA6fjPJtrXGc0i0MAEqCiTIZj3RUXTuXeEZm4OWjj
         4rvCLQmBErwI2zRXvvHh4hbhjpN0dx5grDSv5BrqtHSK1OoBjW9yb7UaBMpDCt4ei7Ap
         CzGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780941251; x=1781546051;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zkiCxaDpqw8LU9keubfzfjw/GkQ1e/JBsqf5XRh45Hw=;
        b=bvqVpgvps1rVBnW77J22XQNB/jEUTZ8GqItC4yuLcEeOb4FKEZRrIHywKJWPSU1EvG
         iLM5IHCm74+T6VaTz8p6jC6owehui5YLr7EBqt91y4Dx2ajmRIdCMtd3j447EeHlT81z
         GjhUK1GQ8do5VxhyOpuTkk5P2SIt64tERHyOmgGnUv4eAkBW4C9LhPzIRa6P4cxDaf/8
         saLGs+fuu0DlDuw0PB4XuVZzY8Vt0n8vzrPWnq5ANo6hIQ3uXy4HkKj3UUTzALr0BuOu
         /1dsR+tzyLMTJrWdK1/y8oFo5e+D9FG9rwQMCyocbqKUGTjfp1RiB7o+M4SYqzfIlDAM
         S6bg==
X-Forwarded-Encrypted: i=1; AFNElJ+ZNvEbam1sVZMtQRFWS52z9XaE0TXQjr1ImONUjB0FE/TIqNxqZbe68hsG/Pv7igoj4r7+F5PS/9ZY5xRG@vger.kernel.org
X-Gm-Message-State: AOJu0YweDDe7i7rExFa1T1FPIyRDG98/0maeXxHaEGUZsYSBGSRtxxvE
	56ushX7kMAnRflkALygqA9I/gPmbVg81yX3fYx3lzpdQbsheETc0qre9UfTWswIxDbZBVcPS5SY
	f4GOUjNGV3saGsjNSG3fM0d0GG0U4SYfF5c3w4rDcCos9vh+ZrQscoebIkkTw/i2B1ayD
X-Gm-Gg: Acq92OFn7+JgGyYxT5j4dqblMas9Sa1TM3mqS5TVVVEZ6J9w0enPpsOu7QqaUyRfwVb
	KH8LpD03H8l+5z6wXVdeDke2wzvBhNl2TQqvaPoacUH5lp6sueZLmxFtg9ICkzIl1S6pUY164lB
	1P9ejKfO3UPIKWgBHwcrmy9/0ZpIQpJpWxXqU/h4h7Z7RiQby7n6THoU3edDKrgq8vErPOqpsHr
	dxC+YJAtMrwaSbnZ8GIoqHOuCvcvoQEul6kjWaTcoDpwsxF9/nQ4dolnpsHCIqD2uv4Gb8Um7u4
	hLpSgu4aKuccigjR/Qf+wu+GJjTLewl9qVgQ69ho4ayZXWO0EFOIm7fqO7ZYu2XK2LSfe6beeWc
	BK20ESZR8qdbaTK4jjBbIa9ZquJUMHFCl0+6K9ZWH53QP1h2z02zLGF3GCduVt3wSZ5Y5
X-Received: by 2002:a05:6a20:c783:b0:3b4:8f4a:3bc6 with SMTP id adf61e73a8af0-3b4ccff305bmr20041844637.32.1780941250891;
        Mon, 08 Jun 2026 10:54:10 -0700 (PDT)
X-Received: by 2002:a05:6a20:c783:b0:3b4:8f4a:3bc6 with SMTP id adf61e73a8af0-3b4ccff305bmr20041798637.32.1780941250394;
        Mon, 08 Jun 2026 10:54:10 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df0a4afdsm18975720a12.19.2026.06.08.10.54.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 10:54:10 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Rao Mandadapu <quic_srivasam@quicinc.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
Subject: [PATCH v1 2/2] soundwire: qcom: add EE-aware register layout and cpu selection
Date: Mon,  8 Jun 2026 23:23:45 +0530
Message-Id: <20260608175345.3118060-3-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260608175345.3118060-1-mohammad.rafi.shaik@oss.qualcomm.com>
References: <20260608175345.3118060-1-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: r86sch7Wq4pvAC3ZfHOASXnPpAiRaKsM
X-Proofpoint-ORIG-GUID: r86sch7Wq4pvAC3ZfHOASXnPpAiRaKsM
X-Authority-Analysis: v=2.4 cv=dIaWXuZb c=1 sm=1 tr=0 ts=6a2701c3 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=pCi666Mk7v47pcsjtEsA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDE2OCBTYWx0ZWRfX7JdXUCYFMg5S
 2YW/cNSTkpkhL1AzkJlla/02peZEFw6Ktek/w4RuUYs3azDW3IjWUBilBGAQfHtZwGwWrzVf0Mj
 dbvPvpIDELUOGZOz3wAkb35ZaKKpSNNyoUJYPLRhN2v2FbyL5sh/9Kw8Aw2wZ9DJquEmruu9RsT
 ay8lWSK3BUHkMZQImQqgnMnrL8g8uqTjp+iH11Uw7L/bZ5dbQ52CFXRgPQDWnhdsyWsRmvVUjFx
 W0w6YrxviNHw/kf0J4psto9a3QtIXyxgfot5AJeSQIwfNkSs1EEILHNykGTg5TnZ40Dxxw85h9d
 3xfVpXeCHrlWAgY0yKUH5HaIvln1KzXwErokQUcnT/7r0EPp0JJrcfIxPfJiFJDe52pI9+qDTcs
 ovbA4IjeKPnlTunXObip72UV6wsIMtXIDOO7a2kkrEn7CT6ieV6Z7JQxk/5CfzUMVgKVS8+T4Qf
 28yGrz6D3A27qp9hEnw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606080168
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[mohammad.rafi.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-111943-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:srini@kernel.org,m:vkoul@kernel.org,m:yung-chuan.liao@linux.intel.com,m:quic_srivasam@quicinc.com,m:pierre-louis.bossart@linux.dev,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-sound@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mohammad.rafi.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7C252659A04

Some Qualcomm SoundWire masters expose interrupt, FIFO and status
registers in EE-specific register windows on v2.0 and newer hardware.

Add support for selecting the SoundWire execution environment from DT
and use it to program the correct register window for the active EE.
The driver now reads the EE value from the new
qcom,swr-master-ee-val property, with qcom,ee as a fallback for
backward compatibility.

For v2.0+ hardware, the IRQ/FIFO/status register layout is adjusted by
the EE window stride so the driver programs the correct bank for the
selected EE. The interrupt enable path is also updated to always use
the selected EE window.

This change allows SoundWire interrupt routing and register accesses to
work correctly on platforms where the master is not mapped to the
default EE1 window.

In Shikra, the soundwire execution environment is set to 0 unlike other
Qualcomm boards.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 drivers/soundwire/qcom.c | 78 +++++++++++++++++++++++++++++++++-------
 1 file changed, 65 insertions(+), 13 deletions(-)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index 3d8f5a81e..f4b8ff77b 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -26,6 +26,7 @@
 #define SWRM_COMP_STATUS					0x014
 #define SWRM_LINK_MANAGER_EE					0x018
 #define SWRM_EE_CPU						1
+#define SWRM_MAX_EE						1
 #define SWRM_FRM_GEN_ENABLED					BIT(0)
 #define SWRM_VERSION_1_3_0					0x01030000
 #define SWRM_VERSION_1_5_1					0x01050001
@@ -118,6 +119,7 @@
 #define SWRM_V2_0_CLK_CTRL					0x5060
 #define SWRM_V2_0_CLK_CTRL_CLK_START				BIT(0)
 #define SWRM_V2_0_LINK_STATUS					0x5064
+#define SWRM_V2_REG_EE_STRIDE					0x1000
 
 #define SWRM_DP_PORT_CTRL_EN_CHAN_SHFT				0x18
 #define SWRM_DP_PORT_CTRL_OFFSET2_SHFT				0x10
@@ -202,6 +204,7 @@ struct qcom_swrm_ctrl {
 	struct mutex port_lock;
 	struct clk *hclk;
 	int irq;
+	u32 ee;
 	unsigned int version;
 	int wake_irq;
 	int num_din_ports;
@@ -222,6 +225,7 @@ struct qcom_swrm_ctrl {
 	u32 slave_status;
 	u32 wr_fifo_depth;
 	bool clock_stop_not_supported;
+	unsigned int reg_layout_local[SWRM_OFFSET_DP_SAMPLECTRL2_BANK + 1];
 };
 
 struct qcom_swrm_data {
@@ -328,6 +332,36 @@ static const struct qcom_swrm_data swrm_v3_0_data = {
 };
 #define to_qcom_sdw(b)	container_of(b, struct qcom_swrm_ctrl, bus)
 
+static void qcom_swrm_set_ee_register_layout(struct qcom_swrm_ctrl *ctrl,
+					     const struct qcom_swrm_data *data)
+{
+	int ee_offset;
+
+	memcpy(ctrl->reg_layout_local, data->reg_layout,
+	       sizeof(ctrl->reg_layout_local));
+	ctrl->reg_layout = ctrl->reg_layout_local;
+
+	if (ctrl->version < SWRM_VERSION_2_0_0)
+		return;
+
+	/*
+	 * Current register constants map EE1. For EE0, use the EE register
+	 * window stride to access status/IRQ/FIFO registers.
+	 */
+	ee_offset = ((int)ctrl->ee - SWRM_EE_CPU) * SWRM_V2_REG_EE_STRIDE;
+	if (!ee_offset)
+		return;
+
+	ctrl->reg_layout_local[SWRM_REG_FRAME_GEN_ENABLED] += ee_offset;
+	ctrl->reg_layout_local[SWRM_REG_INTERRUPT_STATUS] += ee_offset;
+	ctrl->reg_layout_local[SWRM_REG_INTERRUPT_CLEAR] += ee_offset;
+	ctrl->reg_layout_local[SWRM_REG_INTERRUPT_CPU_EN] += ee_offset;
+	ctrl->reg_layout_local[SWRM_REG_CMD_FIFO_WR_CMD] += ee_offset;
+	ctrl->reg_layout_local[SWRM_REG_CMD_FIFO_RD_CMD] += ee_offset;
+	ctrl->reg_layout_local[SWRM_REG_CMD_FIFO_STATUS] += ee_offset;
+	ctrl->reg_layout_local[SWRM_REG_CMD_FIFO_RD_FIFO_ADDR] += ee_offset;
+}
+
 static int qcom_swrm_ahb_reg_read(struct qcom_swrm_ctrl *ctrl, int reg,
 				  u32 *val)
 {
@@ -904,12 +938,13 @@ static int qcom_swrm_init(struct qcom_swrm_ctrl *ctrl)
 	ctrl->reg_write(ctrl, SWRM_MCP_CFG_ADDR, val);
 
 	if (ctrl->version == SWRM_VERSION_1_7_0) {
-		ctrl->reg_write(ctrl, SWRM_LINK_MANAGER_EE, SWRM_EE_CPU);
+		ctrl->reg_write(ctrl, SWRM_LINK_MANAGER_EE, ctrl->ee);
 		ctrl->reg_write(ctrl, SWRM_MCP_BUS_CTRL,
-				SWRM_MCP_BUS_CLK_START << SWRM_EE_CPU);
+				SWRM_MCP_BUS_CLK_START << ctrl->ee);
 	} else if (ctrl->version >= SWRM_VERSION_2_0_0) {
-		ctrl->reg_write(ctrl, SWRM_LINK_MANAGER_EE, SWRM_EE_CPU);
-		ctrl->reg_write(ctrl, SWRM_V2_0_CLK_CTRL,
+		ctrl->reg_write(ctrl, SWRM_LINK_MANAGER_EE, ctrl->ee);
+		ctrl->reg_write(ctrl, SWRM_V2_0_CLK_CTRL +
+				((int)ctrl->ee - SWRM_EE_CPU) * SWRM_V2_REG_EE_STRIDE,
 				SWRM_V2_0_CLK_CTRL_CLK_START);
 	} else {
 		ctrl->reg_write(ctrl, SWRM_MCP_BUS_CTRL, SWRM_MCP_BUS_CLK_START);
@@ -935,11 +970,9 @@ static int qcom_swrm_init(struct qcom_swrm_ctrl *ctrl)
 	ctrl->reg_write(ctrl, ctrl->reg_layout[SWRM_REG_INTERRUPT_CLEAR],
 			0xFFFFFFFF);
 
-	/* enable CPU IRQs */
-	if (ctrl->mmio) {
-		ctrl->reg_write(ctrl, ctrl->reg_layout[SWRM_REG_INTERRUPT_CPU_EN],
-				SWRM_INTERRUPT_STATUS_RMSK);
-	}
+	/* enable CPU IRQs for the selected EE window */
+	ctrl->reg_write(ctrl, ctrl->reg_layout[SWRM_REG_INTERRUPT_CPU_EN],
+			SWRM_INTERRUPT_STATUS_RMSK);
 
 	/* Set IRQ to PULSE */
 	ctrl->reg_write(ctrl, SWRM_COMP_CFG_ADDR,
@@ -1545,7 +1578,22 @@ static int qcom_swrm_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	data = of_device_get_match_data(dev);
+	ctrl->ee = SWRM_EE_CPU;
+	ret = of_property_read_u32(dev->of_node, "qcom,swr-master-ee-val", &ctrl->ee);
+	if (ret)
+		ret = of_property_read_u32(dev->of_node, "qcom,ee", &ctrl->ee);
+	if (ret)
+		ctrl->ee = SWRM_EE_CPU;
+	if (ctrl->ee > SWRM_MAX_EE) {
+		dev_warn(dev, "invalid SoundWire EE %u, using EE%u\n",
+			 ctrl->ee, SWRM_EE_CPU);
+		ctrl->ee = SWRM_EE_CPU;
+	}
 	ctrl->max_reg = data->max_reg;
+	/*
+	 * Defer EE register window selection until HW version is known.
+	 * For v2.0+ the IRQ/FIFO window is EE-banked.
+	 */
 	ctrl->reg_layout = data->reg_layout;
 	ctrl->rows_index = sdw_find_row_index(data->default_rows);
 	ctrl->cols_index = sdw_find_col_index(data->default_cols);
@@ -1623,6 +1671,7 @@ static int qcom_swrm_probe(struct platform_device *pdev)
 	prop->default_row = data->default_rows;
 
 	ctrl->reg_read(ctrl, SWRM_COMP_HW_VERSION, &ctrl->version);
+	qcom_swrm_set_ee_register_layout(ctrl, data);
 
 	ret = devm_request_threaded_irq(dev, ctrl->irq, NULL,
 					qcom_swrm_irq_handler,
@@ -1733,16 +1782,19 @@ static int __maybe_unused swrm_runtime_resume(struct device *dev)
 		reset_control_reset(ctrl->audio_cgcr);
 
 		if (ctrl->version == SWRM_VERSION_1_7_0) {
-			ctrl->reg_write(ctrl, SWRM_LINK_MANAGER_EE, SWRM_EE_CPU);
+			ctrl->reg_write(ctrl, SWRM_LINK_MANAGER_EE, ctrl->ee);
 			ctrl->reg_write(ctrl, SWRM_MCP_BUS_CTRL,
-					SWRM_MCP_BUS_CLK_START << SWRM_EE_CPU);
+					SWRM_MCP_BUS_CLK_START << ctrl->ee);
 		} else if (ctrl->version >= SWRM_VERSION_2_0_0) {
-			ctrl->reg_write(ctrl, SWRM_LINK_MANAGER_EE, SWRM_EE_CPU);
-			ctrl->reg_write(ctrl, SWRM_V2_0_CLK_CTRL,
+			ctrl->reg_write(ctrl, SWRM_LINK_MANAGER_EE, ctrl->ee);
+			ctrl->reg_write(ctrl, SWRM_V2_0_CLK_CTRL +
+					((int)ctrl->ee - SWRM_EE_CPU) *
+					SWRM_V2_REG_EE_STRIDE,
 					SWRM_V2_0_CLK_CTRL_CLK_START);
 		} else {
 			ctrl->reg_write(ctrl, SWRM_MCP_BUS_CTRL, SWRM_MCP_BUS_CLK_START);
 		}
+
 		ctrl->reg_write(ctrl, ctrl->reg_layout[SWRM_REG_INTERRUPT_CLEAR],
 			SWRM_INTERRUPT_STATUS_MASTER_CLASH_DET);
 
-- 
2.34.1


