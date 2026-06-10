Return-Path: <linux-arm-msm+bounces-112341-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lyAUM3YeKWruQwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112341-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 10:21:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C6BB5667177
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 10:21:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Nvq1PM6E;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=K0lDtIG3;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112341-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112341-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7C63C3071C6E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 08:14:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A95243A5E78;
	Wed, 10 Jun 2026 08:14:29 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E4583A59A2
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 08:14:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781079269; cv=none; b=fXWdU1bBqjAch+ZGme3W6e0CS6PaNfeMoppRIIm7EWbooP27z39VovcZH4y0MQVICkJk92r+XfKDkQ3r14v/xtGQtW20yKq3asSt5i+omhGrXyoB2Q10OkqGcyr09pVs0NJ8bbBAFr9wiz8Kw4ubxbl5dUvl0+4kEgwfQQSE/mM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781079269; c=relaxed/simple;
	bh=6tNt2knlQaGLvQLbDqwVIf8lCHEl1tWiYmIoI7brRqk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pj4qJqccVJ53nY4UsDAXB62s0pmbR+BMZYp2u7uNl+xxXv3Z4ivOCab1DW4K2ozbuNuot0bMVwgLySLAj/3itByeOIptybxoSnH5HdKPR/VwtQPbFSzkOwHl6LNKxyaJGhvh0h4qbaAi5j7zzC1Z3VUnrlJ6hBHQ0MJ23j7sCZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Nvq1PM6E; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K0lDtIG3; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A7hn2S530862
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 08:14:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	P7m2AaYtiFBNkE7Ec+ikzutKgjTULANhgT2ImDwCS9o=; b=Nvq1PM6Ejt8MJoeh
	AueWOCR44Q3IkI3Gc0gy++O+cqpj0O3EFom9YQTiPrUxrEp3ARC03U4brbsezgU6
	H4YC7CXcsBGXwAMMKVOA8oP21A4yqHnPcss2k8nSYJaKFMlCH6Rqv9qQItAdhey4
	9Z1ABoTkfVlLvvj0JnQL7dJSww0PYbts0g60HNRtSYtEZWHnTGK5fQEAEtkjpLgj
	jYMfZGbd3STrr/BCa8E81qHA0Rk+IwRSCVIeZ1qICw9lE4ZMimkmgKqjdp+wZaui
	nZI64FfQ0JHVbS+A7D/zAAx6FJ6xkreMX3Cqv14oxlORlv4/vkTWScYeM0yyPp5E
	IcEYJw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epwnh1fp6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 08:14:27 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c0d0516ad7so65999985ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 01:14:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781079267; x=1781684067; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P7m2AaYtiFBNkE7Ec+ikzutKgjTULANhgT2ImDwCS9o=;
        b=K0lDtIG3F8xmMNJWmusaF5rloUcmCXwWhPsRM5c1atp2rGNqyjuU9ENOugEj7Ou2tG
         JHZDe7+ZR/B4JdQ3+3y+phelrplwV56DH9pJtP2OmMJEwqAKgNHyfNJzBlBntkJCN7YM
         OvXH6loPzr8tkxR9djLCcgvp0/lY5SwIJxUOFUw4qbZMF7e4nlNE9M0gL7lttdiIKBvp
         5xZmR1fIDfYtAZzY7VjQ7pvx/c5+XC52lGWliFw7AElLAlcYo8e/AZC9z7GtzBRfZvNM
         CInJx1EpsXU87PyRN6RAfZPSFG6r+TZ1k0GpTEK4BcWKvDyRXbQRsCbu+DfDF261LPJE
         EiuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781079267; x=1781684067;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P7m2AaYtiFBNkE7Ec+ikzutKgjTULANhgT2ImDwCS9o=;
        b=G0QQhIZTPd1VQkbWnYzs8/4lxww9L8NtJdFrNCip/XURB0lP+r7+RU3Fg7oLCPtGo1
         zepI9+nzoWgV0e+6A1zIwEUD/slf6Moawlm+hishmIhmdvHu0ko8vniZe7eWUq2KK6li
         puCpSzLVRtU5QgtMaEn06a8/C7Z+BOCvt3O7TKCkTv2j2GBa5cjgG0Dg4jDx23y/KB8H
         ISN+1LysKaTtHFheF6dXVUYOckyXRr606nFdU+IRovpKnT3KjJcJ+B04PplYHX6f5LVY
         wIe45kthtKACefRqJPLxI9EE6w68GLhF/onat6PnKphOkwFzBLV0ixqu9WUT1bIZjBDu
         CEGA==
X-Forwarded-Encrypted: i=1; AFNElJ+AcO5YtzMMypOo/NpUFi9nhYBwYAv0xy3CFmFofnC38NLbRs9ZQG7SGfisZz13pc6LAogfCzNRHqlvPSE7@vger.kernel.org
X-Gm-Message-State: AOJu0YwgZnEOcoDGeRlOY05G+EVGvEnw77CFp/rJmRmfw+BlpDU9TeHq
	+agopjcvqs30uoUbkHVnJvMhujYQmCviYQ1b1O/pjwJADsL39ukhdVrO5wPRHbYWFLxfX4y6Lv0
	DzQs+nCTTaV+FDq/6224RiFR0s5Mn18pyUS/cyWKy4+wbS/pj19z+UO0A8d7+f/O11TrG6ZywgD
	uq
X-Gm-Gg: Acq92OF5Uvitxor8mtjqGm6HVb6j3d0TWlHD2EcZDsLCFc+ZI8HUv7cTGEGnOx9bu43
	L9FCJgQv8GDu+gVhFAmcHTbEqcPiLDcH+bcO16DXAWDZM3rIPrjzudk870R5kuWlvJyjxIA0DfD
	bBtAEOrl7ISXci/Po+zCXWOu5xNCKP5vi1NcF6pgseNiQI4c9Qfch+fqeB5HH7aF6LqB21uhCiR
	vw4NyoOhlmrNaIIcyZhcB6nYv3DbkslXiRocBAkRdHGL9ioMRx+/dRC++CvipgJiNYKrqEKfJf6
	/gjh6mGAJvly4eUChyvFVwynPW57Caa7mwqV0h1U65/oRr7+6YkQ1qTcstumR8ZUImRQ4Y9err6
	D5ZFHsD2tu6hvmq2Ar1OQrZSERvisxp2xG044kc15sAiIRzBj1qu3/NxJn8/p
X-Received: by 2002:a17:902:e892:b0:2bd:ba44:6c07 with SMTP id d9443c01a7336-2c1e7b3273cmr272141035ad.16.1781079266976;
        Wed, 10 Jun 2026 01:14:26 -0700 (PDT)
X-Received: by 2002:a17:902:e892:b0:2bd:ba44:6c07 with SMTP id d9443c01a7336-2c1e7b3273cmr272140575ad.16.1781079266399;
        Wed, 10 Jun 2026 01:14:26 -0700 (PDT)
Received: from [10.218.18.193] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f6d389sm227967235ad.16.2026.06.10.01.14.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 01:14:26 -0700 (PDT)
Message-ID: <51b95f5a-d123-441d-832e-be023fb9d98d@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 13:44:21 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/2] pinctrl: qcom: lpass-lpi: Switch to PM clock
 framework for runtime PM
To: Nathan Chancellor <nathan@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        mohammad.rafi.shaik@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260522204644.4101640-1-ajay.nandam@oss.qualcomm.com>
 <20260522204644.4101640-3-ajay.nandam@oss.qualcomm.com>
 <20260609231238.GA1901681@ax162>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <20260609231238.GA1901681@ax162>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDA3NyBTYWx0ZWRfX+5pMM+E6xDIa
 0c00Om3yTV1pXY2WFLPwDTIXZeaQJ42NDpDDhK4GXhBlDUJZkUDlgjqF6Kk0UBFaj/qX336oEY6
 4fulfDS8qik2Mr2SAIdrK1lDDTyylXQs2ZNjRt+clF9G2avO9g/NgaWpVmoy+T0E3qXDPCWdW3R
 K1G3tXouMFc2Rf7efYfZajT9gAIN2fOJ3dartTJcJYKsbeW4hhL8kO5uXjptHJ9cADd8AHuy/vT
 iwkZV17J7lREKISxWupkTcnE5jnoJu8TLVWMHf2pJbjM5a4L80tH+ROrAc0TQDa1NpeJMSacBUj
 /QRx74soZORHMZsclNX03MyLHnGpWn/u461MWpIuFE7oDhvzvbHW3DMVBmX9beKrDpVBwcp1JiT
 vupoOXT0ZZwQeeam+aA9AgCvBZOogdBu3spdAI0CUdMc+XpeewlUoNsm1QF2nQSRt4iiPWAMdyp
 u6KbBpSghiOS2qe938Q==
X-Authority-Analysis: v=2.4 cv=Xce5Co55 c=1 sm=1 tr=0 ts=6a291ce3 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=I1y84f6UziIZZygAmgMA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: nIz3nBSvMZz5RDDg8JCWcKHXYXrxVAWT
X-Proofpoint-GUID: nIz3nBSvMZz5RDDg8JCWcKHXYXrxVAWT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 impostorscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100077
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-112341-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[ajay.nandam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:nathan@kernel.org,m:linusw@kernel.org,m:andersson@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mohammad.rafi.shaik@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ajay.nandam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C6BB5667177



On 6/10/2026 4:42 AM, Nathan Chancellor wrote:
> Hi Ajay,
> 
> On Sat, May 23, 2026 at 02:16:44AM +0530, Ajay Kumar Nandam wrote:
> ...
>> diff --git a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
>> index 15ced5027579..4d758fd117c4 100644
>> --- a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
>> +++ b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
> ...
>> @@ -48,22 +49,48 @@ static int lpi_gpio_read(struct lpi_pinctrl *state, unsigned int pin,
>>   	else
>>   		pin_offset = LPI_TLMM_REG_OFFSET * pin;
>>   
>> -	return ioread32(state->tlmm_base + pin_offset + addr);
>> +	return state->tlmm_base + pin_offset + addr;
>> +}
>> +
>> +static void __lpi_gpio_read(struct lpi_pinctrl *state,
>> +			    unsigned int pin, unsigned int addr, u32 *val)
>> +{
>> +	*val = ioread32(lpi_gpio_reg(state, pin, addr));
>> +}
>> +
>> +static void __lpi_gpio_write(struct lpi_pinctrl *state,
>> +			     unsigned int pin, unsigned int addr,
>> +			     unsigned int val)
>> +{
>> +	iowrite32(val, lpi_gpio_reg(state, pin, addr));
>> +}
>> +
>> +static int lpi_gpio_read(struct lpi_pinctrl *state, unsigned int pin,
>> +			 unsigned int addr, u32 *val)
>> +{
>> +	int ret;
>> +
>> +	ret = pm_runtime_resume_and_get(state->dev);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	__lpi_gpio_read(state, pin, addr, val);
>> +
>> +	return pm_runtime_put_autosuspend(state->dev);
>>   }
>>   
>>   static int lpi_gpio_write(struct lpi_pinctrl *state, unsigned int pin,
>>   			  unsigned int addr, unsigned int val)
>>   {
>> -	u32 pin_offset;
>> +	int ret;
>>   
>> -	if (state->data->flags & LPI_FLAG_USE_PREDEFINED_PIN_OFFSET)
>> -		pin_offset = state->data->groups[pin].pin_offset;
>> -	else
>> -		pin_offset = LPI_TLMM_REG_OFFSET * pin;
>> +	ret = pm_runtime_resume_and_get(state->dev);
>> +	if (ret < 0)
>> +		return ret;
>>   
>> -	iowrite32(val, state->tlmm_base + pin_offset + addr);
>> +	__lpi_gpio_write(state, pin, addr, val);
>>   
>> -	return 0;
>> +	return pm_runtime_put_autosuspend(state->dev);
>>   }
>>   
>>   static const struct pinctrl_ops lpi_gpio_pinctrl_ops = {
> 
> After this change landed in -next as commit b719ede389d8 ("pinctrl:
> qcom: lpass-lpi: Switch to PM clock framework for runtime PM"), there is
> a warning that lpi_gpio_write() is completely unused, breaking the
> build:
> 
>    drivers/pinctrl/qcom/pinctrl-lpass-lpi.c:82:12: error: 'lpi_gpio_write' defined but not used [-Werror=unused-function]
>       82 | static int lpi_gpio_write(struct lpi_pinctrl *state, unsigned int pin,
>          |            ^~~~~~~~~~~~~~
>    cc1: all warnings being treated as errors
> 
> Seems legitimate, is this intended?
> 
>    $ rg lpi_gpio_write drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
>    61:static void __lpi_gpio_write(struct lpi_pinctrl *state,
>    82:static int lpi_gpio_write(struct lpi_pinctrl *state, unsigned int pin,
>    91:     __lpi_gpio_write(state, pin, addr, val);
>    167:                            __lpi_gpio_write(pctrl, group,
>    172:                            __lpi_gpio_write(pctrl, group,
>    179:    __lpi_gpio_write(pctrl, pin, LPI_GPIO_CFG_REG, val);
>    340:            __lpi_gpio_write(pctrl, group, LPI_GPIO_VALUE_REG, val);
>    350:    __lpi_gpio_write(pctrl, group, LPI_GPIO_CFG_REG, val);

Hi Nathan,

Thanks for catching this.

You're right — lpi_gpio_write() became unused after the runtime PM 
refactor, which triggers -Wunused-function with W=1/Werror builds.

I’ve sent a follow-up fix to remove the unused helper:
https://lore.kernel.org/all/20260610080809.2588640-1-ajay.nandam@oss.qualcomm.com/

Thanks again for the report and testing.

> 


