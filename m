Return-Path: <linux-arm-msm+bounces-65023-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C6F5B0582B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 12:50:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D70171C21C3F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 10:51:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0788D204F73;
	Tue, 15 Jul 2025 10:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NJLk4v5Q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9521F2701A3
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 10:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752576651; cv=none; b=ohCkCWXfKmH7rm8as8uRITS2kkLyA4a1rZr0/Ba9niDpk755Ud8FHXAPIW8vVbYkPhgFZswfQdx8lbFykyvIjFY/xNi+xV32AvwMIbQNqS3KwPWFxV+p+LQO0AnfJY4TvxXLRDMOue7eMoozz+1GZ8dqry2kLCXv/Ce3GHZ95m8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752576651; c=relaxed/simple;
	bh=zO0eVT6bY/HaDWcD10xtv9wGIJ8Et313GZFZC4fkQfA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Tpkb/PEn2d4gYuiAJj8uqAaS67n4GKvWRzOyjf5Zh3QUfnOo8NCSU8W3hknkPzXDT9qONZIdqnJnPsM4qKmHGhPKdqmW5AyNljNXyo8BttzutrB4+NBKFhFnSyBw0DBBikMsPsCMPfjUlM8SCA5mRy0vVj9qV6WuxXM/xDl2AUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NJLk4v5Q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56FAl44D010291
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 10:50:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ir9keSX1LMez33Upmie3bS45n+OlybH6S/naM0ST3/w=; b=NJLk4v5QXZqJpg9A
	WyTZ0BP4zBwdehPY9BrRrvm7GMu9TAEPR1KcHVPB8TyzfgOHeqqWx0EIVBu0bGY1
	eRGGUpkLXj+klDomOlu4RicL6KqNelcEe+gMsDA8fe0WbTtG81AVwY1WmsCZHaHX
	Hx4JRUsQ2e1d8kLn/SIUxBHhxbOqZ5Dole17xyuWRU+ThLARQj+OGqFcz8/9a5PF
	m030ROwbXF6EuNgo3IlvStpmdmr42wX00h0Hfm8IuC7gywoGf6CWDa50RLMSyx6L
	G7xQumzyZmhRsG/aPS2TdYvcfstZrgaiyJGURCg3ARSKK4skUd5iurN1i+6v8XqI
	YFNXQQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47wnh5r08x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 10:50:49 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ab65611676so3875451cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 03:50:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752576648; x=1753181448;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ir9keSX1LMez33Upmie3bS45n+OlybH6S/naM0ST3/w=;
        b=FeCLbX3Xe9sElUUswIFhEJzY2MHpaasG21m+s3yrhaG2S9vAt2BDJNWnxElEfU+Mqq
         Thf5QcElTJJAuM1Ao/H5MnlVN1SukquRhWnxgRCa9i3PwYiqDh+putnrXbhJCuT5B2iG
         z6sOTiSANQ8MA610GyrQaTHHMrAkBEwLVCDFmjoNpLjzBw0xvQapC9Rq2ZWo0Bg5cQPi
         1eBYeCRtU9LBeetuWKXEdSLkCY3tXuChsBStyGgG5xEa79IHapViGr0vN+S+bpzjdklZ
         n+9yB3zhyrwRINl5gf7P5olPgaqMjrSEM6tQc4feqUFZUjVUDwanf1k+UHz4jOHeTbM7
         o0Jw==
X-Gm-Message-State: AOJu0YwMlRlSUy1fMF+PHTIz9mrUUOBJRWaUFIB8LmoEG+3bUxEAZImy
	Sh0mTOnCvw9EVj35U23n7Uv8IMuA+teloXRLQaY5koDYnKqhSyuP01dDyqaWp00p65nmgQeBrha
	XmhUDGxHRjED7+/iyfkxiZxj8aI2bbCvIxk9aMK9GJ3A/cCs1vnlKJli99nZH6d8gmtMc9qI6Xs
	r8
X-Gm-Gg: ASbGncuwcOwY+WfuY/aIM0s1LQt9Gg1iTY2b0RPZC6YETLzjtaVGwp0VguCE9fTZ/Or
	OzAEyRqxQThI3/KRjeC6sIH+bZdHHE28xlkAamryxfz/qbFA1rLHXSBZdEmgSziG7pwgw+qi2Av
	iiRGXtJeCoVhLBHbz41/4j8CLmwpXD3G53XVR8g0Unq5f76JQzpDDOdOmfGLKcfb1mZtEiooGIy
	2ATCc8T8vzM7w1S2MtS0ZUbXpVOvo6zuEVI/F3LLUDVEdDjyIx2K5LnerfNRxR57HlYmXK9rL4z
	zfm3aC9wNS9WKQWSW3tGEQnySRUmBJheQqkKVu+HL9aQoWoX3wX/23nrl3Vc52b3RFyu7UAxns6
	8sFLUkmHTEZfiEgjtTaGt
X-Received: by 2002:a05:622a:1495:b0:4ab:8107:6c0f with SMTP id d75a77b69052e-4ab86fc5d66mr6516301cf.10.1752576647873;
        Tue, 15 Jul 2025 03:50:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGrHzbQnSG5UsPwzEKOplY0S2bhAFx47Y1I/loi9Sna7ftnlRubhy2cMFHCBtRP+hsTx5xo7Q==
X-Received: by 2002:a05:622a:1495:b0:4ab:8107:6c0f with SMTP id d75a77b69052e-4ab86fc5d66mr6516121cf.10.1752576647271;
        Tue, 15 Jul 2025 03:50:47 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e82e5309sm991511666b.173.2025.07.15.03.50.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Jul 2025 03:50:46 -0700 (PDT)
Message-ID: <4be1ebb7-1dc7-49e0-aa5d-621f023b3853@oss.qualcomm.com>
Date: Tue, 15 Jul 2025 12:50:44 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 1/3] arm64: dts: qcom: sm8750: Add Iris VPU v3.5
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250714-b4-sm8750-iris-dts-v1-0-93629b246d2e@linaro.org>
 <20250714-b4-sm8750-iris-dts-v1-1-93629b246d2e@linaro.org>
 <5dd36649-821c-450e-bdcc-871735d10059@linaro.org>
 <15b8b9e0-a211-4102-9b68-994c8ab50a7a@linaro.org>
 <b5a68138-4eca-4bdd-8f72-d80236b02c0a@oss.qualcomm.com>
 <ec0f64c3-bd08-4944-817e-f5f67c317b94@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <ec0f64c3-bd08-4944-817e-f5f67c317b94@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=dKimmPZb c=1 sm=1 tr=0 ts=68763289 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=KBVr0NYvNlN9pVTpkDkA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: QiwEM724Wkd7BLSaXLDZGfc37Usy9h9r
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDA5OCBTYWx0ZWRfX/Rtl4WAQZ3U2
 HNFjOkAukIJaKoADqOsrpWTI0R+h8diKBnzHPSaokUkUc6MuwRfkmxp/Ppdk2CAxvl1xRZJsZoI
 y4/w5iBebrW7j9B2e+n7yAYtdrfLg7ZOVnVRgEBeMMb8Yt2wKnaimPgAUb+UbKkHV1+npL2bsNb
 /LNEPlmkbuymy290RlQgo+xMe2Iv+xYet8SKbAL3kK53SIF9a9DO9FtQbtIdAwRLfqe1Ny14EY6
 ML26g/Ewujdgiez7lccSbzhXQJ7pG2lX9Wq/WdF3A3HjaEmUrfo95OOLSKG1S8miXxjWSyCd0gY
 7blCuTYhxv6FDH0l84jr05bUhnTx3p7nMeWSYnE3dqU4UjVT3G/RbEK64E6R1TYCAbRsPY7y4ZE
 QIDiDZwVngKj7OwocyLhyxpnHNCummqb5Krq7AP2Sum0FfpXJw7b7vKhZiOhDMV6nFWqkkHh
X-Proofpoint-ORIG-GUID: QiwEM724Wkd7BLSaXLDZGfc37Usy9h9r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-15_01,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 mlxlogscore=999 mlxscore=0 spamscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 phishscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507150098

On 7/15/25 12:34 PM, Krzysztof Kozlowski wrote:
> On 15/07/2025 12:09, Konrad Dybcio wrote:
>> On 7/15/25 12:07 PM, Krzysztof Kozlowski wrote:
>>> On 15/07/2025 11:32, Krzysztof Kozlowski wrote:
>>>> On 14/07/2025 15:55, Krzysztof Kozlowski wrote:
>>>>> +
>>>>> +		videocc: clock-controller@aaf0000 {
>>>>> +			compatible = "qcom,sm8750-videocc";
>>>>> +			reg = <0x0 0x0aaf0000 0x0 0x10000>;
>>>>> +			clocks = <&bi_tcxo_div2>,
>>>>> +				 <&gcc GCC_VIDEO_AHB_CLK>;
>>>>> +			power-domains = <&rpmhpd RPMHPD_MMCX>;
>>>>
>>>> This is incomplete, need second power domain and I did not check against
>>>> qcom,sm8750-videocc schema before sending. I will send a v2 a bit later
>>>> (maybe some reviews pop up).
>>>
>>> Heh, no. The DTS here is correct. The videocc bindings are not correct
>>> (and that's not my patch).
>>
>> Well, you want two power domains here in either case..
> Are you sure? My point was one is correct and downstream confirms that
> in their bindings (which is a poor argument, I know). Which one would be
> the second? MM? We don't have such...

Historically clock controllers used a pair of CX/MX, with CX powering
the "meat" and MX powering the PLLs (& retention logic, IIUC).
Over time, CX was split into multiple usecase-specific domains (like
GFX), and we now have MMCX (or MM_CX - multimedia CX) for multimedia
hw specifically

In the downstream tree you're looking at, sun-regulators.dtsi aliases
VDD_MMCX_LEVEL as VDD_MM_LEVEL for $reasons, which is admittedly a
little confusing

MX has similarly been split into MXA (MX-Always [on]) and MXC
(MX-Collapsible). For Venus, you want the latter, as the hardware is
not crucial to the functioning of the SoC (the connection is of course
physically determined at SoC design stage, but it's a good heuristic
to keep in mind).

Konrad

