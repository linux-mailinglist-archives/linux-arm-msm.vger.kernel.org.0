Return-Path: <linux-arm-msm+bounces-106176-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gPajOqR7+2n0bgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106176-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 19:34:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D9FB4DEE53
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 19:34:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C0D603082333
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 May 2026 17:30:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F0883EF64C;
	Wed,  6 May 2026 17:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DPueg81i";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ATm08dYu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E59004A341B
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 May 2026 17:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778088603; cv=none; b=M6+aAXZRgDDjd8kWN185dk/DUfhzYPeUOZvASw9dgQ6IXYnUzqik1U79CYzsjbPTRYyfzR2webmQK0OhOigfUWK/AIZ+/zj01GfoZgSYZHfwib4Z/wAPF6tm84ZaxCbGXRoVR3SBf0ZDYT3pz8WB0n7aoCDbKdKm3DNHYbvpQ9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778088603; c=relaxed/simple;
	bh=koNBStVdcC5+4m4qVXikoLETuVjLx01Mbb0BXniq3oE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EsuqA9v6hI3c7dZzg0w20yosqNHEPPS4wPY+qF5XBGX3BujdantaYCmdLnp/cU5t9hrALANsUGT1BwYrJYWmtYUFL+b6UT2wSX3qV/MRAG3mRM0B3FWBl9HHYqzk7f7HApHvJ2RDZO/CLnwEed1GMEwjez/YUM6eoQ/VdncOZ3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DPueg81i; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ATm08dYu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 646GPwTn1953203
	for <linux-arm-msm@vger.kernel.org>; Wed, 6 May 2026 17:30:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n7Bu5I4Phk3bl5hOaeKMU154m5IfQGip+W4DHvInroQ=; b=DPueg81iv9D64n0l
	ZnY2CukN9YYlkOrFnAa/ITV1SlSgOBpceWbXPTTe105wiRZRdSjymCeGi8GQg1SM
	tQ90kW4Ze6xrNTHJwOYYok+TYi+EC0dQ+dKFS4DkSUo7zkBRbnwqF1ilHmPrLMtB
	o3ruVI8i938sQWwtZqF2YD9oDxra5Vjh1JRYjDRgRIC/dGsxkDUWX+SVVSFtqtA+
	jd2FZemBdmi6UBwzd4lODZMzip9OmeuQv7DstwOzApx85cT9W25b5LPJf+dJ3N8h
	cDqYJc77thd1O9Aoi0Gc4VaiYJA7jUWBiHnDsE0q34A9Pc3rDoMLXg6Jfh+cJ0/M
	Nni9rg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e03jc1pv5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 06 May 2026 17:30:00 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-35fbaada2f3so12150433a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 May 2026 10:30:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778088599; x=1778693399; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n7Bu5I4Phk3bl5hOaeKMU154m5IfQGip+W4DHvInroQ=;
        b=ATm08dYu2Y/q8ONs3KjP1mb6swlECGBw4lO+Xzj46C7mguWrO7qbTTir26+V38a2CK
         DSvIwqlKJyONjCj08KZqwvUBEK3thUfU1sO63WSmPcP2De72Y4eDSyvD6b9VdLknf5oK
         pGeeNWcMDaacpD9S/S/bwTNQezKe8P6qa3RhoIxtwbQqQtwHzA3SaAJO1daJqT+OPbyY
         5xkqG6Wz8EzPvxesA2MpsNdDjyTd/zLGzVhuhJ5MT1agygTOfqRGfdhKKjqCmw9EbWJz
         146cYgmSO/AtOQ1744ntpbzMFbcF3s6cA7DjDk9GQforvzXhYo0MbqPQmFESwH6XeKIN
         eX2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778088599; x=1778693399;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=n7Bu5I4Phk3bl5hOaeKMU154m5IfQGip+W4DHvInroQ=;
        b=gVh4oJQu6oGKxKLZ09977VetuDk7Wwlg6/5pX91/83ZgvoiU5EOOUUa9yJOLRgH2gv
         k6xTV+ZAfqhZ8ykCV2obuF21Qzd24xkvP8oowyGsBMdtff5vYKWbp7mtvWaeZ5qydFO8
         VJGEdj1PJiRqhq9hw1DqGq1kU2Ix6Ga18BFxTrCfJJnyZkSynv2JAz+zoRGh8UkvglTw
         7S8yZftlq0h2/0EMI6qMKw2xn5Y0cJvhegcAYP+wbS1ColHTUIwwFVNdXm2udlqBNci8
         71OeC4H+MA9xRKv931wpQEorz4Vhos8tX86M1+kC5/0fnuvupALppcswwgpBV29k5m1a
         Ke3Q==
X-Forwarded-Encrypted: i=1; AFNElJ9FP8M81WSU1yJK4dagdwOGqiSOzOeOY00wy46vVmd5tQo/coYeenE4d+34ETv11C+Y66OMOl7Ee7vA7Oxy@vger.kernel.org
X-Gm-Message-State: AOJu0YxxP3NBEH8FGPYLKpt/nImAo+FfkfQd2YWSKg2ji3X/C0DfOOKp
	3JvyJso+StVcd+Txleu+Ge6s765hyzbfJT4i3E2wpim8QIEswlqD5IQqp20dqj3aj6KJgIEc0bQ
	MOw0UxwIS7vl3PhupFpFVymir8JC501wpL3ZwfWOMFLbvS/Nyi2VGoWvfSYYdwSRLS3eD
X-Gm-Gg: AeBDievqnw6BLkOcEV3AWOgn+eHpE7iiHCAMINqErOvcCxe3axrSqm1izLNKlhZ3Da8
	2J26sI82p3UfBovnFhHF5wy4K7bCmaJuhR7sMIbGvZU/LiknVV8ew1e3G9o2SZgrkbpOzdiQyT/
	yKIrdZPVQdWoD6bp+xOyBYSA6TVhoMFfBg0Yvx3Cd4Ntea29FXD+AW4rJwdHhrQbyGJQdqXz8qu
	ZFPAv2GOej5EH9U5fgv2/n23LsgMPCfEMzNL4TA4iAZSTlSbAj0whM0XG2RooBwCMgEQ+nmO5Oa
	JKDwIu/t6z4rz1fKK23b7c9BwQUBHmAv+5h3d8GPheoUdDF3fE9upwo79l2jZg2RZgcBEX9+2nw
	FHjAFJxdgKR4CPM7lNffVApob1+lX549P3ERqoLeQVbxlEvMSlAIg4caWnnS8/AlTOA==
X-Received: by 2002:a17:90a:d886:b0:35b:8d89:719b with SMTP id 98e67ed59e1d1-365ab3e592amr4675129a91.1.1778088599507;
        Wed, 06 May 2026 10:29:59 -0700 (PDT)
X-Received: by 2002:a17:90a:d886:b0:35b:8d89:719b with SMTP id 98e67ed59e1d1-365ab3e592amr4675085a91.1.1778088598917;
        Wed, 06 May 2026 10:29:58 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-365c25f8cf9sm3370143a91.4.2026.05.06.10.29.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 10:29:58 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Date: Wed, 06 May 2026 22:59:43 +0530
Subject: [PATCH v1 2/2] spi: qcom-geni: Add trace events for Qualcomm GENI
 SPI driver
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260506-add-tracepoints-for-qcom-geni-spi-v1-2-c957cfe712d1@oss.qualcomm.com>
References: <20260506-add-tracepoints-for-qcom-geni-spi-v1-0-c957cfe712d1@oss.qualcomm.com>
In-Reply-To: <20260506-add-tracepoints-for-qcom-geni-spi-v1-0-c957cfe712d1@oss.qualcomm.com>
To: Steven Rostedt <rostedt@goodmis.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        "Mukesh Kumar Savaliya mukesh.savaliya"@oss.qualcomm.com,
        "Aniket Randive aniket.randive"@oss.qualcomm.com,
        chandana.chiluveru@oss.qualcomm.com, jyothi.seerapu@oss.qualcomm.com,
        Praveen Talari <praveen.talari@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778088585; l=4307;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=koNBStVdcC5+4m4qVXikoLETuVjLx01Mbb0BXniq3oE=;
 b=HN2AHHhrUfmFpmtaj+zY4KZuBKKeyAYcKBVexa6xYvmnaDePfMzl7tTUvARJk0ibqY1YoAq8U
 +4IlZ5Qp4C2AJHTIpRU41t4GqgyC0VeNvyBB8+j7gjM5bdCkPltx1Z1
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDE3MCBTYWx0ZWRfX8buYC6NXzOJf
 wv8AWScUq8Rk5tJgzDY4pJ6og2UmHqfOfHnWDah3iniyaa4RErZW2jxdOKCgJMc6jjTYoJ+t46S
 ZTW3VJeUu9s+fs7dhe216yNfEfwkzZfSnCzid570xxalI+X0rcgt0ZlIZYtiyH1KMPfooAnp3yk
 nblS5+xOtflWFgjN9YE26C2vs09KvObqK1am+zqVnqPsWYwmDMv+znoGdKpXCgQV1Lp1FiHTxOt
 mL/ycfU9n0YGOnGGq86Ue02gRg829mnSOtxxuQuKIhtXsj1nBC3vmMMczaRmlHw4a+ku0UnyIXK
 40Jn8FV5iwoPbWuGvaaiKYq9iCfWEKxcd21C1a0mp7+PiEiEvdEYatN06ZhEjMmILIT7fxX/brV
 AeocVT6yWcFreWWKMkK1vuQ3GJbmkA4UlZcFJ6HVj0ZNNjx9rF3BDioz4QSAOHAN+GaiG04dKhE
 uBgu+2Ykp9FL3X91oHQ==
X-Proofpoint-ORIG-GUID: OhZnToUlvsojoIStMItvzm-_SiK0D1tj
X-Proofpoint-GUID: OhZnToUlvsojoIStMItvzm-_SiK0D1tj
X-Authority-Analysis: v=2.4 cv=EpHiaycA c=1 sm=1 tr=0 ts=69fb7a98 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=YigI2Qbdxp8Yt7aqB9kA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605060170
X-Rspamd-Queue-Id: 8D9FB4DEE53
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-106176-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

Add tracepoints to the Qualcomm GENI (Generic Interface) SPI driver.
These trace events enable runtime debugging and performance analysis
of SPI operations.

The trace events capture SPI clock configuration, FIFO parameters,
transfer details, interrupt status, and actual transmitted/received
data in hexadecimal format.

Usage examples:

Enable all SPI traces:
  echo 1 > /sys/kernel/debug/tracing/events/qcom_geni_spi/enable
  cat /sys/kernel/debug/tracing/trace_pipe

Example trace output:

71.364028: geni_spi_fifo_params: 888000.spi: cs=0 mode=0x00000020
   mode_changed=0x00000020 cs_changed=0
71.364054: geni_spi_clk_cfg: 888000.spi: req_hz=10000000
   sclk_hz=100000000 clk_idx=5 clk_div=10 bpw=8
71.364095: geni_spi_transfer: 888000.spi: len=16 m_cmd=0x00000003
71.364096: geni_spi_tx_data: 888000.spi: tx_len=16 tx_rem=0 data=56 f1
   0d 95 c1 09 33 d2 27 e7 ec 9d 9c e2 11 ff
71.364121: geni_spi_irq: 888000.spi: m_irq=0x08000081 dma_tx=0x00000000
   dma_rx=0x00000000
71.364126: geni_spi_rx_data: 888000.spi: rx_len=16 rx_rem=0 data=56 f1
   0d 95 c1 09 33 d2 27 e7 ec 9d 9c e2 11 ff

Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
 drivers/spi/spi-geni-qcom.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c
index d5fb0edc8e0c..4da888359cfc 100644
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
 
+	trace_geni_spi_fifo_params(mas->dev, chipselect, spi_slv->mode,
+				   mode_changed, cs_changed);
+
 	return 0;
 }
 
@@ -717,6 +726,7 @@ static bool geni_spi_handle_tx(struct spi_geni_master *mas)
 		max_bytes = mas->tx_rem_bytes;
 
 	tx_buf = mas->cur_xfer->tx_buf + mas->cur_xfer->len - mas->tx_rem_bytes;
+
 	while (i < max_bytes) {
 		unsigned int j;
 		unsigned int bytes_to_write;
@@ -729,6 +739,7 @@ static bool geni_spi_handle_tx(struct spi_geni_master *mas)
 		iowrite32_rep(se->base + SE_GENI_TX_FIFOn, &fifo_word, 1);
 	}
 	mas->tx_rem_bytes -= max_bytes;
+	trace_geni_spi_tx_data(mas->dev, tx_buf, max_bytes, mas->tx_rem_bytes);
 	if (!mas->tx_rem_bytes) {
 		writel(0, se->base + SE_GENI_TX_WATERMARK_REG);
 		return false;
@@ -778,6 +789,8 @@ static void geni_spi_handle_rx(struct spi_geni_master *mas)
 			rx_buf[i++] = fifo_byte[j];
 	}
 	mas->rx_rem_bytes -= rx_bytes;
+
+	trace_geni_spi_rx_data(mas->dev, rx_buf, rx_bytes, mas->rx_rem_bytes);
 }
 
 static int setup_se_xfer(struct spi_transfer *xfer,
@@ -861,6 +874,8 @@ static int setup_se_xfer(struct spi_transfer *xfer,
 	spin_lock_irq(&mas->lock);
 	geni_se_setup_m_cmd(se, m_cmd, m_params);
 
+	trace_geni_spi_transfer(mas->dev, len, m_cmd);
+
 	if (mas->cur_xfer_mode == GENI_SE_DMA) {
 		if (m_cmd & SPI_RX_ONLY)
 			geni_se_rx_init_dma(se, sg_dma_address(xfer->rx_sg.sgl),
@@ -915,6 +930,8 @@ static irqreturn_t geni_spi_isr(int irq, void *data)
 	if (!m_irq && !dma_tx_status && !dma_rx_status)
 		return IRQ_NONE;
 
+	trace_geni_spi_irq(mas->dev, m_irq, dma_tx_status, dma_rx_status);
+
 	if (m_irq & (M_CMD_OVERRUN_EN | M_ILLEGAL_CMD_EN | M_CMD_FAILURE_EN |
 		     M_RX_FIFO_RD_ERR_EN | M_RX_FIFO_WR_ERR_EN |
 		     M_TX_FIFO_RD_ERR_EN | M_TX_FIFO_WR_ERR_EN))

-- 
2.34.1


