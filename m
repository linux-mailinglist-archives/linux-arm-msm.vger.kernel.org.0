Return-Path: <linux-arm-msm+bounces-117495-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id X44KACDiTWp1/gEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117495-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 07:37:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 95C1A721E95
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 07:37:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=P+jq7OyT;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=h8xkuJtb;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117495-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117495-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5A1623015C09
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 05:37:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C60DD3BED37;
	Wed,  8 Jul 2026 05:37:15 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 610583BCD02
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 05:37:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783489035; cv=none; b=lzF8lAcVQ/AZBItPwJ93uGYYWSOy0G/AWewUxMjJ2sGTnz+c9vzZCVDMjYjYFelgHgbexiTqlhrzioO15tQ/h1EB4JP88hI7ia5QrzrHpPUrkLL/wqCBGCwIR2NzcAXrVY/1b2ifPMieZ5GhqyO7zkUhUb3Z88HSTMBWvCFkUO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783489035; c=relaxed/simple;
	bh=ulGsdKu+z7HvLotkVxGi0y8RHEdMhDyQClvnrll+Bzk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L5RHR0iUgNt+N5SJswXfJ/0k4Ltd/Nj77Wurlgw3a3fPhZ/Ws6bvUiEIh2zoVF10RoF2xNcecIJShOUuK4MVnNmBNzFIdY369o5J3g4lWXJHxTlI5m58tTT8G/zTHWCQNDDH4GAGH8rqze7g4PgnQPHUTZGH5U1EKaxZ6XBZT+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P+jq7OyT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h8xkuJtb; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66842lX21645127
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Jul 2026 05:37:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	236Inguw/8J4ynlJvnfLp1ewWMlbBoPnuOUaZpd8dt8=; b=P+jq7OyTqjAc9wXu
	RxNeVEVWgYrBpdAGK5o3b6AWPpRdC/g1cbrqpKSQiGfUKvq1e+0DgOyE1riJOnZj
	lMFxe7ytkjieiLs1bLJJoI6UfdSwS/kZFnw6Ci9E1IqzyI6Y9DJJ7r08KjH1V0ru
	9wrL3tchIUUG+dXTt3ewbVrMxTEodI7+6+wCRFSxdpxYZ7QWyJD1wL8qcbsxkW5N
	PWAAHB8x9PzRoHQMrt8RSH2RzIU9BvQagmTR5nMG7cOd30b9kwE3GnbuBDdz/2dk
	0MbD7d+C9BijjANSzQYL0Nrm5mXyk//z9XTUjvKIIksxsnJNEWkm7PJ44mkMqK5t
	bfEhbw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8ye0maxt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 05:37:13 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c894391f000so690846a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 22:37:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783489033; x=1784093833; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=236Inguw/8J4ynlJvnfLp1ewWMlbBoPnuOUaZpd8dt8=;
        b=h8xkuJtbuDUK/6glmEL5W0ajqq21kzfRtjwCvyXm5wtJLYBGQweI8X/ZlHcvHOTS8R
         mCzSRT8AWj3x9dao13wIdi8Jw+Vc1S476/bExe0K77kYkdeGl+S8AYj5D7iR7iTOUhbN
         0CraUq8PwP8pCV0nh04tXClOkOwYZZ3U96Y6laQEKuHs3ooX0+GQlbH5yQgy9QA2Eoqr
         pWACC23IoU85UKqnIbwnH65DZvaGuPOcTZkhGprHIW25eUJFcuhmNQ+WO6pmp1p69cTn
         Dd2y7+Bo4GDXGgPddQ6SlIEJikmMXOVSlSUzslbWnUNEPLYYjTqaP8eHJJn3cbyA/9fv
         wKGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783489033; x=1784093833;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=236Inguw/8J4ynlJvnfLp1ewWMlbBoPnuOUaZpd8dt8=;
        b=KgspElssRYJn/GCt9EU1jlKWZ/UPgK5OtXxrqXg6V1n+41+YnYASXNG0yI/t7BzAeL
         aKpOeNghbaFDKl8U+At4x5tN31y7XABCYUGB5h5FiVG3hbypYEyX8Tb5PmA+2iNrGPmn
         SfsIAnMUmBn4lAwzujEo4aI2eXFBN1qbgMvhWLab1gvOZYzIHuPQ5uHXuMc+LlF15gUW
         aD9PO/WAH7++OMmIM5Cj3QRKzZaLhoJsFDH9mc10arnkumr/Tzh7+K/Ri9mllItQf5Xj
         cDGP1XuPXDfktlxhMgj+rUW2A59GmS7pLseeG6BlQAB+3hfKUyD/vY8evOOjCBeN7OWR
         4iXw==
X-Forwarded-Encrypted: i=1; AHgh+Rr11qBDz0aLYb5h7JSl0wuKXT2R6fbSg5MkrdS17ribAKem0qGfPKKbYVd9ExR6uVHI/IZh2kPDEakrz/a3@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2BMssU13U37hV4Iu+LN4Q+m1eEjWSgeJ1OelPvybOtZP5gmu5
	O7B9COIzeFUbcgLPBK9U7j+f/Rsvw1RzUPzM86CURvJIsdD8Abm/R9rg8B98SSKKBdxBbxRTBDz
	MgYIgikrTMkXU7LxaPqAMrQQJf3kkTjeI9dCDT2GoUIl9EsrlWZLlJdu1fEgu+gE+a65E
X-Gm-Gg: AfdE7ckfpE8RW81HdCczPOsCYNwyReEPEhmecgr9olhuMG32kR4mo7XHkWL9xjelBaz
	jeKD+obhVto7mRtzBHvttT8N0xCL7Anec0Hpw5kKRfNIBTlS1xU91JzCml18gNJ+L28QJ+W3BhT
	ZCXT34WOI/w4cQ1O/hagiDc9XO9tZRFcAe4fs0OTv+SGdC2EM933xHORSJ8jZ8zrAk8dS/NmtUm
	KX/ouNMSwSNzi432uglPfSVQ3vLhERNrqJ1if4rwnilbkWsRw2/e/Vvkzx8TafE+r+0BAEqc2tW
	vjwoIoH9aRoZYz1X7jgGO+qS6CrJ35RDV+B3G8yglvbDsWWOuhOT18GxaQTNkQJzn8Ie+Y1rXs5
	MdTMDP9vaBfAB/2u2HmiuEssMGvUfKhnXyNJplQ==
X-Received: by 2002:a05:6a00:2990:b0:847:927d:47a8 with SMTP id d2e1a72fcca58-8484327cab4mr1157483b3a.18.1783489032777;
        Tue, 07 Jul 2026 22:37:12 -0700 (PDT)
X-Received: by 2002:a05:6a00:2990:b0:847:927d:47a8 with SMTP id d2e1a72fcca58-8484327cab4mr1157416b3a.18.1783489032130;
        Tue, 07 Jul 2026 22:37:12 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6db29d1sm6484592b3a.53.2026.07.07.22.36.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 22:37:11 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Wed, 08 Jul 2026 11:01:58 +0530
Subject: [PATCH v3 19/26] mm/numa: Register node data information into
 meminspect
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-meminspect-v3-v3-19-7aa5a0a74d5c@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783488714; l=1048;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=ulGsdKu+z7HvLotkVxGi0y8RHEdMhDyQClvnrll+Bzk=;
 b=MyMhtvJ0wOXNwjzXvlmiA8Ab9JBujyIxKxBCpE0ObhCZPfckWyAffIDGpRxS9EBhvOuKic1KN
 jH7INpGJKThDjepKcHIt//QYPSzCAx6MP/DqcCdV9jTWtJ2PBlwoCaR
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-ORIG-GUID: lxHfXxqb9umiP7txlTz9vbDsNfJOQfTd
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDA1MCBTYWx0ZWRfX+x3G0QSKb4JP
 zPuFtto8yn10fj/6PLb1YrTjfXuymYBzrFcbu/8gh0e4kf8yp+aVAZ53vVxAjKQfyytTonB0QFF
 VPIDqpYcE8QvlocRd9+rGjFP+99ng38=
X-Authority-Analysis: v=2.4 cv=SZfHsPRu c=1 sm=1 tr=0 ts=6a4de209 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=nLJQaZXserL0MincpKQA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: lxHfXxqb9umiP7txlTz9vbDsNfJOQfTd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDA1MCBTYWx0ZWRfX6keFOrjx52z8
 OaGr8NpFz35UYCnrtbhqeiZ0bTNSdl5d/3bsqciCVp8W7+pXgy+RQ7+mXZqsxQRjjqp9Z4FZxs1
 DC5vLOgih1baP4HpDd9lW3fNXWkNYaQlYSKvIUz+q9x1TvdA+uvDRC0C3WPNOU86KZEk736pdBv
 40h3NRwbqf3RQxCBfNLxmHQcT2MB0exChNteNHMmpT1eQkvSI2BhRQfJ+WmOZTZJR8HD7cDbkFj
 zzM4VjubIXQvLvjixm6ofncT5PlQY7UgrUnetn2nvEK6jtzvZo0ylEezETYq4l/P1AxNmeATjfV
 fdnbC8F/oCPGhckgaXu9Z62yA9IyyiYuShUIzJPsOnLAspkfBIVojOY8X/6caUkat7He/O6f3aT
 gWGquHH8CxnbfGd2mjEsomrxbVtyP9Kna5niaKGNy0MpYM9TnlvHYYIRVUD2rtVsVTcywwTtaaC
 qN6rGcU4WRqzRkI5/NQ==
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-117495-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:ehristev@kernel.org,m:mukesh.ojha@oss.qualcomm.com,m:arnd@arndb.de,m:dennis@kernel.org,m:tj@kernel.org,m:cl@gentwo.org,m:akpm@linux-foundation.org,m:tglx@kernel.org,m:peterz@infradead.org,m:anna-maria@linutronix.de,m:frederic@kernel.org,m:jstultz@google.com,m:sboyd@kernel.org,m:kees@kernel.org,m:mingo@redhat.com,m:juri.lelli@redhat.com,m:vincent.guittot@linaro.org,m:dietmar.eggemann@arm.com,m:rostedt@goodmis.org,m:bsegall@google.com,m:mgorman@suse.de,m:vschneid@redhat.com,m:kprateek.nayak@amd.com,m:david@kernel.org,m:ljs@kernel.org,m:liam@infradead.org,m:vbabka@kernel.org,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:jackmanb@google.com,m:hannes@cmpxchg.org,m:ziy@nvidia.com,m:chrisl@kernel.org,m:kasong@tencent.com,m:shikemeng@huaweicloud.com,m:nphamcs@gmail.com,m:baoquan.he@linux.dev,m:baohua@kernel.org,m:youngjun.park@lge.com,m:pmladek@suse.com,m:john.ogness@linutronix.de,m:senozhatsky@chromium.org,m
 :andersson@kernel.org,m:mathieu.poirier@linaro.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:saravanak@kernel.org,m:workflows@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arch@vger.kernel.org,m:linux-mm@kvack.org,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:devicetree@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[lwn.net,linuxfoundation.org,kernel.org,oss.qualcomm.com,arndb.de,gentwo.org,linux-foundation.org,infradead.org,linutronix.de,google.com,redhat.com,linaro.org,arm.com,goodmis.org,suse.de,amd.com,suse.com,cmpxchg.org,nvidia.com,tencent.com,huaweicloud.com,gmail.com,linux.dev,lge.com,chromium.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,linaro.org:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp];
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
X-Rspamd-Queue-Id: 95C1A721E95

Register dynamic information into meminspect for debugging:
 - dynamic node data for each node

Use meminspect_register_pa() to collect node data into meminspect.

Co-developed-by: Eugen Hristev <eugen.hristev@linaro.org>
Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 mm/numa.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/mm/numa.c b/mm/numa.c
index 7d5e06fe5bd4..f04740dfb2cb 100644
--- a/mm/numa.c
+++ b/mm/numa.c
@@ -4,6 +4,7 @@
 #include <linux/printk.h>
 #include <linux/numa.h>
 #include <linux/numa_memblks.h>
+#include <linux/meminspect.h>
 
 struct pglist_data *node_data[MAX_NUMNODES];
 EXPORT_SYMBOL(node_data);
@@ -20,6 +21,7 @@ void __init alloc_node_data(int nid)
 	if (!nd_pa)
 		panic("Cannot allocate %zu bytes for node %d data\n",
 		      nd_size, nid);
+	meminspect_lock_register_pa(nd_pa, nd_size);
 
 	/* report and initialize */
 	pr_info("NODE_DATA(%d) allocated [mem %#010Lx-%#010Lx]\n", nid,

-- 
2.53.0


