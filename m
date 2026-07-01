Return-Path: <linux-arm-msm+bounces-115648-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5ZfkBQDuRGqY3QoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115648-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 12:37:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 768366EC39D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 12:37:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=FWxfNf3L;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=irQfrHWB;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115648-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115648-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E424E300B9F5
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2026 10:37:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2B48421F10;
	Wed,  1 Jul 2026 10:37:48 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87E1B3F23B5
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Jul 2026 10:37:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782902268; cv=none; b=dOfaDqMPwmzE6ZUjEBsZ/kUiWOHNKeoxGppjgdQO1caEDQIz9YaJMarug762t/xLvbo/ap2YnN4jz8Qw0x1G+r1rlXm92Mr4NVCH+oXXCiTVq3n2tvEHluwADbuq7nJ6Lrx3Cfm/FnCCf3KAMFt8nAZ2GnRcCB8Rxhtx16XJFlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782902268; c=relaxed/simple;
	bh=ejwOhhwHvXS9SS9nYbv3+/nrz7n/7JNkl1mvYN4B3mU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GZrKd+4xrOUUk/wIvJpPWJDy1yMZSixI2j7sltc1etsdHnUgPdkdME6OUpigKMilbECQPeJSqtxCKXWPO570qyHsyStahPYNq49tU4GV0yXmH+sIQC7j24q8slDZR5Wm3EOQ4R/z8q81QTh/8+zLYj8E3T7nagU4ub2ysiUJ4Kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FWxfNf3L; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=irQfrHWB; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661A8Uh3643978
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Jul 2026 10:37:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9ExZyuTwYEfnQAUZdIX348PgWW1Gmm5HzulGwFsDv+I=; b=FWxfNf3LAjBw/FfG
	/sLpiWRxB9zLupTXHD+TCnxI5JOrbWHgiqfmgXyiLax9oTr2bP9mou9PjPiMuYAV
	/0BAfKdhsMWPol26BfMcMlWcRo7dt1KFR/RJp2X7F4Q1rI9sJGWU0DJ7DjuLpjLg
	jgzUk71pRYks3TDWkZbXheW0TU2/qRN+gOoz9FtoQbEHJxDbZ+Ygav1t6Y5R2i/d
	5id+oWTfDQ/phSe70fHEpFkxnLOu0wh1u8CdvTbxENhQTMuNCrLl0pFGWgyvcaBU
	7lNonCQHypbV3TmCG2ENqgNpY1mEqNfZQR1ZHuYeMtk5NUD+NSI/NQvPzk406etd
	x+dodQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4hbd4b8v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 10:37:46 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c298a1b20so288431cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 03:37:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782902266; x=1783507066; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9ExZyuTwYEfnQAUZdIX348PgWW1Gmm5HzulGwFsDv+I=;
        b=irQfrHWBtO/Z7JIYhVZP21YdVVR4Qxh19hJ516Twp2mjzvjWwVgvZsqA7y2tfZWAXC
         sR4OigAmUyOiF9S4xvuUUtZT0xI9k0NDa5g53G+tfEBnCM0afo2WjU1mCbLmcOBaPXCg
         Bk+LH9OfqYe8ubaT0Uhzvb6biLd76qj8EjjmNl5EiA+2rudIUaaRhf7XY9XnKsNxVvnn
         xSPoSjU4DxlQ0VEBywYMtRvBGdpPQTd6fZirLiR2NeVjll98USovRoGF2tlbLAGhwyER
         cFfubIS5Lo+1QAclZuIbeF961SzS424Lr9GRMyciwUCj/IPvnzFkleO7DailZ8Gfir2x
         t6Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782902266; x=1783507066;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9ExZyuTwYEfnQAUZdIX348PgWW1Gmm5HzulGwFsDv+I=;
        b=gAuGLBfLWeww6P6QjFaMUyl/8ooujzlcg6Os/bw9ZjmrI/Q3tPnhQQXQEea42TT6eC
         UUVunl7a2Kb9FtfvU+3qCEgm8r8hv0xWVR1LpHbsCnqLkMdHTDwHHp9Cnjj1BD4y8Ncs
         GqtMWkE0UOsIyrvzwV/h+KgfoLSMIbCeug8sLZkGS5LTOAdr3Sm0v9DnOBx8Jmf1tzCN
         eKH1zJJEKMjlKnT+hmNWopBIfFW6x+7TmpTIBR0yW3cONPTSMhyfUTScF/O8QgIcl44R
         LcHt5TrlRYYwJVKJTlhG2i16dmpu8pgXaGevCpzvPl/7ndhHHVSXS/ZfDjdMmTrVT1oG
         Cr+Q==
X-Forwarded-Encrypted: i=1; AFNElJ//+B8gHpI7XAUy2daDu7jhhFFm+Z6lajbUEtN1aNX7J1KpAUE6flinNaAalVAVWude9AiaR+8Do8DaoxoP@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2RSv4eejGAc5JoDKFDGrAqKzimTsTFAFGfEKISbY4E8Cl3Jws
	QFiut8URZnp+PNuiFnNh8m4dQlTZWuzsVOW/LGMpgaUT6jnDJgc1LGTXKcHIV9HHzdmlbgxm+2Z
	urIPt8CVJhzIyhs3nekFd7x6Z3QoAh8hK2kjO22yhMFjKTmfIx0eh/EdA7xKhvOdHvzHg
X-Gm-Gg: AfdE7ck/QfqrVhvc3F/vZGi5QPCjDwKYAI3yD24qeNYXwn6YS7nBRwK4UaqDUjejwnw
	76+xi2Zv78wptqrtntCBvkWP3xUMQPf1qin1ZdamwHeQjqUFXGwByw8GpQzVHMJiDPcZRXDomfC
	kkvg9FPwh/7jbPjh9SqEN0lQZfs+20q8s76u+XBUr/xx+gfrBfc+nynidj6ZWg3xnR+K9qiDDCi
	nUb5J1+HKQdtt9+4tnrAuTwlMcRhX84Zg/5VXAj/xscienzOORRO073z8G/ijIflEFh214LAv1Z
	PFbh76E+MbtysYvfbibwQhv2Y1TML66GoWQhFO6g2vL3e80YDRyJJntQz1xEE3HCjxmw9czbKpV
	vDV3hzymg9W7eUsOchGjEZay/glQGvnmm44I=
X-Received: by 2002:a05:622a:14d1:b0:51c:a85:bf91 with SMTP id d75a77b69052e-51c26a76bc9mr7134671cf.3.1782902266016;
        Wed, 01 Jul 2026 03:37:46 -0700 (PDT)
X-Received: by 2002:a05:622a:14d1:b0:51c:a85:bf91 with SMTP id d75a77b69052e-51c26a76bc9mr7134521cf.3.1782902265603;
        Wed, 01 Jul 2026 03:37:45 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1288d6a400sm253530066b.20.2026.07.01.03.37.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2026 03:37:44 -0700 (PDT)
Message-ID: <fb5262dd-8593-4874-99ad-6190f952b7b1@oss.qualcomm.com>
Date: Wed, 1 Jul 2026 12:37:42 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: Return expected ENOMEM error on dynamic
 allocation failure
To: Dan Carpenter <error27@gmail.com>
Cc: Vladimir Zapolskiy <vz@kernel.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
References: <20260629162127.3910603-1-vz@kernel.org>
 <39032914-3a66-43d9-885f-55f5d60da047@oss.qualcomm.com>
 <akTldJur7GEgSkDD@stanley.mountain>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <akTldJur7GEgSkDD@stanley.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDExMCBTYWx0ZWRfX+SfLpUS5vdSY
 w8yCC/uupX9Cq80ihg4LbcQfXCciI3CgOmU10zm4CKA6CrZBFV9ItkBiHLe78uOGIGyVvjTK2qQ
 Iy/eRfZQW2Xp9qduOTD/kd+PCVOly/c=
X-Authority-Analysis: v=2.4 cv=MpJiLWae c=1 sm=1 tr=0 ts=6a44edfa cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ffUELUsPIbkk3n1AmDcA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: GIazQT69E0ohzJt7IFOfqi4oTa9Qno54
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDExMCBTYWx0ZWRfX3kHEO9L0lStC
 mU2D3AAg54vQAdKJuvPaUqWriJ4MAeyxPFV2tbd+BopoZDuB/Sy7PaDLnlLtjyf6XRgCWghGjz2
 i51EIPaWs1LHmvsduWWvjHZ43DfNcY83wCH7PtSZo3uAtPIYn8zr6VOVo7OxF3VSoNi6MnaaivM
 DuiGZbhwCRyGzeIH2VQgPILQYLb8Ec/pD0Sv8GWcMXEyb1ZN0z1WPOGHwWdFMy9be30I897YxCZ
 HuI3JR+x49e9712qmYIgpmG1ViOQ4fsFwwYpNcIX755RsG+FrhMpoSzQdHwZI0BkuEipx4LXNjZ
 VHcQLzHwusWhD5uu7CRfXOoGPyCRfsQ+tHxbJSKOVIeqpczg9q4Wb909/ai4iiUHwe+xujPGJXr
 gJwXIMYr5eC98j+Qk/xq54c1xBsxk8qbNTGFTcbJi+CPPfSW2MKsWLIJa0uEHbETm+xwW/6BuXk
 A6EcjrQcQ3bz4RPsOtw==
X-Proofpoint-GUID: GIazQT69E0ohzJt7IFOfqi4oTa9Qno54
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 phishscore=0 adultscore=0 malwarescore=0 bulkscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607010110
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115648-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:error27@gmail.com,m:vz@kernel.org,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 768366EC39D

On 7/1/26 12:01 PM, Dan Carpenter wrote:
> On Tue, Jun 30, 2026 at 10:50:13AM +0200, Konrad Dybcio wrote:
>> On 6/29/26 6:21 PM, Vladimir Zapolskiy wrote:
>>> If a dynamic memory allocation fails, the returned error code in clock
>>> controller driver probe functions on a few legacy platforms should be
>>> set to -ENOMEM instead of -EINVAL.
>>>
>>> Fixes: ee15faffef11 ("clk: qcom: common: Add API to register board clocks backwards compatibly")
>>> Signed-off-by: Vladimir Zapolskiy <vz@kernel.org>
>>> ---
>>
>> Hm, I'dve assumed that static checkers would be able to find this pattern
>>
>> +Dan do you still work on smatch nowadays? It doesn't seem to
>> catch this one, but I think it'd be valuable to look for this pattern
>> - AFAICS it only flags returning -1 instead of -ENOMEM but I can't
>> seem to trigger it with a manual edit to this file and the following
>> args:
>>
>> -p=kernel --pedantic --two-passes --assume-loops
>>
>>
>> For the patch
>>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> I'm re-working a bunch of Smatch internals right now.  I've
> fixed the -1 vs -ENOMEM warning, but it's affected by the re-work
> so it's going to be a while before it hits mainline.
> 
> I can create a warning for returning -EINVAL or other error
> codes instead of -ENOMEM.

Amazing, thank you!

Konrad

