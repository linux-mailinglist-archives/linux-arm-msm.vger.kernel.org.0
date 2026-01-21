Return-Path: <linux-arm-msm+bounces-89993-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4NEpBn26cGnwZQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-89993-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 12:37:33 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A84E561A9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 12:37:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 430CD962969
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 11:07:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB10D43CEF7;
	Wed, 21 Jan 2026 11:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H7Tm8dLc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dfJbhW+E"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43EA5421EFC
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 11:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768993541; cv=none; b=DXa63V2EtRO/EzS4nyk3w36HSTJefNIIJahjZCrg7LbdmW6JD5QJMxLG3KOW8r5/jE1lGQ3A4ynh8Tae7wYQvQrUK77yCkjyytf608qYyuMBGKt9tg1YVt5NevI8jTD8+nMIYb/ciV6fJFioq1vZWAInaxSch0NCyQ4D9uks/14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768993541; c=relaxed/simple;
	bh=N2pGDS/a9wFApEvBD5D6DlUyIUa4xe6Ed7BTBkbfaHo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KDBrjD4A6PvXlNZwye8MVG5BDnH50kw1EzyykoHTILbAjvy6bu39iAiVzQY1UOt7q9hMcN7V0RMitnGfpdwMVfF8nL+OwuWKgV8jg90T/TSOzw52PW1aK7+j927AgR9lDcvWZCEJAS6kYrgiGevhG7lVY8fbvhI3h3nZdhc7jFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H7Tm8dLc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dfJbhW+E; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60L8vCp22946216
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 11:05:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ld8GqU3D2r4/C65SErwrhAuPQ5LtbJ6Mpvp8+G50/No=; b=H7Tm8dLcmPfjMxW6
	s3McJIPA45uK5tmZSifE5nlsTOaNRNo+I+4maAkSVbs6z8376WLopnu09rnjEyq5
	8nDAvhrcEPl1u4r8xzmg1UcFlNdCEp2HZWWi8+pbdFAqX0oiMYRJGbdbR34GJ/Ed
	tfR6eF4fWIaNeEPQFo0iSadjhWTgqNy6SsGQmYUv4Ye55ODpjrwP7Fy5T4J4oFhk
	ZDe2tQEPmDz/2GsfHJtwL9N5Tho5aJk34esjqOkBaB+nooOmC5AbOtI+R+wN9BLH
	zntwzYU1KVKHx20Ocjt3lytZEAewoq6N0MTctcmZ8/xVFHoDzKlAEq/X8FgjdJxt
	Z26EsQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4btur98n1m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 11:05:39 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c6d6b0f193so8691385a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 03:05:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768993538; x=1769598338; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ld8GqU3D2r4/C65SErwrhAuPQ5LtbJ6Mpvp8+G50/No=;
        b=dfJbhW+E+qVXdqMvFtmbPTYoXyTz5YZcZlTYqM9weDMK8lf3QDM+B3GKT+NssjBWn0
         JuBTX/pqeWAW8YUQWYZ6ihrWVYhym8BwDnNezEF0m+7BxvPBblvyMCoQBQcadfdey8AA
         QVOqFMj6hOWAhlh/B/ketuSTa86L6Lpf5SDgLXdKNQoDo5xX69T1Wl3GfeJtAvQRSqu8
         4uU8xs2ATzV0EsL9zWpoLkysoENWhcqzT+eKDLegPqakmetoWk0Gx3M5sxFP0OhDK3yY
         tNqQx2Y+WglaC4nVaQKG5RYmijfkGnHwAgjtsjze+WVkHBAEW5i/O6AuoJ16CcM1zs/D
         JRIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768993538; x=1769598338;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ld8GqU3D2r4/C65SErwrhAuPQ5LtbJ6Mpvp8+G50/No=;
        b=ignfZ7GZv5A2WppriWo8Uq09xjHYS0AYksb4DzSDsXs29n2v63kgAUpl3TQ8LCdJMa
         5UwYndE44sVCu5Ewr58HDCoYYQSH8ufpy/jGsewd57s8aXxGHn7y5twbt3z6doVAb/aT
         GNAt8/J3rmYOnkC6XT6YacQfCYYQ35aGh2sKAjXHhTgnA92EoEtAbwFNL2TRD4JcVen1
         5pxcgj0QBqsHh8JW5JETHcJm/am1Bb0/IBw1pJXE/WHo7amPrErxLpAT/6GkfvHXcffz
         X8JmAjrbsiQ42NIyov0N6Ss5m7nsT5w+Qt6i7eNtDkizzRx3Xub3fRiG+O1BbLZQjLkX
         TRUA==
X-Forwarded-Encrypted: i=1; AJvYcCVzSPEEOoKHKsNBRldcwgIxE8D4a/qvI2if1ugy7/ETBriruX2f2y3lGZLOWFthkSh2CLBcw9mrZGj5A69Z@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1+T0LVZB+eEYbZV3wNyI47clwSR2K/69BtsiuczE0kOBXGqYX
	dPKE3AMAddPMlSz1owVP4Rw1pmi7e8le0zmmqkq4mi1M8UxhrCXVKBlpWDwMmFwqk9FcYg/KI5V
	WzevlGsQJP1lO22QJ4mqCdZGzOpTQNF6KFTT7ZdNBnwdB9aKp3PsBS7MiNMMjhB9+xjl5
X-Gm-Gg: AZuq6aLLCLF3O5BMM/7A64Ja151Oyg6931JKTa3UaXlY2Pmgox04SIhKRg/qj08bN4X
	zw2168veKMme2c/xhlFsOpvYXROoINUF4GNU0ri6HrQCO/5+sotoGXp4jTewNW5IXYyp37HzemL
	bGzUk2A75Slg4tUFa5RlZCWeHLXYdZF5C21Am6VIQceqszSkA9IS/TrBn/MAGEHpfaprNAi9Ekw
	aq9svncTB6c8wPSUCO+f34ZK54DT9fAQJxAfCh82ouvV5dmgJBzHcLbifGcuKnYdhYC02lsKJuy
	Ra7yc9PhYjL+DQTWzA9BE3mInDzVGfoVnaoBeXxGFjYim8x9xEp8iF5F9kJ5SR8aw/vobUU58DW
	cNg5w31ch1wK+TW9CUMgB7gvLJk/MupI6CY8bd5MCU9KMYRTG9Gt9xS97A4vIH+kiTkc=
X-Received: by 2002:a05:620a:19a9:b0:8c5:340b:415f with SMTP id af79cd13be357-8c6a67054f0mr1785396785a.4.1768993538453;
        Wed, 21 Jan 2026 03:05:38 -0800 (PST)
X-Received: by 2002:a05:620a:19a9:b0:8c5:340b:415f with SMTP id af79cd13be357-8c6a67054f0mr1785394285a.4.1768993537980;
        Wed, 21 Jan 2026 03:05:37 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b87959c9fbbsm1588611566b.38.2026.01.21.03.05.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Jan 2026 03:05:37 -0800 (PST)
Message-ID: <6251ac32-a3ec-460a-bf0b-23d6f356b93c@oss.qualcomm.com>
Date: Wed, 21 Jan 2026 12:05:35 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: pinctrl: document the Eliza Top Level
 Mode Multiplexer
To: Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260120-eliza-pinctrl-v1-0-b31c3f85a5d5@oss.qualcomm.com>
 <20260120-eliza-pinctrl-v1-1-b31c3f85a5d5@oss.qualcomm.com>
 <kb3eolcpmz7yqme6menjdjmypap7cadkqdnrgc3wxiwjmslmf2@lbwum5kox5ls>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <kb3eolcpmz7yqme6menjdjmypap7cadkqdnrgc3wxiwjmslmf2@lbwum5kox5ls>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: F7c4-sLGiOsrH_VL53JNlqd7VjIJEgjT
X-Proofpoint-ORIG-GUID: F7c4-sLGiOsrH_VL53JNlqd7VjIJEgjT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIxMDA5MiBTYWx0ZWRfXw2az0xAIvVGF
 yJ0NLAoGrWQs1Ute6jo/22EU0P7/Ci8XMsUqKn+7jQtFi98GoT81YMp2RzqavaXViW81UwGGUiC
 oPCmXrCLhZEgWIFZ1VuW1QQicXb0zMma+yerBh8haikadxExmev14M+f11OH4LruJgQTiOsLUA/
 yd8dxwHvmrU2FWs6pqqkjK++nP0evEY0u18FQ8OZtW02aFyweVEDWmAOnjtN5bJCt0fTz9RYODA
 /68nn+HJnro3k+f9uM0YIlW4wEP2JX1AehInTgd98jAgoMZ0Qmaq7Ncbag/aoTUjQPm2r0xXBfx
 fwAsb+uYDmtQ95YZL2qXKCYvv9lM7Q2jhG3npT9ozGdAxdi8uJkDLFPWphxuWiKT9982FVrfAtG
 VTTPoy9W3nMGzO7TPvfm9dwNYiaB1mBAizq1dtkl3pSKsx6SjsjWwrrnJozyweUoMsn0lj+nPOW
 vfNQZw9KP/52647lr6A==
X-Authority-Analysis: v=2.4 cv=QstTHFyd c=1 sm=1 tr=0 ts=6970b303 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=nxOKBEek44l0jo_vI_YA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_01,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 priorityscore=1501 bulkscore=0 clxscore=1015
 adultscore=0 impostorscore=0 phishscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601210092
X-Spamd-Result: default: False [-1.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-89993-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8A84E561A9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 1/21/26 12:40 AM, Bjorn Andersson wrote:
> On Tue, Jan 20, 2026 at 11:56:40AM +0200, Abel Vesa wrote:
>> Document the Top Level Mode Multiplexer on the Eliza Platform.
>>
>> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
>> ---

[...]

>> +        gpio-ranges = <&tlmm 0 0 184>;
> 
> I think this should be 186.

I concur

Konrad

