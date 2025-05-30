Return-Path: <linux-arm-msm+bounces-59875-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 42609AC8C62
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 May 2025 12:50:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0E6CF1BA63AD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 May 2025 10:51:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 439A8221732;
	Fri, 30 May 2025 10:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MPIHTm7P"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9905A13AC1
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 May 2025 10:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748602253; cv=none; b=AOqtqiO5rRnEnutlt4FZzNNxgXgmFJnmlmWKxv+A+IA9djWw/InRYDeu8shk5Eah3uVhvAvKnL/3G0OqJBroPMQxLY/IFuePFq/XppO4uKE3p6iIAHxbzu4/YzUkfsdruJwew6QehS73jCF4/ms7CO+2dJQzeyrZQrTJNSwalQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748602253; c=relaxed/simple;
	bh=Y0A4aJWo1+DDao2XFJPkC1NveAkzL/wcYYWOAnx2c2Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZO75CCkrXlkt5yLPhm83HNGW8L0DOJMQ429+BJthrqWcFj5w0TgLDpVHeKNiLvUa8AGn4UamZHdejqxEcfP3xL8bTptLmL5s6wDtHI0GSsAfZrBLQmZtCiWRNxAXeB4hAui942E0cO7tLnkLKRYAdnOTpL3ga+G0T0B/4K7fuRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MPIHTm7P; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54U9eJb3013831
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 May 2025 10:50:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z4rXk9vhivFfpVyuWsaM+pN+1TEWBMRApv34rh/4E78=; b=MPIHTm7PITR2O4hS
	Q+XdeINvaPtbSaEOMtecNAD9Gyn89cFndVtKkKnLV+RUz1i3CCPiUAVcURUtIYSY
	cuDqGBa03VOCbhXvDIFBlo5oprqCkqeB5RraHlLwIqTe6DXRYnJ33aYJOiKvnyfU
	gqdBQNhTBXNEgLKlFkMwfcfTC4B8BsO7kD8pNcDJTbiGZuwwQms4YysZlm1Oq+aB
	yETNHd43t5EDCk8OEwxPMZjfnj5SC08StB7TfhsfGQNq4ZQRpwd28zkCGJhZ0cSm
	9OGJflJupggL1iEtUp47Iu51CtY/lCBj9ahJ2R1uDOPdcenVOUfkKUoqxus9Xc2v
	DncS+Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46wavm2nft-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 May 2025 10:50:50 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d09a3b806aso36289285a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 May 2025 03:50:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748602249; x=1749207049;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z4rXk9vhivFfpVyuWsaM+pN+1TEWBMRApv34rh/4E78=;
        b=PsxBIwqfmNJzWlGJ8KZZxhaG+gtRatJIGaxalKAFoJQLeoRXIHYTBAzQbmzRsosnwb
         urjpeE8Vg+ph/RgZ1GVYLgrtlisE/nJsSOXpDqm05fXDvvzOkED62trgZhyoahAJNRMZ
         KgOqAOiDsIIZMJhu6bY5UZWe3cTgOLgBaQHGTCvZuUq77jn0pSn8+2qJcQEV8eEJE2HK
         sDBSQa9wZsxH34rnBQQxMgB0QT61g+AL5lEUXhwrxuEJim9Ta0nbcyr/pRMKJIYSMWO+
         OnZP7JTnnB94s2M5z7RZ8GASofxhjF0QpjnSRgjLVbwDC6rGGyutlOTonukHnt5qMziB
         vDFg==
X-Forwarded-Encrypted: i=1; AJvYcCUxvk1j95gzjAQhuohFvz8D0MsLHnSxibIYhmzBkaUHj7nC2YyQX8fOuKtxqqXmhtGJvFeGkdkfbatTwblH@vger.kernel.org
X-Gm-Message-State: AOJu0YyUXdOzRUaIQGNc3Kvn5LgViEy4y1nMf/cGJyeGTfik/K5JszIr
	CHMQr2gmM3Y3PG/smGEEF5fRRInDoWx1wYWsieZovaXakwg0FUKjWA0F7IH4vLzS5t4KsvoBaRB
	7A3ipJOTOLL37JAQxQ2muQqNvyikkZZ1Gh8dHwvbbS4B0+0+xZHYqPiA2VxnN5wG33XgS
X-Gm-Gg: ASbGncuPvcjKQ+I/elkFBiYj1hVd8WfIWeKhprwRZK/cZMuYvFaQI46r2HerceGNB4T
	dlR/KyxGoauG0DhrBs9iS7VYvX4SQ7Qqi2s60AlgTTBfkyeqaB2KiuybyjswJs+eF7Isdw4A4gl
	JJJY33TdA2vM4aGJKg9DM0wu07mIKuIFgCBLH7I8LRDHnvH1s1vdAHUGlyNm9jJVlevye/knbyt
	6Ez9x6pTkQGGrI7+2mv3zMJSgifcXWNH6l/fJjTZhEQsgQWwmOGPxV7/SW3YGGtBXHt9C9iQsT/
	4oz79ta0Rh+sG4oWtvJ6RPQbcAlcoUEGzUpzYCGSMkmuGRU9IhQI2M5KzRJayM1LqA==
X-Received: by 2002:a05:620a:3181:b0:7d0:a01f:fb88 with SMTP id af79cd13be357-7d0a3d4c675mr106124285a.3.1748602249366;
        Fri, 30 May 2025 03:50:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFJYC21TQ5zDddZNnJ9XnAJWlOSBf5rU1kM5wJE04vL9iTjxKtcyZldXI0lj/F+I9ByGJY+gw==
X-Received: by 2002:a05:620a:3181:b0:7d0:a01f:fb88 with SMTP id af79cd13be357-7d0a3d4c675mr106122785a.3.1748602249000;
        Fri, 30 May 2025 03:50:49 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada6ad39479sm303640366b.124.2025.05.30.03.50.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 May 2025 03:50:48 -0700 (PDT)
Message-ID: <41ac26a6-7a5a-4c11-b05c-9ce688ad1856@oss.qualcomm.com>
Date: Fri, 30 May 2025 12:50:46 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: sa8775p: Remove max link speed
 property for PCIe EP
To: Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, krishna.chundru@oss.qualcomm.com,
        quic_vbadigan@quicinc.com, quic_nayiluri@quicinc.com,
        quic_ramkri@quicinc.com, quic_nitegupt@quicinc.com,
        Mrinmay Sarkar <quic_msarkar@quicinc.com>
References: <20250525-update_phy-v3-0-5b315cd39993@quicinc.com>
 <20250525-update_phy-v3-2-5b315cd39993@quicinc.com>
 <mcmpmaapzv3vbiynlrp6sijdjvj6a5j3dxzoixz6b4cxqsvbsl@ecljexn3zg2e>
 <0aef1687-0158-4d7e-8e3d-b6eafc38d049@oss.qualcomm.com>
 <CAMyL0qPd2HRv4nr2C9=5SgzSkuKO_1cfZbOUO2aUj3vPWnmJbA@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAMyL0qPd2HRv4nr2C9=5SgzSkuKO_1cfZbOUO2aUj3vPWnmJbA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: uuciCb3lLZr3dmfnwZUD2yJX9Go-m6wY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMwMDA5MyBTYWx0ZWRfX6z3oN2cypI8B
 jxqmIROksF4IA9HlOWstVgbD6LtIrjKZ7XHG7aq1JE3yoTMK3ZrcmrqR1ukwIdeVcNaicW91vlK
 MvhHnNNOj5YIJVpUsPPzXqI5g7hnBBNn2CGKamsnzOkhRRFjTL/tM0Hc4Tn8catiFUVkvUEzBKk
 7RTcQ+fwaTeULCCrRGAYimF7YfNaBaBJfVzORHzsPacPti9vDDka4hB8+0AAxJ5yB7Bl5Vh7hRJ
 lq4w31UkxAq85iEPHs3wHDm5iDHNM+mKrhTPNn/r/pTJ8Bx3kaRMZjwGvk5+UhJG+PO83fkO9Jt
 mH0RrBSuaWxFw7V314LG4Ddfo3CNd4KHHM8iUGmVvjKGGd9r+CQ6obm/7f+XvW1LUJ9ZyWny0hP
 XDCrENawvQGcRWgvkET4MLlJBd5i1pvS0Y7jH27jvxc2hr/QT7e4hby0mhWwNHGaANb14w2+
X-Authority-Analysis: v=2.4 cv=fMk53Yae c=1 sm=1 tr=0 ts=68398d8a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=x3Y3bNPYzO7REJDPTQEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: uuciCb3lLZr3dmfnwZUD2yJX9Go-m6wY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-30_04,2025-05-29_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 phishscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015 mlxscore=0
 mlxlogscore=888 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505300093

On 5/30/25 7:38 AM, Mrinmay Sarkar wrote:
> On Tue, May 27, 2025 at 4:06 PM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>>
>> On 5/25/25 3:29 PM, Dmitry Baryshkov wrote:
>>> On Sun, May 25, 2025 at 11:27:18AM +0530, Mrinmay Sarkar wrote:
>>>> From: Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>
>>>>
>>>> The maximum link speed was previously restricted to Gen3 due to the
>>>> absence of Gen4 equalization support in the driver.
>>>>
>>>> Add change to remove max link speed property, Since Gen4 equalization
>>>> support has already been added into the driver.
>>>
>>> As Gen4 equalization is already supported by the XYZ driver remove the
>>> max-link-speed property.
>>>
>>> "Add change to remove" is a bit clumsy.
>>
>> I'm more worried about this node not having these gen4 eq settings
>> (i.e. the part talking about driver support landing is true, but it's
>> unused without the presets being explicitly defined in eq-presets-16gts)
>>
>> Konrad
> 
> Hi Konrad,
> 
> Actually stability issue was resolved by this patch series:
> https://lore.kernel.org/linux-pci/20240911-pci-qcom-gen4-stability-v7-3-743f5c1fd027@linaro.org/
> and I don't think we need to define eq-presets-16gts for this.

Okay, so there's multiple parts to it..

I was referring to this series

https://lore.kernel.org/all/20250328-preset_v6-v9-0-22cfa0490518@oss.qualcomm.com/

Please check if you need this as well

Konrad

