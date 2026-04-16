Return-Path: <linux-arm-msm+bounces-103352-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oJFCIoig4GlukQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103352-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 10:40:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A92240BB52
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 10:40:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8B34C30128EA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 08:36:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A02D381AF1;
	Thu, 16 Apr 2026 08:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dmX+Ayj8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M0gx3v4V"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A56A3921FF
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 08:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776328601; cv=none; b=B2mA3JRFvy8LKSRqhx9oHzp+xZQYVGQAjT40nDMJ4olUxj1DFMQ28/YP8Mj3mipg5G8K0IWbywFODdCInVHl6wRZRmaf4Ih9diI0Hjb0wemlFZMh0rV/zPtt71SFMgCOWDeBD8PuVGtp1PcAfocyjzQUlRpf9O3lxH0QxJvTzw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776328601; c=relaxed/simple;
	bh=m1eKWV1XbG9JkAQSDkCWbRAmj+B9hXNU+brDRz2uqf4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rDM/C/tMjz5t2EglIUrEAGEaCDwIWURAQDcgS1cebynPCpiddal/+Iw3nR43BKRoud59+gKgliBPNEhCPiHdKNMY6y7m8VgbsxaUi0pwGn6uSsGgun6zAcBpdCzGdyGm95s4KmmLgny4YCZ8p0Gfy7TbAyP8D795dCNrfFQcELI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dmX+Ayj8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M0gx3v4V; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63G8CTlE2576006
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 08:36:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	31kBwLM1kadgQ+2H7g+1iUE6Ek2xahsyyvsPyfifIvE=; b=dmX+Ayj8y86knZ3m
	jM3PG1O3nfaHUU7u3bDEfm45YJFmx7ywFo1k49zYUl+qU90gX4GH4apc28p2rylq
	krOCIqQmW53GSr7SsXg2aMWQfxPjH/Jl37qPMLMj1SwK5tHE1ULXlJ3LnWyLSjHc
	CO95U8BNA97gOjRUBpdP7ADJnyBabQdqXCnTZbI7WJhopgqphm0+fb1vvN5z3KSO
	sr3jVsorw/pZiz74bvyD99FccTkTbWSgrYha0lVpp+lOqXUYEZawN/eGVSVz9CNE
	wqConRzMGbs+2TGWyWa5Nv26GkM3+gNMTOlHTSJMEfm8JpETcdHGA9hLk4FGIdR9
	YUIKog==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4djv27g4uw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 08:36:38 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50d9d52ad9aso97789501cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 01:36:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776328598; x=1776933398; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=31kBwLM1kadgQ+2H7g+1iUE6Ek2xahsyyvsPyfifIvE=;
        b=M0gx3v4VayKEMoa8obRLzcAGvXQCfuMoLe6gzm1ySbBCMSKeE+oUZwGppxX2P/MShi
         cmPAcuz2wzw8fOVVCdwlIEgsfSzYKVnJEPFkZcJW0VHPYZWQISVUYSA2NI5m42xx918C
         UjlMoHodMUIP8BR+/FJf9IzgmNG13T8MnDexwNnj4BUjEHp2koQ6DTJxDW1cevT7edWa
         J6XT663kVH8UypwFzkME033244wtiFL9ZzLNlFurMabsL9Su1v95uJIcPysFjmuSiBG6
         OzccibY6Y9dxxSHcwoDao91iTTbvFjCjiurP7Kha357E0AfQmpzdPEMHkGAVwHuBp1P3
         Fidg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776328598; x=1776933398;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=31kBwLM1kadgQ+2H7g+1iUE6Ek2xahsyyvsPyfifIvE=;
        b=nkyaJHLUlP1QxjbYGWR72QqdlJ/mAqDPA/W3lUBpgsDndPwbxYEOgugBb9mBM2ALnF
         gv7kuhJDtKJSdrkEyleNoYbPTv6su01x4ikB6TosOa8sBacpmPAk6oSmyx4gMmiHgefJ
         Ag76ZMwi2xIj8yRW/edTn8blddO33YZ3kzCrYISNE18DISq+R6F4NHcU3DAcj0G7xmZv
         q3p8yy0o5LL34QmMuwDVa/W4OXZe0gUqi+rfJcs1gaRnHOHeOXAjNQIebBAMwlusoFRA
         jFoWm6yJMX9muZNLcWOvvXMplr13ZmXdDjRzjZyqYEc8s14gbTZRtg+ZwUG8r4i/aq9R
         ZSWA==
X-Gm-Message-State: AOJu0Ywz9qm6WtTajoQL/djGiUxjOaf4esZz2Qyl6vWY1ONt1QiOz/3n
	FOs+ktTsXriIm9LboC1ksH7vXeP/3lfoGU/w5Ci7Qb98iRhv6iwmch6WvgG+455vy8Kj+Y+ySUM
	NgM7KLuRNmbslzTDFxJnxOjJMopfwD800hKXjhWrmwJLacd6ClW3tu5HX7oX83nwvWWyQ
X-Gm-Gg: AeBDiesrgKLwDVRAMKzODuBGvpmYtDar96QWg/Az5guRt2qK8j1AcQvUh345zDKNDj2
	db1ogKal3eVrRgsZFqKdnDIDvzXozBJIURZ7rbEhKQASKyoHRBjJoWdfbH+AmJwqiw0/kTZ6m6R
	8hFwI2gPIzPNXYWrOyptoyEHcZAWxc6xxmgClT2vW86avcBWRuAEM/prtdav5l15qqaIuL0kOEy
	b5VZbHeL/bDA5whCM4YO5oyHhZrJb8nSuFFUhXkI/uST5fQsUdFQ8i0jw1J123JJ7E92zIokU1g
	lCvSnJX7QvOEbxKIpRdkpK2g78KInad8YCemhTVK1sIRh1htq2he+PFNhbsO6MDsFGrQCZLSOEL
	74Ltr9LP5X//Cb7w0r08wA+DubXCLDvpatKXfMxGy200OU1Nr
X-Received: by 2002:a05:622a:6105:b0:50b:37a1:a012 with SMTP id d75a77b69052e-50dd5baa73emr342015701cf.41.1776328598269;
        Thu, 16 Apr 2026 01:36:38 -0700 (PDT)
X-Received: by 2002:a05:622a:6105:b0:50b:37a1:a012 with SMTP id d75a77b69052e-50dd5baa73emr342015571cf.41.1776328597844;
        Thu, 16 Apr 2026 01:36:37 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488f0e9a770sm39629705e9.19.2026.04.16.01.36.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2026 01:36:36 -0700 (PDT)
Message-ID: <a19a487a-a896-41fc-bc5b-1476e2b5dfbc@oss.qualcomm.com>
Date: Thu, 16 Apr 2026 10:36:35 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] clk: qcom: Add defaults for desired arm64 drivers
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260416-clk-qcom-defaults-v1-0-579e75c4cfe5@oss.qualcomm.com>
 <20260416-clk-qcom-defaults-v1-3-579e75c4cfe5@oss.qualcomm.com>
 <357baf04-44ed-4d79-896e-16b7063fbbee@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <357baf04-44ed-4d79-896e-16b7063fbbee@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=PJQ/P/qC c=1 sm=1 tr=0 ts=69e09f97 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=h4EKaKpltBf2sQIMoYwA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: d6t43BdBh84xyi4PUa7SbqWphp8U1lWE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE2MDA4MCBTYWx0ZWRfX0o/ovt6zmV8Y
 K2qhwaIz3o2N5WHVAkzLw9LJJ3JCkReSX29I0w3SAxA0B2TCuAxfAurxMcmjRVgEaabA8H8oU68
 AfOYemdAfM5jFQoX5P0RODAfCgRen3pj+N3m062QWs1XUIfibhHnLq1vanUQPCpopOgNL9F+kct
 kqbVVuuCijgBZ/9qeN3C4cASihPA/Bfqz/+IFrQrhC+kHOoCI4GCaYjq7UqH1mSrzcoGuLcBLb4
 44epRkE2dLUEjfMxDggtcbt2Rg+Npvz8cx+5doiC71iLuRrVvyS4XA1EE9rxB6pWa9jr+8FfKdm
 dos3QwIgpIKDpyG1azsYoP+tOFknXM4aqr+CBN/QHNCUq+g0cAGObswl6bkx5dGEfeJaKgAIKhE
 79ZTEvYu221K5R6pyh/+dtEYQbLto3YkQ6f4aHvRT69bqG6usazHozcYHTWIfUOSW6vAuaaFp+Y
 cJlatCbtRGo78t5IysQ==
X-Proofpoint-ORIG-GUID: d6t43BdBh84xyi4PUa7SbqWphp8U1lWE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_02,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0 phishscore=0
 impostorscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604160080
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-103352-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_SEVEN(0.00)[7];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN_FAIL(0.00)[114.105.105.172.asn.rspamd.com:server fail];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid]
X-Rspamd-Queue-Id: 2A92240BB52
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 16/04/2026 10:30, Konrad Dybcio wrote:
> On 4/16/26 10:10 AM, Krzysztof Kozlowski wrote:
>> Clock controller drivers are essential for booting up SoCs and are not
>> really optional for a given platform.  Kernel should not ask users
>> choice of drivers when that choice is obvious and known to the
>> developers that answer should be 'yes' or 'module'.
>>
>> Enable drivers for upstreamed or being upstreamed SoCs, which are not
>> yed enabled in defconfig: Glymur, Nord, SC7180, SC8180X, SC8280XP,
>> SC7280, QDU1000, SM4450, SM7150, SM8150, SM8450, SM6125, SM6375.  Note
>> that main GCC clock controller drivers are usually already enabled for
>> these.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>>  	tristate "Nord Global Clock Controller"
>>  	depends on ARM64 || COMPILE_TEST
>>  	select QCOM_GDSC
>> +	default ARCH_QCOM
>>  	help
>>  	  Support for the global clock controller on Nord devices.
>>  	  Say Y if you want to use peripheral devices such as UART,
> 
> So Nord GCC is "desired", but Kaanapali GCC is "important"? ;)

The difference is only what was already in defconfig thus which change
has impact on autoconf.h.

There is no upstream user of Nord GCC, thus I would not call it
important yet. I predict there will be such user, thus it is desired
just like every new SoC.

> 
> In any case, as far as I'm concerned patches 2 and 3 could be one

Much easier to test impact on autoconf and resulted image when changes
supposedly transparent are really separate.

> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Best regards,
Krzysztof

