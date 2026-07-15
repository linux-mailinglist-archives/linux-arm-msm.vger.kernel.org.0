Return-Path: <linux-arm-msm+bounces-119144-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id peSNNvQYV2qgFQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119144-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 07:21:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F3E075AA63
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 07:21:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=jJjjQ7yV;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=dFgUPsjo;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119144-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119144-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D5A0A3077E25
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 05:21:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B191E3B4EAF;
	Wed, 15 Jul 2026 05:21:14 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1225A3B42F7
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 05:21:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784092874; cv=none; b=DJ3NnRL4N8PipivIfCcKur3ivKAxclMnRDkw4AcwW/jIwYxy63dSrZpxF7kUirFkeq2ZKYAELTG4OPDlA5l7/gHoRR6mmbtQElJobwdp6z5uADxVE9DkF7H3QEsgnMdcIEJSUbyc/2y/i9K3EbAbQVlmTNZTgj685BtjASmmsRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784092874; c=relaxed/simple;
	bh=NW9OfWcn7zy6+5dpNWHitm6R6TnMYmxPjElKxMspfvA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=opNSkvd4APeoXY3rRmPuqkc0YmLCx+TZw91tozfAiKLWmrrPOLFjc0sdlxTBiySLQgBI7o4pfuJhfbUPsuVc1sWruaPNLZI45WsCU/VDcoEx7HPdgbJmHHbQrCBi8w1o8H4S/1MHswWG0m7w/z++tu1vAz5yR9qTBtzpkpZCd1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jJjjQ7yV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dFgUPsjo; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66F3lJ1J2624419
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 05:21:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sITuVOmRTLgtM0SYU13wJSBTuqa5KGwf+255oDtx3hc=; b=jJjjQ7yVkooBgrGu
	SIKD9gMjwaiYl3OqX4QE25Ok0y65w2GqSp5PM9wijClPfYFb6iXrOjDh2NQfkold
	YOJhBvBraUDlT7MON0wXW6Vw9ktkOwZg8WZtcLyPHNCCgm7kX1BnK2g2XS9jAXMK
	2dA2rSf6UBlt7XN/1HG75AFGeqe0dkYisyVT1+9V/bZV/+ZQT+WeBoLFjmWQA9K9
	W0nwo7vxqd0EqoR+/WgsIsBWUn9OmDIxA/5s2nizI7ELTJ9E6Qrgko/1K5Sa1spY
	PLLlo3hZzzcj5XRojjr3Oyg2uV6Ca7GEsns4ll1douuI+sxbipKr6E2pEgOQKV7N
	/1Xbvw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdnnqu484-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 05:21:11 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3811ae55313so1758724a91.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 22:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784092871; x=1784697671; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sITuVOmRTLgtM0SYU13wJSBTuqa5KGwf+255oDtx3hc=;
        b=dFgUPsjo3Ie8zzV59c0d2OVXremZoXNoSua1uIqvPlNIkRkRACODxgN7YIiI6AyhDq
         45MAVhWs7hxQWXCwwgLEdvj1/bbr4sV/d9qJEa3xX5Hdpf3fpE49efFQfiUHRGSuPo0W
         Gyg5Q0q2GllXDKcBoALsT02uDyr5jmQPct/WOms+3xFfWtX1yqvU3S638VnVQ38BCeDN
         h3rs5i/r0i6eE8pWbeBmoAEy2eWKmrDATOgiWHGrmNgfG07I9asd+tmHsYgMr9fHLhbx
         8QKE6fFIytow121OZPCN1Eiy28fItsXqBRAdBpovk8KiOeHECsYdNvGjCc/s/LedlskI
         CbEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784092871; x=1784697671;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sITuVOmRTLgtM0SYU13wJSBTuqa5KGwf+255oDtx3hc=;
        b=Dt+dIpt1T3E5mUXRFa0VGjm4aovOqQFqZauMVB3kAFRpshEgfJXIr3o8cnevbRcmTQ
         PszDvc6LN4EaLI3iq2ijzFE8/KmC1d/D8sEgKY0ifOwOMJcFh4ul8RinZ5h6Tzer4XOo
         Jz2HGeDArsfsNmLhXut+Pj/uBWwDq0HdYmGAZugwZlAQgHiWjNh9coWHbqamfK01rf3g
         LlLhXNMTRIAaAb1n2mmXzzVAMfcbX29c0YxxhjrkK0vUcKeAndMsd4U+xWsuedOB/JdT
         1gZPAvMXQjj1wo5s+Rc2pn+K1kgNqGTVKs44kE8sW4sUdXIuiWbv1DRS+3mZcdvDMdsV
         VBug==
X-Forwarded-Encrypted: i=1; AHgh+RqPI9NcYfr/8Z56bUeCbNByIhD/FWKcHLxEj5dvy+PGpN9qT/lEkbMzAINcoeTYIgXR6K2/6EVpQfXPrV6Q@vger.kernel.org
X-Gm-Message-State: AOJu0YwM9kCWoQs6eIKjibHtJWBjkhOrsgMa6jlt3QSEfdnFQztvJmQf
	n7M4DwZjpEGFf3IjRu1UBrK5lRLAKqdPTuiW1K97oZlJgZi7M+VAcqH6gWjLtJXm6jV9JAli/eW
	VUyy4VLp//kypgiwq0bEl02nO6dsoHHIcvybZunyptgqL793FknQftiGtSiz1w4/Nna2y
X-Gm-Gg: AfdE7cmv0fLraTiNbMepwj5zDCaFYNSdv0g1hw5wGaz5HlgtHHtJY52daxa/oiZwsT4
	ZGa8v08DhG60dK0v8e1s0eW3DF+0/9VVXGo5lcQ6L8rgW18E6TUsw7/qZMCuuI/7W3m8grUf2gt
	LKR7oTKCTHsIK8XWOt703bRjFNvnC5eoCkod0EXDF7sB2zT5iE8G3EAyHLol35UPEN6sBQ8ROxQ
	U6nUVsJtTmIDenyex/20EIUWl5ZK+hdtMIUM1KBt7aKAajr91D85RtwqrNzCzdGJVUQ7AnhvSMU
	Xvo2pQfmoygtjvV84RJdoeq8KBM2E9e5CAXl6scyUXJ3GwLpoc9x5x7/n3zAbZdiKgvjWAiq+LZ
	mQzcpDZe48MO0bCNcaGRjXHzs+Y+asYl6d8Sw2WyXggj3
X-Received: by 2002:a17:90b:1dcf:b0:38e:673:5d18 with SMTP id 98e67ed59e1d1-38e06735ef7mr8097326a91.36.1784092870687;
        Tue, 14 Jul 2026 22:21:10 -0700 (PDT)
X-Received: by 2002:a17:90b:1dcf:b0:38e:673:5d18 with SMTP id 98e67ed59e1d1-38e06735ef7mr8097285a91.36.1784092870078;
        Tue, 14 Jul 2026 22:21:10 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e172e46basm2526092a91.9.2026.07.14.22.21.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 22:21:09 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 10:50:48 +0530
Subject: [PATCH v3 2/2] spi: qcom-geni: add GENI SE registers trace event
 on error paths
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260715-add-tracepoints-for-se-reg-dump-v3-2-0f787f93badd@oss.qualcomm.com>
References: <20260715-add-tracepoints-for-se-reg-dump-v3-0-0f787f93badd@oss.qualcomm.com>
In-Reply-To: <20260715-add-tracepoints-for-se-reg-dump-v3-0-0f787f93badd@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        Mark Brown <broonie@kernel.org>
Cc: Praveen Talari <praveen.talari@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-trace-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784092857; l=4641;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=NW9OfWcn7zy6+5dpNWHitm6R6TnMYmxPjElKxMspfvA=;
 b=aCXYBaUg68cF17oSv8bFBL9qAZkATJSAom/UstP3l669diTKt9Ywq4QeK23VXjuGUwuVRlOsH
 SxshQmmdKPvAqNRgUg+eVEhWBbV86Z/HeF/xobIJETvEJYH0SEd0vLE
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDA0NyBTYWx0ZWRfX8YL6J7qL8d6a
 ZtAui6RGyycHVdWL6MELl7nMPOQHcxfPzIOrzipLTovCvmuIvqjS5/tI3xUOZHrr9Jovjatuawx
 nELNK2dZl6icnwsoD5TqTrderXeFHkGJpqt/3f5UGoRoarZo2HUb2zlIR83aF5+1GCcMnnUb0lj
 cykXHCS3gRn7efmliI6xkQp4JBnJxfZHVMul/tS7h3gG71MMcR9RIxqzKz24Wq40uBweQSvVAd9
 81vcLKEVWwk4/M1yKdSLf2v9wFQQplvS6J4Gtqz7u/IZdSlU/ERBJhSwqwNxGG/PuQbPSjtBFwy
 1r+Uti5ZGcaFQ69ZKj7OYF3W05NlWM1oxo9sHmAsTCUJ0VNf8p76HPxQtFx18vL5FZnkCwWjT8+
 nnLzzRBaFwW/CNkHMBk1rdSr1qeRgEigu0+bFsYQzj63tZ27RdL8PNv5B6GV18Jnbp90cYBr4Lp
 IjpYz8v0sTuyryEtx/A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDA0NyBTYWx0ZWRfX4kzJdvgxc+X6
 p/hadoQr+r8UB4nWrNblK9wr610COncUJL8SmS7IXR/YpTNMTykSkzY2RLThuITBZ4nxBi7g0Vi
 EkCxDI0rET3Y2CdE3E6g5SBb703+MHk=
X-Authority-Analysis: v=2.4 cv=U+Oiy+ru c=1 sm=1 tr=0 ts=6a5718c7 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=SuVZUjzzKY3ZPv7-dKMA:9 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: WunGTD9Kc3Aui7fsRdFS7nB0voniiGjB
X-Proofpoint-ORIG-GUID: WunGTD9Kc3Aui7fsRdFS7nB0voniiGjB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150047
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-119144-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:rostedt@goodmis.org,m:mhiramat@kernel.org,m:mathieu.desnoyers@efficios.com,m:broonie@kernel.org,m:praveen.talari@oss.qualcomm.com,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-trace-kernel@vger.kernel.org,m:linux-spi@vger.kernel.org,m:mukesh.savaliya@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7F3E075AA63

The GENI SPI driver reports various transfer failures such as command
timeouts, DMA reset timeouts, DMA transaction errors, and unexpected
interrupt conditions. However, diagnosing the root cause of these
failures is difficult as the hardware state is not captured when the
error occurs.

Add trace_geni_se_regs() calls at critical SPI error handling paths to
automatically capture GENI serial engine debug registers when failures
are detected. This includes:

- M_CMD abort/cancel timeout
- DMA TX/RX FSM reset timeout
- DMA transaction failures and pending residue conditions
- Unexpected interrupt error status
- Premature transfer completion with pending TX/RX data

Dumping the SE debug registers at the time of failure provides
additional hardware context and significantly improves post-mortem
analysis of SPI transfer issues without affecting normal operation.

Acked-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
 drivers/spi/spi-geni-qcom.c | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c
index 2914d781dbf5..8528f9b80f03 100644
--- a/drivers/spi/spi-geni-qcom.c
+++ b/drivers/spi/spi-geni-qcom.c
@@ -1,6 +1,8 @@
 // SPDX-License-Identifier: GPL-2.0
 // Copyright (c) 2017-2018, The Linux foundation. All rights reserved.
 
+#include <trace/events/qcom_geni_se.h>
+
 #define CREATE_TRACE_POINTS
 #include <trace/events/qcom_geni_spi.h>
 
@@ -192,6 +194,7 @@ static void handle_se_timeout(struct spi_controller *spi)
 	time_left = wait_for_completion_timeout(&mas->abort_done, HZ);
 	if (!time_left) {
 		dev_err(mas->dev, "Failed to cancel/abort m_cmd\n");
+		trace_geni_se_regs(se);
 
 		/*
 		 * No need for a lock since SPI core has a lock and we never
@@ -209,8 +212,10 @@ static void handle_se_timeout(struct spi_controller *spi)
 				writel(1, se->base + SE_DMA_TX_FSM_RST);
 				spin_unlock_irq(&mas->lock);
 				time_left = wait_for_completion_timeout(&mas->tx_reset_done, HZ);
-				if (!time_left)
+				if (!time_left) {
 					dev_err(mas->dev, "DMA TX RESET failed\n");
+					trace_geni_se_regs(se);
+				}
 			}
 			if (xfer->rx_buf) {
 				spin_lock_irq(&mas->lock);
@@ -218,8 +223,10 @@ static void handle_se_timeout(struct spi_controller *spi)
 				writel(1, se->base + SE_DMA_RX_FSM_RST);
 				spin_unlock_irq(&mas->lock);
 				time_left = wait_for_completion_timeout(&mas->rx_reset_done, HZ);
-				if (!time_left)
+				if (!time_left) {
 					dev_err(mas->dev, "DMA RX RESET failed\n");
+					trace_geni_se_regs(se);
+				}
 			}
 		} else {
 			/*
@@ -391,10 +398,12 @@ static void
 spi_gsi_callback_result(void *cb, const struct dmaengine_result *result)
 {
 	struct spi_controller *spi = cb;
+	struct spi_geni_master *mas = spi_controller_get_devdata(spi);
 
 	spi->cur_msg->status = -EIO;
 	if (result->result != DMA_TRANS_NOERROR) {
 		dev_err(&spi->dev, "DMA txn failed: %d\n", result->result);
+		trace_geni_se_regs(&mas->se);
 		spi_finalize_current_transfer(spi);
 		return;
 	}
@@ -404,6 +413,7 @@ spi_gsi_callback_result(void *cb, const struct dmaengine_result *result)
 		dev_dbg(&spi->dev, "DMA txn completed\n");
 	} else {
 		dev_err(&spi->dev, "DMA xfer has pending: %d\n", result->residue);
+		trace_geni_se_regs(&mas->se);
 	}
 
 	spi_finalize_current_transfer(spi);
@@ -953,8 +963,10 @@ static irqreturn_t geni_spi_isr(int irq, void *data)
 
 	if (m_irq & (M_CMD_OVERRUN_EN | M_ILLEGAL_CMD_EN | M_CMD_FAILURE_EN |
 		     M_RX_FIFO_RD_ERR_EN | M_RX_FIFO_WR_ERR_EN |
-		     M_TX_FIFO_RD_ERR_EN | M_TX_FIFO_WR_ERR_EN))
+		     M_TX_FIFO_RD_ERR_EN | M_TX_FIFO_WR_ERR_EN)) {
 		dev_warn(mas->dev, "Unexpected IRQ err status %#010x\n", m_irq);
+		trace_geni_se_regs(se);
+	}
 
 	spin_lock(&mas->lock);
 
@@ -983,13 +995,16 @@ static irqreturn_t geni_spi_isr(int irq, void *data)
 				 * weren't written correctly.
 				 */
 				if (mas->tx_rem_bytes) {
+					trace_geni_se_regs(se);
 					writel(0, se->base + SE_GENI_TX_WATERMARK_REG);
 					dev_err(mas->dev, "Premature done. tx_rem = %d bpw%d\n",
 						mas->tx_rem_bytes, mas->cur_bits_per_word);
 				}
-				if (mas->rx_rem_bytes)
+				if (mas->rx_rem_bytes) {
 					dev_err(mas->dev, "Premature done. rx_rem = %d bpw%d\n",
 						mas->rx_rem_bytes, mas->cur_bits_per_word);
+					trace_geni_se_regs(se);
+				}
 			} else {
 				complete(&mas->cs_done);
 			}

-- 
2.34.1


