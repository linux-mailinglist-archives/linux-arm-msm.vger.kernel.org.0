Return-Path: <linux-arm-msm+bounces-117482-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id oQaREVDhTWoi/gEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117482-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 07:34:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E5F1F721D96
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 07:34:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ZLEn2vC9;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=WoUBA2mx;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117482-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117482-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5F88E3011A75
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 05:34:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 755603BCD13;
	Wed,  8 Jul 2026 05:34:05 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC83E3BBA08
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 05:34:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783488845; cv=none; b=haUeVVLkJ8pH2x2hR/ZswhOhRysG+n/pGo4uYIWklpKxfdVlTyVSzFN+M33rf7Str+UYnOu0GakxrJAuSSKkLuA84AbSIPlVlrPYoXv1qXt6wWOrlxvZWzXUzlxvzd5SQL3t+p3mhtBFmCZzeVf+4NzJqJLoZx6jLmqe+yeqEBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783488845; c=relaxed/simple;
	bh=/537SqZjhoVd4pyQoK/eRmCVxxyWSUJ6mvHhf7gAvZY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ql21av0eSeCKMKyRbBGBCWf4Bv+2jLWhBwYjEyZQx5d81FGfqTs06372gZLlm0tn4dWqs+OqarHUSsxsT93uAUzEx0OPKkN5x83PrU4fY+Flj8v2QbSkBSfWTj280If5Xcn+GOYsRiFZqUyvRiWDdO0YbeVu9op9DCzPVw/L5ck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZLEn2vC9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WoUBA2mx; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66842Th51447437
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Jul 2026 05:34:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4HpBuqrozdeTyOtYEWu93SJI5zpFDQRgHZKn95naWN0=; b=ZLEn2vC9NxxlEGc4
	1NncPtbQ68ubHxWs4R7OVEJkvFYOJ8VJLWeaJKwtIWrm/Kjz1b8FL+bkRIscEhBa
	RHIhgaMkGvVeB5gzoG8Z9KilGd0oPTeNqemM2c5nhLpwefyLULCtJ3FGm1IRSGA4
	HOKs6PhZRS3AcIwR0u/aPAOb/46ChHOniWeCtWmsWQ8wIbIADMJkv9hvkDTcQ4sC
	j/4/TUTzyHxbVPTBZFTsuv2R1R7/4Dp+UBTLePYTFf5KCZLwuomCk1/DUqKOMJqi
	ZotjZSvlcje0VhjwIQA0CIjCu2yZ2Fxs3Hh+fC+L4XlZw7WlicRNQNdo4jwfDSum
	Bc7CAw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f97u11tgp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 05:34:02 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-848415e9e8eso545946b3a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 22:34:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783488842; x=1784093642; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4HpBuqrozdeTyOtYEWu93SJI5zpFDQRgHZKn95naWN0=;
        b=WoUBA2mxGoUIN5FkE2BJzwUT5+yZEOliPP52ATy1/+ou5jm4Hfy2OgklPRTOYStGFP
         +t56tV2nR2vaO+GO2+OVZlPP1E2aKwTgMlVrEMU5zvurgMWsGBHjJQ5tUsQa4snVt8qP
         5A4ggDXLJWyapj8U3xU6PcLevnpCjD5h4CGxEUAdLKBMErH6w2VL5/UxWyesKsKsmo8x
         biSHgxw6+/vx4FVqyIFzNw51Gnd0XvM7S9Vs2CiEi5pX4qqtL02gWfDBFGJ0aPVCKpwK
         9Tt8fA4E/nF4vdnI/Pp46WL+ijvyQybVOItoMtQN/mxZBLMuDz+JgK9qJGxF4hBjGJ24
         vWFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783488842; x=1784093642;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4HpBuqrozdeTyOtYEWu93SJI5zpFDQRgHZKn95naWN0=;
        b=OjQba5AdUeZ8uVRm03Jsz8SHmJMVF+KBiGoICCPlj1wkmxwchN1MLSuN/kqg4tJayU
         tmyYMPRdugw3Gd1MyvnVnzQi7oOl1+Bs8nsQZxS3Uv0FiMc6nnl8PMqBFcx4q9RbX6NA
         Rg0YRVnooAF5ZjY84QuvL7uytSU00XPBmX5+kKgvAMaOEPkmGKXbqgLu3JZEiUaMQoV3
         +hTbSGEufjwTWlgHS4ol4Iqr0cOHNk3acogmFBa5Gaym6+2hfPMDR7ltC6qO4tdlNHGA
         y0gSDR15EI9siQsacN2ErMSiJwEAuLFm2toERwEG+1uPmyju4q1ULOxzcc6xdi9JGbrw
         oseg==
X-Forwarded-Encrypted: i=1; AHgh+RrfCXXMDI7bPMeetNikf9yZVdOmumIG3PpCKEJIyfJ+164Eml76GYJWvhc6Hu8nfcnROVOXNlDRVE1Lvc76@vger.kernel.org
X-Gm-Message-State: AOJu0YzmfOnNzSql8jumVYvoQGmAsqouihWmnVgC6BYaVbuwhIBYM0+1
	BJfdj+PH3XsLL4a6RqpBvBME+RDNGHWrAlk9wQ4yKCIWnlQf3+EMsy3tx00WTo/6s3NjgiblP2G
	Rmtm0rBdZzHT2sm6eW77/2iHfsqObcWKJTkm/yNc17zUTgjgUjy7yypfMzzBV4hY2XpQI
X-Gm-Gg: AfdE7ckvE31AxRsqSbGHk1/jAaFpLgM/Ni9Xt+EKPHuK5DA2MWO92pZ/ULEX/JFHRdJ
	Bh8vtlDOeJoy1ptAoo7cRrVggGK+wK3ELB358wKLj2+WFdbM/x6S2DgXBGYPST4j8Mjnvoqr+hE
	wWCtN24kQTCZwZlv8vjSaslVu4CFSInczcYXQ3TsMLquE1H6vugO80vqjSkrjIMt6t8zQmOHiEW
	V8pSEncT9TwR0wVp/lsvUq6vQ17wiyaazh99vVZh5wququfJIuJQbl458w0M/qYIbjB6LlQb0Bb
	fP07ESqaNVOfX2EgAQbu7UxB47eA3XRTG83BOHFm6P3JR3rIu2gzGFO/2ewdXTXWWwppn+y2no9
	cquolTeUm7R6X7bExSbXKmtYK/vSkJ5xUBnVgwQ==
X-Received: by 2002:a05:6a00:4fd4:b0:847:9745:2f8f with SMTP id d2e1a72fcca58-84842ef9336mr1249182b3a.18.1783488842136;
        Tue, 07 Jul 2026 22:34:02 -0700 (PDT)
X-Received: by 2002:a05:6a00:4fd4:b0:847:9745:2f8f with SMTP id d2e1a72fcca58-84842ef9336mr1249126b3a.18.1783488841342;
        Tue, 07 Jul 2026 22:34:01 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6db29d1sm6484592b3a.53.2026.07.07.22.33.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 22:34:00 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Wed, 08 Jul 2026 11:01:46 +0530
Subject: [PATCH v3 07/26] timekeeping: Register tk_data into meminspect
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-meminspect-v3-v3-7-7aa5a0a74d5c@oss.qualcomm.com>
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
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org
X-Mailer: b4 0.14-dev-f7c49
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783488714; l=1559;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=/537SqZjhoVd4pyQoK/eRmCVxxyWSUJ6mvHhf7gAvZY=;
 b=Fve9cp8pIk0fRrev0JiMgnk9tJtf1Nbcov5h2qnSMWvoYTJmuNKoh/yGQ3zv9wJ8+PXmUs4Ad
 m5Vo/TUy3rKD3XGNX5Tr3o3s7jZt5hvgFYrL80gNWyboimv945juho6
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-ORIG-GUID: va006aLuWm5jSrDlyUoYZ6vYRmiz3Opz
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDA1MCBTYWx0ZWRfX6Y2N/ZbKs6Im
 g6DJEU9ganXzI4AVDjkZR7mZlOI49vOuEblIZuqbLNTqUbD5gQ3PnoJYBGkmhNYRiRB1m55Q8pd
 xZnLqpnc7k0aKyFmKl7xOTlrers60pY=
X-Authority-Analysis: v=2.4 cv=F9JnsKhN c=1 sm=1 tr=0 ts=6a4de14a cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=PWZB-clRUh0r-kCehmkA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: va006aLuWm5jSrDlyUoYZ6vYRmiz3Opz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDA1MCBTYWx0ZWRfX9vt2vkSs07eO
 6rjWhNzRcz7fYG0nmtDYXX4B7fyOxOi+vWmCtyJCGp5/S11CdT4ipD3tgDQLzVlPaVQXKWRPmDW
 U3dJfztEUvQDRyjNIEecU8L6wb6OyAlrXkT0ziK+cCh83WD8axAMJ4fZ5uPR5J8KO81iupO6ce1
 YfmM3k/Vwt/oWccV7+CKVg/iLmXrZVzBGCJ6XJzDviQEpL333qM4duIFc2QJui91B9ZxudQwfRO
 mrdZOA8hQW7fDJNHWTEXrqj5DZktay+690DSeph8o9/6EOXVnhjx7rDubC3pEVmvxgXxU6p+7A7
 155ZuWJ4u8DHnE0J/qKBbL2K5IyFjKWGDdbIqpaJCRSR6+nrBpcmCw8YZn2sl4aBENrlRS7UzU0
 4/v0RXtbRhZ4ZM6DMX42cfcAvsW2PFep4CxL4asQocguG6XLB+Y+6ReaVeOjbY4B9RS2R6FYnQw
 JqIHUYQz4HDJEYju/IQ==
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-117482-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:ehristev@kernel.org,m:mukesh.ojha@oss.qualcomm.com,m:arnd@arndb.de,m:dennis@kernel.org,m:tj@kernel.org,m:cl@gentwo.org,m:akpm@linux-foundation.org,m:tglx@kernel.org,m:peterz@infradead.org,m:anna-maria@linutronix.de,m:frederic@kernel.org,m:jstultz@google.com,m:sboyd@kernel.org,m:kees@kernel.org,m:mingo@redhat.com,m:juri.lelli@redhat.com,m:vincent.guittot@linaro.org,m:dietmar.eggemann@arm.com,m:rostedt@goodmis.org,m:bsegall@google.com,m:mgorman@suse.de,m:vschneid@redhat.com,m:kprateek.nayak@amd.com,m:david@kernel.org,m:ljs@kernel.org,m:liam@infradead.org,m:vbabka@kernel.org,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:jackmanb@google.com,m:hannes@cmpxchg.org,m:ziy@nvidia.com,m:chrisl@kernel.org,m:kasong@tencent.com,m:shikemeng@huaweicloud.com,m:nphamcs@gmail.com,m:baoquan.he@linux.dev,m:baohua@kernel.org,m:youngjun.park@lge.com,m:pmladek@suse.com,m:john.ogness@linutronix.de,m:senozhatsky@chromium.org,m
 :andersson@kernel.org,m:mathieu.poirier@linaro.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:saravanak@kernel.org,m:workflows@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arch@vger.kernel.org,m:linux-mm@kvack.org,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:devicetree@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[lwn.net,linuxfoundation.org,kernel.org,oss.qualcomm.com,arndb.de,gentwo.org,linux-foundation.org,infradead.org,linutronix.de,google.com,redhat.com,linaro.org,arm.com,goodmis.org,suse.de,amd.com,suse.com,cmpxchg.org,nvidia.com,tencent.com,huaweicloud.com,gmail.com,linux.dev,lge.com,chromium.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCPT_COUNT_GT_50(0.00)[60];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E5F1F721D96

Annotate timekeeper_data into meminspect for debugging:
 - tk_data (timekeeper_data array)

Register the timekeeper_data array using MEMINSPECT_NAMED_ENTRY
with the "tk_data" identifier. Update the meminspect ID enum and
the minidump backend string table accordingly.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 include/linux/meminspect.h | 1 +
 kernel/time/timekeeping.c  | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/include/linux/meminspect.h b/include/linux/meminspect.h
index a9eb93c6ea2f..b64ca614b243 100644
--- a/include/linux/meminspect.h
+++ b/include/linux/meminspect.h
@@ -49,6 +49,7 @@ enum meminspect_uid {
 	MEMINSPECT_ID_kallsyms_markers,
 	MEMINSPECT_ID_kallsyms_seqs_of_names,
 	MEMINSPECT_ID_swapper_pg_dir,
+	MEMINSPECT_ID_tk_data,
 	MEMINSPECT_ID_DYNAMIC,
 	MEMINSPECT_ID_MAX = 201,
 };
diff --git a/kernel/time/timekeeping.c b/kernel/time/timekeeping.c
index 5985d6652c1d..8a5da24d8678 100644
--- a/kernel/time/timekeeping.c
+++ b/kernel/time/timekeeping.c
@@ -14,6 +14,7 @@
 #include <linux/random.h>
 #include <linux/sched/clock.h>
 #include <linux/sched/loadavg.h>
+#include <linux/meminspect.h>
 #include <linux/static_key.h>
 #include <linux/stop_machine.h>
 #include <linux/syscore_ops.h>
@@ -53,6 +54,7 @@ struct tk_data {
 } ____cacheline_aligned;
 
 static struct tk_data timekeeper_data[TIMEKEEPERS_MAX];
+MEMINSPECT_NAMED_ENTRY(tk_data, timekeeper_data);
 
 /* The core timekeeper */
 #define tk_core		(timekeeper_data[TIMEKEEPER_CORE])

-- 
2.53.0


