Return-Path: <linux-arm-msm+bounces-100790-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EBlnCwlkymn27gUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100790-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 13:52:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6541735A9B1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 13:52:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6E879300D0FD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 11:52:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4257337CD24;
	Mon, 30 Mar 2026 11:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GNoxgTcW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LL4UAv+Z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED2E53803EB
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 11:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774871554; cv=none; b=n5H0ZKr4e8P8+WvflrEW8RrUa7Dthrt9nGOSnVnnWYeCyVWltUYn/dje/eOiiNUpHjNjzIY48uiQdEtfZ90OjMh8BNeUQW71G7lIVXaCy9kSmNSGbfCW+kSra2QT4t56BRSLBGdkbqse+x3H9mdjuNH7i0vA+z6Joce88javkJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774871554; c=relaxed/simple;
	bh=N0uh0w31AOZ0xzcglUW7rZeBpHHIS4bL9kNZz/b78EY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HibVAFdYATljVZNao0xZOxsJJjH3FPhmUhoauS3XSiCKOMon5SHBwqrrERRCbZ2njtkdBPmc9wV/sDG5dKjJCKkkr96aHLV8zSDI/Gv86E/kCn5CgWggcvnuBf7mNeOT84uTK1ku55DfM/ldsMiJU7FoMhDKpvowITdbgNB1yVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GNoxgTcW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LL4UAv+Z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62U78SC44161896
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 11:52:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XgZJgX0TxKp/l+YGdpnqFg2Xk4t+k4MwvR0s2wGs6yc=; b=GNoxgTcWeJWByafe
	661K0CzwlmVtN0ciQX/D4P376uw1N3buiAVLaAB7YthrKgLIHnmowfMj0r6oXVdS
	QRedBV28dyn95nH8U1NDgtEP9p4jaPSPVtV/THLtB/fFRRb+y6af6ZKFzbjMJFaG
	HVJKZ3Mtp1R+KNT9IWMRzOsYvpmauAWOXVdTrLrH7y9eSC9D+VuZnDb3skWNrmVB
	15OJ1t1wkz16I4Ah+3OjYoeUb7yWM1ugMHVCRCpNI8J3NvC79R1VdJFwVeB+yNhU
	YlNBIcefEt/OInov7YJXFABYn/Mqc97jee+3PYKQi9OhINS4UA2xuygR+6vHewle
	Z7lxiQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7mhas2vh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 11:52:31 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2b81ff82e3cso2156424eec.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 04:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774871551; x=1775476351; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XgZJgX0TxKp/l+YGdpnqFg2Xk4t+k4MwvR0s2wGs6yc=;
        b=LL4UAv+ZqBJ5DQntzPSusLuCmpBOgI0iORjH09IiXoqjAtzB0wWEMCXvGs11hbgMTq
         q/x/UPj56ICrphm3ifdG0okrzqrGWFhkqF9tsWuRwKWJ021n/VDMNBjh1bNOJ1qQFMF+
         Sc8xpKrrNgVFysknYb9qe0u9OeUfgwJpBHlTWm1Y1lPcgDwUGMYE9fymvsACLwziIUjP
         gfZaHj1pKbnLUcOUjPXBm4wcOXj04T6F68750D0DXl2IJxsDuwNj8SdhX0EftJmLCKjb
         DYnCxGWVk9AwKdnTnFXD2PHokGd4y4Rr/G62LDCyELDRk764Uw0uAXpL67dfhEyOWCpp
         IJmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774871551; x=1775476351;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XgZJgX0TxKp/l+YGdpnqFg2Xk4t+k4MwvR0s2wGs6yc=;
        b=CDJglX3Ru5CPWXW6NvYTYtr0nEa5SBKyX14+/G/NLiXExoHTNss8O1IekxpGufokLf
         RUS0i55V4wyEEEIq0DYMr/O5igw6NdCz8ps1bbxeIvNuYSgFXdLFr1Pqbc1Wg7ht3lQy
         tOJdv25Ukc9IidbZ17s54xwsOkkfEL851s36O7ein60GtqE+KyBID1cBR7D5BeVxqzNW
         vdnfc5dEmIAV4regSYLF8uawDv7pXJPoRv2BC0WlR4tJYqqcHQd7b3F18FZGfOheCdR6
         Q6o9UOBOcYbPg3U7IaHE7tmpyXT4c2euNtE/6tq9i/sX5BgFFKL8mEK8UiILMRgGrdGq
         0JGQ==
X-Forwarded-Encrypted: i=1; AJvYcCWXsTqHybvYPpeNH93u93WGOb3hPdlAyp/QnIcYZJw3T1y121AyZsktuRuzo3s5rzaweNyH0yN89ouz4kp0@vger.kernel.org
X-Gm-Message-State: AOJu0YwZT/WIyOgbWid2auYBFpafckiXBYLUzUoO9nXV0l11ljshqoYA
	TFAYJ7LcMtRRLG5g+D7gMYx+Tcjt+WAW+7TO9F/1ru0JfGJOrVB8H2SVi3mwpi9JvFOl/n1l8YL
	cDgDSHkBeRSLMcOOJ6LZwwtFQEq01HYX1MLiox3s2iUSsqA5QXSsESt3HX17aZE73ak0X
X-Gm-Gg: ATEYQzyeKvhuHsAwo68VpZtsnBK/LruaZ3wVaCjYxEII3zKLOmfg9W3rYt64vqJ4sul
	MBdCNUXayDltDmudIAZVdmlhbGwBVJQQm23L71XBLpJKPRCzQ0dg/b6vwXV/KKkG89U3A2VN80V
	559Cznrmi1lhhACxhTKg23mwTu59OFl9LwwGbaMX7EDozsPhUMP/fdAqljuLMzg9Q01MgYGYo4k
	Iq1jKP7Ez65ieTGdZ7+cub4ZDQqh9y2JncddaeKwH1cfonTTGsuRVt9wJ+gTdGwfdIKfZFbsV7W
	a7cwqOzaX21++QIXAvX1ug8wU8Y6rNFoNOZJAYAHCieyQGIoFggdJKBHOPVBgdfTmAFlN4uN4aR
	2szalc5yRlEvLLJc9t2nDyiA3lRroEauu2evlwe+yqKCegXW1MH7N83Qg8a6GK5vpDnTfXpC/Wq
	7snyY=
X-Received: by 2002:a05:7022:6882:b0:123:331f:978f with SMTP id a92af1059eb24-12aabb50203mr6812656c88.7.1774871550797;
        Mon, 30 Mar 2026 04:52:30 -0700 (PDT)
X-Received: by 2002:a05:7022:6882:b0:123:331f:978f with SMTP id a92af1059eb24-12aabb50203mr6812642c88.7.1774871550263;
        Mon, 30 Mar 2026 04:52:30 -0700 (PDT)
Received: from [10.110.38.145] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12ab97efb42sm11000274c88.7.2026.03.30.04.52.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 04:52:29 -0700 (PDT)
Message-ID: <db642c02-8009-40e1-b296-70de8364b43d@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 19:52:23 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 12/38] drm/msm/dp: introduce max_streams for DP
 controller MST support
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
 <20250825-msm-dp-mst-v3-12-01faacfcdedd@oss.qualcomm.com>
 <ltlmp5ytl2f7no7aqq7sl54pwd4f53fuema23xnuwu5uthhbg3@7wamwvv22nle>
 <c71ea478-ed93-4f10-aba2-023180c2ed42@oss.qualcomm.com>
 <ex5zvncmnt5pmb5j2utolgbw3yewj4x4e6nu7sdrgzm7ubasmi@2jdubbxuckwd>
 <99d6795e-1cea-4e7f-b8b6-97f55af55d8d@oss.qualcomm.com>
 <ns7sknmegndsf6uvih6znbwk6bpltjmbykvs6g2ma3ccd767fe@3q5rhx3zj27u>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <ns7sknmegndsf6uvih6znbwk6bpltjmbykvs6g2ma3ccd767fe@3q5rhx3zj27u>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA5MyBTYWx0ZWRfX1nOKP+UYQlPn
 Odvvx8Stvjk9lAfr1+9i2b4ss1bad4QSOJry6M20ixW8MuOgafRBaU9YDaDjTR2g1Np7L3nPUGr
 9N4IK/Mi8HLMzxbUHx9W4R9CPh4w35/sYRdLUFz8WiRVDQwct2+JjFgsU60HbHe1wTy9YFBvxL/
 v/JKpqP9zElsXVS52MgUIxe2C3BSqb0GYubAymL0gPANFFUjVqff7Y8LAUPkySqSpz/V04Ta+Fl
 52dTys8lAGph8JOZQsO1fSBK75e0tnBSlcVqW3NUAXTDQAFZoHBZ58atrfmMN8dg43CrnpkhnEo
 3rjJ7+aGbnwO00UcnZOVTlU8nFxyWIKIvJjgCRDfKeXCUxJVUuH90LcX0H9oJPQ61uVHz5R2tqV
 9ZAefcwDPxXWLtCCLEmSkilIhrfq27ov3uRPbAwRULoMeCUge/SkjMUiQHZAKAczEcAT6j9zmo4
 7N+Da1aya8mojZnmzhQ==
X-Authority-Analysis: v=2.4 cv=Fbw6BZ+6 c=1 sm=1 tr=0 ts=69ca63ff cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=fQFtLZBTUO1RzxlNfjoA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: sMtQXddpY09R8_VAG4GHf1UdtrVMjKZe
X-Proofpoint-GUID: sMtQXddpY09R8_VAG4GHf1UdtrVMjKZe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 adultscore=0 impostorscore=0 clxscore=1015
 phishscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300093
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org,quicinc.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-100790-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,quicinc.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6541735A9B1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/30/2026 7:42 PM, Dmitry Baryshkov wrote:
> On Mon, Mar 30, 2026 at 07:32:38PM +0800, Yongxing Mou wrote:
>>
>>
>> On 3/30/2026 6:35 PM, Dmitry Baryshkov wrote:
>>> On Mon, Mar 30, 2026 at 05:57:13PM +0800, Yongxing Mou wrote:
>>>>
>>>>
>>>> On 8/26/2025 1:42 AM, Dmitry Baryshkov wrote:
>>>>> On Mon, Aug 25, 2025 at 10:15:58PM +0800, Yongxing Mou wrote:
>>>>>> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>>>>>
>>>>>> Introduce the `mst_streams` field in each DP controller descriptor to
>>>>>> specify the number of supported MST streams. Most platforms support 2 or
>>>>>> 4 MST streams, while platforms without MST support default to a single
>>>>>> stream (`DEFAULT_STREAM_COUNT = 1`).
>>>>>>
>>>>>> This change also accounts for platforms with asymmetric stream support,
>>>>>> e.g., DP0 supporting 4 streams and DP1 supporting 2.
>>>>>
>>>>> How?
>>>>>
>>>> Each DP controller have it own msm_dp_desc ...
>>>
>>> Why do you need to mention it?
>>>
>> Sorry, I may have misunderstood your “How?”. Could you please clarify what
>> aspect you are referring to (commit message wording vs. the actual
>> implementation)?
> 
> "Yes." You mention it as if something was done explicitly to account for
> those differences. And then fail to say, what / how. My assumtion is
> that this comes from the commit text style (see
> Documentation/process/submitting-patches.rst). Please use imperative
> language rather than descriptive. It will make such questions go away.
> 
Thanks for the clarification and for pointing this out. Will rework the 
commit message in the next revision.
>>>>>>
>>>>>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>>>>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> 


