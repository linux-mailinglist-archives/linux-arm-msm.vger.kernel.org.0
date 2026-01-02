Return-Path: <linux-arm-msm+bounces-87262-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 37927CEEB93
	for <lists+linux-arm-msm@lfdr.de>; Fri, 02 Jan 2026 15:03:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 03EF8300D15C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Jan 2026 14:03:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 360EC2F361F;
	Fri,  2 Jan 2026 14:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WetzUzC5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QEcDW1LZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDB9E30EF85
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 Jan 2026 14:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767362620; cv=none; b=bhNHktV50bqb6eX+HgNiWFYpIjXh+CT8hXX695OGfSiNu2xvRUIb4RIjRZIVIbs5LTdBqU4Bit4tqD0Nu7ZUcjVGBXKIMNIIcyOnx/71NoKHDhkF7zJM4DB/kLpjmXyrkPuV7C+dojJQ6POSFh+j9lFM2RWo3XN3frpjMucYR+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767362620; c=relaxed/simple;
	bh=kblJXqj0op6oKE5m5rMIchGutJ6dMpm8ylqprBBkXRU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eYgdBS/yXlAI4iRp0VGgg3A+7Dga4xQ+6Vt4Oem3oKXBFYo9MDE7Y9AvRsfGV156Vd3CeCSzbp0TNRiFylnIurr8lh5UkBZKJQNya8xGM/pAwef7VNUJ/LMVbq8rATXhc3sBxCQzLtMAmQMWMW8XkKMJb2BaD7K5VZY0pm5vb80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WetzUzC5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QEcDW1LZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6029WjRt428111
	for <linux-arm-msm@vger.kernel.org>; Fri, 2 Jan 2026 14:03:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QLSpurV53aCYl7zCbTN3/EL3fFQhgyYTGB5+YvXf8cU=; b=WetzUzC5FleQrVrb
	N8Gzb+YkUGZuvEg1xOLEubmdWLeXlEyvau+cib7O1rnqBnVi8grXifq2+ddNdIQ7
	Ak/Joix3HayE7SbPuDQZ4+swpydG9cR90lvCntruc7+hWrazFd1h3HaQfbYj+sHq
	pXAsyQtx+/irPQmEjmCJEYOuKwmgxlFXYBnct0iUEBdXxJ/lJRii42cGAGysDXe4
	aaWQl1vUYaTuTNj8KhLoEsox/Iz28YZJ6uqfy/WaoQU/vEkjc8G0EJQUHQkkBKle
	sQtEWw3PnMKHza7R2+ouPqPJ6D2+4QlnCUydC8mLzynalPIkiSVQUVuojXZRl2s3
	xiHWSQ==
Received: from mail-yx1-f70.google.com (mail-yx1-f70.google.com [74.125.224.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4be6fjs338-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 02 Jan 2026 14:03:38 +0000 (GMT)
Received: by mail-yx1-f70.google.com with SMTP id 956f58d0204a3-640cc3f5e75so4359061d50.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Jan 2026 06:03:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767362617; x=1767967417; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QLSpurV53aCYl7zCbTN3/EL3fFQhgyYTGB5+YvXf8cU=;
        b=QEcDW1LZeBYYWnHBYxoqDOvSNogAA+sLFRLBMUhGeXM5Y/kDxipQ7anMd/MtKQ/oHq
         u4lhqC6GC1SXCZfQzE9y3oQM1vjyW16PQxLkst2214V1nPxwTh2raweBcPyH65XJFF51
         9HVdcUxq0+p1la3eAoFfVbPHglu4BGTxgENvtiodlBo1Q9KN9xnEDxg/6VZJYkZEq+/5
         Hhb0UNq4Lc3JCWwc9/SwzdADkMP3yt9R93hfDbH89M81RQhxFQsyjtsk2s+D4KQ6y8oL
         6X9+wEZGhLqYHNOvL75o6aveemEXENTPkvG3dOWD54TnuAziHB089Wrsdhg9VdJtGZuS
         jyMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767362617; x=1767967417;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QLSpurV53aCYl7zCbTN3/EL3fFQhgyYTGB5+YvXf8cU=;
        b=I2nsMAv48Zx+XaQap8gvHZAYeKSC1YrXnu00mr+lq3+UDK9sK1/OWXp45ervqF8P9T
         X1Yo5l0HcXVVAv5yDokhyBUSZcTsEpHuvLqiPxQNSFXC8WRaK8lKkXveCqhl/13ef7kk
         U4j9HLdx8JrLUrmNhcAxA45RYeQYj7GQYoOMki8DUS2vsbD/0vXKAiI4TnX2FATOMuj0
         5ET80ja87ErxDdQclxOKK0PLMeF5B3SbdQHP2D9B1zLotrhbyAmmyUMgttYDlfpGwPsx
         5J3DrzvWqoRtKAJSsKrbO1d4RDTsB+CtNzuRTpCqojLqU3VxcdgPk6pg9KuIGnTWajE3
         id/Q==
X-Forwarded-Encrypted: i=1; AJvYcCUyV64n+lThOgvERuSuK++eAgjPQMsj/rjFeU7sZ0fV6n6/9CmyeJuwnpMgG34ZAbQaqeg7b1QQiWNggNwL@vger.kernel.org
X-Gm-Message-State: AOJu0YzvU0gwgxOyl4smzSxVN1CXzcrOAE/ahEGphXVqaEKQTfMY1kP3
	vA5HZzpos2RiNI1+A5r6DcX3vxNR9n1ImVTkUDpDBqd/hl+tbTnDQ2bOD13gGbbXeJTm0SCaXg7
	p76/o1LzQVUY2pPQI3RRS2nEqcQSxq4DYOjDvKg1z6LExRHKEbcfwK386GWKiW1U1rqqf
X-Gm-Gg: AY/fxX7KCjvZPvdB8zDUwSOm9ynv/QLC+K4nc7KuIHzC6aXHynyGp2s8TmGdzZnbArF
	PJa7Hb9WXm7WDToF6ICfUMOYi96i2TZanErU1rMvOGS4+pSb+uzZv3RVs5YfUSoF7hnspvaK2mq
	wFA6/xuqd6zPEnQgKl+47pnxpiLmG1C9NmQjBo/sn8SE16A/TiW2hy18nj4OAt14gC+kEMb8+fz
	EEuq1hqoh8qwkmSKaIFDg79DDMjDyDaI1iyGe9mtcAExm4A7DA+DnFq6NKkYQwopwcgfatTOfXw
	JaVRze1lyXs6h9DQxYPq/KdMfBYHoFunnrV2PSVr9ejJu1SaQa05ILQAiHlzu3Bsla73trp7dB2
	+Y2Tpwny+MqeNYxAgl4YOFBB6S9J27xYYMiBhn7/mDRZKBjZqs2+iui8Gc2MHSZFAGw==
X-Received: by 2002:a05:690c:dc7:b0:78f:d300:1ba7 with SMTP id 00721157ae682-78fd3002314mr265111157b3.3.1767362617319;
        Fri, 02 Jan 2026 06:03:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE9BjDhRbMi3C8AU7G58zdIuxvPCd0K2QOgpFirkhphX+xf2DldvvDNkCAYxmN1uzn70oVumw==
X-Received: by 2002:a05:690c:dc7:b0:78f:d300:1ba7 with SMTP id 00721157ae682-78fd3002314mr265110707b3.3.1767362616706;
        Fri, 02 Jan 2026 06:03:36 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8056ff4925sm4072504666b.31.2026.01.02.06.03.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Jan 2026 06:03:36 -0800 (PST)
Message-ID: <415ac5c3-c2a6-4ee4-bd88-45805976aaa4@oss.qualcomm.com>
Date: Fri, 2 Jan 2026 15:03:34 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/9] remoteproc: qcom_q6v5_mss: Add MDM9607
To: Bryan O'Donoghue <bod@kernel.org>, barnabas.czeman@mainlining.org
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stephan Gerhold <stephan@gerhold.net>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251231-mss-v3-0-f80e8fade9ec@mainlining.org>
 <NLGulU4z-1Wrf5120YfX8CYJ_8DSP-9-DhaJ3KAIQCvqF9Qf184udOzFoEQH1qgJDZUl9cxEpsdyztfhcz8G-w==@protonmail.internalid>
 <20251231-mss-v3-3-f80e8fade9ec@mainlining.org>
 <6bfc790d-b0da-4c5b-bd2d-ceed9a75bb24@kernel.org>
 <DEGDp05xNKls7EO30mtT70wJFIkDT0-248vPaBikWJGkFf--YvzpyJ_h5sc7RSH1y9hkCKdFRBIJwQUNE9Rlzw==@protonmail.internalid>
 <a627abcaa38c0ba11c76c1f0c42b0c6b@mainlining.org>
 <d3bcaf7d-06ae-4410-8d7c-970fdb196c47@kernel.org>
 <3i9J-ztSj5n83TPS7yQ3ngZYVpv2MnqVgpnkfywumw-hk2fPN3mty8T-vI2c-1Oh8V_ArprPioyoPxso6k2W0Q==@protonmail.internalid>
 <1440e47e-2d7b-4d49-97c4-a717fadd3fb6@oss.qualcomm.com>
 <c8a7fc0d-a402-40b8-b313-6b89d1f5a306@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <c8a7fc0d-a402-40b8-b313-6b89d1f5a306@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Av7jHe9P c=1 sm=1 tr=0 ts=6957d03a cx=c_pps
 a=S/uc88zpIJVNbziUnJ6G4Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=dxggmTjb584dvWX6jHkA:9 a=QEXdDO2ut3YA:10
 a=nd2WpGr1bMy9NW-iytEl:22
X-Proofpoint-ORIG-GUID: XxhHc8C4BHWgOeSVWcDXkL3ekKuCF7Sq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAyMDEyNSBTYWx0ZWRfX+fAr2DHEevbn
 /1WswotwQbKCCWJC6KJ9tIEWdH+bBnBi5GvU1b5z6R+wvH55fD18NXWxaWIKvXzMDNARC5XgSDE
 MF4owG6tQJ0urExIwYX5ecjG6uxbEKLaLCSAkE2hEHpwkKT+FwaCxuQIe7Er1wXB03KABZ8+agK
 isSZ0hNYohjsS3V6kxr2eyQWz6RiCJoFqbmXU6AZKnsjM6jRqMll9co4aiMS/b67BiJ3U7YVBXe
 293Wp+cbMYYzH+fW4kQv69tIHgo5sedlrU+hIvYmN2N+kynwwxCljev82uOAqQAEsf+kdVysUGy
 c3cRE3WeU9kf0qqHQZ87KAjtQc4gJNviVnkMsHuJXmgscMs9zphWVSx8PR45n/ftyDWNEAPh1kR
 Xj/6lcY95N87mhv3iEJboXfK4BNghpUaclsIG0rxQGnRZMKDy3pSTdGyElyay9Bsl4JUsKVigrP
 FHjEecaDfSbdWAK0E+g==
X-Proofpoint-GUID: XxhHc8C4BHWgOeSVWcDXkL3ekKuCF7Sq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-02_02,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 phishscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601020125

On 1/2/26 2:00 PM, Bryan O'Donoghue wrote:
> On 02/01/2026 12:00, Konrad Dybcio wrote:
>> Now I don't like that this driver is going
>>
>> val |= BIT(i);
>> writel(val, foo);
>> // val is "altered" but not really
>> val |= readl(foo);
>>
>> I didn't notice we were just doing a readback for the sake of a readback
>> in the last revision. MDM9607 should most definitely have it too..
>> Perhaps I should have just read the comment
> 
> Yeah this just looks dodgy and inconsistent in this code.
> 
> And anyway, why OR those bits in...

Changing |= to just = would make it easier to follow indeed

Konrad

