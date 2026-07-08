Return-Path: <linux-arm-msm+bounces-117466-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QceMNQ/LTWoK+QEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117466-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 05:59:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 920F3721843
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 05:59:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=kU50F+pV;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Oa3PkDNe;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117466-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117466-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9AF833028F41
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 03:59:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64C9A37B41B;
	Wed,  8 Jul 2026 03:59:04 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA3803A3E73
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 03:59:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783483144; cv=none; b=dtAouDvvOwkFvux+hi2nKt8ZmAhJreIShW/Wlbl+lU1ULxZxXZ4G39L9jQKpNVv3BNMYShGpdk1PXxh6kGo7Ji7kpjKLiRkF/kXsLCGy+mtsizzns9AvG/g1TSsyy8fBzBebRMs2TN51/JUNQDwcEOCEPo6idsAUWOFoOttFFJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783483144; c=relaxed/simple;
	bh=E1UlleUpatfwJfXD7CvEFNe2U0LGFAfWDhnzotj82/o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KWrY483Izqo8RR2IZQ1JWmHKaRQRcdkqNZCgK7yZfqD33g1bFfixYuk8aEDpx1JMrEsq+OD1dEk6syRB4MrakiRCJvyIt0GwBhbutGjMj25dvl6h9EfZtKxGj1M0xApyNtg8BbJBk9vHcBroqqc22RTzLNF2J3nyu2fYE0HlkX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kU50F+pV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Oa3PkDNe; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667MctKX879294
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Jul 2026 03:59:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FaiG/eJTya26hN8ZkkimAahZgkkyWSyTo5eeeXV0qN8=; b=kU50F+pVW7duPG1j
	nguPI7KgKlvCv8FZO/yiiROpFLdzH7MlwlqUXra65hFEtHxzizT4k2NbBEeqdecc
	ZEgnUcD/9JiIDo1n7rX7pBjTThjbNWCdA8SMJ0SsCeXP0AR+mqNgdJdTCzb7SXV5
	bWV2Q2n64zKJzT4QvnFRxjfnEM1my56AwtcJ7aaFOJLZLua6cf8hQOtm1FkeSOyf
	qYqjn7SVAlF2Cgfe9H8uLS7Jqu0zk92ADQi3zRslEpdJeRbhOMS2nPyTE2MhaWQV
	P0dgQQ6fLYsEbw5A+ioY4CqN78Kd0dNfMbdDsBdp7ldtWqG9cy5bi0CqlydMkkDy
	TKwCvg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f99hgs721-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 03:59:01 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ccbb61893fso8037335ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 20:59:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783483141; x=1784087941; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FaiG/eJTya26hN8ZkkimAahZgkkyWSyTo5eeeXV0qN8=;
        b=Oa3PkDNeW0M4c8czwGTZX0rMuB9IG7FgzvDx0bu3jsJZHJgsqM30cg+rfrsZsEeM+N
         NpECgoDdOGzfx38IFlkjT6iplX0CR3iE0OgbEBUgp9hHL3795u3Jyh4+ZuN3VBPlyYyC
         LjBTf//L5YOAjcTNC4+DInj/rpxGSUo98BQajwzj3vgH144XX82GZaAQjN94NCYvvO0V
         0/lNQfohqjfuPwcmSqfDPRmXNmsype/YQfJVQvg2B/1XdN5JwOZw4wer+mauHrZWoTlx
         GvnSPyFmqCjwOQEPKRSdZAGQ/18eKMs1CNbJYZtL4QMRxeosRhFd0MW0bfUdViSHi3ue
         DoVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783483141; x=1784087941;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FaiG/eJTya26hN8ZkkimAahZgkkyWSyTo5eeeXV0qN8=;
        b=VBMfJJ0MVXdxTOBVmIeUETGIJjNArsWuXQaLD3r7wLbJYpcVnOUvS0xLT5uIFTEBCf
         77XujJDZIIoW/RjoQ+rRujWpui+dUy/Au0ZbLkT7nldyQ/mwYUEboXU+6EXVsVTDXNn3
         2b11cndWu751oeX6PlNCcxca9oTcEUCU3HbzG8RuINOg6InAzvixrokcq1UhTRJoQEai
         xULOB2xe7VlyWLwmeaZi4fdxo5+mq749BuRIyF094UI1+F+H75lCWWqu4Y1OmS80jAsJ
         C2K1/XG4ugJkU6YFKZgaTH8dwcKIU9JjkjAAEbHZdmgclItGiOncKcs4zZOJD8RIoFKk
         K0EQ==
X-Gm-Message-State: AOJu0Yy3rTo84c+PMtyU12XO77jhLzqtsDCbvrswRr9cKuRPwGvExKsg
	XZGRTzuTAceq4BcprNz75Jpdxcg2XOT7ORcTnXlFtFXKqiO/RTnygGBz5BeOZCVsy2pZ4zyhkhR
	uL5blR96ZnUfISHcQ2YDSR0ZfpLsH5Qg9dKvNQvo5YhfjnZ9iMjsZxfYjBuiqQG59DrFk
X-Gm-Gg: AfdE7ckbk7lBUSLcxSIur3IcO//kbF1WtAyo6HdBwrdWnGCkVAa05hfT9K0jnTxyCaN
	o8DDden9YQy+ZSxne/k97Ljrby/AgaKe6dZtqmvIN8n8RIeOUqtyTKFdlFfaxGhpaTYZKwKYTj1
	69CHQtRjuqAwqZpsIezu22kyppbO8d0M32KYOXfANjqbDwCgFoqfK5dIiRlA72ptHVbcrBmPu8c
	wlekyzb0X1RFelGWYmZCEMO/pJXnVYWtNyxRAtDwlZ1RlsXy7MU/gEVg5Jxa2udB6BegXHrISM3
	gPq1Lbt3TYn043cLx/Iyhdd4pzokgTvtvs5GdilAPVnSk6wncQOul1W+B5EcgcwNcGwFULvbtHl
	Lvwc56fsor/0Gen32xhTOwXtlszbCM8LcmB6A8wUiA/St
X-Received: by 2002:a05:6a21:62c8:b0:3bf:aa1a:d2ef with SMTP id adf61e73a8af0-3c0bd164cd0mr666225637.56.1783483140626;
        Tue, 07 Jul 2026 20:59:00 -0700 (PDT)
X-Received: by 2002:a05:6a21:62c8:b0:3bf:aa1a:d2ef with SMTP id adf61e73a8af0-3c0bd164cd0mr666186637.56.1783483140117;
        Tue, 07 Jul 2026 20:59:00 -0700 (PDT)
Received: from hu-vkatoch-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311747f7293sm14487136eec.3.2026.07.07.20.58.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 20:58:59 -0700 (PDT)
From: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
Date: Wed, 08 Jul 2026 09:28:33 +0530
Subject: [PATCH v2 2/2] misc: fastrpc: create duplicate sessions after all
 CB probing
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-dup-sessions-v2-2-da40f9c98a2b@oss.qualcomm.com>
References: <20260708-dup-sessions-v2-0-da40f9c98a2b@oss.qualcomm.com>
In-Reply-To: <20260708-dup-sessions-v2-0-da40f9c98a2b@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, Bharath Kumar <bkumar@qti.qualcomm.com>,
        Chenna Kesava Raju <chennak@qti.qualcomm.com>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        devicetree@vger.kernel.org,
        Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783483125; l=3803;
 i=vinayak.katoch@oss.qualcomm.com; s=20260609; h=from:subject:message-id;
 bh=E1UlleUpatfwJfXD7CvEFNe2U0LGFAfWDhnzotj82/o=;
 b=vzZxLNd7liU/JhRSS81E494juiP4krazhNrpl1MhaEYQUKdt7OFLSrYc9HzaqlKyJUsaTdVEH
 eYM4q03WfjQAGUl8BUukX599/aTRK0Z40NuRBc4TAVEgbqe/Pw8XdGZ
X-Developer-Key: i=vinayak.katoch@oss.qualcomm.com; a=ed25519;
 pk=UrGeKKxjIjpHZIjsbQKS/8rrVaP9KVGki69pFclCH08=
X-Proofpoint-GUID: dUSm6lw4qyXmeJmVNVdTJtgbX9pwJz-D
X-Authority-Analysis: v=2.4 cv=CviPtH4D c=1 sm=1 tr=0 ts=6a4dcb05 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=_Cnv2d4ds2Bg63dH_xgA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: dUSm6lw4qyXmeJmVNVdTJtgbX9pwJz-D
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDAzNSBTYWx0ZWRfXzdyQmj/fNX4i
 /ST2qrS6dIgogiNcKYHaogruvhzzwWeV0+1PtAxreY01GV1XK9s6Kk7P1wQrxB8IqzEVcefi613
 9zFZcwo5VEXMvGZh8W/HMjEo9v/Y7S8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDAzNSBTYWx0ZWRfX/iVSpCDanBaA
 QiIiYWRH/dtGvgcBXHwSnAKKw/CEEsfgLhz7uuaPB4kA/lzPPeMMZT0TOyhviUuFG4exsnaypPO
 2vRb4cQ5S8FiDpLEcgEI1iQSxoZX6vHcHjuvH0ZnDygGmTrJT/G15iuI6+2lEsqgpetnxFlHiWi
 vHyNuzlaAxY6yDppSudZzGuIJ8GOjfl7byo2WT1tiiy/c6XgnrqB2QzC4+NMeE+k9qMHVew9cUO
 N8c5WElAfHykxFIm8i0n3Lqg14+6qs2uZmQwG71eqq6h+yEoY9Muu3I7NntNbvDu5sQtnllLV/I
 Fk/i6QbsfyMRZU4t2tcBM4WkYSMOIHGTfV1L2xRg7zPCPS5OlPjpbOwUX6IwgJDbPBcmsrjc4Tp
 wO9R3QzZzU0VA9ePLdEhzjp8aVPFrkkMOi5l5l0q7TbStEwKMCqarFPfbKaG9weZ4+tSKA1+hal
 BrS40CijfTjcOZfajTQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_06,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0
 adultscore=0 priorityscore=1501 phishscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080035
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117466-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FORGED_SENDER(0.00)[vinayak.katoch@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:srini@kernel.org,m:amahesh@qti.qualcomm.com,m:arnd@arndb.de,m:gregkh@linuxfoundation.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:bkumar@qti.qualcomm.com,m:chennak@qti.qualcomm.com,m:ekansh.gupta@oss.qualcomm.com,m:devicetree@vger.kernel.org,m:vinayak.katoch@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vinayak.katoch@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 920F3721843

For ADSP, only a limited number of FastRPC context banks (CBs) are
available. Each CB supports a single session, which means only a few
processes can run on ADSP simultaneously. If all sessions are consumed
by fastrpc daemons, no session remains available when a user application
starts, causing the application to fail.

To address this limitation, a Device Tree change was used till now:
  qcom,nsessions = <5>;

However, feedback from the upstream community indicated that this change
should not be made in the Device Tree. Instead, it was recommended to
handle this as a driver-level change.

Instead of duplicating sessions inline during fastrpc_cb_probe() using
the qcom,nsessions DT property, defer duplication until after
of_platform_populate() returns in fastrpc_rpmsg_probe(), at which point
all compute-CB child nodes have been probed and the session array is
fully populated.

For the ADSP domain, append FASTRPC_DUP_SESSIONS (4) copies of the
last probed session once of_platform_populate() succeeds. This keeps
the per-CB probe path simple and ensures duplicates are always derived
from a stable, fully-initialised session state.

The qcom,nsessions DT property is no longer consumed by the driver; the
binding and DT sources are left unchanged.

Signed-off-by: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
---
 drivers/misc/fastrpc.c | 30 +++++++++++++++++-------------
 1 file changed, 17 insertions(+), 13 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 1080f9acf70a..8a3944f6c036 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -30,6 +30,7 @@
 #define CDSP_DOMAIN_ID (3)
 #define GDSP_DOMAIN_ID (4)
 #define FASTRPC_MAX_SESSIONS	14
+#define FASTRPC_DUP_SESSIONS	4
 #define FASTRPC_MAX_VMIDS	16
 #define FASTRPC_ALIGN		128
 #define FASTRPC_MAX_FDLIST	16
@@ -2195,7 +2196,6 @@ static int fastrpc_cb_probe(struct platform_device *pdev)
 	struct fastrpc_channel_ctx *cctx;
 	struct fastrpc_session_ctx *sess;
 	struct device *dev = &pdev->dev;
-	int i, sessions = 0;
 	unsigned long flags;
 	int rc;
 	u32 dma_bits;
@@ -2204,8 +2204,6 @@ static int fastrpc_cb_probe(struct platform_device *pdev)
 	if (!cctx)
 		return -EINVAL;
 
-	of_property_read_u32(dev->of_node, "qcom,nsessions", &sessions);
-
 	spin_lock_irqsave(&cctx->lock, flags);
 	if (cctx->sesscount >= FASTRPC_MAX_SESSIONS) {
 		dev_err(&pdev->dev, "too many sessions\n");
@@ -2225,16 +2223,6 @@ static int fastrpc_cb_probe(struct platform_device *pdev)
 	if (of_property_read_u32(dev->of_node, "reg", &sess->sid))
 		dev_info(dev, "FastRPC Session ID not specified in DT\n");
 
-	if (sessions > 0) {
-		struct fastrpc_session_ctx *dup_sess;
-
-		for (i = 1; i < sessions; i++) {
-			if (cctx->sesscount >= FASTRPC_MAX_SESSIONS)
-				break;
-			dup_sess = &cctx->session[cctx->sesscount++];
-			memcpy(dup_sess, sess, sizeof(*dup_sess));
-		}
-	}
 	spin_unlock_irqrestore(&cctx->lock, flags);
 	rc = dma_set_mask(dev, DMA_BIT_MASK(dma_bits));
 	if (rc) {
@@ -2445,6 +2433,22 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 	if (err)
 		goto err_deregister_fdev;
 
+	if (data->domain_id == ADSP_DOMAIN_ID && data->sesscount > 0) {
+		struct fastrpc_session_ctx *last_sess;
+		struct fastrpc_session_ctx *dup_sess;
+		unsigned long flags;
+
+		spin_lock_irqsave(&data->lock, flags);
+		last_sess = &data->session[data->sesscount - 1];
+		for (i = 0; i < FASTRPC_DUP_SESSIONS; i++) {
+			if (data->sesscount >= FASTRPC_MAX_SESSIONS)
+				break;
+			dup_sess = &data->session[data->sesscount++];
+			memcpy(dup_sess, last_sess, sizeof(*dup_sess));
+		}
+		spin_unlock_irqrestore(&data->lock, flags);
+	}
+
 	return 0;
 
 err_deregister_fdev:

-- 
2.34.1


