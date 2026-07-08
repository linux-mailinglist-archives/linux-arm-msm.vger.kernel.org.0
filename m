Return-Path: <linux-arm-msm+bounces-117481-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0hTuFonhTWo2/gEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117481-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 07:35:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F33F3721DDA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 07:35:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Kis4SS8T;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=BgQ9+Zdt;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117481-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117481-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CD10D30131E9
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 05:33:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE92F3BB10F;
	Wed,  8 Jul 2026 05:33:49 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 498063BBFA9
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 05:33:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783488829; cv=none; b=dsRaJe1l4K3TkOdhiUWbn5adtk5LiC9RUBVZ/n02I71YAAx58Evx1vMMvZSc7jucQTxGRKVGD53/7aISfd1Fj6fFYyCeiH/Qfa65HTO+CDlD8K8ZQfuN253SkSjvb6oKTWRDvFuwBTOFhB0FViznbSOR9Gdq2nEZM/yS3bew1hI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783488829; c=relaxed/simple;
	bh=rausTGX/cA29KL+8ZlV/G0O47Zo2G68qaUiTzxM2SoY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ovCteqr85GnHJAg3dbqGWPI3krCAQEY76EtlI/3SK/g9pE7TzoWadsgxmvDInodK28oPfcfm8BCta+jzZ5KIAXVhtZg9A5AR9a9LA1XR6BAPSJfQq0ygpZiNhnNuou3GxgMtyVC7uTuVMuZCHcCQqaWzzaYhSBUkUtyrj4xYhzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Kis4SS8T; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BgQ9+Zdt; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66842elr1491622
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Jul 2026 05:33:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ITO+JE3opr8LgPgXIr5SaVvHjNfRbkajEoRTp9nYlQ8=; b=Kis4SS8TmV5iP1Yz
	l7VP5KpLpSZzCD0HrWRlM9bPZ/SXhy/pzeuagg8DfSkugOIRNgwO+qGFPEI8UTz6
	xxQpKMEk3q4vPwwhSx2yHQIvCKGadfWDzWEVWxxZr1U1tAjm1JTlZhcuxJq/wHZU
	v5KN+a2tdu1/uxc1SoYHlL4x7Zm1t6TpzqRjbQrtGNZjDwpsvXYsl4iAMzvO/kTd
	fHtdDkbAxSVGRHy3kRK5EmfbHzCsONFcZa09PxBGA18MaN9K7IL+V55kZODy+bra
	MfzYkjW7Hiq0Qt7h8a2OhI8IXcXLg5BAILmPstdQeEwpidHjLbiSIdgV5v2jd4m6
	vvOMqg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9b5g94dy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 05:33:47 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-848474825ffso225297b3a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 22:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783488826; x=1784093626; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ITO+JE3opr8LgPgXIr5SaVvHjNfRbkajEoRTp9nYlQ8=;
        b=BgQ9+Zdtz83Ulr6SUm835C4Nxqd9yP1s1FR5XzT6neenmVXvmHpamP6ngLyywkXMMG
         t3xU+CWCKLi/u+N8DRxGeqc27x5brgEPsDhExjFgZoGdLTGjIPqsoJUs7Ir9R2aZ9ISX
         qL5InlPmVhk7E8z9+Ong7/St7FFmUK37ZP9J54blErteGVyxiDTCTQP7S4MpjeMw5pij
         +N0pHLD8fXvZ4EfnZLsULl29/TCVz7MPuk+IPtOla69iUJ1bz8e/zXPcWgyFzXX/Qygx
         dNNXT4de7QVnR3abyVHdpKaTSf8Qx0x3WBylACY3PMLaX5L9A8ZllTbb+u3XRCfLuIgD
         Q8lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783488826; x=1784093626;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ITO+JE3opr8LgPgXIr5SaVvHjNfRbkajEoRTp9nYlQ8=;
        b=XSp/Jb1DyMBXlYU9wBle3POmqe6xD2igtIUejWYl9V3rHGoWjR+KWfBPSH0ERvjodk
         0+kUQbv2tG6BnxOQ6LF2MUH/QMHUR8FZMX9ATgz+rK+j+lklMxlpGbsSVSyOHsTBNTU7
         ufGaBkNHoC/Mv0NGevHxRwduRpA4ueUv9smCf6B4F/Stk5sIGjFabL4Gn25WjpKXyoIq
         ex+iZFTWz6oe9ulgUJbDLQQYn2+Kv14HWBuzGkrb6eG6IbvZr93NtsZHVWvf/D63/75C
         YxWcx5tY3NpCXxFCkXcOz4m+knW/ftJuKSkojJM7eNfqRYawU2gpaYbqmIVsTzaMRqit
         PSWg==
X-Forwarded-Encrypted: i=1; AHgh+RrNIZE4O9r45bbnCePHouUiEVyAZ0q8lHJ+DuTs4Vo7UVkVLmSbaMR1Fvtz3LCa0fDbOKYb69ENBILnPUIx@vger.kernel.org
X-Gm-Message-State: AOJu0YygBJPlYb4CosyhzQzmspE/sMDmYXpctwqJQouivvgcRWIvzHKu
	NiBJHdXsgARK7ICgubLpwecdRely1azE8hCr4lAP9RONJ7ve9N6Ovl7w2Nug42L8ow3L2ETX9XO
	XYs3AXVX9pFwxzq2J8jfQj3d9dpUQvN3qjYyupOU6z+ZOwtXjmn2mYaExSQPMtwYghdMv
X-Gm-Gg: AfdE7cniKeIJmoxanuNaFTtZjBJqh3dHz+p7mCd4Y65mggRe6McmZHZKe2EljvYWkKv
	kP1zADIrxBK6HDzFrmujCf7HxBFRwVPlGPyOfU0h4pmBXH4NsGT8AYxu6B6BKidSDr9+bQaoqHq
	QBxLX8qVBEcZm8dfQeLqe2AujzneUkNqlYHyVDNHq4UBSXvdKD9bypYO1L3CTvMeLyEsLEj1iEQ
	ABwUHrJ3rRL6wsO+NM1vmz4j4OKXwCOSATLO/uIxscVV5J3d2xEvAQzx/4kcojbXijEDMBsI9TR
	O5OAo88Cu36qT1Koub+j05hPObyO3W+3sGOgcZsdj31u6Rgdn60s131PLdZkeK58NdcTTw+wVfz
	Jk8kHacQX9WCPXSKRgluyNoP6vwc2rVaqER4GCA==
X-Received: by 2002:a05:6a00:8d8a:b0:847:8791:f54f with SMTP id d2e1a72fcca58-84842fe321cmr1182156b3a.29.1783488826163;
        Tue, 07 Jul 2026 22:33:46 -0700 (PDT)
X-Received: by 2002:a05:6a00:8d8a:b0:847:8791:f54f with SMTP id d2e1a72fcca58-84842fe321cmr1182097b3a.29.1783488825439;
        Tue, 07 Jul 2026 22:33:45 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6db29d1sm6484592b3a.53.2026.07.07.22.33.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 22:33:45 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Wed, 08 Jul 2026 11:01:45 +0530
Subject: [PATCH v3 06/26] timers: Annotate static information into
 meminspect
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-meminspect-v3-v3-6-7aa5a0a74d5c@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783488714; l=952;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=dRXeUIpIlzWe1LNHxoHjAVpHzKcKSqqlKNhUPjx2KTw=;
 b=FTqRhuK4jJoW5z8xkIzP9taBuoDPVq9v+EOp0exYW2spJdYWD+lEd+oHVaecDxylcFpv676MQ
 j09Wz7/ilg8AWemdOCnZLhJohxL16BOY0AIU6SL7rCeCEXHzowGgz/i
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDA1MCBTYWx0ZWRfXx8wk4fHJfx9Z
 SfEl0U8ZvS0MhqJgg/uAGVRaDTt2CirFycWLcqLezJFWUwMZIjtAsnFlKc/8ZErC2n3g3Ftwb5l
 Y2VT7LAMlIHgyX8X972OFZGH7g5NwPI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDA1MCBTYWx0ZWRfX+veUtSclLnwR
 OWK7cbzpeUc+mowsskyWMRrk2ra3mmzK9bt2CSD300HPoYmobjlde2ftGf5wwP539tjLlTfwsR+
 PLlfkxSOzBYpcgZ49Xt3moVJ1Amrb2wWnCSy2vIhAkChvTBghX8KgiKia5adS3jtraG25KIgyXt
 wqUfJ/iifDkkAVgDbCsMIqQELBNAOafxV0VOFXNG+IOj0o7Ncm6/vpaVFlH+OIBaS677cnfGj8E
 tZ10p+gsHkCTy3ky9L1zXNZrRpWAWX9OpLHfdeqiRoj+uvRQKui+i8r73KPmVifKtcrNACD2tmO
 BGQfnsLdbMfQWFGCVKNYMNUXlpqkXO62siUMs7EMwYmkNz+fhc8T9Md/NEVUISp1hUqKCDQcYLd
 sSjJuGSu9bHNlJOmVLV5G+QyyOP9fk1hf3xw3So3c8NkJPVIvU3a8YyAcjDzJQuBc53Z2JPkOQA
 eL6l2bzdVLgH85N9s6w==
X-Proofpoint-ORIG-GUID: LCAEPCps5eJ0Bj64-LItS6qyN2dEbsil
X-Authority-Analysis: v=2.4 cv=JLULdcKb c=1 sm=1 tr=0 ts=6a4de13b cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=WZmkKkIAQcJSthQVk9EA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: LCAEPCps5eJ0Bj64-LItS6qyN2dEbsil
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_06,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 suspectscore=0 spamscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080050
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-117481-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:ehristev@kernel.org,m:mukesh.ojha@oss.qualcomm.com,m:arnd@arndb.de,m:dennis@kernel.org,m:tj@kernel.org,m:cl@gentwo.org,m:akpm@linux-foundation.org,m:tglx@kernel.org,m:peterz@infradead.org,m:anna-maria@linutronix.de,m:frederic@kernel.org,m:jstultz@google.com,m:sboyd@kernel.org,m:kees@kernel.org,m:mingo@redhat.com,m:juri.lelli@redhat.com,m:vincent.guittot@linaro.org,m:dietmar.eggemann@arm.com,m:rostedt@goodmis.org,m:bsegall@google.com,m:mgorman@suse.de,m:vschneid@redhat.com,m:kprateek.nayak@amd.com,m:david@kernel.org,m:ljs@kernel.org,m:liam@infradead.org,m:vbabka@kernel.org,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:jackmanb@google.com,m:hannes@cmpxchg.org,m:ziy@nvidia.com,m:chrisl@kernel.org,m:kasong@tencent.com,m:shikemeng@huaweicloud.com,m:nphamcs@gmail.com,m:baoquan.he@linux.dev,m:baohua@kernel.org,m:youngjun.park@lge.com,m:pmladek@suse.com,m:john.ogness@linutronix.de,m:senozhatsky@chromium.org,m
 :andersson@kernel.org,m:mathieu.poirier@linaro.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:saravanak@kernel.org,m:workflows@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arch@vger.kernel.org,m:linux-mm@kvack.org,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:devicetree@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[lwn.net,linuxfoundation.org,kernel.org,oss.qualcomm.com,arndb.de,gentwo.org,linux-foundation.org,infradead.org,linutronix.de,google.com,redhat.com,linaro.org,arm.com,goodmis.org,suse.de,amd.com,suse.com,cmpxchg.org,nvidia.com,tencent.com,huaweicloud.com,gmail.com,linux.dev,lge.com,chromium.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim,linaro.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_GT_50(0.00)[61];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F33F3721DDA

From: Eugen Hristev <ehristev@kernel.org>

Annotate vital static information into inspection table:
 - jiffies_64

Information on these variables is stored in a dedicated meminspect
section.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 kernel/time/timer.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/kernel/time/timer.c b/kernel/time/timer.c
index 655a8c6cd84d..6cbb054c7c4b 100644
--- a/kernel/time/timer.c
+++ b/kernel/time/timer.c
@@ -44,6 +44,7 @@
 #include <linux/compat.h>
 #include <linux/random.h>
 #include <linux/sysctl.h>
+#include <linux/meminspect.h>
 
 #include <linux/uaccess.h>
 #include <asm/unistd.h>
@@ -60,6 +61,7 @@
 __visible u64 jiffies_64 __cacheline_aligned_in_smp = INITIAL_JIFFIES;
 
 EXPORT_SYMBOL(jiffies_64);
+MEMINSPECT_SIMPLE_ENTRY(jiffies_64);
 
 /*
  * The timer wheel has LVL_DEPTH array levels. Each level provides an array of

-- 
2.53.0


