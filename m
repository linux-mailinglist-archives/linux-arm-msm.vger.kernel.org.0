Return-Path: <linux-arm-msm+bounces-117558-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kecfHugYTmqlDAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117558-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 11:31:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C5A4E723C1A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 11:31:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=alZFlZxT;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="UmVk/758";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117558-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117558-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7A27D3051DC1
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 09:24:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DE2C409600;
	Wed,  8 Jul 2026 09:24:01 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B948E40680C
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 09:23:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783502641; cv=none; b=iQ7JuTUyp8sRGgTyH65kxjxYvE+5kfFsFq0ztC6V94P92neAZVMm2HLDcGl04mJEOc4Ogrk0vYrybsu7iKEbCATlQjzRKkUgEJwv2wscRrA7GPsJsZa0Lm/zx/iJi9vABnI0IZGaiOcawcuAG6RIZo0ZRJHmMa5rwwarVZa8Q4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783502641; c=relaxed/simple;
	bh=ONkwmV6ub6lfKBz26viIu7l0+ueDxgeYreLvBi5E8/0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WwsGpPQyQDtyn3Te4fCRXh7Ag07hhCxR1NduTu+WY9CYQqyioBT84dVbJs7XDrEk090+3x7HOv8neRmNnKCQjHzjv2QOFZ/sPoXm1y45gJFBgFNvN/ey6cDo+glSPef2TKk/itEBUJv9QHMwI/Q3rA3mvf6W9wvSXyQ7j9HvPFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=alZFlZxT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UmVk/758; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66889Uw02197689
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Jul 2026 09:23:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Rp/FhuP3BSFOGIgr5F8osPYl1guJ7ugYOygLj83qoRo=; b=alZFlZxToy5Nazbs
	r9pfAq9z/ycoKCy275cQjs7Kkx+W7Gl+/lIMM+Y3vMC8cLUdqDp/0+pqMKwM1zI6
	e/3NiKmnOPMGhhq5ETS9jx7DwFMi5JUmMwbUIrPmaDWBDaJZhoh1wwzdE+GM4r2s
	NyeJbzOIVX8r6imCUMcxh94H4bi/BiB0UGfHsPd2WZYqU2ZkwzZ67JMYaS/1AnCl
	e9H9DyjuxgAarkMsYnmlRbGmSFvaa/2RbnylNTxuh7Qe3fhkrrgsj4mMNmncuyZJ
	GoTaZB8nYO+n9kwqNufQjVfuswUAcO2544L5d1igsSjcYvL5koMUXVr2TsckoM2v
	hmrjmw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9c6a9v55-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 09:23:58 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-84842381150so789867b3a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 02:23:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783502638; x=1784107438; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rp/FhuP3BSFOGIgr5F8osPYl1guJ7ugYOygLj83qoRo=;
        b=UmVk/7588SWXNr1AmyVw2NUtmMXddzWy11nK4/AyrhxLeMm1MIGhm6n/2YjnLDNRY/
         hHPg05bgnT/OdfA18zqaNSa7tvqbQKNUlm/55WOEpOf5GAJXblpGhK1bybkCkZoNPXeZ
         WPkM5wmdmOLy0ZRoAwllvCvvAgtk9VZM7OcSy0r4rUwkXVdqppBpc3bwoDE+npVSf2zN
         ewRPZrgWym3+hZPY8zp8j2XB9Lx2wI0ALSkNOjap0Ay7hJa5GgZ11cucdEVL0QGoGhUx
         HvmG5oI0CDmzlXpCK9QEUd6n/3/JJvalaF5mfz/hl/ZUrWY45YCNoLShE0jUA6JpVsLy
         +ECg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783502638; x=1784107438;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Rp/FhuP3BSFOGIgr5F8osPYl1guJ7ugYOygLj83qoRo=;
        b=mwmBx1axOg+QIkHTaxf+T1WGuHJbewC6ZxiW7aJuZyHyhh1XVh4XtrX0r0Y5d2KQyk
         1MAWZGmF1WHcuft6uSN1MWOVadDa24+faWQ5xQrXxb5iP5cDyrmVVZZQcofN5sUBKhuW
         hO4JeIsXKbZNEagEUuYJq6j0vqU3+0CiWq3629epj+3jcVUhjyS87Kg3SunIM1vIaYzO
         NXm5BM3Tcah9bnUTqtvE6f7EaNHGgiaIFK3GPVaDIBGuekhC1xlTAXfTeyDcy3P3Y8op
         9A83a78WU2dTsEUAXERnUjxnDr7rS91mYC8uIwqobjZ2zXED7gPlWWxwa2vQkYp2ik6J
         IiSw==
X-Gm-Message-State: AOJu0Ywg2IyrofWQC6qT8S7CeNRWKHDUWaPQ1bBbDhTioZgJhKNNoter
	ETz/42z0ojlrXyCPOLcmufHqj/TTikNJAeJZgkHmjKt5mkFcsFOkxXNxLDq31qwBgtgD8DNyTrr
	IGQhecC7mvxxcAzuPyilqii8kZNXy3QGdkuTaooxJ05aafG0kwowPsnvWWBTYHzO0UA6E
X-Gm-Gg: AfdE7cnix2UhMnLK3A/HDFmMU9/lyyXJBSSAb48PtLNyYU1gqUeZYOSgw3Pm5dGcTU9
	JAsqCaA0PBx39PHiSE6TeZ8KGCJ0gkep1B4c/JFYY9b7MHNXVDwRxGxLgFBQQva9g54VR+AijIG
	jcsdT9Y2wY9edCG+Tgb6KRWkHvGn+CcYuH9DOwS7pU9AMOfs94jyiaiWgWRYD0t22i3IBIfZDA1
	zkrsiEn2513A0G3MIqMwoRl1dtuTBHO3N/NqIAM8WM85HiPxmD5u+8Gfj/FtmhOc+VzEjLx6+Sm
	r+kENne40T+ZltMC4Xhgwp3Fh5PXvxESmtFFnAk/V3jXwt4duZeqjJEcztUZUgMeL5O0eEPHi/u
	vy6HuR01AtZT5aNMTSxfdylraud5iQ2aA/lABHOoBEA==
X-Received: by 2002:a05:6a00:6f0f:b0:848:4d1a:9554 with SMTP id d2e1a72fcca58-8484d1a9805mr155969b3a.38.1783502637634;
        Wed, 08 Jul 2026 02:23:57 -0700 (PDT)
X-Received: by 2002:a05:6a00:6f0f:b0:848:4d1a:9554 with SMTP id d2e1a72fcca58-8484d1a9805mr155938b3a.38.1783502637009;
        Wed, 08 Jul 2026 02:23:57 -0700 (PDT)
Received: from [10.218.14.97] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6ddc974sm6870170b3a.60.2026.07.08.02.23.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2026 02:23:56 -0700 (PDT)
Message-ID: <5d206010-a35e-460d-9b11-7dbaa8a56add@oss.qualcomm.com>
Date: Wed, 8 Jul 2026 14:53:52 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] i2c: qcom-geni: use dedicated completions for abort
 and reset events
To: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Naresh Maramaina <naresh.maramaina@oss.qualcomm.com>
References: <20260708-fix_cancel_sequence_on_failure_for_i2c-v1-0-dd8f841f36a2@oss.qualcomm.com>
 <20260708-fix_cancel_sequence_on_failure_for_i2c-v1-2-dd8f841f36a2@oss.qualcomm.com>
 <6167cdea-50d0-4319-9f4d-1f1b349600df@oss.qualcomm.com>
Content-Language: en-US
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
In-Reply-To: <6167cdea-50d0-4319-9f4d-1f1b349600df@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDA5MCBTYWx0ZWRfXyl1bkdNfpszX
 Ye6gATSglLWgnYkya1q1P9KSU+z8SH344/rZffUNVcu6UaJErpnW9+1vzxZCPD80hAL0TjROOqH
 VD49iJ2nPP9hcVa/+BHyU6+kdurnywxas1i3oBzKUd4XI3QuHtx6AwB7BihtL2oWlVIni4K+8lA
 TqZv3VL3vAQqpjtvz+ifMTx0T0wGpoISDilqqG8v6HxIugUfDTLioRECySThN6i4fGIwynTiMVr
 DDG3dwS2IJ4QGHNIm6Y+N5VVvcV1xwxRY2vuCTVEqVP4cGYHfLCDUJnmvWn6S06+JLb0PPLMILw
 WTXnwzJ3qMRrHVHld33MoI5vyPjmsgL6zdFDIIOS0dXm3BNVtO96JGvFJe0ZU+oMXOU+p+rjlfi
 1HIcV0pfqVkFND1VpJsEbDnEKpdeBfLRaJd1HDhs6xLNmr4Xel80OqMZuws303BCBDyD+KtetMP
 2aTgp1DJRI2oFFpQfbw==
X-Proofpoint-ORIG-GUID: GqYT7RT1JYWYlYmJ7fjCg-_eQ8OKQxw9
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDA5MCBTYWx0ZWRfX1V7bitaBGwrD
 mxakfd+g05NNwZpxlJYdMZDl7Z/Cc4LUm2eRy/rs6T/+Spn+Yo/jq6gLw6jmqL1h2AV5FFHpIJe
 mH6CoagQSGUCqrM0aZ4nMXaJZKnGAIk=
X-Authority-Analysis: v=2.4 cv=UehhjqSN c=1 sm=1 tr=0 ts=6a4e172e cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=KqGaXZP3fpkHBQvqf4kA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: GqYT7RT1JYWYlYmJ7fjCg-_eQ8OKQxw9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607080090
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-117558-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:mukesh.savaliya@oss.qualcomm.com,m:viken.dadhaniya@oss.qualcomm.com,m:andi.shyti@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-i2c@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:naresh.maramaina@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C5A4E723C1A

Hi Mukesh,

On 08-07-2026 13:05, Mukesh Savaliya wrote:
>
>
> On 7/8/2026 11:45 AM, Praveen Talari wrote:
>> The driver uses the shared gi2c->done completion for transfer, abort,
> shared => common completion event for transfer, abort and DMA reset
Sure.
>> and DMA reset operations. This allows unrelated completion events to
>> prematurely wake abort and reset waiters, leading to incorrect
>> synchronization.
> Aren't they in sequence i.e. one after another ?

If the IRQ is triggered late, it can impact the subsequent transfer 
because gi2c->done may be cleared before the delayed interrupt is handled.

>>
>> Introduce dedicated completions for abort, TX reset, and RX reset
>> operations, and signal them only from their respective interrupt
>> events. This removes the dependency on shared completion state and
>> eliminates the abort_done flag-based synchronization.
>>
>> Co-developed-by: Naresh Maramaina <naresh.maramaina@oss.qualcomm.com>
>> Signed-off-by: Naresh Maramaina <naresh.maramaina@oss.qualcomm.com>
>> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
>> ---
>>   drivers/i2c/busses/i2c-qcom-geni.c | 54 
>> +++++++++++++++++++-------------------
>>   1 file changed, 27 insertions(+), 27 deletions(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c 
>> b/drivers/i2c/busses/i2c-qcom-geni.c
>> index 15403edb355a..9490aee4928c 100644
>> --- a/drivers/i2c/busses/i2c-qcom-geni.c
>> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
>> @@ -113,7 +113,10 @@ struct geni_i2c_dev {
>>       int err;
>>       struct i2c_adapter adap;
>>       struct completion done;
>> +    struct completion abort_done;
>>       struct completion cancel_done;
>> +    struct completion tx_reset_done;
>> +    struct completion rx_reset_done;
> tx or rx, any one would be running. Not both right ?
> if so, i suggest to keep common dma_reset_done.

As explained above, there is a possibility that a delayed IRQ may occur 
while another reset operation is still in progress, potentially 
affecting the reset sequence.

Thanks,

Praveen Talari

>>       struct i2c_msg *cur;
>>       int cur_wr;
>>       int cur_rd;
>> @@ -127,7 +130,6 @@ struct geni_i2c_dev {
> [..]
>

