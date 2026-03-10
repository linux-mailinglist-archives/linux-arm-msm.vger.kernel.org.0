Return-Path: <linux-arm-msm+bounces-96749-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0EMwINZ8sGnLjgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96749-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 21:19:34 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 251642578DD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 21:19:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1669C3220013
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 20:16:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1CFD3E92A7;
	Tue, 10 Mar 2026 20:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hSQTQIrz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cMvdEuyu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C12F3E92B4
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 20:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773173778; cv=none; b=McJ0nWpu2doS/JSKQr0WEWfHS+o5KmV/v6Ws37ttXE1lU4Oy5trezW1KaFyPJkpLjw/ni6uRhufrhL0lN5AWTfuymWonCeF9g6iBqRwS2SoDjdvntHfmQN18aF7/fwGaicHImJEanx73SijWvBeSX16vPKbGMzanWfJdIT8uO98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773173778; c=relaxed/simple;
	bh=HsJWsaLIR7nlFJIMLlfM97huCJCOsOaJj9GJCCHxsbw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=R5iAdqe851L1plwFdawyibR9T0Vk9CMBah1r4ouIzXF/GP93UG2la7EXSy7gOuobjbe2PYYXA0m9ioCzYIQw+BFG8CZVX5wnViInH1Sg7yE1RAQ9a3QG3fknVSxIVKczH5MsUkeSX6nDPhF9O2ea+Rh70cqXI6KOIXMu+Tr07zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hSQTQIrz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cMvdEuyu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62AIq4i82861861
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 20:16:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ThtO4ff3serJ2iRkNz/z2C
	hnYrwEifPTaTN5R0YXvFU=; b=hSQTQIrz6fM7mQ9FBakAJiHU2KaUO4xKFdeWN9
	6nB8U8OhZDPqKzSpb4632Nkik7LDJxJ8XHt0CSsujXkhisIiShgPlBtKoF3hNaK6
	rjWGQsDzt0kHjfohOtzseFBYpuUaqvYe66Af+qj6RkOrSA2Q7F88PkYW5+J3U8D0
	Tgcnaj54t21qbjrG0HMOl5j1Zji+mAUosy3VNpQGLJUz26I3M/1EOBQuGBjm7I96
	TATJRuy6eIjZ5G2rg+D9YlsovD3CDNNhALtCazGAyHlF3SfvPjBVIJXdobxUFj1E
	lR18/+IeDdw2KCXqUEGcb0Zidx0qZSXjBNodX35OdMFyfB3g==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cte3wb5q9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 20:16:15 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-829bf6406ecso9821424b3a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 13:16:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773173773; x=1773778573; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ThtO4ff3serJ2iRkNz/z2ChnYrwEifPTaTN5R0YXvFU=;
        b=cMvdEuyui9xri+QagcIcwjE3YgVCAEQG2CGSex4jfD6N3FZ/MApY4LgBteRIjmRXe4
         XqH+2q9EwClfS973ROLgUQammfyFgKcbRK7VnXcbt71/Eo4wrBXbC1Nx3zHLce2qzqnq
         riiQdFe509kZ41JD9IQuMSVNeEGRPfNgYYXMZobjcO9acpm6NRNRdj63VU4ng/iNLLSp
         AWPwT5jL+5bAC9PZSRfxEvQE+10Kxcz0cbl3bI3VpPKe0YeaaKOXxDHVlLkc0JNYmHCt
         PPfgpGnwWy/UHNK+lrF9imM0U1pj/TBkrn7xqdlHNgpzc216S70FN9yiyhxMFxX4CaMG
         KaHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773173773; x=1773778573;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ThtO4ff3serJ2iRkNz/z2ChnYrwEifPTaTN5R0YXvFU=;
        b=UoEGPIBwc5aitgcshAG56tahZ2ZoS/WUZftoFodhOySzYAeibHxv0FPWtNJYzxIIOC
         8N1ehGOIaeGCITIdZV+d5mWswP8RmafDuLVfJxaqhEKSxSxb5MQUNsqC6y/ecPyR/CuU
         73yIqQKW2+o9tdzDSHGyS8CrIOOGUeyfxcj/4b22FvC9MFA91q9upNchEaEKaEx4yqEx
         aLWvaH1oqCpQ0JdKk+lxT7FEJkJSssYtfdwCetmbaUnos+ffOIxL4boOwDxkQZj13i6x
         1/so7nSHlm7+hO7Pfn/lgKnq+mxfX7+/ORc+QLJR2WtXDiHZB5FNMC09MFT4HIk9CGO7
         jLRw==
X-Forwarded-Encrypted: i=1; AJvYcCW6dkPEBTK/wk9SeTrNB6s3wpiph978ZSIs5oJtd14xqzi2gO9U8FpUeLYCWdNRaxClbiXYhMENuurr8YtS@vger.kernel.org
X-Gm-Message-State: AOJu0Yxx/RpHv1Mta2JXXqcOrGdwsf3u6TR7g0rMgDqAAeq0t4kvGIcs
	3CnQIvH/SLMUOCNvJEcd5hTuZovPgzy3kp41DHSan7rQM4eOWJd4P9AFtMhBvVXDtSSzUjh1ukZ
	GENQa0xvQgzmYrbwVg5tW16Z79STJ2y+4CPC2H0hMb9pFkuZuEeXpAjyB6b+rdV5YUhZt
X-Gm-Gg: ATEYQzzG2IeEbIXRoY0lKnLB/Sg5XchWqcuqrsOtP93+/9tnrioXMpU8ZhbV7EPoDnN
	zUnnEUFGiooZHWTb3rIEDx1GwqufcaOLmiHK8rHDnVgJp6WswusxD39dYssZpv7BHZg562fZJA5
	hZ5rdplvrKq5jxQy4o72VGM+Zd+4C/m6vegBGYdLCuhSGiHy6BmIbBxP1UgIjs7sMJhSqv82mBH
	8QzT1kqgm23+Fg23QRHrquHnfnHj7GfnEex8gDgd5iqpQOOIHOWXaoZdcmrx7WYiIUxSl0a7QS1
	/4m7fPY0PUAWxmbvYgqSNZAD1l6HxTojXKKIq5lp6mjAQpdZ+NzS7KraxCbFTdczo+W0MC3Oz/Q
	PFkOOVH43+RTemhAcQ60zFPb4Xq/BCXj7xaWpxriFCq+MP04/
X-Received: by 2002:a05:6a00:2350:b0:829:7a37:2bd2 with SMTP id d2e1a72fcca58-829f708a42dmr154395b3a.32.1773173772379;
        Tue, 10 Mar 2026 13:16:12 -0700 (PDT)
X-Received: by 2002:a05:6a00:2350:b0:829:7a37:2bd2 with SMTP id d2e1a72fcca58-829f708a42dmr154331b3a.32.1773173771531;
        Tue, 10 Mar 2026 13:16:11 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829f6dc2d0asm115262b3a.13.2026.03.10.13.15.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 13:16:11 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v2 00/25] Introduce meminspect
Date: Wed, 11 Mar 2026 01:45:44 +0530
Message-Id: <20260311-minidump-v2-v2-0-f91cedc6f99e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPB7sGkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHQUlJIzE
 vPSU3UzU4B8JSMDIzMDY0ND3dzMvMyU0twC3TIj3dTUFIuURDMT8+RUUyWgjoKi1LTMCrBp0bG
 1tQCvVsxvXQAAAA==
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
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
        Konrad Dybcio <konradybcio@kernel.org>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>
Cc: workflows@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
        linux-mm@kvack.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org
X-Mailer: b4 0.14-dev-f7c49
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773173756; l=15333;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=HsJWsaLIR7nlFJIMLlfM97huCJCOsOaJj9GJCCHxsbw=;
 b=GYFA3GGf90pN1s+AgXrT987m/HkJIgWDtfiElDelGeVa7vE2WF/4VfyYg7rukbtWH98n3JyPi
 clOAMzgTL+dBW7UK+DlU7Jiaf4sbl0GOUynL4QYEe1ApcL6YIW3b6DG
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDE3NiBTYWx0ZWRfX5qI+sCzJmW3i
 6M/7DwexVbEcREMJDZ19mgG00BuUBSid/Y0OtCThVH8tShYuRsTCXk/7ZZCMUsJKn5vw3CatOMe
 /nVq1LsiZFQcKL2KJcNPxN9EQM4Kp8fxNhWW2G+3DytPI0o6HkvULAgs3QJICUgw3GQEu9z5GmE
 b9bK5imq7mQEt7Gz8tCz6yI7ihoEOdhfzQCnYmZNyCaQar8iQp6NnlJokKqf+0f2Lz/4CqK+Qn8
 mWg1p+blQ+GTnFJeJCs/srSBs3aovsLjwVCr2yYG0uIOd286pZoQC4KN3AudS+RmA9vclCWEgve
 iNxU3jlx4dG6Kd5nIHtMCHxR09BNhzI2sHRF4gpbkfUZynrXuaSEg4PpmHEdpNGy+HanEwYS9V8
 DpcnMM4yfpBLU4vRnVcE6m5c3uA4GYSjoIoClUZMDwIp7bj4EkwJlmH7UL4cDeqDsv8UR1laI9i
 80b3utG+lag0xe4UntQ==
X-Authority-Analysis: v=2.4 cv=GtFPO01C c=1 sm=1 tr=0 ts=69b07c0f cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=vnREMb7VAAAA:8 a=Oh2cFVv5AAAA:8 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=COk6AnOGAAAA:8 a=bLXd17yOAAAA:8 a=1XWaLZrsAAAA:8 a=Bnchvpk6DWnDitF8NakA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22 a=7KeoIwV6GZqOttXkcoxL:22
 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22 a=XOuVWTVwyKTMzSnUH6Op:22
X-Proofpoint-ORIG-GUID: p9qKvxEibPBup-F0ulXIqkm8Rbj5S05g
X-Proofpoint-GUID: p9qKvxEibPBup-F0ulXIqkm8Rbj5S05g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_04,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100176
X-Rspamd-Queue-Id: 251642578DD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[lwn.net,linuxfoundation.org,linaro.org,arndb.de,kernel.org,gentwo.org,linux-foundation.org,infradead.org,linutronix.de,redhat.com,arm.com,goodmis.org,google.com,suse.de,oracle.com,suse.com,cmpxchg.org,nvidia.com,tencent.com,huaweicloud.com,gmail.com,lge.com,chromium.org,oss.qualcomm.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96749-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,calebs.dev:url,linaro.org:url,qualcomm.com:dkim,googlesource.com:url];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_GT_50(0.00)[57];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

First of all, I want to thank Eugene for his excellent work on this
series. What began as the Qualcomm Minidump driver from me has now
evolved into meminspect. He also presented meminspect a few months ago
at Linux Plumbers 2025.

Video of the recording is available here for anyone interested:
https://www.youtube.com/watch?v=aDZv4-kOLSc

Introduction:

meminspect is a mechanism which allows the kernel to mark specific
memory areas for memory dumping or specific inspection, statistics,
usage.  Once regions are marked, meminspect keeps an internal list with
the regions in a dedicated table.  Further, these regions can be
accessed using specific API by any interested driver.  Regions being
marked beforehand, when the system is up and running, there is no need
nor dependency on a panic handler, or a working kernel that can dump the
debug information.  meminspect can be primarily used for debugging. The
approach is feasible to work when pstore, kdump, or another mechanism do
not.  Pstore relies on persistent storage, a dedicated RAM area or
flash, which has the disadvantage of having the memory reserved all the
time, or another specific non volatile memory. Some devices cannot keep
the RAM contents on reboot so ramoops does not work. Some devices do not
allow kexec to run another kernel to debug the crashed one.  For such
devices, that have another mechanism to help debugging, like firmware,
kmemdump is a viable solution.

meminspect can create a core image, similar with /proc/vmcore, with only
the registered regions included. This can be loaded into crash tool/gdb
and analyzed. This happens if CRASH_DUMP=y.  To have this working,
specific information from the kernel is registered, and this is done at
meminspect init time, no need for the meminspect users to do anything.

This version of the meminspect patch series includes two drivers that
make use of it: one is the Qualcomm Minidump, and the other one is the
Debug Kinfo backend for Android devices, reworked from this source here:
https://android.googlesource.com/kernel/common/+/refs/heads/android-mainline/drivers/android/debug_kinfo.c
written originally by Jone Chou <jonechou@google.com>

*** History, motivation and available online resources ***

The patch series is based on both minidump and kmemdump previous implementations.

After the three RFC kmemdump versions, considering the ML discussions, it was decided to
move this into kernel/ directory and rework it into naming it meminspect, as Thomas Gleixner
suggested.

Initial version of kmemdump and discussion is available here:
https://lore.kernel.org/lkml/20250422113156.575971-1-eugen.hristev@linaro.org/

Kmemdump has been presented and discussed at Linaro Connect 2025,
including motivation, scope, usability and feasability.
Video of the recording is available here for anyone interested:
https://www.youtube.com/watch?v=r4gII7MX9zQ&list=PLKZSArYQptsODycGiE0XZdVovzAwYNwtK&index=14

Linaro blog on kmemdump can be found here:
https://www.linaro.org/blog/introduction-to-kmemdump/

Linaro blog on kmemdump step by stem using minidump backend is available here:
https://www.linaro.org/blog/kmemdump-step-by-step-on-qualcomm-automotive-platform/

The implementation is based on the initial Pstore/directly mapped zones
published as an RFC here:
https://lore.kernel.org/all/20250217101706.2104498-1-eugen.hristev@linaro.org/

The back-end implementation for qcom_minidump is based on the minidump
patch series and driver written by Mukesh Ojha, thanks:
https://lore.kernel.org/lkml/20240131110837.14218-1-quic_mojha@quicinc.com/

The RFC v2 version with .section creation and macro annotation kmemdump
is available here:
https://lore.kernel.org/all/20250724135512.518487-1-eugen.hristev@linaro.org/

The RFC v3 version with making everything static, which was pretty much rejected due to
all reasons discussed on the public ML:
https://lore.kernel.org/all/20250912150855.2901211-1-eugen.hristev@linaro.org/

*** How to use meminspect with minidump backend on Qualcomm platform guide ***

Prerequisites:
Crash tool compiled with target=ARM64 and minor changes required for
usual crash mode (minimal mode works without the patch) **A patch can be
applied from here https://p.calebs.dev/1687bc ** This patch will be
eventually sent in a reworked way to crash tool.

Target kernel must be built with : CONFIG_DEBUG_INFO_REDUCED=n ; this
will have vmlinux include all the debugging information needed for crash
tool.

Also, the kernel requires these as well: CONFIG_MEMINSPECT,
CONFIG_CRASH_DUMP and the driver CONFIG_QCOM_MINIDUMP

Kernel arguments: Kernel firmware must be set to mode 'mini' by kernel
module parameter like this : qcom_scm.download_mode=mini

After the kernel boots, and minidump module is loaded, everything is
ready for a possible crash.

Once the crash happens, the firmware will kick in and you will see on
the console the message saying Sahara init, etc, that the firmware is
waiting in download mode. (this is subject to firmware supporting this
mode, I am using sa8775p-ride board)

Example of log on the console:
"
[...]
B -   1096414 - usb: init start
B -   1100287 - usb: qusb_dci_platform , 0x19
B -   1105686 - usb: usb3phy: PRIM success: lane_A , 0x60
B -   1107455 - usb: usb2phy: PRIM success , 0x4
B -   1112670 - usb: dci, chgr_type_det_err
B -   1117154 - usb: ID:0x260, value: 0x4
B -   1121942 - usb: ID:0x108, value: 0x1d90
B -   1124992 - usb: timer_start , 0x4c4b40
B -   1129140 - usb: vbus_det_pm_unavail
B -   1133136 - usb: ID:0x252, value: 0x4
B -   1148874 - usb: SUPER , 0x900e
B -   1275510 - usb: SUPER , 0x900e
B -   1388970 - usb: ID:0x20d, value: 0x0
B -   1411113 - usb: ENUM success
B -   1411113 - Sahara Init
B -   1414285 - Sahara Open
"

Once the board is in download mode, you can use the qdl tool (I
personally use edl , have not tried qdl yet), to get all the regions as
separate files.  The tool from the host computer will list the regions
in the order they were downloaded.

Once you have all the files simply use `cat` to put them all together,
in the order of the indexes.  For my kernel config and setup, here is my
cat command : (you can use a script or something, I haven't done that so
far):

`cat md_KELF1.BIN md_Kvmcorein2.BIN md_Kconfig3.BIN \
md_Ktotalram4.BIN md_Kcpu_poss5.BIN md_Kcpu_pres6.BIN \
md_Kcpu_onli7.BIN md_Kcpu_acti8.BIN md_Kmem_sect9.BIN \
md_Kjiffies10.BIN md_Klinux_ba11.BIN md_Knr_threa12.BIN \
md_Knr_irqs13.BIN md_Ktainted_14.BIN md_Ktaint_fl15.BIN \
md_Knode_sta16.BIN md_K__per_cp17.BIN md_Knr_swapf18.BIN \
md_Kinit_uts19.BIN md_Kprintk_r20.BIN md_Kprintk_r21.BIN \
md_Kprb22.BIN md_Kprb_desc23.BIN md_Kprb_info24.BIN \
md_Kprb_data25.BIN  md_Khigh_mem26.BIN md_Kinit_mm27.BIN \
md_Kunknown29.BIN md_Kunknown30.BIN md_Kunknown31.BIN \
md_Kunknown32.BIN md_Kunknown33.BIN md_Kunknown34.BIN \
md_Kunknown35.BIN md_Kunknown37.BIN \
md_Kunknown38.BIN md_Kunknown39.BIN md_Kunknown40.BIN \
md_Kunknown41.BIN md_Kunknown42.BIN md_Kunknown43.BIN \
md_Kunknown44.BIN md_Kunknown45.BIN  md_Kunknown46.BIN \
md_Kunknown47.BIN md_Kunknown48.BIN md_Kunknown49.BIN \
md_Kunknown50.BIN md_Kunknown51.BIN md_Kunknown52.BIN \
md_Kunknown53.BIN md_Kunknown54.BIN   > ./minidump_image`

Once you have the resulted file, use `crash` tool to load it, like this:
`./crash --no_modules --no_panic --no_kmem_cache --zero_excluded vmlinux minidump_image`

There is also a --minimal mode for ./crash that would work without any patch applied
to crash tool, but you can't inspect symbols, etc.

Once you load crash you will see something like this :
      KERNEL: minidump/20260310-235110/vmlinux  [TAINTED]
    DUMPFILE: ./minidump/20260310-235110/minidump_image
        CPUS: 8 [OFFLINE: 7]
        DATE: Thu Jan  1 05:30:00 +0530 1970
      UPTIME: 00:00:27
       TASKS: 0
    NODENAME: qemuarm64
     RELEASE: 7.0.0-rc3-next-20260309-00028-g528b3c656121
     VERSION: #5 SMP PREEMPT Tue Mar 10 18:18:41 UTC 2026
     MACHINE: aarch64  (unknown Mhz)
      MEMORY: 0
       PANIC: "Kernel panic - not syncing: sysrq triggered crash"

crash> log
[    0.000000] Booting Linux on physical CPU 0x0000000000 [0x514f0014]
[    0.000000] Linux version 7.0.0-rc3-next-20260309-00028-g528b3c656121 (@21e3bca4168f) (aarch64-linux-gnu-gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0, GNU ld (GNU Binutils for Ubuntu) 2.42) #5 SMP PREEMPT Tue Mar 10 18:18:41 UTC 2026

*** Debug Kinfo backend driver ***
I need help with the testing of this driver, Anyone who actually wants
to test this, feel free to reply to the patch. we have also written a
simple DT binding for the driver.

Thanks in advance for the review, and apologies if I missed addressing any comment.

-Mukesh 

Changes in v2: https://lore.kernel.org/lkml/20251119154427.1033475-1-eugen.hristev@linaro.org/
 - Fixed doc warnings
 - Fixed kernel-test robot warnings.
 - Took Mike suggestion to remove mark inspect flag for dynamic memory.
 - Added R-b for printk patch.
 - Modified some commit messages for clarity.
 - corrected binding change for debug-kinfo as per Rob suggestion.

Changelog for meminspect v1:
- rename to meminspect
- start on top of v2 actually, with the section and all.
- remove the backend thing, change the API to access the table
- move everything to kernel/
- add dependency to CRASH_DUMP instead of a separate knob
- move the minidump driver to soc/qcom
- integrate the meminspect better into memblock by using a new memblock flag
- minor fixes : use dev_err_probe everywhere, rearrange variable declarations,
remove some useless code, etc.

Changelog for RFC v3:
- V2 available here : https://lore.kernel.org/all/20250724135512.518487-1-eugen.hristev@linaro.org/
- Removed the .section as requested by David Hildenbrand.
- Moved all kmemdump registration(when possible) to vmcoreinfo.
- Because of this, some of the variables that I was registering had to be non-static
so I had to modify this as per David Hildenbrand suggestion.
- Fixed minor things in the Kinfo driver: one field was broken, fixed some
compiler warnings, fixed the copyright and remove some useless includes.
- Moved the whole kmemdump from drivers/debug into mm/ and Kconfigs into mm/Kconfig.debug
and it's now available in kernel hacking, as per Randy Dunlap review
- Reworked some of the Documentation as per review from Jon Corbet

Changelog for RFC v2:
- V1 available here: https://lore.kernel.org/lkml/20250422113156.575971-1-eugen.hristev@linaro.org/
- Reworked the whole minidump implementation based on suggestions from Thomas Gleixner.
This means new API, macros, new way to store the regions inside kmemdump
(ditched the IDR, moved to static allocation, have a static default backend, etc)
- Reworked qcom_minidump driver based on review from Bjorn Andersson
- Reworked printk log buffer registration based on review from Petr Mladek

I appologize if I missed any review comments.
Patches are sent on top on next-20260309 tag

---
Eugen Hristev (21):
      kernel: Introduce meminspect
      init/version: Annotate static information into meminspect
      mm/percpu: Annotate static information into meminspect
      cpu: Annotate static information into meminspect
      genirq/irqdesc: Annotate static information into meminspect
      timers: Annotate static information into meminspect
      kernel/fork: Annotate static information into meminspect
      mm/page_alloc: Annotate static information into meminspect
      mm/show_mem: Annotate static information into meminspect
      mm/swapfile: Annotate static information into meminspect
      kernel/vmcore_info: Register dynamic information into meminspect
      kernel/configs: Register dynamic information into meminspect
      mm/init-mm: Annotate static information into meminspect
      panic: Annotate static information into meminspect
      kallsyms: Annotate static information into meminspect
      mm/mm_init: Annotate static information into meminspect
      sched/core: Annotate runqueues into meminspect
      remoteproc: qcom: Move minidump data structures into its own header
      soc: qcom: Add minidump backend driver
      soc: qcom: smem: Add minidump platform device
      meminspect: Add debug kinfo compatible driver

Mukesh Ojha (4):
      mm/numa: Register node data information into meminspect
      mm/sparse: Register information into meminspect
      printk: Register information into meminspect
      dt-bindings: reserved-memory: Add Google Kinfo Pixel reserved memory

 Documentation/dev-tools/index.rst                  |   1 +
 Documentation/dev-tools/meminspect.rst             | 144 +++++++
 .../bindings/reserved-memory/google,kinfo.yaml     |  46 ++
 MAINTAINERS                                        |  14 +
 drivers/of/platform.c                              |   1 +
 drivers/remoteproc/qcom_common.c                   |  56 +--
 drivers/soc/qcom/Kconfig                           |  13 +
 drivers/soc/qcom/Makefile                          |   1 +
 drivers/soc/qcom/minidump.c                        | 272 ++++++++++++
 drivers/soc/qcom/smem.c                            |  10 +
 include/asm-generic/vmlinux.lds.h                  |  13 +
 include/linux/meminspect.h                         | 263 ++++++++++++
 include/linux/soc/qcom/minidump.h                  |  72 ++++
 init/Kconfig                                       |   1 +
 init/version-timestamp.c                           |   3 +
 init/version.c                                     |   3 +
 kernel/Makefile                                    |   1 +
 kernel/configs.c                                   |   6 +
 kernel/cpu.c                                       |   5 +
 kernel/fork.c                                      |   3 +
 kernel/irq/irqdesc.c                               |   2 +
 kernel/kallsyms.c                                  |   9 +
 kernel/meminspect/Kconfig                          |  30 ++
 kernel/meminspect/Makefile                         |   4 +
 kernel/meminspect/kinfo.c                          | 284 +++++++++++++
 kernel/meminspect/meminspect.c                     | 471 +++++++++++++++++++++
 kernel/panic.c                                     |   4 +
 kernel/printk/printk.c                             |  11 +
 kernel/sched/core.c                                |   2 +
 kernel/time/timer.c                                |   2 +
 kernel/vmcore_info.c                               |   4 +
 mm/init-mm.c                                       |  11 +
 mm/mm_init.c                                       |   2 +
 mm/numa.c                                          |   2 +
 mm/page_alloc.c                                    |   2 +
 mm/percpu.c                                        |   2 +
 mm/show_mem.c                                      |   2 +
 mm/sparse.c                                        |   6 +
 mm/swapfile.c                                      |   2 +
 39 files changed, 1725 insertions(+), 55 deletions(-)
---
base-commit: 343f51842f4ed7143872f3aa116a214a5619a4b9
change-id: 20260311-minidump-v2-eed8da647ce5

Best regards,
-- 
-Mukesh Ojha


