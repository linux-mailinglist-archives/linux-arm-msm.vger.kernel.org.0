Return-Path: <linux-arm-msm+bounces-111996-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id oWbrAMuBJ2p2yQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111996-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 05:00:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C72E65BF17
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 05:00:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="dGE99MM/";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ZWj5uHEy;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111996-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111996-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8D1AD309E747
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 02:59:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8F1C361663;
	Tue,  9 Jun 2026 02:59:54 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD39535E94E
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 02:59:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780973994; cv=none; b=J+nvHwyNHN/gAIIPZz0yW/p3wtV4MXC+AjC6G7VIeioujH/8sHvk1496rhkG/OIzMu489/rFeFEMCnEdBnWkgG4vjltPsSel4JRhhEtWyv7u1GVJjQxEmPztxgQoqLAFxaUeNxetD3QmUWfBPz4McsXAPb1Ir+hvTQzCMk9qeDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780973994; c=relaxed/simple;
	bh=4ulHOYGeyAaC+y+8rxA9T8W7h0nJpUcBKdMft56n4jE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ujz+uAh+Wz0K4kJyHNvipii8D4daGZEmpLyQP7ifgPmpytzvyGkIyccXcWX2UdWJ1qDRaa21AcKN2p7mcddaKMVqsD6FlwufDhbHaOOlCUAPdI5pG+4hYwPFfachnkET1mGhu/jNa6GczSYe239a0zMx4BsUHnsdfLABAGgDPt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dGE99MM/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZWj5uHEy; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6590s7r4660151
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Jun 2026 02:59:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=IJDGglN97rh
	Rw4+XmxNVKbWIstzQQy65lHqMCInbHtI=; b=dGE99MM/oChVybdXdmUi7Nz0qDk
	90aaTHO3oDtMpnhajzqDa5znAJXJBHqZKr0UdoSmeXJ0rQGzkaOJ5rC9kVJZfaEV
	xn8HY21OVj0Eeq12oKe+cgtSZOr3t/WoJZAr5bLekqMIJEo5yrwlI9h4fk3jBvOV
	B/GxHST5SJNu3tWY02gBB+6BLMu8ZVlUwFxRiXOnah776zhsQNxwwJMTe2tEiZwG
	Soz6y6xlr0cudwaFtT0pAYLy/BY8OD2q1TaqCmUur/QFfoEXK87cPGgxgTTjqxJB
	SV2AivpCZoqN6dIIQoEoCvjf4k+8tKZVto6CJQWlncUfV4hMmPhboNoNUUg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enw5m3ne0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 02:59:52 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c8584e80bfcso2258467a12.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 19:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780973992; x=1781578792; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IJDGglN97rhRw4+XmxNVKbWIstzQQy65lHqMCInbHtI=;
        b=ZWj5uHEyo6fx2I3ZuzplF83yvd9cqxu9FUV66ZYrJgWtBUqrbQ6XHwrzpIeVPyUFcH
         NOX6OYB0FfMEuBfHOrUk81nebz7soQkaay6j4dxbfsxTKNIa1hNhao7NEd0eGo0+mblp
         xog4zCTXJvJujXqd9srMsxgfgp+nBYSOOi2/Iu1hyYoVPg5bSQmLCTDmXjs/1qJXB9zM
         GsJj4kSXLYpGeDamWv9ynuG55HwPaPc3HFwH/g5c9OGYrwUW/p2rlGJtj0W+KyIfn2gG
         wNdBsb5+npi5rRVWRsxi78s5Ae+A+5nAuAOsVqS2sWuD58FNuo8CeTGWsEsa1OR2CVeC
         90hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780973992; x=1781578792;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IJDGglN97rhRw4+XmxNVKbWIstzQQy65lHqMCInbHtI=;
        b=kU4xrWqEB5zH4qd7NFMpDhyh5t5v9SCfgZBD6J0Abu7vWPUwns5xO2P2N1H2/Z+tQf
         Txg3kTG48lBxHR/07EV5g5BJmFnztfeb4G3YPxX8wc6krDvMOqu288J7q0KbD0AfJhtA
         YrSoy8m4hZ1fwjls/mAGMMqGam2gLQ9kcv6swgCxPM64MUAf1Ugq4j+s/OofOETcBkIK
         HNTXU9LdfRaoLlTdSiZi4pzum14Hd4qZnZ80swaZLzLWjgUJRtxc/mjf4LFtyRmWkCzW
         E1/tPXJN6GZ1R6oiWRIbAg/ev+lbhyqm8zPKca0e5ANOgRu7a8KxUd+CRphUZh3TzE4G
         IXFg==
X-Forwarded-Encrypted: i=1; AFNElJ/4hHAGJBX1uf1C+p89yi7OD5GnejQFWw2bMc1MXUX5kJLK9xvd2On8EHRH4Jo79LDdF0/hiW/oolMEYXzk@vger.kernel.org
X-Gm-Message-State: AOJu0Yyl+n4WAKOGNtaJWfPPzvoS6KJwWYLsWWNd2Q0POAFhRnQdYryv
	rl3O57k0XO89IvYGce4DSAK4mKRNjDyMREfQ0g6+eura3ZD+q4bBGMG0U9zFfEfdqct+OwHn0E8
	p98nUevIBBx1aTmwpQ4NgacmFumaoSYQTnvp8iW+Bw4H1v4ZYgjmr4W1P/P+0tkLmrHmL
X-Gm-Gg: Acq92OHRkGWhwR+1/X5bNyhzYNXmKLepwiwZlt7X7OvbANNqNI2u5tp0IyKRxd1K/kC
	292PAkDqRtmkteONYR2qntswNUS2lzrDx6+Mljafks3EqJm+jWlxcqj7NjMujYPC2GPgg3uSD/6
	Dyxr12BZ6ReLRxt/YVs2x6pegh/cL+rxyWuo5ckw0tPknA6jU39WaxuKH4eXI8vNNGK1UXwoBEY
	pmKBl4jWu+Oo7sGYTl8OtQKlItbQcqf20NaaH3lPPNPMetZc7Q2KqANusdq0WFGFl+UJKyLKyH8
	P+6F+E9Qe9uUs8HvZXRyJQ8dNfym3TwNSnofuGifkOs2AnB/ZwU/q2zjl3r4T9EkhJwM89Ecz9n
	fdMAEGlpOzq4opOrJqM7r7hCTv2qRI41mV3xFBIz0ReqmOp5xRKJD+Lr3EUwNZGGsXaBYkp0T96
	5uBZ5Z+dKbu/KaJEEBm0So5zpqt6De
X-Received: by 2002:a17:90b:1801:b0:36b:bbee:fb28 with SMTP id 98e67ed59e1d1-370ee33d0bcmr19282626a91.2.1780973992240;
        Mon, 08 Jun 2026 19:59:52 -0700 (PDT)
X-Received: by 2002:a17:90b:1801:b0:36b:bbee:fb28 with SMTP id 98e67ed59e1d1-370ee33d0bcmr19282595a91.2.1780973991684;
        Mon, 08 Jun 2026 19:59:51 -0700 (PDT)
Received: from QCOM-SocCW5bzXR.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3712fcb2607sm8713835a91.0.2026.06.08.19.59.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 19:59:51 -0700 (PDT)
From: Jianping Li <jianping.li@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>
Cc: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        stable@kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jianping Li <jianping.li@oss.qualcomm.com>
Subject: [PATCH v8 1/4] misc: fastrpc: Fix initial memory allocation for Audio PD memory pool
Date: Tue,  9 Jun 2026 10:59:35 +0800
Message-Id: <20260609025938.457-2-jianping.li@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260609025938.457-1-jianping.li@oss.qualcomm.com>
References: <20260609025938.457-1-jianping.li@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDAyNSBTYWx0ZWRfX8219dd5pGQXl
 o7E+Vlo9p9uo10y+dEa3IlISXGsisApAJ3N5w/Z6HudNuIGfpnm9DPMe1JQr1iqaf0PlHKzEccs
 G+R53lvHHnAf3PA/sehAs6FN3SI5o9diyv9rVm4efD6AUfvVPvr9TRy0vVQQsWpMnNDabsLVK9z
 tB4SY6cBgcZrYFOLBMMXD6qn30qLonBmyORBwuPR3ZjFMaZhSlfwGypRnqOdKRfHfnjMon9DLeS
 Aq077plTnFV/IDA6xpPUg1Qrf1riWi2clSJ74sPddav4k6UXibjGsInYEZFsYrmu6h7/JRK/Oz9
 MnH3b7FUb1zXU3FA90dzembzofdoKNd8eBwmKrHHoLlhgBo87Guwwn+i90AewikJPLmFeOlipAs
 fjPUASOiULkzmSllLJbSBGB1qaC+RTBN4Z0CwalH28TJt0Ox+yF6QvtCZc1TI6C2P519wQ4NI0b
 Qdwh5xxzksJ2JkT6iRQ==
X-Proofpoint-ORIG-GUID: -UNiCtj_URSV6Wg9kUCzFSjPr49yX-7L
X-Authority-Analysis: v=2.4 cv=UptT8ewB c=1 sm=1 tr=0 ts=6a2781a8 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=bIEaOLAPTWlh-3IGMggA:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: -UNiCtj_URSV6Wg9kUCzFSjPr49yX-7L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_06,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 clxscore=1015 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090025
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111996-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:srini@kernel.org,m:amahesh@qti.qualcomm.com,m:ekansh.gupta@oss.qualcomm.com,m:arnd@arndb.de,m:gregkh@linuxfoundation.org,m:abelvesa@kernel.org,m:jorge.ramirez-ortiz@linaro.org,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:quic_chennak@quicinc.com,m:stable@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:jianping.li@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER(0.00)[jianping.li@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jianping.li@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6C72E65BF17

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
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>
---
 drivers/misc/fastrpc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index a9b2ae44c06f..96961217b856 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -1370,7 +1370,9 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
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
@@ -1393,12 +1395,10 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
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


