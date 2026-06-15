Return-Path: <linux-arm-msm+bounces-113064-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id y15oCzxxL2ojAgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113064-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 05:27:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A44268307A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 05:27:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=HgX6Bx6i;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ij49ibTt;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113064-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113064-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 29EB8300F1BE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 03:27:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A93BE286409;
	Mon, 15 Jun 2026 03:27:38 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEDC123D7FF
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 03:27:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781494058; cv=none; b=kHYfLfOH0SP+xdvW+8IlTi6KkfHjMv6Zyb5XV/L33Rawb8wSstnqdJ7+DcvmRxUHwNKr5UK1pzAU3Af4GGvU4tCZyL5aJdS4bXAZ0fuZNh195DVkqEj2h66qvO/yGYvA+QVTOlxZizv3P4DRGx2VTyHWuWca5vgac1MBhUQzQe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781494058; c=relaxed/simple;
	bh=8wLDpXhV/J3eJRD1ub1DOXfI7Ih6m/esDW3O+TBLzLE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MgXN2iYCuepRtHYM4wSMx+unSg1PIfT7/RNVzwGyVijSngFj6hQzBS7Jk39bMpi1BnR8l0aQ2nMTN4OytiCUTKYXoQniur5UBKG/AtAAvgHPXuw12wjAky17Kkx+hLJgmbinleD0DLFNgVS4RyFObIeUxs+4JLhtN1tlHA/TklA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HgX6Bx6i; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ij49ibTt; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65F1hqxc2727505
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 03:27:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vtQ0N66m1qzYIbSoJN+ny4a37CYzD+xGwJcaHpWLqDc=; b=HgX6Bx6iwBG5RiJN
	KgEQyYwqSH6fH5Hiy1InZgRprlTa4fhRYOFoRZvkQNnyCjJgUdpxR2KKVIpzYGFP
	GgfR7NGFbef7/AmUymLKpDlp+n/bdVFszGb0l2vWJHk563urdMu7GvbQJVAMhUg+
	cSC9UUFui2TR5dvcoJKThcgd2nOqH+JnxGqShzohMocaYUH6jEn47pGuZnScGq38
	fTX2cb+foZI/S7sfVMyXIxyh5g0cMwsPDeOG4DoEYuPQfN8CuFJKENePiupKOWMs
	nwt1ux3zsuyWVMzsjXgCKhQKMsPb0bp1hU6liXyhztS6PnJuyxn/h9tJe3uNvIdG
	fKZINg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4erye15be4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 03:27:32 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-915b9dd020cso800951485a.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 14 Jun 2026 20:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781494052; x=1782098852; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vtQ0N66m1qzYIbSoJN+ny4a37CYzD+xGwJcaHpWLqDc=;
        b=ij49ibTtldSxUuXhRnMCr2F6VyzJ12ITZtHzSz65GiUZVE7yqigXaTjDxJlnjvxere
         k5xPvgYrEkBUeneea4IMe5R1t7wHHigqjCML9NahYeEeybTEQ8pVyF4/Jsp0LhweUWXy
         /GH7ht2t3PumQCEabb0+NMTi6Bzx4pZ6emO0GMfjPSDE8U7sYlpY4zt9XNIJ5GAM5j0S
         27pLLkDCLGnZqjSdumZU438wzK2vMXBF3luN6OmCqIiRYJ3oJ0eJ5QPwopVtBGMsxiOX
         ewlkRBzutRSAJAMrpaR+L7f+6wKsWy06e1IETbDprN2930L8IMHBhPffS29HEbc6rFxG
         7T0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781494052; x=1782098852;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vtQ0N66m1qzYIbSoJN+ny4a37CYzD+xGwJcaHpWLqDc=;
        b=WqBsv+CeIFuI67cMIP3s2+nCeO7BMZeOFSD3QaEtdzLCNQ5hJOoopkcEFKF97Wc4b3
         owNVrWZOeo4JgBtfK/buBIER3tOPsFvChA/4l4aIjKLUoGNVC3Vmje65wn2lNXFX9z2k
         s1IZjflkvT1KG8xPPHK6TWMPcPta8haprtDlrIf89TijUZjTbLOWsmhfpCgQ1Qu0CwiH
         QlmNThuzGjsSfExStYf+rzkQ7h1yb3OCHeeAvW1It7jKGaAHmNwl+2pGgRfFcQdZjjvI
         8rcCFoOzO8qSZLBMsWSOi6xKLezh9YdIBUTgxQ3KwQiSCZEof/AwwznZZMLE6pbcPx+U
         d8qA==
X-Forwarded-Encrypted: i=1; AFNElJ9rR7t9CIYrQCCeCHDGEGUtWbiRqIoflVnblSuJpGF81MVtfiimHxI4015b37urk6hP/RNBEr5Qn7X92Obn@vger.kernel.org
X-Gm-Message-State: AOJu0Yxg8cKXb/E3zbpenLA6xRSqDzhj3oJ08p9UusNY8XUpCyTl7W/I
	g5Iy8u6aYAnXwaxEWnnMxd3vvp1m3pDfs6uoHFOr8i//s7iDIWiqBHQO9JwtsrV3Cr408f3LsBV
	2KmfBRASmpNTU/5qm4+B6FOWa5fCEgBBpUJNU2vYcJgclkipfJL8KUvN+oeuVnoy13ieN
X-Gm-Gg: Acq92OFLNMOhvT0+0bXCytuunF3Jzi+3lPCCAhI7hDKHR3AFaIy14UxFut48LPUa4Xj
	DYfX2r9HtctrxgaNkkZrxBuY8qDjd8RKbsBJndPm6L/oyhEvhx3JfcxD6/toAjX+pQTP32XCxZH
	iZDZ+MhoOLVMeRi25W7hX6yhbugW6719TysVpk1K9pdxb6WDFd3hhApExBMyu9gAlA/HW+kiPg1
	LilGUAtfVAHzXpP6rp8YJea5VtQFKoTzrJ9VrCRxSlVzSScA+2KtI/mP4seRRqxAHiKusrZPg0j
	bjwzk96oPZ5Y5p0zw86QaK/OAN1LB2eMkKeIoE0vgQ1bkUimFVET/Bjw4t/QgGsKLUzzXsxhgb6
	VoHo+WQKzBCUvTW7vwA8LSMqTVolTjin2T6sokOn8QTc9BEw+
X-Received: by 2002:a05:620a:2a15:b0:915:769d:554 with SMTP id af79cd13be357-917f2040654mr1502977185a.46.1781494051905;
        Sun, 14 Jun 2026 20:27:31 -0700 (PDT)
X-Received: by 2002:a05:620a:2a15:b0:915:769d:554 with SMTP id af79cd13be357-917f2040654mr1502974685a.46.1781494051485;
        Sun, 14 Jun 2026 20:27:31 -0700 (PDT)
Received: from [10.239.31.31] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9161a04b472sm974036985a.37.2026.06.14.20.27.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 Jun 2026 20:27:30 -0700 (PDT)
Message-ID: <5334bdd4-7eb9-43ab-b243-c2153bf29721@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 11:27:21 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] Bluetooth: qca: Add BT FW build version to kernel log
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
        cheng.jiang@oss.qualcomm.com, quic_chezhou@quicinc.com,
        wei.deng@oss.qualcomm.com, shuai.zhang@oss.qualcomm.com,
        mengshi.wu@oss.qualcomm.com, jinwang.li@oss.qualcomm.com,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>
References: <20260609075417.1160702-1-xiuzhuo.shang@oss.qualcomm.com>
 <20260610064232.2385866-1-xiuzhuo.shang@oss.qualcomm.com>
 <CAMRc=MdojC6T1RuqRNE-ssoRw1pKyUHyOS9AD0ROfCpPPOqw1A@mail.gmail.com>
 <c0eee7b4-50ee-4635-b8d6-fe9cb4ea05a8@oss.qualcomm.com>
 <ofpsjpkxrnzbnfza2emhli7xp2gwunknywbig6x7pzhis7yqyy@5z75psmjf5s6>
Content-Language: en-US
From: Xiuzhuo Shang <xiuzhuo.shang@oss.qualcomm.com>
In-Reply-To: <ofpsjpkxrnzbnfza2emhli7xp2gwunknywbig6x7pzhis7yqyy@5z75psmjf5s6>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 22cHtGojyd1fErxntw2Y8Ktu6gJ-vRpL
X-Authority-Analysis: v=2.4 cv=MNlQXsZl c=1 sm=1 tr=0 ts=6a2f7125 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=cL4ItX0H0-eYIwf1FeEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDAzMiBTYWx0ZWRfX61oUBOJ96G7u
 FKfB9gQg4K5GZ0zPLFeDTHv1Uii7H6RvH+24zrgkR2TnRacPZjH8Zx9KJIUFRbJb/OuzWDUd4iM
 1sVKLZp1lqLJ/ZUF6+XemPUtHShJB2c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDAzMiBTYWx0ZWRfX5qkxKS2lIzRV
 +yVZHr5cv1htQF4B7bFlzvCQgCpJAUoOvPuvg84qrQEcGGTIBx+X98BoKNooP4TFMS5Z2MLmEUX
 ddPlwiBa6MadAcQiKRMgC5Q+9kizqd55KucEvVSoOKKAi05a5MgRi7Y+2WF8ZbyLWjD4YrMsYku
 Gs+IBLMO8yXW7Him5UV4oM4Ho1GJVGJqtJvy8hAS0isCqjnn0jrn0WM2YSIMKHw3dDe91M4Xfrh
 GbmJsMarJUjbk/xSUj1y8I85DYVDyo06MRhHce/gzm7ob62UwzduvrLz5aYbGI0kjPyvHRKTrH0
 wk9ezzvwT+yKElt2jIJYqsSYNAttI6mq20h/mJfjPC2ZzwgvMhwTtVvsKl8qu17kOVkFmOPAiqU
 4GKOIlaMGrC0dR9/Gd+0/noQEgSsfEtHEZJ1ibMYGQLAV/8ttF3aXJdbYawVtIZloFvPFmpGMqq
 xjpW2YU9L9D5YT+7zNA==
X-Proofpoint-ORIG-GUID: 22cHtGojyd1fErxntw2Y8Ktu6gJ-vRpL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_01,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 spamscore=0 priorityscore=1501 phishscore=0
 adultscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150032
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-113064-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:brgl@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-bluetooth@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:cheng.jiang@oss.qualcomm.com,m:quic_chezhou@quicinc.com,m:wei.deng@oss.qualcomm.com,m:shuai.zhang@oss.qualcomm.com,m:mengshi.wu@oss.qualcomm.com,m:jinwang.li@oss.qualcomm.com,m:bartosz.golaszewski@oss.qualcomm.com,m:marcel@holtmann.org,m:luiz.dentz@gmail.com,m:luizdentz@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[xiuzhuo.shang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,oss.qualcomm.com,quicinc.com,holtmann.org,gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xiuzhuo.shang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9A44268307A



On 6/12/2026 3:42 PM, Dmitry Baryshkov wrote:
> On Wed, Jun 10, 2026 at 03:36:46PM +0800, Xiuzhuo Shang wrote:
>> Hi Bart,
>>
>> The main change in v2 was the commit message — I added the motivation and an example log line as
>>
>> Paul requested on v1. Carrying your Acked-by (given on v1) forward was just to avoid losing it. So
>>
>> v2 wasn't sent solely to collect a tag.
> 
> Please don't send new revisions as a response to the previous
> iterations. Also don't top-post. Responses should go below the questions
> / comments they are intended to answer.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Got it, thanks for your suggestions.
> 
> 
> 
>>
>>
>> Thanks,
>>
>> Xiuzhuo
>>  
>>
>> On 6/10/2026 3:07 PM, Bartosz Golaszewski wrote:
>>> On Wed, 10 Jun 2026 08:42:32 +0200, Xiuzhuo Shang
>>> <xiuzhuo.shang@oss.qualcomm.com> said:
>>>> Firmware version is critical for bug triage. Users reporting issues
>>>> typically share dmesg output rather than debugfs contents, requiring
>>>> extra communication rounds to collect this information. Log the FW
>>>> build version directly to the kernel log so it is immediately
>>>> available in bug reports.
>>>>
>>>> Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
>>>> Signed-off-by: Xiuzhuo Shang <xiuzhuo.shang@oss.qualcomm.com>
>>>> ---
>>>
>>> Please don't send a new version if all you did is collected a single tag.
>>>
>>> Bart
>>
> 


