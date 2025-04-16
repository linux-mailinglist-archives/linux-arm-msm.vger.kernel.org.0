Return-Path: <linux-arm-msm+bounces-54554-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 08E5EA90D39
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Apr 2025 22:40:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7A9C35A2284
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Apr 2025 20:39:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9705231A2B;
	Wed, 16 Apr 2025 20:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DpwLEau3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FA2722FDE4
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Apr 2025 20:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744836003; cv=none; b=hCs0Y1CGh2/4wCBerKDdeFqIeviUVh+4VwPN7TdGUYhy8Zl+9oImv6xg1a3E/K2ChyeVk9ir/MQwx5tvqdovCL6hfizQdbockPwEErSNx8bM/zwpKD2//QuzADwxRm8TdSCrU5oGk87JwC857sLc9J4rBNlLdUkt8cQLsyRvKK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744836003; c=relaxed/simple;
	bh=kDu+tIWiiv3RG9q2EWbYK6uCMzCFUTTLqRKVLC0mQKo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hH+Wi9kprOn9T/7FVcVt4Qy6KldNoeZ59Q9+4CoECLYxwUxoI/uO3WHldKHXs/DKbLhBV7VX/wMys2a24FHcU2jkggMzDKgWgGgxqQqvO+9UIVxQv0e4wzVRKse9yvzwiadNOC4JNxG6X1MOFir/6WlukEOSliQSmQztcGca7kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DpwLEau3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53G9mGdX020812
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Apr 2025 20:40:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kDu+tIWiiv3RG9q2EWbYK6uCMzCFUTTLqRKVLC0mQKo=; b=DpwLEau3Y+2DkDDL
	ps32G63sJlVwJ+6ZIG1FsHA4/Lf9gvmuju9s2ftVVke9aTTJgbxdMGcEqNlRdyrm
	JuCidCMnz+IxQbVu0b8ol00Bcg+vXY4HBmC5rpBoUtSJmd9eRETmMJsfPug5UTRl
	DDo5pzRE4mVhbHhfuJLtL5SWfzgi/T0Zy9GLlVSBS9EgFZm1iaceMOTwlY37RjGc
	RtsBJNsOLdFaF9xhCGMP7a2hv+OtYDB67xR8aSejmYLhnom4kyKRbTsk/OIDy9yx
	1vuYV8eyNzjmAEW/d+CeDkWn+8DlUF3z+jEZsliRiy69HgGzz2F1ndr6wfqXv5Uk
	ZDudgw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yg8wmrsr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Apr 2025 20:40:00 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c547ab8273so270785a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Apr 2025 13:40:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744835999; x=1745440799;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kDu+tIWiiv3RG9q2EWbYK6uCMzCFUTTLqRKVLC0mQKo=;
        b=X9akY0T2ziFoiWGwPlJnGwOFhU3SHr6UV/F9hSQzJfFvZVC1D5lDchGqGuz/adru6Q
         1FNRzI7ELSLMGBfLTuVi6q8z3p/Vz3gHuCC0pknMOUXTDoXizziJqNksFQ5E7DB043nj
         r25gVfEiPo5VTWOvqfFSCvomnHXAjE1ac1+SURDqwqL4MjtvbGvd6Q4X6arbEiIz9ok8
         +imeMRU+2l4LTXbFd/tkgOieYK6RDVexv+p5i3ZHaHM8fkiG+tbTqVBdy9lcNTn8f+u4
         E2+rFAfDJTvY4/0QXFaVQ5p7QcNxEgROHduEu8/Fc4G5KnN0VoQrzhi1pTIk8zCmcozB
         raMA==
X-Forwarded-Encrypted: i=1; AJvYcCU7Ky2vnXw19p22yvbdOHh2aPd8Btpfbmuidd6d36k2x58DMDdVYMdfqvFCrQskFhw6/Z6Kip1fTs5MWkEe@vger.kernel.org
X-Gm-Message-State: AOJu0Yz30DtvdMgWRtpdDXqlTnXS0PF3VRnwbEmAPlLxZ7+LTZ13jeg2
	FQC1Qey6iF8fnpEqh4UrXrlSgIPN+Bd63SHX6oWZ/Ma29IY1IkTUfBndWlnRv/Ib1cGESffVjK3
	kazJwCgaad4NyMipHszk2OfLZGZzW9ryhJeIXfOvkDNCycMm8L8/egvlZrUW93clG
X-Gm-Gg: ASbGncumwQFd2H5B8NfMtPVVF0k7fGBcQeKpFq1ONip/RvNmZ5TSnFC1tX9CzYY2+gY
	EwfYigdTXT9SWGVBQLv13dVorrxK3DBxQmLBWGZ3xUL8QP8S6FUl/bHiS9q4SpeIK5aZ35ZYC8G
	F0EDJOGvjE+/zqHaEMhV3fTVj3aHkTdciKGWQBdVSZEoo57Qn6NwoGatYQ+2f+LTpo0VpgbJ+ZH
	lxCVSr+Vr8S594WlDUSjvL67hDuftmtaPe8CA6q0VQZwM6vsBuXkEfoaXCImC8ymovQKLs4dG4/
	d1his4gxChgXG/fsbf8WE1DdZv6WxJPq3EJtvMVEzB8cPTRieD/ATwdfiSbQSRImmkc=
X-Received: by 2002:a05:620a:288d:b0:7c3:dd6d:54e4 with SMTP id af79cd13be357-7c91d0602ebmr62124585a.10.1744835999360;
        Wed, 16 Apr 2025 13:39:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGzgDHx0UMfpo23gp5XKth2J0840BeS/rB+zsXeevtnGVzubmJ5n0ka+mRD1Wk7yKLA+/G4gQ==
X-Received: by 2002:a05:620a:288d:b0:7c3:dd6d:54e4 with SMTP id af79cd13be357-7c91d0602ebmr62122985a.10.1744835998836;
        Wed, 16 Apr 2025 13:39:58 -0700 (PDT)
Received: from [192.168.65.126] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb3cd618ebsm186163466b.16.2025.04.16.13.39.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Apr 2025 13:39:58 -0700 (PDT)
Message-ID: <b9fd463b-5a34-4c3b-a6e8-7432e1a0f2c6@oss.qualcomm.com>
Date: Wed, 16 Apr 2025 22:39:54 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/6] arm64: dts: qcom: Add initial support for MSM8937
To: barnabas.czeman@mainlining.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        =?UTF-8?Q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>,
        Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        iommu@lists.linux.dev, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, linux@mainlining.org,
        Dang Huynh <danct12@riseup.net>
References: <20250315-msm8937-v4-0-1f132e870a49@mainlining.org>
 <20250315-msm8937-v4-4-1f132e870a49@mainlining.org>
 <f85195a1-f55e-41ea-967d-b758014cba06@oss.qualcomm.com>
 <ddf29d5743e25f311cd86711f39f7ad0@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <ddf29d5743e25f311cd86711f39f7ad0@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=E9TNpbdl c=1 sm=1 tr=0 ts=680015a0 cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=OuZLqq7tAAAA:8 a=bBqXziUQAAAA:8 a=KIKYxIlc2-mGyxiTgOQA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=AKGiAy9iJ-JzxKVHQNES:22 a=BjKv_IHbNJvPKzgot4uq:22
X-Proofpoint-ORIG-GUID: 7mFnCdr1fjlxSIiaRmEKEQl3dVDzXEew
X-Proofpoint-GUID: 7mFnCdr1fjlxSIiaRmEKEQl3dVDzXEew
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-16_08,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 mlxscore=0 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 suspectscore=0 mlxlogscore=849 spamscore=0 priorityscore=1501
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504160168

On 4/16/25 10:33 PM, barnabas.czeman@mainlining.org wrote:
> On 2025-04-14 22:55, Konrad Dybcio wrote:
>> On 3/15/25 3:57 PM, Barnabás Czémán wrote:
>>> From: Dang Huynh <danct12@riseup.net>
>>>
>>> Add initial support for MSM8937 SoC.
>>>
>>> Signed-off-by: Dang Huynh <danct12@riseup.net>
>>> Co-developed-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
>>> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
>>> ---

[...]

>>> +    thermal_zones: thermal-zones {
>>> +        aoss-thermal {
>>> +            polling-delay-passive = <250>;
>>
>> There are no passive trip points> +
> Should i remove polling-delay-passive?

yes, please do

>>> +            thermal-sensors = <&tsens 0>;
>>> +
>>> +            trips {
>>> +                aoss_alert0: trip-point0 {
>>> +                    temperature = <85000>;
>>> +                    hysteresis = <2000>;
>>> +                    type = "hot";
>>> +                };
>>
>> Please convert these to 'critical' instead
>>
>> [...]
>>
>>> +        cpuss1-thermal {
>>> +            polling-delay-passive = <250>;
>>
>> You can drop polling-delay-passive under CPU tzones, as threshold
>> crossing is interrupt-driven
> Should I remove polling-delay-passive then?

yeah

Konrad

