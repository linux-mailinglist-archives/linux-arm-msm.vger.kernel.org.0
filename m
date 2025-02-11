Return-Path: <linux-arm-msm+bounces-47579-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 78FE3A30C77
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 14:07:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 331E13A5E3A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 13:07:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B1CA1F152B;
	Tue, 11 Feb 2025 13:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oi5FWt4R"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 918E01FCFF3
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Feb 2025 13:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739279266; cv=none; b=THlAO4FqdpY5GHwRlyEd8qfDRDm4OnmCKzsXNPzQeXnOrDbq/z+g8QYB4MRc8uvny7Sb0SWAlXLJUJH6uanbFclvJfoqRwnfgOVqCdqUvNaZAQId2jJ5tQgwp744NKzlA0drBl9cYRnw7RfEXXJJQW1uzfIuxMAAYRGBPkJF5B0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739279266; c=relaxed/simple;
	bh=ugClV3eeqzKYRN5PsMUBkSZ3OrzpNqr4jdCip1GqpLY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JjRVtFsCwDtDknW2XMtDKkxxP/fGZdd5fAVdj9sAFSIi8jx9x+1Pwwz89GnRrzXMGhwS1lxIbzEj9Ekwsd1PD06Vj/HMDt4kHY5Vb00uQ2fAuTLtNEguXDc2BsC+JtpCICatn56n+j06z57JtrNhBFQoPCGE30mFPJZJGfCpZFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oi5FWt4R; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51BAB9iP023543
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Feb 2025 13:07:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bsqyhUimndYfhqr19Fi/0ypW4Gx9BRnINfl1VKPK4yk=; b=oi5FWt4Rjsn56DnX
	p7COLY6W2VIycp1i6bqXzsdKObkrzE3Lj6qRF66LeyRBj/QvSs+ZrXUuuuVqULmR
	sdHKFQzch/SkzsOCx+YwhgdF+Qn8f4qK39aBToV3qmTbdNZkqNlKhCWVbJPEvZoA
	kBANVCNwWaF2lL6ri3VnNBf1v/GcMqbTy+DKuIfUrZNqgKzlzy769VfYahCbe52B
	aimCTA7eKQxSO86PyuFJOpi+zc7jC0J3Fx/GRLvN2wMeSYmnib5i3kKI+bKRj7G9
	EK76X0dfgW87SCAzE6Gub3Xx0ZEslhz0zGydgsnY50LweGi3WV1efqeGPF08qqSK
	bBxKvg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44p0guytcx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Feb 2025 13:07:42 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-471921f2436so2308601cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Feb 2025 05:07:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739279262; x=1739884062;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bsqyhUimndYfhqr19Fi/0ypW4Gx9BRnINfl1VKPK4yk=;
        b=I12kx/haGVbBuyVaof0Zjseghb4r5SCkOsLXc0zS43ZCP5QOjlhE/2r7UzIjqkRAVR
         4nqDS+9+tS6R2/gfOeog+wokLaHZFaAoyjOyjasZ6z0Wxl2RqDgtRu0dJI2cRvzfVFPb
         g9zOgC/6Gi5JP9OQghqJHiHImzduMUAbKw9PeJaqqxCYForWNJi1qFaeUKY2Ki9pDcD8
         TFeU+yqj8jqUXWFYtAEW01tlTkCdA8CYE75vAUa9O8k4tdAoR+BCOGCVXtEqmzXOy0zJ
         BbXgw0WQBQPRJjna+9DBJsScGBBqbnR04pb92GYgmwb2SEc3O8IlrmkVY/pyaCwKxL3i
         DgSg==
X-Gm-Message-State: AOJu0YxiZpk+H8Pb4jLbuOL4VnG4f6nNbBHpyeycXcBHjEDbC1TSiSoM
	e7zSB9XBvuiaUrYtSvM2pUrfP1Gx/5aKB5vdOo33FUMTmxrz5vOkS7iUshoD9xfDItr9BlyvuLD
	yLbX0kQ6Eq6b+fLrWhzyFGPG+yQXJS2gogBcqK+aRkXeW8Q04eq7v5geg7jpdOfuM
X-Gm-Gg: ASbGncvMUOytzHENgCiDObJ8mhceqVoadfyiz4sn8TZQTb8WMoLUl5CalRvNdXr1CuZ
	ry2Ufoy/lUpb7v/BwbU5O81JeGXhMd5q+fv1kllLAWJ3WeC9xYQx4M1XRwzq6+I0kFPh0da7g/D
	njSyh3fRhbRZ+QiHDZD9YORPMYWWXPLMyJw32nv1T/3k2pi2TqEQTcRlu4BxrcGKKKlcN5MBacM
	iDPwP1ugzSNenMQrD+cBIMGI8mo2pIwcco0WtV6N2dFVuxhd7+YLomXoJ8OgJYBNvhPa8qLXrBE
	Y7ALagJQlJqw+A/lAx2iyweN86x3nEHloj05LcAkl3v9EkGfdPb+bENpx98=
X-Received: by 2002:ac8:7e95:0:b0:46e:12fc:6c83 with SMTP id d75a77b69052e-471a38cd930mr11392281cf.0.1739279261997;
        Tue, 11 Feb 2025 05:07:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFf17TQcGeLggmbsVGrZz0dN+r0rFljR1fT9i8V4oZgVqeg6eTmzd49LgDFHMPdGNR01MCE3A==
X-Received: by 2002:ac8:7e95:0:b0:46e:12fc:6c83 with SMTP id d75a77b69052e-471a38cd930mr11392051cf.0.1739279261615;
        Tue, 11 Feb 2025 05:07:41 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5de58404347sm7153814a12.9.2025.02.11.05.07.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2025 05:07:41 -0800 (PST)
Message-ID: <dad5bf75-d8ae-478e-8215-7d89db793dd7@oss.qualcomm.com>
Date: Tue, 11 Feb 2025 14:07:36 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] arm64: dts: qcom: sm8550: add missing cpu-cfg
 interconnect path in the mdss node
To: neil.armstrong@linaro.org, Konrad Dybcio
 <konrad.dybcio@oss.qualcomm.com>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250210-topic-sm8x50-mdss-interconnect-bindings-fix-v3-0-54c96a9d2b7f@linaro.org>
 <20250210-topic-sm8x50-mdss-interconnect-bindings-fix-v3-3-54c96a9d2b7f@linaro.org>
 <a3f7bef6-bfc8-4a2e-b979-4aac7908306f@oss.qualcomm.com>
 <fcde9fab-b28a-4e09-b77b-f7c6c3840710@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <fcde9fab-b28a-4e09-b77b-f7c6c3840710@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: O5NWHocwxqNplY8INdpP-wsLaeqmozR9
X-Proofpoint-GUID: O5NWHocwxqNplY8INdpP-wsLaeqmozR9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-11_05,2025-02-11_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0
 clxscore=1015 adultscore=0 bulkscore=0 mlxscore=0 spamscore=0
 mlxlogscore=999 priorityscore=1501 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2501170000 definitions=main-2502110086

On 11.02.2025 10:07 AM, Neil Armstrong wrote:
> On 10/02/2025 17:32, Konrad Dybcio wrote:
>> On 10.02.2025 10:32 AM, Neil Armstrong wrote:
>>> The bindings requires the mdp0-mem and the cpu-cfg interconnect path,
>>> add the missing cpu-cfg path to fix the dtbs check error.
>>>
>>> Fixes: b8591df49cde ("arm64: dts: qcom: sm8550: correct MDSS interconnects")
>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>> ---
>>>   arch/arm64/boot/dts/qcom/sm8550.dtsi | 5 +++--
>>>   1 file changed, 3 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
>>> index eac8de4005d82f246bc50f64f09515631d895c99..702b55296b18ff2f8ea62a3391b7de2804aa9f65 100644
>>> --- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
>>> @@ -3020,8 +3020,9 @@ mdss: display-subsystem@ae00000 {
>>>                 power-domains = <&dispcc MDSS_GDSC>;
>>>   -            interconnects = <&mmss_noc MASTER_MDP 0 &mc_virt SLAVE_EBI1 0>;
>>> -            interconnect-names = "mdp0-mem";
>>> +            interconnects = <&mmss_noc MASTER_MDP 0 &mc_virt SLAVE_EBI1 0>,
>>
>> QCOM_ICC_TAG_ALWAYS
>>
>>> +                    <&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_DISPLAY_CFG 0>;
>>
>> QCOM_ICC_TAG_ACTIVE_ONLY
>>
>> w that
> 
> So it depends how it articulates with https://lore.kernel.org/all/20250115-topic-sm8x50-upstream-dt-icc-update-v1-0-eaa8b10e2af7@linaro.org/
> 
> I can rebase on top of it, it would be simpler, but then the Fixes tag won't work anymore.

The fixes tag is there for human eyes, autoselection for backports has
always been iffy with DT

Konrad

