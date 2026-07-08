Return-Path: <linux-arm-msm+bounces-117500-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id s2TODK7jTWoA/wEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117500-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 07:44:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D58B6722028
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 07:44:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="LQQM5//9";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=EUYpCWnM;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117500-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117500-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8A356306EA09
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 05:38:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E67B3BFE38;
	Wed,  8 Jul 2026 05:38:36 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CD4F3BD644
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 05:38:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783489116; cv=none; b=eIf6zteY1lCk7Mse85/bYYGsvNiExb176yxgBiPJ9bxcku68YJ93N+of1g/O9uHeWBnsukYQQVQdS8rw124z+99XZBCVnED7V2njDaUYwHHhOve6MDU5/KOQkUfbkmPvTD0Dtp2qyhVIJzwK1VXzCYEvqq/7pNHYhoCBaS26ZOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783489116; c=relaxed/simple;
	bh=H0KVhlKv6aukA6G+LK06aNYu+V1ALsrFFp4+gyDYr68=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=md4PoL35hiVSjuhHnKwW3nzRvRic7GW5a2pb3Yzb+4U7yp7OijKh5PEB0H2/ZktoKXfykRuD7PlgwNUoadUaGBkuLmsIYPgxSZwu85V19NIzAI/r1/BZOZ18EuPetFCghfatQ+Tyz8MzRPZSD6iQXCM/ptihQCKbhutAq87/msE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LQQM5//9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EUYpCWnM; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66842a1V1667899
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Jul 2026 05:38:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fca21ZgkD7LFTSRCvjaeWw9IaPpMxur6ce+e2Kwqgnw=; b=LQQM5//9LbOc30Sx
	Mt1bSo5SZ+865GzEibBA6hJzyNwcXqIeC4xNa/lu+UrzBww8zpjUEoagRsBmiPsk
	bkIL9n2SSQ19liYsFwanGwNmXHDW4XvXIoQZQxPmi+k7pFEdgT1XVz5dllYIE8DA
	i2jCbyd3PlNEPfvdrqQznXquMv+tj8ZFi9hvpMf5XJHJMqhFG0XtrH09BaVTscJk
	EWmbh2EI7f+Tk0n9foFwNQ2P0/bE/ssMfwnAVa8nh35hZbW16HSd312t0lqw/LBc
	7JXd0SWCeELa3ZGymk4NGryqrDs460Gg056U4JmmadqGfExst5nRMOgWFF6iRP7K
	vMhrhQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f95e5tu32-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 05:38:33 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-84786d85ec2so460563b3a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 22:38:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783489113; x=1784093913; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fca21ZgkD7LFTSRCvjaeWw9IaPpMxur6ce+e2Kwqgnw=;
        b=EUYpCWnMXH2QcaEHqKVuRhQwWpl0myzOHq09DpenpOSYNZ/Angd8GCsdCj6rBHkpI4
         bwTAFg1/FAKPqIu3ms/Ixo6/doPkPN7BpZe1lkFQHaWb+VFYRpA4bZ5IuSFZc4B1jKxT
         KGZVXwAilpUHeMahq5jhFbUeeim7BIGmYMHEbEbP4dvTwTeKHhiUE2ZrHEjxqduFiMiz
         QYpphM4VktGkS/iyItqaGj3cqSes7Xsv6LY19JIyQ66ZG0roLuhaCbZWC3FNGXqfRixT
         SEjtagCbS44MrvmniYVsOYCj88tNwjVV4KqNRtSOsimOH7PZpTDyPDdYSCDPNZLP1vkt
         5ylA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783489113; x=1784093913;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fca21ZgkD7LFTSRCvjaeWw9IaPpMxur6ce+e2Kwqgnw=;
        b=QkoMw/MkhJFOCLQaJqSgbZNubqRyyDO0Kt7IKEmtXELCUL6p41n8lLn2SRCcI7YCso
         T+yTMBLqti7NlCI1nUhUv15N1ammTYVRBFOvCHjTPp+yyJocZ21arEJEJbvwi7dIWKxK
         aFTxAPSDCo7otCTTTb5h1AxhuN/DzQ+czaDdaqc9XHvdwI3GEJoAX9UDob6VY660gqza
         gdThxmtC90DigDBWh2fn8BMmwV9EPrSj4GQ6Yu3JV0L+SI5PJ1wujIrkAMGtfZWQACzY
         Rz68g65luc3ixlAJ+DbYOEYU3wvVynZnG1Dn93/GKCw1/ptNStUs1M5IsHJYPFyfVnO1
         4MvA==
X-Forwarded-Encrypted: i=1; AHgh+Rq5NP59qTuzOmswpJCczO39Xpmw5RRr+BMJcscy74Tms+7y933dmCbJfJuloZdr+kb93kkXmONKC/U6np/Z@vger.kernel.org
X-Gm-Message-State: AOJu0YyxxgB6d3z3lYAMSUAAeRJ4s0F/ZvUaxPGAPCONOywzkg6Ygkky
	i+fG+6LA3RjUmrFG5618fbF3gcgVV9+XB4pxP6qtcfGaCgMH0Ww/M0YGHVa97Gom+HPiwGHJJRu
	rdy0rAUrGwmgXFaN1X+Bwom3JaG5dKUiSh48s5qo68Rq64NlvmEqxukGADrl8rAEs5mQl
X-Gm-Gg: AfdE7cmSw+8WNoytPKQzZLXtgtXQJUeBG6CAqMjnXPQoc9Ef0HCRpepfUQPFCRi5YHB
	V1LeinOVFD16R42SheOWp3I73pIZj5s8/fCN6NtX9kehvKKO1PfV5Tu95lMiFF58v5Af7EIekqy
	d3IVfAD6eH7a9lURIYibfeNCsxnv+BxKv68o0aFyAVE2KTDrPc5Qor5UD7CLnseldtiXA5awn6H
	GAh3ihVdE/r7Ovbf71PWQmyxSIkrDn0b4VmZM0MtnBoXjiDhNOl17MjKpp7HxyVSe6ywZaxfIp2
	QF6KP9or32j67NckGGn6uXbMzBC5auSE3lJbFxuYoJCjxbsr3uD51eLB1r8VkiQwPBMilk9YjRa
	/f4+0urSkXOpTVOqprot+Hhyw422vEWe6B+COQQ==
X-Received: by 2002:a05:6a00:2993:b0:848:2f7a:2e50 with SMTP id d2e1a72fcca58-84843689a40mr1216608b3a.63.1783489112649;
        Tue, 07 Jul 2026 22:38:32 -0700 (PDT)
X-Received: by 2002:a05:6a00:2993:b0:848:2f7a:2e50 with SMTP id d2e1a72fcca58-84843689a40mr1216519b3a.63.1783489111892;
        Tue, 07 Jul 2026 22:38:31 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6db29d1sm6484592b3a.53.2026.07.07.22.38.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 22:38:31 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Wed, 08 Jul 2026 11:02:03 +0530
Subject: [PATCH v3 24/26] soc: qcom: smem: Add minidump platform device
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-meminspect-v3-v3-24-7aa5a0a74d5c@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783488714; l=2166;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=qD/nh641ZSFjZGTcbJ7iS+yBVa/+Otl0CfqdfCxWsT8=;
 b=gt6zHK586TYGPJ/gAqsyCYCD6hbQxtHAnbJHOmkGZ2yjp8Q1La0mBTlUIIpunCFMmTt6hSxAn
 uwkN9HKuN3hBSxqOUojHd4WBwfub/7sr3Dd6ydglmyzHr5NZOT9sPBK
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-GUID: v0vcB-uZlOfTm14b5Zve3E3HHfVN8NsD
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDA1MSBTYWx0ZWRfXxQhF9+hiEVmW
 fu88Eifrr+A1JOI28+66Cau4G5Xz4zsEXZARXJ7Pv3AwVIh+d3qWN1+74xAJG1HEkO5v+8E71Pb
 GVFX9RyDELgOQC/Ht7uJgQ/pyzrv6Nw=
X-Authority-Analysis: v=2.4 cv=CNoamxrD c=1 sm=1 tr=0 ts=6a4de259 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=3CFpAjl5I9ltKDqHFfsA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: v0vcB-uZlOfTm14b5Zve3E3HHfVN8NsD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDA1MSBTYWx0ZWRfXxlWLyrvj9Cei
 FaLzYwW/eV8OqYKDxPOxxepMf+kbBC4k9BdH6/E+UpdSgy7fhPlARgyGK3ozE/pl5Zns85KkeJJ
 lCp3r3PFuilVpNowTMFDsN+LlsVy599JFSpJxUDKuOEwpSYFs5eZqDD8edbVk3Ykhb3JZlvpvRZ
 upFhO6AFwFoWWVGeUmLSe9AYRDrbUbtgZnWmGoO3oBHFhxuM1v5TZ8VZT/yPTqIXmgPngqbWGsy
 1I1Q/l2cMaAtpWs8N7DkiXQ4n68ljG3vSn/SN5rQAgBK53cOJj2pOFRCi54T+SZqF9Ra7V1jB1D
 8iWV0Otie8eSKrLnc+w0B/ZKlF9tmnhVktZ/ozKc/klYLI8lzJ7lBIeF1cMQfIV9YGAOTw2aVTr
 QL+tJPa/QH3QdtVUB+uF80YuaKqEcBPHglAhrxvDv7VlMD6KRhowBFh/UT9rin6qEX7YbDyRo4+
 NTQZowfxwUAxQOuFkDA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_06,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 phishscore=0 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080051
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
	TAGGED_FROM(0.00)[bounces-117500-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:ehristev@kernel.org,m:mukesh.ojha@oss.qualcomm.com,m:arnd@arndb.de,m:dennis@kernel.org,m:tj@kernel.org,m:cl@gentwo.org,m:akpm@linux-foundation.org,m:tglx@kernel.org,m:peterz@infradead.org,m:anna-maria@linutronix.de,m:frederic@kernel.org,m:jstultz@google.com,m:sboyd@kernel.org,m:kees@kernel.org,m:mingo@redhat.com,m:juri.lelli@redhat.com,m:vincent.guittot@linaro.org,m:dietmar.eggemann@arm.com,m:rostedt@goodmis.org,m:bsegall@google.com,m:mgorman@suse.de,m:vschneid@redhat.com,m:kprateek.nayak@amd.com,m:david@kernel.org,m:ljs@kernel.org,m:liam@infradead.org,m:vbabka@kernel.org,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:jackmanb@google.com,m:hannes@cmpxchg.org,m:ziy@nvidia.com,m:chrisl@kernel.org,m:kasong@tencent.com,m:shikemeng@huaweicloud.com,m:nphamcs@gmail.com,m:baoquan.he@linux.dev,m:baohua@kernel.org,m:youngjun.park@lge.com,m:pmladek@suse.com,m:john.ogness@linutronix.de,m:senozhatsky@chromium.org,m
 :andersson@kernel.org,m:mathieu.poirier@linaro.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:saravanak@kernel.org,m:workflows@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arch@vger.kernel.org,m:linux-mm@kvack.org,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:devicetree@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[lwn.net,linuxfoundation.org,kernel.org,oss.qualcomm.com,arndb.de,gentwo.org,linux-foundation.org,infradead.org,linutronix.de,google.com,redhat.com,linaro.org,arm.com,goodmis.org,suse.de,amd.com,suse.com,cmpxchg.org,nvidia.com,tencent.com,huaweicloud.com,gmail.com,linux.dev,lge.com,chromium.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linaro.org:email,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp];
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
X-Rspamd-Queue-Id: D58B6722028

From: Eugen Hristev <ehristev@kernel.org>

Minidump can collect various memory snippets using Qualcomm boot firmware
support. To determine which snippets should be collected, each snippet
must be registered by the kernel into a shared memory table managed by
the Qualcomm SMEM driver. To instantiate the minidump platform driver,
register its data using platform_device_register_data(). The minidump
driver will later probe the device and retrieve the required memory
snippets from the memory inspection table (meminspect).

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/soc/qcom/smem.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/soc/qcom/smem.c b/drivers/soc/qcom/smem.c
index afb21a778fe7..11ebcfc34d0c 100644
--- a/drivers/soc/qcom/smem.c
+++ b/drivers/soc/qcom/smem.c
@@ -267,6 +267,7 @@ struct smem_region {
  * @partitions: list of partitions of current processor/host
  * @item_count: max accepted item number
  * @socinfo:	platform device pointer
+ * @mdinfo:	minidump device pointer
  * @num_regions: number of @regions
  * @regions:	list of the memory regions defining the shared memory
  */
@@ -277,6 +278,7 @@ struct qcom_smem {
 
 	u32 item_count;
 	struct platform_device *socinfo;
+	struct platform_device *mdinfo;
 	struct smem_ptable *ptable;
 	struct smem_partition global_partition;
 	struct xarray partitions;
@@ -1245,12 +1247,20 @@ static int qcom_smem_probe(struct platform_device *pdev)
 	if (IS_ERR(smem->socinfo))
 		dev_dbg(&pdev->dev, "failed to register socinfo device\n");
 
+	smem->mdinfo = platform_device_register_data(&pdev->dev, "qcom-minidump",
+						     PLATFORM_DEVID_AUTO, NULL,
+						     0);
+	if (IS_ERR(smem->mdinfo))
+		dev_err(&pdev->dev, "failed to register platform md device\n");
+
 	return 0;
 }
 
 static void qcom_smem_remove(struct platform_device *pdev)
 {
 	platform_device_unregister(__smem->socinfo);
+	if (!IS_ERR(__smem->mdinfo))
+		platform_device_unregister(__smem->mdinfo);
 
 	xa_destroy(&__smem->partitions);
 	/* Set to -EPROBE_DEFER to signal unprobed state */

-- 
2.53.0


