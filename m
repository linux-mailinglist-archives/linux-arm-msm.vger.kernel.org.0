Return-Path: <linux-arm-msm+bounces-117490-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zcgsNlriTWqQ/gEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117490-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 07:38:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 307EF721ED8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 07:38:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=jIQYjWOp;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=DQjJ2HvQ;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117490-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117490-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7D67C301C3CD
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 05:36:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFCD83BCD13;
	Wed,  8 Jul 2026 05:36:11 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87F3D3B9D8C
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 05:36:10 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783488971; cv=none; b=TKtLh2ygKgAgvyBo8yaL/zz6CD7UzqJf8FSGZySL2RqqmtBVYwH7QA3Irxylmz1xWkaEqRhKs7qNtlUZyVkQLlUOAgk+xWY79aa9TCMLiHX9YayFSYI/geg7kfpYgPHfKouJnH9I0t2BfBPbstmGaQZ+M9DGEedieZo8tS6LrV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783488971; c=relaxed/simple;
	bh=FiYNk05u3l6OjFfNfEuezoiD9Cy7r8n24C3ZFgyQiD8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fCAWKfE6QW4XlNVBx/JfGjj33PhwneYrzH7/ra+2xgEwpGlrLIVuRRBq4jAv3Eb1fdSiLb8vG9E1Cg+yt3QwilFzbB8x83sDPzu+PEVbghcFBN2Gq8F1xwbmH0pojVCTw1cEPcc0vQ4b/08nX6kXFkDc2WKy9hZIBkTL8XCSZMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jIQYjWOp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DQjJ2HvQ; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6685Dpkr1818060
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Jul 2026 05:36:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	y+bdn6fLnN4RyU1mq30fExI6NTYfDOdkcveqvmjmCHE=; b=jIQYjWOpMdm4Yf7/
	4ZAx6VsUGkkHx0nISbMer6Ogn/gK2G51oS6foy6Mgwl4NbjhK79MVO52gyhU8v4+
	lw+vlWG0mBYq153kmRtblw9p85pGfVTgoBpeqdZ8A6nDtgtpcHmfumsr30eRS9L9
	iwpMpdI9qaaC26l7CgW+S28KPz1Bw8vDhH4rSyEWBFhXFaJ2m9/Yn9YxEFw0L+RZ
	Av9xJ+vKxbgKHJWyxplIeJ82xC/NRVC6fyNpAmMjrVZ1ynOf78It107ASYJ6z3kA
	FSRJ+dnkJ64wUDccTgvDKXl0OIkKNM6qSZG+Z9+vIvUNqnDvu5CwLUQVKhBpYqQo
	6/3Dcw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9g7hg2d4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 05:36:09 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-847e78d656bso813856b3a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 22:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783488969; x=1784093769; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y+bdn6fLnN4RyU1mq30fExI6NTYfDOdkcveqvmjmCHE=;
        b=DQjJ2HvQGQsfPr0RcnfRtvFzCtssajuwo5xG6dFi9Nppkn4tBwulL4u16wxQYDwdq7
         DT/pU0GzOVUwQkx6ql4G3jTooy8pgTlU0vt7A5TNM+JoqswPkg0Tw5BoK79me9DdzGQF
         DRXDVj4bWuwPcVgb6JQFT9X82CoN76wrep7wtkWf8PdvaSr5YRgXttkEnIWtt9WxT0f7
         YK1Rw73PiWd7PmXQpZA4vGy0kwj6mwce9Xynq4xw1qotiCDhf4nrelPQzrVHea7zV0J2
         59NUEcjc7hjADXE/OY17uUQlyxzjW49NnadHc1ONHS+Ec+n97WWHMs8jHjatCtG/Pheh
         qNBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783488969; x=1784093769;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y+bdn6fLnN4RyU1mq30fExI6NTYfDOdkcveqvmjmCHE=;
        b=r1q+OrPPAXNnoBEHHfuvad/QIjQdmfFfaDsUYpu/3w3REZ03zE3bLzpXHFN5h1QR0L
         8UHMmZZInEjPG9K9aLjvMYQL56Pei77DoOwKAn+2jP2jZV+91FohPlWZJvpYxtfuhAqq
         4C0qdb00Fw8ylaPU1E2mzngSxblKZ9u3+OKQpDhwKU90nRbACurlSohMLVNSFn4YVgHE
         /ZGoo97ZeLckVUri38yumXtzZ8l8RHodZn6EmAl4y96CEmzKoPt+Kos13n9ygdY5+XDZ
         ymSS0MDLS0IXWJpE09NjtydafMz3q1khufooNb1gsATXFwf9EZSmIlLMQZ1V9fhuEWGD
         G6uw==
X-Forwarded-Encrypted: i=1; AHgh+Rrdl8WSYJONwdC5kyDJ0CXUo5AArMGOlKYVsorPKI3Rrbn99i57bFWYpd9wo3wKrugjnVIuvINjW4UmdtIB@vger.kernel.org
X-Gm-Message-State: AOJu0YxY4a32RBa2YiQZev1pb263qCwH7XK5Iu3NUFu3G/i9nEBGg10/
	d7AzkzPNaRasO8idOk3dSohFM272Gocz/v8AUqr9ZGBDiaatJeJvTwzenl/smb3h8dNxFNSRF5B
	Yfo5iIEuCa3258HeVTWPzVmFVN7+2m0T9ydVJTx9pBdelbQGd74NJhvJ/0ko9Qlomu4dP
X-Gm-Gg: AfdE7cnIaEu0Miwrchdi7kLKLx10eu8q0EpCi3Bx0bm+S5RQ/uQVi9pB9eDurEnVfUm
	QA2PCGB4ZfPrEX8pFfCODVQ5zCnwJPiar5rgSZpLRG1WFlfeUaAOSC4eOWEUL+/vUY8NgP/BpId
	2AJpcz8H2Q68FAnw1n8R/nWfGXRV9lFuuHEPYxeOjZpalaBxI5YUsu+Bp6pj7zdy18vAisx4BVw
	2vyeXzACq/WdBop4YzhqrWQ/nw/9O+FOEw14VuxozOEDVOKGT+KG6XMpgE6fuBttoqEjDzZlU/0
	7/ZhIy35JtRzaADmJyqBd4Z71Dx6ir/+KQEKjf64tqRke/5dJdCC9Y9tR4IaAZ+d/e4WpxiT7qL
	tCURxjFwPNDqjAC73ahtUlXpVF1jUuogKv38hYg==
X-Received: by 2002:a05:6a00:23c9:b0:842:2ae0:968d with SMTP id d2e1a72fcca58-84843246a07mr1172500b3a.32.1783488969246;
        Tue, 07 Jul 2026 22:36:09 -0700 (PDT)
X-Received: by 2002:a05:6a00:23c9:b0:842:2ae0:968d with SMTP id d2e1a72fcca58-84843246a07mr1172435b3a.32.1783488968604;
        Tue, 07 Jul 2026 22:36:08 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6db29d1sm6484592b3a.53.2026.07.07.22.35.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 22:36:08 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Wed, 08 Jul 2026 11:01:54 +0530
Subject: [PATCH v3 15/26] panic: Annotate static information into
 meminspect
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-meminspect-v3-v3-15-7aa5a0a74d5c@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783488714; l=1392;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=2Ckm+YqBY68LnQw06/xX1Rice7q7oHfxcc3Oa8J95tM=;
 b=kNcFd/6IJruvhbZhgcKF1kf9nMQRpQthTbMHEFUl0hfgNNJOPNaYN4PdRHLxJ2YhHQpTBO7+8
 6jxCLWuRI8VBffFPcyBuoS8d2GFeO7KijR6/mLX0R1hgBfH+2V4jfL9
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDA1MCBTYWx0ZWRfXxsp6Gunfg2HA
 k8DGvU/fB1rhTBbECtKVSan7903uwteTlQT1VYziLu+C2M9EdZ6x7cRhiDTKhdu2sOah1WLzOlg
 uryVBYytdOZFo+7jTH4IsLuDym8w57ItiKGz/M831IWw7Tuybj2kBH+2IT3W8ojb2vJBBAh11A8
 vCbttjTFKRY9yYeTE9WCoKDaefCRdnxv4DteJseA7+x8+IA3c3XxerzmkLa8GClATrgqArkkeFk
 dMncZgQE82LPot/oPs1K83CFwWw+suFeuShgYTQzyOQ4NYd1aSTnAzXF//evYzGuE2+t4Ds2xxI
 oDAqRsmunlX/bZycCrOi2zS4eB2D/5/8AlxLX9BullPPr24fojnzL0F4yl7QOQGtF21xx92KC8b
 mgNKI9U64EoYhTuOUNzfB+0NU7+wN3OvF6SavLavnV9Sp/b+h9qGpUOBtJuzB3YCOrSDE7X3x73
 2azrSOiiSOsX7VHcTsA==
X-Proofpoint-GUID: 72aaRb5IQDJi1sbQkQQ7o2jA0-3e5jDv
X-Authority-Analysis: v=2.4 cv=TMp1jVla c=1 sm=1 tr=0 ts=6a4de1c9 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=sIx07V1IIwI039IRSX0A:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDA1MCBTYWx0ZWRfX8eyXBGRkBZQk
 atahMdoIA6/Ta56h9ZE5g25OPeMWemPSJBtILF7vLPdjNmiM1A4Zbc9Zlx2MdPBXM74fVLaGpNa
 8DvJzUX6chHlwqZSR6nOMYRfJYGPK90=
X-Proofpoint-ORIG-GUID: 72aaRb5IQDJi1sbQkQQ7o2jA0-3e5jDv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_06,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607080050
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
	TAGGED_FROM(0.00)[bounces-117490-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:ehristev@kernel.org,m:mukesh.ojha@oss.qualcomm.com,m:arnd@arndb.de,m:dennis@kernel.org,m:tj@kernel.org,m:cl@gentwo.org,m:akpm@linux-foundation.org,m:tglx@kernel.org,m:peterz@infradead.org,m:anna-maria@linutronix.de,m:frederic@kernel.org,m:jstultz@google.com,m:sboyd@kernel.org,m:kees@kernel.org,m:mingo@redhat.com,m:juri.lelli@redhat.com,m:vincent.guittot@linaro.org,m:dietmar.eggemann@arm.com,m:rostedt@goodmis.org,m:bsegall@google.com,m:mgorman@suse.de,m:vschneid@redhat.com,m:kprateek.nayak@amd.com,m:david@kernel.org,m:ljs@kernel.org,m:liam@infradead.org,m:vbabka@kernel.org,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:jackmanb@google.com,m:hannes@cmpxchg.org,m:ziy@nvidia.com,m:chrisl@kernel.org,m:kasong@tencent.com,m:shikemeng@huaweicloud.com,m:nphamcs@gmail.com,m:baoquan.he@linux.dev,m:baohua@kernel.org,m:youngjun.park@lge.com,m:pmladek@suse.com,m:john.ogness@linutronix.de,m:senozhatsky@chromium.org,m
 :andersson@kernel.org,m:mathieu.poirier@linaro.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:saravanak@kernel.org,m:workflows@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arch@vger.kernel.org,m:linux-mm@kvack.org,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:devicetree@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[lwn.net,linuxfoundation.org,kernel.org,oss.qualcomm.com,arndb.de,gentwo.org,linux-foundation.org,infradead.org,linutronix.de,google.com,redhat.com,linaro.org,arm.com,goodmis.org,suse.de,amd.com,suse.com,cmpxchg.org,nvidia.com,tencent.com,huaweicloud.com,gmail.com,linux.dev,lge.com,chromium.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,linaro.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp];
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
X-Rspamd-Queue-Id: 307EF721ED8

From: Eugen Hristev <ehristev@kernel.org>

Annotate vital static information into inspection table:
 - tainted_mask
 - taint_flags

Information on these variables is stored into dedicated meminspect
section.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 kernel/panic.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/kernel/panic.c b/kernel/panic.c
index 90e21f15fd7e..31d2e08b7e2b 100644
--- a/kernel/panic.c
+++ b/kernel/panic.c
@@ -37,6 +37,7 @@
 #include <linux/context_tracking.h>
 #include <linux/seq_buf.h>
 #include <linux/sys_info.h>
+#include <linux/meminspect.h>
 #include <trace/events/error_report.h>
 #include <asm/sections.h>
 #include <kunit/test-bug.h>
@@ -58,6 +59,7 @@ static unsigned int __read_mostly sysctl_oops_all_cpu_backtrace;
 int panic_on_oops = IS_ENABLED(CONFIG_PANIC_ON_OOPS);
 static unsigned long tainted_mask =
 	IS_ENABLED(CONFIG_RANDSTRUCT) ? (1 << TAINT_RANDSTRUCT) : 0;
+MEMINSPECT_SIMPLE_ENTRY(tainted_mask);
 static int pause_on_oops;
 static int pause_on_oops_flag;
 static DEFINE_SPINLOCK(pause_on_oops_lock);
@@ -833,6 +835,8 @@ const struct taint_flag taint_flags[TAINT_FLAGS_COUNT] = {
 	TAINT_FLAG(FWCTL,			'J', ' '),
 };
 
+MEMINSPECT_SIMPLE_ENTRY(taint_flags);
+
 #undef TAINT_FLAG
 
 static void print_tainted_seq(struct seq_buf *s, bool verbose)

-- 
2.53.0


