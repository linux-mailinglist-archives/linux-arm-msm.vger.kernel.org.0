Return-Path: <linux-arm-msm+bounces-117796-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id PYWgD6qfTmrGQwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117796-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 21:06:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7837E729C85
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 21:06:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="C/Z3O8TS";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=TaVdRaOB;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117796-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117796-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 356F530086C1
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 19:06:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34EDC3D16FB;
	Wed,  8 Jul 2026 19:06:00 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A79523CA4A0
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 19:05:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783537559; cv=none; b=ULhLruchzrCssIE047CIj7UBsbjePTSO6BLAn3HpahiHIBwGqT35PYyBFJzItrY15f26OYPVVT/NVCbtiApORDqtgPlq4cyy2oYoa/ZK5LbmXPtuHsPnEG5U5t9nFQ8YD1gBwLhD0ZjEzhWN3ZJYY4V7hwEZYLaXasc7O8CbgXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783537559; c=relaxed/simple;
	bh=YItqT8T7it2rqu0Ag40WP8xbh00oL0oNgmOzd217gSY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=czzDZe6WzWNs3lzWnEyDwNaEdFEu66U66b6NgOFKxU9te0KwaKMdBXGOz0bs22NjkitFKau99eqozvRkzb1Cr/ZCfhGV+9epy8ssLlhuPdSrp2cc78qDK1XqQkVYYeH2+r0DKQhy1TQNPx5qgsNAFceYJQr8vXvNNIPOxFzU8GQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C/Z3O8TS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TaVdRaOB; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668GLT263208921
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Jul 2026 19:05:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=CeHf8ZnOmdDt8+90mSP4wYI2
	u2NYKjn3Be4iJ272f5Q=; b=C/Z3O8TSU/K6ST7I/5NLvaXUbyaBPKdv0+DgP40l
	nQUMyIiRO9eb0HkYDoQACetPWHg33l4B4SndJBK78czyFY2O72YHuNe0IwlvvEDO
	e3Y5cvI4c3FPt59an/wepDFFpz+Z03T8w+4iB0iNKikofEJk+NSkHJqWjAuBGuDu
	AtCF25xZE9fajt5L8vuDM1kN1dXUr3yeqChMyf4fl6dNiYLugaM5q29YztM8AH9s
	XpjSoOZW0vNUVP2e+nShpv9KxBXbZv+Ku+p0c6/+UfEDrWTF5ZEDyfUzfYbgBzid
	ORzfs/9zn+9EvdTrpupSEOicov9omFUig51PTAzYEyTiVA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9gqwb8td-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 19:05:56 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c88fc985a65so1501885a12.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 12:05:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783537555; x=1784142355; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CeHf8ZnOmdDt8+90mSP4wYI2u2NYKjn3Be4iJ272f5Q=;
        b=TaVdRaOBpzvB3sQFBAEcWmcDx/oLzP0IrwweH/DQly4YNfb7bLluGOkH4f1e0ugFbx
         7D8Oz5PvtAfizYXfXJReHdylvgLKwS/72bPb/+nKhmOxA0rw4RZh8GpHfG1QsyhhAfs0
         LRY4AnHCrtUfwi1tOOk1XN6vt0c7XFjJud2Yn31KcQojtpTOqfewVFEvDjfKdwgm2ln/
         uxUP0AozutmPGMBpF7a/oIcbPJunJuML5IgueBPTHDv566YUWrCCBWQr38wQslEe43Er
         pEoLSczQAXe1n8ZDDpdUD6RSR/djvXl8LL/KFsGpbGm12Wrimwt5mzMxT9L9KzzxQ/cf
         Kxcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783537555; x=1784142355;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CeHf8ZnOmdDt8+90mSP4wYI2u2NYKjn3Be4iJ272f5Q=;
        b=NNnDInbRSGjLy1jA4TwJ7Se8Ph8+G14eJoSG0S/cO2768pexJDB0dya7QoxKIIoS7U
         IemEN5R3wxxbOlNxVNxqwkrf98MaGF992QFM874H6YvA5D+WHkZwA1HlgP/uZdO5s+gB
         1kmJtAlbXAohNz5EIOuBuVvFuToTZJLGvLocnz5DJaX17ObvRLgIb6BzTvwtVrZhFOod
         l15bKotQwwsitdfdB93C0grSR2Q9ETctG67oWcQjjRNQkVnn4Xd/rR6L3yJGPJNCE4PW
         uGyTZkzaQjopm8S9+jZZuSztM+xoqYppfaOBKAgG2HtQYp7Oy6vbJqRjiuqd58NhpaQ7
         tXRg==
X-Forwarded-Encrypted: i=1; AHgh+RpBMyhzWplHxfLsZx6Pua9XskoChAf3oq6BsPiK9ZjrngOPZEIOoqY/A0Tf5ZkzMr8KrplzmQ4s0tthgYAP@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6z5qmZlKAgIPeYJFlzPUEO12g3FvnhW6qqKOFyG1UpyoVHV6E
	fTFjsZV71RfU5hYomPKpmyc8cIRoGE+yXSTR8gFkCl999hjyocDbfBDk9YW1Xo0pAc+8iKTBTA3
	YTXbnq5qer8uNLdgVSeHRYEDhtcOv46iV9yHr9JFWtX/hci1h6AbABU11jG4ynQ1Rq7Dz
X-Gm-Gg: AfdE7ckoK+eUV2tLRMCHtBXPQLwwj98JDDqZstXll63L4xcxUO88gHP1U7GcOQMT1Vf
	OIUaRxoiXfWkzKuJWhLJLrRdWx8MkQzbULZ+/MSgfiRsrzxIv0gfg4cmuR5Knt+gLP6CFy7tjnP
	YcfxlZKZly7envKIbeQLUdzpoFEO7wwNl8aWfOjQ1ZClhPqZBdQ9gh3BoJfA1nUpNStTVvxamC6
	DWgAun2Mr3KaFOLoRhM2d1O3QGrbbuJ2qFcV1te6hPz989st0w7Gumsx0zm92tVGDZ0PUm31NoP
	iGjItqw2SFAeq/QTlw0yKuE7RnyMpjBwRQChqw1gDefV6ag7iy4/mZUZr5H4s6i/SESvw+CUtNt
	kGOj1ejC0F/vkhvTV7EDo9woa+A5hVTTQqG6yBg==
X-Received: by 2002:a17:90b:4d8d:b0:37f:db06:229c with SMTP id 98e67ed59e1d1-38942f7105cmr3621963a91.22.1783537555376;
        Wed, 08 Jul 2026 12:05:55 -0700 (PDT)
X-Received: by 2002:a17:90b:4d8d:b0:37f:db06:229c with SMTP id 98e67ed59e1d1-38942f7105cmr3621916a91.22.1783537554731;
        Wed, 08 Jul 2026 12:05:54 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174ae6cd9sm24772373eec.31.2026.07.08.12.05.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 12:05:54 -0700 (PDT)
Date: Thu, 9 Jul 2026 00:35:35 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Lorenzo Stoakes <ljs@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Eugen Hristev <ehristev@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>,
        Christoph Lameter <cl@gentwo.org>,
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
        David Hildenbrand <david@kernel.org>,
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
        Saravana Kannan <saravanak@kernel.org>, workflows@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arch@vger.kernel.org, linux-mm@kvack.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v3 11/26] mm/swapfile: Annotate static information into
 meminspect
Message-ID: <20260708190535.fhqaddicljho44eq@hu-mojha-hyd.qualcomm.com>
References: <20260708-meminspect-v3-v3-0-7aa5a0a74d5c@oss.qualcomm.com>
 <20260708-meminspect-v3-v3-11-7aa5a0a74d5c@oss.qualcomm.com>
 <ak4AgXqMnkn8rVGE@lucifer>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ak4AgXqMnkn8rVGE@lucifer>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDE4NyBTYWx0ZWRfXydT/54S5F0Mi
 V0og/QLCgTxwhHHMDuTdoJsbgLjhqc18uqWFyBcsTvMWKFonvYNNzduI5vD6EZfARHwfgi/BxDG
 N/wGzi0M6HG6DIcE+wXGjK4FP5JT1clZhZgAvbjj1rgNVQnGvG9B4H1LkMLxt9mVv+LtymD0OcP
 tI3j4gWVHbMoOC/eiHnWpJxLela7Mwq/tFRGTHqbcOHStHTCnk/RxezadM6ZRH1pvSGQYlg6B1z
 NPZXcNWJwel4LHtXNMCfZzULbhOcCFTS7xeJqYJXtBqHizTiHCutvEFHkZmR79xuaTvGfvaIIVp
 WoAtSOK4DSCFKXMEnZP1iHD3yb8Ro+SjOQ4XEWZNW97XxqmPVmo215myyBqjTfCzwvcHEGD219+
 Q7lvcZZRj3Q3xE27ZMdho3E9KlTPSHbH97FzkUxIOjRJyTyeL++agXktfySIJjsK24apwNtvQ12
 fsDFt68z0KyeZWOzgOQ==
X-Proofpoint-GUID: ehJJlJkHYshgqPEu8zGDqK5nbMCUx3Gj
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDE4NyBTYWx0ZWRfXwflc/5+MAxas
 Fva6xrdxcZawUNCz+8epD8EcJlkhE2D1aI3ODWTAqGnmJuMAtJ5Ocux2Dzi5jZN7nVvZcu2OnRm
 w6/CB/yo6TQYmgfzRBG5mEVBQWNvFl0=
X-Proofpoint-ORIG-GUID: ehJJlJkHYshgqPEu8zGDqK5nbMCUx3Gj
X-Authority-Analysis: v=2.4 cv=Wf88rUhX c=1 sm=1 tr=0 ts=6a4e9f94 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=cq8IU3OeMPPiwu34qS0A:9
 a=CjuIK1q_8ugA:10 a=3WC7DwWrALyhR5TkjVHa:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_03,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 bulkscore=0 impostorscore=0 malwarescore=0
 spamscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080187
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117796-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[lwn.net,linuxfoundation.org,kernel.org,arndb.de,gentwo.org,linux-foundation.org,infradead.org,linutronix.de,google.com,redhat.com,linaro.org,arm.com,goodmis.org,suse.de,amd.com,suse.com,cmpxchg.org,nvidia.com,tencent.com,huaweicloud.com,gmail.com,linux.dev,lge.com,chromium.org,vger.kernel.org,kvack.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:ljs@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:ehristev@kernel.org,m:arnd@arndb.de,m:dennis@kernel.org,m:tj@kernel.org,m:cl@gentwo.org,m:akpm@linux-foundation.org,m:tglx@kernel.org,m:peterz@infradead.org,m:anna-maria@linutronix.de,m:frederic@kernel.org,m:jstultz@google.com,m:sboyd@kernel.org,m:kees@kernel.org,m:mingo@redhat.com,m:juri.lelli@redhat.com,m:vincent.guittot@linaro.org,m:dietmar.eggemann@arm.com,m:rostedt@goodmis.org,m:bsegall@google.com,m:mgorman@suse.de,m:vschneid@redhat.com,m:kprateek.nayak@amd.com,m:david@kernel.org,m:liam@infradead.org,m:vbabka@kernel.org,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:jackmanb@google.com,m:hannes@cmpxchg.org,m:ziy@nvidia.com,m:chrisl@kernel.org,m:kasong@tencent.com,m:shikemeng@huaweicloud.com,m:nphamcs@gmail.com,m:baoquan.he@linux.dev,m:baohua@kernel.org,m:youngjun.park@lge.com,m:pmladek@suse.com,m:john.ogness@linutronix.de,m:senozhatsky@chromium.org,m:andersson@kernel.org,m:mathieu
 .poirier@linaro.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:saravanak@kernel.org,m:workflows@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arch@vger.kernel.org,m:linux-mm@kvack.org,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:devicetree@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCPT_COUNT_GT_50(0.00)[59];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7837E729C85

On Wed, Jul 08, 2026 at 08:47:51AM +0100, Lorenzo Stoakes wrote:
> On Wed, Jul 08, 2026 at 11:01:50AM +0530, Mukesh Ojha wrote:
> > From: Eugen Hristev <ehristev@kernel.org>
> >
> > Annotate vital static information into inspection table:
> >  - nr_swapfiles
> >
> > Information on these variables is stored in a dedicated meminspect
> > section.
> >
> > Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
> > Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > ---
> >  mm/swapfile.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/mm/swapfile.c b/mm/swapfile.c
> > index a602e5820513..d480727e4987 100644
> > --- a/mm/swapfile.c
> > +++ b/mm/swapfile.c
> > @@ -42,6 +42,7 @@
> >  #include <linux/suspend.h>
> >  #include <linux/zswap.h>
> >  #include <linux/plist.h>
> > +#include <linux/meminspect.h>
> >
> >  #include <asm/tlbflush.h>
> >  #include <linux/leafops.h>
> > @@ -65,6 +66,7 @@ static void move_cluster(struct swap_info_struct *si,
> >   */
> >  static DEFINE_SPINLOCK(swap_lock);
> >  static unsigned int nr_swapfiles;
> > +MEMINSPECT_SIMPLE_ENTRY(nr_swapfiles);
> 
> Now the EXPORT_SYMBOL_GPL() is an EXPORT_SYMBOL() in effect no?

The whole reason we had to tag most of the MM symbols is that
the crash tool looks for this information while launching itself.

e.g.,

./crash --no_modules --no_panic --no_kmem_cache --zero_excluded ./vmlinux  ./minidump.elf


> 
> >  atomic_long_t nr_swap_pages;
> >  /*
> >   * Some modules use swappable objects and may try to swap them out under
> >
> > --
> > 2.53.0
> >

-- 
-Mukesh Ojha

