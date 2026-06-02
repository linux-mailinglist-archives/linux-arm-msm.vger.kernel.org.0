Return-Path: <linux-arm-msm+bounces-110732-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4AOXKm6EHmqhkQkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110732-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 09:21:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EA5E6298EE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 09:21:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7D1293010BC7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jun 2026 07:18:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B7C2374E59;
	Tue,  2 Jun 2026 07:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BclFUBCe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="inBvZFel"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A2E32C11E2
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Jun 2026 07:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780384687; cv=none; b=DpRpuNvG9UIB23+tx0vV4KYEq7UkqtTgSK5iNsGxdrgPTc7B/dE3r3eRTAjbppvtK2cl51l5k3RSTBoejs0+iVFSp1hVpPumLAu0NM4OFqfQJhvyFZhV67+8RVO97UlWQZU3elI/8Gfnw+3oUim/OJlez01ETc5p5BrsjkGyoV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780384687; c=relaxed/simple;
	bh=xJwkAFzBCgVE2LEdHMFAQiZLbcIInQtlHCiLCIhnIZ0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Mx5B09iG4GCc7ywA0XUNriNwfh/uKVxk0BVEN8G02XhuyqzXw/mQ8tKi49N3OtTGD+B0lOAqXu2QDXyRyUdZ14JALubftRpBu4WxAVJfXXiawzrzC0gLGTUBXPM4w5Q6uHlEV6MN5GJwiRMcUhqAtQ9jFhFxxjwUMWWw3MfirJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BclFUBCe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=inBvZFel; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6526Ku7h2884622
	for <linux-arm-msm@vger.kernel.org>; Tue, 2 Jun 2026 07:18:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=WnPeFnYm50V
	ptjiqnHaSpsB7Y9ad0zWN9mmwwejDdiY=; b=BclFUBCe/mC3OuKmi3W8oL9f8HL
	0bcGGnYFr9FfcI5KYrAuRnaZtPGKsFQ1zbs1mzMEsL1exYMo0S3NjTJ8bOz9UmeG
	w8dW/CYzDXllrJW7PJ893yr3esHyS50hDlUGzIScvb/WuQcp0BrkmwZozx1YaMdl
	UXnD5srtkiung+7KCIO2wej0djx9UZoi98rPN12+8nXmHBmdA4v8IEsKA1hVTo2g
	5kqFsIGtcl+IO88yyg3+kuStmGB7eJ6agbYp4zu5nfJ2bt2dL310dbixNC1mbekU
	Qjz7Qe3tc42nXdfAh15SLYaMiy4Ih2ZpWbclLmQgbjUai60uSPPubJp1sPQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ehsu1073x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jun 2026 07:18:05 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-36d99333358so2116181a91.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jun 2026 00:18:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780384684; x=1780989484; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WnPeFnYm50VptjiqnHaSpsB7Y9ad0zWN9mmwwejDdiY=;
        b=inBvZFelruh7o0Fw1YtO7rWQNWLWbHOlnocD2ZXIrxbCWVBHZqqzYcKmdGG9IpMr82
         ElNKynNi65fPnicqTKP6X5J6DKPx1cJBwkKGp2izrOu4D3eX1wmjNvxYispOt4HTmLuU
         0gBfIqqyZ5XG2xvurXLkisJWI3RG+UAqICdzopVWKDbiuvbP9gnZnj3H2HBvGJQ4PbR1
         xqmzYqPBaeT2Dz66KmNgP4zBIpOqtvCYWnhlyWtJPLh+2HsKUBBD4Ionk1dMbKxhQDMe
         mXmDMblfZHPOsVJ8UqAvSR2xOmgHgTL9acJm1IsEJZ49GLiahNkhxM4sIn8LNZC7Sgac
         8k0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780384684; x=1780989484;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WnPeFnYm50VptjiqnHaSpsB7Y9ad0zWN9mmwwejDdiY=;
        b=fG1s1ooEgKI+S/yyKvpc0nJfmIYvbbRUBeHMQC7pMfJ6Po6bIOEakFo/v3oi0ViynQ
         gd04vKtj07cesQ8sNjMy5SuuBi5ZGONeZ1P2fYK3f758HSHn4Ko7frVNKui8R+CKUzns
         kAdWhW3NyUUTq6tgpj4QLzhQ3xj7AWmQUc96aXQ+nWnc2qVX6p92/3WQi84zvlG+kJeH
         /WtCSIuvT21wnhseeddVrLUQuwPypSNhTo4YCkFVpx+HTbhlEKbxfxPMhVT4Oc08kVZV
         VsN5CHnObh743HjyTiO9ga++BwqbL7Xyw9c6bNC/EXLlVBYTSausskAS+azacyX1MLYE
         wYnA==
X-Forwarded-Encrypted: i=1; AFNElJ+rXxgOO5yL1i+74zBv+bKvWJgFIROpUcfvV8pK/BDgKU9rUYGDnAwYTNFMfkiK+rf6QiMVhVD/auHEreXS@vger.kernel.org
X-Gm-Message-State: AOJu0YwmAvhXVMzxqdXv+7k/JUNdSiwLEkwloPxyHZVkGefR2lj+glKi
	FJXuNYm99h4S9IHB+TnBKOneEle5QsayxfokiZxwH8u0ln9iS+4APl6Mgh2XnycdrGOSYlZk0GE
	UeBcZrSxlDFDBN8CHuZrHi1hZT3A02amMcITslrb0OcBLFQp/4SZSDM58snw+4nsZpyO9
X-Gm-Gg: Acq92OEHJ9e4z8RMOnXM+hwL6Hk35VPHbefA4y/IJxoaWhmom5ilqdULdeP+ulvtQN0
	OE+6KXRXwUvns88hgEyRPJ7BhcP5rs/BfksxkaX6SQF/I7jAAM5ibxnrzjhVfyuNqZvj1nn3YsU
	KOOwLERbvsrLDJvjtXESPJa0WSq9pnuw75sYuueT47IaPI4Mhb0VCDUycZ4xEEHKn+Eqc0iQ6EO
	QRRo8ZYWtgfO00ZmqlmT5O1rRfSoON6yZNAsPj440qoB7eGl0tDE49OL7IcWzuBBmX5u5h0yqUo
	7kG8NOtJCjwb8iECx3UTAKZqDFXQwCf8X24+QpXyPJOoq1s8k21/eOTfOdjnLwwV15mpX7hUGXL
	x2k8TkqFG1YcD66WCtX+nxb39N1J2VjVYgxmPxvGzsgQN4seKFmoQIEuVjvgVpkhV69ZkVG3gLF
	gzXVuRLnhHeMrZLtpXyPq5LzqATyxBsQ==
X-Received: by 2002:a17:90b:2686:b0:369:e217:d110 with SMTP id 98e67ed59e1d1-36c684a9270mr14226557a91.27.1780384684128;
        Tue, 02 Jun 2026 00:18:04 -0700 (PDT)
X-Received: by 2002:a17:90b:2686:b0:369:e217:d110 with SMTP id 98e67ed59e1d1-36c684a9270mr14226519a91.27.1780384683602;
        Tue, 02 Jun 2026 00:18:03 -0700 (PDT)
Received: from QCOM-SocCW5bzXR.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36dd91c9991sm1766279a91.7.2026.06.02.00.17.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 00:18:03 -0700 (PDT)
From: Jianping Li <jianping.li@oss.qualcomm.com>
To: srini@kernel.org, amahesh@qti.qualcomm.com, arnd@arndb.de,
        gregkh@linuxfoundation.org, abelvesa@kernel.org,
        jorge.ramirez@oss.qualcomm.com
Cc: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        stable@kernel.org, Jianping Li <jianping.li@oss.qualcomm.com>
Subject: [PATCH v7 1/5] misc: fastrpc: Fix initial memory allocation for Audio PD memory pool
Date: Tue,  2 Jun 2026 15:17:46 +0800
Message-Id: <20260602071750.526-2-jianping.li@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260602071750.526-1-jianping.li@oss.qualcomm.com>
References: <20260602071750.526-1-jianping.li@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: VPG9IKlq6CnxcPZ-gusK2JG6IxnQKhUu
X-Proofpoint-GUID: VPG9IKlq6CnxcPZ-gusK2JG6IxnQKhUu
X-Authority-Analysis: v=2.4 cv=MKFQXsZl c=1 sm=1 tr=0 ts=6a1e83ad cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=Rm9GPb-2FwNFOyaWfJMA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDA2NiBTYWx0ZWRfX1SFpneu+Vjri
 eGkpB6vqN99zZTmffQWVcVGscrf4jYbspTJ81gl0sY4MC75iAbCc8j011phePEfJUN9y6ObbZxF
 qnzVwJJ+lZnCy+bKCI3Rhxb0ebCVV17TxYiXOP+yOqBOCsFfkBrwSmcPR81rY5RVlfEOM+2+Uqo
 t4WEvlukn/k3iUDMigEpq4eIHiYkl0MN9jwTtcRa++BFFudEImCTfqeLuhIsHkRfIiUZAr8CPTJ
 fyIWr7ht4dGnLdyeUJiFMMavwHVXnJo+x7gnwUEZKA1kCxuJl+Axb7TIja8/crRiXz/kTvGKkMy
 N/Tmif90jej6z6i7oXyMy3x2xK0FobgZ9TKZpeBi+n4bO6mwk/NdKi9jKn/HEu3gnaYKG4la9Z4
 Wd3oxbKLoCtU3ZUTdquhJVHrSW3KoyGNSp4UInydCMwRPErDmYYGTNlV7oK6k5h02ZwwGEiPU5v
 51JZCUicqKALWbC6Iew==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_07,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606020066
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110732-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FROM_NEQ_ENVFROM(0.00)[jianping.li@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4EA5E6298EE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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
Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>
---
 drivers/misc/fastrpc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 5524354f3ccc..80a636962357 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -1373,7 +1373,9 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
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
@@ -1396,12 +1398,10 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
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


