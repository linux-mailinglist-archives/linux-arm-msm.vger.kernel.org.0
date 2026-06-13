Return-Path: <linux-arm-msm+bounces-113010-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id WL1lFz+SLWqGhgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113010-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jun 2026 19:24:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C44FF67F2B2
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jun 2026 19:24:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="iVjSsrb/";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=KSzhqgmj;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113010-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113010-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2D84B3019FD8
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jun 2026 17:22:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7145930DECE;
	Sat, 13 Jun 2026 17:22:08 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3B9E35CB87
	for <linux-arm-msm@vger.kernel.org>; Sat, 13 Jun 2026 17:22:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781371328; cv=none; b=l160wUL98htgurKmW0nn6eq50e23+eRM1/Ox4A97pjzyxvFCpCh0lz93JV7GTh5lLZcsWSj436eJaZK57M6gJrWZW5qC6+04F3TJWQRSa4c0MO56VFeZBiXgD8Qwg138gqkdQ7UN6gWE7p3Mewnc6X3OekJG6FwtRQzrqbZYr9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781371328; c=relaxed/simple;
	bh=poCfMca4I5bU16k0x2EJY1kUzaPSBtmGjAWZRE/6A1o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rex21kMNEHzZ58mmas0tXyJm/WIR2S/VowztnB+7mMyKL8u36xGLI9/kyeIW4BKTKhIt5Ee+SF/KMRDeTqusvh7P0NBMHVNdUkliwPOBGy8wNj9pwI5F1kZwz9zUfuZTqPl6FV9b5FJWLbhEsPw4ZX1pFc6xYQ7A1/cjhLoJ0bA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iVjSsrb/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KSzhqgmj; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65DFB8w23121923
	for <linux-arm-msm@vger.kernel.org>; Sat, 13 Jun 2026 17:22:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZE6jPRdfaoewtNIfPrpNjI8xcezU+gskgS6mTgukQkI=; b=iVjSsrb/w+HmpHn0
	xmXyx/qzypr06CxDILrTITkNa82ugjOXc8TeWL7dvyQlvCNwa7kc6n+YM+eHVeqP
	2c0/GXJ+mfC862xvdh7emtUJ140SiG0OrRktal89n+9pAfj/ZY/D5rLuAIVgrTSO
	gfoB6E8sN4x8a6qzG38Zos4QlsMe3/fApVQ7b6G1IbgJm03O8Ns28/rQ1m4Ptgz5
	BmbA3RgQCsghsZ+KJ0WGTFnb/UTxRaCkPu4wu6vE9fVkD8zx9qCEJuc87RIxdLeC
	0dNLAZ22iR0ApvrrmAD4j7Zc+1QYltXC8wOAlhMNQ1cteUg3voAzGQsH5oTGdgPz
	qGK1tA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ery951mpc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 13 Jun 2026 17:22:05 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8426ed9f24dso1841346b3a.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 13 Jun 2026 10:22:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781371324; x=1781976124; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZE6jPRdfaoewtNIfPrpNjI8xcezU+gskgS6mTgukQkI=;
        b=KSzhqgmjVRpjh9a6An05AxNZN2N0u8c9T0/nMTzGZaccceE/VPlYfCZymJwWPDwnFG
         x460Hy90OWJyf9mHx86mPSUlFtE9GNqJsfkxLWnMLh0MXwVOr5oC574Z1vBxbZ6vKfNm
         J17nmI9WrGJxxo9k7ThmhyoJ7uY4+jz3Xer7vgcpxC+Fd+tTCvu1GZ7RxNUtfsuova3s
         gCCxhJGcHkmmpSxbNFPgpKTyJgnIme0XMVS2q79j5yjwjfq8Gp3ILnU+2Cjhjryimap8
         byMGOoMXBJR3jkUQ5CfmAjAWBJ4hEXNJruiYwDRPguEpL2X7U8tVS6Lw83LKFNyxnhh6
         ZW4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781371324; x=1781976124;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZE6jPRdfaoewtNIfPrpNjI8xcezU+gskgS6mTgukQkI=;
        b=bxEwcKLlkECkLHaJCmzvrcaHsTvgqifJQBJeT8BZHjEbuqteQXlANoRmHrEMWBSzNd
         OrZgCwr3GlMh3v3tXTC+2pc301CDbe623Fw6PjwdoCJazZx+4l0ztZWvBV0Wofe/OyN5
         ypR5j2RS5Hef49PVJHA/2Eu/AlXWIGn4zzYtK8d8REVs4KDmpKE9dZj3oJWhYn4pJwYW
         FjtnOjUQ4kRkFqqIA9ifxtqqbsd7gbFwZWE/zEhqYuj+XAsaUki5kHYQ/P4AXS4LGUPt
         uTlyAEKidTznEDpEMU5PF1bG4AJ/WbN6qjMFH48TugaKH4ttRSNCNrKbp5J6bcKnKjaM
         cj1Q==
X-Gm-Message-State: AOJu0YztZDQU9O/TQDOEQmTdZGNEgYW3J1X4RMZedVt9Tw7UQuBjV+nQ
	Un6MP3JF5lWVS4L2psP1NBCUYGTMylB1/suOIVG9ORjGiwZesDatUaErgbVclul7jLa57XNumY/
	pK+JJRXEwfQdiluRhXgUlJDBwvD31wACORlY0Px6bHJaDuFJXBmNAxq6eIzkgD+ZpfsyE
X-Gm-Gg: Acq92OFresGgt8CM/TodU1d9pFWitXSD47SCvg5XChauL0bdDE6dAhju09PmKeKfHZ+
	5AwNAujA/39pBdfAi6AURZqth29FRvtUezoju/WqcqdphbEdbdwXXHWklE6ZttDp09Nf19bs6Qz
	0WQ8PtS8OSsIQWjNGLNXpniO/mF8tq0ggRPLo/ErMkvL4osdeglB+C0xQKb0/Plipa7Sb30O7Hn
	UXaPBMbf4jt06I1Kyoyxky3TqVTsF1z+lNvbvV7lj+/kLcL9Y4f3gQMo/Zk2QxskAN5gC6a7XfA
	RMnT2AmYaBGtBZkruv+3EdXs9j6uSH5UMwMzu91Abo2gvKSNNbs3tMMleoebfzxojbJ/f9AuOfN
	zvUhDT6GKLMe1fSCv9k76UB+2WqJci7LvHZ4HCI9haOBp7Ey0D2xaQw==
X-Received: by 2002:a05:6a00:2351:b0:842:5f67:eada with SMTP id d2e1a72fcca58-8434ce4070amr6578005b3a.5.1781371324368;
        Sat, 13 Jun 2026 10:22:04 -0700 (PDT)
X-Received: by 2002:a05:6a00:2351:b0:842:5f67:eada with SMTP id d2e1a72fcca58-8434ce4070amr6577978b3a.5.1781371323837;
        Sat, 13 Jun 2026 10:22:03 -0700 (PDT)
Received: from hu-pranarya-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434accbec5sm5390913b3a.16.2026.06.13.10.21.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 10:22:03 -0700 (PDT)
From: Pranjal Arya <pranjal.arya@oss.qualcomm.com>
Date: Sat, 13 Jun 2026 22:49:54 +0530
Subject: [PATCH RFC 12/12] mm/vmalloc: harden bump-allocator alloc/free
 against UBSAN array bounds
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260613-vmalloc_maple-v1-12-0aa740bb944b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781371215; l=7915;
 i=pranjal.arya@oss.qualcomm.com; s=20260516; h=from:subject:message-id;
 bh=poCfMca4I5bU16k0x2EJY1kUzaPSBtmGjAWZRE/6A1o=;
 b=kGgYknKWsSNBxkdk0W8RRR1QefOuH5dooHWWewlUdfNTWdwNuW3qNCnaMf0NIthki3GTPNlfk
 WKtc4hRw6hxDBELESN9aTttJLWCPG90L6t21yIt7WTILVL//TKeMdM4
X-Developer-Key: i=pranjal.arya@oss.qualcomm.com; a=ed25519;
 pk=ymtcTlccEIDsi3ErhpjIoZZHKdPBYWGWW0Lchs5MsbE=
X-Proofpoint-ORIG-GUID: tcyulGQs00x3nBL6tWcYPRtuatBcdR0Q
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEzMDE4MCBTYWx0ZWRfX4S4ka9pwXDA8
 mFDjvEIJqsbeLPCcIMEN2zZTPhAO4NYNU53b6nXeTu/zLNaG6J8maaKPiU1EJMaNCO/cAVf1Wsj
 T1EJ6g+HZ1H0hm8gojkDh2uTynD5K/w=
X-Proofpoint-GUID: tcyulGQs00x3nBL6tWcYPRtuatBcdR0Q
X-Authority-Analysis: v=2.4 cv=EbP4hvmC c=1 sm=1 tr=0 ts=6a2d91bd cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=a2jIHL7vm5qZbxVYpdMA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEzMDE4MCBTYWx0ZWRfX4RLbQnVWtEvx
 mXc8x38oxSvl4tWMRMjKUMNIFHSXqm/oQla91PLkzSjTKtGVHf3eDTXVpZq4VpzPbUT9BMyu/xN
 08lc9xsmS//Yhx2MaIxgz2PhSJcErN6/2yU7S7EQ5PFh0QFF6tgiKVRPO4VACHRjD/1HWDzbOON
 NGFBaljgPQpvNK8VGL31xUaOUNJ4jNyUq5E4lLuZPz5Y4CJ4lgZKB3RmzpRyHPkpAakwRg9EMgI
 htI97RxAvy6WUnEmYZdt+jwO+SRf+LgLHvYzG4/mMQQfCf6Knb2V6qAHmpg+kGxT1IKsmfTygmK
 J7F+ZM/8sRyf8DjDGMiFBZWqLZb7EbWo2IXUt7nACOMDwS85sUET/nkRhn0gnKD/GnDqG2ZZ/Ro
 g9++PxqROm8+1rzPYus3OuUWjeK1tPuwUpQsPLOKZ1U80uABOo8vIeoP7ZtC6reMOG1Km/LKFUt
 KO1oMwoWoSxPWmpk9cA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-13_03,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
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
	TAGGED_FROM(0.00)[bounces-113010-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[linux-foundation.org,gmail.com,infradead.org,google.com];
	FORGED_RECIPIENTS(0.00)[m:akpm@linux-foundation.org,m:urezki@gmail.com,m:liam@infradead.org,m:aliceryhl@google.com,m:andrewjballance@gmail.com,m:linux-arm-msm@vger.kernel.org,m:linux-mm@kvack.org,m:linux-kernel@vger.kernel.org,m:maple-tree@lists.infradead.org,m:ljs@kernel.org,m:praan@google.com,m:will@kernel.org,m:Suzuki.Poulose@arm.com,m:neil.armstrong@linaro.org,m:smostafa@google.com,m:balbirs@nvidia.com,m:surenb@google.com,m:elver@google.com,m:dvyukov@google.com,m:glider@google.com,m:shuah@kernel.org,m:dev.jain@arm.com,m:jackmanb@google.com,m:puranjay@kernel.org,m:santosh.shukla@amd.com,m:wkarny@gmail.com,m:pranjal.arya@oss.qualcomm.com,m:sudeep.holla@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[pranjal.arya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,kvack.org,lists.infradead.org,kernel.org,google.com,arm.com,linaro.org,nvidia.com,amd.com,gmail.com,oss.qualcomm.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,busy.mt:url];
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
X-Rspamd-Queue-Id: C44FF67F2B2

Real-hardware testing on a Snapdragon X1E80100 exposed a panic during
boot-time module loading via finit_module -> kernel_read_file ->
vmalloc:

    Internal error: UBSAN: array index out of bounds
    Call trace:
      vmap_bump_alloc
      alloc_vmap_area
      __vmalloc_node_range_noprof
      vmalloc_noprof
      kernel_read_file
      __arm64_sys_finit_module

UBSAN's array-bounds sanitiser triggers on the indexed write loop:

    for (i = 0; i < n_pages; i++)
        chunk->page_va[idx + i] = va;

Harden the bump path:

  - Centralise the eligibility predicate in vmap_bump_eligible() and
    add it to alloc_vmap_area() so vmap_bump_refill() is only called
    for requests the bump path can actually serve. Add PAGE_ALIGNED(size)
    and align > 0 to the predicate (defensive; alloc_vmap_area's
    callers always satisfy these but the explicit check is cheap and
    prevents the trap path from being entered with bad inputs).

  - In vmap_bump_alloc(), use check_add_overflow() for the new bump
    pointer, validate aligned >= chunk->base (defensive against
    metadata corruption), and bounds-check idx and idx + n_pages
    against VMAP_BUMP_CHUNK_PAGES before touching page_va[]. Replace
    the indexed page_va[] store loop with a pointer walk:

        slot = &chunk->page_va[idx];
        for (i = n_pages; i > 0; i--)
                *slot++ = va;

    The pointer-increment form is not subject to the array-bounds
    sanitiser instrumentation that fires on chunk->page_va[idx + i].

  - In vmap_bump_unlink(), validate n_pages > 0 and n_pages <=
    VMAP_BUMP_CHUNK_PAGES - idx before the memset, so a corrupted
    va->va_end cannot drive a write past the end of page_va[].

  - Track the chunk's owner CPU at refill time and compare against
    per_cpu(vmap_bump_cur, owner_cpu) on unlink. The previous
    this_cpu_read(vmap_bump_cur) compared the chunk against the
    *current* CPU's chunk, which is wrong when free runs on a CPU
    other than the chunk owner: it could either retire a chunk that
    is still the owner's current, or skip retirement on a chunk that
    has already been replaced.

No semantic change to the bump-path policy or to the addresses
returned. Builds clean on x86_64 and arm64 (full bzImage / Image).

Signed-off-by: Pranjal Arya <pranjal.arya@oss.qualcomm.com>
---
 mm/vmalloc.c | 62 +++++++++++++++++++++++++++++++++++++++++++++++-------------
 1 file changed, 49 insertions(+), 13 deletions(-)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index 6991054e1cba..03f10b6b815c 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -2508,6 +2508,7 @@ struct vmap_bump_chunk {
 	unsigned long		limit;
 	unsigned long		bump;
 	atomic_t		alloced;	/* # outstanding pages */
+	int			owner_cpu;
 	struct list_head	link;		/* on vmap_bump_chunks */
 	struct rcu_head		rcu;		/* deferred free */
 	struct vmap_area	*page_va[VMAP_BUMP_CHUNK_PAGES];
@@ -2517,6 +2518,16 @@ static DEFINE_PER_CPU(struct vmap_bump_chunk *, vmap_bump_cur);
 static LIST_HEAD(vmap_bump_chunks);
 static DEFINE_SPINLOCK(vmap_bump_chunks_lock);
 
+static __always_inline bool
+vmap_bump_eligible(unsigned long size, unsigned long align,
+		   unsigned long vstart, unsigned long vend)
+{
+	return vstart == VMALLOC_START && vend == VMALLOC_END &&
+		size > 0 && PAGE_ALIGNED(size) &&
+		size <= VMAP_BUMP_CHUNK_SIZE / 2 &&
+		align > 0 && align <= VMAP_BUMP_CHUNK_SIZE / 2;
+}
+
 /*
  * Coarse [lo, hi) bounds covering every active vmap_bump_chunk's
  * range. vmap_chunk_lookup() rejects out-of-range addresses (e.g.
@@ -2582,11 +2593,10 @@ vmap_bump_alloc(unsigned long size, unsigned long align,
 {
 	struct vmap_bump_chunk *chunk;
 	struct vmap_area *va;
-	unsigned long aligned, idx, n_pages, i;
+	struct vmap_area **slot;
+	unsigned long aligned, new_bump, idx, n_pages, i;
 
-	if (vstart != VMALLOC_START || vend != VMALLOC_END ||
-	    size == 0 || size > VMAP_BUMP_CHUNK_SIZE / 2 ||
-	    align > VMAP_BUMP_CHUNK_SIZE / 2)
+	if (!vmap_bump_eligible(size, align, vstart, vend))
 		return NULL;
 
 	va = kmem_cache_alloc_node(vmap_area_cachep, gfp_mask, node);
@@ -2607,22 +2617,34 @@ vmap_bump_alloc(unsigned long size, unsigned long align,
 		kmem_cache_free(vmap_area_cachep, va);
 		return NULL;
 	}
+
 	aligned = ALIGN(chunk->bump, align);
-	if (aligned + size > chunk->limit) {
+	if (aligned < chunk->base ||
+	    check_add_overflow(aligned, size, &new_bump) ||
+	    new_bump > chunk->limit) {
 		preempt_enable();
 		kmem_cache_free(vmap_area_cachep, va);
 		return NULL;
 	}
-	chunk->bump = aligned + size;
+
 	idx = vmap_chunk_page_idx(chunk, aligned);
 	n_pages = size >> PAGE_SHIFT;
-	for (i = 0; i < n_pages; i++)
-		chunk->page_va[idx + i] = va;
+	if (unlikely(idx >= VMAP_BUMP_CHUNK_PAGES ||
+		     n_pages > VMAP_BUMP_CHUNK_PAGES - idx)) {
+		preempt_enable();
+		kmem_cache_free(vmap_area_cachep, va);
+		return NULL;
+	}
+
+	chunk->bump = new_bump;
+	slot = &chunk->page_va[idx];
+	for (i = n_pages; i > 0; i--)
+		*slot++ = va;
 	atomic_add(n_pages, &chunk->alloced);
 	preempt_enable();
 
 	va->va_start = aligned;
-	va->va_end = aligned + size;
+	va->va_end = new_bump;
 	va->vm = NULL;
 	/*
 	 * Encode the destination vmap_node so the existing per-node pool
@@ -2651,6 +2673,7 @@ vmap_bump_refill(gfp_t gfp_mask)
 {
 	struct vmap_bump_chunk *new_chunk;
 	unsigned long base;
+	int cpu;
 
 	new_chunk = kvzalloc(sizeof(*new_chunk), gfp_mask);
 	if (!new_chunk)
@@ -2670,6 +2693,7 @@ vmap_bump_refill(gfp_t gfp_mask)
 	new_chunk->limit = base + VMAP_BUMP_CHUNK_SIZE;
 	new_chunk->bump = base;
 	atomic_set(&new_chunk->alloced, 0);
+	new_chunk->owner_cpu = -1;
 	INIT_LIST_HEAD(&new_chunk->link);
 
 	spin_lock(&vmap_bump_chunks_lock);
@@ -2681,6 +2705,8 @@ vmap_bump_refill(gfp_t gfp_mask)
 	spin_unlock(&vmap_bump_chunks_lock);
 
 	preempt_disable();
+	cpu = smp_processor_id();
+	new_chunk->owner_cpu = cpu;
 	this_cpu_write(vmap_bump_cur, new_chunk);
 	preempt_enable();
 
@@ -2699,6 +2725,7 @@ static struct vmap_area *
 vmap_bump_unlink(unsigned long addr)
 {
 	struct vmap_bump_chunk *chunk;
+	struct vmap_bump_chunk *owner_cur;
 	struct vmap_area *va;
 	unsigned long idx, n_pages;
 
@@ -2715,6 +2742,8 @@ vmap_bump_unlink(unsigned long addr)
 		return NULL;
 
 	n_pages = (va->va_end - va->va_start) >> PAGE_SHIFT;
+	if (unlikely(!n_pages || n_pages > VMAP_BUMP_CHUNK_PAGES - idx))
+		return NULL;
 	memset(&chunk->page_va[idx], 0, n_pages * sizeof(va));
 
 	/*
@@ -2725,8 +2754,12 @@ vmap_bump_unlink(unsigned long addr)
 	 * TLB entries until the next lazy-purge flush, so reusing them
 	 * before the flush is unsafe. Forward-only bump avoids that.
 	 */
+	if (unlikely(chunk->owner_cpu < 0 || chunk->owner_cpu >= nr_cpu_ids))
+		return va;
+
+	owner_cur = READ_ONCE(per_cpu(vmap_bump_cur, chunk->owner_cpu));
 	if (atomic_sub_return(n_pages, &chunk->alloced) == 0 &&
-	    chunk != this_cpu_read(vmap_bump_cur)) {
+	    chunk != owner_cur) {
 		spin_lock(&vmap_bump_chunks_lock);
 		list_del_rcu(&chunk->link);
 		spin_unlock(&vmap_bump_chunks_lock);
@@ -2781,11 +2814,14 @@ static struct vmap_area *alloc_vmap_area(unsigned long size,
 	 * find_unlink_vmap_area() consult vmap_chunk_lookup() before
 	 * falling back to busy.mt.
 	 */
-	va = vmap_bump_alloc(size, align, vstart, vend, gfp_mask, node,
-			     va_flags);
-	if (!va && vmap_bump_refill(gfp_mask) == 0)
+	va = NULL;
+	if (vmap_bump_eligible(size, align, vstart, vend)) {
 		va = vmap_bump_alloc(size, align, vstart, vend, gfp_mask, node,
 				     va_flags);
+		if (!va && vmap_bump_refill(gfp_mask) == 0)
+			va = vmap_bump_alloc(size, align, vstart, vend, gfp_mask,
+					     node, va_flags);
+	}
 	if (va) {
 		if (vm) {
 			vm->addr = (void *)va->va_start;

-- 
2.34.1


