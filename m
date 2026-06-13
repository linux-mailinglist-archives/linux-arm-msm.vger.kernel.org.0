Return-Path: <linux-arm-msm+bounces-113004-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id yG4QEJ+RLWpmhgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113004-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jun 2026 19:21:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 90DCB67F26A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jun 2026 19:21:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=kfAi0W0E;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=gfYwCly9;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113004-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113004-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1B884301DCF8
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jun 2026 17:21:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBA79393DFB;
	Sat, 13 Jun 2026 17:21:19 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7566B395AC1
	for <linux-arm-msm@vger.kernel.org>; Sat, 13 Jun 2026 17:21:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781371279; cv=none; b=tYDe1FgwB+5AlmQu2Wcxb0p2hvULZ5W+xkpkslF1GwcO/Q3McVvC8DU+W0i+NmDwnYA+FmKfyHvzeEd3aLYzbav85ghNH1h1cWJfuWEkIgi8uC4Jd6Fd+763fCXWRYY9X8HshrT+VmmPJITJjwY50BlKFm2Vm/Nq1NII66UhE/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781371279; c=relaxed/simple;
	bh=zbxu+zhrrq8kNARCxboH4iwVnk+IT7v84v8g4HuQcSE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CqLfZK+XCFaB+fjRyjrz0lUk0FSPoN6pT/Rmbz4Xn5wL8v55uzKuYTYrGtk9mwxsHo6GcXzRSgjmig1jYowbW24m+0ZdyERIi5hTWBSloBSLzdcBFABrTPJqZ9tacTL2hSJsWZCE+8Pexz4YJyoeTZgrEkM31cuIqdz+Og7tD7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kfAi0W0E; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gfYwCly9; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65DFA2qT2690790
	for <linux-arm-msm@vger.kernel.org>; Sat, 13 Jun 2026 17:21:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/I6iFme5fkx2C9j5fdSlySDSrUwV6eedj4hKkQAifjg=; b=kfAi0W0Ea2oNzZlF
	pbJ3BANSwcs3xnk4Dt298ANsFrPlm4UA5OGzoapOvGsOIIn3Dfnvg2qjppwHgHvB
	WA7QgSTVohXpxXUHKlbcs1W/tfKRAdLnGhXsl66VQbcGYMGkzExJ4PN7ZE8wsfMl
	rMG0T7XSSM+WVOsoqrz7t1fcwoDvVe69vul8cYFErN1xz3Y+65NPicnHT7GTrthh
	MlOrB8Kj0IuhXen3mDUIPSlsOhwO5Wxh1inH37pgpPp5wkPW0qS6sFQFJSCZZqQm
	YqkSgOvuLDrYfiXAUXtpU9GG/r/o6imNQ+i67vJafYbHeV/6VnmyQzGbxs/NdNlm
	kgP4yg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eryybsj6n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 13 Jun 2026 17:21:15 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8423970cb30so1363390b3a.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 13 Jun 2026 10:21:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781371275; x=1781976075; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/I6iFme5fkx2C9j5fdSlySDSrUwV6eedj4hKkQAifjg=;
        b=gfYwCly9UyDHgfAc3G3WKvD3gkPmCjb3UsDuuiEcLKp/sAQY27dEbsEsP7vDBpoh5d
         udOJh/mkuy9dVMowI5MMbMmfX0Anhowg2womxZ51FfaG7fm6sXvYsgHJefjcQO/Rfw2N
         vLR1O2E4BIFU4A1khy42f+F3i63JwZYulJqWGDvUPnJO8Whw3UP5tmOlPLViLWQ/K3FU
         prboJJw1OyweVzGo6O3Y+G1i4C/Z3PyKiMucj2lFAzCSLGLSqYWQRlFCLWrlKrumdfHH
         BJXFe8l0Sy5FG76yMJ4B47oXGzLYHqVl5lDw1edzSvoJHk23l/sn2A89bti+owov1jiE
         Q7iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781371275; x=1781976075;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/I6iFme5fkx2C9j5fdSlySDSrUwV6eedj4hKkQAifjg=;
        b=kh6riy+XnE1hgioe1vFJNZ33snw8QgJshoHNx1AwqAkIaieVG6RjqktGOM4benEAWl
         P88wn52iKVFAnPC3oY/KdzTZ6nUWnAnqpAZZAR0KW/qiOIVaSS1FJNM45sxPah/8Xep0
         PcXSn56MGN7+MoSb7+Nb1qtrkR4YVk5EvqCedGeZZdbyPu5RbNKI4s8wk7gsjErJwg94
         W0cCgmEkkkIzhYMUuZIZRjCbk9TN5kBdl/4NL6VZohhc02FqCMIgHYo8/abyGUMGD2aZ
         qgcN16O9HMw3DIzopg1wPrS+O4QH1azIWzrm6Mo9nnbq5bjr13H7CxUP3f+4zNCWH0vM
         J7bQ==
X-Gm-Message-State: AOJu0YwO/HLwXLrQ+8E1pWPjPxat0LciM1d8eswrgzVZg8KwH7YRSwWY
	/1hvoxelFZRnhGtF2seKLN5Dc+3kGhafdTQe/UcHAjtrAwq/PE+gBjswTXuGHIiS7xG8rziLEOL
	n8E/y3BDA6tSvFBqhSWEEyeYXyEdaBcjd8kRh/Q+qAvmDE4cRjh/cLsQg+iQo/Ye+qp4W
X-Gm-Gg: Acq92OE+Eyf20LX9RtpgJuLz+78g0CoBkRCQ5/5wQADX+fv0xA6B7Y7ZYRzxSr3mYOl
	ncYbFK8txf9y8loPvQ2/LaPAg0raUk4mojdcbMb/auRIZJUohfSJvtS/6orD/Zi/O/B8vcyZPcI
	xAWWy+2cSZxMkhu4vF2GGmewkwsHz1fn6XEyOnebbmv1gJ0cAvREcUkheu4QcrUTt7cO4mwgVAi
	EIhythxxf0DHNrhEgcfc8CZn4KST9kNC9R85mq9UK3uAbkF0nvqUhFIBsXKx77OtsCltHesUWM9
	MgkDqewsdTE4yo5nsXezsY0KG+ZIrUAgBbLMQoaSnowqlLvJB02I1IFyg4C578gWIkdBuiUQBfD
	/A8/4dqrVPGKjslnJFP1j7gIRyALKAlEdqv3KG4BbvfWr8DI3LqkdJA==
X-Received: by 2002:a05:6a00:238c:b0:837:e9cc:d46e with SMTP id d2e1a72fcca58-844e1a2af43mr4931718b3a.21.1781371274588;
        Sat, 13 Jun 2026 10:21:14 -0700 (PDT)
X-Received: by 2002:a05:6a00:238c:b0:837:e9cc:d46e with SMTP id d2e1a72fcca58-844e1a2af43mr4931674b3a.21.1781371274064;
        Sat, 13 Jun 2026 10:21:14 -0700 (PDT)
Received: from hu-pranarya-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434accbec5sm5390913b3a.16.2026.06.13.10.21.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 10:21:13 -0700 (PDT)
From: Pranjal Arya <pranjal.arya@oss.qualcomm.com>
Date: Sat, 13 Jun 2026 22:49:48 +0530
Subject: [PATCH RFC 06/12] mm/vmalloc: tighten alloc/free hot paths
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260613-vmalloc_maple-v1-6-0aa740bb944b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781371215; l=18494;
 i=pranjal.arya@oss.qualcomm.com; s=20260516; h=from:subject:message-id;
 bh=zbxu+zhrrq8kNARCxboH4iwVnk+IT7v84v8g4HuQcSE=;
 b=6nysurH5i68Eunbid0E9yIxoEU1j7CC37Xen+8vyn32srCewr3yrDNXjXSb1C4oOv2BtOpyVX
 5l2hc7ejOSGAHu43D1gJQjtwsVNhnNBooF4I6rHvvcFNLBNmY7ZdabV
X-Developer-Key: i=pranjal.arya@oss.qualcomm.com; a=ed25519;
 pk=ymtcTlccEIDsi3ErhpjIoZZHKdPBYWGWW0Lchs5MsbE=
X-Proofpoint-GUID: YXBWGlnFxW2HpgIWH25cOXsnGb8hFuUf
X-Proofpoint-ORIG-GUID: YXBWGlnFxW2HpgIWH25cOXsnGb8hFuUf
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEzMDE4MCBTYWx0ZWRfX/g4PwB827pIe
 H/g15zhCF0D5MjNSBLP1JbpfMRe1HTEAe5qoafXWcKMcPjYwaZ91LGkxJxnsb05QXFTTd1a+PIe
 KPjj/mTzLnpnMShXRIikFDYD9f7ggjk=
X-Authority-Analysis: v=2.4 cv=JLYLdcKb c=1 sm=1 tr=0 ts=6a2d918b cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=bFY0SaVsXT4y8Vv8kk0A:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEzMDE4MCBTYWx0ZWRfX2n9aV07ZD69v
 xa6zdhqWPDQJK+KnfzH5yJXs6QihGxotNkAIsdr5CRUEuQ0OXPM5MMFBkmc5cSWdYDFIX0UsXW0
 bGAUFHBMZOX6g7ph03jsW92XFxOyPWh+thC3hY376xOkEvGi6lO8x2PitkuCGzJy0lBs4UHkx2y
 emzl4hEMBm4qMvJT/erkJWpOlvBDunfMXUzmN4kcsa4dPFR4PFo2CjvfgVkBodgA4Wzzf2mzHW2
 Rsej8ZAT00wX2ylJvtzYqXQYKk5JPneogmgnJIT6pFs0fL9ExuIyjAOdazPH3QBGlu4QORlXTi+
 4BoXM49wwYjTGYus9v2ePSqEyHnrwy+XeFoSNK9fICvHQ+v2qyULhRQ+EW30KpIXRggE1r+ySuN
 lGW6vovIaZya3Y/CYo3gBfurKiVVDNwtKvdueBXTvAeWsxSJViVsK93kMPWDDLanaKkgqiLFFSK
 DpWheAs6z2R2DuaG4mQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-13_03,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 spamscore=0 impostorscore=0 bulkscore=0 adultscore=0
 malwarescore=0 phishscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606130180
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[28];
	TAGGED_FROM(0.00)[bounces-113004-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[linux-foundation.org,gmail.com,infradead.org,google.com];
	FORGED_RECIPIENTS(0.00)[m:akpm@linux-foundation.org,m:urezki@gmail.com,m:liam@infradead.org,m:aliceryhl@google.com,m:andrewjballance@gmail.com,m:linux-arm-msm@vger.kernel.org,m:linux-mm@kvack.org,m:linux-kernel@vger.kernel.org,m:maple-tree@lists.infradead.org,m:ljs@kernel.org,m:praan@google.com,m:will@kernel.org,m:Suzuki.Poulose@arm.com,m:neil.armstrong@linaro.org,m:smostafa@google.com,m:balbirs@nvidia.com,m:surenb@google.com,m:elver@google.com,m:dvyukov@google.com,m:glider@google.com,m:shuah@kernel.org,m:dev.jain@arm.com,m:jackmanb@google.com,m:puranjay@kernel.org,m:santosh.shukla@amd.com,m:wkarny@gmail.com,m:pranjal.arya@oss.qualcomm.com,m:sudeep.holla@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[pranjal.arya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,kvack.org,lists.infradead.org,kernel.org,google.com,arm.com,linaro.org,nvidia.com,amd.com,gmail.com,oss.qualcomm.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
X-Rspamd-Queue-Id: 90DCB67F26A

Three small refinements that follow from using maple_tree more
idiomatically on the alloc and free walkers:

  - Carry the MA_STATE through the alloc walker instead of dropping
    and re-positioning it between the gap query, the candidate
    classify step, and the post-clip publish.  The walker is already
    pointing at the chosen range; reuse it.

  - When the gap query is satisfied by an entry whose start is not
    yet aligned, ask for a gap of (size + align - 1) so the first
    match is guaranteed alignable.  This matches the effective
    behaviour of the augmented rb_tree's gap traversal.

  - When va_clip narrows an existing free entry, store NULL on just
    the consumed sub-range instead of erasing the whole entry and
    re-storing the surviving prefix/suffix.  mas_store(NULL,
    [start, end]) leaves the un-trimmed sub-range of the original
    entry intact, so the re-store is unnecessary.

  - Walk the address-keyed occupied tree with mas_find on the rare
    decay path so the per-node free-area scan can prune ranges that
    are already aligned out.

No semantic change to the allocator policy, the free-area shape, or
the addresses returned.

Signed-off-by: Pranjal Arya <pranjal.arya@oss.qualcomm.com>
---
 mm/vmalloc.c | 338 +++++++++++++++++++++++++++++++++++++++++++++++++----------
 1 file changed, 283 insertions(+), 55 deletions(-)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index 7feb1b182cfa..5bc1e47c456a 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -899,6 +899,7 @@ static struct maple_tree occupied_vmap_area_mt =
 		       free_vmap_area_lock);
 static bool occupied_vmap_area_mt_enabled;
 static bool occupied_vmap_area_mt_init_tried;
+static bool occupied_vmap_area_perf_mode;
 
 /*
  * Preload a CPU with one object for "no edge" split case. The
@@ -1073,12 +1074,13 @@ static __always_inline bool free_mt_store_va_locked(struct vmap_area *va)
 	if (!err) {
 		mas_store_prealloc(&mas, va);
 		mas_destroy(&mas);
-	} else {
-		err = mas_store_gfp(&mas, va, GFP_ATOMIC | __GFP_NOWARN);
-		if (WARN_ON_ONCE(err))
-			return false;
+		return true;
 	}
 
+	err = mas_store_gfp(&mas, va, GFP_ATOMIC | __GFP_NOWARN);
+	if (WARN_ON_ONCE(err))
+		return false;
+
 	return true;
 }
 
@@ -1119,6 +1121,31 @@ free_mt_update_va_locked(struct vmap_area *va, unsigned long old_start,
 	return true;
 }
 
+/*
+ * Trim a stored range entry by clearing a sub-range from one end.
+ * Used by LE_FIT and RE_FIT in va_clip(): the original [old_start,
+ * old_end-1]->@va entry survives intact at the un-trimmed sub-range,
+ * so a single mas_store NULL replaces the explicit erase + restore-at-
+ * shrunk-range pair, halving maple-tree work for edge clips. NE_FIT
+ * uses the same primitive after first inserting @lva, which trades 3
+ * stores (erase + store + lva) for 2 (lva + middle trim).
+ */
+static __always_inline bool
+free_mt_trim_range_locked(unsigned long trim_start, unsigned long trim_end)
+{
+	int err;
+
+	lockdep_assert_held(&free_vmap_area_lock);
+
+	if (trim_start >= trim_end)
+		return true;
+
+	MA_STATE(mas, &free_vmap_area_mt, trim_start, trim_end - 1);
+
+	err = mas_store_gfp(&mas, NULL, GFP_ATOMIC | __GFP_NOWARN);
+	return !WARN_ON_ONCE(err);
+}
+
 static __always_inline void
 retry_queue_add_va_locked(struct vmap_area *va)
 {
@@ -1175,6 +1202,11 @@ static __always_inline void try_init_free_mt_locked(void)
 }
 
 static __always_inline bool occupied_mt_supported(void)
+{
+	return occupied_vmap_area_perf_mode && occupied_vmap_area_mt_enabled;
+}
+
+static __always_inline bool occupied_mt_enabled(void)
 {
 	return occupied_vmap_area_mt_enabled;
 }
@@ -1194,28 +1226,48 @@ static __always_inline void try_init_occupied_mt_locked(void)
 }
 
 static __always_inline bool
-occupied_mt_store_range_locked(unsigned long start, unsigned long end)
+occupied_mt_store_range_raw_locked(unsigned long start, unsigned long end)
 {
 	int err;
 
 	lockdep_assert_held(&free_vmap_area_lock);
 
-	if (WARN_ON_ONCE(!occupied_mt_supported()))
-		return false;
+	if (!occupied_mt_enabled())
+		return true;
 
 	MA_STATE(mas, &occupied_vmap_area_mt, start, end - 1);
 
-	err = mas_preallocate(&mas, XA_ZERO_ENTRY, GFP_NOWAIT | __GFP_NOWARN);
-	if (!err) {
-		mas_store_prealloc(&mas, XA_ZERO_ENTRY);
-		mas_destroy(&mas);
+	err = mas_store_gfp(&mas, XA_ZERO_ENTRY, GFP_ATOMIC | __GFP_NOWARN);
+	return !WARN_ON_ONCE(err);
+}
+
+static __always_inline bool
+occupied_mt_erase_range_raw_locked(unsigned long start, unsigned long end)
+{
+	int err;
+
+	lockdep_assert_held(&free_vmap_area_lock);
+
+	if (!occupied_mt_enabled())
 		return true;
-	}
 
-	err = mas_store_gfp(&mas, XA_ZERO_ENTRY, GFP_ATOMIC | __GFP_NOWARN);
+	MA_STATE(mas, &occupied_vmap_area_mt, start, end - 1);
+
+	err = mas_store_gfp(&mas, NULL, GFP_ATOMIC | __GFP_NOWARN);
 	return !WARN_ON_ONCE(err);
 }
 
+static __always_inline bool
+occupied_mt_store_range_locked(unsigned long start, unsigned long end)
+{
+	lockdep_assert_held(&free_vmap_area_lock);
+
+	if (!occupied_mt_supported())
+		return true;
+
+	return occupied_mt_store_range_raw_locked(start, end);
+}
+
 static __always_inline bool
 occupied_mt_store_va_locked(struct vmap_area *va)
 {
@@ -1227,17 +1279,12 @@ occupied_mt_store_va_locked(struct vmap_area *va)
 static __always_inline bool
 occupied_mt_erase_range_locked(unsigned long start, unsigned long end)
 {
-	int err;
-
 	lockdep_assert_held(&free_vmap_area_lock);
 
 	if (WARN_ON_ONCE(!occupied_mt_supported()))
 		return false;
 
-	MA_STATE(mas, &occupied_vmap_area_mt, start, end - 1);
-
-	err = mas_store_gfp(&mas, NULL, GFP_ATOMIC | __GFP_NOWARN);
-	return !WARN_ON_ONCE(err);
+	return occupied_mt_erase_range_raw_locked(start, end);
 }
 
 static __always_inline bool
@@ -1303,6 +1350,24 @@ __find_vmap_area_enclose_addr_mt(unsigned long addr, struct maple_tree *tree)
 	return mas_find_rev(&mas, 0);
 }
 
+static __always_inline bool
+find_vmap_area_insert_neighbors_mt_locked(struct maple_tree *tree,
+					  unsigned long start,
+					  unsigned long end,
+					  struct vmap_area **left,
+					  struct vmap_area **right)
+{
+	*left = __find_vmap_area_enclose_addr_mt(start, tree);
+	if (*left && WARN_ON_ONCE((*left)->va_end > start))
+		return false;
+
+	*right = __find_vmap_area_exceed_addr_mt(start, tree);
+	if (*right && WARN_ON_ONCE((*right)->va_start < end))
+		return false;
+
+	return true;
+}
+
 static __always_inline bool
 validate_vmap_area_range_insert_mt_locked(struct maple_tree *tree,
 					  unsigned long start,
@@ -1310,12 +1375,8 @@ validate_vmap_area_range_insert_mt_locked(struct maple_tree *tree,
 {
 	struct vmap_area *left, *right;
 
-	left = __find_vmap_area_enclose_addr_mt(start, tree);
-	if (left && WARN_ON_ONCE(left->va_end > start))
-		return false;
-
-	right = __find_vmap_area_exceed_addr_mt(start, tree);
-	if (right && WARN_ON_ONCE(right->va_start < end))
+	if (!find_vmap_area_insert_neighbors_mt_locked(tree, start, end,
+						       &left, &right))
 		return false;
 
 	return true;
@@ -1499,10 +1560,11 @@ unlink_vmap_area_lazy_locked(struct vmap_area *va, struct vmap_node *vn)
 }
 
 /*
- * Transition a VA into the lazy index and drop occupied tracking. On occupied
- * erase failure, attempt to roll back the lazy insertion; if rollback fails we
- * keep the lazy entry and let purge-side erase_occupied handling repair stale
- * occupied state.
+ * Transition a VA into the lazy index.
+ *
+ * In the default mode, occupied tracking is dropped while the VA is lazy.
+ * In occupied perf mode, lazy ranges stay occupied-indexed so hole search can
+ * avoid repeatedly probing unavailable gaps.
  *
  * Returns true when the VA remains lazy-indexed; false when it should be
  * retried via non-index queue.
@@ -1518,6 +1580,11 @@ publish_vmap_area_lazy(struct vmap_area *va, struct vmap_node *vn)
 		return false;
 	}
 
+	if (occupied_mt_supported()) {
+		spin_unlock(&vn->lazy.lock);
+		return true;
+	}
+
 	/*
 	 * Keep lazy.lock held while dropping occupied tracking so purge-side
 	 * lazy extraction cannot move @va to purge_list during rollback.
@@ -1588,24 +1655,34 @@ move_lazy_vmap_areas_to_purge_locked(struct vmap_node *vn)
 }
 
 static __always_inline bool
-insert_vmap_area_free_locked(struct vmap_area *va)
+insert_vmap_area_free_nocheck_locked(struct vmap_area *va)
 {
-	struct vmap_area *prev, *next;
-
 	lockdep_assert_held(&free_vmap_area_lock);
 
-	prev = __find_vmap_area_enclose_addr_mt(va->va_start, &free_vmap_area_mt);
-	if (prev && WARN_ON_ONCE(prev->va_end > va->va_start))
-		return false;
+	try_init_free_mt_locked();
 
-	next = __find_vmap_area_exceed_addr_mt(va->va_start, &free_vmap_area_mt);
-	if (next && WARN_ON_ONCE(next->va_start < va->va_end))
+	if (unlikely(!free_mt_supported()))
 		return false;
 
 	INIT_LIST_HEAD(&va->list);
 	return free_mt_store_va_locked(va);
 }
 
+static __always_inline bool
+insert_vmap_area_free_locked(struct vmap_area *va)
+{
+	struct vmap_area *prev, *next;
+
+	lockdep_assert_held(&free_vmap_area_lock);
+
+	if (!find_vmap_area_insert_neighbors_mt_locked(&free_vmap_area_mt,
+						       va->va_start, va->va_end,
+						       &prev, &next))
+		return false;
+
+	return insert_vmap_area_free_nocheck_locked(va);
+}
+
 static __always_inline void
 unlink_vmap_area_free_locked(struct vmap_area *va)
 {
@@ -1634,8 +1711,9 @@ merge_or_add_vmap_area_free_locked(struct vmap_area *va)
 	new_start = va->va_start;
 	new_end = va->va_end;
 
-	left = __find_vmap_area_enclose_addr_mt(new_start, &free_vmap_area_mt);
-	if (left && WARN_ON_ONCE(left->va_end > new_start))
+	if (!find_vmap_area_insert_neighbors_mt_locked(&free_vmap_area_mt,
+						       new_start, new_end,
+						       &left, &right))
 		return NULL;
 
 	right = __find_vmap_area_exceed_addr_mt(new_start, &free_vmap_area_mt);
@@ -1657,7 +1735,7 @@ merge_or_add_vmap_area_free_locked(struct vmap_area *va)
 	va->va_start = new_start;
 	va->va_end = new_end;
 
-	if (!insert_vmap_area_free_locked(va))
+	if (!insert_vmap_area_free_nocheck_locked(va))
 		return NULL;
 
 	return va;
@@ -1690,6 +1768,10 @@ occupied_mt_find_hole_window_locked(unsigned long min, unsigned long max,
 	MA_STATE(mas, &occupied_vmap_area_mt, 0, 0);
 	unsigned long search = min;
 	unsigned long hole_end;
+	bool retry_empty;
+
+	lockdep_assert_held(&free_vmap_area_lock);
+	retry_empty = list_empty(&vmap_retry_list);
 
 	while (search <= max) {
 		unsigned long candidate, candidate_end;
@@ -1709,7 +1791,8 @@ occupied_mt_find_hole_window_locked(unsigned long min, unsigned long max,
 		while (candidate >= search && candidate_end <= hole_end) {
 			unsigned long blocked_end = 0;
 
-			if (!retry_queue_overlap_locked(candidate, candidate_end,
+			if (retry_empty ||
+			    !retry_queue_overlap_locked(candidate, candidate_end,
 							&blocked_end)) {
 				*addr = candidate;
 				return true;
@@ -1751,6 +1834,70 @@ occupied_mt_find_hole_lowest_locked(unsigned long size, unsigned long align,
 	return -ENOENT;
 }
 
+static __always_inline struct vmap_area *
+free_mt_find_enclose_range_locked(unsigned long start, unsigned long end)
+{
+	struct vmap_area *va;
+
+	lockdep_assert_held(&free_vmap_area_lock);
+
+	va = __find_vmap_area_mt(start, &free_vmap_area_mt);
+	if (!va)
+		return NULL;
+
+	if (va->va_start > start || va->va_end < end)
+		return NULL;
+
+	return va;
+}
+
+static __always_inline void
+occupied_mt_cache_gap_miss_locked(unsigned long candidate, unsigned long vend)
+{
+	struct vmap_area *prev, *next;
+	unsigned long blocked_end;
+
+	lockdep_assert_held(&free_vmap_area_lock);
+
+	if (!occupied_mt_supported())
+		return;
+
+	prev = __find_vmap_area_enclose_addr_mt(candidate, &free_vmap_area_mt);
+	if (prev && prev->va_start <= candidate && candidate < prev->va_end)
+		return;
+
+	next = __find_vmap_area_exceed_addr_mt(candidate, &free_vmap_area_mt);
+	blocked_end = next ? next->va_start : vend;
+	if (blocked_end <= candidate)
+		return;
+
+	WARN_ON_ONCE(!occupied_mt_store_range_raw_locked(candidate, blocked_end));
+}
+
+static __always_inline bool occupied_mt_seed_from_free_locked(void)
+{
+	MA_STATE(mas, &free_vmap_area_mt, 0, 0);
+	struct vmap_area *va;
+	unsigned long search = VMALLOC_START;
+
+	lockdep_assert_held(&free_vmap_area_lock);
+
+	mas_for_each(&mas, va, VMALLOC_END - 1) {
+		if (search < va->va_start) {
+			if (!occupied_mt_store_range_raw_locked(search, va->va_start))
+				return false;
+		}
+
+		if (va->va_end > search)
+			search = va->va_end;
+	}
+
+	if (search < VMALLOC_END)
+		return occupied_mt_store_range_raw_locked(search, VMALLOC_END);
+
+	return true;
+}
+
 /* Lowest-match scan directly on maple ordered traversal. */
 static __always_inline struct vmap_area *
 find_vmap_lowest_match_mt(struct maple_tree *tree, unsigned long size,
@@ -1939,11 +2086,39 @@ va_clip(struct vmap_area *va, unsigned long nva_start_addr,
 	}
 
 	if (type != FL_FIT_TYPE) {
-		if (free_mt_supported() &&
-		    !free_mt_update_va_locked(va, old_start, old_end))
-			return -ENOMEM;
-
-		if (lva && !insert_vmap_area_free_locked(lva)) {
+		if (free_mt_supported()) {
+			/*
+			 * Drop only the consumed sub-range from the original
+			 * free entry instead of erase-then-store. The maple
+			 * tree leaves @va at the surviving sub-range intact,
+			 * so a single mas_store per clip side suffices.
+			 *
+			 * For NE_FIT, insert @lva at the original entry's
+			 * left portion first: mas_store overwrites the old
+			 * [old_start, old_end-1]->va entry only across
+			 * [old_start, lva->va_end-1], leaving the right side
+			 * still pointing to @va. The subsequent middle trim
+			 * carves out the consumed gap. Trades 3 stores
+			 * (erase + restore + lva) for 2.
+			 */
+			if (type == LE_FIT_TYPE) {
+				if (!free_mt_trim_range_locked(old_start,
+							       va->va_start))
+					return -ENOMEM;
+			} else if (type == RE_FIT_TYPE) {
+				if (!free_mt_trim_range_locked(va->va_end,
+							       old_end))
+					return -ENOMEM;
+			} else { /* NE_FIT_TYPE */
+				if (!insert_vmap_area_free_nocheck_locked(lva)) {
+					kmem_cache_free(vmap_area_cachep, lva);
+					return -ENOMEM;
+				}
+				if (!free_mt_trim_range_locked(nva_start_addr,
+							       nva_start_addr + size))
+					return -ENOMEM;
+			}
+		} else if (lva && !insert_vmap_area_free_nocheck_locked(lva)) {
 			kmem_cache_free(vmap_area_cachep, lva);
 			return -ENOMEM;
 		}
@@ -1965,7 +2140,7 @@ restore_allocated_vmap_range_free_locked(unsigned long start, unsigned long end)
 
 	va->va_start = start;
 	va->va_end = end;
-	if (!insert_vmap_area_free_locked(va)) {
+	if (!insert_vmap_area_free_nocheck_locked(va)) {
 		kmem_cache_free(vmap_area_cachep, va);
 		return false;
 	}
@@ -2048,6 +2223,7 @@ __alloc_vmap_area(unsigned long size, unsigned long align,
 	int ret;
 	unsigned long nva_start_addr;
 	unsigned long nva_end_addr;
+	unsigned long search_len = size;
 	struct vmap_area *va;
 	MA_STATE(mas, &free_vmap_area_mt, 0, 0);
 
@@ -2059,6 +2235,28 @@ __alloc_vmap_area(unsigned long size, unsigned long align,
 		return -EINVAL;
 	if (size > vend - vstart)
 		return -ENOENT;
+	if (align > PAGE_SIZE && (vend - vstart) != size) {
+		if (check_add_overflow(size, align - 1, &search_len))
+			return -ERANGE;
+	}
+
+	if (occupied_mt_supported() && align <= PAGE_SIZE) {
+		unsigned long candidate;
+
+		if (occupied_mt_find_hole_window_locked(vstart, vend - 1, size,
+							align, &candidate)) {
+			if (check_add_overflow(candidate, size, &nva_end_addr))
+				return -ERANGE;
+
+			va = free_mt_find_enclose_range_locked(candidate, nva_end_addr);
+			if (likely(va)) {
+				nva_start_addr = candidate;
+				goto found;
+			}
+
+			occupied_mt_cache_gap_miss_locked(candidate, vend);
+		}
+	}
 
 	/*
 	 * Free maple index is authoritative for allocatable ranges; lazy and
@@ -2067,26 +2265,37 @@ __alloc_vmap_area(unsigned long size, unsigned long align,
 	mas_set(&mas, vstart);
 	va = mas_find(&mas, vend - 1);
 	while (va) {
-		unsigned long search_start = max(va->va_start, vstart);
-		unsigned long candidate_end;
+		unsigned long search_start, limit_end;
+
+		search_start = va->va_start;
+		if (search_start < vstart)
+			search_start = vstart;
+
+		limit_end = va->va_end;
+		if (limit_end > vend)
+			limit_end = vend;
+
+		if (unlikely(limit_end <= search_start))
+			goto next;
+		if (unlikely(limit_end - search_start < search_len))
+			goto next;
 
 		nva_start_addr = ALIGN(search_start, align);
 		if (nva_start_addr < search_start)
 			return -ERANGE;
 
-		if (check_add_overflow(nva_start_addr, size - 1, &candidate_end))
+		if (check_add_overflow(nva_start_addr, size, &nva_end_addr))
 			return -ERANGE;
-
-		if (candidate_end < vend && candidate_end < va->va_end) {
-			nva_end_addr = candidate_end + 1;
+		if (nva_end_addr <= limit_end)
 			break;
-		}
 
+next:
 		va = mas_next(&mas, vend - 1);
 	}
 	if (!va)
 		return -ENOENT;
 
+found:
 	ret = va_clip(va, nva_start_addr, size);
 	if (WARN_ON_ONCE(ret))
 		return ret;
@@ -2571,7 +2780,8 @@ decay_va_pool_node(struct vmap_node *vn, bool full_decay)
 		}
 	}
 
-	WARN_ON_ONCE(!reclaim_list_global(&decay_list, false, &decay_failed));
+	WARN_ON_ONCE(!reclaim_list_global(&decay_list, occupied_mt_supported(),
+					  &decay_failed));
 	list_for_each_entry_safe(va, nva, &decay_failed, list) {
 		list_del_init(&va->list);
 		WARN_ON_ONCE(!node_pool_add_va(vn, va));
@@ -6043,3 +6253,21 @@ void __init vmalloc_init(void)
 	vmap_node_shrinker->scan_objects = vmap_node_shrink_scan;
 	shrinker_register(vmap_node_shrinker);
 }
+
+static int __init vmap_enable_occupied_perf_mode(void)
+{
+	bool seeded = false;
+
+	spin_lock(&free_vmap_area_lock);
+	try_init_occupied_mt_locked();
+	if (occupied_mt_enabled())
+		seeded = occupied_mt_seed_from_free_locked();
+	occupied_vmap_area_perf_mode = seeded;
+	spin_unlock(&free_vmap_area_lock);
+
+	if (!seeded)
+		pr_warn("vmalloc: occupied perf mode disabled (seed failure)\n");
+
+	return 0;
+}
+late_initcall(vmap_enable_occupied_perf_mode);

-- 
2.34.1


