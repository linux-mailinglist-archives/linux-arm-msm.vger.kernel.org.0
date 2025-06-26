Return-Path: <linux-arm-msm+bounces-62655-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 088F1AEA029
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jun 2025 16:17:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F17104E3617
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jun 2025 14:15:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A0A62264A1;
	Thu, 26 Jun 2025 14:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZpL7jRUL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0A6C2E888B
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jun 2025 14:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750947280; cv=none; b=Gv0/jIFDR3sWmO9hNg6rNyC9SDpahUSUdT9OD4V7q+hPcZVLwXH/sWSEYgUjOClFPUoVNkul/vdeuEnzrCeX6CYf3uWwrLUcNoNauxFViuei6+DMTFT1FpqikfJqrWEDGmMaZI80VKyTx5jONeuJE8wy0MSpkaR+3AXGoL4q1q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750947280; c=relaxed/simple;
	bh=s6jU1sXHDJ+SIoAkRoACgYHE64C6JjBjN0FDZ0zZu0k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ahH7MdTfBZBAI0e5vgsN3pnN1yrfXx0vIG+oRNrwb0em48iofszaIkePrCTRoZ5NstAAqeCkIEneVLOUfdlj1tf0r7Hl3d0fHVSMC86Bu2fvNJecC0WVsTXOnT+01kCgOrcCEkboVf9gM/mkp8Xmo78LnQYJj/KbR+WQEVC1/bA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZpL7jRUL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55Q9xV9u014018
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jun 2025 14:14:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+N4R0U7vukwp5S4+1i/lwayf9jQJ9BLGw//WHS7jJbc=; b=ZpL7jRULjhGLDwRs
	MAmpKaoeoSmWlqe9/a7PyhzJHJ+VwGGACGaCmHSeSB6HQo1BEtogAmHvnr3g0hNG
	QB8LWpSZnBeGzS/WQ+32obgzML3KN7THZ57WLydhVHV8q0kr77rkym+6gL+FX8YP
	7fV71sZFcDefoo5wfRGYmGvhfLj+9VNBBlCXk5W1dIXvuYsTpXkyxfbxxQdeGvcJ
	Yrlrj+5clm4orhqwzvaPs14ix+QK/FPB5NoDv4aQDVw/x/tYxGep6kz4TWTdjibQ
	RfoLKESrMB+/c9KAERe/EkJ7Z76XWsOzSNI1jX0qlx0bieHYO86h3EC6PPYi4wZG
	7Nrmcw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f3bgkjak-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jun 2025 14:14:36 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d0979c176eso24110985a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jun 2025 07:14:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750947275; x=1751552075;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+N4R0U7vukwp5S4+1i/lwayf9jQJ9BLGw//WHS7jJbc=;
        b=A+cXLR1G5xxFgEHNCJt0OqFcnPFSgWKFuzuGpGSQf0a7ksLnK95Em21jxz3JA0/9pU
         p2qVTwvld8eS6Iwq3FyqJOS7/Dr91hviZaIfv4PXKSUefTOmF11YTFvRCFVtxe5kF5Eu
         WB1JqjRqdumV5wxfiLWMs1T3DYXAFE172VQiWfvkg1KTuQ6NVNHu+sxSFLUMq3e+Er4c
         5JFYDtDSZqijED0rxl1WKykyJ5sDlWUXUJeyfwJqKet0fs+6Bt1sXtdsd+CdApiKsNT/
         MQZQzS5xKKfm+2yckv8mPN9dXRI4sMuf2Gj7YWHXvLBSBNd5h9WucNr+ouSb4e7dnOoD
         6HOA==
X-Forwarded-Encrypted: i=1; AJvYcCX78/N76aWY0gASYEE+WiBEzMLrjATaUeKgFftsW10yTNSgqwKPUvIVsnZ7ODBqJDjYQ2Ak/4Ua/tagKNYs@vger.kernel.org
X-Gm-Message-State: AOJu0YwiHsxn7VrGotfQybYoCy5uOhkTKWQ/F/srJWaxsOdADNGbL6/H
	nL8WP2kPseMWXoozimfxwgrnaDf7XU/UgF3yxX4pXOCfvH6U8j8ad6D5jWzZSfI9OD8OB00mU78
	9r9j6cubh75YeVnYJzOEEKy62JLquKcPBFZ+Mk5JIehuYdbTVG+MfJjsg3Rhu7GBwLhOb
X-Gm-Gg: ASbGnctqls4WsEpWWVV817nSSAc9ssOWr9mIf+FcUzDn9hr0gtk7xweJLYZJVbtnaY/
	ctDex6XpVzCdXfm6pC+fV7+vuwrNHTHBpw2qaEg18ER137AjFjlQV8xY4b02jYV5jV1WksZAiCY
	xFsnjoliE9WLFFhI3O3KunU8XgOJ9vevnqtGSubNRxq692HpXQajwD62iA6RtekRUWsOoc0rLCR
	a2SgC7dV6mKZPvwMgpA0t7eLouG3S00lNyg0l6uHQCSkDYNxX7ddaIvwDeO6Rzq2Q6RFXmFIsxK
	IuMQ0e7wwS4krzq95GIRIu6fO2g/a9hE0+GZgdhjSlSTbRfbok3uhATP6MbqHvLW5BS9+NcfM2X
	ltB8=
X-Received: by 2002:a05:620a:44c6:b0:7d0:a01f:fb88 with SMTP id af79cd13be357-7d42968f182mr425992485a.3.1750947275072;
        Thu, 26 Jun 2025 07:14:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFc0t0Q2Mn9NfrI6NhR4IzS8rzupePtJu4DHDSHjoos+xGBqqXt7a01IDlkiAczEHK+bPfwrQ==
X-Received: by 2002:a05:620a:44c6:b0:7d0:a01f:fb88 with SMTP id af79cd13be357-7d42968f182mr425989785a.3.1750947274558;
        Thu, 26 Jun 2025 07:14:34 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c8320b592sm44184a12.75.2025.06.26.07.14.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jun 2025 07:14:34 -0700 (PDT)
Message-ID: <05a443b5-628e-4bd8-a189-7f5a7ccb7b2c@oss.qualcomm.com>
Date: Thu, 26 Jun 2025 16:14:32 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: sm8550: Correct the min/max voltages
 for vreg_l6n_3p3
To: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
References: <20250620-sm8550-correct-vreg_l6n_3p3-vol-v2-1-b397f3e91d7b@oss.qualcomm.com>
 <aabcf5d1-7380-40c8-896f-6ce37944e97d@oss.qualcomm.com>
 <CADhhZXYZGO7Ns6R4JEyrt43+HGBuVwKz8hRiA7cxeTfg6egVcg@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CADhhZXYZGO7Ns6R4JEyrt43+HGBuVwKz8hRiA7cxeTfg6egVcg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Og_m3qlGCTO0ZL60DgAHh4dwk_JXgT4-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI2MDEyMCBTYWx0ZWRfX/HtUFgOCxU+g
 GBYIAdd30ByfM7n3kkhXA30vYnGGBDA+vpp14lxt8IebpFp1LzSd2eP452YCPnURa2E2ZplomUO
 zfoXlE/f+FKT+9scSt8lgtJuNbs4QmHVkRkBFeKPIXkYJysf1GwKnWTz3d9hjqopiZyN9m4pR2t
 BQvp+bz5dZu7JcuSXTyN8WQ8ZIFMvVob51naNE/p3Vfxv43ZVGVcfNx6G5cjw0a9j7MtJ7M1M9I
 9mrOAT36JdkookQTFO9JB/ZPqchvewoDCoPIzbTYE1Tf7QtA0zT1RL44qTWXk/XcaMPV5RAxPZ7
 Dqh6kht5pVZLX8SgFZewYFMSTuGJa90xzux9FKjW6PePw+qWyG8Iv00TuZc03RLK11svyL32xQv
 9ua/zIO3F2Um2xuPA6tBy/KXkS0pvAb09A9vkKFAAt5q/C4epJa44ZjVbPhP6Sz8mU2LoQtJ
X-Authority-Analysis: v=2.4 cv=L4kdQ/T8 c=1 sm=1 tr=0 ts=685d55cc cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=5DgsPlyoPy4ad_e3mXsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: Og_m3qlGCTO0ZL60DgAHh4dwk_JXgT4-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_06,2025-06-26_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 bulkscore=0 clxscore=1015 suspectscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 phishscore=0 mlxlogscore=999 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506260120

On 6/26/25 1:39 PM, Kamal Wadhwa wrote:
> Hi Konrad,
> 
> On Mon, Jun 23, 2025 at 4:53 PM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>>
>> On 6/20/25 5:29 PM, Kamal Wadhwa wrote:
>>> Voltage regulator 'vreg_l6n_3p3' max-microvolt prop is currently
>>> configured at 3304000uV in different sm8550 board files. However this
>>> is not a valid voltage value for 'pmic5_pldo502ln' type voltage
>>> regulators.
>>>
>>> Check below the max value(3200mV) in the regulator summary for min/max
>>> used as 2800mV/3304mV in DT:-
>>>
>>> logs:
>>>
>>> [    0.294781] vreg_l6n_3p3: Setting 2800000-3304000uV
>>>
>>> regulator summary:
>>>
>>> regulator     use open bypass  opmode   voltage current  min     max
>>> ---------------------------------------------------------------------
>>> ..
>>> vreg_l6n_3p3   0    0    0     normal   2800mV   0mA  2800mV  3200mV
>>> ..
>>>
>>> Correct the min/max value to 3200000uV, as that is the closest valid
>>> value to 3.3V and Hardware team has also confirmed that its good to
>>> support the consumers(camera sensors) of this regulator.
>>>
>>> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
>>> Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
>>> ---
>>
>> FWIW it seems like 3.312v (which is slightly above the previous
>> value) is also supported:
>>
>> static const struct rpmh_vreg_hw_data pmic5_pldo502ln = {
>>         .regulator_type = VRM,
>>         .ops = &rpmh_regulator_vrm_ops,
>>         .voltage_ranges = (struct linear_range[]) {
>>                 REGULATOR_LINEAR_RANGE(1800000, 0,  2,  200000),
>>                 REGULATOR_LINEAR_RANGE(2608000, 3,  28, 16000),
>>                 REGULATOR_LINEAR_RANGE(3104000, 29, 30, 96000),
>>                 REGULATOR_LINEAR_RANGE(3312000, 31, 31, 0),
>>         },
>>         .n_linear_ranges = 4,
>>         .n_voltages = 32,
>>         .pmic_mode_map = pmic_mode_map_pmic5_ldo_hpm,
>>         .of_map_mode = rpmh_regulator_pmic4_ldo_of_map_mode,
>> };
> 
> Yes, originally I was planning to share the change for 3304mV -> 3312mV.
> However, while testing, I realized that I would also need changes in
> firmware( to allow for a 3312mV max limit). so during internal discussion
> it was clarified that all the consumers on L6N can work fine with 3.2v.
> 
> 
>>
>> but if the hw folks say we can do with the lower value, it's probably
>> even better
> 
> Yes. Thanks for affirming.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

