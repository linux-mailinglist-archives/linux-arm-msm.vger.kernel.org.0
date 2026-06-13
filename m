Return-Path: <linux-arm-msm+bounces-113007-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3jUlDvCRLWp7hgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113007-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jun 2026 19:22:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 54C3B67F29C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jun 2026 19:22:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=SvBF5DYb;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=JeRSVPjm;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113007-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113007-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 63220300CBE8
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jun 2026 17:21:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4FD5395AC5;
	Sat, 13 Jun 2026 17:21:41 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88F23327C00
	for <linux-arm-msm@vger.kernel.org>; Sat, 13 Jun 2026 17:21:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781371301; cv=none; b=jjLC+5hdZRgUTQG5/fMOTnHSykcohHxzffPMv9z4HzJdgNoEBNcvHjZjNbk9aS//cAMPESdPR7hLVV7OYrTau2637nUBUjoMslTlXZY183KAU+twlUiQe6ghZ+Hd+035VgCQMrR/zZk0JN1NS756H/DG9kULoS1m5hYjzjmd2Ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781371301; c=relaxed/simple;
	bh=1Wo2lxnikoSv9JichvG4ITxBxFpg2W31gcAukcfik7I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EW2FF9o8tXDTDSFnBdfEx/zbbN7c1egaJGgJFRDIz1GKHBRdG64SNB0vVmBuWeV1D6yfVb3jM5p2ntu9uO8YvAq7Q5mF3QdzHfnfsZDXpOzAeDVRDEE1nKHWhmuzux9B4+Ysfu0oQbwE5h8p0tx5/h0xzi6qo7YSGq0HO62HOd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SvBF5DYb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JeRSVPjm; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65DF90Iw2782759
	for <linux-arm-msm@vger.kernel.org>; Sat, 13 Jun 2026 17:21:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WFBZitbymj18mEAzAGK9dmr1JcGda6wnYCfgwxi85K8=; b=SvBF5DYbflsHrzFH
	LzJ9fajfCViGVsueUX7G/m5reswGqPPsm42cLiDvPCNv9GePjUXBEenrHZ6QKLff
	G4DzPycl+CeTCjOy6d45UjFY7+lHNFTORrRErZ9Y/MC6SIrTp8ZZGx2sNPa/kFWz
	9kbcEpB/kmZmp3LHzy85tGeFTJEXwuCaqM87/pTIYM79ET8cju/1G1N+gEBmUK27
	ieUADs4vmWASn9626/4wPj8c7RxvPqx33gJ5ubnQHEQFdBfhrdG+NtUJC9tNlvaF
	iE/5a16R9KLtIAUZhqrxGTD25MO4ZJcWpk5nonzTWbVIS8+EjrxMMwRkDf6WCp8M
	YR6Rcg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4es0g81g63-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 13 Jun 2026 17:21:39 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c85c530ddebso958702a12.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 13 Jun 2026 10:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781371299; x=1781976099; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WFBZitbymj18mEAzAGK9dmr1JcGda6wnYCfgwxi85K8=;
        b=JeRSVPjmVv8B+VUmbQkyKKWJY5X5T248SuT6XCBVnK80b8vUQti7NDD/jGWBovUgzC
         l6ckASd7TSFNEP7lRRp6IQfr3kUboizaN4S9a8UgaiH00eaZuDRYyHo7XiIEySgrz0rN
         2JAulwtXiMSUsOT7a4nTJ5V/HrlhNEtLX9fqTUcvwi9mLD3Uuq072Jp9ekYBNKsRwN6T
         hDwWcRKSdhIgTG2tLyx1OFX06IsVFYtMiCZGcUH9puGDV3fwu+GMRVRbHhFzyF9/j1+1
         sn6OEN6PS4Hu4DUyTc+aBB7NKwigSWdeVu94Zdmyg97Woqd2rSkyex08C4CH3vh9rqmC
         wd+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781371299; x=1781976099;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WFBZitbymj18mEAzAGK9dmr1JcGda6wnYCfgwxi85K8=;
        b=MDTWTkU525ohjux4LGItu24OK2ilgb+NUvxNbdKsw18HogZ56g0srJ5jSrYI/hNK+w
         /foytK+g8FuRl+qTjF0lIL/3SmotwBQbM3XZG5lwmP7kAolkqTMOp9iueJvObGSJD+3j
         migM719MS1V8sqJNk4LnftyxJ1OfTxAbFivj7XWg3ML5WdWWC4e5JSjy/MyAZsKv8avA
         gHUGewQWU0tEvH0OKedqgXGzfk+0j4vZ6FEF7rMaWATER7LzmwfQILDVeRPk3HE8Yeuj
         idVZSWGyHnVJQ1+U7Rt4OMDphHpO4d8GrThaU7D7kXLYayMbnnf2AeoT0GVckdAjtRPm
         jiiQ==
X-Gm-Message-State: AOJu0YwLkQ4fcZcrf/ZeaWZWcRRIJfLE1p4e1tzW5bMKk2AVW/eE6uw4
	VVO8U35Y9uXFonQj8CnusMQQCc+ObXUetvWOJvTjPju45vSjt0VbGeuRc2OA68rvaGjjis9Bj4+
	bFhFWEr7W+q/pXLuevLZCM854gASNkSa5dg6iZZAkyMgyIC3KP7qwjZwNK+K9cSRY2/b7
X-Gm-Gg: Acq92OHxjZc/7IRLIFVpXb7kBzlszMKfBUKAXw2iNRZ5R047eBBzuf4h9wP2bmaWhGm
	Low3nsPnoY2v2Yi5TE7zubonEjBWOgz2QZg1pkSaSOA6HgIh4z0UhiNT0ldT0gdTAy7VN5DaxY1
	kh7aqnJXbUARUrJy/g+aFOr3TPQ+X8fOJsW+6BjeDP9CHkKdubZHIYLWSzUkAsdMCqaKvECJ5my
	hh70B1Y8ZuZ+mCPUJ3Xah4c7SkoxqkDJw8bMZjaH8bfv8VfFN76u0Sw6cn9XvtSrhYM7LWgAqTJ
	r7z1mJkNG8efSNTPkiCOuA3tb3aI0wrNCmlQFu4qN1Cu+Evnw5iQFct3o6dJ2NMLmjDo+2C4L55
	Njl7qGADVRh2IEhUH6o+KUnrdIvDBX+b+8WCoPNMvk9VhOlTwUSE+Zg==
X-Received: by 2002:a05:6300:218c:b0:3b4:8268:23e8 with SMTP id adf61e73a8af0-3b783f0a3f4mr9239530637.21.1781371299345;
        Sat, 13 Jun 2026 10:21:39 -0700 (PDT)
X-Received: by 2002:a05:6300:218c:b0:3b4:8268:23e8 with SMTP id adf61e73a8af0-3b783f0a3f4mr9239494637.21.1781371298918;
        Sat, 13 Jun 2026 10:21:38 -0700 (PDT)
Received: from hu-pranarya-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434accbec5sm5390913b3a.16.2026.06.13.10.21.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 10:21:38 -0700 (PDT)
From: Pranjal Arya <pranjal.arya@oss.qualcomm.com>
Date: Sat, 13 Jun 2026 22:49:51 +0530
Subject: [PATCH RFC 09/12] mm/vmalloc: collapse busy-tree find-then-unlink
 into a single mas_erase
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260613-vmalloc_maple-v1-9-0aa740bb944b@oss.qualcomm.com>
References: <20260613-vmalloc_maple-v1-0-0aa740bb944b@oss.qualcomm.com>
In-Reply-To: <20260613-vmalloc_maple-v1-0-0aa740bb944b@oss.qualcomm.com>
To: Andrew Morton <akpm@linux-foundation.org>,
        Uladzislau Rezki <urezki@gmail.com>,
        "Liam R. Howlett" <liam@infradead.org>,
        Alice Ryhl <aliceryhl@google.com>,
        Andrew Ballance <andrewjballance@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, maple-tree@lists.infradead.org,
        Lorenzo Stoakes <ljs@kernel.org>,
        Pranjal Shrivastava <praan@google.com>, Will Deacon <will@kernel.org>,
        Suzuki K Poulose <Suzuki.Poulose@arm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Mostafa Saleh <smostafa@google.com>, Balbir Singh <balbirs@nvidia.com>,
        Suren Baghdasaryan <surenb@google.com>, Marco Elver <elver@google.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        Alexander Potapenko <glider@google.com>, Shuah Khan <shuah@kernel.org>,
        Dev Jain <dev.jain@arm.com>, Brendan Jackman <jackmanb@google.com>,
        Puranjay Mohan <puranjay@kernel.org>,
        Santosh Shukla <santosh.shukla@amd.com>, Wyes Karny <wkarny@gmail.com>,
        Pranjal Arya <pranjal.arya@oss.qualcomm.com>,
        Sudeep Holla <sudeep.holla@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781371215; l=1577;
 i=pranjal.arya@oss.qualcomm.com; s=20260516; h=from:subject:message-id;
 bh=1Wo2lxnikoSv9JichvG4ITxBxFpg2W31gcAukcfik7I=;
 b=spWOO4QH0SPH6dKaihPuUAG1gV/jkwgr4CrTNhi9QWp9XeyW4iqebvtmBC0BAL7LESeXg0rG0
 +AxtMJsVJytCUVtXjiAeMTCHd8dC34JkXXxIOXx0OtYDeVjqGqIvmGQ
X-Developer-Key: i=pranjal.arya@oss.qualcomm.com; a=ed25519;
 pk=ymtcTlccEIDsi3ErhpjIoZZHKdPBYWGWW0Lchs5MsbE=
X-Authority-Analysis: v=2.4 cv=OOoXGyaB c=1 sm=1 tr=0 ts=6a2d91a3 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=qy1EqpzxIlcnHA3QzDgA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: 3S2z4yeI9R1ZIGSKj7qald4T32Lp2kkx
X-Proofpoint-ORIG-GUID: 3S2z4yeI9R1ZIGSKj7qald4T32Lp2kkx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEzMDE4MCBTYWx0ZWRfXy5m6qiCWODMv
 8f7fzLZDEkvzDfZ1yU/ogirUwuaAm5frCLedhqT8uNyHtCuRFREL9Eu5kwbFCjDEToSOtqFEQNZ
 9jXuMayMPfEzfgB3B7LD3AHUV+EEH2tW0RUv1UXtKKd3mkX6sg5PqdjtXM9U5OxZ/tBefZQSs7K
 S1hQloI9McSSN92R2tTrpeRYp7/W2ulrq4QgIf92QcnEHQ1rcPn4RQsh+wOxyL6Yx0IwALj+3mt
 RwxYY486dZTHb0XDLLQ52TKY8PJOn6I/sTgGrozJGoe3SR6kn8rZBRzzfSeiKQMDEJozDZR5hU9
 qO07AbRC/Xs0D0M0AAA2vU6uHA7altWkTCqOl6rgZMS9MQ3VF6LGf75PZDIXZ9tAJ5CrM9+e6jz
 8sbaT4RfEKI5E0P6+ZeL2swwYNFiybZXIAr38upBcJ6x+n1jY87EP+ABf5ngW78kkTVDXirbpsb
 wvvtcHls06W5xg0C3ag==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEzMDE4MCBTYWx0ZWRfXxFbMeN44P7cc
 xhUnbtQ7zNGe9cmdZFZ903RuZqClWMO2ftpQuV6a+EXMvVdILOXqYLaD+qz46EIT5JPku3D5Wdq
 W+xJG4CpVprQhgizIwwUWtcvr3+Vj+0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-13_03,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 adultscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606130180
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[28];
	TAGGED_FROM(0.00)[bounces-113007-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[linux-foundation.org,gmail.com,infradead.org,google.com];
	FORGED_RECIPIENTS(0.00)[m:akpm@linux-foundation.org,m:urezki@gmail.com,m:liam@infradead.org,m:aliceryhl@google.com,m:andrewjballance@gmail.com,m:linux-arm-msm@vger.kernel.org,m:linux-mm@kvack.org,m:linux-kernel@vger.kernel.org,m:maple-tree@lists.infradead.org,m:ljs@kernel.org,m:praan@google.com,m:will@kernel.org,m:Suzuki.Poulose@arm.com,m:neil.armstrong@linaro.org,m:smostafa@google.com,m:balbirs@nvidia.com,m:surenb@google.com,m:elver@google.com,m:dvyukov@google.com,m:glider@google.com,m:shuah@kernel.org,m:dev.jain@arm.com,m:jackmanb@google.com,m:puranjay@kernel.org,m:santosh.shukla@amd.com,m:wkarny@gmail.com,m:pranjal.arya@oss.qualcomm.com,m:sudeep.holla@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[pranjal.arya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,kvack.org,lists.infradead.org,kernel.org,google.com,arm.com,linaro.org,nvidia.com,amd.com,gmail.com,oss.qualcomm.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pranjal.arya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 54C3B67F29C

find_unlink_vmap_area() previously walked the busy tree once (via
find_vmap_area_busy_locked() / __find_vmap_area_mt) and then erased
via a second walker (unlink_vmap_area_busy_locked).  Two independent
maple-tree descents, one per call.

maple_tree exposes mas_erase() which combines lookup and erase in
one descent.  Replace the find+unlink pair with a single mas_erase()
walker.

Signed-off-by: Pranjal Arya <pranjal.arya@oss.qualcomm.com>
---
 mm/vmalloc.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index 1b73001e197e..463127d5ce58 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -3122,10 +3122,24 @@ static struct vmap_area *find_unlink_vmap_area(unsigned long addr)
 	do {
 		vn = &vmap_nodes[i];
 
+		/*
+		 * Combine the lookup and removal into a single maple-tree
+		 * descent. mas_erase() positions the state at @addr and clears
+		 * the slot in one pass, returning the previously stored VA.
+		 * This saves the second mas_store(NULL) the original
+		 * find_vmap_area_busy_locked + unlink_vmap_area_busy_locked
+		 * pair issued, halving the busy-tree maple work per vfree.
+		 */
 		spin_lock(&vn->busy.lock);
-		va = find_vmap_area_busy_locked(addr, vn);
+		if (likely(vn->busy.mt_enabled)) {
+			MA_STATE(mas, &vn->busy.mt, addr, addr);
+
+			va = mas_erase(&mas);
+		} else {
+			va = NULL;
+		}
 		if (va)
-			unlink_vmap_area_busy_locked(va, vn);
+			INIT_LIST_HEAD(&va->list);
 		spin_unlock(&vn->busy.lock);
 
 		if (va)

-- 
2.34.1


