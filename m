Return-Path: <linux-arm-msm+bounces-81359-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 126CAC514EF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Nov 2025 10:19:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D2E2B4F51E8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Nov 2025 09:15:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A57721E25F9;
	Wed, 12 Nov 2025 09:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Doa5BFkw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZqVHpVIH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A93D1A5B9E
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 09:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762938947; cv=none; b=iHV9mXuT7WBvK5L8EdvuOHbiQIdGOpVSxpIPGsPi6zGooBPRAaiv746kjNm8ntWHSgh49O2qt0fvoTiLKFc7ccVnKgICY1vZ9aLsMJfIc3CtnSL6DtqjcW2Pk4dGJt9mFYD5CztZZRA9ADrsfJLZtr6CTyKG65KUs0WtF4JGvK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762938947; c=relaxed/simple;
	bh=rlf8y0snDV9ee74P7g1N2IjYrAAhAKaZER9lUpbbuiU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IiMoUXHkGGB1hHE5V2cK0GHgv0L4xK31+/DpLEwmp7OKKAkXiEU9GGlD8B5j+hko+6ttvicDrp1YdUR8Kk5eBuWKOSPhv9/eEb5KD3lnergWlvxN6GfUk1n29TAiviAqw/78aD5LIfJHOBYcBgFkp2YT/0rj4oP7iJqMd0hiAyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Doa5BFkw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZqVHpVIH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AC3HD8U4052888
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 09:15:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3PUnj++Jn64hBRSEDXwukit2wa8UGEl9FRtBeYAMRBk=; b=Doa5BFkw/Zs/X+nL
	KBN+Vxy4zE9s1VKhe18qUQVuzoiGeq4eoywSmAVOIRZDYMEYUSzPUZNGyKqj5CKJ
	3IwGEUkhoGWeqUR1m3nwseJIrk6pFcgCOZyoemObsjRNQsvusohGHhukTGaJV13C
	d7mR95RO38IWA9QHPSF+IMEu1n2CTJYcmrBwi62jBW0fLiuEQyX3UsMKOGZN01J/
	LIjth3N0Y8Ym4N+V+2o+v1DL2EW/lYbvHjM8E9KR+RPjObZeNSqdU4SCscxqR0Kx
	sobE4YgDUwt8CdIQ0VjNdRQlk7Ld6nUMMph2zXuPDoe0nyT2M7fLwPNQyNz2EkyF
	wFFvlA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4acj6v8yxm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 09:15:44 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ed6a906c52so1549481cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 01:15:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762938943; x=1763543743; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3PUnj++Jn64hBRSEDXwukit2wa8UGEl9FRtBeYAMRBk=;
        b=ZqVHpVIHYStZ5fAZNHezRYlmouQ1SM8yCNDQkCSy9elVbxJB7lWrTPYP4tU3zGVK+p
         vWPIwQF2FRe1oMB4XazFV2o5iatCgM3Ne3w2NK4GXvIzA7FX2dnys7nDwqBKMw2ERO3y
         xp6ykyDsmEuC1G9KVXXoku6a7/c/v+IMReH+iH901OZaOXx5C7j77rm5aANmkVAsZ7QO
         kgKrOUiv04KhjJGTEOwUSJq8f4IjIoRzr8Dj8RY1CZVWmEn+bgaVdxWLMfp9cCu9fou0
         aKGbqh4Imui+TIzMjCli2K5yBFGO3IsAp1wZ3pqkuwHYtRCV2W18b38YSgugsAM625O/
         eNqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762938944; x=1763543744;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3PUnj++Jn64hBRSEDXwukit2wa8UGEl9FRtBeYAMRBk=;
        b=gV3B7aLTrkkIY8xIfQ3ZReYLO+oeNMuOJUKnFkB+Uqo+miB8ja5IYAk/5tNX8HKsTd
         hug7rVQj2RLXG9hQ6ICM2NrAQa26uNhPEmPFCgq/vgefSskDLRwtEEr8DC85pxO61f+g
         3KoD3e0LPu45bNW1l/6b8oYyvDuc8+5sMAj+JEojj6LNh3X2WiP1qIcyGefP1SK0z6Dq
         MVroXyj1R0+o7UYxlRrZroJgWLqR3M2nYi6oKUo8+cIjUVj1zfpvuuG7PGAIij4zyOpd
         VD6KzUoAzmm8OHYbT8OQ4dqBPTlCGzx/oV2p1zB31lZ2pqfrsXAGnuWWzLSbdDfLFLCL
         uUJA==
X-Gm-Message-State: AOJu0YyR+Ac5EEoN5InyQE2YqU+Aw4kTpioOtsrBhtY4pHrX2XzeFvgF
	2F1owT+NAg5mMfbTpzLGpu7ZHyQD4dxUFvx/ACmJHhvfbhU6vtOH7lU5fvBeDYGT/GxHdbkp5Bt
	Iwmt0JMXc4OFxAorONGBlDGv/7xgkkUHaj7BaNANgkwhyxtp/hFXGYjUgM/foBu3jxlj2
X-Gm-Gg: ASbGncv/MjQotq5phJWput2vgLp2buC3PAZx1Eg2CR0Xs3rCQ1IX+h6CJ4kjrWEqqJI
	O+MaLPpPjSCEQnoLgm9Jg45dkZZvuqq2ujMrLWF0e651eCjr/PNmSk9yMVBp7Ycyte+zQ894ucH
	0dp+9RRJa87xMH0/7D8JlkPHij71PTkAN8ubUj0yNgeN2OJFJXtqImTojPuQEnW9nIZ0rtyXMoF
	K1LW7rgnCP/wxaMLUE9LVSGmNwsb/7TUWsz4PLPc1sENtMpQGwqGGXFB9kqR9uyNz8I9nhejqeD
	823MKrPFXBiaMI8dYl0wiBjjAFf6hcO/NSVx5r6lf+CbO9rzWYWcKbViOvXTZ7/w0qw08EaQ+NH
	J0NvhXpE9ieylLqS+AJvN8CZt/7i19nIYplB6PLo8ukloJZbRV+/LZzad
X-Received: by 2002:a05:622a:1316:b0:4ed:b409:ca27 with SMTP id d75a77b69052e-4eddbd65605mr19011751cf.10.1762938943558;
        Wed, 12 Nov 2025 01:15:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGIdhR2DGreZqzZEtahMhnF+t1wp8gNXxchmAbpfq57uIBaqNWhaIUDo4VDLqiBRn37Rf8YVQ==
X-Received: by 2002:a05:622a:1316:b0:4ed:b409:ca27 with SMTP id d75a77b69052e-4eddbd65605mr19011641cf.10.1762938943105;
        Wed, 12 Nov 2025 01:15:43 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72bf9bc214sm1602419566b.52.2025.11.12.01.15.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Nov 2025 01:15:42 -0800 (PST)
Message-ID: <66b634ef-6a69-4275-b28d-2b148df22b24@oss.qualcomm.com>
Date: Wed, 12 Nov 2025 10:15:39 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: monaco-evk: Enable PCIe0 and PCIe1 on
 monaco-evk
To: Sushrut Shree Trivedi <quic_sushruts@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ziyue.zhang@oss.qualcomm.com,
        krishna.chundru@oss.qualcomm.com
References: <20251111-monaco-evk-pci-v1-1-8013d0d6a7ca@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251111-monaco-evk-pci-v1-1-8013d0d6a7ca@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 2O8SiYCellkfNwVGxjxdON-N3rjt7nez
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEyMDA3MyBTYWx0ZWRfXw5Ne6+tYupRi
 zMgtXeOKlCVp95fL3+ZCLy8DNFVQNZ03pDheomCpz6Nmdjam9YUT/HBFsgjHrtTbFICvvZ4YRpp
 dhOOJBeSLgbo2tDhzxB2CBNAvvedW2yjAYgBJWAVwmh0UZQuPfVk9UfNy8Inzj/6Mshw9nOnDZM
 gEGNkEZHzC9tHAxpWmz1uUJuQqv3xDmOpvOOWBdnTK6Cl54hJKNEUdSR78M1ndbWD4b5yHlRdF2
 wEmPT5t4lwW3/Cc6kOzxJdc81zqWpugni5KI/bXZExlfCNXUwa3g5S3+sYq7ahUWhIt7ckuWyXC
 HBstVVioWEVDnjp6ndHbe5eXXfX+Vh2rLEv9OQrOxHgWpy+fFuvx5EMrwNYwAUysGm0N9uJnvG+
 Ier5rqk7zCyQegyCfgnY4ZnY8VmLzA==
X-Authority-Analysis: v=2.4 cv=f8dFxeyM c=1 sm=1 tr=0 ts=69145040 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=9FffyO56NNMGgoAXEYMA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 2O8SiYCellkfNwVGxjxdON-N3rjt7nez
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_03,2025-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511120073

On 11/11/25 11:08 AM, Sushrut Shree Trivedi wrote:
> Enables PCIe0 and PCIe1 controller and phy-nodes.
> 
> PCIe0 is routed to an m.2 E key connector on the mainboard for wifi
> attaches while PCIe1 routes to a standard PCIe x4 expansion slot.
> 
> Signed-off-by: Sushrut Shree Trivedi <quic_sushruts@quicinc.com>
> ---
> This patch depends on the series:
> https://lore.kernel.org/all/20251024095609.48096-1-ziyue.zhang@oss.qualcomm.com/
> ---

[...]

> +		perst-pins {
> +			pins = "gpio2";
> +			function = "gpio";
> +			drive-strength = <2>;
> +			bias-pull-down;
> +		};

Neither of the two active-low reset pins should be pull-down, use
bias-disable to avoid spurious assertions

Konrad

