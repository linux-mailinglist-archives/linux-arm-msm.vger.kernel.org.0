Return-Path: <linux-arm-msm+bounces-96765-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0IVULcJ9sGnLjgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96765-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 21:23:30 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 58428257B4A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 21:23:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 044C33076712
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 20:20:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C5173E9593;
	Tue, 10 Mar 2026 20:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Kcj/fPZ/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gsp2uhf+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6575B35AC07
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 20:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773174017; cv=none; b=BtmkOkCoJrM2H2nefeuWXtEv6yk9p7Sj/K4U6PcQtwbrFFBzjOhNUF2d/dzVtX7KewUpI+w3gGHFZvcrrcsb7o8SRY9Y9Wyk9Xl/5FsMEInQCQrr5iTdOGBVewZst9B18IK6FlQIbopJ3W9S3EPVqjfOknFSVAmN8hEL2ijLBZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773174017; c=relaxed/simple;
	bh=WMywfnI9PbjUKLPp2Fs3M4g0w7tyQGBNDo7yzMHxSAM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EhmrVf/Ow5mMmciwq8R1Hlc8Fgqbl/Bh+glsXrrsJ4e6OI7S2EXedwri0eJW+oewQ1A5x/7fJFCjht4LePfJxTchDRHCNCVh701jMGFlDsv97oi/gBRT9u8ZoCPo+s+/ZOvIpu6UZCsvwdCvp5PyVNgswvqJIIkhzPcNOhcTo9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Kcj/fPZ/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gsp2uhf+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62AIXID62861962
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 20:20:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t2HzBtnh7QV7EHA7wh8q9lV9zRoeqSwGw+3QCMSiaC0=; b=Kcj/fPZ/cpOljFC8
	ggqErlBTtfF+TdraC1O0f1rho0XEPKKZ6o2Yw+WE95wpJdRXAc0+qCBIN/zepz9i
	LcSwm3oqsSsUlZC2OQRvxxPdClhNjkpWeEXSilhPesJt7G/DBKTu/jGAm3JuKgQ5
	H9XHXg/vRhgxSrecNxbG+HBo8xI+R1DxZ++B63aTilUJ8O8BYsPcxoZAk7kTDz3d
	7c/FUBMuxtNOBhlSPTp96BX9PefFu3KoMjtDL6+WGxEyQrJtf8LdlVhuJLK1twzh
	REzMRHwO0BV2rzW+BpmfiwiDIeZD8OL2t8QqGeF3nlYgxmBh7Ih3AT7Xazciul7e
	i4LpUA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cte3wb6bj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 20:20:15 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82990cfa91aso2091656b3a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 13:20:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773174015; x=1773778815; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t2HzBtnh7QV7EHA7wh8q9lV9zRoeqSwGw+3QCMSiaC0=;
        b=gsp2uhf+cUpw1yLMgDC/7LfTJOApP0h1NhfOKqvmVCAUbVheigkxY35cl1JpOKBX26
         pwR4ztMW6PPFSJRHMxCNC9taPrt0XNDHe32pbZReq6uw3UJxO66HtahqnJE9TSXotjsX
         MMsngP/R7tfvx8dC2fYcvZcFpFtuke/eiQjEWD6fzgliFZI4zYoora5UyeQwa+mgFiyH
         RVp4zbsZas2/mwOpuykPhYIo8I2RszZc267ie0mwz3xvz538MbgY25fC2TDmweiVDKcZ
         PSWgLVksWevyJ/VTWRTDbKbVBIwiz50/vLrV8f5JpbhBZPLWQ1qIvNM5sq3ndBAO1Hko
         ce/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773174015; x=1773778815;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=t2HzBtnh7QV7EHA7wh8q9lV9zRoeqSwGw+3QCMSiaC0=;
        b=u/pgIcecBSgEgeJ3pNi9DuHJmsE/NSWZtkriOmKwJ2z8AXRvcVse/EkQpk2gK/VmG2
         1kH9bkVv7nCYBUin0lBnJugZNCr5IgoLb2PHVwLvcT5qbv2xFXaWDIqXnkMMjnSOXB4n
         ax/o38Xz3z7Pn09qFDKZpUGKGvtJAWDtQZz6hkrXuFNoCNTbL6E7o869H0S4Lr8eHhT/
         hBGpogpGbknZ+7ACeqYfuc3XqLjJ5N0W7uvX34MTgT7l7O5PS1p8sb6YZ0feqkPt5Bta
         I366Cps2DqMLVXKl8FOU+yyS2qiLkBvFq0YA0mxRuR2CfYZRwOMPXjtdly6XqkIgz5Kt
         WsPw==
X-Forwarded-Encrypted: i=1; AJvYcCW09wHqYzILZOjajrZREXUc6N1vIQU0NXxJ7Pxc9Ko+4N/2Y4mOu/R6XLVAbEnTb7pYLAf3CqADxj2d/xLe@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6T7bYe4SpXbcve1IlXKFZQInQoJAFVDC616sc/QIUrMxO0O72
	5pQqV054x+xN45gEwnROhhPSDo57NdOk3oUfNnXFBsVwoCVrN+mSE7N9TSIB4HIK4mN3Zz5H3Kh
	E3B/HPFKSDueYgu9XHdlxOXIrsoRRTzB3F8zTjd/eSWxdvPq32cHEBNmwuoO7Lov17m9I
X-Gm-Gg: ATEYQzwQOkvNuYycO2hNiLmQKDcbiJ9Igympl2F3e6AWLPVKdoG1GDVdEhSfXUNBMAx
	y+l0YqImVc4KSYUp+qgBZmUpjFUkgSwYvtTAFoHCsE1EWhCojVnQ4nleVgn+pG5XgHYWyI40LkF
	N6BMz0vCD2Q5OriGVOInnbPS8OKYpotH/6Yh8XPpeZx8APc8mai/PRlHmtTLPIorss3r8xmwvVm
	pxtVInvyr31bB6yhSqiKQfbDLiUHeCaqAaAqKBONhk3cmeiQgdXKXUMaP4oWTWRM9s5r9c9MQQX
	aXHzTfZoL7izhgqQzpuNpiYWxQflGycQCbP9NgvPYBP9jJqTK/r/FaqQPsr2biiyfDlYvL0VhoQ
	G5+mOu2uLjnxe1LoTDjmBW9z4Ep6gJODl5+gAIOhFffFKWiA7
X-Received: by 2002:a05:6a00:9298:b0:821:8ebc:2899 with SMTP id d2e1a72fcca58-829f6ee87aemr174147b3a.7.1773174014904;
        Tue, 10 Mar 2026 13:20:14 -0700 (PDT)
X-Received: by 2002:a05:6a00:9298:b0:821:8ebc:2899 with SMTP id d2e1a72fcca58-829f6ee87aemr174107b3a.7.1773174014221;
        Tue, 10 Mar 2026 13:20:14 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829f6dc2d0asm115262b3a.13.2026.03.10.13.19.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 13:20:13 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 01:46:00 +0530
Subject: [PATCH v2 16/25] mm/mm_init: Annotate static information into
 meminspect
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-minidump-v2-v2-16-f91cedc6f99e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773173756; l=916;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=DTT/RubkS1uO6w8Q2uLlEU+1CHFNOkom7gwELIcItBM=;
 b=2RE1s2i4KuvAIh/et2VJGLUruCSAirKOtEoh43eZpI8VBrpC3JkYwLQaT5N0Z0sjwA4h7TPsx
 8yuvgeVV1F/DrKNesJyEKMfCO6ycGwgttYEV2WQsmy/djxLHR8nIR9O
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDE3NyBTYWx0ZWRfXxX14WD+iZO6y
 RGprJ5iT1sxyDB7CmU4rCRQ71VVoDaHaIjHMRzMjhNSDGTgckCfXQtKRgVra+xTL22iIDGtUeD0
 pUbA+WmvA23A06Udzz4wYPV9pba1HKvSb1soWapMovrj15IBZ9SMSUQIEg9zPB2hC5KLDVUVeyu
 CHKAS65TjZc4xwkdQnclSlvM+FHTS1DtIcq550POuoPYsn6RhNZ/ebXilaovInzU3UsY3JAxG1K
 /zrOiR9sELHoFQuUJ/MclNqkJB3lyfvMCweXv3qrEvaIBA1JUR4pzhEOTCaltnWQT+3Wd3HFrt+
 HXZjH6EgYhf5o7YZiR9xlCZJE8bwlKKPGD/pqPa2sVW3KHuuim+4f7oN5pFhzTPdb5ZubQrAt5g
 0fK0Xfcga0flUKmMlj8KAc1fPhjLkwnRNqVby7TiYcTWxGZ1EG1BDXyFshjAB1hnoEbS0tW59eU
 mQ62r/clKPwhQbo8LUw==
X-Authority-Analysis: v=2.4 cv=GtFPO01C c=1 sm=1 tr=0 ts=69b07cff cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=R-PfVeyQBJMsRd_P_MAA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: CgVL0J2pbpiHA4In8w8dSlMXVcjuEtC4
X-Proofpoint-GUID: CgVL0J2pbpiHA4In8w8dSlMXVcjuEtC4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_04,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100177
X-Rspamd-Queue-Id: 58428257B4A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[lwn.net,linuxfoundation.org,linaro.org,arndb.de,kernel.org,gentwo.org,linux-foundation.org,infradead.org,linutronix.de,redhat.com,arm.com,goodmis.org,google.com,suse.de,oracle.com,suse.com,cmpxchg.org,nvidia.com,tencent.com,huaweicloud.com,gmail.com,lge.com,chromium.org,oss.qualcomm.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96765-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,linaro.org:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_GT_50(0.00)[57];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

From: Eugen Hristev <eugen.hristev@linaro.org>

Annotate vital static information into inspection table:
 - high_memory

Information on these variables is stored in a dedicated meminspect
section.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 mm/mm_init.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/mm/mm_init.c b/mm/mm_init.c
index cec7bb758bdd..3cfaea1e0b21 100644
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@ -32,6 +32,7 @@
 #include <linux/vmstat.h>
 #include <linux/kexec_handover.h>
 #include <linux/hugetlb.h>
+#include <linux/meminspect.h>
 #include <linux/mmzone_lock.h>
 #include "internal.h"
 #include "slab.h"
@@ -53,6 +54,7 @@ EXPORT_SYMBOL(mem_map);
  */
 void *high_memory;
 EXPORT_SYMBOL(high_memory);
+MEMINSPECT_SIMPLE_ENTRY(high_memory);
 
 unsigned long zero_page_pfn __ro_after_init;
 EXPORT_SYMBOL(zero_page_pfn);

-- 
2.50.1


