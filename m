Return-Path: <linux-arm-msm+bounces-117496-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nZ9NOofjTWr1/gEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117496-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 07:43:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 689B5722009
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 07:43:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="AdtinD8/";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=al5jpNYu;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117496-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117496-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 901D83067E79
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 05:37:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AEF3377558;
	Wed,  8 Jul 2026 05:37:32 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1AF23BD225
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 05:37:30 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783489052; cv=none; b=sUqyE/eKQAkVgOoTYLa1MZhI34weK+E63D29Ii03Spqn7ZDkPQo0aNaHl3ynBcPDq67XMU+tECQBEXv4/A1l3Y++FmB/arJJmp/SNvpy9LDtuoqhifgLFNA5wqiaUROlOBVkc/NFYPHvE86P+L84rzSABOUbnu7PdccyEaI1SS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783489052; c=relaxed/simple;
	bh=a//aHjAOCZdOEDNOGwW7cj8bqxjleSnaH73aGg5zKnY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=vDEyJOpY5Kcrh/q/MF8sghPQ2H2LmjyvsGxE/Quoh7jgujLHzulcddy+3gdhAQx9JmGLYyFDPl4Y8HyQrjoAJ3WzcADc7JICo+0pPO8fIIHg5gIbsMFq7S2VjzJEkt9t2+IWTFJpTe7GG61gfVcJv/gU+LyI8r83R9ENzZHRf+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AdtinD8/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=al5jpNYu; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66842aYZ1491323
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Jul 2026 05:37:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gJX87HCSkcJTd7kTCA0/nQnGj2UQmcItMQaaFDWfyJQ=; b=AdtinD8/0bXvXerl
	YGn9KFl1bhMFe7gFO40JI6emTQXt75jSzn3nNrvl0JmjJ3Zxkf4b1fHFs8XJQ/KP
	SuoEKr0GElrjwf9A5KnphGI9waiQ9ZXSYZtfPAcuieqU3uf4vDgo94J+yJNGog7V
	1ltSTfSimVja2g1NCoktksfzXephR8poFoa12l2OImMD+AL63cypVkPikhF/wWrP
	tLKVRLhiaL2iPiXMOIor9/P81WaxfLfGOZiHYrLSZcOVjJpC7V2qjroL5umYsIer
	xxE9u1/PPa+CRwLa16hm2Wk7yv56mjJAToKaPXm/FDYCW+3OOC2SY0/NBI8vkja3
	TIMlwQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9b5g94yf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 05:37:29 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8423f1fe39eso664856b3a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 22:37:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783489049; x=1784093849; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gJX87HCSkcJTd7kTCA0/nQnGj2UQmcItMQaaFDWfyJQ=;
        b=al5jpNYuqFbC0LIcXnGiU+HA8/j+exfgST4IeGOtxq3SX2wVqhlFanhEcaF8aq/ZaF
         iG2yfuzIsmsuTz70NbGiBB3Cz5dclA0gFoQrj6DCpCSPpqL/TmHMFlXxN+Pvmzwwqtfw
         ZZoAe9oFuCoOeoI0L0s1lBYgP7b4fwBsLZrvM2K0RRfFvZaGbMJIA8wLizbav9q9hClb
         LY/CmtJlkTTMLqb7tPAe1SZesrYtrH50ulnWga0X3KIr6BXsXMqPq2I5i9gvvuZWxkD4
         TLTsifKKw1g8/oWWL1zyMBCl2LNExLb+M1PJ5Lrj4EYLGdKqGyGIYEeIXd/xyWdBrD2W
         /R8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783489049; x=1784093849;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gJX87HCSkcJTd7kTCA0/nQnGj2UQmcItMQaaFDWfyJQ=;
        b=tDXTT1QcmkHBSWdCz5s+NPqXWUTYa0ytMhVdXsaa/ROTTrQgomEG20dzmiiTCjQ0TJ
         MsCcGFA6T2oRzi0o1CZ5OUPJTAWUb4WWgH0yMekjOMQKhmbn8bUhC9/Zcq2xmFUn99zj
         ASyVszHhffDJtnGwr+GcPLXgU6fcaClcd+R2ukdWkdM8oxLEjK+aXqgfiJAtf4LsKfWS
         eyGcG9uhD5fsu8b2ga24zdwy4MschIYkWya5E4f/e4uXGOi5x+LGmLyjeITMSKdsVh28
         75BIBdUYfX1sm2JBwx1/6OusXy3GuNgtmr2lDdxTxgdPVCoMpouZ9o7JWzUzH85v8cwi
         AHvg==
X-Forwarded-Encrypted: i=1; AHgh+RoSodwrbkbBVka4NFUQxH7m+V7eHLn9uAq5pJdhOXEMFql4CCHQlX8/8/0lxrppa8QXd2Llpbm6l1VC1Brt@vger.kernel.org
X-Gm-Message-State: AOJu0Yxls3eb5ipB8C+jvwLq6fXuWbRIO9kDT1AfTtYQPlLM1tDZ5wo/
	r8x86pBJDMudnjmFWdC0H4qz8qvdT6HZJ+dgBSUubhf5cT2VrB0X7bGBs8ZjsK/lxmUX9aAufRq
	YbtMUtxHjA6UW7MJiLHyRYhseItgJFYvSYq4/x4kUSuJMb/12IxOUbNGa+7fLXZX3WhyV
X-Gm-Gg: AfdE7cl6VSe8nHnxazCZFF4pGeVQ3LAiTyRjC8TSCX3DK3RnRIYWD/A8ImUmGd2bVEv
	gJ+6P/HrNS7CYYXauQMFP/dKoDEDRUtYidzRfRmiqsfY0MS3ZvC1gKty6A1EFKIHK5TF96lLgUR
	rr1hINGWQpXX2zkmCDsnKiLqbf3kfwgf/kdQpNm3Ma2o77Q3M2q0AwldL/d8pDGm1frFs4iic17
	Zsgvx0/f37scyuSL3KSW/6OLUxbDANMODsmdgik/UId5yNc4PC2u+TuWCDC7bwuDIKb3IfPYHBA
	5jzcOY9Nr64sqaoAQPHT+FODGso0wRrObiVj99GvuMtpN8l4TBTsmy/suSpNC3sEM8NHqZkiyje
	WRj+skVa3X1cDE22qGCmdvClu+FHnGt/ptu6F4Q==
X-Received: by 2002:a05:6a00:2193:b0:848:2f77:e2e1 with SMTP id d2e1a72fcca58-848439317abmr1120432b3a.74.1783489048607;
        Tue, 07 Jul 2026 22:37:28 -0700 (PDT)
X-Received: by 2002:a05:6a00:2193:b0:848:2f77:e2e1 with SMTP id d2e1a72fcca58-848439317abmr1120395b3a.74.1783489047954;
        Tue, 07 Jul 2026 22:37:27 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6db29d1sm6484592b3a.53.2026.07.07.22.37.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 22:37:27 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Wed, 08 Jul 2026 11:01:59 +0530
Subject: [PATCH v3 20/26] mm/sparse: Register information into meminspect
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-meminspect-v3-v3-20-7aa5a0a74d5c@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783488714; l=1429;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=a//aHjAOCZdOEDNOGwW7cj8bqxjleSnaH73aGg5zKnY=;
 b=29tpun/9WI36+AbZk5KGoVhyWBxd6E9AyE00Qj9B9ayJultsqHtisEukCmg+Pc6yavSnSZJB8
 fznsdxO6dZmDcdPiYEDbgHtL5VgKNvVrVXBP/v99PFh6GVWx+oNIDcS
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDA1MCBTYWx0ZWRfXzgtf3M8Dv/+N
 zlIT9SE6AYFcmmsKzfkDMV+bXmVByhhdrflHDV+Q0itU4vhBmClMZCxp0uhY8ZJ8ahY/TPFssZ6
 jODSEDgfK3Dbt+PMmKGC2/pkzmK9zhM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDA1MCBTYWx0ZWRfXyiAZfbwPpBTH
 x0+XynPF89AFOItmym4wwqca9qPV9lxP7WiHIQ0c6rferSoyuKF6orEl7o4m9oB3UuGuXIKXCZz
 yPQ1DaT9Hp/G58knDDOFoYkXxnr+p82f6hXeHJnnmDPq8ofLInYWkWx5WEUG2vmEi3zBsywADjO
 nzeZI7l6jbU2UgLAGRwYx6jacJqQdz9w5VkPrMl52XQfAlbZMl2mKQbdP7oz8C9bEh3tHcyCdHh
 N7N8qNoBYwWHYwogWxNvZ62BYMGa/1larWGpQF8cSQwtQ26sLNQlmbSF2ICrPUWtAexpfufvHZG
 BasWK4UnZ32eiiaVSpzgBJ7Bpqm9sbZZJuVc+/PlMgc/+IyU8yHSfCPyDF+TacrOjUw730qblJd
 EVIXjmX9bb4c9UhqwbCqIAnY7M6u4LJKu3Bv+MFLFWrGiha4D2GMJdYWaM+ohQPSt4ctMhU1101
 QzZY8ePTwGQLbKTPLrw==
X-Proofpoint-ORIG-GUID: 3EfmowJNIA4tUJt8UXnB7IfNzMpgwRgZ
X-Authority-Analysis: v=2.4 cv=JLULdcKb c=1 sm=1 tr=0 ts=6a4de219 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=hPKMzws2jpgYMEASFUsA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 3EfmowJNIA4tUJt8UXnB7IfNzMpgwRgZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_06,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 suspectscore=0 spamscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080050
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-117496-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:ehristev@kernel.org,m:mukesh.ojha@oss.qualcomm.com,m:arnd@arndb.de,m:dennis@kernel.org,m:tj@kernel.org,m:cl@gentwo.org,m:akpm@linux-foundation.org,m:tglx@kernel.org,m:peterz@infradead.org,m:anna-maria@linutronix.de,m:frederic@kernel.org,m:jstultz@google.com,m:sboyd@kernel.org,m:kees@kernel.org,m:mingo@redhat.com,m:juri.lelli@redhat.com,m:vincent.guittot@linaro.org,m:dietmar.eggemann@arm.com,m:rostedt@goodmis.org,m:bsegall@google.com,m:mgorman@suse.de,m:vschneid@redhat.com,m:kprateek.nayak@amd.com,m:david@kernel.org,m:ljs@kernel.org,m:liam@infradead.org,m:vbabka@kernel.org,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:jackmanb@google.com,m:hannes@cmpxchg.org,m:ziy@nvidia.com,m:chrisl@kernel.org,m:kasong@tencent.com,m:shikemeng@huaweicloud.com,m:nphamcs@gmail.com,m:baoquan.he@linux.dev,m:baohua@kernel.org,m:youngjun.park@lge.com,m:pmladek@suse.com,m:john.ogness@linutronix.de,m:senozhatsky@chromium.org,m
 :andersson@kernel.org,m:mathieu.poirier@linaro.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:saravanak@kernel.org,m:workflows@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arch@vger.kernel.org,m:linux-mm@kvack.org,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:devicetree@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[lwn.net,linuxfoundation.org,kernel.org,oss.qualcomm.com,arndb.de,gentwo.org,linux-foundation.org,infradead.org,linutronix.de,google.com,redhat.com,linaro.org,arm.com,goodmis.org,suse.de,amd.com,suse.com,cmpxchg.org,nvidia.com,tencent.com,huaweicloud.com,gmail.com,linux.dev,lge.com,chromium.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,linaro.org:email,vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_GT_50(0.00)[61];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 689B5722009

Annotate vital static, dynamic information into meminspect for
debugging:
 - mem_section (static)
 - section (dynamic)

meminspect uses a different API to annotate variables for inspection,
and information about these variables is stored in the inspection table.

Co-developed-by: Eugen Hristev <eugen.hristev@linaro.org>
Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 mm/sparse.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/mm/sparse.c b/mm/sparse.c
index 058ef9300367..9e890fb6c43e 100644
--- a/mm/sparse.c
+++ b/mm/sparse.c
@@ -15,6 +15,7 @@
 #include <linux/swapops.h>
 #include <linux/bootmem_info.h>
 #include <linux/vmstat.h>
+#include <linux/meminspect.h>
 #include "internal.h"
 #include <asm/dma.h>
 
@@ -30,6 +31,7 @@ struct mem_section mem_section[NR_SECTION_ROOTS][SECTIONS_PER_ROOT]
 	____cacheline_internodealigned_in_smp;
 #endif
 EXPORT_SYMBOL(mem_section);
+MEMINSPECT_SIMPLE_ENTRY(mem_section);
 
 #ifdef NODE_NOT_IN_PAGE_FLAGS
 /*
@@ -206,6 +208,7 @@ static void __init memblocks_present(void)
 	size = sizeof(struct mem_section *) * NR_SECTION_ROOTS;
 	align = 1 << (INTERNODE_CACHE_SHIFT);
 	mem_section = memblock_alloc_or_panic(size, align);
+	meminspect_lock_register_va(mem_section, size);
 #endif
 
 	for_each_mem_pfn_range(i, MAX_NUMNODES, &start, &end, &nid)

-- 
2.53.0


