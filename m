Return-Path: <linux-arm-msm+bounces-117491-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id LulUDevhTWpi/gEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117491-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 07:36:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AEB7721E59
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 07:36:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Iv99Fe6j;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=OOoSAAtN;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117491-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117491-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7B0583017B88
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 05:36:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51CF63BCD38;
	Wed,  8 Jul 2026 05:36:30 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66C203BCD27
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 05:36:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783488990; cv=none; b=cYeHqMMQdSbqlXc8eo5dgtsZCE3cSvaHLyqeeuKtAw8WILC86aVYJ4KzhzHD2letmYLsMyo+Cm1rnp4qE+f0xw8Bud6zrae+vLFm0pVkju5QSiwi85I9gQCEKuPgncaFohCbKYxVG2wgolZqV13V2koez4eNWEUZq4V7k+l+GDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783488990; c=relaxed/simple;
	bh=X7v99CqRbrev+LS4B/JWYl94Ngrd5oDJbPRJ/GykfFc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=elx+RTvjuEOuaq5Mx34Fy2PqysbmUJZlRSY2VGM6RFaJi4rJeq17f6jPdz1lfP/CNGHyGH/EvlEbJSZaATm8rVt3hyUPjK2VR6RvYH0oBm0+Mcm+Ne9wmjN5T/mQhBgxIFc+AYOk+S20zoB6ys6RHgy8BiUChpx4zBrHWARxX5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Iv99Fe6j; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OOoSAAtN; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66842B9K1572668
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Jul 2026 05:36:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IoV8YBxGFxD7tibQwZ9WC2gTvFHftXwkSTWa9oagng0=; b=Iv99Fe6jAbsZCCqS
	NiM/Qq1pQ3aRuun62AHDkFpQxEYFtdthDAqXaUY+HQUJ1wFw/bPDans7nAPcDs9M
	zYV9AMQhoif2Gkb4YRB+yMEyKyLZA4TgjnGcZzO34H69ejcJqodnn2faDF1JpYXp
	dpjHuH2gzqRGZC1HgzQ0bJ5ZdgcWksb+VhkNv6BDiaCOdBP4HAdY4zJQD6GIEugc
	2xwzrptfJ2UTJcvWMfTxb0j/6zbeZImKWeK8+zIm88CQSNIePJGMAwKFFtmL2+E0
	5yS36eJoF4Q4RsIvsAJ7LbVBeImkcTef+XGdPa3CMbZgTFwHEQUo9Zb29FthjhhF
	OrAt5A==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f99hgshve-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 05:36:26 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-845bc2e658aso373369b3a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 22:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783488985; x=1784093785; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IoV8YBxGFxD7tibQwZ9WC2gTvFHftXwkSTWa9oagng0=;
        b=OOoSAAtNFXkS8eu8/ekb/tE0dsO3pxsCnr1aalEDiKgo9xecXkyZ+fGuAxjKehWw7X
         6N0OhN5LZI23tdkR2ZV7k/5A8/KcGDRghl3JF74r1mKfCl1Zj5sl+RBDEH//cj+AiENr
         eNWo98g5QjQxORqCWUmcyDEr/afr3wxULXWfXXL2hbtPvrX6HDkUEU+H4Mkk01vskglG
         AWaetEFi2o5ajpmhIgEtTV3ew0QS6kx0YpEdTdcIN61kq+FP3/fBVrBdjlzYa2KeHwzD
         LmQh3cZ0KisRqZSI2VLYHxEtG2N8vIB/1kCEUO+J2iia3sb8zSMxQFHbCZrnek8GA3HS
         HJsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783488985; x=1784093785;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IoV8YBxGFxD7tibQwZ9WC2gTvFHftXwkSTWa9oagng0=;
        b=J/9D9YTCEWSYNyV4NtExOnpINC3n1lS3JT5yrjuHAYkEV1Nn3F49qd30gXq0k9cNe8
         q1nlc2A5aPix82ZIezWf6ViFh4lZW3ByfFT8Q7w4nmMMtP16xnqIcwWd0Fv1yZtqtPQk
         no5RUjF1KTKaa5KcWOGKz3BSeCkQ4rCCcREX7kR7m5BQrae1fotGManA2X/gH9dJyjnG
         qIIdhUsseVvN4Zuz/nPiv3MVCHYBH0suYHufDkgjr1904YMCXhK4vNaG2bA7WbcwOP/J
         F+sjTcwoO9pxtt/b1BeBEfChvPpjbiIyE+FIkCvPcXCWGqOJzm11GD3hAgpReUyCBwAS
         IAfA==
X-Forwarded-Encrypted: i=1; AHgh+RpeJlz2E0+QrEXAqba7fd0J69C0iitwG1/18MSAUmbugsNeGyDKUAL7OvSGmqDDF6vfT5v4qtt3ChcA/Bmt@vger.kernel.org
X-Gm-Message-State: AOJu0Yxh0nU9+dT3LX2FD0jNNXhJBlJe5kmsn1xp/nyegtn1lEVCvo/w
	OT9LcQHHfeKV1IyczGBezg4+vm9iH2BQXVaYwSWtCHMYzgK/sRQBRvkUWMpSyfp4rGh5FmdE1zx
	r2Q828ynfPBFxvLaA+/gZyGxSKqLiMXW+WjNRZICL25vDVq5d65w117vSrKvLMuLLHU1f
X-Gm-Gg: AfdE7clAb9OGeYzFmIHBPvggxeXPOIjmUQtqGSYHlaTGjpu8hDvO331q8AXD83IzN1E
	N59AXQLRjVr4EVVCQguV34iwI4aBmL8bqVoDa1gSnNHcga7jTfJl8TGfUpr5l+h54nAdSEWnrmA
	ghQ+ft4PWNpUqvhdJOnBuYYUO5HVqDA5bPw58e2JOqAfTQ3PY2PXWFG6ioDbVr0rukFVcSCLQlU
	Zs5A58W85S3ql11pzuT5WRcHy9cw/3RrWaDqqBoAtICM6V3BZ/p3UemT8aK2jafxqO3KXqW2ue5
	V/G9FW8aEZNmUzt1633o5sEI4a/46kmrpqhZxqJ7TgR2oGQKZ8EPHuTWyPLvQP2x1snqKqvhOhb
	h/Ia2+1Mpwufgqvx4FwWn4ZaMnP4MdHkfpcvsnw==
X-Received: by 2002:a05:6a00:a205:b0:846:bc7f:16a7 with SMTP id d2e1a72fcca58-84843233d05mr1113944b3a.28.1783488985069;
        Tue, 07 Jul 2026 22:36:25 -0700 (PDT)
X-Received: by 2002:a05:6a00:a205:b0:846:bc7f:16a7 with SMTP id d2e1a72fcca58-84843233d05mr1113887b3a.28.1783488984399;
        Tue, 07 Jul 2026 22:36:24 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6db29d1sm6484592b3a.53.2026.07.07.22.36.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 22:36:24 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Wed, 08 Jul 2026 11:01:55 +0530
Subject: [PATCH v3 16/26] kallsyms: Annotate static information into
 meminspect
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-meminspect-v3-v3-16-7aa5a0a74d5c@oss.qualcomm.com>
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
 bh=Gi0PIfTIjU9TnT41l5DIWFSBN6wjIpAR6J0C3M16mR4=;
 b=4j3BsRQDoQCY2sSeQc174A2W0e6sMIQ9ts68CSYZZ6ZC0iuChwxNv0mlJ/UxecW0pFQsfhCfc
 knHk43S2I6HDzfKU2yn6g+e2LK0aM67W84x5u9xvsDoxGMo1wtX+K7g
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-GUID: xV2AZVUha7d50uUI73wy5GkdHkL0pUm5
X-Authority-Analysis: v=2.4 cv=CviPtH4D c=1 sm=1 tr=0 ts=6a4de1da cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=w68G1zR93E_Nt3437osA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: xV2AZVUha7d50uUI73wy5GkdHkL0pUm5
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDA1MCBTYWx0ZWRfXyxszLfp64h70
 8Y/Un1I3J6N2TVDHtANlb0KY6F42pvHwZrTIUE+hVuwSrBrPDoDAkrkmAzlTkDKX/N0OgdTKez+
 NALexCPSiG5vuznVWIhuLgpDHqb9Kv0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDA1MCBTYWx0ZWRfX4gSHQCrNvqP6
 fV5U33CC31aH/LBaYSDZ7aMbntVMYuE+ens0wY0PCIL2iwZo+F+//km0wBPKhZ+UVv5vdUBZkKX
 2e5H6G3LD2o1nQMuPgjsG4RuB0nM/dqnMM5KWWDrmVVV448wVW3X5J1xMne7XrUsHq4mB+xroRK
 uUWbvQhMaMxhyHk5f+G+tOTKyH2hKdWpbEAdKsi3/PFBfxiPnwaqB94eUR8UJm21BkWjac85/HS
 CCWwMBiclUrn97QTOdulN+58mjbhfP3AoskYJB0+fqYeASkIaHJNDAbk1ZvmTdlSt6rtjbm3Fdv
 EwgA5hSFYb4B11GepyE6qrZjh7Uaib3z1ND0EJZvNr6tuwlXDIu/Cmv0c6wYEIEE+jFE7RVCNr/
 vabIvLJuEIUh15KEWRNxWqBsY/GvZI+4MNzy6ydCJkQlcvYlKtS9O5+VKQwpy2FSQXts+PrbJxH
 IeeZ6dDk/JIbDv4GTWA==
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-117491-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:ehristev@kernel.org,m:mukesh.ojha@oss.qualcomm.com,m:arnd@arndb.de,m:dennis@kernel.org,m:tj@kernel.org,m:cl@gentwo.org,m:akpm@linux-foundation.org,m:tglx@kernel.org,m:peterz@infradead.org,m:anna-maria@linutronix.de,m:frederic@kernel.org,m:jstultz@google.com,m:sboyd@kernel.org,m:kees@kernel.org,m:mingo@redhat.com,m:juri.lelli@redhat.com,m:vincent.guittot@linaro.org,m:dietmar.eggemann@arm.com,m:rostedt@goodmis.org,m:bsegall@google.com,m:mgorman@suse.de,m:vschneid@redhat.com,m:kprateek.nayak@amd.com,m:david@kernel.org,m:ljs@kernel.org,m:liam@infradead.org,m:vbabka@kernel.org,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:jackmanb@google.com,m:hannes@cmpxchg.org,m:ziy@nvidia.com,m:chrisl@kernel.org,m:kasong@tencent.com,m:shikemeng@huaweicloud.com,m:nphamcs@gmail.com,m:baoquan.he@linux.dev,m:baohua@kernel.org,m:youngjun.park@lge.com,m:pmladek@suse.com,m:john.ogness@linutronix.de,m:senozhatsky@chromium.org,m
 :andersson@kernel.org,m:mathieu.poirier@linaro.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:saravanak@kernel.org,m:workflows@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arch@vger.kernel.org,m:linux-mm@kvack.org,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:devicetree@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[lwn.net,linuxfoundation.org,kernel.org,oss.qualcomm.com,arndb.de,gentwo.org,linux-foundation.org,infradead.org,linutronix.de,google.com,redhat.com,linaro.org,arm.com,goodmis.org,suse.de,amd.com,suse.com,cmpxchg.org,nvidia.com,tencent.com,huaweicloud.com,gmail.com,linux.dev,lge.com,chromium.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,linaro.org:email,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCPT_COUNT_GT_50(0.00)[61];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0AEB7721E59

From: Eugen Hristev <ehristev@kernel.org>

Annotate vital static information into meminspect:
 - kallsyms_num_syms
 - kallsyms_offsets
 - kallsyms_names
 - kallsyms_token_table
 - kallsyms_token_index
 - kallsyms_markers
 - kallsyms_seqs_of_names

Information on these variables is stored in a dedicated meminspect
section.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 kernel/kallsyms.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/kernel/kallsyms.c b/kernel/kallsyms.c
index aec2f06858af..e71c085ec837 100644
--- a/kernel/kallsyms.c
+++ b/kernel/kallsyms.c
@@ -31,9 +31,18 @@
 #include <linux/kernel.h>
 #include <linux/bsearch.h>
 #include <linux/btf_ids.h>
+#include <linux/meminspect.h>
 
 #include "kallsyms_internal.h"
 
+MEMINSPECT_SIMPLE_ENTRY(kallsyms_num_syms);
+MEMINSPECT_AREA_ENTRY(kallsyms_offsets, sizeof(void *));
+MEMINSPECT_AREA_ENTRY(kallsyms_names, sizeof(void *));
+MEMINSPECT_AREA_ENTRY(kallsyms_token_table, sizeof(void *));
+MEMINSPECT_AREA_ENTRY(kallsyms_token_index, sizeof(void *));
+MEMINSPECT_AREA_ENTRY(kallsyms_markers, sizeof(void *));
+MEMINSPECT_AREA_ENTRY(kallsyms_seqs_of_names, sizeof(void *));
+
 /*
  * Expand a compressed symbol data into the resulting uncompressed string,
  * if uncompressed string is too long (>= maxlen), it will be truncated,

-- 
2.53.0


