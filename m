Return-Path: <linux-arm-msm+bounces-90200-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6JA9Jp8icmmPdQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90200-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 14:14:07 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0765D67231
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 14:14:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 316708A8D5B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 12:34:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 272B334E765;
	Thu, 22 Jan 2026 12:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LZdHrDWQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D9rSdzlE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8168632861C
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 12:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769085284; cv=none; b=Vgqb6wflV1dOF0AEDO5J5cLr7EUoRzf4HqmhaN7ocWxnTjKSnfjkmkKooq3BaSHsIek+fE7u6TDBeMJQNkINGlxh/ruuWptheNYab+zrvbn6EkVGpySB5zwNEkEj3/fk3pqFRpdZCFpFyRtXDuEqddUWUdnX5B6L8hxsa/S85hE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769085284; c=relaxed/simple;
	bh=zKZG6fn54Avf54lf7flmb7ZKSwbFMIeVamSom6YaUA0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ciR/WlEHVyfX1QMwHVHg38smWr+QjPcMIOywGKPwDcTD6nSt3wwk2NBqZkZzgR7ZXHrRuI2VFCfl9Kx4kCNKzmaQZXhy+XGMSckN8bOrL3fwxG/ag8Ua1MMZ1E1q/K1pXR5OxIwW99QPSPipYhkiaCJuiVb0kUU7zbsV7cSTgIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LZdHrDWQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D9rSdzlE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60M8ShPJ3463165
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 12:34:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OQ9Hp0YXE7x+HtzPq+22mdatg3BzC8x6q18ktloaVtA=; b=LZdHrDWQizJ4LLzp
	vVK1EXsUnbwYu5JNptjC8GrH7eJw5ac5hf1Rr1zwghL/Xzl5StnxgyZXuTQ1Ov8i
	V9yqEapCqIPtX4KmHMfuv4PevxOrnjXtsoi/VP7ytkkwzz1WuWaNTVeH2skQsfb9
	BjW52hRFr86Us8bb7C5NKJ7oqkF+Tcau00T2NtI2mksLtv61C72Ang1CtLmC/dEP
	f+9mLhkXHTW+Y4Xb9ntJFvPHQqFLJ/AcRFujriKdbha3+5olas6h3iV86W+C7WfJ
	MWyQY14hNwlm1Rs7K/UT82kfCpBxYWfWO1hjqVsZyVz51Bo+jP4H1KGwzLGhOnRP
	LBil0g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bu0653tut-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 12:34:40 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c6de73fab8so12526985a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 04:34:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769085279; x=1769690079; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OQ9Hp0YXE7x+HtzPq+22mdatg3BzC8x6q18ktloaVtA=;
        b=D9rSdzlEbrHK6Epxc/ZtMpt3t6wQw0lxcsn3wP546/L+Yo21mvBWJ03B4eSlUQA0TO
         UjtqlEZ1FNcZsQtgbWX3XW9gtrd2qhrMvOjA8DXOLPTTJcexQVuauOM2TP2Oc9QU9lEF
         5VQGeh9mBIaff4m5pRoeryuwEcq3vxOmkA67KKf+v7skS73B5zi8pH97wHMrEEJyC3Zy
         7VtDq8NliVkYUlwlYi5xZnB/AxWXYQ9bWoEJIq2Dr81x0FBU4MT59FIInArk613G+3+d
         EtBkvWPIxeO+C3YxcAfCibBgnDihplaFpdTr81EpaeV03jZ4M1yTIR2WSdZAHQWEuUxm
         ldhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769085279; x=1769690079;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OQ9Hp0YXE7x+HtzPq+22mdatg3BzC8x6q18ktloaVtA=;
        b=lIpA0STnrgcCJJdK9YWIr/S4QZbm0HJ1MxxtSNx3qBPov9j6Oizt++BpIA+tbgZOUQ
         EIlFlBVwvPQs396Ud2NWpW5j7/iAZJIsyUHlCBlk5S2ftDhXrAjDaucWqpVd2PmvX2H9
         C26Gepxq1Q3BlWtpKSxPZBVnm/kuNRb1ko0O42Jdi+ahX/D6nCV0+PjFj3LF0WNVvCkM
         i0tfWrZWhqqREZU2UY29P9rVGw8BMREzhjlUZvlX0SDcYfOy9zNgPO9foRGgolnxwLh4
         QAXmiO/DySQ/OExxrtWs3gWBquK4FG142hl7Z8sjq/HRVE5dVYjwgb/xheOvjy7KW+cb
         OYWQ==
X-Forwarded-Encrypted: i=1; AJvYcCW5zGVDzMBMsi98xcgTDzO4Sx93YyXaVAf3iiHK8qA9azdP7BIyEsQDGTGIwKyXubbkSKAN78BG0SqIruop@vger.kernel.org
X-Gm-Message-State: AOJu0YyK7q+eFJt5cehAuIuuqn/sZA9u9N5+dZEBudWvZY6jIT2j+OUE
	R6GpggoT/IRaGmPGUjgQ3AZc5YyZ44i1Zwpj9OQO+xuTPUOksYWDsU65c0awenQQg7dSd7a8m+t
	4XK0qyS35439MptNie3NXRZYMd+JBYy6EDrKy5qmjNBFlGJH1DCMy8gjMoOdtKJCuYbzh
X-Gm-Gg: AZuq6aIuW2opJDe1eDTiEUK+2EPzJnZ6Ad5Rrq3wUHui6neIQ9xaLkw6E7NVBdvJhA3
	jA7CQQCvg6yp9Rkz86aItuQpk/w6U1kfTT1eKh0CLaqkUM+rZdYXlEpARWoNkBNkWl8jio4rNCj
	d5Bb/nzXP3VNjwQai835gbZa5QiWxYe0j+arLuTKifR5rI6SrFQFQTiZqhWEP58G8DNWdm7Tyl9
	26a4t4Y8O2KHL3IOTE7QS/iL05VyDY8xVOBiMxwKsGqFuTHInM2DL5+mvpXukRGF0bsEJvux44u
	ZVbtwnlRWW6CFRNLcdorIVvuJt7Ph59nG6++eDcaPvg84OyxHtqvBpHRJ+UP1YL6Z0H3L4aa1y1
	orvAfwZHGGd7W23KCNEaaFTBiNFF5MgoBlNtD/rlCqHIgGNkM6mpsyBnDh4a6v+FxBrs=
X-Received: by 2002:a05:620a:4492:b0:8be:6733:92b1 with SMTP id af79cd13be357-8c6a6606fcamr2126205785a.0.1769085279334;
        Thu, 22 Jan 2026 04:34:39 -0800 (PST)
X-Received: by 2002:a05:620a:4492:b0:8be:6733:92b1 with SMTP id af79cd13be357-8c6a6606fcamr2126202585a.0.1769085278826;
        Thu, 22 Jan 2026 04:34:38 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8795a2f1aesm1725477066b.61.2026.01.22.04.34.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Jan 2026 04:34:38 -0800 (PST)
Message-ID: <687b781c-dee6-4b8e-89b2-e082a860be3a@oss.qualcomm.com>
Date: Thu, 22 Jan 2026 13:34:35 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: add basic devicetree for Ayaneo
 Pocket S2 gaming console
To: Kancy Joe <kancy2333@outlook.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20260121-topic-sm8650-ayaneo-pocket-s2-base-v1-0-bb3f95f1c085@linaro.org>
 <20260121-topic-sm8650-ayaneo-pocket-s2-base-v1-3-bb3f95f1c085@linaro.org>
 <01de9fc2-f60c-4bc0-af61-c070213df29b@oss.qualcomm.com>
 <53a1370b-89a4-4276-949a-e3ad95dbad2c@linaro.org>
 <SEZPR04MB6873411EA1A8B69AD45B286CA397A@SEZPR04MB6873.apcprd04.prod.outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <SEZPR04MB6873411EA1A8B69AD45B286CA397A@SEZPR04MB6873.apcprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=HOHO14tv c=1 sm=1 tr=0 ts=69721960 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=UqCG9HQmAAAA:8 a=KKAkSRfTAAAA:8
 a=xRqI7NLVZAYiWIq_3gYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: _wnzp1UjoARFInq1O4JJIOZU4xZfZXBt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIyMDA5MSBTYWx0ZWRfX7TG59kT6PlDs
 miszLZo6H25Y1nlWGteZbnk1t3LGng6DFvY9Jt6tmtnQV7qtGFSq6d8u38esoIBMdQb81hQRr3x
 OytJhNDhprxq2zerQd3G7EqE/Pop8FLAxphpO9ZE/z+MjQ8TZV4ix0KfOmPMNUB3wcAtRivO6QH
 bz5bBxVuuF6USGGeQ4z7G5WR0ENlAEHOlYY3cln4AUxImwGwiai8XIGh/U3qXf9zgrbVrKAwaDa
 b1u9fLjFv/PmtfNj/BABHXf1e2HRXi0zeyFiY/9hx3U6vDF4/YeUuBfolWl6y1TCBS5GbxOTkrN
 Ukv1g88vw1tlvhF+NlYNpa3QZesmtZVyxpJB9GDQOq38whl26vWOYUvfCAbaHUCdBXatXrUTluz
 LrHrRZwCtg+tDWALhquPDaqqz3GIq+wB22Th0/9XNBs/f5ZIbcl77ZcUjk57zvfMnXmjNY+3Ic1
 f2k0ufb4hV9cmJyVk1g==
X-Proofpoint-GUID: _wnzp1UjoARFInq1O4JJIOZU4xZfZXBt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-22_01,2026-01-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 impostorscore=0 malwarescore=0
 spamscore=0 bulkscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601220091
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.46 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	TAGGED_FROM(0.00)[bounces-90200-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[outlook.com,linaro.org,kernel.org,oss.qualcomm.com,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,dfw.mirrors.kernel.org:helo,dfw.mirrors.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,linaro.org:email,outlook.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0765D67231
X-Rspamd-Action: no action

On 1/22/26 10:34 AM, Kancy Joe wrote:
> 
> On 1/22/2026 5:25 PM, Neil Armstrong wrote:
>> On 1/22/26 10:15, Konrad Dybcio wrote:
>>> On 1/21/26 5:40 PM, Neil Armstrong wrote:
>>>> From: KancyJoe <kancy2333@outlook.com>
>>>>
>>>> Add initial Device Tree for the Ayaneo Pocket S2 gaming console based
>>>> on the Qualcomm Snapdragon 8 Gen 3 platform.
>>>>
>>>> The design is similar to a phone wihout the modem, the game control
>>>> is handled via a standalone controller connected to a PCIe USB
>>>> controller.
>>>>
>>>> Display support will be added in a second time.
>>>>
>>>> Signed-off-by: KancyJoe <kancy2333@outlook.com>
>>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>>> ---

[...]

>>>> +        pinctrl-names = "default",
>>>> +                "sleep";
>>>> +
>>>> +        pwms = <&pm8550_pwm 3 50000>;
>>>> +
>>>> +        #cooling-cells = <2>;
>>>> +        cooling-levels = <0 16 32 45 60 80 105 130 155 180 205 230 255>;
>>>
>>> Does this come from a preexisting map?
>>
>> Kancy ?
> 
> No it is not a preexisting map. I add it(and the thermal part) myself to get dynamic fan speed control work. Perhaps you can also use userspace fan control daemon instead of hardcode it here. In android the vendor control the fan speed in userspace too.
> 
> Following block is what the stock fw defined. I changed the granularity to make fan speed (or noise actually) sounds more "smooth".
> 
> ```
> 
> cooling-levels = <0 64 128 255>;
> 
> ```

FWIW the corresponding pwm-backlight driver has this
num-interpolated-steps property which computes a smooth map.. not sure how
many cooling levels are resonable for a PWM fan, but then I would intuitively
not object to having more as opposed to less..

Konrad

