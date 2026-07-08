Return-Path: <linux-arm-msm+bounces-117501-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vxMQNM/jTWoD/wEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117501-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 07:44:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 708AA722036
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 07:44:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=EL1hUm14;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=j5MmxZwU;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117501-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117501-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 39096307A2AD
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 05:38:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EE483C1083;
	Wed,  8 Jul 2026 05:38:51 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5C6F3C0617
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 05:38:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783489131; cv=none; b=R3rvFiLMphP/1egLWlSuqyaGr9XdJyc5O3iTGlb107kodhy+GYARphWm1hNbnkFQ95b0M22K9Bi9AVGrGhn7lL0g9SgDhBX9PKRD9g8PYG0xd8sQjw71YFaqhrp5ygeb5YoPwTlLGfgFTTp0XUwo93n3r/O8GW27vhX1hZ93zls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783489131; c=relaxed/simple;
	bh=EqDXuZR+VwoiCHQ8MrohT0WWo31+t7/SKpMrOr+qFys=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XTK9Lpn6s44pl2pgozdbCHXj+U0EhOoIONqlpk2E6juxY2KxGFzz201TpVCxDHl97/95o381Bky6fgCjLl+Hx3wEYmgyPlmtQs90wqR4+BDPZf2ZWt7Wz85xZR0GwqEpfp3YSo8LhoaZu3SyY+SXijkp+RvzZgsdrIy5w7T/FTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EL1hUm14; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j5MmxZwU; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66842U9I1447477
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Jul 2026 05:38:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/X3PuP0EE4zFbYmFK+cTACEjEy2NM6zeM7tRQiHecKY=; b=EL1hUm14z7DQ/aie
	toNLc4wir5Xb7/R5+/n78Td6Qp5uABES0LJgz4U+ZxNgO8BvtYeOqdrL5eOOVSFE
	m5PoMxOtc0Eaa2+A75pDlYyY6cjeVwVkKOX5uod5btMfqbbbcweOq4IaKvVAPzp2
	MRIiAN2E0zt9hOIDizdPd7FV568FNMWtqI8aL3Frj/zkRyFC6Bw0lg77CueNscoE
	u9DYL0J732btCGqOW6qoCVurAKfExy9bYfY2Q9v//RR7PJszsZSKyEK64fzA/ACN
	xniDwxlXOLHuncXkbf+VtRHuPf93pMMKWEbkIBli1yE/kw8mhtGqMmEkqSnV7Im+
	Xo2Lng==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f97u11uaj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 05:38:49 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c88d7a75507so470964a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 22:38:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783489128; x=1784093928; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/X3PuP0EE4zFbYmFK+cTACEjEy2NM6zeM7tRQiHecKY=;
        b=j5MmxZwUNX2TBvmFVyaR3BDBeQiIIJ17YHyU/ZGxA2kyfhP8HNusNI+voELzmbEETj
         CRY87X9V+Nx1YdjIMr7XaA67kbqrb9Yr2YYSCOpY8vJ8cz2caY5UfKJkthFqzEzyDIb/
         viWIBX1qKsu4Ix1fqKoC+ttHIOX0M8r6BTIOniFjAvekOg1QoXTMDJXpx/gf4cpGhPz/
         yToC+qGr0DWj6HREDtle3tSG9VFfP85QHAuTmCdIiGyKIOoURr77/LHSgKm1EgHAm2TD
         775voGhAMeEtgZSBd9tuYhh2WsPiY51J7k6hzEQM+xD9r83WyK0BdbuJF3yudBztdLdK
         dxCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783489128; x=1784093928;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/X3PuP0EE4zFbYmFK+cTACEjEy2NM6zeM7tRQiHecKY=;
        b=oGKtOzi4233KEDhSb3o81eB7IpfgCA6MzWJ5Y1Yv0fu6/t4z6SNlQjuM/XiRvzxFQb
         ZnmodWMWIFo+0sVWtYIDoTVk7z720Qf5+Ojn88/yVPjSRCLOoMjUJwwYcRy4mn4qtQ4w
         UQXAgjlhpd79f5AhfZpPqKXOhNRdz2kRfrGXDHyYCZM2jKg97N/O5xevi0khebZNYmgL
         ulhiXYeGFweatyZJDxEelxmgUJfmn5fi0N6iDOj1McIkEOpOaNlIZgp0NQtnvJzPKlxo
         8pUs9k/wDMRaeCxEWH+84T7BozB558l0/NZ+SyqD3DqF4pHqXRN13diKPaiVAwPxaDmi
         Sc7w==
X-Forwarded-Encrypted: i=1; AHgh+RofqTCAOBw/OGIp+hQH+H37//Q5C9vOhU0ZxMMSGzGQHWIavAyHT7MdzNSSWebXHvutoQ0/O4DsOCmDosvS@vger.kernel.org
X-Gm-Message-State: AOJu0YwF3x8SNz9/JXRPrlu/zAN4OgYs4iZ3LsnAwr++IAmKbgRmkzjt
	W4TZeAgrtFTP81O6myaRTY2Z1FSx8PmLOyD6t8RXFHZbeKSnVRiaFpJIdqG4EE1km0IErj3A/X/
	vnyCGQvCQoeG9BGASwyTD4bzT6Hb/MkocY91hosLe2i/3jIpIssW9y2LbPk1trbCX6as/
X-Gm-Gg: AfdE7clPGCILtxViB1p09ZHRTDFwcbUvEVwoXXrvHjBbaNAkTvCdtarP6yiNTOCh9vm
	LYx5BDjvnJLEQ3FqJY246D67Wfo/zDLDeXKZBbPD5UDJBIkHnzqeOY77O0TquRWqhcrcW9CqUro
	wWh7PVkKihkChScF2Esvy/eACI7JAqDebPTFufpTa3UWVAYPFrSzzMbZHDE/+nriG5BGeNDlzPY
	Tf0/KHSLcgsB6N+GwzoDcYwy6xbAYaX83lVsdJgsecKFNfCpzH4Xj6jVrxyrJJm48cUM+qrfLbR
	fEdMVilCwlLgYq0YQa0sRp8r/ATxoms3aivMtMMjBC8sVhSyLMjR/vYctPlzJxsCd24JpPKiArb
	mHJqK5A42TWgZYWX7262eQcITU+zQE5yw1LY4Zg==
X-Received: by 2002:a05:6a00:1992:b0:848:2aad:3393 with SMTP id d2e1a72fcca58-84842fd495emr1090483b3a.44.1783489128284;
        Tue, 07 Jul 2026 22:38:48 -0700 (PDT)
X-Received: by 2002:a05:6a00:1992:b0:848:2aad:3393 with SMTP id d2e1a72fcca58-84842fd495emr1090447b3a.44.1783489127740;
        Tue, 07 Jul 2026 22:38:47 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6db29d1sm6484592b3a.53.2026.07.07.22.38.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 22:38:47 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Wed, 08 Jul 2026 11:02:04 +0530
Subject: [PATCH v3 25/26] dt-bindings: reserved-memory: Add Google Kinfo
 Pixel reserved memory
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-meminspect-v3-v3-25-7aa5a0a74d5c@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783488714; l=2504;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=EqDXuZR+VwoiCHQ8MrohT0WWo31+t7/SKpMrOr+qFys=;
 b=IlHziXitcvmT7aPW0vG9xreygnlcWjxZOdssLB909oS1UY6NFTJQZL2kltBAv7qt9PX7Oo/km
 XzLe3BF48Z2BxC3z5wIZKkBAe17AW3wGDH17Hjo8UngU4VxpQsJGmSU
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-ORIG-GUID: ufKd-1sEYes67YW0HAl-OBOpTMCV7CP8
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDA1MSBTYWx0ZWRfX+dfa8ORpYSJz
 xLNcKGljcBLVymhjgMRTH5cik50Jb1+K3KQqzIwR1qpuKtZs/2CIYeyULkceWI6Sj7cqQNBAKq4
 5joJZFgVkgWvHuG48TzA9/QFQsQWNlI=
X-Authority-Analysis: v=2.4 cv=F9JnsKhN c=1 sm=1 tr=0 ts=6a4de269 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=gEfo2CItAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=37rDS-QxAAAA:8 a=iNqdCcJJzjlvehcLF60A:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22 a=sptkURWiP4Gy88Gu7hUp:22 a=cvBusfyB2V15izCimMoJ:22
 a=k1Nq6YrhK2t884LQW06G:22
X-Proofpoint-GUID: ufKd-1sEYes67YW0HAl-OBOpTMCV7CP8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDA1MSBTYWx0ZWRfX59j1UfYoTwYH
 uQLyM0cj1X7Rzc1DQCo7wtaJ3XbLJyopDx88KM+CgtsvSKaLAJKi5pVmXA5Pu6I9HtEn8yfCrvs
 SGx9Ri4VvEwV/4CoX63UcpS1QkuHgwPKT0tFv9dMG+FEj8rVmi9VNgL5dJFYdYEklqz1qcV7o5I
 KcPpML0DfggGvjnVmHGPyvWHTF9xO7MhcoTT/HhnanZ51jeYx53E0eSdHQUz6autwEu7/5eqLxM
 q6wZihrzLsP5c8mipiV6zAK5MISRyVJ7l6pY1nK+sHlD8QK7vWhRPEuHxe1L3qu0MhIdcDnTFak
 5tXoNVJ9OmpX2TxFo2Iz5f3r9oNddMN612Loos8zDMV4CkftxESM7m/6wqYYtgAfQgEdy3j3z4I
 Z+k5FUb5bFo09sZGJdWeuK67JegsASqdyo79WdX+vg965zm4wo3Y8Wgns2vTc+U0ro6OycTdXpi
 BpaHGs1ayB0AajX/PGQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_06,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 phishscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080051
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
	TAGGED_FROM(0.00)[bounces-117501-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:ehristev@kernel.org,m:mukesh.ojha@oss.qualcomm.com,m:arnd@arndb.de,m:dennis@kernel.org,m:tj@kernel.org,m:cl@gentwo.org,m:akpm@linux-foundation.org,m:tglx@kernel.org,m:peterz@infradead.org,m:anna-maria@linutronix.de,m:frederic@kernel.org,m:jstultz@google.com,m:sboyd@kernel.org,m:kees@kernel.org,m:mingo@redhat.com,m:juri.lelli@redhat.com,m:vincent.guittot@linaro.org,m:dietmar.eggemann@arm.com,m:rostedt@goodmis.org,m:bsegall@google.com,m:mgorman@suse.de,m:vschneid@redhat.com,m:kprateek.nayak@amd.com,m:david@kernel.org,m:ljs@kernel.org,m:liam@infradead.org,m:vbabka@kernel.org,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:jackmanb@google.com,m:hannes@cmpxchg.org,m:ziy@nvidia.com,m:chrisl@kernel.org,m:kasong@tencent.com,m:shikemeng@huaweicloud.com,m:nphamcs@gmail.com,m:baoquan.he@linux.dev,m:baohua@kernel.org,m:youngjun.park@lge.com,m:pmladek@suse.com,m:john.ogness@linutronix.de,m:senozhatsky@chromium.org,m
 :andersson@kernel.org,m:mathieu.poirier@linaro.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:saravanak@kernel.org,m:workflows@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arch@vger.kernel.org,m:linux-mm@kvack.org,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:devicetree@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[lwn.net,linuxfoundation.org,kernel.org,oss.qualcomm.com,arndb.de,gentwo.org,linux-foundation.org,infradead.org,linutronix.de,google.com,redhat.com,linaro.org,arm.com,goodmis.org,suse.de,amd.com,suse.com,cmpxchg.org,nvidia.com,tencent.com,huaweicloud.com,gmail.com,linux.dev,lge.com,chromium.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,kvack.org:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linaro.org:email,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,devicetree.org:url];
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
X-Rspamd-Queue-Id: 708AA722036

Add documentation for Google Kinfo Pixel reserved memory area.

Co-developed-by: Eugen Hristev <eugen.hristev@linaro.org>
Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 .../reserved-memory/google,debug-kinfo.yaml        | 48 ++++++++++++++++++++++
 MAINTAINERS                                        |  6 +++
 2 files changed, 54 insertions(+)

diff --git a/Documentation/devicetree/bindings/reserved-memory/google,debug-kinfo.yaml b/Documentation/devicetree/bindings/reserved-memory/google,debug-kinfo.yaml
new file mode 100644
index 000000000000..d260c2d5f70b
--- /dev/null
+++ b/Documentation/devicetree/bindings/reserved-memory/google,debug-kinfo.yaml
@@ -0,0 +1,48 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/reserved-memory/google,debug-kinfo.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Google Pixel Kinfo reserved memory
+
+maintainers:
+  - Eugen Hristev <eugen.hristev@linaro.org>
+  - Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
+
+description:
+  Reserved memory region for storing kernel debugging information that
+  can be read by firmware and bootloader on Google Pixel platforms.
+
+allOf:
+  - $ref: reserved-memory.yaml
+
+properties:
+  compatible:
+    const: google,debug-kinfo
+
+  reg:
+    maxItems: 1
+    description: >
+      Page-aligned region of memory containing debugging data of the
+      running kernel.
+
+required:
+  - compatible
+  - reg
+  - no-map
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    reserved-memory {
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        debug-kinfo@fa00000 {
+            compatible = "google,debug-kinfo";
+            reg = <0xfa00000 0x1000>;
+            no-map;
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index fdad8ef377c8..2d816d783024 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16901,6 +16901,12 @@ F:	Documentation/dev-tools/meminspect.rst
 F:	include/linux/meminspect.h
 F:	kernel/meminspect/*
 
+MEMINSPECT KINFO DRIVER
+M:	Eugen Hristev <eugen.hristev@linaro.org>
+M:	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/reserved-memory/google,debug-kinfo.yaml
+
 MEMBLOCK AND MEMORY MANAGEMENT INITIALIZATION
 M:	Mike Rapoport <rppt@kernel.org>
 L:	linux-mm@kvack.org

-- 
2.53.0


