Return-Path: <linux-arm-msm+bounces-84158-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 157A5C9E313
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Dec 2025 09:25:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D95884E21A4
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Dec 2025 08:24:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08C852C21FC;
	Wed,  3 Dec 2025 08:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ptziOfUg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XH3vfMFP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E35C2C21E7
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Dec 2025 08:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764750294; cv=none; b=jVyt3U2TmKZHbucoGLs5vR79CocAau5GDpuetgQiI9pJ0wzT3SQYm8w4WV8nBXudubspeq5dcSV9F+Z8ef7trhhV52b5MSwQ3JHT7mJZhQn9RnzYUX3vHwtgFOJkmyDDeq9cfQDwhcMs84hWWRPpDTUPHRpGuzk2G+a4smDg+xA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764750294; c=relaxed/simple;
	bh=shO0z90gTGWwW3ALZBNjCFepr0kxAiw8L+nJz4d8F8Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IDkMn+A/EGbv86EFmuH4xtzSNMmU8ocx3EBqQ3GUPLvL1lZ+e34biLxWlcy7a53r2c9YE12aGY1Q5I/Q4xCbQj3Ef0cld53hCLGpr7PJhWQMJbq9V+Z8XF3t31vgEbZOfWS/+p68sa4V7pd39+Qz2WHDZlKQhUa4pxd4D8LsfRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ptziOfUg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XH3vfMFP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B35XdxS330990
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Dec 2025 08:24:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6XhxI6gy/uvV6B2ez/PZVwvZxyoyIGJD8E0BhCFc8sg=; b=ptziOfUg1VeRec0V
	bJPi5oFzsUMLf/ds+ZXJerz2IGvbACDYbxKRxa4NWoB6rREsg+P02lpI+SbFGXMI
	4I7WqLbAc+l3lU0FnkUJshGCeK10pbzbpc173yb62kRTbXxwOcQXVzgGLD1RbEeY
	mKsDh+XZNpUO/xSSfKGWstsXWPc5A+FGdrDZwIBn5lkYIEdQUSkyj1fchmsSJSyb
	CcviGzepvBTXGD81j/cY6l+f+mgfS5mwv4/6mUT1XJFRlmYar1EhuB6/uvTn2xYT
	6uP8pODYfnjbl9ROLJrf2UVnQezwK5uh9PKI4temQC7zMZC1KHu/WQzFctoXr+OQ
	XhPxCg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4at67c1yu3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Dec 2025 08:24:52 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b2194e266aso1241693685a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Dec 2025 00:24:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764750291; x=1765355091; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6XhxI6gy/uvV6B2ez/PZVwvZxyoyIGJD8E0BhCFc8sg=;
        b=XH3vfMFPO+fOZXE2UMByay8Jm+BUP6pVIiWrRMsF7LuFPeNVsm2q8K/WQGr7ofTucN
         rfi801rtKoBw47Z7HLqcORLTFcrqqLP4iGtpPrVGdJ7xputMf4v5bbxW3PGeO8ietlMp
         VS3s4Aktm1xnrlXfiCJF/Z1yPolQvhZvbm0eL+q8cYZwhynSxdlSX/wGmUNg00RIrHK9
         MBI9Lg7k8OIBMxYUTb/M0MZF4fc159hPhWj7FAJnX+5NVg3k9/Kyddgwb7KP3FJC2BtX
         z9Ga2QHO4Ec/ehvyk4dQAGJlACM5w9teX2mh+lseADHxz5G7PTVAoNlUVLkK3Iu/CDlD
         3Hpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764750291; x=1765355091;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6XhxI6gy/uvV6B2ez/PZVwvZxyoyIGJD8E0BhCFc8sg=;
        b=UUzFTpWyTk5Bh22xAdmjovphVzivhb/647G2R/5xL8yQx8cZs262ec4dEpTE0eS+la
         GO+TuuN66W2k4/3IttG4cisB95tDCb5a4+i156vJaDeKOenM6jVUqhkFiFWZU9Pf+wV2
         QIf06jYqzWkKExQjD6WpgjV2Xf99VLIRNZnVg4Tze5x82Tta6oFocYO5cYUiI/cEvf0t
         kQlLKEcnasivNyrdeppm2kLQG++p82q2K+YUFRPpKsZOliCl9YgTfwt3Mn1DG1SiE+93
         QN/Dacvmsu2kzzfUP0TuokLLBJ2QNdTp/0qK48vUFeXPYUpHHExBujs5VoMXBIzqOtLu
         7Jgg==
X-Forwarded-Encrypted: i=1; AJvYcCXi9WR/auUwObOJx9GBDMa7TAvo93Qt0w+xcy93cc60iNfvVNXJ/ya3U7WA0iohqigzbCw5I+ZDVOjEHvrt@vger.kernel.org
X-Gm-Message-State: AOJu0YyN8H5QpSTW9aOHMM36/DrQIgIEAKHuAcEmqosPYCOXNtQhX3TT
	pAbsSGi0bGyAdPLQAnd2dI4wFpt3KK7X8gfultt/3RP+Flb+qqbwR8LWvb8FR63Qn2Ly7q4+c/9
	akfxRuYGLZO/J1nSUANEyNioZ4qgJeH2XsFkLGTNK3AZ/ba+QuJHc+iznd/85uNkSW9O4edebkQ
	ms
X-Gm-Gg: ASbGncthU+XEbrFhBWTu91YuVL3E74fELOCiaP3VX3TGJbHGNx/0qR6LDzjQrmvHUg/
	cAZKtxAWuQGePLwHFbpMRDBg9gpsawmTnyxncJYF0PLoVfr+bPgLp5r+Ig7K1drPOzaDKz6ROsO
	sT21R2IpnZtWx159embfBlC1AOjBd26ZQnR5Ho4ANNe0NCDBWM5jUAY4jmlYDKblvwNg8qD6oXr
	ewQ6pskP6/6OAI9QZWN/SZrh6A/PNpO7OLs08wjhrnp8Q+KAKbybMcgGRAuYAYgy/VZ3+qPGGZy
	u29uLClWUG7rZEJliXUdHnpGlfwebsQr85xzMSUaJNBpDvIG46OhzAOZX04bQFCAjZx2G27NsBD
	3AZXS4luBkFeROnYE1jFXC8J/CG6rmLYfsVqF
X-Received: by 2002:a05:620a:4402:b0:8b2:f0dd:2a89 with SMTP id af79cd13be357-8b5e5927c55mr190979985a.37.1764750291525;
        Wed, 03 Dec 2025 00:24:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGk0eE9WLO3kY72PxlTPf3oB2KqFtDPAzLzhAMJ1Y400cFaxK3Enp46I6A+kwlwr5/jlhVdiw==
X-Received: by 2002:a05:620a:4402:b0:8b2:f0dd:2a89 with SMTP id af79cd13be357-8b5e5927c55mr190977885a.37.1764750291050;
        Wed, 03 Dec 2025 00:24:51 -0800 (PST)
Received: from [192.168.68.121] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4792a79dd66sm35915695e9.6.2025.12.03.00.24.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Dec 2025 00:24:50 -0800 (PST)
Message-ID: <3cddb94b-a63d-4b75-95b7-7fd0378fda1d@oss.qualcomm.com>
Date: Wed, 3 Dec 2025 08:24:49 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] ASoC: qcom: audioreach: Drop unused
 audioreach_control_load_mix() arguments
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251129-b4-container-of-const-asoc-qcom-v1-0-67a3d3320371@oss.qualcomm.com>
 <20251129-b4-container-of-const-asoc-qcom-v1-1-67a3d3320371@oss.qualcomm.com>
 <f029c82f-444e-40c7-a50b-493ce8ae159f@oss.qualcomm.com>
 <2ac6ccd1-9d35-49cf-aec6-771622e24876@oss.qualcomm.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <2ac6ccd1-9d35-49cf-aec6-771622e24876@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: DfEzc673vFVrYVHsWfJbPwYgO42AnY44
X-Authority-Analysis: v=2.4 cv=W/c1lBWk c=1 sm=1 tr=0 ts=692ff3d4 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=98aQCdHbM1csXaQqDRQA:9 a=QEXdDO2ut3YA:10
 a=zZCYzV9kfG8A:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: DfEzc673vFVrYVHsWfJbPwYgO42AnY44
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAzMDA2NSBTYWx0ZWRfX7pK2/dI6qVny
 DRW9Slc1CJRfLWwsRXPuaemSaIk4ArRt4Bvk4a4yNX3u/F8XmYtzqQ0pMEAc8RkZ14eJwJ2KOx6
 uO/pUJO2TjxhnwYQu5FF+BNv33mQ1x8p/aiSLUEHuMTijoRld9LvGf3UzJ6jp2VqhTljY+l6GAM
 LBL+BO5oOxjnPlK6U37FyK+TUnSlskFlC3hSy3Fmq0nwWrI2REo0lb7jPzrcrsC1UcDaRlGV3hs
 ZCd4etWvAB2eg6+Djh4Q7wK7NZjQ0JfY4IEK/yytvwP73pmXU2HVhkRoFZJaPOVFBuI/4ABr8g7
 9QcgLv7hGhkDm8YWKqZbMce+J1u7Ve8obOUBuAg1IuRO4l4YyaDNzHk8RtSgyS+MGrzUxbz0jpk
 p1j9pnRCnlXUHvr9RjNy7zykRtdvcg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-02_01,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512030065

On 12/3/25 8:05 AM, Krzysztof Kozlowski wrote:
> On 01/12/2025 16:21, Srinivas Kandagatla wrote:
>>
>>
>> On 11/29/25 2:02 PM, Krzysztof Kozlowski wrote:
>>> Simplify the audioreach_control_load_mix() function by removing its
>>> unused arguments.
>>
>> TBH, this is an unnecessary cleanup.
>>
>> There are 1000+ of such instances in all over the kernel, if we audit this.
>>
>> Functions will have more arguments than that gets used in the
>> implementations for various reasons, consistency, future use etc..
>>
>> I dont see any point in this type of cleanups.
>>
> 
> 
> Sure, no problem. Just please confirm - you mean only this patch
> dropping the arguments?
Yes please, just drop this patch.


--srini>
> Best regards,
> Krzysztof


