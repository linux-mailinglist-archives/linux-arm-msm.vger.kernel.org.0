Return-Path: <linux-arm-msm+bounces-103388-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8LKIBtTO4GkkmQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103388-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 13:58:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FCD240DB49
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 13:58:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3A4343037657
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 11:58:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B47AF3AEF34;
	Thu, 16 Apr 2026 11:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h8X9yRhA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AV3Fkv+f"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DB003A450C
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 11:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776340678; cv=none; b=k9kZ9H/bDpJA+4adFScGEoeNTIw33Bat1jFG7fAOc2KKruVY3ie1DK9QifnNQnWfvgmcgiVmPJQ16snYrasiRL70MCxT5lHVqWSTC4AcDA96Fh2S+CTR9p7LktaavDK/itJ34VyId++a+kwYqG9GqULvGCSZnlhsQPjwfF9Jlv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776340678; c=relaxed/simple;
	bh=2D98nQHSqEFRJlL7St+tNzQJ/s9VFno3rk5REp8EmWU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rfzcD5QgGTqFROFi0LgItSi1k/RTk1u94c94D2YEo6dDIm9IwY6ibFi04VDxxi5//pcYBWOGlTCLA1+07TedEJm3fl7nb3EEEEHwTjS2dwKm1DXRJhcr4fZG5tiGSscXCEchzYbEqK4TrGD+u8oAMqpBabpOGl3nr7dJqQ4EP6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h8X9yRhA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AV3Fkv+f; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63G8xqOP4125469
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 11:57:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AhcM77xlh2TTAbjpbAcgrTr/3hSLsHGWppej/lGE4oY=; b=h8X9yRhAhcpWwcvH
	LZiT2XyVvxY1wphmBgR0jhM1qd1wzCgZoTU8YQk5a5zQGXOumBdIWJO9SDGXDZaG
	DLfwsCw+HnEwog3JrGC+dXjgbvaI8iV/rCQHrVF15KOAHbUBGe4K29QIMs+zl7lk
	bD8kpnVyXS53UQQeJZiSPLklE/8hDamAT1Q1kGByIP1zrE043WA1obrkNPg4Yjij
	wv79gOqftle0eJIfQxwp1yERPlQarjkuSHLPU7aozstYodVVQC8h1wDC0aJ08ZBG
	mMR8J8qYarVgfFzsGR+sFucmfIG4XhV8GPAIKwmSt5uFFH5m4nZv19+zKFREdr+d
	LYKFow==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4djvrf8jvs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 11:57:56 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b4654f9bb6so48644055ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 04:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776340675; x=1776945475; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AhcM77xlh2TTAbjpbAcgrTr/3hSLsHGWppej/lGE4oY=;
        b=AV3Fkv+fY7w+m2bNGhlnxh/cPu6fLnbSKCQgecyty8MZLZ7H5Ko/2vWa6vD1nZlmqX
         xb0BbEvcMhoSsooGbAkEYGutIwsdn0zLB+ncmVc70u/QNGbAiKgsNtYpc1TdrTlVbLHj
         dRR7mzT5JrBb3rQEOo19WR1K/XE2l0uklR4SABg29/x+lYwav8s6yLC3m7VG9nx0/qCm
         xB+eZdUuZrkfdXDTBL1nD9g5qbfFlYU5Opbq2c9eZ60JpcN2cL4gOBIRfrE4yTwC51er
         l5IMJx9oNfnriJLxNXot31cgyXBpe36OFcZgQvMwATFlFZb5bY5lkphmRTfZYzPGJdEf
         Wjhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776340675; x=1776945475;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AhcM77xlh2TTAbjpbAcgrTr/3hSLsHGWppej/lGE4oY=;
        b=IP5T1CxEee3twzKu8RVsQQ5/nOxhVWlq2StZhfU9A/VoTqD6oDXiqUKg/k22sRz0N0
         trZAvLjZ+14T2jemfEqJROlslukjE0xnh1kFiOzaWsez92rn4moaz87NLBKXWxa/RWfV
         Wf+5L6Rf1hqZFgWqQgo0wec9k+rTB2yyfRHP2G52i8+1VukLq+BqUSGE0mHaUjXohHSP
         EH/+XaGgIKHpbGh6nIOWzcOFuoFP1ai5fGHF4nkHf9xsVA/9iM4HPsluPUN1uiYvMlel
         oBSuAQjr8HMNpGxr7f6iSgBZ8azxj2LktEOzDvomLvP/Rhj2BsUbxgSH8h1Mxch2GlaB
         ZMmg==
X-Forwarded-Encrypted: i=1; AFNElJ+5nn/MlsFnxyfY5y0TjK1gPBQUg9hVTlqUmstaU2q/buXs3Zoe/2vuCDo6hETTVZYrBAI0SnNyImmoFHPc@vger.kernel.org
X-Gm-Message-State: AOJu0YwZUfPD9OV5pIA29J5BQdsRDbnPCzKkLj+yfkJ/qIcZx9SWGIcn
	X4ZaAhRX4tgDFIShp9MShu1e2HxPESkOQ4sz2QiELKLokSWQGISzCyqak8w62CANuxVTse8wIux
	6C1VZmcII3DQ21+ofhcz56RPxhdKmvgwAMHvU+RgG6WF6ohuSoGqP8RAxiB/PvmvqVo3K
X-Gm-Gg: AeBDievQBaWNz/N1d+gqdnSSv5nH5CvQfrfgxXXyuCFSoCjXK8yqAYgkU7oZVmwigVS
	EWJbjmRtQ+r0p1StSMU0Rhp5D3AD7mXA+wxXNm19IKxVlvwov75FMkgTSpmYD27CRYkVvPhCg/O
	SLi4uMJG3Up5ED5jTcfbeBEfKy/5cZt9QRGGED3nRY/oPcuVuWCElzzUdIG8iqIWfYz8VwYVaH8
	VCoz5spdjesc8xgOYgPbtbRuiOro4P2xIXP8XP4eesTdT3ZE82s9yhEUQfO0ppQ7hsbMYMF6jAh
	bIX8HtS10RyGBmxqulEBhWRn9UbC/pe+gUCJbQOeFZ+y0yEz+PXthDoJdhtvURX+BVbVmCQeXVQ
	6cdNGYYKFIAAwj/lZOnxRGqJI9IufOoKXJEm1N8nA/RrxQFBJeQ==
X-Received: by 2002:a17:902:7001:b0:2b2:4e5c:69a9 with SMTP id d9443c01a7336-2b2d59411a0mr170402595ad.5.1776340675220;
        Thu, 16 Apr 2026 04:57:55 -0700 (PDT)
X-Received: by 2002:a17:902:7001:b0:2b2:4e5c:69a9 with SMTP id d9443c01a7336-2b2d59411a0mr170402405ad.5.1776340674727;
        Thu, 16 Apr 2026 04:57:54 -0700 (PDT)
Received: from [10.219.49.106] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b47826e11fsm71025905ad.44.2026.04.16.04.57.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2026 04:57:54 -0700 (PDT)
Message-ID: <bc1e2efa-a77c-4f2d-88c5-8d56b8c7ca31@oss.qualcomm.com>
Date: Thu, 16 Apr 2026 17:27:50 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] ASoC: codecs: lpass-wsa-macro: Switch to PM clock
 framework for runtime PM
To: Mark Brown <broonie@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        srinivas.kandagatla@oss.qualcomm.com
References: <20260413121824.375473-1-ajay.nandam@oss.qualcomm.com>
 <20260413121824.375473-2-ajay.nandam@oss.qualcomm.com>
 <05ec7d33-1dd5-4e67-9c88-03e39e02c39a@sirena.org.uk>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <05ec7d33-1dd5-4e67-9c88-03e39e02c39a@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 3aGjg2fLtF7w9xtnoH8HNkqNBGw6iUma
X-Proofpoint-ORIG-GUID: 3aGjg2fLtF7w9xtnoH8HNkqNBGw6iUma
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE2MDExMyBTYWx0ZWRfX3h6QrQRvt8Mo
 +Mqb3X7qNl/ym6Wc1S+kTg1LSh+Rw1rrmzUgQR/GfjWF/KQt/ZDyk8viM8U9Y50PIOhVC8JAMMb
 Ev8PvUGosmO8B7Sy0IwcEEddTIVUsXgqZ3oytc5J0JzfoZKUw9TYQfGuxM1I1B2j1KyXOvDomvE
 K3PiBbEr0/Ivxcz3nGLEdgC0kfz5BxcgEm36I7DIW37wONciKWGjp6TBfsOnAXJBSEFvzBtla+2
 lntP4bJVqJGdzPl9LXupW1/ocmkGj8wtKBvz535rigxLLsV4m5z6OScLVMlUOQvijiIuLFJiCAW
 HHoFuL066bqWb1TGYBzcM1u8Rw5RCWY3T5YTnEW+NM2iIJZGywozEttmA1R3VvERfrfPVwkAVMw
 WfPj0ulmxrB0e7o7ss7McNWF99z+K/IDKTF06PukD3idou/dgdjnws2Iy8oOJZuZzSdLZm/jDKs
 9jluZSG8n+/5DhdNLvw==
X-Authority-Analysis: v=2.4 cv=YtE/gYYX c=1 sm=1 tr=0 ts=69e0cec4 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=u64-0Fqa_K30FgdVMnMA:9 a=QEXdDO2ut3YA:10 a=uv9OGK0VPFgA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 adultscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604160113
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,perex.cz,suse.com,vger.kernel.org,oss.qualcomm.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103388-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ajay.nandam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7FCD240DB49
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/14/2026 5:32 PM, Mark Brown wrote:
> On Mon, Apr 13, 2026 at 05:48:22PM +0530, Ajay Kumar Nandam wrote:
> 
>> @@ -2868,34 +2846,12 @@ static int wsa_macro_runtime_resume(struct device *dev)
> 
>> +	ret = pm_clk_resume(dev);
>> +	if (ret)
>> +		return ret;
>>   
>> -	return ret;
>> +	return regcache_sync(wsa->regmap);
>>   }
> 
> This doesn't unwind the clock resume of the regcache sync fails.

ACK, will correct on the next version.

Thanks
Ajay Kumar Nandam


