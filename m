Return-Path: <linux-arm-msm+bounces-88044-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FD62D038F5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 08 Jan 2026 15:52:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3FDDF302413F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Jan 2026 14:50:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A435D4352E3;
	Thu,  8 Jan 2026 09:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dyXLYG5y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N3QjcwIQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 680774352F8
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Jan 2026 09:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767864176; cv=none; b=iEUaxaTs5DwHI3s1OSFTVvAlX5eFBMNl1yvSRKyWDsXf3GO+zjEBnVopfcmFeP6q1bM7q/Bohf4/BnkIo35i0nJ9uKgyyK6zmvyxfvehmSLnt3rTb8PMiPLl2ZOUHrqsYW32RB8cJMw3+w2m21p9t7/P39CM3BC+uPEA0yGT8bY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767864176; c=relaxed/simple;
	bh=vKerELevSng66xC6jQJ3bmm9PzkzjOX3+h984hOwKT0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gHxGFAQpvkhHLkl+Vxqn1N0tDyjD6elg5j2F9cRCQFxHk+2nnBjSyEsrUDBWg+i8tjGT9L/L0HoOXnmfOD1ifMCvr6wojNpoQgnFlNjPnbh1UhoV3zs4pQAt1Gg4E+dLXUcMU5eXNj9RJOnVh4OnWBZkJ51yiqEwCAWKhDS7wYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dyXLYG5y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N3QjcwIQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6084g8NR3751433
	for <linux-arm-msm@vger.kernel.org>; Thu, 8 Jan 2026 09:22:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ur81gEXIS6mzyuOT+3mLeiSWiGD1gehijf5jkGbJanY=; b=dyXLYG5yvBoRM3zd
	6WqgKT4hyI+1vpzW4PiJe0R82IZCp66vnO68/+bRnJIo+zP2g9mEc3ZostpuRWxh
	HaqHYSOhJowCtwdgdo4sPoYfOYlJy45DkH3PH38GArau0/6cRabZu+ITGTlpNVrc
	mlZbfxE/SO+kT+pOubgVAb/GB4vwJI32Dz0tqp/DhjyTmZ1ugb30nGkjXZgyvMvS
	34NPMqzaSOTCsITASMJ6a0mU5kNZ822ijdhw4SNG3XP7/eF5rQPlr3DHY7Esaes2
	09cYOWI97/oI1pzSEBxx+5qvt0PPGxzFwOfR6gzCAS00gxcHKizZBcyjrJOgAjmY
	2/9hdA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhuxctnpx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jan 2026 09:22:48 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b2fdf3a190so55975785a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jan 2026 01:22:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767864167; x=1768468967; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ur81gEXIS6mzyuOT+3mLeiSWiGD1gehijf5jkGbJanY=;
        b=N3QjcwIQVyCgjmWyPgZSKRgEjl6ZU74/pzOtVxrlY3KLJM+4RN6i+dE5S17HVcLhEh
         xAU0RwHgMlnq2PCUDhPjmSphftsg8oIihTV0FbXc1PD9Ub4oq6j8IM4e0BQ8qA1fafpB
         VY+oYz9PwbQMc10HI7fXYnRzWfwRobEC8N2Xp7RgivaRQZNSkaDVNgw+kwYNpP4LqqD9
         6RYyaeW7sSp3011iUbe2Y24gN3po7gDghEgQmX04Zs7P1PmU2AeKOfG5+ihSM9TuDxlJ
         4Rjn5l2+0rCWIsuSQbH/xIogjKVti9kLJvG66APONPGufcrlyPjZnv14bim5ErAVpkGj
         YayA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767864167; x=1768468967;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ur81gEXIS6mzyuOT+3mLeiSWiGD1gehijf5jkGbJanY=;
        b=RfN+9/eVdgKfAYSd8vzjwnlF+mYYxbZqa+R2IReymcXOcvTueG/ZOZd7OwibFNGzeC
         2DKRMfCtUhL8LY8fWzpQ43TOE9Zs78Mw3NCqxWCuwkik6bzqbfdWe7Tap8JhpcFcY7A0
         kg6Dq6avYLSEoAUQZn4G6XiBclZLK9B6wNN8uO1XdC88g1qJ8k0wHSiYaFjnPNxHaYp3
         g+A0grtxev4xG6fNVMj/ka9a3C67fBCaWG1GANvj1eNs8jHdNEf4btvMiRgD3gYMZP8u
         sqT43YgO88nZhqVpNKe365VT14FMPn6MgRQCjZuhLW6iqjSN+UeMvBCPgu9Pqi0SX57K
         Dkhg==
X-Forwarded-Encrypted: i=1; AJvYcCWPq/ZrWO3f7jLOTcAwaNyElPcE9DdecP/uRaWzkym1jl8fVBVXseAvIZimP9cLsHpNqPoVZB5nbcMTh/M+@vger.kernel.org
X-Gm-Message-State: AOJu0YxiHpIBFHdjgx0lVJ9oerheWjgL33paGevARLeN9PQGV+PsDUGH
	aUS48sB/eqIFCDETcAcTgJxozvaA/g934wURmHguUhDwLSpjRXM8G78Nt6CDXNAXu1O4IWkl5gc
	1wW6bNF5WcmzJcD9+xMaoU9Rywh3cwy5mGnm8iriwD4CFV9IZPEARciFALwBs6XCq3z5L
X-Gm-Gg: AY/fxX7xQ8+qg+tM1cJJ+fGly0ZNRbXosRpfQaCEiY0FuIoxPIxsQNY098m1fDJ5Dkm
	O/1/ZbQGq9vUQax9Lphb+nEL/N3A0Kfi27ZehLV9CWkP3+kBxDdFpkuq0PuYChGb13DfxYQdT0o
	+34GoZOkpRIXdAKLvncS3eKvfUdHvaOi4i2h94TN3WH4Ppm3wzYf84p2nWKg533r/om4aICI7Rv
	fksP19WB9ooAaYaQhcCUnaMvvSUVaLIFqJ3u8fRGsN+65/GhlRowjaFBltoIerbcQHNzxd2eFnr
	KzSCAxT1EHWkC/NLr8OJ5Z5nTYr8gbByeMTUggQ79V9qL6kOL29pLBQT3rqwvqFwrpRi2cersFt
	oFSm/Dj5vm1KnUue9uN0dhNeyV6VOpFx/kR0m+FuBs9U48B3k8KUHPTyPQmyaGQhHWtI=
X-Received: by 2002:a05:622a:307:b0:4ee:1e33:bc45 with SMTP id d75a77b69052e-4ffb48b558dmr58978941cf.5.1767864167523;
        Thu, 08 Jan 2026 01:22:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IESz7XxqM9XjQeyJC6Vabm1GdmsiTvWUlPsr3BFnCnOv6Uphl9e+re+AckjETMw29nhVuUAjA==
X-Received: by 2002:a05:622a:307:b0:4ee:1e33:bc45 with SMTP id d75a77b69052e-4ffb48b558dmr58978571cf.5.1767864166971;
        Thu, 08 Jan 2026 01:22:46 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b842a230db0sm767583766b.2.2026.01.08.01.22.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jan 2026 01:22:46 -0800 (PST)
Message-ID: <88beddf1-2a76-42d5-9798-3840e0e86cea@oss.qualcomm.com>
Date: Thu, 8 Jan 2026 10:22:44 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/7] dt-bindings: backlight: qcom-wled: Document ovp
 values for PMI8950
To: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
        Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
        Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Kiran Gunda <quic_kgunda@quicinc.com>, Helge Deller <deller@gmx.de>,
        Luca Weiss <luca@lucaweiss.eu>, Konrad Dybcio <konradybcio@kernel.org>,
        Eugene Lepshy <fekz115@gmail.com>,
        Gianluca Boiano <morf3089@gmail.com>,
        Alejandro Tafalla <atafalla@dnyon.com>
Cc: dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Daniel Thompson <daniel.thompson@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-fbdev@vger.kernel.org
References: <20260108-pmi8950-wled-v2-0-8687f23147d7@mainlining.org>
 <20260108-pmi8950-wled-v2-3-8687f23147d7@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260108-pmi8950-wled-v2-3-8687f23147d7@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDA2MiBTYWx0ZWRfXzjPKvXjTlPYd
 E602np2eYezlg7QKgfKOSQkYLbY49Gp7GsDbGcTCiLFxruifs0h8NLM9wq1K8ymdEY0Mi97XSWC
 IlfAzhfUgmOXHhZV188lnvcSC6ZtId6OE2RJk51OrXPhI9EQx1Y3MZuH1Bqin/FyE5nSHQmqu3D
 LddMbuKOdnz+2/1zjZzgR0g8FRWNhPkhmvtgLBUWxgGED/Jn61XxRZtEHRNnOdUyHEJNDGtU3zh
 iS+faU+fKrV+ict60fR/R4W7jJMA7fOEvCI801gDYaWnjHR3oj4NYYB/cEvJPwxQ1hIQ44Tv6gn
 HztpLPsOLpCv0gi08/mE8pBBqQFd+eVjhkGEogMDwuctMHMRjfcBVAFVO530vItVErdjxwyPoys
 eNnM7hG38JacZazhW5wLiNKnvGCr8JjW6hs1JotTyyYbuhIY9LkOBCGuSDieThKlpphyYvhwlYp
 MlAu+Q9kGJaLqsdeU4g==
X-Proofpoint-ORIG-GUID: cNlakvODK4h6IAy0AxuIFOPtnTe3RyQL
X-Authority-Analysis: v=2.4 cv=SPdPlevH c=1 sm=1 tr=0 ts=695f7768 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=OuZLqq7tAAAA:8 a=EUspDBNiAAAA:8
 a=TDiaKIjp1V8PvaA6ZvsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=YF3nxe-81eYA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-GUID: cNlakvODK4h6IAy0AxuIFOPtnTe3RyQL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-08_02,2026-01-07_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 bulkscore=0 spamscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601080062

On 1/8/26 4:43 AM, Barnabás Czémán wrote:
> Document ovp values supported by wled found in PMI8950.
> 
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


