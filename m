Return-Path: <linux-arm-msm+bounces-93293-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EPG/IPXOlWnjUwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93293-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Feb 2026 15:38:45 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 11CE31571A6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Feb 2026 15:38:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8AF2A301187D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Feb 2026 14:38:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2995B334C1C;
	Wed, 18 Feb 2026 14:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Pgitkos0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d5S6jNxU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04F3F330641
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Feb 2026 14:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771425521; cv=none; b=Zvf6ezsCZt2yiUgLNsCVbR+USvn964HTs9z2ygfMPEv8yZxkoMgjh8q3pKr0KZ5n49yBtrYdfCxLMqXktUkzAp7vhPgZ0CuauYQ2lyhcYZkhzQ7m/Ih4+z+WKmbWRZC+DMmZF/BFLVETtfGUdygXoMdCnE1iibTSawIsMu68Xgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771425521; c=relaxed/simple;
	bh=vUu2tw8Z85UwIH/pkoLHOTaWnUiXl4S6e78RxA96ga0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VeS7L7R1sRrm11GHlfcoPcg9+p06aV2m+2BJmGbpTiipeBzO5D2Jk5hVLyqWmprdPzKw18O7ntBuHIm5B1aJyfdx7IIL9O4e63i71le+5VNCfI5QsZqI93IcgdzYLKqV5o0vLZ43X6rNtqVtYRk1nH7SrDt20yM1DpG6kQ4f2/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Pgitkos0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d5S6jNxU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61IB4X0H1624211
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Feb 2026 14:38:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WH1nlO52NiOo/le5purWnObw/9prSk/Tj9AQuM4+OCw=; b=Pgitkos0R+Ukh3CH
	zon02hkMtAfJAK2tDb0BrcWHvlTd0qmrE/GbRo/oOHR7X3VKfTe8OO/6Hmnj6vnT
	ajsm877NO6d7EdrEWU7zPMQ6i5bOxLiTgw7HD33l+zJ0DTTyae6twW+TPKCOKP/i
	N8f60N91m2UIliHdgFmQW7D53a4T9fHXu1dlzPtahuZ3QfoIy1UVjYj8FGKx+kzp
	eLKjJNtP5bXSGUE7BBrKecNQ9WfQlQQxV4m1rLEcUQEc8dTgFptsV008p9uEr7+8
	K97XZAljV6W1vV2A3YeY6LOrw3gIVe3hSCfZaCxzBuRF9oIIwjxHgXarmQXG1ufK
	V8cDRw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cdc7u8g1p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Feb 2026 14:38:32 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c710279d57so403470085a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Feb 2026 06:38:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771425512; x=1772030312; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WH1nlO52NiOo/le5purWnObw/9prSk/Tj9AQuM4+OCw=;
        b=d5S6jNxUMM78caq/QVVkeQ3WxJhvhleJ7o5JjjlsNpv5jeRGeJbhCyGTnfJ+aokzzq
         MeYYqAV4sNQ8JIufjuoXmTMxH4OHzKSdr7oBFofExgke/thCSS/z8sEu935peGR2Iiox
         4uyrZomO5shdep+dB25vVtkhAu2QQVjhP63c+LpmRFJqZItXUleA6viRy9CdAoF2iQW6
         6S+VQNxnYNVDq1awHyFJ0Ocz3EN6y/kK9hcaVBCrAwneZgKZVDwf8QUyY+u5Dwc8zijx
         kfzJaAOmpjodBuBqwfApAhbbz4py7XBLrdYxT5TZGxiQIh+UxGwxi8tcN3WjmO+BNPPr
         ea6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771425512; x=1772030312;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WH1nlO52NiOo/le5purWnObw/9prSk/Tj9AQuM4+OCw=;
        b=GLDpaWP+AKhuvy1KghtQnMsFby1d+bc9LG9aMHet6FK+0s8hNFswQv3gilm39vD2X/
         AvX8PBJ2psiQW9ZaN4hxJUyTBudLgVsL4yZgRfAzhp/ZIGvenSUHh/T3VabLosy4ghyb
         m4k0eDqgiiX1iRjv56wczPWAhAJoGObEFGuSbDJMcEyLVS10xKRWRkIHF2ebyhgBhLyJ
         7YSmlzXVzt/kayTqda00w/pUmG8DhoBjYG8fnZQ2HezW/EyiyMl4UNzdGOLU4MYXATJk
         VKlqyI92vOTquqAF1/4Zq3/aWOTi6puBTTgJtJF02MX8DddHfoxnib0GHPDFfD89HqJv
         P97A==
X-Forwarded-Encrypted: i=1; AJvYcCXlLfs8lPCGIoPFbt18NzunRikbDB5JbKJMhcETw2gYX5e/h27Z+6qgorZupLuvPCJrEBfI7tC/+WBliafg@vger.kernel.org
X-Gm-Message-State: AOJu0YztYWHpJA9sah/SR49+Fmg3A2TYqIxibcnf0904cm9zlWKEFY6V
	tku+XhR0yKHrVwkxHIO/VbLUCHl2TZPIHkzq2q57H/zYthxAvk0aqyJNZru0hXR0idDOZ9Fj08N
	bGVi+GxbAnh06ODdm4jIzvSeKF7hIl/nJ8Z+IRGp75fwjX4QdzvwJ/MF8SzgY+mV2BORl
X-Gm-Gg: AZuq6aKV4GmVyaZkTA4ZqhFoTRGEI5G85QJQUX9Thg2or2ownfwWMSqLkUjIrMXywyr
	fW18rP8LmSNudUxDr58Gg8KuyDcuYgAFdEI5YUSkGPyyKmYjDlJmjzGlYop0eDrueZhEfweYlOJ
	sAJv0menxdmJfUUKrZIB0gxEWIetawMJI6EWGFHUiN+DYBkoVzVaQ4VFuPevid72PYCxZ0BZ6CX
	EwypC6RCMIIhf8hUNpp6hF+IW9hWNcIwzFM8mR5Q6P21wVitG4r0U6W1ADUsS7Mn5g4LqzEUnCh
	LMSYutvbUzQGcGkgq+UA/LqtE8JyfQfp12nZqEiYgNUvb0515qKox/M11c0IAOgF+2xTHdp/n+/
	Ai+KJlwoqcK1gcD4Q+/xzqpo+iC9NKpfz/vwwzhvWCtlR+smF4ZoJc4xtxSl7ztHuF+pTPW0rGO
	QdVIaHb/sxFIZWDw==
X-Received: by 2002:a05:620a:4410:b0:8c0:cec5:148c with SMTP id af79cd13be357-8cb4090644dmr1660825085a.11.1771425511625;
        Wed, 18 Feb 2026 06:38:31 -0800 (PST)
X-Received: by 2002:a05:620a:4410:b0:8c0:cec5:148c with SMTP id af79cd13be357-8cb4090644dmr1660821885a.11.1771425511092;
        Wed, 18 Feb 2026 06:38:31 -0800 (PST)
Received: from [192.168.0.242] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8fc7665345sm459517566b.53.2026.02.18.06.38.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Feb 2026 06:38:30 -0800 (PST)
Message-ID: <81faa130-b497-4248-a6c6-7c421646451a@oss.qualcomm.com>
Date: Wed, 18 Feb 2026 15:38:28 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/4] misc: fastrpc: Add polling mode support for
 fastRPC driver
To: Bjorn Andersson <andersson@kernel.org>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: srini@kernel.org, linux-arm-msm@vger.kernel.org,
        gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de,
        dmitry.baryshkov@oss.qualcomm.com
References: <20260215182136.3995111-1-ekansh.gupta@oss.qualcomm.com>
 <20260215182136.3995111-5-ekansh.gupta@oss.qualcomm.com>
 <wipphezpxtuuxtwhpwamsmvhwgwuesexmy5ev5pcqb65vov5kz@vuzzyyqnu7ci>
 <1707a83d-d717-43b7-b450-90f8400a65fb@oss.qualcomm.com>
 <lkwod3c3mubtcthy63aneumxq77lfik4nywi5oxjhnc3lmdk4s@eaygdb5vwlr3>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <lkwod3c3mubtcthy63aneumxq77lfik4nywi5oxjhnc3lmdk4s@eaygdb5vwlr3>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 7-XW8u4Lnpl2rKVRQhG1hSpcQVgdzz3M
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE4MDEyNCBTYWx0ZWRfX4Ip4MbSrq5oX
 +n+xFR/NU1V7zrf/RZWlO+eT0kS5E9J/EoPnQXD+58HCsa9rfGC3CLS42yVUrri90/t+70n+aBE
 h7MxhPEr0HPZyYrGN11bPpQBL8R/ssPsdyYaa1nl4mAJaNLuCcaNMmqrRtYoPPJmY1/O8p8KaBE
 GqRhB6a23I/3VrI5ySy3YkiZUYhHHm3EGUW439QuEHQVan2+KnE8z99IflE3oYcSdTUmpFXiZTp
 rLMrCTAOe2jsv2U4YAphUUIW3nsMNVBlXaugyqGWmyKSq9+fHK6OB9ikiq5uW/b7/5uIB2w82YI
 b4QXmMINnenl/334wXLUhI4HKhBdoo1R4Pt2aJM//E0P1yG3dOEodFN359PSRAifB3NVYFWCJNO
 hGKQ6lDVVDJz5Cll+b5qLktVohG8GG0SuCPyPd72/YA7DfMvU0+MOKcthtZu9O/eLkVdHET7R7N
 AHssT42l/jNUTYyHDjQ==
X-Proofpoint-GUID: 7-XW8u4Lnpl2rKVRQhG1hSpcQVgdzz3M
X-Authority-Analysis: v=2.4 cv=daCNHHXe c=1 sm=1 tr=0 ts=6995cee8 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=PCWUlEzcUK1kj1-k8vkA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-18_02,2026-02-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 spamscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602180124
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-93293-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 11CE31571A6
X-Rspamd-Action: no action



On 18-Feb-26 15:36, Bjorn Andersson wrote:
> On Mon, Feb 16, 2026 at 02:36:40PM +0530, Ekansh Gupta wrote:
>> On 2/16/2026 8:51 AM, Bjorn Andersson wrote:
>>> On Sun, Feb 15, 2026 at 11:51:35PM +0530, Ekansh Gupta wrote:
>>>> @@ -1812,6 +1912,30 @@ static int fastrpc_get_info_from_kernel(struct fastrpc_ioctl_capability *cap,
>>>>  	return 0;
>>>>  }
>>>>  
>>>> +static int fastrpc_set_option(struct fastrpc_user *fl, char __user *argp)
>>>> +{
>>>> +	struct fastrpc_ioctl_set_option opt = {0};
>>>> +	int i;
>>>> +
>>>> +	if (copy_from_user(&opt, argp, sizeof(opt)))
>>>> +		return -EFAULT;
>>>> +
>>>> +	for (i = 0; i < ARRAY_SIZE(opt.reserved); i++) {
>>>> +		if (opt.reserved[i] != 0)
>>>> +			return -EINVAL;
>>>> +	}
>>>> +
>>>> +	if (opt.req != FASTRPC_POLL_MODE)
>>>> +		return -EINVAL;
>>>> +
>>>> +	if (opt.value)
>>> Would it make sense to allow the caller to affect the poll timeout using
>>> the other 31 bits of this value?
>> I was planning to bring that control[1], but it's might be difficult for the caller
>>
> 
> Skimming through the thread, it seems you're discussing how to determine
> if the DSP supports polling or not; that sounds like a separate problem
> in my view. Not sure if you settled that discussion, but couldn't that
> be handled through FASTRPC_IOCTL_GET_DSP_INFO?
> 
> I assume though, this would be subject to firmware changes. How do you
> determine downstream if polling should be used or not today?
> 
> 
> For my specific question here, I'm merely wondering if the timeout value
> should be a boolean or have a unit. We could punt on that question, to
> not block this feature from making progress upstream, by defining that
> only 0 and 1 are valid values today (all other result in -EINVAL).
> 
> This would leave the door open for having 0 == off, 1 == default, > 1

Giving '1' a special non-numerical meaning sounds odd.. maybe 0:default,
-1:off (or the opposite)?

Konrad

