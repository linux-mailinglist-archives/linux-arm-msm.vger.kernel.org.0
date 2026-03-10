Return-Path: <linux-arm-msm+bounces-96760-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8E6eEzV9sGnLjgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96760-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 21:21:09 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0457A2579BA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 21:21:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B6F4C30970E2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 20:19:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F4F13E9580;
	Tue, 10 Mar 2026 20:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WXvMHFKq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c7/neEOg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58C06355F4B
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 20:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773173942; cv=none; b=DEPxG95GH8Vog+yzUv9GMfbG4MdVGucywExnsq6OTRzpPj28WNxcJBXtPZyBZmPt2S/bwJeqb0D/Nu2FD2PXsiDmj00FzM38xT56IT/llD3FwSJIXHY0SP3VbJMcFJLVKCAzb/piVGgHueLzj7SsfqSbSXfqUK263+f6DlZGa/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773173942; c=relaxed/simple;
	bh=JjyaV+tgv5UDZXjq5MizMtlnFRKCCCj76Cp/0PM5tSI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JdOIPy4u12VFGiqaFvhNxc/INy1Eulkp3L9DOWbQDz+G3jycBOgM0rBfTq0fSQjAqFQXpwSwi1Bz0u/Z5JJVjjATJBDxBkwmmWx0KBniEEkGTNh0ySa9MlU9fFR43MnSIMCKkUgp9Ve0vUp5+fxi3GO2X8KMc6bCXscBQcr5v50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WXvMHFKq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c7/neEOg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62AJIfPu3296544
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 20:19:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9TmROf+bPb6FNDxEurt6WhWR2L8qwZm5Ni95BDxLLsk=; b=WXvMHFKq+20+1g7L
	oZQU641VdU9D+cbX6AIovAiQqEr5nAj6pMMuZPy3yOFt3Wt9bNablBID4RKL4D3g
	wg6x7qai8CZwzdERZf/AnCgVVCABZDxrhBm4+3Ud6c5AnhIjA2TA/UpstU/qGbWu
	+pWrTVu6616q2Wi4HqFtVl+AGsMqXRERL62sHA3SQOIXs9juL8KIHh/u2/Lju7rG
	M+R4VT/5h+i59gwg0bduxUeOpuKM3zoFr5pBjSK4hmThUnqHwHC5S41U3f010/Vm
	yRSEenFCQbwavL+2kM2e/Hcge38aLh71cAdRl44mye1AUAnxyt/RCCt0icuwO1YW
	INbz1w==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctg1mtpbc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 20:19:00 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c738563e61eso4143867a12.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 13:19:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773173939; x=1773778739; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9TmROf+bPb6FNDxEurt6WhWR2L8qwZm5Ni95BDxLLsk=;
        b=c7/neEOgrsodjS2HuECUIxr23vrCrMYJlk8alfWeYYh//tzRp2PS5kZl5afBOATPgG
         ViGyUcZnlYjxUcteWO1LT1IuNGFtDGv1/ENkyiptl+niUMVy5U5awXKrJgS4nEcJX0fw
         XRxnk8mOV0NntsapoQ37sTjPe2oxwMJCcQGrZD3IKZBclBHoDu3Guc8cKms75ArOa144
         cozgDNGqtyjfmnIJpf3q/KgA869Ltry7+4zCRZSbPDWtS0MC68R2xcZs7h/CRD6lSp/k
         iXLbJL5IzaSWVC4lU5ebz7sgIoNuM3fNjp0kUN959rOuPcHiNL8GgXHhf3VEI7X4iJts
         FBDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773173939; x=1773778739;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9TmROf+bPb6FNDxEurt6WhWR2L8qwZm5Ni95BDxLLsk=;
        b=MzxaRTWS+iexyoT8hZ4Uhv5pX6xbgSabWrp3iDA3t+m1ObUqOQ+p3P3fGa7qB0tLCf
         Di/1lpYdJs62rPX4dCwrnXzARJJvxAOGpYOwurGn8sTobMsd8c83v5NpKpikzvXshmhF
         OHcxbxYMk+i0K109qxeVJzF6mv56Iuopa++xOqSmYMGIp5RBkGBLKVpqkznCz7mP36BD
         ElKonvPFPS7tDUta6PvXp62tM2m0WxeWqCgBKyUsZG/Q/dtqD9/jFmAMqIjaNHBlCMNI
         iHXIjw999HXYLjlImWJWfSiLEPW2gkp+K8C7Rpj0I6Na+2upj/owAA/fBopZttVlP7nl
         m/0Q==
X-Forwarded-Encrypted: i=1; AJvYcCV6YxhoJMCV/FLKSK+RBOumGT3cyVFKWXKOyShruwlFFS4cAt7mJXcxzLLA8joOgUUJyQ0hjG0Kn26M/0U4@vger.kernel.org
X-Gm-Message-State: AOJu0YzNCyJhknDUHPUBImAfk8qcr8Uz8sJ8+NBDYzoBbhV14VvQUSW9
	6S7Eqsz6kL6SF7Pq5vIwtQg56pe7XigL+7G6gM/H6NNxulcV36gM0xP4yz43BzIx4P54qGT/Zyt
	xVbvqTC9oqSnQ4SDU5l1JU6dGw6bOZinE8Yj0UeftCqm6cm+4fB/0DPyFKTxBNsU8Gojk
X-Gm-Gg: ATEYQzxwEXzhhtPa2I6dYumHr3ynOQuO0ak2s/Hyf7JKi2T9rJYr9hYwtyvP3fYhTB/
	vwDkrJgkYerQOuMPGtXXybTd5tLQFc/wdumYpJjy4Pb/NCAOh1uLUDznMbSviYRp1NSENRJo0dj
	zaoGBpS1mAtvBrVVYysdwb+VVfHLcjeC0px1yLUlKuCb1nd5jl004l6N6/DmnU9V8jqWyZ5iLnU
	SqAtg9K3ksw9Ots6cdiOc9MAR3kdnoYF4C+uQ7JjtZX1U9ZUh26yB2cJL2IeKFs7AUY8VlE0ZOl
	XQd1bmrj9K7oIRG41OUpfNSQ3E1egBMh9gIvlqJsOQrc76bd7Ffc3OrKtN0pN6QxV5p52/KiZnu
	KCTWoLaQTinvNoz7VusyzcIAeZJ+h1CmjAn7KmgLjMLDtRnKi
X-Received: by 2002:a05:6a00:a208:b0:81f:852b:a934 with SMTP id d2e1a72fcca58-829f6ec4858mr185491b3a.24.1773173939247;
        Tue, 10 Mar 2026 13:18:59 -0700 (PDT)
X-Received: by 2002:a05:6a00:a208:b0:81f:852b:a934 with SMTP id d2e1a72fcca58-829f6ec4858mr185434b3a.24.1773173938596;
        Tue, 10 Mar 2026 13:18:58 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829f6dc2d0asm115262b3a.13.2026.03.10.13.18.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 13:18:58 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 01:45:55 +0530
Subject: [PATCH v2 11/25] kernel/vmcore_info: Register dynamic information
 into meminspect
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-minidump-v2-v2-11-f91cedc6f99e@oss.qualcomm.com>
References: <20260311-minidump-v2-v2-0-f91cedc6f99e@oss.qualcomm.com>
In-Reply-To: <20260311-minidump-v2-v2-0-f91cedc6f99e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773173756; l=1244;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=W0/rYOUIz9/ZCoXh44K186q/e3UtR3GkqMBkRm9T0k4=;
 b=ludxEbTdMls4VjiNy/QHAIk8/k+SgkzNMzSydpcQb8gVJ4uiMEuIbGBNqWIItJVo0Zf5Xkd+v
 kxXcoDDsIsOAhyrZZK7SX5Tg2/pa7IFWKbP5zQo7BszRJRELF9pecT6
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Authority-Analysis: v=2.4 cv=YOeSCBGx c=1 sm=1 tr=0 ts=69b07cb4 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=6_paXCCOVaejlYIppVYA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: RGQwi_pZOms-8xyqviOzwBRXW87YfcG3
X-Proofpoint-GUID: RGQwi_pZOms-8xyqviOzwBRXW87YfcG3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDE3NyBTYWx0ZWRfXy5wv6b6RFQSf
 bTeryJhpBhOu8v9/rdUfUsnvlv7+R/TZ1/6ljj8BItsJXiaICIT8snMvGA1jLIuuFj4h8wBk+Hp
 Ja3TtKOYSTh49xNyr75cvhlKs3jze+iIi+OGIsquVe7oZbXwjOjbv41BwoK/Rz5BFEP88Sp4XGs
 Ugk49E5s8AbWL+CNXhiBeJH/krWu8V9GtNf6qXZ7vEdrjp+R+EDXzx2phMc1nGZKCbtustUQZWh
 09hjQgxwI+vPhl14Fv32gUvhauTU2bz6/bs+h6cye0fS2/BUsUIFoyOMOCtkCkA4fZtr2HPF36W
 bOX+xURbWDkPnGaM0PNgNfNC+LG7pW9w8XmSIz2J7pgDaTKbutWgriavdreOVtszWmO7S/hVrAv
 8MZK6Wumw76M3fOm5I8k6ocHCgkCncYjHy++hUxEm+W10BXXhj3koidHtzfc6YfzbYh7pHqiiKo
 SPUMWIA/EnQkEwVUn8g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_04,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 spamscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603100177
X-Rspamd-Queue-Id: 0457A2579BA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[lwn.net,linuxfoundation.org,linaro.org,arndb.de,kernel.org,gentwo.org,linux-foundation.org,infradead.org,linutronix.de,redhat.com,arm.com,goodmis.org,google.com,suse.de,oracle.com,suse.com,cmpxchg.org,nvidia.com,tencent.com,huaweicloud.com,gmail.com,lge.com,chromium.org,oss.qualcomm.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96760-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,linaro.org:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_GT_50(0.00)[57];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

From: Eugen Hristev <eugen.hristev@linaro.org>

Register vmcoreinfo information into inspection table. Because the size
of the info is computed after all entries are being added, there is no
point in registering the whole page, rather, call the inspection
registration once everything is in place with the right size. A second
reason is that the vmcoreinfo is added as a region inside the ELF
coreimage note, there is no point in having blank space at the end.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 kernel/vmcore_info.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/kernel/vmcore_info.c b/kernel/vmcore_info.c
index 94e4ef75b1b2..4ebb280dc38a 100644
--- a/kernel/vmcore_info.c
+++ b/kernel/vmcore_info.c
@@ -14,6 +14,7 @@
 #include <linux/cpuhotplug.h>
 #include <linux/memblock.h>
 #include <linux/kmemleak.h>
+#include <linux/meminspect.h>
 
 #include <asm/page.h>
 #include <asm/sections.h>
@@ -249,6 +250,9 @@ static int __init crash_save_vmcoreinfo_init(void)
 	arch_crash_save_vmcoreinfo();
 	update_vmcoreinfo_note();
 
+	meminspect_register_id_va(MEMINSPECT_ID_VMCOREINFO,
+				  (void *)vmcoreinfo_data, vmcoreinfo_size);
+
 	return 0;
 }
 

-- 
2.50.1


