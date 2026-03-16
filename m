Return-Path: <linux-arm-msm+bounces-97862-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gK+mOA/Bt2n5UwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97862-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 09:36:31 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C39429648B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 09:36:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9C4213027B40
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 08:32:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 044D03815C3;
	Mon, 16 Mar 2026 08:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eOOFJRm+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XK4GTA8r"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8015D3815EE
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 08:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773649936; cv=none; b=FCopFuak/d0uowtyhYORMg9YSCDPbNxeWmH5cpsEtecVGq78EQjpyBi97gMNI0uQhbTlHMsyfvq6zwPPX2WkGgBowbRM1GaXjV23e28XCfdUNbqqP+7SrX5ErBKInzmdBTuOlLduQIhTyhxgsL79yXf0NBNtrHMMcAZ0u3Zry78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773649936; c=relaxed/simple;
	bh=tMcxUkgs244WgTO5NnKlchRHSQ0IR/3gZYttCAFf5Rk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qcnTySU9PRotasVZVij8LcTp92nA0DbeBiaHrXhn4vmXmIOb1Edb6wgcVxZtCqpR/Waly43pmnOFQb2APYzL4voSVFLPGVgi6BkqJhPMo8LXEexa8TlP2OeMwfX9PnOFkNuBuw1gTOiXKNGXOt1LfOGwXU6Jt09pE34n9RHFYC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eOOFJRm+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XK4GTA8r; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62G64rtN323839
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 08:32:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=KEsX4AQIACcJrlZimSP3t1dr
	/d3grVw7qEZ6LiElNb0=; b=eOOFJRm+jMWGHqyVPOa3E/QSvfn3ZFyQu98P0Adw
	G76bAAUSfG1WZgcvyH0iVmG8v55xPDpJzFynWsac5VipA/OT5RgovitBFGfrViVP
	qoqD+o7uzSwMBuSZgsds/PuYyPfLYZgYYKgT1XFqamwafMVm+s1RhL/m0Pr9czPf
	6+HjYTVjD2zns/I+oXeqPQubvbQeO0sYjLuFYLTBuGE+wSdbD5w5tpnHUjC5LXi2
	jcUBgMJFZ7HENbsT/wULQDrsaam5mIdiGSsfsG7vNu7niu1FuBM54dQSLd/676+0
	+sczHTMCbYAd7Z6HsnmfcPwD2YNzdBSPJSrVNVizDH9tLw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cw03qmwa5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 08:32:14 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c73fe9a633eso6661559a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 01:32:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773649933; x=1774254733; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KEsX4AQIACcJrlZimSP3t1dr/d3grVw7qEZ6LiElNb0=;
        b=XK4GTA8rrCfEm6cUtZuRDfHkZoeBRJrKabsHte6bNltdmSo1DeYXhiYAFWyWZdjYsL
         1AujMXb0uEPdijLJjw08t775sZd55oAFzGvH/v2nVlx8QiXwHD1x9B7gLHJ46QPk873U
         kLH8Z3PfsPYPKrK2PKPi2UuG9f/yEXhAhG3i/SDd+whle05N6txiEi+lx1JgT8N22kUE
         hq8uOzOPnuEbITdPNCBgLp4ZDgCOso4lIUOdT4bgd+/MtIne5WEqQF5QYVY59JOVGt4K
         l/TenK2/5o96xFYwk7hr4s5B9AP361qaxe21HNnkUc3PN0msnR51u0OYv3Tp9S/KR5OZ
         /UgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773649933; x=1774254733;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KEsX4AQIACcJrlZimSP3t1dr/d3grVw7qEZ6LiElNb0=;
        b=OCjadmQV+/ptpUfxcVkj0zvz+qCRMU2tLeJagcZpGarKY3vAeUtGa0igwwBeywqbA0
         u6m+Rq5jRhHalLT6YpKeQDhYV2/pqzjHm9i2f9YU9wBnGivBhNX6oozmovySGT5U3neT
         8v+TKMiJ+a8aGw4clkMLc5KoC6lOHuHGSS+t5wj5x6u9wOfFYa3zdPinuX4L1oybBUTW
         4KLx5s3iD0C/Jpy3m3/R2Ii7T24KumhrMH4fN5VtY6pzgQhp6Z5n/+KizH5dMqF2hMPT
         lT/ucClJIjp4lMo9yoY94JAEAVcEcJehu+EQL3kKkSk2zfPfxN12K+j73mpoBXV7UaRr
         UQ7A==
X-Forwarded-Encrypted: i=1; AJvYcCVm1xZlqXby4rrjP+Hed9IyNSl+p7jF8Si94yNLIivtYLtG5Cz4VgLiqbkYZgN4yEpa716RqDKiS8EugN+V@vger.kernel.org
X-Gm-Message-State: AOJu0YxQQvwoq/vPZnpkyRsnBCHZPfWOt3HlDq/u1CXPRVbcoCAYJtYV
	xFX4gRndoAiQs+bBuUXCL2VgzshbWpJyM2GhAP8p8zPypT2Pz5bh+wExHzWkllnf5+OV7El8mCa
	LnUMRtU5nxuxU4erN9FtZ6+jhr9ShddtbydcJjujAtdbrn//2gORbdNkHPYEpUZoj2yX0
X-Gm-Gg: ATEYQzzA3wn1NbrpHIMuccQFzn3OYPRJ3hQz8kRDixUxDauuxjSnuhgf22SEottTSWz
	Hm2zktQ4/V8HkpzMWg1+bp+IkVPmbYbBjAUuZGIfiDUve6ZM1FubISalAx9vmlsNZqA2L9U0Zue
	9JTwdErD5A1PBlaXu4U/VDSmcIzy6Vr0GauzIVGgvoPZ+5s5/1i4f7O69A3FchtoQysY8JpLekl
	+5vv/im/6bpwjgf6RwW9HuPz1IzIVxnU5FnOPN8OlDVvLbK15m3EDXAdqKovxeeTOMMw6g4ErHs
	tiwYCxGKYZWRZjEsK7LbfYzJF/X7AMOmwMtokonzwFxb5ylVhlSxmJWmo2gbj4o32jRpFw0w+mU
	Q1IzCuXv/mnmPFjNiddLM5NTy2X3C1g9hlys72dpun+vfCCWe
X-Received: by 2002:a05:6a20:914c:b0:398:8a92:78aa with SMTP id adf61e73a8af0-398eca38eecmr12281883637.22.1773649933030;
        Mon, 16 Mar 2026 01:32:13 -0700 (PDT)
X-Received: by 2002:a05:6a20:914c:b0:398:8a92:78aa with SMTP id adf61e73a8af0-398eca38eecmr12281802637.22.1773649932245;
        Mon, 16 Mar 2026 01:32:12 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7401588ecesm4048529a12.32.2026.03.16.01.31.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 01:32:11 -0700 (PDT)
Date: Mon, 16 Mar 2026 14:01:53 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
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
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>, workflows@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arch@vger.kernel.org, linux-mm@kvack.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2 01/25] kernel: Introduce meminspect
Message-ID: <20260316083153.pgcdkio6hc4lyr6h@hu-mojha-hyd.qualcomm.com>
References: <20260311-minidump-v2-v2-0-f91cedc6f99e@oss.qualcomm.com>
 <20260311-minidump-v2-v2-1-f91cedc6f99e@oss.qualcomm.com>
 <e398475e-4db2-40ed-baeb-89c2bbf6a0d5@infradead.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e398475e-4db2-40ed-baeb-89c2bbf6a0d5@infradead.org>
X-Proofpoint-GUID: WZfMIQgSvKvyhm1jgaSseRnEgVKRAptJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDA2NCBTYWx0ZWRfXzIM1kh4TBmK+
 4AaWIv0pu3kMlp9yjMcxFqttxLooX7B4BRS1g59ldmUCXoBsQvW1pVx/sR/C3NZSHHaDMUnVMXJ
 RVaERJKlWNdSs/+1+ZZ8tgmW3fiBFMxssGZbKor5zhOjkRe/8TzLZ5iwkvrlohMdQzXfwphp056
 JjlincIjc6yHdACWDUxgnJEp4RRxEvktxtC0+0iJgVKP5bpOgnxJxJ1PeB5925wlqQSysWYMV/k
 VqmHTr2E/RX71Y7fAUV07TapdAWlKFHi4N/1sSiACM08FS0R3D5MbbWWkB58UPJgiP5IwLWvWKx
 fJKPVbCEP2bMjFFog5yTyzeWjvudrpFYy8Fe2FffiRBMYgMrnxXz13Spi3HwpSexV3pQiPtaH7A
 Q3DtzvGfF8IxFABy9YmrDXW8AD+XS2JUG5KrCjLYJvErtJ4vczJXtwtfpnewcapiCVsYXgZctei
 9C62kzv0LU6VpTsFwsA==
X-Proofpoint-ORIG-GUID: WZfMIQgSvKvyhm1jgaSseRnEgVKRAptJ
X-Authority-Analysis: v=2.4 cv=ZbQQ98VA c=1 sm=1 tr=0 ts=69b7c00e cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=O2Qb6zUoD9IP5w4LekwA:9 a=CjuIK1q_8ugA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_03,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 phishscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603160064
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[lwn.net,linuxfoundation.org,linaro.org,arndb.de,kernel.org,gentwo.org,linux-foundation.org,infradead.org,linutronix.de,redhat.com,arm.com,goodmis.org,google.com,suse.de,oracle.com,suse.com,cmpxchg.org,nvidia.com,tencent.com,huaweicloud.com,gmail.com,lge.com,chromium.org,vger.kernel.org,kvack.org];
	TAGGED_FROM(0.00)[bounces-97862-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_GT_50(0.00)[57];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8C39429648B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 11, 2026 at 09:46:57PM -0700, Randy Dunlap wrote:
> 
> 
> On 3/10/26 1:15 PM, Mukesh Ojha wrote:
> > diff --git a/Documentation/dev-tools/meminspect.rst b/Documentation/dev-tools/meminspect.rst
> > new file mode 100644
> > index 000000000000..d0c7222bdcd7
> > --- /dev/null
> > +++ b/Documentation/dev-tools/meminspect.rst
> > @@ -0,0 +1,144 @@
> > +.. SPDX-License-Identifier: GPL-2.0
> > +
> > +==========
> > +meminspect
> > +==========
> > +
> > +This document provides information about the meminspect feature.
> > +
> > +Overview
> > +========
> > +
> > +meminspect is a mechanism that allows the kernel to register a chunk of
> > +memory into a table, to be used at a later time for a specific
> > +inspection purpose like debugging, memory dumping or statistics.
> > +
> > +meminspect allows drivers to traverse the inspection table on demand,
> > +or to register a notifier to be called whenever a new entry is being added
> 
>   preferably...                                                is added
> 
> > +or removed.
> > +
> > +The reasoning for meminspect is also to minimize the required information
> > +in case of a kernel problem. For example a traditional debug method involves
> > +dumping the whole kernel memory and then inspecting it. Meminspect allows the
> > +users to select which memory is of interest, in order to help this specific
> > +use case in production, where memory and connectivity are limited.
> > +
> > +Although the kernel has multiple internal mechanisms, meminspect fits
> > +a particular model which is not covered by the others.
> > +
> > +meminspect Internals
> > +====================
> > +
> > +API
> > +---
> > +
> > +Static memory can be registered at compile time, by instructing the compiler
> > +to create a separate section with annotation info.
> > +For each such annotated memory (variables usually), a dedicated struct
> > +is being created with the required information.
> 
>    is created
> 
> > +To achieve this goal, some basic APIs are available:
> > +
> > +* MEMINSPECT_ENTRY(idx, sym, sz)
> > +  is the basic macro that takes an ID, the symbol, and a size.
> > +
> > +To make it easier, some wrappers are also defined
> > +
> > +* MEMINSPECT_SIMPLE_ENTRY(sym)
> > +  will use the dedicated MEMINSPECT_ID_##sym with a size equal to sizeof(sym)
> 
>      uses the dedicated
> 
> > +
> > +* MEMINSPECT_NAMED_ENTRY(name, sym)
> > +  will be a simple entry that has an id that cannot be derived from the sym,
> 
>      is a simple entry that
> 
> > +  so a name has to be provided
> > +
> > +* MEMINSPECT_AREA_ENTRY(sym, sz)
> > +  this will register sym, but with the size given as sz, useful for e.g.
> 
>      registers sym, but with
> 
> > +  arrays which do not have a fixed size at compile time.
> > +
> > +For dynamically allocated memory, or for other cases, the following APIs
> > +are being defined::
> 
>    are defined::
> 
> > +
> > +  meminspect_register_id_pa(enum meminspect_uid id, phys_addr_t zone,
> > +                            size_t size, unsigned int type);
> > +
> > +which takes the ID and the physical address.
> > +
> > +Similarly there are variations:
> > +
> > + * meminspect_register_pa() omits the ID
> > + * meminspect_register_id_va() requires the ID but takes a virtual address
> > + * meminspect_register_va() omits the ID and requires a virtual address
> > +
> > +If the ID is not given, the next avialable dynamic ID is allocated.
> 
>                                     available
> 
> > +
> > +To unregister a dynamic entry, some APIs are being defined:
> 
>                                             are defined:
> 
> > + * meminspect_unregister_pa(phys_addr_t zone, size_t size);
> > + * meminspect_unregister_id(enum meminspect_uid id);
> > + * meminspect_unregister_va(va, size);
> > +
> > +All of the above have a lock variant that ensures the lock on the table
> > +is taken.
> > +
> > +
> > +meminspect drivers
> > +------------------
> > +
> > +Drivers are free to traverse the table by using a dedicated function::
> > +
> > + meminspect_traverse(void *priv, MEMINSPECT_ITERATOR_CB cb)
> > +
> > +The callback will be called for each entry in the table.
> 
> maybe           is called
> 
> > +
> > +Drivers can also register a notifier with meminspect_notifier_register()
> > +and unregister with meminspect_notifier_unregister() to be called when a new
> > +entry is being added or removed.
> 
>          is added or removed.
> 
> > +
> > +Data structures
> > +---------------
> > +
> > +The regions are being stored in a simple fixed size array. It avoids
> 
>                are stored
> 
> > +memory allocation overhead. This is not performance critical nor does
> > +allocating a few hundred entries create a memory consumption problem.
> > +
> > +The static variables registered into meminspect are being annotated into
> 
>                                                    are annotated into
> 
> > +a dedicated .inspect_table memory section. This is then walked by meminspect> +at a later time and each variable is then copied to the whole inspect table.
> > +
> > +meminspect Initialization
> > +-------------------------
> > +
> > +At any time, meminspect will be ready to accept region registration
> 
>                 meminspect is ready
> 
> > +from any part of the kernel. The table does not require any initialization.
> > +In case CONFIG_CRASH_DUMP is enabled, meminspect will create an ELF header
> 
>                                          meminspect creates an ELF header
> 
> > +corresponding to a core dump image, in which each region is added as a
> > +program header. In this scenario, the first region is this ELF header, and
> > +the second region is the vmcoreinfo ELF note.
> > +By using this mechanism, all the meminspect table, if dumped, can be
> > +concatenated to obtain a core image that is loadable with the `crash` tool.
> > +
> > +meminspect example
> > +==================
> > +
> > +A simple scenario for meminspect is the following:
> > +The kernel registers the linux_banner variable into meminspect with
> > +a simple annotation like::
> > +
> > +  MEMINSPECT_SIMPLE_ENTRY(linux_banner);
> > +
> > +The meminspect late initcall will parse the compilation time created table
> 
> maybe...                                       compile-time
> 
> > +and copy the entry information into the inspection table.
> > +At a later point, any interested driver can call the traverse function to
> > +find out all entries in the table.
> > +A specific driver will then note into a specific table the address of the
> > +banner and the size of it.
> > +The specific table is then written to a shared memory area that can be
> > +read by upper level firmware.
> > +When the kernel freezes (hypothetically), the kernel will no longer feed
> > +the watchdog. The watchdog will trigger a higher exception level interrupt
> > +which will be handled by the upper level firmware. This firmware will then
> > +read the shared memory table and find an entry with the start and size of
> > +the banner. It will then copy it for debugging purpose. The upper level
> > +firmware will then be able to provide useful debugging information,
> > +like in this example, the banner.
> > +
> > +As seen here, meminspect facilitates the interaction between the kernel
> > +and a specific firmware.

Thanks for your time and review, I have applied the changes to both doc. and
Kconfig for next version.

> 
> 
> -- 
> ~Randy
> 

-- 
-Mukesh Ojha

