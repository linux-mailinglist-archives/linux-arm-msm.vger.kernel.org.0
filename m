Return-Path: <linux-arm-msm+bounces-106284-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GNpvEb1H/Gk0NwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106284-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 10:05:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FD684E4790
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 10:05:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1626E3016536
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 08:03:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 084FD3321C1;
	Thu,  7 May 2026 08:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Gy69sdVD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IRfbqVNb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 368E63321BF
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 08:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778141017; cv=none; b=Z/Gy3nzY4M6oBpGHVq8m8MRwdWQqeRlDLzgwnk9Zwu6DuLOzepRtBTaDaaR9I3dj8vclKKgeqYvd9T3sA7lrPQlWJ2Fe4f3zprgc2sup5xzMKDHtPP0W0cPfUUGrwN4K85+gQDIclw1Psjv4CGBMFvSifiCh6GR/ngy22+7oGRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778141017; c=relaxed/simple;
	bh=CT3j++ZpGDXY8wdafFXCva+5jnuKJ5HyNp2OUnXXdnY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B5sf0JXiBY3mOdRGJwm2hIU7EaTI8e20lPM8v/m6KJcDgP0Qo+pWa/wlr+XC7vA+ymEcpqxIEOlAOubkFWTkPgCt4nx9Qi/o/30IO124bJGwjmP3wm5jie8ZJzyhAIK/dVn/ZNX1RssBKBdUBW1dA0A0pnbahiUpJZ1SOZdSTVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Gy69sdVD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IRfbqVNb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6473eEjw1669703
	for <linux-arm-msm@vger.kernel.org>; Thu, 7 May 2026 08:03:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Mtfq3/2Ai6rBAqMoI9sGgKJF+BZSrWb/rzLufcVkZVE=; b=Gy69sdVD3lS7laZS
	/wp0O46q9aHxu6nX89nj8qDvQHz6HRUhwMUpIzX3vgS1tfWDRJogRPBlOw4022Dw
	SKN1oB0uCt9UYvZHAaOUV0jr/v26ppMRL0YGqtMtdxap30MVsXE3Itjd3kJiIIl9
	oUFrGPLOuqwjwgT0ofDP9tggROhfDsv7t1MDgiAuhujaTHSZyOt0gIt1ZpMO2L3v
	Zsb/3Bayptn/50bcBGrDnTTe24CidGIsJS9UwgZIpghU/0s8/Pt44+l3TbhouDec
	jXvUO2B7pQo7uDH6ImjgjaNTb6d9kOHN/eiTYb1HocISq9CcQn+z6FBjgD7aQiTR
	bRka+w==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0k1p0vnf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 08:03:34 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-5ff9e60dd65so47509137.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 01:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778141013; x=1778745813; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Mtfq3/2Ai6rBAqMoI9sGgKJF+BZSrWb/rzLufcVkZVE=;
        b=IRfbqVNbc5FSlh2dkNdmfZ7lBRQ7CAOXoGQOjwAZHAfMZu4fvVUvwZnxk6HAsaEl72
         xTzg1oNf5Bel5YJmvjUT4wsLLb7Oy0RLaDXFTpQzEudnmvT7l9NUvfyb8ULBxUZjYHN1
         qWPe6WG/ZhuO5cRqx90PqlGypw3zwUBNRs97BZAeONM/Q2ADR1AbOVFlmkhttD2XzXGK
         CFSYgt+eyq3ymYnDZeSGGlPLoIbpDYroZrsxoZ1ncl8cBp/hiPHKq+dJtKW+E36cAkGj
         y5WfUUpDwo4rWDMTwOnf5oGYUjLWcWlSnXkydSvQSCmn1lRltT7ROQcYNDgsLEWb5cEQ
         URdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778141013; x=1778745813;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mtfq3/2Ai6rBAqMoI9sGgKJF+BZSrWb/rzLufcVkZVE=;
        b=JsDkHmqlQtku3aA5swx/1pNGNPzpCu1DHvwyCFU8iYQYPt8GCRnONYAMi3581pww+G
         UKxYR++IoUvYAV2QCbptlv8gGlZuYQi+XIsclSryWdPqva10A9prAwoEy77Fn3h2vqSZ
         QOrTuzijZmbAX1NF2UjRTG1GtfSDRK5Ag4Fxb7HhjznvKmMeBK1Njm5OffvJurs5acol
         sH6LdWS4XDbd0HmLIyNrcrmUV8kB7Ng6q1zP5qwiigveRgJCWK1JaDLkGBJP9pQbaSs+
         5wFnPUSR72VFhE2XZsDkcr4QicjVofDokldhNuq5VkA7VW5Dp4gWrLPaRWpaKi551cxd
         R3rw==
X-Forwarded-Encrypted: i=1; AFNElJ+iu+6t/Oh1oUduzEmURcg4XrLVTwLEwVDNJ7Md5s85yiPynjnr8Gih5Jph6W/e5WrABt6AfoZt4iDu8ljR@vger.kernel.org
X-Gm-Message-State: AOJu0YzqvqymDwYt282MMS+jHvTp7n66Zr9D0qm8C9s6HLp08vDgohEP
	ZQF9eVSnznybk78UGoRPbIUxarjHE7TaIn0wRbqhmA25WGrRFqO+KrKG2y8Y9OE6QLgcAnPLp5U
	WhB0hSASLTFd3DZKK8yk+Km9qYSQZFHi6gkAAiE1CHy+EDFhb9Hig+8EhciCapx1mfKBU
X-Gm-Gg: AeBDietMKrzABZcvckifCQfMD8J3VPi84y27y4ceDecXuZUBie/o1xBRS7cEvx4QOsO
	HjO7T34CwK/b6zUxLctaDMjMpy4PeXUnF/+psyuvXMR/F5CTkUDJyAPFj5CHkdTgpe3Gow2tMe+
	jf0HmWGEbW0CukVh8S1mX9Uslc8/CZ1jubsnmRiN7lBVF6/ddGArg6/UcReUJIvCMWWtYMRC+eT
	19EEp0pNu4zmEyBjA+3pwJc0W70J+JTZ0VMDMP6ChgTkbGwQ5l7R99PbHgDS4arboRh9x0vV0d1
	fE/OgcbnOt9CvOJqZc0w8nzicMcpaozrMMtPLZkYQxVXM+16Np7RrC+0/rfcuTbrKOqmBpi09dY
	8ESXxG8ZV0t4MGGOG8H4kuPHD/fkJlzTwbGTSiOvKlregn660xoVQudpU5nbQSqe7qAYq6bufRl
	o0HRUrzrmwVkWjwLTfF+oK/LMl
X-Received: by 2002:a05:6102:5ca:b0:604:f07b:efc0 with SMTP id ada2fe7eead31-630f8e78471mr843255137.2.1778141012931;
        Thu, 07 May 2026 01:03:32 -0700 (PDT)
X-Received: by 2002:a05:6102:5ca:b0:604:f07b:efc0 with SMTP id ada2fe7eead31-630f8e78471mr843244137.2.1778141012470;
        Thu, 07 May 2026 01:03:32 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bc833e110fesm51608466b.46.2026.05.07.01.03.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 01:03:31 -0700 (PDT)
Message-ID: <fafc85f2-ede0-47db-9961-f34b2536a93a@oss.qualcomm.com>
Date: Thu, 7 May 2026 10:03:29 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] ASoC: qcom: qdsp6: q6afe: fix clk vote response
 type mismatch
To: Mark Brown <broonie@kernel.org>, Val Packett <val@packett.cool>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Bhushan Shah <bhushan.shah@machinesoul.in>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Antoine Bernard <zalnir@proton.me>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20260506204142.659778-1-val@packett.cool>
 <20260506204142.659778-2-val@packett.cool> <afvWsfgIz9Q-_cjH@sirena.co.uk>
 <35b45fd0-fffb-455b-b19d-5c29cc955563@packett.cool>
 <afv17gUZnHdXgyF_@sirena.co.uk>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <afv17gUZnHdXgyF_@sirena.co.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDA3OCBTYWx0ZWRfX2UTBCEmU4dRR
 714RnfC4m0WQkeaTXXCGpg6zApVJTrP4P32Y3k0R4m1qa44LfbItdMR8XVU4h2ZJuDAbM2qLvCj
 wzJG+EOO8hKAgQjGyW0ovB5YafOEVCTrmlVQ3Ma/c3yeQuvtqootDulzch7Rbi5kqNn7NKXq2xf
 ix9RzfSlNR9+kLYvK7NqAC/AKxUv1mIRMBKwRN4U4khY7gCQpE9JaPYUdSYxUObRWxvb3YaSIFN
 IOUF8O76Ky1YlVwsgjufhreCQkgYlOVxKloyy85AOVedZfkYwVAXYBbghzDBv3JrS49YzsyawQ1
 wCfIX1qD6AiVFL3qrYg6E8nXXnY3um127NQukz021YUU3N+QEhlTGsS25M5P+DrHJDGdQcbbiYv
 +6qIvuV52g6JWnoe55ZfcPJSMiPRxwwq529HDFex3qRQV0VNoB7J6h5aBTBMjRRHQCLfUu2NMix
 LvNcyAJlNappt1VcqOQ==
X-Proofpoint-GUID: vYxFqabY9DQjQ2bKE6ftQabTHwOv8W1t
X-Proofpoint-ORIG-GUID: vYxFqabY9DQjQ2bKE6ftQabTHwOv8W1t
X-Authority-Analysis: v=2.4 cv=K4IS2SWI c=1 sm=1 tr=0 ts=69fc4756 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=sFoG9ZVZl0XijMoWAhsA:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 impostorscore=0 phishscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070078
X-Rspamd-Queue-Id: 8FD684E4790
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106284-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,perex.cz,suse.com,oss.qualcomm.com,machinesoul.in,fairphone.com,proton.me,lists.sr.ht,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 5/7/26 4:16 AM, Mark Brown wrote:
> On Wed, May 06, 2026 at 10:46:33PM -0300, Val Packett wrote:
>> On 5/6/26 9:02 PM, Mark Brown wrote:
> 
>>> Please send cover letters for your serieses, it helps tooling.  Please
>>> also supply inter version changelogs.
> 
>> ummm:
> 
>> https://lore.kernel.org/all/20260506204142.659778-1-val@packett.cool/
> 
>> I even Cc'd all(?) the lists, as usual.. Oh, sorry- not stable@ I guess.
> 
> Nor me, if the mail doesn't end up in my inbox then I'm going to have no
> idea that it exists.  You need to not only write a cover letter, but
> also send it to the relevant maintainers just like the patches.

(which the b4 tool will do for you)

https://b4.docs.kernel.org/

Konrad

