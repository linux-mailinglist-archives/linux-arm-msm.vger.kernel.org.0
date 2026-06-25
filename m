Return-Path: <linux-arm-msm+bounces-114465-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id u7TlDQ3iPGoJtwgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114465-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 10:08:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C16616C394C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 10:08:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=c1AYtYZs;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=If4N5fD+;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114465-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114465-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 39D64300B9F6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 08:08:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AEB136EA88;
	Thu, 25 Jun 2026 08:08:43 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09036218592
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 08:08:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782374923; cv=none; b=E9SjO+YIDWLoDB27bGpNJfzdxuuO3CWfjqcSOx3pAK14gbZ5QFLQlJrYRbqdkiiafHA9aU5zlDb6SPlo0E2rfeC8zDD74u7pAkeSyxqSM6CMqeqGS/UHrPYKiMSLaUtY4wtWBoEkZH+8scxCTAbI3JsJRlINTPhxfr5QgaxKOac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782374923; c=relaxed/simple;
	bh=OJdoDx2djskYq7ZseDJEihZ8UZA9lThjt+Rxl/XT9IU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=VaO/mzEPcj9U8Y0Z/S/Ft/dpz7UWZ+7nzkGGgiVsX+YG2SB9HOEyQTzauxNwnqL2lrYuGh4dz7KUib6NZCsWeOeUp/jHqaysmvPlxa3tYHR2N5x3Pf/UYgXZD0HBCgO13vivBdQKLPsE3jlQoWP1AUaGkNlyEHRJxFMX5lbSGJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c1AYtYZs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=If4N5fD+; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65P3eFfP1192143
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 08:08:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=sb+3siK+bp3PKyAROTwDlHIQzDF1Ozu9V1v
	6eRxHPHs=; b=c1AYtYZsA5L6JLazbZ0GHTuR3U/9PQ+N5i+ft17sh3hgufBUOgi
	2Qvo0TE3TETJwTsPU9lbIaKTvnqB4ZZjOBX6M91tdSnQPrzoEQY6hF9tecN06PG3
	U7OI3my9GCTr4H7mghOYUU877iaeoUcVoDuuTl+tOcuHS7vRkQdOM1AbTqziKqkD
	SA7I0tbfiAiCx21lE9RehRwYKKzHcb9ojJLQyHQc7RehT1LHcPI8jDyAS6oZAD00
	6GrvwIRfiv0JC2Wfr2BNNHqWywX8SG9bIJvpvnb2UmMxYlZ3cM25XmpaJsiH5FaS
	8qltYuktOFUHyaY2RnJ1FYw3rLrsgM4TwxQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0uhmh6y3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 08:08:40 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8423f3e4728so1454654b3a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 01:08:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782374920; x=1782979720; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sb+3siK+bp3PKyAROTwDlHIQzDF1Ozu9V1v6eRxHPHs=;
        b=If4N5fD+YaAf5kD2JhFtX7fqo9pxf9AxfYGgxM5pmAxe9NgkVE1dcZhf2RgrTd+Uqr
         yY7/balBN0ts4V2OoRiTxRYcep2SZMqg4bpwuXio8bjc2ViRyTZxPrvapn3geah+hO3a
         YeJjsRmo5DcGz19dJyy0jAIfBwyvhKKd4Mvtxa1OHtJ6UXBU14DMe49Thyb9qBN6YmMt
         Ggn4yd4tZS2/SzxOikyRZDqOOL0YKTsrDnvdTieT9z7N2iBZ/LsUKK4deZf+75D43TlY
         JR/XnXcqGh85x4Or5W3gOvpv2Or0ETvrrixeMD5ArTMOzyfo/ZQQBHbbyNVvlyEO/ERD
         Lzrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782374920; x=1782979720;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sb+3siK+bp3PKyAROTwDlHIQzDF1Ozu9V1v6eRxHPHs=;
        b=HsAzsSANYsGOH/M2ZmevPGczu11ZpXWqLpE4Ad+pA6gTF0NyK8MpUkDgMbGGytC4KM
         lpvZwKzV7pBWzzHiySBgdK3cfAp8noGUbg0oJU3wgQw6PHRK0CTxjQEEKkfJtnx+hydi
         Bx294qTc5sFwOxowKAEKXiYWEwIEFfWYM+0XTmZQLZMchstFkbUWwpcBxNIPAmUGfzQj
         J2BPKDT8cHInbGj4j3pPul05s1dmZ7HZ+SsQFiTWI2gIMEbWd/5b5B9v+bKLpH2ioaNo
         iSnBotJ/Tujub87rpaX8QrmfUKmlets7UWIXan1KEKrfX+3hbPT20OALcTod0dz74ZaC
         T0RQ==
X-Forwarded-Encrypted: i=1; AHgh+RrHww4A+4yx607uVV3uCrqE0hB4lcYkcv2xHjj6oDi+h54SpNaYG2YCpnffE4ws/rfYXl3HJ4XpvgefzYNe@vger.kernel.org
X-Gm-Message-State: AOJu0Ywzn6K88pLSFLc5hOSxc/98n2sY+A35hxd+fYrCcAQuN+P1rl6l
	8Gti82yVcNK8jkEw+KL0VQK6wDeFUH84YmcM2L+qPdAGDbf8vYzSwI0PTvSJDNebQ3ucOfvQgOU
	cK4rLFm3G9p2E/Hn/T1WUQW1J4i4wn3zoRuEGd0vOA86nPjaSVAMIYEek9JrUmLGxNltM
X-Gm-Gg: AfdE7cnzfHCLb1S/9GN+9H5ghrpP0xJ0Fn8+HdYp1uNctqzz6XnnAzRQcqm73MQ/RiB
	uyi8axVQs9SO6owHjl6x9uD07cw/XbeUNGHONbIYZopJT+O/aRuedMueqiQqWDtVGQi2D5sKX5H
	udcAVE71ayvJDRnmMJjPkzp2yUIBBRH5Lt8lUQ+CUyYyvr2xJ+/p7rstbAip9JSBUSzGuTQPhRh
	RxLHz5HeBYF2HMKHYPNNwg4JIe1tJdm8QqPzx5f/tTfXppLwON26cW9taW4AZLtfhM+jY+dC50o
	yUZjbxoA0rwffa1LCD8i7i18fHNfiEdKHWXX1duPEIZA2JxtPRtxz5ChBlhfmR7LqlmOCFcc25X
	KE78nLVNLoDxLxd2PZjjCDYtGE1BjwDX6rIHYQ8XgrAFfyg4IV8NKik5ueDoZzauEi1xvS522/Z
	1/j25ouH75
X-Received: by 2002:a05:6a00:14cd:b0:842:4387:34c2 with SMTP id d2e1a72fcca58-845b39f2224mr1854514b3a.10.1782374919829;
        Thu, 25 Jun 2026 01:08:39 -0700 (PDT)
X-Received: by 2002:a05:6a00:14cd:b0:842:4387:34c2 with SMTP id d2e1a72fcca58-845b39f2224mr1854476b3a.10.1782374919366;
        Thu, 25 Jun 2026 01:08:39 -0700 (PDT)
Received: from QCOM-SocCW5bzXR.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845b927cc0bsm495077b3a.21.2026.06.25.01.08.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 01:08:39 -0700 (PDT)
From: Jianping Li <jianping.li@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>
Cc: Jianping Li <jianping.li@oss.qualcomm.com>, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Ling Xu <quic_lxu5@quicinc.com>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        stable@kernel.org
Subject: [PATCH v1] misc: fastrpc: avoid duplicate DMA mappings in fastrpc_create_maps()
Date: Thu, 25 Jun 2026 16:08:32 +0800
Message-Id: <20260625080832.17477-1-jianping.li@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=cqerVV4i c=1 sm=1 tr=0 ts=6a3ce208 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=oQxmpDa7-PQQZ_56PAcA:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDA2OSBTYWx0ZWRfX2m3kPkgNaaaz
 8wl9zwn9U3hsipws+Bvl7p35BoOtm6TM4f8arE7q8/1u3Z0Ydh1aARhOBduNSg74evcjHy/xfHC
 kg7Ldj3k0xQcz+rKXMjTOlMXERmHi9uhyoGQmifjcQfHdT1uE8R948eVbAaPGI4xzGem4whUtAW
 U9826DwrUt+wCtcpCVP6vqGxe151l+4oKjDn79rvo18GDH53gl4F3cIECYzRcIY13m3sXk/8svs
 qZ86mOisKDGiWX+OUmDoFXC1+yRXKHid0wmC0QN5rwHA1B6Hz3HwSjI9S+tfckWSVIckcQ9on4P
 ZTO7gDQ31ljPruG/Wh2XACXmiqs5uC7vvJAzpU1PrM0kINgBKkmj3W7UttUIIyUt5g3g0kVumyP
 pI7e2T867YDt585WjM0xTNSoQtY+DyoZDHfHpHSrsZtnWv76WCHNYOtLY/BeiJkiBjJ50wcA4vy
 nSAFFAYRlzhg3IxRCUw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDA2OSBTYWx0ZWRfX69c8YwDTbgrJ
 m8we3BqyTEGFfWjZhVpxnKwLu9q5JnZpoj6lmoQhfqkoSf3fPhCl99S6GM/1fTqbKjAiQsytLHN
 wIqCd+sihtm1VjfqRWGxlWd+0yi+MZY=
X-Proofpoint-GUID: t2BEcXHgsYaCW0m3IXf074zZ4RRxasMP
X-Proofpoint-ORIG-GUID: t2BEcXHgsYaCW0m3IXf074zZ4RRxasMP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 phishscore=0 priorityscore=1501
 malwarescore=0 suspectscore=0 impostorscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606250069
X-Rspamd-Action: no action
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
	TAGGED_FROM(0.00)[bounces-114465-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:srini@kernel.org,m:amahesh@qti.qualcomm.com,m:jianping.li@oss.qualcomm.com,m:arnd@arndb.de,m:gregkh@linuxfoundation.org,m:dmitry.baryshkov@oss.qualcomm.com,m:quic_lxu5@quicinc.com,m:ekansh.gupta@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:quic_chennak@quicinc.com,m:stable@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER(0.00)[jianping.li@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jianping.li@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C16616C394C

fastrpc_create_maps() performs map lookup only for buffer
arguments (i < ctx->nbufs) via fastrpc_map_create(). For
arguments beyond this range, no lookup is performed, which
can result in duplicate DMA mappings for the same file
descriptor.

Additionally, if the same file descriptor is passed multiple
times within a single invocation, performing lookups with
reference counting would increment the reference multiple
times, while fastrpc_put_args() would release it only once,
leading to an imbalanced reference count.

Fix this by allowing fastrpc_map_create() to control whether
the lookup should take a reference. For arguments beyond
ctx->nbufs, the lookup is performed without taking a
reference, ensuring that existing mappings are reused
without introducing duplicate DMA mappings or reference
count imbalance.

Fixes: 10df039834f84 ("misc: fastrpc: Skip reference for DMA handles")
Cc: stable@kernel.org
Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>
---
 drivers/misc/fastrpc.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index a9b2ae44c06f..2622a1360a65 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -924,9 +924,9 @@ static int fastrpc_map_attach(struct fastrpc_user *fl, int fd,
 }
 
 static int fastrpc_map_create(struct fastrpc_user *fl, int fd,
-			      u64 len, u32 attr, struct fastrpc_map **ppmap)
+			      u64 len, u32 attr, struct fastrpc_map **ppmap, bool take_ref)
 {
-	if (!fastrpc_map_lookup(fl, fd, ppmap, true))
+	if (!fastrpc_map_lookup(fl, fd, ppmap, take_ref))
 		return 0;
 
 	return fastrpc_map_attach(fl, fd, len, attr, ppmap);
@@ -999,23 +999,23 @@ static int fastrpc_create_maps(struct fastrpc_invoke_ctx *ctx)
 	int i, err;
 
 	for (i = 0; i < ctx->nscalars; ++i) {
+		bool take_ref = true;
 
 		if (ctx->args[i].fd == 0 || ctx->args[i].fd == -1 ||
 		    ctx->args[i].length == 0)
 			continue;
 
-		if (i < ctx->nbufs)
-			err = fastrpc_map_create(ctx->fl, ctx->args[i].fd,
-				 ctx->args[i].length, ctx->args[i].attr, &ctx->maps[i]);
-		else
-			err = fastrpc_map_attach(ctx->fl, ctx->args[i].fd,
-				 ctx->args[i].length, ctx->args[i].attr, &ctx->maps[i]);
+		if (i >= ctx->nbufs)
+			take_ref = false;
+
+		err = fastrpc_map_create(ctx->fl, ctx->args[i].fd, ctx->args[i].length,
+			 ctx->args[i].attr, &ctx->maps[i], take_ref);
 		if (err) {
 			dev_err(dev, "Error Creating map %d\n", err);
 			return -EINVAL;
 		}
-
 	}
+
 	return 0;
 }
 
@@ -1508,7 +1508,7 @@ static int fastrpc_init_create_process(struct fastrpc_user *fl,
 	fl->pd = USER_PD;
 
 	if (init.filelen && init.filefd) {
-		err = fastrpc_map_create(fl, init.filefd, init.filelen, 0, &map);
+		err = fastrpc_map_create(fl, init.filefd, init.filelen, 0, &map, true);
 		if (err)
 			goto err;
 	}
@@ -2100,7 +2100,7 @@ static int fastrpc_req_mem_map(struct fastrpc_user *fl, char __user *argp)
 		return -EFAULT;
 
 	/* create SMMU mapping */
-	err = fastrpc_map_create(fl, req.fd, req.length, 0, &map);
+	err = fastrpc_map_create(fl, req.fd, req.length, 0, &map, true);
 	if (err) {
 		dev_err(dev, "failed to map buffer, fd = %d\n", req.fd);
 		return err;
-- 
2.43.0


