Return-Path: <linux-arm-msm+bounces-94438-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kFFsNHSCoWkUtgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94438-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 12:39:32 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 32BAF1B6ACD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 12:39:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 37AFF3136CBE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 11:38:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E4DD3B8D48;
	Fri, 27 Feb 2026 11:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="khVvwuOz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VQOOGc05"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32FF43F0749
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 11:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772192280; cv=none; b=dbMVB4PXuJQWzpN+eAJys2p//EGvfORp7OdDLM9f7O94nRqJKLBaXndUqdswtne6Fwk9fLpTEJwrh4EHDcUsD9lqaknrWGEZisGZpu/l3w6AjWImJZB4OkEHD6l2QWUlcVQGatWfjzDZUCGLSz8Db1+rLw0Wm8xX1qQeGOvsu40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772192280; c=relaxed/simple;
	bh=TUwVrWaKkkLI8/hk3wfytchqImMKwKLMARswvm3p3DU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UH6/eJeW6GidsfhQWZj6ye2lLQNo7EYBQZtCijPWWNz2gIGdyD9Lxeqp2NeOlrsyYFmbOkGY7zx43C2EiwDKbkYCzYFP3SyazEyv2F/G/lzZ4fFxccbZSTydYGa4nXP8vUHuPUbl8W3BvF5BP/z2z1Y3l27jeT9E6nBfynOt/0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=khVvwuOz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VQOOGc05; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61RAMDQL032178
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 11:37:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GXVBy9XUdUrUuaUOkpG66hxlJn1+0xq2o0xfjx+AkqQ=; b=khVvwuOzSJxnuf27
	L2NV+HrQKziEKn5Rpu5PJ91RoMyCavQ/dGEVKzietctyQax+rSjl99B5uqu1aTjd
	kGJ0//uOVE735JxeS70igsCxeVkksrmGkdZb6/Gat2nNitwM1nfjw9T8ljfn8hdo
	7b3QmpAoYkdOr3HyU+LrBMk5/tMXdFMOGtlvxV6IPxJhlp7aoPiLCAjv1ocTRaM6
	pQfKspm6iXysVjmI2JVUbR9jVGeOyRx4pxFjvgS+6Hm9IlTgg5ploOM2ntollsnf
	DM+ASeMS5lwUqQVrQWQ1TVhMKI+aecsVEtwywolcc9uTwBzHXU/w/n90MwncbYoC
	cdYeeA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ck9f006kc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 11:37:58 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82442d02d11so770495b3a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 03:37:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772192277; x=1772797077; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GXVBy9XUdUrUuaUOkpG66hxlJn1+0xq2o0xfjx+AkqQ=;
        b=VQOOGc05wzXu3edwy7BTzFmrHs0k+dRXNjhaJM+d3kJzMhn6AIgrGZClqcJvkXRAXN
         Rt3FmdbkuMpkMlCTZk/UKBYV9C9meNFde0m70mCj+fPWdWofUld81bWqspaFv993A7jZ
         i97H9H43nTInGaOxaf3DaV3OMMVlsMocp+qumfjKAEHAvBEH+tuVqru08fUSw/psc/Nr
         Gzk0vfaQM5YqAqUKx8kIjDVlnf/MbFOX+5SAAmJAeiGB1WuUVulWKvSndkJ5aX/KYxLd
         bPAuc3jwbaGDeBCjKQ8LnxhkuKHc1xlWg3lCbyv1b1NRiu7OFbDfjizut703h+U68GIF
         G1Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772192277; x=1772797077;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GXVBy9XUdUrUuaUOkpG66hxlJn1+0xq2o0xfjx+AkqQ=;
        b=Hk6/RibpURpu403snxGyJrFGtCQnExsEdCsrSk/vdjmxVVQdw2tX2GUDMM6kNbzBzu
         M9IVubAgXWnPH4vjBypEDMunTDE1N26h2ce6568x+x8IMD+q3ClF5xipwEiut0U0yfNc
         h3L5KChf8iwqsCqYriEfF2fXZyaR6z16pb8v2BA+hA3hb19KKlSiv4OKiRZfdrnFJZKk
         PdqJZI8HD+TgBTKpFIxXV73nQg9hDOJ3bBhtzK5V2DvdPuG7D/tABM4nMLWSz1HXiNOD
         Fxz3PpgPSY0Wc/ADwY4Nt1BgwtdUzvOlyr5DJwVdNeSoWQ/vXh5wgf9Of7XO1onRWl2t
         WAQA==
X-Forwarded-Encrypted: i=1; AJvYcCWDVyT2vpqw0yltP1wDS0ntaMe4FyhYKiKb2E+Yv4zac4qiLI73GyVft8ScFiwQYto7RoI5nGxb5w2sbZGc@vger.kernel.org
X-Gm-Message-State: AOJu0Yye3aUrgbU03Cl46swkyTdfdWmvuLWl7QuHdk2qd379ME3MWPb3
	IbBgMjK+nDgLnR8wX2zHxJX67CuenUI32FWoTStm/mkApWtyS9BwP4YGgTOHi7KFAIZHcwckn1X
	fNWgauBFz0abmJeEM1sSwUZbpMykntBc1RCLNq7ACPtZPbMywNbW4ePz2tIHTVwBFjfZa
X-Gm-Gg: ATEYQzzgHeJGgujAZP5w5PFhPUpsBcSdeDBTVzJPvKV4x+6xjQIbLt8mNugeQc4+5wo
	BI34wf44HxQIF4f5HWqTn8QiWOOL+9w1y+H0ZLV6RuietTwbZx0okj2wwqNz+5qQpBlv4jbFQ+X
	4tFuAscowsP8A41IP6FuBBZx9QQuABGdKpenrD44D/9V8JUIxaVbvQBWgeAFtdtcurwHdCq+dnQ
	fCQ9U62odIujqDCezdev6mxh3P6Y8YEuvStis29tuU0MEOnBabqjqIvxrGeN+Qi86hiugLTKkJD
	I1mN7fD1z/O+04+1XyGzZb0EHC0g4x/bh5ZNgcLsYWrTEiUpAONJafaza+m+yoXxbNa+xZa14Ap
	7o4ZXLBPSxt4c5xlFyJdtcLvZvLYVitY1ARE4URKvNp4y
X-Received: by 2002:a05:6a00:810:b0:827:36ed:c6be with SMTP id d2e1a72fcca58-8274da25538mr1925578b3a.7.1772192277214;
        Fri, 27 Feb 2026 03:37:57 -0800 (PST)
X-Received: by 2002:a05:6a00:810:b0:827:36ed:c6be with SMTP id d2e1a72fcca58-8274da25538mr1925563b3a.7.1772192276750;
        Fri, 27 Feb 2026 03:37:56 -0800 (PST)
Received: from [10.231.195.100] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82739ff1a69sm4793030b3a.34.2026.02.27.03.37.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Feb 2026 03:37:56 -0800 (PST)
Message-ID: <a2b64ff0-38d6-4153-899a-b1e5a620eac2@oss.qualcomm.com>
Date: Fri, 27 Feb 2026 19:37:37 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: glymur-crd: Enable bluetooth
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Zijun Hu <zijun_hu@icloud.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260226-bt_glymur-v1-1-838fcbfaa767@oss.qualcomm.com>
 <65d15750-64f4-4abf-a62c-519510ab3968@kernel.org>
Content-Language: en-US
From: Zijun Hu <zijun.hu@oss.qualcomm.com>
In-Reply-To: <65d15750-64f4-4abf-a62c-519510ab3968@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDEwMCBTYWx0ZWRfX8XC3kGsu7Bsn
 jGG8f3qb9sRpT+3AQ3IMys5fFVBvdX664sy8WwwEG71W7LI4IeJdTDxfnKC1SFf8op1h+ufmHO/
 ZH0IIbgcO3ZLeEMbpX0FaDPMmhjnjhHRurV8C+E0CFARpUSPC1KseOM3RxVfy/7aOuBtlvMqEyC
 AYiU0mtvioLyIwaq0V89FyitZwCOM4mNlAaH29iR+Ko3Ec9VlkoN2BH1d1mDykohdkTzQ1ypZc8
 Ho0i/uw1os5F+n5v0XKdf4ofIMmugk85LcU7y7Cx0itD23ayK2vo/pJbF/Ccw+04CToC7ulUpk4
 Kwk1YGw4SD9nDZnWsXVfeWR4c+cNZ2eIlKwg8EWzwySR2ysyh3jyKpmBFbsrHgttTtZ1QpKlW7p
 evKMWnjeiLzpI4yED8WycIdnI2gyu0L1eqHWugI7QK8U+2I7f0bDE9hbatksJnzLIpu0ZSo6fxx
 Vk15k2HwAWiRsXF248Q==
X-Proofpoint-GUID: wfy_ZK4QgL-hc_LdNWjxGe2CNzCatLoO
X-Authority-Analysis: v=2.4 cv=bIsb4f+Z c=1 sm=1 tr=0 ts=69a18216 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=qC_FGOx9AAAA:8 a=VwQbUJbxAAAA:8 a=Am-IchHnSq3TeyD-7eMA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-ORIG-GUID: wfy_ZK4QgL-hc_LdNWjxGe2CNzCatLoO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_01,2026-02-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602270100
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,codelinaro.org:url];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FREEMAIL_CC(0.00)[icloud.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94438-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zijun.hu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 32BAF1B6ACD
X-Rspamd-Action: no action

On 2/27/2026 7:20 PM, Krzysztof Kozlowski wrote:
> Why are you making concurrent work and sending something which was
> prepared by Abel already?
> 
> https://git.codelinaro.org/clo/linux-kernel/kernel-qcom/-/commit/a0288828563bb1e2101ef8f1e782c8185c5757e6
> 
> This was ready 4 months ago, wasn't it?

yes.
the git repo is a private one, so nobody will notice and code review it if this change is not posted to https://lore.kernel.org.

