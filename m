Return-Path: <linux-arm-msm+bounces-119066-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id gAi6GLNfVmpD4QAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119066-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 18:11:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DFD14756D67
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 18:11:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=a9fZBERs;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=YaoFcdqk;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119066-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119066-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 730373027B73
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 16:08:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 117CC4ADD8A;
	Tue, 14 Jul 2026 16:08:36 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9571B4A3414
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 16:08:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784045316; cv=none; b=nLtFko3fSs1vqq14gmWRlVrDLbf4MTmB7RtmLHKvxqbSrG+3fxq1MViZQwNXIAoZuo8t8bwDfH6KTN97w93YrHnL3KoF1yAF6GxEaqEjiIcOTH1Txws4tx2dtAru2W3UopxyD2oHUPBmA+DRci7hv2pBssjPvW7I9gwiZSc5/S0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784045316; c=relaxed/simple;
	bh=PfD5Ea7Uo9Eg/QPh3152n1XheXCtgtbduIIWoRx7nww=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C+UjnjCAapTCYTkCnlhROUBF9684YnN86h849vy8d2JeiNsI1EHMAfvNhOAFHNRXuYI32DBUijpbxoJISBIeMJPUDcFEjO3TQLTASU/f2dG3YCKo9/dPofv4yx2kcPH8OfzHKfdCIkf5vO7+NAkfFt742k5XyDZXGKWEHiQJSQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a9fZBERs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YaoFcdqk; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66EG6kgK1027682
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 16:08:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WNaMkuOD3Uy+91bpzieOkifUHXNQHrkXIQJOHKj6eDI=; b=a9fZBERsthIPptsN
	C3P05b9degJCrWwLr5buY2WiyO7U+UOxKFdDr7FxDQ4yA2lxmJHKWA/RPp4hETfG
	clebceW2k0IPAREo2Hsv3IshrYt7sh95J5Pps46IOH4ikfMhjD9xwwR3kXBhbbcs
	Nu0HnPM6pNvZdn3CDyLWbeZEHLlZOE76/EPEOsTrhjAi2VcEb3elwFUywiK3emrI
	zCzNWMKT9ddtcxvOx63MOOEIi7zW36mzKiUPOcH2U7beqIDeX78/1qP969sFjBqr
	PsRBJntWClGpQflcmHjCERPe8nNe3fbMdKegwhIEDZSEZBK8Gy/DgOBhA/uqqFC3
	/9dTOQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdbr4b6k7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 16:08:33 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cec4226c70so45792385ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 09:08:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784045312; x=1784650112; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WNaMkuOD3Uy+91bpzieOkifUHXNQHrkXIQJOHKj6eDI=;
        b=YaoFcdqkMMDhAsl4DjJ6w33NB+CSuVLuqZQDJKQxJXrG64bW87YWHUhWizT1wgOz3N
         WoAH+beQGfdCOsrnKERX3dE0BK2nf9xX3gkpsAZmqBMTkB726pgePn7j8BGDoMp2oFXg
         vIfPIRoe2txqbwbETYySuLeaV/vLu80UNmtTXDOalNfMM/Pypq6khlX3o2DuluYCQVE1
         o16hHzGZ3ZsvftFl83EBOf/ehUnMCPrTHSkKVecZ/Syo1AUyvIStHDM29IKR6KoWBR2A
         CkSPumHRHs/+ay4Hk7R4xFyLY4LR7DBG4eMJQVMGGUivaV2KB23RFKINhSeUprNBDyB5
         KQMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784045312; x=1784650112;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WNaMkuOD3Uy+91bpzieOkifUHXNQHrkXIQJOHKj6eDI=;
        b=IIZoRHP0ljLT4fgMmEOHlZKLxp9MF+aI2XYuHUwXyxbpPu25zUkoERsUTgqUalQy4N
         fUjlfT04frrruteMw/sphMEOxSU2fLk/KSrsFJb1A48vIEaDMZAjTycfEHfPua2h+ZQQ
         C/38Nvi2dLO7yHkrtqZxXKppWIzsTpl3N2JOjTCx7brnCiio+HcPXzTus1GwfrMe68jC
         HkarqpO3mbd+UC+FPZpAdljPx6rc5kJV6RTdy2WAaTQnE8oVe8Ktgud/RSXStRxUPP5H
         /8HSy0NvJL+o1O5Hywa6sQWDypcWdBKs+LoK+ewYWrwXFGhF4fS1a7YWxSkPmorFFutZ
         RZ3A==
X-Gm-Message-State: AOJu0YyOt50sYqERDMG5h8HMCkM0JaAKUqyffbzhFXl0yl3AxuSxa3aC
	m1p2RbjuwSXE7VzjtcQWn6OpmwQ0Kxd/6FXb2bHds2r9FxnX4MIMR8bVl4adOWDXYgCfliOWNYg
	rw2y4TlY7TmpH6xjLsr58t8TUQHEwFwzGeIXBmWEMqdsCJjwz+6Etap36Yib+MQA+rbFo
X-Gm-Gg: AfdE7cl0Y6Rw7bsU2dw53nVVED0p9Y0PGKPSLOexTbNCRoD/FHdUK7d1F4YZ/YXn3ZM
	/gWt3xjiLI7t2gNAkCBjSv6XzB9q381HdnHWFyy5wVH3TcBj+xUp3Wwz0QHdN2nb91kR9aJTJQu
	DypxJASVgeVzTWteyc7T/ues+6kmKvJSoNfaxN9EwX8dKADD1wXDiY6Wsu0AXuYK7QN4bDOZgC3
	L1c6jyLsN8PJNrQD/1MOyo8JLDHrVI4Jlz0aog+zroXi9Sw3hgrbeypIT/drZ16VokBlwJ91bUs
	Qq9scdsBKQiZZ/o5DPpNYCyE55bH5nFXKvNGpArMO68l/C6sGPspUlD0sUlEHp44NerFFgrluJY
	zu35HYoV4oDe7dxHX64ETvveVZRsAEPnPRqSO8GUvrXWbZMA=
X-Received: by 2002:a17:902:e751:b0:2cc:307c:51f2 with SMTP id d9443c01a7336-2cef143aec1mr32215425ad.22.1784045312276;
        Tue, 14 Jul 2026 09:08:32 -0700 (PDT)
X-Received: by 2002:a17:902:e751:b0:2cc:307c:51f2 with SMTP id d9443c01a7336-2cef143aec1mr32214845ad.22.1784045311650;
        Tue, 14 Jul 2026 09:08:31 -0700 (PDT)
Received: from [192.168.0.116] ([124.123.151.85])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d3d952sm117896085ad.61.2026.07.14.09.08.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jul 2026 09:08:31 -0700 (PDT)
Message-ID: <958a79a9-dbfe-4ba7-9c81-31ed6ffe22be@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 21:38:23 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] net: wwan: qcom_bam_dmux: Alloc RX buffers as a
 single coherent block
To: "Jagielski, Jedrzej" <jedrzej.jagielski@intel.com>,
        Stephan Gerhold <stephan@gerhold.net>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Sergey Ryazanov <ryazanov.s.a@gmail.com>,
        Johannes Berg <johannes@sipsolutions.net>
Cc: "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "chris.lew@oss.qualcomm.com" <chris.lew@oss.qualcomm.com>,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
References: <20260714-qcom-bam-dmux-vmid-ext-v1-0-3f29da7cca76@oss.qualcomm.com>
 <PH0PR11MB5902886DEDB417349E5E6E44F0F92@PH0PR11MB5902.namprd11.prod.outlook.com>
Content-Language: en-US
From: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
In-Reply-To: <PH0PR11MB5902886DEDB417349E5E6E44F0F92@PH0PR11MB5902.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 4QMabyCmDNJBmOuk4Qp6BCGr8w8bjejP
X-Proofpoint-ORIG-GUID: 4QMabyCmDNJBmOuk4Qp6BCGr8w8bjejP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDE2NyBTYWx0ZWRfXzVD9dBUsN3FL
 H3TEEDMw6Ikh0/Hgc9T7Rapp5d2KbNF9VuFKay+I4uncO2aQFSSJM9zAewEJpr+rK/BZAsDUml2
 7OqSATEu3BvcydMxQDsyeIPMgy0ddW38lkLDPMq4QwE8l/y1ae3EzC69Q2LiImYkK1iwPTHpHaW
 BAsjHdd8yfe7Y8JAS20Lk15koDGpZKSeD8KLn5j53yYFRphFE7a51+x6klxgnXH1688q7FKOx1m
 unUn47vtzwLboN5Ip9OUit5O9Sqs4Yv7vFeiRGfuTUYfH6PSoqb8Tf+PvbQUcHpj3sO0TyEH0If
 4BKDwH38ayLxLk4zvayHm9hAAXeYXlLYvRmc+jNNlp/5LXvRNzTdDwrKGFFYosyyw+SYmHESl3v
 gagzvTCHMKrmsecKbaGxp4njGhv4DlfNWf51lMg8BVuCavcVmCPhsxbYoTGbDz5yLEB/jrq2dCG
 ld/pRQu7inB6oGfU6sw==
X-Authority-Analysis: v=2.4 cv=F5hnsKhN c=1 sm=1 tr=0 ts=6a565f01 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ziBI+Y3eO/H+UwYWWny9Hg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=3bpTIPm_6syKtP_1LDsA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDE2NyBTYWx0ZWRfX55oO/LoDcS8g
 LgR829QZ8H2t/NC4RPwWdols9o0y2lkkir4JrUYrOHiaNHmaXo/fL6/mFMiMzfaKxVXwPtTpGUL
 PQMFkudtvzlrPi5wiRNsNNK6cCkanN4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_04,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 clxscore=1015 adultscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140167
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-119066-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:jedrzej.jagielski@intel.com,m:stephan@gerhold.net,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:loic.poulain@oss.qualcomm.com,m:ryazanov.s.a@gmail.com,m:johannes@sipsolutions.net,m:linux-arm-msm@vger.kernel.org,m:netdev@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:chris.lew@oss.qualcomm.com,m:deepak.singh@oss.qualcomm.com,m:andrew@lunn.ch,m:krzk@kernel.org,m:conor@kernel.org,m:ryazanovsa@gmail.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_TO(0.00)[intel.com,gerhold.net,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,oss.qualcomm.com,gmail.com,sipsolutions.net];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[vishnu.santhosh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vishnu.santhosh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DFD14756D67


On 14-07-2026 01:23 pm, Jagielski, Jedrzej wrote:
> From: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
> Sent: Tuesday, July 14, 2026 7:33 AM
>
>> On platforms where the modem DMAs into the BAM-DMUX RX data buffers and
>> the XPU (eXternal Protection Unit) enforces per-region access control,
>> each individually DMA-mapped RX buffer consumes an XPU resource group.
>> With only ~16 groups available on Shikra (mDSP, VMID 43 / NAV), the
>> per-buffer mappings exhaust the table and inbound transfers fault.
>>
>> This series adds a qcom,shikra-bam-dmux compatible and have the driver
>> select QCOM_SCM_VMID_NAV internally via that compatible's match data.
>> When matched, the driver allocates all RX buffers as a single
>> contiguous coherent block and SCM-assigns it to HLOS plus the VMID
>> once at probe, consuming one XPU resource group instead of many.
>>
>> Platforms that do not use the qcom,shikra-bam-dmux compatible are
>> unaffected: the existing per-buffer dma_map_single() path is
>> unchanged.
>>
>> Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
>> ---
>> Vishnu Santhosh (2):
>>       dt-bindings: net: qcom,bam-dmux: Add qcom,shikra-bam-dmux compatible
>>       net: wwan: qcom_bam_dmux: Alloc RX buffers as a single coherent block
>>
>> .../devicetree/bindings/net/qcom,bam-dmux.yaml     |   8 +-
>> drivers/net/wwan/Kconfig                           |   1 +
>> drivers/net/wwan/qcom_bam_dmux.c                   | 134 +++++++++++++++++++--
>> 3 files changed, 132 insertions(+), 11 deletions(-)
>> ---
>> base-commit: 3b029c035b34bbc693405ddf759f0e9b920c27f1
>> change-id: 20260714-qcom-bam-dmux-vmid-ext-d9289db310c1
>>
>> Best regards,
>> -- 
>> Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
> Hi Vishnu
> you need to specify target tree, net-next for this series i believe
> please refer to[1]
>
> [1]
> https://docs.kernel.org/process/maintainer-netdev.html#indicating-target-tree
>
Thanks Jedrzej. I will address the comments and will send out the next revision
specifying the target tree as net-next.

Thanks,
Vishnu


