Return-Path: <linux-arm-msm+bounces-75301-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 758A2BA37BC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Sep 2025 13:22:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 301F5624254
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Sep 2025 11:22:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E996C27B356;
	Fri, 26 Sep 2025 11:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Cp1fQwov"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 817821A2398
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 11:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758885775; cv=none; b=H7vzW9OR7FGhlZHJLpNLeih07tGx0/r/bnGxpJapITv/NT9cXYvlIgVns3h5TSmishfBeHifkBK9Nn3GUtv8qaj4oyDhSU493zlHYwxe0LtTgRMVkPdTuc4LpZ8PRj5AZ97S0wnOIm4xsDwPseREnt5ZJGf3Gd7XUtgrn2LXe0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758885775; c=relaxed/simple;
	bh=w8UjKz3JmAkLlT8rRIb4rtiF9FozQNv2oVZ++KgEcIw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SFHhEpkhUHsq3yGIBEFMW/8e+z+Lww9xp3Hi5IhxIFFMAaAQfiGJQdaJJ7q5RnYZiM6gurF4bmMqPVFqw9RNtfun5ZKjh5GRMiehYWTtNbrkoprOQdRcUU53+SoT3QOtwtDaY4OIzvb1YvIzJP/JfYdw1A7s8zfr8M6E7b79ZYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Cp1fQwov; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58Q8vjEE028717
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 11:22:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tuxtX1890cPtd+MHmOZQ6ujci4mRqE3iVb2IHgC81aM=; b=Cp1fQwovEC++G08l
	rDd2rMDgVWnZfR0Hic/oDBz3427IdZ74vJY7PTGfxmOyOscznIMH4eT+2asXb8cD
	Zk2dh4w72ZgzOHxxHpM+enLpNoDsji4JzqvSyOHlLesrJxNk0xyi469fNFx/xPmU
	FHPAi992rxw0e7zhNiFOe2XjWkKOG6GaKH5lj/pyGN50QmpMRkbiwoHHrJZKVMNh
	9hf/EUxxSvlp7VERvYZnljLBnLOQTZM6Nx4rLEAW+iKTqbjRw/Qz9bQ/mhk89Jda
	woDD4M0WxujdsCyJuyFQdbCNnIiPbUh69QShX/1ZWiKIfURnkxMrNX4TdR7N2peb
	AC0W1A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0q2mmj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 11:22:53 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ddf2a2d95fso1160721cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 04:22:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758885772; x=1759490572;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tuxtX1890cPtd+MHmOZQ6ujci4mRqE3iVb2IHgC81aM=;
        b=AigDdayneVM7K7rMbXt35U21kitzURmkOEN8xLanm8FqjYoQNAtJRpOUlGlQKCPTGf
         oF1RjZEfVVAElLg83FeGqKV5UJuyHeNb0+WLu/qvCkw20T2zlIauBzbJqHrv7fRt9mgr
         El6WgJ14EWWmJ1avcqDonI2sQ8SS5d3GdjB6a/YtVsNZvcUmJnpjB3XRwtjcqCBYdmlE
         DgqdQ9Zr/+M6UejA791RXziajcYNyIaAFP7sOFcb+fUtVYIT74Rpy6fnhI8TOeVwHKm+
         Gebhdk5x+Nbv97PstCMQZduUOAYDtAm/Y+6ofs6P7vKym4X0fmTZh3QzwGFqjMPoqF5r
         M7TA==
X-Forwarded-Encrypted: i=1; AJvYcCU870YxAQ+ZSx5J792DYzJC+UxYHD5Qt1zRWMA8sdKrJbWy/gCLgTIe2hKYvpQKEnf5F5JQ+2ZpMsz2eF71@vger.kernel.org
X-Gm-Message-State: AOJu0YyO/XrIsG+GOnTQfkl0bvcLzYEoS6umSPzUBlstLAT8XVrukTvj
	DgOoPAAJ34amKnkE5sAtqkr3VAQTaw4H2DqRikYWgdSgayJykt+XKvfHbBRPs24nPPfe753SQbq
	LPT7ptfyolqovKFUT6X2q+SmWvaHX4T2zcbOS9dlejIV8BF1voa/5bOwo4UsF0Dfre5QH
X-Gm-Gg: ASbGnctSQ+zjS6y8eh6a4oT+IFxrFCNVa087af7WIqVWsr5VciQJyPsc44VZRzwaPqs
	sGA1BZfbdwwSbhN0vKmIwNQMA9UUyVqiuJqfqhvlIE0Axs/LeYEbfCO7GjPZznOJ7F18xEMviDq
	yUAwS2LC2HMuUPBkvKeG43RhT/tPJkGm983JkDCD+kP2V2BlXRYOhZjk25hf4KTNDkP7PsxAMtA
	p3lJcJEd8dD2ZI7Ejcsp0pShSH4FGT51sTz8wxNvug5mncb+oGDhHcPkoYyMDnnq/684OR3zN3E
	1J7QGJ8dE9PWMM4Elf0PNGDPYhLU96ZEjwk/CbpUnYg5czidyozi/87rxsWCpnZ2qUo9O7sC9hd
	FwzM7aOs+suwpIv9UaVWZrg==
X-Received: by 2002:ac8:5d92:0:b0:4b7:a9cf:91f with SMTP id d75a77b69052e-4da4b0490f1mr56089431cf.8.1758885772215;
        Fri, 26 Sep 2025 04:22:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH/1aHo2ihdQlKwwuKZGd5wor5Yh3McpdI62z7YQSSu7aCujq1R5bN0ifT/tMZPZVvYbkZYRA==
X-Received: by 2002:ac8:5d92:0:b0:4b7:a9cf:91f with SMTP id d75a77b69052e-4da4b0490f1mr56089251cf.8.1758885771824;
        Fri, 26 Sep 2025 04:22:51 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b37463f3efbsm177337766b.28.2025.09.26.04.22.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Sep 2025 04:22:51 -0700 (PDT)
Message-ID: <8d0b29f7-6919-4d70-9262-1ebadb149694@oss.qualcomm.com>
Date: Fri, 26 Sep 2025 13:22:48 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: qcs8300: pmic: Remove 'allow-set-time'
 property
To: Tingguo Cheng <tingguo.cheng@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: kernel@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Fenglin Wu <fenglin.wu@oss.qualcomm.com>
References: <20250926-remove-rtc-allow-set-time-v1-1-76895a666939@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250926-remove-rtc-allow-set-time-v1-1-76895a666939@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfX5GP/aFW+Ceh5
 prZ+FtRNj3MhTj5/bzNhWc6oWz5+SVYGiN1JBrGk58YVfTgmDzfAc7uoaXnN10XddQb4zjbnnJi
 mYbU54oDOb3EDwFag1twvFTVmNPnmO7RA57A2vp3sXtyUvTwmdP/wn10wk9WpLJ8YVeFUqto4lV
 6YE+5ts2h2cKISTB9y4csOXvFs1ElPpgqDryXyqcMc5Q/N32etITjNvtMIeRSbiOdiWmMEUw6FH
 7N16vB9LXeMRbjY2+/VutXC4sz7Cob10YOYEZZjQOOK4xv524C0UeaVFZD639vlo549eFv/Sjic
 HbUeWJymM9jVdjCbEGgkcwzsXKDtltfDef1vQvf+ZmSRhvyp1uWd7vQB1v7hHZ9jWm5d6lpU7Wx
 1Pylgp/4sxAUhSalPI+yIeY6p4Qf4w==
X-Proofpoint-GUID: RQGbcgDJcHZh2plTF_BaLxh1qpW2ZxPZ
X-Proofpoint-ORIG-GUID: RQGbcgDJcHZh2plTF_BaLxh1qpW2ZxPZ
X-Authority-Analysis: v=2.4 cv=JsX8bc4C c=1 sm=1 tr=0 ts=68d6778d cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=gJi3wn3HMf6CnFoazlIA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_03,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250171

On 9/26/25 6:09 AM, Tingguo Cheng wrote:
> Remove the 'allow-set-time' property from the rtc node because APPS
> is prohibited from setting the hardware RTC time.
> 
> Signed-off-by: Tingguo Cheng <tingguo.cheng@oss.qualcomm.com>
> ---

nit: "qcs8300-pmics:" (like the file name)

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

