Return-Path: <linux-arm-msm+bounces-117479-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id oJGRKiXhTWoP/gEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117479-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 07:33:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 031B7721D53
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 07:33:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=A7BSBhmn;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Xg7cziYx;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117479-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117479-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D3440300A8DA
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 05:33:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D6823BBA08;
	Wed,  8 Jul 2026 05:33:17 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A69F377558
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 05:33:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783488797; cv=none; b=EUIWDDpPx2kCkXKrvgf/EjSnRV0vqbN9X/wrtnAOeM0SVfkH5D0GDo/Iab2aKJgMUeTmVDHwza9kUqbL+VyPEH2FgZrMMhEXSxczfZPWR0C/T7Hk/2b7SJZ8M80mSmzud46flgf+viyB6sy+gyjj0FesQrRr/18qYmcxY2AMWi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783488797; c=relaxed/simple;
	bh=271DJ9jgC45m5gX4TZNLlhbT+pwRoJn+F1VDPJD1wOE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZyEPhBqVs8exiL2lSQJMEWs61TcvIEd92KgzpJHMXFmYjBmLm9uBtW0FCdFhcxh6kHnl8cNA4KMk45I0BdY0cXWGRDkPqRKbpWy+N1GXaBDm1EIBCIbC/+kBqBdj7Gf1ll+MULdCQVoWGjVKSTgHL26oWhGNXYeCrJUslLJFzv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A7BSBhmn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xg7cziYx; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66842U8H1447476
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Jul 2026 05:33:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KS6KjK1VRA0E19Ye/3uABUACVvGYCQVpFSdxjmPI/eE=; b=A7BSBhmnYL9DWL2C
	l5JDHhwJ7GrYQHhPPKjA404myQsOdZd2oyRn+UsW04vWmNE7TR6RTv4dXk+7gp/W
	3y7LDxyAXAauz6Eua/VvYIpk4vTPWLT1P+6f3kJrlN3vryFcLA2EkxxJBRVZeR0C
	XIW76Mbl7R7fNY2naLO2rYODQ3AAMHozxgt2IhBGFH2mQJf4H4S2sxqSH6zxuT1O
	XfaZ3LN+qpSMwaexOrXBNB5vW0FoS88oVDIKRiNzYTuIz+vgY9Hj3jeupq4y/6BC
	q3ZS3yRSpez49f7J/yMTrYGBbGA9hrUu1U9DFw4X+jZKtpgjgo5fTKGdSYV7oNtf
	oRNmsg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f97u11tc8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 05:33:15 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c89704da8c7so395040a12.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 22:33:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783488795; x=1784093595; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KS6KjK1VRA0E19Ye/3uABUACVvGYCQVpFSdxjmPI/eE=;
        b=Xg7cziYxD0IHZZulvIyRyTn46JYdUSTlh/dx5kz/xyxhTHrYpqFAqL/+z0iGAYWVbC
         9FrTyTkk/N8aXeGGBvsympoNp11m2E/pXkBza3hhZmtHL4m+ACFr9KPDLurcEBavRhvt
         Qj68fCaVn+peYONZ11iepNkWEjAURQtE04DGp6wE/ZL3QhdUzAMoiA7kMHVDIxOEVa4n
         0871jR/+ELA6yXSCQVphdVBG52zT7lW27OogVcfo1dkdOXbWaw4druNVyE+8/G/TzGwJ
         utkeIeDKMx7UWvZraB1F5nNA2FoQv3iE4d1vVkVIFDe9dU6zYUfemsqBP36YmGZbtWrW
         eVBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783488795; x=1784093595;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KS6KjK1VRA0E19Ye/3uABUACVvGYCQVpFSdxjmPI/eE=;
        b=a2pyoQgt1UzdhlAg5+m1HK27iJ3udZS/jmwuGSH5Vl9HA6/HqmkVZF8AhIHV8Ma6jb
         /8IYq9YtvIMOQcrCq301BLymX9sibEXnUX8t7rlfviGn8DFJc21eNVPv7FW3YNvj7tmy
         HkspoI82zcGmeVjCUUpci7I3Ka55QKxajg9m+LgkcG8Fy67k0x4B3Ze70bzLXi1J2XP6
         fAzoMqyQmpjHg73ieSu88xwz/GQk3JV5G2dCgUha+7O7hXu07kQQGcRV+9JCenwAfkF9
         1IiwdPlg5SB/N6OHyy/6AGDuU4ieJKvosZ2r8QcMrQ24MDQUVH+iLYeAyLBpeqAo9Xu2
         FbHA==
X-Forwarded-Encrypted: i=1; AHgh+Rq1H892L9CudLI5xihU2xEWGXOOsmbdmSQu+Zjoo2oQSMxyCsFRc2lJGXlw7xEmMB2OeuhQ5J6FchLDPrEH@vger.kernel.org
X-Gm-Message-State: AOJu0Yxw/hrT2jNO++3LaZr+bNCw/geQFrj6cDmjobe2+LDTQCAlm5yk
	U4otx/Z3TCNwlKWFGk8KkVaByY5PwdeMC/QgTrYuKvcROyDJUlO/XzEx6yDPspUB7uwBqx769w5
	26zPtxAeUm1adpOZ3rU4DFd+5bC6O2rZvkZItrqt7jl5+mV1raIlEbuiKzuj/tDuIfA1I
X-Gm-Gg: AfdE7cnowX83CbeN+Ud5e5nz1/k9IAkudJ0Th/tYb8bnr8mcrGDCjVhVZRIRZT+x9LE
	fgmcYeZ65WdMvqtjsvNh2zkKzw2srhJ4eG+xrjTGgwqOWMdwq5MSEbEOK6cjvt9+VnmGnaLzr/1
	wdO1qX/Bp16VeazoWnY6eqHo790pCnVDadwLLgl7yoLqQFxwOHXHBVw8pDqgJWXHSapa5ccDDyU
	/U3qIJR8/cvmkcR0BbGd8YFhoBxP9PJhfqofO+w1171iCBKNe72eO6RO4qoF099MiADvlPoS7+c
	bW0yKB5gzmvEWnPx5UkbdElCkX3QctgRFIn85hJ7n00+7YtTaR9efjN8X6KH2sRcBKzQouSOUsb
	vwyIalT+6JnG+puJIWjiQLiyn/YXRY8KE9jttEA==
X-Received: by 2002:a05:6a00:9510:b0:848:2d1d:836f with SMTP id d2e1a72fcca58-84842f090c1mr1174830b3a.28.1783488794570;
        Tue, 07 Jul 2026 22:33:14 -0700 (PDT)
X-Received: by 2002:a05:6a00:9510:b0:848:2d1d:836f with SMTP id d2e1a72fcca58-84842f090c1mr1174746b3a.28.1783488793925;
        Tue, 07 Jul 2026 22:33:13 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6db29d1sm6484592b3a.53.2026.07.07.22.32.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 22:33:13 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Wed, 08 Jul 2026 11:01:43 +0530
Subject: [PATCH v3 04/26] cpu: Annotate static information into meminspect
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-meminspect-v3-v3-4-7aa5a0a74d5c@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783488714; l=1623;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=7tcV3EojDUJDYXtqUmecbHdHj5TxMJCFkfbTBXEPzZE=;
 b=uPlnXmsDJ/5XV/qNRqQUBd29GoRnPLMg69Q8kK5yzcp43jc/cas0ETVH8wiJJdiYqnzbfi3s9
 zEovQovAgGzBkEvohecMwfP1GUVvyzxtLtHFt9S/LksPawXMLNMVZUu
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-ORIG-GUID: QZQ7YuwUAErPLxQB0xCFsCvM9v3YSumr
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDA1MCBTYWx0ZWRfX6snHyNrRZ/Ys
 WlLWvrASJIIyKES14GfzUCcxe5QJ16rZ+CAF4kJBiQ06X5IkWIzqtdfsJF0fmat1z0mz+iCSjaX
 F+qfxALtYS8f3D1by+yHtdtR7ZobYJs=
X-Authority-Analysis: v=2.4 cv=F9JnsKhN c=1 sm=1 tr=0 ts=6a4de11b cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=3A8An4GuCW952TOlvi4A:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: QZQ7YuwUAErPLxQB0xCFsCvM9v3YSumr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDA1MCBTYWx0ZWRfX36Il0s+8yj+w
 ZGjtuTppBhI+8hjraqsBzGhah8TYKWaO5kj+dgKyfkDZsDihDYL8Wwdn1NGXvVEVDdWZ96Qzc4g
 DCHT87BGyqucLRavcH7r4icIdtbiZFIqvvf9D2IdPBQSjSVLAk279cxKRwq2aQKoICSRj27g6c+
 NnDqHAO/vmmUEgFd06fyjaLiVCGNDuBsKuoW1T11DXIOhe9NrRufdFjMWtaF0M9IZeMn2v1Vilo
 ICpVfKrdp2n2HHD14xaoUih8Kj9apmkbjdSEW6rfyvIq7DcPRGMSw5+PfhX4gJzqTX+r4pHsYSs
 RUWAozVi/yyPi+qic9EHOwWRTWyUU9G1ez2h/RIGsSEfxkV8BXvO1IE0lJNkHGx3jRJw3HcOCDE
 DDfl6K4PExhr8vyRu6iuaxUGOW+8XnlUUVPbkCNLknkoiKlt//JqbIQdGVWWEf1aZfK8kac8+5j
 d4gBzZG3Xx+p+9W+qNQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_06,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 phishscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
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
	TAGGED_FROM(0.00)[bounces-117479-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:ehristev@kernel.org,m:mukesh.ojha@oss.qualcomm.com,m:arnd@arndb.de,m:dennis@kernel.org,m:tj@kernel.org,m:cl@gentwo.org,m:akpm@linux-foundation.org,m:tglx@kernel.org,m:peterz@infradead.org,m:anna-maria@linutronix.de,m:frederic@kernel.org,m:jstultz@google.com,m:sboyd@kernel.org,m:kees@kernel.org,m:mingo@redhat.com,m:juri.lelli@redhat.com,m:vincent.guittot@linaro.org,m:dietmar.eggemann@arm.com,m:rostedt@goodmis.org,m:bsegall@google.com,m:mgorman@suse.de,m:vschneid@redhat.com,m:kprateek.nayak@amd.com,m:david@kernel.org,m:ljs@kernel.org,m:liam@infradead.org,m:vbabka@kernel.org,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:jackmanb@google.com,m:hannes@cmpxchg.org,m:ziy@nvidia.com,m:chrisl@kernel.org,m:kasong@tencent.com,m:shikemeng@huaweicloud.com,m:nphamcs@gmail.com,m:baoquan.he@linux.dev,m:baohua@kernel.org,m:youngjun.park@lge.com,m:pmladek@suse.com,m:john.ogness@linutronix.de,m:senozhatsky@chromium.org,m
 :andersson@kernel.org,m:mathieu.poirier@linaro.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:saravanak@kernel.org,m:workflows@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arch@vger.kernel.org,m:linux-mm@kvack.org,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:devicetree@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[lwn.net,linuxfoundation.org,kernel.org,oss.qualcomm.com,arndb.de,gentwo.org,linux-foundation.org,infradead.org,linutronix.de,google.com,redhat.com,linaro.org,arm.com,goodmis.org,suse.de,amd.com,suse.com,cmpxchg.org,nvidia.com,tencent.com,huaweicloud.com,gmail.com,linux.dev,lge.com,chromium.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,linaro.org:email,qualcomm.com:email,qualcomm.com:dkim];
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
X-Rspamd-Queue-Id: 031B7721D53

From: Eugen Hristev <ehristev@kernel.org>

Annotate vital static information into memory inspection table:
 - __cpu_present_mask
 - __cpu_online_mask
 - __cpu_possible_mask
 - __cpu_active_mask

Information on these annotated variables is stored in a dedicated
meminspect section.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 kernel/cpu.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/kernel/cpu.c b/kernel/cpu.c
index b3c8553d7bd6..01c86510124f 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -37,6 +37,7 @@
 #include <linux/random.h>
 #include <linux/cc_platform.h>
 #include <linux/parser.h>
+#include <linux/meminspect.h>
 
 #include <trace/events/power.h>
 #define CREATE_TRACE_POINTS
@@ -3083,19 +3084,23 @@ struct cpumask __cpu_possible_mask __ro_after_init;
 unsigned int __num_possible_cpus __ro_after_init;
 #endif
 EXPORT_SYMBOL(__cpu_possible_mask);
+MEMINSPECT_SIMPLE_ENTRY(__cpu_possible_mask);
 EXPORT_SYMBOL(__num_possible_cpus);
 
 struct cpumask __cpu_online_mask __read_mostly;
 EXPORT_SYMBOL(__cpu_online_mask);
+MEMINSPECT_SIMPLE_ENTRY(__cpu_online_mask);
 
 struct cpumask __cpu_enabled_mask __read_mostly;
 EXPORT_SYMBOL(__cpu_enabled_mask);
 
 struct cpumask __cpu_present_mask __read_mostly;
 EXPORT_SYMBOL(__cpu_present_mask);
+MEMINSPECT_SIMPLE_ENTRY(__cpu_present_mask);
 
 struct cpumask __cpu_active_mask __read_mostly;
 EXPORT_SYMBOL(__cpu_active_mask);
+MEMINSPECT_SIMPLE_ENTRY(__cpu_active_mask);
 
 struct cpumask __cpu_dying_mask __read_mostly;
 EXPORT_SYMBOL(__cpu_dying_mask);

-- 
2.53.0


