Return-Path: <linux-arm-msm+bounces-118623-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id AiJ2J3lsVGqjlwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118623-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 06:41:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E3FAE7471F3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 06:41:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=OTmjmnX0;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=JA209Aom;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118623-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118623-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9A83B300F9D3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 04:41:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22DA7345740;
	Mon, 13 Jul 2026 04:41:27 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11880345CB2
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 04:41:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783917686; cv=none; b=VjOrAh3mAfpKnSXgvODzjZNt4loTx8ebqdr1JJznh/gSlfEgyVdsrIrkReg2rmCJhT5JoxtUgNOmIzyK1HsrNsFwzU9+Fx1XvRK79ryJ35aQcTnoIahq78N69eOMhBhadSCbdhMPQ/pPbzJCNEuSuSBEHtFElE1LSD7LjjB77Ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783917686; c=relaxed/simple;
	bh=OhZ5bZyZvFv+YVsQqcgwaQ8I/MktFfOiWecpFw+qzXI=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=elqNdYdb3Rm/8fs9wDK6eoMNkMocWKclESyRB6sjdRNrDwf6USOxrnt1KOdOWwU7yoUv4OXQICMiowSw0nLDYjSkYKZsZdDyHxMDqoM4Jj/SK7Cj2HFgGliefGGc7j/Dm9EjtUENSOpGeGs0amK9bPS7gN3EElBUGfX4c5TsOOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OTmjmnX0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JA209Aom; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D3A1mu079436
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 04:41:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	e1X9sYCmRIupKnbxrpidxF27pK1+M2JGSFT3RpKkUgM=; b=OTmjmnX0tnumLCKP
	eyCTtYLky5XSstw6mKB7oO5pd58tZnUZwF0lEln7BqoXIEb+LmmZvxyqZ/t4OR3/
	aMzCK4eaoRqZ0QJk5gdoqUG/63AlJ6AZbODUvavyBVZwrZJMzTPJG/8a5EH8Hm/y
	o5slhQ8f1qlD2D9w/oBdqhdAFg3PSGCLRKgdKCyElT1QBaLLasTCfszxLbLZJfjP
	I314mbPGArMxT53IARzbOSS6GMNbbwDwdlDW2Ajl95VheIyxw0BwHWx4E+Gbx9T7
	+9/Sva2XRqKYhZWhD8QvYkcRnqMsYnPsE2qBW9N38+U0t1Q/AU1t5W21ZYqq8LNC
	3CidPA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbekcma3a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 04:41:23 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c88aab7c1fcso6334511a12.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 21:41:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783917683; x=1784522483; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=e1X9sYCmRIupKnbxrpidxF27pK1+M2JGSFT3RpKkUgM=;
        b=JA209AomCVCsKcUtE+9vAWwGZku9XdQiwAqDGJ9LLwvD1eugrYlz7PBCiROKRWxwzE
         6QxKifQPB3OL9Ky8iO0PpceBCS7+JtQ8rwV8lGegIAxfJrC1eL/G7w/N/LTtoL+oHBqF
         nFU7fVYmu5NWiO0mjqsXMfbHPUZgDKQSGTqKiOM/3jpufw4zwZ2ifGRZlOz8Jn6+EpwN
         P7IXLtCpom2trFMsRJlG9xMpU0uV/Vp/8xVsRT5EApk81+n8QzJ+02fh5WPJT/hbgP5P
         C80WCCFhZXIIvaguudNaj1z69F0YR2heVUv+0T+4+NEIUY9aix/XXa18CWOjnb4n62L4
         XI5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783917683; x=1784522483;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e1X9sYCmRIupKnbxrpidxF27pK1+M2JGSFT3RpKkUgM=;
        b=OwjjI8QQF4LcSPmiBvqi6sWXgOs3xNMjGus9oKcF7h6qXgAFBdXAVrl9Azs5v1wpuN
         QlYG89DdhLyIIM4hlG+EC+nysRzvRQW3ds+Z9befZ0i84eMx2cT2zMRvvYzty/pRu8e6
         Dld8mBy+GirgAvRA3V142drv6x2uji+V1U1oaH/MVdSQbkq1TCH3aImvjlbI7BFNoGQ/
         4v/jeqA7Mp/McD9syuk4Ger85+Nd/EAfnf3rkjvA0ptCRU9L799A0IHQqS8mbzE3nPRm
         j/B3BI+XyIN9MUakDJVybF+c8/ky59RMri2BI14ZN6G+mR4MacUzV2vfu1M8hebyZP23
         e+kw==
X-Forwarded-Encrypted: i=1; AHgh+RoGKTGoBhEP1/H8idjXQKzn5frOoOI5jYYJm61PttIYoHVwDTCLDNti3a+8c5MdxDaohbxp+7abPW7wz7Iz@vger.kernel.org
X-Gm-Message-State: AOJu0YxF/gVPp6SEmAc7HYmQ1rN5dGp6r0MGGN4LDEBEI41NzoZEviQx
	qb/lFBhY7/ljEGIczWerL/tGedSh55pwK7DHv8Eb6ELl5ZSxy32nka6TZU2Sl2NqKTOgEwOr2lW
	u+ITlXH+3M0Xhjb5TlJEOzv1kICulhRkpuqGSa1oRBZ0cmMpz/zH/CPKhbUN8Df9kvAt4
X-Gm-Gg: AfdE7ckMbwQz9750zLcBQejCPuDiX+M6A4ENVBA/a7GI3MUtSyAppdY8pIdC1oxfGxL
	xQXXN4ADrAX07HoGiV/xuT0tCtdm4cN8R1tiIPaj1GU6JCZFvV2CZRKIUaQNVM8Wwwl4vp/Q3+8
	GyRyhxRCP+klO9j3KrdV+n/USsTA7SrCHvv+SiAJ4mAR8g+TB4QCvBeuotpJ1V1CCMzN2R44NpH
	MJVdZ5haKgppgL8gRGrI22mXabLegIVe8jgJOnAHLKIyrrGo/YNyneACuBiXrzps5bty1rvOFt/
	6tyI1pETGiSe6pklFBt1wZXgw7WWSRwFPURvmEIbZlxETv6MgAHw7NByUWbXn273mHdLu/Vv7Q6
	n7n5JOBh+nMOB9Ei0ZMLVr+XKTM8BY9Na4b9iyXB2BzgZ
X-Received: by 2002:a05:6a21:6b12:b0:3b4:6f7e:d0f4 with SMTP id adf61e73a8af0-3c1109e29c6mr7736337637.15.1783917682670;
        Sun, 12 Jul 2026 21:41:22 -0700 (PDT)
X-Received: by 2002:a05:6a21:6b12:b0:3b4:6f7e:d0f4 with SMTP id adf61e73a8af0-3c1109e29c6mr7736319637.15.1783917682173;
        Sun, 12 Jul 2026 21:41:22 -0700 (PDT)
Received: from [10.92.175.104] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b93ae3b45sm15318537c88.15.2026.07.12.21.41.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Jul 2026 21:41:21 -0700 (PDT)
Message-ID: <0e13982d-8eec-4662-a53f-cdfbcce5fbba@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 10:11:18 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i2c: qcom-geni: Use devm_pm_runtime_enable() for PM
 management
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        viken.dadhaniya@oss.qualcomm.com, andi.shyti@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260710121356.4054600-1-mukesh.savaliya@oss.qualcomm.com>
 <cf80fc3e-2cfb-4bf0-bc20-dffecd347817@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <cf80fc3e-2cfb-4bf0-bc20-dffecd347817@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA0NSBTYWx0ZWRfX1B3rpevwzXzI
 5KR0Dtm/uMxptqlFbq0MUURd+bVqXLK2J67ZmPbndffMbBvZ9DXOiFyOw0TWyw64F/fzQvNpFzc
 +fUZszGXHSUPd1a+K6XYGdsbu2NPckngRmIq5Lf6yJmk8FBaXvfB2+bDJF9j/1cniRe+BcNofPj
 aEAEM0MR4nVPEfzKDGkigenfBwfg1Nt2X0TtOUETpzknD/gzQRpwE2SSYlLZG3yUj+b0v0aiapG
 T37xRWxhXUUGtfZmi4WQHGkrQ1c2fH7358c5xI4IHQw5sqCTgkDQ7tTuCLoQtKHIUXKcSrfG+E7
 QAdQAIBfunNOXn67AK/EkDnIiSpEJTAMD5nGHQ6oYhqyWiTDZ+oEFNah4X0MT2p6QG4whae85bS
 lBeFfYhO2MpGHCzlbfxHj4VEzwflfchVrB7FPSEz8PrRyIbmvXfo16f20iPYh/tbU1K9PCrVL1a
 7CCXbF0FARvOd/50x/A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA0NSBTYWx0ZWRfX5qAireNlh/P1
 XRjTk2o3UH3bMhyGHqlfWs3RcsJ7sqgjmlve/u4a/esOODtD7HH4IJTujw0Sc8SgSlMk6bKGnII
 ehNfc5xIMf/XQndTqFEZ/LIMTl+hV1M=
X-Proofpoint-GUID: ukip2h0wX9Ewlz18kQ81e9T5d9BiHNuc
X-Authority-Analysis: v=2.4 cv=XNsAjwhE c=1 sm=1 tr=0 ts=6a546c73 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=J_X7UomFcqM4Xp8SbNMA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: ukip2h0wX9Ewlz18kQ81e9T5d9BiHNuc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_01,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 phishscore=0 spamscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130045
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118623-lists,linux-arm-msm=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:viken.dadhaniya@oss.qualcomm.com,m:andi.shyti@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-i2c@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[mukesh.savaliya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.savaliya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E3FAE7471F3


On 7/10/2026 5:59 PM, Konrad Dybcio wrote:
> On 7/10/26 2:13 PM, Mukesh Kumar Savaliya wrote:
[...]
>>
>> Changes:
>> - Replace pm_runtime_enable() with devm_pm_runtime_enable() in probe()
>> - Remove pm_runtime_disable() from remove() function
>> - Remove pm_runtime_disable() from probe() error paths after
>>    geni_i2c_init() and i2c_add_adapter()
>> - Use 'dev' pointer consistently instead of 'gi2c->se.dev' for PM APIs
> 
> Drop this paragraph, describing changes like is unnecessary since
> we can just infer this from the diff
> 
Agree, will remove these bulleted points.
>>
>> Signed-off-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
>> ---
>>   drivers/i2c/busses/i2c-qcom-geni.c | 25 +++++++++++--------------
>>   1 file changed, 11 insertions(+), 14 deletions(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
>> index 96dbf04138be..6d6c2fa287ca 100644
>> --- a/drivers/i2c/busses/i2c-qcom-geni.c
>> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
>> @@ -1126,27 +1126,25 @@ static int geni_i2c_probe(struct platform_device *pdev)
>>   	gi2c->adap.dev.of_node = dev->of_node;
>>   	strscpy(gi2c->adap.name, "Geni-I2C", sizeof(gi2c->adap.name));
>>   
>> -	pm_runtime_set_suspended(gi2c->se.dev);
>> -	pm_runtime_set_autosuspend_delay(gi2c->se.dev, I2C_AUTO_SUSPEND_DELAY);
>> -	pm_runtime_use_autosuspend(gi2c->se.dev);
>> -	pm_runtime_enable(gi2c->se.dev);
>> +	ret = devm_pm_runtime_enable(dev);
>> +	if (ret)
>> +		return ret;
> 
> This shifts the enabling of runpm> +
i had doubt, when i tested this, could not see any impact.
Thanks for the pointing and correcting.
>> +	pm_runtime_set_suspended(dev);
>> +	pm_runtime_set_autosuspend_delay(dev, I2C_AUTO_SUSPEND_DELAY);
>> +	pm_runtime_use_autosuspend(dev);
> 
> 
> ..which is wrong since:
yes, agreed.
> 
> /**
>   * pm_runtime_set_suspended - Set runtime PM status to "suspended".
>   * @dev: Target device.
>   *
>   * Set the runtime PM status of @dev to %RPM_SUSPENDED and ensure that
>   * dependencies of it will be taken into account.
>   *
>   * It is not valid to call this function for devices with runtime PM enabled.
>   */
> 
> 
> Konrad


