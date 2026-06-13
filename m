Return-Path: <linux-arm-msm+bounces-113001-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id w9WcJKKRLWpohgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113001-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jun 2026 19:21:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DC4D67F26F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jun 2026 19:21:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=NuwBzWrd;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=YQiJpT7c;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113001-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113001-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5ECAD3008618
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jun 2026 17:20:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B47A6FC0A;
	Sat, 13 Jun 2026 17:20:53 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E26C13E5A00
	for <linux-arm-msm@vger.kernel.org>; Sat, 13 Jun 2026 17:20:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781371253; cv=none; b=HITgUlDy4cHtReLiHVjt3FOFUOCkb/dgTfDDMbhbNFe2NzmORPWbxAR1ntCZ2nKt2dbLvjcdMfZcL4e8N1SIxQPvLVxiEiVS2NR2Y+JQ5P/TKtjDQNAT9MTnYyn0SWgdADBx7D2ACty2pQ33SNOSe2+mssWC/Ohf651A2zdHQAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781371253; c=relaxed/simple;
	bh=d7Rh9moU4PlywobCCQlby0ESibig6WBPrZyoRaflKyI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Kh5QNq21iq0NI2hZeCk0rvjWSbt00IRCvF/ndxQQiTgCdIBUMeyz4UCCaofV+WAuADvCDa8M1HvWmn4LTZtCFkIaZYLi22tRxB9iEFpufqBLg9mUr64gG7B+3yjvHsH90L+kTHsi4Pmu6MT6z2CZMLEQV2syHhSvgpPzCXwOOwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NuwBzWrd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YQiJpT7c; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65DF9Uav2760336
	for <linux-arm-msm@vger.kernel.org>; Sat, 13 Jun 2026 17:20:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uCURNgSWRUFOFyKhAq/7V/tz5RhnVVGkvQX7hSUp9RM=; b=NuwBzWrduzG3GLBq
	c8tAxU2Tazzqv1lB3qZ0HY3ukFxGsv/eZzNdJ18GIUa3G+vt07gawMkvTjrvhRqQ
	81HsEUN7s/czX+/NmBrXJA1qEmOFpZek4W+JEXbnJa/2pPaxm3AM0Wi8zD2Bl8bl
	CmOAiW2vKS4On9F8Gz8TrR7M0If9GJNpl9X4FuW0tNQoHDc6MBcdosyKh6YIXP4l
	QuDUSwsk6oI8um57xKx1uOnkkB5o4mz82/NlhR99bqPhrm8N/3DlA2P/DRDQqws/
	AvsXoC/t62X6vROQe32UD0MM8irOYiSdX2IZTLtF+KwRl84Wal9wr+sarGMZgtCk
	Vee3Jw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ery9f9p08-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 13 Jun 2026 17:20:50 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-842208d5b0eso1559191b3a.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 13 Jun 2026 10:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781371249; x=1781976049; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uCURNgSWRUFOFyKhAq/7V/tz5RhnVVGkvQX7hSUp9RM=;
        b=YQiJpT7c6vdrGtAi6gLCmTQ2+1ZNuUdSjMeXuPkLgD2oOUiFhu3fl9W2stWolch0XZ
         BRN1ReVbLqe6PFRjk92qGVz/V8zTVJjyKwXFb6SE0zKNBHb65d1OMlYx+fyI3VsIQX9W
         z0ZVL0OCgcfwKQLP6E5qoTTEilhXg/46G38Gpksov+q8+z18F2U4fUOWbtZQO7J8k4OC
         wwj8ZjNqDWCewim+rQyX+tKJZrzg4159CD41NLcFmzGwJ1pngwe1FDwixOpzSqOpG07k
         HlVacSsKqrzqsx7nnDztd5bTIOt+c7fDpVuFLOPMTqwxLhLDHot57M4FoGxznuggkcjx
         77dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781371249; x=1781976049;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uCURNgSWRUFOFyKhAq/7V/tz5RhnVVGkvQX7hSUp9RM=;
        b=nULISIYrm3/HXSf+CEBaHq5uvsa+3mIIG7rqYI+BuU1CynEfikntFiB0AApp1T5Ty/
         kCcOklnmr+cEWbmReCbRro4tixYbKY7+o8TbzxLo6QVeKQA9lUp/z8OaYUlyU1pgE8Fm
         iAByRSt6BAfk5ttmuOpGmkwCoOji5LtjOCOiL0pkTXOYRy/sYb0x5HM4CdtUnoWMHbmX
         FK8qLEH5mjBz/ANPdaF/553jFr2qhUizMaEGpJ4wh4291ATs1LtXDlE+IhmkaBiQGRoG
         4hwk+dw+VFfq5b0B9eUExJfcNApDGOroMJ+teg8s1+z/5DG75YWNABxVyBRoFev84zhU
         zQnA==
X-Gm-Message-State: AOJu0Yw2vkOJK/zcDu5UXrW7jTlgyITXOZHk89lzC3iXMkf+LrJY9Fqd
	g/Q1T1Hj+N/kmSE/U0SFQA46ZZGa5qYfJWGo1oVCsj8YCFLlYILok1EfsNtqamwJEe6BtGfQEgm
	H3tg+lTnUrntsvnbDxKzdf7WFnKW0W5ku5zj4BHm1+VyOlMGoRffZnWM8ZzIZuMvWa9PP
X-Gm-Gg: Acq92OGYBjOGMWZBVpjRuEfTcFgUngZm9sdXA3gBonu0WGqx6YIHXBjAWEyCflUvthg
	orYgMzaTkhbgM4qlkwHTTIO3WEm+yN1Leph/CoyguZJmZlZyI/GRNDSI3KmAY7xVadV4F4QqW6L
	zEUO9rfLGv+EkhkzIuKXihVc2ig5w0WXaJF2H4LRC6Ukc0t43nEurC/CJFLFaMmmwTRkc4b1vbq
	rAIlszQ+c2h2fdrzeFmcRfbV9MWzOpjKjuJXxqHktMErsmTFAom7L3wz8RqgygcHmCev3AAy8YP
	toQOlgx1RfLM1zspb82cpJtVWYVhBW2k+bxiPoaexQrIoEU9oHGku/Kc4cwy+f60bE6YKRTgMEk
	YLoIOi8a2/0+QhM6O07Ii8O/jYBeGQpO5f0sgMW+41TEj7Z077BE9Qg==
X-Received: by 2002:a05:6a00:ad04:b0:842:6594:de with SMTP id d2e1a72fcca58-8434cd4558cmr8150266b3a.15.1781371249352;
        Sat, 13 Jun 2026 10:20:49 -0700 (PDT)
X-Received: by 2002:a05:6a00:ad04:b0:842:6594:de with SMTP id d2e1a72fcca58-8434cd4558cmr8150235b3a.15.1781371248892;
        Sat, 13 Jun 2026 10:20:48 -0700 (PDT)
Received: from hu-pranarya-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434accbec5sm5390913b3a.16.2026.06.13.10.20.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 10:20:48 -0700 (PDT)
From: Pranjal Arya <pranjal.arya@oss.qualcomm.com>
Date: Sat, 13 Jun 2026 22:49:45 +0530
Subject: [PATCH RFC 03/12] mm/vmalloc: convert free, purge, and pcpu paths
 to maple_tree
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260613-vmalloc_maple-v1-3-0aa740bb944b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781371215; l=8254;
 i=pranjal.arya@oss.qualcomm.com; s=20260516; h=from:subject:message-id;
 bh=d7Rh9moU4PlywobCCQlby0ESibig6WBPrZyoRaflKyI=;
 b=i4ZVjEUEpATUFw1AesbsDlvUbQAz4biJWSgx2WlatBpp99/Fh4zL92ovokQ6YvX3lYIEirA4W
 qeSCLC8FcQJCFfFoCZXnrUVBMNf37s3X1mpNxtFxc/JVLzamPLd3Rr/
X-Developer-Key: i=pranjal.arya@oss.qualcomm.com; a=ed25519;
 pk=ymtcTlccEIDsi3ErhpjIoZZHKdPBYWGWW0Lchs5MsbE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEzMDE4MCBTYWx0ZWRfX+5RrakeUCte5
 FjeIraEk1Zy7j+9HxDysqkfPG9D/q8eIMAwSe8hNzfMxGkdYcRDcsJKt3WrwfqZoYy7d01GTjUq
 Gazy/qEqxWuZpGKZxSLp3JSsF4F+oOAK5jhsl3Z3FQparTzA+edSBZbk4BkG4E7RaXDlZTtHYHM
 kkobdeyeyE7KaWroTK+zPzr2x8gQZfTQiwHiLTBH2bdfBZniCnk4aV04RT3GGpXsEM39CD0/UV9
 Ezzztz1xiwSe3P2xDsgKeKiIy+Qq2tibIyzey2DR6ATbr2bTRG4jqRDOnofMgCnFhduL+NQl+Km
 BAlMHSQTp4c91jhcfVFM+7S8+nUj/3g0+wX42pmMNOBiOsxQczXoe8xf9f376yCZJFVIPrZpvT+
 BJkYwRAv9qqatqDh/yHq1zcLYPcokYoLVkQzseLW2Gqg+N2q2IgBMzGON2OzVJgow09RRi4X0pS
 48PGSB45i1Y4LQdhkdw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEzMDE4MCBTYWx0ZWRfX3SR1Onq6Fli1
 RY6s6KjDs1UlHYVfHZRR5cbs0yuxd0IrDX1KXKjuNZjGx+Syg1+nb+yyNT9jzhfbgwg2+f5LWce
 7j8rOwizsVzcqV1fpCs8C11LCHhBkFM=
X-Proofpoint-GUID: Yy7mjH6On8PepCJ4XphJryu8z3ADYMGY
X-Proofpoint-ORIG-GUID: Yy7mjH6On8PepCJ4XphJryu8z3ADYMGY
X-Authority-Analysis: v=2.4 cv=ULvt2ify c=1 sm=1 tr=0 ts=6a2d9172 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=r6JOZ6DJY9FYdPoncJEA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-13_03,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1011 phishscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606130180
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[28];
	TAGGED_FROM(0.00)[bounces-113001-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[linux-foundation.org,gmail.com,infradead.org,google.com];
	FORGED_RECIPIENTS(0.00)[m:akpm@linux-foundation.org,m:urezki@gmail.com,m:liam@infradead.org,m:aliceryhl@google.com,m:andrewjballance@gmail.com,m:linux-arm-msm@vger.kernel.org,m:linux-mm@kvack.org,m:linux-kernel@vger.kernel.org,m:maple-tree@lists.infradead.org,m:ljs@kernel.org,m:praan@google.com,m:will@kernel.org,m:Suzuki.Poulose@arm.com,m:neil.armstrong@linaro.org,m:smostafa@google.com,m:balbirs@nvidia.com,m:surenb@google.com,m:elver@google.com,m:dvyukov@google.com,m:glider@google.com,m:shuah@kernel.org,m:dev.jain@arm.com,m:jackmanb@google.com,m:puranjay@kernel.org,m:santosh.shukla@amd.com,m:wkarny@gmail.com,m:pranjal.arya@oss.qualcomm.com,m:sudeep.holla@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[pranjal.arya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,kvack.org,lists.infradead.org,kernel.org,google.com,arm.com,linaro.org,nvidia.com,amd.com,gmail.com,oss.qualcomm.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
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
X-Rspamd-Queue-Id: 8DC4D67F26F

Move free_vmap_area_noflush, the lazy-purge processing
(__purge_vmap_area_lazy, purge_vmap_node, decay_va_pool_node,
kasan_release_vmalloc_node), and pcpu_get_vm_areas onto the
maple_tree helpers.

Per-node busy lookup (find_vmap_area, find_unlink_vmap_area,
find_vmap_area_exceed_addr_lock) and the vmap_block free path
likewise shift to vn->busy.mt.

pcpu_get_vm_areas keeps its top-down free-area walk; the new
free_vmap_area_prev() helper returns the previous free-area neighbour
via the address-sorted list, while enclose-address queries
(pvm_find_va_enclose_addr) move onto the maple_tree where supported.

After this patch, the augmented rb_tree is no longer consulted on the
allocation or free path. The address-sorted free_vmap_area_list is
still walked on the alloc path's list-based next-fit scan and on
neighbour traversal in pcpu_get_vm_areas.

Signed-off-by: Pranjal Arya <pranjal.arya@oss.qualcomm.com>
---
 mm/vmalloc.c | 78 +++++++++++++++++++++++++++++-------------------------------
 1 file changed, 38 insertions(+), 40 deletions(-)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index c5f509f033e6..f2117eafa9cf 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -2240,14 +2240,14 @@ static void free_vmap_area(struct vmap_area *va)
 	 * Remove from the busy tree/list.
 	 */
 	spin_lock(&vn->busy.lock);
-	unlink_va(va, &vn->busy.root);
+	unlink_vmap_area_busy_locked(va, vn);
 	spin_unlock(&vn->busy.lock);
 
 	/*
 	 * Insert/Merge it back to the free tree/list.
 	 */
 	spin_lock(&free_vmap_area_lock);
-	merge_or_add_vmap_area_augment(va, &free_vmap_area_root, &free_vmap_area_list);
+	merge_or_add_vmap_area_free_locked(va);
 	spin_unlock(&free_vmap_area_lock);
 }
 
@@ -2431,12 +2431,13 @@ static struct vmap_area *alloc_vmap_area(unsigned long size,
 		 * Only scan the relevant parts containing pointers to other objects
 		 * to avoid false negatives.
 		 */
-		kmemleak_scan_area(&va->rb_node, SIZE_MAX, gfp_mask);
+		kmemleak_scan_area(&va->vm, SIZE_MAX, gfp_mask);
 	}
 
 retry:
 	if (IS_ERR_VALUE(addr)) {
 		preload_this_cpu_lock(&free_vmap_area_lock, gfp_mask, node);
+		try_init_free_mt_locked();
 		addr = __alloc_vmap_area(size, align, vstart, vend);
 		spin_unlock(&free_vmap_area_lock);
 
@@ -2479,7 +2480,7 @@ static struct vmap_area *alloc_vmap_area(unsigned long size,
 	vn = addr_to_node(va->va_start);
 
 	spin_lock(&vn->busy.lock);
-	insert_vmap_area(va, &vn->busy.root, &vn->busy.head);
+	insert_vmap_area_busy_locked(va, vn);
 	spin_unlock(&vn->busy.lock);
 
 	BUG_ON(!IS_ALIGNED(va->va_start, align));
@@ -2575,8 +2576,7 @@ reclaim_list_global(struct list_head *head)
 
 	spin_lock(&free_vmap_area_lock);
 	list_for_each_entry_safe(va, n, head, list)
-		merge_or_add_vmap_area_augment(va,
-			&free_vmap_area_root, &free_vmap_area_list);
+		merge_or_add_vmap_area_free_locked(va);
 	spin_unlock(&free_vmap_area_lock);
 }
 
@@ -2719,12 +2719,13 @@ static bool __purge_vmap_area_lazy(unsigned long start, unsigned long end,
 		vn->skip_populate = full_pool_decay;
 		decay_va_pool_node(vn, full_pool_decay);
 
-		if (RB_EMPTY_ROOT(&vn->lazy.root))
+		spin_lock(&vn->lazy.lock);
+		if (lazy_vmap_areas_empty_locked(vn)) {
+			spin_unlock(&vn->lazy.lock);
 			continue;
+		}
 
-		spin_lock(&vn->lazy.lock);
-		WRITE_ONCE(vn->lazy.root.rb_node, NULL);
-		list_replace_init(&vn->lazy.head, &vn->purge_list);
+		move_lazy_vmap_areas_to_purge_locked(vn);
 		spin_unlock(&vn->lazy.lock);
 
 		start = min(start, list_first_entry(&vn->purge_list,
@@ -2823,7 +2824,7 @@ static void free_vmap_area_noflush(struct vmap_area *va)
 		id_to_node(vn_id):addr_to_node(va->va_start);
 
 	spin_lock(&vn->lazy.lock);
-	insert_vmap_area(va, &vn->lazy.root, &vn->lazy.head);
+	insert_vmap_area_lazy_locked(va, vn);
 	spin_unlock(&vn->lazy.lock);
 
 	trace_free_vmap_area_noflush(va_start, nr_lazy, nr_lazy_max);
@@ -2873,7 +2874,7 @@ struct vmap_area *find_vmap_area(unsigned long addr)
 		vn = &vmap_nodes[i];
 
 		spin_lock(&vn->busy.lock);
-		va = __find_vmap_area(addr, &vn->busy.root);
+		va = find_vmap_area_busy_locked(addr, vn);
 		spin_unlock(&vn->busy.lock);
 
 		if (va)
@@ -2897,9 +2898,9 @@ static struct vmap_area *find_unlink_vmap_area(unsigned long addr)
 		vn = &vmap_nodes[i];
 
 		spin_lock(&vn->busy.lock);
-		va = __find_vmap_area(addr, &vn->busy.root);
+		va = find_vmap_area_busy_locked(addr, vn);
 		if (va)
-			unlink_va(va, &vn->busy.root);
+			unlink_vmap_area_busy_locked(va, vn);
 		spin_unlock(&vn->busy.lock);
 
 		if (va)
@@ -2955,8 +2956,8 @@ struct vmap_block_queue {
 
 	/*
 	 * An xarray requires an extra memory dynamically to
-	 * be allocated. If it is an issue, we can use rb-tree
-	 * instead.
+	 * be allocated. If it is an issue, switch to another
+	 * indexing data structure.
 	 */
 	struct xarray vmap_blocks;
 };
@@ -3133,7 +3134,7 @@ static void free_vmap_block(struct vmap_block *vb)
 
 	vn = addr_to_node(vb->va->va_start);
 	spin_lock(&vn->busy.lock);
-	unlink_va(vb->va, &vn->busy.root);
+	unlink_vmap_area_busy_locked(vb->va, vn);
 	spin_unlock(&vn->busy.lock);
 
 	free_vmap_area_noflush(vb->va);
@@ -5238,9 +5239,15 @@ void free_vm_area(struct vm_struct *area)
 EXPORT_SYMBOL_GPL(free_vm_area);
 
 #ifdef CONFIG_SMP
-static struct vmap_area *node_to_va(struct rb_node *n)
+static __always_inline struct vmap_area *
+free_vmap_area_prev(struct vmap_area *va)
 {
-	return rb_entry_safe(n, struct vmap_area, rb_node);
+	lockdep_assert_held(&free_vmap_area_lock);
+
+	if (va->list.prev == &free_vmap_area_list)
+		return NULL;
+
+	return list_entry(va->list.prev, struct vmap_area, list);
 }
 
 /**
@@ -5255,26 +5262,19 @@ static struct vmap_area *node_to_va(struct rb_node *n)
 static struct vmap_area *
 pvm_find_va_enclose_addr(unsigned long addr)
 {
-	struct vmap_area *va, *tmp;
-	struct rb_node *n;
+	struct vmap_area *va;
 
-	n = free_vmap_area_root.rb_node;
-	va = NULL;
+	lockdep_assert_held(&free_vmap_area_lock);
 
-	while (n) {
-		tmp = rb_entry(n, struct vmap_area, rb_node);
-		if (tmp->va_start <= addr) {
-			va = tmp;
-			if (tmp->va_end >= addr)
-				break;
+	if (free_mt_supported())
+		return __find_vmap_area_enclose_addr_mt(addr, &free_vmap_area_mt);
 
-			n = n->rb_right;
-		} else {
-			n = n->rb_left;
-		}
+	list_for_each_entry_reverse(va, &free_vmap_area_list, list) {
+		if (va->va_start <= addr)
+			return va;
 	}
 
-	return va;
+	return NULL;
 }
 
 /**
@@ -5419,7 +5419,7 @@ struct vm_struct **pcpu_get_vm_areas(const unsigned long *offsets,
 		 * If this VA does not fit, move base downwards and recheck.
 		 */
 		if (base + start < va->va_start) {
-			va = node_to_va(rb_prev(&va->rb_node));
+			va = free_vmap_area_prev(va);
 			base = pvm_determine_end_from_reverse(&va, align) - end;
 			term_area = area;
 			continue;
@@ -5474,7 +5474,7 @@ struct vm_struct **pcpu_get_vm_areas(const unsigned long *offsets,
 		struct vmap_node *vn = addr_to_node(vas[area]->va_start);
 
 		spin_lock(&vn->busy.lock);
-		insert_vmap_area(vas[area], &vn->busy.root, &vn->busy.head);
+		insert_vmap_area_busy_locked(vas[area], vn);
 		setup_vmalloc_vm(vms[area], vas[area], VM_ALLOC,
 				 pcpu_get_vm_areas);
 		spin_unlock(&vn->busy.lock);
@@ -5501,8 +5501,7 @@ struct vm_struct **pcpu_get_vm_areas(const unsigned long *offsets,
 	while (area--) {
 		orig_start = vas[area]->va_start;
 		orig_end = vas[area]->va_end;
-		va = merge_or_add_vmap_area_augment(vas[area], &free_vmap_area_root,
-				&free_vmap_area_list);
+		va = merge_or_add_vmap_area_free_locked(vas[area]);
 		if (va)
 			kasan_release_vmalloc(orig_start, orig_end,
 				va->va_start, va->va_end,
@@ -5552,8 +5551,7 @@ struct vm_struct **pcpu_get_vm_areas(const unsigned long *offsets,
 	for (area = 0; area < nr_vms; area++) {
 		orig_start = vas[area]->va_start;
 		orig_end = vas[area]->va_end;
-		va = merge_or_add_vmap_area_augment(vas[area], &free_vmap_area_root,
-				&free_vmap_area_list);
+		va = merge_or_add_vmap_area_free_locked(vas[area]);
 		if (va)
 			kasan_release_vmalloc(orig_start, orig_end,
 				va->va_start, va->va_end,

-- 
2.34.1


