Return-Path: <linux-arm-msm+bounces-109904-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id INPmEVPfFWq1dgcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109904-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 19:58:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DF4FD5DB0C7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 19:58:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C144C30CA47C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 17:38:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A27B538B7DC;
	Tue, 26 May 2026 17:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Bq9PkBWB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kccISZ4j"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 198BF41B340
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 17:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779817077; cv=none; b=FkVj4NQB4SiJ+TucqDbPvTKkVqqLSOLsaoIjvWR+qPv5Y4HwNByN9RW+Rzr9pwHq3QRWBn7JZb3FsMEiLYtStVX8PQhkF42MePOwaKQ6R2tTDTCvCLWFj1aWp80Jyk9aL4TRzt0BVnu5p72nk+2ZIV9iF7hsHvWkSaAtshGAlhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779817077; c=relaxed/simple;
	bh=bE5uS5jA4gBHIOsnRhx9ylByIay9uNE8JeImQsB7G9Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nGUFZyfSsQ4zODdOt5CMobDoQo+gANJ/6ROaKnK5mTdgRj+rz22FkmTIYYalw9GEBSrvfEtonSgxdtwL4rrdAXYfLBNH2WULlVSnATqSbEbTNy8tiGJqqHfOeOZQSAWZrNqme1/qWnkqY2FIyEQU4pRjc+6v6S4ChVa2xESdlno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Bq9PkBWB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kccISZ4j; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64QH1dca3147086
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 17:37:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SfH/3JY9K6L3mKJHK5XJzCKs/zpVCvC7Z8FqVLUpQcg=; b=Bq9PkBWB886q9OuI
	P969TFKaH9c0pL8BEsl0RFlvMa8/F1Sn/rHXIzbbacNv6+rxu2/CB2kLgfbQDcif
	hOlB0wihcB5qrwJ86mVHhwV9QVQA7ldfSwrgqkMK9LUX9UX1Oirjk94nF24m3nS5
	ihhy7dZE742wDsWl3Mo0yNKBH7UaG3hra1UCvFGO75mYFwdGk/pLcQWJeUZEdjJB
	s0w4NP398yDhNt8stH1C9L8hF7xD9JdaFQAJ/cCKpWHkpGPd7MbEPw1XoKi2Une5
	HUxAVgi3uDEgMVsFa6Ro6XXvQsdReny6VCF/YfDMilZEU5u3tc7uOfdT4Vgv8YT3
	Se0efg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ed5v3u84b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 17:37:54 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c850ff84ddfso7758900a12.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 10:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779817074; x=1780421874; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SfH/3JY9K6L3mKJHK5XJzCKs/zpVCvC7Z8FqVLUpQcg=;
        b=kccISZ4jlqZjvSbKOuRK3Q2GioouJG2wsXdsVvKc4bYwaiysY+yslLQLx72MCmCkIH
         fqeLxIMz75cuxl+bHQlav6RwJqBMwxdzYHHrjEu5WwHF0dSApEE+ghf1AsxHk12NJ8Dd
         YRVY8w2d6suGCzhF3ap0AIlz/rFi4y7pCs+1AXwvRA6rQ2UCgJzYPFkx62ZDjBVqEFMe
         RaVICbCVNgi8Lah3VbSoUVDbQTJsfw8d24nBEd8WedAptMBNV6LkqrNu9B+sc4QaT1Lw
         e2JhtYf0bKhGIITXITOvgbRwEATVeTG2DBky3ir5e13/tdeRBvHm8hiXnRy5784xmn2Z
         Y+sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779817074; x=1780421874;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SfH/3JY9K6L3mKJHK5XJzCKs/zpVCvC7Z8FqVLUpQcg=;
        b=iDp2eXKFBpVAKBGZkP7U+X91dZITjDAc5Tljj70xSaXhzt2HJ1rKNY43YoymVFi2zT
         1a36UAFPtLbdPnxfOcq0YkuGNiTKLYCpDvgrFWNbMk7HbjdUMvW88o5ZJzwZz19X6cnK
         zh47mHk8KXKae8MFjc98mMA2cIU5Q9q7UU1tokUisOx5XoKr4Qd/hIuSXxsN3t9VgHk8
         QiIOjfZsh6HxHVQxp5HtJkmSiAqW8xNEkgImEWfXn6o5LGsT8by52KJP2JCr8gtj1Pry
         Vcqa9qmmapL1gXL+xV3sfbr9SRcKkwB+uIfYc9K0vRaiXlfSY4tTECVam+SrH/Egqen1
         AdHg==
X-Forwarded-Encrypted: i=1; AFNElJ+UR6F+EjPqvXJE0BZQggFxcepcxpB5Vq2dOCiuqctmUZokvtgM6uQx0jyYwI8w9PcCk4ZHRG9JGVg2E9si@vger.kernel.org
X-Gm-Message-State: AOJu0YzsUYtURxNeBagpJTUHxKT7W2PkV0v+5LxsfWjEd7DXQ+IlrGWr
	Oiklu1731iihJ33bdcXqZRTS5wIyHebbeMrLSUBcVG9XcK6xRFgZJLAjvohaCpPGGliD5dxYZ8h
	z3cjGCRi44bx1M/hRwdpu8A7lIlA+8ZMc9XMLDdfmGGKr1mppsW3YE5w3sPsD3fVX1GAT
X-Gm-Gg: Acq92OGi9PQetRxLIYIaoqJrsbl9yyYWNA8tq8dtEQWM7LVs/8kd424vHWm+7mHt2iw
	s8hZ9O80NhYTQhO14GH33Yd8PyZX/envQ5bk2gMnEfWZencLg8SZD+W/h1/hwstb/NvwSFjBeox
	xOzz/rszsKifX0+6Ykfd8i9F49pmYExvg9egIx/O9c5u6VHSUr8o7wlrO/9OLaURzJXFMq53gk9
	XJ1+/LoNOnP19Oum7iE0BYGRjL82W/C30v8wkxzl1+khu1NhB61+1mKB6UOQCUHHnkFrSNYLcaH
	MBjhxy1k7mmZPu/HM9Z3NuWgFj8yEe0XBikiXItUv0scOGiHuDeuZhkYFZTDL0T9Bcze+V7wrMD
	v4OW+5pwTqUv0U8qVRlzbrUYWsEPJ6PvM5PC9shLoW74Gu/3lTPBfWm1aW6dMNgRN2g==
X-Received: by 2002:a05:6a00:39a6:b0:83f:a040:a3d3 with SMTP id d2e1a72fcca58-8415f39bb02mr19599045b3a.43.1779817073858;
        Tue, 26 May 2026 10:37:53 -0700 (PDT)
X-Received: by 2002:a05:6a00:39a6:b0:83f:a040:a3d3 with SMTP id d2e1a72fcca58-8415f39bb02mr19599012b3a.43.1779817073272;
        Tue, 26 May 2026 10:37:53 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-841c32b511dsm3260461b3a.48.2026.05.26.10.37.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 10:37:53 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Date: Tue, 26 May 2026 23:07:39 +0530
Subject: [PATCH v4 1/2] serial: qcom-geni: trace: Add tracepoint support
 for Qualcomm GENI serial
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-add-tracepoints-for-qcom-geni-serial-v4-1-e94fbaec0232@oss.qualcomm.com>
References: <20260526-add-tracepoints-for-qcom-geni-serial-v4-0-e94fbaec0232@oss.qualcomm.com>
In-Reply-To: <20260526-add-tracepoints-for-qcom-geni-serial-v4-0-e94fbaec0232@oss.qualcomm.com>
To: Steven Rostedt <rostedt@goodmis.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, konrad.dybcio@oss.qualcomm.com
Cc: Praveen Talari <praveen.talari@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org,
        mukesh.savaliya@oss.qualcomm.com, aniket.randive@oss.qualcomm.com,
        chandana.chiluveru@oss.qualcomm.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779817064; l=6634;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=bE5uS5jA4gBHIOsnRhx9ylByIay9uNE8JeImQsB7G9Y=;
 b=rTSTQGxsEroBnOXPvxhp84afXRCDlvR2b1ji0u/PHA09e7OOxq39uE05/Qf7ob/SZmEQ3Bqvs
 dnUlsV5HOJpCOsObRVp5COvIYaHr5n+/5Ogv8+KP16eZM03pAqa/WSx
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDE1MyBTYWx0ZWRfX7f3WamV2eZJ3
 IghYXR0M006yXrU35yCwMFeBisMoMHqHS1Fll2HI4hpkP9kb1E17zXcJB0Xasd0cbpuiJbd+QpE
 S8RKUmgdIU2Wv3BkdZsTWndyah+PjVbQOMPr0o78UigYbCu+5thxk8T904Gil6+hwrCPt6Nr6sL
 z+3WOp81EKxLCHBY2sXEzCKRZ+8vUdRqqysmNPGPtADZnasYWno8+7IurIx9d57T8eX/97gWVlz
 Ik3dNCoQyyPg7ZylnkBUSn5DcQqZxvEBKOGuNQ0L/ZDOCA3k/31ehMT65INaFzphw/781rSkKHB
 chAEseMhLmRY303pB1GrLuR+AsFGHVP44zKe6PSO7KoBIUy2nWumL6oEjoUCUqlIw+9d79FF1T1
 cpB5cilDwTF07Iz+/KIdoihigEMXHHmQEgxGJ1f3wme6qhq1I7p/rCGUYrDFqmAaCIYO0H1ltoj
 vt0hI8qP4DDuPlhWlmw==
X-Authority-Analysis: v=2.4 cv=Zc4t8MVA c=1 sm=1 tr=0 ts=6a15da72 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=ESrFBFgxKAYm4imzEJIA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: j_Rcx36_WUsuecJMJ3LtVgrbB2lkC43G
X-Proofpoint-GUID: j_Rcx36_WUsuecJMJ3LtVgrbB2lkC43G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_04,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 impostorscore=0 bulkscore=0 adultscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605260153
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-109904-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
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
X-Rspamd-Queue-Id: DF4FD5DB0C7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add tracepoint support to the Qualcomm GENI serial driver to provide
runtime visibility into driver behavior without requiring invasive debug
patches.

The trace events cover UART termios configuration, clock setup, modem
control state, interrupt status, and TX/RX data, making it easier to
diagnose communication issues in the field.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
v2->v3:
- Removed \n from geni_serial_tx_data and geni_serial_rx_data events.
- Resolved aligment issues in geni_serial_data, geni_serial_tx_data and
  geni_serial_rx_data events.

v1->v2:
- Removed multiple TX/RX trace events, instead used
  DECLARE_EVENT_CLASS and DEFINE_EVENT.
---
 include/trace/events/qcom_geni_serial.h | 164 ++++++++++++++++++++++++++++++++
 1 file changed, 164 insertions(+)

diff --git a/include/trace/events/qcom_geni_serial.h b/include/trace/events/qcom_geni_serial.h
new file mode 100644
index 000000000000..417ec01f9fc8
--- /dev/null
+++ b/include/trace/events/qcom_geni_serial.h
@@ -0,0 +1,164 @@
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
+		    TP_PROTO(struct device *dev, const u8 *buf, unsigned int len),
+		    TP_ARGS(dev, buf, len),
+
+		    TP_STRUCT__entry(__string(name, dev_name(dev))
+				     __field(unsigned int, len)
+				     __dynamic_array(u8, data, len)
+		    ),
+
+		    TP_fast_assign(__assign_str(name);
+				   __entry->len = len;
+				   memcpy(__get_dynamic_array(data), buf, len);
+		    ),
+
+		    TP_printk("%s: len=%u data=%s",
+			      __get_str(name), __entry->len,
+			      __print_hex(__get_dynamic_array(data), __entry->len))
+);
+
+DEFINE_EVENT(geni_serial_data, geni_serial_tx_data,
+	     TP_PROTO(struct device *dev, const u8 *buf, unsigned int len),
+	     TP_ARGS(dev, buf, len)
+);
+
+DEFINE_EVENT(geni_serial_data, geni_serial_rx_data,
+	     TP_PROTO(struct device *dev, const u8 *buf, unsigned int len),
+	     TP_ARGS(dev, buf, len)
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


