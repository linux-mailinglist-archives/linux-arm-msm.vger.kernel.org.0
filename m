Return-Path: <linux-arm-msm+bounces-106496-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YH9hGS3N/GlhTwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106496-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 19:34:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A640C4ECE94
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 19:34:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2BDD93008D0F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 17:33:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDBE334EF0D;
	Thu,  7 May 2026 17:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NiiHzniW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j8+Z/Dpm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 546EE327204
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 17:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778175230; cv=none; b=LPFKkePcU4hxoNBPOQD8YAjFijKqC5WKvj+2vpsSLamdB7I3gu/da6FKaDYV1vIJu9ITlPM3F0tX2cLhNm0JWRheBQ7nyXWJ+CtXKYZsFcf5Z5sH8Zk6SL/Ir64IzN4Gh77rHSBG3IbcCPTME0ZHswVjzmWSdnrQ5FQGP5EXLHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778175230; c=relaxed/simple;
	bh=cLQZJH2kGtnDZyrn1tg3E2cgngZlOy76lIc1/a36KWo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QscOW/DHyBKQSOaCLJu8hWjci1smN6DkUgnZRUEihFE2guby2+XJ/Xpcl25bYteLflIHrvAYHXPifoMpRCbWnB5lspQgsvBckxWVjFz1jcHbBpYraX3eyTXVE82YrKI9vE9AHF6vIJEMUK9BQ3B+UGABcyqO2FtlZHKcI9SAYSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NiiHzniW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j8+Z/Dpm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 647GnNNU152860
	for <linux-arm-msm@vger.kernel.org>; Thu, 7 May 2026 17:33:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fsf86z252hMHtoLYavCefPTQKf7GBUSrOYzr87mZoo0=; b=NiiHzniWe8XPtoO+
	k2zosy55anP+pxjUMCfpPcPKPlkMuirP6ETTll6iRH+mMryJneYpZVd3MO/OKwsS
	Ze9Xfhvnin3VULp3DJmXwu2WWksdCCF6OrNX4VmExftuNO2mpypXr8CnsqDXOarh
	JVDIdegiIo4HoXGnfy/Lol1PW6BAN+bBIuvGvHStxfZYsA9tpZPQF13pGe5Ni4Af
	0kSJr3RBilAYHC0SDRX/+JfebjooCvFMBY/3jzg5TA7YOqRzOwKuomDtxFwylLF8
	ye1bD8ZytO0kaFhSe9Lnsfe/aU2omjl6Codk3ft0z36wmhX+CfXWza/IQpj37Jqa
	zF8qNg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0kctu458-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 17:33:48 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2ef62078ee7so1368492eec.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 10:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778175226; x=1778780026; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fsf86z252hMHtoLYavCefPTQKf7GBUSrOYzr87mZoo0=;
        b=j8+Z/Dpmz+mgxNfSMolwuFMqjWrfbWijLqfKT4YHB0Cdq/Bydcz4xDt2NUU5aHYM6h
         3l1RtSMwTTd5xD0hXsFyH0WVnuV0x4r0R0ObBH4gLH8FXiY4Dy2htLtaE48P5rka27au
         jzk212RRZpwBG8/x+veeyNlkN27g6ij0fCf5wy+R2spZIeVhll5dPy+dgG7dVWxJdKZ5
         zCFcfD4W2fkCX7TiUCOV1h5Gk2yIhP6S9CwRZiUMILJodqVhVueNDd8y5XvbKnRBHIu7
         MAfR0bp+8x7yyt85Q0anksyrh66zb5KDVLELrfNJYigl7qiTwMOUO82O+9WDemg5VL29
         al5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778175226; x=1778780026;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fsf86z252hMHtoLYavCefPTQKf7GBUSrOYzr87mZoo0=;
        b=k1V8uLBnxTrTlsVhH3+xsgk0vhPHKF1E5l593XSX+u1+ytU9JrRYloW2iu24MfwExb
         9cDczvT5VdBqYR1QBHvTK2B6uyBf8OcSO+IyVmCJ95zQ13LimqAoNt2ZNwMfwt6lXiGH
         uPAzU7eINaX5VRNByQ7qXBuiyg4qSKyn3qbDrVolI8wxI6huKRSdi1hYK/5F+4LTFJur
         BlU3ElGHCyNtUii2g1/PUBLgy0wcVZqspq1T3jN2pJHhAHQZ+uKimXhwTLDfAEthY/Yg
         cfkTbK/PpAPbc1WhIZDr/ztEQrspbHHzfto3fTLOowVxw9YSebibONuIBXOKBrHDHsaJ
         /JAg==
X-Forwarded-Encrypted: i=1; AFNElJ/0Q7ndSYiSH8McMB1GtAiM/LuVK0wXv+EYGcV0jZTUX4av3FVHugIlYYfyC3K2MIBxC9D4wypvBPP7VALt@vger.kernel.org
X-Gm-Message-State: AOJu0Ywx3j41ePWsmE3t8zx0fK9PsYS4EXY701eQMA2Vbbg2bqdZo8BG
	mBnnUvovHdv6qPwPXbWq4BH5AbDGPW9WsTY7uCSy7SjXwKl9H4eIlzpRiiEdPvCY5T5omoYic6d
	ZbMLS8wU6PiX9Ax8DMTEo2CGx2E0yADIvO8NQEneyaMawDxz6PMDBXZjFWvvwR8abQFq1
X-Gm-Gg: AeBDietq69oA8YfB1CMi/cpSCsk4sNxn8EVW5UQGtFxQTVlmaxH7TwcN/G3Awv8TOQO
	KWdOJ+xCJc25MDt+ip3ggdyihLKvAE80QXrOrLX/NwkdxupirDAMfxuoqoSUQEnRRHHOh3BKcLL
	kVlsx3YMx/fMUuQRe5Qd0a7ns2KLOVfSvuIM6C8NjJxhzCN/iKYqTV4wtASlE+lYMRhZqH7jJWj
	aLR63q8OLEozfl3BxkPXRMqhMPdsgHFpSh2Q3p3c5roSz9Mn+pbJ9eHeuJeFWTA+GyOCtDMLa5n
	krZ/83tzXlXY+vAEdz795ksIyvoHnY1KlNpnprkkL4rNzGgCMj0o1tGLQhP2ZTHezH7cPsypLII
	4sUpiR/mC2vjx2yXWmwDLFxeHVZgoN51mcMq0Xzy3xgOZF/8mQ30eCg==
X-Received: by 2002:a05:7301:3f16:b0:2ea:e93a:ff9b with SMTP id 5a478bee46e88-2f54919160dmr3866046eec.13.1778175226284;
        Thu, 07 May 2026 10:33:46 -0700 (PDT)
X-Received: by 2002:a05:7301:3f16:b0:2ea:e93a:ff9b with SMTP id 5a478bee46e88-2f54919160dmr3866033eec.13.1778175225596;
        Thu, 07 May 2026 10:33:45 -0700 (PDT)
Received: from [192.168.1.6] ([49.204.109.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f56f7967cfsm9440324eec.19.2026.05.07.10.33.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 10:33:45 -0700 (PDT)
Message-ID: <59e36f20-891d-4a58-8cc4-6822d03daa23@oss.qualcomm.com>
Date: Thu, 7 May 2026 23:03:39 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] spi: qcom-geni: trace: Add trace events for
 Qualcomm GENI SPI
To: Mark Brown <broonie@kernel.org>
Cc: Steven Rostedt <rostedt@goodmis.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        MukeshKumarSavaliyamukesh.savaliya@oss.qualcomm.com,
        AniketRandiveaniket.randive@oss.qualcomm.com,
        chandana.chiluveru@oss.qualcomm.com, jyothi.seerapu@oss.qualcomm.com
References: <20260506-add-tracepoints-for-qcom-geni-spi-v1-0-c957cfe712d1@oss.qualcomm.com>
 <20260506-add-tracepoints-for-qcom-geni-spi-v1-1-c957cfe712d1@oss.qualcomm.com>
 <afvkiT50ZUEXZ-YO@sirena.co.uk>
 <e4651363-7c1c-4ae0-a97b-b64841424c83@oss.qualcomm.com>
 <afxJmZ9MkP5eJkQC@sirena.co.uk>
Content-Language: en-US
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
In-Reply-To: <afxJmZ9MkP5eJkQC@sirena.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=XsPK/1F9 c=1 sm=1 tr=0 ts=69fcccfc cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=TOgzk8GLwxQW6KRttr6vHg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=1cC0H0qRpQ7oy3NfP0gA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: N3gVA3z8_Vq0R_dKwgsYvpimfq7CfBLH
X-Proofpoint-ORIG-GUID: N3gVA3z8_Vq0R_dKwgsYvpimfq7CfBLH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDE3NyBTYWx0ZWRfX2nEOOdyeOxxT
 Ndh11OfT9n5lMJeBoO52E8UbIrqzwddpzb3rcvS+BmYF5pRDQAGhuvcf8xljl2K2PjIIW741Hxp
 NFyHaCS2xmlBCivo40qVHgGS5Cijh7U119ioXELdcHZncDLdjHK9jsd1DUIvYDyY44P0jey0VMN
 vC9N+pAN+SsCzzjKydbma537Rvuf1caTinPW1x4Cm8g0WP3W/fqwYeNUOm+IyZJ7RZIkuOKoFT/
 kIdTEmAthgAaGwqeLDVcoMSUZSCSxIRN0j8tes43rRRYqRTwXaenDMDQK+90a5ZoHRYRbaT9KSi
 9N5UPT3Ou9KFM8JPHceP/d0+3Ef+FAniuAT6RzCR4KKxNJ9bbqtKXry274juJtgIHaC4GyEnhhC
 BS9w0jYMhwQwEwftxNuCyosGldO86b8DKB58y6lbl1lOd7yyMHHBLEBmz8F4v1HGRel6G1AIYDu
 WnR16SKPdUgFRFhYL7w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070177
X-Rspamd-Queue-Id: A640C4ECE94
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
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-106496-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
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
X-Rspamd-Action: no action

Hi Mark,

On 07-05-2026 13:43, Mark Brown wrote:
> On Thu, May 07, 2026 at 08:58:02AM +0530, Praveen Talari wrote:
>> On 07-05-2026 06:32, Mark Brown wrote:
>>> At least these feel like they really should be generic events, there
>>> hopefully isn't anything driver specific about them.
>> Initially implemented as a generic event; however, splitting into separate
>> TX and RX events may be more appropriate.
>> Which approach would you prefer?
> By generic I mean this should not be driver specific at all.
I hope these changes are fine. Please let me know if you have any 
concerns or feedback.

diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c
index 4da888359cfc..9abb5f4f719b 100644
--- a/drivers/spi/spi-geni-qcom.c
+++ b/drivers/spi/spi-geni-qcom.c
@@ -1,6 +1,8 @@
  // SPDX-License-Identifier: GPL-2.0
  // Copyright (c) 2017-2018, The Linux foundation. All rights reserved.

+#include <trace/events/spi.h>
+
  #define CREATE_TRACE_POINTS
  #include <trace/events/qcom_geni_spi.h>

@@ -709,6 +711,7 @@ static unsigned int geni_byte_per_fifo_word(struct 
spi_geni_master *mas)

  static bool geni_spi_handle_tx(struct spi_geni_master *mas)
  {
+       struct spi_controller *spi = dev_get_drvdata(mas->dev);
         struct geni_se *se = &mas->se;
         unsigned int max_bytes;
         const u8 *tx_buf;
@@ -739,7 +742,7 @@ static bool geni_spi_handle_tx(struct 
spi_geni_master *mas)
                 iowrite32_rep(se->base + SE_GENI_TX_FIFOn, &fifo_word, 1);
         }
         mas->tx_rem_bytes -= max_bytes;
-       trace_geni_spi_tx_data(mas->dev, tx_buf, max_bytes, 
mas->tx_rem_bytes);
+       trace_spi_tx_data(spi->cur_msg->spi, tx_buf, max_bytes, 
mas->tx_rem_bytes);
         if (!mas->tx_rem_bytes) {
                 writel(0, se->base + SE_GENI_TX_WATERMARK_REG);
                 return false;
@@ -749,6 +752,7 @@ static bool geni_spi_handle_tx(struct 
spi_geni_master *mas)

  static void geni_spi_handle_rx(struct spi_geni_master *mas)
  {
+       struct spi_controller *spi = dev_get_drvdata(mas->dev);
         struct geni_se *se = &mas->se;
         u32 rx_fifo_status;
         unsigned int rx_bytes;
@@ -790,7 +794,7 @@ static void geni_spi_handle_rx(struct 
spi_geni_master *mas)
         }
         mas->rx_rem_bytes -= rx_bytes;

-       trace_geni_spi_rx_data(mas->dev, rx_buf, rx_bytes, 
mas->rx_rem_bytes);
+       trace_spi_rx_data(spi->cur_msg->spi, rx_buf, rx_bytes, 
mas->rx_rem_bytes);
  }

  static int setup_se_xfer(struct spi_transfer *xfer,
diff --git a/include/trace/events/spi.h b/include/trace/events/spi.h
index e63d4a24d879..4907625e019d 100644
--- a/include/trace/events/spi.h
+++ b/include/trace/events/spi.h
@@ -233,6 +233,53 @@ DEFINE_EVENT(spi_transfer, spi_transfer_stop,

  );

+DECLARE_EVENT_CLASS(spi_data,
+
+       TP_PROTO(struct spi_device *spi, const u8 *buf, unsigned int len,
+                unsigned int rem),
+
+       TP_ARGS(spi, buf, len, rem),
+
+       TP_STRUCT__entry(
+               __field(        int,            bus_num         )
+               __field(        int,            chip_select     )
+               __field(        unsigned int,   len             )
+               __field(        unsigned int,   rem             )
+               __dynamic_array(u8,     data,           len     )
+       ),
+
+       TP_fast_assign(
+               __entry->bus_num = spi->controller->bus_num;
+               __entry->chip_select = spi_get_chipselect(spi, 0);
+               __entry->len = len;
+               __entry->rem = rem;
+               memcpy(__get_dynamic_array(data), buf, len);
+       ),
+
+       TP_printk("spi%d.%d len=%u rem=%u data=%s",
+                 __entry->bus_num, __entry->chip_select,
+                 __entry->len, __entry->rem,
+                 __print_hex(__get_dynamic_array(data), __entry->len))
+);
+
+DEFINE_EVENT(spi_data, spi_tx_data,
+
+       TP_PROTO(struct spi_device *spi, const u8 *buf, unsigned int len,
+                unsigned int rem),
+
+       TP_ARGS(spi, buf, len, rem)
+
+);
+
+DEFINE_EVENT(spi_data, spi_rx_data,
+
+       TP_PROTO(struct spi_device *spi, const u8 *buf, unsigned int len,
+                unsigned int rem),
+
+       TP_ARGS(spi, buf, len, rem)
+
+);
+
  #endif /* _TRACE_POWER_H */



Thanks,

Praveen Talari


