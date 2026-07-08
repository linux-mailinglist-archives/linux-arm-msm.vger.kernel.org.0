Return-Path: <linux-arm-msm+bounces-117478-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fJJmOlnhTWol/gEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117478-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 07:34:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 99BEE721DA6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 07:34:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=YNu0KmnI;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=IM91fGyF;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117478-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117478-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5C6D13031C27
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 05:33:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B2C63BBFDE;
	Wed,  8 Jul 2026 05:33:02 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E33533BA237
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 05:33:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783488782; cv=none; b=bdGhClO3C+ndB/kCwGQGiab1X4L0RY+65bpedrsNd/XYTZvS7Lg4K/zvYleQlLSdO7TetiEgmDxUSjB9j7OW1UhpyUkxCOIuHDk+1X3A3FjE3MOFYrwc66ttvCKnl8u66U5TZjejB4ORmhz3VHadGC7zbhtZqA0MLO/g/mFuZzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783488782; c=relaxed/simple;
	bh=G8ZD6SxJkQCQY3/diCwEYCUua0qsDotQB6fGokYi3jI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qRPeSZLjqrHFCKRPwKjUkKyvtu4OjvQfX+lIbXY5++d+VFlBNckbK7fe8I7GSXFJuib4PgHc9S5vIpzEFFqLORLg6nBffRK108lij3A9JJu6vGdTZsSLplr8RcQEAhhNR2rQV/2hVtAvDZBcrnX+wnPX5Dpk+N3X4ku9RnaXQWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YNu0KmnI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IM91fGyF; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66843Mmn1527620
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Jul 2026 05:33:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	W3F3QI++Ymkl+ZTQbO8vQyeuk6HPuF8AuBjBmELT9jU=; b=YNu0KmnI02jC4yC/
	1nLV2/RFfnY2EHc/tlF2Cd7G6gUQ6Yl7zDMWuXbbGv61Rpd9zp/YyPQJSkghVqUI
	nCs3JSjPPd7L4zO0ZRkmIR2Dl2R2T2xXMVP2YhovRJXS1Z+2aTFT7sVFtFTX8hCx
	KYlBxK2SgwWfto4JqKcaCSLRtVUjyiAseaY0xUTwSu/C9Q1G6cU+OW/9YRKRfBkt
	d5Mb+80OZgAebHgZ39abhnUyjDQ5kk+BZmoKVouGOGL6pTdUpscD/kkkbHtxb0eo
	mBZccT7SGgSj+3MXqWhUszJXCwkH20MQ2ndtP9xfI00eRI9HRkUgBY5T7WGTCKTT
	eFzT5Q==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8vun5015-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 05:33:00 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-847ad67cc51so345670b3a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 22:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783488779; x=1784093579; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W3F3QI++Ymkl+ZTQbO8vQyeuk6HPuF8AuBjBmELT9jU=;
        b=IM91fGyFnxMoq4YMqczBPGrzCly5GCTHf5aWKP8vynDg5j/agASrp7xIaeUVtuyQsn
         yhF6aTyr40XwrwmkJEqH6p/lLmEG3pcAnaUB5d/JbA35PdQucM/xEcE+IO5fm+x6qgu8
         gAatW35uWCXgKc5Ntue/MCpeGHFMeA5Cn5YVbUWNMMAMey3uajz2K/RfOu3s7cnY+Cy1
         l3ciurNKsaDExoODTu+1mlurm9BFeJ6iNKZ1akXbpwozd2y6i7VYJBHdrFUu0OTl2NsE
         G2C4UHzLrbFxpdlIqdjdRNRaDBmuTkIOn5QGDHVohC1i/17CjLyZXlapBZ5sp3EHmikT
         6o6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783488779; x=1784093579;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=W3F3QI++Ymkl+ZTQbO8vQyeuk6HPuF8AuBjBmELT9jU=;
        b=bAZoxoH1zYzhW3vGUFFYDh5hxXuWwPalLYh7zj5Du5KDMTmwlP7CZtFBZEg+DrgsWs
         dD3m40f8YCt9cIlouoBghVVNDYQnSlKYy7ArNp5qKUCwg2Y8qQTVBE+acz7431Ot0ugl
         ahXkT4XkOwofC9cycaoDht8TUn7e9h5mRv36FpqnXEr38RC0HJFKhKOO05TR5mXwg0uG
         gPesJ8MuVsaXZDyU8PxrymVo4sRbVDi24nj7y6ihYuYcKknJWrZQp14p4CHTkCb08/F6
         FbQb+I/KDbjPBqJVqyk9Wy65Osm12He/aKJEqysHE7XlT/0S7uDqL3/jkIrDSTWTbcXR
         lUUg==
X-Forwarded-Encrypted: i=1; AHgh+RpUzWi24nOHSrzMo/wYZ1Wm9OKWBvPnDS2GYJtEpILCfLdWOdUxIMOnBO29KIPMV4eHCRF4UcASlHOinkdZ@vger.kernel.org
X-Gm-Message-State: AOJu0YzwyGiiL6YAYq6EvzkBfY22fyQ8CjUQCoNqRyBcvq470PHHZfx8
	SZJ5D3VcKbl1HRvzDedPBRjhapmJkhL0OidSIZZO1+PvgKyZE5ZB6IxwBm2j6yvVX0N8leLbDjQ
	biZ+y4YWY2DdLO5yZlls0amYdE2jLkWCvEwSoH/4VPGnxPuH7ZbPOgSat5kPFFQcxies5
X-Gm-Gg: AfdE7cmUYordaf++tEiJHwZr/UbhnSRpsudzV6a/fAq1M/g7KzlfwwYXDns6Kvg0Sw/
	waC8u02zNR0AnvV+5zmPqGW/mVBkFXZdWATuKItwW9L/Sx6ReqES6014OWJEfq0++G4hneXcGVX
	zJePw/qbWZwNgvcHejJEkfkeyvKDKLuHIT6QLmFqif7nXhR+qLtkhJ3ODRPxQnzlo+i8vauHngc
	cFR5ODwuemK2aLEZ/VtFK/mUp6dL8Egw6vSQNKzxOuB7Mr91gEs4tNVSRdjfwE097+ZuSyps+pb
	EcTZ8zZJkZVTxYFiipnGwzrdsheCwnOToWLnY0Rzael9Vl/rNKSGukVofxFl16wNEIm2GaOaeou
	xHlSUMayoAvz/JAu9R/4yZyJYMa/DfKhr++YvMQ==
X-Received: by 2002:a05:6a00:124d:b0:848:2ae4:d2ba with SMTP id d2e1a72fcca58-84842ee9a7amr1114044b3a.28.1783488778700;
        Tue, 07 Jul 2026 22:32:58 -0700 (PDT)
X-Received: by 2002:a05:6a00:124d:b0:848:2ae4:d2ba with SMTP id d2e1a72fcca58-84842ee9a7amr1113971b3a.28.1783488778069;
        Tue, 07 Jul 2026 22:32:58 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6db29d1sm6484592b3a.53.2026.07.07.22.32.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 22:32:57 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Wed, 08 Jul 2026 11:01:42 +0530
Subject: [PATCH v3 03/26] mm/percpu: Annotate static information into
 meminspect
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-meminspect-v3-v3-3-7aa5a0a74d5c@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783488714; l=967;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=J2rXid2SL0yrlw2fwtUaAlFG710CRNb9UrbWjew6KaA=;
 b=TD35QGzVjIwYZNf7SFigqc+I/Rh0Yjyom+K2CZ+Qac5akSllT3+U5ZG26sDsxkvfsPiyNpmIr
 fPjSUHrWCbcCSiASTdRuilYPVxFPmdtOf+xMfsX25dmzDI2XfDMmr97
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDA1MCBTYWx0ZWRfX7XFWoFjRgLXY
 0Nr52P4qus9RARLhLm68qy6Hlkk/WAx7GrGh99+JDfoC7BeRje8uO5VXrHcQJGjk4hs0jBlgC+p
 Xq64HPdCaQmNBrDYQpDVk0NPbr53Jho=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDA1MCBTYWx0ZWRfXzBLhq5sdtb6C
 OpoVcf78eWlIG4RVYLmT47lWyMijadswf+e/fEQ8gScVr8oYgckw1HM+Pc9eT3GBkNqpEDRhgDk
 ml5SoHGu/GE43qpz/vETd6WvTJGrdnqoG2w6N1eIm3ysPIu+aujg4QDBs0J03N3Vny0N+lSVm31
 UDlw9ooQ2D2YkZcos0cNa6/Uz/pWxcRjZyaUJJVo0ZbC+OCqrFN8wJQdiOjYniQ7l078lA8AR4U
 iwW7jxGs8wRYNQ/dxIhpVawQKJW0Q1ieVvDPcZFy8jlNhL0kLxL5QHF2P8OKcbC8GobWH6Fyvgp
 J0znOmGVgxx2l9V3f32BUD0tmusduDzYzgB88zQ6+aZly1vNlAGzGZYN3H4Y89sXOeK1390/ceB
 ouXJZBa1DtxsKHBm+UFYfk6dA8HVOlgEhEIABTmzWG35gg0vQXndp7kVmGdASbwtSgJr26HdL3P
 5siRLERqv+IFH9JLOHw==
X-Proofpoint-GUID: YHiMu6igzBAPwn47Te8Ed8Si9ASAU4oN
X-Authority-Analysis: v=2.4 cv=N+IZ0W9B c=1 sm=1 tr=0 ts=6a4de10c cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=5GcHMyRee5XsgDvb95IA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: YHiMu6igzBAPwn47Te8Ed8Si9ASAU4oN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_06,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 bulkscore=0 suspectscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0
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
	TAGGED_FROM(0.00)[bounces-117478-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:ehristev@kernel.org,m:mukesh.ojha@oss.qualcomm.com,m:arnd@arndb.de,m:dennis@kernel.org,m:tj@kernel.org,m:cl@gentwo.org,m:akpm@linux-foundation.org,m:tglx@kernel.org,m:peterz@infradead.org,m:anna-maria@linutronix.de,m:frederic@kernel.org,m:jstultz@google.com,m:sboyd@kernel.org,m:kees@kernel.org,m:mingo@redhat.com,m:juri.lelli@redhat.com,m:vincent.guittot@linaro.org,m:dietmar.eggemann@arm.com,m:rostedt@goodmis.org,m:bsegall@google.com,m:mgorman@suse.de,m:vschneid@redhat.com,m:kprateek.nayak@amd.com,m:david@kernel.org,m:ljs@kernel.org,m:liam@infradead.org,m:vbabka@kernel.org,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:jackmanb@google.com,m:hannes@cmpxchg.org,m:ziy@nvidia.com,m:chrisl@kernel.org,m:kasong@tencent.com,m:shikemeng@huaweicloud.com,m:nphamcs@gmail.com,m:baoquan.he@linux.dev,m:baohua@kernel.org,m:youngjun.park@lge.com,m:pmladek@suse.com,m:john.ogness@linutronix.de,m:senozhatsky@chromium.org,m
 :andersson@kernel.org,m:mathieu.poirier@linaro.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:saravanak@kernel.org,m:workflows@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arch@vger.kernel.org,m:linux-mm@kvack.org,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:devicetree@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[lwn.net,linuxfoundation.org,kernel.org,oss.qualcomm.com,arndb.de,gentwo.org,linux-foundation.org,infradead.org,linutronix.de,google.com,redhat.com,linaro.org,arm.com,goodmis.org,suse.de,amd.com,suse.com,cmpxchg.org,nvidia.com,tencent.com,huaweicloud.com,gmail.com,linux.dev,lge.com,chromium.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linaro.org:email,qualcomm.com:email,qualcomm.com:dkim];
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
X-Rspamd-Queue-Id: 99BEE721DA6

From: Eugen Hristev <ehristev@kernel.org>

Annotate vital static information in meminspect:
 - __per_cpu_offset

Information on these annotated variables is stored in a dedicated
meminspect section.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 mm/percpu.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/mm/percpu.c b/mm/percpu.c
index a802d72c116f..5b1c87e46273 100644
--- a/mm/percpu.c
+++ b/mm/percpu.c
@@ -87,6 +87,7 @@
 #include <linux/sched.h>
 #include <linux/sched/mm.h>
 #include <linux/memcontrol.h>
+#include <linux/meminspect.h>
 
 #include <asm/cacheflush.h>
 #include <asm/sections.h>
@@ -3367,6 +3368,10 @@ void __init setup_per_cpu_areas(void)
 
 #endif	/* CONFIG_SMP */
 
+#if defined(CONFIG_SMP) && !defined(__per_cpu_offset)
+MEMINSPECT_SIMPLE_ENTRY(__per_cpu_offset);
+#endif
+
 /*
  * pcpu_nr_pages - calculate total number of populated backing pages
  *

-- 
2.53.0


