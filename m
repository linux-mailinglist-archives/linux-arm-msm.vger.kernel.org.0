Return-Path: <linux-arm-msm+bounces-92739-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cAhwDS+/jmmzEQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92739-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 07:05:35 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D6EAD13327C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 07:05:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E009A3053B32
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 06:04:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 187BC21D3F3;
	Fri, 13 Feb 2026 06:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Rwdjd1p+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C/ku7Ptx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDD0E275870
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 06:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770962671; cv=none; b=G2YfsrgXLyLOKDZHvWXtKoM1YRwp6rux99S+DbQTgPojugHsYHCESw79HRKHMG0mpL1GQTDLzHm8Ce8Jx02jox9JYU/cdgT5Y5iX8v+5i3PZa0f8RlItT0E+dXrH8mmSfBxE1dm485PlXEkHPzGPvXfnR52T6wneDuJt0yS7gXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770962671; c=relaxed/simple;
	bh=rjn4uS5Q5xBLLj0PgsfNVNXngHTCJ/gdwngN/hdD2AA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oJoIXkzrbRZvr7p4+JtRu3exhvUMQ9tA9baBWR/LE8WxHiDBMOB4XCY5iDLdXfrC27KwQh9pzL2VONDU+3T/pbogO2EAntd6tgLSvgJEuKn9m6FCkPqnXNbHylsh1Kx9wWjZLEeqpy+om1JyQVfmcZt04RdaVO/4/1ZHJEkYBUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Rwdjd1p+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C/ku7Ptx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61D0BpV42733800
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 06:04:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SAtm3wjHBikGFT8In9EnBOV9rR/eOV8HdTMdzwZje7c=; b=Rwdjd1p++KEUqmdE
	9BsmosOhb2OCK9uG/Edqz3QdIF7+HZ+8gaR4wMO0qdQg0MZvyHapQesCRaL2RJTs
	ir40YSJUBZZuXrN9fSgnRXnaq12oa8lk1+nPINnwqxXwCG0yT9misi2ZquohRDgb
	hUB5FUypJNLfnRcFpBJrP7Au8TEM0G9LHhV35A1de394eOsYe6k4rp8PMWbGs76N
	so4BJP21Q0B2IZSbipF20BaHOT7NSAyi2qZez+GDehY3uYfjJJK16JltQ9Q02pgp
	a/74AfwBvXvIvISvaeYghBwQZ5rt7EbJ+orBavYpovM3dwbWNEPgqiN8sf+2tqx5
	8g6DZQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c9s6wryw9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 06:04:27 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2a79164b686so7832265ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 22:04:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770962666; x=1771567466; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SAtm3wjHBikGFT8In9EnBOV9rR/eOV8HdTMdzwZje7c=;
        b=C/ku7PtxIiAt779I1bmk21ZVYAQ9xxLrZVYWlLk7tNRmyCcek6TlUwjHi2TbLL9FMS
         mT3MMGNvWRSaahGKl2X6V/5WnPJhwvf74hZOfEqB/faA4WD548q1iZ4bcrglG1s3qXdU
         ZwmyOTa01AhZr7LqCNTDfr95sz7pe4jdcg1fozmu/uT0XyQee7coR9a5yPbxgXaX7bjI
         /DyCwNuxIBAc5sxyWhu+hhs84+95tzDLpIrNeztw21iWYeHIYdzBwS1fa5tltA8ykINF
         NBqaKy5TnKO+UJW5/rURUxuPBsExPk49L5a6xTmzVnbtMS+xIM83N3V7PyR/kb/nNsW0
         99DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770962666; x=1771567466;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SAtm3wjHBikGFT8In9EnBOV9rR/eOV8HdTMdzwZje7c=;
        b=QemodjDOkr3Rg9G53O58S2Fi9Kt5p3iIVn99ybPNPcbtvYlMjruWICHJg+SlGZrL6R
         Bfg8z6svdHf6q+spwD25Pix2eEK3v+QKoWw6NiLnNeIulB42CrRP07BFfyaMjblwkEor
         y/O27jLSDwk+E/JEM1vZpL6Krdi2ujrBongEa2FuOulmiYVfRte3CpZc+g/v39TlCL9E
         xGUlizWfxE2H6l5BUn3O4sSz9gs+BdVXA+9EOzXaR4br7PY8O2OzD8F1gStRIaiXh9ef
         hGR2pdFnPETIoeDNRNwf90EtDgjuXVa1d4MCmyYjQSaHpSBQfC0folArporYEU5Ye/1N
         Ef2g==
X-Forwarded-Encrypted: i=1; AJvYcCVtK4M0c31LquFXSDmJdFbSttqXrqwLEvzfoECUaUAtSw4gkjkMclIoVYE90zdDq8+uRQlQoKxlSmxhvJh4@vger.kernel.org
X-Gm-Message-State: AOJu0YyLQpedbW7gwrBeeqZJUoDWzxGt8Z2HueBogXx9t5HkamGRluWz
	ymMvNWr/CMgQDMUfPYTsxj5ypvVTH1rMcrsYu6MNvnjWpPwPpI3+Ib3isLblgJDuCd/s57BDZwO
	ePVYnu+D4mpVEEpkjF9wJJZYaRcjejGDfeRAupNDhYuRDsHPHN5Do5ZxHRobZAEmLiWi1
X-Gm-Gg: AZuq6aK/j60JS7nhpurF71FJ9nKCH8VjtbPi3IaGocWKS5Fw0xZtIJrMDVYS1ogKk+2
	QQmfNTyBzrqyZE3yyhvpLlaCnuIfSBSpbST/dWItTy5fiBERO4dgBHI6m4oQL1ZByRbSwE5zO3g
	E3mCOdBz6YBoxeXzwYm4Q/dwT1kDptznKrYnZQ+mGUX9nhLjTgm7BsmO5SqJd0+bRwCc4eKwutS
	jOVCBdwt03nMf6LI4SkP5PJI6etuaJSL92kW9QQ1EO5hNZOyPdt1fCh+L2mapk7cynA78q+TxUg
	5CkcmhL+2N0FcbAranPX2OfNXvRbsjmHLha0kVQimRXjyyhy/68QKsTZ7JvwB4f1e88m0pi1YGX
	vNMrxYtQ2GNOeaB8XcHtY6C4hXobTkui25yBKaELNJf53t7jQgpJewNOk8g==
X-Received: by 2002:a17:902:c947:b0:29e:bf76:2d91 with SMTP id d9443c01a7336-2ab505a365cmr7959585ad.42.1770962666511;
        Thu, 12 Feb 2026 22:04:26 -0800 (PST)
X-Received: by 2002:a17:902:c947:b0:29e:bf76:2d91 with SMTP id d9443c01a7336-2ab505a365cmr7959215ad.42.1770962665954;
        Thu, 12 Feb 2026 22:04:25 -0800 (PST)
Received: from [10.217.198.130] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ab29998eeasm73094635ad.87.2026.02.12.22.04.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Feb 2026 22:04:25 -0800 (PST)
Message-ID: <15fe2128-5a88-4140-8aba-0e8d73350df9@oss.qualcomm.com>
Date: Fri, 13 Feb 2026 11:34:20 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: hwmon: Add qcom,bcl-hwmon yaml bindings
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, amit.kucheria@oss.qualcomm.com,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Cc: linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260206-qcom-bcl-hwmon-v1-0-7b426f0b77a1@oss.qualcomm.com>
 <20260206-qcom-bcl-hwmon-v1-1-7b426f0b77a1@oss.qualcomm.com>
 <ae2802d8-2eb4-4dcf-8212-d8f2a41a7185@oss.qualcomm.com>
Content-Language: en-US
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
In-Reply-To: <ae2802d8-2eb4-4dcf-8212-d8f2a41a7185@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: bPy-HIHoFBK6o0L_L46Y01IM3fSBCYDt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEzMDA0MyBTYWx0ZWRfX/wtyfUROWc+l
 xmHSBattfaeX6WJFzf0ilk2snqFkOVI9S4cSIQ2Lrb/e6EUSiLnYMTmnbbYHQObLXch/d0LZqoU
 MMDrmz3CgUf5abECyQA5tRHg7+A0IN15L+t2dqbjuQqdjfRK3+LqmNcyBV1piq/E3cpuRodx2BA
 yNDmH37/u2psboWLZ8t/9SWwW4Zxk5uiE3OkkwE4oH8w0XAh5h+4odKbN01rGwOxi0qG2rbPYYW
 inKbHFKbAsNqYRV0HAyyNoRmnumrzXxDJy+2P6plegYqVwZnFARlIK7rYAmNeRvn8feYeGdBGGw
 xWOffwm4mXAKCKU91FVs6+SakQoSD/dfLvun7Nz6eSOKIQO3Ia/k5h6/seMglBBJYjDGgDf5pXk
 jI3HKni+bl0A/iKq0Pe2cTky+sPwQ0cnUpikEOCV4Qg3ptGTVkZd3Us4NxlRaCVgcKAOH43DQoo
 J3ay1Q4+PKrhiqP5huw==
X-Proofpoint-GUID: bPy-HIHoFBK6o0L_L46Y01IM3fSBCYDt
X-Authority-Analysis: v=2.4 cv=CLInnBrD c=1 sm=1 tr=0 ts=698ebeeb cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=w_4w4FFK3glb3pLQdE8A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-12_05,2026-02-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 malwarescore=0 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602130043
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92739-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[manaf.pallikunhi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D6EAD13327C
X-Rspamd-Action: no action

Hi Konrad,

On 2/6/2026 2:38 PM, Konrad Dybcio wrote:
> On 2/5/26 10:14 PM, Manaf Meethalavalappu Pallikunhi wrote:
>> Add devicetree binding documentation for Qualcomm PMIC Battery Current
>> Limiting (BCL) hardware monitor. The BCL hardware provides monitoring
>> and alarm functionality for battery overcurrent and battery/system
>> under voltage conditions.
>>
>> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
>> ---
> [...]
>
>> +properties:
>> +  compatible:
>> +    oneOf:
>> +      - description: v1 based BCL
>> +        items:
>> +          - enum:
>> +              - qcom,pm7250b-bcl
>> +              - qcom,pm8250b-bcl
>> +          - const: qcom,bcl-v1
> I see that e.g. PMI8998 has a BCL block, would that also be 'v1',
> or something else?

I added support for pmic 5 bcl design from v1 to v4 in this series. 
PMI8998 is older pmic design(pmic 4). As of now, we don't have any 
requirement to enable it

Thanks,

Manaf

>
> Konrad

