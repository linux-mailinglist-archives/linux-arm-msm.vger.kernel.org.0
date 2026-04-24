Return-Path: <linux-arm-msm+bounces-104387-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iLW5MKwN62mvHwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104387-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 08:29:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 17AAB45A3E6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 08:29:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E3AAE3015CBE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 06:28:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE9E8354ACE;
	Fri, 24 Apr 2026 06:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ko/7KaUz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J7LVVT1e"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7852534FF4F
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 06:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777012129; cv=none; b=mhEAImlPDNAmN4hnoa+2rKZyTZoZaWQxCKcKeiuOrTEL5n+NZb+TAUyjM8gBYZbmYDVIjXaEdsDBKcu05eTeKGgSruPYkyzO/MSP26gni8Od4IcMCmPJpR64mCOf3nmWaVrvaLoJL4oU9TsulYb1nebe4WHjHURco+3VLTl5D+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777012129; c=relaxed/simple;
	bh=v4lzZb8z7oq4g2InfkmpENPN9iW7RCVGiCC+qJR87vo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Yij9hug9KEQph2oMFNVAPtuI8nXFPxUrZh05BQiR+o7Tj0eskdRf6Y6EG/mAltbYfdkvHFZUjNktaczH7vk0DnGOkT6Ad2zeMAvoQNW9FpvpupzKSkUi2FxL7Y0BMMeNnvTK6s6CGI/OaZgKlFjquGvRF8xE15P7gKKVF0APK/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ko/7KaUz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J7LVVT1e; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63O2EMOB1533422
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 06:28:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sr5gOJDsXqs0OCz2aTMix6lTxgOix0DJAO0zyJju2tI=; b=ko/7KaUzdTQqLCwJ
	nC8cmuFFkOnx3MGJyn2QvWF3r+gKhyWtgzYH8gLTsKJK3hMLbVW5dcE5++CUanvU
	WpnruSlR9dlbuHfFwdK8Ao1bUXhWalzDEmJs6Zqq0xNTjxyBqYw6MlaEUIr2kNIv
	U7D6//y3/KKctcitj0cEDiFO6fuifko3iF7Uifx3IQsdPUr9BX0a77gSC5/uYtUa
	K6/SgzCmQZuwaD1OA/aPvgevRuG6QxYHoVexYHa7pIdi3vMVQ2EoP8oPV73b4+F4
	QxR3AR0xRv7JlaSAnYfjQOKq6bn9ciFZK/I3TWfWLiJn0TpT49/DnvFZPnkN8E9s
	iCm90g==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dqr26jjah-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 06:28:47 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-35dacc40f92so7521365a91.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 23:28:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777012126; x=1777616926; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sr5gOJDsXqs0OCz2aTMix6lTxgOix0DJAO0zyJju2tI=;
        b=J7LVVT1et8ss4Rb616V3rwVBdrT1UP+vs/9jyJDsjivWUYQybh4N4vEfJ+QSwHR0f+
         p36WqI7GlR7HK55+vdfVArwsEqErqA4q2/fErlAZiOMnbQAR7okudJIh8O495vy//7UE
         Dz0KwyzoRFEYjXt+S8UJxEzpi4fzGmPEHHt8kqZel6ogogBN1Oqaekr7ak5FVwkqAF/8
         oNvQ4umkmNvKVKvRUVMsDqS+vmfgn4Ow5etrFcLGoarUEL9YHDiztIl2R/89rUqUdNwX
         +3CqpcigahGsKHZQ2d9PivHy6wBxMcqu47cYybZLN2X6PHXRIfW6zff/Leih9onevkfh
         swHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777012126; x=1777616926;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sr5gOJDsXqs0OCz2aTMix6lTxgOix0DJAO0zyJju2tI=;
        b=pKV/YbgQbnGCkG5xG14E1YVmk8BiR3ZikKDnTrUAovrhPZ8WYVaZeLtO6A2XPCUsS5
         J8BMCQUqdSwg95x2WQN28O4LN1JLWERz/tmldNz4dWct7rK6nocBzgCxLyk/OeTL0mvj
         CRbYiPaaTEDa8Fs4VQcsoKl1O1PfXF8k/PSbNQyH0O8xvNaxnHD5onInV6JzrVvtc0mG
         xdsKfKp7spiHqB2rk0iKTU4cMygnDDO49jPCCYTn7e0nCAgOfNhBy59qzHHaWwUidJFX
         4F/sJdromDf4VAA1x4Wv786g5WcBgey+OTgeJbrovSNsy3xEET1UmDlZ5aCh+M1ieCdu
         2IVQ==
X-Forwarded-Encrypted: i=1; AFNElJ9MpD9LdPif2eLecYuZyizvXj+VbWxdj1ysvWvgzIXRLMy6XomKMHl0Bjo9Uyaeb86rIN5ywo6fCb6bvrBE@vger.kernel.org
X-Gm-Message-State: AOJu0Yy96HYWrxhspWqjdz/KOcbREBVjoVjf1VPAGTFwdfqbhhI6KiW4
	v2RhtFNjYXmbktglhTtJNIfN5Cvl5iKneSuXyQunRfWPFE6FJ4ATXe3VwS2vLgWFfra7iD+wS45
	OYC1pp3YpzQij3CSp7sTTkLcTDJiyqBMW7Ziq+hRtk7PYNIOSQyot6YJRXsm5dEkm8ogb
X-Gm-Gg: AeBDievzf4K/BgrWrY8v6FG6EL7pphqQRLXIbHU+i/er0qAIdYE/TdP9BeXtWwrZ6B2
	k6jXX3OGxYvByzD+gn2US4wiu9vEgv8uF1v5WqsA1TCt0Pji0Bn9G2rLkucbRX8iHa7ln/3E/i/
	KKE3ozfGD/5k3nffvGuX+rFGxo0t634QdCspD+Udv6GyeE8C5Ybw2S+6Hv3d+mhOhQmIQqIH1IE
	rCBR9fzTLywiI+1YfyF+bNxkNztCj0LAZKrJ+JCd14E8V7tPCQMf3S/N/4KTksUfoolavTSMU27
	Ow52TQ20rnWrwyD6qFv21jYfKeMgNJS8hDhteNKFmXbsgkND/RT55UgcPve1JP/Z8HMC0kjjzd6
	IL2cBngxKabWekwkmtO/v4RzXoP1zW9Lv8cmkmWq+ulxPbPsB0wK4Ws/KSjT+2fI=
X-Received: by 2002:a17:90b:3d86:b0:35c:a8f:5c5f with SMTP id 98e67ed59e1d1-361403f0ee8mr28696977a91.8.1777012126213;
        Thu, 23 Apr 2026 23:28:46 -0700 (PDT)
X-Received: by 2002:a17:90b:3d86:b0:35c:a8f:5c5f with SMTP id 98e67ed59e1d1-361403f0ee8mr28696939a91.8.1777012125624;
        Thu, 23 Apr 2026 23:28:45 -0700 (PDT)
Received: from [10.218.6.76] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36140fc5d94sm28499012a91.2.2026.04.23.23.28.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Apr 2026 23:28:45 -0700 (PDT)
Message-ID: <d20e8ced-9454-4924-9042-2f725de6d332@oss.qualcomm.com>
Date: Fri, 24 Apr 2026 11:58:40 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: qcom: Fix wakeirq map by removing disconnected
 irqs for sm8150
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Linus Walleij
 <linusw@kernel.org>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
References: <20260423-sm8150_gpio-v1-1-e418613a1f48@oss.qualcomm.com>
 <gayeixwyvv4qjtpc6gz5ljrtpmb4ckm4up7gdxutpbatbxny74@kazqjbepwb46>
Content-Language: en-US
From: Navya Malempati <navya.malempati@oss.qualcomm.com>
In-Reply-To: <gayeixwyvv4qjtpc6gz5ljrtpmb4ckm4up7gdxutpbatbxny74@kazqjbepwb46>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 8glSyn4JRPFslATYXjBj4_yfb15d6sVQ
X-Authority-Analysis: v=2.4 cv=QLhYgALL c=1 sm=1 tr=0 ts=69eb0d9f cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=tG5hwu87TR8JjoD4RVAA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: 8glSyn4JRPFslATYXjBj4_yfb15d6sVQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI0MDA1NyBTYWx0ZWRfXxzBWGVrGuZwp
 rSQO7db52YymNQa65OlC92VaTpL85CAZSJvrDgp1Mc8cI2pjUgr8RV0d+szSxQRAMqjxgz2Wqk3
 eg8E39ZHUaE8SoLHaHuiWNS/iRGIdxOZwJXEQzglU/Up/ZGlE4o5tc6Fy2hxyGMgNLld4ytPYbb
 LvhlvvHN2V546GHHkXT5w7TNrO71c1s8aAbvqNG74TgNK8ET/wytlJZcpoaWUzPhJX+vUrq06PE
 +0I38HDnpyH+xoXwFQXZwNzO8xOmOhrfWd19rgySJY3Q3aibIvAUBmS/jvbrikSTpSjbTOd5rPT
 AT1yKaCOiu28N8Scip9eTbiQMmAY42iLz8APJLJoJoRjdxego9883oWXfujUhBlY0vCxkkc3kFV
 yJjCWqOrl7utCENw3LTMYO7Fg0P9SbCoHAGIbupY97NnKGdCgpvM3JfkaglT29HvpjW+czDbP3D
 UEtvIyanA0Ig8zFzDyA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 suspectscore=0 phishscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604240057
X-Rspamd-Queue-Id: 17AAB45A3E6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104387-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[navya.malempati@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]



On 4/23/2026 6:09 PM, Dmitry Baryshkov wrote:
> On Thu, Apr 23, 2026 at 05:21:01PM +0530, Navya Malempati wrote:
>> From: Maulik Shah <maulik.shah@oss.qualcomm.com>
>>
>> PDC interrupts 122-125 were meant for ibi_i3c wakeup but sm8150 do not
>> support i3c. GPIOs 39,51,88 and 144 are also connected to different PDC
>> pin and already reflected in the wake irq map.
>>
>> Remove the unsupported wakeup interrupts from the map.
>>
>> Fixes: 90337380c809 ("pinctrl: qcom: sm8150: Specify PDC map")
>> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
>> Signed-off-by: Navya Malempati <navya.malempati@oss.qualcomm.com>
>> ---
>>   drivers/pinctrl/qcom/pinctrl-sm8150.c | 23 +++++++++++------------
>>   1 file changed, 11 insertions(+), 12 deletions(-)
>>
>> diff --git a/drivers/pinctrl/qcom/pinctrl-sm8150.c b/drivers/pinctrl/qcom/pinctrl-sm8150.c
>> index 0767261f5149..81c08b18ac71 100644
>> --- a/drivers/pinctrl/qcom/pinctrl-sm8150.c
>> +++ b/drivers/pinctrl/qcom/pinctrl-sm8150.c
>> @@ -1493,18 +1493,17 @@ static const struct msm_gpio_wakeirq_map sm8150_pdc_map[] = {
>>   	{ 3, 31 }, { 5, 32 }, { 8, 33 }, { 9, 34 }, { 10, 100 },
>>   	{ 12, 104 }, { 24, 37 }, { 26, 38 }, { 27, 41 }, { 28, 42 },
>>   	{ 30, 39 }, { 36, 43 }, { 37, 44 }, { 38, 30 }, { 39, 118 },
>> -	{ 39, 125 }, { 41, 47 }, { 42, 48 }, { 46, 50 }, { 47, 49 },
>> -	{ 48, 51 }, { 49, 53 }, { 50, 52 }, { 51, 116 }, { 51, 123 },
>> -	{ 53, 54 }, { 54, 55 }, { 55, 56 }, { 56, 57 }, { 58, 58 },
>> -	{ 60, 60 }, { 61, 61 }, { 68, 62 }, { 70, 63 }, { 76, 71 },
>> -	{ 77, 66 }, { 81, 64 }, { 83, 65 }, { 86, 67 }, { 87, 84 },
>> -	{ 88, 117 }, { 88, 124 }, { 90, 69 }, { 91, 70 }, { 93, 75 },
>> -	{ 95, 72 }, { 96, 73 }, { 97, 74 }, { 101, 40 }, { 103, 77 },
>> -	{ 104, 78 }, { 108, 79 }, { 112, 80 }, { 113, 81 }, { 114, 82 },
>> -	{ 117, 85 }, { 118, 101 }, { 119, 87 }, { 120, 88 }, { 121, 89 },
>> -	{ 122, 90 }, { 123, 91 }, { 124, 92 }, { 125, 93 }, { 129, 94 },
>> -	{ 132, 105 }, { 133, 83 }, { 134, 36 }, { 136, 97 }, { 142, 103 },
>> -	{ 144, 115 }, { 144, 122 }, { 147, 102 }, { 150, 107 },
>> +	{ 41, 47 }, { 42, 48 }, { 46, 50 }, { 47, 49 }, { 48, 51 },
>> +	{ 49, 53 }, { 50, 52 }, { 51, 116 }, { 53, 54 }, { 54, 55 },
>> +	{ 55, 56 }, { 56, 57 }, { 58, 58 }, { 60, 60 }, { 61, 61 },
>> +	{ 68, 62 }, { 70, 63 }, { 76, 71 }, { 77, 66 }, { 81, 64 },
>> +	{ 83, 65 }, { 86, 67 }, { 87, 84 }, { 88, 117 }, { 90, 69 },
>> +	{ 91, 70 }, { 93, 75 }, { 95, 72 }, { 96, 73 }, { 97, 74 },
>> +	{ 101, 40 }, { 103, 77 }, { 104, 78 }, { 108, 79 }, { 112, 80 },
>> +	{ 113, 81 }, { 114, 82 }, { 117, 85 }, { 118, 101 }, { 119, 87 },
>> +	{ 120, 88 }, { 121, 89 }, { 122, 90 }, { 123, 91 }, { 124, 92 },
>> +	{ 125, 93 }, { 129, 94 }, { 132, 105 }, { 133, 83 }, { 134, 36 },
>> +	{ 136, 97 }, { 142, 103 }, { 144, 115 }, { 147, 102 }, { 150, 107 },
> 
> Is there a chance of mimimising the diff here? It is harder to read than
> your v1.
> 

This is v1.

True, it is little difficult to read since multiple lines have been 
changed to re-adjust fitting of 5 entries in single line, otherwise it 
may look non uniform across lines.

Thanks,
Navya


