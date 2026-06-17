Return-Path: <linux-arm-msm+bounces-113528-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vHDuC2pvMmq4zwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113528-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 11:56:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AF6F6982AB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 11:56:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=kbBA9OGt;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Kwz5ZSbN;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113528-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113528-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D4E9531DFFDE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 09:45:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1C643C3C0E;
	Wed, 17 Jun 2026 09:45:59 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 856213382CD
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 09:45:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781689559; cv=none; b=aO/v+BSYjP6iWj+knzLM1B2sNaOzgn3XlCd//M61z748yTmMJWphjUMiOhBgnxY95DZ9U8dumt9+lcL44dGlyDFmaQOZ+WUyt3kaSPF0OETBK0vb/Zrcaut8JdQtKKq7QQSEWLmD+9HG/K/aIAnPnJSKKMLhTer5uBCMVrRBFFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781689559; c=relaxed/simple;
	bh=0eRo7lDvmCW7gx4j5qTCHNZE3+C651RdhR1Op86dcnw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K8xWvsJA/l4ErAtmehlhnjnfF6lSBPO3agpBFddyLdT/D+SOxqLkbqLeyxaI2VhEFujKQkAMPbx9k7m7isDXGp/1ysHjuxqwuIbegdwWdkzg1dfrW2TGTZeanMN7dKUeqa0fbXn2h2wp7tLNB13SQB6niDgFHSS8Bi3OAs1CKu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kbBA9OGt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Kwz5ZSbN; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65H8UL0N239765
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 09:45:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	COQEA4gxr5ZMXmqKWJk+TCvG3sDkrEPKf7iIbRo/t0g=; b=kbBA9OGtgznYgcQh
	nnxgm3uze/+3P83wSJKSmi9/uRQXujx0ffoTZn2Wn3i/BS1pfPDBuRx/fzhHCxg2
	Ghlqw8nKVfvOac0fYkO9FN2XaIz00WL1jvIosVTKHcJ2hjPCqxo+DX/b+wGJ6IvD
	qrujl7BQ9zG+pqrf+/C/+9Ky73A43lxia8BP5NfJ1zor3vLnXJ5vqN4qSsONHbEh
	v3aJgOGLA6O8B5CCZ5TpGCsS2LTp0W8n1oGquIz/rLJ/VY1qTVCG8QrICDZLyyFQ
	SHyhLLUPaxiZZcZxNkWS4Q7QzvoRMzIgWgdsSR11+mqQfuMKlzMzzyD62rJJ7yZK
	mkAd9g==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eueepjdq6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 09:45:57 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-37cc07f3e36so302530a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 02:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781689557; x=1782294357; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=COQEA4gxr5ZMXmqKWJk+TCvG3sDkrEPKf7iIbRo/t0g=;
        b=Kwz5ZSbNtrYb1YoEetdP7wBTB1nAS+iRn2XdTOWGmxh4NqEex9OpoA3y2Fbm6G4VQB
         /y2M2DxE8Y7VGof5O/yPODX4sEB6+7dOl+8BOMCYdpCWUCOxDWoOjKTh6Su3ctDME9U+
         ynyyxOmN6tc6FBne++ud/sUc87SZMqh1Ktswajxmb0jR8GKpHEijHnGWx31OuhUtdZRQ
         hl6zqD1Mwsb2EQTcQ9BgWGALx0pLvGqY666JaoemFB7NzHsguCygMS6WePSXjcnh8B0f
         7i9VhdllrZB/K8MvL8CDJ42afFEMD1aSpr7oXAUFDHKoenZMwFlgRmkUU5375wkVbdWF
         Bopw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781689557; x=1782294357;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=COQEA4gxr5ZMXmqKWJk+TCvG3sDkrEPKf7iIbRo/t0g=;
        b=MG032PhvTkp/JByvNSgcACocf/6u7osUnyUIMPoc0KImMCQBaQEsM/qMKKkcZl0h1S
         pnlVoJ9/6Wh+6HyI/llhwc895OoGE5WUhZJNMbaQXm8GaoyklqdRbXsuHEzrIfbg4IAC
         rhm+kZBOF5Pov3Xma9lgR7fh/ELwJuDfoBQsUaJHYqspVzwn+25lrLSv4tU1/4l6fxWg
         vnLyZrdS6UIKJz8sCW5TY9VmJoOv4mjVJChQ/rhFK4BVK181dh7H9otpofBSaPOd8QS3
         hZB+JUzhDDAqTLoumZiWD9WAjB/THH3e+hHtLtv2OKw9RpPeRJ0bwEHru8PKTfAsprWY
         D0TQ==
X-Forwarded-Encrypted: i=1; AFNElJ+TTeBtDMglhoGycvqe/3gOU/SZgy2nk9k5RcjP/iwamOWJOIjEu2TS5fRUTPf3CQg2TD1z5BrRn9xN27RK@vger.kernel.org
X-Gm-Message-State: AOJu0YwPROIWS6mFg8gqyZbNk165OYR7LhkjD2EKTmxZiamxlI2wsv6J
	hjeODS7XsQYiTgBvZNy6PEH5vZkuEORj0eLIUBuK7zf6R0gZzs4UDIL9v6aFWkJ7g5aGFqbzwYU
	c3XAAd66H9Jzor6DSLqMR9IexIxuIJmrZcCIkcCC7kJG2/iQTCV0WwrxvjO6oNzaXA+o8
X-Gm-Gg: AfdE7ck1Tnb7ISy7y872Qv64KBPYONRECN3p93XbXf+Gx3LzqNDfRCmOk7IbE7qf7E8
	LcvfOfDC0IjoCdkgyrrN32i1KumKd70T4l9vndWGjnGU9q5HcwMm8VXYwlW9Q1BhqZ5NVm+2rmR
	YqUR59YZMF1+W5aOSIxvQYOuhDYMYwVnOe3CmseHt9xZ3NkN9TJ8UOYGJtbAFvMzJypBboSrre2
	mbFCTcwjbPLJzDljT3xmEswo12QLvhVe2M5/W3cLaFtLqn0b01cMH1GzY4hbQ4H3VVwLnpVTPSg
	qc9JFLuheJucumR9YuVJF5N3upOgb7b4lTTBDGLy8DQXtAfXIey2wvB/cjGNVDoOj1JrCgJfWd3
	INE68Eorg17xizxhUOd5+Idy74dq9xnRg0Tnj7r98/2c=
X-Received: by 2002:a17:90b:38ca:b0:36d:b424:4f17 with SMTP id 98e67ed59e1d1-37c936a2631mr3149685a91.1.1781689556835;
        Wed, 17 Jun 2026 02:45:56 -0700 (PDT)
X-Received: by 2002:a17:90b:38ca:b0:36d:b424:4f17 with SMTP id 98e67ed59e1d1-37c936a2631mr3149648a91.1.1781689556422;
        Wed, 17 Jun 2026 02:45:56 -0700 (PDT)
Received: from [10.217.223.142] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37c522a3d53sm5626666a91.15.2026.06.17.02.45.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 02:45:55 -0700 (PDT)
Message-ID: <ce7ddb59-d219-4684-a56f-35ce4c3c345b@oss.qualcomm.com>
Date: Wed, 17 Jun 2026 15:15:51 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Fix Qualcomm Crypto engine self tests failures
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Eric Biggers <ebiggers@kernel.org>, Bartosz Golaszewski
 <brgl@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Thara Gopinath <thara.gopinath@linaro.org>,
        linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260610-qce_selftest_fix-v1-0-1b0504783a46@oss.qualcomm.com>
 <20260610184205.GB1158828@google.com>
 <1abc518e-e24e-44ff-9b15-1766dcecd8a2@oss.qualcomm.com>
 <4fzeulsheu5tam6pcymjqkqnqi3ibjgwchiefy27wr7b5i2yhk@4m47fpfbsmwf>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <4fzeulsheu5tam6pcymjqkqnqi3ibjgwchiefy27wr7b5i2yhk@4m47fpfbsmwf>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=AY+B2XXG c=1 sm=1 tr=0 ts=6a326cd5 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=eESiKCN2Xvo0jsfTh0cA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: lQTwLKqh8W4EWvQC2bxrpX2pgRf2CLfH
X-Proofpoint-ORIG-GUID: lQTwLKqh8W4EWvQC2bxrpX2pgRf2CLfH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDA5MSBTYWx0ZWRfX8Df0xG+qqcuW
 lBhoIi7P2hAC0AZeyQbzazRJyej+XLOVDrfGGj+qEkujePTY/fzp/Lpho92m52Rz4gmSJXuwu6w
 867a/Dfb39HKYjT8RUe1W/Y18n6VJ21DY9Y2VzQQO25rU5QbKXDiyuaEMd8JnWv94DJf6uRpdnM
 JBzYABgtDhaOmdv4soVIXqpcEJYRqoGmSKCxGj6qqUKLqtpn9otwzG6fMYtxqiHKYHC0yv2gTgJ
 m6rO4LS5aMpmxpDpyz3LEgodxlx2QV0JcVDMd4urUymd92vfWd0uZ53vNTfbcA+vMU7Cb2ZcgbU
 jdnArh9ZxVg9gsspOhYWmskZysP8fXXCscXPfVkkcXztrn3YBgV6FcfTN8t9iZ+br6goR2p3Twg
 +V0mEL2T4UvMm9Lb/jNi5QHrXSe7mZXKA2ZvD1MtCZiwsrk5zuLbXM54vCUbk6d38piWXO2n+lJ
 WcGzeHlEywNDjqa3B4g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDA5MSBTYWx0ZWRfXwsk7VwOGxbag
 7NJTNkm+fab/CJ6z3RpiFr/PCMTDah4MQEf5TuvITSL2TUcUtnLS3RLh3D13swcKA5bPcC6lNDG
 EVu90pyDgAEkWpI0ikz/lVqrsIrskFg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_01,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 bulkscore=0 suspectscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606170091
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,gondor.apana.org.au,davemloft.net,linaro.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-113528-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[kuldeep.singh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:ebiggers@kernel.org,m:brgl@kernel.org,m:thara.gopinath@gmail.com,m:herbert@gondor.apana.org.au,m:davem@davemloft.net,m:thara.gopinath@linaro.org,m:linux-crypto@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:tharagopinath@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuldeep.singh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8AF6F6982AB

>> Seems Bartosz will be sending patches for algorithm removal changes.
>> The rest relevant selftests issues we'll fix accordingly.
> 
> So, the old kernels will remain broken? Or do we expect to backport the
> cipher removal patches too?

Kindly see Barotsz series on top of this one[1].
Fixes will be backported on older kernels too.

[1]
https://lore.kernel.org/linux-arm-msm/20260615-qce-fix-self-tests-v2-0-dc911f1aad42@oss.qualcomm.com/

-- 
Regards
Kuldeep

