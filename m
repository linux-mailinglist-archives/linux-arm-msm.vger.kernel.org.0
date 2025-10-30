Return-Path: <linux-arm-msm+bounces-79768-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C8EEC227B1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 22:57:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 9D8B534BE88
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 21:57:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91A0C329E6F;
	Thu, 30 Oct 2025 21:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ue3Nl992";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VBK/8OT4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1DA62EC0A0
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 21:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761861457; cv=none; b=XUl5Et2kwn1cXW3Kj67tC7o1CMM++pcOlfL49zdTeNC48yrwf7p5pP4H2kKyrJnczGdyMirgEwV8y0s0s8BN46K3mS9kz/skWb4kQPCfh+wiGbABcYrcnwJreVzgcCp5xJGqWpz2D2yln6N9SwuLk3TW0sjqrpF1zSixztO95yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761861457; c=relaxed/simple;
	bh=yoJyzRpSCCIReS9JjsFWUlo+3vKaeWCXo30gNMnXofg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FnWLbPiBkVv7uDxindMal9lyXIkxXrGkC3Kz3obyi2q26hNVJ4ODAlldKB9KJPOqe+RPsSKoqr+Qu2fY1gUc0+lWZpzxHCchGrk3hHQmolQ9ZB4EwI4zAz2sNvnWZ6bNIsNuQ57gE3mWHSbOV51HOUr1kJnh5uWC+8fjS1SKlWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ue3Nl992; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VBK/8OT4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59UHZwBZ3115587
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 21:57:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	D805xAVnHSLtQWp6QWfqoMXrGvEhPuuHYPMCcOzODRs=; b=Ue3Nl992P1vXTS7r
	2Kr9PRYarDt6PFsjHetNQJ5iXRjWthFw7vUr7/Cls5DA3qkatjX9sLs+B5ulKmt7
	2A2DApK7uQ2OJdVT00r6dNjs6P09QDLkZzTGEo0l+e3/qyXn7Kg7IaCjKIJW2dz0
	VlBMNhr+J1rWFYgJhC4QWZCCcGno3k0k40leCOUM1B2Xzdzg/3agIZ2Up6gN7enP
	WVK1GhbbDq8OcC736Dxxkn+O8Yx3pUUWkLJb6Rov6Sb7YNfCdEMYSNKKT4VgdcV7
	WFeb0eKJlZRimkoWzqt8hPs1cDc/JYvWUsMqGkdiktiCXzZpK8/BWdNie4YvCvs4
	i1nr2A==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a45b422ty-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 21:57:34 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-59e1b6766c9so2661803137.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 14:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761861454; x=1762466254; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=D805xAVnHSLtQWp6QWfqoMXrGvEhPuuHYPMCcOzODRs=;
        b=VBK/8OT4X75gLYOcSuShXS3WJ0gkDCpdbbFcUUNOHnMGuTFX3uxx+SWwVz2AoFM6rd
         Y+S4MZ1i+tpvq59U80tmLNukTb/1+2I1AwWO9UATQUaj0onQgQUctDFz9AdiZ8ECki/W
         wN8G0LC1K8yGB9B85TxYfGN8irtCPmUDpX0V3oOVBlcndtqj5EAFbilXUeppy6RwF/PI
         m7jAiOH5piQ1Re6mkdxjYkgB5jA4OX5WDzU4htmcFzOpsH51EtOJdxUKtVqd1/QZNtwt
         2IiSO+ZAN0HTBcWmEQFbkeaR2KzUrpgUMqlpiITsFz6ZLnuQExh0L9iuXT3QxuelM8GI
         ViOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761861454; x=1762466254;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D805xAVnHSLtQWp6QWfqoMXrGvEhPuuHYPMCcOzODRs=;
        b=VqeMVfkAk2ZMXjMPu0DCGqyk+MDyr5bLP/mwWwRSb9FmA8eI9JXWof0zDgeQneJcc6
         Xbn0/uk/iRGQdBVxlzX2O0a3BwxXqr7YVbL/XS13p1N7Onc5Nh4d6wmLOFZu/4aUzAOF
         ZoxhM58j0Wdif6uxp9q7qCvoVHHuKhXTUj4Xzc0Z0nWWzhJjM14jkvI9cc+Kqtqz7Aws
         Ln7WJyT4X68qYRSUFDpCDZLsJ1WHhY4AzTTawq8pZUQD5RyVNVALVhCOHZS0NAZEnog6
         qcE1vn/m6QAqXFYF74SMKKEJqEz1bSbI8XrawhpC6eKY+OPqlJalYPymfpnq1HNrenuq
         +3Ow==
X-Forwarded-Encrypted: i=1; AJvYcCWmXja31MirbL+v3XgqSFeYtBk756afNrMIjhoF4lEgr3SkN0xTW17uDjd7hj6cxArN3cK2jyPWoHtVmXf+@vger.kernel.org
X-Gm-Message-State: AOJu0YyJ+SwTIrKNWaRmNo5nJno8MaATzkM+3SX4QoFpsvtniMDSn6JR
	OyXQKVpfRjlrMKtzvk6Oyg6mszCVO5eiuQO5R9bCi4G718Rnh3+lKn+iF3jvE9IFR19g0vu3y7m
	yWsvlukAUU0QRzk9KXE2cTySxMRtYnIm1Yny9ZgH6+J63IaiiQw3Wi6/4dWTiEYo+j639
X-Gm-Gg: ASbGncugaSrBSTmKthTn1c0z9jijtB9o7qZrZOnHnDfCUPa8T84AMHyrE9s5pBq9dmQ
	NCiaRbMzwnb8qjw4aBLw1mH+3SCj+cSdIVhEnn4R1K0E7RnbQiXeRoPFXaJVhXc6ATGzkFw+qv2
	RkyQv8xxFYCpl8KGIraF6bTpV0LY29aR5g33HVLspS8D7MhdRCgVhbLWt74Qoky/YRztECVr286
	lT0RtYdfEHO9XG5zEcaJGFDhcjYST1WUHwErPHwq9o9sN6PiUPgWave5XCY0HMmJ7Fw1TVE23dw
	O394KHQt1nyuyq2wrQpAhbRi7sdCED/s55Zyo3Pe8HVF+yjONScuyNzk9y9iu7vVeudMVXLX6s7
	eN93m2RMdFoRJMzfI/NzPWEY9Gw==
X-Received: by 2002:a05:622a:5a15:b0:4ec:fafd:7605 with SMTP id d75a77b69052e-4ed31004db9mr15212951cf.60.1761860714350;
        Thu, 30 Oct 2025 14:45:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEH+HqEuczJpMlpDDzdccuf2/KSeYvFUepMCMr+zEaProU5CUwiZbOCeHQ214hDIAAxXqCQ7w==
X-Received: by 2002:a05:622a:5a15:b0:4ec:fafd:7605 with SMTP id d75a77b69052e-4ed31004db9mr15212691cf.60.1761860713800;
        Thu, 30 Oct 2025 14:45:13 -0700 (PDT)
Received: from [192.168.68.121] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-429952b7b43sm34225050f8f.6.2025.10.30.14.45.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Oct 2025 14:45:13 -0700 (PDT)
Message-ID: <d51f38f5-ff04-4dc1-978d-ad8ee6908836@oss.qualcomm.com>
Date: Thu, 30 Oct 2025 21:45:12 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: dt-bindings: pm4125-sdw: correct number of
 soundwire ports
To: Alexey Klimov <alexey.klimov@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        broonie@kernel.org, srini@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        devicetree@vger.kernel.org, perex@perex.cz, tiwai@suse.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20251029144636.357203-1-srinivas.kandagatla@oss.qualcomm.com>
 <DDVYM9SMCT7O.17T5SIB9IEED4@linaro.org>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <DDVYM9SMCT7O.17T5SIB9IEED4@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMwMDE4NiBTYWx0ZWRfXygrLMsAFZOg/
 GHH1U9ANzcWk1dWdRIMjansFSpr2SLggcqEyG6B0nwB0Vmca069WykZMAc6IUKu0U32aqCQZk1c
 Qz+DrNhGUxah+CW1CPODSEmcCqOazwJpzBRRSito5jv+iVlRnXOIHxR3ipM3PvK2vOxRCeuU7nW
 JHZwZqKZdM7s24UEp0RUK93KygKfZGJt1mOQxkl6RC5Y2ZeSsBykP9AuVdzExEu41dkh7NUSh0m
 ROc7/8M+i4/JgnY7HKfUQsOkjYSaCT0kEvIjB9TLyy12jEVaWfEVbYcFNsxZ9zhPPcMVzpBJUNs
 zouX1CVxGzIscYjWhTcZfnv2eMXK1e618GBp1DQqrdSvJQ1kXS98KeUIDA7r8WdnbGPOWNYoHmV
 R9CQ1Jt1UT0rpt8VUthzlVxU7q0r2A==
X-Authority-Analysis: v=2.4 cv=KePfcAYD c=1 sm=1 tr=0 ts=6903df4e cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=cZRtUSbEUlCTYNoyqfMA:9 a=QEXdDO2ut3YA:10 a=-_B0kFfA75AA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-ORIG-GUID: uV0edCkKbF8WFPBuiG-QT_6UZQOs1M-_
X-Proofpoint-GUID: uV0edCkKbF8WFPBuiG-QT_6UZQOs1M-_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_07,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510300186



On 10/30/25 9:03 PM, Alexey Klimov wrote:
> On Wed Oct 29, 2025 at 2:46 PM GMT, Srinivas Kandagatla wrote:
>> For some reason we ended up limiting the number of soundwire ports to 2
>> in the bindings, the actual codec supports 4 rx and 5 tx ports.
> 
> The reason is quite simple. The available _limited_ documentation at that
> point suggested that there are two rx and two tx ports. There simply
> were no better docs.
> If you finally got access to the right docs then it is good to fix that.
> 
>> Fixes: 88d0d17192c5 ("ASoC: dt-bindings: add bindings for pm4125 audio codec")
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> 
> You should run get_maintainer.pl script when sending patches and check who
> should be put into c/c. See [1] too.
> Here you should run smth like this:
> 
> get_maintainer.pl -f Documentation/devicetree/bindings/sound/qcom,pm4125-sdw.yaml 
> 
> or check with b4 how it works.
> 
thanks Alexey, for the suggestions!

--srini> The c/c list is not full.
> Perhaps this is a consequence of putting all Qcom audio related things under
> one entry in maintainers file.
> 
> Best regards,
> Alexey
> 
> [1]: https://docs.kernel.org/process/submitting-patches.html#select-the-recipients-for-your-patch
> 


