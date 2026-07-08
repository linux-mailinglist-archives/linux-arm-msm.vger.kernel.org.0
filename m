Return-Path: <linux-arm-msm+bounces-117487-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Z5aADCjiTWp9/gEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117487-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 07:37:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E4D9721EAA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 07:37:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=pFo9WSIh;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=NLEzr+R5;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117487-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117487-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BC1223011399
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 05:35:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C1453BB13B;
	Wed,  8 Jul 2026 05:35:25 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA8CA360EE4
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 05:35:23 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783488925; cv=none; b=s0ryFFP7MElOyTwovJedZDGqYmUHPyLvZU3TwkEmpv0mHkZ+Dy91ZOh1ISW17YkEVetiBPufUF62NFZ6Vxp7LKnOEfzmBmErDhqIWfLVQEmE5BVX2YfhjnsT0sYQMIUXC/SMQB284TsA5G4k7dTgjLjWO8L+j78mG/7NcbMKEa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783488925; c=relaxed/simple;
	bh=kXuP+iYqiN6Gh3fmA4NpDHbdFws0o7gCzdFgMdl0MNo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gUfYWXdJGI3DwyZa9s4wjUnBPjAuponD+TscaESf4zbCF1IS85qnftfcJu1+h5GqXgWbKaKlmsQFLGsopGXNjPv0AHlPFgyfZ95H5oI6pW7waDhDikbdjUaKqePo7ShE5DNthdi0Mly6Kfw0FhwtAeZpqP42Cgs0DYQUotlFpRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pFo9WSIh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NLEzr+R5; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66842Cls1656537
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Jul 2026 05:35:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+3x+TMMzYs51Q57TTs1j42iOpyhdFk+I0hp3TICnwjg=; b=pFo9WSIhwEYdEYNM
	wWtorKvFh3bDjSxFAinXAxdKwm7Z024P8hmHhadMiLzMLCPdruqT4rmAkY4tQewl
	ElxyGsMl3gajlha+6ZroCW63wi4nK1ktdBuPuX3FAL9ZXixN/0lx3tvC3Y7lNvyR
	Yt37rMWQBgF6yWC5dLeTfFhuwBZ3VQbRD+U49GV2ROHTYrVtws5GaKRnlbgrdpHZ
	M9IeaDbto9UL5CGReS7Hx4YXldYcCpau+lqO1CfXLCQmq064VIbY5TSiGRZKMPxl
	6MIkzT6lV54A4TStfdW2tLHHia2uaiAGk/gWoiKa4LRQQf7oCcF59MGEh9tFrS5Y
	PF8WXA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9cssrttq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 05:35:22 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-845ea8fd3easo752264b3a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 22:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783488921; x=1784093721; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+3x+TMMzYs51Q57TTs1j42iOpyhdFk+I0hp3TICnwjg=;
        b=NLEzr+R5WsREVMtSlKqx3g7oz3sn7jpQFjtnrh9XUCCJMo8o2MSE2ym4BCSb4UEvVf
         rdw97vBQsNueVZgRPZ9UEOV0Acu/JvJKo/+rH9oW8H17BxlOCPT9PSu3YjhcCipdUCk5
         mdQ++022x+uVQ+otXpDK1ES9YVzl2zGq1kS0Bfl3bJBkl8+e9SK8biXT5n8bQscwGLp6
         SDgUbefSb9ab60YJtlAK7sgSRjHwQbMlsm2mcyXnm23zLfcdfTICXqDmzQ1ZC0YAlgrm
         Fnzd1MOGmcJimFCP5vL+L3SOZVfNVpuhxsRpa+raG+DYg/1YCYwoNDgmtBsjxrw+Ag66
         Ov7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783488921; x=1784093721;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+3x+TMMzYs51Q57TTs1j42iOpyhdFk+I0hp3TICnwjg=;
        b=AHXA7IfVcVbM5jgkLHE+6r2HhpdB7T5oe2ikC7+Eb3YY2le72A6c9LVjlj34kvPkeI
         lxgZzcaF20lgtZnJzW6yOSuB5tpEpQdzkYGu9Vn4IUrMAgeb/YZf5OQZeEZdS3AKZ6EY
         Enl4E1RHylfT1ouv+2wltvhAwnx8r58EeVzoS0FEVeZI9V+Zy3poC2QAIakLbdtD6/qO
         kNVxOX5LbNMt+/eK9y6IkDUgjbmz2nIcII/xRb64/u36vlh9Zu3xoOvaEaU2uSIA36DM
         q7hzeB/m9wNcX0vzIYsVUIkP3bZQXAA7K8H/dBlS0xOpj9F1fAkiPzPrVWoEg3YKbRvl
         FF1Q==
X-Forwarded-Encrypted: i=1; AHgh+RqPoumfo7ErG48M23BN5Q8djyjb28Ux35tFhZYEi9sLCe80BjweLKoBQYQq8Fwjf/4dzqy7fDG6EboTuJzQ@vger.kernel.org
X-Gm-Message-State: AOJu0YxcU2J8+2hYH/XR/COKJ78x8zUeX65jPKArJ0nUbK8zYBxXrXdF
	xUijd4kP2Xh7M4Vs+f7bNPuXfVzB/tdpR9pLfELBbKkaHTYsnfKdDaQ839qErz2C3NawnvObKy9
	O5hCfRUsJY3u9LWjsA1gnXBtl5MfPlcLFwcuvXKiDIrxAU8bRcPjeNu6+UTnG/H68o8CQ
X-Gm-Gg: AfdE7cmfj16rdhfe1U+Lljc4Tz9vHwysiuEsmobSXMdNja8zcD4RkXiSxi4bDrcrmKN
	J7ZWbLAfAbVaFAId1/pWMYZj+VyHEKmLVGUyJzSh07EBd2CafA3IKFry+FCPk33ZYQIH1K/x5gn
	vYVWhWwqgjU4LGIwCypRm+oHLdIWZ4sEaurD0Z75Bol7C3ZKU1g7GF9UKgb5ORrEJoy1sGuT/Oh
	4UxvX62Ytlv1m+Cmf3cqnaFJDxOsC7QOknezUvtQRRB1vLmhq9DN4Aibc65Bh/XqcMbJyGqmNOs
	Qdib2LYXTCtn/tNH15iTDXxbXjTWJWcBw2dZF2Yk4u7gk+790B7DLuQd+PNRTJsGsbv8ZIREwYz
	l9MdJRJRwO0knXm/XHIJrETW+npWRJWF879YgFQ==
X-Received: by 2002:a05:6a00:3c94:b0:847:8bf0:b82 with SMTP id d2e1a72fcca58-848438cc8a0mr1132129b3a.60.1783488921330;
        Tue, 07 Jul 2026 22:35:21 -0700 (PDT)
X-Received: by 2002:a05:6a00:3c94:b0:847:8bf0:b82 with SMTP id d2e1a72fcca58-848438cc8a0mr1132049b3a.60.1783488920709;
        Tue, 07 Jul 2026 22:35:20 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6db29d1sm6484592b3a.53.2026.07.07.22.35.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 22:35:20 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Wed, 08 Jul 2026 11:01:51 +0530
Subject: [PATCH v3 12/26] kernel/vmcore_info: Register dynamic information
 into meminspect
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-meminspect-v3-v3-12-7aa5a0a74d5c@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783488714; l=1258;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=5yycsUBwoFxiKNQeKvCsF+mVUdasuljHstmWvn84Jps=;
 b=dh1WtDpiEGxqTk4F/COwgg2DhrAd3AuPXNJplwhLTNVJqIHM4OhNRd1Zmmkp2+owqTNHhWdct
 CiAtW2VX+qgAIDAxAIMI67SaI2XkeGHgfZ7O/D/Y9bcG/K5XSCTPfU+
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Authority-Analysis: v=2.4 cv=EtziaycA c=1 sm=1 tr=0 ts=6a4de19a cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=v3IzjsPwLRQtBGjmhGYA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDA1MCBTYWx0ZWRfX4tLOp62k5SqC
 mObqX+okWCg1Bup+3LWp/MI4XV6czfX0IZBQmH/vppuatVJot6e4/kjsaVWvhv3z56LZJJ6ayQ7
 f/06jTU3/FNXme3rrOJkj4lICwmbWOpp7se91Ub1nka/cfCcunE9rlNlJaLsKOjQI/XtqWnrp1s
 vHYGzd8V3z+s+8t/64os9kFli6UNBIlTyoTp0XWYhudmojQ8RbXefZSNiydZdii//fWldt3vPnG
 HEH8zvj4YLKP6+uBArcOeaO5AJHf/Uo/Os2oItc49H0SixKDRqsDt35cC4tzPWsxZyzVuBaFi7n
 wUsIIxV8tvcLLvgi/ntYXUhz69db65ofpeWYYbHeSIBTOXg6vq9LN8jXgVxTaTaa552ePvWohVy
 buWnTPGTW7N2X1w+d1+176JlnNof4EqutuSDTElX6/0wRn543Syr9dHD1fs9U7CUTV00ilCetf5
 YsBdQHcBxTJtOxygI6Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDA1MCBTYWx0ZWRfXwNi0/6nYjpad
 WwE5O1LzFg1pPFGSpyv684em8Fzafe5wPs0k/uXYU6vuaONcYYKiqYeV1D5B6Qvmcm4sWwUM//m
 A2aqLqnmU+bPumWvvbv9DLng6En3un8=
X-Proofpoint-GUID: tIHxs8mSpve8sUk-bEahMsKHkHAmgMg-
X-Proofpoint-ORIG-GUID: tIHxs8mSpve8sUk-bEahMsKHkHAmgMg-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_06,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607080050
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
	TAGGED_FROM(0.00)[bounces-117487-lists,linux-arm-msm=lfdr.de];
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
X-Rspamd-Queue-Id: 5E4D9721EAA

From: Eugen Hristev <ehristev@kernel.org>

Register vmcoreinfo information into the inspection table.
Because the size of the info is computed after all entries are
added, there is no point in registering the whole page; instead,
call the inspection registration once everything is in place with
the right size. A second reason is that the vmcoreinfo is added
as a region inside the ELF core image note, so there is no point
in having blank space at the end.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 kernel/vmcore_info.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/kernel/vmcore_info.c b/kernel/vmcore_info.c
index 8614430ca212..c5181e9d049c 100644
--- a/kernel/vmcore_info.c
+++ b/kernel/vmcore_info.c
@@ -14,6 +14,7 @@
 #include <linux/cpuhotplug.h>
 #include <linux/memblock.h>
 #include <linux/kmemleak.h>
+#include <linux/meminspect.h>
 
 #include <asm/page.h>
 #include <asm/sections.h>
@@ -247,6 +248,9 @@ static int __init crash_save_vmcoreinfo_init(void)
 	arch_crash_save_vmcoreinfo();
 	update_vmcoreinfo_note();
 
+	meminspect_lock_register_id_va(MEMINSPECT_ID_VMCOREINFO,
+				       (void *)vmcoreinfo_data, vmcoreinfo_size);
+
 	return 0;
 }
 

-- 
2.53.0


