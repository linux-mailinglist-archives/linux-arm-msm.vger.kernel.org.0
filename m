Return-Path: <linux-arm-msm+bounces-47900-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EA8CEA340D2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Feb 2025 14:53:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A800316847A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Feb 2025 13:53:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F408C24BC1E;
	Thu, 13 Feb 2025 13:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pKAsxd8P"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6748F24BC15
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Feb 2025 13:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739454826; cv=none; b=RbvxIAlhbZkV7A3kGx3T7Lq5KntE+6/PoqUKTfy85ZgNtR88FzG2wKWBhBhdz4ZnJ1NlgLaQj5gz5UTby7u6E/hlusxD3Aj+UXKcdObXRVogAVcldV4m/PjD6zqrAweJD0VX7PiakzxKnB8TTvckMxiyOAC8r2rNq424hjurDnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739454826; c=relaxed/simple;
	bh=Eng2iBq6FvHc1yUhKMcUzLBmdUfoaMTs+ae3WTkaieQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O7nYOqS81B0WQlzzv61f0+/En8TBGWe6YnO+V1EWE88zN0HWHLhS4c/rDSzbqNgK2+0/LGsE/s9HGXAFbWkez75CPdle+SgBlB8KlBttOzE59Aa8n2UzUoC7p4stA12Gj9NFoeEo3pBt3bKEJbZfZIg7/mzvg9TdQvlbHgX1N8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pKAsxd8P; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51D9WUGl015774
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Feb 2025 13:53:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G0T3NNL6yPWHi23ATwtvU4h45jKTgjlGN7+OXPZamIA=; b=pKAsxd8P6eu1LG+h
	Ee1B1nOcWiiCOrTWOoEC6MvIYUU6UQrjwwf/07tKOjsk3c5aznQHbzs5dL9Duay8
	p//qzUEJ5NZ4VEisarBD7W2XdavU+aI1hywDGOohTFI6EjWAoMygQKy8b/IFENEV
	hpQgRC3INzKlYKf6Z0ocWLKk8ALxIr9gAbjD7VYnKC9cnI979ujYpv3vPufv4fTI
	CX8BQlp6B2qd05lFl3f3KkOJHpGWgoiarHYf+VimNP0L5SRqqCUninZlDeL56lUB
	xqz2bIBwYv/z4rAm/KbvhfQ5LvbsFxp133TPuQNz21evan8qcJEBFnM8MsQW3LuP
	Hgk1vQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44rgpgn8xa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Feb 2025 13:53:44 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c07ebd8de4so5474085a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Feb 2025 05:53:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739454823; x=1740059623;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G0T3NNL6yPWHi23ATwtvU4h45jKTgjlGN7+OXPZamIA=;
        b=PFpkBcN6WYrtTLO9zm6E1mautL/qqxAPLkADOXu9XknsewTpFpn88pU7fRYkpM2QTl
         FNQ+1x8/8dNyxpWS+yIki162jGRX/ORPBXnENdW5q9ZO9mwOGF23ZidfOGmxkJZUyfib
         o+MGhQ1VgEyIyq3Tok6Fgk13wpEP4WjJZAlVrVHQFjbuY9UXe/NJZxtMQ2ZU3ICaYt8/
         /TIwhR+ZiBA7akmGa6NeHhaWXvR0CK7qu/+zMi2DbjcSmDIp9JXxzuYL77jhAEf1MeG5
         ncMa9SrCP3AqOu5S8ZlL+W9X5qFBEVsDXso3gFtJMo4CeJWkBXfznM79NBt2zXBx35p5
         JeWA==
X-Forwarded-Encrypted: i=1; AJvYcCU2fsGRHtEdSZGuYAuzscLdSkPvwj/bwqH6m2Lqcwp1nlhFUnczq6oxa1CJw0MLCmcPYFw9JV+AzrCqacx6@vger.kernel.org
X-Gm-Message-State: AOJu0YwYMKEStyQCxNjNmEU/E5wv1eADDR+kbhHQNg15KXnjsDPk0VSg
	itN9Rdtiytde8YniDug/tELkm4zPvqmFXRRJia78dqXNnHzS18+cVvVugZA5FRVcSnwrEECVTT2
	ycaxwnlGl4Sh9wtJvn/F4IuP+LSKIM+anIQj1Hui7pcqZfhcAPZonMYIQBA9ntZQ6
X-Gm-Gg: ASbGnculTSsvz7QW9/iDvMQpfpq79YChu0raltOGFEMI0W+OBYt9UOwM2yQqlT3UkYO
	rhbA07ylaT1tz6StYhlfC72pA4f1YYsc7RpLqLUUZXxUIZAoe5UbCTtAqEO4gQVadHnqa9SJOJQ
	0SRVUigpFlNqSpTVic+HkzWpFckEuSS9BlNLA0P3ZKUCt8j6icf8ALlnCP7XFEWj7csT2etnn3R
	UrMg/PUdNAYraPzzJAF/di0wHaouhCzq8vQLvylSJ/+FFlrz4mp8AQN3L+Fk0ZoFSGevYzLjepG
	nhqihN/alfMyp/KDY46qtsTmggt/rbByis7chgXJifCcyGFbpW0Sl5FRego=
X-Received: by 2002:a05:620a:4793:b0:7c0:7753:9807 with SMTP id af79cd13be357-7c07753984fmr245804385a.2.1739454823001;
        Thu, 13 Feb 2025 05:53:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGfRJnsuo/7alsc6cmW1TUv/j5i4/UelSoGDYSvEXPaZTGIzpCzI0MBm2/J7M+CkFWsBrPiFg==
X-Received: by 2002:a05:620a:4793:b0:7c0:7753:9807 with SMTP id af79cd13be357-7c07753984fmr245803185a.2.1739454822571;
        Thu, 13 Feb 2025 05:53:42 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dece1c4692sm1219859a12.31.2025.02.13.05.53.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Feb 2025 05:53:42 -0800 (PST)
Message-ID: <936dc0e7-bd24-4b20-892e-831b4e5ddfaf@oss.qualcomm.com>
Date: Thu, 13 Feb 2025 14:53:38 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: x1e80100: Add crypto engine
To: Stephan Gerhold <stephan.gerhold@linaro.org>,
        Abel Vesa <abel.vesa@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Johan Hovold <johan@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250213-x1e80100-crypto-v1-1-f93afdd4025a@linaro.org>
 <Z63xEdcvCRHchHWu@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <Z63xEdcvCRHchHWu@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: I2Nkc1Oo9ytwZoRTb31C0OCGpFtLZnbj
X-Proofpoint-GUID: I2Nkc1Oo9ytwZoRTb31C0OCGpFtLZnbj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-13_06,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=911
 priorityscore=1501 mlxscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 phishscore=0 malwarescore=0 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2502130106

On 13.02.2025 2:18 PM, Stephan Gerhold wrote:
> On Thu, Feb 13, 2025 at 02:44:02PM +0200, Abel Vesa wrote:
>> On X Elite, there is a crypto engine IP block similar to ones found on
>> SM8x50 platforms.
>>
>> Describe the crypto engine and its BAM.
>>
>> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
>> ---
>> https://lore.kernel.org/all/20250213-dt-bindings-qcom-qce-x1e80100-v1-1-d17ef73a1c12@linaro.org/
>> ---
>>  arch/arm64/boot/dts/qcom/x1e80100.dtsi | 30 ++++++++++++++++++++++++++++++
>>  1 file changed, 30 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
>> index 9d38436763432892ceef95daf0335d4cf446357c..5a2c5dd1dc2950b918af23c0939a112cbe47398b 100644
>> --- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
>> @@ -3708,6 +3708,36 @@ pcie4_phy: phy@1c0e000 {
>>  			status = "disabled";
>>  		};
>>  
>> +		cryptobam: dma-controller@1dc4000 {
>> +			compatible = "qcom,bam-v1.7.0";
> 
> Hm, I would expect this is at least "qcom,bam-v1.7.4", "qcom,bam-v1.7.0"
> given that this is a pretty recent SoC. I don't think this makes any
> functional difference though, and we don't seem to have it on other
> recent SoCs...

It is v1.7.4 fwiw

Konrad

