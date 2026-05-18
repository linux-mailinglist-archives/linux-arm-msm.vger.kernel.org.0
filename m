Return-Path: <linux-arm-msm+bounces-108247-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +KmwLxpGC2rgFAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108247-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 19:02:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DF985715F0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 19:02:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5FB2830364A1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 17:01:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0994234F474;
	Mon, 18 May 2026 17:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BqHx4Ajp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UqhrdG0I"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92DC935BDA4
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 17:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779123681; cv=none; b=ud9g05eS6Y3pFRY6xukswQQHgKgGyrT246owx/6z03xiIcgvKvNME/R+msHgWbzDtxyOyA5PB1TbjFhiRMzsk+WOeArzBUu0AWBci2u3pfdTKHbLIUlHqNSwCgVXkrZwwHc+0K1XpK0MAciCqV5Cm+iPHwnTozMXIVWIASUDFZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779123681; c=relaxed/simple;
	bh=UHMJrmT2ONvAIhQJivnj9PTIHD8kS546Sv7JR6mvijk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=juonVvyWGpFvJHxFCPleC0y7z/PRv11X9LyJJZ1foQJF0aDtxFxyXr1FFa8WLzS+sXfgNtWzcWbNmD0ca0bmRjYrkgCbOyvLHvDBWBRGkax9EpkXjnW7jnOICXeq6Bj8ET9NVuDT3QEEY9Sqn38MyHsI+ZaBvBYE4TFSNCuE6pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BqHx4Ajp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UqhrdG0I; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64IBHQAF2482374
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 17:01:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	06u6G2Yp0YNV28hLRQxgGgcv716slVdRo5eq0en7VLc=; b=BqHx4AjpWCa4b4iK
	Z8UbGBWxMq4rDlzparAxyMSkir/lLMA8xl3Ew01q9r0h0aRmQFHjwbvWIBDNxuY5
	6cV/XYdyuz+/rBLzZItL4q9vm2HNDD7HLP/GSV5chHW0ug6+X+YptC2s18k9cK6c
	FIEkkPR6udsXHguI2nNGHGOJrHy5ul5Q/aC5Wu8vVsIHmBJtad5PcSNBawPYlwti
	X5BkA2r4meJeWnjWi8l/Vhca1ysoQA9AJoYtzLuSrobu6FlTfs/wXITD1bl7Tqsb
	sq7N4e0o+bM5fGkipHEvh1GaWjFIt0lGT5MYhwPRXQy4Kmd+iEmB0J2kZpJFRfF7
	2VZwuw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e81rvhacy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 17:01:15 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-366015bca9bso2886936a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 10:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779123674; x=1779728474; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=06u6G2Yp0YNV28hLRQxgGgcv716slVdRo5eq0en7VLc=;
        b=UqhrdG0IGTmvJXUFPCc9dM9D3lWC+bKb05hIp+SybJl4MRaJ2jdWk58UoEuDuUsj6N
         i3zkgF1F8KEz2Mgkq+l1cl1+0HjFUM9DFI1G20Q06TzlfCyOQtftHcNdpYrtG9WPvODu
         XBHd8FAloNSGdl55LLpQOfS/O2prGUA31yWpnJQSrS1u6TRUahpXAFXd5uT/8rEkUOJs
         OV5DImi8T66g5He/yqtm/7dj7QBGal2NnXepQnf+hQoW+mwP/fjytsXICSoIkIRIdcfZ
         kEZTgLWcJQ4ei3ATFBVbuWKRDotyXbBGAzR4o3C5TWvajVfvjHVV9xn8flfn9Q/r64bX
         5toA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779123674; x=1779728474;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=06u6G2Yp0YNV28hLRQxgGgcv716slVdRo5eq0en7VLc=;
        b=ijoklKIOf03VCjiJUZbW+Hy6aLmRFpIcaSKmpCRByLVAjC8/z79l83Kfm6i2NenoHZ
         SC/AWnG2l+tHEEbpdh4UyU4BjdAZv3vT5WPfgBYhu4xYK9BB1q0VSfVOWrl4DyE+By2s
         +5W55aAPCfEoeNa8mDT7i6YWagzg4qGKnPY44xMhdKeWnM5IDNslEuRVRFjeKDrZNaja
         o4VEva++ExARKYnEoL8ollFIFq0jndmVv8VSarlK7YYD0CWTsiq1IAcne4mw8UfrksQk
         9AUz7kFE2SV4rAWRTBUir0UVBBAfsbwslanGMcKjG9ZTQaIWrW9Qk97WmkBzUHp/nfqX
         K+fA==
X-Forwarded-Encrypted: i=1; AFNElJ9LvZJAvknfnsPQc98e0oVacSXbkVLlLpxJaItUR4IZ8myKhMA5bMkAIsxCOfe91ny4tr4j2SOA8QDcjcb5@vger.kernel.org
X-Gm-Message-State: AOJu0YxkwRzmaZ41+7/M5YNJKnWOHji4if9w4OmOFFjjwUOx1FnlA1x5
	NH8IHBLtjdiJOPLrL7IxQjJhp21P5CXVIKOJm1SQd5Tl4Hcg5HU4Y+DRkyEGwOx9Z0N5oE7Pw11
	g9ObQXBw/JYKN7Pkf6OF8M6GQoFR10AGjmQZYs1Ys6UAVBEXLAHuzN4mdihiNbtgU2dM3sQwSdP
	Om
X-Gm-Gg: Acq92OFAjfIkhGctsJo2zLigOPERfU+UGAHoPyvRq8+QadU9QhhV0N3gi4p7tBPUT2k
	ovaglek/w65kGzBWmocEkYiJEUDcgYzjkMLeZUHKi+KxYcm2JUeOrRV7NKet77uMgGaAPkvgmH9
	pfg+RA4Tf0RX7aIILdpD8ZdKhPY6Du8O414pRAi++qiCYB/sVRx/OckzUMOMgcbZR918ofVBt6z
	NnGOejNledbaT8q5ZpFlA7qVHZtAobbA39o/QAz9pKQEvthbvNlHu1Q+wZAmrwZYg5y1eWu6JAi
	2kbbrNU2k1PBoV2VpK74IyAZXt/L412QdMQW4IAHnqdtZ2EGWKxuSmblllLDi8/ltRT3ERVSmCI
	Yx1spGn40E0Jhc0DUNtgi/9kobdnWL8GAAJpYr3Q+nlSindbUQh6Keg0=
X-Received: by 2002:a17:90b:58e4:b0:369:1dbb:4732 with SMTP id 98e67ed59e1d1-369511320aemr11037375a91.0.1779123673703;
        Mon, 18 May 2026 10:01:13 -0700 (PDT)
X-Received: by 2002:a17:90b:58e4:b0:369:1dbb:4732 with SMTP id 98e67ed59e1d1-369511320aemr11037331a91.0.1779123672973;
        Mon, 18 May 2026 10:01:12 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3695652466dsm5783808a91.0.2026.05.18.10.01.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 10:01:12 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Date: Mon, 18 May 2026 22:30:52 +0530
Subject: [PATCH v3 2/2] spi: qcom-geni: Add trace events for Qualcomm GENI
 SPI driver
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260518-add-tracepoints-for-qcom-geni-spi-v3-2-7928f6810a79@oss.qualcomm.com>
References: <20260518-add-tracepoints-for-qcom-geni-spi-v3-0-7928f6810a79@oss.qualcomm.com>
In-Reply-To: <20260518-add-tracepoints-for-qcom-geni-spi-v3-0-7928f6810a79@oss.qualcomm.com>
To: Steven Rostedt <rostedt@goodmis.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        mukesh.savaliya@oss.qualcomm.com, aniket.randive@oss.qualcomm.com,
        chandana.chiluveru@oss.qualcomm.com, jyothi.seerapu@oss.qualcomm.com,
        Praveen Talari <praveen.talari@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779123658; l=2796;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=UHMJrmT2ONvAIhQJivnj9PTIHD8kS546Sv7JR6mvijk=;
 b=JMAeu+sCVD+tN57RQIT++CBVyQUVHpUT5cUM9HcdnM5/XXvsqZewC0nfi8M3Vq2OjpPUmFRJL
 e+ZzxXT6baMDNLiQ1iN00HAsJrChQl+3PjN2XX5+GSSzpBsil0kqxvk
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDE2NiBTYWx0ZWRfXwHNqZdrS7M0C
 Ynfexa804qpAlQs1Y+NnCD+yt7xqTVmobn6RwHvli+jUrMyqEXOCza23CUxqFxZAkUDI6h3HKnh
 1oA/ibn25IHqd3DPsnNgKHv2CabE7tbjuL87kZcZKheY+ZyOon7saT9QFtkEo/J5PO7dKKNXdoh
 SriSHsa4xbdGTp0KaUCtK21VRlRNH1k35Qs6+YNn6mIWEJVmw0IduLr8T+jbi6U9Tea2xcgUfwY
 NL9Kk/sRhd09y1YRs726hap4Av0Gq75FeO2lOpqzVUVKd93fIZRjCWZycoN//FHGNRdvfjhklhZ
 KnTkNORUDCKm/oNg0monJTzR2LBmdyGCbqKpEAXiEVlfxy7CEflZZoaSFgV0Qi4DC80+KGyzAuQ
 Tg0VGTwKa1UKSLNXvWf34jqGc8Jq1A==
X-Proofpoint-GUID: J9wA3A4-JyUMNuveW6tLmQdcSh8SNqto
X-Proofpoint-ORIG-GUID: J9wA3A4-JyUMNuveW6tLmQdcSh8SNqto
X-Authority-Analysis: v=2.4 cv=Lf0MLDfi c=1 sm=1 tr=0 ts=6a0b45db cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=yQWrNeiMpWR-rHkHbRUA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 malwarescore=0 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605180166
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108247-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3DF985715F0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add tracepoints to the Qualcomm GENI (Generic Interface) SPI driver.
These trace events enable runtime debugging and performance analysis
of SPI operations.

The trace events capture SPI clock configuration, setup parameters,
transfer details, interrupt status.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
v2->v3:
- Replaced geni_spi_fifo_params with geni_spi_setup_params trace event.
- Updated commit text.

v1->v2:
- Removed tx/rx data capture since spi core had already support.
- Updated commit text.
---
 drivers/spi/spi-geni-qcom.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c
index d5fb0edc8e0c..a04cdc1e5ad4 100644
--- a/drivers/spi/spi-geni-qcom.c
+++ b/drivers/spi/spi-geni-qcom.c
@@ -1,6 +1,9 @@
 // SPDX-License-Identifier: GPL-2.0
 // Copyright (c) 2017-2018, The Linux foundation. All rights reserved.
 
+#define CREATE_TRACE_POINTS
+#include <trace/events/qcom_geni_spi.h>
+
 #include <linux/clk.h>
 #include <linux/dmaengine.h>
 #include <linux/dma-mapping.h>
@@ -332,6 +335,9 @@ static int geni_spi_set_clock_and_bw(struct spi_geni_master *mas,
 	writel(clk_sel, se->base + SE_GENI_CLK_SEL);
 	writel(m_clk_cfg, se->base + GENI_SER_M_CLK_CFG);
 
+	trace_geni_spi_clk_cfg(mas->dev, clk_hz, mas->cur_sclk_hz, idx, div,
+			       mas->cur_bits_per_word);
+
 	/* Set BW quota for CPU as driver supports FIFO mode only. */
 	se->icc_paths[CPU_TO_GENI].avg_bw = Bps_to_icc(mas->cur_speed_hz);
 	ret = geni_icc_set_bw(se);
@@ -366,6 +372,9 @@ static int setup_fifo_params(struct spi_device *spi_slv,
 	if ((mode_changed & SPI_CS_HIGH) || (cs_changed && (spi_slv->mode & SPI_CS_HIGH)))
 		writel((spi_slv->mode & SPI_CS_HIGH) ? BIT(chipselect) : 0, se->base + SE_SPI_DEMUX_OUTPUT_INV);
 
+	trace_geni_spi_setup_params(mas->dev, chipselect, spi_slv->mode,
+				    mode_changed, cs_changed);
+
 	return 0;
 }
 
@@ -861,6 +870,8 @@ static int setup_se_xfer(struct spi_transfer *xfer,
 	spin_lock_irq(&mas->lock);
 	geni_se_setup_m_cmd(se, m_cmd, m_params);
 
+	trace_geni_spi_transfer(mas->dev, len, m_cmd);
+
 	if (mas->cur_xfer_mode == GENI_SE_DMA) {
 		if (m_cmd & SPI_RX_ONLY)
 			geni_se_rx_init_dma(se, sg_dma_address(xfer->rx_sg.sgl),
@@ -915,6 +926,8 @@ static irqreturn_t geni_spi_isr(int irq, void *data)
 	if (!m_irq && !dma_tx_status && !dma_rx_status)
 		return IRQ_NONE;
 
+	trace_geni_spi_irq(mas->dev, m_irq, dma_tx_status, dma_rx_status);
+
 	if (m_irq & (M_CMD_OVERRUN_EN | M_ILLEGAL_CMD_EN | M_CMD_FAILURE_EN |
 		     M_RX_FIFO_RD_ERR_EN | M_RX_FIFO_WR_ERR_EN |
 		     M_TX_FIFO_RD_ERR_EN | M_TX_FIFO_WR_ERR_EN))

-- 
2.34.1


