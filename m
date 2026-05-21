Return-Path: <linux-arm-msm+bounces-108968-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CJQRJajJDmovCQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108968-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 11:00:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B619E5A1B71
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 11:00:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 68B13308C2CF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 08:49:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93C1B3A83BF;
	Thu, 21 May 2026 08:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YSvSrWoY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AApbvyOE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52DA13A7584
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 08:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779353320; cv=none; b=VjxwFyhqfESM3fUq33jRvBng4Ca1ExafrG8BCowM630M1plNez24oR15FoFWytSmKKZ1jrVVMXGyU4xoLke9ShYBkR1m2ZX+iCkdMi52+JUR5mGadhh3u5sBGigIxH/VAtH6xr0PJDEZGoBtQKt9Ro5eGsNW1qhwOn/8YENLvSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779353320; c=relaxed/simple;
	bh=57ptv98eHT5HWsuAJvje9omWUtBApDIfl+FgKZ+ptQ0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AleuWHFPa+p4h8qH4CboaHBMHfllM6tbS7Luk2+IsIv2InHrA7S8GA2VJyNljkzeTg9UcFQqbeXSSULg73XGJ8w0I16sKDvdHS/1FaOsG5wBZZZF7mDg1vGfGbNFPKFlmmKo0+GLltHOhQoyVUjrHfnfscAaO7LMThktSyMUTl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YSvSrWoY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AApbvyOE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L7C3VK3680415
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 08:48:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fPSwqpTo03Bkl0v3i4c9hpTGEzAjY7Tg79AzsZEcbAE=; b=YSvSrWoYRS8d2pDa
	zeYLe7C2ZycakQs0S4vZ842NP5K15wj5uvyeK91nQCDZ69KKlM8R7T4fc/S9jagw
	dw3VxxPt7Coq2v/m18HeCyWKI549nm3Aq34G3KnxLuPLNAWeQAhf9lKrES3RhamF
	Rk1RNBTdq4Jp3BnTv2CeCcy33P3gcg9sHdW7LgSH9U+6nWAEQat3AWY7T1UWoIqk
	6AakZZDIoaPANRbY5ODRzb5wcwYLprRSzomYJCS0jRZ3Utm+FMjmC+cJ73Z+TjJ8
	wp6JqswWPVVqZw5RDGR+0TvJ7nKQpTNCY5JDf7GQoambvkPqjwBBiin5Beaj5lGq
	RRnuGw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9e9j42ny-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 08:48:38 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50d840206c3so18098521cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 01:48:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779353317; x=1779958117; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fPSwqpTo03Bkl0v3i4c9hpTGEzAjY7Tg79AzsZEcbAE=;
        b=AApbvyOE/ePO2rhP+eLhetaC4M9V8paH75zI7EA/vN2OSUbnBmeUBF7U3UQ5lQCGKo
         BkSsaKSmDJqu6Qtqq1YOc/99eBbef1ancP+GrLXV2qLeEGD56Nd5Z2OF16JPpmLd2wpJ
         jEoo/gt/wsco9wfot8d4qMdkHsIgunX2o1YE6jGsVLXBhnaPMCzXwxcplN8e7Bfp0S7I
         O+Z91G/YMrREFntna3Zt+7NVggERkSVP8+DrJjKKLToYciA2CCGLyCsTFFc5QJXnf/ju
         0x1vhImpCVtq/us+Aigx8ikXhyYk59zO7fkKOjf8oYJhPsbSn2DuQcX25mjH8D0mKojL
         TQQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779353317; x=1779958117;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fPSwqpTo03Bkl0v3i4c9hpTGEzAjY7Tg79AzsZEcbAE=;
        b=XN4aRaAbj8Vwo9qHgcmxUAcyAKnmlzS0ualw+i+t0YUnm6WVqm2gVw7y9eviUnFoR7
         8mY9gQt/p+qf+xybTKNYKIWrYDH95OkVng7S0c19/4TaKwnaSU3PoAyudrQ4zqsMOBzr
         X8M61HDVjBvZLh4rOnPLNlTfEVZ6UgPBDo14ds0ZrTtmLYauiaCt1gxuguWrbRXXyBY1
         AHvEcv2ajIwZd+f9eyPdQw48g05Xz5x+N85ssd92Tscg5kYbyJ0YCVvQuVycFcO1RzQt
         h6CqOfoAnagN9j3k9McDL+fEDmDGBagl+XRheTwICK7QZzvA7rroOqBMfVNBaSHBOUjB
         kEYw==
X-Forwarded-Encrypted: i=1; AFNElJ8A/6vCirfHSvwE+9Eqecx32JWHBF9QZ9CH1CNAd3xL2MDVUMbKDOzl+S0fFPbMYwHwLLpDi/BABlmkU1rt@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9PC3nTD9XtZgga1y7/YPXI89S+ne860ywJULz7/YifAfeqXZg
	FaQw8tRWb+xi/XubA/EnLA81wkuELPlqpYow14H7z2cXdcYMSCFsQmYWAUQrufSR8fdrQ/Hu4dR
	MUQZVaN5zJpdWbHjLHv7rg6VIAQ4YYChXBkklo3XUKN2nTj00+nu23yqZhttYbjpETfV2
X-Gm-Gg: Acq92OGMoYB99IsPaCbmJj8PDI7K9yXabCCfScTqUqcPu5j1chBK5jFiFnC0wnxYi58
	htOttFIQxLXjRXY4DFJjiFJNlQveXdI+VpPrE7JRbx7dBP1Z2IFrXYkPgfFkgJZw7U+xk9xdMKa
	PZmlbtdIdWuKaezv8Tar5nCiP896WMhKeqQA2TkU9fg6YJbw1Z33a9NuvrYYIj8DdXeWZT5HOq+
	zSoB3eX8U6/5/2oQIUio9SxMlByp2M4ex9CxzfyTG8Fy2UwgbMdq0lwlKCqL/f++YLfQA5eIjhu
	lMwNAcZoTKUf74EDdJqxtE/s5IWlg0D1UtfeMCazfpnTwUtTKdYZorBtGjo0a829WCFYr4zohq4
	nX5KAmPdVnWwDTAVmoXQh29tvuK8ZXIocVYsgrJOnOml+4eS6XII461NTIxtCCT9So2iYT88pLD
	6z++jcINBdum7zBg==
X-Received: by 2002:ac8:5812:0:b0:50f:b9a6:82ae with SMTP id d75a77b69052e-516c54382cbmr18835381cf.2.1779353317534;
        Thu, 21 May 2026 01:48:37 -0700 (PDT)
X-Received: by 2002:ac8:5812:0:b0:50f:b9a6:82ae with SMTP id d75a77b69052e-516c54382cbmr18835131cf.2.1779353316998;
        Thu, 21 May 2026 01:48:36 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bdc87890ab5sm17545766b.4.2026.05.21.01.48.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 01:48:35 -0700 (PDT)
Message-ID: <624a780c-0b22-45e3-aec5-e61c319de901@oss.qualcomm.com>
Date: Thu, 21 May 2026 10:48:32 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/11] arm64: dts: qcom: sc8280xp-arcata: Enable backlight
To: =?UTF-8?Q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>,
        Douglas Anderson <dianders@chromium.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
References: <20260520-surface-sp9-5g-for-next-v1-0-9df52552bf87@gmail.com>
 <20260520-surface-sp9-5g-for-next-v1-2-9df52552bf87@gmail.com>
 <f5f70aa2-a1b8-40e0-838f-6709e6e08a5a@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <f5f70aa2-a1b8-40e0-838f-6709e6e08a5a@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=bfhbluPB c=1 sm=1 tr=0 ts=6a0ec6e6 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=pGLkceISAAAA:8 a=-MGe_S8tJvSwwJYLNm8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: TOsuksZCLusBCbEsJNBOmvcB81Q9OCPI
X-Proofpoint-ORIG-GUID: TOsuksZCLusBCbEsJNBOmvcB81Q9OCPI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDA4NiBTYWx0ZWRfXwOVUudF55ELI
 TmxeEH+5GlF/4GaTVpuc/9A9EI/saBIfnuPzS1pQHnsoYmeTAq+/5myY6z4VjV8eMqJZV02F6fe
 nDkbN26htMm7qnJvA4z+NSGf1bUZllh9worNa6ljRurAIQUD3LtGnZnT2WRP+LnmlRfAup1O22Y
 CRPTqRDkrCyEUN18hryyfNxPZCijyj41SAiIoEfYVKMhf5n14e7xySuetQKMKzOX5MoIHCq4mw9
 nyOUL0LfzC3kaDuTc+npyLV+sXjUIztS8LhDBPLFgYmWAR5eFursuodwdyds7XUeff1IltR8r06
 Wv1q5mjZYwwjPKrEd9GfiNu6jXlM9108eyThBwJl3AQReAlYdjIP/H7iNIHxqikDi7XguWdgGxt
 yq2sutcacfkIlTf4zlxFHY+aAdnGDQjrwkIm74pcTJRX+UcCnjF5CpcsYIFWyRePSIVNd76rs/1
 8zhVf5s4YYi79g3TbPg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605210086
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108968-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,chromium.org,linaro.org,linux.intel.com,kernel.org,suse.de,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B619E5A1B71
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/21/26 12:26 AM, Jérôme de Bretagne wrote:
> On 5/20/26 18:40, Jérôme de Bretagne via B4 Relay wrote:
>> From: Jérôme de Bretagne <jerome.debretagne@gmail.com>
>>
>> Add backlight nodes and enable backlight so that it can be controlled
>> with the corresponding buttons found on Surface Pro Type Cover keyboards.
>>
>> The nodes are almost identical to the ones from the ThinkPad X13s with
>> a different enable GPIO for the vreg_edp_bl node.
>>
>> The difference was found by looking at the output of /sys/kernel/debug/gpio
>> on the ThinkPad X13s to see the properties of its enable gpio9:

[...]

> and ... backlight still works! It can also be enabled/disabled with:
>    /sys/class/backlight/backlight/bl_power
> as expected.
> 
> I have no clue why both gpio6 on pmc8280_2 and gpio6 on pmc8280c can enable and disable the backlight. Is it a common scenario?

Could it be that one of them is an ENABLE_BL pin, while the other one
enables the regulator?

Konrad

