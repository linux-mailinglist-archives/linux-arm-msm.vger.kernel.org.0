Return-Path: <linux-arm-msm+bounces-113203-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id S48QHvMQMGogMwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113203-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 16:49:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 14946687587
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 16:49:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=aROvyvhH;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=DGyf2VVi;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113203-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113203-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E990F304C7D5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 14:44:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA87E3FB046;
	Mon, 15 Jun 2026 14:44:43 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FAC53F8238
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 14:44:42 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781534683; cv=none; b=E3zaGqaUF6XFdRnsJt3j2gFeqORWrNpfbA0EwHl2lKvvuZVS2RI9R8GMuwu/QuqzAOoB93+xTuHdxAal4O2jO4jxdo81RygJ8g4ltLFQinNLDsz1loZ4FYG6igo8diB6putiBX7RA9EO53dxihZaZ44fY1wEeKSubIrSpHgETmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781534683; c=relaxed/simple;
	bh=wVczAE4BvCr1c1Rw732n0oj3annxMP38/RrvE0NcFkU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Opn+p+oTc1SJHzW0uzNhvOVh44p6Zd5S0GKYmEY7xB1IR6NAK1Yn+azOHmCKiNcQlp1Lala49eJKz9O301GgwzTRbam15WIZ4cgTbbqAhmPPUhqHjdHWzg06vcgmzT+jIn1s+kck46+oQJpn6Gi8Ux+bdxdXoQ/zXqvEPwMKzKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aROvyvhH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DGyf2VVi; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FEYSrj857765
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 14:44:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xJJWeCn0xRFEnOpJ5bzTkC3VlDqzl5JZmrfiMpAiPkc=; b=aROvyvhH+/QCNVQG
	moNQovKnv5N6axedtHmISUAwJ6CZxHo6rI/6f9KxQnc+Y/cI4KKbe6YPsM7D89oU
	FWK6PkDu8jNt0/xguAZbsYDtOgtwOB2PXAXKFE0l27sDjdkwagHUN7PegiiPVHq7
	in3QXDIVemj2+7SpJHlIsDFaEYdNXbfXooCzr/MysCMoN8KL6FS2MUzkdB5Dpnnd
	Q6UGf3xEZYPFmioh/rMqu1sBA0ycwVqBOuMpF9D5VRROBZxkCcXySIZkT9JbnvBr
	v9OKjWdhnXm2EL7w6T6d6wgxgHBSLE6nilMGnCn5SaTbA0Cn4gzGbtcah7Z7Tmwd
	SXmZWA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4etd2c9qrh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 14:44:41 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51780e3ca44so4502301cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 07:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781534681; x=1782139481; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xJJWeCn0xRFEnOpJ5bzTkC3VlDqzl5JZmrfiMpAiPkc=;
        b=DGyf2VViXRaHwm2o8k1Dzx16LBeK8KzZ6wCUFxFoIyTDpXCE2HhkwFVuk/7LPm8btR
         YrMxrpajA6kjvjEWVUcH+NeMwVWxWSIfrf4kZKc/3JE68ltDhX5OArAY5jp8xHM7c7Nv
         TQy4R7/ZQvwqh0Bm0WOjYtqipMLTMW08pkJ6aGGVUX9Pg0She4J8of4tnlr2m4g42B3p
         r+WyF2qdvWsAofMa4cH5alYGBNMmri96NeOrJztRS+NaAH/P67OpNyYlcv3EWPuQYmeQ
         tcDhbQAKuK6Kxxq2L+rofLxzBVAm6DTnGmjIUjmShCYbi1gNzpkeVRch6QCQDqBe5hXf
         cByA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781534681; x=1782139481;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xJJWeCn0xRFEnOpJ5bzTkC3VlDqzl5JZmrfiMpAiPkc=;
        b=gB8aaZbUuQHnTaJzsg27Kqr0o8ObwOSC0UiaKCEIMDJxqez0bp1GYVj8PvNML2byUE
         rAACWSEVA6l8F0KyoOW8u1bERX0zhQKH5cVbrihbD9e6MdGf7eTzV/P/8q4A/lsRhXwP
         WUJ3RTg/kYol8fGIS6LRlZNsiZF9lFYh/Po/RSi+ZDDnYdrPxWfgqAE6sa8cnXLt8ilg
         78nyTGZpupFCVAxl9EY3q2kngX6JwHD3rC1U/T8YK1z4c2883/BwpUVQV2lqcoD/m9nT
         o41y/5H9Dhx0mwn3glGKplRCPBgxtzdiCDrWs97g9rXzsjgn7SWB0lKjS2ca8hKmbI4c
         wGNA==
X-Forwarded-Encrypted: i=1; AFNElJ8Xf0z3w6RoH7h7MxECQHS6cR/0oHI21zAiDr8/cDjcYfIFJU+7NlwbBFScYYbzFevvTfLn+lWyw+WCSkJZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4CvpsX3HlLZ6Ymp5W2nYd/Uqd/qTR48zORjK1Vo73dtX1N/aE
	pbILxHiMgo0LqLp/wseSvQoHbcS6xTZFg64k0VVXfLvShM7iMywpFtYet1b/TV+mDel6bDlfh+q
	q0ldbsZL+lOVygCw4mxJtB8khBoh2DWxO2skUYAe2GLzyh0Qn+6yIZpSOznsldwo8ZdC2
X-Gm-Gg: Acq92OGdbX68bnpzzhiE6EyjLgvuldPs7Om/wifB5N97nRSvgHmI0N1OepWio7I52uJ
	/wcZTmQfW5+ubeqbGQvw918hrUR3nAQjhPLl9NfEytK+Uwc6faaZZhNqqKdyNzLz+yn1ALNammo
	2P4jlgnPe5SUeorXjZGSVTg0bHg45AIN5EXohz0vI7RZPIc462AniPgxPafKdmCqh4TWQ6BWiMS
	ua7BcS4f5cR+x6szlkhJXFK6ojZa9hnB8yXP5yOHq4R9D++cmoFimelec9UybrMcEb5QvRaRcDM
	IbIlMABkkb8SyYoEmrFr7yhfxypjz24/skCTqpc0SLFC30T0tFFmQ+xADpoVdcEI01fr2LMbHPs
	ggoaMLery1qeZ+ooMLcBz8fMdN0jXwN9fI+6Mj8cEQUTTSA==
X-Received: by 2002:ac8:5e06:0:b0:50d:a92e:fead with SMTP id d75a77b69052e-517fe50c57dmr138011311cf.3.1781534680848;
        Mon, 15 Jun 2026 07:44:40 -0700 (PDT)
X-Received: by 2002:ac8:5e06:0:b0:50d:a92e:fead with SMTP id d75a77b69052e-517fe50c57dmr138010891cf.3.1781534680347;
        Mon, 15 Jun 2026 07:44:40 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb910f89bsm500939966b.61.2026.06.15.07.44.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jun 2026 07:44:39 -0700 (PDT)
Message-ID: <294012ad-1030-4c5f-8910-30ae4962b65a@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 16:44:36 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/12] clk: qcom: gcc-mdm9607: Drop incorrect
 apss_tcu_clk_src
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260609-qcom-clk-mdm9607-fixes-v1-0-5e9717faf842@linaro.org>
 <20260609-qcom-clk-mdm9607-fixes-v1-7-5e9717faf842@linaro.org>
 <f55526ad-ecd2-47b2-8b8f-5aec429bc1c0@oss.qualcomm.com>
 <ailwFPgY13_7dZ-C@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <ailwFPgY13_7dZ-C@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDE1NSBTYWx0ZWRfX8rBcjDCoD6nP
 jtqqh0AY/eg5QGmbJ2aslscAGt6cBmKOqizp3LxyunPR+QiuiQKsflP2hwuqtfbTrZHtUrTQdVo
 mc2XIwk/AXM8l0QjDEbTqwW+B9dVUYYbBiXlTPpIJSn0L0rWfFjBBXQaM9AggFqr0qHqjeQCnAl
 Y6JX69QqxTwvLAepMpWaGi0pjcX4XKjoHh6n7FaNSrJSWyfSDwdiIOcmEOjpfXFz9/QpPZZH2Ld
 4JutEPbQlPSGRk7CpDReERdPA6EgQPAeCLN7GMAMFpXOBQczVc7o9Xt1j9wLqruJzIblBfQ6loH
 8q5HEbOnJQc4jNVGfvYx1FRdiB8qqN5KX7+fVQB38L5yXnnpy88f32DWYjikqsCCvihVDbfYI8Q
 nfsSpSBrrC9y+7+oGCYnIG/wiwGWef12v1z93Ii3VzQGwASg03y9u6F52eCXf80nnAnm4zqk9rQ
 2zAufGwSLSt6GBlFyEQ==
X-Proofpoint-ORIG-GUID: 6ZVG3r8ZEo7PDcpdbno7o__PAbNiTXQ9
X-Proofpoint-GUID: 6ZVG3r8ZEo7PDcpdbno7o__PAbNiTXQ9
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDE1NSBTYWx0ZWRfX752yNfNdmlje
 98ftXrdsceti7gLqskH/Bh6NiUnTkCNMtoPlOdV8CaVv0gz8uJKG6GqDAYryPirMBe5UiKN9jsa
 O8HjxGL2UDm3JWtpJfkB5S8wjl04oKo=
X-Authority-Analysis: v=2.4 cv=MsRiLWae c=1 sm=1 tr=0 ts=6a300fd9 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=j8Cu_9a8AAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Ck7eFbc12gNnvPpTPzYA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22 a=A2jcf3dkIZPIRbEE90CI:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_03,2026-06-15_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150155
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113203-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:stephan.gerhold@linaro.org,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:djakov@kernel.org,m:shengchao.guo@oss.qualcomm.com,m:bryan.odonoghue@linaro.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:taniya.das@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,gerhold.net:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 14946687587

On 6/10/26 4:09 PM, Stephan Gerhold wrote:
> On Wed, Jun 10, 2026 at 03:50:11PM +0200, Konrad Dybcio wrote:
>> On 6/9/26 4:14 PM, Stephan Gerhold wrote:
>>> From: Stephan Gerhold <stephan@gerhold.net>
>>>
>>> This clock does not seem to exist on MDM9607. Reading/writing the registers
>>> always results in 0 or crashes. The math in the frequency table is also
>>> broken. GPLL2 on MDM9607 runs at 480 MHz, so:
>>>
>>>  - F(155000000, P_GPLL2, 6, 0, 0), // 480 MHz/6 = 80 MHz, not 155 MHz
>>>  - F(310000000, P_GPLL2, 3, 0, 0), // 480 MHz/3 = 160 MHz, not 310 MHz
>>>
>>> Presumably, this definition was mistakenly copied as-is from gcc-msm8916
>>> (which uses 930 MHz for GPLL2). There are no branch consumers of this root
>>> clock inside gcc-mdm9607 (notably, gcc_apss_tcu_clk has bimc_ddr_clk_src as
>>> parent instead of this clock), so we can just drop it.
>>>
>>> Cc: stable@vger.kernel.org
>>> Fixes: 48b7253264ea ("clk: qcom: Add MDM9607 GCC driver")
>>> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
>>> ---
>>
>> It does, CMD_RCGR @ 0x37000
>>
>> Interestingly, there's also an SMMU instance.. although downstream doesn't
>> seem bothered with it
>>
> 
> Thanks for checking, but that still doesn't give us enough to work with
> it. In particular:
> 
>  - What are the frequency tables? Which parents exist with which IDs?
>  - What is the hid_width?
>  - Where do we hook it up to some children?
> 
> The way it is right now it's definitely wrong. I don't think we'll need
> it so removing it like this patch is probably the easiest thing to do...
> 
> Thanks,
> Stephan
> 
> PS: This platform has the weird TZ-managed SMMU (like MSM8916), so there
> isn't much you can do with it from Linux. Unless you are running TF-A,
> then you can describe it as "arm,mmu-500" and use it for everything
> pretty much exactly like you would normally expect. But you still don't
> need to do anything with this clock.

Alright then, let's just get rid of it

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

