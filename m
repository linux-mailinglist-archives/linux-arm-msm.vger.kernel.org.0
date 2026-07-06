Return-Path: <linux-arm-msm+bounces-116761-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Oe8dBrygS2osXQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116761-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 14:34:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 67498710921
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 14:34:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=cV++0cZH;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=fEJawWEm;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116761-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116761-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 321483427B01
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 11:08:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C22440759C;
	Mon,  6 Jul 2026 11:08:39 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B8574014AD
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 11:08:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783336118; cv=none; b=X1hzgNNuzPU+ukPElqH/I9Nixl/2uQ8Pu+8LjbOyKmQeISx7BLyTkJlDLbQvpi0jXApR4oZn2y7nlBJOo5kPccD4N7Xjn1S2uhOn0szCEe0gsPjqeETcVisPS1K32OGAdBwna5Qdyu2TI3rjUStSXEKRescTYMJ8jZer055ZILw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783336118; c=relaxed/simple;
	bh=soA3BDJ7EjqA5hWfm4kj9buFogwtZYzZXE0zhdq8A0g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ffzbTnG0X+lnnpgnT4P+T6JPeTPSXtr/Qgkd1Eta3ctGs8Kiy9umivFhJUQInD8BtNF6yRAABBIjxDGsMrOOz6SYlKpTs/s6m/QSepDQB6qFDSIXOSo1f+zH+LkSIJ3RbovBqne+o1qi4X2U42LW9ZW3d4sXWudRszvaa0KDhgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cV++0cZH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fEJawWEm; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxT02367424
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 11:08:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lOTzOSxHynqZ5lzAB097GOfQw5XXG6mSt3mT/6tBBeU=; b=cV++0cZHir9gZelD
	8opZkpEb2tUMwX/Tf4NQ6gd90/l5hsfsuOJZu5svZNBwgtXP3fnD54CkfBL2sqVY
	GwDYS0O+1cDURo1LEkXBCCG5UHsee26Kl4NVGDKH4+NI9wtLmyPCLRSgbq5rYeDo
	NDYiBzbiBifBNGcCaTmcrrehPQ9ELXf739xdhygNMj/mCd8kOMAx94SKuV2bW47S
	HZL2/gxe3FrNmMF4dlnIXaERGvlQ561BVjzGbc5vSvcSCzlGWqbgpxbR6NGEt6TJ
	7f7NYomZ3bxj3+5Q0VAmQnfrekyqQgVdeBtkoRxQ7Jd1c5xwRL4GFA2N5usbOZJI
	bamTkQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f891urj92-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 11:08:36 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c88aab7c1d4so2354938a12.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 04:08:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783336116; x=1783940916; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lOTzOSxHynqZ5lzAB097GOfQw5XXG6mSt3mT/6tBBeU=;
        b=fEJawWEmI78u4fBnfmZQtDfe5K1WVEN7r+ttvnyKpE4kIXRj6f7mb0oP9i0Xa/DLBQ
         TWsf80Pa1cV+f9bNIFxtrFHyxWZF2mWqW5HLQQf4PTntAuXL14K7NNg1D3d0do/iZojF
         enFtAIP5bOeg9V+NOWEkLTPI2KoxaiQyNrkvmbjrmnJVj7obMuYKhF7s045f5OCEB/fE
         rRjh7zQSoHKgdxHM3Emmk9FscKudAuEjhE3ZMmZWVx+k0t9nhYptW9ALm/pwApDuoU48
         AENo5E3Y1Wtg/SFP+iEz/2GGjK8HSPrz9Kfge6leCxspvAWMaAcwe0TfFnZLzk+4PX82
         kVtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783336116; x=1783940916;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lOTzOSxHynqZ5lzAB097GOfQw5XXG6mSt3mT/6tBBeU=;
        b=ocC8lKm6luaKDNKyNiWzyCVpip8AS6x2HzhstfEVJa58Av+b2zmYdPGx5/O9qNUArj
         PnMNn4ppjbiRKuiDJUH2TySPkVi9OUrmU0AvetpSTqO+E0tRu40JnQocoDtMJ1d7Kjf6
         EuNOx5g8KlojqCV8j8IiwprIUO54DwHRHLQNsBqyQJpIe6DdjxO4qrKL9CiFLI2ZXrMt
         9fdZyEflITCdw5DyYNdVcXyQsxvsbac3Ky3vmwdzubS8d2fY9Anx5cMcmFGnBAQif5CZ
         j5LvcxrmD9H/Xut1Ztm80UYTfrgWqRjZvP3dxklI/sepExpZwKpfn/E+Q4cXHNHLx6dC
         JtcQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr9z4HmUcCypbayCpWBQayoc3847M1FRNtcQEGrA+wezj9sH+nROQbnefj1qUtaJNCMDY0dzMp190U5ib0a@vger.kernel.org
X-Gm-Message-State: AOJu0YyUADgh7IfR+k+EB/ecYpEs35sxUngmwxmlhpLLkKrdAGY3ZhQi
	YDYQMjaBwZbYHZjFawDBvx9D+gg6Kccxmwt+avmYT+whvrwIud7UFK4CC78yUjrvDmRMTuhe17O
	74/nCLgV2F7w1dxH1LtcXPyV6X2WlXGMySemwNJsLUwni0HjR84W9x721/pTJ7tiJjdy0
X-Gm-Gg: AfdE7cmP87pVjZTHPy+Rjb788mLjzcJbsoJL8TE3P2owaBjhQ9Swzu61FkFRgUKY0jI
	Z61/Q9KXa6xpvp2KGtxIKQ9t83siWX7/NyBqUO8qxU2Re0F6IBWW/mitCCFymODJFPzs96rPAbI
	ugz0utFjwxr1KdtvEa5InnBV1v2IEMDCdQ5RN26CP6uuytpJqdM1jnkPtfSEA7ggDn0aBvkykLY
	rsGQwvl1Jqsx++pTdyxrlrw0mNdeJ0Djkb5BmWhczUdIxYeu11X4n89Q8IF2gXo39cxA+6JV3OU
	QnjLulawLadsDLQme/VoJApc6wGID/uGht05OQuctPrNe9gk7OXhWPsWc+UT1lgpB5xTAn+10Mq
	qGqQpWmaOAXPhPfZJiIE1g+UFTGNwDsS97WGfz7Gp4PYH
X-Received: by 2002:a17:902:e78b:b0:2cc:98b4:e7e2 with SMTP id d9443c01a7336-2cc98b4e9b8mr39300945ad.44.1783336116081;
        Mon, 06 Jul 2026 04:08:36 -0700 (PDT)
X-Received: by 2002:a17:902:e78b:b0:2cc:98b4:e7e2 with SMTP id d9443c01a7336-2cc98b4e9b8mr39300675ad.44.1783336115518;
        Mon, 06 Jul 2026 04:08:35 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cad7871285sm47730685ad.64.2026.07.06.04.08.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 04:08:35 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Date: Mon, 06 Jul 2026 16:38:13 +0530
Subject: [PATCH 2/2] spi: qcom-geni: add GENI SE registers trace event on
 error paths
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-add-tracepoints-for-se-reg-dump-v1-2-48bd08e28cf2@oss.qualcomm.com>
References: <20260706-add-tracepoints-for-se-reg-dump-v1-0-48bd08e28cf2@oss.qualcomm.com>
In-Reply-To: <20260706-add-tracepoints-for-se-reg-dump-v1-0-48bd08e28cf2@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-trace-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        aniket.randive@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com,
        Praveen Talari <praveen.talari@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783336101; l=4376;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=soA3BDJ7EjqA5hWfm4kj9buFogwtZYzZXE0zhdq8A0g=;
 b=mshxjBsL4s7tH3/JNjX7VohPwJ6AxOs8q2vboeGbMu9861OFrOa9dNhHLbd1IS0UNdTmCZMq+
 Dbzv6JONoEWB8yTTTAFAoIihszsrJxmOBg40lz5nQzZHmkNfNyh8wXn
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Proofpoint-GUID: IQ2D_qgrJLfRmQj8ToEypM-DXR7qu72A
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDExMyBTYWx0ZWRfXwbnOnE+OUkLg
 YrFQzMCDkyzceMsXQAt1AOyAy2J+a+yWt5aq5S5WcMK7OzUTX1FUXV+kbGUanROSP0PIqlKEXW7
 EEAXZjc3WbsE/1t2BnHGZgq4LXbjEsw=
X-Authority-Analysis: v=2.4 cv=Mo1iLWae c=1 sm=1 tr=0 ts=6a4b8cb4 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=SuVZUjzzKY3ZPv7-dKMA:9 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDExMyBTYWx0ZWRfXyL5xCj5v3+CW
 yNFfUiu7Oi99VzasYaD6pxm9l7oUJyYsTXsyDgdKkqKAa8Cb6ctYtSoYFDnUUljXb8uHYJfMSvP
 Q7kwvG5geWgghRrvLQ1ZpeNt7FYvEsZljL8Iw9UJW2k99rfmh+u60wf1Ull8GPxK27A09lvXAbD
 fpPqgadqMkxVw1ohtDdKFTXDtv0T/zTn8ShYRtTdW1Af9eecIqpN98S2Qx0u6VCtXsSfyPqsMA0
 YIFywFHlQrJZqhVbkG8ADmduFESQTDHQy5BbZwexg19dUvNfsuYp3PblHh/5JNsi5JpWVfgxle5
 JTva6UEqko0FO7cJEFbOHQhnw7AEM0m5z8svdVk9qJVlcQzyAVbmoQwHBmYYT63KkD49erIwKWg
 w70Gu7Pfdi4eXjN4lyKb109GL2h33RW/wiNReVfxP5O+IDCSAO7ZmxB9L+5Au/ZaxCHycrDf9sw
 eeviUQ/bkqi9KCEfBtA==
X-Proofpoint-ORIG-GUID: IQ2D_qgrJLfRmQj8ToEypM-DXR7qu72A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060113
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116761-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:rostedt@goodmis.org,m:mhiramat@kernel.org,m:mathieu.desnoyers@efficios.com,m:broonie@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-trace-kernel@vger.kernel.org,m:linux-spi@vger.kernel.org,m:mukesh.savaliya@oss.qualcomm.com,m:aniket.randive@oss.qualcomm.com,m:chandana.chiluveru@oss.qualcomm.com,m:praveen.talari@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
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
X-Rspamd-Queue-Id: 67498710921

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

Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
 drivers/spi/spi-geni-qcom.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c
index 26e723cfea61..7db0836308c2 100644
--- a/drivers/spi/spi-geni-qcom.c
+++ b/drivers/spi/spi-geni-qcom.c
@@ -3,6 +3,7 @@
 
 #define CREATE_TRACE_POINTS
 #include <trace/events/qcom_geni_spi.h>
+#include <trace/events/qcom_geni_se.h>
 
 #include <linux/clk.h>
 #include <linux/dmaengine.h>
@@ -184,6 +185,7 @@ static void handle_se_timeout(struct spi_controller *spi)
 	time_left = wait_for_completion_timeout(&mas->abort_done, HZ);
 	if (!time_left) {
 		dev_err(mas->dev, "Failed to cancel/abort m_cmd\n");
+		trace_geni_se_regs(se);
 
 		/*
 		 * No need for a lock since SPI core has a lock and we never
@@ -201,8 +203,10 @@ static void handle_se_timeout(struct spi_controller *spi)
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
@@ -210,8 +214,10 @@ static void handle_se_timeout(struct spi_controller *spi)
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
@@ -382,10 +388,12 @@ static void
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
@@ -395,6 +403,7 @@ spi_gsi_callback_result(void *cb, const struct dmaengine_result *result)
 		dev_dbg(&spi->dev, "DMA txn completed\n");
 	} else {
 		dev_err(&spi->dev, "DMA xfer has pending: %d\n", result->residue);
+		trace_geni_se_regs(&mas->se);
 	}
 
 	spi_finalize_current_transfer(spi);
@@ -941,8 +950,10 @@ static irqreturn_t geni_spi_isr(int irq, void *data)
 
 	if (m_irq & (M_CMD_OVERRUN_EN | M_ILLEGAL_CMD_EN | M_CMD_FAILURE_EN |
 		     M_RX_FIFO_RD_ERR_EN | M_RX_FIFO_WR_ERR_EN |
-		     M_TX_FIFO_RD_ERR_EN | M_TX_FIFO_WR_ERR_EN))
+		     M_TX_FIFO_RD_ERR_EN | M_TX_FIFO_WR_ERR_EN)) {
 		dev_warn(mas->dev, "Unexpected IRQ err status %#010x\n", m_irq);
+		trace_geni_se_regs(se);
+	}
 
 	spin_lock(&mas->lock);
 
@@ -974,10 +985,13 @@ static irqreturn_t geni_spi_isr(int irq, void *data)
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


