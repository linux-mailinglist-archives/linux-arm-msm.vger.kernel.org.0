Return-Path: <linux-arm-msm+bounces-116167-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9+HkGelMR2rlVgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116167-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 07:47:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C87346FECF8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 07:47:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=aCVwt2JN;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Y2wDt4cj;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116167-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116167-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 10C45302FA3A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2026 05:47:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A07E35F60A;
	Fri,  3 Jul 2026 05:47:00 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67D0535DA5D
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2026 05:46:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783057620; cv=none; b=u4YNAnCX85c1pxeQe6Mn0NGs31ubTi3FJ1SIiJ42o8O6dW3qiQV96h8rDRF73Tk8ZcMuDPPJZQouPrJe5nMOUpRh2Zczh2hQ4y+EFHjnIj334G4xjlk5XDqVhFchzAGLTl6jDPVsXcbiuV1UUjmJVC/WlWb2vCOgYaSZ/x/TrXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783057620; c=relaxed/simple;
	bh=MYGsBp177SXwP1uNFA4C7z4gmBzw8qDgDnBpLP9X1zg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AyfyH0/+tYcg+emi1Vh6OYwGAzdTCl8X8Clvl87oHTb+zp7+jifQnwoLrgqgxWYIXz4dOBqKyJ1yolupASoL/kB00dy0An8g9vwxbxj4klkoQ54Jh+2GRl9Q/WKeSAJtujv7QhamcJSaVqxX6IEOE0r6tCBAcEp3XN0r0aDHB1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aCVwt2JN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y2wDt4cj; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66342UDK2828780
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Jul 2026 05:46:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DpH0aaqLIE2vdp1hKLWk2Yx9KYUV7VWpd2pe6X9GfNw=; b=aCVwt2JNrO6QpRZf
	gQUniY6xrTBYsW+Oqoy5qGDNd2ziX6qFUTEhxX81CfB+R5RRj6O5B/iSIJ3dy2yZ
	dhvSTpy2k4M3pJnoQtiJymB4+nV8dgjSYVcUo8kNVshE0xcn7o8QQw4P2gqRuu2+
	mVXcCSX5gsIpPtE/Mf6re9GEUmKJ5l7TLmvpPdR/gMkTVgHxPP4Gkum+4FWmQ8CQ
	+qemm5YwHAC5JTspgAp8NS4BN4vBHXOWy7iqWWTVmCh/u54oTcpHTf9eoLNCI3O7
	ySM/WaYyo6qovW/sIS1ZUvCouTPkynVzG3PDhh2igRBlpjn+rdwo0aar1zZrLSfA
	FZHsPg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f64b58s27-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 05:46:57 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-381120d6d62so467545a91.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 22:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783057617; x=1783662417; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DpH0aaqLIE2vdp1hKLWk2Yx9KYUV7VWpd2pe6X9GfNw=;
        b=Y2wDt4cj0lpQRhACxBCh+fgEDzndvtH2KRFKmKDv23ISpHDgYZkaqQBPxwn7uiLPY7
         xKqTTGapPItmfH8KtLiam5yTurr+O9+U0UauHwVOZwD5b8GavcvsA+LctW87fClcRx9O
         xAzltm3oBdxzcHK4WMFWeyebModwB3B0hiTi6mNN1HOqXvB50Is5J3FKMUIuj7BnaWZD
         SmM9N1ROOT4WpSwrUzQp9w+wCRhwqfuqcdUZtMMmEYYs/f6fHdqBDaxLhrhhytliWfQp
         T6eDTES82XK4GsrOdQIwx2Wy01a6xuCsrA0lKsTHroHhPDiRCxOOV06Ko5E7eDjFwBUE
         zdmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783057617; x=1783662417;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DpH0aaqLIE2vdp1hKLWk2Yx9KYUV7VWpd2pe6X9GfNw=;
        b=e0LpKKiyJBvqgBUKXJGiIdc0Rztj1OH8go05E5MB5dvwUVuA3cTWhlQIRecqR8ACX7
         SEkoiAS603kWHfWfXhrNlI6DTKU77ZE5hilCYN3gMmt+K7KlNLD8H08lbaiYFHgshao2
         VIr4d5fkJAXJo0yOQziR5WCfxZz9QzCZOVyfCHWCT6aRRcMgS1gD825MEEqKchojiptV
         YMo8txXLe6oKyQg69OcATB+JM9Xlx9fiE/byiIkcLDI6pkuhD2j0VeY1rpzF4L3ZYqT+
         I/peyg4eE7DghPuYToKm1S9ANvy9dDJwcf65FkxoTkZFN3K764bGDjbxn87sXa1je/9U
         V7Ag==
X-Forwarded-Encrypted: i=1; AHgh+RqMOdRQoLP1hDdjvSf7H9anaK28lwC9Kv6K1NNwI4BH5/Ohex6Fp/NygktgF9V+I7g0xiKQXFXRrSaGN3gv@vger.kernel.org
X-Gm-Message-State: AOJu0YxHCBRldo+emFlDzd6wrOJlNPenDvxb+qHje0V4KDptQcXhTLUZ
	iEeKMrEWuCUVdj/4GLYkNr7uIUNVcZyPIjCCF2NO1rVzUG2HTnnR8Ao6Rak0P/BavSo/u76dlTl
	6wU4xIO06x3p9V7tNKIplEMZ1xABoCjCTyKtIE3OV+UtLwOaTEP1+3QmdyhDL8Ejcqcia
X-Gm-Gg: AfdE7clpxTlBtELcly0vpNyexnryhJS9VZLBjE79uBdg1l55YH/vjfDIgzLZggY6HJC
	w+IcGt5A/PdQTvXlXqx4PE7vS+3QZ62B6aKY2VhXxMg/t2Lyp6exvK/l8r3i0z/a1wPltNPGK4N
	olJzB+KpwUItTxjpSqKA8dkN1I0TP/BOZdSmHg53OrAhnsT23+XXOppXP5WZgeEgBNQ9k4CRltE
	ns1crfUlQuhMtrb+rij+R/RDEgGB7LmBTPThRHTX9ffhucvhieNxSRNe04PgvT4Q8oB/azIJ6Hq
	rSXkPAjwxRpSuI3WheTkj5TlEudrHQueIArRejSnwr/IGd6gMsC/kzmlFsu+73r67yZqtho+hbr
	oOJiXb793iWbLaYxPDCZXW8oMtHTMKgdt/byDd+8nVK0j
X-Received: by 2002:a17:90b:55cd:b0:381:fa5:521f with SMTP id 98e67ed59e1d1-3810fa55836mr3819860a91.3.1783057616760;
        Thu, 02 Jul 2026 22:46:56 -0700 (PDT)
X-Received: by 2002:a17:90b:55cd:b0:381:fa5:521f with SMTP id 98e67ed59e1d1-3810fa55836mr3819836a91.3.1783057616187;
        Thu, 02 Jul 2026 22:46:56 -0700 (PDT)
Received: from [10.217.219.87] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0b7b9a8asm16955180eec.2.2026.07.02.22.46.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jul 2026 22:46:55 -0700 (PDT)
Message-ID: <b72f1900-972b-43a4-bfbd-5c85b6fab08d@oss.qualcomm.com>
Date: Fri, 3 Jul 2026 11:16:51 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] i2c: i2c-qcom-geni: serve transfers during early
 resume
To: Aniket RANDIVE <aniket.randive@oss.qualcomm.com>, andi.shyti@kernel.org,
        viken.dadhaniya@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bjorande@oss.qualcomm.com
Cc: konrad.dybcio@oss.qualcomm.com
References: <20260629134140.755193-1-mukesh.savaliya@oss.qualcomm.com>
 <3777cef8-c90a-4c7a-9b71-c563e8d56f2e@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <3777cef8-c90a-4c7a-9b71-c563e8d56f2e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA1MiBTYWx0ZWRfX41gKpSqtLs6M
 XOuNAiQN+Uy9l+R0Qb7WUIl1QHCfcuXuEA8Vasz/aEqsDcgB3r5tRY9WkQO4C/MmEhXMxPh7lWW
 uQDT/N9unfbV4tnToWRge1hLC+tXmaM=
X-Authority-Analysis: v=2.4 cv=FOQrAeos c=1 sm=1 tr=0 ts=6a474cd1 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=qYV2nPpu_1DESmPDX6UA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: wtswh1sus4XaoOFz5L6wgWVMM43PtScT
X-Proofpoint-GUID: wtswh1sus4XaoOFz5L6wgWVMM43PtScT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA1MiBTYWx0ZWRfX4lN3vw3cjL+G
 7f3xYNRUezTqOIbXVGpXF4eSQjYjBUXTBMsykk5lRCwcA4nv/xyRDSLOZOTTHzF5hcjPnfSvg2S
 F6jiwhUsqGqIk0JVLS5Ai8zZfRRV6taitFKdMUIV8GCv0p6nkoQvKZNTC0fHGKw+bLCKEzDL+J2
 tFte4BiRXRdO33V1qSKK2Ps7PhE5h1rgCwiC7m1qB1QS9BkA1HQOzv1XDkvwXZ7qbzgkjwvAerp
 xj8SU1q7Z2Oywuo7PoxDmTor7qx4rh3T6HCKs6zzA9WgBOhk7bt0qJU03JxCvrw2SwXSBsMGuwn
 lFGO372PEKEVsMSXPvXcuP02SwMpiSROBFW8y1O+WzpHDC0qxYllsCq+bQ+Xa7VIpc/CM3O6zzC
 L0WemCWDMx0c2/5hDR8UnJZpjRf/n5P7+oK3qrl9iPVQftbbFlH9rDPDTuCTv/VGB+VtEzt1hJe
 ougefbo8ltKNayksYWg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 adultscore=0 clxscore=1015 malwarescore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607030052
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-116167-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[mukesh.savaliya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:aniket.randive@oss.qualcomm.com,m:andi.shyti@kernel.org,m:viken.dadhaniya@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-i2c@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:Bjorande@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.savaliya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C87346FECF8

Thanks Aniket for the review !

On 7/3/2026 10:21 AM, Aniket RANDIVE wrote:
> 
> 
> On 6/29/2026 7:11 PM, Mukesh Kumar Savaliya wrote:
[...]

>> index d2f5055b0b10..d56b36bd1d26 100644
>> --- a/drivers/i2c/busses/i2c-qcom-geni.c
>> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
>> @@ -913,6 +913,10 @@ static int geni_i2c_xfer(struct i2c_adapter *adap,
>>       gi2c->err = 0;
>>       reinit_completion(&gi2c->done);
>>       ret = pm_runtime_get_sync(gi2c->se.dev);
>> +    if (ret == -EACCES) {
>> +        dev_warn(gi2c->se.dev, "Runtime PM is disabled:%d\n", ret);
>> +        ret = 0;
>> +    }
> 
> Why we are checking specific error code here? Why can't we use the below 
> error check directly?
> if get sync itself is failed with pm runtime disabled then why we are 
> going ahead by making ret = 0 here? How you will make sure resources are 
> enabled?

This reason is also mentioned in the commit log. we surely get -EACCESS 
as runtime PM is disabled during no_irq resume phase. We still need to 
serve the transfer, hence we need to override it.

Review geni_i2c_resume_noirq() to know what all we do to enable 
resources. That's guaranteed and tested with system suspend/resume test 
back to back and PCIe could do i2c transfer successfully.

> 
>>       if (ret < 0) {
>>           dev_err(gi2c->se.dev, "error turning SE resources:%d\n", ret);
>>           pm_runtime_put_noidle(gi2c->se.dev);
>> @@ -1045,7 +1049,8 @@ static int geni_i2c_probe(struct platform_device 
>> *pdev)
>>       platform_set_drvdata(pdev, gi2c);
>>       /* Keep interrupts disabled initially to allow for low-power 
>> modes */
>> -    ret = devm_request_irq(dev, gi2c->irq, geni_i2c_irq, IRQF_NO_AUTOEN,
>> +    ret = devm_request_irq(dev, gi2c->irq, geni_i2c_irq,
>> +                   IRQF_NO_AUTOEN | IRQF_NO_SUSPEND | IRQF_EARLY_RESUME,
>>                      dev_name(dev), gi2c);
>>       if (ret)
>>           return dev_err_probe(dev, ret,
>> @@ -1257,7 +1262,12 @@ static int __maybe_unused 
>> geni_i2c_resume_noirq(struct device *dev)
>>       if (ret)
>>           return ret;
>> +    /* Enforced disable_depth = 0 to actually enable runtime PM 
>> during noirq phase */
>> +    if (!pm_runtime_enabled(dev))
>> +        pm_runtime_enable(dev);
> 
> Here we are enabling the pm runtime so where we are disabling it?
> 
when system goes to suspend, runtime PM gets disabled. Since we are in 
early resume and runtime PM is still disabled, we need to enable it.
>> +
>>       i2c_mark_adapter_resumed(&gi2c->adap);
>> +
>>       return 0;
>>   }
> 


