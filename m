Return-Path: <linux-arm-msm+bounces-113000-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id OSzwLHyRLWpehgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113000-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jun 2026 19:21:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E3C8767F255
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jun 2026 19:20:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ReVyqThP;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=bwa8MFyx;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113000-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113000-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 671533001CFF
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jun 2026 17:20:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20533340282;
	Sat, 13 Jun 2026 17:20:45 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C4292F7EE7
	for <linux-arm-msm@vger.kernel.org>; Sat, 13 Jun 2026 17:20:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781371245; cv=none; b=Iq74a3tcdcMepI09B8fznxmU+7VP9IeKfHW42h+1GNp8FVLP8C9gM3dgGs+nXDQVCD6NEVmAwFRC7E+XAmtIL9ZFsEgQjheCM0/J5McN6Nq8XWAC7xlgM2m/QYATakvrrCmFoZi0F4Mb7fHC8zmuUQ+TN/nxM1SQqh/j3dcXIac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781371245; c=relaxed/simple;
	bh=mzShuQjsivGBwOJFNo2gMC1ZvtaDXX3KGiVDadnIc+k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m7h8ulFw3fCBBlTNd6yFMUimplIK7lfvn65mmlclkWkUU65YV5v0hsLg5OV3t5UeTevFZdEwPseVII7SC/0Crg0v3zWGcK92N8LXARS3ufICNPgJsnTjGBfUBa3aXILVn8Jlma4ZmreMtUdCjPXrnywBnNUhcfwm8ygOGYTtAPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ReVyqThP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bwa8MFyx; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65DFA0jP2690590
	for <linux-arm-msm@vger.kernel.org>; Sat, 13 Jun 2026 17:20:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mMQ+LL7Rsw0V5Gp6IYVyB67DNDJRzawcpfiN2k23OTw=; b=ReVyqThPMiH8nkUc
	cAeZlpJTYISvPRsLWrHlWxkj8kUDo61PFMSa/ly8poQqfNkmsQca5KZuKtn9zY6O
	GKihXHTbnvpj6xhoMovSZBn54FITkoWsxf4q1x9k+8x/xGMZmB1P6brG13o+d22Z
	BfVc3Xo+LzYD0bJ42StiAUlLtvPsvr77enIwTaAvNum9XhBqTXhalqt0Ow2EiAVx
	gARBROt8CWn2M0hSjcuKDs/TNDVdHA641TXAXx58M2sEtjnRSERsuqxLo5EXpV69
	TFWYaYuAYwO7+Ki8DqyqKOr8NUT+RLB6NI6z0JRpRvouf+Jf2CZuk/Ztn9utXSLQ
	Sj560Q==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eryybsj4q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 13 Jun 2026 17:20:42 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8423f6247c6so2309721b3a.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 13 Jun 2026 10:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781371241; x=1781976041; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mMQ+LL7Rsw0V5Gp6IYVyB67DNDJRzawcpfiN2k23OTw=;
        b=bwa8MFyx0hVEVir+EGLTPJUaTFYgsXwolQCN27qSYDqWQtuwQhatuQjCwwYRqdek5v
         j/QrFtvYTQWW0q28PRYaxChAtkypniw6IEwp/i59sznJKlX+Piy5WWwcBZcOCLW7tR90
         ybBlOdAvSx7RKUHlsb34tq5nHda9KMlVJpW32eeX0QXzxdfw86FMbEMfP76qKqV2wBxx
         G2og525jUSImo7yJFGruwL4ANGDMfMfGXnxei7VBIwucpfF402jN8/lfLQn6m5maiCfw
         /0HspvFVdsaO5iW/Dy+vIk0Dq8RIZaEE/95k+gx33/V0ZR27L7KGmq7CpZK65QJ59oUu
         bqww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781371241; x=1781976041;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mMQ+LL7Rsw0V5Gp6IYVyB67DNDJRzawcpfiN2k23OTw=;
        b=oNsYy0A1WB3ik/Lnnf/Jrq/CYdYsxzyb8M8wqSUOGnp6SkmWWHVKMYXYeeQ6uCcrcy
         pVTB0N5fGESEI85dyw4GM9aKLokkEbCHcHFoOmfuOGgt10qD1Hpo0S1Q+Eom0wt/2kbi
         59TPdL0lDqTabctq8cKVesrptoyROD3A5LXlLklzaGg7CMnHL24GMc9YAIRdlo6IvrSH
         RMCC7n1i0AiiS2UGN5UmOxRPOHHQSBEuq/WkCN4tFkvoXI8KF0VroRWuiplJGc/AF2C2
         00Da9+rBqHH3IYuYvZJYI3mdg9jp43oywI2n4cv7A4Z4f/HpqiguSsh4Td2J3GqfdxS9
         qIYw==
X-Gm-Message-State: AOJu0YzoWACJglETP3wQDh7rJ7OSEjHA2ZVp7BYgoFlg0JfSCRC+q/Yi
	+CzLq9zrHd6KsM55ngXDI8/9V3dE/4lJCrZKgo0CzbjiwcHjetfOuLlTu0Eow3XRDmTRbGmF3XI
	GK6nfwRBIR14deJ1zSHVq/n0anJi2ZiOjH8h7mnbvyoy2isYHmn9N5AQxvJpUgsuuGN2e
X-Gm-Gg: Acq92OG6p0VZkXaOrfdtRohYN98CrBVrqpZb0+HGeFimXPwm2dkiylXyW5uRkJYzxAc
	lr5HxWQE5iNwZxb+QeibSkaKCgByqaLOYQ7l+DwDuZvide0VSTJPaaZOfiWnnEWcDUSXlCdoKjn
	5rnzDWS0s3iE0euZPHEZo9lvpKMivv8LjoM9bj2awUS6MoGCFDeA2xs57UUnOfLRIEwJyS5FVeQ
	X+BwSqEIOOGMApfZWPJTOS/xyw3g8dVc5Wx6+qXCjCQvOhjLee556YpJEutC2yYccBKsPvK8Kw5
	qwddVY1jIP/UiXacwLSTECyE70XxFdaYos7NTpZeukj9DsnVgbII0CtvNq13yMjAsyXdm5+MOst
	nGVwcNkYyVZttkpA9yKS5Npgupn4E9LK48Bd+WrMDfEZspHhZgtm+0w==
X-Received: by 2002:a05:6a00:22d0:b0:842:4907:d089 with SMTP id d2e1a72fcca58-8434ce2921cmr8490706b3a.34.1781371241170;
        Sat, 13 Jun 2026 10:20:41 -0700 (PDT)
X-Received: by 2002:a05:6a00:22d0:b0:842:4907:d089 with SMTP id d2e1a72fcca58-8434ce2921cmr8490658b3a.34.1781371240511;
        Sat, 13 Jun 2026 10:20:40 -0700 (PDT)
Received: from hu-pranarya-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434accbec5sm5390913b3a.16.2026.06.13.10.20.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 10:20:40 -0700 (PDT)
From: Pranjal Arya <pranjal.arya@oss.qualcomm.com>
Date: Sat, 13 Jun 2026 22:49:44 +0530
Subject: [PATCH RFC 02/12] mm/vmalloc: convert allocation-side gap finding
 and insertion to maple_tree
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260613-vmalloc_maple-v1-2-0aa740bb944b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781371215; l=27873;
 i=pranjal.arya@oss.qualcomm.com; s=20260516; h=from:subject:message-id;
 bh=mzShuQjsivGBwOJFNo2gMC1ZvtaDXX3KGiVDadnIc+k=;
 b=mGVagTALUpXKoJTvjX1xzksAIiQDKkp7Jbp8u6A4xxsdoJVlQGaXoQ/FJc7kThKELh8l19Qem
 Ry8mot6zxFWB+nAQpn7K6G1SqyJXpe4OMFQfBFKs+DcisWStadqPjbH
X-Developer-Key: i=pranjal.arya@oss.qualcomm.com; a=ed25519;
 pk=ymtcTlccEIDsi3ErhpjIoZZHKdPBYWGWW0Lchs5MsbE=
X-Proofpoint-GUID: 54SpTZKfbjxPGdTikQzPdU0PFM8xB2oR
X-Proofpoint-ORIG-GUID: 54SpTZKfbjxPGdTikQzPdU0PFM8xB2oR
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEzMDE4MCBTYWx0ZWRfX5TKCnUgP4pf5
 NyEJHkT6Hyb85yHWw55IHukC8Kr5IG91G7momeMeoa7C/EHPuCUgJc312bKkv/FKoWGPl7GnthM
 aA1x7VprdzeeGrCGu7H1NqwvMZTQUDo=
X-Authority-Analysis: v=2.4 cv=JLYLdcKb c=1 sm=1 tr=0 ts=6a2d916a cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=iIov-Uo6zy7MBde1-YQA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22 a=yDLO8QUhx1Xh9DD4DYOy:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEzMDE4MCBTYWx0ZWRfXyRtSgt2OlEtC
 /A6empaTsqh1dBSFG35oIDyHZoiTD9dHr7Gb3LZuKFbaQydaHSevphetHUw8TFx2eb6eye5q8H6
 59eANBK+kfmHm5whotsIMChRW1OPoGmlX8EsjMomnkSTzS6baQqShUhYoNTaBiYbXhpEzkzBhbD
 rTtnObyE96rdJ6yPQmx7edRrtnuCf4xFY51xepX3Q54waQJNcZkFL1jJOziC747IYG/5f8aeLrJ
 x1GMjtAgtNj+tQ2SQ8vAiXExZiXttT8vk57IQBfLyl3MspFB20wLuYOimiYdecDt80OCaBjqlyl
 gbtDfgWqy3hsGMCebMaV/lSybpjJZMKa5FsOvDKh+wqSJ4ZhHniCzqzLt2CKIycCjYGAIg1yakf
 A9Zs2HBCH6iC9VhgomnFRRp0UgrzMULT0MUuG8gZacojyZ8UtI6lFzXgoYT/Pj+amV3ysGcc5QS
 LL0sm5zf+NohOc1VxNg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-13_03,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 impostorscore=0 bulkscore=0 adultscore=0
 malwarescore=0 phishscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606130180
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
	TAGGED_FROM(0.00)[bounces-113000-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[linux-foundation.org,gmail.com,infradead.org,google.com];
	FORGED_RECIPIENTS(0.00)[m:akpm@linux-foundation.org,m:urezki@gmail.com,m:liam@infradead.org,m:aliceryhl@google.com,m:andrewjballance@gmail.com,m:linux-arm-msm@vger.kernel.org,m:linux-mm@kvack.org,m:linux-kernel@vger.kernel.org,m:maple-tree@lists.infradead.org,m:ljs@kernel.org,m:praan@google.com,m:will@kernel.org,m:Suzuki.Poulose@arm.com,m:neil.armstrong@linaro.org,m:smostafa@google.com,m:balbirs@nvidia.com,m:surenb@google.com,m:elver@google.com,m:dvyukov@google.com,m:glider@google.com,m:shuah@kernel.org,m:dev.jain@arm.com,m:jackmanb@google.com,m:puranjay@kernel.org,m:santosh.shukla@amd.com,m:wkarny@gmail.com,m:pranjal.arya@oss.qualcomm.com,m:sudeep.holla@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[pranjal.arya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,kvack.org,lists.infradead.org,kernel.org,google.com,arm.com,linaro.org,nvidia.com,amd.com,gmail.com,oss.qualcomm.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
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
X-Rspamd-Queue-Id: E3C8767F255

Switch __alloc_vmap_area, va_clip, classify_va_fit_type, and the
insertion / merge helpers to drive the global free-area state through
the maple_tree-backed helpers. The augmented rb_tree walk
(find_vmap_lowest_match / find_va_links / augment_tree_propagate_*)
becomes unreachable on the alloc path and is removed.

The alloc path retains a list-based next-fit walk over
free_vmap_area_list driven by free_vmap_alloc_hint, but its
insertion-point lookup, neighbour validation and free-area indexing
run through the maple_tree helpers
(find_vmap_area_insert_point_mt, free_mt_store_va_locked,
free_mt_update_va_locked).

va_clip handles the LE/RE/NE fit types via the new free_mt_*_locked
helpers.

The pcpu and free paths still drive the rb_tree.

Signed-off-by: Pranjal Arya <pranjal.arya@oss.qualcomm.com>
---
 mm/vmalloc.c | 653 +++++++++++++++++++++++++++++------------------------------
 1 file changed, 323 insertions(+), 330 deletions(-)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index 67f753d04c96..c5f509f033e6 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -1535,261 +1535,155 @@ find_vmap_area_exceed_addr_lock(unsigned long addr, struct vmap_area **va)
 	return NULL;
 }
 
-/*
- * This function returns back addresses of parent node
- * and its left or right link for further processing.
- *
- * Otherwise NULL is returned. In that case all further
- * steps regarding inserting of conflicting overlap range
- * have to be declined and actually considered as a bug.
- */
-static __always_inline struct rb_node **
-find_va_links(struct vmap_area *va,
-	struct rb_root *root, struct rb_node *from,
-	struct rb_node **parent)
-{
-	struct vmap_area *tmp_va;
-	struct rb_node **link;
-
-	if (root) {
-		link = &root->rb_node;
-		if (unlikely(!*link)) {
-			*parent = NULL;
-			return link;
-		}
-	} else {
-		link = &from;
-	}
+static __always_inline void
+insert_vmap_area_busy_locked(struct vmap_area *va, struct vmap_node *vn)
+{
+	int err;
 
-	/*
-	 * Go to the bottom of the tree. When we hit the last point
-	 * we end up with parent rb_node and correct direction, i name
-	 * it link, where the new va->rb_node will be attached to.
-	 */
-	do {
-		tmp_va = rb_entry(*link, struct vmap_area, rb_node);
+	lockdep_assert_held(&vn->busy.lock);
 
-		/*
-		 * During the traversal we also do some sanity check.
-		 * Trigger the BUG() if there are sides(left/right)
-		 * or full overlaps.
-		 */
-		if (va->va_end <= tmp_va->va_start)
-			link = &(*link)->rb_left;
-		else if (va->va_start >= tmp_va->va_end)
-			link = &(*link)->rb_right;
-		else {
-			WARN(1, "vmalloc bug: 0x%lx-0x%lx overlaps with 0x%lx-0x%lx\n",
-				va->va_start, va->va_end, tmp_va->va_start, tmp_va->va_end);
+	try_init_busy_mt_locked(vn);
 
-			return NULL;
-		}
-	} while (*link);
+	if (likely(vn->busy.mt_enabled)) {
+		MA_STATE(mas, &vn->busy.mt, va->va_start, va->va_end - 1);
 
-	*parent = &tmp_va->rb_node;
-	return link;
-}
+		if (!insert_vmap_area_list_sorted_mt(va, &vn->busy.mt,
+						     &vn->busy.head))
+			return;
 
-static __always_inline struct list_head *
-get_va_next_sibling(struct rb_node *parent, struct rb_node **link)
-{
-	struct list_head *list;
+		err = mas_store_gfp(&mas, va, GFP_ATOMIC | __GFP_NOWARN);
+		if (WARN_ON_ONCE(err))
+			disable_busy_mt_locked(vn);
 
-	if (unlikely(!parent))
-		/*
-		 * The red-black tree where we try to find VA neighbors
-		 * before merging or inserting is empty, i.e. it means
-		 * there is no free vmap space. Normally it does not
-		 * happen but we handle this case anyway.
-		 */
-		return NULL;
+		return;
+	}
 
-	list = &rb_entry(parent, struct vmap_area, rb_node)->list;
-	return (&parent->rb_right == link ? list->next : list);
+	if (!insert_vmap_area_list_sorted(va, &vn->busy.head))
+		return;
 }
 
 static __always_inline void
-__link_va(struct vmap_area *va, struct rb_root *root,
-	struct rb_node *parent, struct rb_node **link,
-	struct list_head *head, bool augment)
+unlink_vmap_area_busy_locked(struct vmap_area *va, struct vmap_node *vn)
 {
-	/*
-	 * VA is still not in the list, but we can
-	 * identify its future previous list_head node.
-	 */
-	if (likely(parent)) {
-		head = &rb_entry(parent, struct vmap_area, rb_node)->list;
-		if (&parent->rb_right != link)
-			head = head->prev;
-	}
+	int err;
 
-	/* Insert to the rb-tree */
-	rb_link_node(&va->rb_node, parent, link);
-	if (augment) {
-		/*
-		 * Some explanation here. Just perform simple insertion
-		 * to the tree. We do not set va->subtree_max_size to
-		 * its current size before calling rb_insert_augmented().
-		 * It is because we populate the tree from the bottom
-		 * to parent levels when the node _is_ in the tree.
-		 *
-		 * Therefore we set subtree_max_size to zero after insertion,
-		 * to let __augment_tree_propagate_from() puts everything to
-		 * the correct order later on.
-		 */
-		rb_insert_augmented(&va->rb_node,
-			root, &free_vmap_area_rb_augment_cb);
-		va->subtree_max_size = 0;
-	} else {
-		rb_insert_color(&va->rb_node, root);
-	}
+	lockdep_assert_held(&vn->busy.lock);
 
-	/* Address-sort this list */
-	list_add(&va->list, head);
-}
+	MA_STATE(mas, &vn->busy.mt, va->va_start, va->va_end - 1);
 
-static __always_inline void
-link_va(struct vmap_area *va, struct rb_root *root,
-	struct rb_node *parent, struct rb_node **link,
-	struct list_head *head)
-{
-	__link_va(va, root, parent, link, head, false);
-}
+	list_del_init(&va->list);
 
-static __always_inline void
-link_va_augment(struct vmap_area *va, struct rb_root *root,
-	struct rb_node *parent, struct rb_node **link,
-	struct list_head *head)
-{
-	__link_va(va, root, parent, link, head, true);
-}
+	try_init_busy_mt_locked(vn);
 
-static __always_inline void
-__unlink_va(struct vmap_area *va, struct rb_root *root, bool augment)
-{
-	if (WARN_ON(RB_EMPTY_NODE(&va->rb_node)))
+	if (unlikely(!vn->busy.mt_enabled))
 		return;
 
-	if (augment)
-		rb_erase_augmented(&va->rb_node,
-			root, &free_vmap_area_rb_augment_cb);
-	else
-		rb_erase(&va->rb_node, root);
-
-	list_del_init(&va->list);
-	RB_CLEAR_NODE(&va->rb_node);
+	err = mas_store_gfp(&mas, NULL, GFP_ATOMIC | __GFP_NOWARN);
+	if (WARN_ON_ONCE(err))
+		disable_busy_mt_locked(vn);
 }
 
 static __always_inline void
-unlink_va(struct vmap_area *va, struct rb_root *root)
+insert_vmap_area_lazy_locked(struct vmap_area *va, struct vmap_node *vn)
 {
-	__unlink_va(va, root, false);
-}
+	int err;
 
-static __always_inline void
-unlink_va_augment(struct vmap_area *va, struct rb_root *root)
-{
-	__unlink_va(va, root, true);
+	lockdep_assert_held(&vn->lazy.lock);
+
+	try_init_lazy_mt_locked(vn);
+
+	if (likely(vn->lazy.mt_enabled)) {
+		MA_STATE(mas, &vn->lazy.mt, va->va_start, va->va_end - 1);
+
+		if (!insert_vmap_area_list_sorted_mt(va, &vn->lazy.mt,
+						     &vn->lazy.head))
+			return;
+
+		err = mas_store_gfp(&mas, va, GFP_ATOMIC | __GFP_NOWARN);
+		if (WARN_ON_ONCE(err))
+			disable_lazy_mt_locked(vn);
+
+		return;
+	}
+
+	if (!insert_vmap_area_list_sorted(va, &vn->lazy.head))
+		return;
 }
 
-#if DEBUG_AUGMENT_PROPAGATE_CHECK
-/*
- * Gets called when remove the node and rotate.
- */
-static __always_inline unsigned long
-compute_subtree_max_size(struct vmap_area *va)
+static __always_inline bool
+lazy_vmap_areas_empty_locked(struct vmap_node *vn)
 {
-	return max3(va_size(va),
-		get_subtree_max_size(va->rb_node.rb_left),
-		get_subtree_max_size(va->rb_node.rb_right));
+	lockdep_assert_held(&vn->lazy.lock);
+
+	try_init_lazy_mt_locked(vn);
+
+	if (likely(vn->lazy.mt_enabled))
+		return mtree_empty(&vn->lazy.mt);
+
+	return list_empty(&vn->lazy.head);
 }
 
-static void
-augment_tree_propagate_check(void)
+static __always_inline void
+move_lazy_vmap_areas_to_purge_locked(struct vmap_node *vn)
 {
 	struct vmap_area *va;
-	unsigned long computed_size;
+	int err;
 
-	list_for_each_entry(va, &free_vmap_area_list, list) {
-		computed_size = compute_subtree_max_size(va);
-		if (computed_size != va->subtree_max_size)
-			pr_emerg("tree is corrupted: %lu, %lu\n",
-				va_size(va), va->subtree_max_size);
+	lockdep_assert_held(&vn->lazy.lock);
+
+	try_init_lazy_mt_locked(vn);
+
+	if (likely(vn->lazy.mt_enabled)) {
+		list_for_each_entry(va, &vn->lazy.head, list) {
+			MA_STATE(mas, &vn->lazy.mt, va->va_start, va->va_end - 1);
+
+			err = mas_store_gfp(&mas, NULL, GFP_ATOMIC | __GFP_NOWARN);
+			if (WARN_ON_ONCE(err)) {
+				disable_lazy_mt_locked(vn);
+				break;
+			}
+		}
+
+		if (vn->lazy.mt_enabled && WARN_ON_ONCE(!mtree_empty(&vn->lazy.mt)))
+			disable_lazy_mt_locked(vn);
 	}
+
+	list_replace_init(&vn->lazy.head, &vn->purge_list);
 }
-#endif
 
-/*
- * This function populates subtree_max_size from bottom to upper
- * levels starting from VA point. The propagation must be done
- * when VA size is modified by changing its va_start/va_end. Or
- * in case of newly inserting of VA to the tree.
- *
- * It means that __augment_tree_propagate_from() must be called:
- * - After VA has been inserted to the tree(free path);
- * - After VA has been shrunk(allocation path);
- * - After VA has been increased(merging path).
- *
- * Please note that, it does not mean that upper parent nodes
- * and their subtree_max_size are recalculated all the time up
- * to the root node.
- *
- *       4--8
- *        /\
- *       /  \
- *      /    \
- *    2--2  8--8
- *
- * For example if we modify the node 4, shrinking it to 2, then
- * no any modification is required. If we shrink the node 2 to 1
- * its subtree_max_size is updated only, and set to 1. If we shrink
- * the node 8 to 6, then its subtree_max_size is set to 6 and parent
- * node becomes 4--6.
- */
-static __always_inline void
-augment_tree_propagate_from(struct vmap_area *va)
+static __always_inline bool
+insert_vmap_area_free_locked(struct vmap_area *va)
 {
-	/*
-	 * Populate the tree from bottom towards the root until
-	 * the calculated maximum available size of checked node
-	 * is equal to its current one.
-	 */
-	free_vmap_area_rb_augment_cb_propagate(&va->rb_node, NULL);
+	lockdep_assert_held(&free_vmap_area_lock);
 
-#if DEBUG_AUGMENT_PROPAGATE_CHECK
-	augment_tree_propagate_check();
-#endif
-}
+	try_init_free_mt_locked();
 
-static void
-insert_vmap_area(struct vmap_area *va,
-	struct rb_root *root, struct list_head *head)
-{
-	struct rb_node **link;
-	struct rb_node *parent;
+	if (likely(free_mt_supported())) {
+		if (!insert_vmap_area_list_sorted_mt(va, &free_vmap_area_mt,
+						     &free_vmap_area_list))
+			return false;
 
-	link = find_va_links(va, root, NULL, &parent);
-	if (link)
-		link_va(va, root, parent, link, head);
+		free_mt_store_va_locked(va);
+	} else {
+		if (!insert_vmap_area_list_sorted(va, &free_vmap_area_list))
+			return false;
+	}
+
+	return true;
 }
 
-static void
-insert_vmap_area_augment(struct vmap_area *va,
-	struct rb_node *from, struct rb_root *root,
-	struct list_head *head)
+static __always_inline void
+unlink_vmap_area_free_locked(struct vmap_area *va)
 {
-	struct rb_node **link;
-	struct rb_node *parent;
+	lockdep_assert_held(&free_vmap_area_lock);
 
-	if (from)
-		link = find_va_links(va, NULL, from, &parent);
-	else
-		link = find_va_links(va, root, NULL, &parent);
+	if (WARN_ON_ONCE(list_empty(&va->list)))
+		return;
 
-	if (link) {
-		link_va_augment(va, root, parent, link, head);
-		augment_tree_propagate_from(va);
-	}
+	if (likely(free_mt_supported()))
+		free_mt_erase_va_locked(va);
+
+	list_del_init(&va->list);
 }
 
 /*
@@ -1804,29 +1698,20 @@ insert_vmap_area_augment(struct vmap_area *va,
  * ongoing.
  */
 static __always_inline struct vmap_area *
-__merge_or_add_vmap_area(struct vmap_area *va,
-	struct rb_root *root, struct list_head *head, bool augment)
+__merge_or_add_vmap_area(struct vmap_area *va, struct list_head *head, bool update_mt)
 {
 	struct vmap_area *sibling;
 	struct list_head *next;
-	struct rb_node **link;
-	struct rb_node *parent;
+	unsigned long old_start, old_end;
 	bool merged = false;
 
-	/*
-	 * Find a place in the tree where VA potentially will be
-	 * inserted, unless it is merged with its sibling/siblings.
-	 */
-	link = find_va_links(va, root, NULL, &parent);
-	if (!link)
-		return NULL;
+	if (update_mt && free_mt_supported())
+		next = find_vmap_area_insert_point_mt(va, &free_vmap_area_mt, head);
+	else
+		next = find_vmap_area_insert_point_list(va, head);
 
-	/*
-	 * Get next node of VA to check if merging can be done.
-	 */
-	next = get_va_next_sibling(parent, link);
-	if (unlikely(next == NULL))
-		goto insert;
+	if (!next)
+		return NULL;
 
 	/*
 	 * start            end
@@ -1838,7 +1723,11 @@ __merge_or_add_vmap_area(struct vmap_area *va,
 	if (next != head) {
 		sibling = list_entry(next, struct vmap_area, list);
 		if (sibling->va_start == va->va_end) {
+			old_start = sibling->va_start;
+			old_end = sibling->va_end;
 			sibling->va_start = va->va_start;
+			if (update_mt && free_mt_supported())
+				free_mt_update_va_locked(sibling, old_start, old_end);
 
 			/* Free vmap_area object. */
 			kmem_cache_free(vmap_area_cachep, va);
@@ -1862,14 +1751,20 @@ __merge_or_add_vmap_area(struct vmap_area *va,
 			/*
 			 * If both neighbors are coalesced, it is important
 			 * to unlink the "next" node first, followed by merging
-			 * with "previous" one. Otherwise the tree might not be
-			 * fully populated if a sibling's augmented value is
-			 * "normalized" because of rotation operations.
+			 * with "previous" one.
 			 */
-			if (merged)
-				__unlink_va(va, root, augment);
+			if (merged) {
+				if (update_mt)
+					unlink_vmap_area_free_locked(va);
+				else
+					list_del_init(&va->list);
+			}
 
+			old_start = sibling->va_start;
+			old_end = sibling->va_end;
 			sibling->va_end = va->va_end;
+			if (update_mt && free_mt_supported())
+				free_mt_update_va_locked(sibling, old_start, old_end);
 
 			/* Free vmap_area object. */
 			kmem_cache_free(vmap_area_cachep, va);
@@ -1880,31 +1775,97 @@ __merge_or_add_vmap_area(struct vmap_area *va,
 		}
 	}
 
-insert:
-	if (!merged)
-		__link_va(va, root, parent, link, head, augment);
+	if (!merged) {
+		if (update_mt)
+			insert_vmap_area_free_locked(va);
+		else
+			list_add_tail(&va->list, next);
+	}
 
 	return va;
 }
 
 static __always_inline struct vmap_area *
 merge_or_add_vmap_area(struct vmap_area *va,
-	struct rb_root *root, struct list_head *head)
+	struct list_head *head)
 {
-	return __merge_or_add_vmap_area(va, root, head, false);
+	return __merge_or_add_vmap_area(va, head, false);
 }
 
 static __always_inline struct vmap_area *
-merge_or_add_vmap_area_augment(struct vmap_area *va,
-	struct rb_root *root, struct list_head *head)
+merge_or_add_vmap_area_free_locked(struct vmap_area *va)
 {
-	va = __merge_or_add_vmap_area(va, root, head, true);
-	if (va)
-		augment_tree_propagate_from(va);
+	lockdep_assert_held(&free_vmap_area_lock);
+
+	va = __merge_or_add_vmap_area(va, &free_vmap_area_list, true);
+	if (va && va->va_start < free_vmap_alloc_hint)
+		free_vmap_alloc_hint = va->va_start;
 
 	return va;
 }
 
+/*
+ * Transitional wrappers retained until all legacy rb call sites are switched.
+ * Follow-up patches in this series remove these wrappers.
+ */
+static __always_inline void
+insert_vmap_area(struct vmap_area *va, struct rb_root *root,
+		 struct list_head *head)
+{
+	struct vmap_node *vn = addr_to_node(va->va_start);
+
+	if (head == &free_vmap_area_list) {
+		insert_vmap_area_free_locked(va);
+		return;
+	}
+
+	if (head == &vn->lazy.head) {
+		insert_vmap_area_lazy_locked(va, vn);
+		return;
+	}
+
+	insert_vmap_area_busy_locked(va, vn);
+}
+
+static __always_inline void
+insert_vmap_area_augment(struct vmap_area *va, struct rb_node *from,
+			 struct rb_root *root, struct list_head *head)
+{
+	insert_vmap_area(va, root, head);
+}
+
+static __always_inline void unlink_va(struct vmap_area *va, struct rb_root *root)
+{
+	struct vmap_node *vn = addr_to_node(va->va_start);
+
+	if (root == &free_vmap_area_root) {
+		unlink_vmap_area_free_locked(va);
+		return;
+	}
+
+	unlink_vmap_area_busy_locked(va, vn);
+}
+
+static __always_inline void
+unlink_va_augment(struct vmap_area *va, struct rb_root *root)
+{
+	unlink_va(va, root);
+}
+
+static __always_inline void augment_tree_propagate_from(struct vmap_area *va)
+{
+}
+
+static __always_inline struct vmap_area *
+merge_or_add_vmap_area_augment(struct vmap_area *va, struct rb_root *root,
+			       struct list_head *head)
+{
+	if (head == &free_vmap_area_list)
+		return merge_or_add_vmap_area_free_locked(va);
+
+	return merge_or_add_vmap_area(va, head);
+}
+
 static __always_inline bool
 is_within_this_va(struct vmap_area *va, unsigned long size,
 	unsigned long align, unsigned long vstart)
@@ -1924,74 +1885,103 @@ is_within_this_va(struct vmap_area *va, unsigned long size,
 	return (nva_start_addr + size <= va->va_end);
 }
 
-/*
- * Find the first free block(lowest start address) in the tree,
- * that will accomplish the request corresponding to passing
- * parameters. Please note, with an alignment bigger than PAGE_SIZE,
- * a search length is adjusted to account for worst case alignment
- * overhead.
- */
 static __always_inline struct vmap_area *
-find_vmap_lowest_match(struct rb_root *root, unsigned long size,
-	unsigned long align, unsigned long vstart, bool adjust_search_size)
+find_vmap_lowest_match_list(struct list_head *head, unsigned long size,
+			    unsigned long align, unsigned long vstart)
 {
 	struct vmap_area *va;
-	struct rb_node *node;
-	unsigned long length;
 
-	/* Start from the root. */
-	node = root->rb_node;
+	list_for_each_entry(va, head, list) {
+		if (!is_within_this_va(va, size, align, vstart))
+			continue;
 
-	/* Adjust the search size for alignment overhead. */
-	length = adjust_search_size ? size + align - 1 : size;
+		return va;
+	}
 
-	while (node) {
-		va = rb_entry(node, struct vmap_area, rb_node);
+	return NULL;
+}
 
-		if (get_subtree_max_size(node->rb_left) >= length &&
-				vstart < va->va_start) {
-			node = node->rb_left;
-		} else {
-			if (is_within_this_va(va, size, align, vstart))
-				return va;
+static __always_inline unsigned long
+clamp_vmap_alloc_hint(unsigned long hint, unsigned long vstart,
+		      unsigned long vend)
+{
+	if (hint < vstart || hint >= vend)
+		return vstart;
 
-			/*
-			 * Does not make sense to go deeper towards the right
-			 * sub-tree if it does not have a free block that is
-			 * equal or bigger to the requested search length.
-			 */
-			if (get_subtree_max_size(node->rb_right) >= length) {
-				node = node->rb_right;
-				continue;
-			}
+	return hint;
+}
 
-			/*
-			 * OK. We roll back and find the first right sub-tree,
-			 * that will satisfy the search criteria. It can happen
-			 * due to "vstart" restriction or an alignment overhead
-			 * that is bigger then PAGE_SIZE.
-			 */
-			while ((node = rb_parent(node))) {
-				va = rb_entry(node, struct vmap_area, rb_node);
-				if (is_within_this_va(va, size, align, vstart))
+/*
+ * Next-fit scan with wrap-around. Use maple to jump to the first candidate
+ * around the hint in O(log n), then continue on the ordered list for cheap
+ * neighbour traversal and deterministic coalescing behaviour.
+ */
+static __always_inline struct vmap_area *
+find_vmap_match_list_next_fit(struct list_head *head, unsigned long size,
+			      unsigned long align, unsigned long vstart,
+			      unsigned long vend)
+{
+	struct vmap_area *va, *start = NULL;
+	unsigned long hint;
+	bool wrapped;
+
+	hint = clamp_vmap_alloc_hint(free_vmap_alloc_hint, vstart, vend);
+
+	if (hint != vstart) {
+		if (free_mt_supported())
+			start = __find_vmap_area_exceed_addr_mt(hint,
+								&free_vmap_area_mt);
+
+		if (start) {
+			va = start;
+			list_for_each_entry_from(va, head, list) {
+				if (is_within_this_va(va, size, align, hint))
 					return va;
+			}
+		} else {
+			list_for_each_entry(va, head, list) {
+				if (va->va_end <= hint)
+					continue;
 
-				if (get_subtree_max_size(node->rb_right) >= length &&
-						vstart <= va->va_start) {
-					/*
-					 * Shift the vstart forward. Please note, we update it with
-					 * parent's start address adding "1" because we do not want
-					 * to enter same sub-tree after it has already been checked
-					 * and no suitable free block found there.
-					 */
-					vstart = va->va_start + 1;
-					node = node->rb_right;
-					break;
-				}
+				if (is_within_this_va(va, size, align, hint))
+					return va;
 			}
 		}
 	}
 
+	wrapped = (hint != vstart);
+	list_for_each_entry(va, head, list) {
+		if (wrapped) {
+			if (start && va == start)
+				break;
+			if (!start && va->va_start >= hint)
+				break;
+		}
+
+		if (is_within_this_va(va, size, align, vstart))
+			return va;
+	}
+
+	return NULL;
+}
+
+static __always_inline struct vmap_area *
+find_vmap_lowest_match_mt(struct maple_tree *tree, unsigned long size,
+			  unsigned long align, unsigned long vstart)
+{
+	MA_STATE(mas, tree, vstart, vstart);
+	struct vmap_area *va;
+
+	mas_set(&mas, vstart);
+	va = mas_find(&mas, ULONG_MAX);
+
+	while (va) {
+		if (is_within_this_va(va, size, align, vstart))
+			return va;
+
+		va = mas_next(&mas, ULONG_MAX);
+	}
+
 	return NULL;
 }
 
@@ -2015,8 +2005,8 @@ find_vmap_lowest_linear_match(struct list_head *head, unsigned long size,
 }
 
 static void
-find_vmap_lowest_match_check(struct rb_root *root, struct list_head *head,
-			     unsigned long size, unsigned long align)
+find_vmap_lowest_match_check(struct list_head *head, unsigned long size,
+			     unsigned long align)
 {
 	struct vmap_area *va_1, *va_2;
 	unsigned long vstart;
@@ -2025,7 +2015,10 @@ find_vmap_lowest_match_check(struct rb_root *root, struct list_head *head,
 	get_random_bytes(&rnd, sizeof(rnd));
 	vstart = VMALLOC_START + rnd;
 
-	va_1 = find_vmap_lowest_match(root, size, align, vstart, false);
+	if (free_mt_supported())
+		va_1 = find_vmap_lowest_match_mt(&free_vmap_area_mt, size, align, vstart);
+	else
+		va_1 = find_vmap_lowest_linear_match(head, size, align, vstart);
 	va_2 = find_vmap_lowest_linear_match(head, size, align, vstart);
 
 	if (va_1 != va_2)
@@ -2069,11 +2062,12 @@ classify_va_fit_type(struct vmap_area *va,
 }
 
 static __always_inline int
-va_clip(struct rb_root *root, struct list_head *head,
-		struct vmap_area *va, unsigned long nva_start_addr,
-		unsigned long size)
+va_clip(struct vmap_area *va, unsigned long nva_start_addr,
+	unsigned long size)
 {
 	struct vmap_area *lva = NULL;
+	unsigned long old_start = va->va_start;
+	unsigned long old_end = va->va_end;
 	enum fit_type type = classify_va_fit_type(va, nva_start_addr, size);
 
 	if (type == FL_FIT_TYPE) {
@@ -2084,7 +2078,7 @@ va_clip(struct rb_root *root, struct list_head *head,
 		 * V      NVA      V
 		 * |---------------|
 		 */
-		unlink_va_augment(va, root);
+		unlink_vmap_area_free_locked(va);
 		kmem_cache_free(vmap_area_cachep, va);
 	} else if (type == LE_FIT_TYPE) {
 		/*
@@ -2159,10 +2153,11 @@ va_clip(struct rb_root *root, struct list_head *head,
 	}
 
 	if (type != FL_FIT_TYPE) {
-		augment_tree_propagate_from(va);
+		if (free_mt_supported())
+			free_mt_update_va_locked(va, old_start, old_end);
 
 		if (lva)	/* type == NE_FIT_TYPE */
-			insert_vmap_area_augment(lva, &va->rb_node, root, head);
+			insert_vmap_area_free_locked(lva);
 	}
 
 	return 0;
@@ -2170,7 +2165,6 @@ va_clip(struct rb_root *root, struct list_head *head,
 
 static unsigned long
 va_alloc(struct vmap_area *va,
-		struct rb_root *root, struct list_head *head,
 		unsigned long size, unsigned long align,
 		unsigned long vstart, unsigned long vend)
 {
@@ -2187,7 +2181,7 @@ va_alloc(struct vmap_area *va,
 		return -ERANGE;
 
 	/* Update the free vmap_area. */
-	ret = va_clip(root, head, va, nva_start_addr, size);
+	ret = va_clip(va, nva_start_addr, size);
 	if (WARN_ON_ONCE(ret))
 		return ret;
 
@@ -2199,35 +2193,37 @@ va_alloc(struct vmap_area *va,
  * Otherwise an error value is returned that indicates failure.
  */
 static __always_inline unsigned long
-__alloc_vmap_area(struct rb_root *root, struct list_head *head,
-	unsigned long size, unsigned long align,
-	unsigned long vstart, unsigned long vend)
+__alloc_vmap_area(unsigned long size, unsigned long align,
+		  unsigned long vstart, unsigned long vend)
 {
-	bool adjust_search_size = true;
 	unsigned long nva_start_addr;
 	struct vmap_area *va;
 
+	lockdep_assert_held(&free_vmap_area_lock);
+
 	/*
-	 * Do not adjust when:
-	 *   a) align <= PAGE_SIZE, because it does not make any sense.
-	 *      All blocks(their start addresses) are at least PAGE_SIZE
-	 *      aligned anyway;
-	 *   b) a short range where a requested size corresponds to exactly
-	 *      specified [vstart:vend] interval and an alignment > PAGE_SIZE.
-	 *      With adjusted search length an allocation would not succeed.
+	 * Next-fit with wrap-around lowers repeated list-head scans in
+	 * high-churn workloads.
 	 */
-	if (align <= PAGE_SIZE || (align > PAGE_SIZE && (vend - vstart) == size))
-		adjust_search_size = false;
+	va = find_vmap_match_list_next_fit(&free_vmap_area_list, size, align,
+					   vstart, vend);
 
-	va = find_vmap_lowest_match(root, size, align, vstart, adjust_search_size);
 	if (unlikely(!va))
 		return -ENOENT;
 
-	nva_start_addr = va_alloc(va, root, head, size, align, vstart, vend);
+	nva_start_addr = va_alloc(va, size, align, vstart, vend);
+	if (!IS_ERR_VALUE(nva_start_addr)) {
+		unsigned long next_hint;
+
+		if (check_add_overflow(nva_start_addr, size, &next_hint))
+			free_vmap_alloc_hint = vstart;
+		else
+			free_vmap_alloc_hint = next_hint;
+	}
 
 #if DEBUG_AUGMENT_LOWEST_MATCH_CHECK
 	if (!IS_ERR_VALUE(nva_start_addr))
-		find_vmap_lowest_match_check(root, head, size, align);
+		find_vmap_lowest_match_check(&free_vmap_area_list, size, align);
 #endif
 
 	return nva_start_addr;
@@ -2441,8 +2437,7 @@ static struct vmap_area *alloc_vmap_area(unsigned long size,
 retry:
 	if (IS_ERR_VALUE(addr)) {
 		preload_this_cpu_lock(&free_vmap_area_lock, gfp_mask, node);
-		addr = __alloc_vmap_area(&free_vmap_area_root, &free_vmap_area_list,
-			size, align, vstart, vend);
+		addr = __alloc_vmap_area(size, align, vstart, vend);
 		spin_unlock(&free_vmap_area_lock);
 
 		/*
@@ -2589,7 +2584,6 @@ static void
 decay_va_pool_node(struct vmap_node *vn, bool full_decay)
 {
 	LIST_HEAD(decay_list);
-	struct rb_root decay_root = RB_ROOT;
 	struct vmap_area *va, *nva;
 	unsigned long n_decay, pool_len;
 	int i;
@@ -2618,7 +2612,7 @@ decay_va_pool_node(struct vmap_node *vn, bool full_decay)
 				break;
 
 			list_del_init(&va->list);
-			merge_or_add_vmap_area(va, &decay_root, &decay_list);
+			merge_or_add_vmap_area(va, &decay_list);
 		}
 
 		/*
@@ -5456,8 +5450,7 @@ struct vm_struct **pcpu_get_vm_areas(const unsigned long *offsets,
 			/* It is a BUG(), but trigger recovery instead. */
 			goto recovery;
 
-		ret = va_clip(&free_vmap_area_root,
-			&free_vmap_area_list, va, start, size);
+		ret = va_clip(va, start, size);
 		if (WARN_ON_ONCE(unlikely(ret)))
 			/* It is a BUG(), but trigger recovery instead. */
 			goto recovery;

-- 
2.34.1


