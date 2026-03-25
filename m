Return-Path: <linux-arm-msm+bounces-99897-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CBGDJ3wCxGm0vQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99897-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 16:42:52 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F305328455
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 16:42:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9796330AC85B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 15:34:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEE6E3E0C67;
	Wed, 25 Mar 2026 15:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hazzhJ4/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hiqnWxRm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BEFD3CCFBA
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 15:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774452854; cv=none; b=BP802S1GbI+/sgCbHotpI3ZNUUkCED8tKzUdxdufWmsmF0o+qURdrRP6+TA6MjJao181hypfsdiGHufEwFkkV6ci2s5uD10pAFQ8rRRN7PoESt6YDyYvljN8GugT995SN7rvjtiSI5w/DR7dVJPBLMO0a8JkgtvW/o1kXQhxbx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774452854; c=relaxed/simple;
	bh=vPGIzMiyO5TeElcR4phkh0O4Z3y4C+7N0wLVWgHYFZk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CySCv+f66fwbmemkmzq+4cWmVSGX5/CXesoZeA/HIAO7nhHedwEwsgdsN3nLZFnWDFgybu33j8lguLBzeYFL4foSOje/BJNfME1Nd/cqawJxWnCd0g+vKnb4z4ygfSGRCFN+frybusmn8/3G/3E39uiMviYituZl0Hcm5/6Ru0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hazzhJ4/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hiqnWxRm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PFHHe0779740
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 15:34:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JJbISd+NYRXiouLIvxTEhljHuABzyURDFTMQeKuO6e0=; b=hazzhJ4/WcyRYWXM
	X0WTj0cuikqgggof07qbKtXmlB5xRBQ7g5pcoxOMdz4P/do9TK1qF3OAB3ty7Osu
	4rmoOaVwtoxWktm0pwI0V6vCTc39XSml0d1L184pV7vbbcyRBYkDKaRHAuUQKGLd
	f/sYS61TVXURYhMt/A+KN5a5kUjMVAoyz4X9ccDAjqyGygPIR0Tbb3IxSD9MMMeh
	WvvPd3Nngq+lFfuXyUqOT1VQreyKB0pzG+qmTRZkO7n0FNte0iRJj3IClck/SqvK
	GYfvrrATvcq09P6wX0y2lXzYjSIRdv5MuUWCjmL10BKZ+jSU5K4If9/lqMczuXI7
	eYSz2Q==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4cvp1cug-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 15:34:11 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b04911610fso30771035ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 08:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774452851; x=1775057651; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JJbISd+NYRXiouLIvxTEhljHuABzyURDFTMQeKuO6e0=;
        b=hiqnWxRmMDmGDeFGOPXXO4xCorOD69e4anW65L3cOOKZ5m31zYns2InMwyzTInUdb0
         kKrbEZqA7tzo2K18XXzULaPa+xFMfQmeC3znb1H4q7DTELSF/Ms9YiLrTXanHACSrMvD
         GdeepvmQF0FBw0wPs29mY4n+kGkVR68oADr8CBXFycoJ1a76mQaZYIuOIm33v89NJKB1
         dJ397X3TR2I1VTczefQ03BLl37VMeTEpogOGBy+LdQ+jOXpAsnWVFtE9HmDmuYqcssYa
         W4dlZ2ofWxeyX3dCbVMBlBvHhrltQDgnZG6DcZ3ee7mSWbeGUdNM2PRuPlED/0UZx+r3
         +2iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774452851; x=1775057651;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JJbISd+NYRXiouLIvxTEhljHuABzyURDFTMQeKuO6e0=;
        b=htGZznPvY31jBGQYxUj5pCaTKguH2SXfyIhu75Lecys5uUxZoXvdmpoNB+0kl6vcmW
         krvvA8FJVwV+Gq6id073K7PzzzPzanh8gmX64ihvT5Pz4HzUJ3wWi51k6o3U0hB/CPLZ
         FYfkjSEUJK0RENdK/aqeABRJjo8Ti2Q3rOzoNSeaULMxP3t1gBqKdaVWvJaVOMGLkKKj
         PwkGmJ79Q9HE719/2kgVietPOoi5RiFNQBlDV0yUvy/pi8gwatS47s2a0wzj+GZ9Kalt
         ZfFB6FuRMOXMzj0kVN9p2MMgi0xcp1Uob7fqQHAKNUqd/enrCgpKpwCDzpraSGUHWRNS
         UXrA==
X-Forwarded-Encrypted: i=1; AJvYcCVPonzPT3MiygZ+nKSY2xvFGdShHNyFdOSYpS9HaYrvmrrApfjMuxNnJl8CoDtndJhLDBcqAsGGE4U0IlaD@vger.kernel.org
X-Gm-Message-State: AOJu0YzmSgKFiz/+Owgnhzn1abYHzOcxov5gOYZGlP1MKmpO6G78x0iU
	r0l5VzR48ChPp3WTzv9ASnUqYT7Wlq4j+Q2uNu/eECR4mtQkDK8NnFLl0ZlMeTbw4cuZzSa3/BN
	iZKj5mmI+1Ue3Xdng8gJr6WWX4RvMe5pVCEv60k21dPjwRczxi/6Bv5NIYMHTaWNsWDYs
X-Gm-Gg: ATEYQzwXH7Tuk1NgmImyESxg93Wq6Cwa7kWn2FZdm/E1piG3/vvnQ3Yj4IPlcAZjApA
	+pxPpFdEl4ibJqXozk8AJRXK1tfdt0Errx9RmFb3vW8vvuhqOaAXPRvKx8X4/OTpNuIlpQrtoh0
	R7j7IUsxRFy1pfGLlsvXzJ39rAQA/bZyYbhFihOV+bzI4oBx18GXWb+rj+9b7R9m5dqNrT0p9r9
	a32DTXKR9mzQrrHC2kdrHoiP2tvHqqQU13Qybr8VX3X4cuViNCn6zXBjRJKSJxvbWC23dbMsGOF
	PkMriI9B6pq//hDwtdjXxXPrXeny/2CHObFQUaUEmQ9f3COAsftxziw2BShwWuJJZiJTS9g+QmO
	ux16Kfot6V1dfKnTU/LOJehoHLDboLeuosIYJMVAIDBECnhbsa3z9
X-Received: by 2002:a17:903:943:b0:2ae:4445:f397 with SMTP id d9443c01a7336-2b0b09e0913mr45260755ad.16.1774452850479;
        Wed, 25 Mar 2026 08:34:10 -0700 (PDT)
X-Received: by 2002:a17:903:943:b0:2ae:4445:f397 with SMTP id d9443c01a7336-2b0b09e0913mr45260405ad.16.1774452849948;
        Wed, 25 Mar 2026 08:34:09 -0700 (PDT)
Received: from [192.168.29.179] ([49.43.224.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0bc87e4e4sm1852915ad.38.2026.03.25.08.34.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 08:34:09 -0700 (PDT)
Message-ID: <fb66b223-329d-44f4-b0a8-0a6b321f9dea@oss.qualcomm.com>
Date: Wed, 25 Mar 2026 21:04:04 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] cpuidle: Deny idle entry when CPU already have IPI
 interrupt pending
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20260316-cpuidle_ipi-v1-1-d0ff6350f4e2@oss.qualcomm.com>
 <CAPDyKFqJX3rN0GY1j3-RDXGc0jCcMTG=OmWzi9+2y7CXJOvY3A@mail.gmail.com>
Content-Language: en-US
From: "Maulik Shah (mkshah)" <maulik.shah@oss.qualcomm.com>
In-Reply-To: <CAPDyKFqJX3rN0GY1j3-RDXGc0jCcMTG=OmWzi9+2y7CXJOvY3A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: sz3kVmxt-XpmXxxc7jtFkPxRp8RpXvKG
X-Proofpoint-GUID: sz3kVmxt-XpmXxxc7jtFkPxRp8RpXvKG
X-Authority-Analysis: v=2.4 cv=Q73fIo2a c=1 sm=1 tr=0 ts=69c40073 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=j/PqwQOCDgRQPIT2BnD5zw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=okY-DNlmIvmWAd7kz_EA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDExMiBTYWx0ZWRfX552/UNJNAGsd
 VQ1oD1yKMiTw04ei6qL2ieKsrONN/6AJVPbD8e7g2/pqvYJDIBC2JgeNACPUT9XcJYE/RfvMxYF
 mlOJ5jP4bdqHcXjDsmOdIcDUk5xIibxSx7qFeTfq/8XzdB+ekDZhsdso6HJ6ZsAtBkJzxc50gH4
 a3zezpPIwAie+rH7h1R9rN8NoeLT1lNWSZiPvPWIfd63VV+WV4FPuI2zq/LXSVudoeLMHOcGFsu
 qy9tHV4whMnrypqF7PLDlRJFQPV8GA6hduJXSC12Vnl7nzvpkzMdIHZw+cCur+9OEGwb2H7log1
 7TW6d77pDlZGt2Ap7KSXyF90DOCIzb8fV6MHjn8sT7VYu9tvC0xkXdYYHFa0h8dkVL32Wyc8jH+
 s1StGxF7N857MRzFVraaJvasUHcHkmZiTGwDKKBgfSlchjsOuZuXFVwHqi3aqrlgR5Q9c2gpgqU
 me+tJKh45ayt/FoZZdg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_04,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 malwarescore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250112
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99897-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[maulik.shah@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7F305328455
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/24/2026 9:16 PM, Ulf Hansson wrote:
> On Mon, 16 Mar 2026 at 08:38, Maulik Shah <maulik.shah@oss.qualcomm.com> wrote:
>>
>> CPU can get IPI interrupt from another CPU while it is executing
>> cpuidle_select() or about to execute same. The selection do not account
>> for pending interrupts and may continue to enter selected idle state only
>> to exit immediately.
>>
>> Example trace collected when there is cross CPU IPI.
>>
>>  [000] 154.892148: sched_waking: comm=sugov:4 pid=491 prio=-1 target_cpu=007
>>  [000] 154.892148: ipi_raise: target_mask=00000000,00000080 (Function call interrupts)
>>  [007] 154.892162: cpu_idle: state=2 cpu_id=7
>>  [007] 154.892208: cpu_idle: state=4294967295 cpu_id=7
>>  [007] 154.892211: irq_handler_entry: irq=2 name=IPI
>>  [007] 154.892211: ipi_entry: (Function call interrupts)
>>  [007] 154.892213: sched_wakeup: comm=sugov:4 pid=491 prio=-1 target_cpu=007
>>  [007] 154.892214: ipi_exit: (Function call interrupts)
>>
>> This impacts performance and the above count increments.
>>
>> commit ccde6525183c ("smp: Introduce a helper function to check for pending
>> IPIs") already introduced a helper function to check the pending IPIs and
>> it is used in pmdomain governor to deny the cluster level idle state when
>> there is a pending IPI on any of cluster CPUs.
>>
>> This however does not stop CPU to enter CPU level idle state. Make use of
>> same at CPUidle to deny the idle entry when there is already IPI pending.
>>
>> With change observing glmark2 [1] off screen scores improving in the range
>> of 25% to 30% on Qualcomm lemans-evk board which is arm64 based having two
>> clusters each with 4 CPUs.
>>
>> [1] https://github.com/glmark2/glmark2
>>
>> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
>> ---
>>  drivers/cpuidle/cpuidle.c | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/drivers/cpuidle/cpuidle.c b/drivers/cpuidle/cpuidle.c
>> index c7876e9e024f9076663063ad21cfc69343fdbbe7..c88c0cbf910d6c2c09697e6a3ac78c081868c2ad 100644
>> --- a/drivers/cpuidle/cpuidle.c
>> +++ b/drivers/cpuidle/cpuidle.c
>> @@ -224,6 +224,9 @@ noinstr int cpuidle_enter_state(struct cpuidle_device *dev,
>>         bool broadcast = !!(target_state->flags & CPUIDLE_FLAG_TIMER_STOP);
>>         ktime_t time_start, time_end;
>>
>> +       if (cpus_peek_for_pending_ipi(drv->cpumask))
>> +               return -EBUSY;
> 
> As other reviews already pointed out, this must be called only for the
> current CPU.

Yes, addressing in v2.

> 
> That said, did you play with bailing out just before the call to the
> target_state->enter()? It would be interesting to know if that changes
> the "stats" somehow.

Yes, i did play moving this and "stats" do change with differences in next idle state selection.

below is high level scenario happening when the IPI deny change is placed inside target_state->enter()
or any place which will update the rejected count.

Using a menu governor,

 entered_state = target_state->enter(dev, drv, index);

 - entered_state will be negative error when IPI is pending.

 - This makes rejected count increment (which is okay) but it also makes dev->last_residency_ns = 0;

 - For next idle entry, menu governor will log this last interval as failed,
   via menu_select() -> menu_update_intervals(data, UINT_MAX);
   this is because menu_reflect() is not invoked for failed entry.

 - This makes 1 of last 8 intervals invalid, which don't get accounted from get_typical_interval(),
   hence divisor value in this API is never reaching 8, the goto again, loop inside get_typical_interval()
   will get aborted "faster". This interval logging have good influence on next 8 idle entries until
   it will get replaced with meaningful value.

 - In ideal case get_typical_interval() would go from divisor value reaching 8, 7 and then 6 and once its down to 6,
   it gets aborted if not predicted yet, so maximum 3 trials, but with any interval invalid
   it finishes faster, often without prediction.

 - sometimes IPI bailouts may happen frequently, in such cases we have 3 to 4 intervals as invalid in history,
   effectively making get_typical_interval() not predicting since divisor value in first loop would be less than 6.

 - Not predicting via get_typical_interval() can make deeper idle selection more often by only going with
   adjusted sleep lengths.

In summary, 

The benefits seen by aborting the idle entry with IPI pending getting nullified when it is logged
as "rejected" due to next idle entries can go deeper.

If we ignore setting dev->last_residency_ns = 0 for rejected cases or make menu_select() ignore the
last rejected iteration to update in intervals history, this would improve the chances of get_typical_interval()
to predict a meaningful sleep length (in a separate change).

For this change, IMO its better to bail out early without logging, since CPU did not make entry to idle driver yet.

Thanks,
Maulik

> 
>> +
>>         instrumentation_begin();
>>
>>         /*
>>
>> ---
>> base-commit: b84a0ebe421ca56995ff78b66307667b62b3a900
>> change-id: 20260316-cpuidle_ipi-4c64036f9a48
>>
>> Best regards,
>> --
>> Maulik Shah <maulik.shah@oss.qualcomm.com>
>>
> 
> Kind regards
> Uffe


