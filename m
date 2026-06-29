Return-Path: <linux-arm-msm+bounces-115152-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id VDpMChN/Qmpq8gkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115152-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 16:20:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B53F66DBF30
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 16:20:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=KK6l5eaK;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Emyc4c0y;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115152-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115152-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0174B302539C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 14:19:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F10C7423156;
	Mon, 29 Jun 2026 14:17:03 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87076423149
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 14:17:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782742623; cv=none; b=Ars+HOQBgILQJLCMhMCmeJMAl8ACln1kzqxMGauQFxmVLLNZ/gX5xuMBLn8izdAW8ksQHFmRvj2eN3SpETWMY4an+wn3ET1YJ4UVweoyxXXagHLc2sqvp3i9mL7BB9mUZjeONMEXhpk9Y3oWN27ubXTf8CeBZHYaEoao3Y4/C6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782742623; c=relaxed/simple;
	bh=F1jvjPJcbPO+gpBvRiWEotz8dSae8UoOS7rBadKSpKA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=s7WK+PjEohkxt5+R0FkofBmes8qU/SlwqOocyqq76+znB6ate4vYU21AaaXyGbydXrad6fEPniESMYSQQ8oIpTzT3ZG8xpKBYO2olqeOd4lxrLAZetTZYBcYJfbz3m4HnL1iPrIM7yvmkZOSrF4bv2RIDgT7TvdxOvboAhDbuCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KK6l5eaK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Emyc4c0y; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TATJx42656106
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 14:17:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=+Ja1dfApRhU
	OIrNxjCCe6bw+CKEcGVCmLCwjdPZ3/HY=; b=KK6l5eaKL08CYof3qckmEho+S/H
	GlVCj1xGjSWPh62TMsMCMHUahbiIsZQJtQGmuEmVcyihnNFp2oBN74facuKa9vgc
	rmpnH77QcPg6Dw5bYQDc3VWp/owGtACz2EWIaupMlpZes05/cSbxvxctEW5/lfjH
	BlXQk8+36PYPMbyq6IemiCesiNve9RA775vxv8U1hxPQDLIcFQlaavm0qxFCxy2C
	iya1Nnlu7JlqxvLFnkeMJFFaPrqCo9v/0xzm0bBo7AJJvCQCafoq9ZRRSFmYk3V6
	EBeFU4hr1VpL3PrPKjUz2g2FOB5VTUX8VUOUQFidneQmdpDwQOFIIrx8acQ==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3np7h73h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 14:17:01 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-7e6b59d85dcso7305341a34.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 07:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782742621; x=1783347421; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Ja1dfApRhUOIrNxjCCe6bw+CKEcGVCmLCwjdPZ3/HY=;
        b=Emyc4c0yF543xc/77v/6/tIO5zswYMt7lH0mDxVVf8GXaVZF0b1Xf2P2SdFiHL4MPn
         UkXCr9T+U7VF9CbMznvj5aS+FUmW8uJeXSEV0JZQ+WC8ZfI8JA7oS/TMah4Kf7jgIfMw
         fkkNI2DHlW8FDO+ffg80N5q11JlgnI6MaYtosXAo8eWygWSUf/H9Q2qw457T5RnyEC29
         jsLqZOGDEvdG1A6ql5pnCfxzwmvmCX0GU+evBw4p1giirXOADn+D9QNZpix5EluZwETZ
         4P0ntOxpf6ARqgPeA7wcV6zJN1yW1H6l5NxyWgi/LRR27Pss5iXJBz5+xhPCiycr/fyy
         ji/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782742621; x=1783347421;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+Ja1dfApRhUOIrNxjCCe6bw+CKEcGVCmLCwjdPZ3/HY=;
        b=mMWUUcIKYG0XVpW1j4XnjaYNcnDkIcNmMJX1d/UzUbi8qOFt8eWQwFY3mdCwAcbqEr
         JSEaGV/SCHB4dVsfCahmO51R9Z7goIKCXkLBxDf6HP8zkwsKAgVFXxxVa9vPhLN7ZOkh
         172f/YkMC2Zv6wRYaxr30oQr4AW0fSPbdIrH6YvlfdCpsm2aahMbOUye7q8QLXqWtvSC
         mnO5n4LZl3I2xSS0SJYEG81qO+n3LNhEDaH6n4+cx9KY76IgsNrju9lL7vn8mdlpN6u/
         o3wLrqZ3ZlpAHFmznL0KywOAC9f3bMy3m5HQ3BDqpe/qePC7+IjXTW3SGbLikvmKw/6m
         CNTw==
X-Forwarded-Encrypted: i=1; AFNElJ/jqheTCqHMp9Ge9mMDQEMZce5L/MEsykpSkBttoGUXmV5AVSF7xr2mguNgHlJM3Nuu743MUc7Y49HuPikl@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2hIXHTEy/EMiaaabQP7iq4rhfjknF5AjVJtpT8Qw4JfAdTa+R
	Re9RbMT/Py1ZhxqEOaBnjVLF/mVsBuS8CSx8kl+oN/p1Mwl4qSSF4Z8q0U5zUdBCDNLui7g3kMl
	T1lCtipvMd6uOrCiOeGGD9VKuqx7CcrKrynBikSbTIKVpxvMG+3kJevoM9N7nEzXjJWXh
X-Gm-Gg: AfdE7clUCzw/83FWToZXwbQFTQmQr2Jn9nxtV5ZStOxlRmUy8A4+LzUBnmM8ptUbfYO
	nZIyCUPY+bBLcFD2QgCCoOXdI72Y2u2h+6ytiJ1kqN/R2Rsf7pq3UFXIbkfFInJnI7fs1yc52bn
	cAHxxUmnpSmxxDdAjo+9/rQ4IsB4h+kEQZ2aPicihCj6v/+XQOYm+PFlLwrTHk4H0Em8T8i0RjY
	qr2GRH1Ep4cG4MDJ06J8/cUljZUcV4ZG/+4HB96Ek3XFH5OAwiYqlouwjRjFkXz86n/72RItia4
	kebHss63vNWSwiEkHPu5YCSf1iWP3dXGnJ8ck0bMm2X3xD2Cb5+PCvmVNf4ySa2nWgAKx1Am7S7
	tQzyFqeatE4V27/eQgSWIYuWHBeitlW1hiKDDHVJUvTaav9k=
X-Received: by 2002:a05:6830:3c84:b0:7e6:ed97:ce52 with SMTP id 46e09a7af769-7e9e929b0bamr517486a34.20.1782742620868;
        Mon, 29 Jun 2026 07:17:00 -0700 (PDT)
X-Received: by 2002:a05:6830:3c84:b0:7e6:ed97:ce52 with SMTP id 46e09a7af769-7e9e929b0bamr517454a34.20.1782742620262;
        Mon, 29 Jun 2026 07:17:00 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e9aa5d3500sm8584812a34.8.2026.06.29.07.16.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 07:16:59 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Yongqin Liu <yongqin.liu@linaro.org>,
        Jie Gan <jie.gan@oss.qualcomm.com>,
        Dan Carpenter <dan.carpenter@linaro.org>
Subject: [PATCH v1 2/2] soundwire: qcom: Add set_channel_map support to SWR master DAI
Date: Mon, 29 Jun 2026 19:46:33 +0530
Message-Id: <20260629141633.86657-3-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260629141633.86657-1-mohammad.rafi.shaik@oss.qualcomm.com>
References: <20260629141633.86657-1-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDExOCBTYWx0ZWRfX5eDPgqHVxN9Y
 BbLViDqD3yFCZAz4xovkNbmFXTJxRKJDvK3KfW/O8thvMJZ9hupPkIMcwKStFQbwdTSZcd28GVX
 8b+BlodvdkTMJzXDRJbUwUZwD+O6BDst/NGEhxKG3TUNG/Fdad2bIO1I9fUfmhrMLZlOkc+shPO
 tHIoSughzH4mIUwWEOIUaBD883GxEXuP27pRTIcjjcHtO4Ywkccj8ckMfJhGZlTcjqYSQs0Ht1r
 tcwbKWqvulp5nFyQzxyniQuZXunBCkxIMgMzg0533tExSkNnZ/OhgOn9fvW6ZsMD0r2n4Uj7k+/
 Hi1eVwFWd2mqZWF6u6grfpdHLgvvEdEBJX41TgqGz2Kqb0+Xn04m8hE2KWROnQZzseTgiknylRW
 8meUHuqkxXprkJZTmv0I72Ed+ez9GDAaOq06FYiCEd3eQQR9SP3WrrAYAEaDgvj60Gfx6D5Tfgl
 zzupoSER6tosYIDleWg==
X-Proofpoint-GUID: fMlaV9l_NjMIa6cbApuVuPvXcVoc4Kd_
X-Proofpoint-ORIG-GUID: fMlaV9l_NjMIa6cbApuVuPvXcVoc4Kd_
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDExOCBTYWx0ZWRfX9FNBfGN6RIHO
 c5Ea6ezOjwqQBWowEkEgUz0cAM9nbRvqCJJ7hKe4/rl1pS2er71KtpNdqjxvj4LIOJBcMbl6m73
 Sdeeuuhv29Sb6GQClSLr2UI/Iawpd6Y=
X-Authority-Analysis: v=2.4 cv=OcWoyBTY c=1 sm=1 tr=0 ts=6a427e5d cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=KKAkSRfTAAAA:8 a=CYKTsl9jDGlcAgKpjQMA:9
 a=EXS-LbY8YePsIyqnH6vw:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 spamscore=0 clxscore=1015 phishscore=0
 bulkscore=0 suspectscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290118
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-115152-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:srini@kernel.org,m:vkoul@kernel.org,m:yung-chuan.liao@linux.intel.com,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:quic_mohs@quicinc.com,m:pierre-louis.bossart@linux.dev,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:yongqin.liu@linaro.org,m:jie.gan@oss.qualcomm.com,m:dan.carpenter@linaro.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[mohammad.rafi.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_TO(0.00)[kernel.org,linux.intel.com,gmail.com,perex.cz,suse.com,quicinc.com];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mohammad.rafi.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,linaro.org:email];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B53F66DBF30

Add .set_channel_map support to the SWR master DAI so the ASoC
layer can program per-port channel masks used by port_enable().

Fix several issues in channel map handling: clip programming to
available ports to avoid out-of-bounds access, use 1-based port
indexing, and store TX/RX masks separately. Also track per-direction
validity and select the effective mask based on port role to avoid
incorrect precedence and ensure full-width masks are preserved.
Fall back to the SDW stream-provided channel mask when no mapping is
configured, preserving existing behaviour.

Fixes: 7796c97df6b1 ("soundwire: qcom: Add set_channel_map api support")
Reported-by: Yongqin Liu <yongqin.liu@linaro.org>
Closes: https://lore.kernel.org/all/4ddd6855-3817-4dc4-81c4-d8ddaa039865@oss.qualcomm.com/
Reported-by: Jie Gan <jie.gan@oss.qualcomm.com>
Closes: https://lore.kernel.org/all/CAMSo37U1kJq_gK8jiW9iMbhHXtn=Chr7NawiK4fPUPj4kyqH2w@mail.gmail.com/
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/all/33fe8fe7-719a-405a-9ed2-d9f816ce1d57@sabinyo.mountain/
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 drivers/soundwire/qcom.c | 54 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index 3d8f5a81eff1..e63736e82478 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -160,6 +160,10 @@ struct qcom_swrm_port_config {
 	u8 word_length;
 	u8 blk_group_count;
 	u8 lane_control;
+	u8 tx_ch_mask;
+	u8 rx_ch_mask;
+	bool tx_ch_map_valid;
+	bool rx_ch_map_valid;
 };
 
 /*
@@ -1109,12 +1113,28 @@ static int qcom_swrm_port_enable(struct sdw_bus *bus,
 {
 	u32 reg;
 	struct qcom_swrm_ctrl *ctrl = to_qcom_sdw(bus);
+	struct qcom_swrm_port_config *pcfg;
 	u32 val;
 	u32 offset = ctrl->reg_layout[SWRM_OFFSET_DP_PORT_CTRL_BANK];
 
 	reg = SWRM_DPn_PORT_CTRL_BANK(offset, enable_ch->port_num, bank);
 
 	ctrl->reg_read(ctrl, reg, &val);
+	pcfg = &ctrl->pconfig[enable_ch->port_num];
+
+	mutex_lock(&ctrl->port_lock);
+	if (enable_ch->port_num <= ctrl->num_dout_ports) {
+		if (pcfg->rx_ch_map_valid)
+			enable_ch->ch_mask = pcfg->rx_ch_mask;
+		else if (pcfg->tx_ch_map_valid)
+			enable_ch->ch_mask = pcfg->tx_ch_mask;
+	} else {
+		if (pcfg->tx_ch_map_valid)
+			enable_ch->ch_mask = pcfg->tx_ch_mask;
+		else if (pcfg->rx_ch_map_valid)
+			enable_ch->ch_mask = pcfg->rx_ch_mask;
+	}
+	mutex_unlock(&ctrl->port_lock);
 
 	if (enable_ch->enable)
 		val |= (enable_ch->ch_mask << SWRM_DP_PORT_CTRL_EN_CHAN_SHFT);
@@ -1334,6 +1354,39 @@ static void *qcom_swrm_get_sdw_stream(struct snd_soc_dai *dai, int direction)
 	return ctrl->sruntime[dai->id];
 }
 
+static int qcom_swrm_set_channel_map(struct snd_soc_dai *dai,
+				     unsigned int tx_num, const unsigned int *tx_slot,
+				     unsigned int rx_num, const unsigned int *rx_slot)
+{
+	struct qcom_swrm_ctrl *ctrl = dev_get_drvdata(dai->dev);
+	unsigned int max_ports = ctrl->nports;
+	unsigned int i;
+
+	if ((tx_num && !tx_slot) || (rx_num && !rx_slot))
+		return -EINVAL;
+
+	mutex_lock(&ctrl->port_lock);
+	for (i = 1; i <= max_ports; i++) {
+		ctrl->pconfig[i].tx_ch_map_valid = false;
+		ctrl->pconfig[i].rx_ch_map_valid = false;
+
+		/* TX setup */
+		if (tx_slot && i < tx_num) {
+			ctrl->pconfig[i].tx_ch_mask = tx_slot[i];
+			ctrl->pconfig[i].tx_ch_map_valid = true;
+		}
+
+		/* RX setup */
+		if (rx_slot && i < rx_num) {
+			ctrl->pconfig[i].rx_ch_mask = rx_slot[i];
+			ctrl->pconfig[i].rx_ch_map_valid = true;
+		}
+	}
+	mutex_unlock(&ctrl->port_lock);
+
+	return 0;
+}
+
 static int qcom_swrm_startup(struct snd_pcm_substream *substream,
 			     struct snd_soc_dai *dai)
 {
@@ -1370,6 +1423,7 @@ static const struct snd_soc_dai_ops qcom_swrm_pdm_dai_ops = {
 	.shutdown = qcom_swrm_shutdown,
 	.set_stream = qcom_swrm_set_sdw_stream,
 	.get_stream = qcom_swrm_get_sdw_stream,
+	.set_channel_map = qcom_swrm_set_channel_map,
 };
 
 static const struct snd_soc_component_driver qcom_swrm_dai_component = {
-- 
2.34.1


