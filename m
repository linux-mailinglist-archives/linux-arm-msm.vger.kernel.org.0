Return-Path: <linux-arm-msm+bounces-117486-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id VNo/Lw/iTWpy/gEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117486-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 07:37:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 04E30721E88
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 07:37:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=M4u4oLee;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=DEohFnZ6;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117486-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117486-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1AE28301F765
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 05:35:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9EFC3BE165;
	Wed,  8 Jul 2026 05:35:09 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8F1C3BA237
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 05:35:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783488909; cv=none; b=aCr7oGaVfvHjTRb7TJoe8QikcAH4aZD784jgWgptruhDk3BcsKYKKtaUcJj7+9OIvy4dIqYjqGWbs8EUK8bfmAam1V5JaoExz7Yq9Fsirc8mXZJNZPr6HuTT+RABa0selsR4NAB8+tZFcpSXK/7yDzquat2DUAOdA836EVbdIbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783488909; c=relaxed/simple;
	bh=dQKKnqGBFhStTej2/7vdZRU0D9KWrTARaJgojwH0KLk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XCAopS0UpCffrvzqwRkq0Xmi9uTceGzI7f9/Dw2Ss/xuNQ7spcmBvIEPJBn6jx46k4Ensu/nZ8gBuxjtCijubHrtNF0VZiCAXigXvRmUdP52IUFrlzgouUF4pdMxd8m76T3B0J6NW7bgJ+BURmcWxsAXwxsWq4Fdi0VyquoRLkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M4u4oLee; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DEohFnZ6; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66842B911572668
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Jul 2026 05:35:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	e3kzuLsbVSP+LQEgSP+wDvBNkj7pdMjocJ33jwAybcM=; b=M4u4oLeej6p8aS0u
	TRiwSM6+IF3MEJ73TbAD5e3O6bITNiVhDsevvmXVA8qM7eHF8ko+X7aB5nuu9aa0
	VGyZj0lxfsCcIoLynfx+qcUXzgOwfBJSVD6Coh/wG1mrFdfAuVOm4FeR5jHxaJcn
	OSVcziuUAkVr0Jsie3RsCsuxwHRnw92TBYL2AsOpSOI25B2LX4lyximoVyCKH89k
	RCi4EMAa0qHudCXQ4GNEai/e3XLrrL90yW7MoFAGAG61/ffzdilghSC5UKSGVJkZ
	pBAjnOcJqrkdnfbmUkEkRcCbaSL2MoV/Z0A5zUJxUgBmiq/OUVKrib1maXiZWC4R
	hd26Nw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f99hgshnd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 05:35:06 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8423f1fe39eso661453b3a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 22:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783488906; x=1784093706; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e3kzuLsbVSP+LQEgSP+wDvBNkj7pdMjocJ33jwAybcM=;
        b=DEohFnZ6WJR00zFFPJAACmfqd0/7Z5qygNKKSELYajpkEo2DpXCC06rx3DzUHN5fUk
         ej//lIrahmH1Ytwl5bQ+b4vSP2BcB0hwbvCG86TTHcm2A/5Bm+Aj+tXCjRdt3bML+mjr
         8THIyNZkdIUFBRguHtOpOoplwtlAyXI4kZ23esjPHAiKy45NRDqkazMgeJrC2FAkNtWf
         0GZAEiUW8evsTZN9M5n6Ua3xgtE7FwAk8q5ELW0QsohQLgij2llf35pjmyi+oxCxi23f
         De1rgKkVm+5u4sCbZE69KH+vovAg5oOsk1pybYjQ1HgMj/7W/uiw7voUg1RAUERrDoI8
         CUIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783488906; x=1784093706;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e3kzuLsbVSP+LQEgSP+wDvBNkj7pdMjocJ33jwAybcM=;
        b=C/kyMw3cHYO9tHy1j30cpbQJosb0GDyJJlYp/+k/n7iTb73BgbM3G+A7SJegH8YqI5
         CQToUhBng7zBht8Fe8CXRNPmFB9Qaje3oKjBwsokvwmf1kTY8LofRoxTNva6C9BpqgrN
         XOyLJFj/yfnxFF1e/Z9EB0PTXv0zF1bKQmz/a9zZhGcpK/vsdA1Annoykr6T90uNDoYZ
         PZQu48G5H8gRuv+qOmlRN2ge6RTEwS4vkXYKWKptW3Ty8+L6GEj2TL12eEpfp+oPwbz7
         BQfP5QiQ0ZYuSuFMGGAluPgVkOG+07PzmFaXB3gUSzIlMCyiqPS9BAa9+vJg7nGovyZs
         3xyQ==
X-Forwarded-Encrypted: i=1; AHgh+RoftWAAm+KCipWSHcTNAHyuzMMqLZV1Y8tReen4T8UeJez4Sn2zshn4wo3zOrn19uRklDZ+W9/mWogpivR3@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1YwBmauAa7b/ShLs1omgKzD+4ox9v0tiVuzbqb3IkayjJtWzr
	TrhHD8vDctwngzPMw1FQ02LuvmHsI7vSWNFgkYw3lsVok0i1Yh6PgNhNka4rViyPgzaX6vKpELI
	I6r5mMwA4Nf6XEWFHOInzc8bnBE6ixHlWOxJS1kD/oe/b5AcGtsGkiFvjIsqifsPykH7I
X-Gm-Gg: AfdE7ckjQe1y/41phP6pH5jO9e+i9956+iE9rBycmYSzn7YTMhH4Ew/iE8I0zwz03eR
	eOanUTW47JFV8pFjlgJmX3SrUV1locpX3I56CPBgodQqqUBaKtxMAnqezvPziLOrVb5fN1G9/EY
	CHkox2++Mz+jtPqxWkqtGflqch4nGawNvLujMlxND6XZ7oNsANB14vMJnuhcz7B6MhkfgujPc+8
	05zyfBJa5501Uru0lYQth+toxpL4RFVJ8OAnh/6akHcvhEpwKaISaEk6A/GF0gTuA2scATHmcXZ
	HFmWxie+EMlc7SV9oE9uJp+aV118JFKk62tGG8m38+sdl2icbbaR1YVrSY8k0ySZf2b/cV31744
	z/JREziCxgBxX84pMaLHLhDoSOAgHplLRnSjatQ==
X-Received: by 2002:a05:6a00:9aa:b0:843:49f0:f5a0 with SMTP id d2e1a72fcca58-848432a16ebmr1252305b3a.32.1783488905596;
        Tue, 07 Jul 2026 22:35:05 -0700 (PDT)
X-Received: by 2002:a05:6a00:9aa:b0:843:49f0:f5a0 with SMTP id d2e1a72fcca58-848432a16ebmr1252249b3a.32.1783488904894;
        Tue, 07 Jul 2026 22:35:04 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6db29d1sm6484592b3a.53.2026.07.07.22.34.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 22:35:04 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Wed, 08 Jul 2026 11:01:50 +0530
Subject: [PATCH v3 11/26] mm/swapfile: Annotate static information into
 meminspect
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-meminspect-v3-v3-11-7aa5a0a74d5c@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783488714; l=977;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=Le/Q1zQCFzKw7TzU97mwXcZteClh+RXmg0tVYvpLcUg=;
 b=/A38jB8jdahPqFeNwjbw3VsOCOB71d39aCOjB+lkv/q++5YdKJm74I+QKrYoRlSQmDy7ph1py
 Js3L+F1YhD2A103w/t5mZSZ9W83XBW+cKVhsPjinjQelhxoWx2X6Hww
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-GUID: lvdVOR02edxURdVNMX3Bq2OTYL56S2qu
X-Authority-Analysis: v=2.4 cv=CviPtH4D c=1 sm=1 tr=0 ts=6a4de18a cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=7W-H8-9HiqHpPtFVMfQA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: lvdVOR02edxURdVNMX3Bq2OTYL56S2qu
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDA1MCBTYWx0ZWRfX5YcFW/wHdx5W
 QRzubanO6w3P67q2yylRnYTVqWiBHDWABDngKXQDunNQRQE6GafDN1G1JPaD2/DbThov53/ACrI
 krcz2ilXx2a/TflnD2dcxXHmI7PXwwg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDA1MCBTYWx0ZWRfXwAhWw7rF2flv
 bK1qdCv8Zf+kgIgXI4Riz+FIwkjo6EfRKiX3cFjppMhMHCeKbUaQ7jlq6XUVe087g0ZFUWhpj8z
 rAuydktNkbMqdj3LVU6o604xapXZUgxYq+hrVIR8pBMSU3i8RpTZ9A/W6WktE4+dXqhL8MrYpzc
 nZHjMRIZ/2P72chHvz1e/YSPH7o4kNUuHXvOxGPKR9kWaGt+lF7x154eTAu4R+xrbz+CIIKydfN
 +NtxdV/Lnn8y0mpU1xov4qNJhcihx9zLgnJ3HEbr5vJxh9zXpqWPHC50pOe0JS7XioGgGq7eYCe
 FHmpBPh8MUZfHrhDTbbyogtFK5WkNqEWGK1OTAj3030PU+g+Mlxrk6eAIQ75W++2EhkZNWwopB4
 mSffEYJ2R0A03R/qr/fw1Zm0rE/5KS5v75ZYlcD11hU/oCeuQYhltwTwNp0DvbkPLL1Wvbffeti
 O+NRsdEG+JHxSADZnqw==
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-117486-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCPT_COUNT_GT_50(0.00)[61];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 04E30721E88

From: Eugen Hristev <ehristev@kernel.org>

Annotate vital static information into inspection table:
 - nr_swapfiles

Information on these variables is stored in a dedicated meminspect
section.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 mm/swapfile.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/mm/swapfile.c b/mm/swapfile.c
index a602e5820513..d480727e4987 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -42,6 +42,7 @@
 #include <linux/suspend.h>
 #include <linux/zswap.h>
 #include <linux/plist.h>
+#include <linux/meminspect.h>
 
 #include <asm/tlbflush.h>
 #include <linux/leafops.h>
@@ -65,6 +66,7 @@ static void move_cluster(struct swap_info_struct *si,
  */
 static DEFINE_SPINLOCK(swap_lock);
 static unsigned int nr_swapfiles;
+MEMINSPECT_SIMPLE_ENTRY(nr_swapfiles);
 atomic_long_t nr_swap_pages;
 /*
  * Some modules use swappable objects and may try to swap them out under

-- 
2.53.0


