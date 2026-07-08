Return-Path: <linux-arm-msm+bounces-117497-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 36zMF8HiTWqw/gEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117497-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 07:40:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EE21E721F3C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 07:40:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=inU1ARyo;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=gXaXwxzd;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117497-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117497-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E3915303C026
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 05:37:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68D6B3BFE34;
	Wed,  8 Jul 2026 05:37:48 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 888863BBFC3
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 05:37:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783489068; cv=none; b=azuNmMGRB6ibU8d86tT7zUp0Kwr9i3qE4XeIB+o380kWkegYkjy1DeSPZWm5DKJT9fczY0r1G/OmYlhXWQ6O8HBEKJldhaPKVDFC1gMlXdgh0etFacqzlmiMRLIA/Xq8dtbM+OsZ+YnPEYQBRV8rOGXNLC6k2K0wo2uH4jxXRIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783489068; c=relaxed/simple;
	bh=zaV3PbmFUtDnw62zQ3JXo0ZBeG6yDbJIOwaDAH/EVmo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IeYr2fO4lZ+mjrJ/L2YMs/cfqD5tbi0szW/YYwL8WfcpIn/ZPhpKFMqdLnWtd1p8N7soxNjhDvmTKMCyInjcWIc/TRn8fD2CZrRyMlp86Qiq/ac1gDItSb8JmAJSG1Z9RaAxDokq0CYgbWkLCMSfXMBaB9jz6lKwOauEd2SNy/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=inU1ARyo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gXaXwxzd; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66842Obh1572970
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Jul 2026 05:37:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UVx2Ot4wYHE/kJppGaGF3PrkXXYmH0DCSaT02ef7IcY=; b=inU1ARyoLJAPAbw/
	BjRBXXcr9iSgHE6aynnOtdyQe7dqf3MeI15Yj05HHjTJ9F9ULi9aha9ooZYbXB/Z
	Fv9LDPqVG622oRLW/U1jPwzaFl2OgGK6roZTmy0mtmmf0Xzr/VXlyiF5+OAd03yN
	gX9/C5lEZpNszlb7U84WBlG9WyLucbwAnQ3yY3R2n1sJ6PygSllh+n7LFQLi8TdF
	vNMwrAkymelKH0GuXqux1js0UUqyDCPux6IVl1l6CwprwTGsK2pFmg+dxOZRiYDl
	/tu3f3ExCgBlNu/F2zkV3a9RGN31KdEFe6fw57OUKejVgfbign0bZ8Lv5sU0jU1L
	HcmNeg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f99hgsj42-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 05:37:45 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8423f1fe39eso665240b3a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 22:37:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783489065; x=1784093865; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UVx2Ot4wYHE/kJppGaGF3PrkXXYmH0DCSaT02ef7IcY=;
        b=gXaXwxzd7QSQiMJx4mJfu0Hk5eU53KNq8h9wT10tgsIMtXnKtKmrp+oaN7zQrmx0Lz
         y9M3KiEMhcPiTEvXTg2FKcQWZUzW52TsJKHeZB8pVC0fKZKQKRgLerPbyUN241yuEDPt
         uPiAjybjpb4jCqghCy2alfrml5bqNSklKd5eWcSbG53iorkrmH3SZBruUCpsb2CQO+3r
         BuiVvz5XqrJPaifrLRtHV/fPw8fhg17zlAvvmcbY5+Cmrbw6xYTkpCkpzG6ZfXprAVhO
         15yIhfkAmL91tSFhVTqxbe3+MfK9Sk1rD23M/ZsuW2RNd45wbbcwLTKF/fCSwmiAW2aq
         n5mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783489065; x=1784093865;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UVx2Ot4wYHE/kJppGaGF3PrkXXYmH0DCSaT02ef7IcY=;
        b=LDb1J9kbD2R6SxQmuKllGbMPKEQgDyqK3Y9YqIoRO6w71OceMsJu36HkRTHCQORoM3
         QvIwbXBUmWkqsbIjDaMFRIWZle48dx5Ja/X32TZJRE1TckqpGwsGnqQW7IOjs418NEvX
         AeBO9NAHzJcPJX6BtUjc2tEb/t7iXNtAUValPH4Wc7zYYUjroKU10qeCBLb3HtuCIzIU
         CI85YT+uN9wH/AY3HRkkcVQYEXD4mUs7YgbLBtYtOVf2siQ/OnlM2dX76Ubh6rx6R/8q
         VUqfhAUbYwsOjSo+FOxq1AkFc0Nt5dtu0C+gfwjjZ3GodMsqkVuxMkpWNj85zrS8ze26
         vGlQ==
X-Forwarded-Encrypted: i=1; AHgh+RrORlFU8WKsUyV/MLKBA7ozAn1mDZkK3+NoO3/o7+qH76NQwIsJ86/2aDuNK1/SL2AWhhUmn7Axg4DJsk/Q@vger.kernel.org
X-Gm-Message-State: AOJu0YwJVdPpT7gFDKSCycvyJGhtuL96UgZTksSyDWDDToAB18T8gov4
	aCJYzoVkz4Tf2bdxVmWUpmaJM0YC6aWgkWGA6PMoA/f+AhUQ6t96nXtrSebx6ewQRBdEj5FgdOC
	Hw8DYT0+wQiP12/anDNJEdgIPU7QJBojWk2NqxxQahybfy8ag1MJXgU50hiF9LfwbH9F1
X-Gm-Gg: AfdE7ckYXrtWxZB7+vAjxC4eqfv6t42fR4tCUy8IQRa0zV4XdHyaVmGPUIOLK2DZYNf
	oVeoSJpwS98ginOHF29cheEN4Xn0fatTH9D8SXPad/8Ji7CvBKF+2qfPZkYuJiGCprFRzzheKHP
	fmVqzWL+rZCy2uwVyZUo+Mhi87qoKPPLSO3WpoMwBFspD+wNhEK/zbUv4cdNCvV3IWJ7/4liU1o
	yvikEq2LHIFhvQZzJNu2o6qUo08RCXvAnc8k1YxRrVEYjluyANH0TrbW9K5g5WPWilExHTgjSgR
	nArzTk+H8aObMn5l5w1Lm6xQk48JHyqHRs8T33s+8mOjKWPB1I0uCOYsOSpIfXPGli+MEx8HD56
	kHPHBlLJDAwU/dB963oDfAFlMy/UF+XO4ZoN3ng==
X-Received: by 2002:a05:6a00:4106:b0:845:d284:9e10 with SMTP id d2e1a72fcca58-848438c848amr1258932b3a.55.1783489064381;
        Tue, 07 Jul 2026 22:37:44 -0700 (PDT)
X-Received: by 2002:a05:6a00:4106:b0:845:d284:9e10 with SMTP id d2e1a72fcca58-848438c848amr1258874b3a.55.1783489063825;
        Tue, 07 Jul 2026 22:37:43 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6db29d1sm6484592b3a.53.2026.07.07.22.37.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 22:37:43 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Wed, 08 Jul 2026 11:02:00 +0530
Subject: [PATCH v3 21/26] printk: Register information into meminspect
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-meminspect-v3-v3-21-7aa5a0a74d5c@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783488714; l=2254;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=zaV3PbmFUtDnw62zQ3JXo0ZBeG6yDbJIOwaDAH/EVmo=;
 b=YjEBg3cAlPVuq1xhCmIAiTNcWWeuFlgSHOCYG43WEd1GLttZDwSktzjEnZl0RMIdqfCDXEr21
 C1QgDxuT5KPDakO6+ATEc2L8W3i3ckHvvSzSZ0yPJJB0VegO27FDpYe
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-GUID: lk1z89T2uyj1CSklMNv3jStaia4xY-rD
X-Authority-Analysis: v=2.4 cv=CviPtH4D c=1 sm=1 tr=0 ts=6a4de229 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=iox4zFpeAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=ZWDwVrzm9O4pBL7d_cQA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22 a=WzC6qhA0u3u7Ye7llzcV:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: lk1z89T2uyj1CSklMNv3jStaia4xY-rD
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDA1MCBTYWx0ZWRfXxIrJsjhDT/7o
 b857fNDk9wrrN1+jCV9mqRBS0GAbHEzX/cgbRgXlGN1sFbvJXEpgGmOIhLb0+Y/13rrp7CDHwty
 g9yHqPQxMHp3lpN3hGwshHoLgjVyVVg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDA1MCBTYWx0ZWRfX8+2gmYEB2NtN
 BQfyr7+zx+hd9icvDDRi59LwWNJ90yItgXOxO0L/OtH8Ke9sIUXLuIbWofR4cEyofl21ShdoBXh
 BXhcneGxD5RRykcWYLNKgQ3hMBhsOJiWvUPSMVWw5id1n3Dx7XhDhC97CCBU/ZVXpISEdaEs6bv
 /C4nJoIQZFIlzdV8NfnhFeQz2WbIl87DnwjaeJ7L2MqxdrFFPxset20uxW9PoA3pqwFTmVN/f00
 SJ3/KOVO4Yyn2NY+6RLYnwNSYDpwHN8SdPX6I0JGYqz8U4NyoE/Q5VW+8C3pSHNohR5Xn7GLl5D
 c3pd8rVVkuP8P9A8M1VgeXxmeUjz/N78bPsQlh4tuv1n0Wfakiw0EsN+W2B2H232wKHJ0ODWHx0
 nW+ANNcAW7rbbQldISWX3FL2hOHIJI2o3mDbIqoAtd24kgjvxYoYJxxw0Jy3ovbMaUKijXJYCv+
 WgAIGHgP1ETmxagT8Cw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_06,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0
 adultscore=0 priorityscore=1501 phishscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080050
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-117497-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:ehristev@kernel.org,m:mukesh.ojha@oss.qualcomm.com,m:arnd@arndb.de,m:dennis@kernel.org,m:tj@kernel.org,m:cl@gentwo.org,m:akpm@linux-foundation.org,m:tglx@kernel.org,m:peterz@infradead.org,m:anna-maria@linutronix.de,m:frederic@kernel.org,m:jstultz@google.com,m:sboyd@kernel.org,m:kees@kernel.org,m:mingo@redhat.com,m:juri.lelli@redhat.com,m:vincent.guittot@linaro.org,m:dietmar.eggemann@arm.com,m:rostedt@goodmis.org,m:bsegall@google.com,m:mgorman@suse.de,m:vschneid@redhat.com,m:kprateek.nayak@amd.com,m:david@kernel.org,m:ljs@kernel.org,m:liam@infradead.org,m:vbabka@kernel.org,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:jackmanb@google.com,m:hannes@cmpxchg.org,m:ziy@nvidia.com,m:chrisl@kernel.org,m:kasong@tencent.com,m:shikemeng@huaweicloud.com,m:nphamcs@gmail.com,m:baoquan.he@linux.dev,m:baohua@kernel.org,m:youngjun.park@lge.com,m:pmladek@suse.com,m:john.ogness@linutronix.de,m:senozhatsky@chromium.org,m
 :andersson@kernel.org,m:mathieu.poirier@linaro.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:saravanak@kernel.org,m:workflows@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arch@vger.kernel.org,m:linux-mm@kvack.org,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:devicetree@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[lwn.net,linuxfoundation.org,kernel.org,oss.qualcomm.com,arndb.de,gentwo.org,linux-foundation.org,infradead.org,linutronix.de,google.com,redhat.com,linaro.org,arm.com,goodmis.org,suse.de,amd.com,suse.com,cmpxchg.org,nvidia.com,tencent.com,huaweicloud.com,gmail.com,linux.dev,lge.com,chromium.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,linaro.org:email,vger.kernel.org:from_smtp,linutronix.de:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_GT_50(0.00)[61];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EE21E721F3C

Annotate vital static, dynamic information into meminspect for debugging

Static:
 - prb_descs
 - prb_infos
 - prb
 - prb_data
 - clear_seq
 - printk_rb_static
 - printk_rb_dynamic

Dynamic:
 - new_descs
 - new_infos
 - new_log_buf

meminspect uses a different API to annotate variables for inspection,
and information about these variables is stored in the inspection table.

Reviewed-by: Petr Mladek <pmladek@suse.com>
Co-developed-by: Eugen Hristev <eugen.hristev@linaro.org>
Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
Reviewed-by: John Ogness <john.ogness@linutronix.de>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 kernel/printk/printk.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index 2fe9a963c823..f7f32c09b9b8 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -49,6 +49,7 @@
 #include <linux/sched/debug.h>
 #include <linux/sched/task_stack.h>
 #include <linux/panic.h>
+#include <linux/meminspect.h>
 
 #include <linux/uaccess.h>
 #include <asm/sections.h>
@@ -518,10 +519,17 @@ static u32 log_buf_len = __LOG_BUF_LEN;
 #endif
 _DEFINE_PRINTKRB(printk_rb_static, CONFIG_LOG_BUF_SHIFT - PRB_AVGBITS,
 		 PRB_AVGBITS, &__log_buf[0]);
+MEMINSPECT_NAMED_ENTRY(prb_descs, _printk_rb_static_descs);
+MEMINSPECT_NAMED_ENTRY(prb_infos, _printk_rb_static_infos);
+MEMINSPECT_NAMED_ENTRY(prb_data, __log_buf);
+MEMINSPECT_SIMPLE_ENTRY(printk_rb_static);
 
 static struct printk_ringbuffer printk_rb_dynamic;
+MEMINSPECT_SIMPLE_ENTRY(printk_rb_dynamic);
 
 struct printk_ringbuffer *prb = &printk_rb_static;
+MEMINSPECT_SIMPLE_ENTRY(prb);
+MEMINSPECT_SIMPLE_ENTRY(clear_seq);
 
 /*
  * We cannot access per-CPU data (e.g. per-CPU flush irq_work) before
@@ -1238,6 +1246,10 @@ void __init setup_log_buf(int early)
 
 	local_irq_restore(flags);
 
+	meminspect_lock_register_va(new_log_buf, new_log_buf_len);
+	meminspect_lock_register_va(new_descs, new_descs_size);
+	meminspect_lock_register_va(new_infos, new_infos_size);
+
 	/*
 	 * Copy any remaining messages that might have appeared from
 	 * NMI context after copying but before switching to the

-- 
2.53.0


