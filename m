Return-Path: <linux-arm-msm+bounces-116477-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0wFtEqWrSGrKsQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116477-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Jul 2026 08:43:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B2827706E08
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Jul 2026 08:43:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=hz2DIuCX;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=KvxxDFJk;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116477-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116477-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 26B2F301CFF8
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Jul 2026 06:43:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AEE32F693B;
	Sat,  4 Jul 2026 06:43:46 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 098E22EEE86
	for <linux-arm-msm@vger.kernel.org>; Sat,  4 Jul 2026 06:43:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783147426; cv=none; b=mbeh5DQiwZ3oLHx4O/GnibIfbV9lhQWcylqRMFzlFHjLJq8G14XJDqPBwIBC6cEPpx+hQhI2DyImaow2eHe9ufadrc3Y7/BQ8frtGglmMueyaBCw+YAafR26BXap0Aqe6IJ0g5+aNj6uK2V7Xb5V+0adfxobQciPCrRoqox5ufU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783147426; c=relaxed/simple;
	bh=7uTOUt5aNOQDveOWaZ2OE0hDnvhxLRTSC4BUj4qeVOk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=skyj9zKWG7rLuutWY4dPjQ/QimLQf7Dp0qPkuWAmUZf91Jew8Rk2wbf/Sxjmnz5da+oJNtGMOpsU5RExXu/rG1uJWfNtlKH/QWsXC/6sJW7tGVN0WT2IknyZQXWV2f/I1X5pSU8LHnFtw0VUjIz9Ct9+dBAmv5eolfdct8iVYHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hz2DIuCX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KvxxDFJk; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6646hiJh2281482
	for <linux-arm-msm@vger.kernel.org>; Sat, 4 Jul 2026 06:43:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XHcV7kAhtigHBS91AH4yrxaBLXSSv++mF7YkQi6hXOE=; b=hz2DIuCXDtweiogJ
	9FrOmmF6xnSA0abpnJoLk5EkHFSO4Z3RMTO/VQCBWgMjhgRxqAzipmzG4Ypw4lxa
	fk47EmOKcLpGi/ME/7dMtF721Vm3nET+tnJXStFtPeTPzEJ6zqJyrDVhmy0j+Wjh
	6WHPPgZUgQ2HcJ+U9xPnpYK0+xKT3tU8pYKJ7idLmPnVjshnM/tXem19nTrS+ipB
	yL0gw1aDgGTlbuzHSSXXkEgJl8DisoRQo6sltgUywHdbQCiwLYkL6bOSrBeMfAbC
	entTs/8yl4Dj5SzafyI/1R9etZcccXJjnpKlkFXoZ4MWoCTLA6dr5OMy2jrfA5zF
	RpqApg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6qvgrm87-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 04 Jul 2026 06:43:44 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e5fc4c7e9so124450585a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 23:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783147423; x=1783752223; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XHcV7kAhtigHBS91AH4yrxaBLXSSv++mF7YkQi6hXOE=;
        b=KvxxDFJkU442eScXL3q9D424QGlhKDLPhRk+PzefSibaos1/adr0FjuHCK2cPtoNEC
         dO/V5vaNeKRyXwspiNpjql/fYKRssN3Xnwasfif9aLaIwIM1d6VsxNq02W+PB9+9+U5s
         FsgD/iY3gDydOdfAqDpmHl7degaTPvoZxvykm7vIS7qs0Nkzt2+Tq/DO5pMDvnNHrXe0
         +q1/vGsn3dyUTxdVYhXQfjJGSabg3WjTYa/6IPHOLRPvsew5d+0BBaha1MTa57QrbaHE
         ad0KhQd9QQByz5bWPJPvt4sWKUiUCVAMnu78ZskTfDeo7wG/pWwCfdLadg92F0Lio0yb
         Yuxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783147423; x=1783752223;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XHcV7kAhtigHBS91AH4yrxaBLXSSv++mF7YkQi6hXOE=;
        b=YPiIMi8U1lFWk5hkzBbYCBldMH5A5fXPEzvBfOkIMQyZemP/qaqd/o2Owt2BewoM13
         +TstBaDSxN16/oZ6e63mNatwD3VcKHIfQJb0zuOdKtfdpqGHhT6SDQBnKwCI4TmcWpPt
         5FXstXGOQ/y0Yyckpard8QHyA3C9uWeJibjdZMDKcoCnBrWnV9rcm1fbYRIwYOwImx43
         YFEr1ougc5vRQCfbj6peRvMm7J2bJRA6LBB3fxzZo2UDaUrixPhyB3jeqFVUBrgI7i3u
         hWt0nSi2ZUczLgejK0B8tUxhWEAfNQv4P0B5p+RvynVsPWorEa1Qcv+1y4jICS7jaCS1
         +Uuw==
X-Forwarded-Encrypted: i=1; AFNElJ9jrxNYY6WqiYNulL2veisJfPXQCoDGrX+XjHKyaDt/rUENZ6CJWEflhqj7/YFGhFfprWIeIsh04BBfd9MU@vger.kernel.org
X-Gm-Message-State: AOJu0YxgxLNL+SlDN6XGe7YtTvQHvddGj0j0Dm4N1yRPNBdvEKNmUzDp
	+JyH6xmDBC9gDug1WW5qBgyC27xc5uW/xQQ/6LThmS1+xvIUvm855/vJb16JJixpqjY9U/brptf
	lcjP8MiywPiC5fP1TfB4LVtOWha4R8lbywVmo2YE5ZLIXyrPJ0mgeEv7YbaXy3tOOERqG
X-Gm-Gg: AfdE7cmmhGo2EY09AUngtfb9dI22c45pyJaJvGFS5zizEjOmT+ByuUEFzRUHbsfniSb
	sJ/NhDN/0Ivy0/log2pfJObJ48+L285jGJ7ftvzM1y5j/PK6kVKTInXZ1sjrpdV+jH0R+OumwaF
	rSHxgOfiP8borB6pwwVUBJlAJnY6We6ME+iQd5JpPAUtwAXx9KCGzrBYbUK8yf6pCOrJRP+nEFB
	JV/xwNebgQbrFwesm4v02GbAb6IX8x9QLmA1ANb9DG3uqjJhcnQpzDA3oIdwKDlv5ygTIsUKEOc
	ajrBKg5gOFgvxDnEciZ+VZ7FRX0s8ykPdzAGD3On3Zr41MWnKLxVffeM3vKjE2cvxipIDlYXFPq
	5leLrc+w47bFHpUyvLWFcBO3O8/GJEBao90QQmqNJp20S
X-Received: by 2002:a05:620a:3728:b0:915:675d:a2d with SMTP id af79cd13be357-92e9a4caaf5mr344600785a.51.1783147423192;
        Fri, 03 Jul 2026 23:43:43 -0700 (PDT)
X-Received: by 2002:a05:620a:3728:b0:915:675d:a2d with SMTP id af79cd13be357-92e9a4caaf5mr344599085a.51.1783147422733;
        Fri, 03 Jul 2026 23:43:42 -0700 (PDT)
Received: from [10.111.130.138] ([212.136.9.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b62f5c41sm377843266b.59.2026.07.03.23.43.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2026 23:43:41 -0700 (PDT)
Message-ID: <4b7fe7e6-2531-4d26-9085-43f40a2ce2e0@oss.qualcomm.com>
Date: Sat, 4 Jul 2026 08:43:39 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: Disallow disabling boot CPU based on config
To: Sudeep Holla <sudeep.holla@kernel.org>,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Will Deacon <will@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20260703-disable_boot_cpu_offline-v2-1-782d16ff58c3@oss.qualcomm.com>
 <20260703-competent-adaptable-coot-f8daaf@sudeepholla>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260703-competent-adaptable-coot-f8daaf@sudeepholla>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=VvoTxe2n c=1 sm=1 tr=0 ts=6a48aba0 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=/bviTfK1dmy+WGcHzWQ0gg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=HAiw8MWB_luJwFoROhsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: 5p8U7-NGdKWZAoobQqQhkVgtM7dHjsXF
X-Proofpoint-GUID: 5p8U7-NGdKWZAoobQqQhkVgtM7dHjsXF
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA0MDA2MyBTYWx0ZWRfX68fNSXpEQa5w
 yKVpc6xQ3Lf+Afog1WUbTdw+X/RmyNlLHlrsv+cyIj2crSBr8KCF8EMTG+Yyw/uA8q58uhOIeE8
 IyGvTUNNNR4vAfi84HLrB6uIl93NvAs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA0MDA2MyBTYWx0ZWRfXzrFdwlY3l2AZ
 846J3Yuq8okp5cAuDJMVZEbrOjxXXAPgp8LXvrBE9rq170Rz54xQQMPW++BBNHMPxumyL8Qal6Q
 j/GaAowrUSUTvHTz03VD1K+B3f9YAUhRo3QAKxEeKsAK4k8ewQrWPtP4NQSxaxzoS7GNX6pMERd
 kXEr1I96JAz/E+KheBVEYG3Z7Xsm2dzLSBUaIEKPQIXMvZN+nEx9f69u7Hw0c1BHUXYF2L8uszT
 01lLy5iA//d+DDZYuw6G1g5v3cBhApjQ3YyVAf8O/5IVgfIHoUfYEJ8C6TUpeWMXJnCtq4cSrur
 ft267Kk5ppHIhEByfiDj6Jk7Y5zctjPWApSjw4VfENA8riyTNdQvZJocR+jF5K0cnspwQIDdDw3
 MFwNurstBs06gSpp5CIxM4VTvOT4RUO763JZU/UHIknomNT8mza/BSx5BdvV0ffT1AkCn3/nBJZ
 6jvhECKTP4tSdAiESMQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-04_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 suspectscore=0 impostorscore=0 clxscore=1015 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607040063
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116477-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:sudeep.holla@kernel.org,m:sneh.mankad@oss.qualcomm.com,m:tglx@kernel.org,m:peterz@infradead.org,m:rafael@kernel.org,m:pavel@kernel.org,m:lenb@kernel.org,m:catalin.marinas@arm.com,m:mark.rutland@arm.com,m:lpieralisi@kernel.org,m:will@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[daniel.lezcano@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel.lezcano@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B2827706E08


Hi Sudeep,

Le 03/07/2026 à 17:51, Sudeep Holla a écrit :
> (It is always good to cc all PSCI maintainer for any ARM64 CPU
> hotpug/suspend related changes)
> 
> On Fri, Jul 03, 2026 at 04:50:02PM +0530, Sneh Mankad wrote:
>> The Qualcomm SoCs like LeMans, Monaco support suspend to ram which leads
>> the SoC to ACPI S3 similar state where SoC is turned off and DDR is
>> retained. The hardware design on these SoCs forces a constraint to suspend
>> and resume the system on boot CPU / CPU0.
>>
> And you fail to explain why they have that constraint.
> 
> Is it because some secure context is not allowed to migrate ?
> 
> We already have a mechanism for that in place and this hack is not at all
> required.
Do you mean a mechanism for the secure context or for preventing CPU0 ?

Can you clarify ?


