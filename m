Return-Path: <linux-arm-msm+bounces-92717-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AL9MMEjxjWlw8wAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92717-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 16:27:04 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2631312EE77
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 16:27:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E37503011C51
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 15:25:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AE5F22D795;
	Thu, 12 Feb 2026 15:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VXqkHmve";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IVuHXlGc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 393782253A0
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 15:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770909904; cv=none; b=YlmyNo8m8VpKfCtvHOPYZIG5P5XI2p9D4XjfqAx4El9TJzMdAmUkq66kn081NEHTUmGv9GnWSulW3WsIV+HN1AUFqGqxjDfrXyJr5SXa/2J3SVNDLpQDIH2XHSOM+NuoooNfrKq1Jr6qT47k5jaqqYkSAtaejx2IzAgyTmxQnoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770909904; c=relaxed/simple;
	bh=vZtghbioPEYiah+MoX8gTKaFzFFJ/HaCdDIvxKcc+gQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AXnRr3qIp4i+XePA6hgYGL4JmYEsJY3UVYCBjVy7OhCQTuUNKqFqOI30L92Mq9i1dzSRKHKiA8wQqPb1+ubguzjJ3u2tbJlhOe4yihtDMxoVO5lGFLyG/EwcHTDIOhavB9YNEHchqKCFLBBxnbFnWp5zhns18cu6oTEn2DtisCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VXqkHmve; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IVuHXlGc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61CDRhHh588759
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 15:25:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M0Cmlk/Minp4VG2OAandk7L3RRoq662YgBpDU9gk8pM=; b=VXqkHmverqq1ueY2
	qtjatH82a4s1glaip30Gr85WGgCkBp68ot99Db7oXt59YBqguBLA+nLXHjtzwBpc
	6DPw47fcXX3twuO8cdMJ0EnBp22OokhZm5dzMgWwt1aZnoyq+6KzYXw6WEnvW39k
	IcTuKzwQMHpBQUI8cX27KR3g8y17DA4I5G/ViQQjzuHdOIYMETqHQFzl43sIws6w
	eAZBSAsj1YUZNYjtLPnQyNxiJJ5ZOilieGO8MUjcHy79iKoFC6Y2bnpF00Ui8PAD
	uBhTwm6nSJQUXC4hbtim1juk/ZI3PmUV1DrzzDOLyVBJbTJVL22RitPGGkeZoIM3
	/ERUWg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c93snjqx4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 15:25:00 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8954a05270eso13870606d6.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 07:25:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770909899; x=1771514699; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M0Cmlk/Minp4VG2OAandk7L3RRoq662YgBpDU9gk8pM=;
        b=IVuHXlGcQ4sOvBCxhbABdmIc+3OJCeSmbcrnVTOejUN8MplfqQMsd7FHAh4I3vp9Jq
         DlV3eaPvP1C7Jy13KMVcDU2EH7beUDalherWZHd9GIgh+FD1LMHV7EH4KxmVcTk1+15J
         QdMW+SqTWryc1nASeiOIO/tazM79KQ7guZiXMIazMsKF54Fd1l53zFiSEQSGtqvkQbBU
         gOuPDFVxZxkMjfHYrE4WFa5eSOednA7l74v7s+NouMdyzSXBUIhgV4OUYv9l+iwM5+LS
         nJ8ZIH4nEoTAQyAMHG+yFKL/nqjwDvdYaviWdpNki3rOXSegN8rlP0LKIeoddWUgMtj2
         Xkfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770909899; x=1771514699;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M0Cmlk/Minp4VG2OAandk7L3RRoq662YgBpDU9gk8pM=;
        b=ru7p8ZW+854b8k1Ovgeqw2f+WqFG4yl7bZL4/F5vr0K6agfI/d35oZNp8ziGWo/h7X
         0wQQqZQ1KFg9ZEMiz/GmuvWngA1lRhYaUp1ZWHgsxrToFJEeodbsXVZg/TrWsju4QFPA
         3zi/9BgLAZeZ9RRr1KmvVSGiMuLiKDIeGQT5t6enwIgHys+OD8Ldb3j4ln+iERumx62j
         tlt74fC4uiLSem8NDSeMkIYzPfZ5zTHXUDm9KFSpJw2O7F9Y2dEweUmNHMvyBIpXBh6q
         HgcVu9knlVMLtMHwUJu5+WCrAoSCrCRsnv6zHeooNRA9NE8INfKtaluM8pRBziBSFh45
         bcyw==
X-Forwarded-Encrypted: i=1; AJvYcCWqS3kYdqeD5QFvJaPRaVGo1df3U8dpeoUf+oWNp15xrRy+ByGthRvU57QQZqOFrl5M6aZvhGP9kwownB2q@vger.kernel.org
X-Gm-Message-State: AOJu0Yx76tF0N/IY/mXrwmsQCn05LPaS6RbJDisy4hAJIBj53knO4lbG
	TNFJBVXqU8WMf7c75P7mvfsXaC7ODQ7e3Y6lF31YLMfCNb5IOWUAGsgm/IXevOklqYaTeIOal+r
	46qYy/hWA3it7jNcGB/3/pTL5/TugIILlQmQzTR/v1kHpUE55bdDNFL3mNva3fpW+arxz
X-Gm-Gg: AZuq6aIUg78s7y2zs/tUoNavvHuow7VKrGu4aepxgj7d8vBNt4Vf9wtZIOHcknxpZbf
	X/CYyYTuAhVPcYwadpxXMduo6eqyiWDgjz6kGEcoI9Q84ZrsDc3bUC6Ib6/wbA7x3eud6rIuSpH
	fDKiNY9BJQMoKv/BvZM5wQQtunZdrPtP8Y8uryojrgtQ/cDsB3RleLJr8hpHkWRzkIjh//iLIcj
	rIzT84+qDUFLp/fMDWIicZmmyHW+Ho/AtUcmN6SbugbitwIUCzsJnQjvE3i8MVN0GLTan7ZRwry
	zR4h61V8HXbCqIBYgYRcIEKpsFqjqVjcHfiNO+SrC1umgUoU0a6suUVQrYmfQIjup+xrpBaRB/M
	X/KtrK/8MhYxlG4amS6EvFHhLCZmEXJVkhuclhptU6TLrNhN6WB4rPlwJTScyPfPnZ+hb8DnO9S
	aaZ7M=
X-Received: by 2002:a0c:e002:0:b0:897:3f5:6a9a with SMTP id 6a1803df08f44-89727aaaaf6mr34928826d6.6.1770909898838;
        Thu, 12 Feb 2026 07:24:58 -0800 (PST)
X-Received: by 2002:a0c:e002:0:b0:897:3f5:6a9a with SMTP id 6a1803df08f44-89727aaaaf6mr34928366d6.6.1770909898191;
        Thu, 12 Feb 2026 07:24:58 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65a3cf50e38sm1794656a12.33.2026.02.12.07.24.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Feb 2026 07:24:57 -0800 (PST)
Message-ID: <6e706170-4dac-48c8-881c-4f244a3db34b@oss.qualcomm.com>
Date: Thu, 12 Feb 2026 16:24:55 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath11k: Silence remoteproc probe deferral prints
To: Bjorn Andersson <andersson@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260212-ath11k-silence-probe-deferr-v1-1-b8a49bb3c332@oss.qualcomm.com>
 <f028462c-ae31-4fa5-b414-e03d3a73fdf4@oss.qualcomm.com>
 <zpddlyuwrxr2rwjsyzsucgm3irtxmetyhhajptveojnmo7vcni@ntyqoahm6xtq>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <zpddlyuwrxr2rwjsyzsucgm3irtxmetyhhajptveojnmo7vcni@ntyqoahm6xtq>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEyMDExNyBTYWx0ZWRfXwCEXv8ec1azA
 IZfr2GZTJGM2LPGHK0YobvczyoOH6phyM3xYZdmnvgy1Dys8GDS5faIYgp/m4zWNgrS9YQZpi8r
 8ZJ4g9zmA9i8AyrLtDGuTu0vSKc2a5LplBgMT7pDr+fCo4Xrw7zLR7BUzZq+zz3lVImMYCAYLyB
 +jJJ9RhQxtZCxB5HV8h3CJv3jZE8QAVNaji6BdbDqVMbGDZgOwNh08fOsWg/EyYoaqvS+PFj29N
 wSW53TvdCldMwBw8DtSFkrTmJhH8eV9mghMrWGo4m+bkStZdQ11USla3tuai2INFTQAZgq0rPR+
 R01jl5pxgLD7PLQEMIUDwl+oo/MEnFEMv8wwsp9HmNQunM65yzqY5yxo5SA30FOfPGDp9A8Wo7e
 QVOvaseZmi70Ra57ozKgziEJz6Zb3umPFWVyZMHzyMV89kjF9GHKxeOsOTvEuLB1cG0llwhuxS2
 bcAsmBTDBAlLq4i1jCg==
X-Proofpoint-ORIG-GUID: wlS6JW3ZkHMmll3KMMwbzPWxtcM506hO
X-Authority-Analysis: v=2.4 cv=dLCrWeZb c=1 sm=1 tr=0 ts=698df0cc cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=mOPo6HKdNPmMLqtFk4QA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: wlS6JW3ZkHMmll3KMMwbzPWxtcM506hO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-12_04,2026-02-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602120117
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-92717-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+]
X-Rspamd-Queue-Id: 2631312EE77
X-Rspamd-Action: no action

On 2/12/26 4:16 PM, Bjorn Andersson wrote:
> On Thu, Feb 12, 2026 at 04:01:21PM +0100, Konrad Dybcio wrote:
>> On 2/12/26 3:52 PM, Bjorn Andersson wrote:
>>> Upon failing to resolve the remoteproc phandle one ath11k_dbg() and one
>>> ath11k_err() is used to tell the user about the (presumably) temporary
>>> failure.
>>>
>>> Reduce the log spam by removing the duplicate print and switching to
>>> dev_err_probe(), in line with how ath12k handles this error.
>>>
>>> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
>>> ---
>>>  drivers/net/wireless/ath/ath11k/ahb.c | 10 +++-------
>>>  1 file changed, 3 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/drivers/net/wireless/ath/ath11k/ahb.c b/drivers/net/wireless/ath/ath11k/ahb.c
>>> index 8dfe9b40c12626649639fc1dd9da0e5e0c2dcaf1..08d3a0c8f105b26b1548c5d6006f6ea162fe58ff 100644
>>> --- a/drivers/net/wireless/ath/ath11k/ahb.c
>>> +++ b/drivers/net/wireless/ath/ath11k/ahb.c
>>> @@ -807,10 +807,8 @@ static int ath11k_core_get_rproc(struct ath11k_base *ab)
>>>  	}
>>>  
>>>  	prproc = rproc_get_by_phandle(rproc_phandle);
>>> -	if (!prproc) {
>>> -		ath11k_dbg(ab, ATH11K_DBG_AHB, "failed to get rproc, deferring\n");
>>> -		return -EPROBE_DEFER;
>>> -	}
>>> +	if (!prproc)
>>> +		return dev_err_probe(&ab->pdev->dev, -EPROBE_DEFER, "failed to get rproc\n");
>>
>> I'd like to think this doesn't really change the behavior, but I'd rather
>> see this that in-house print functions..
>>
> 
> I'm having problems parsing your sentence. Are you saying you rather see
> us keep using the ath11k_* functions?

s/that/than

i.e. "no"

> 
>>
>>>  	ab_ahb->tgt_rproc = prproc;
>>>  
>>>  	return 0;
>>> @@ -1190,10 +1188,8 @@ static int ath11k_ahb_probe(struct platform_device *pdev)
>>>  	ath11k_ahb_init_qmi_ce_config(ab);
>>>  
>>>  	ret = ath11k_core_get_rproc(ab);
>>> -	if (ret) {
>>> -		ath11k_err(ab, "failed to get rproc: %d\n", ret);
>>> +	if (ret)
>>>  		goto err_ce_free;
>>> -	}
>>
>> If the rproc handle is unavailable at this point, we undo quite a bit of work
>> in .probe.. would it make sense to move this check way above?
>>
> 
> Given that devlink doesn't covers this, but presumably cover several of
> the above resources, I think that would make sense. It would be a
> separate patch regardless...

Yeah, I'm simply thinking out loud

For this one:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

