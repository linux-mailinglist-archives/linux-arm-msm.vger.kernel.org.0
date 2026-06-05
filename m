Return-Path: <linux-arm-msm+bounces-111310-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0E+UAGVOImqnUwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111310-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 06:19:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 92FA5645076
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 06:19:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=mhjLCCft;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=NdNY4aiY;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111310-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111310-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 380F830158B0
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jun 2026 04:19:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 407A3377543;
	Fri,  5 Jun 2026 04:19:41 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E16B8524F
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Jun 2026 04:19:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780633181; cv=none; b=SpI0nlrGDgPuslUCtsKOkfVpjhrOmjARUjkXWXMDQfe7rExtxR+07Cuva795ocdOO9Gf9pdvydB2VxBg/tfkc8dUIYLzLTWlHwJyFiOdenph2LEST1cUkHsdNpAMp8iXwlEVJ4SlgiUHf07DJHTmjcLfEuvkpw8e8cidynoo4tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780633181; c=relaxed/simple;
	bh=P0k3sjK1cy2s+oAAkkB7A+jj3/4HX1PN8oxb5Y7vg4E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z6SGL1R4nkSba4885YlTra6LVWb1T2B+pQLc0jc9F8p6h6yvqBcupmzQB5g2DS++BIAw/Rdst1PAPd2SNlJm9o9PxP+/Naek6R/9VOVFVZZw/YKb6nfQfhloR9DFMxMXApfYfK4LNzIumuzUQ82kBW189EpbpSDwh8E6nf5UUC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mhjLCCft; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NdNY4aiY; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6553Ycsn2975167
	for <linux-arm-msm@vger.kernel.org>; Fri, 5 Jun 2026 04:19:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5vRZHUtGWFFmC5/cs/BfJ9BpSx9TWoNBXHZpysMZMUw=; b=mhjLCCftqmNzP3xN
	plYV/tWVes2Whw70oXGGJOOTbQFPUn95wRQuZJE6e1V0bSOGVKDyTSpEb2UccgEw
	DIcCYBtYuNQSrEJ9Zz6XLWZjJWBynUw2lR1yxIptXbI9Bqkn4rNhyPWltfDwTYK6
	GM1b5Orykfi2pgexWYwhSYxhUGDcCPOG6v7j97IcQylhtL8coJig/cctaleJT27w
	/OCUT9weFSmitBXKbRI+1tHjUBPkp76hvmsd08P2rxQYeBaNtU+gj+EGul9xHKa7
	R7VqwxxUmpQ8qnGXZtTK4VHUNzOOql1m03SqdIFH+HjzILHBdpuZ8CLBjbtyAcZ+
	PJAmwQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ekpnu846r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 05 Jun 2026 04:19:38 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8423f3e4728so993888b3a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jun 2026 21:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780633178; x=1781237978; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5vRZHUtGWFFmC5/cs/BfJ9BpSx9TWoNBXHZpysMZMUw=;
        b=NdNY4aiYwx2bfVjtqD5JfrUzwBf4vH4r04EWJG0DKp+lmXti0tQ1vQVUdHkERJN1R5
         cbluqnnEOR1SYYoKeiz/LFBz+Hz0b8ejiyBzsmwugZ3b2vZu+4ge/YnLQ+xKz3fiPxEL
         0H592cD654aJgX3ePMlIxbWHSJMDhOhsKF+Z3kiOYD5+NvZbCzknreHiRcmWvdPKSIUl
         iHgW3GpkDUPbgC86AtWA9wCg+pyaSZGf0SHSRRGHczh8Xhvpfbr452iTxO7QrE95IHZ4
         607KHPjhz0OwAOf+aEXH10v9xuxcufGeGZa4A8cHEcoQ3fofHOS8eHmDOIPzzDysCV0K
         6v2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780633178; x=1781237978;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5vRZHUtGWFFmC5/cs/BfJ9BpSx9TWoNBXHZpysMZMUw=;
        b=J7DR2MiDYvRBVInHULPKRRaP9ceZTqT20g/Dlid3LYrWye05xJ32XYzZMT79AeDtAt
         qJJ+3tJEzwT9uTo4QUR7E/F9EpIl0GGyRueoGBVwTW6VcWoVF9+8qWIcDVQO1cXvcQeE
         PgdbtvhO2vMaIad3Udrvdq4FNyEmIJVLsFMId5Zzo1vuKFTtAkIwIlln2urzl1rx7QAw
         gE6SSyLNogB4zaWzXqlNfT6SFLP4NktOI+cEQHl0InUqoB0pe5xJmkwLU3EIUmQYrAzv
         yMsX7Fg0ilm/2AI+kP2tCnEePOJUOjajZ28PktHriQ4stkOJd0wTONxGSYjSW8prLWgI
         VAEg==
X-Forwarded-Encrypted: i=1; AFNElJ/hCtC1V37QHWp8nkKzfag5bF9KXEQGWplMG67NLdH5ge+jAbhrHpLb/MtZV1VgUa7eAG12A/E0rtoBF3xE@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3/22BxSZrRyVCddbqIi9Ho9dqjoLgIv79RVgKdPgTAI8UC9F0
	y2w2aWeE1DBcBvh+12N5+GieUgdNKO+eXnV2PkDgecTKu4Bn5xSy34iNDv6DUUDa3FKM9KhNll9
	3vV897o8X0Cc1DAfiOO4EoTJR3fh5GVVJr+Y4Qkny54IQkVg0JetEndJe+plLiHjvYCdq
X-Gm-Gg: Acq92OG7HeUJUQv+T0pZVbdJK7rQlFoVIB5IWDHFoxnI90DY34cStxO2lsceJINU5X/
	AaO/Xx4R1BXLNoA0iUYC9rYZhNt3nFt0V3kAveMTqDahTRL2SVWS/pQSgX72GqOxH//KCqZokDl
	m0q89cuBfd6X2koN6z6NF5yYt8sTfbW00GMCZ2CHGINxFCOXEjswrbnITUfGflccaIPBTWcem2a
	69GrFutDSxbtDo+mP+TdbOPu1S+lUnOOXpmTfvIuSfgssho+dBekkRswA6w3plZ/Mathk0SaeDh
	BotOqTiNtStHXiIp+EdLs567pw+jUHjp1QB61dhgoFaqa5jNJFF2AA7XsDInlpUS3niuqhu7jrt
	vzgLdGZJ5oY7IeJ2iYBhvHV9njOd01gvmEUmv8LVDHUxOYBLg4bRl7r5xYDe9P0/3Ao9KQQ==
X-Received: by 2002:a05:6a00:420c:b0:842:5b63:6116 with SMTP id d2e1a72fcca58-842b0f1ed2emr1678151b3a.7.1780633177785;
        Thu, 04 Jun 2026 21:19:37 -0700 (PDT)
X-Received: by 2002:a05:6a00:420c:b0:842:5b63:6116 with SMTP id d2e1a72fcca58-842b0f1ed2emr1678114b3a.7.1780633177311;
        Thu, 04 Jun 2026 21:19:37 -0700 (PDT)
Received: from [10.151.36.45] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8428221c3e4sm8007058b3a.5.2026.06.04.21.19.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jun 2026 21:19:35 -0700 (PDT)
Message-ID: <80fa8c92-e426-4bc7-ad1f-b0be0f405506@oss.qualcomm.com>
Date: Fri, 5 Jun 2026 09:49:30 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 1/1] remoteproc: qcom: Add NOTIFY_FATAL event type to
 SSR subdevice
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>,
        andersson@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: quic_varada@quicinc.com, quic_srichara@quicinc.com,
        quic_viswanat@quicinc.com, quic_mojha@quicinc.com,
        aaradhana.sahu@oss.qualcomm.com
References: <20240820060943.277260-1-quic_gokulsri@quicinc.com>
 <9d3728cf-bf4b-4ba0-8c71-831d908072a9@oss.qualcomm.com>
Content-Language: en-US
From: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
In-Reply-To: <9d3728cf-bf4b-4ba0-8c71-831d908072a9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: KC_zduNv4Wa0nERNzwSuTi0FQMQTBObD
X-Authority-Analysis: v=2.4 cv=Ksl9H2WN c=1 sm=1 tr=0 ts=6a224e5a cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=COk6AnOGAAAA:8 a=rz8_RQ3GBV-xKMBrbdQA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA1MDAzOCBTYWx0ZWRfX1MPOKZqXcqG8
 kOk5hy08LdLAoP7yermVqy5/4ELGesgN+3/IR49/H9DvlgWYz6Tqc2Mmmgqor64iXZTZLD6sFcM
 jDu9H6TyriRP6D19gxYNJB3BnArGdTaEKkMgWyVITiYG9plTSqnynvCR+LzMXGV+167WWhTmdGy
 n0caRxZ4fV9ApW97+SBZCk2uH2Fiiax9OqP9mOWHBC58c5vIsqOfGLrM0dDN328de5DJFCjSX1i
 KdzdAgS5ytNz5zZY+6/Hq/v78T1ZK1Z3b5qtUUlXw49c6DJwr7ClmFw1h/BulZ5g94N19tcq1RQ
 taQryQdeJQR8FV6NGxjCj9ja7mOp66nntQaDNbwjtk7LioMoceNYhUkNY1zcRWJl5OFypowScuu
 nNNawLmCx7Ssg7ZzUC9UwwdZwkmYj/IDpaM6iFwVKfaH5ZDhYfcW85pdifNWGv4l947gRxJhtdh
 oUjVu0Nf6HjMktqyDNA==
X-Proofpoint-ORIG-GUID: KC_zduNv4Wa0nERNzwSuTi0FQMQTBObD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_07,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606050038
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-111310-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[vignesh.viswanathan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:jeff.johnson@oss.qualcomm.com,m:quic_gokulsri@quicinc.com,m:andersson@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:quic_varada@quicinc.com,m:quic_srichara@quicinc.com,m:quic_viswanat@quicinc.com,m:quic_mojha@quicinc.com,m:aaradhana.sahu@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[quicinc.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vignesh.viswanathan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 92FA5645076



On 6/5/2026 2:32 AM, Jeff Johnson wrote:
> On 8/19/2024 11:09 PM, Gokul Sriram Palanisamy wrote:
>> From: Vignesh Viswanathan <quic_viswanat@quicinc.com>
>>
>> Currently the SSR subdevice notifies the client driver on crash of the
>> rproc from the recovery workqueue using the BEFORE_SHUTDOWN event.
>> However, the client driver might be interested to know that the device
>> has crashed immediately to pause any further transactions with the
>> rproc. This calls for an event to be sent to the driver in the IRQ
>> context as soon as the rproc crashes.
>>
>> Add NOTIFY_FATAL event to SSR subdevice to atomically notify rproc has
> 
> Almost 2 years later and I'm finally seeing the ath12k patch in internal
> review that uses this.
> 
> I was confused when the ath12k code didn't actually have any references to
> "NOTIFY_FATAL" and then I got a build error due to a missing
> QCOM_SSR_NOTIFY_CRASH.
> 
> So all instance of NOTIFY_FATAL in the subject and commit text should be
> changed to NOTIFY_CRASH.
>
> And as was noted by Dmitry, this patch should be packaged with the ath12k
> patch when it leaves internal review.

Agreed Jeff, I'll rebase this patch and change NOTIFY_FATAL to NOTIFY_CRASH
and send out a v2 for internal review.

Thanks,
Vignesh
> 
> 


