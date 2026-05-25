Return-Path: <linux-arm-msm+bounces-109560-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WD1wHdDsE2pCHgcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109560-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 08:31:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CC3355C6774
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 08:31:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3B44D3013A6F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 06:29:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8010939B943;
	Mon, 25 May 2026 06:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ve7tV7mM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M8WMtrkW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4639D39B4A3
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 06:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779690584; cv=none; b=A7B4bDmmRGGLYzU1d9k9qNpa//Y5E8CLfnLeJDcg7UB0KmU4sBSLpu9rZLEdzFEcOlbg7ZR2ed+5SPu+2PZTYe2vO1N7Kqvh+u/rbJMhp6LndhzZej9pwZN3XVe7+5raQd0/BJhs0mbEtkeR/8SRBIQ+9RAIobjrnK6PhvwDyd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779690584; c=relaxed/simple;
	bh=GHwHM2Pf6KaA2vthdyaGDntjXWUE3ensLonH0SzHyMU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oFd8N3kKwrfYXC7fkl/6QMO/9eCuX6jbqH4ZUW0Kc5H5qUh3TQDJ6otsj73tg4xHJjmu1bYOUAZGLu4ZpkI4ZN6KjAetOrPYRDtJ4BxTuiPqYYTjMVUGxGpNVUdyak6rWppsiQuACJK1wV3wioehgIKek3++9mr2C8ND7XYhV8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ve7tV7mM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M8WMtrkW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64P1K5JU978501
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 06:29:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FdIrsOqTvAtPVjBT+JGYNekw3r4qMnKczAPJbhiSasE=; b=Ve7tV7mMp8QvF+42
	6DWaCZPyb51vcb3OWG2A1fWxOI7zTm1jllpE2R+oh7ju7u1eGYzZDHQ/FpFuw9GG
	j/mVh9dlwX1EYgBDnWJ1cDFqK93XYHTAjvPUHTkPnGsUEH6jUzoNImm2C4uRNk2F
	xiebWDSRDrglWr+seh4Z7Iy6BPytSYpfPBAKEdV0gmBFlozxERO14Z4BEYd1LM1Y
	VTiCA1IvM1w+dpadbyrfUcFC9CfL/TvMflraVvfmFARIz93obC6WBcTJ3XUmnqPK
	p1HHxBKjMtzk7/O34VXU41dXUyFaS/M9XZE7y6zdmyn/YOy9eDEzCxaQyjrxFwah
	9Ky1AQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb5h9n3x6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 06:29:42 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3663d5e9bf4so9206851a91.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 24 May 2026 23:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779690582; x=1780295382; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FdIrsOqTvAtPVjBT+JGYNekw3r4qMnKczAPJbhiSasE=;
        b=M8WMtrkW0Bsd9iGbSdvTm/uXprAOyTD6Ukan7qsXFnsFu7LhMFZ9GcHei6/YdJHtrF
         ZKqDhFRWlYJUS7cAAZVSmd/8P/t0fm+VnIWxAcuN+bc24xfJNvoJnzNu2igqi67B9dKn
         3NX5Q4GI/wz/zOkE+pDE9PPbHcTWY5ErGs306XC2P9oA32D5URlvK0s97nmSdLuhXB7s
         iWoD6TDg/in25uzAqR0whpyRW+6LGOz/deGWDwtMx7T6Ak2RkecN1pfhhXudaaMDN2K9
         /h7kh0ODzCQ0dAMt4fDKL3j+rQkNOjmriPCc4XlmEI97vOnP9YqT9HlFOCX9mlOdAtAZ
         GFsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779690582; x=1780295382;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FdIrsOqTvAtPVjBT+JGYNekw3r4qMnKczAPJbhiSasE=;
        b=IIl3nNkKbZ/ha+RVGGtryYNd2X/x8EfMBOppe7cENtHYp09Rf0I9Ms0Rx9tpMcbceB
         U2B7nWxSOgGBFJlhvoI2ac7X0155GLsKISzOWTpbI48B3EtgLnv7X03qtDObKHv4lMPV
         tUYuPh+Tk4T8/yroI2kuF9RPYHofu5vnSAUR95wViji4fOJqts6FpOuyOtYqLOXH29ae
         mjKr1JoYA/pvlupLFHAKl3B5aXf/7cl9dZMGDU9X2FXzXTVPdwMk+H+l1Ov2Zz0U7ltD
         JuONKSaZRZARwICejrVAI1W+6HM27qgAwCZzaP2hqT+mPOFH6CHujbM107RpKGQ6HmHz
         yqEg==
X-Forwarded-Encrypted: i=1; AFNElJ/PEt+0iyX8nQowpEf0mPS8BoACYaA1XrKdJ6oKpSXVyotDtuGI1FTzHplikGpevSqQ9vwOIUFbmaO7mHBB@vger.kernel.org
X-Gm-Message-State: AOJu0YzTptt99Vcy3HxxKTDYTyMfdMkbyE3+4fJOmmba7iyHBGvEs2KZ
	9utJfY3KJ6X/9NS9IpHSLliTvU7bZLOoDxPD/13xVHCyqAkqFpdzxxxhAhr1OpR5u39YaOqlOWw
	SDfe4cqGnPuobd/I39ZbbhOVaE2hSPP5YQDKxNhnjWVzkptlj0feUNHvmbIpb/B0dWFco
X-Gm-Gg: Acq92OEJQO2ipa56KJOSOlq+zW9s37mmTrq5ZJIZeBhOjz4zUTjJTpKQIw9jX7w39UB
	wrNoSQf2riPt7DdHbmk3ibKagIIOrvUTiHM4EqYW+8p0Mlzo28k6Bp+8FqyBxaV/aqerXDs6XmU
	+yNFs2S5swGCD0B+EsqcJjwdpq33Ta75T3jqfwScfRBVyPuFwg1YC2aEbpB3Mb6Px1q+lZxKgNn
	JYWeSlv4DXoTp5/2G+SxUMCQitLouCUcIP66Q2LLpx1o3ob++Zs4Z+9by5JYHEhT0b703MOb2jv
	0NimFYCMqFhGIW6UxVenmVBJwsZXeXzCYpq/EU7MAibhhV9nx8N/jiOp/72/Mpi2F8JLL+pyZRc
	l3npcWPAeLRaZW3N15XVNNoJrOuD7AdKv4xVRv79q968AxaI9dJBXklUsyUra2bQ=
X-Received: by 2002:a17:90a:c88d:b0:35c:cba:3453 with SMTP id 98e67ed59e1d1-36a67693ee5mr13860532a91.22.1779690581706;
        Sun, 24 May 2026 23:29:41 -0700 (PDT)
X-Received: by 2002:a17:90a:c88d:b0:35c:cba:3453 with SMTP id 98e67ed59e1d1-36a67693ee5mr13860512a91.22.1779690581236;
        Sun, 24 May 2026 23:29:41 -0700 (PDT)
Received: from [10.217.223.47] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a72c4ca35sm8718531a91.9.2026.05.24.23.29.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 24 May 2026 23:29:40 -0700 (PDT)
Message-ID: <e36172c6-4424-4b77-9b3c-47dcdbdff05b@oss.qualcomm.com>
Date: Mon, 25 May 2026 11:59:33 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] crypto: Delete Qualcomm crypto engine driver
To: Eric Biggers <ebiggers@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: Demi Marie Obenour <demiobenour@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Russell King
 <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Ard Biesheuvel <ardb@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20260523-delete-qce-v1-0-86105cd7f406@gmail.com>
 <20260523-delete-qce-v1-1-86105cd7f406@gmail.com>
 <7rgfuvv3hai7g4wt4accbkejtzdt5dnb6mkj6x7ox5sz35q4n2@h7j6rr7extuj>
 <66317f6a-645e-432b-ae11-8f40569d4117@gmail.com>
 <d97382a6-6c5d-4a3f-89cc-3ae9b432de3f@kernel.org>
 <20260524204537.GB110177@quark>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <20260524204537.GB110177@quark>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: OJLRaxjvx9lH0V_3Tmz5otKXptetndjZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDA2MiBTYWx0ZWRfX1RqroQRAkkHf
 hl4CREFN/cEOylg25/sSUfWdSVfhINO0nN118PE028MjmGMyKuRZchuSH9BWru2n7V3WcaT+Vhn
 N4k11yTogMmKdoh5NQSVnyJ2bM2dfVL1kPUW/ddQvmOA8TiEbglr0KuQ8gLslIEU3eVTw5OKxky
 6FTwRiMEOqTPLiYr38fICDdCBR51oy9NYgn/nFWzLnGdTq1lfELRuX+DwQ5ByNClLnXvDQtcNZC
 /u9+sOFTFYmODFbp5IIvRwJROs9VY/L6PV/8Q5XaqzpyVDVoLN4dGBmVFqAHImX8fEy6ZoLlD6e
 HZtkYshIidiBbGQx7ZxETPiu1/dESaZh9PgmQJp61Fqc4fmixcjsvRxMEguChfl+TELo1RmCnpl
 cKDRCiODAmifG7BhHPmZX1E26Mac6ElLDxqxNyThmH46DVOZlNxGqF7fbP+/r96Q9ma4Md2aC3D
 PVZ3VUr6/yZhZRp7+zA==
X-Authority-Analysis: v=2.4 cv=H7jrBeYi c=1 sm=1 tr=0 ts=6a13ec56 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=84HhrvKZSfYMtnHzFl8A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: OJLRaxjvx9lH0V_3Tmz5otKXptetndjZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605250062
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,oss.qualcomm.com,gondor.apana.org.au,davemloft.net,kernel.org,armlinux.org.uk,vger.kernel.org,lists.infradead.org];
	TAGGED_FROM(0.00)[bounces-109560-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuldeep.singh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CC3355C6774
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

> This driver is more than an order of magnitude slower than the CPU for
> both encryption and hashing.  See:
> 
>     https://lore.kernel.org/r/20250704070322.20692-1-ebiggers@kernel.org/
>     https://lore.kernel.org/r/20250615031807.GA81869@sol/
> 
> There are many examples of it having bugs as well, for example see the
> second link above.
> 
> That's why it had to be disabled via the cra_priority system.  This
> driver was actively making Linux worse.
> 
> This isn't particularly unique to drivers/crypto/, of course.  This one
> we just have data on, so it's a bit clearer.
> 
> I've yet to see any real reason to keep this driver.

https://lore.kernel.org/all/c1697372-54ec-4f57-85d9-ad375ff1a44d@oss.qualcomm.com/
Kindly check my latest reply to the thread. There are numerous usecases
like DRM(Digital rights management) coming up and qce driver is required
for secure content.

> Crypto drivers need to be held to a higher standard than other device
> drivers, as well.  The onus is on those who want to keep a particular
> crypto driver to prove that it's worth keeping. 
Sure, I'll be working on stabilizing self_tests infra for qce.
Kindly allow sometime to go over failures in crypto selftest and will
submit fix if applicable.
So far, i am observing 2 ciphers failing(xts-aes-qce and ctr-aes-qce )
with CONFIG_CRYPTO_SELFTESTS enabled.

https://lore.kernel.org/r/20250615031807.GA81869@sol/
May I know how to issue reproduce steps because I didn't observe
crypto/ahash.c failure with CONFIG_CRYPTO_SELFTESTS?

-- 
Regards
Kuldeep


