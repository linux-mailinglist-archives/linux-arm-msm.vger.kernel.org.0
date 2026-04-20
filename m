Return-Path: <linux-arm-msm+bounces-103690-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yAJ+Fgjj5WnfowEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103690-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 10:25:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A89854281B1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 10:25:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E0CDF3057D45
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 08:23:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A5FF388399;
	Mon, 20 Apr 2026 08:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NGEHmpIc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DTQB5WsU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAE5F38838F
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 08:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776673389; cv=none; b=g4cs41HTb7nN5CteKwQj3XncYyNPnjKK6MxCP44A7PPf+9uJ2TxtzV8dIw2FXKtWkC3eOoBKbN/u8xY0fcolCduUCq618s8q2VY1d64lPMiGQ1gngo8Ka47Q/fUsWODyBI8ZwEmsCCnwkB+H8QSe8FOp6rzo2smjB7A/HeYZ3q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776673389; c=relaxed/simple;
	bh=xNG5bEyXvPrG2phlTv9cU5p2Zn0elVFIdD1uQJc1KpQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eiaHslBw2bf8jSHVjm77aqO8zBJ9cIwwKyNjrgFT6rJXxn0d4kU4g3T+i1wnQ4ZKanV+N4fXdscobi9Ro84099FsVH7o9kJ07x/Zps/AlzaFywOrSvh1CM6XgZ9FUbnGyD3HpFPN8/E4VDZuPZHN2rJWhsA0pFbkS6mdJq1/6gI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NGEHmpIc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DTQB5WsU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63K5UWk64005463
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 08:23:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eqexufECQeB1ick+eNc6Ypgl1+IbKlrTi03R5bFR4lI=; b=NGEHmpIcAaMnHfGC
	BuucV4d77hXXVTOYN92m9/cJQ1263ZdMwWdp4yggtUn/7Q+iP6tZ7Ra6Q+GQ4p6F
	OxcekxANGC3nz4iGG75MB7/pDn1xf+4v+PdUQph8q4M4EuZkpfL7ySM70hNIseo0
	PHnL9txYVyWyKC2unG/uUFVVEXG70j1B5x0qjKfUjwFLC3W8C6eM26D/afJdwiex
	G0SqxSLcWWRZfQ8sMrd9qYwhNgnWNP7WQ2dWMQEwoKqwETc9oQCGc0OnyBKKy7j+
	/Y6Xqdwt6+xe2P0BgvRRtKTXIKxGkpOIp2ux9b6Jc0a0gWkkzsmLkceliZRoRdFG
	zThRgw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dm34hcteg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 08:23:04 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8eab2831ba2so22684785a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 01:23:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776673383; x=1777278183; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eqexufECQeB1ick+eNc6Ypgl1+IbKlrTi03R5bFR4lI=;
        b=DTQB5WsUur5mGxJs+I9r87Js3ARFWMAK5cwCAsZ0/q5Vj6L7BnY68CCMkblBhP2NOt
         oFLnb4gZF2Bu6cHykPcJaWbCxv6b2srU+uC1chmoUYOUfwk07E9lIOyV6+qlRJ1IPcNY
         eU+VuQCe5N5rH0S5KTz5u12/gL4zWzghUqDYx88GpJuGoJ5iQKfqc5aW9GHE1oXrya/D
         huTXdcOWsb0FOcGZQHg1z2WiZkPwL1Kv35OCQAJoUlYB0FaZuaZClTzijgyQ5Ode7Maz
         aRsDz1S4EafMVmzSvdiBmjGIH2UJZHoE/FWR3b6gl6I01I7n8OhAFXVqZ2nLK9UY6Vkw
         ngtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776673383; x=1777278183;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eqexufECQeB1ick+eNc6Ypgl1+IbKlrTi03R5bFR4lI=;
        b=NoHGcCSGzI50x3a/jRlmv4lQD6CzAQEFM2WnEgsonMIKLR/lT//CIjOPjqfIuYSMqb
         HhWBW1GYoyUm3rIr2L0ytg/8olny3gpDJ13UvoRAOHDJVSjT+Bvz7xrnYV/MdNgpp6Of
         XB4JVZ/PaiqlkacmyzUl3buq9v4GFCS55SZvYwxrbtJtCyqYr2Mm5s9BP5R6A3gGbPyq
         pmJkn1dK9F2KMt2AusOwvNKH7Bak2ipvhS9VYne7HDGu9viv8qzw39wRnpoAr3O0G02j
         hI8MLFlQrIa3TCmwr0csCFSD5ubDSo4TkapLLOVTqmPMkWJNB9mk7rx73wOrizSNDwjM
         j94w==
X-Forwarded-Encrypted: i=1; AFNElJ+P0dYhihAz4c0T8oHbVRhwxJzStN52s2Sph4Um6ilbd+FyDyjiaeIz9UhePmM1UK26Kk7RJSZTjuLp1y18@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7n+r6B33UlksXD2bAf6eI9gQgWL/Ld8KnQNDwF8vf57CqYh9A
	XiQgMEFGo/lilXO2FPnPDeD66dUQR8dO8lxVPCkp05XDohm70EZwRJYSGqIXKkpHoRGC/xTaa9f
	/Y3inh9pT4tm/N5sQOuT6Ym9EGVsXBYO94/JoDqvoVpWk1nsHo+ysqVXIk1lmcQ/Gpyni
X-Gm-Gg: AeBDiesZbN4i+/dYMdZ8/OQdPM1YuiboM1f2KsypJqlOSs7ZnfV1Id1FywV8uwYf2JG
	Oc12U7N9QIVhT8ozW1RUJ9jfvKQI7SeEJlp5opdFHg+c7eXAG0Dea/QLuDPTa6O84dBjTi2Eml2
	NbIpZzv12YkDQFixHdaKR/EPTPrcRsSPS24AiZ+3aMrjRnOT7Uh2uMAmClZK/Uq/RZGAkix3GRn
	DcCHHDOt5aPasDXPWmx6BF+bcUxF7Q3nloI8zMWiCgahC6FE9eH9NMkWxLliBP+XKKPH2Eo8KAe
	3D6Fco6huZYdgHPqMJJwGq/hBkzaInGgViJvknXdaY5KB626KxAaRhzwUcERjpjJir6I4Z23G98
	AEF7FoUT5GZz8iolcUMB7DqMYjNtk3tr39+iXLDmuC2W10qlxltd9Eb/+uFamTqDgFeAh7ZZfT7
	FopxQpZzK4bjhVGQ==
X-Received: by 2002:a05:6214:2521:b0:8ac:a205:f118 with SMTP id 6a1803df08f44-8b0281997b8mr134890866d6.8.1776673383394;
        Mon, 20 Apr 2026 01:23:03 -0700 (PDT)
X-Received: by 2002:a05:6214:2521:b0:8ac:a205:f118 with SMTP id 6a1803df08f44-8b0281997b8mr134890666d6.8.1776673382904;
        Mon, 20 Apr 2026 01:23:02 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba455046223sm323271666b.49.2026.04.20.01.23.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Apr 2026 01:23:01 -0700 (PDT)
Message-ID: <43db2263-0dab-4652-ae1e-f827d1dc5c28@oss.qualcomm.com>
Date: Mon, 20 Apr 2026 10:22:59 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] mailbox: qcom-cpucp: Add support for Nord CPUCP
 mailbox controller
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Jassi Brar <jassisinghbrar@gmail.com>
Cc: Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260420034932.1247344-1-shengchao.guo@oss.qualcomm.com>
 <20260420034932.1247344-3-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260420034932.1247344-3-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=J46aKgnS c=1 sm=1 tr=0 ts=69e5e268 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=iw6j4ArIhSFbxnb95OkA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: ydWf6G6EuAi6HwbWeGgmWeVq4BvTU96x
X-Proofpoint-ORIG-GUID: ydWf6G6EuAi6HwbWeGgmWeVq4BvTU96x
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDA4MCBTYWx0ZWRfX0akmu198Ldju
 yROd25iYZBeGgIVo/6TXhx1wSWRYMp6KSQoE8Or3oev09MHB7o/+H8NGXlzQn91roheffw8/by8
 tv4NLBOnKOmzSmoVNxAcLmb4q1oqbM3x05Ok++3gLYvUYcB3augvkudM2rDHIzeRiajihjzAxPl
 bHB1XJKGvaisrHO4g97Js5a8PXgOzUD7yy0T/ts2KchOjPg+bc6zR3sdOejxcOZ7Fx4p5zZu4fi
 S4fxG8WU5ny6seIwWdTpQMiyYtRMhWYN6eKOIQ0IeO5kOEjQPqa6Qe+cjyzWGH7kz9PVYfSk8Ll
 Tfn0iNRPxYTtgUFgH/E/Pllzia8JgsU7Y5UM9+OmXgg8rItb2xbvfNS/zlCMMk4I9EHIN2RTEpk
 nnTjHHwxRB12IP/WBjU2tDBo/GNcLw++8A24QPCvWWlOdR48ctQSPi2nDHGm971zuDWZUy8CL38
 Uh1j8eo+dXDqHqF1DDQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_01,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 phishscore=0 suspectscore=0 spamscore=0
 malwarescore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604200080
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103690-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A89854281B1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/20/26 5:49 AM, Shawn Guo wrote:
> From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> 
> The Nord SoC CPUCP mailbox supports 16 IPC channels, compared to 3 on
> x1e80100. The existing driver hardcodes the channel count via a
> compile-time constant (APSS_CPUCP_IPC_CHAN_SUPPORTED), making it
> impossible to support hardware with a different number of channels.
> 
> Introduce a qcom_cpucp_mbox_data per-hardware configuration struct that
> carries the channel count, and retrieve it via of_device_get_match_data()
> at probe time. Switch the channel array from a fixed-size member to a
> dynamically allocated buffer sized from the hardware data. Update the
> x1e80100 entry to supply its own data struct, and add a new Nord entry
> with num_chans = 16.
> 
> Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---

[...]

>  /**
>   * struct qcom_cpucp_mbox - Holder for the mailbox driver
> - * @chans:			The mailbox channel
> + * @chans:			The mailbox channels (dynamically allocated)

I don't think this line is a valuable change

The rest of the patch looks good

Konrad

