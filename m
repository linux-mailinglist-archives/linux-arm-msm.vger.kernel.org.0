Return-Path: <linux-arm-msm+bounces-93684-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8LUfDQZTnGktDwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93684-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 14:15:50 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8939C1769F8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 14:15:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 25BE83074136
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 13:14:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3426366807;
	Mon, 23 Feb 2026 13:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KcRZ4Ga1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QHcLrKJn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FCD636605E
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 13:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771852490; cv=none; b=J1Vh/FqFot0Yfhq7S+CT9IkyRR9JnfhBFzfkUT+v3f/J3estPSTh8eISL5U6Hw2QAJrKr7KodLmCUfbB4KcCP5pwqAyrYmxOfRTdxdgQ5jMiaYB5S8hORDrpT7ZsSY/XsQyONT24AfrUOMvGsI9yY44EmeHeXm2Re4YZTmWecxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771852490; c=relaxed/simple;
	bh=HGPw30IvhAi0Qz9hdPZFbeQupTic9NG0gh3cwcnpU0s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XSCm5M556ZPVJFetSxKsdfy3cdmPaH5/lYNG1zX9vG3ZvThjVZjhLxUiAfrjLQatna9xi1BkPz2EZ3/Si6Tx5oRwE26mpfEj2in1FUX6vkJ2Lfe+I19jfZIpkEx4EKqpvcUqfRUCQKsyBf+UyaNEnQgl2Havmm8jGQ5C6Uk7d8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KcRZ4Ga1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QHcLrKJn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61NC2n3G3151933
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 13:14:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oJ09ARFhzE+iiwwCdtmvBFcq8IkTr/eQoxjEjsY0p88=; b=KcRZ4Ga1DNb2ypSU
	7TG4lEuZfCE/I7ePhX17pS17A0fkt8H9CmQknZ06WksCGtaEkSRCWd/V5vxpn+wf
	sUXfjipoO+eI4HLu7B76qT8CAhvO/rxXwzQxTfYXkwcBC5mwFBT/mlF7jQpc3AxE
	EOeqx52jDgothWoaYBm57lNjKkheTcLLtPP4zBWAopjxAD+k6FsDtE81y+AahwrQ
	RbY4JUaz1QdyGp0H5N7UxYxDhKyP8q0SC5V3qTa7mpFpiS43wlFrdMReGfpaemfr
	epG2EZIkrWhW3bKl3yAv3rU1ww65zrRJG6phBx9QHYqPKET3VRdDsLBi82X6csuQ
	822Ldw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgpj8853p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 13:14:48 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb45a6b860so372698485a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 05:14:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771852488; x=1772457288; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oJ09ARFhzE+iiwwCdtmvBFcq8IkTr/eQoxjEjsY0p88=;
        b=QHcLrKJnlGG4QPPiWIBv0bF45gvW+m6wF9JnrPAaUW46ya2uoKwzYzlqbH7ww33nvH
         yvg8tP2InprxfC+KVFI0WLF6sudWnqY3W3AFxK8Zxkw7u550aPFkaPUkiCyaPc973QD+
         aROT9yKYeYpdCSsAAR+1pHzTixtpSi/HmUJahVf7z6H9HZiyTsd5kOndlkF1SWWcU2wN
         WAAp8dd1UfJI+B8KH9ZtQnElLolesHqoUFIG/IGK+Dly+wMnwcZjBl9xh1f8ygNRqg1X
         0hqW/6peYBarid9Lon+LWiXTAOjNdSchzKAwS3rdbKRidJbdVlFVud9p5z7IiE2ELg+B
         kBYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771852488; x=1772457288;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oJ09ARFhzE+iiwwCdtmvBFcq8IkTr/eQoxjEjsY0p88=;
        b=P06H+o+5sk5Qo65dixWqMFIZsfH9tuOrk+FPeryzc9aewQlKG8yGASo/bzWMv9BP1M
         GaslSS6Quu/IQwVC+H+NlUcb9RR8qsfBRe4IFCp1Rr+JxgDgvWVCOwMYJVf1w1C9YuPf
         3zT1W/GlydyEE//a7ykoGU6ngzAhpZozhJW+s1YUjwSCMLvRMCVfViSyGcTTMt4esIHp
         IpttkG1xOA/Mdkl1T8ogWRu+ewUr7GYc/lr2GruvMQf+vDWGTUEPLZjEsqtnTAyD8iKP
         UPVWSILq2AopdusfzsVZz+wSOm18mEKbcHp4+apSNZRA3cQPnBrSSuV0vtaON7r67beN
         uA1w==
X-Forwarded-Encrypted: i=1; AJvYcCXKUyJUll4MabORTOy2z7luqE8GsbkwdfRgvoce1HuR83ACNDBqDbSoCyDdkvrtbKjUTigsKq2VgTrqjVLB@vger.kernel.org
X-Gm-Message-State: AOJu0YzS4TVbvyVIVj2cLZAW95SHtCvXsa0mL2bVzaiLwz/ep0zu+5EF
	F4UKaZup+oAMUyD8mffXz8F8ldO/++4YCHHJOgl1TuD8aTxLFpn5DF1c9PJl9OWI0DwG/xm+OJT
	WjbeFeq6RobumNIJJg3RNQCGIxhCIaT/0xZoK+v/7o13OgNNduAmMyzq25afm/XCV98zV
X-Gm-Gg: AZuq6aK6GiBkTYy1+STEryZZ2CL9Bw93Jb9QYfX0Vlroslf0x23NPkL1inYbOyGnmQl
	E1pv2MSCLyrwig3thitIPEoCR/Vu8d5/IQhlwaVXZ/aA0OsmsRKBj9b7hKd9s+bwqs6g3ddOlC3
	MYThyvHE5VJj4fhYI6i5U5J0/6CGg5vlqc7LNQVu1mdgeqPXKa1MYv9fdqBNnZO8oTDATYsIoIu
	1mF+eKCdbP4SBcDvJkXQVAZLoLZJ2tMSOVltckSgWrWHk1/TkwqehVUAoh+46CAPoqkmMCKP6mx
	YDWiJ1sjEr4o4k4Ld8DyASEdY2T6K0/L/mMBBZU0NAmb07AIi+JuwYU5CA2D1s6VQRbAGC4So0t
	TlMOfKZkjO9fl/xEKnkT3yvZihXaO9RaWwosXpoDaIhtjIZkjYnS+66iuJg0nA+xGvREOUFaNxC
	cOsDQ=
X-Received: by 2002:a05:620a:1a25:b0:8c7:1aea:53b7 with SMTP id af79cd13be357-8cb8caa40f8mr819521285a.9.1771852487662;
        Mon, 23 Feb 2026 05:14:47 -0800 (PST)
X-Received: by 2002:a05:620a:1a25:b0:8c7:1aea:53b7 with SMTP id af79cd13be357-8cb8caa40f8mr819517985a.9.1771852487150;
        Mon, 23 Feb 2026 05:14:47 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9084e8b790sm329522566b.49.2026.02.23.05.14.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Feb 2026 05:14:46 -0800 (PST)
Message-ID: <ee3facd2-5670-43d5-8da5-65dd0a1a9752@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 14:14:44 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7] crypto: qce - Add runtime PM and interconnect
 bandwidth scaling support
To: Bjorn Andersson <andersson@kernel.org>
Cc: quic_utiwari@quicinc.com, herbert@gondor.apana.org.au,
        thara.gopinath@gmail.com, davem@davemloft.net,
        linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_neersoni@quicinc.com
References: <20260220072818.2921517-1-quic_utiwari@quicinc.com>
 <ab5725df-8454-4e3d-8806-a711ef0e6a42@oss.qualcomm.com>
 <fnsagbqvriuxdz4xrvs76kwovu3oir3662tu4niii56tgz2cag@zrxyd36qmujb>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <fnsagbqvriuxdz4xrvs76kwovu3oir3662tu4niii56tgz2cag@zrxyd36qmujb>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDExNCBTYWx0ZWRfXw50uWywZcFfT
 jHi8pjoyUxiRg5ljrOZpx8Vf+egb08FrvilgwP9X3BmhlinQNifY0XKyuSap6JjFmhK5pOM6eij
 clVrm9Wv8z9ICEfTMcqoU4DCllCNQDc1/1tavQscAyCLdgFI8AwWFqnz4S7SGbvV96Fh7C5sE5z
 /JlcgoqpZfvlBFBLPjFcpsCg/ruj0dn8q5ZjMbIHB0ntuWPDIgag1Rn4oUnUli+6ezgUoSHnDwl
 VJSowTG/9GZihoflzbjuEpBRI/317a6P4S6k0R9OtnmGC8r6a6tuzHchQzQPSS3nizyJOmx/5V3
 in8rwyxVJhG/Cn/cUOIPzs7PQTRF8O06vL1QOBpm6lhG8JKGtqsZ4W0fRbTOZ/kW2RyM0hRRcSO
 as4RcHcLosPsqt7z35k1Xv7Mn+0zmfoStMHyGamVWgp+5x1w8rVxFhOOa8VKxRM5EH+9MXV3MQT
 kquSHHIWQxhNAioLsiQ==
X-Proofpoint-GUID: UzAmYDsGxxsL6QM_igVRm_jQJRzaKwkQ
X-Authority-Analysis: v=2.4 cv=Z5Lh3XRA c=1 sm=1 tr=0 ts=699c52c8 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=COk6AnOGAAAA:8 a=1nBFhei-SnZgKy-kEtUA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: UzAmYDsGxxsL6QM_igVRm_jQJRzaKwkQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_02,2026-02-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 phishscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230114
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[quicinc.com,gondor.apana.org.au,gmail.com,davemloft.net,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-93684-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[quicinc.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8939C1769F8
X-Rspamd-Action: no action

On 2/21/26 5:00 AM, Bjorn Andersson wrote:
> On Fri, Feb 20, 2026 at 10:52:04AM +0100, Konrad Dybcio wrote:
>> On 2/20/26 8:28 AM, quic_utiwari@quicinc.com wrote:
>>> From: Udit Tiwari <quic_utiwari@quicinc.com>
>>>
>>> The Qualcomm Crypto Engine (QCE) driver currently lacks support for
>>> runtime power management (PM) and interconnect bandwidth control.
>>> As a result, the hardware remains fully powered and clocks stay
>>> enabled even when the device is idle. Additionally, static
>>> interconnect bandwidth votes are held indefinitely, preventing the
>>> system from reclaiming unused bandwidth.
>>>
>>> Address this by enabling runtime PM and dynamic interconnect
>>> bandwidth scaling to allow the system to suspend the device when idle
>>> and scale interconnect usage based on actual demand. Improve overall
>>> system efficiency by reducing power usage and optimizing interconnect
>>> resource allocation.
>>
>> [...]

[...]

>>
>>
>>> +static int __maybe_unused qce_runtime_suspend(struct device *dev)
>>
>> I think you should be able to drop __maybe_unused if you drop the
>> SET_ prefix in pm_ops
> 
> I believe that's correct.
> 
>> and add a pm_ptr() around &qce_crypto_pm_ops in
>> the assignment at the end
>>
> 
> Doesn't that turn into NULL if CONFIG_PM=n and then you get a warning
> about unused struct?

If I'm reading

1a3c7bb08826 ("PM: core: Add new *_PM_OPS macros, deprecate old ones")

correctly, it should be fine.. I'm seeing e.g. 

161266c754e7 ("can: rcar_canfd: Convert to DEFINE_SIMPLE_DEV_PM_OPS()")

do that, but I don't fully understand why this works. Perhaps __maybe_unused
does not resolve recursively?

> 
>>> +{
>>> +	struct qce_device *qce = dev_get_drvdata(dev);
>>> +
>>> +	icc_disable(qce->mem_path);
>>
>> icc_disable() can also fail, since under the hood it's an icc_set(path, 0, 0),
>> please check its retval
>>
> 
> Given that the outcome of returning an error from the runtime_suspend
> callback is to leave the domain in ACTIVE state I presume that also
> means we need to turn icc_enable() again if pm_clk_suspend() where to
> fail?

Seems that way

> Two things I noted while looking at icc_disable():
> 
> 1) icc_bulk_disable() return type is void. Which perhaps relates to the
> fact that qcom_icc_set() can't fail?

I think both of these are problems.


> 2) Error handling in icc_disable() is broken.
> 
> icc_disable() sets enabled = false on the path, then calls icc_set_bw()
> with the current bandwith again. This stores the old votes, then calls
> aggregate_requests() (which ignored enabled == false votes) and then
> attempts to apply_contraints().
> 
> If the apply_contraints() fails, it reinstate the old vote (which in
> this case is the same as the new vote) and then does the
> aggregate_requests() and apply_contraints() dance again.
> 
> I'm assuming the idea here is to give the provider->set() method a
> chance to reject the new votes.

For obscure cases where e.g. going under a certain total bandwidth
across a bus would be strictly forbidden and only enforced in .set()?

> But during the re-application of the old votes (which are same as the
> new ones) enabled is still false across the path, so we're not
> reinstating anything and while we're exiting icc_disabled() with an
> error, the path is now disabled - in software, because we have no idea
> what the hardware state is.

What you described also seems like a real issue. The latter part, we
probably just have to hope that the "enable back" vote goes through.
Else, the system would likely fall apart within seconds anyway

Konrad

