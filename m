Return-Path: <linux-arm-msm+bounces-49337-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E32FCA446CE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 17:49:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 95CFE18957E4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 16:49:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84074192B75;
	Tue, 25 Feb 2025 16:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kzWYpvpT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBFF11A317C
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Feb 2025 16:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740501904; cv=none; b=IY9vOO9NHsbXxCH1ktrI3Q1XIUQnW3S0mjQaRjmgSEaqwdxtMqboVB0V8pIsGPRAZb6ASOMLBZH4k0iy6Gx5IjS/SoSolOsHYxL7hCUZVbVpkOtzMsbHDtFolnxKZRi8naHmfs3fVjxhn2kRnmX5o5pU2CiKBLYmE+o8/euPJ2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740501904; c=relaxed/simple;
	bh=L2FmnGukcA0y4f65aXO6bVtDOK+71WB4L3u56d6qH0M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eRyD4ysxfhd10IQC8nOl0dPNAKTM/9epOsyoG9ORdZXBhNcVVJF9AXMI+2ay9UdGL5SdEY9hShUkOjVYcZ+Mz1bBLezMLmjCvQBfDfA0cyOv1HRspTRnj29ZSx3vUTocqsg+eZIfPbvtU4+0k3nO9ruJ6YekxXTvNaI+5Ph0ZeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kzWYpvpT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51P8flUQ009749
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Feb 2025 16:45:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ULUpptJwI6ThaUvM4CSWgxzRITrdZBlHcTREM3kcByM=; b=kzWYpvpTjBl8zND8
	95vNpAKACM6V2TErk2q+N3/vSaSJ+UrON9VohH9ngZ6Y0VELEmspHxdnS88TtOV7
	s08ike/9NvKa1Ht+g1W7U/qbYuNFpcPonMBAVgsZzhVlpPg+hUdJQI/d4GFTExjY
	FhcMx5uHcGxO4KpTbqE3GwRw+jMVnH/ro4r30x6U2cAmayCi71rokVL4iP1MrHyQ
	3pWtQwZy/cYw5RwcFv+RsvhldVozHYbNKDGZwUN6wNAQUFNOfG42FHcHkuED751j
	LZQO4rZwHpE+rkbgS60lchf9n+wTY7WoVDEFo/dPJfvsur37++hi6lNjdlto7Wqd
	wFlKWA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44y3xnhr7p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Feb 2025 16:45:01 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-2f81a0d0a18so12573833a91.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Feb 2025 08:45:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740501900; x=1741106700;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ULUpptJwI6ThaUvM4CSWgxzRITrdZBlHcTREM3kcByM=;
        b=kCsXgIRoGKgoES9ybqjmAlvoJmjGMQy+N5TxV3ndiu3zgjLgET7tEYw8MJsdhyKIoY
         +Mvt8WjNTcNgEa5528i9e0kMJK0s6GViHx0/wsxZxQGEw1L4YMunGaeZZpLnbIWe4Hjr
         hNNU6Tlm0FyeNsWCPvc7kfSXus+4PoBD3bW7oOx2fZRW43fyDHFZJVyBh4zm8dceWc0C
         QX3alX9DQ55+Qt+W4LW4aN4luGySlDHahogU5e6nW1ueKumC2EYYu5nLoSR8hhyDN2cH
         AQmswhfzIpPVshbjC6KY0UVn2v0fgoFiaeOnohpPrYIeaddej+RpdA8ZP/eYwoAwf7kd
         24aA==
X-Forwarded-Encrypted: i=1; AJvYcCWsSuGIZ1dYqdmF0UdRIGPR7D2ybowbgyEzaAF1EK3XwI4tRdGwapnx0bGuwAF8tCJc1bnE64EqXgxNs2Yx@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4h9870fvpxDuH7auGuiswSXtXrz7hSfuO8hhnqx9HpCLNLZPn
	xIz6SZKOD9gizxvzD+6B0SZDBnluktAO2sB7rU5zvsr0XrVPjGMbf3If3e7qgUI4HFvElK+Tpq4
	0GCLWH/g2svVhWZdBFX8Y/CybohVjxkvmfebYirdj3kwvIwS/3oNhNXXfzZlnIYxl
X-Gm-Gg: ASbGncsNDD1vaX0Pl2DYrT/42fNl+75SqHobqZMCGJHCoZp2m+u18CWtXxBxjyrltmh
	hnnWVTjg7RUf7w5lAaOjQJ7xWunbw3wPcbEcXLHEMAPJyUfeUL/3448mRLKugMHGhWsfAV+BIIn
	QNIz6Q1yKuTW68XvJ60U3D75gF9R299mVVRRIgrcEogsx0Kd+lSU2hJ4GGsaCcDyDET0zQYO3Hc
	6SDpVfX6NLpHyKV0FZP9qXYzfP7w5ziMb1rQzbk5CIARznUvo6ZRu+KUyesAGwkYw/IqH+dRk1E
	jiefQkU6iAQfiw9YcxlOK6BX7paq8pkAp0jK4BlcZFP742gDcNZhnAFm+f2sWecd/OsvevA=
X-Received: by 2002:a05:6a21:7a93:b0:1ee:e785:a08a with SMTP id adf61e73a8af0-1f0fc781da5mr7421845637.29.1740501900065;
        Tue, 25 Feb 2025 08:45:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFzhySqJhghGiZsMKmpZdjhwmssEsTGd4irosiubrI41LuqK1kzfshthHtszlA7LkJtnyROAA==
X-Received: by 2002:a05:6a21:7a93:b0:1ee:e785:a08a with SMTP id adf61e73a8af0-1f0fc781da5mr7421800637.29.1740501899691;
        Tue, 25 Feb 2025 08:44:59 -0800 (PST)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7347a7f8258sm1727164b3a.112.2025.02.25.08.44.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Feb 2025 08:44:59 -0800 (PST)
Message-ID: <21ad3381-4d65-4c68-892d-9f485bf13735@oss.qualcomm.com>
Date: Tue, 25 Feb 2025 08:44:57 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: x1e80100-slim7x: Drop incorrect
 qcom,ath12k-calibration-variant
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Jeff Johnson <jjohnson@kernel.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ath12k@lists.infradead.org
References: <20250225093051.58406-1-krzysztof.kozlowski@linaro.org>
 <sfhcmlz3x254fdowufeeuh4uiwxfgkphm4ch4laceivbrs3zir@qvqk6jxi6zhf>
 <7b54e965-3395-4349-8ae7-51a28c759235@linaro.org>
 <kce6gzso22fp3ze2wp43fvy4tv6yqkaijm72kh5qk34jwijk2l@3ifaiz5tgjvl>
 <d93789c6-61d9-4761-98f5-aa3dbec14d82@linaro.org>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <d93789c6-61d9-4761-98f5-aa3dbec14d82@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: qClj9WD1nHCnOmnrgUqQYdKSCkery7MP
X-Proofpoint-GUID: qClj9WD1nHCnOmnrgUqQYdKSCkery7MP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-25_05,2025-02-25_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=817 bulkscore=0
 suspectscore=0 mlxscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 malwarescore=0 phishscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2502250107

On 2/25/2025 4:14 AM, Krzysztof Kozlowski wrote:
> On 25/02/2025 12:45, Dmitry Baryshkov wrote:
>> On Tue, Feb 25, 2025 at 11:22:25AM +0100, Krzysztof Kozlowski wrote:
>>> On 25/02/2025 10:50, Dmitry Baryshkov wrote:
>>>> On Tue, Feb 25, 2025 at 10:30:51AM +0100, Krzysztof Kozlowski wrote:
>>>>> There is no such property as qcom,ath12k-calibration-variant: neither in
>>>>> the bindings nor in the driver.  See dtbs_check:
>>>>>
>>>>>   x1e80100-lenovo-yoga-slim7x.dtb: wifi@0: 'qcom,ath12k-calibration-variant' does not match any of the regexes: 'pinctrl-[0-9]+'
>>>>>
>>>>
>>>> Adding Jeff and ath12k@ to the cc list. Is the driver able to find the
>>>> calibration variant in case it is not running on the ACPI system? I see
>>>> that it uses dmi_walk. Does it work in the non-ACPI case?
>>>
>>>
>>> But nothing parses such string as 'qcom,ath12k-calibration-variant' (see
>>> git grep), so how would driver use it?
>>
>> That's what I'm asking: is the property redundant or is it correct and
>> it is a driver that needs to be fixed?
> 
> I assume driver will need something like that property, but that's not a
> reason to accept incorrect one in DTS. One cannot add properties to DTS
> without bindings, so bypassing bindings review, and then claim "but my
> driver needs them". Send proper patches for driver first which will get
> a review.

We definitely need a calibration variant entry.
I've pinged the development team to get the driver patch.

I'm also verifying internally that there are no issues with your renaming
proposal: qcom,ath1*k-calibration-variant => qcom,calibration-variant
https://msgid.link/20250225-b-wifi-qcom-calibration-variant-v1-0-3b2aa3f89c53@linaro.org

/jeff

