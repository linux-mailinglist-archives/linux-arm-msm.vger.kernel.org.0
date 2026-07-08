Return-Path: <linux-arm-msm+bounces-117485-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id s7XWF/fhTWpm/gEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117485-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 07:36:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 912E5721E5D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 07:36:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=CtwLPwnm;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="Mb3w/vQr";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117485-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117485-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 377EC301020D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 05:35:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E96973BBFDE;
	Wed,  8 Jul 2026 05:34:52 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7246D3BE17D
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 05:34:51 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783488892; cv=none; b=alVoF+T5jv8VSuaukYH3lIKBashUJ9B1TDXqosj1QM/XWT5xdoBdKRPpY97QKH+THNHgLwCXMHAsg/TRv50u5K+qsljCdF9kv0cXOi1tDVfA/KOK3uwnT+eNauBQAtzz8Jl+43QGLqoWRlGBJQ7YbMA42bYW3boePGRFHGiCf3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783488892; c=relaxed/simple;
	bh=G7OTxl0hvmmMhHZfG1dBv16rJ8UL2LeMtOP6OSlMZ9c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GGPnh+AG9pH1VWEZlBhgLg0gp15G5i3EKENWwVmAsmOX9doiiF1IIxiqGhPCovxm+5im7DWf17xOS4nucKHGmKvfHgcX0pI5/NW/pPR5Kfiyp//pV4hosNHveVB8Py4/AuPWOWnNotHxm8IvUzyzixmracN5udtpozKVJop0dY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CtwLPwnm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Mb3w/vQr; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66842lwd1645124
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Jul 2026 05:34:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GG0TiEFI6S40u81CAA6ELJbYcW+fJPcBWrtzfeGi1/M=; b=CtwLPwnmIWiCP60L
	tSRsWp19PTCvpGjTRExUl39BzKsi+1lH/6uR4/3M9lId08XsntBqFVLk732lFfZx
	PJvuBKJLGVOglKa3NnUHesiRg9LcFb6InkB9NcYdGjQr3LXiJzSBccXx2chE4mQC
	+B4+ilNPXhbBgZ0jXx8+aGb0zAGPN1UxAGNoknIjQhKClh6K1myUaQZ36mpiFGJX
	03ih5H27p0rFYkktHS+mLwP3ldhelLo0rwl23FhVNzePBBDxAu5GqLxhcv7nzz75
	5JviMCxj2DbFv9kIvNO2Wcb0ycdSOYQn4PspXJkWPKmGwYGgAhkg/GNcgKW4HxMP
	3rSjmA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8ye0majh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 05:34:50 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-847ac21582cso438525b3a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 22:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783488890; x=1784093690; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GG0TiEFI6S40u81CAA6ELJbYcW+fJPcBWrtzfeGi1/M=;
        b=Mb3w/vQr0ja+Jy9Lry6RwWCwnOIJkcQ7kP+hOhjrsk6hSjL/BLsps0cMqd5ZOw0H5p
         auEH7Sp9fAfd94M65+AXq5wfLWrkpknpi+MgY4xCiP++q3Sj7CUkicGORO/Bc9rs2Nwv
         AriIvzgVYaevGLBLCCzmUOiVPEIkwY9guKpP++9APX7Jb2CqTFOjMUG8GDEFeihr7K3z
         8T3RUIUKKaNCzNzlYxTRGiUyryQ9fZX/r+s3xzzNjj21Jw/JGixJ/1jfM/itbB1V/kLg
         osmHGr1IKBalho6QHWp0ri8B33/uYr8oVdu3kpQHQRN/bL/inN7vHVDNj+1ybvaw+6R+
         VtrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783488890; x=1784093690;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GG0TiEFI6S40u81CAA6ELJbYcW+fJPcBWrtzfeGi1/M=;
        b=MYPqlvipC4hQv13eEQDOciFJug/Lc39sWKYCqJ8bAUNRBMzum/YLdYcklU3RH6+7oP
         MCBNK4jy7Xo6sISvOJ/xyxr9kt/CagbpsH3HG6MAsslz/vRbjpC25vSbrT9jj9J1L1b8
         pya7soW1NcrWQQ/1mvaaRxeBJ56CBz817fezR023JU10wLemBdjwFyWp97YALNSyNFEl
         r+7BhC/fxsSFxlnMxCTjayxEOo0mae1CXyeTvRCcrhVNHq7M0L3X031I15iEtzFN9H91
         FyO746tFFOfAv22iA7vGvJjHJv1ayFJyfsQfaIvKQn8jKIlrVKPlfQDxbeF6295cU7tH
         YK1g==
X-Forwarded-Encrypted: i=1; AHgh+RpuV5p6WV4XGBb9awCUDRY/vyP1QqWKuzxcIalt193ah+Fg1JvxwXjV45I5SNWi6k/oegTTVllzPHLatE/e@vger.kernel.org
X-Gm-Message-State: AOJu0Ywc/ZLT/tpkio9/jKvsr1+EZipL54haDL5VvQ0HBFa1L4qyUAgl
	+gA4pDUxtYfMDuK5NCNbOFK0yKyTxQjNrxpgs/3TLMb7/dNDrQUGvlOH74O/DEPn4chMpx49HT5
	1L4fotipfX56tk1obTVa+CWSIcgqZp2mB+5Z1Rnh0kj3QODjJ/JrMlaF+2JGhNeQ5Hke7
X-Gm-Gg: AfdE7ckR4sEJueM6kNmqS2TojT0ymqTFVSaELOh48jojb/8Z/brtwmKbPPLn1mLkcxG
	oVwYBe/AOkrRFPWaXRlGlkaLL0uaUVszvZsD9G5MaR7zPLjYeHG3WktcG40QGikzwJTL4iOdyLa
	nhUOTn78NJaWvfP8AIqQClycSMHwSvsLiZQzYx1Pr5egpIWOv+jG1/FThz9y3fqXlP2Dyak/Up7
	Dwe3Q2gColu0kV3bxBYmkhbXtNkxTXuWdWvMmNM2HaGUTJkk8HBMmTHbAiDxhNiPBqbtUPoUbl6
	ROABYsH51YqmG2J47mJvXjWDztmbF0QKwYeVE50PVkhHY4RB8IW3R0Z7K3BPzIbGmcsyExKKnWK
	lOMD5eBjtmHIWgyL+jXk6MTMt4LGWDxJmroqprg==
X-Received: by 2002:a05:6a00:1d87:b0:848:2f71:b65f with SMTP id d2e1a72fcca58-84843000644mr1092042b3a.74.1783488889718;
        Tue, 07 Jul 2026 22:34:49 -0700 (PDT)
X-Received: by 2002:a05:6a00:1d87:b0:848:2f71:b65f with SMTP id d2e1a72fcca58-84843000644mr1091997b3a.74.1783488889150;
        Tue, 07 Jul 2026 22:34:49 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6db29d1sm6484592b3a.53.2026.07.07.22.34.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 22:34:48 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Wed, 08 Jul 2026 11:01:49 +0530
Subject: [PATCH v3 10/26] mm/show_mem: Annotate static information into
 meminspect
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-meminspect-v3-v3-10-7aa5a0a74d5c@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783488714; l=914;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=Juh0kWVVV9+31+pGUNWBrImKXqVrnwqwm/8iHkGSNZc=;
 b=QUUwmdgFWBgI75+U/LQsmKds191tgbFJHJT05eRFMeyjFTPxg5V8CAPSijLkfNZ7LQtRjumHe
 J5Xw5f3z1e2CW+YpiYhbyE+qRS4qLD2cAWVE6mgZMA9c4AZEcoFxInw
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-ORIG-GUID: wA14BUSPZm_JlXuWYnSeX_u85LZnTvBq
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDA1MCBTYWx0ZWRfX8q6Ld7pHbD4w
 7YhJqqCK8/DAr4HzteHBEbR4Ry9TrytJ1cqbRMMkFYWUPBcQDyF6wTUi7EvXGyXcw6KbKt3fwvC
 MwRATAN9HM71RV/HwVZgsexWsY842FE=
X-Authority-Analysis: v=2.4 cv=SZfHsPRu c=1 sm=1 tr=0 ts=6a4de17a cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=Ayq6lH46roXo9nsmW_UA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: wA14BUSPZm_JlXuWYnSeX_u85LZnTvBq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDA1MCBTYWx0ZWRfX5er3tEvgxnbv
 8pa048rgEscE6NWWBM0z7eoaKBRKjWKH6mb2VTKSiE1AmQiTcp5GdwzeAUCCViFdyu69FRvHsRk
 cstd5NLU8MCwq0Jez/4Lv0H6atFUFxQkOmiiRIoL3ang5RndOBWf3qPHNZb0OurKfdi4UFWsKYL
 B2g6QiGPYGWUjGTl5JAZaW3fg1fdqpwD8Z7NZwkY5Qbn6Jo6IJ90XNU9m/K+qGm10b/zqgYiECs
 XGuO8OyKav2idxa1xX6i/nKpiktGLay02BHIOEM8t/PNQzR+Rf8c5DNJ6P19QmqHgj1Bn0gsCCm
 UIcE7Les05w8vq/ukZFULzkPPptCAb5DyPgUcNPW6wuIDMZ5j8yzsX3U/ARpMNsGOMKRGlaQnCI
 oMpWdrPqd+mWJ8OD/ht2qD5R7LCkDaTGcM94RCFYmIFifXWo53LiaRLApDJG45QAlwHXIYH8Dmr
 i2cyCL9E0buDnok8YnA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_06,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0 spamscore=0
 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080050
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
	TAGGED_FROM(0.00)[bounces-117485-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:ehristev@kernel.org,m:mukesh.ojha@oss.qualcomm.com,m:arnd@arndb.de,m:dennis@kernel.org,m:tj@kernel.org,m:cl@gentwo.org,m:akpm@linux-foundation.org,m:tglx@kernel.org,m:peterz@infradead.org,m:anna-maria@linutronix.de,m:frederic@kernel.org,m:jstultz@google.com,m:sboyd@kernel.org,m:kees@kernel.org,m:mingo@redhat.com,m:juri.lelli@redhat.com,m:vincent.guittot@linaro.org,m:dietmar.eggemann@arm.com,m:rostedt@goodmis.org,m:bsegall@google.com,m:mgorman@suse.de,m:vschneid@redhat.com,m:kprateek.nayak@amd.com,m:david@kernel.org,m:ljs@kernel.org,m:liam@infradead.org,m:vbabka@kernel.org,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:jackmanb@google.com,m:hannes@cmpxchg.org,m:ziy@nvidia.com,m:chrisl@kernel.org,m:kasong@tencent.com,m:shikemeng@huaweicloud.com,m:nphamcs@gmail.com,m:baoquan.he@linux.dev,m:baohua@kernel.org,m:youngjun.park@lge.com,m:pmladek@suse.com,m:john.ogness@linutronix.de,m:senozhatsky@chromium.org,m
 :andersson@kernel.org,m:mathieu.poirier@linaro.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:saravanak@kernel.org,m:workflows@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arch@vger.kernel.org,m:linux-mm@kvack.org,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:devicetree@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[lwn.net,linuxfoundation.org,kernel.org,oss.qualcomm.com,arndb.de,gentwo.org,linux-foundation.org,infradead.org,linutronix.de,google.com,redhat.com,linaro.org,arm.com,goodmis.org,suse.de,amd.com,suse.com,cmpxchg.org,nvidia.com,tencent.com,huaweicloud.com,gmail.com,linux.dev,lge.com,chromium.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,linaro.org:email,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
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
X-Rspamd-Queue-Id: 912E5721E5D

From: Eugen Hristev <ehristev@kernel.org>

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
index d1288b4c2b64..67ef32f1ebb9 100644
--- a/mm/show_mem.c
+++ b/mm/show_mem.c
@@ -14,6 +14,7 @@
 #include <linux/mmzone.h>
 #include <linux/swap.h>
 #include <linux/vmstat.h>
+#include <linux/meminspect.h>
 
 #include "internal.h"
 #include "page_alloc.h"
@@ -21,6 +22,7 @@
 
 atomic_long_t _totalram_pages __read_mostly;
 EXPORT_SYMBOL(_totalram_pages);
+MEMINSPECT_SIMPLE_ENTRY(_totalram_pages);
 unsigned long totalreserve_pages __read_mostly;
 unsigned long totalcma_pages __read_mostly;
 

-- 
2.53.0


