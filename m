Return-Path: <linux-arm-msm+bounces-114094-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id E0oXCcosOmpT3QcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114094-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 08:50:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BF166B4A25
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 08:50:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ReJMtsRL;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=hZ6eXwDT;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114094-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114094-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3A6763037144
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 06:50:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94C273939B5;
	Tue, 23 Jun 2026 06:50:47 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42D2D3914E5
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 06:50:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782197447; cv=none; b=jLolq4VrmAQXGDEfz4qBGDanr2X0OZM0TeBOiAQP797JZj0vUS8RDSjhLUXvrrYDyoOSlwciU5QhTsQ24vSIyjL66DXRd9bn6wgqWPUQ4ng2iMXaUxYzlIscH0F4S++b3mQxd6Y3jNpLx0PtmT6CqrjVLm29rnjTkcZRqw2X9UI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782197447; c=relaxed/simple;
	bh=IXnObPcxfklEGW8mwyqDrX78VJ2H0BaeRxGVGXBSLcQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RzIDR3OYc7KTMJLznLJDxBLKP2d2DP+nxtyxtQjtCxqAaqDoUw+S4381gfQXF9LKi6f6cURfRroMEjJ+KYPiG8umq9cAhv7beh+YH9GsA6tmXFCXVxDGRe1iapgF1c+H5BQraRy4A2w6MTPVPamUtbVAT0ImW3GtvYTj5zv5UX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ReJMtsRL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hZ6eXwDT; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65N6dNCq3631267
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 06:50:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pCGeBjnOWqNN9uSHgYauVx8wOhwLSN9S6EVRONnx6SI=; b=ReJMtsRLIDDkoqnb
	jsMa8zCFkWa+0sxUBghR/QadO8hS3AMqhw2m30iig/dIJy/idMfoRrHN7BytfmPq
	5szeZkxxoFWEENQQZuV4kDTSvYwwuktFow10bD0FR7fsoHpCgK8AnRs2H6Z3uzx7
	SF7s6VQ6yKYwFLH6+e6H64b8mOZj6VUpgayji0dRBnEZ7gQ/1FrrcLNVfFXYcHIm
	1bptvz3oySWxuz0zZ+yy6o4eHupma+SpkJ9mF522kifyOzoM2MxEMUnQGfftoyEv
	hKl2D4YTYsQqYQiE0FPyFTSMhHpZyvuBweKoyWDem3QX5DM6/KFdDV+4b8TBHHhX
	tijVfA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eymnvr4ns-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 06:50:45 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9156dc90fdaso86127085a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 23:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782197444; x=1782802244; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pCGeBjnOWqNN9uSHgYauVx8wOhwLSN9S6EVRONnx6SI=;
        b=hZ6eXwDTtiOIP9DRE8azUObaIYUyIR74eE/LiSqQjFO3iE1F8tS3oLWY3cfm9872HS
         DjQUovXDPkiesPPKgRS35QHWbWk7Z7xdncrM4U4ePpHxn3WuYYa8oJqQs7kWO6meQa7J
         EhAAGYz1KO5gmb5ZzpEvQYqsxVx4R5wdvK41vVUMmrU5VuFOjnpdcPjUjJtqelSQjsw+
         JfcmJ/rQvFXgToipiK17cbFqrK5SK2q8VjGgK6r7yJtaMVdqTUmAbw0TtlKgJfC4Asud
         kWUgrRG74j+IKDhcyEdsKIg6ppzp1JCxtD+fMEAvsNWGzycIIOiTk4DNtKQagGQfUGam
         kVNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782197444; x=1782802244;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pCGeBjnOWqNN9uSHgYauVx8wOhwLSN9S6EVRONnx6SI=;
        b=L7RvP6/w3VDXWqeYWhQgByL6YWRILAs3i+1p3J3ZTVSikxOne6TXtBYwxkL4eSgcJF
         O0qvSDTekbcWNrfXdnXcC0q3xM46AD0wf/AQ6+Y5VUaO+xAf3I1fC5ySAvQIcjjRf/OS
         EUsDKpdho9xu9p5XR59z/QeedLAOnHYUM4hsL9GAmxDdNJGGzCtWQHwFpWlpFA7DeyRD
         RRGKiecvRFtaWcuHqsUBOVNjVvKpj9OoT++lRjHqnpgB7NrJzkOxXWYPcnSqOgsVTg8w
         zNer5uQip/j71n+w7QWuKHFUs3AjG9oYb7cuktMmXbcWWaorMa4pNZCChBjh4F9mqxln
         Yeng==
X-Gm-Message-State: AOJu0YwVnrd55uRpBodobbLTBECivCuFjpDANCO4enDdhwojucJ61pSL
	QMjgWdf6bDjz5kz628eq5X+yxNuX0y/FCQyj3fisjqwSNm/wwAPN72a3NBNiYZisUTAQ5PEafdL
	0d6D/VJ22eGbwg20MaFgdEva9RpmMuGZaIlB7ODtkeiqXwF06zgJ0+NxbaqU3Ets7jXGg
X-Gm-Gg: AfdE7ckM5inu7y7yGLNU3ZVVD5fp0qXVNuFcfI46sHXZbb3RF1OQOScXIyZWIlyjcgG
	Wc5XGuc5nDlsGjRXHDyLkurC5yNhIS6PII4w0B50N7bR1v/4tQ4kRGqDwaNb02ByKIXacH5vDrf
	Mix+jJq8wiiCieeP4yW5F7F/P4t45Ubhn5aBDd0Sc3omcTWdgUIu8l1QLHKpiv+FFU7ECvln+vS
	FJFLevcgTYsIcaejspapNjSyu08z8vBFPQhDMvenypeZzS9IT18mK2SvkmFW2KUmWGdVrpnSYXO
	Jggafb6xDUx/3WAdIlk7BQ616rCUFn8f+87SlHXRk9uJ3Hn7m/Y/cSEoRAp6dIPc7Q/F8G/dMzQ
	yyZVY4zRjdBk9P89cF8S2VrCccemblUe8wyo=
X-Received: by 2002:a05:620a:6cce:b0:920:6579:bee8 with SMTP id af79cd13be357-925c6f59e85mr431192185a.1.1782197444536;
        Mon, 22 Jun 2026 23:50:44 -0700 (PDT)
X-Received: by 2002:a05:620a:6cce:b0:920:6579:bee8 with SMTP id af79cd13be357-925c6f59e85mr431189985a.1.1782197444022;
        Mon, 22 Jun 2026 23:50:44 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0c5e998decsm459177966b.22.2026.06.22.23.50.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jun 2026 23:50:43 -0700 (PDT)
Message-ID: <d35d0475-89b8-43f5-b91c-4187e9e6c145@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 08:50:41 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] soc: qcom: geni-se: Increase MAX_GENI_CFG_RAMn_CNT to
 1020
To: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260522-qup-se-increase-ram-cnt-v1-1-71854d0b2ef0@oss.qualcomm.com>
 <09fb9e91-2585-4cb5-8bfb-92df304e9d6c@oss.qualcomm.com>
 <a8abd808-7b78-405e-9290-45052ab1fb5f@oss.qualcomm.com>
 <5363525f-9440-49bd-83db-242a7ed4e15d@oss.qualcomm.com>
 <9e57f91b-8f80-41d4-b50f-31c900cb0fd0@oss.qualcomm.com>
 <79520895-f584-47e1-8206-3b7c06b759d4@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <79520895-f584-47e1-8206-3b7c06b759d4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=dOWWXuZb c=1 sm=1 tr=0 ts=6a3a2cc5 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=Knb7rj4zzsAo1unsQiMA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA1MyBTYWx0ZWRfX+RkPngE7N3g9
 5i7WpqcSblnZIYK37NfG9cS7iZHqkbubZjpc8JEcI2o7r/LIi/X/tOR9nnx7D54ALBFpj3g3WnR
 BNpXP0PWOu3XyxmZyk610o9nPPITpLk=
X-Proofpoint-ORIG-GUID: d5bQV3gb-oraVh8XeMhNcpds0n3hIgTg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA1MyBTYWx0ZWRfX4bAI6SfY0BeF
 qPhVA4agWvCNbsd23nn99f05rLVzPZyN/XdH4GVzipBM+66QeKyp3cCIvJ48no5a1Dy86C5NBcJ
 B36wkiPG3trPvcnBuacy4ZDax5gy9MQV+ehfu0rrz8GqSXvNixXtCzUojh7ueR4g+Au+su6XhhG
 0ZU0x/qYU+i+SaO0eu0llBfMz/pFWr3ITkmBWwsK/H8d1fnH0DFGbaM1uqdniGa8d72i/CJgTBd
 KD1qKEhTjqhHhP7hCFJ746WVMmvXvJgrba6MdTRhaKZiqlaThmdoMvXpUVpHp9DtGv56JcuqC0M
 Mc5dUmjrxbSu6vYGo5F7YNos+gS1VpfdNgK/VIzq3Z7pJ67OE/HXfP3bQG+KUFqs6QsdJnKJgQ5
 V9jwh+i4IG7VDH6p6vyf+4g8xewtDrMpXVW7AiTCr4st+TNs+Gz8NKOUATJMdWvCMOZSjLm6BOz
 svGElfGWZg6Edbg6nzw==
X-Proofpoint-GUID: d5bQV3gb-oraVh8XeMhNcpds0n3hIgTg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_02,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 bulkscore=0 clxscore=1015 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606230053
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114094-lists,linux-arm-msm=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:viken.dadhaniya@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6BF166B4A25

On 6/22/26 7:15 PM, Viken Dadhaniya wrote:
> 
> 
> On 6/15/2026 5:30 PM, Konrad Dybcio wrote:
>> On 6/15/26 2:00 PM, Konrad Dybcio wrote:
>>> On 6/15/26 7:28 AM, Viken Dadhaniya wrote:
>>>>
>>>>
>>>> On 6/9/2026 8:40 PM, Konrad Dybcio wrote:
>>>>> On 5/22/26 9:21 AM, Viken Dadhaniya wrote:
>>>>>> The current MAX_GENI_CFG_RAMn_CNT value of 455 is insufficient for
>>>>>> certain Qualcomm SoCs whose GENI firmware requires up to 1020 RAM
>>>>>> entries, causing incorrect bounds checking and preventing firmware
>>>>>> loading on those targets.
>>>>>>
>>>>>> Increase MAX_GENI_CFG_RAMn_CNT to 1020 to match the hardware-supported
>>>>>> limit and ensure correct handling of configuration RAM regions across
>>>>>> GENI-based SE blocks.
>>>>>>
>>>>>> Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
>>>>>> ---
>>>>>>  drivers/soc/qcom/qcom-geni-se.c | 2 +-
>>>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>>
>>>>>> diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
>>>>>> index cd1779b6a91a..d0810960f3da 100644
>>>>>> --- a/drivers/soc/qcom/qcom-geni-se.c
>>>>>> +++ b/drivers/soc/qcom/qcom-geni-se.c
>>>>>> @@ -152,7 +152,7 @@ struct se_fw_hdr {
>>>>>>  /*Magic numbers*/
>>>>>>  #define SE_MAGIC_NUM			0x57464553
>>>>>>  
>>>>>> -#define MAX_GENI_CFG_RAMn_CNT		455
>>>>>> +#define MAX_GENI_CFG_RAMn_CNT		1020
>>>>>
>>>>> Is there any SoC where this could overflow the register space
>>>>> (you say "certain Qualcomm SoCs")?
>>>>
>>>> Yes, on Talos (QCS615), the firmware image needs more than 455 CFG RAM
>>>> entries, so the previous limit could overflow.
>>>
>>> What I'm asking is whether the size of the RAM on any of the SoCs
>>> is less than 455 (the previous limit)
>>
>> *Less than 1020 (the new limit), of course..
>>
>> Konrad
> 
> Yes, some SoCs like kodiak, monaco and lemans have CFG RAM smaller than
> 455. But MAX_GENI_CFG_RAMn_CNT is only a firmware ceiling; the actual
> programmed size comes from the firmware header. Talos needs ~650 items,
> so the old 455 limit rejects valid firmware. Raising it to 1020 fixes
> that without changing programming behavior.

OK

I tried to find whether there's a "ram size" register to limit it further
(i.e. have a different upper bound for different platforms), but there
doesn't seem to be one.. unless we can deduce it from the version
register?

Konrad

