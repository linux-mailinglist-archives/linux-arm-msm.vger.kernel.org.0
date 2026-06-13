Return-Path: <linux-arm-msm+bounces-112998-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RbB7AV+RLWpThgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112998-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jun 2026 19:20:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DD9A67F23F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jun 2026 19:20:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="hzOa0aP/";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Q8on99Hw;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112998-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112998-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5E50E300A10F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jun 2026 17:20:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C476FC0A;
	Sat, 13 Jun 2026 17:20:27 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D341330DECE
	for <linux-arm-msm@vger.kernel.org>; Sat, 13 Jun 2026 17:20:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781371227; cv=none; b=Nun1yat6eeiLArUyURZ5K2dmYK2GS+PhxskQ15rJXdkzMkl4Fbeiuaw1k56Ohi0zJGQPfmgOYXO2GIO7CxC8aC8ARnqFQVSO+dr9OK7rpnxxJiSkZ8coHl5iTPTspifw/+wit6y0e2D8CEv5lkGmqeLHfADA6csQzjXFtMu9tdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781371227; c=relaxed/simple;
	bh=078Rn9HRSv89Rn+MUYRZY55Vxl8XkfUICgXKlh9NAec=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=TcBZ84YJdR3V+HkCclGKjewnWCJBPG66/A6cpeaMU0Cr5r07t6HFFs9yFP2fskdeV+sN+EtOljBImkCES3DvwRZV9xrdzR5v+VF3xSSsLsJXC7U3/yGaQnbOlv+LeeX7zxUyKClk8gK2UprNlvBVvPasxbqh45UVMAoYdWK2QdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hzOa0aP/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q8on99Hw; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65DF9l6G2770975
	for <linux-arm-msm@vger.kernel.org>; Sat, 13 Jun 2026 17:20:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=SFwY1cVGy7O7iRsmuMmTz2
	lob6iJy672xeQWyTFfBQ8=; b=hzOa0aP/TsDIcmr+is8HKVg6GBPCrSEtg1CMfZ
	a9WfJvRd52rqlgFYaVIbOx5YOujf3cCdrZo5cUN58H4DTmBkBp2yUwwxhq3JdH9h
	huQXK1dN1gi/3wpTpjRZCFk1kHICC/O6FJmMi3SyTcwpTXsrAzyLPoNcfsZ2wO/p
	DnHs6QO/sdhuI+399WpRP0uozikCeMRTrkR4+QOzm6Bia/E/QVE0Pm3qWvVWNgph
	tTiD2Z0nXRGE8s6pCOdeWxxS51JgrCJvEEuxA5zqnGhHQugOmTdaSzhwszwTbmlL
	gz7UQ2ScQfOV+F8/MLAOUPTutyKZnYOmqmBcv17eiYTiRDyA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4erye11m9j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 13 Jun 2026 17:20:25 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-84240683a82so1459723b3a.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 13 Jun 2026 10:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781371224; x=1781976024; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SFwY1cVGy7O7iRsmuMmTz2lob6iJy672xeQWyTFfBQ8=;
        b=Q8on99Hwe1sdwN+9WR7JCjBhl8rQUxeFr0U913OPv+VSZyvPY3yrf7Vycmgh3JwObu
         yUwsAHLAKmTf+QsHtnY1MSJZmslGD7I1cRgQqb05AmJLDWQjn6P8Y2fKKJ91ShHRZDV5
         aVM1i/kSj/kXhiPUjH3Uejin20YsoxDmBIolJJ88UYnFo/kpH4haJry76/IoNMdwj+AA
         JADbFPlczXcoljvdv53QAVs0gxNMbqjZshNdZj39XdteZGwLXmMEJJZnaYbGcilt8/py
         flGxxrFa6pgNO5ll6Ix5vHpkhaIuy9CHcDKgKl6xXT/olV0dXpBb6N9Om6NjX/mMCpVq
         CLKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781371224; x=1781976024;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SFwY1cVGy7O7iRsmuMmTz2lob6iJy672xeQWyTFfBQ8=;
        b=qksiyI99Ueq2bUVGjYemmF8Xh+uGQeksKIwUaNKb7HpxMwOF0Op1JVHMy9bOLdcbgY
         MaIIcFzzIaS65cVLh6DV9UcYoRqEYDXtnSEJcSrKdppTqQ7hSiggLG8JKlSb7ICN1xMF
         KkyxONcFPinrf+DcnysvPtU3qMvqZmRHmcTkKYEkyrMR3PvIeKCrdNRJO4nbzRAVF5Ko
         0t4zmB6MwC9b67ypVSoQtZ9ztKcbHca8XmgSZUBNXzRst7E2O3BJQdm0yOHC52MheXm9
         R20hqRw2u8yKribRpriGsGkOShVYNqFBA48qrrMPQxv119V6A/cmqwCGc13kc4JFRTj3
         aDUw==
X-Gm-Message-State: AOJu0YzmyvcTVjuuLI/8SynCfOOYKe5ed2ies+aGwXFp4UdY1mbGYvvt
	HlfDPtkVVp3EcN7bZnLIM/CNcOv1bF5OqLEocQwE5eVqCi0Bt+1wwavU0lsdyJIbHR90sE826kf
	RlMwSgFuaDsgfhaR/5aCt8ur0Kxr0yxA5iJHVbXq73uPx9bPOOHtIPm9dU0Ws6c9dR0lt
X-Gm-Gg: Acq92OGcNJr0uAV3MnzYOkIaBC96hjNNBlakHR1Z1O6yL2ATX8v3BRha27Y6ZjeyyW3
	XX+PtbdyT7suhBB/EPvxqKbtdKAdt/1PV7J08kcVWnacObgEzdMGp8qkTqtg4MU/BN6BHyiRVTp
	lLEZ30Odp+B6NPdMi/gjleqg8oGYlUYa+FzsqaEI/NNylpHu/DckVy9lXBlAl1sEMaMzCceGU1O
	61bGAJj+zaDK7AN5sZ2DL/zX9Sr0rkjH2y58C/touxdXJXMAC/2mRpBsXwdNwLXWBzo7Px5q8fg
	1KAZNUEZmrUcXz/A4Hv7IIf2TwN5oq9JTVQ3RqW57e/9yYCI4pZdogOBtQaB/nHy53oR/PHc6VI
	TayPfDHUY9wasksQIPRwcWgcQ5rX+e3mROgbGCQNW/P9tLqfs2CM0Yg==
X-Received: by 2002:a05:6a00:1951:b0:842:3d8d:babb with SMTP id d2e1a72fcca58-8434954765emr6974830b3a.2.1781371224228;
        Sat, 13 Jun 2026 10:20:24 -0700 (PDT)
X-Received: by 2002:a05:6a00:1951:b0:842:3d8d:babb with SMTP id d2e1a72fcca58-8434954765emr6974804b3a.2.1781371223676;
        Sat, 13 Jun 2026 10:20:23 -0700 (PDT)
Received: from hu-pranarya-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434accbec5sm5390913b3a.16.2026.06.13.10.20.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 10:20:23 -0700 (PDT)
From: Pranjal Arya <pranjal.arya@oss.qualcomm.com>
Subject: [PATCH RFC 00/12] mm/vmalloc: migrate vmap_area indexing from
 rb-tree to maple-tree
Date: Sat, 13 Jun 2026 22:49:42 +0530
Message-Id: <20260613-vmalloc_maple-v1-0-0aa740bb944b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAC6RLWoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDM0Nj3bLcxJyc/OT43MSCnFRdy2RLs7TUVIvUxORUJaCegqLUtMwKsHn
 RSkFuzkqxEMHi0qSs1OQSkElKtbUARrRo83YAAAA=
X-Change-ID: 20260613-vmalloc_maple-9c96fee8eace
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781371215; l=12885;
 i=pranjal.arya@oss.qualcomm.com; s=20260516; h=from:subject:message-id;
 bh=078Rn9HRSv89Rn+MUYRZY55Vxl8XkfUICgXKlh9NAec=;
 b=M1mBaqJ/zbG+WYeYcX58kwiZtXFR8A27VjnD97AEGHo09TnjZnBlSfqz86TMJWIFJCkoeLF2V
 S8tLwy6t/aFDp7lO6BTwbHFuRYhFxNJDT0UKWE9UnaGrEg6oe4EOxyR
X-Developer-Key: i=pranjal.arya@oss.qualcomm.com; a=ed25519;
 pk=ymtcTlccEIDsi3ErhpjIoZZHKdPBYWGWW0Lchs5MsbE=
X-Proofpoint-GUID: iONXtA_hsk6W_yCj85k2yGj6NuGvQ0ep
X-Authority-Analysis: v=2.4 cv=MNlQXsZl c=1 sm=1 tr=0 ts=6a2d9159 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=H29dQRUrwOwFP1tYY8AA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEzMDE4MCBTYWx0ZWRfX9Fkd16mCbdj/
 +jj7Cc0j7YqFmqQnewcO43fn+KP95NeltFhY+OgZaqWHuXi5C8rL0biFZSUzIUFzWHNN8o6EOCq
 do0786FG4DY3IyjL1jp17JnnvKbyP28=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEzMDE4MCBTYWx0ZWRfX4hd1u6q+ghUj
 3o7tqLwED75e+xI79bun4X/cKMwibY0wHnuLpEh05kAQut7M2ZT24epqWbZC2ZzgnKoDIjyBVTd
 +Vs5Lgh7/mVKaO7rbkqcnIa2pviJaD9ej+51573xkXo5h9GqW1PMpQjtiYZ7Y3aOaoSNV6kL0yF
 TU3Gb3iY0JoU+BKY49EiChuZJcF/VM7snLPuO5Qn95IyILw/35BjjmGkWRQ3U3HtQMS8mQ9rs1u
 Z4Dlk5dYlWK/ZqCReisKguJG8sgwYx6Ex9KLdBoTyJ9R4zavmwBrEFN6V3mAe+eOlI8wNng005Z
 kYUM2JVqTw3u66v717lhdXjG5+maknc3w3chrergtQFb5r6L0Yxk33dJwOfMo2YJBe1ZSfyryDs
 9qx9WuhUBePEJsyk01PnR2Nsy0JwP5A22aOqtgzWHmH83gkW3M3VLsP1rr9m3DnARyEo6fJWX7t
 YwiuQTTvFNOBZ90dAOQ==
X-Proofpoint-ORIG-GUID: iONXtA_hsk6W_yCj85k2yGj6NuGvQ0ep
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-13_03,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 spamscore=0 priorityscore=1501 phishscore=0
 adultscore=0 suspectscore=0 clxscore=1011 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606130180
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[28];
	TAGGED_FROM(0.00)[bounces-112998-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[linux-foundation.org,gmail.com,infradead.org,google.com];
	FORGED_RECIPIENTS(0.00)[m:akpm@linux-foundation.org,m:urezki@gmail.com,m:liam@infradead.org,m:aliceryhl@google.com,m:andrewjballance@gmail.com,m:linux-arm-msm@vger.kernel.org,m:linux-mm@kvack.org,m:linux-kernel@vger.kernel.org,m:maple-tree@lists.infradead.org,m:ljs@kernel.org,m:praan@google.com,m:will@kernel.org,m:Suzuki.Poulose@arm.com,m:neil.armstrong@linaro.org,m:smostafa@google.com,m:balbirs@nvidia.com,m:surenb@google.com,m:elver@google.com,m:dvyukov@google.com,m:glider@google.com,m:shuah@kernel.org,m:dev.jain@arm.com,m:jackmanb@google.com,m:puranjay@kernel.org,m:santosh.shukla@amd.com,m:wkarny@gmail.com,m:pranjal.arya@oss.qualcomm.com,m:sudeep.holla@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[pranjal.arya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,kvack.org,lists.infradead.org,kernel.org,google.com,arm.com,linaro.org,nvidia.com,amd.com,gmail.com,oss.qualcomm.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[checkpatch.pl:url,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
X-Rspamd-Queue-Id: 5DD9A67F23F

vmalloc's free/busy/lazy area tracking is one of the last remaining
augmented-rb_tree consumers in the core mm allocators. The rest of
mm/ has been gradually consolidating range-keyed indexing around
maple_tree (notably the per-process VMA tree in mm/mmap.c), and
the underlying reason is a structural mismatch between rb_tree and
range tracking:

- rb_tree is a binary tree with a single entry per node. A lookup
  walks log2(N) nodes via a pointer chase that touches log2(N)
  cache lines, with one comparison per node. Range queries are not
  native to rb_tree; vmalloc has historically maintained them by
  augmenting every node with a subtree_max_size field whose value
  has to be recomputed on every insert, erase, and rotation via a
  custom callback. That callback machinery is vmalloc-specific
  code that exists only to coax range semantics out of a
  binary-keyed tree.
- maple_tree stores up to 16 ranges per node (fanout f=16), so a
  lookup walks ~log16(N) nodes in tightly-packed pivot/slot arrays
  that are far more cache-friendly. Range queries are first-class
  (mas_empty_area, mas_find, mas_erase), with no augmentation
  callback to maintain. RCU traversal and sentinel range storage
  (XA_ZERO_ENTRY) are part of the data structure's contract, not
  bolted on by the consumer.

For the vmalloc allocator's hot paths this means shallower walks
under the same N, fewer cache lines touched per lookup, and no
custom augmented-callback machinery to maintain. Aligning vmalloc
with the same range-tree direction the rest of mm/ has taken
collapses the augmented gap walker to a single mas_empty_area()
descent, retires the augmented rb_node from struct vmap_area
(-24 bytes per object on 64-bit), and exposes the range,
sentinel, and RCU primitives needed for a per-CPU range cache
that the augmented rb_tree could not host cleanly.

This series completes the vmalloc internal migration from rb-tree
indexed tracking to maple-tree indexed tracking for free, busy, and
lazy vmap_area range management.

The series removes vmalloc's internal rb-tree dependencies and moves
address indexing and range lookups/scans to maple-tree-backed paths,
while keeping ordered list neighbour traversal where coalescing
semantics require stable predecessor/successor behaviour.

In addition to the direct rb -> maple migration, the series includes
robustness and scalability refinements in the same code path:

- deferred/lazy maple bring-up to avoid early-boot allocator hazards
- maple-assisted ordered-list insertion for busy/lazy tracking
- mas_preallocate / mas_store_prealloc fast path for common-case
  publish work, with a non-indexed retry queue that absorbs the
  rare publish-under-pressure case without leaking or panicking
- single mas_store(NULL, ...) sub-range trim in va_clip() in place
  of an erase-and-restore pair when narrowing a free-area entry
- single mas_erase() for the busy-tree find-then-unlink pair on the
  free path
- consolidation of in-use ranges as a single authoritative index on
  the steady-state allocation hot path
- list_head representation of the lazy-purge queue, since that queue
  is bulk-drained and has no address-keyed query
- per-CPU bump-allocator overlay layered on top of the migrated
  indices for short-lived, page-aligned, common-case allocations
  (design and chunk-size derivation in the 0010-0012 commit
  messages)
- explicit lock/serialisation behaviour preserved (no lock removed)

Primary advantages
==================

- struct vmap_area shrinks by 24 bytes on 64-bit layouts (72 -> 48),
  removing the embedded augmented rb_node and the subtree_max_size
  field that the rb-tree gap walk depended on. Verified with pahole
  on arm64.
- maple_tree's per-node fanout (multiple pivots/slots per node)
  replaces a binary rb-tree descent for indexed lookups, giving a
  shallower walk for the same allocation count.
- alloc-side gap finding moves from a recursive augmented-rb walk to
  mas_empty_area() over the in-use range index, returning the lowest
  matching gap in a single descent.
- vfree of a chunk-resident allocation through the per-CPU overlay
  resolves addr -> vmap_area in O(1) via the chunk's back-pointer
  array, with a bounded fast-reject for addresses outside any
  reserved chunk; the maple-tree busy lookup remains the fallback.
- correctness behaviour preserved: ordered list neighbour traversal
  for coalescing remains; the locking/serialisation model is
  unchanged; lockdep is silent across the test_vmalloc subtest sweep.
- robustness in bring-up and high churn: deferred/lazy maple
  initialisation avoids early-boot allocator hazards; the retry
  queue keeps publish failures under GFP_NOWAIT pressure correct
  without leaking or panicking.

Real-silicon validation
=======================

The series was tested on Qualcomm Snapdragon X1E80100.
The patched kernel was booted on the device against an RB baseline
image of the same kernel revision, and exercised through:

- GFXBench, run for several hours of sustained graphics workload;
  the patched kernel ran clean throughout, with throughput matching
  the RB baseline within run-to-run noise.
- boot-time module loading via the finit_module / kernel_read_file
  path that exercises the bump-allocator's indexed write loop;
  this path drove the patch 0012 hardening, and the patched kernel
  is UBSAN-clean here.
- repeated insmod / rmmod cycles to soak the chunk install / drain
  paths under live workload.

No kernel WARN, BUG, or UBSAN report was observed across the
multi-hour soak.

Quantified validated performance improvements
=============================================

Numbers below compare the current upstream rb-tree-based vmalloc
allocator (baseline) against the final state after applying all 12
patches in this series (patched). Each row reports the median of N
reps under sequential QEMU execution (PARALLEL=1, taskset-pinned
CPUs, nice -n 5) on a production kernel configuration
(CONFIG_DEBUG_VM=n, CONFIG_KASAN=n, CONFIG_LOCKDEP=n,
CONFIG_UBSAN=n). The baseline label is RB; the patched label is MT.

Aggregate observation:

- x86_64 KVM contention sweep (smp=8, 30 reps): improvement on every
  measured nt x mask configuration, range +5.1 % to +43.6 %.
- x86_64 KVM saturation sweep (smp=16, 15 reps): improvement on every
  measured nt x mask configuration, range +28.2 % to +64.9 %.
- arm64 cortex-a72 TCG contention sweep (smp=8, 15 reps):
  improvement on every measured nt x mask configuration, range
  +19.5 % to +32.6 %.
- functional sweep (1 rep, all 12 test_vmalloc masks): all 11
  passing subtests pass on RB and MT; the 12th (mask=64,
  align_shift_alloc_test) is xfail by design and remains xfail on MT.

x86_64 observed faster cases (sorted by gain):

- full_fit_alloc_test, smp=16 nt=16:                  +64.9 %
- long_busy_list_alloc_test, smp=16 nt=16:            +62.9 %
- full_fit_alloc_test, smp=16 nt=8:                   +51.7 %
- long_busy_list_alloc_test, smp=16 nt=8:             +49.3 %
- long_busy_list_alloc_test, smp=8 nt=8:              +43.6 %
- full_fit_alloc_test, smp=8 nt=4:                    +40.4 %
- full_fit_alloc_test, smp=8 nt=8:                    +40.0 %
- full_fit_alloc_test, smp=16 nt=4:                   +38.2 %
- full_fit_alloc_test, smp=8 nt=2:                    +31.2 %
- fix_align_alloc_test, functional sweep:             +30.2 %
- long_busy_list_alloc_test, smp=8 nt=4:              +29.3 %
- long_busy_list_alloc_test, smp=16 nt=4:             +28.2 %
- full_fit_alloc_test, smp=4 nt=2:                    +26.5 %
- full_fit_alloc_test, smp=8 nt=1:                    +20.4 %
- long_busy_list_alloc_test, smp=8 nt=2:              +17.7 %
- long_busy_list_alloc_test, smp=4 nt=2:              +15.3 %

arm64 observed faster cases (sorted by gain):

- long_busy_list_alloc_test, smp=8 nt=8:              +32.6 %
- long_busy_list_alloc_test, smp=8 nt=4:              +26.7 %
- fix_size_alloc_test, functional sweep:              +26.0 %
- full_fit_alloc_test, smp=8 nt=4:                    +25.5 %
- full_fit_alloc_test, smp=8 nt=2:                    +23.4 %
- full_fit_alloc_test, smp=8 nt=1:                    +23.2 %
- full_fit_alloc_test, smp=8 nt=8:                    +22.3 %
- full_fit_alloc_test, functional sweep:              +21.9 %
- long_busy_list_alloc_test, smp=8 nt=2:              +21.2 %
- random_size_align_alloc_test, functional sweep:     +19.9 %
- long_busy_list_alloc_test, smp=8 nt=1:              +19.5 %
- no_block_alloc_test, functional sweep:              +18.0 %
- full_fit_alloc_test, smp=4 nt=2:                    +17.3 %
- kvfree_rcu_1_arg_vmalloc_test, functional sweep:    +16.9 %
- long_busy_list_alloc_test, smp=4 nt=2:              +16.2 %
- random_size_align_alloc_test, smp=4 nt=2:           +14.3 %
- long_busy_list_alloc_test, functional sweep:        +12.6 %
- fix_align_alloc_test, functional sweep:             +12.4 %
- kvfree_rcu_2_arg_vmalloc_test, functional sweep:    +11.0 %
- pcpu_alloc_test, smp=4 nt=2:                        +6.9 %

Memory impact quantification
============================

struct vmap_area shrinks by 24 bytes per object on 64-bit layouts
(72 -> 48; verified with pahole on the patched build vs the RB
baseline). The shrink comes from removing the embedded augmented
rb_node (24 bytes) and the subtree_max_size union member (8 bytes,
formerly union with vm). list_head (16 bytes) and vm (8 bytes) are
retained.

Aggregate savings scale linearly with the number of concurrent live
vmap_area objects on the system.

mm/vmalloc.o text grows by ~47 KB on x86_64 / ~95 KB on arm64
(absorbing the maple-tree call sites and the per-CPU overlay), but
the linker-page-aligned bzImage / Image size is unchanged within
rounding.

QEMU validation and synthetic benchmarks
========================================

In addition to the real-silicon soak, the series was exercised
under QEMU (KVM on x86_64, TCG on arm64):

11 of 12 test_vmalloc subtests PASS on x86_64 and arm64 at series
HEAD. mask=64 (align_shift_alloc_test) reports xfailed=1 by design;
the same xfail is observed on the unpatched RB baseline.

KASAN, lockdep, CONFIG_DEBUG_VM=y, PROVE_LOCKING and CONFIG_UBSAN
boots are clean on both architectures with
test_vmalloc.run_test_mask=0xFFF (full subtest sweep).

Each commit individually compiles mm/vmalloc.o on x86_64 and arm64.
checkpatch.pl --strict reports no errors across the series.

Methodology limitations and reproducibility caveats:

- arm64 numbers in the validated wins above come from cortex-a72
  TCG emulation, so production arm64 silicon
  would be expected to track somewhere between these TCG numbers
  and the x86_64 KVM numbers.
- Independent replay can change the ranking or sign of small
  sub-millisecond deltas in test workloads whose absolute runtime
  is below ~1 ms at the configured test_loop_count; the headline
  workloads (full_fit_alloc_test, long_busy_list_alloc_test) run
  in the tens-to-hundreds-of-ms range and are not affected.

Reproduce
=========

Apply the series with git am, then build with TEST_VMALLOC=y in a
production-config kernel and boot under QEMU:

  $ git am 00*.patch
  $ make defconfig
  $ scripts/config -e TEST_VMALLOC -d DEBUG_VM -d KASAN
  $ make olddefconfig
  $ make -j$(nproc) bzImage
  $ # boot in QEMU with test_vmalloc.run_test_mask=...

Signed-off-by: Pranjal Arya <pranjal.arya@oss.qualcomm.com>
---
Pranjal Arya (12):
      mm/vmalloc: introduce maple_tree-based indexing for vmap_area
      mm/vmalloc: convert allocation-side gap finding and insertion to maple_tree
      mm/vmalloc: convert free, purge, and pcpu paths to maple_tree
      mm/vmalloc: finalize maple-only indexing and shrink struct vmap_area
      mm/vmalloc: tighten failure handling under memory pressure
      mm/vmalloc: tighten alloc/free hot paths
      mm/vmalloc: consolidate occupied tree as authoritative index on hot path
      mm/vmalloc: track lazy-purge queue as a list_head
      mm/vmalloc: collapse busy-tree find-then-unlink into a single mas_erase
      mm/vmalloc: per-CPU caching of free ranges from the maple_tree allocator
      mm/vmalloc: O(1) lookup of cached vmap_areas with bounded fast-reject
      mm/vmalloc: harden bump-allocator alloc/free against UBSAN array bounds

 include/linux/vmalloc.h |   16 +-
 lib/maple_tree.c        |    7 +
 mm/vmalloc.c            | 2378 ++++++++++++++++++++++++++++++++++-------------
 3 files changed, 1748 insertions(+), 653 deletions(-)
---
base-commit: c425609d6ac4012c8bbf01ec2e10e801b1923a7b
change-id: 20260613-vmalloc_maple-9c96fee8eace

Best regards,
--  
Pranjal Arya <pranjal.arya@oss.qualcomm.com>


