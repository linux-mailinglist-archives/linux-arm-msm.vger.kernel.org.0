Return-Path: <linux-arm-msm+bounces-118355-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ga5xJMs+UWrfBAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118355-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 20:49:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id CA11373D6D1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 20:49:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=bHBzGJjq;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=hVI5KLzy;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118355-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118355-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 50CDD300C381
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 18:49:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4138380FF1;
	Fri, 10 Jul 2026 18:49:13 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9874F3806B5
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 18:49:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783709353; cv=none; b=hfTzQYGOdKxfcPnPHl6MNihQAT1LtEHZzsayEdVMWIEdoKcqQVIMMyKk/4/ef39fhi+SiUkgXz9FwNp8zAcmEOPS6mt9iq3RCrfuuJcGPXBwhG3jT4HsyuKczAzHeYLatKDeNO/WOAw0Nm4ptNnQyVPU9+qb3AsC5yTtD8O0tz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783709353; c=relaxed/simple;
	bh=8IjvFdh38GVjti8EyyCPNx+zrsozIfJZeDc/Jq92K18=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AilCBy7kvd1BadC8Qmp8EabDI6KnURHvaQztsKPy4T5Ak2v7S+cQGhmps4ebldJHo3Gh/rW7NojI6WITqpZ9R2FOXZr3TgkecwH699tCWRtmmDhMhOmlmIHGWqGJHViwDPnJuLTFj5SuExEvJEq7LQf8MatOlN5zIyh5qlgrTRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bHBzGJjq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hVI5KLzy; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66AH3YRV1502030
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 18:49:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ghB+78yE/3ES4lSKNpqNXaMIAgtNADaxhoROyeNa6cY=; b=bHBzGJjqAn9Ojahn
	G6UM/CzYLViNReJZA8caBIuFcR4umLZf2duLK7fbtRZg0Ng90v1TtbkGl1jvA7Hf
	84mrbOjeU84bi0akGWgvJhh2XlQKw0g3eAdWWJuUDMmnM6v0uOR/kqmYYtd7DfUp
	gXJfQczW+vxd/M+tGbup/FNdvDfD91L0iaY5Lp3rfdAcdzWgu5R8gFHRSFwrcuPv
	mU6ovfjslJL57lZmPSyjhfiB/mQGC6jxWbnxji2cW+XEMDB7GSqAS0k/SToi10J6
	eDoVVD1eiXCBZYRgR0WYyTGONZvSnYtcHLeUgL4sG2z/lQ2byHFj4CqEMWY2gDMs
	kkzLHw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fb3xvrjya-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 18:49:10 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c889d1eedcdso1891016a12.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 11:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783709350; x=1784314150; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ghB+78yE/3ES4lSKNpqNXaMIAgtNADaxhoROyeNa6cY=;
        b=hVI5KLzy8B3KgLLzClf+1Rcw9l8FJPEthAp3fCBfDeyYoRpGwKCATIAwxHHOJByBAY
         6vJmozBtLnA46NshTP0MeMyfVjdlzqb7qm1cXAbjEn3SoP9p0qEb6RVpZ7R8bvpaLSgn
         TNHvYj2/JR7KtB9o+S6DNRwPOTH0rT4Ur4u9sYqNHPy+NMGtDD047q7md6kzDhn4kr7A
         xmDw09PfQ5a5UgrE/a5KVmLssUC3d0iz4QqukdZrxCTBqbwDCJknll0pGndA7aULCZRu
         Vr0b4yOmElcrp9j4igV+zobgFqYMBt49dG4awD1jXRudzadmyLpNZAWsIGz8Tq61oVPf
         5KSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783709350; x=1784314150;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ghB+78yE/3ES4lSKNpqNXaMIAgtNADaxhoROyeNa6cY=;
        b=LUzd7NPTbYFNNZGnFU2dJZFCNZhsJ9Sj00NJoLcJIpk3+gNjG64+T6NSXH9DLEoBpd
         XQT5vE4Tsxj4N6etTFOuqHpS5YkqGIhntjURX5Re1URvK+qTFeAyg7yBRztmDJjdbawz
         n4MoYU3ihSUDMUrwGlm5QH/RDj0tln/NojIflnEdsDULEdwlCOmCZQHeBuewaTtUuo/y
         /Q50AP+wb3T7VN8DucxDVBsiGeRX7UDrAHbSFGvqxStirc+UjVZuCnu3vI3yKorGBN5Z
         4S3BhqSqHZHFUOyT/f5XwzptsmJgaWu4BWUhr6E7BsGtBzZm6YD7LR7cX/7BsAcIwl38
         WWjw==
X-Forwarded-Encrypted: i=1; AHgh+RrP4XyI+1ua7vVDU1EvFRZSDjTY4Sc2G+Z0yHWOneJmc5hkwka4ADt+cUQBKqdeX4KEC5O1Ru7o0w58g978@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5PmGaIj/YRsWCDmia/LviStvuILjtLhv5Z30wEIaD1v2Ynwgd
	eodiNih82VhzFURHH2iuxk7zMlCdgE3MzH4dFsYqyMxBX0L9npC1cuwyEelzC53lZ4n+dYEP6eZ
	easQwLsvPQGaFmmtcGg/n9Uv0FC22bYviC1YauQMu8T9FsXXIO6Y2u3A3+1MSM9Hp4CKS
X-Gm-Gg: AfdE7cl4MENTMPxJlm08L03Z6Vcjbeffo1aF3bVmrvW38MofaS7SVC5y3bNflgVm/AE
	V88/6btxFGm5n99FG35lA3FoAaQxI4qDxZUqQknFpatK52Q9EOKaferRTOC/09fVQ7djzGch+WQ
	PgmJfapjE8xkPabeCj3+DmctYVfGzYcjKBtemS8TUWsdnWXc9Y7xVmYlX8Qemffc7fOktrqUDhZ
	2FUPFLu1m+nCh1KHdnGEjvJjPBKBVDQhwxYeXop13XVZyXyqGUqcjNapj8EvXtOE0PbLgQ8vMYT
	CNaQEnBu3sYiZlW8WOxSS35pIUAXammTxMM5u2FR65b9xzfuGNNpkM4JXOS60o89pYhEDBSE+8a
	PV2WG/ggwWjPmWcSh7cs/TbgYUfTe+anHqj5vBDDpu6T8
X-Received: by 2002:a05:6a21:9211:b0:3bf:49c8:f8a with SMTP id adf61e73a8af0-3c110be0ee7mr239216637.36.1783709350122;
        Fri, 10 Jul 2026 11:49:10 -0700 (PDT)
X-Received: by 2002:a05:6a21:9211:b0:3bf:49c8:f8a with SMTP id adf61e73a8af0-3c110be0ee7mr239192637.36.1783709349555;
        Fri, 10 Jul 2026 11:49:09 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659d7c8bsm47226919c88.12.2026.07.10.11.49.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 11:49:09 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Date: Sat, 11 Jul 2026 00:18:42 +0530
Subject: [PATCH v2 2/2] spi: qcom-geni: add GENI SE registers trace event
 on error paths
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260711-add-tracepoints-for-se-reg-dump-v2-2-ca1e9ba62359@oss.qualcomm.com>
References: <20260711-add-tracepoints-for-se-reg-dump-v2-0-ca1e9ba62359@oss.qualcomm.com>
In-Reply-To: <20260711-add-tracepoints-for-se-reg-dump-v2-0-ca1e9ba62359@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-trace-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
        Praveen Talari <praveen.talari@oss.qualcomm.com>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783709336; l=4547;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=8IjvFdh38GVjti8EyyCPNx+zrsozIfJZeDc/Jq92K18=;
 b=LZBu61HhIxIB/wxtIfaMNakkUitzJXJmclwcuWrTXejzPiOhF6JokQ33ZCjOT0Er27vVIVkVW
 Rhar8SB3nC+CGmT7LSlLEfHj26NXQAFEiUVAWVFg+M8FdNfUmAA5na/
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Proofpoint-ORIG-GUID: dPWLmR5O3rgnIBV0MyyUillmvXbrbi7r
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDE4OSBTYWx0ZWRfX4/sxaAEcuvSv
 mMHWKNMI7GdDcUc9Xe3MN9O/Vi2vx/2Awp3H2NmQYDY1iQYGTvsNdRGJ0DlRQghqU561kY1vvYH
 DHbUeXFMvhKFNF6chXKzd75Ko6Chdw86csC7+nxvYFTJem5gU/RdGTB6j86tHM7aqWoF6DAmusS
 WDrq+vbpYVILuKywpo/rZDubes2aP5GpkIiu0Wj7jlOeVpwnVcql0W7i7rj8lKsnwPgRUu970IB
 i8FPuh40F8UlYVzgmU9ni0gbU/r9Eu4yQg9mRy8Q6gIOfy7Pn0oKH0ZbqdQfBxHBYPkKCe84e38
 c5eozW0n5CEdBySYgX0gD5iY9Mn3ILMGUx8lMXq8U+acpV55p8Rk7Fov2pI8EIUERpHO+0quNRf
 4ne6on4fbkoPbKaS795Nspgv+QBHWBhJ3x72V4C3a+R/BKa88xquD3I3DK1xfkYdKklRZUL86bO
 Q6EL+vf+PsEyTqq+m3g==
X-Proofpoint-GUID: dPWLmR5O3rgnIBV0MyyUillmvXbrbi7r
X-Authority-Analysis: v=2.4 cv=HInz0Itv c=1 sm=1 tr=0 ts=6a513ea6 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=SuVZUjzzKY3ZPv7-dKMA:9 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDE4OSBTYWx0ZWRfXyscQ6mKbK7ZX
 xcEXyT56OHMQ9aKtpOd/Ib6+sSjsmSqTMu0Td099X1uYGI7DTJYH4Na25UfFOZjDf6wW+N7euEy
 rvUuVEKTSPc+9KEYuP3aP9L0gVY7CCs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_05,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100189
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118355-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:rostedt@goodmis.org,m:mhiramat@kernel.org,m:mathieu.desnoyers@efficios.com,m:broonie@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-trace-kernel@vger.kernel.org,m:linux-spi@vger.kernel.org,m:praveen.talari@oss.qualcomm.com,m:mukesh.savaliya@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CA11373D6D1

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
 drivers/spi/spi-geni-qcom.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c
index 2914d781dbf5..33020273c5df 100644
--- a/drivers/spi/spi-geni-qcom.c
+++ b/drivers/spi/spi-geni-qcom.c
@@ -2,6 +2,7 @@
 // Copyright (c) 2017-2018, The Linux foundation. All rights reserved.
 
 #define CREATE_TRACE_POINTS
+#include <trace/events/qcom_geni_se.h>
 #include <trace/events/qcom_geni_spi.h>
 
 #include <linux/clk.h>
@@ -192,6 +193,7 @@ static void handle_se_timeout(struct spi_controller *spi)
 	time_left = wait_for_completion_timeout(&mas->abort_done, HZ);
 	if (!time_left) {
 		dev_err(mas->dev, "Failed to cancel/abort m_cmd\n");
+		trace_geni_se_regs(se);
 
 		/*
 		 * No need for a lock since SPI core has a lock and we never
@@ -209,8 +211,10 @@ static void handle_se_timeout(struct spi_controller *spi)
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
@@ -218,8 +222,10 @@ static void handle_se_timeout(struct spi_controller *spi)
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
@@ -391,10 +397,12 @@ static void
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
@@ -404,6 +412,7 @@ spi_gsi_callback_result(void *cb, const struct dmaengine_result *result)
 		dev_dbg(&spi->dev, "DMA txn completed\n");
 	} else {
 		dev_err(&spi->dev, "DMA xfer has pending: %d\n", result->residue);
+		trace_geni_se_regs(&mas->se);
 	}
 
 	spi_finalize_current_transfer(spi);
@@ -953,8 +962,10 @@ static irqreturn_t geni_spi_isr(int irq, void *data)
 
 	if (m_irq & (M_CMD_OVERRUN_EN | M_ILLEGAL_CMD_EN | M_CMD_FAILURE_EN |
 		     M_RX_FIFO_RD_ERR_EN | M_RX_FIFO_WR_ERR_EN |
-		     M_TX_FIFO_RD_ERR_EN | M_TX_FIFO_WR_ERR_EN))
+		     M_TX_FIFO_RD_ERR_EN | M_TX_FIFO_WR_ERR_EN)) {
 		dev_warn(mas->dev, "Unexpected IRQ err status %#010x\n", m_irq);
+		trace_geni_se_regs(se);
+	}
 
 	spin_lock(&mas->lock);
 
@@ -986,10 +997,13 @@ static irqreturn_t geni_spi_isr(int irq, void *data)
 					writel(0, se->base + SE_GENI_TX_WATERMARK_REG);
 					dev_err(mas->dev, "Premature done. tx_rem = %d bpw%d\n",
 						mas->tx_rem_bytes, mas->cur_bits_per_word);
+					trace_geni_se_regs(se);
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


