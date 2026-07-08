Return-Path: <linux-arm-msm+bounces-117489-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id y0kGESPiTWp2/gEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117489-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 07:37:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CEF19721E98
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 07:37:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=iyVGMjHS;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Rm9pEug6;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117489-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117489-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 51FE9303CEA7
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 05:35:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 103B13BED24;
	Wed,  8 Jul 2026 05:35:57 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8CB33BBFAD
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 05:35:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783488956; cv=none; b=hNHNcY9FBW489fHnMeijNf5brKadltenFOMEsiS3K+Xd9XAMew15zLsYYOTcAGY7MFcJRZRegLltu3846hzszxyYbnF0RhsLpSLETO5U1YWaoV6anplV4pW+89Smd7MkvXZRDXbAZmpxmmEnYcgG3k9hu5/OHZ+Cfqll8u8q+CA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783488956; c=relaxed/simple;
	bh=XB0hnr+SeoDNBsLD4keyubVFabUM7ZTQY5JWjuUzUR8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=q6DKW9DEJnBQoRSLYdal0V7jdqi1zdF94H8q4vcnJx48L48Isk+bek4j5VvyyaqKV/XjhURQPqiRWKSdgZkNyTgMIxQeel74vU9LdmvEOV+MFKBX4AJQauHntA36tw2d81/QDWvCgvTvts3r8sMCqZJZCDeCuvT5Zxn7o14M82w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iyVGMjHS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Rm9pEug6; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66842HIh1508996
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Jul 2026 05:35:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xAshyy6/VO0qiyWiPgZ2rAgo5RvZA1Z9f52v0WVoR68=; b=iyVGMjHSYXLMOvvb
	whTK6oJiXUtt4IV+/SzT1wIWF1tRxXGFzPJB5KDz0Fe8VB+7px3ddcHqPJp94fgx
	Ze5L7Vr5soKn+zKznGYkt98thcz+2A1Gq2WZBO25klO57cRwKc6RPyi5zY8PkyES
	pvG++Irv6hL5nzc3s4OWjhuzUexAuPSgLt8ypxUtXHlbe1ZpsPfnrdkS73qp9xNl
	3T3NFIzF7q2wemmc/4H9IA1i3tN2GPs0fXWn+/ftR+t9FeInphgSkGQnLHsM9sVg
	+xYp4XB3BkS/hYwyLcQxUDw4MIeT1AAxE01wXzb2Gig4tlJhnHv995tiIJoogDk2
	ngKXnw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9be591e8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 05:35:54 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-847a00bcbd0so426478b3a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 22:35:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783488953; x=1784093753; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xAshyy6/VO0qiyWiPgZ2rAgo5RvZA1Z9f52v0WVoR68=;
        b=Rm9pEug6etr/bAuEdYavxUzcKwWbX3elyXd7gp6EZtLYyqGP0rzuaaUH4/4CCCgw/f
         BpSizE2mKRnHfQGahJ96lDMMj7lZp1PNH5tO3oT/Jp+hJxNwbyiFMKEMGr/iYVVtyLAk
         ezF3nyNf7dd9Vd6IJqc7FYDZ1AfF9Dh5JD1LG05kfetWKIQ+nsh0NZ14ROGfLuoYt2yt
         1mrjaSEYsWSvzu0cPc4VMS1FfU0mWieMjuLI9u/SSTSHDOeqE/rGYRqK1NWhkLb7p7ID
         2uEKmTK6vHvf8klS0V6woDtR+fMs00lIGLwvGr+ZfJ9LUa6ZjSYfIrJmkYfajWFcR9EV
         rrJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783488953; x=1784093753;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xAshyy6/VO0qiyWiPgZ2rAgo5RvZA1Z9f52v0WVoR68=;
        b=m+Qxaa53p3RU+ip5keo/UFMV7Cn3yKhvCfnvv/CglVGqGCzzWgWJG/GXSZW0nMHODP
         x/eN3d8AmQn1rs7pu8pLPw2+ffNJHuS4vLtgugeWmiJkrA7I87WT1WBMr6fs2Ofymz4K
         s2AOR/m3kRk1DaKqN4VpmeiewuyVed6YpENdVh/SgARu6YbU1zKqnbuaTfKa9SVPkC8m
         6efsOE8ay6ddr5Y2K4+zSa+EmTyCmDDI4b68QlqcET8dYPrN4l8ES69FTKADJXs7L3GH
         5xhGkC5oqCxd07eYvS/EbfOc2iyvB7PofsHjGMRSV7/cVGmbkM0NsvFNy+hiSU5nInyU
         Ni3Q==
X-Forwarded-Encrypted: i=1; AHgh+Rrb7z5S6rGCxoixA0E1HPTQD9tPM92icdul0pwgGcZ5W9wriVKfmMuUt6qVsl0K2crGQTAr2mV2r9FH6H0x@vger.kernel.org
X-Gm-Message-State: AOJu0YysDfyXrfbqf+4mH/YOHpJ3N1sM9a/9ihUxGu+oVF/bzCT2IjSe
	CoH3Lq85HjXO27ZDg1j0WNQ5VNFVI9fiRfcgR4V1Wf2ip0wpg3gpfM+7RyblnNB841WLb0FIdUO
	eL0AMR2o3z2QhXzkKGO5GXVhX/Wrke9mxkoBGubuparvW7Gjk2vV/e4Qu8UK3Ld864hvN
X-Gm-Gg: AfdE7cndXGz7C593ig3GC8lB0/pn3Dk+/7RvTgDAAYT2Ulnr9iA3NENT54KWvgY04RZ
	eMNYOqtnhBUT6cpDq1y6KMyj8mUUukeeJ8RqmxtcR5LVnLG7AuHNcnnQNmo/UbD3dKojYFXLfTw
	aut3ffPhMuWVxV6k5WFvjSa54Zzb+zMZRU7CKfrGiLljKtTCljJx+Kfj07ZNDpriCql5eL8/7KR
	tAaocWpA8bmxoFfBo57FmavPjeTrRskPMqDYjyq25RQNGhW5b4REZwwxmPLLvXRP9/mYepHyUdp
	OVgb81tf7t6ahrV/awHXTQSkpV5Z4JpaoQbGSjI2dFVulkNwaWL0/e/a9etkQAcU9E+siGTg+2L
	iqoRA7u0QVu+cES8ZGkI0I9CW4akMidAecCSRUw==
X-Received: by 2002:a05:6a00:12cf:b0:848:2f84:f431 with SMTP id d2e1a72fcca58-848432cc7a0mr1101651b3a.74.1783488953377;
        Tue, 07 Jul 2026 22:35:53 -0700 (PDT)
X-Received: by 2002:a05:6a00:12cf:b0:848:2f84:f431 with SMTP id d2e1a72fcca58-848432cc7a0mr1101621b3a.74.1783488952811;
        Tue, 07 Jul 2026 22:35:52 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6db29d1sm6484592b3a.53.2026.07.07.22.35.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 22:35:52 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Wed, 08 Jul 2026 11:01:53 +0530
Subject: [PATCH v3 14/26] mm/init-mm: Annotate static information into
 meminspect
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-meminspect-v3-v3-14-7aa5a0a74d5c@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783488714; l=1627;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=C66R4z8t2Qna/gYEl08YE1zQ0IYA/DB7tbhATdDv314=;
 b=a4ZKz7sKq0X3Xk4djKf4AkkMOFWqa+Gt3qunjb5YpftQ8eDqQGmZHBmWWdz2ObrXjPZiVPIj7
 /TQu22VS0TvAfSBd7UB5LIi8aMhGbP2gVYcpIP8hELXfmPA5AwjOiwA
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Authority-Analysis: v=2.4 cv=GJc41ONK c=1 sm=1 tr=0 ts=6a4de1ba cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=HJIP93yTpLwjP442z3MA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDA1MCBTYWx0ZWRfXzm/kzOyWGauK
 X8pU+I5J4QY+WG4CxlXnMBp48KvqrSZeEMuBw2jCSluKvaLFvmxCmQLj2qLdqX+hOF3Ae6Ki6w1
 vmBVFEVyysi38yFv7zBOxq/ncF2z6Ck=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDA1MCBTYWx0ZWRfX+4bsBnVr93k+
 35wZq7yJ+xb9j8HS49VobOdGmnWm7lUVVLhi+65QlORIAge72wenMWXo+/gYDU/oQr5xHGmMbWr
 lL7wGRZYKMN2/FXEb+1yZyZPxULR2mB8idhSmuri05ffjn46IsQ7gEy52IZBepWNQDfb88UyJk1
 IyMzsDJ6E/UaVJDMVYg1Y+WconUbwnUa+RUNEM01ffJzAlktpz6HHnpowBiVRtFDXKnSNwDoPcp
 eQA3ljqnm+Oi+De8HQZZIDwDdE/viVi1tWOkz5DbpKrZrF11fxK06gn3e0yLgJDLQc1w4J2i9tS
 eW+E82OgB/Xqt5Bj1+y3FanhtAnBOhevgIzTY9FrntPz2gvyuuQTgZJV7/KG6uIEUIEzbERkP/S
 H9//anhpvmtmXeIOfZxVvI8ThVafDqD1B6BZ7c2aWlJZPfuBurl2JBz8QFANJ7jnI1MNz3gqYQR
 oTkJbmVxBqgo0PRcMJw==
X-Proofpoint-ORIG-GUID: lknqhhn_nlu_jaI9aVGkPJU3Ra-TPKRa
X-Proofpoint-GUID: lknqhhn_nlu_jaI9aVGkPJU3Ra-TPKRa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_06,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 impostorscore=0
 adultscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080050
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-117489-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:ehristev@kernel.org,m:mukesh.ojha@oss.qualcomm.com,m:arnd@arndb.de,m:dennis@kernel.org,m:tj@kernel.org,m:cl@gentwo.org,m:akpm@linux-foundation.org,m:tglx@kernel.org,m:peterz@infradead.org,m:anna-maria@linutronix.de,m:frederic@kernel.org,m:jstultz@google.com,m:sboyd@kernel.org,m:kees@kernel.org,m:mingo@redhat.com,m:juri.lelli@redhat.com,m:vincent.guittot@linaro.org,m:dietmar.eggemann@arm.com,m:rostedt@goodmis.org,m:bsegall@google.com,m:mgorman@suse.de,m:vschneid@redhat.com,m:kprateek.nayak@amd.com,m:david@kernel.org,m:ljs@kernel.org,m:liam@infradead.org,m:vbabka@kernel.org,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:jackmanb@google.com,m:hannes@cmpxchg.org,m:ziy@nvidia.com,m:chrisl@kernel.org,m:kasong@tencent.com,m:shikemeng@huaweicloud.com,m:nphamcs@gmail.com,m:baoquan.he@linux.dev,m:baohua@kernel.org,m:youngjun.park@lge.com,m:pmladek@suse.com,m:john.ogness@linutronix.de,m:senozhatsky@chromium.org,m
 :andersson@kernel.org,m:mathieu.poirier@linaro.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:saravanak@kernel.org,m:workflows@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arch@vger.kernel.org,m:linux-mm@kvack.org,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:devicetree@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[lwn.net,linuxfoundation.org,kernel.org,oss.qualcomm.com,arndb.de,gentwo.org,linux-foundation.org,infradead.org,linutronix.de,google.com,redhat.com,linaro.org,arm.com,goodmis.org,suse.de,amd.com,suse.com,cmpxchg.org,nvidia.com,tencent.com,huaweicloud.com,gmail.com,linux.dev,lge.com,chromium.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:email,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_GT_50(0.00)[61];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CEF19721E98

From: Eugen Hristev <ehristev@kernel.org>

Annotate vital static information into inspection table:
 - init_mm
 - swapper_pg_dir
 - _sinittext
 - _einittext
 - _end
 - _text
 - _stext
 - _etext

Information on these variables is stored into dedicated meminspect
section.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 mm/init-mm.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/mm/init-mm.c b/mm/init-mm.c
index 3e792aad7626..cf53058410b1 100644
--- a/mm/init-mm.c
+++ b/mm/init-mm.c
@@ -7,6 +7,8 @@
 #include <linux/cpumask.h>
 #include <linux/mman.h>
 #include <linux/pgtable.h>
+#include <linux/meminspect.h>
+#include <asm/sections.h>
 
 #include <linux/atomic.h>
 #include <linux/user_namespace.h>
@@ -19,6 +21,13 @@
 
 const struct vm_operations_struct vma_dummy_vm_ops;
 
+MEMINSPECT_AREA_ENTRY(_sinittext, sizeof(void *));
+MEMINSPECT_AREA_ENTRY(_einittext, sizeof(void *));
+MEMINSPECT_AREA_ENTRY(_end, sizeof(void *));
+MEMINSPECT_AREA_ENTRY(_text, sizeof(void *));
+MEMINSPECT_AREA_ENTRY(_stext, sizeof(void *));
+MEMINSPECT_AREA_ENTRY(_etext, sizeof(void *));
+
 /*
  * For dynamically allocated mm_structs, there is a dynamically sized cpumask
  * at the end of the structure, the size of which depends on the maximum CPU
@@ -50,6 +59,9 @@ struct mm_struct init_mm = {
 	INIT_MM_CONTEXT(init_mm)
 };
 
+MEMINSPECT_SIMPLE_ENTRY(init_mm);
+MEMINSPECT_AREA_ENTRY(swapper_pg_dir, sizeof(void *));
+
 void setup_initial_init_mm(void *start_code, void *end_code,
 			   void *end_data, void *brk)
 {

-- 
2.53.0


