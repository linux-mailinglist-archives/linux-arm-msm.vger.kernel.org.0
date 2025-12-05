Return-Path: <linux-arm-msm+bounces-84440-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id A23CACA7285
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Dec 2025 11:29:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 180D93014AB0
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Dec 2025 10:29:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67209315D40;
	Fri,  5 Dec 2025 10:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kxcX5H4y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Buw22ZK3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0674C303A1B
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Dec 2025 10:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764930566; cv=none; b=GYy4bH8OG8hYenp1/i/F7AJtrOaEMlgcZiKpqKgR1I3qHilpE9vgMA7HNUOgwR0WvCSOlneRq01JHbeu0DgVxc9va7OlX4Ew0Me8yyzQA/ZQkZNZS0DpFQdgrTrVMHjkrYmn9zZ5obPa5MaRbBGh1N10yvRva3TAE5BIIzNCVoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764930566; c=relaxed/simple;
	bh=1dM26NOpLL0YqZsN8uN70qJ9hPUmIuwB+9D1WAms06U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RXKxtUWhH728IHIXvlhQSJtN9cB4pG/h0uKlfTPkH/TGpeLxS+uVTKWHRL8ANhT2rzaDOKhmQX9GRm8qmH870kL/m+0v/sH69ruzt2W1IpjXuw4SZ4yQabOUYElqOss+E3B7/0EL4LuQYe2LOp3s2HgdlSE+edkLO4k0cNuuzhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kxcX5H4y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Buw22ZK3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B58rTjW2896646
	for <linux-arm-msm@vger.kernel.org>; Fri, 5 Dec 2025 10:29:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T+P9UihzOlxTBT4XtK2QWIlMPWzgt0UAZU+mnK6obDw=; b=kxcX5H4ywgSX9OBY
	QH0Tob7BhgQrSNpKOE10iCo30tGUGekHrB4z4ilYFsMy54VaVx4wZyJ+TSRbGa3h
	RzhPMRvNf8FS3ZLxeAQbvomHIleBpKgxjMHk/Xbb+6rddAcVz8MTRzPcoLoxNjzP
	KE3kn2G9vDkW8tsBVV062h9MSCwEGtfAgp4KGiv7OZDKo7I+0rgQ1Svj1dH67cdL
	jnpkgW0Nl2baxSxO/4aCvwoLrVXSNTYAO/9BSDgzNNPUpF5H2pe4kZNC2zwP/Aow
	p+i53KvxELwPQuC/+Lhcxdfo34yW3NXj5qZDS+qCRSfcMq2dPjMt0yE2R7R9fbLC
	obnXRA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aukmj1mxh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 05 Dec 2025 10:29:18 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-297e66542afso49366175ad.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Dec 2025 02:29:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764930557; x=1765535357; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T+P9UihzOlxTBT4XtK2QWIlMPWzgt0UAZU+mnK6obDw=;
        b=Buw22ZK3w0jiMo2BqXd/oy31S2jD0BNfe/H/dD7PevQfzbUFDk+cK7aLABuzrbS/Tm
         S7K6Kh/OSRl0ly+22aeUZQcThZDabKrV2vOBQSJPaSWc+SHGthH/OPf8Q240AUgilEsH
         0pbQtE7rL5+z75DYcoD4KvCLobtoLniB0W+VCC5KY3vZNuuSJnpnV2kMXjwCV9RlGhE9
         Qr+lskuYkD59w91VYZnt1n4zKsR+T4l0dCfM4Pfu4P7HpG8FVcRD8RR25Iv/xhT5d8ht
         rDYPpQVCslTKOEtcnFOa+uDJJfSFJ8IJttHcMFlFWTzHnPf78AVkNhHx13b2lezUg8v8
         eHzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764930557; x=1765535357;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T+P9UihzOlxTBT4XtK2QWIlMPWzgt0UAZU+mnK6obDw=;
        b=soaipVLkzB8xL2umcIl4EsneglHbasyOWe6qFHUFIItWdqqk8SYIaAYXLiuV/7Twl+
         ro/b1nxO663vFWt2zvLje1QMpNFBUwkjF4DPP0adHDKNkNVh5yoDxdcq0D06wjyjQR8n
         ba+jgQabbk8O4jmzmmNHmt1clYkmYmF6a9hTDMz0XRhloTTdOhXCyvOlyKurxA01qSBI
         vzBFWA/yHTV0/97oYowOStT3kWSZmegyarw/8MRBERKPhShN3fn/60U741STOcuFJEwr
         xw0IHzQRwneNQ1iEz8wc2ayI3GqcI9u7KFJshIjO5KlRA69kmVdb2HJFQaA9uhlXZH6d
         Lk3Q==
X-Forwarded-Encrypted: i=1; AJvYcCVXUDSH7B4nn6xQQMMZYRVgNSteqlcxrKU8Ufb0QgXvgzcoFTGFvFaLFoaLYW3s/SBWIwv7SVYDXR1o5dYY@vger.kernel.org
X-Gm-Message-State: AOJu0YzzPVtkjVkGsN5qi+6KsFGeTDXZIA96JXiRvFAmpZiX5VaRQsdb
	gwWkKuStAAKiSvjEN5pUYxVzVxOS+G67ES79WYzgy77QRvtkZePbdMBSnOUq+Ym8bhK1tjzHbEx
	w2E8lwhE2UVfyvxXAP2Y+pNL7baAPGzxHToblzb4p9j7LAeJv5eEznekreYKwei6dpOuj
X-Gm-Gg: ASbGncv4RpqcN+PkSes0GwzyLRLzqub4PUhlDNyK9lB6oNMHxR9fHZksUmh1XB6Ntdc
	Ca0fIvW8VhljbSqSA0ZAPe9UviobkCIhzk9+m81G0zWMr/mOlrk8oWayZr4nSK0CfdjJxbhsuDU
	IYcP90xxMiqFPVU5yq68LBXe/8L1dRENtDoEPVpuCL8EBlyrsh5YQAhRLz14kC+LKwVqNoyvxsx
	Mzqbq3HvbUCEZI0+ampnPcdICbou2ldTkeyhkT/DkqiurIC3AkkASI4jaOPwFV3550hVnCAhN/A
	amznydVWf5IjofxJ7mcQ9yiDI/fSfcStA8B+RNy2cJR9mdDfTcSUpDMTInLpTtFz5nnsWkeCtJt
	ZtyQcqqkBSTumP9s4yTjp96BrTKqDJO29Hg==
X-Received: by 2002:a17:902:eccb:b0:297:fc22:3ab2 with SMTP id d9443c01a7336-29da1ebb0bamr73863235ad.36.1764930557385;
        Fri, 05 Dec 2025 02:29:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFh7HpsBEyO6ilZG7nPGO6ymE5SmKKfCKSfDxDslOX7vJaR3rccD+YDhq2XPNdO+dSiRh2JWg==
X-Received: by 2002:a17:902:eccb:b0:297:fc22:3ab2 with SMTP id d9443c01a7336-29da1ebb0bamr73862905ad.36.1764930556932;
        Fri, 05 Dec 2025 02:29:16 -0800 (PST)
Received: from [192.168.1.4] ([106.222.235.197])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29dae99f6a9sm45456135ad.65.2025.12.05.02.29.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Dec 2025 02:29:16 -0800 (PST)
Message-ID: <90bc84e7-19ca-450d-b41f-fd96367e8cce@oss.qualcomm.com>
Date: Fri, 5 Dec 2025 15:59:09 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/6] arm64: dts: qcom: sm6150: Add gpu and rgmu nodes
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Dan Carpenter <dan.carpenter@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Zhang <quic_jiezh@quicinc.com>
References: <20251122-qcs615-spin-2-v3-0-9f4d4c87f51d@oss.qualcomm.com>
 <20251122-qcs615-spin-2-v3-5-9f4d4c87f51d@oss.qualcomm.com>
 <8560ad26-4756-4c2a-97c3-2c5c0695172c@oss.qualcomm.com>
 <z4gqro2bx6oq2ht75m2klogo5dsirb74tmc3u3shjyalxmaxil@5sy7ufmqhdgw>
 <6fa1da5d-9ea7-4d72-a03a-82edc4bef099@oss.qualcomm.com>
 <3gqq3w6ovy5srgvabyeugsjbwrhaxmjvicykhjmlcxd74gtsaf@5u6wvvzeq52z>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <3gqq3w6ovy5srgvabyeugsjbwrhaxmjvicykhjmlcxd74gtsaf@5u6wvvzeq52z>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=bYtmkePB c=1 sm=1 tr=0 ts=6932b3fe cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=jBSxni06C9HboLYAjQ55wg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=PFMJV2I6qJKDnvYOCoAA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: NmpvMbAbTEa_vUoFXCniwtdnJG1OkSsu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA1MDA3NiBTYWx0ZWRfX4SkZlSIiRcp0
 fJEG6B76p04EZVK3mSx3SqCze2YIjl0tXSaQq09cLmIkOsDlbCPktWnuoy/4mOMZ8D+CIw/jvD8
 kWrHFg5eUDxlygAnT7yoT6TGIufneY5KfRYihX1sz+oktvtttntyUeGMpB8lDXO4D6UPk78yLsm
 F7yj2XMKacJqCg82JPNmqiJvM2nSrdih9eQw+petFL1M4ty6u0fbXU3+qqigvJ1VIuDCSolzN26
 sAnOCTLMVCRrX4jClhjQqkLcHb1B2jzWmWA5t5CW/HNoRlmcpSRSwzhdqnzjN3G5vF1XcoKET/X
 Kngl4A37u76ThFzHSdQ3S7cRExN8U7IghW0Qtx/wtCulY/4q9gvJdt8OGBmevl4PgYFyOUFexUU
 NAu8FPlN1y+3ihyhH3QVnpBTlvCvHA==
X-Proofpoint-GUID: NmpvMbAbTEa_vUoFXCniwtdnJG1OkSsu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-05_03,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512050076

On 12/4/2025 7:49 PM, Dmitry Baryshkov wrote:
> On Thu, Dec 04, 2025 at 03:43:33PM +0530, Akhil P Oommen wrote:
>> On 11/26/2025 6:12 AM, Dmitry Baryshkov wrote:
>>> On Sat, Nov 22, 2025 at 03:03:10PM +0100, Konrad Dybcio wrote:
>>>> On 11/21/25 10:52 PM, Akhil P Oommen wrote:
>>>>> From: Jie Zhang <quic_jiezh@quicinc.com>
>>>>>
>>>>> Add gpu and rgmu nodes for qcs615 chipset.
>>>>>
>>>>> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
>>>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>>>> ---
>>>>
>>>> [...]
>>>>
>>>>> +			gpu_opp_table: opp-table {
>>>>> +				compatible = "operating-points-v2";
>>>>> +
>>>>> +				opp-845000000 {
>>>>> +					opp-hz = /bits/ 64 <845000000>;
>>>>> +					required-opps = <&rpmhpd_opp_turbo>;
>>>>> +					opp-peak-kBps = <7050000>;
>>>>> +				};
>>>>
>>>> I see another speed of 895 @ turbo_l1, perhaps that's for speedbins
>>>> or mobile parts specifically?
>>>
>>> msm-4.14 defines 7 speedbins for SM6150. Akhil, I don't see any of them
>>> here.
>>
>> The IoT/Auto variants have a different frequency plan compared to the
>> mobile variant. I reviewed the downstream code and this aligns with that
>> except the 290Mhz corner. We can remove that one.
>>
>> Here we are describing the IoT variant of Talos. So we can ignore the
>> speedbins from the mobile variant until that is supported.
> 
> No, we are describing just Talos, which hopefully covers both mobile and
> non-mobile platforms.

We cannot assume that.

Even if we assume that there is no variation in silicon, the firmware
(AOP, TZ, HYP etc) is different between mobile and IoT version. So it is
wise to use the configuration that is commercialized, especially when it
is power related.

-Akhil.

> 
> 


