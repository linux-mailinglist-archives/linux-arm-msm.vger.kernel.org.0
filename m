Return-Path: <linux-arm-msm+bounces-96758-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yLyIJI19sGnLjgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96758-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 21:22:37 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 40180257AD3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 21:22:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 79A5231CB696
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 20:18:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3650C3E92BC;
	Tue, 10 Mar 2026 20:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AnrC4NkB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MaLXtyRO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDE543E8C42
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 20:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773173912; cv=none; b=mXbWeiOR5KZRPFeZsQfsJQDwrufsKytH7PcsGtFrpteV2pTJlpKrCSyIfYHtT6psnbmg3XjALI1MsDSaR39nMtpI88oMi1Lo7V7JNJ6dlLkCpf74nq3pCs7BWH5et2EsgR3ee/HcNlF14aMqKqDVi5gEZ5+kHfpKf8AJlZvuJJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773173912; c=relaxed/simple;
	bh=ddnLcCWQifntrskr0bcFbMBQGwwCpIQxRxTa/csgC88=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=M4omstQmLifFlY0L1ZuFL5+LO9f0VR/7uxV1jC8+osjrvmwT2hDghBdHkc51xBoaxU4jkQ+Y9JKKXB1/3Lls0xR3oYPtjCYy77xPFoQ8iZpvjFptc1by4UvqCHpa11xHqnihESwfghX8VcY743ezc9p5KiRhuZCiv5W8CVTj5ug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AnrC4NkB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MaLXtyRO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62AHbbSX248940
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 20:18:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xUalwRtla+ayp0MJOatYREBpi53Z8RFSi3SjDfIMcEA=; b=AnrC4NkBToNr65+G
	AeOELDrpl9XgKlIS8M/AtttB4QyAglvTb6SQxjBuNnsCiDxLCeSoU5WmEqxThd3n
	q1r7NaFq7tri0wHflV+Z3u1FJeS4NCUh+YoW29ccfw+azNMLfQsyntExTh9g0eM/
	OK65QDkAjslsNMXN0BZIg5Zs35L3NZGED64QqDWnvxaOkQbYFjYXtz/2YHDRZZ4x
	d/i6zaSKGtTvF74k4p0sDUwgSutpk1nIU+WC11pYUqWQKNQWVXSoRlKiNN3DpcMs
	OyewJGRmFq0SSbpreUfhULNlhtKqRVRBf7e0xiXv8vwnmwA8wH/1n+oQZ2VCsAGO
	B+jY/Q==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctqv10jt7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 20:18:29 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-829b6b22dabso1121062b3a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 13:18:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773173909; x=1773778709; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xUalwRtla+ayp0MJOatYREBpi53Z8RFSi3SjDfIMcEA=;
        b=MaLXtyROcBZIG2lrTCKQpdHM3sgGv7EaztOOHEKwzuUfvG+cYkBQMf7QFqE70H4VGX
         rlPCdwv9FDZ7jO4aPW76cF0kfNenn/pcsqLX5M0fEfMEPWZ8JEoEDWzyt0+CeiFrZYg8
         rJx39BzDt4GWhbjJm3rOwnAtTKiIvI6W/GBUuwqYLGrTTjF8nQ5UH9skMxB69zjTrLvL
         HVejgm7woF6iKUJuEo0oGrP4dDC4iD3yJqBZFTQWM5665OkV1DV0tCa0YxSIEe/CYLw8
         /hKDDgV5d8m41vAk5IdyzqdTzui6ihs4pdsxbYRfbIabjjwQ6qTcJW3PWWr36RcHIiLz
         bWqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773173909; x=1773778709;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xUalwRtla+ayp0MJOatYREBpi53Z8RFSi3SjDfIMcEA=;
        b=g0Uwwxue0FX5M/dmVX28TI38N00VEK14vkh++CKxidH/DlAHLIh4njDZrhQxKoNaQU
         lu7enqiy/mvF5CaAbCWnNaPrEHdJdQNIw3KSzGVAPcIAoqRugU9kWvmbY0ZUaju/z1vn
         JPaVZtN/4JpDTJoCfEz02frvXsqvYxCaWyh1LiDOe0IKS05GTu5bb/bESkjkoCRqFBu3
         rvhTawqhdLBcTpHu798h+9DF3m5hmUiHf4RS7mZaKkG2zS05mB58zcNxRfgrl7GT/g4S
         TDmQnurKBv3HgT2+/EFziJvoHtswd+s0b9XftfidNi0aNtXB2MSsJb02PewqA7XCkm3T
         gS9w==
X-Forwarded-Encrypted: i=1; AJvYcCWjLhCXT1VHwQEWaZjnmK4lDt3EvEvWySzBwdEYEV6VJ0mSR7QXcdoyDMvOm0ruLcOyltpRCy7FmtWCw8Po@vger.kernel.org
X-Gm-Message-State: AOJu0YweZSz2MsCmJOGvYwLjh9Co4TSJEiJEm6LTvp4EirJJ8SxB2YSC
	eEwPmDy85q1ZBEEIpADvJ1L/sKcp7rLeDuRW1/uTJvnzb9v6DdP7xhwzQ9wQu4xP/8lsFZzjYzU
	BmfhdiLhDvtbc4+R1XHktPch6CmNmcidANh45vlO3kkDZ+tx2+53jReIwEcugCpgtsK/7
X-Gm-Gg: ATEYQzxAmaLIEBxzLLiSnWMB6TJH6jdOz7mWgoyTPveL8BZ8J2hnWzimdRlWxCq09FB
	NxBz/ba7sndM2UmbIX87DLwaKubS2U3hZyRlG41TVLbJ6oQrFWcqQovS9qqwJIKfP+kkDXIYGJx
	jAw4vAo4HzNo9mLpi5qZX78LeV5b25dIAy4S7NIdA/AdWWKuCMYqerFWMsSGguqL2C8CWyTHYXN
	MzYVRC/WE6Luz1eRFbp/5wXRvoCyysngU09u59Y5rYbJvJhG7U0inn+Pob0gMTguj3bBB9I8u7L
	qfOCnTHVQ6H3QxnwtfX5yIWZ4WxHL9gKC/sxgyipyIJqSkhIorVxOxb/wZ/bBGHpsLXfKkP54Kt
	r2e2Wj+kfJKJEEgZgWyAVDhapW2pDRglgA0u6LxSztTZI8meU
X-Received: by 2002:a05:6a00:1c9e:b0:829:88e7:c89e with SMTP id d2e1a72fcca58-829f6ee65abmr188038b3a.9.1773173908920;
        Tue, 10 Mar 2026 13:18:28 -0700 (PDT)
X-Received: by 2002:a05:6a00:1c9e:b0:829:88e7:c89e with SMTP id d2e1a72fcca58-829f6ee65abmr187951b3a.9.1773173908318;
        Tue, 10 Mar 2026 13:18:28 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829f6dc2d0asm115262b3a.13.2026.03.10.13.18.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 13:18:28 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 01:45:53 +0530
Subject: [PATCH v2 09/25] mm/show_mem: Annotate static information into
 meminspect
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-minidump-v2-v2-9-f91cedc6f99e@oss.qualcomm.com>
References: <20260311-minidump-v2-v2-0-f91cedc6f99e@oss.qualcomm.com>
In-Reply-To: <20260311-minidump-v2-v2-0-f91cedc6f99e@oss.qualcomm.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Eugen Hristev <eugen.hristev@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>, Dennis Zhou <dennis@kernel.org>,
        Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@gentwo.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Thomas Gleixner <tglx@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Anna-Maria Behnsen <anna-maria@linutronix.de>,
        Frederic Weisbecker <frederic@kernel.org>,
        Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
        Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
        David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
        Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
        Kees Cook <kees@kernel.org>, Brendan Jackman <jackmanb@google.com>,
        Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>,
        Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>,
        Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>,
        Baoquan He <bhe@redhat.com>, Barry Song <baohua@kernel.org>,
        Youngjun Park <youngjun.park@lge.com>, Petr Mladek <pmladek@suse.com>,
        John Ogness <john.ogness@linutronix.de>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>
Cc: workflows@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
        linux-mm@kvack.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org
X-Mailer: b4 0.14-dev-f7c49
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773173756; l=896;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=hnWgTs3BqNwkuy01WGRtLHEmLnAWVLqGtO9y7HspcnE=;
 b=uLHZ20TEam9IFeoPaxYKND50xjzJmo8/66x/toJROlPuRsGnYldJCrFNEUSo9htPmJgsz83XB
 h1nzBbPPYs9BIy9KMclSQJQfzgEIMyig5knFQTbc87F6JhGMpL4Ps/A
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDE3NyBTYWx0ZWRfX5TEU2Jh1iHqe
 jwJf1Xu5R0B1chiaU52IzAbN5degMdTRMKxLOBhG/3iXczo+N3ldyyKlVaHIMsysNis+pDixFBD
 9suyRBk8cWFP8VuktkU94lUPi4zUHxMdG2IWbVoLyFypSk9P2udE7aZo0EirmHK5n7sPb5p6kSo
 5fuBq04cYhWFUUXlGqIll+pX6JptyVRemFOZHfLchmU/8A3jqgXra58zf5vwDIYLuOn/++a1tPD
 m8gTzdgi7F/4196hyAp+bxNtUxN5EZ0qcl5yhGm8ZCpdo5/hyvWtdsCTLlBF+25T3Sg3/xILkfm
 vjmWVNLhxJjYOvs5c2pFbVsJf8ReII1BpsEUZ5KimwpSIIox9aZzm2PJUPgC7cbmM1MVWs3u7zK
 pevgJFZPh4nuf+oR0drUS+k3YKnZbTT1ovSAhoFlkT+9Q7l0v2jFhbzktiMiN+JkVPq5ueU5Ro+
 8hQxJdv8m7vjWE4bPNw==
X-Proofpoint-GUID: Uxl4KLKjK_Rr9iPczXmSBv5VkAkjAUyj
X-Authority-Analysis: v=2.4 cv=S5vUAYsP c=1 sm=1 tr=0 ts=69b07c95 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=Ayq6lH46roXo9nsmW_UA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: Uxl4KLKjK_Rr9iPczXmSBv5VkAkjAUyj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_04,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 adultscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100177
X-Rspamd-Queue-Id: 40180257AD3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[lwn.net,linuxfoundation.org,linaro.org,arndb.de,kernel.org,gentwo.org,linux-foundation.org,infradead.org,linutronix.de,redhat.com,arm.com,goodmis.org,google.com,suse.de,oracle.com,suse.com,cmpxchg.org,nvidia.com,tencent.com,huaweicloud.com,gmail.com,lge.com,chromium.org,oss.qualcomm.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96758-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,linaro.org:email,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_GT_50(0.00)[57];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

From: Eugen Hristev <eugen.hristev@linaro.org>

Annotate vital static information into inspection table:
 - _totalram_pages

Information on these variables is stored in a dedicated meminspect
section.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 mm/show_mem.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/mm/show_mem.c b/mm/show_mem.c
index d7d1b6cd6442..f6a92c7d9d1d 100644
--- a/mm/show_mem.c
+++ b/mm/show_mem.c
@@ -15,12 +15,14 @@
 #include <linux/mmzone_lock.h>
 #include <linux/swap.h>
 #include <linux/vmstat.h>
+#include <linux/meminspect.h>
 
 #include "internal.h"
 #include "swap.h"
 
 atomic_long_t _totalram_pages __read_mostly;
 EXPORT_SYMBOL(_totalram_pages);
+MEMINSPECT_SIMPLE_ENTRY(_totalram_pages);
 unsigned long totalreserve_pages __read_mostly;
 unsigned long totalcma_pages __read_mostly;
 

-- 
2.50.1


