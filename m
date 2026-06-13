Return-Path: <linux-arm-msm+bounces-112999-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id E7mSInORLWpchgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112999-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jun 2026 19:20:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0247467F249
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jun 2026 19:20:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=EuZLRjQY;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=L9U0Skpy;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112999-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112999-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5D3703027721
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jun 2026 17:20:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 263AB32B10D;
	Sat, 13 Jun 2026 17:20:36 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62A60FC0A
	for <linux-arm-msm@vger.kernel.org>; Sat, 13 Jun 2026 17:20:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781371236; cv=none; b=pOWVakLYGtG08kGwCNI5JxhphjGxJn+hhw7CvxVqkLJ3fNZ4skVM0I/5kXlrWVdanISJJDRPLT/Htx/xvj2M3lvGeQtcIs0OrFXc6n3ekpofXGCU5xtL4sEIRT7BpbcrXU88K06QkxKiSvDk7plDnS1Y0Msmk6sesbd6kOpVGPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781371236; c=relaxed/simple;
	bh=iVIE9NXQEoQrqSLoH90EvemMg/eTbDXpzD72a2nZZo4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RyokflEeR6HYlMjHS4d9Haux2sEaXJ8No4KG9J1TCrW2o6JKSSQjj78VAlmxitrGqUEi9fCjGL4uyU6w104VeEtijmFQuusNSrSRZr55sPU9urq/Cua8V3+JhZrcgHfE/UXdh5QiHGKraRwvg9UUARozx0vuN49yVRtVw9Dr95E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EuZLRjQY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L9U0Skpy; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65DF9fEW1236647
	for <linux-arm-msm@vger.kernel.org>; Sat, 13 Jun 2026 17:20:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ARhAIfL/KUaU+OVkcGHklt1anwnixW8IFSbeLVy/MIA=; b=EuZLRjQYIQQkQPVh
	vrj0YIlJoIpkCzDtE6Bluk16l6bmPwBK8LvWIkZruM9BfSq/HGfh0/5UnKhFmTRt
	TBdyTxxRG0mwqnf96T2jAeJfzujotQTHRitxCez5/acO8Wwfka6s0RwXLy91+sn/
	spSemHGrJe+jZPWo3+JWYDBDEiUJyc5WaaVfb1NTqaNXDliJEVZIsnUYLiJW+awJ
	4qczg8FaUZv9ilsnxvQpIvs/L/p0WqbFiXXe17wbMUK5gydtKp13JrpBu81crECt
	39AsQffZ1Crv/lQTqGJ/PSoc2SVRRpvabxN2pYbcjsyMfoF51owgKBLZMOqI0jTb
	2C7txQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eryffhkr8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 13 Jun 2026 17:20:33 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c85dcdbe502so1147051a12.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 13 Jun 2026 10:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781371233; x=1781976033; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ARhAIfL/KUaU+OVkcGHklt1anwnixW8IFSbeLVy/MIA=;
        b=L9U0SkpyLGUGXbICUIlT0NM4MqLOAQsSo2hFeDWql038fvdzTJomLf2QnGpTWU6nTr
         yjSOjLnbjv6qBpq1yobFHffpGRZDShh98BMR6LJd8AMf+RIqhKe2gNAz7QhYwW2qsh9R
         4AmnjZLWhPr82YMEAuxBX2lXmvCYOHd2dFfP8+63MA5AZZErSwf6z03rObgCl/gesfsV
         chUz3UKRmGC7Sphn/8Xd7aadT0NPBB6O6CqMkShTuYCYVed/6aNKK6v/dK9/Yn1DaiWY
         DIJUk99/Hq6jyQg8YdygG4i0Im+RFqFK365ZnaMGqTQIig4hQoFQoIUoq5T9tS+UN9m5
         omIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781371233; x=1781976033;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ARhAIfL/KUaU+OVkcGHklt1anwnixW8IFSbeLVy/MIA=;
        b=KEf8Wggk663ovgHpi9jqGePV24EYtss/G2AEMu+U8rHKt4bTggcjISMIjmDpIdhKIk
         VyIGdJ3eb1tY9e/9CV15/4qkH6zi0L3mgx5n81EDe/4qOkgefAv9LY5M7kQazt3qrjL/
         mkomUX8Pb4CuugRZHTJwUm7kXKPlFNdJ+BhAYEVjNLzbIPVwHOX4AcHZ4bcBOePF6uOs
         fJJXUVYTfZI0CSLoZXH0lpl/wfxFsCPgu3YdivAvo60mKUpIlYWwj2vAitWNtwmOGCMO
         7jmqS7tX9TXGqUYjZndC+xyCVxCT77hO2mts7x+4nwQWHFzA70YWd/dDp0nbjuI0hOn9
         U0Xw==
X-Gm-Message-State: AOJu0YxA9ID6iQRlFKmLLVHQWZOgiAMwIcyS5u9iXkWah+2EoQzi6buW
	1mdCkKqtnqfIjXcicyVUA1xPgutoN5Rk+UgS5OmRNHm+oBTs0TQjppfNqeSivHmSCe/KLOiHDML
	rxMy4Hhh8ML+0+h6vrTVEao7BFpy8H4M1+BZsmPhVVdR7XnOHKUaQTaNvv2Co11lElDgX
X-Gm-Gg: Acq92OFJaNTt5JZhXEF/yDMc5fiNMpHNiUHzYAiDC+ToTUfFXqGyqHC1LmJ8cDSwAuQ
	n3a+A+u31l+T7+SUtzcCl43uxKB8s5+vjJ72BI/mXbwZgCX/fqAeXD36RMF2+TvndfGKvPnc0Jm
	SYOq1gSCFMVW+shTXRotYYCHY02mlJ8lm3pff4J90b7SKCC3Es3mCaSA/DKq3zc1//rgKS/zDGA
	JS9Rbqj6nYia4t2pMHJx+syTNLQU4G8BpLsdLf1EoIEb4rW82YSshV7swPLTHsfWO04OGQvPskD
	18cxTEWABNDU7BwmrZWv5jVIBNE7HFvNQUuuY5zdwoQnzImXF50y1rgSNs79s68QVy/wDq5JbXY
	ydB6m0Iqyke2WAdHknNb1+kkeB7qxFpgILq4na7YTNlW14Gtg0nFiqA==
X-Received: by 2002:a05:6a21:6b0d:b0:398:c0ba:9ceb with SMTP id adf61e73a8af0-3b783b717e0mr8866428637.12.1781371232608;
        Sat, 13 Jun 2026 10:20:32 -0700 (PDT)
X-Received: by 2002:a05:6a21:6b0d:b0:398:c0ba:9ceb with SMTP id adf61e73a8af0-3b783b717e0mr8866398637.12.1781371232035;
        Sat, 13 Jun 2026 10:20:32 -0700 (PDT)
Received: from hu-pranarya-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434accbec5sm5390913b3a.16.2026.06.13.10.20.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 10:20:31 -0700 (PDT)
From: Pranjal Arya <pranjal.arya@oss.qualcomm.com>
Date: Sat, 13 Jun 2026 22:49:43 +0530
Subject: [PATCH RFC 01/12] mm/vmalloc: introduce maple_tree-based indexing
 for vmap_area
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260613-vmalloc_maple-v1-1-0aa740bb944b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781371215; l=15109;
 i=pranjal.arya@oss.qualcomm.com; s=20260516; h=from:subject:message-id;
 bh=iVIE9NXQEoQrqSLoH90EvemMg/eTbDXpzD72a2nZZo4=;
 b=CPLygkLp+PKrllmdJ6bYk4qLeuLE3uYFh7TJXThjMqD+4hd7JpODplWi/WxJ57JnzWdWOdjE5
 2LkNbUSIzcBAvQYDoloDlpDmAPeXc2xkX4RNTx9MUYxHKE8Xv1G/OE+
X-Developer-Key: i=pranjal.arya@oss.qualcomm.com; a=ed25519;
 pk=ymtcTlccEIDsi3ErhpjIoZZHKdPBYWGWW0Lchs5MsbE=
X-Authority-Analysis: v=2.4 cv=HuxG3UTS c=1 sm=1 tr=0 ts=6a2d9161 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=eoclzLbliDViwx4lJdQA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: asDSfLoChqe7YegRtUrL1_kAdSFroR5s
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEzMDE4MCBTYWx0ZWRfX/sLpk0c44KAA
 VmFgP/7r/9uvPWN5NmpYhleuckHtRWeKYemKtwcqHgqQTOY36jY6gn4XxUtOAXzXT33Aj/rBbMU
 uHLJBuPc8fdDeFap5VVRLqGHaNWvCMo=
X-Proofpoint-GUID: asDSfLoChqe7YegRtUrL1_kAdSFroR5s
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEzMDE4MCBTYWx0ZWRfX7gaXmBlN4Ewx
 MgJAfmBmXv4tWoulI4YSoSLJPm7tEybVZq6e79VZjt1ROWEOFVwjIpXy+esVsD/GobkKc6ZEpbp
 OtbLGM++acmqKaUxymvTbpt4zjEXCqBp3aXfouFkrtaPAnNifEHRESh6/h2/hd1gPdFPE4SC9J4
 9G9agQ8eIE+xGbzoxt9RgOs3vH11A6tEfwzHy74+eMFjuwFGU7VSukxAa4eMK2IE3lzM4DC9YPV
 IQUPgAnDT/Uo/CxMK72dhzF7DKDlfJODCGqJrj6KEFytSzmeZYmGIBcVHYlPXyg/feJ0YzpN7uf
 M/oAppLrZPQbUjgPxK1TbC4sjHVLKXL1LkcldlXUIth/i5Gj/diDnYDLwyGjyk6YnQGYhomAJOp
 Ud/9rGm60NlatKO/cSnD33FzNfgqo/FFWbQdDyuyVxJ2Os/np5RNcrkDm0LOtSy0NAilIatyX21
 dAD385IxTDkbfemqjNg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-13_03,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 phishscore=0 clxscore=1011 spamscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606130180
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[28];
	TAGGED_FROM(0.00)[bounces-112999-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[linux-foundation.org,gmail.com,infradead.org,google.com];
	FORGED_RECIPIENTS(0.00)[m:akpm@linux-foundation.org,m:urezki@gmail.com,m:liam@infradead.org,m:aliceryhl@google.com,m:andrewjballance@gmail.com,m:linux-arm-msm@vger.kernel.org,m:linux-mm@kvack.org,m:linux-kernel@vger.kernel.org,m:maple-tree@lists.infradead.org,m:ljs@kernel.org,m:praan@google.com,m:will@kernel.org,m:Suzuki.Poulose@arm.com,m:neil.armstrong@linaro.org,m:smostafa@google.com,m:balbirs@nvidia.com,m:surenb@google.com,m:elver@google.com,m:dvyukov@google.com,m:glider@google.com,m:shuah@kernel.org,m:dev.jain@arm.com,m:jackmanb@google.com,m:puranjay@kernel.org,m:santosh.shukla@amd.com,m:wkarny@gmail.com,m:pranjal.arya@oss.qualcomm.com,m:sudeep.holla@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[pranjal.arya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,kvack.org,lists.infradead.org,kernel.org,google.com,arm.com,linaro.org,nvidia.com,amd.com,gmail.com,oss.qualcomm.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
X-Rspamd-Queue-Id: 0247467F249

Add the maple_tree data structures, helper API, and runtime readiness
plumbing that this series uses to retire the augmented rb_tree
indexing of vmalloc free and busy ranges.

Two new tree handles are added alongside the existing per-node lazy
index:

  - free_vmap_area_mt    address-keyed gap query for the global
                         free-area allocator
  - vn->busy.mt          per-node address-keyed lookup for find/free

Helpers follow a try_init_*_locked / *_store_*_locked / *_erase_*_locked
naming convention so that the conversion call sites read uniformly.
The try_init_* helpers fold one-shot allocation of the maple-tree
backing state into the first hot-path access; this keeps vmalloc_init()
free of the per-tree GFP_NOWAIT paths and lets the tree machinery
start cold.

No external vmalloc behaviour change in this step. free/busy/lazy
operations still go through the rb_tree and per-node lazy.mt; the new
helpers and globals are wired up by the conversion patches that
follow.

Signed-off-by: Pranjal Arya <pranjal.arya@oss.qualcomm.com>
---
 mm/vmalloc.c | 433 ++++++++++++++++++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 402 insertions(+), 31 deletions(-)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index 1afca3568b9b..67f753d04c96 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -24,6 +24,7 @@
 #include <linux/list.h>
 #include <linux/notifier.h>
 #include <linux/rbtree.h>
+#include <linux/maple_tree.h>
 #include <linux/xarray.h>
 #include <linux/io.h>
 #include <linux/rcupdate.h>
@@ -880,22 +881,22 @@ static bool vmap_initialized __read_mostly;
 static struct kmem_cache *vmap_area_cachep;
 
 /*
- * This linked list is used in pair with free_vmap_area_root.
- * It gives O(1) access to prev/next to perform fast coalescing.
+ * This linked list stores free areas sorted by start address.
+ * It gives O(1) access to neighbors for fast coalescing.
  */
 static LIST_HEAD(free_vmap_area_list);
+/* Next-fit hint to avoid scanning from list head on each allocation. */
+static unsigned long free_vmap_alloc_hint __maybe_unused = 1;
 
 /*
- * This augment red-black tree represents the free vmap space.
- * All vmap_area objects in this tree are sorted by va->va_start
- * address. It is used for allocation and merging when a vmap
- * object is released.
- *
- * Each vmap_area node contains a maximum available free block
- * of its sub-tree, right or left. Therefore it is possible to
- * find a lowest match of free area.
+ * Maple tree shadow of free_vmap_area_list. It is used for
+ * address lookups and first-fit scans.
  */
 static struct rb_root free_vmap_area_root = RB_ROOT;
+static struct maple_tree free_vmap_area_mt __maybe_unused =
+	MTREE_INIT_EXT(free_vmap_area_mt, MT_FLAGS_LOCK_EXTERN, free_vmap_area_lock);
+static bool free_vmap_area_mt_enabled __maybe_unused;
+static bool free_vmap_area_mt_init_tried __maybe_unused;
 
 /*
  * Preload a CPU with one object for "no edge" split case. The
@@ -906,14 +907,17 @@ static DEFINE_PER_CPU(struct vmap_area *, ne_fit_preload_node);
 
 /*
  * This structure defines a single, solid model where a list and
- * rb-tree are part of one entity protected by the lock. Nodes are
+ * maple tree are part of one entity protected by the lock. Nodes are
  * sorted in ascending order, thus for O(1) access to left/right
  * neighbors a list is used as well as for sequential traversal.
  */
-struct rb_list {
+struct mt_list {
 	struct rb_root root;
+	struct maple_tree mt;
 	struct list_head head;
 	spinlock_t lock;
+	bool mt_enabled;
+	bool mt_init_tried;
 };
 
 /*
@@ -940,8 +944,8 @@ static struct vmap_node {
 	bool skip_populate;
 
 	/* Bookkeeping data of this node. */
-	struct rb_list busy;
-	struct rb_list lazy;
+	struct mt_list busy;
+	struct mt_list lazy;
 
 	/*
 	 * Ready-to-free areas.
@@ -1051,6 +1055,10 @@ va_size(struct vmap_area *va)
 	return (va->va_end - va->va_start);
 }
 
+/*
+ * Transitional rb compatibility retained until all rb-only users are moved.
+ * Follow-up patches in this RFC series remove these helpers.
+ */
 static __always_inline unsigned long
 get_subtree_max_size(struct rb_node *node)
 {
@@ -1070,6 +1078,130 @@ static DECLARE_WORK(drain_vmap_work, drain_vmap_area_work);
 
 static __cacheline_aligned_in_smp atomic_long_t vmap_lazy_nr;
 
+/*
+ * maple nodes are allocated from slab; defer tree population until
+ * slab allocator is up to avoid early-boot failures.
+ */
+static __always_inline bool vmap_mt_runtime_ready(void)
+{
+	return READ_ONCE(vmap_initialized) && slab_is_available();
+}
+
+static __always_inline bool free_mt_supported(void)
+{
+	return free_vmap_area_mt_enabled;
+}
+
+static __always_inline void disable_free_mt_locked(void)
+{
+	lockdep_assert_held(&free_vmap_area_lock);
+
+	if (free_vmap_area_mt_enabled) {
+		__mt_destroy(&free_vmap_area_mt);
+		free_vmap_area_mt_enabled = false;
+	}
+}
+
+static __always_inline void free_mt_store_va_locked(struct vmap_area *va)
+{
+	int err;
+
+	lockdep_assert_held(&free_vmap_area_lock);
+
+	MA_STATE(mas, &free_vmap_area_mt, va->va_start, va->va_end - 1);
+
+	err = mas_store_gfp(&mas, va, GFP_ATOMIC | __GFP_NOWARN);
+	if (WARN_ON_ONCE(err))
+		disable_free_mt_locked();
+}
+
+static __always_inline void free_mt_erase_va_locked(struct vmap_area *va)
+{
+	int err;
+
+	lockdep_assert_held(&free_vmap_area_lock);
+
+	MA_STATE(mas, &free_vmap_area_mt, va->va_start, va->va_end - 1);
+
+	err = mas_store_gfp(&mas, NULL, GFP_ATOMIC | __GFP_NOWARN);
+	if (WARN_ON_ONCE(err))
+		disable_free_mt_locked();
+}
+
+static __always_inline void
+free_mt_update_va_locked(struct vmap_area *va, unsigned long old_start,
+			 unsigned long old_end)
+{
+	int err;
+
+	lockdep_assert_held(&free_vmap_area_lock);
+
+	MA_STATE(mas_erase, &free_vmap_area_mt, old_start, old_end - 1);
+	MA_STATE(mas_store, &free_vmap_area_mt, va->va_start, va->va_end - 1);
+
+	err = mas_store_gfp(&mas_erase, NULL, GFP_ATOMIC | __GFP_NOWARN);
+	if (WARN_ON_ONCE(err)) {
+		disable_free_mt_locked();
+		return;
+	}
+
+	err = mas_store_gfp(&mas_store, va, GFP_ATOMIC | __GFP_NOWARN);
+	if (WARN_ON_ONCE(err))
+		disable_free_mt_locked();
+}
+
+static void free_mt_rebuild_locked(void)
+{
+	struct vmap_area *va;
+	int err;
+
+	lockdep_assert_held(&free_vmap_area_lock);
+
+	__mt_destroy(&free_vmap_area_mt);
+	free_vmap_area_mt_enabled = true;
+
+	list_for_each_entry(va, &free_vmap_area_list, list) {
+		MA_STATE(mas, &free_vmap_area_mt, va->va_start, va->va_end - 1);
+
+		err = mas_store_gfp(&mas, va, GFP_ATOMIC | __GFP_NOWARN);
+		if (WARN_ON_ONCE(err)) {
+			disable_free_mt_locked();
+			return;
+		}
+	}
+}
+
+static __always_inline void try_init_free_mt_locked(void)
+{
+	lockdep_assert_held(&free_vmap_area_lock);
+
+	if (free_vmap_area_mt_init_tried)
+		return;
+
+	if (!vmap_mt_runtime_ready())
+		return;
+
+	free_vmap_area_mt_init_tried = true;
+	free_mt_rebuild_locked();
+}
+
+static __always_inline struct vmap_area *
+__find_vmap_area_list(unsigned long addr, struct list_head *head)
+{
+	struct vmap_area *va;
+
+	addr = (unsigned long)kasan_reset_tag((void *)addr);
+
+	list_for_each_entry(va, head, list) {
+		if (addr < va->va_start)
+			break;
+		if (addr < va->va_end)
+			return va;
+	}
+
+	return NULL;
+}
+
 static struct vmap_area *__find_vmap_area(unsigned long addr, struct rb_root *root)
 {
 	struct rb_node *n = root->rb_node;
@@ -1092,29 +1224,268 @@ static struct vmap_area *__find_vmap_area(unsigned long addr, struct rb_root *ro
 }
 
 /* Look up the first VA which satisfies addr < va_end, NULL if none. */
-static struct vmap_area *
-__find_vmap_area_exceed_addr(unsigned long addr, struct rb_root *root)
+static __always_inline struct vmap_area *
+__find_vmap_area_exceed_addr_list(unsigned long addr, struct list_head *head)
 {
-	struct vmap_area *va = NULL;
-	struct rb_node *n = root->rb_node;
+	struct vmap_area *va;
 
 	addr = (unsigned long)kasan_reset_tag((void *)addr);
 
-	while (n) {
-		struct vmap_area *tmp;
+	list_for_each_entry(va, head, list) {
+		if (va->va_end > addr)
+			return va;
+	}
 
-		tmp = rb_entry(n, struct vmap_area, rb_node);
-		if (tmp->va_end > addr) {
-			va = tmp;
-			if (tmp->va_start <= addr)
-				break;
+	return NULL;
+}
 
-			n = n->rb_left;
-		} else
-			n = n->rb_right;
+static __always_inline struct list_head *
+find_vmap_area_insert_point_list(struct vmap_area *va, struct list_head *head)
+{
+	struct vmap_area *tmp;
+	struct list_head *next = head;
+
+	list_for_each_entry(tmp, head, list) {
+		if (tmp->va_start > va->va_start) {
+			next = &tmp->list;
+			break;
+		}
 	}
 
-	return va;
+	if (next != head) {
+		tmp = list_entry(next, struct vmap_area, list);
+		if (WARN_ON_ONCE(va->va_end > tmp->va_start))
+			return NULL;
+	}
+
+	if (next->prev != head) {
+		tmp = list_entry(next->prev, struct vmap_area, list);
+		if (WARN_ON_ONCE(va->va_start < tmp->va_end))
+			return NULL;
+	}
+
+	return next;
+}
+
+/*
+ * Use maple-tree neighbour lookup to locate insertion point in O(log n),
+ * while preserving sorted-list neighbour traversal.
+ */
+static __always_inline struct list_head *
+find_vmap_area_insert_point_mt(struct vmap_area *va, struct maple_tree *tree,
+			       struct list_head *head)
+{
+	struct vmap_area *prev, *next;
+	struct list_head *next_link;
+
+	MA_STATE(mas, tree, va->va_start, va->va_start);
+
+	mas_set(&mas, va->va_start);
+	next = mas_find(&mas, ULONG_MAX);
+
+	if (next) {
+		if (WARN_ON_ONCE(next->va_start <= va->va_start))
+			return NULL;
+		if (WARN_ON_ONCE(va->va_end > next->va_start))
+			return NULL;
+		next_link = &next->list;
+	} else {
+		next_link = head;
+	}
+
+	if (next_link->prev != head) {
+		prev = list_entry(next_link->prev, struct vmap_area, list);
+		if (WARN_ON_ONCE(va->va_start < prev->va_end))
+			return NULL;
+	}
+
+	return next_link;
+}
+
+static __always_inline bool
+insert_vmap_area_list_sorted(struct vmap_area *va, struct list_head *head)
+{
+	struct list_head *next;
+
+	next = find_vmap_area_insert_point_list(va, head);
+	if (!next)
+		return false;
+
+	list_add_tail(&va->list, next);
+	return true;
+}
+
+static __always_inline bool
+insert_vmap_area_list_sorted_mt(struct vmap_area *va, struct maple_tree *tree,
+				struct list_head *head)
+{
+	struct list_head *next;
+
+	next = find_vmap_area_insert_point_mt(va, tree, head);
+	if (!next)
+		return false;
+
+	list_add_tail(&va->list, next);
+	return true;
+}
+
+static __always_inline void
+disable_busy_mt_locked(struct vmap_node *vn)
+{
+	lockdep_assert_held(&vn->busy.lock);
+
+	if (vn->busy.mt_enabled) {
+		__mt_destroy(&vn->busy.mt);
+		vn->busy.mt_enabled = false;
+	}
+
+	vn->busy.mt_init_tried = true;
+}
+
+static __always_inline void
+disable_lazy_mt_locked(struct vmap_node *vn)
+{
+	lockdep_assert_held(&vn->lazy.lock);
+
+	if (vn->lazy.mt_enabled) {
+		__mt_destroy(&vn->lazy.mt);
+		vn->lazy.mt_enabled = false;
+	}
+
+	vn->lazy.mt_init_tried = true;
+}
+
+static void
+busy_mt_rebuild_locked(struct vmap_node *vn)
+{
+	struct vmap_area *va;
+	int err;
+
+	lockdep_assert_held(&vn->busy.lock);
+
+	__mt_destroy(&vn->busy.mt);
+	vn->busy.mt_enabled = true;
+
+	list_for_each_entry(va, &vn->busy.head, list) {
+		MA_STATE(mas, &vn->busy.mt, va->va_start, va->va_end - 1);
+
+		err = mas_store_gfp(&mas, va, GFP_ATOMIC | __GFP_NOWARN);
+		if (WARN_ON_ONCE(err)) {
+			disable_busy_mt_locked(vn);
+			return;
+		}
+	}
+}
+
+static __always_inline void
+try_init_busy_mt_locked(struct vmap_node *vn)
+{
+	lockdep_assert_held(&vn->busy.lock);
+
+	if (vn->busy.mt_init_tried)
+		return;
+
+	if (!vmap_mt_runtime_ready())
+		return;
+
+	vn->busy.mt_init_tried = true;
+	busy_mt_rebuild_locked(vn);
+}
+
+static void
+lazy_mt_rebuild_locked(struct vmap_node *vn)
+{
+	struct vmap_area *va;
+	int err;
+
+	lockdep_assert_held(&vn->lazy.lock);
+
+	__mt_destroy(&vn->lazy.mt);
+	vn->lazy.mt_enabled = true;
+
+	list_for_each_entry(va, &vn->lazy.head, list) {
+		MA_STATE(mas, &vn->lazy.mt, va->va_start, va->va_end - 1);
+
+		err = mas_store_gfp(&mas, va, GFP_ATOMIC | __GFP_NOWARN);
+		if (WARN_ON_ONCE(err)) {
+			disable_lazy_mt_locked(vn);
+			return;
+		}
+	}
+}
+
+static __always_inline void
+try_init_lazy_mt_locked(struct vmap_node *vn)
+{
+	lockdep_assert_held(&vn->lazy.lock);
+
+	if (vn->lazy.mt_init_tried)
+		return;
+
+	if (!vmap_mt_runtime_ready())
+		return;
+
+	vn->lazy.mt_init_tried = true;
+	lazy_mt_rebuild_locked(vn);
+}
+
+static __always_inline struct vmap_area *
+__find_vmap_area_mt(unsigned long addr, struct maple_tree *tree)
+{
+	MA_STATE(mas, tree, addr, addr);
+
+	addr = (unsigned long)kasan_reset_tag((void *)addr);
+	mas_set(&mas, addr);
+
+	return mas_walk(&mas);
+}
+
+static __always_inline struct vmap_area *
+__find_vmap_area_exceed_addr_mt(unsigned long addr, struct maple_tree *tree)
+{
+	MA_STATE(mas, tree, addr, addr);
+
+	addr = (unsigned long)kasan_reset_tag((void *)addr);
+	mas_set(&mas, addr);
+
+	return mas_find(&mas, ULONG_MAX);
+}
+
+static __always_inline struct vmap_area *
+__find_vmap_area_enclose_addr_mt(unsigned long addr, struct maple_tree *tree)
+{
+	MA_STATE(mas, tree, addr, addr);
+
+	addr = (unsigned long)kasan_reset_tag((void *)addr);
+	mas_set(&mas, addr);
+
+	return mas_find_rev(&mas, 0);
+}
+
+static __always_inline struct vmap_area *
+find_vmap_area_busy_locked(unsigned long addr, struct vmap_node *vn)
+{
+	lockdep_assert_held(&vn->busy.lock);
+
+	try_init_busy_mt_locked(vn);
+
+	if (likely(vn->busy.mt_enabled))
+		return __find_vmap_area_mt(addr, &vn->busy.mt);
+
+	return __find_vmap_area_list(addr, &vn->busy.head);
+}
+
+static __always_inline struct vmap_area *
+find_vmap_area_exceed_addr_busy_locked(unsigned long addr, struct vmap_node *vn)
+{
+	lockdep_assert_held(&vn->busy.lock);
+
+	try_init_busy_mt_locked(vn);
+
+	if (likely(vn->busy.mt_enabled))
+		return __find_vmap_area_exceed_addr_mt(addr, &vn->busy.mt);
+
+	return __find_vmap_area_exceed_addr_list(addr, &vn->busy.head);
 }
 
 /*
@@ -1135,7 +1506,7 @@ find_vmap_area_exceed_addr_lock(unsigned long addr, struct vmap_area **va)
 
 	for_each_vmap_node(vn) {
 		spin_lock(&vn->busy.lock);
-		*va = __find_vmap_area_exceed_addr(addr, &vn->busy.root);
+		*va = find_vmap_area_exceed_addr_busy_locked(addr, vn);
 
 		if (*va)
 			if (!va_start_lowest || (*va)->va_start < va_start_lowest)
@@ -1152,7 +1523,7 @@ find_vmap_area_exceed_addr_lock(unsigned long addr, struct vmap_area **va)
 		vn = addr_to_node(va_start_lowest);
 
 		spin_lock(&vn->busy.lock);
-		*va = __find_vmap_area(va_start_lowest, &vn->busy.root);
+		*va = find_vmap_area_busy_locked(va_start_lowest, vn);
 
 		if (*va)
 			return vn;

-- 
2.34.1


