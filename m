Return-Path: <linux-arm-msm+bounces-117488-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kZCZNfbhTWpl/gEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117488-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 07:36:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E61D721E5C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 07:36:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=VEFi7exh;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=j4BLFId3;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117488-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117488-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DCE51300AB2B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 05:35:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C4A93BBFC3;
	Wed,  8 Jul 2026 05:35:40 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9D213BB13B
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 05:35:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783488940; cv=none; b=UAY+YLWHVdYjvS+Qo6cYerNypFE6lAoPKOoFeqp7heWoKVRwI+TGJ2HNHrwi9m8cOTuSJ7glgEOta7oV9F/idzwCJr3cwCkMCmsi9nqrb7fO+UEbJZF+53C0l+Hv2zJ8hIqTMF+ldw2XBMzaRG1RdAZwOsnfrzyEiDt2JcC3Zz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783488940; c=relaxed/simple;
	bh=VGtMpDFFJ8AMn/x41vfBeQZo7MfofL1gwJeLzgL/KfI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=X/HnInc9U+A3oZcUBzf5yyDw5uNcP1ijLyidZE2vkRFSE2PNTrT7uPD0UeNWtuGLH0qb6tompyUAB1s8oSnfKEZv3iVrS2El6dOHUYJbzIaK9D+ljxoTOxQCiqkumU+pR1gvTxg59R1Y/xJhwDvBSapR0cio+8sdrEQL2I7xzlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VEFi7exh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j4BLFId3; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66842qCY1645773
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Jul 2026 05:35:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mY9TC1kShItUPWikoDVcElgzg0fCudtz+RsSBo7NFkQ=; b=VEFi7exhNSE6eNEW
	+eOINcOvpmvrYtMDQ2p7cokzjt5kzecHBE1gJNpxiTLmdl1qUz9o1o61/AidoM9W
	5aVMXNyOdd4piuVhr9ZC+O09c06yDw6rYq9buVtuC53q/zta3TqKj6PITSKHl+/k
	4PQSHLgG6NrMtQ4lDdeuzpexKnNxfO5AlU89IR26micEaRG1GgUStu+GqIHiKTVc
	HGee/omlz97CBjj3CBgGEj+7JiOX7FYdeyJXhDqFXm33K0IEohevYWzTnQ226eR8
	qJgj7kGAOJQh7X9PuwyrCsOhrXCLtCpcWAVqDBKFcdtCsj/36uY1RrBoJoyk1l5w
	LvCdVg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8ye0map2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 05:35:38 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8483e038efeso421867b3a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 22:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783488938; x=1784093738; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mY9TC1kShItUPWikoDVcElgzg0fCudtz+RsSBo7NFkQ=;
        b=j4BLFId30yRKUSl5jy2zKpDX5zgGymn5BKU/iYU8PRPrdulovZxYudlNUJvl9xt7Sj
         h3g29M109NGiiN6fSPQE+N/Yi9U4L3qOtWJv4oUwXte8bMlHnfBb6kaFtFAmmUIjAKkE
         Lq24Q7zed45Qwk7ij+Pm+79ahfp4QIVgqj7Aqc+MoQh12OTnxY79EsK5BNEBpuZdduYY
         R3YakMR0qZPnwubxDuJg7NMwYfZ9C2nNaiDtl4IByxOuq8eoqG3mqkGDFU0GFCLJaqs8
         XAzE1Y+VXLzDcRTHWbx42mzOkBxaOPiztPi+DIpdNdV3CJABMUN5GoM3N9XTuzQBUgZ+
         xHEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783488938; x=1784093738;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mY9TC1kShItUPWikoDVcElgzg0fCudtz+RsSBo7NFkQ=;
        b=ji0KuOWL3nATGx/WS1ve4OMcBDkaHKF2GLe0Oy/OLVvlfLyGDdrQgAWhzx7Q81KCFh
         HdFw3UUJkaK8PxYWwumRegkLJAews1flMfpUK6WPzomW6D/Luj79xnnanGUQs49WUOWu
         eiRZETOoli+N9RlVnMJKH8rkX3DZLhIlGy4bBdU9SzYzTypuJG/L2mCpbfcciFaWAB+H
         9TRDM7VpA5hACTxjEzAc9CdARjWYb3cU5VQy3AbENdEVA9ARbXHE8438JOKb4BTba/eV
         E3nDVE2nmoUwBv5viB06hHB3ZjNYVKD6LNrm26c08lG84Y1YIvqVWDT6odB74uOShyvW
         KFuA==
X-Forwarded-Encrypted: i=1; AHgh+Rq05UX5nqkmS1latYUDtkDNLPAhoVCBu/May86XGu+ONAB4Tpt2YoAcVBaAnFhV+7Y4lURf3zaSG8KjUBBz@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0CjqCcfhJ6VDbR+x9apw707aGk791dZ4R1ghtXtsUHgBOJ/sy
	DFI9wT+TiVlG5a5rCuVHoUxc3ZjiGlDeO7tEQFq12bGt3Lz/KkLnp8UmHpB2aXgiG7npvN6NIPN
	H78LeDhhHZtUzpTBdLgHxlrn3SWGNsOKO74sB+Fdoem5lPrSSz5zX3RF40aEG3DVjJQKL
X-Gm-Gg: AfdE7cnnOBACf9PxzWVPKA48QOzpwzA4ENeiqwPwyp1kmD4J7rBCuYkm0MG6PBDxGoY
	45Qz6uRBvIXW6xlV7ahxeRpiJdyhfd0Kl29y5jC9x1LwFw7SJ2gReqDQIBA18svyy91J2JIr9jf
	jtmS7QX0AXO1jpmYsVjBWyjoGMqhqrLP6UaG5Ldu6Q+k5+QYfE9Z6Qp0/7gdawXya0Yn5+bwmJ0
	sfQ+oWhCHqV4VYMx0o3UCsfup+oTkAsKqCOHctwUBfz6Zdd6dcixp/pwl+dY9PWkOFR9W+LWYxL
	kQU7DWUOBPYwNBjsHcyHD9q4FHcAkKWwTGtWGtdrdkpxHCBCGqcQR50z3ooT0O+ciOoonT9dcFq
	JOs9+3l2WQLkLBHAev/B+81/Ei12+fOZ9wwpfHQ==
X-Received: by 2002:a05:6a00:3a13:b0:848:2f74:1d66 with SMTP id d2e1a72fcca58-848438d7230mr1080725b3a.76.1783488937327;
        Tue, 07 Jul 2026 22:35:37 -0700 (PDT)
X-Received: by 2002:a05:6a00:3a13:b0:848:2f74:1d66 with SMTP id d2e1a72fcca58-848438d7230mr1080644b3a.76.1783488936625;
        Tue, 07 Jul 2026 22:35:36 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6db29d1sm6484592b3a.53.2026.07.07.22.35.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 22:35:36 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Wed, 08 Jul 2026 11:01:52 +0530
Subject: [PATCH v3 13/26] kernel/configs: Register dynamic information into
 meminspect
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-meminspect-v3-v3-13-7aa5a0a74d5c@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783488714; l=1125;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=ZV2kS+66Zo+GSuPrvrjZxSGkrByR7dJYtHrlrdTWNGk=;
 b=5SVbNkatrByr1/TpyiDmMuVtbPFXDVWi0cCCZKl5b9Zre8CMglPYGspE5ZWEb3Shosf+K63nu
 /z7Qty/Pfv5AEFi1fClZu/IN1yxFaXSgXEakFkdUbQUtlP344UBgWQA
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-ORIG-GUID: nDzQRP4cw-Jf_jQKk-o9KKQmZKTMH8Ba
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDA1MCBTYWx0ZWRfXw2StHBNf2jBG
 1q/gFi1I2rEvsQWVPcB0/na81sCfY66GNP4k/58CssnFtMdKEiPYaeQ8fB8Bp94IVGH4TW3WRM7
 v4TL3Cdf5mdkQqq0xOPiRXzFrzMUNaU=
X-Authority-Analysis: v=2.4 cv=SZfHsPRu c=1 sm=1 tr=0 ts=6a4de1aa cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=LjyN-fOCrMyGU0ESAFYA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: nDzQRP4cw-Jf_jQKk-o9KKQmZKTMH8Ba
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDA1MCBTYWx0ZWRfX2Z+q4DkxgnsS
 Ul5uZyh6C2cQSHqxHgZecjHttxzt1XvKb2F3viuj3o5g9P6pHYdiyTorURZpiLT1nTA/ymYxVV5
 1yaQuYJDF1BSGHVtV3svln3DvW3ePWfjrIrtIjJgo40EVEvzxonZ5tDe4HejjbE/iKYhTw2H28G
 sSowRbv276+K/G/HkTgLipHd6gX5WNIhZD/GqiJWX3bl6ZqZreRwzt2p46XlqFC/XghcpVPVy6s
 CGgL+Lkd6ufJG740UXQ4dNzI5SXvTrL3EX56EfJKGIaYWYoqjJw/f849BuOUxfT1nqiGWY3YOYF
 +IXaR3UOZB2sJoNbz2IiIGUqoNfEdWgRbWK+WsiGrWEeNHcEaYs4FY9mZ98kI39uCWE1CiqTHCs
 hPoGubYEpJC0N/b/lZbHcA41zA3peQTlH8R25FacBRvQ3ebxfsZ0qWEX6BtFrJBI4EJ40K7HF2M
 DpiCdhZQzOtBgjDekKw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_06,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0 spamscore=0
 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 suspectscore=0
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
	TAGGED_FROM(0.00)[bounces-117488-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:ehristev@kernel.org,m:mukesh.ojha@oss.qualcomm.com,m:arnd@arndb.de,m:dennis@kernel.org,m:tj@kernel.org,m:cl@gentwo.org,m:akpm@linux-foundation.org,m:tglx@kernel.org,m:peterz@infradead.org,m:anna-maria@linutronix.de,m:frederic@kernel.org,m:jstultz@google.com,m:sboyd@kernel.org,m:kees@kernel.org,m:mingo@redhat.com,m:juri.lelli@redhat.com,m:vincent.guittot@linaro.org,m:dietmar.eggemann@arm.com,m:rostedt@goodmis.org,m:bsegall@google.com,m:mgorman@suse.de,m:vschneid@redhat.com,m:kprateek.nayak@amd.com,m:david@kernel.org,m:ljs@kernel.org,m:liam@infradead.org,m:vbabka@kernel.org,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:jackmanb@google.com,m:hannes@cmpxchg.org,m:ziy@nvidia.com,m:chrisl@kernel.org,m:kasong@tencent.com,m:shikemeng@huaweicloud.com,m:nphamcs@gmail.com,m:baoquan.he@linux.dev,m:baohua@kernel.org,m:youngjun.park@lge.com,m:pmladek@suse.com,m:john.ogness@linutronix.de,m:senozhatsky@chromium.org,m
 :andersson@kernel.org,m:mathieu.poirier@linaro.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:saravanak@kernel.org,m:workflows@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arch@vger.kernel.org,m:linux-mm@kvack.org,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:devicetree@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[lwn.net,linuxfoundation.org,kernel.org,oss.qualcomm.com,arndb.de,gentwo.org,linux-foundation.org,infradead.org,linutronix.de,google.com,redhat.com,linaro.org,arm.com,goodmis.org,suse.de,amd.com,suse.com,cmpxchg.org,nvidia.com,tencent.com,huaweicloud.com,gmail.com,linux.dev,lge.com,chromium.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:email,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim];
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
X-Rspamd-Queue-Id: 4E61D721E5C

From: Eugen Hristev <ehristev@kernel.org>

Register kernel_config_data information into inspection table.
Debugging tools look for the start and end markers, so we need to
capture those as well into the region.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 kernel/configs.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/kernel/configs.c b/kernel/configs.c
index a28c79c5f713..1e7b86a8b3fc 100644
--- a/kernel/configs.c
+++ b/kernel/configs.c
@@ -15,6 +15,7 @@
 #include <linux/seq_file.h>
 #include <linux/init.h>
 #include <linux/uaccess.h>
+#include <linux/meminspect.h>
 
 /*
  * "IKCFG_ST" and "IKCFG_ED" are used to extract the config data from
@@ -64,6 +65,11 @@ static int __init ikconfig_init(void)
 
 	proc_set_size(entry, &kernel_config_data_end - &kernel_config_data);
 
+	/* Register 8 bytes before and after, to catch the marker too */
+	meminspect_lock_register_id_va(MEMINSPECT_ID_CONFIG,
+				       (void *)&kernel_config_data - 8,
+				       &kernel_config_data_end - &kernel_config_data + 16);
+
 	return 0;
 }
 

-- 
2.53.0


