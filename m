Return-Path: <linux-arm-msm+bounces-107150-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eN7/MOdiA2oq5gEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107150-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 19:27:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C6AF0525CF2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 19:27:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id EABB13080215
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 17:14:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5075B385D85;
	Tue, 12 May 2026 17:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OEo0wrI1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TkQPXtnJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC1F23D79F9
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 17:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778606061; cv=none; b=OuFNqOakKDtC+YCul54N6bYdX28J5sHSp8ZTGX7rpzQKkwiskpAzPBGZs72DwUe812iQ+VzZBhFJpuMforB/oAWeDYoOAN4YwKKVYVqqLaMV+iJHp/U71zbtM4LnaLo7fBiWJ58db6myBjTwUNtsRtCyUHG8jXHjMOAMpmx15SY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778606061; c=relaxed/simple;
	bh=0PlDmiwcFo4z1rkout4ksGTQ4/rVyvYKV/OeqURRQeU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EvwZiosrpcGP6Tg35w53ZRElhh2Y8VIDigVIYajZil1K0FDwHeZWdCHLUlqVK4cYvBwYb3Nrz6XfLljK/e8sKhDosTpqF8JYIfaK1pVgQirpmczClgmQQmPxP58CobHMB06+bjJxpRrkLk6Q4eZD6oVPD4Bx6pwjgd4ZMCmkotM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OEo0wrI1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TkQPXtnJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64CCgs411409943
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 17:14:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Hiu9pCUQoNk1GtrevrrFuJ5w2VF2RliEONdrbhBWg+E=; b=OEo0wrI1jy+OXWua
	vttotWmdvUBF3sDpAnWt6xwUt0TW9HnstrAjrCDrbyCNUjDF9gWYB34EtjrHllav
	IHz7FK+0rfBlaPqRz2AWkukFN59tcVBqamEKXjntWvd0cYMjLzj/hIUtNQphWVQd
	pYxlXI9SwgNWIURjLKjzd6z9/4ZLNlSKJ9qvc2noyfsi9G+o4/lIhvp/hT3JmJX1
	Jz2EHpyT2UnqpHoCscIP3gR4J8kiup0U3wcvYeYHJF+HXkBTYmyXnW2caGEgLtWx
	1FkAiHHhzU2IyR2AF3SZHA++rVh52ncryG0Wq8pmsCYbY4dtv6N6ly4K51vlh1o8
	d8VZOA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e44f312hf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 17:14:18 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2bd04e4fe3dso16903325ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 10:14:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778606058; x=1779210858; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hiu9pCUQoNk1GtrevrrFuJ5w2VF2RliEONdrbhBWg+E=;
        b=TkQPXtnJdAAKAPuAv+KsM2a7i/2Y+CnIZCz4a6vFMbkiAPhSbS1/Nas5EtGKCarKM9
         suMzkFgd3C+Ru/nGPWueUnnGgZ8XR4rcnsV22RploIy7xajLtEMhkLb3CBWkaeQgsNm5
         CCzADjglVavSaJR7zl+vYVAVtrsp6romE/QdiKPdTERd1mffH1tJYmGMqItnNz/IhLCN
         4lNmUZ2KOuJCAc3+cQRaGW4ilUGkuZzI0dSVFUVmmCM7BIeLsWk8uHnGFGa1jPSh4qVg
         wAfzrT1y5jW3uCGdCm7UPBitW5QHvEPm93/+evoJJbTmgaAEZ8heVFmyNip2N/Qqvbq0
         hNyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778606058; x=1779210858;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Hiu9pCUQoNk1GtrevrrFuJ5w2VF2RliEONdrbhBWg+E=;
        b=HQKTNz7u7psVA2y3B1NhKjnXefRG0rHF8wjjApn1VugLsJOJHv8c08WuvqSU7v3goY
         yybb0ddvXslag+AgrA7ug1HGEDig9WcfCEXsQp4tvlnD6y3kv3c02wsUycNLJgTvPqyW
         jYqs8FI++R87D3YjNA6fU6NEp+HxcGBllfGKQzDZMqNPYlESMko6ZkIWPXCCXEtPV49b
         hhXwNFxvC0sU64Gvg/ndwjDm07KsTPBVAQAvtl1RTrlmnD6o05yeIEiLEYzSHnCa3qwf
         ZylUTjiFbiaRJTFEROUQoH0TqTJP/aiGltmMJuJRc7OTYcy3sQWi6h0t6A+CzpoXYfB5
         B73g==
X-Forwarded-Encrypted: i=1; AFNElJ99xnLceyLcS0R3NnTpVHPnsPBhyEY56eGdxTzcuAWdWrqsm1L9GQEb2wsaa/xovaugvCehKb8Ku/gGwtaA@vger.kernel.org
X-Gm-Message-State: AOJu0YzQpM4vENvgIdsnXAk92EC4WP0XY6vMrvkVMEDM2uoIHUOuO/3E
	GerpbWhtEDWBymtlgraCdr0mzdcUYKEmfroBpckzzqgz2sMqJnKpJkgAJWwlqH99SS+LoOIxo6e
	5v9yhFU5O2+zyumEbVICp0o872hhZy8IWrmebnm3mt3B0o0uQ8gWadvUT7SbDepHrQHPo
X-Gm-Gg: Acq92OGElslCSfEk1z5iAJdGzMZRKPuAte07hX0WgcCQcofJgK6LxY6r9496sMdhxRH
	nM19C3KlESKIrA8yjpdIkUggZUx2Og/qaTgRfv4lQVgsZdV8mYN9JgBxulbNpvihbKONwQwn6jG
	9NIc1BpA+x5DPk+Mulg9Xh9oOqIySX8ORxbvIiQOrNF3F7s3V5k5bfLqfQRUS0GKhaY7W5z4XVh
	Kce8+qxypRW4qQ6aDjRQHuBjd8xoM0iU9Nw0jjSFdnOF6/q9Oj35Hcm55Hcvq55RBeinJ34nq+R
	i9P+KdK2eModNGzVGH6A6iohry/UNCdmrdZK9asRXjyxRZTJe934jyvAqvYHLCRWd6RX1BOZkxr
	78hrffVtAlE0D/jeFVNt+GXSQJ25kQISYGZQdnsAvcdfYgZn88a7DyFA=
X-Received: by 2002:a17:903:145:b0:2bc:7eee:200a with SMTP id d9443c01a7336-2bc7eee20a0mr126597395ad.22.1778606058311;
        Tue, 12 May 2026 10:14:18 -0700 (PDT)
X-Received: by 2002:a17:903:145:b0:2bc:7eee:200a with SMTP id d9443c01a7336-2bc7eee20a0mr126596915ad.22.1778606057666;
        Tue, 12 May 2026 10:14:17 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1d40427sm149996685ad.24.2026.05.12.10.14.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 10:14:17 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Date: Tue, 12 May 2026 22:44:03 +0530
Subject: [PATCH v2 1/2] serial: qcom-geni: trace: Add tracepoint support
 for Qualcomm GENI serial
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260512-add-tracepoints-for-qcom-geni-serial-v2-1-a5726421b3af@oss.qualcomm.com>
References: <20260512-add-tracepoints-for-qcom-geni-serial-v2-0-a5726421b3af@oss.qualcomm.com>
In-Reply-To: <20260512-add-tracepoints-for-qcom-geni-serial-v2-0-a5726421b3af@oss.qualcomm.com>
To: Steven Rostedt <rostedt@goodmis.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Aniket Randive <aniket.randive@oss.qualcomm.com>,
        chandana.chiluveru@oss.qualcomm.com, jyothi.seerapu@oss.qualcomm.com,
        Praveen Talari <praveen.talari@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778606047; l=6340;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=0PlDmiwcFo4z1rkout4ksGTQ4/rVyvYKV/OeqURRQeU=;
 b=lYnz+GnqLRySyw8VFns47TjpSZ17aaMDA35Wh+b7RY7gPIhx+KoJkQLoTiScXTJb9d5U2AwpU
 15r4mYllqG1CCbfgBYH073USFxDClFIQNG8H7pZdbtmlefw1QjwenQQ
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Proofpoint-ORIG-GUID: JCnZz6V7iwCjCNPYfp9lLqDJpVftIPOH
X-Authority-Analysis: v=2.4 cv=SpSgLvO0 c=1 sm=1 tr=0 ts=6a035feb cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=ESrFBFgxKAYm4imzEJIA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDE3OSBTYWx0ZWRfX7QaEUC7jz6LV
 O0NEc/dFZofZP/qBrsIxPbvuSevpkXsfu2JEed+8NNoyokthIWyzwtbdPjmXrwlDL3E1XtzDAOX
 NpW737CIeWuXDpXVPjLmeR642mrD0on5OQn9mVpLUH4QYU/YN/wc2h/T34PPBtEK2naNUYzSCr7
 S7/7+16/CkZj29uAMh3XcuBj0vBkPHyYT0OjbIP/xWTVAHf5GQxdO84Fp3dcN5NnMaeKLgqwOxL
 0MVR4OjAZxJctTWzvGwEbN1PCe+NW+4ngI6q8RjxlkzoRlXbX+pcACblYb2vf2oRhz6WZZAsXuQ
 9IoFFWJjfMVlOmMTwvUke6JhJg8Fk59ncejpgo8qK83+niFH6ch4wM2cDfIGlnynVgnOiw/OG50
 +IJ96HuEC1Z6AoNgDyA29rLaaUPZYjW/QI76Sgq3aGqWi5V1xJmN/gkdsV0RDFOlLKLI7cC9XFE
 cjXkBsIgq7TYv1pqfZw==
X-Proofpoint-GUID: JCnZz6V7iwCjCNPYfp9lLqDJpVftIPOH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 impostorscore=0 bulkscore=0
 spamscore=0 phishscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605120179
X-Rspamd-Queue-Id: C6AF0525CF2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-107150-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Add tracepoint support to the Qualcomm GENI serial driver to provide
runtime visibility into driver behavior without requiring invasive debug
patches.

The trace events cover UART termios configuration, clock setup, modem
control state, interrupt status, and TX/RX data, making it easier to
diagnose communication issues in the field.

Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
v1->v2:
- Removed multiple TX/RX trace events, instead used
  DECLARE_EVENT_CLASS and DEFINE_EVENT.
---
 include/trace/events/qcom_geni_serial.h | 172 ++++++++++++++++++++++++++++++++
 1 file changed, 172 insertions(+)

diff --git a/include/trace/events/qcom_geni_serial.h b/include/trace/events/qcom_geni_serial.h
new file mode 100644
index 000000000000..5e23827881d0
--- /dev/null
+++ b/include/trace/events/qcom_geni_serial.h
@@ -0,0 +1,172 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#undef TRACE_SYSTEM
+#define TRACE_SYSTEM qcom_geni_serial
+
+#if !defined(_TRACE_QCOM_GENI_SERIAL_H) || defined(TRACE_HEADER_MULTI_READ)
+#define _TRACE_QCOM_GENI_SERIAL_H
+
+#include <linux/device.h>
+#include <linux/tracepoint.h>
+
+TRACE_EVENT(geni_serial_set_termios,
+	    TP_PROTO(struct device *dev, unsigned int baud,
+		     unsigned int bits_per_char, u32 tx_trans_cfg,
+		     u32 tx_parity_cfg, u32 rx_trans_cfg,
+		     u32 rx_parity_cfg, u32 stop_bit_len),
+	    TP_ARGS(dev, baud, bits_per_char, tx_trans_cfg, tx_parity_cfg,
+		    rx_trans_cfg, rx_parity_cfg, stop_bit_len),
+
+	    TP_STRUCT__entry(__string(name, dev_name(dev))
+			     __field(unsigned int, baud)
+			     __field(unsigned int, bits_per_char)
+			     __field(u32, tx_trans_cfg)
+			     __field(u32, tx_parity_cfg)
+			     __field(u32, rx_trans_cfg)
+			     __field(u32, rx_parity_cfg)
+			     __field(u32, stop_bit_len)
+	    ),
+
+	    TP_fast_assign(__assign_str(name);
+			   __entry->baud = baud;
+			   __entry->bits_per_char = bits_per_char;
+			   __entry->tx_trans_cfg = tx_trans_cfg;
+			   __entry->tx_parity_cfg = tx_parity_cfg;
+			   __entry->rx_trans_cfg = rx_trans_cfg;
+			   __entry->rx_parity_cfg = rx_parity_cfg;
+			   __entry->stop_bit_len = stop_bit_len;
+	    ),
+
+	    TP_printk("%s: baud=%u bpc=%u tx_trans=0x%08x tx_par=0x%08x rx_trans=0x%08x rx_par=0x%08x stop=%u",
+		      __get_str(name), __entry->baud, __entry->bits_per_char,
+		      __entry->tx_trans_cfg, __entry->tx_parity_cfg,
+		      __entry->rx_trans_cfg, __entry->rx_parity_cfg,
+		      __entry->stop_bit_len)
+);
+
+TRACE_EVENT(geni_serial_clk_cfg,
+	    TP_PROTO(struct device *dev, unsigned int desired_rate,
+		     unsigned long clk_rate, unsigned int clk_div,
+		     unsigned int clk_idx),
+	    TP_ARGS(dev, desired_rate, clk_rate, clk_div, clk_idx),
+
+	    TP_STRUCT__entry(__string(name, dev_name(dev))
+			     __field(unsigned int, desired_rate)
+			     __field(unsigned long, clk_rate)
+			     __field(unsigned int, clk_div)
+			     __field(unsigned int, clk_idx)
+	    ),
+
+	    TP_fast_assign(__assign_str(name);
+			   __entry->desired_rate = desired_rate;
+			   __entry->clk_rate = clk_rate;
+			   __entry->clk_div = clk_div;
+			   __entry->clk_idx = clk_idx;
+	    ),
+
+	    TP_printk("%s: desired_rate=%u clk_rate=%lu clk_div=%u clk_idx=%u",
+		      __get_str(name), __entry->desired_rate, __entry->clk_rate,
+		      __entry->clk_div, __entry->clk_idx)
+);
+
+TRACE_EVENT(geni_serial_irq,
+	    TP_PROTO(struct device *dev, u32 m_irq, u32 s_irq,
+		     u32 dma_tx, u32 dma_rx),
+	    TP_ARGS(dev, m_irq, s_irq, dma_tx, dma_rx),
+
+	    TP_STRUCT__entry(__string(name, dev_name(dev))
+			     __field(u32, m_irq)
+			     __field(u32, s_irq)
+			     __field(u32, dma_tx)
+			     __field(u32, dma_rx)
+	    ),
+
+	    TP_fast_assign(__assign_str(name);
+			   __entry->m_irq = m_irq;
+			   __entry->s_irq = s_irq;
+			   __entry->dma_tx = dma_tx;
+			   __entry->dma_rx = dma_rx;
+	    ),
+
+	    TP_printk("%s: m_irq=0x%08x s_irq=0x%08x dma_tx=0x%08x dma_rx=0x%08x",
+		      __get_str(name), __entry->m_irq, __entry->s_irq,
+		      __entry->dma_tx, __entry->dma_rx)
+);
+
+DECLARE_EVENT_CLASS(geni_serial_data,
+
+	TP_PROTO(struct device *dev, const u8 *buf, unsigned int len),
+
+	TP_ARGS(dev, buf, len),
+
+	TP_STRUCT__entry(__string(name, dev_name(dev))
+			 __field(unsigned int, len)
+			 __dynamic_array(u8, data, len)
+	),
+
+	TP_fast_assign(__assign_str(name);
+		       __entry->len = len;
+		       memcpy(__get_dynamic_array(data), buf, len);
+	),
+
+	TP_printk("%s: len=%u data=%s",
+		  __get_str(name), __entry->len,
+		  __print_hex(__get_dynamic_array(data), __entry->len))
+);
+
+DEFINE_EVENT(geni_serial_data, geni_serial_tx_data,
+
+	TP_PROTO(struct device *dev, const u8 *buf, unsigned int len),
+
+	TP_ARGS(dev, buf, len)
+
+);
+
+DEFINE_EVENT(geni_serial_data, geni_serial_rx_data,
+
+	TP_PROTO(struct device *dev, const u8 *buf, unsigned int len),
+
+	TP_ARGS(dev, buf, len)
+
+);
+
+TRACE_EVENT(geni_serial_set_mctrl,
+	    TP_PROTO(struct device *dev, unsigned int mctrl,
+		     u32 uart_manual_rfr),
+	    TP_ARGS(dev, mctrl, uart_manual_rfr),
+
+	    TP_STRUCT__entry(__string(name, dev_name(dev))
+			     __field(unsigned int, mctrl)
+			     __field(u32, uart_manual_rfr)
+	    ),
+
+	    TP_fast_assign(__assign_str(name);
+			   __entry->mctrl = mctrl;
+			   __entry->uart_manual_rfr = uart_manual_rfr;
+	    ),
+
+	    TP_printk("%s: mctrl=0x%04x uart_manual_rfr=0x%08x",
+		      __get_str(name), __entry->mctrl, __entry->uart_manual_rfr)
+);
+
+TRACE_EVENT(geni_serial_get_mctrl,
+	    TP_PROTO(struct device *dev, unsigned int mctrl, u32 geni_ios),
+	    TP_ARGS(dev, mctrl, geni_ios),
+
+	    TP_STRUCT__entry(__string(name, dev_name(dev))
+			     __field(unsigned int, mctrl)
+			     __field(u32, geni_ios)
+	    ),
+
+	    TP_fast_assign(__assign_str(name);
+			   __entry->mctrl = mctrl;
+			   __entry->geni_ios = geni_ios;
+	    ),
+
+	    TP_printk("%s: mctrl=0x%04x geni_ios=0x%08x",
+		      __get_str(name), __entry->mctrl, __entry->geni_ios)
+);
+
+#endif /* _TRACE_QCOM_GENI_SERIAL_H */
+
+/* This part must be outside protection */
+#include <trace/define_trace.h>

-- 
2.34.1


