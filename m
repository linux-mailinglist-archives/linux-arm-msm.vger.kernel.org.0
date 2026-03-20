Return-Path: <linux-arm-msm+bounces-98956-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OGJHMotyvWmt9wIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98956-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 17:15:07 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 419762DD26D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 17:15:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5369930B62EF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 16:09:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69DC73B3882;
	Fri, 20 Mar 2026 16:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ga8pZdjv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I+96vdDo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E53503BB9E9
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 16:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774022942; cv=none; b=F9lD5/GbRaeVrLsyUJax5t9FM/10Ah7Qb3VFjoNO6Cm1mlkn8UdZUoFmQd7Q810gc1LpCgcYWPvjlfAq6MQNuK0PQ4Kq86/+Vs3p4MWitCdNWD1meblm1+UGvSlrszun2GBkLgo7eV9r9WMdYaqPjP00XVNxLYj+YyqzrgbzzeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774022942; c=relaxed/simple;
	bh=3MyUBD78giZRFdZI5eY5P4Afct6NIXZljsU8gNgUXRw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=My9lwcql77zrObunBYFsPE9j6JH7lqW+NCUtQUbQRRZ894KkKXhSLvRS2JNEh+CK22EJEVv+dxtT2UeMYJiEzWlThGXgqVcktPBZlIKIyJYhvM4ln4eMR0foOgHODmNCaUxpw9146kuh/iUIXr5Z+Vca8mt6DDAzC9uOzeSLvNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ga8pZdjv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I+96vdDo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62KG2IL31894058
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 16:09:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fV71a7gjTb6A4TU9Ni1s4ntEZ1N5ACGLkGmyO0wTkU0=; b=ga8pZdjvJAhqzGoQ
	D3AUx27dqm4V0TZaQOLNm2Eojb4G84wCiSwU39No3Ic4mO0d8qwig4sp+n4lT19d
	UW46aevQJXoH+QBO531Sb3x53B8czFFa88YJot8gtjnYG+X2vfD1CKKx20DNhPHA
	Yvtg4bEUcfYPSlVygE2Umy6zbUcRnrlhfXLb9UYwhXalf07pyy24RTlxvjPCi9zt
	DmV8jkzY7mCF9l34SdhIcFEQlVRktikKSwp9MzxvkijVOanfi9VD3oF0Sq/eXxZI
	hpzWeIoX0vzfM/fBlpFMlw5OWgz6wZ3lqF3yPc7KRv7OIKGsQChEIJ3Wgv9xzCXz
	hjdGVQ==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d0s5d2hwy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 16:08:59 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-94ea6fdbd28so5903370241.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 09:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774022939; x=1774627739; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fV71a7gjTb6A4TU9Ni1s4ntEZ1N5ACGLkGmyO0wTkU0=;
        b=I+96vdDoS66snIAanPk4015Dn9NvHJJbOiNaqtVVuEYz32oVJ7OV3VyCE+dFbjC1Fa
         gBhrhYYaAwgfiAAyHqFQd1sAluplsr3GvXxtDgjipg3n4QxCx25fgkyUg4w1x4EqfgWt
         E2uePYW9spKMcTBOzKKpN41z4v5PS8g1MzWUFVZb4VQhGtV+nVGaRaTje9XNA5p6d5wB
         0itau2E7jSOFpivuWUNP29JBrtkq8YihgzFB6z3isnvRUGem9X7ckKzLuwMP7eLtuM3K
         ybm6mTmWnRDUtkoQ8ZNwAWs0+ozDoO1jglhV5buTQp8qOBRPwVLRbooYj5Nv3HERuK5r
         VKFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774022939; x=1774627739;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fV71a7gjTb6A4TU9Ni1s4ntEZ1N5ACGLkGmyO0wTkU0=;
        b=Vm8kB6+6gJJFhp91iw8yGIhLdt/BaFAS8FDhMx71oOmhJKdGnxGWwajpmOBnloyMd+
         2vUBESIELaLx9tONiSH404WSYcBUqNkqbDxGD6Q33wlTPM5Jw9Ewa1bA+Zj755k8Psnf
         oFPw/eRy80ynBEdbpUv6B5xB1RNUXdZvRDFiqkdMLDYV22+Kmjp33tIN8p8RW9aepWiH
         WVLtSlQJa4R4lazF/7rmn3UFVSL0rD9l8Y/hxKXtnWG9eLPnLnoMnHLlvLb/aro1zs3C
         67rDE64CcrELULiVW4ZWtthjLi1UtzhwSRzbydoZsYVaBAlEjp7sYa8rn1c5YmwcZBNo
         CB5w==
X-Forwarded-Encrypted: i=1; AJvYcCWh9tnM9LG6MAnVSZgcWXCQcbhLR5rPkpyFFoMESDQZUiM+BQ1nu8sam8CPKbA5cMHORfExXqXRtg508Z0p@vger.kernel.org
X-Gm-Message-State: AOJu0YxS2ry43xTRH1iGIAM1D6Ytz765BCQcvssP1d3Ikqas5p0WCeYZ
	/4NhnKxd6Ndjl4S8o2MA9vqMiKpDlqKjFuSurpu/ig85heuyhISk7v9WKdCDgokDE0debn6nYex
	LN2cZjN6RSHlIj/AtylU7JfeeOikTB0qnmj5tOorX3giDB+sGVD3GQZ3WbuYZ1C4OfYY2
X-Gm-Gg: ATEYQzz89tWNfa1mN/WcXVujHIgEZ+kAld8gkLQropf3ensQnX2pu0W4Fi5Vj+8F1Ci
	izesjl5W75vARWHnaJmEzhafGdZHPV2tXHSUjuk6U8qXQRRJeVSPqwY7bq67JfPNNMJ2ge3o98X
	8pjzMgT9p7XpcdahRogtQjHMNO5mw1r7A2OMVpPWNnWf/XAc5XW8uD1iFPXMURMUlRgMWgTTJTK
	v5qlH7nlNUyIfmwD6yoZBxzKPPgDcl0qhz+LZ2dWZsHGfh1kvnTDpTU3gUyhhwsiqp2xhceAd5o
	9YU1rMMiMI5iuKytOMwVDNmn0JnDetdYeniBV26BIS8tsdy7fwrXW7Jf98mYuFvXb8ys4QTFO2P
	QKOK7+8e6CED1Luy4MR+Vuhz8v1bAu3s2k+KcR4gRBFRKqyZ2sgULOOCXUIxK4jdCG+Dv5hUPJu
	HOmBlJVrMB
X-Received: by 2002:a05:6122:4fa2:b0:56c:d5cd:1e7c with SMTP id 71dfb90a1353d-56cde3385d6mr2070360e0c.5.1774022939244;
        Fri, 20 Mar 2026 09:08:59 -0700 (PDT)
X-Received: by 2002:a05:6122:4fa2:b0:56c:d5cd:1e7c with SMTP id 71dfb90a1353d-56cde3385d6mr2070317e0c.5.1774022938851;
        Fri, 20 Mar 2026 09:08:58 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:ae20:597c:99b8:d161? ([2a05:6e02:1041:c10:ae20:597c:99b8:d161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b6471a297sm7991764f8f.37.2026.03.20.09.08.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Mar 2026 09:08:58 -0700 (PDT)
Message-ID: <6f4b27c5-074e-403a-90b8-fe7ef3a993b5@oss.qualcomm.com>
Date: Fri, 20 Mar 2026 17:08:57 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] hwmon: Add Qualcomm PMIC BCL hardware monitor driver
To: Guenter Roeck <linux@roeck-us.net>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, amit.kucheria@oss.qualcomm.com,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260206-qcom-bcl-hwmon-v1-0-7b426f0b77a1@oss.qualcomm.com>
 <20260206-qcom-bcl-hwmon-v1-2-7b426f0b77a1@oss.qualcomm.com>
 <ab1fSWx7pqlSANph@mai.linaro.org>
 <a922cf55-ebe7-4256-b3bb-cc732e45e1ff@roeck-us.net>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <a922cf55-ebe7-4256-b3bb-cc732e45e1ff@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: V23pgC8xX5L44viixBDc9v-lFalCyYji
X-Proofpoint-GUID: V23pgC8xX5L44viixBDc9v-lFalCyYji
X-Authority-Analysis: v=2.4 cv=CqCys34D c=1 sm=1 tr=0 ts=69bd711b cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=mvinU2Bdfd4mQl_lFVsA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIwMDEyOSBTYWx0ZWRfX1gfYgCSl7aAP
 OMaflebrFWiBgCGN9z+tPwh2WcdwF2XddoGocPY4McQ7N4j2f5KgFbfO4aAJDZ1JecWcoGsCeW+
 7Ne6zJqcBELa2XHHloS1zUDZtKZgs4ZnjJvX2cKI3GM44GJ7dEQolX8Ava49Sk3HlJqEkBJTL+x
 bA2pkUKU/elxuJjw/bgs0DJy7/fjghp6oVoFwW9CSMRIHrkTIjuZkAYU2/CtYHR6jB8s5+a1DBE
 aUA3Hpj1n88Y7TafZnsQnc+5x8cL1Nnj7wMw8tnB0KH4UX7/7rAv1QqVmI68FkQpM4NKz9zsXAf
 zZAPbOK2s0PCg1IzKmvn0ijAEIPQXY0CjUCgSNe1K4y8a6JZGxzJ2rg4jvip5drjZH9VdTIfKZv
 dnSObp7R38J3O8LutvQKeCcdTioFwVjyQ9KBk/HbfsNAJNA9SXRFBW7e6EPzEnqlPHzOYAzz2mj
 mGCmcbb+iSmjbgv9+ng==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-20_02,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 phishscore=0 priorityscore=1501 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603200129
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98956-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel.lezcano@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 419762DD26D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


Hi Guenter,

On 3/20/26 16:22, Guenter Roeck wrote:
> On 3/20/26 07:52, Daniel Lezcano wrote:

[ ... ]

>>> +
>>> +ADD_BCL_HWMON_ALARM_MAPS(in, min, lcrit);
>>> +ADD_BCL_HWMON_ALARM_MAPS(curr, max, crit);
>>> +
>>> +/* Interrupt names for each alarm level */
>>> +static const char * const bcl_int_names[ALARM_MAX] = {
>>> +    [LVL0] = "bcl-max-min",
>>> +    [LVL1] = "bcl-critical",
>>> +};
>>
>> IIUC there are three levels of alarms but the hwmon only has max/min
>> and critical. Would it make sense to do adaptative min / max ? So when
> 
> hwmon has lcrit, min, max, and crit alarms for all sensor types, plus
> an additional _cap_alarm for power attributes and _emergency_alarm
> for temperature attributes. There is also a generic _alarm attribute
> for each sensor, which is supposed to be used if the specific alarm
> type is not known.
> 
> What exactly are the three levels of alarms ?

Manaf can give more clarifications, but it is like we have yellow, 
orange and red alarms. So there is an additional alarm comparing to what 
is available in hwmon. The proposed driver maps orange and red alarms, 
respectively to bcl-max and bcl-critical.

I'm just asking if it is important to have this 'yellow' alarm ? And as 
there is a missing alarm to describe it in hwmon, how can we use it ?

