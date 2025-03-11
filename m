Return-Path: <linux-arm-msm+bounces-50931-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 29025A5BC7B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Mar 2025 10:42:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 59EEC171B78
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Mar 2025 09:42:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 480AF22D4FE;
	Tue, 11 Mar 2025 09:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R8JW6M/K"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B87AD22B8D1
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Mar 2025 09:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741686139; cv=none; b=UpFoLewG77DqMY32d9wHIoU/OR9VUooXmnHm6sx0sCXoOraG0Rn+BL1uz7c6GD0jWooKIVCSojoxqc0YkJ/xgNb39WigYmt63yF22Av2hs97gEae2umzATclTqR3ml0+kFUlCnm9yFV4U0SsiP1uTAQZNxR69UlwITg1uVuGi6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741686139; c=relaxed/simple;
	bh=6G6q9gJE+xvV3I97HSJ4wqR6R7EQnz4zmkCtLbU3u8g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fJx2yJ5pwn6+Tk1XKSEJuiIGEoQI5urOJNnk4iaTnE6/SYY4dhJtcWBKC7UmHcxSnbjtgud43nI4yjCYsqrwJQ4f4OGYfYeqRzuIhbWcNtbBPOAfZqM8tTjoWLr55JZbEzZHECa4TyH0DvlyX5S5o+q9GLogrcUCYLICEOYwcV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R8JW6M/K; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52B1BsKk012316
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Mar 2025 09:42:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jLmEFyG3LTIS/8bd0t7FZ5xsj2uzD9vnCxgeQMsx2zY=; b=R8JW6M/Km9+3D2yt
	U5m03KYMgJEVx+EdhRU/jwhD0Tq7GY20BnJjfEYNpPfJ1mPZ6T+Gox91keNRBQa3
	jbEAmgGnEGICxwSAkR4C4kk7ER0IGsr6jfDKlB4KtJ8fyZ9lEpZeo7K5AZhQlsG8
	EnC8BENpjx/3Nda8xExLwiiYbOj7NI+SHZ7p8YE/SNMYC+7teCz4Q3Kg83vrGkMz
	Gh33SQ6JNSCaxbbuFtCkxgVcagQy2JO9woK8u2+/mELTTX4cCDylpkwc+2q7ZPKi
	EdKuJ2zO4YMF3X0FG3h5Ivs33QrM2IcJLQ0DLk6uvXo6yCw8Cpbwb75sU1Eq31QS
	cT4cGQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ab95hase-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Mar 2025 09:42:16 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6e19bfc2025so13934056d6.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Mar 2025 02:42:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741686135; x=1742290935;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jLmEFyG3LTIS/8bd0t7FZ5xsj2uzD9vnCxgeQMsx2zY=;
        b=YZyab6XYs7K2QBcxtUM860KT9oWA4Vb1MMusiAUiDZTb9Uz8Ba81YV+gzQZLHPflez
         VqtMha2zxpt7ly4ah71DtsyBTm2j62xMKi2lsZn1Lpz1EZHYZ3uzbkfpCy6aMPJJfBw3
         CqTDTxRj5i8a3LR4POZZecFyzSWSJFkVT1pljAvTarBEupaFn6HlHU9AscQ1PTb7A4XV
         NozRokTcexNk25jSlvy9OrT1zV+KEih7RZR4jDzBv2LCohBjnz0ejc3N0gCaEQ2oRLCc
         EkSXYzJtv3RATfB0Mnd6F64q35TXURERf2uVIA7kUOznKCpVWoc+d4uzdxsEXxPWHdPL
         9Szg==
X-Forwarded-Encrypted: i=1; AJvYcCXCaXQnt19J7PfNIOiEN3C2GqbSuzBX6W7czr+jretojQDihRK1IyW3RoIHwWk+jmetDIDxnI9PUk+lIamD@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3Gy29OUUKzXT+oBvIDuf7dKvJeOsobeZYXmUc10CO+/JzLP/P
	pJnPrtxZOB9mNSb50twXHiaE6qsEc8xyyMyFzQqXqiwb/qA8aCoq5liYIMf63DzvEhkUujXkke8
	Y5f8SXHsWBSJHJrDcrbTGDNSE6cOls8qElIWQe/Gq1dFymqTuwx76jhVRuhFxJDll
X-Gm-Gg: ASbGncu3cJtsbpovm50zy9Nq4eyMKPTze3Uk+IZvnZOiK4XtkJZ37GZcP+zqBDfwu+W
	TfPPJlONAAtGZcTr/xfluXPGEvasYK2yE/OAKYy8EjrAr/EMax64auRvcWI1wRrrPHW4wAqCYLL
	LLxajONYgDNbFrE6qqEaJJMRPM9xUnNxQ+i2iWt4qwmi5xclmw11QbntSx52g4x1KBlzRQfbPt0
	au7dwJNlI7TSKDWxRjKtO2u/4K69NDR/wTE0E3jWit2RuGaaOoFu3JtSCfIYRh2F9tIaSPfezq5
	YPyE5HWqoyo92SEWq4A2jCS7MD/Fcy1Bzb17Y05A1nnEoCvHIwxQQXGhDkeNuL3O0mAjVg==
X-Received: by 2002:ad4:5bcd:0:b0:6e8:fe16:4d42 with SMTP id 6a1803df08f44-6e908c726c7mr74383906d6.1.1741686135461;
        Tue, 11 Mar 2025 02:42:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFGSytYD0gUExD8i7pJCZHGU18JQpmW4aJe9Ty5cJD0CL5USKGnlHQQ7o9cBjRcodkWS9b6EA==
X-Received: by 2002:ad4:5bcd:0:b0:6e8:fe16:4d42 with SMTP id 6a1803df08f44-6e908c726c7mr74383746d6.1.1741686135118;
        Tue, 11 Mar 2025 02:42:15 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac239438117sm882353366b.26.2025.03.11.02.42.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Mar 2025 02:42:14 -0700 (PDT)
Message-ID: <e73b3666-9f1d-40c0-afd5-5c0c83771e37@oss.qualcomm.com>
Date: Tue, 11 Mar 2025 10:42:12 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: qcm6490-fairphone-fp5: Add touchscreen
 node
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jens Reidel <adrian@mainlining.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250311-fp5-touchscreen-v1-1-4d80ad3e4dfc@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250311-fp5-touchscreen-v1-1-4d80ad3e4dfc@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: xLvfzRRGFey1qyGb9Z0OB_38EJ55_KOg
X-Authority-Analysis: v=2.4 cv=fvgmZE4f c=1 sm=1 tr=0 ts=67d00578 cx=c_pps a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=8DUqKY-xeV0tu31MSWsA:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: xLvfzRRGFey1qyGb9Z0OB_38EJ55_KOg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-11_01,2025-03-11_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 mlxlogscore=999
 suspectscore=0 phishscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503110065

On 3/11/25 9:23 AM, Luca Weiss wrote:
> Add a node for the GT9897 touchscreen found on this smartphone connected
> via SPI.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
> The series adding support for this chip (incl. dt-bindings) has been
> applied on 2025-03-10 to the input tree:
> https://web.git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git/log/?h=next
> ---
>  arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
> index 356cee8aeba90e21c11f46df924ed180bfce3160..35ce9dfca6f092a88d8873673ff57b591e210b02 100644
> --- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
> +++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
> @@ -1069,7 +1069,18 @@ &sdhc_2 {
>  &spi13 {
>  	status = "okay";
>  
> -	/* Goodix touchscreen @ 0 */
> +	touchscreen@0 {
> +		compatible = "goodix,gt9897";
> +		reg = <0>;
> +		interrupt-parent = <&tlmm>;
> +		interrupts = <81 IRQ_TYPE_LEVEL_LOW>;

interrupts-extended

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

