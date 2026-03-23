Return-Path: <linux-arm-msm+bounces-99260-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +Cp2FkA+wWlaRwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99260-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 14:21:04 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A28AC2F2C0E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 14:21:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 838AA3088E89
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 13:12:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD15B39C014;
	Mon, 23 Mar 2026 13:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Eoj+xT9V";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J2tAjTun"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41DCE39C658
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 13:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774271561; cv=none; b=CzY5Nn/ihr9YgqL/Z43EhKm1A+4PPJKGqAEVRHRD+hla6SSSGXcB2bGcQtFb7xKZy3V7FuGLJ+BBvc1iO0vMmmyaXoBAM+pG7C8EXqNjKAZzsm+gqPenmDp+xbD5a+QJG+lu6AgI+D7rWm+sOFMon25HteteKEObcxDtYObOy60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774271561; c=relaxed/simple;
	bh=onDmPmMxM3dk6Kw/wxvgO+Mev/+35UTFA2gPZBOu/lU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UUPc5xdCGu/+d7Vz6JGgRskGp9auTN3xzd9dsjzXZIZsmoaO/KbcQ8gc0r14y5t5/tus2zmPWnN5hqOoMuus+iJeO3/Gm44esCJdLbuX2tmUHubcVxUqCJnwnvw7xhkUJPmMLm6pGCJ/QqHbIUsEM+fvEqtY0As89XzKfVAH1k4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Eoj+xT9V; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J2tAjTun; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NCeiMR2476065
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 13:12:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MK3sQ2NCBQ5xyxGUot5AucAAnbtbEA64+KHUw1d7v+k=; b=Eoj+xT9V78iwKGQv
	POkBsUjewFY+/PhP9nrL11uRZluQY977E9CTuZ+FPjhYJ8znwiRdzIQP4WFMk0Wf
	oq5fCyEtnPdoQyb5TncJIxMGLEhHHQRbLPo+65VO1BXU/TCw45nApJwF6xBjxTq8
	U3aC0TMX/P3OqcRDA3fs6YC0lZ3L0UumAZOr4Ei0E4aSSrTJBUzaKqKdMx/6x2Ip
	F6xogf16kQ5SVsl8gnKsiGTN3Zxrhh/kMxr71k+mt//q2dhhFzqAZYEDboOf+h3j
	PSHWfVMdE1Rb/Fq4cTOd5Ey0tXaWcSMIAa26yLvInW5ExBAt0zjaP8q9VEehtR48
	TeMrjw==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d35r202xf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 13:12:38 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-56cc9a19563so366997e0c.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 06:12:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774271558; x=1774876358; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MK3sQ2NCBQ5xyxGUot5AucAAnbtbEA64+KHUw1d7v+k=;
        b=J2tAjTun0F0+HDtKc9sBsIEoGI7fmLGPHRqK08WJ3u7F+10UN/n8wUs1DdtloQYYO3
         1uEfOU8rH3wuf0KLnYpeimmFh3oYBIFJL+vnqEaV8nx0SXNbCRsUIo9/fDVstdf2M5zh
         24rH1/IoNegbZn7RJ22KF/qPQC9B+LMUdwbPhHPO6H4Ss0de66UsEu9wj4s1XYonHH6M
         vjunCacJmrc+j/If6ln59XEontpvDqtamUYDNAjjYHzfx9+XSBVrToLW8bK28lXlrgsL
         l/lSj4haMmhso6sMM5tETYRbsO3Rd4W4j+QD31TkZEmfQjYOtSk8/TeSRhi/Z0+7WSr5
         7K9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774271558; x=1774876358;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MK3sQ2NCBQ5xyxGUot5AucAAnbtbEA64+KHUw1d7v+k=;
        b=DRoYIee0Y7+WqKaGCdf9ymIm7RTIjjkKkKgWhBmGnF/6vsBJUB2ueFWyeoLAgRRQGY
         MBvRNBqEA81tSZbqeBnJzuq3GxPWUYHSgx3uieE50URq3MrE+uX45vBdGLnv5JNZLw6j
         dBAqjXe+fwK4M/10N/rxUSq06R9Kf16u6ZMDtQV9t8yHTxOMKVSbnAdnmvssCXbnAtlT
         2ot7dLZouSGk7BCB36ibd5LrUpfeLr2dToLLNyBjvysVQiukdwXhSnCXrw+OBLWGM4fp
         tOW1woxvgIicP29bJeHWE4u5GI+CpyBFFlu9WJnsd+AWNgIrAZVPlFdMXU5+hyyjvFJc
         P6KQ==
X-Forwarded-Encrypted: i=1; AJvYcCXScbZPHNRKDO+cBp5Ml9NAE+WzSTNPFl9y4FYWriyoM6pjmxapV6tXP8lgELDo8SaRvlkrlaL5iEi44x1G@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9/4DM9s2676/F75TGpnXCKqv4dSXJI9devElm6iuKcgwQY9A4
	2jZCFV6SR2cWW6lNQ6acrs/uD2lMYtZVQUhaF2AIEhjvJpxmJZmbX3yKG0IIpeKNts7aHfkw48t
	4EhrFyh0cFMtTKEXav6HXePRtcro+AnPnNYcr7deF7RlrojaV//wQ0jqZOu93jS6msIcb
X-Gm-Gg: ATEYQzwR9bwh44FaVmQDoahYHEvPYMAjZPYK8iBVL7Ef9lEiOfFm2olTUKXCvbJR9tY
	OFsajGDOdisaeXmi+7om93nhQzJcrB88BYPpDNgKhpA2OepD8Vn5TPuGXZVew64vXpVfjUgh2cW
	V0uaDYo+UROyqWbaG6KrlJK+sPIdy0fqX4kb++J2Ui2+UO2Mb6ukMz87Oh4rDagNwPhww9AWRWJ
	i9s8sSvxmtMxHaJ/Pmh/tpfR8UOaJQ9z2HPlIcR9F00RSgHmKYJubxxlQn22xEo4jYi0+pjJxpC
	Zg7SsMcA5weIyq/mO1d4HXRLb7+stbgY+QmKr5DN1l+9Yr8ilmjKvk7xpt/lxqRoxLx4zu0N3ZO
	Q+6NFj+vwHEkMxzvpDs2dlozke5I52EzStM9tKdIZ/VivtjFSW9clPlbiqGm7yCLicRUzUKWOAS
	qm+hg=
X-Received: by 2002:a05:6122:362a:b0:56b:6a54:1a24 with SMTP id 71dfb90a1353d-56cde40a346mr2329117e0c.2.1774271558287;
        Mon, 23 Mar 2026 06:12:38 -0700 (PDT)
X-Received: by 2002:a05:6122:362a:b0:56b:6a54:1a24 with SMTP id 71dfb90a1353d-56cde40a346mr2329084e0c.2.1774271557791;
        Mon, 23 Mar 2026 06:12:37 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38bf99821c4sm28863331fa.27.2026.03.23.06.12.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 06:12:36 -0700 (PDT)
Message-ID: <014e354f-aa4f-4e42-a249-6aca2fbeeeb4@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 14:12:33 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sm8750: Enable TSENS and thermal
 zones
To: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        aastha.pandey@oss.qualcomm.com, dipa.mantre@oss.qualcomm.com,
        Manaf Meethalavalappu Pallikunhi <quic_manafm@quicinc.com>
References: <20260313-sm8750_tsens-v1-0-250fcc3794a2@oss.qualcomm.com>
 <20260313-sm8750_tsens-v1-2-250fcc3794a2@oss.qualcomm.com>
 <c4376a88-a490-4b58-bff3-b0f4d2f731b7@oss.qualcomm.com>
 <b7b19386-510e-4892-84db-09a20bca635f@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <b7b19386-510e-4892-84db-09a20bca635f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=VvUuwu2n c=1 sm=1 tr=0 ts=69c13c47 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=zyAxkWfsCcm_7D0aKU0A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=hhpmQAJR8DioWGSBphRh:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: Tto0ASRq6rrZh2XuABsaJuvxcr1HeZVf
X-Proofpoint-ORIG-GUID: Tto0ASRq6rrZh2XuABsaJuvxcr1HeZVf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDEwMSBTYWx0ZWRfX5rpforgY8rBm
 hz9yUhlYV98JKHoUIzzFA6aRGpkQXxrLj/asBjZc6kejtVeDkxqIKrwga4haG4E5L0E+0zfLRiQ
 Ms33pbfppdwSlSZxqDfVWbCFr5gzTKJ1bhsDvhHNOqRz0i0iJDFG5v6JeONA2KioQSJ9fQJ2tvc
 EhK0G5Yy/5rpUTOhCbMCtr/yPUQ6bUY/i1Hv1Nx8fdGmuZZMWxc4ve2p06psch+DAvLCAqPlBib
 1WgDuq0GMptPLmVK2JCSrfLJK3M2MuOvww+4cBxUR3/vXaaPXzzZiPrmTGv7WIskoEKkoMH2PD4
 sd7GnIAWgEZjlVdrPWSQBFo0jqsO0xVdanAfneUK/uZ3sVwHq8ZIsM4O3t/rEcDXUtK+HIKq1tc
 Ap37RdFotkjWz1/34Ie8zSI/eONjlq+HHsMiTrNY2C9ZPvO7HpL5vg+3BMKExVZO0NtX3futgbE
 5AemuIVd60FCWrOXq2w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_04,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230101
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99260-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,quicinc.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,intel.com,arm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A28AC2F2C0E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/23/26 10:02 AM, Gaurav Kohli wrote:
> 
> 
> On 3/18/2026 3:14 PM, Konrad Dybcio wrote:
>> On 3/13/26 11:34 AM, Gaurav Kohli wrote:
>>> From: Manaf Meethalavalappu Pallikunhi <quic_manafm@quicinc.com>
>>>
>>> The sm8750 includes four TSENS instances, with a total of 47 thermal
>>> sensors distributed across various locations on the SoC.
>>>
>>> The TSENS max/reset threshold is configured to 130°C in the hardware.
>>> Enable all TSENS instances, and define the thermal zones with a hot trip
>>> at 120°C and critical trip at 125°C.
>>>
>>> Signed-off-by: Manaf Meethalavalappu Pallikunhi <quic_manafm@quicinc.com>
>>> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
>>> ---
>>
>> [...]
>>
>>> +        cpu-0-0-0-thermal {
>>> +            thermal-sensors = <&tsens0 1>;
>>> +
>>> +            trips {
>>> +                trip-point0 {
>>> +                    temperature = <120000>;
>>> +                    hysteresis = <5000>;
>>> +                    type = "hot";
>>> +                };
>>
>> Are we going to use these trip points for the CPUs? If not, let's only
>> keep the critical ones (again, for CPUs specifically since they get
>> externally throttled)
> 
> thanks Konrad, for review.
> We are not using this trip points for CPUs, For Kaanapali, Dmitry suggested to add more warning for CPUs also, if in case some user want to use it. So we have added for this soc also.

Alright, please resubmit with Krzysztof's comments addressed and retain
my r-b then

Konrad

