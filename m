Return-Path: <linux-arm-msm+bounces-117494-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id JIqfMpTiTWqk/gEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117494-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 07:39:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id C436A721F10
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 07:39:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Hs8CZvTU;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=IP1gLCdS;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117494-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117494-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1203D301B02A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 05:37:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E05303BFE4D;
	Wed,  8 Jul 2026 05:37:00 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DBC53B9D8C
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 05:36:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783489020; cv=none; b=FsBjhJ7pxTpIbQP812BOUS+HlBPqjNDfeJwo2sInkISv0bGAFNIjMSbEMqlu0OY3JEvosOVX0YWXZ77QmLUnK0IS1oBCePAD2rV1P57d3dupH/RTb1C70P3Icq6D33rpEV9KM5yqUA22qt7uqEXsDSpkfrezeaJcbe2c7ElLcKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783489020; c=relaxed/simple;
	bh=R5az9zECz0wF5NRIZYKf4rRvvkdHnS5/+K9MHbLFHcg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fiGRYDuSTtHO8Y8KC0xfbWhRSX79If9F/NXIvCoqEUJxZwYDmzpZlaKXi70FauKNl2yoqtY2Q4zYY8CAbVaU0SeHdil37SxkcGmQ863mTEzsgcJiB5iOLp+tuKTPUb4x28heANwWFj3rhklw8vicMWigyZNn6nTzAAcepMophrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Hs8CZvTU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IP1gLCdS; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668429KG1656437
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Jul 2026 05:36:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IIAnYNUT7JIDk/4EOGJSzGq44L2ybK3V5nw9t/195Ms=; b=Hs8CZvTUdRuUzjkk
	8/KBlB9MALBbYzTPnNpJ8xWKxOD2Uh1JEoxS/ozoSe7jU0eflZLmzdqFEv68Mqu1
	kOpVFvvGZLQXJghlhQepHLbRAXFAW206z4Gw6IWDoZekClP0dJB0UlGPGKXBjFiF
	NXl2wLiBxduoVPT1h1Fk3TB+RAcy2DhXvqlGAQGjV1NJ1cjAUK1VJExCD3PRitlu
	DvdPY8QQNUXkiGe+Kg4UGqOAohAZdO/h7eOPVPjNDgu5uHhwRYgR0VFprg0oUpgj
	D8pHymEERJPjUs9qLNGHLtxM2/pBZDEKvramAwS6Jc4hvz0zeHQD5/PYyMZZPeAp
	hTQYXA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9cssru17-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 05:36:58 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8423f1fe39eso664226b3a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 22:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783489017; x=1784093817; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IIAnYNUT7JIDk/4EOGJSzGq44L2ybK3V5nw9t/195Ms=;
        b=IP1gLCdS7JalfFd3WPjd9wZsMxzstNWgnTLZByzHLoBNyXEmlfMoXhE8e6TZN663P3
         qVj6/UBvO5EK1wuiTwXYcDWEY+dkxGidJBFCQtYH7jnw6rdkmeegT+dARkr+lQNbR/w2
         M0HcTrUQThidAx09xuQz+rI+rpf46gSLMqdRoqKwYqCiJUdtXQIxg9EG++ho+Sdp1X0d
         N1oq6HdWqqaW4NBUqkLJIgOaaEjLh7skgNQQ8O+euAuC9f1LJ6LNfzAJj6Lk6GjG7rV2
         UCqegB9R3CksKFAL/UxCJWzogPpJ/vcD3eVS7fIkqlPo4VBohpv4ewBwCnyGNdOyhKnS
         6umg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783489017; x=1784093817;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IIAnYNUT7JIDk/4EOGJSzGq44L2ybK3V5nw9t/195Ms=;
        b=VdeO1FxY4Hzc6hdwUAENHsjWl+kg4wwQ3QvoDKc6+xJkw0DByLGz+1FZinT9FC1VuH
         GmeBuLpsLmiJcUdnyCeX4XlqTK3lmDhFC0sQG366qDib2Y3SwffgJsJ3SrVDMwPpNRFB
         PuCF896pMGpQr3Ilt2LtenXEhmMhNKCUnj/I4Vxmj1Th4v7ppw5S0B8SJr8HLLYVq3ef
         SrDfsNQET4TtiTDDW9bmLQfR4FEOlO/LZeiFf5t5aNGN0mYGqN3ASgBnhu1BLMKFUPfr
         JRvZkSZLzo4Nj/7wBZ3pYkBmButehvdattCRehpAewXo3iIlgRg+CfQO5y+uQmIpP8sF
         4rdQ==
X-Forwarded-Encrypted: i=1; AHgh+Rop9rzNhefKrsKAYb2avXjxzsSjW7XJ5YQJ5Y8Zv+QbKfEJjPHB4CXsC+Y5Il834FOaPHSKK3mWB4+L+FdN@vger.kernel.org
X-Gm-Message-State: AOJu0YypnLGDyfyyEa/PUw0UfKYfdhIEkXQbGEGbgPVl/lTch4Zgcha8
	b+NWIY6A6ZfvxlSPSSTn76e0Y11PP/wIh1te0M9GchPVWuOd4+nGxr5yN1glbY2N0UeuD8t8xPJ
	A9BYFTYh/lbCAd4E+IQCx2eVzhcThd4Al7if6AgyE54moI7a1OGWTvROn+vrymK1HjBYJ
X-Gm-Gg: AfdE7cknqLlqCUGBc4uq5O0W8wEVQ1Fw2+acFOmmAHDjvAX4IVTHwMwTX9skl2OhLCy
	QpKD0KdVBuT7jKWLDLU31g4cTnv2KoC0cdTRwR+dJyJwFJS9AFsB15HtMGMs1nRiQLt1MT96DeO
	Tti2h+VMKcaQqvvyRVJWVffy0op7hyMbXnKjTrfE4QjmjIzSKAgKFcZZilu6kekgHaxefrWKZAW
	qhbnlIelfwgn4uPHIIkplzFS9yAJMCVNDElwXY8el03SYH9E6SAWJmHy1N8rrz+tLU+8xhbdFII
	5HTINfjpnf660qmQd/8JEMGvy9B9YrQGukQCXVcYfEWGa+Xw1M4IgTsveHbUxN22FkIbhWLs54f
	ddMoN40ZtS6TnPo/U1cdDBBas7vmymsl98ER22Q==
X-Received: by 2002:a05:6a00:3688:b0:845:c6c3:5e79 with SMTP id d2e1a72fcca58-8484367de8dmr1224946b3a.40.1783489016928;
        Tue, 07 Jul 2026 22:36:56 -0700 (PDT)
X-Received: by 2002:a05:6a00:3688:b0:845:c6c3:5e79 with SMTP id d2e1a72fcca58-8484367de8dmr1224915b3a.40.1783489016304;
        Tue, 07 Jul 2026 22:36:56 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6db29d1sm6484592b3a.53.2026.07.07.22.36.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 22:36:55 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Wed, 08 Jul 2026 11:01:57 +0530
Subject: [PATCH v3 18/26] sched/core: Annotate runqueues into meminspect
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-meminspect-v3-v3-18-7aa5a0a74d5c@oss.qualcomm.com>
References: <20260708-meminspect-v3-v3-0-7aa5a0a74d5c@oss.qualcomm.com>
In-Reply-To: <20260708-meminspect-v3-v3-0-7aa5a0a74d5c@oss.qualcomm.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Eugen Hristev <ehristev@kernel.org>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>, Dennis Zhou <dennis@kernel.org>,
        Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@gentwo.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Thomas Gleixner <tglx@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Anna-Maria Behnsen <anna-maria@linutronix.de>,
        Frederic Weisbecker <frederic@kernel.org>,
        John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>,
        Kees Cook <kees@kernel.org>, Ingo Molnar <mingo@redhat.com>,
        Juri Lelli <juri.lelli@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
        Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
        K Prateek Nayak <kprateek.nayak@amd.com>,
        David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
        "Liam R. Howlett" <liam@infradead.org>,
        Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
        Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
        Brendan Jackman <jackmanb@google.com>,
        Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>,
        Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>,
        Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>,
        Baoquan He <baoquan.he@linux.dev>, Barry Song <baohua@kernel.org>,
        Youngjun Park <youngjun.park@lge.com>, Petr Mladek <pmladek@suse.com>,
        John Ogness <john.ogness@linutronix.de>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>
Cc: workflows@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
        linux-mm@kvack.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        Eugen Hristev <ehristev@kernel.org>
X-Mailer: b4 0.14-dev-f7c49
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783488714; l=1065;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=JYWiKEpaZYGfni18VOJ16Qd4auRJiaJNrpQIWqmhZDo=;
 b=cv0EO/V7wbPDz5pf7/xTcxOXaIbi9Un31Ad+m/LM7I14uYWvl+7At4fcK1lJJIifZZYnjzb5B
 4sQ6pyvmT9ECMDABWn7BstHPke0QDVSzou+abCFZ7VcASrjrp50XxfR
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Authority-Analysis: v=2.4 cv=EtziaycA c=1 sm=1 tr=0 ts=6a4de1fa cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=WIgWxXLGzmshCHNC7soA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDA1MCBTYWx0ZWRfX4SkHLHgVLBWt
 TcEX+9grz7t7QAbj8VU3TY5YV8VPqKICNNXlHkzEQWwNfuhv0w383aGdDU3Ma0LCGilLkLqKPgm
 AJ2ewrsR5U8pKNVi5jMIdD8T54mm+dFSnr9qDbRZAIioQhqK51L2guG6OfhaL3J3g9qoLiXQZB3
 j+WSu7oXoPaZ1gRBJX6UHdkfZYQwO5Y6TdWTgCnnbSsktTQUKUANi3i20HK3ZOEd217Bvoxb0TE
 3hXtoQsh/POMBGRKI2tuiC82g3QklJu4ZKVsV9giVIsa7ZuRsSE+V44nYeGqqtDx4bSEuJSeUdK
 AGjx/qJp9/y8BFLU1iHyqJIO2e5qEGDG4JIbRN6VeluTQzWGG1BQx3PSvo+mP2Ib6Daq7m0uBS4
 Q7ey0AvS/Wwq3TYvfYJM/RpE2HbngGzmKIFiJLCNVQ/7DN6KdjKZiQf7KzqtHWgiFIRpzc2gYZA
 1bKln+WgU3CJ6mFz7EQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDA1MCBTYWx0ZWRfX/XOoysXYjj/q
 c64mQkV7vG+en418fbqnqPorb0VnPNy1iY1NdGyQWUzOKi6fsGcSS32w1RvH0CE2+CGEQOgHW3X
 BPbN+X1CCCsixeqd78qsYsWJzJ8NFo8=
X-Proofpoint-GUID: 9KTYHh5femBrsDckdlOzO3OMosW3Nfmd
X-Proofpoint-ORIG-GUID: 9KTYHh5femBrsDckdlOzO3OMosW3Nfmd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_06,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607080050
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-117494-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:ehristev@kernel.org,m:mukesh.ojha@oss.qualcomm.com,m:arnd@arndb.de,m:dennis@kernel.org,m:tj@kernel.org,m:cl@gentwo.org,m:akpm@linux-foundation.org,m:tglx@kernel.org,m:peterz@infradead.org,m:anna-maria@linutronix.de,m:frederic@kernel.org,m:jstultz@google.com,m:sboyd@kernel.org,m:kees@kernel.org,m:mingo@redhat.com,m:juri.lelli@redhat.com,m:vincent.guittot@linaro.org,m:dietmar.eggemann@arm.com,m:rostedt@goodmis.org,m:bsegall@google.com,m:mgorman@suse.de,m:vschneid@redhat.com,m:kprateek.nayak@amd.com,m:david@kernel.org,m:ljs@kernel.org,m:liam@infradead.org,m:vbabka@kernel.org,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:jackmanb@google.com,m:hannes@cmpxchg.org,m:ziy@nvidia.com,m:chrisl@kernel.org,m:kasong@tencent.com,m:shikemeng@huaweicloud.com,m:nphamcs@gmail.com,m:baoquan.he@linux.dev,m:baohua@kernel.org,m:youngjun.park@lge.com,m:pmladek@suse.com,m:john.ogness@linutronix.de,m:senozhatsky@chromium.org,m
 :andersson@kernel.org,m:mathieu.poirier@linaro.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:saravanak@kernel.org,m:workflows@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arch@vger.kernel.org,m:linux-mm@kvack.org,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:devicetree@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[lwn.net,linuxfoundation.org,kernel.org,oss.qualcomm.com,arndb.de,gentwo.org,linux-foundation.org,infradead.org,linutronix.de,google.com,redhat.com,linaro.org,arm.com,goodmis.org,suse.de,amd.com,suse.com,cmpxchg.org,nvidia.com,tencent.com,huaweicloud.com,gmail.com,linux.dev,lge.com,chromium.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,linaro.org:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCPT_COUNT_GT_50(0.00)[61];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C436A721F10

From: Eugen Hristev <ehristev@kernel.org>

Annotate runqueues into meminspect. Even if these are static, they are
defined percpu, and a later init call will instantiate them for each
cpu. Hence, we cannot annotate them in the usual way, but rather have to
call meminspect API at init time.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 kernel/sched/core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 2e7cde033a31..1c2e80a54d2b 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -69,6 +69,7 @@
 #include <linux/wait_api.h>
 #include <linux/workqueue_api.h>
 #include <linux/livepatch_sched.h>
+#include <linux/meminspect.h>
 
 #ifdef CONFIG_PREEMPT_DYNAMIC
 # ifdef CONFIG_GENERIC_IRQ_ENTRY
@@ -9059,6 +9060,7 @@ void __init sched_init(void)
 #endif
 
 		zalloc_cpumask_var_node(&rq->scratch_mask, GFP_KERNEL, cpu_to_node(i));
+		meminspect_lock_register_va(rq, sizeof(*rq));
 	}
 
 	set_load_weight(&init_task, false);

-- 
2.53.0


