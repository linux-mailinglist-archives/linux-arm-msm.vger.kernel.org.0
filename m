Return-Path: <linux-arm-msm+bounces-115698-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id EEwaNmQERWp15AoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115698-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 14:13:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 316DB6ED1A5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 14:13:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Klim+wlA;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Lm5NmY7u;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115698-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115698-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 51E513074B2E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2026 12:11:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AC4F43637D;
	Wed,  1 Jul 2026 12:11:43 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5899480DF3
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Jul 2026 12:11:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782907903; cv=none; b=KPsJkB940G8LUW5PowHe1atFCLb8TMfrqYv2m0gFMbmG5K2nfhYSbhL7DImjUmovFgerlPaGtRbrnMqrvFsu7R/Ntbn5DR4cSQ/9/ktRl2iwoCxFY87d4sUiDpTNwhhV6NRqyMScrHrlBfVFHfsqBaYUYgkFvTYqKuvcljJj7Ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782907903; c=relaxed/simple;
	bh=q19NDw1cfxlgfuBl5CY+fS/82JUPx7DJTsiKMBEL48k=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=H8zo10vrcCRIR9Kt/NzkDR2LoDLTjfKLUelzo9TkDOLLWVPJcpSjqQFV9U7AzNPK68fNTL0nll+VmGRVLNq9Hed67Euh+ZYSUIHPIQbVgF9RCxx1hBe5LRZWggh5RbID0HwrcOXMLTiBNln80ZT5eisl+V22ifNqL6uIrodsrHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Klim+wlA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Lm5NmY7u; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661A8WTP744296
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Jul 2026 12:11:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qM0Pbr7CZMBgBqjdkP4IS8M02Nun6iQQA+v/dbTvWHs=; b=Klim+wlAcMzN+LNs
	fZISLHfsFqNbIiqd1iEKvDsgLEQPpQzNfCtMwzH4xkv8Zp1+b87m8vZy6WUnsiFR
	LUujH8UXHMd15fNRBl8+tJQyzM5q/64naSHqe+DaszYYNITq0qjMTYXJE44uJxgj
	NpU3hma3Iafcr7rWux5KxHfnsdUdx/k4q0qE6rhAbkKDeMEoFJ3BXGN+exs+CClo
	bzneRn4EgMDBrwEmZhnWcKgjuco9WRXLEWQOGAm3UY/S6O4WRlz1vzG5yfm9szMT
	2g4nOhSm+6MQ327xJKHw/3whfw573aOtl2UTL5kwNEdOWqqGqT1bqjPF0fwt3nF5
	AIPwwA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4x0thd2m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 12:11:39 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8e8e40a8216so2101836d6.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 05:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782907899; x=1783512699; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qM0Pbr7CZMBgBqjdkP4IS8M02Nun6iQQA+v/dbTvWHs=;
        b=Lm5NmY7umtgfAtMsx6o+DltBMnDH7I6YcJ2tTzSr8se8O/OUJ2v6OrMx3dE6AAPm/q
         ytbWhVXUichEMb4oOER+wzL6Kq9K8vCesJN6riykkg3nqjcTH9SrDgBKlzwU2vCobHy3
         IBsSxily4+G5qLRw1E0DEZYtJOqpcLRsMnLrqkpkICr3kNc8vxHndwwtrlcAXO0ImP2C
         p5PYrRet0JudRr/S03iVIYne+nZpSCDiEv8yuLEr2JwI4xxV6Y6+Yuy3TxTcvMwUVUGt
         NBgCj185UL5gYfycLwBRpdSX/R8YL6uKdzDimLn+xJInJhLvo6CJw6yl8GrsL9KWi7LD
         9fXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782907899; x=1783512699;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qM0Pbr7CZMBgBqjdkP4IS8M02Nun6iQQA+v/dbTvWHs=;
        b=lPEQWn7APMZyN+rmfkeRnJTRJHM97VEWgcwN+YyIBz27N4mCxf0HMhKz5JjN6kKRCh
         boWu8q85M9Zefzfgg8WrOTDgMy/53yG167HSqNw1FRef5T0yXiVJZEq2DeX2sghfhAex
         X/c0KVvufu4q+3DVZSUVUd32yMpjPU9A33xW67tkquMb+cfLEpECYGI6R6nyuEfO+JZ+
         2TBW9kHhhQ2vvqbLBi5n7d6+gKnvJX4tyM7iauzCpyw0/54cUYs6/fR7T/dbzFe4mykA
         BRgp6Hx24DhAbtwhKoyfz/YvrlhcEX1ch/itX23ioR9EK/yaOYtaaiCjtFsmxL49bqJR
         D91w==
X-Forwarded-Encrypted: i=1; AHgh+RpQyoSPdZIaiOm1vZvkqzicH6zqMlL+ETaTwHI4qCX5Zliyv6BsgNhPBD+P49xIO8FZ52MylJUrsC28TIJn@vger.kernel.org
X-Gm-Message-State: AOJu0YwjlHPDLX2j7YlFuptAQ1RhEXScEfomrEUc/ExiTPxvd/bvb/Hq
	lJUvQaClyw+lS7Zhu0YDvhWc9z+xCRkSGlG0kFtxSQ8ChzutvsR5NWP2P4cgppDagV7Z0wNF4//
	+aMIugTCatP1pKDGuyZlitxwDJNRuIj8U3xBhYZekfcWWJm0czjNaRgRTO0o/UQbU12qr
X-Gm-Gg: AfdE7ckhy2PGMi4g2+wl5xx4+dBgR8r/KK7OeP9OzIs/qjznvZKi0YfWxFkMeakD8sf
	2WEICAtMmLruo4mYh8IrHyZ5O/cDI/eperuxWzT2lymmqHgeZhAFgAq41Hg2aspkG1tDfkzmqCN
	JtNavRoZo3h5aMrd6mcEljbsQJnV4xwsfq1fTJvvDJkZUTgtIvXnUUrapOwsDHp/Yu5T8KXMi+O
	UjeNupYDNEtR250GyCK2/llFvhwnmFGOVoh1KZFiveAnxJj0glv9ctqkaSOrmRafg6Tx0hAp3L4
	S20ndtHi/AQ/RB+IVM1sy7sYYMCN6xJXlch1IBjwu+OzcipwGUw2IlC/pa7+UuT3AIbTwMenOZ8
	Fp/N/5b/I4iK04lwVQuQL7hlm0H+1nUJ9ZN0=
X-Received: by 2002:a05:6214:2aa6:b0:8e9:f5a1:7704 with SMTP id 6a1803df08f44-8f3c8ffa689mr11211386d6.10.1782907898986;
        Wed, 01 Jul 2026 05:11:38 -0700 (PDT)
X-Received: by 2002:a05:6214:2aa6:b0:8e9:f5a1:7704 with SMTP id 6a1803df08f44-8f3c8ffa689mr11210826d6.10.1782907898293;
        Wed, 01 Jul 2026 05:11:38 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6987c98927csm2612885a12.30.2026.07.01.05.11.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2026 05:11:37 -0700 (PDT)
Message-ID: <e129178c-6079-4538-89a2-247185dd0ce7@oss.qualcomm.com>
Date: Wed, 1 Jul 2026 14:11:35 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] clk: qcom: hfpll: return lock timeout from enable
 paths
To: Antony Kurniawan Soemardi <linux@smankusors.com>,
        Pengpeng Hou <pengpeng@iscas.ac.cn>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Herman van Hazendonk <github.com@herrie.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260623060517.10889-1-pengpeng@iscas.ac.cn>
 <8e7a4cd1-ff17-4052-938b-5cb2ee8576f0@oss.qualcomm.com>
 <36f37fa0-94f3-498b-86ca-b431436750e1@smankusors.com>
 <198ad9ab-6e8e-4c67-afc2-01962ea12dde@oss.qualcomm.com>
 <5c374231-33dc-4082-95c1-1046286fbb13@smankusors.com>
 <89c53cb1-3804-4dfe-8d93-e27e31bc2254@oss.qualcomm.com>
 <42fa946b-43f7-4f8a-a349-f8509daab749@smankusors.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <42fa946b-43f7-4f8a-a349-f8509daab749@smankusors.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: l8Xuk1TiC8Nkg5ml9a-7nin0LkVxvm1j
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDEyOCBTYWx0ZWRfXwVQJW5VyKKuH
 RBpOPBMzs/DJKkRSSMqpHnePV0o0fA9hu08MJrg2/gMTOo7vketPck2L4uYAaIwlLKoMKLIt1/i
 rSf9S8mtlTZMpdCjloK0JW1BWBaBFJI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDEyOCBTYWx0ZWRfX5RjeCS1e0Itt
 jnIOX4jiynhtpGosJEPI+YZJ/FQ5nwiKTkfz3dHMhWkL3g2gif+7dr4u9r46PMqMdDIaZTfnYaH
 3jQ3JlVkkakkLnSi7y6TVWGvlbUSAUS90X8MD7X4Pf+rPTtJBQFLV1LlWn5lFu2k/k7nrjczcvL
 K7BYUUTYVB5q+82HdoVPZRkul4kDYpLcvZtBlUUmLf/GUcErtTbAGAUwa3M4PZktPGcVboEeEWR
 PknWneWCgbR3QBt5uh3na1ExG1xVyQ3vyrlmuTexD0V4xjOJXv6DTgJBnz2nizuzyswpgjX63AK
 KdScU/13boEWRF7OrbaH//ofT/OKifIizp24TK2x/9P9zpet6FzFdkXUpKHO3SJWYimRJ77tSAG
 YX7nsbFYyXsLjEnlu8b6nw0UVQ/kxe43YfecJGhk6fMtGuRcQ5SwijUIs8KxjFs7ZmgX4Y/rJ9S
 O1K/D6q3sKYCrFHadAg==
X-Authority-Analysis: v=2.4 cv=T5+8ifKQ c=1 sm=1 tr=0 ts=6a4503fb cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=Mx4pEHAkPCgqNRbZu6sA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: l8Xuk1TiC8Nkg5ml9a-7nin0LkVxvm1j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 bulkscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010128
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-115698-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:linux@smankusors.com,m:pengpeng@iscas.ac.cn,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:github.com@herrie.org,m:dmitry.baryshkov@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,iscas.ac.cn:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 316DB6ED1A5

On 6/29/26 5:14 PM, Antony Kurniawan Soemardi wrote:
> On 6/29/2026 4:15 PM, Konrad Dybcio wrote:
>> On 6/28/26 8:07 PM, Antony Kurniawan Soemardi wrote:
>>> On 6/24/2026 2:39 PM, Konrad Dybcio wrote:
>>>> On 6/24/26 3:57 AM, Antony Kurniawan Soemardi wrote:
>>>>> On 6/23/2026 4:43 PM, Konrad Dybcio wrote:
>>>>>> On 6/23/26 8:05 AM, Pengpeng Hou wrote:
>>>>>>> The HFPLL enable helper waits for the lock bit but ignores the
>>>>>>> regmap_read_poll_timeout() result. The polling condition is also
>>>>>>> inconsistent with clk_hfpll_init(), which treats the lock bit being set
>>>>>>> as the locked state.
>>>>>>>
>>>>>>> Wait for the lock bit to become set, return timeout errors from the
>>>>>>> helper, and propagate those errors through clk_hfpll_enable() and
>>>>>>> clk_hfpll_set_rate() instead of enabling the output unconditionally.
>>>>>>>
>>>>>>> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
>>>>>>> ---
>>>>>>
>>>>>> This looks good on the surface..
>>>>>>
>>>>>> +Herman, Anthony, Dmitry could you please give this a spin on 8x60?
>>>>>>
>>>>>> Konrad
>>>>>
>>>>> Just to clarify, this patch impacts cpufreq and gpufreq for Qualcomm
>>>>> Krait era, is that correct?
>>>>
>>>> Seems that way - cpu, L2, and GPU, maybe others
>>>
>>> nope, tested on Sony Xperia SP (MSM8960T), the phone hangs
>>
>> [...]
>>
>>> [    2.679716] L2 @ Undefined rate. Forcing new rate
>>
>> This seems odd. What's the reported rate there?
> 
> if you're asking clk_get_rate(clks[l2_mux]), it's 0 Hz.

Hm, are the parents registered?

I see:

p_data[0].fw_name = hfpll_name; // "hfpll_l2" lookup via clock-names
p_data[0].name = hfpll_name; // legacy global clk lookup for
			     // clk.name == 'hfpll_l2'	
			     // (registered in gcc-msm8960.c)

p_data[1].hw = hfpll_div; // sourced from "hfpllN"
p_data[2].hw = sec_mux; // sourced from "acpuN_aux"

There's a fw_devlink between kraitcc and gcc already, since you
specify all the clocks (minus hfpll_l2):

https://lore.kernel.org/linux-arm-msm/20260514-expressatt_cpufreq-v1-3-487fd2d78859@gmail.com/

so it must have probed beforehand (unless you disable fw_devlink?)

Can you do `cat /sys/kernel/debug/clk/clk_summary` on a running system?

Konrad

