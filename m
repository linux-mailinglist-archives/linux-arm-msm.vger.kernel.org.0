Return-Path: <linux-arm-msm+bounces-117492-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nHAADyfjTWrR/gEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117492-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 07:41:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C3F69721FA8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 07:41:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=bY7gB7vt;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=MsgKTG+r;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117492-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117492-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 161FC30419E3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 05:36:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB9FE3BCD38;
	Wed,  8 Jul 2026 05:36:44 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66DC53BBFBB
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 05:36:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783489004; cv=none; b=bgD0A2tAWGs5S6ZJhg04QwJ7IlY0kWcRSvJOfsYV5Iwj1G4eCEkn+E3Z3MYU13RtSX6K8Nw5USOyCpjbbqcoqVlfz+haJaJwm5DFBcuDULsVLwdqGu+4eTC70ZDHQnohZIa2NTOaQNFZULVHJnkkuSpz6XPhW1yw0DwV62GgxIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783489004; c=relaxed/simple;
	bh=6zWg2efwvk7/IxI9WkFGX94qU9nMXnZuURGzm95EFMw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VIepqPAfX5jTGyBegaHJAK10GczP9OanJq+b4EqTyz4c71dEoJkQYWHSI9SzC7RgXNzjRSR7ZdiRnpqQJOmxvbbhs7rcUFsismED2ueiOj36TOCXeUrRznYp6FJyJy8vT26fHZ9iRsHBvXVgd4Q9ztSZZSGa0LRZx3bOFdg011Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bY7gB7vt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MsgKTG+r; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66842UTo1638163
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Jul 2026 05:36:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UqTfYZuS5v9TxvWd8p5QVvgMLn1YG1IPnoC+xwtJa7I=; b=bY7gB7vtGS8iufzp
	Aps8jeKcX4XgrAJWi3U8RG1DNWLmc23/ZS5++izX2zXirGVrH7nHEhYlRn42vY6i
	wGhTFMamIDLJoj3sUgqu6VBwoxT7ZVJGKkPInUh/xbag4Ja8O3yK2XKc0m2L2zfg
	kB15s+RoFoP4iezQSUzk8iCZFz6w+ddGEwklrZMf2jkdbOd7U2f5I64Vo2EZHR45
	6coNpwsO3rlnQuL9jAqb6b3WJUSaMRwvXcM2wNosfqs+DnOyFsS37ELYHTE3QCn5
	8qwWqZ91PSGQzaQV8mWRyyzhsc8FQ06P9/r9HAG/4mej+cAA2O4p9EyHAW2D28g2
	uSjXMw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9c6a8y1e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 05:36:42 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8482b95574dso413576b3a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 22:36:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783489001; x=1784093801; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UqTfYZuS5v9TxvWd8p5QVvgMLn1YG1IPnoC+xwtJa7I=;
        b=MsgKTG+rAZvOnOYtL0AcU0Pjo73lESfzBY0jto/GhrgZlrsnxiD9iGpAPmdAB0iFVp
         jRa0FCKKlZ0G7nsonzcie/W7MCqSVtMqpBi51lBWtU8EqRSrfd6YMUWYPh0/Bf3cbZEX
         D6LocBv+pLU5KdIZBjhJ5IXfXGZf7/LNE9/O+EyqdrnrgVQA6NRjI2705zgx3wsf6Txb
         K8U9ztB+zmkXVwYSoiN3kj6thtX35ZrGRfCipgxvY/jktcZDUsTREYFZZ2V5TTKo+rlY
         yaq4UxqZQludDgalL/2sa1G0Ia/2j+Sob5lZPKKLdZjpBcytsZkBjIRK/8K1b8WT4Hb7
         gEwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783489001; x=1784093801;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UqTfYZuS5v9TxvWd8p5QVvgMLn1YG1IPnoC+xwtJa7I=;
        b=jxTP3RGKMzeCM3y9YYqbMJdGTOjEiZ/2SO1Kifb8djUPBQv4vy0Yy8PnlQAlDMeG5e
         bTflfvHq96kZwZ7yVTZ90bznbP/llEfXn/aKLr5XDuIGY7mBzdAonsDjkjKUy9RDXqcR
         +Xv5+LG99Nk2AStsM26uFV6ch5QgLgbldmpKH1hV6j+2QVwJARRtwuLhCeiSEgaXppTP
         I7ipZe2VP0Ao0MnIEWPRIO9yeNIFWfo27iOBCusVuTLdCMu1pDDBmwjcl72eMqW8WBfm
         F6YCvfljruVZfDUB4uAp+xYlWfnxOh6yjCuXV8RWrT6get3W0jO0HFMnuDPrzdAX73a8
         Y9cw==
X-Forwarded-Encrypted: i=1; AHgh+RrkICTlOPIGnSFnY2p1i1VVPKhNsrqu5sKlzRN+YTxhXkdARnau2bwQxdt638ChM6PI26T7q/BiUAJ1z9Qu@vger.kernel.org
X-Gm-Message-State: AOJu0YxB6/wyMPCBDvRKsUltcukMM4Jguf/cw+ksDScI4LJ9eOHpXVF2
	Eb0/hCy7TY1mmhoeKA5QGOuCIZmWrHrtmsxxPvTQppQ3l5qczxehnP2up8T6Ak1B2c1GAqA3pdx
	dk10a+t3W4Tz4BN+7UoUPvPyT9Z+l1xHuEu1lislUzPJ5sw6iW/b7yfpz2/GDsSzFops0
X-Gm-Gg: AfdE7cmf2bd5tpGHNHI1BL+ZvPiXrc//mGKw4OvffbhtekcmjTqfYo9QP0/WBB4dD+R
	tyfkf79gfoJVRiHbi5a+9WzSNfzqbe3GYzDW4Sa93SI5yP+ZfGxwTBTMBi54M4WB95qs+PF7TGS
	R51BIvSMy0y0iRbpABE2dFuuln3YOzay/9SAvTOlNU++djYalOCVgDswWvrSnSWdkztRR136FLZ
	HzlVfsxM1VggZaZ3S2bFKpxktU73Kw678NMt3JWZtjFAvli7iKsZUuTxLjXzFEHX+B3mPAKrbgo
	aOLVEvUiEeijpiMDubsERsvnx7O9s5j6znl5EXRkhJaiwJXTFDbF7aZSEBP3SnbK1cLsyeJP3Vs
	NMsSabjjVokjG7mWRT1NzwuL/zo2ECTflLAhiiw==
X-Received: by 2002:a05:6a00:2e88:b0:848:2f71:b661 with SMTP id d2e1a72fcca58-84843000749mr1202850b3a.76.1783489001227;
        Tue, 07 Jul 2026 22:36:41 -0700 (PDT)
X-Received: by 2002:a05:6a00:2e88:b0:848:2f71:b661 with SMTP id d2e1a72fcca58-84843000749mr1202755b3a.76.1783489000489;
        Tue, 07 Jul 2026 22:36:40 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6db29d1sm6484592b3a.53.2026.07.07.22.36.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 22:36:40 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Wed, 08 Jul 2026 11:01:56 +0530
Subject: [PATCH v3 17/26] mm/mm_init: Annotate static information into
 meminspect
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-meminspect-v3-v3-17-7aa5a0a74d5c@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783488714; l=909;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=4qnpCkPRiE5CsuQx1UWQEXlwAhSangPKX8XiWfRWTRE=;
 b=z97EtvKBT6y9k21SRqlalAiHkntvPI/WQIsgr0jHNuEecXk60Tdz+odDPSt9xKDoeipWusU9X
 d9152pff/1jClPE14SdlYcsdmZc6dXry9myPmuVfXbE/BcULjts2es9
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDA1MCBTYWx0ZWRfX2UEN6PKoznpu
 WPkLNej4SLxtWQ8++oer3FZ7H0Sh3c2YlZX3nqk5TO1hC/eBq06pA4OXFg4mZB2ijyexyNqKh62
 cp0kn9HsnS4Do7hNXJnPJQYepcxk9FOskze7jV+shqP7qFTZbMXNsa9qa36eyVoPRecgsm7qHcx
 gc/EL+fsxrGJvFIrtUsJtCxj7gGnbaQu3JxhiyrJugDENF9I4xDe6dasOws33RZR9UqSRK0mgcu
 J23yiZqNsolAB02nCVqT4D8xKAaiYRr23+3+a1hvBSsHaUPCuRCx3exuheYiK9baPhcksrNyNpt
 RAbgm4kcB6sMISsLiOplLT+2+JuuYts8RN5CcRws8MvtKQnMxopxExYwjbWeyF1o8+/qnxcSg2F
 Vy4qUuApZ5sEBbHH6iVVYn8VVGlBg1m3MsbuUZXPiCy8UYTp3JtANl7cBG0xoFiDBVyf1rH35sd
 r22gFJdJXzL3B/xo5yg==
X-Proofpoint-ORIG-GUID: CUVnFSV54-pArgGtHHYBHWfEHetYyzW5
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDA1MCBTYWx0ZWRfX4+dzDzWPtOTK
 W7ZsW8IiTo1qHLtKXetyDfTsmdcZYCjbUz5sRAwDRLxWqUNwxLGk3tF18avmTgWjboDioa3YIMv
 2YxqCQSTevJimYG5OXjXaMXp5+ryLpU=
X-Authority-Analysis: v=2.4 cv=UehhjqSN c=1 sm=1 tr=0 ts=6a4de1ea cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=R-PfVeyQBJMsRd_P_MAA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: CUVnFSV54-pArgGtHHYBHWfEHetYyzW5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_06,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607080050
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
	TAGGED_FROM(0.00)[bounces-117492-lists,linux-arm-msm=lfdr.de];
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
X-Rspamd-Queue-Id: C3F69721FA8

From: Eugen Hristev <ehristev@kernel.org>

Annotate vital static information into inspection table:
 - high_memory

Information on these variables is stored in a dedicated meminspect
section.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 mm/mm_init.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/mm/mm_init.c b/mm/mm_init.c
index 3ff2e90aa17a..d98b6071d2a1 100644
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@ -32,6 +32,7 @@
 #include <linux/vmstat.h>
 #include <linux/kexec_handover.h>
 #include <linux/hugetlb.h>
+#include <linux/meminspect.h>
 #include "internal.h"
 #include "page_alloc.h"
 #include "slab.h"
@@ -53,6 +54,7 @@ EXPORT_SYMBOL(mem_map);
  */
 void *high_memory;
 EXPORT_SYMBOL(high_memory);
+MEMINSPECT_SIMPLE_ENTRY(high_memory);
 
 unsigned long zero_page_pfn __ro_after_init;
 EXPORT_SYMBOL(zero_page_pfn);

-- 
2.53.0


