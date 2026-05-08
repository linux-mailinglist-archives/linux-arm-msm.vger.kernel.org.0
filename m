Return-Path: <linux-arm-msm+bounces-106634-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kN9EFHK4/Wm4hwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106634-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 12:18:26 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E74334F4E3D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 12:18:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D0E29306412F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 May 2026 10:15:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30C243CD8C2;
	Fri,  8 May 2026 10:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nEoyoHA/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W19Kmw9e"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0CED2571B8
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 May 2026 10:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778235337; cv=none; b=nTnjGcI3ydQaRV3QbC/prCGRqOEWv/isegIcbsfi8K341bNjQkLx8716t+fZIi2u0CnIIh5gIp8xtZZJKv9L2kbfKbLE3pF6+BGeGKtYD27waIXxBNtiIP1Cu87048HhOFa8io5nnn8SVZeUVKYOTe7Mw/n0vTVvvFrhgcghXFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778235337; c=relaxed/simple;
	bh=WLedKuZPuDKCqCqHoINHvHjza8SW+YDijRmxrez/934=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ls0FtGZ4HQvbrHCYhzADE7l21ulBuJX9upCWPrYFIT5/GgwsOXkGV4dIHdtHiHqze2HwaerOaVuVQkZls+8BPBghX/tNLlHhuJXjHPnf/PPqjxDJ7W9sAe9o9jrEa9bdPWzZalB4UN9r20RyNzpIxNd/TfAmIf7YYxoR0GnrnzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nEoyoHA/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W19Kmw9e; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 648A6hXx2183393
	for <linux-arm-msm@vger.kernel.org>; Fri, 8 May 2026 10:15:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=gWBtzZ/qvxKX6nOMhDTeyvxQ
	OevmU9VUTHONpMGN5HQ=; b=nEoyoHA/lExsH8e1z3rol6owxcE4E4og/eNPM2lC
	AR4QLhhhw1QDR1TdShUBb7zgmjsykchu1gxkzj8qo9ng7MPK3SX1iLNsW20J5Bcs
	G7KrFeyvJ5eSp3tSg23pImazd4UhCD++SKuNQcbaIRYZ3jeZWD98aIyT8rVuL0F+
	MJJmm7kwrl7ECCDjTC+rbdwGSc5NqIqTui8e/kjKIIdIRjt0gfSfAegWIsbkFIjA
	q5xShiYgcKo1VViSAW4YcXuLlxZBmSF88P5Y9FXOm3PF1OnGEvpg1hModbUEZ2KP
	51GN2yv0tCELqNsKEidveZt/FsLRcCfKh+hDVFrhQut1Lg==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e10pyavtx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 10:15:34 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-12dfe06b670so2862776c88.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 03:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778235334; x=1778840134; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gWBtzZ/qvxKX6nOMhDTeyvxQOevmU9VUTHONpMGN5HQ=;
        b=W19Kmw9el+MC+HqFVjhQ7RTId7Ur/xVK0zVpat2jR+F+Wl/Wcf25Of46WBk0yfPzCm
         3tMKkoSMIU8mxGEdU411BBqp72oP9iRew1WGClNtKpZx1Zmce2+vH+2I97Enr67NO/HR
         xhUg22EVe8qYH7ZGJPEOD1jKAJIcSRpPZ0s9IRO71oR+QSB8ao9iBubxNEXxBqf8Hawj
         aRBhDioElIVPHxEuMuxhNSUtvWHUE5LLHru8S65JB7/CGCkLWJQbB96oQ0GdJ+vtH3vI
         +WCDq5oAzMxKjVzniAX6PGf2zeH3wSsLQhkmRTAdrQu8vMfSAcjdITUQo7YFbDlIqNqv
         0Tkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778235334; x=1778840134;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gWBtzZ/qvxKX6nOMhDTeyvxQOevmU9VUTHONpMGN5HQ=;
        b=YQbAXwXa0QGsxhnvgPFwedWLky7stTLHLw538w+jX32BaIERX9l3Tywd10ap+1InY9
         1yxk3htcDp8AlQs76c2yfEUN9GHKENfGtuOOdbJZpJYCuXcDWI7vjOznkYIMxzR3dOJQ
         sF2is7QM2gCTtLm/2e4w6Y2He5/7g6Zc0ZSNHYCEEtIYHITNuAfqce7GMVi43fBq7Pcg
         G2kM0IqdzjEksgDj3UMxzhkP49aXnS4PDea81vvXNpHOl1Nbl7aIG2mEtyj4HMUvjosG
         J9HGWvEFyq23KonLwv7+wcML6cQ8L6IADqguVR3LB8Z9Fdxxj57kM2SA61lhsFl6GGdn
         S3uw==
X-Forwarded-Encrypted: i=1; AFNElJ88PpocY33B/2qT+v9rLeUXPk7OJN0M0/CaXaE+rHUWLQGmBIfvCc49aVQMAsyF+2HjqNzPDGQwEzaWrIrL@vger.kernel.org
X-Gm-Message-State: AOJu0YxyHOkeyTK8NB9/nXT8zsJcTBRKCg4Ei58GKzMhUX85rLtvAcPo
	Zirri3OecyByGp4twWqVXPOiXgYh1lENLHC2wPpDP8G7KzqCzrq/KA/FkZS7r5jcGYlhTxvp2ko
	ir1cMGwSB8W15K5QVTBjbR/NiwcgC9QcmvfQK94ypLzB/p9A8jUr270I8CxyywkkLaNQF
X-Gm-Gg: AeBDievlD4qNxDW8GgAKGGsSCBP29ogNp8Nih2lgk8nCOjy4r71Iq/P4dzV0BJ0eDAp
	u4QP3e6ZOHsml+Mrbg7a/FQh3z67MfZciVDOdbt1fNobxCfj9fJhk7BFS9g2IAIUl6WAfnO33Sh
	Qi/5/RXS06vzZ8rejbyfeKeYcAZk2myQ9PyaR0V9eR0VdkJOBYIyBS43npvdtwRbntJHEFRNyfw
	iyZAF8s4Y38nWQ4MktMmgVO8EWv1/teIuqB/7xtW8SsNONEtKntkfiQwRQk4BcfYjKDKFkhUHt1
	b488zkFCPKj3EqhjlkxP4C579vM0HrRmSLxWpX6vtQAgerwLIwvTgDJlgsgO0B+TnhhUEU1gIho
	/Gd9/rHghPbiJXfEO7kmQp4je4G19bKVi/cpBbdqK1muG8XcScROf8FDXFZ6t2Lrz
X-Received: by 2002:a05:7022:ea22:b0:130:a479:7995 with SMTP id a92af1059eb24-1319cd3ec60mr6486684c88.33.1778235333626;
        Fri, 08 May 2026 03:15:33 -0700 (PDT)
X-Received: by 2002:a05:7022:ea22:b0:130:a479:7995 with SMTP id a92af1059eb24-1319cd3ec60mr6486653c88.33.1778235332920;
        Fri, 08 May 2026 03:15:32 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-132787673ffsm1942800c88.15.2026.05.08.03.15.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 03:15:32 -0700 (PDT)
Date: Fri, 8 May 2026 18:15:26 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: crypto: qcom,inline-crypto-engine:
 Document Nord ICE
Message-ID: <af23vhe-LQvW6lco@QCOM-aGQu4IUr3Y>
References: <20260427010527.230473-1-shengchao.guo@oss.qualcomm.com>
 <20260429-important-panther-of-drama-00f5af@quoll>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260429-important-panther-of-drama-00f5af@quoll>
X-Authority-Analysis: v=2.4 cv=DZUnbPtW c=1 sm=1 tr=0 ts=69fdb7c6 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=OgxhjLVz-CMH9HgEXFAA:9 a=CjuIK1q_8ugA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-GUID: DjNffUIskWdf53E32scpdjgejTX6BzWg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDEwNSBTYWx0ZWRfX5noXm5v6Do2/
 aHEExAvbwIu6TyCWZKFvRM1f+YuceReQfAkhOuiWBQJ/W/ipdXpGUO5jPkA3sMrdcEVgzJI+itQ
 /HzJ9ZQB71c9LaXzfnstrxOwAZQLyFzl6IMKNUPBMD20+hrX77o2CBz1sIonJIBNLUZ8c2hn9wY
 FFG+R4FXJDkc8sWmjXnIn6LIPl/5XG6zz+H2ZzW+JKa+x5ylYbUpeXWNJYgRCvH+jCmbclTGBh3
 dmtTWGnZjXscJ0n2fa5zj8RU/FnkjHT737XiURjNptdvlbtIDwdW1uf+1CakW/qozEXsNJ5gl3P
 3pYRJw6mjbH3G8yDLXJTO/Uexn8sU7bm5euyVN8vW8n/4rHsSwViDKOYovjEXsIFGE4cDNZNAL6
 klvqC7Pjvn9Rz248VzP0hscCX7CzRTxPr5N3CIrOmnn2dBMqbTj1wTZQj+sYEhq5FEp1W7aqOng
 nzRlTvW4+JbT9nCqIvQ==
X-Proofpoint-ORIG-GUID: DjNffUIskWdf53E32scpdjgejTX6BzWg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 clxscore=1015 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080105
X-Rspamd-Queue-Id: E74334F4E3D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106634-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Wed, Apr 29, 2026 at 09:15:35AM +0200, Krzysztof Kozlowski wrote:
> On Mon, Apr 27, 2026 at 09:05:27AM +0800, Shawn Guo wrote:
> > Document Inline Crypto Engine (ICE) on Qualcomm Nord SoC which is
> > compatible with 'qcom,inline-crypto-engine'.
> > 
> > Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> > ---
> > Changes in v2:
> >  - Improve commit log to make the compatibility explicit
> >  - Link to v1: https://lore.kernel.org/all/20260420073301.1250197-1-shengchao.guo@oss.qualcomm.com/
> > 
> 
> Same comment as for SoC patches - do not split patches targetting same
> maintainer - crypto - into separate patchsets. It's one patchset.

I will have to resend this one alone due to the request from Harshal,
rebasing on his ICE binding update series[1].

> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Thank you!

Shawn

[1] https://lore.kernel.org/all/b8805117-d54f-4e42-a7d4-6fa18af63e69@oss.qualcomm.com/

