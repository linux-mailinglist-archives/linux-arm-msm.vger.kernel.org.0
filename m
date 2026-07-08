Return-Path: <linux-arm-msm+bounces-117483-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8W94E7PhTWpJ/gEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117483-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 07:35:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ED735721E0F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 07:35:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=NT2dGDDE;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=LUIW4Wzq;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117483-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117483-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D8CAC300DA78
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 05:34:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 825F6363C75;
	Wed,  8 Jul 2026 05:34:21 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1FF03BBFC3
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 05:34:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783488861; cv=none; b=LE52Q0hjfnxi3i8+GEVCltKR9mH8q9oqY0wAuj1D56QK4sELpEUspZff32d7GUQO5dEzp//vR8v82r7PFyfvYPpu/qF89YfRIQ242BsHgvajTQf1IJMGNJ2n0LLbWgOCoMOQGosAXMBrlvNS5NH210rnZhhHBjKcObkFtZL3arw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783488861; c=relaxed/simple;
	bh=Sj1jdSOOXK5Nzs0wxXa1BmNiFoIG4OgDkHPeO2dnm2w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Jqiswj0/XvTmea0m7/O32s5hoG8ukY9/SpzGQFxSJ2ucecyMY41SqjQ7lviz0YzomHWObD/9JBku/t5L2sO9vnaMwgeF6SRNvVv5u8m0WeZ/Eg+VaZi6msxt+EmQq2r3Z9EC1A4ooHMt2bIgriu+s7VU+CVzXhLe6g7lZk1OuCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NT2dGDDE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LUIW4Wzq; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66842Won1509355
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Jul 2026 05:34:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9JKSKEpCwUWulHpC5aA7ZnyWLgFgRV0CQRGlkqfNweI=; b=NT2dGDDEzC2DVpT9
	SrR/ynRKYJyvutjIvYhW8hdnUYlZdoJEk+AnEimC39KOOphBS+JrL0IvpMWzyJm2
	9UiFeYoWYnSa/7i/DVQH7J3ZSewaDtqd1lD3c5aOEP5DaWfdjHkwB/gWRC0c0RdA
	nBeCmtT/PY94Nzd/XFCdUVybp8N3xpWJR4Z8PwTH0AFsEp+Qk2dql+6pTYPI3HLy
	7L49ucsHiWU5wKZhkBXxa0qLekf8/fgpoY/x9pNsOMPWBeNx/GHuKS9t1ES5MOuB
	CAKXUZZzqHepgOdcWQD05u7ulY1OLpNlml38Wm4J/iovZ0+2gQMxrr1BkR0vOWyZ
	XwfwEw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9be59160-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 05:34:18 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8479cc04d8fso630068b3a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 22:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783488858; x=1784093658; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9JKSKEpCwUWulHpC5aA7ZnyWLgFgRV0CQRGlkqfNweI=;
        b=LUIW4Wzq8/tD9zP2tFABEVDnkRMsMCCEhWXlWabwo8VV5PM9x8aHJqM2KXOM/h4CqW
         v5q42I5bt2ej2yOOkgQCvngO8Ak5UV0z8rBwn5bNPhCXKayn7AUJ5HpFHS3+KtN5ohF8
         0zESkl4v+kL1HxwqAW6vw/JJxQ1G+SOgefYpHqyncRoQIxD8vpvWSVTj5sAGeyMIzPM4
         mIJ9Ii9etUo29FdxqF1DUisBifUIxKgkod/rap61YTHJ3LlPgyUTODNX4+WWGB+lqDdq
         iup3Tx7LUXP8+keh9C4lUXe+ohdqTBeT+w8qQBdUoqmVbXZGLSex+yqWbqc3Jm+qXHKc
         hlwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783488858; x=1784093658;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9JKSKEpCwUWulHpC5aA7ZnyWLgFgRV0CQRGlkqfNweI=;
        b=dqcdRecgLOJVfCoLMMGxVT9naDaMR5ipS3GerxbOhXJsc1wZAzcOY7q5s2yPeTR7uK
         eBEWhDpYHbTUWgrmDMX3ncGfN/0va2IOucMgSHEjs6xIGToiXrTMgE3OHhjuqHi3XS6D
         QGRrCaYGSLZT68+BjMyiv6NBdJcLFYW9dfSUf+6EYxENg53IqKu1GXl04rnUtt3K4Iai
         GozkyVD7ki5mNofzfvrCsztRvGBuniha0Coaj05U1K1h7njPdOGW2hbtAjLUTIL8B02j
         MMw//+9L2YH4lVycxKaJyrurqdgmPJpPHq1Jzy/Vl1r2fwnGtKrGGM0K7eUhKeIkWNXb
         wFVg==
X-Forwarded-Encrypted: i=1; AHgh+Ro5ZulyWt7JJnmWn9wVUvSI38jvZQZQ7jzoHlYyIUBrSNc7iMZ72qpRHA9YEsSSpSQa0cQLUb0ZJRmJ/egx@vger.kernel.org
X-Gm-Message-State: AOJu0YxJcPT33RaVOw+oOTR/kh+Tp8IWPjGPWz0i9tf1NFzp1E5mF4Aj
	oVf2r0FWibYlOSvE0k2m6IlzK4fa8nYuIT4YwdPLTmY4JafHmtlx5Bzk4nUhIBszFtQ2MMRxHu5
	52wpN5EQ34TMO/whLNJoro0EgGHb90OvrRtww1XIwDxL34JpaVes1E+IEx+ntkfAJ9y4c
X-Gm-Gg: AfdE7ckDEDF82R5xp6sMU7d9MdSwe/9O4P4wdV2OZEwaZIfk9glQRYE88nDQf8H4T19
	7gUmKJKSlu11y+DJEHLQ6OuUYm1FCIeL2hBZ8secyCVe+n2rK1PUDfcqOOlVxVVEcSaOLfOl/Pt
	FITVzgxP4tYZGnxeiOvIcWJFWs2cJucq8qkkPDGtWAdzSaLKIt+6qfj4cMILE1SF951BKQXIo84
	F3vqvwQVNrwAhDeMKvWUfqL+IfwGOgTlfvtEvXwvk5eIqnrEN+uawuGmjHeMkMnCgF9O5Evop88
	jWNQLn6p5dCZUq9VkvoOkLc6Z177oC4vxiKONZgQQg/Qp+gmYUQf6sX4JFngjNhoj5FJLbowwoT
	+91sJGC4rA9Phpt0ED9jHAXwdSo/fdth9k7scVg==
X-Received: by 2002:a05:6a00:1886:b0:845:d286:1fad with SMTP id d2e1a72fcca58-84843232103mr1002138b3a.60.1783488857894;
        Tue, 07 Jul 2026 22:34:17 -0700 (PDT)
X-Received: by 2002:a05:6a00:1886:b0:845:d286:1fad with SMTP id d2e1a72fcca58-84843232103mr1002094b3a.60.1783488857213;
        Tue, 07 Jul 2026 22:34:17 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6db29d1sm6484592b3a.53.2026.07.07.22.34.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 22:34:16 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Wed, 08 Jul 2026 11:01:47 +0530
Subject: [PATCH v3 08/26] kernel/fork: Annotate static information into
 meminspect
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-meminspect-v3-v3-8-7aa5a0a74d5c@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783488714; l=954;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=tH4L3qrbhSf/V6y6KtMHUcarziHQ2L0/qqZt6IntL8A=;
 b=83U3lLes7ct+RTYAnjAk+zQH7f+zLTDcoSsWkgRb4n0jXNEWzZ2Nxi22zBFZqS5mjh5c7YHcu
 LAQzf7ye50qCA3/5b7cfLy4jL7uV11VSKD0yoe1rHcr7kFM2lXZj5Hc
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Authority-Analysis: v=2.4 cv=GJc41ONK c=1 sm=1 tr=0 ts=6a4de15a cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=A5cnksRAjNInYuj8VG4A:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDA1MCBTYWx0ZWRfX0SaWM4q+ogm6
 j+RAedNWiPjDnAohiREV/zHn2dVgLbDUwS7o1MLQqTw+4ISA1dfd3m+IT3zf7n2AMmjxEgZfVkB
 0WeG0WeMA1b44PoHalYoMgJUTyYfN3I=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDA1MCBTYWx0ZWRfX2ijp68JbUNC1
 VzHrb9wbnzEG9ZaMJR1bQhSu83gN3RmIoZeC4opQcI09gbIWqidI3umbgkLrDFuGPPVEOM4o6gu
 xEgT/1olYKG2u1oSzE+gHTkXqNyZAlEGB4I5MBwYpIqn3yUd/s0VW/YmMWVH3dI7PJisY/hJ5lw
 WU+VEeO0K6cT6+K0/JcjQJIGQyZNtvSJ7LrWkqUkGP/twJ7ku6FZZtY0ytjEDuox1UBGzqRDoM2
 LvLirjtQZqiE7/wah3oor0npRvqAdNBZQZ0iUCwqQh7TLfE1VukxDyBknYGSkuqsWEtXVzZ5v9F
 rOihy/r85uP+7x9sNCTc5tYJD9lcO+Ra8oKKnEc+Rh5tf61HxZllwvWkqPa18tcaxTh4v8yPhHT
 3f+TSPBjLasFWu3F7gXVDuxFgIGg4bqUdrYWG2eTiDOpYlNS/07S78T0wvdXKlBu9czFxDBsKGg
 LA5xhNc2JdQRj8ONL2A==
X-Proofpoint-ORIG-GUID: NqF3Za5Zh8DoM9IS-ax6GlykPkeW0BiK
X-Proofpoint-GUID: NqF3Za5Zh8DoM9IS-ax6GlykPkeW0BiK
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-117483-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:ehristev@kernel.org,m:mukesh.ojha@oss.qualcomm.com,m:arnd@arndb.de,m:dennis@kernel.org,m:tj@kernel.org,m:cl@gentwo.org,m:akpm@linux-foundation.org,m:tglx@kernel.org,m:peterz@infradead.org,m:anna-maria@linutronix.de,m:frederic@kernel.org,m:jstultz@google.com,m:sboyd@kernel.org,m:kees@kernel.org,m:mingo@redhat.com,m:juri.lelli@redhat.com,m:vincent.guittot@linaro.org,m:dietmar.eggemann@arm.com,m:rostedt@goodmis.org,m:bsegall@google.com,m:mgorman@suse.de,m:vschneid@redhat.com,m:kprateek.nayak@amd.com,m:david@kernel.org,m:ljs@kernel.org,m:liam@infradead.org,m:vbabka@kernel.org,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:jackmanb@google.com,m:hannes@cmpxchg.org,m:ziy@nvidia.com,m:chrisl@kernel.org,m:kasong@tencent.com,m:shikemeng@huaweicloud.com,m:nphamcs@gmail.com,m:baoquan.he@linux.dev,m:baohua@kernel.org,m:youngjun.park@lge.com,m:pmladek@suse.com,m:john.ogness@linutronix.de,m:senozhatsky@chromium.org,m
 :andersson@kernel.org,m:mathieu.poirier@linaro.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:saravanak@kernel.org,m:workflows@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arch@vger.kernel.org,m:linux-mm@kvack.org,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:devicetree@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[lwn.net,linuxfoundation.org,kernel.org,oss.qualcomm.com,arndb.de,gentwo.org,linux-foundation.org,infradead.org,linutronix.de,google.com,redhat.com,linaro.org,arm.com,goodmis.org,suse.de,amd.com,suse.com,cmpxchg.org,nvidia.com,tencent.com,huaweicloud.com,gmail.com,linux.dev,lge.com,chromium.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,linaro.org:email,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_GT_50(0.00)[61];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: ED735721E0F

From: Eugen Hristev <ehristev@kernel.org>

Annotate vital static information into inspection table:
 - nr_threads

Information on these annotated variables is stored in a dedicated
meminspect section.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 kernel/fork.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/kernel/fork.c b/kernel/fork.c
index 175c73bbe2bf..ec99066eedd2 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -111,6 +111,8 @@
 #include <linux/tick.h>
 #include <linux/unwind_deferred.h>
 #include <linux/pgalloc.h>
+#include <linux/meminspect.h>
+
 #include <linux/uaccess.h>
 
 #include <asm/mmu_context.h>
@@ -142,6 +144,7 @@
  */
 unsigned long total_forks;	/* Handle normal Linux uptimes. */
 int nr_threads;			/* The idle threads do not count.. */
+MEMINSPECT_SIMPLE_ENTRY(nr_threads);
 
 static int max_threads;		/* tunable limit on nr_threads */
 

-- 
2.53.0


