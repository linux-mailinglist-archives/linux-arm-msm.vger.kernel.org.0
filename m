Return-Path: <linux-arm-msm+bounces-103869-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YLKGB+v05mnF2AEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103869-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 05:54:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 735E943620A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 05:54:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AA0EE301378F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 03:54:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19C25278161;
	Tue, 21 Apr 2026 03:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MTtxBLHc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O0v9a24M"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5AC126CE05
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 03:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776743651; cv=none; b=qy2FIhq1QASSYIFWRb23iOd115dY99JrSzRg2hsfnL6ITs6YCKUm7gRUuTEkmfROEYbONP336xYsPLiYh/kz9xTDYYkOWKyauLSzlCj2/+Lo5nxc87CGlKJac2IbLIqYHXgz4syylAjlN8oN8aBnZV5QbX7E58S+mk8m2jnHLZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776743651; c=relaxed/simple;
	bh=1xHdqfLyvr7XpT1wmvpgqlQ789usxvTM24fjsGmXqZg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nf01g3JFldRbAHU5OfvmeRKWoRphIydQQT9/XVlTZZTN40wmOk9rsocCvlLYEWLUQRFWIpR4HsnGSH0P3W/0jVKwbAl8H8D9Mz86dkLwzzaOCL5CLeGcZfYz08fZjnTT1glUEz97i4IvwsHfzmzVOdzewwOqiUAFBU1/POUVpBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MTtxBLHc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O0v9a24M; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63L1IWYe1601031
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 03:54:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	reNIUZ1BQJrOjK881QqCqiO8dR1s9yebM1FUayY4Tz8=; b=MTtxBLHcFM6nTSOi
	vaV7YFFJDKXwkEgunTZYpZdlm8AaWAtEKg+BzfMN6lmOqaVYaaap/QoFA/l9Obsc
	nTPaiC7JeFYhhLdvXgo1H0tuv6v8GuzKyFfDBtTZ433/Z04iAx3AAEeCtBPPmWpm
	ERCQ104+4i6bHilokPjVte1JNQriJWN7z7h/XtiN5mtCaPKLMg6f4cbCaBoI3H0Z
	cAcu1LyROEF0rbVT5xg+x64e5tzZv8jtqtjxqRM+i2ja3xxo4RtX1k7LeMISQl28
	57HLjPd19zyTNvW1AGn71aD+gXpZ47doYGJr9nn3vsJxRT7ahRW8HLiaCvaACpNH
	/Kacbg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnh89bjrg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 03:54:08 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82fa366fb79so2569865b3a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 20:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776743647; x=1777348447; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=reNIUZ1BQJrOjK881QqCqiO8dR1s9yebM1FUayY4Tz8=;
        b=O0v9a24MiD6ZWlIxNHtGbV//r1cMn/crFOubkyka+szS3chC4psREGP2gkP8u8BUrH
         b424KFV2AqHphD5xZP/80MnOOhdcZ+8OXiV3dMcusVWsnTcyJu9Ns60AI5DI8gfq+z8u
         FfBKMGsF+1C+hd9YcQTNSqSW+TmwiyM+irQlBuzeWHv1+X0AqpQDlBkWc6e4RUoBukKx
         L+ueJMv31dX1qTHgnZCqt9l4VcMgagVEk51382noohL1B9a/evrWnkmeBQLiai/+jdS6
         z4ydny93cjPAMb77k1iUaSZVLr7QzTzXgzXq5KZXw1GtzGtUCuqMnRODiofANUMcMpJP
         VvIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776743647; x=1777348447;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=reNIUZ1BQJrOjK881QqCqiO8dR1s9yebM1FUayY4Tz8=;
        b=kMLYXTNoKjv1PobBhRqpcufuWKJX6WPeYq49zDRUraRuoEx9fJEFhYgs3L62nSjIv2
         sfYY0GrJyG5cmOfObB8smCF2Tn7/pxgHL5g+imhEqzhE5T/gwvt+rCQAZxdgZxZY0x3r
         4zXHhFoWZJnoRNwaLLDqZAZQSVK7SnsYWs8b52xqUnzj8iU+GLSniggWg+/Ai5IcMjD6
         3/91TBZQZDaVb3NYkAa5KpJOredOF70CYJFUOGPoRgiMnmVNlbwMK65Mw1q661C9p1QF
         /2TMYdGNhL+ktWmVdGR0nn3IWtOekpWiIjD2p1X/oKoUSpcBd1Z+TJgRYWPmUIOZ66Ns
         5NRQ==
X-Gm-Message-State: AOJu0YytPjmBGr9sl07HCEJEWiV0aJE3mrc3FoKtc4zdhZb0WciTkP7X
	SssQAlNnJHJoAyEIoWAxeYbzom84xrfqty+zCSMMNSw3AaxAH/amLU6tm15NV6teoVngBOTl1uB
	KX7bDWEoPSwIdD8M592iGyBGseY8qn0iA1sxkuYl5DGnYZ5wYjdKbhsNACc6+lPZTbTK1yCkpZS
	246+o=
X-Gm-Gg: AeBDies6NXFuxrhyScxd6cPeZhLQ15VizF5JfCYa3vdCFxxQ3hmJJUmu6KKIWTJ+CP6
	ht5diPEZQpajhScJRt7URJ74W4CPE775ltR6TJuX4KxyN5wwjCzyRA0MMkbXmu3I9tOAG30hXKl
	07KBB1hjb9RVnkb5liAnhXUgb/Z5cW257aVui4+m6BHGd/M1a9cSmhBMmmgDcDsh5/2FwqlG6Q5
	x3sq+odijIEKak7wzIXH+pxAcIvAyBbFMOPOeb91A125W6fspGiImIryIopoY3UySRvKgG7Pu62
	LzYbkmfvwCoLEXzCZDFohSAUpXZCI9oRQwmK8bEa+nPisjbfIXrssl2P7bKZocIukSR+XAN0BpT
	pmZSL/ZPhGWmimBvghHn3g+Z+E3T5Yd0ZZorgmlJxSmERPSJK9xWP1MFNrvSTlA+xj5gnAX9V7p
	tEpJsGWYthfHtLGTG1TS6NZAIpiz4U
X-Received: by 2002:a05:6a00:bb91:b0:81f:31c3:2e34 with SMTP id d2e1a72fcca58-82f8c902072mr16719740b3a.25.1776743647439;
        Mon, 20 Apr 2026 20:54:07 -0700 (PDT)
X-Received: by 2002:a05:6a00:bb91:b0:81f:31c3:2e34 with SMTP id d2e1a72fcca58-82f8c902072mr16719704b3a.25.1776743646903;
        Mon, 20 Apr 2026 20:54:06 -0700 (PDT)
Received: from [10.133.33.141] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f97eb5ce8sm10205408b3a.61.2026.04.20.20.54.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Apr 2026 20:54:06 -0700 (PDT)
Message-ID: <aad6a3a4-5050-467d-8ece-e83648d219d6@oss.qualcomm.com>
Date: Tue, 21 Apr 2026 11:54:02 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] phy: qcom: edp: Add eDP/DP mode switch support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20260302-edp_phy-v3-0-ca8888d793b0@oss.qualcomm.com>
 <20260302-edp_phy-v3-1-ca8888d793b0@oss.qualcomm.com>
 <245f4589-d7ca-4d6b-8162-a86972752bd8@oss.qualcomm.com>
 <12e8a8de-49b8-463a-8b88-2cbbf1ab901c@oss.qualcomm.com>
 <e956b609-3e37-4c3c-9168-a50793722061@oss.qualcomm.com>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <e956b609-3e37-4c3c-9168-a50793722061@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDAzNSBTYWx0ZWRfX0GuRilDuNNhP
 RgI5dmhgpfA8YzLKG7mTv/w+Babm3D2I1a5LDJ5TnaUM14xNYCvqeMGnECb8dCOEk+WPcqHM3+r
 fKa7Gouh6VSXy3GJD5N5eNIsre0wvMcfyqa28N10CZwbtWajKpSbLWf62kh/OMSuEhViKPr20ih
 m/+YZocoP7mQy7KEPqGmbQ5ACdML7COQwj3ia1+k/8ZSOtsE25AlbuOeU8jCmTLIHvp+3GkqYhV
 ZINA9JuWS4vyCypWHdVndvBBKVvhaJXm3hJGIq7SHi7qQ/zvpQgXfhks0ENZCVHfM3y0G8EsAR8
 8XFiNJwQWrm6SbLJcnES85XLVETlUVo1/SNP+I/iI6KY74Qa2gMijN5VEeTPT9bn0psiAgkCgwS
 E/DRRwZvlwk0FGcsDOOqFE5mBdB5Y9ZRIr1T5IX1ps8eFHOrTWzXNur55s+CbUcFBgge+XyjAhJ
 9leEIphuYbdE+zce1Cg==
X-Authority-Analysis: v=2.4 cv=D6B37PRj c=1 sm=1 tr=0 ts=69e6f4e0 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=i7yIW9Iy5qQLytvIRn0A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: -OaC8-vaiqazaSQ0m1kiWN-8th928UMr
X-Proofpoint-GUID: -OaC8-vaiqazaSQ0m1kiWN-8th928UMr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_01,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604210035
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103869-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 735E943620A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/20/2026 8:49 PM, Konrad Dybcio wrote:
> On 4/20/26 2:48 PM, Yongxing Mou wrote:
>>
>>
>> On 4/16/2026 5:34 PM, Konrad Dybcio wrote:
>>> On 3/2/26 9:28 AM, Yongxing Mou wrote:
>>>> The eDP PHY supports both eDP&DP modes, each requires a different table.
>>>> The current driver doesn't fully support every combo PHY mode and use
>>>> either the eDP or DP table when enable the platform. In addition, some
>>>> platforms mismatch between the mode and the table where DP mode uses
>>>> the eDP table or eDP mode use the DP table.
>>>>
>>>> Clean up and correct the tables for currently supported platforms based on
>>>> the HPG specification.
>>>>
>>>> Here lists the tables can be reused across current platforms.
>>>> DP mode：
>>>>      -sa8775p/sc7280/sc8280xp/x1e80100
>>>>      -glymur
>>>> eDP mode(low vdiff):
>>>>      -glymur/sa8775p/sc8280xp/x1e80100
>>>>      -sc7280
>>>>
>>>> Cc: stable@vger.kernel.org
>>>> Fixes: f199223cb490 ("phy: qcom: Introduce new eDP PHY driver")
>>>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>>>> ---
>>>
>>> I went through everything and all the sequences are OK.
>>>
>>> SC8180X will need changes, but it's already incorrect so this
>>> doesn't necessarily affect it
>>>
>>> Thanks!
>>>
>>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>
>>> Konrad
>> Thanks here.. I didn’t notice before that SC8180X is different from SC7280, and will correct it in the next version.
> 
> Please make it another patch on top of these two, so that we don't have
> to re-validate the existing diff
> 
> Konrad
Thanks very much for the validating this patch. Could you sync with 
Dmitry how i post next patch?... He suggest me to splite this patch...


