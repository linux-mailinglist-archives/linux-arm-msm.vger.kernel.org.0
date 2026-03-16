Return-Path: <linux-arm-msm+bounces-97873-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sKzsBj3Mt2kRVQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97873-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 10:24:13 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 76A2C296E74
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 10:24:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DD1E33004C58
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 09:21:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3063374735;
	Mon, 16 Mar 2026 09:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TsW5HJEr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZpxGSl2r"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 791081E1DF0
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 09:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773652910; cv=none; b=Qc9hH8efpgy9YztRstLHo7ypdvs97VYpcPEG5luEtTmURQ3MDTvsjWZOeJMUDcwfe/QyItgIOsmzcf7f1YgD5n9O/RuJGn5dfJdYBtg9s4JkEiyCR5B4ldAjoLE5pOxNIdv7isRPb3ixQa8zfoTKSr/1kFczYX2xuLELDqwK3Ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773652910; c=relaxed/simple;
	bh=9z3oRLftzUJus6CMVW12jYlu2leblywvUYLJyDLPZZ8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jgSeuXpV90l5hwbxRx5DtOytMbslHckIx/pds2orCWUugY1lbWY5+Ps8SfKW1wad0aLT5Vs1UMI3uybDxD6MF2rS3wBwhuBbZb3J4ORYSTnpRfox/SEI3JAjUvJb/xz5glTl4CqnuVvXHRVz1FKXH29tQUfbNaIbu+iK4spy3LA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TsW5HJEr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZpxGSl2r; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62G64gM8538857
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 09:21:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Gpp7Zv2c6z1/dHKmZJlMe1c5HvJaIjPxwv9MvslkwGY=; b=TsW5HJErpcA4oD9b
	ziYYt+s4OjmlWs70ggl9paIgioWxH0yrajEpqEEar/NUNGZY5M+zH5mEy2OfUWCl
	r3z1F86AW34N3LiIwKQBPLUl5EORQbkGhes9+81ZCGcY4IDSEAZ7hZG6+VxUnS20
	CC+JvgmHBW6TjwNTlvdlfuX3zY7dEaTf+03UCH/u9v4GeAJFvZaGWk6q5RAwljJ+
	JQ1qYDYh8IZSDk9EUQ16G6+N5XE5uB+a09BQ7xPzdF9+dlgkuWAd5qfnrx3T9v5E
	yJMgptsV/NzBRx81mSzN6n3/VOwP4UaPygF+a0KpQaJT/c0tXApzePShFtEcC3Jj
	DsrhKg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvyy5n07p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 09:21:48 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2aecbb78e44so168784875ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 02:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773652908; x=1774257708; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Gpp7Zv2c6z1/dHKmZJlMe1c5HvJaIjPxwv9MvslkwGY=;
        b=ZpxGSl2rSCrGDYyPlqxvDqoQ6rftMJmgGk1BsT/7wUtHuAyWrIgCkwqb5AEo3sles6
         BSHzdjgkno/2XKuxrMuiIsejrc40XQ35Vp5glUyOWryEnldbq5q8qrK9LEDqItSOGlEu
         9zfZlWVqGDBtmtSiXCUIVqUh9rKzZYCjCetRHio9GR/fMLFKkebVPymDu3Tow1bpu8lz
         a3SAdkhC75ObYtzAAW9ysBMaYBWbhnGs9faDRdJnhfz0L491K3XAD3qqPRnSIyyrKFcr
         eTYIXgVAgQ9uUrYwEcotEuYN3C2whHudzopIbV65m8mKo3YFU3Ym7/Bkg+jyURuxgsz4
         eW4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773652908; x=1774257708;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gpp7Zv2c6z1/dHKmZJlMe1c5HvJaIjPxwv9MvslkwGY=;
        b=WNbfJBup4XN8VsWbR3DKsSnMVqwZsysKKJO1vr9MMl7gKMKb+ec+S2ShPwrebyKWYR
         Iacst6WEyPqYgZgnhF82E6Rs4zA4/rc3TtfKjrMJ1z92Efe4WsN9ek/m3FLyUCXVbI17
         Q58FGO9G8yX0LNcoP8pyU/59voxbQGaQjEIVAzuyyyRPweBhdE7WktVMkCX2Kjx6hsyQ
         ZApvDt01UnR6WezwKibP/I9VOHYlKr/HhbzmyazvQejd2fuimlb73bzkvCZfzgclGRYu
         yg1zMey7OR0b335UWT1vP/lzJ0rvL0PhktHwAqNbMxxvFJMqi+h/FkcEiHwBr4S0Os+/
         xyAQ==
X-Forwarded-Encrypted: i=1; AJvYcCWySjGoSpmEmKGdhzd59VxR34O8U23ylaZwbX1RJ22dhbgxyGo4rSfYJ/FlM5n85+1L+TQmE0SFH8Vb5fot@vger.kernel.org
X-Gm-Message-State: AOJu0YyOtXM0smMSrzAdl7ikkFkBqPHR9RpawsRJy8fXZ1JKIBH7v8Ct
	xmS9qYd6amyNWD7VEF2Kw5vL61a2JJi6REiKh0odXhFoeladXkj22j23PIPATYWoZqjtxKBqlp/
	8WmrxW/8WLFFZFWhP0abkPdwaI+v2BlhmadhwZ6lec5L+gM0VQ6SLm7DlEwCV1xSVwYgg
X-Gm-Gg: ATEYQzxihquc8cnhbxBtQy0CwyUCuU2c9duFZstpPR+dHCf5N5JrzgD+ZFlU0iVlDMy
	zKCoGqkEZO8cfuLGEcFMmPW9WwdPEscniunQBfWqvsO/zOhiq7MgDFvmDg4/Mi57rkQmN6yI7il
	hEaHaB6TKLX1fhfmXh6WHt+toTqgVCgC1JHzCpnSXDmjzoP2oBqmfG6UicZp0k2ddoxXS2mFHcI
	IVcF5wSbz+vud/V6cnO5BpUhI8OEVKoBE0YGli7qaGS8VS06EDSY4HN9wApUfsdxYVG/6XD8tQ9
	a0RCD0vkRLDtxyD92PD2oTO7hwsufWvMnd4z/f3IA5Z/NIhj5RYlSxoVWTNmhNse6Ebhwd/i1Hu
	6195ATHEpORicWjuDu8/M6tsiLKNtDGu21vwzY7lk9X41vHOKgJ0=
X-Received: by 2002:a17:902:f601:b0:2ae:c99c:7902 with SMTP id d9443c01a7336-2aeca941540mr132566695ad.7.1773652907930;
        Mon, 16 Mar 2026 02:21:47 -0700 (PDT)
X-Received: by 2002:a17:902:f601:b0:2ae:c99c:7902 with SMTP id d9443c01a7336-2aeca941540mr132566445ad.7.1773652907510;
        Mon, 16 Mar 2026 02:21:47 -0700 (PDT)
Received: from [10.217.198.242] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aece81cde8sm103984095ad.70.2026.03.16.02.21.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 02:21:47 -0700 (PDT)
Message-ID: <9fc2ccf9-095b-478c-867f-2a6ace1ef1ce@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 14:51:43 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] cpuidle: Deny idle entry when CPU already have IPI
 interrupt pending
To: Christian Loehle <christian.loehle@arm.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260316-cpuidle_ipi-v1-1-d0ff6350f4e2@oss.qualcomm.com>
 <39ffe4f6-5716-400d-963b-06675a727225@arm.com>
Content-Language: en-US
From: "Maulik Shah (mkshah)" <maulik.shah@oss.qualcomm.com>
In-Reply-To: <39ffe4f6-5716-400d-963b-06675a727225@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: sa26pud-Uw9FNudkp2VzVzsx47BXx63t
X-Authority-Analysis: v=2.4 cv=QOxlhwLL c=1 sm=1 tr=0 ts=69b7cbac cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=ezScEkVGZYqAr6NFzwwA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: sa26pud-Uw9FNudkp2VzVzsx47BXx63t
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDA3MSBTYWx0ZWRfX6/mrFW9S+ih0
 aH0J5x1kuEM6yynp3aAJlHQ2+ZpCw+2O8URi9pe0YsNmCPlngHADHiFccAA8l/ClEDo5Wgus9yH
 qU8OtI1LSUa1MDPkv+T0jTPbn/z1DSq7p6yWWHj+RbWdZXVxuPkJf94mf0c5OtKMl6MDHWCRFZT
 IcwHvl4LbHDPDaM5jH7GUxPrpDpYxRl03aT47tfbT20QSqMTCCDYoFG8n1aNswTctRqPCLsJAUC
 5hSei2oyOUmsDFGv3ssv8ynYOy4w2o94XVS1Eg5Qgtep4JatTmPcnCLkg2QHDf+j6J/uBBZVVRg
 tlw1o+LxmP1WorgXcg2L2GgX0l2mK9XyVKX86StQNHc/mf/TckVdj3EI5zTbtl/5JTB3oRj6N7/
 k8U3w86MzPpvbxTZyfrYeYcc82wF0gOJ37muDeVe9isFatmaP1vIp/W3KTmUjHuDgSeyagrQGPN
 tRPadOtdGItTOK+uN6Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_03,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160071
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97873-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
X-Rspamd-Queue-Id: 76A2C296E74
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/16/2026 2:25 PM, Christian Loehle wrote:
> On 3/16/26 07:37, Maulik Shah wrote:
..
..
>>
>> diff --git a/drivers/cpuidle/cpuidle.c b/drivers/cpuidle/cpuidle.c
>> index c7876e9e024f9076663063ad21cfc69343fdbbe7..c88c0cbf910d6c2c09697e6a3ac78c081868c2ad 100644
>> --- a/drivers/cpuidle/cpuidle.c
>> +++ b/drivers/cpuidle/cpuidle.c
>> @@ -224,6 +224,9 @@ noinstr int cpuidle_enter_state(struct cpuidle_device *dev,
>>  	bool broadcast = !!(target_state->flags & CPUIDLE_FLAG_TIMER_STOP);
>>  	ktime_t time_start, time_end;
>>  
>> +	if (cpus_peek_for_pending_ipi(drv->cpumask))
>> +		return -EBUSY;
>> +
>>  	instrumentation_begin();
..
..
>> Best regards,
> 
> So we already do a per-CPU IPI need_resched() check in the idle path.
> Your patch uses drv->cpumask, which will contain all CPUs, preventing idle entry if
> any CPU has an IPI pending?

The IPI interrupt became pending after the need_resched() check,
when the CPUidle governor is selecting a mode, but before the idle entry.

On qualcomm lemans-evk case, drv->cpumask using cpuidle-psci is having only single
CPU but seems other idle drivers may contain all CPUs.

Since intent here was to check the pending IPI on same CPU, this check be replaced
with another need_resched() or using cpus_peek_for_pending_ipi() taking a single
(current) CPU's mask in the argument. I can update this in v2 based on recommendation.

Thanks,
Maulik

