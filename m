Return-Path: <linux-arm-msm+bounces-107911-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mGo3NO8VB2plrgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107911-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 14:47:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B8B954FE2B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 14:47:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 48914303058F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 12:42:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBFEE44E047;
	Fri, 15 May 2026 12:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F4D8EOar";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hhuv6wIZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 695BE37C11B
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 12:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778848958; cv=none; b=ezWS04c7uHWidP/NtQKX65p8+z9tXTU8DeF1bijd7jPw3ovzp9oLV+fCJtKdJz46P+9AiwbK8yblGLsVLdN1s//6/V79dQzPw85eB/1MAm19O+dQcJBDal8sCeN+WCjeDm861rJeO5AROCHv0VYfFA/Px7KmsH1/w69BOC81NfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778848958; c=relaxed/simple;
	bh=td9NUaJUCCqcs9shCrPz79nraSFW2hpmFyg3yX9KMf8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Y3mtPtfD3Ypxa/V/YqMaK3ZLDHDvJXPkaQEamz9Gwond7A8Sp+BB+ziugCUyZ20QO30aLvb41MNK1tYWfuA4lmKpGlM8HZFJKe47mkA4girB+gfoXrD7GubRDjsP8Bgz9LnyQo8wam3PLV++RngHMq5e9V0kgJDScreNnIXPi/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F4D8EOar; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hhuv6wIZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64FBUBK33219668
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 12:42:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=pqILH36+bPj
	XkI9bIGyaDvTximt2bkQbgl3RjerBI7A=; b=F4D8EOar1wz9Cj7mkw+2d9ACo/r
	ywk8pbZWNUkSxPQXUiCA7VcD33E6W9PKqAsnwyvOiUz5IdB8iM5O/hclhcV8xTsb
	lW15qLgY+BtYFYNVC0UYroc/N+DQuGXGpK1uT3K/8OU08kN8LgHNhbBj8cDMoQfi
	eBqjsg9ui7eCtdQQHZntGdl4DwaSzAvDFGsmPfA/OYT4CI/WDEIzgCAu+cFsWFqv
	JEWsbZIcBnAYVN0MnvA9khMG2Dv6Agylzz9m+lckFF8Qzj+mLXQEhrmrZFCTAycu
	DdtLBanQApIywH8p2rIahUBX8FlPsKtlxTh6VaVKxXSR2YoHlPkbeS/FxCA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1s38f6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 12:42:36 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b4678c6171so97777095ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 05:42:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778848955; x=1779453755; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pqILH36+bPjXkI9bIGyaDvTximt2bkQbgl3RjerBI7A=;
        b=hhuv6wIZT6Tb/DuEfn9Ue2BHOtQyRWbnJkBXXToMwEkuMUF9qDireEIVOWOn5xeaeB
         OzNTKILZ0ts3xeGeWyRXGL+IzN8MSWWKz412FMCMB4HcqHV6A48K/UB+QPyl4K9HYUd7
         EL2Q3tWhRRJopIFe21LVZ0F90UomP9o2sUoPFk+ZDv0iwV1BeUd9ms2gPlSs5jWclwNA
         /YqnvbQykgLQ7zK/9z3jTWaMxUlIGK62ryYRsYMvt1LsySA7dTHJukHQBpC623/N8AgN
         SBc+3dVMeHh6n68ll9J5+Du15I6agtrbqjkIglgFm2cVhos28uWP8pqW7X/FDND8gL1y
         8bmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778848955; x=1779453755;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pqILH36+bPjXkI9bIGyaDvTximt2bkQbgl3RjerBI7A=;
        b=G7s1G3IzN0OmqyAgFgJSyvWXHsT7ZR3SqM1eKqTwchNWoKLT7ednjtexSKdDwoCX47
         lT3iATBh7k9aLfivUwgfUABnqXTcqjSfeJgB5jwRmbEiAQEgxyhwIwY2omAytPiXSohJ
         ApgUIrhsovRBbHXNZMfEK6sHKZ/sTJWhsnHacX2UlXBRx/gHW6R6iefxRrveODZMqUL8
         GRquZy7ReSx3t+/ATMlMCg7uSUJb4VKt7s4PGAA/C3k/Dmskt67EgPLEnjwMatIvhZ7/
         BBk4veya3wV1AtiYbEvPbePyMkkyqY+FKDcAVzN0PRk2lB6371Hupzrd7//zo+5ccosG
         m/SA==
X-Forwarded-Encrypted: i=1; AFNElJ9ftXPSq4xxNdcA6uQJtZ+7zhc51d3PXyUPCbsQ087WHW1pAIDR8+u71M6XY83Yb7APbMMnzjreSJr0uP70@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6HKEhECOqQx/TLuBcanTYLtBBPrMYlbydHJo3v//wvFERekSE
	V6gwLYXijJelMtkxp5gZfUkEHb+gR4asl8D2wUXRr/g95tH7b+aLuTrihLVJG9w9CilIQtaITtP
	x8qp4TYmy/TACQaRKAKbci3bbGVMTEjKZV6Efg1kceSzTo8GnpmmIXTlKddWfIEokEP8E
X-Gm-Gg: Acq92OHwLKwdpB1Kocbe2m9qpe7c/dJ16S20j0FidmiOy067NarI3BHrX3QIbBELkrW
	DT+L0BQWAL3F8xhyKzQIKSTHOSvPWHqkPHqicsBS4f3s7rKnEqBq/ZShcnPKNGKVR9SsuOQQSDS
	RWCJReu+5SoVR+c0MT6mV6PnbiALmHwFgbHN/ft8zEALn/Y3FRWTtg2bTDzcOZbgObgJPN8XrLB
	pdXsDK1lkdtkStqjqLu7DOyEsZq4lDuZFWDtpHwXZQGp6ZSK6z79V+HXji3BMHqJtiQ9lkZGQYR
	saNeA6Ck2fOtvUywDO8Mf6hvO68mrBlaxHzY1Ae3ZwYzEsjY7skc56gXC5swBVL/yMB/HLq4IvK
	D+3mRLO/MHuioscIy5TSI/0jTJ/HBTiIubAMiJzMjTVCJpkloxTJiLNtM2qQHcf+/Yx187HXku3
	vWYQHtP07uAsxDbAulc60X9CbW4wwg1g==
X-Received: by 2002:a17:902:7d96:b0:2b0:bed1:46f7 with SMTP id d9443c01a7336-2bd7e910f99mr29585765ad.37.1778848955110;
        Fri, 15 May 2026 05:42:35 -0700 (PDT)
X-Received: by 2002:a17:902:7d96:b0:2b0:bed1:46f7 with SMTP id d9443c01a7336-2bd7e910f99mr29585415ad.37.1778848954432;
        Fri, 15 May 2026 05:42:34 -0700 (PDT)
Received: from QCOM-SocCW5bzXR.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5c05f27csm56119395ad.25.2026.05.15.05.42.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 05:42:34 -0700 (PDT)
From: Jianping Li <jianping.li@oss.qualcomm.com>
To: srini@kernel.org, amahesh@qti.qualcomm.com, arnd@arndb.de,
        gregkh@linuxfoundation.org, abelvesa@kernel.org,
        jorge.ramirez-ortiz@linaro.org
Cc: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        stable@kernel.org, Jianping Li <jianping.li@oss.qualcomm.com>
Subject: [PATCH v5 1/5] misc: fastrpc: Fix initial memory allocation for Audio PD memory pool
Date: Fri, 15 May 2026 20:42:13 +0800
Message-Id: <20260515124217.20723-2-jianping.li@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260515124217.20723-1-jianping.li@oss.qualcomm.com>
References: <20260515124217.20723-1-jianping.li@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDEyOSBTYWx0ZWRfX/SW7+WIKctK7
 AUEgTsRwb6R1+GTviuuNn4lCH5J2fzLfhmiA86WgnckyO97zqTykTfiN53xk8V+Bix51TcvEuFi
 Ll2KF5zcAWeAB8EcT67WVv444/vTtB/E0GssRRv92ZxY+JVdSL47e41Do53qt0OFHciZ31e+/fR
 1wTuBu6DrjMjIaB3urOoQuqIfeaeNh/ZCsjXDI45FMicgO/rPEnifEcZDd/LSscopwoZSe1ObVc
 yr+XjjuWqXYAd7Rju1fVQxh1wUBXE7+VuzHmVNx0UpcnUvkKSw4dpN+dgRcKyxO+iTdumvr38cs
 IvYz3oKZ+MBNheF8wPcovdg6HxtsPscdOee1dr++Dj1fIZkJ9pZBbK8OFnwp/VeDFOAp1rpMPqs
 OpX+tBqRhmLYAyfvLpyj3RrCQD+B+crAs8rRMZMMKsxivZBt3OADJgO7g7x0+h4+7V02d9ErFIZ
 LV8NrQh9HPqckKxvROA==
X-Proofpoint-GUID: Byfn1Nfh5ctDwMf40XSWS5fmikVlHbp0
X-Proofpoint-ORIG-GUID: Byfn1Nfh5ctDwMf40XSWS5fmikVlHbp0
X-Authority-Analysis: v=2.4 cv=HJ7z0Itv c=1 sm=1 tr=0 ts=6a0714bc cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=Op9FgWJ_R3wbKKMAuNAA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_03,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 phishscore=0 spamscore=0
 clxscore=1015 impostorscore=0 adultscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150129
X-Rspamd-Queue-Id: 6B8B954FE2B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-107911-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jianping.li@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>

The initial buffer allocated for the Audio PD memory pool is never added
to the pool because pageslen is set to 0. As a result, the buffer is not
registered with Audio PD and is never used, causing a memory leak. Audio
PD immediately falls back to allocating memory from the remote heap since
the pool starts out empty.

Fix this by setting pageslen to 1 so that the initially allocated buffer
is correctly registered and becomes part of the Audio PD memory pool.

Fixes: 0871561055e66 ("misc: fastrpc: Add support for audiopd")
Cc: stable@kernel.org
Co-developed-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>
---
 drivers/misc/fastrpc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 1080f9acf70a..8b21f85cd9f4 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -1324,7 +1324,9 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
 		err = PTR_ERR(name);
 		goto err;
 	}
-
+	inbuf.client_id = fl->client_id;
+	inbuf.namelen = init.namelen;
+	inbuf.pageslen = 0;
 	if (!fl->cctx->remote_heap) {
 		err = fastrpc_remote_heap_alloc(fl, fl->sctx->dev, init.memlen,
 						&fl->cctx->remote_heap);
@@ -1347,12 +1349,10 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
 				goto err_map;
 			}
 			scm_done = true;
+			inbuf.pageslen = 1;
 		}
 	}
 
-	inbuf.client_id = fl->client_id;
-	inbuf.namelen = init.namelen;
-	inbuf.pageslen = 0;
 	fl->pd = USER_PD;
 
 	args[0].ptr = (u64)(uintptr_t)&inbuf;
-- 
2.43.0


