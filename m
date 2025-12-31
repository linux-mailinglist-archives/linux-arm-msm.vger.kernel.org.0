Return-Path: <linux-arm-msm+bounces-87136-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DD3DCEC599
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Dec 2025 18:14:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1B55D300E3FD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Dec 2025 17:14:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C79A329E113;
	Wed, 31 Dec 2025 17:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D9V3Zag2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hntSD607"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78E2029E0F7
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 17:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767201243; cv=none; b=ab4TWLAUaUrc2mg+zP1XFsokyx/67hynmaya813kbFreoVJ6v1E/8bkbcZIa74F8E1wdXyRaXXziIQ0QVQDWArP84BS0zs8jdIQiVLOJjOjHf+yOXRZB1mX8bz7eqVwQkJz+sCae3qEyyh7LtkwZ2sQ1+wvjJtmfmTVnsiphfDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767201243; c=relaxed/simple;
	bh=tV5Z2ywT2QxNBQmF1mEDoo5FB3Ffvv6WjWOx3PwFkuk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I8o3NX5ZZdnx/d1LunY3Vwbzh4K8QnNVLgIxAdb2i2NkoXPFDAmCP3M3aBXtBVJbgbiOo8+4tfdwVzTJfe5dgw/GjjxAHTd4SYvcpzhZ+2/MjiPIxcyS6k9HKORaqTtfEludAhYr2cZ0wqHVCWtdcBg1X6P3a26NYW8tOuqa6Ds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D9V3Zag2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hntSD607; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BVGIDEp2872520
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 17:14:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KvGkotcXkh2XKvjIcpEZmzKCU518o2x8b/soOzSzzL0=; b=D9V3Zag2lvaVxOzU
	S5i7lzwH8gi1OSBlWtBWj/ef3HRzRAuAvZkXKQ1mcY+kO109qmVP9zoZzQbTe3VK
	EdZEfkkKf8d+du5koWWMb6RjKOcdTFXUZePGKbrRVfC1SE1FkLEpBDNjvO4px9df
	Ty+cwZ3cOQuPVsLPmdr+1t/xX3Pw+H7kD+V1kkQopPgogBV5/OnVUxuxawWXdzQ8
	g/zu9PVu0OCHAlEoGVwDS69/JFHs3ysdXnxKheTPYfNoSpanauw/XF1J33+Q1HvE
	Yfa07/yZy1zzqb9g3Ks0jcnyw2rTvv3vnazjfOWV5xL4uENPJg6ifYSJS6+HRGTz
	0nH1aA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bd77v02sd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 17:13:59 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ee409f1880so29873971cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 09:13:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767201239; x=1767806039; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KvGkotcXkh2XKvjIcpEZmzKCU518o2x8b/soOzSzzL0=;
        b=hntSD607RdIVRl9N9XH5NAj49tFoYqmo6KcCTwAFtkfw10ycySsZf0RD6ux4jlcqOm
         KKJcL96YVTXbmarzQby6WQR4qw7eZLyzJBAmZSCvW4J9MSTsKQA81iI8QaaydEHy0sdw
         LBwMo9H9ZxDvxcB2OMWaHlTY5regnlw2Cu7gZf8LiIZ0nfqQnzys3oYYEDDPSKT1vif+
         UkVhpp1haLWvu7mRGcVZY1jU0VesAlZhb5oB4C757IW+ZYuGLfWGCGCft3zPYgashjrE
         aTvsvZhApDuSv4K3eKde5k93pNb//fbCKkm5BanXhPT2xn1gRnCLJEnprYDfLP0c1CYz
         SUAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767201239; x=1767806039;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KvGkotcXkh2XKvjIcpEZmzKCU518o2x8b/soOzSzzL0=;
        b=OEK6KLG4BFHzWVYfVOqO7vhpo/RUO6cRzCsdouoqlcvlC8p3XCOfPUTgPgC88yMVYA
         JSlZQuvOKezqMNjoQEw/dFFtouoVwTftJGiybvi+LrOmrNbvlf850a1QrAvPI8SEu28w
         PksiXfhKYDkandlTZQ92M/TKpeFTCKm1Ab4Zo7Dhr6kua3RIV8SGxLwJH2zVI+wC2BC6
         b5f9UrDK3uMhOJrRWlpDEBohgxN+Tp8jAOyNzeLJt4E2r0YaQGWtGgQXO7BmY79xcxO/
         VimwL92djb1jOytaSbezIEDlEmrAjhqUhr2nPfCOsorAZhetd7swA/JQW3k7qjMjPRLL
         UQTw==
X-Forwarded-Encrypted: i=1; AJvYcCWv3I966fef7hEvJOYFRJ7iqj5R8+kcna+MLwE8rEzgbVJHkgUVwgbQZznvyiU4cBACwh6nDzvA7UBRi0Ic@vger.kernel.org
X-Gm-Message-State: AOJu0YxKhOJTQhk+0tgkkANQvjnyiJ2kZSM2ZulfgsWiGqzQYQJ//MNA
	S/PAFAyW/oCNdjdOg9p+N4yTOEqlbl9Tp0Yv24U9doT9zTul5aHO8BxxCSKWvT9L69LRAPXNiWT
	N0441RMteb8498DC2lvT/l2OLcBsJOsFGDG9hsbCOLlOt5rpuI0Jm7TBCfzdVENhOCuQH
X-Gm-Gg: AY/fxX4be3QYiVCDn17CEgwcCY8AFMn6Np3zwDGt+A8uIiaQTdUMIToHBzSsFzL8ZyO
	7joPnkPMV9+IMjCFuuKuFQuPLv9R2QUcdeOdQ2StyHwqki7f9G8E+Vy7tle5Ov//691ncvTj3Wj
	iqXkhutLTfFiubnTWbipAiERDUzU6xT4ynX2FSsBebC6O+5U1sEW/PRC3JenYqIKyUGC+HWHjDU
	OOmrQueHR/Y3YBxQ/EkyMUm7HqsIq8vO4Xn3CIWBq20HtvpBaNE7+h1CLPhOBvVLINXjRarp1ve
	cNOSTy5UbfUs/8lisLvBvkxJVhlfgxUjm/kMCBki81t445vf293BkWxvemAJYbaIhyZxXpcmXqb
	do2z6yJZDcfhcnjF9x9r8uKwQyitsOaXarQ5RtnEt0i7ev7qvgernjwsrXYBfNc7p3A==
X-Received: by 2002:ac8:5748:0:b0:4d0:3985:e425 with SMTP id d75a77b69052e-4f4abd70338mr424499021cf.7.1767201239193;
        Wed, 31 Dec 2025 09:13:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE38fyRnXbhNPBxOfY+OuiOX8uwu/dojYjGwqFDkNfLpKpBFNZnwSGv8NnMACyExBZKLj167w==
X-Received: by 2002:ac8:5748:0:b0:4d0:3985:e425 with SMTP id d75a77b69052e-4f4abd70338mr424498721cf.7.1767201238815;
        Wed, 31 Dec 2025 09:13:58 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b91056731sm38489198a12.8.2025.12.31.09.13.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Dec 2025 09:13:58 -0800 (PST)
Message-ID: <e0f49b9c-331d-4822-8320-fce19dbb34d2@oss.qualcomm.com>
Date: Wed, 31 Dec 2025 18:13:55 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/14] arm64: dts: qcom: sm8150-hdk: describe WiFi/BT
 properly
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Matthias Kaehlcke <mka@chromium.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-pm@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
References: <20251231-wcn3990-pwrctl-v1-0-1ff4d6028ad5@oss.qualcomm.com>
 <20251231-wcn3990-pwrctl-v1-14-1ff4d6028ad5@oss.qualcomm.com>
 <59f3db15-77f1-42eb-97e1-31129fdf363d@oss.qualcomm.com>
 <df7qz7oz5et7px3ghdfteuyiyistbrpei5tq62s6uwmzng4ols@gklfvzhbf7tm>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <df7qz7oz5et7px3ghdfteuyiyistbrpei5tq62s6uwmzng4ols@gklfvzhbf7tm>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: LrLAZ93BO2UQlOgeJ9zbhnFdAADS9EwC
X-Proofpoint-ORIG-GUID: LrLAZ93BO2UQlOgeJ9zbhnFdAADS9EwC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMxMDE1MSBTYWx0ZWRfX62bYxsYg82ip
 Ny0ifHqecvs/GavzCNYlWuAycy0/175advLOZSJ/z3n+7uV22NUPwqfvq+iZxQd6Mj5zSi3MUj7
 257Od7uH+YmM82vxKbulSggiD0dku3j8GUWUizyhApXq63zLozIi8fv9MZ/IlO5SrtL18Pt24l+
 /yVeUb/GI1vyLsn6I6j8xsndqFHTkYSPcerRjdh6sEvTbWRW2SyaB/IP08N9cWtpkIEExaHhnRe
 j9lt8c1IBX3Pk6uGgr+jYzySRE7p47oBA8eohph+N7maXAqCI7iGISg9eYrM1qLRoUpRfEP3SAh
 cpljQraCc3E8IdhBeY5W+rh+9lZvcLVOZgjc1xjuoC6nx0dt4yxPaefLkISlroJDYANaHRnwO5t
 KH9IdKtAKvesSWyHqDPglM7QQitYACMLs6VMEW8S0JXKyAihPb2QL03+KGBmLHhrtmi9eHMo575
 i571JKRciMtlQgrGJhw==
X-Authority-Analysis: v=2.4 cv=ev7SD4pX c=1 sm=1 tr=0 ts=695559d7 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=ElJ8wsXG5LtXk41pdqMA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-31_05,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 malwarescore=0 clxscore=1015 adultscore=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512310151

On 12/31/25 6:12 PM, Dmitry Baryshkov wrote:
> On Wed, Dec 31, 2025 at 01:16:30PM +0100, Konrad Dybcio wrote:
>> On 12/31/25 12:36 AM, Dmitry Baryshkov wrote:
>>> Properly describe the PMU present as a part of the onboard WCN3998
>>> WiFi/BT chip. Enable Bluetooth part of the chip too.
>>
>> [...]
>>
>>> +	wcn3998-pmu {
>>> +		compatible = "qcom,wcn3998-pmu";
>>> +
>>> +		pinctrl-0 = <&sw_ctrl_default>;
>>> +		pinctrl-names = "default";
>>> +
>>> +		vddio-supply = <&vreg_s4a_1p8>;
>>> +		vddxo-supply = <&vreg_l7a_1p8>;
>>> +		vddrfa1p3-supply = <&vreg_l2c_1p3>;
>>> +		vddch0-supply = <&vreg_l11c_3p3>;
>>> +		vddch1-supply = <&vreg_l10c_3p3>;
>>
>> Again, please double-check - I see UFS VCC is on this line too and I
>> would guesstimate that antenna supplies may be separate
> 
> UFS VCC is L10A, while this is L10C. I've doublechecked the schematics.
> L11 / L10 of PM8150L go to WiFi, L10 of PM8150 goes to UFS.

Argh, I can't read. Thanks

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

