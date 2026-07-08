Return-Path: <linux-arm-msm+bounces-117793-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id drtbBMqbTmpOQgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117793-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 20:49:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E50D729B38
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 20:49:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=SMaNwRkG;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=EYrnNONW;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117793-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117793-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8D0C330AC07B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 18:47:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31E323C2B9C;
	Wed,  8 Jul 2026 18:47:25 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1AA13C3453
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 18:47:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783536445; cv=none; b=i/rsPOaMxrPG5Z5rHFtw+HbRFwMDPgwdk0Yb4tFCtphUENcVNPUo2Br6DnDM/JANt+5sfRIWIKEU1qtUG4ChJrxKtSYC1v+qEvEmgquIE+6R9QwLm7PzTtfRa/ddyJLfeyRMzplxf8PYiqYMGH3qNU13uGWkGde0ohx4pf6Dun8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783536445; c=relaxed/simple;
	bh=mACmuHlZX20bUZH9GBr/hdZ+rwWW1JFJPM3em3vuYQI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FuOr4ZCYBMCJLn3uGHgFIyaMLAjl+ufZm1aAZpiXmXyBxPnj1Y2GayLcE2eBJKvJTTiGjKZRaCu8+fuyRND57O0857/1hFJ0EVgpbXhRvkNeY/QpjcCRWaSB4JNg1W8s+xp/DK59oruDGnF26GmV8JUvXgnHJ9hFABBT3n6TE/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SMaNwRkG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EYrnNONW; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668I3AS73567833
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Jul 2026 18:47:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=aigJJJhGHgfhaydfVTP5L418
	kGbReJJsoG+/PNyDn6Y=; b=SMaNwRkGGiXFqk3zH2CodUO4ECSjUVFVC/X4FqB1
	j5mLgVbPxoKgorsdxTeZrKaZzGO+m1dKDRYMrOlFTHiEzsHwchmsU7KJFV/je2gk
	Ty9GtRcXbiFk4cowSfqau0ulYADsAZEowTGMSVH4Dw8FbeVrXwezYRlFFkjDDWMi
	tE8d1zFF5BDOEkWaiYDc/L30ikNG3OkTEpcNcZf4TTGMAfTQqioDnhoDfWa7Wb2z
	zev2S/gX7OCu8y67llRcm4+TfgFMAHCO6CGwRJZspTQF2kZWaGUaxJFuW8TTuE9d
	kaxk4wubm7eRKIZvdZ3a0FwF1fuHlHUdPTujqnh/RUzJgQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9ug6g6mg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 18:47:21 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c9fe2607511so1393556a12.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 11:47:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783536440; x=1784141240; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aigJJJhGHgfhaydfVTP5L418kGbReJJsoG+/PNyDn6Y=;
        b=EYrnNONWGjctW2ydPq5YUXQLZePfCmuEEUkBWhISE5NZLkFLnzJr2J11MsBVUHejwC
         Xv9XzGJeWLpxugWeIrrFmsyeXVav26lOPx+Pp8XpIvh6b1tBBNCy8hFXBoy/mMPFvDIH
         kQQ85TMbAILj/S+ztAP5fJFeVILx8sRkMHP0EIFra3CD0YAMbnD6GTPPYL0KV67hSW/0
         ahzJogci0FF5gV3jc95h2zrQU5W7nV6D5sE4pWaxAsz32+BpIgSAOw56VEZV69QkUd8Y
         hcuaoMjDigvPn3xNtl87d59hWF8MotH30ZqjfPZ4bZRfTtZEf2km4cYzu2Z++mml/oA/
         ZvKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783536440; x=1784141240;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aigJJJhGHgfhaydfVTP5L418kGbReJJsoG+/PNyDn6Y=;
        b=ni69cXzJuDZzF29LY8DiUApHuplBsDzNHiKonL3k6OVGjtstQZgrwVZe8bNE7nMnbR
         TMPS0QN9lIhmRjRxJrmHZefNR+Pix3z4nR1BHhbSMiAAo1XyHEqbhDP/T6217W0wVuJI
         IclDGkUIj3zIsULsYl4QfHEsJTy0ZJvscgYJRfiSkVoxB+WkW8l9imfDnhTymOwmK/zG
         VeUxwd5g+BYAf7NeYK3B+cNzyEKro1tU1uljLzOlnm9MoejZAsCeqHNI6KzIXZceffR9
         oEUnmI/RL/+DjkU6TAd7UT4ob4yb9d7pfHmYSAOCxErhqmreiPad6IyKqVhZ0KWnU0+p
         qekg==
X-Forwarded-Encrypted: i=1; AHgh+Roz/M0iXeRL2gG6So+HFhuLgXPp0Ug4klhjrLciaQtfpzUcVJE4VYYJNkCYMj0pVnq92tLFt6zWj+LaRltD@vger.kernel.org
X-Gm-Message-State: AOJu0YwFEaF+1FhB63hRDN3/Zknlvp/X5H8mhQzulpsCyKcYNgHdmmdO
	KamigTnPoPGvV00doV4ul7LrlXN2+xFBFhGtB/CSvH9tPu2jqERUC0vJYXws9r6JYc5b6EbW+Tv
	u1KM+5IQOZ557Jz4p2CLy7xfWSJoVi2Tt/8rUl2uOtT5xlItXmXXl7RTKe5K95nDZyTz1
X-Gm-Gg: AfdE7cmcek37xTrKefAM3cphGgjBUeN3uLQ7oEcR/LBy4N8ENpC7IF/CHQS5wN5eArV
	+UDPPqvL4LtU3tJRndp+nUBVMOBkKu/ZlCDLXq3q9EQvlBpayTqNHNbtFpmSlPHGNwkPAXCv2k/
	guYdgzIFd3N+0JARC/qLhd+tuEyQM6lFAHfSRlrXg6U+0q9hnRJn/DAvPDx2+jHp1e9Ps5doK7G
	Rl6YmJnuy5YUH4u7QWMGx2uJIgcsPPWNkB1FZFz1CUKgGJ6DZ/Va30m6A3xfs0qPE9a7si7TfyM
	Aj/7st/tdjAZzuC8z8953fLfzaiO858D5e1bGaihGgp9urCzh/oS7rNGUQF/ectceLogW0B5LIv
	JlwLMgaFJkw0RUTnX020AlRD1/iMcDmG3LPnhjQ==
X-Received: by 2002:a05:6a21:7a9b:b0:3bf:9e25:1a17 with SMTP id adf61e73a8af0-3c0bc8c2038mr4677433637.12.1783536440186;
        Wed, 08 Jul 2026 11:47:20 -0700 (PDT)
X-Received: by 2002:a05:6a21:7a9b:b0:3bf:9e25:1a17 with SMTP id adf61e73a8af0-3c0bc8c2038mr4677313637.12.1783536439597;
        Wed, 08 Jul 2026 11:47:19 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b6594f9a0sm23425858c88.4.2026.07.08.11.46.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 11:47:19 -0700 (PDT)
Date: Thu, 9 Jul 2026 00:16:52 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Lorenzo Stoakes <ljs@kernel.org>
Cc: akpm@linux-foundation.org, anna-maria@linutronix.de, arnd@arndb.de,
        andersson@kernel.org, chrisl@kernel.org, cl@gentwo.org,
        conor+dt@kernel.org, david@kernel.org, dennis@kernel.org,
        devicetree@vger.kernel.org, ehristev@kernel.org, frederic@kernel.org,
        mingo@redhat.com, jstultz@google.com, corbet@lwn.net,
        juri.lelli@redhat.com, kasong@tencent.com, kees@kernel.org,
        konradybcio@kernel.org, krzk+dt@kernel.org, linux-arch@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        linux-remoteproc@vger.kernel.org, mathieu.poirier@linaro.org,
        peterz@infradead.org, pmladek@suse.com, robh@kernel.org,
        saravanak@kernel.org, tj@kernel.org, tglx@kernel.org,
        vincent.guittot@linaro.org, workflows@vger.kernel.org,
        atomlin@atomlin.com, ast@kernel.org, aliceryhl@google.com,
        linux.amoon@gmail.com, ardb@kernel.org, baoquan.he@linux.dev,
        baohua@kernel.org, bsegall@google.com, jackmanb@google.com,
        leitao@debian.org, brauner@kernel.org, coxu@redhat.com,
        dietmar.eggemann@arm.com, dianders@chromium.org, ebiggers@kernel.org,
        feng.tang@linux.alibaba.com, yangfeng@kylinos.cn, gary@garyguo.net,
        guohanjun@huawei.com, jack@suse.cz, wangjinchao600@gmail.com,
        joel.granados@kernel.org, hannes@cmpxchg.org,
        john.ogness@linutronix.de, jpoimboe@kernel.org,
        shikemeng@huaweicloud.com, kas@kernel.org, kprateek.nayak@amd.com,
        liam@infradead.org, elver@google.com, mgorman@suse.de, mhocko@suse.com,
        ojeda@kernel.org, rppt@kernel.org, namcao@linutronix.de,
        nathan@kernel.org, nphamcs@gmail.com, n.schier@fritz.com,
        pasha.tatashin@soleen.com, petr.pavlu@suse.com,
        pnina.feder@mobileye.com, rdunlap@infradead.org,
        rioo.tsukatsukii@gmail.com, senozhatsky@chromium.org,
        skhan@linuxfoundation.org, sboyd@kernel.org, rostedt@goodmis.org,
        surenb@google.com, thomas.weissschuh@linutronix.de,
        vschneid@redhat.com, vbabka@kernel.org, youngjun.park@lge.com,
        zhengyejian@huaweicloud.com, ziy@nvidia.com,
        Eugen Hristev <eugen.hristev@linaro.org>
Subject: Re: [PATCH v3 26/26] meminspect: Add debug kinfo compatible driver
Message-ID: <20260708184652.tjbqhvmoqrou3ncc@hu-mojha-hyd.qualcomm.com>
References: <20260708-meminspect-v3-v3-0-7aa5a0a74d5c@oss.qualcomm.com>
 <20260708070809.2660886-1-mukesh.ojha@oss.qualcomm.com>
 <ak4DqBta0boElPak@lucifer>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ak4DqBta0boElPak@lucifer>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDE4MyBTYWx0ZWRfXyqUTN7jWIfod
 TTpVGFnlqHHPOQaRwAX32gsczJQrI4FV7BoDO0Xw1IimsYSeI2cyHD+lICUJxsbvQ6IWA+EBXDS
 tI6CqUFxuGrU8+Cr1M8Z6uh6ImDIVH8=
X-Proofpoint-GUID: twKwvMtHRwd2XpyK8TRYVGrZMv2kVph7
X-Authority-Analysis: v=2.4 cv=cL3QdFeN c=1 sm=1 tr=0 ts=6a4e9b39 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=Oh2cFVv5AAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=Tty9oNO6AAAA:8 a=1XWaLZrsAAAA:8 a=908p1EQr1GbHt3uppzYA:9 a=CjuIK1q_8ugA:10
 a=3WC7DwWrALyhR5TkjVHa:22 a=7KeoIwV6GZqOttXkcoxL:22 a=cvBusfyB2V15izCimMoJ:22
 a=Bts-Es6F1CBXvF7u4C_G:22
X-Proofpoint-ORIG-GUID: twKwvMtHRwd2XpyK8TRYVGrZMv2kVph7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDE4MyBTYWx0ZWRfX6YNXoK/bHf7G
 Tac3BCtiSjkZRVEO0smdeceopc/JIUzCUdLKthEknkMS1m4B3AyU5bhISTq75ihouUqaLfR0ksH
 2Xj/prqPKoRWLP7x9J0xUpCPY027zpBVEv69QSRvfjGEdEpzviZg7CyJx5DRjLg9o90probDYKr
 ahpyH1Vr0FzM2t5WXi4/9a7NcFYVid8szugPGmXfC/ynSMK9O5AMIaa02cxfQRhzoo+a+WkPZ+L
 +ycSXLCGPTNaY+2dIMjrOAaBP7QxQdIDRfJ8YNgz4P6J1l7kWuLSE1AzFsOX4TNRtN1IwGRgiSH
 qeu4RwgRQj5vTwRElIOPr3lGmliBhDj9a/yw0iSNFaESzqYupy83Cxhton5IzHA17QbIXKsVpBo
 rheXY9rOMNpW193TcqHWB7SJy7HhdSj1Fbs6mDAfAEWc/ekye6Wp8pMiIoCcdiLERcnwUcmMugT
 BQlVZwxofDp/hVjCt+Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_03,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080183
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linux-foundation.org,linutronix.de,arndb.de,kernel.org,gentwo.org,vger.kernel.org,redhat.com,google.com,lwn.net,tencent.com,kvack.org,linaro.org,infradead.org,suse.com,atomlin.com,gmail.com,linux.dev,debian.org,arm.com,chromium.org,linux.alibaba.com,kylinos.cn,garyguo.net,huawei.com,suse.cz,cmpxchg.org,huaweicloud.com,amd.com,suse.de,fritz.com,soleen.com,mobileye.com,linuxfoundation.org,goodmis.org,lge.com,nvidia.com];
	URIBL_MULTI_FAIL(0.00)[hu-mojha-hyd.qualcomm.com:server fail,vger.kernel.org:server fail,qualcomm.com:server fail,googlesource.com:server fail,sea.lore.kernel.org:server fail,linaro.org:server fail,oss.qualcomm.com:server fail,rustcorp.com.au:server fail];
	TAGGED_FROM(0.00)[bounces-117793-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,googlesource.com:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,hu-mojha-hyd.qualcomm.com:mid];
	FORGED_RECIPIENTS(0.00)[m:ljs@kernel.org,m:akpm@linux-foundation.org,m:anna-maria@linutronix.de,m:arnd@arndb.de,m:andersson@kernel.org,m:chrisl@kernel.org,m:cl@gentwo.org,m:conor+dt@kernel.org,m:david@kernel.org,m:dennis@kernel.org,m:devicetree@vger.kernel.org,m:ehristev@kernel.org,m:frederic@kernel.org,m:mingo@redhat.com,m:jstultz@google.com,m:corbet@lwn.net,m:juri.lelli@redhat.com,m:kasong@tencent.com,m:kees@kernel.org,m:konradybcio@kernel.org,m:krzk+dt@kernel.org,m:linux-arch@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-mm@kvack.org,m:linux-remoteproc@vger.kernel.org,m:mathieu.poirier@linaro.org,m:peterz@infradead.org,m:pmladek@suse.com,m:robh@kernel.org,m:saravanak@kernel.org,m:tj@kernel.org,m:tglx@kernel.org,m:vincent.guittot@linaro.org,m:workflows@vger.kernel.org,m:atomlin@atomlin.com,m:ast@kernel.org,m:aliceryhl@google.com,m:linux.amoon@gmail.com,m:ardb@kernel.org,m:baoquan.he@linux.dev,m:baohua@kernel.org,
 m:bsegall@google.com,m:jackmanb@google.com,m:leitao@debian.org,m:brauner@kernel.org,m:coxu@redhat.com,m:dietmar.eggemann@arm.com,m:dianders@chromium.org,m:ebiggers@kernel.org,m:feng.tang@linux.alibaba.com,m:yangfeng@kylinos.cn,m:gary@garyguo.net,m:guohanjun@huawei.com,m:jack@suse.cz,m:wangjinchao600@gmail.com,m:joel.granados@kernel.org,m:hannes@cmpxchg.org,m:john.ogness@linutronix.de,m:jpoimboe@kernel.org,m:shikemeng@huaweicloud.com,m:kas@kernel.org,m:kprateek.nayak@amd.com,m:liam@infradead.org,m:elver@google.com,m:mgorman@suse.de,m:mhocko@suse.com,m:ojeda@kernel.org,m:rppt@kernel.org,m:namcao@linutronix.de,m:nathan@kernel.org,m:nphamcs@gmail.com,m:n.schier@fritz.com,m:pasha.tatashin@soleen.com,m:petr.pavlu@suse.com,m:pnina.feder@mobileye.com,m:rdunlap@infradead.org,m:rioo.tsukatsukii@gmail.com,m:senozhatsky@chromium.org,m:skhan@linuxfoundation.org,m:sboyd@kernel.org,m:rostedt@goodmis.org,m:surenb@google.com,m:thomas.weissschuh@linutronix.de,m:vschneid@redhat.com,m:vbabka@kernel.org
 ,m:youngjun.park@lge.com,m:zhengyejian@huaweicloud.com,m:ziy@nvidia.com,m:eugen.hristev@linaro.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCPT_COUNT_GT_50(0.00)[91];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6E50D729B38

On Wed, Jul 08, 2026 at 09:06:52AM +0100, Lorenzo Stoakes wrote:
> On Wed, Jul 08, 2026 at 12:38:09PM +0530, Mukesh Ojha wrote:
> > From: Eugen Hristev <eugen.hristev@linaro.org>
> >
> > With this driver, the registered regions are copied to a shared memory
> > zone at register time. The shared memory zone is supplied via OF. This
> > driver will select only regions that are of interest, and keep only
> > addresses. The format of the list is Kinfo compatible, with devices like
> > Google Pixel phone. The firmware is only interested in some symbols'
> > addresses.
> >
> > Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
> > Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> 
> Hang on, this is a driver that exposes internal kernel symbol information in a
> shared memory region for anybody who wants to access it?
>

Yes, this was one of the others we could find in the Android
kernel, which could be another use case of the meminspect
backend.

https://android.googlesource.com/kernel/common/+/refs/heads/android-mainline/drivers/android/debug_kinfo.c

-Mukesh

> This doesn't really seem sane?
> 
> Looking through the code it seems you are only exposing things that are already
> otherwise exposed, so maybe it's not so bad, but it seems as if a registered
> meminfo driver could in any case get access to things they shouldn't?

> 
> > ---
> >  MAINTAINERS                |   1 +
> >  drivers/of/platform.c      |   1 +
> >  kernel/meminspect/Kconfig  |  11 ++
> >  kernel/meminspect/Makefile |   1 +
> >  kernel/meminspect/kinfo.c  | 257 +++++++++++++++++++++++++++++++++++++
> >  5 files changed, 271 insertions(+)
> >  create mode 100644 kernel/meminspect/kinfo.c
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 2d816d783024..d805ff9fedac 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -16906,6 +16906,7 @@ M:	Eugen Hristev <eugen.hristev@linaro.org>
> >  M:	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> >  S:	Maintained
> >  F:	Documentation/devicetree/bindings/reserved-memory/google,debug-kinfo.yaml
> > +F:	kernel/meminspect/kinfo.c
> >
> >  MEMBLOCK AND MEMORY MANAGEMENT INITIALIZATION
> >  M:	Mike Rapoport <rppt@kernel.org>
> > diff --git a/drivers/of/platform.c b/drivers/of/platform.c
> > index 53bca8c6f781..f80bd25fc481 100644
> > --- a/drivers/of/platform.c
> > +++ b/drivers/of/platform.c
> > @@ -494,6 +494,7 @@ static const struct of_device_id reserved_mem_matches[] = {
> >  	{ .compatible = "qcom,smem" },
> >  	{ .compatible = "ramoops" },
> >  	{ .compatible = "nvmem-rmem" },
> > +	{ .compatible = "google,debug-kinfo" },
> >  	{ .compatible = "google,open-dice" },
> >  	{}
> >  };
> > diff --git a/kernel/meminspect/Kconfig b/kernel/meminspect/Kconfig
> > index 18ff511ad4cf..7f6436c3344b 100644
> > --- a/kernel/meminspect/Kconfig
> > +++ b/kernel/meminspect/Kconfig
> > @@ -16,3 +16,14 @@ config MEMINSPECT
> >
> >  	  Note that modules using this feature must be rebuilt if this
> >  	  option changes.
> > +
> > +config MEMINSPECT_KINFO
> > +	tristate "Shared memory KInfo compatible driver"
> > +	depends on MEMINSPECT
> > +	help
> > +	  Say y here to enable the Shared memory KInfo compatible driver.
> > +	  With this driver, the registered regions are copied to a shared
> > +	  memory zone at register time.
> > +	  The shared memory zone is supplied via OF.
> > +	  This driver will select only regions that are of interest,
> > +	  and keep only addresses. The format of the list is Kinfo compatible.
> > diff --git a/kernel/meminspect/Makefile b/kernel/meminspect/Makefile
> > index 09fd55e6d9cf..283604d892e5 100644
> > --- a/kernel/meminspect/Makefile
> > +++ b/kernel/meminspect/Makefile
> > @@ -1,3 +1,4 @@
> >  # SPDX-License-Identifier: GPL-2.0
> >
> >  obj-$(CONFIG_MEMINSPECT) += meminspect.o
> > +obj-$(CONFIG_MEMINSPECT_KINFO) += kinfo.o
> > diff --git a/kernel/meminspect/kinfo.c b/kernel/meminspect/kinfo.c
> > new file mode 100644
> > index 000000000000..7451c13bc316
> > --- /dev/null
> > +++ b/kernel/meminspect/kinfo.c
> > @@ -0,0 +1,257 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + *
> > + * Copyright 2002 Rusty Russell <rusty@rustcorp.com.au> IBM Corporation
> > + * Copyright 2021 Google LLC
> > + * Copyright 2025 Linaro Ltd. Eugen Hristev <eugen.hristev@linaro.org>
> > + */
> > +#include <linux/container_of.h>
> > +#include <linux/kallsyms.h>
> > +#include <linux/meminspect.h>
> > +#include <linux/module.h>
> > +#include <linux/of.h>
> > +#include <linux/of_reserved_mem.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/utsname.h>
> > +
> > +#define BUILD_INFO_LEN		256
> > +#define DEBUG_KINFO_MAGIC	0xcceeddff
> > +
> > +/*
> > + * Header structure must be byte-packed, since the table is provided to
> > + * bootloader.
> > + */
> > +struct kernel_info {
> > +	/* For kallsyms */
> > +	u8 enabled_all;
> > +	u8 enabled_base_relative;
> > +	u8 enabled_absolute_percpu;
> > +	u8 enabled_cfi_clang;
> > +	u32 num_syms;
> > +	u16 name_len;
> > +	u16 bit_per_long;
> > +	u16 module_name_len;
> > +	u16 symbol_len;
> > +	u64 _relative_pa;
> > +	u64 _text_pa;
> > +	u64 _stext_pa;
> > +	u64 _etext_pa;
> > +	u64 _sinittext_pa;
> > +	u64 _einittext_pa;
> > +	u64 _end_pa;
> > +	u64 _offsets_pa;
> > +	u64 _names_pa;
> > +	u64 _token_table_pa;
> > +	u64 _token_index_pa;
> > +	u64 _markers_pa;
> > +	u64 _seqs_of_names_pa;
> > +
> > +	/* For frame pointer */
> > +	u32 thread_size;
> > +
> > +	/* For virt_to_phys */
> > +	u64 swapper_pg_dir_pa;
> > +
> > +	/* For linux banner */
> > +	u8 last_uts_release[__NEW_UTS_LEN];
> > +
> > +	/* For module kallsyms */
> > +	u32 enabled_modules_tree_lookup;
> > +	u32 mod_mem_offset;
> > +	u32 mod_kallsyms_offset;
> > +} __packed;
> > +
> > +struct kernel_all_info {
> > +	u32 magic_number;
> > +	u32 combined_checksum;
> > +	struct kernel_info info;
> > +} __packed;
> > +
> > +struct debug_kinfo {
> > +	struct device *dev;
> > +	void *all_info_addr;
> > +	size_t all_info_size;
> > +	struct notifier_block nb;
> > +};
> > +
> > +static void update_kernel_all_info(struct kernel_all_info *all_info)
> > +{
> > +	struct kernel_info *info;
> > +	u32 *checksum_info;
> > +	int index;
> > +
> > +	all_info->magic_number = DEBUG_KINFO_MAGIC;
> > +	all_info->combined_checksum = 0;
> > +
> > +	info = &all_info->info;
> > +	checksum_info = (u32 *)info;
> > +	for (index = 0; index < sizeof(*info) / sizeof(u32); index++)
> > +		all_info->combined_checksum ^= checksum_info[index];
> > +}
> > +
> > +static void __maybe_unused register_kinfo_region(void *priv,
> > +						 const struct inspect_entry *e)
> > +{
> > +	struct debug_kinfo *kinfo = priv;
> > +	struct kernel_all_info *all_info = kinfo->all_info_addr;
> > +	struct kernel_info *info = &all_info->info;
> > +	struct uts_namespace *uts;
> > +	u64 paddr;
> > +
> > +	if (e->pa)
> > +		paddr = e->pa;
> > +	else
> > +		paddr = __pa(e->va);
> > +
> > +	switch (e->id) {
> > +	case MEMINSPECT_ID__sinittext:
> > +		info->_sinittext_pa = paddr;
> > +		break;
> > +	case MEMINSPECT_ID__einittext:
> > +		info->_einittext_pa = paddr;
> > +		break;
> > +	case MEMINSPECT_ID__end:
> > +		info->_end_pa = paddr;
> > +		break;
> > +	case MEMINSPECT_ID__text:
> > +		info->_text_pa = paddr;
> > +		break;
> > +	case MEMINSPECT_ID__stext:
> > +		info->_stext_pa = paddr;
> > +		break;
> > +	case MEMINSPECT_ID__etext:
> > +		info->_etext_pa = paddr;
> > +		break;
> > +	case MEMINSPECT_ID_kallsyms_num_syms:
> > +		info->num_syms = *(__u32 *)e->va;
> > +		break;
> > +	case MEMINSPECT_ID_kallsyms_offsets:
> > +		info->_offsets_pa = paddr;
> > +		break;
> > +	case MEMINSPECT_ID_kallsyms_names:
> > +		info->_names_pa = paddr;
> > +		break;
> > +	case MEMINSPECT_ID_kallsyms_token_table:
> > +		info->_token_table_pa = paddr;
> > +		break;
> > +	case MEMINSPECT_ID_kallsyms_token_index:
> > +		info->_token_index_pa = paddr;
> > +		break;
> > +	case MEMINSPECT_ID_kallsyms_markers:
> > +		info->_markers_pa = paddr;
> > +		break;
> > +	case MEMINSPECT_ID_kallsyms_seqs_of_names:
> > +		info->_seqs_of_names_pa = paddr;
> > +		break;
> > +	case MEMINSPECT_ID_swapper_pg_dir:
> > +		info->swapper_pg_dir_pa = paddr;
> > +		break;
> > +	case MEMINSPECT_ID_init_uts_ns:
> > +		if (!e->va)
> > +			return;
> > +		uts = e->va;
> > +		strscpy(info->last_uts_release, uts->name.release, __NEW_UTS_LEN);
> > +		break;
> > +	default:
> > +		break;
> > +	};
> > +
> > +	update_kernel_all_info(all_info);
> > +}
> > +
> > +static int kinfo_notifier_cb(struct notifier_block *nb,
> > +			     unsigned long code, void *entry)
> > +{
> > +	struct debug_kinfo *kinfo = container_of(nb, struct debug_kinfo, nb);
> > +
> > +	if (code == MEMINSPECT_NOTIFIER_ADD)
> > +		register_kinfo_region(kinfo, entry);
> > +
> > +	return NOTIFY_DONE;
> > +}
> > +
> > +static int debug_kinfo_probe(struct platform_device *pdev)
> > +{
> > +	struct kernel_all_info *all_info;
> > +	struct device *dev = &pdev->dev;
> > +	struct reserved_mem *rmem;
> > +	struct debug_kinfo *kinfo;
> > +	struct kernel_info *info;
> > +
> > +	rmem = of_reserved_mem_lookup(dev->of_node);
> > +	if (!rmem)
> > +		return dev_err_probe(dev, -ENODEV, "no such reserved mem of node name %s\n",
> > +			      dev->of_node->name);
> > +
> > +	/* Need to wait for reserved memory to be mapped */
> > +	if (!rmem->priv)
> > +		return -EPROBE_DEFER;
> > +
> > +	if (!rmem->base || !rmem->size)
> > +		dev_err_probe(dev, -EINVAL, "unexpected reserved memory\n");
> > +
> > +	if (rmem->size < sizeof(struct kernel_all_info))
> > +		dev_err_probe(dev, -EINVAL, "reserved memory size too small\n");
> > +
> > +	kinfo = devm_kzalloc(dev, sizeof(*kinfo), GFP_KERNEL);
> > +	if (!kinfo)
> > +		return -ENOMEM;
> > +
> > +	platform_set_drvdata(pdev, kinfo);
> > +
> > +	kinfo->dev = dev;
> > +	kinfo->all_info_addr = rmem->priv;
> > +	kinfo->all_info_size = rmem->size;
> > +
> > +	all_info = kinfo->all_info_addr;
> > +
> > +	memset(all_info, 0, sizeof(struct kernel_all_info));
> > +	info = &all_info->info;
> > +	info->enabled_all = IS_ENABLED(CONFIG_KALLSYMS_ALL);
> > +	info->enabled_absolute_percpu = IS_ENABLED(CONFIG_KALLSYMS_ABSOLUTE_PERCPU);
> > +	info->enabled_base_relative = IS_ENABLED(CONFIG_KALLSYMS_BASE_RELATIVE);
> > +	info->enabled_cfi_clang = IS_ENABLED(CONFIG_CFI_CLANG);
> > +	info->name_len = KSYM_NAME_LEN;
> > +	info->bit_per_long = BITS_PER_LONG;
> > +	info->module_name_len = MODULE_NAME_LEN;
> > +	info->symbol_len = KSYM_SYMBOL_LEN;
> > +	info->thread_size = THREAD_SIZE;
> > +	info->enabled_modules_tree_lookup = IS_ENABLED(CONFIG_MODULES_TREE_LOOKUP);
> > +	info->mod_mem_offset = offsetof(struct module, mem);
> > +	info->mod_kallsyms_offset = offsetof(struct module, kallsyms);
> > +
> > +	kinfo->nb.notifier_call = kinfo_notifier_cb;
> > +
> > +	meminspect_notifier_register(&kinfo->nb);
> > +	meminspect_lock_traverse(kinfo, register_kinfo_region);
> > +
> > +	return 0;
> > +}
> > +
> > +static void debug_kinfo_remove(struct platform_device *pdev)
> > +{
> > +	struct debug_kinfo *kinfo = platform_get_drvdata(pdev);
> > +
> > +	meminspect_notifier_unregister(&kinfo->nb);
> > +}
> > +
> > +static const struct of_device_id debug_kinfo_of_match[] = {
> > +	{ .compatible	= "google,debug-kinfo" },
> > +	{},
> > +};
> > +MODULE_DEVICE_TABLE(of, debug_kinfo_of_match);
> > +
> > +static struct platform_driver debug_kinfo_driver = {
> > +	.probe = debug_kinfo_probe,
> > +	.remove = debug_kinfo_remove,
> > +	.driver = {
> > +		.name = "debug-kinfo",
> > +		.of_match_table = debug_kinfo_of_match,
> > +	},
> > +};
> > +module_platform_driver(debug_kinfo_driver);
> > +
> > +MODULE_AUTHOR("Eugen Hristev <eugen.hristev@linaro.org>");
> > +MODULE_AUTHOR("Jone Chou <jonechou@google.com>");
> > +MODULE_DESCRIPTION("meminspect Kinfo Driver");
> > +MODULE_LICENSE("GPL");
> > --
> > 2.53.0
> >

-- 
-Mukesh Ojha

