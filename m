Return-Path: <linux-arm-msm+bounces-116476-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id MXdkBlafSGoMsAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116476-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Jul 2026 07:51:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B850706B66
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Jul 2026 07:51:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=KVj9nhfp;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=PewFPdes;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116476-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116476-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 181723002296
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Jul 2026 05:51:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8337538888C;
	Sat,  4 Jul 2026 05:51:06 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 151B630215A
	for <linux-arm-msm@vger.kernel.org>; Sat,  4 Jul 2026 05:51:04 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783144266; cv=none; b=XFca+xoDOu9wqAuE+Wa/zwJ0sEc8bZ1gmBQEQD1HlgIgkO2Fos4TtbrrCQSLeV7lFe0kyp+EvvNdkdX8VCXnRaBVtdUggVm1GGuVjV2MU17ZW+NyeF3B1YRBEQfqj9hTw7Zxic1s1+veSStcaeAMTjyOLFxHltBxoGrOhLEtXIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783144266; c=relaxed/simple;
	bh=hrDTIMmfyR0bS4ItNIUcF/yfI+80W3HJbfHRHlQb56U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gcr2HPM5nkFaLjZ57KQ5NWNtmb1hw/tcuxoDO0IevrZO8BlqY6mQnlnGbojtBCRzFiTz08sVxydFoVQIbwhxCwRQqMUh42bc9h766qrjpFdRDhHgMnQJz7Had9weGiULE1muFtzoiaeMw4p6uGvc1BwQNCpvK/gNR/9s7+NgFXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KVj9nhfp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PewFPdes; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6644mCVu1913305
	for <linux-arm-msm@vger.kernel.org>; Sat, 4 Jul 2026 05:51:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BPgsw4LHcZkkkqPUiF95WWE89s3NKtA9u8XaxB5FvJU=; b=KVj9nhfpZz/OR4Es
	g3MYKSHaopMTLEN3vkK/DHyyxVOSsg38ARKuvgG7TNmOo5vIsmbY+Jhx+MKJ4DkW
	BqEdnyR+OqQ69kNXJU16xVASNIzhaUY0ySMmQ+3iUlO3L9k4qCgoCbIbpIPcUb0m
	9pWlBlyAllFM5dVdAxTA6oF4EW8j5YzQQh9zg66rL2trn9Jq2FECFe4tSatPshuV
	2w8FTbeflcETUm60Pw+WigujBcVmfzKptw0tHkCAUzUtGsnUXylRllS/eUKQZ6Z0
	a46VgWZy7Dgix4jVASXYcPdURiH1uiaDw9mTfPCZ/XHQnEuqqNkF6q3sHd+6+s7X
	9LCe+Q==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6uf8035x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 04 Jul 2026 05:51:04 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-381abcccbf4so546624a91.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 22:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783144264; x=1783749064; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BPgsw4LHcZkkkqPUiF95WWE89s3NKtA9u8XaxB5FvJU=;
        b=PewFPdesWlb2g78dH1tBfzJqcN42p137hXnStVdG5qm9tCQEoejogkIecx0sdiHnR/
         pEmeaKDk6x4wbFi5CK1HmehqIoPj7A2QXrZpO23fcKMc3f14yJ59Q1t3fCgZwbjBffYO
         z7kUVRHUvdC19OLh58QF0zZDBJFcuJDtZqQj5WCtjZU4C9slV/stUyY8o1dU+oMx2Rji
         j03LYk4d83oS904bncJLx3sY7qv9ufy9IGE5VkHQPGup44//fGM9cXjMR1fTqwOAdB25
         pCNWB/V6zCWV5LM8lTz2Vak1URQejPb58/mfhRN3YRXjvV4HxdcFJim1PuFAoS76oqFi
         oY6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783144264; x=1783749064;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BPgsw4LHcZkkkqPUiF95WWE89s3NKtA9u8XaxB5FvJU=;
        b=L3qDMf3aqYRgFeGkIvuwSBF6G23jLiHxejV8AyahU7VemGF6RMIVeu8wB2lrkQG/8C
         95ocOF801tuyTIpDgR52HUnkSBnm99Z9lnqtNRCns5AM/B9Kc6lZ6lgmCa9aqpOfeCNy
         t3R8vfWV869uDUHXsBXfJiOz63eNWwep0HNKUNh89P1XQvuN9vUeK+zCF6YvC7+pm8ku
         pTx8DuFo2ffvHD4MotYa2UQhC8Gah+9ozAOcHNgBfXW1fnL3F+zOzdf/yXJNripzxAO2
         pIAyzoNNOrRnVNccNBkN9z7PVeuxAjHRlquPL1+/mCIHHOQVUduPhTO+5QMJPJMTl5qU
         rOuw==
X-Forwarded-Encrypted: i=1; AHgh+Rq8Bwq0qtnjTMRVIq4MAeFf/5elD7S/fYcin/f3tWml8SCcAP1jqnUBT/1LQrM+H5CoR5G7TnENu8yXIUyz@vger.kernel.org
X-Gm-Message-State: AOJu0YxvPo+biqzDi4XbjEn6q4LtPZJtqDaSrXiuMx1VZnNzwee3RFTH
	uAFfzPSavbw/mZe4qjV6CElagdN9vJHg4W4nT2S5ZqwHaX8bs7bHmp9DOzJOgXcW/7IOJLKPhul
	MCbBnPbTD8RQT1kBuJx1oJC+G62PUJSZ8UEeUqpZG/3EGNc4S3cuvwG5CYUJUNI7kj1jR
X-Gm-Gg: AfdE7cmu3c2VBYG6Ml0xmbs7gsAGA/UiWTpzw98D8vEEbLQqLOzjQ/vV1Y4bK91dsoY
	VOp0s634w3peEFKVZw4atc2fuGAKIiq13VFzE/jT8sDwv4gDM061Aclxh5ghQmBJqyoYWNd9ahi
	KjZAjxymnohCgNNIEjy/PV1KidP1Yi4RNqr/tVh/anhX1xn/8Cc6R3XCK3MVQmFu01OTDr4ilGc
	SQWpe4iMmsN4zHOT45i2FRzFEUC+3xtvJU5iCJjS6QzpdiUuj/EAfaURh74aMnR5NXTGKuhmvEU
	q50VOgEccCxVbtqx5XqjRd3FLC8s2R92/qTltHZ4QNVwoPF/GHJ6wwv8iiPVkXfdmagHtKZPfz4
	mSedb64QK04FQydzUdDjR0hCHoTuCkpCVlSBGv9q0HF4=
X-Received: by 2002:a17:90b:510e:b0:37f:133a:3e09 with SMTP id 98e67ed59e1d1-382803b483amr2336970a91.3.1783144263613;
        Fri, 03 Jul 2026 22:51:03 -0700 (PDT)
X-Received: by 2002:a17:90b:510e:b0:37f:133a:3e09 with SMTP id 98e67ed59e1d1-382803b483amr2336920a91.3.1783144262906;
        Fri, 03 Jul 2026 22:51:02 -0700 (PDT)
Received: from [192.168.0.3] ([49.204.111.196])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f31e7a2a8sm12120126eec.25.2026.07.03.22.50.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2026 22:51:02 -0700 (PDT)
Message-ID: <ecbaece7-764c-4e0e-b490-55d538f8aa29@oss.qualcomm.com>
Date: Sat, 4 Jul 2026 11:20:54 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] PM: runtime: Only set runtime_error on suspend
 callback failures
To: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Dilip Kota <dkota@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Girish Mahadevan
 <girishm@codeaurora.org>,
        Alok Chauhan <alokc@codeaurora.org>, bjorn.andersson@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Len Brown <lenb@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Douglas Anderson
 <dianders@chromium.org>, linux-spi@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        aniket.randive@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com,
        jyothi.seerapu@oss.qualcomm.com, linux-pm@vger.kernel.org,
        driver-core@lists.linux.dev
References: <20260703-fix_sticky_-einval_after_pm_runtime_api_failure-v2-0-578b78a0cf46@oss.qualcomm.com>
 <20260703-fix_sticky_-einval_after_pm_runtime_api_failure-v2-1-578b78a0cf46@oss.qualcomm.com>
 <CAJZ5v0haSHfupyfnVGX_v4K0wYrjn-83NiDPPfC22x=zwi8igg@mail.gmail.com>
Content-Language: en-US
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
In-Reply-To: <CAJZ5v0haSHfupyfnVGX_v4K0wYrjn-83NiDPPfC22x=zwi8igg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: IkMMjG0SRqoly8-2DFoIG1XOcgw_GCsJ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA0MDA1MyBTYWx0ZWRfXwZ+7Fn/AvO7M
 KR0IdfRCjxfnIfN325cXgx3yyUYWA878f1+ErpHEowUL0eZLSZm6NRqH72h126DFqoinvEOQFx3
 AhVV+oQKB617zmMZpaeuxsaUaneC6NE=
X-Authority-Analysis: v=2.4 cv=Z4Tc2nRA c=1 sm=1 tr=0 ts=6a489f48 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=7DW+zsgf7PPjz/i6iZMG3g==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=cavnWwEOFYD_SYEfP9UA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: IkMMjG0SRqoly8-2DFoIG1XOcgw_GCsJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA0MDA1MyBTYWx0ZWRfX96UnRvZ5YTCd
 mt4ZCjlOBhrzV8IlD7IIDF8Rogaj3Pm5u4JvodGst/Ks33lLLYWSAICrdN2AEK9V1e/Ms42GFmb
 0tELmS+xDGrCyQIpD1LGrh2EBiMITd/Sm+Prnj86swDUZnCeuXhOaa0XrpURndtm4GdBz/lidlx
 C3CFkNCWqIT4v+iQAfQPjMm8OyPvg3MJCsBudevpPi+JRIeffY6/I95jefg53maHkBIUfeVsUxP
 v5eR+0AkbRdLUoiYAP0z7SZcO2gPaYFENwX3OpHuRJrRqmh4DGTU3EIf753J02F0ZOQ5z1bMRRR
 Syg4FoZDTztE8JvDwC+UPllV8nO76PpUuIB0f/DM7l9eiqiKpA/EaN+rLsokYuSYTipIEm7YrP0
 T2sfvODcO4Ch4Cg5eptQmwFH+/9iHCNjANSDH3u2obPRMAC7NwCwL8NZBAxRXKf6iHpYz+ReEsC
 0YM1a8yuH/ZoIe417sg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_04,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 spamscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607040053
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116476-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:rafael@kernel.org,m:broonie@kernel.org,m:dkota@codeaurora.org,m:swboyd@chromium.org,m:girishm@codeaurora.org,m:alokc@codeaurora.org,m:bjorn.andersson@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:lenb@kernel.org,m:pavel@kernel.org,m:gregkh@linuxfoundation.org,m:dakr@kernel.org,m:dianders@chromium.org,m:linux-spi@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:mukesh.savaliya@oss.qualcomm.com,m:aniket.randive@oss.qualcomm.com,m:chandana.chiluveru@oss.qualcomm.com,m:jyothi.seerapu@oss.qualcomm.com,m:linux-pm@vger.kernel.org,m:driver-core@lists.linux.dev,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6B850706B66

Hi Rafael,

On 04-07-2026 01:53, Rafael J. Wysocki (Intel) wrote:
> On Fri, Jul 3, 2026 at 5:05 PM Praveen Talari
> <praveen.talari@oss.qualcomm.com> wrote:
>> When a runtime resume callback returns an error, rpm_callback() sets
>> power.runtime_error on the device.  This causes all subsequent calls to
>> rpm_resume() to return -EINVAL immediately at the top of the function
>> without invoking the callback again, making the failure permanent until
>> runtime PM is explicitly re-initialized.
>>
>> Unlike suspend failures, resume failures should be retryable.  If a
>> device's resume callback fails transiently, there is no reason to
>> permanently block future resume attempts on that device and all of its
>> consumers.
>>
>> Fix this by conditioning the power.runtime_error assignment in
>> rpm_callback() on the device being in the RPM_SUSPENDING state.  At the
>> point rpm_callback() runs, __update_runtime_status() has already set the
>> device status to either RPM_SUSPENDING or RPM_RESUMING, so the two paths
>> are reliably distinguishable.  Suspend callback failures continue to set
>> power.runtime_error as before.  Resume callback failures return the error
>> to the caller but leave power.runtime_error clear, allowing the next
>> resume attempt to invoke the callback normally.
>>
>> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
>> ---
>>   drivers/base/power/runtime.c | 8 +++++++-
>>   1 file changed, 7 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/base/power/runtime.c b/drivers/base/power/runtime.c
>> index 335288e8b5b3..70d933bcd295 100644
>> --- a/drivers/base/power/runtime.c
>> +++ b/drivers/base/power/runtime.c
>> @@ -469,7 +469,13 @@ static int rpm_callback(int (*cb)(struct device *), struct device *dev)
>>          if (retval == -EACCES)
>>                  retval = -EAGAIN;
>>
>> -       if (retval != -EAGAIN && retval != -EBUSY)
>> +       /*
>> +        * Only stick the error on suspend failures.  Resume failures are not
>> +        * treated as permanent so that the next resume attempt will run the
>> +        * callback again rather than short-circuiting on runtime_error.
>> +        */
>> +       if (retval != -EAGAIN && retval != -EBUSY &&
>> +           dev->power.runtime_status == RPM_SUSPENDING)
>>                  dev->power.runtime_error = retval;
> Why don't you move this check to rpm_suspend()?
Yes, we can do that.
I hope the changes below address your concerns. Please let me know if 
there is anything else that needs to be adjusted.

diff --git a/drivers/base/power/runtime.c b/drivers/base/power/runtime.c
index 335288e8b5b3..fab38bc98113 100644
--- a/drivers/base/power/runtime.c
+++ b/drivers/base/power/runtime.c
@@ -469,9 +469,6 @@ static int rpm_callback(int (*cb)(struct device *), 
struct device *dev)
         if (retval == -EACCES)
                 retval = -EAGAIN;

-       if (retval != -EAGAIN && retval != -EBUSY)
-               dev->power.runtime_error = retval;
-
         return retval;
  }

@@ -751,6 +748,9 @@ static int rpm_suspend(struct device *dev, int rpmflags)
         dev->power.deferred_resume = false;
         wake_up_all(&dev->power.wait_queue);

+       if (retval != -EAGAIN && retval != -EBUSY)
+               dev->power.runtime_error = retval;

+


Thanks,

Praveen Talari



