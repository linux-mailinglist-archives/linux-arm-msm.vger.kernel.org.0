Return-Path: <linux-arm-msm+bounces-85481-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B767BCC7554
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 12:29:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 02D46313D5B0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 11:24:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA25F33B6EF;
	Wed, 17 Dec 2025 11:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fPdzRIWT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WMDL5gZj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 384C2336EDE
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 11:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765970565; cv=none; b=Ln+JTJyr9WxWCjw3n/JIZv8jpSX9wcku6RvG44t0KLQYxUwTSWJWcyiPGj7ywSN33nbfMy2SHjfSYkEBbkRJ4YwE6nsMg4TVO9I0s5efomho+w19n42UUN5Spjbye0eGMDc5tsOzYEZ6C4K0UO6NsPrZiho4iaI0RG4ebU5WHKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765970565; c=relaxed/simple;
	bh=zlzU7qIdsecqm8Yd7BNW+zl6INOwuUiiu0g873wFH5k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qnhdqu5ndcuMHOSW0xTSws8dUtIDvuZDpGrI8ZwF9QiPrqSq8dhqteMh013h/SUIu0FQkxVBv+75u19spMGxB926Br2OMd+TLAdFudF4mJWxguTGOF6UCswJEB79eFj1RTZ4jVMYVoTdZsx6I51f0d8nbeXePA6y4XcAAlsskbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fPdzRIWT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WMDL5gZj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BH4XMVP2316084
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 11:22:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ov7UtnMKy+iCr1FWcNiuhjlgqm4w4M39va7/6IJ8+LU=; b=fPdzRIWThH0K0FRO
	++A1+G1UdANf5j81dRei2mgij0FOp59jKUQ6JaGeN61MNY4N+Ot5JibFxdDLmQv5
	G71o1GrcqZ5AP1BsKKSRNFDJX/KfI11JRcTR8Q95mIBEdJTuqRVIV9jm0GSzGqlD
	8qtysK6m9lanmoVKLDaUN5jwkbNkyWmgCedf7O7gG7vi2qL/cMClDXuSuBggA1I+
	935NNkNuVZ3clTluZEwvBei2/SoUXVZZwHI6eAoBNBz6qEDZvHVzRLzpROkkz22K
	uRkFB9aZ2wgHBWHyRxz51d+2XBR9G5p9MxU6ZkFPFbyqZpqKCevjBkL9A8xrDGKq
	Q2QOWw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3nkkh8w0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 11:22:42 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b9f3eaae4bso144063085a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 03:22:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765970561; x=1766575361; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ov7UtnMKy+iCr1FWcNiuhjlgqm4w4M39va7/6IJ8+LU=;
        b=WMDL5gZjfiGeLTA89dHogKYEiMvAmxCVayUHRHjPQbS+w8WHRtnKeKq6Emds/M6Y6B
         uTyoGTCjz4Z2fcnjKdyRrPeG1cKfG/WdxJj9/+behcJWvRXLt8q63M4xHFCiJelAJ5FU
         ZX31zNZO9Lb4GWIF2P9c5Hfp33s0ZvQFdB/3WCa2cVWno0q5A0SzT9XcvQFJR+OVnCvE
         HjpfJmUvEMgx9K1vQh0a+OUp/zLLeQghjTqG59A9cfrigfjgtVQCsZ93zM7a0VNy5FrP
         2WT8RJNwoKYKYwzIb0JQWz7idYHEMjs3jHy40fE8po73zIo4Zx1v0+nwpNaKSSCIKj9d
         IeZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765970561; x=1766575361;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ov7UtnMKy+iCr1FWcNiuhjlgqm4w4M39va7/6IJ8+LU=;
        b=lp+T03f7UzrxbANRmhZ54+bj7LMPyrYFQ8Vkdd0gwM8SP8O9VCUbHSq7GBFVsbJnZb
         o3QJd8HGABo46aymC3lOWlX9zh6k1fDAI0sRYs45VpUgKqd3/ZZqijBrBO5tWEne7ZIG
         gmq3V8ke2hKvY9384/u9JS/N11C9Kpj5jYgkhO98nVOviproGCu7AmbF4OynRuGCtRMO
         TA6JuWzA1fA+TOuMQA1/Kw54GG2LTNjloxYTVKvUHjm4n0kR8tk4d9IgBOgZ6PfPrdqI
         rPA7ee25CRYkMWvFx/z7bQHQogZs5EsS6A8pkyGcWm0BrNcrYCuGzdF83pOgyn8v6boN
         c0Sg==
X-Gm-Message-State: AOJu0YwlOQpXg9ioN53JTI4nwIGAYaETnIEzJNGFvZfBtBhZ89XM203q
	hCiycADT0fwHu/hSgEYP1FpD0YLO00dcBq2qdFq11EP4GmJGL5AiacnfN0+cCHynh9v4BhfpG6h
	s6/x1JLPDEQ2HG22UScrdm8MCy6aQ2CfW3zGITeQQcL8lrzCkxY1UDSJoo6z7uo/alpoa
X-Gm-Gg: AY/fxX7jiMZ92f1uiSFdkRyHiL8lK4MdO4KQUQJ0fHwer2OmmLl0C2gKtcmrrtx4hCn
	m9h0/KUOQYtyzt2av9cBOiYYmaw3DlTmwvCCjMZzLJ7Brr7PxTbtMqR3SI3Svg/iTQplqadskGf
	5pQai2sKOXbAdZiOj52FbZIy9aWk7pEWzXHxFbd8jg/4k84qt+no7VlZbZSmvarbhYo3DnqSWCO
	getLSGz0hgXAZi58Qaz3iSDSlW5rTf+EbPbyuG7NVFzWU8y8eyASbVqqhn/mplifrY5b6EJuFqI
	UPmxFMuqXauxBVAznJ7Qws6C4OjqPWDeSu3ZXbBp3QFvvew4cvjzbjIgfHPBNX8YJmNxZ4xv8PX
	/IalyK7Dx1RjLqtvMB6Ck0fgl572XIQrF2cRLxVXMWzPx1gGhptYCGhm1ixWypgQl+Q==
X-Received: by 2002:a05:620a:4405:b0:8a5:2246:bc29 with SMTP id af79cd13be357-8bb3a254065mr1969175885a.8.1765970561572;
        Wed, 17 Dec 2025 03:22:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGZf/mPeoRWC7o1Nag4SNB0IuoDlQr/tUrsUb9Qj6Cq/abGekbh55WEonT9E/KnFjsAN5cWPA==
X-Received: by 2002:a05:620a:4405:b0:8a5:2246:bc29 with SMTP id af79cd13be357-8bb3a254065mr1969174585a.8.1765970561192;
        Wed, 17 Dec 2025 03:22:41 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b44620bb8sm1172917a12.14.2025.12.17.03.22.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Dec 2025 03:22:40 -0800 (PST)
Message-ID: <8f721d93-e1e8-4959-8ca7-4b4dc505110f@oss.qualcomm.com>
Date: Wed, 17 Dec 2025 12:22:38 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] arm64: dts: qcom: sm8750-mtp: Enable display
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20251216-sm8750-display-dts-v3-0-3889ace2ff0b@oss.qualcomm.com>
 <20251216-sm8750-display-dts-v3-2-3889ace2ff0b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251216-sm8750-display-dts-v3-2-3889ace2ff0b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: rsychWp5_8hew5YRMGc7qVYZ2s9fGAbE
X-Proofpoint-ORIG-GUID: rsychWp5_8hew5YRMGc7qVYZ2s9fGAbE
X-Authority-Analysis: v=2.4 cv=f/RFxeyM c=1 sm=1 tr=0 ts=69429282 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=drb9gvCtaXarAPuUoGYA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDA4OSBTYWx0ZWRfX+g3PV4HShd6e
 hLuHBHk4O/ufu/grjDJJrD/nYJ+6QyctqKE9CnOlHjr1I6WGNqWKGJuePQzn/U09pZajUaJBq+4
 SnuDnT+OQkd7JBHltkQc+BGHC0FYsBi7NVGTjJ7wDe0Is07AkSTNRSXE7hUk8dc+K9ypRvrZjVN
 A/wNRNGhAHGtQet98lnyDBwmgDSCCLMAS1cYHqwNIFzEjlyDmYVZdmLhaPFBrnb2cRTNq58VrpD
 bjMwW8mXeqzAP7FKaOK3+Dz5Tj9Nb687xI9iOF7VEy/7bAHoUdyprNmfU370d2F7yNVHIgDyevO
 3zmJIRzHx7kNhJXduXdHO6BfiJmC9bAHhJkLoNd3TPRcGGec1354xwJjmsi22Jg+80IAeUDN06N
 J0kS6MgAKqO0CdThMtqb4uTPz4mr9Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_01,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 adultscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512170089

On 12/16/25 5:47 PM, Krzysztof Kozlowski wrote:
> Enable display on MTP8750 board with Novatek NT37801 panel.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

[...]

> +	mdp_vsync_active: mdp-vsync-active-state {
> +		pins = "gpio86";
> +		function = "mdp_vsync";
> +		drive-strength = <2>;
> +		bias-pull-down;
> +	};
> +
> +	mdp_vsync_suspend: mdp-vsync-suspend-state {
> +		pins = "gpio86";
> +		function = "mdp_vsync";
> +		drive-strength = <2>;
> +		bias-pull-down;
> +	};

FYI these are identical

Konrad

