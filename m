Return-Path: <linux-arm-msm+bounces-113006-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id tlCQDLeRLWpthgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113006-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jun 2026 19:21:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C041967F27B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jun 2026 19:21:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Hs6ygKrH;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=bma4WZRf;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113006-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113006-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id F1010300683C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jun 2026 17:21:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27668327C00;
	Sat, 13 Jun 2026 17:21:35 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DF3632B10D
	for <linux-arm-msm@vger.kernel.org>; Sat, 13 Jun 2026 17:21:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781371295; cv=none; b=p7hw2KcDtZVk0vYm1NY2QvGB19k/C9nO7U00AJ05usug5IfsJ4Z3IvQk3x8S3yZe7XguWoTH9fdOiYnj85VK/loQGh4v30EE1qw3OxtwdBtQ08GsL1u7aT7e85hX5wUSalWqnSk4xzr8goCkZz0cAGAkRxZFCWpQX4TkoM0fFoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781371295; c=relaxed/simple;
	bh=JrEBDVSR2nkTeNdCYAhWPyaNXTAWBRV/Ax7hvp9FT5w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KNzb+j054F+Ik5NUkFNeJAx/m28vTvIIajAPLCE+L3pDvJy0i3Z1YSz98x+nmRy5TnhV7w37ih3D3TcQmEqH+HfsFroJhrjCHWg9yoqqaCCKUCpLadaIqajdsW4kSZ7fC3L9GGaWC/f8x7CpJG3FBRxGR0ZacFalKTyW8cRvwzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Hs6ygKrH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bma4WZRf; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65DFBDjS3258707
	for <linux-arm-msm@vger.kernel.org>; Sat, 13 Jun 2026 17:21:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gmDg6wpviGfici5wFw4rRp3TOW9sHNaqJUgICxRvP6Q=; b=Hs6ygKrHsfqhLSA/
	y3v+FTKnv6YyTHSt4kUez393vsyDxS9tMSuz7GJlMqGy9X1VFhqDtl+fYRVqU/UL
	4oCC1wpP/zYPctUNGzpUo1WMQrRzlYQlYlkSgMdiEGYNR8cdDr+xiJXR2fRBCp/r
	7EwC+PVQ28p+bs9+38ypxUawOxqMwe+KtoqTCtQ3nNnfwysj5V8iZz08/v/nfRvq
	vZ/LAGISPOExJyT/FRXVXjLROgN1aVQmgY4MqlBOYgFBM1w2nUdykpLO0eYcOHb6
	l1ISlJz08W1pRK78IR8smpIQF/fC0irKLZybRQfjq5LzjL1vnKzaUfBGo81Bm+4T
	Z+MXTw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ery7gsnj4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 13 Jun 2026 17:21:32 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-842208d5b0eso1559346b3a.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 13 Jun 2026 10:21:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781371291; x=1781976091; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gmDg6wpviGfici5wFw4rRp3TOW9sHNaqJUgICxRvP6Q=;
        b=bma4WZRfQBkzbLC2FX2aCTBLI3OnZCSIb/zvmTzGCUneh725FNgWumyQK0bTZLUoAo
         rWnXZXo+GkSYP8e2ImjLoyNsZjVnFIPnV214Ft7qiSTBgumDCWAhE1+vdWPkmoVjO0po
         RmbdTz8xVFfvuTF7E9sVqYPdFJiI/beTcTFmSX7JBcfM6YeptrmqYcVR4ZDu78KYv/LF
         CTGY7vcBm0FzmDqEYQPFVX0vv9qmzaV6SCCCIuYbXPV8YWFvxgXRNaHDi6Qorkr6gvUs
         oshgirqxdRugm5LY3KdYMizO9QlDKdYQbVuQMCgg0sNKPkMjvaAtGYK5veTCwVBqeeMH
         mm3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781371291; x=1781976091;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gmDg6wpviGfici5wFw4rRp3TOW9sHNaqJUgICxRvP6Q=;
        b=OqWACof6DvOCkpy2JN+laG2vF0YNdHCp8AHptNxzOWIG/vvh6mjDVCqaqjs7MSDptG
         2BXX9wEWmFr9mNl9PTspcWenr19cV71h3qaCA6G2r1Oa/XsOULT2esNfDhixBJRaQjIO
         P1dG76zjuKCgr5f2hTQ9IDGqpDbL4LGgLybGlTKWCxj62xlm+KCjvFguuZM3QHbwFwpE
         bZy1iS+tuO/QlgboaesTSg/dPuKawSSj0dO+NTc5nvjjdHRFHVPpRiTz51Iq1oRkPklE
         7FwO84iZT0dWbvTdkfcCtrRpNII3giAMRFsAeqtl8GdomWCa0jq82Qs2RLWLuEJPdQ1r
         372g==
X-Gm-Message-State: AOJu0YzSVkXDQHOzn1XewOlX78cMifmTxZfid8z5gez9slaWo/yAzqEt
	XTsNV1vaiUPBz7DmWTIPjufgzr0HvKMB3xXe6TiOkmXc3D+G43DIV+IBX8VmHv2K1f0LMPYSuFQ
	Ejjktz+5nBRQjzJGGVyHBy7LFincp98/5lLlT9P1Eb2PX1d+YlaRXxKxWkKPdc3U4YHxA
X-Gm-Gg: Acq92OF5ioJJ6APc2ar4zW5L19ujoE6wrsoCP0FHGxzXzi3TJI9m1Q6XqnytvKK7VMt
	ZJY27O/QiW87KzV7dJPhpGAGalhvvA3qGEudO8429ttdk1r+l8pRY7Uo3FUarAND8YnU2Ovop8j
	xtD5qf+kQnAjM2yv9rStL/VdqwmeDFe4E+WrHApvYdTm5Rr8RLRfc4D2Iuzk8ZqkMM/LHTQxe7t
	M3TEcS1LnMZLmFUT3v3SbULCMkzr3WGjYUlMxuGy8Tj6ehqb0GVlkXOGwL+d+hxeAai3bGoVw0I
	MDeoj2UXtXJtEByluh5+znAvyp+ozaZudr7M6xkD1rFGEavtQVXKxQJgLjLuB/yINF8SV4A8ACh
	5FFOQvyTzaBLmpmmMN3m4AsvG+/sNXcAM2EryZQwIB5O8htau9zT7wg==
X-Received: by 2002:a05:6a00:3d48:b0:842:3a98:b34d with SMTP id d2e1a72fcca58-8434ce83f17mr8390899b3a.31.1781371291152;
        Sat, 13 Jun 2026 10:21:31 -0700 (PDT)
X-Received: by 2002:a05:6a00:3d48:b0:842:3a98:b34d with SMTP id d2e1a72fcca58-8434ce83f17mr8390867b3a.31.1781371290674;
        Sat, 13 Jun 2026 10:21:30 -0700 (PDT)
Received: from hu-pranarya-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434accbec5sm5390913b3a.16.2026.06.13.10.21.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 10:21:30 -0700 (PDT)
From: Pranjal Arya <pranjal.arya@oss.qualcomm.com>
Date: Sat, 13 Jun 2026 22:49:50 +0530
Subject: [PATCH RFC 08/12] mm/vmalloc: track lazy-purge queue as a
 list_head
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260613-vmalloc_maple-v1-8-0aa740bb944b@oss.qualcomm.com>
References: <20260613-vmalloc_maple-v1-0-0aa740bb944b@oss.qualcomm.com>
In-Reply-To: <20260613-vmalloc_maple-v1-0-0aa740bb944b@oss.qualcomm.com>
To: Andrew Morton <akpm@linux-foundation.org>,
        Uladzislau Rezki <urezki@gmail.com>,
        "Liam R. Howlett" <liam@infradead.org>,
        Alice Ryhl <aliceryhl@google.com>,
        Andrew Ballance <andrewjballance@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, maple-tree@lists.infradead.org,
        Lorenzo Stoakes <ljs@kernel.org>,
        Pranjal Shrivastava <praan@google.com>, Will Deacon <will@kernel.org>,
        Suzuki K Poulose <Suzuki.Poulose@arm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Mostafa Saleh <smostafa@google.com>, Balbir Singh <balbirs@nvidia.com>,
        Suren Baghdasaryan <surenb@google.com>, Marco Elver <elver@google.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        Alexander Potapenko <glider@google.com>, Shuah Khan <shuah@kernel.org>,
        Dev Jain <dev.jain@arm.com>, Brendan Jackman <jackmanb@google.com>,
        Puranjay Mohan <puranjay@kernel.org>,
        Santosh Shukla <santosh.shukla@amd.com>, Wyes Karny <wkarny@gmail.com>,
        Pranjal Arya <pranjal.arya@oss.qualcomm.com>,
        Sudeep Holla <sudeep.holla@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781371215; l=7702;
 i=pranjal.arya@oss.qualcomm.com; s=20260516; h=from:subject:message-id;
 bh=JrEBDVSR2nkTeNdCYAhWPyaNXTAWBRV/Ax7hvp9FT5w=;
 b=HlA43z7W1BgFHiQdUCJ9NYyv6guSh8B+257WOVr1UNUmQ3utJWN5wVgMVBRX9p2ibCldFaTWa
 7E0Iaid+Gw+AfDte7XbFrrnh/UdH/cFriQdiXtcPQ+ualCVfPKMbz1S
X-Developer-Key: i=pranjal.arya@oss.qualcomm.com; a=ed25519;
 pk=ymtcTlccEIDsi3ErhpjIoZZHKdPBYWGWW0Lchs5MsbE=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEzMDE4MCBTYWx0ZWRfXwsY1YxlI0Ys9
 X8ZtzdGt+lESd+jERMcPErZY0zoAXtwoVOph3lJ573IHa7KO500Q7pDsTIhQWp384nFIRseHQJ+
 GR7RgS2ylJ7llWoqB5z39/iZBaxTTWc=
X-Authority-Analysis: v=2.4 cv=fLYJG5ae c=1 sm=1 tr=0 ts=6a2d919c cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=LbbEsUlp8jkdcCOz7_EA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEzMDE4MCBTYWx0ZWRfX9oFvUCQmKnZi
 P3CivX1h2sebjeNUKEz9lrFgSEdx1+/G8KypEIC+fKaYPu6IrQ+1Fs/jDlGAv7veUUmuOHKxJcJ
 Fbs3gAWkhPbBg32LIl2TVad+SIsm+ZdIE+s/HVMM9aBBi2e/XvmJUzSAM/mbGEUUuwTavHHhPbs
 g+0fJD3+omdt7RUAQflB0H7ywBOFLVEiwgvrnksHRbVk5vQ8+x2JiS08iSS4cYZxPCDdVjrxgUi
 1dbSD5ELj0B2rFV5hzthQP3J8yOxKikzkSPi8hstFu5NljO0woTwEZEF1YloVPVe0nZJkwq/Hu1
 1TEDjUP0PwaZ6Y2OcsZmAkIKcXmhGqrdeZeNhm5Q5cBR29hdNTyY44ZiCz97uEI3VOFbI/q7ArG
 z8GBcvGx9wsAIPH0mojDgLG+Ccfemp/Fj5mqvTWYysRrXi5Qs9L0QuhWiyAdfD2zT+sMUUZ+G2W
 Sc229ln7gtDke/rsraQ==
X-Proofpoint-GUID: YFc6E-sMMwIwTNFQw-dbh8baH0jxwPMX
X-Proofpoint-ORIG-GUID: YFc6E-sMMwIwTNFQw-dbh8baH0jxwPMX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-13_03,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 malwarescore=0 impostorscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606130180
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[28];
	TAGGED_FROM(0.00)[bounces-113006-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[linux-foundation.org,gmail.com,infradead.org,google.com];
	FORGED_RECIPIENTS(0.00)[m:akpm@linux-foundation.org,m:urezki@gmail.com,m:liam@infradead.org,m:aliceryhl@google.com,m:andrewjballance@gmail.com,m:linux-arm-msm@vger.kernel.org,m:linux-mm@kvack.org,m:linux-kernel@vger.kernel.org,m:maple-tree@lists.infradead.org,m:ljs@kernel.org,m:praan@google.com,m:will@kernel.org,m:Suzuki.Poulose@arm.com,m:neil.armstrong@linaro.org,m:smostafa@google.com,m:balbirs@nvidia.com,m:surenb@google.com,m:elver@google.com,m:dvyukov@google.com,m:glider@google.com,m:shuah@kernel.org,m:dev.jain@arm.com,m:jackmanb@google.com,m:puranjay@kernel.org,m:santosh.shukla@amd.com,m:wkarny@gmail.com,m:pranjal.arya@oss.qualcomm.com,m:sudeep.holla@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[pranjal.arya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,kvack.org,lists.infradead.org,kernel.org,google.com,arm.com,linaro.org,nvidia.com,amd.com,gmail.com,oss.qualcomm.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pranjal.arya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C041967F27B

The lazy queue is bulk-drained from the purge worker; nothing
queries it by address.  publish_vmap_area_lazy() inserts into the
queue and purge_vmap_areas_lazy() walks it linearly.

A list_head expresses the actual usage and saves the per-publish
maple insert.  Per-node vn->lazy.mt becomes vn->lazy_list.  The
locking discipline (vn->lazy.lock still serialises inserts) is
unchanged.

Signed-off-by: Pranjal Arya <pranjal.arya@oss.qualcomm.com>
---
 mm/vmalloc.c | 133 +++++++++++++++++++++++++----------------------------------
 1 file changed, 57 insertions(+), 76 deletions(-)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index 73a40a88dbf6..1b73001e197e 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -942,6 +942,16 @@ static struct vmap_node {
 	struct mt_list busy;
 	struct mt_list lazy;
 
+	/*
+	 * Lazy list. The lazy index is no longer queried by address on the
+	 * hot path: free_vmap_area_noflush() pushes the VA via list_add and
+	 * purge drains it via list_splice. Keeping a list head sidesteps a
+	 * mas_store on every vfree and a mas_for_each + per-entry
+	 * mas_store(NULL) during purge. lazy.mt is retained for the rare
+	 * non-perf_mode rollback path inside publish_vmap_area_lazy().
+	 */
+	struct list_head lazy_list;
+
 	/*
 	 * Ready-to-free areas.
 	 */
@@ -1510,52 +1520,37 @@ unlink_vmap_area_busy_locked(struct vmap_area *va, struct vmap_node *vn)
 static __always_inline bool
 insert_vmap_area_lazy_locked(struct vmap_area *va, struct vmap_node *vn)
 {
-	int err;
-
 	lockdep_assert_held(&vn->lazy.lock);
 
-	try_init_lazy_mt_locked(vn);
-	if (WARN_ON_ONCE(!vn->lazy.mt_enabled))
-		return false;
-
-	if (!validate_vmap_area_range_insert_mt_locked(&vn->lazy.mt,
-						       va->va_start,
-						       va->va_end))
+	/*
+	 * The maple-tree lazy index is bypassed in the hot path: a simple
+	 * list saves one mas_store per vfree and one mas_for_each + N
+	 * mas_store(NULL) during purge. lazy.mt is left untouched here so
+	 * the non-perf_mode publish_vmap_area_lazy() rollback can still
+	 * unlink the VA via unlink_vmap_area_lazy_locked() if it inserted
+	 * one — that path is unreachable in steady state with perf_mode on.
+	 */
+	if (WARN_ON_ONCE(!list_empty(&va->list)))
 		return false;
 
-	INIT_LIST_HEAD(&va->list);
-
-	MA_STATE(mas, &vn->lazy.mt, va->va_start, va->va_end - 1);
-
-	err = mas_preallocate(&mas, va, GFP_NOWAIT | __GFP_NOWARN);
-	if (!err) {
-		mas_store_prealloc(&mas, va);
-		mas_destroy(&mas);
-		return true;
-	}
-
-	err = mas_store_gfp(&mas, va, GFP_ATOMIC | __GFP_NOWARN);
-	return !WARN_ON_ONCE(err);
+	list_add_tail(&va->list, &vn->lazy_list);
+	return true;
 }
 
 static __always_inline bool
 unlink_vmap_area_lazy_locked(struct vmap_area *va, struct vmap_node *vn)
 {
-	int err;
-
 	lockdep_assert_held(&vn->lazy.lock);
 
-	try_init_lazy_mt_locked(vn);
-	if (WARN_ON_ONCE(!vn->lazy.mt_enabled))
-		return false;
-
-	MA_STATE(mas, &vn->lazy.mt, va->va_start, va->va_end - 1);
-
-	err = mas_store_gfp(&mas, NULL, GFP_ATOMIC | __GFP_NOWARN);
-	if (WARN_ON_ONCE(err))
+	/*
+	 * Match insert_vmap_area_lazy_locked()'s list-based fast path. Used
+	 * only by publish_vmap_area_lazy() rollback, which is unreachable in
+	 * steady state but kept for the non-perf_mode early-boot window.
+	 */
+	if (list_empty(&va->list))
 		return false;
 
-	INIT_LIST_HEAD(&va->list);
+	list_del_init(&va->list);
 	return true;
 }
 
@@ -1610,48 +1605,22 @@ lazy_vmap_areas_empty_locked(struct vmap_node *vn)
 {
 	lockdep_assert_held(&vn->lazy.lock);
 
-	try_init_lazy_mt_locked(vn);
-	if (WARN_ON_ONCE(!vn->lazy.mt_enabled))
-		return true;
-
-	return mtree_empty(&vn->lazy.mt);
+	return list_empty(&vn->lazy_list);
 }
 
 static __always_inline void
 move_lazy_vmap_areas_to_purge_locked(struct vmap_node *vn)
 {
-	LIST_HEAD(move_list);
-	struct vmap_area *va, *n_va;
-	int err;
-
 	lockdep_assert_held(&vn->lazy.lock);
 
-	try_init_lazy_mt_locked(vn);
-	if (WARN_ON_ONCE(!vn->lazy.mt_enabled))
-		return;
-
-	MA_STATE(mas, &vn->lazy.mt, 0, 0);
-
-	mas_for_each(&mas, va, ULONG_MAX)
-		list_add_tail(&va->list, &move_list);
-
 	/*
-	 * Erase ranges one-by-one and move only successfully erased entries to
-	 * purge_list. This avoids destroy/reinit churn and keeps lazy index
-	 * coherence if an erase operation fails under pressure.
+	 * Move every queued VA to purge_list with a single splice. The
+	 * sort-by-address property that the maple-tree lazy index used to
+	 * provide is no longer used by purge_vmap_node(); kasan_release
+	 * computes its own min/max over the resulting purge_list when
+	 * needed.
 	 */
-	list_for_each_entry_safe(va, n_va, &move_list, list) {
-		MA_STATE(mas_erase, &vn->lazy.mt, va->va_start, va->va_end - 1);
-
-		err = mas_store_gfp(&mas_erase, NULL, GFP_ATOMIC | __GFP_NOWARN);
-		if (unlikely(err)) {
-			WARN_ON_ONCE(err);
-			list_del_init(&va->list);
-			continue;
-		}
-
-		list_move_tail(&va->list, &vn->purge_list);
-	}
+	list_splice_tail_init(&vn->lazy_list, &vn->purge_list);
 }
 
 static __always_inline bool
@@ -2806,13 +2775,18 @@ static void
 kasan_release_vmalloc_node(struct vmap_node *vn)
 {
 	struct vmap_area *va;
-	unsigned long start, end;
+	unsigned long start = ULONG_MAX, end = 0;
 	unsigned int batch_count = 0;
 
-	start = list_first_entry(&vn->purge_list, struct vmap_area, list)->va_start;
-	end = list_last_entry(&vn->purge_list, struct vmap_area, list)->va_end;
-
+	/*
+	 * purge_list is no longer sorted by address (lazy_list is built in
+	 * insertion order via list_add_tail). Compute the bounding range
+	 * inline with the per-VA shadow-release loop to avoid a second walk.
+	 */
 	list_for_each_entry(va, &vn->purge_list, list) {
+		start = min(start, va->va_start);
+		end = max(end, va->va_end);
+
 		if (is_vmalloc_or_module_addr((void *) va->va_start))
 			kasan_release_vmalloc(va->va_start, va->va_end,
 				va->va_start, va->va_end,
@@ -2824,7 +2798,9 @@ kasan_release_vmalloc_node(struct vmap_node *vn)
 		}
 	}
 
-	kasan_release_vmalloc(start, end, start, end, KASAN_VMALLOC_TLB_FLUSH);
+	if (start < end)
+		kasan_release_vmalloc(start, end, start, end,
+				      KASAN_VMALLOC_TLB_FLUSH);
 }
 
 static void purge_vmap_node(struct work_struct *work)
@@ -2938,6 +2914,7 @@ static bool __purge_vmap_area_lazy(unsigned long start, unsigned long end,
 	static cpumask_t purge_nodes;
 	unsigned int nr_purge_nodes;
 	struct vmap_node *vn;
+	struct vmap_area *va;
 	int i;
 
 	lockdep_assert_held(&vmap_purge_lock);
@@ -2964,11 +2941,14 @@ static bool __purge_vmap_area_lazy(unsigned long start, unsigned long end,
 		move_lazy_vmap_areas_to_purge_locked(vn);
 		spin_unlock(&vn->lazy.lock);
 
-		start = min(start, list_first_entry(&vn->purge_list,
-			struct vmap_area, list)->va_start);
-
-		end = max(end, list_last_entry(&vn->purge_list,
-			struct vmap_area, list)->va_end);
+		/*
+		 * lazy_list (and therefore purge_list) is no longer sorted by
+		 * address. Compute the bounding range by walking purge_list.
+		 */
+		list_for_each_entry(va, &vn->purge_list, list) {
+			start = min(start, va->va_start);
+			end = max(end, va->va_end);
+		}
 
 		cpumask_set_cpu(node_to_id(vn), &purge_nodes);
 	}
@@ -6153,6 +6133,7 @@ static void vmap_init_nodes(void)
 		mt_init_flags(&vn->lazy.mt, MT_FLAGS_LOCK_EXTERN);
 		mt_set_external_lock(&vn->lazy.mt, &vn->lazy.lock);
 		vn->lazy.mt_enabled = true;
+		INIT_LIST_HEAD(&vn->lazy_list);
 
 		for (i = 0; i < MAX_VA_SIZE_PAGES; i++) {
 			INIT_LIST_HEAD(&vn->pool[i].head);

-- 
2.34.1


