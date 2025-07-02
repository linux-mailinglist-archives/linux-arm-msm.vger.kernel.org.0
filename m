Return-Path: <linux-arm-msm+bounces-63374-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 578EFAF12B1
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jul 2025 12:55:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F36777B1650
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jul 2025 10:54:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E311253957;
	Wed,  2 Jul 2025 10:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m/X6c4iF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0586725BEFE
	for <linux-arm-msm@vger.kernel.org>; Wed,  2 Jul 2025 10:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751453725; cv=none; b=YnoA73IIrLhL3tlbKiaOT5jFxnpGs6zriZLdKZMa08TyTU2BNGVyvuF/b6oyybN7sK6Ks1PLSLvDpM39lm0y6VlsJLuYc4AxvgU2JPQ3WHrUZzx5AsDEbygrenbYhQRhGrqzwbRvrOh0jcH0oHnk6rvAlWaPhdVfY5Bw+7xrs6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751453725; c=relaxed/simple;
	bh=HJyf305xWispnULlnnZ3Q3DtQcVy4HyrdmFWRFyLtuc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YCQPbok2kDrx6HWxzT4AHB+lrBUWbgG0jcizZM/ekdR9QphTqPpBLXq4RcdsagcjiKrd9N7GPpxUu0seuqmIx1coZwfJIlom1TzvT/6VLk07F2DJnUhUI54+3lj/OLCUxnP+SEbts6Sx0RWMr0EF9U3wcPt4Y+bw33sbLMXGWnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m/X6c4iF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5627NEEb032762
	for <linux-arm-msm@vger.kernel.org>; Wed, 2 Jul 2025 10:55:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vk7TqcM/VAPxFNM7d3Vzya/VRZ4hi3qF661iXGADBDM=; b=m/X6c4iFCTta0kJR
	zo6MvIGC3UD3V0FUVx/TXYrsL6IY1pAoqm8srfIx7DBcf6/lnIrk0JA8ZpCTvH4Z
	o6uFzzZPsEuHVEWmaVwPlrRmRlVshqPzWtiD2fgqAYV93+OrILVoeksFdWbaygqA
	RBPSY0rBRUB1HGBiTjdSXZClhgU4BUirMCpMR93/0rwds9u+Q2rWydI0mstHFx82
	nRww7j5a+aZs+bLk8t0UWJvYe6Gukr4nSuiMdLUtIrd4WeJNIqGIO8JCIj2fDvxA
	FSRBtL1kC1NHVIG6moQms8qGt+QWCs2nJIevpV3CuUjZjNXUeoDzLA6sGSUP02nI
	sT2NiA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j7qmc92q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 02 Jul 2025 10:55:22 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d0976a24ceso216309085a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Jul 2025 03:55:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751453705; x=1752058505;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vk7TqcM/VAPxFNM7d3Vzya/VRZ4hi3qF661iXGADBDM=;
        b=m8BVG8OmbWacdJqohq/J9yM56gPtK+mUMo2Vhs6CMNKsGdoTpDvAnJrxO5or88wpTn
         1/0ppLFotY7TVx3lOl9QJ6LjCZoztZH7XkI0Lvczs5nWAZWFvuvP0bqboMD5enAznD23
         swvITFWm8HLqr49kUCBP2XQWMcgi7e7e3WwkamBsK7Q17fFoUWUULqthac6kmRnhiNY2
         WlfgGiTlkaR1F/v3EKcXsF5vS5AQuGuEDLDrYPZVrrZcbyDze7kEngAs10V55Nxo45KM
         e8iCCfMOinUNEx6v1sQdEjpiny4u0LWRZitdenmOMNFrRg6BuhQWtMiJpopsFEcZPiQY
         KHmQ==
X-Forwarded-Encrypted: i=1; AJvYcCWe71N/GQ8RXFTScAu0Qw3I0vsAHgYVpszPLo7exp9Rl88vsAYHLv3wgtSGdXJDZtpNO8Zz2X+JQvvx5kXI@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5FJ9M6dMXlk3tn0Wmz/yfsOczyiAGbXijyCDX/qR+9e5dZuWh
	ntpSylN6clMEaP/E5U/YbYv+B71B3p/IguqV/daPIa3JR3Z+pF+ok8sfcoVJ3GHf+6l1FePMXhP
	xsLrCBi286FVrS5IR0fgK5AYTsLNJzTHifztnpIMnO4vDwDU9QzJO5wi82Nru73E44ytw
X-Gm-Gg: ASbGncvRtt8yIxJtDOfjT57BPq2dl8IEmyQr5jylY5uyNiljFM8qBWbtyCMDCMH1AS1
	p7FT8ry+8Nw1LmXBXaMiTtHOmet0HS//V766qBxsANqFjr6EKN88O0vrSEtPHowaDyqa/Pyrybs
	wR5yqAIdvZ8ST2T0e62EBUgV3KwmCjU9iWqZxqcUC7o0kSo7GnaQtTcfn616wkOIZ59wHvnztta
	zk207hLetCyiHPMIh7H3fPPsCa+d9a6YxIL99qEAVqoIMxH91giZ6kheuT0ai/nuSC1KpzjkRgf
	cDgQzCInrARiQpwVDo1IMZ2siYjbdNngcILL494hzR6tGBSw5reLf/2k54PcXXQZfrvSSRZS30D
	cJBY=
X-Received: by 2002:a05:622a:82:b0:494:b869:abf7 with SMTP id d75a77b69052e-4a97689a84fmr11869721cf.3.1751453704938;
        Wed, 02 Jul 2025 03:55:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH7S2eRUdhaoYyMorGOcDEdRDtdhRw10Y97aNdF7YBj0R59JlX2lq1116ZUFVEFw99flEQ4Vg==
X-Received: by 2002:a05:622a:82:b0:494:b869:abf7 with SMTP id d75a77b69052e-4a97689a84fmr11869461cf.3.1751453704291;
        Wed, 02 Jul 2025 03:55:04 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c828bb118sm8938089a12.2.2025.07.02.03.55.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Jul 2025 03:55:03 -0700 (PDT)
Message-ID: <9c4005b7-8c01-4880-b0dd-5be4841616c7@oss.qualcomm.com>
Date: Wed, 2 Jul 2025 12:55:01 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 3/5] pinctrl: qcom: sm8650: mark the `gpio` pin
 function as a non-strict function
To: Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexey Klimov <alexey.klimov@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20250702-pinctrl-gpio-pinfuncs-v1-0-ed2bd0f9468d@linaro.org>
 <20250702-pinctrl-gpio-pinfuncs-v1-3-ed2bd0f9468d@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250702-pinctrl-gpio-pinfuncs-v1-3-ed2bd0f9468d@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=C4TpyRP+ c=1 sm=1 tr=0 ts=6865101a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=KKAkSRfTAAAA:8 a=JchxpsDTO30hHQ2eRcMA:9
 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: nRCTr-LEDHLQUtv4rsBiaj065QGSJYCP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDA4OSBTYWx0ZWRfX5iHYJ4Pe4m6+
 4/IWcKigGY/BRHBuS//YlzeJHX/3aAI91bcrn7wbs/tfFVb1YVY7melk7Z0Dfby7Y21noqOFGa8
 kve1we2Y1UAS6kxYyOQ1rkEw1+xVkTHGVssACApEvJnQ3isfvglztMQVG7f2EOMbmK2UADnx6nl
 sYg8hv3UQJnWn7cugNmciawRSgfhD9sMvJZZR/a4UbxrK4szl5p5rDtxgjcruj+LWpYNUCZ3wED
 V/8HyLCpIr6Yh4WcGhojY09iXj9Iiq3Sd+5WardXSC3KZ4hPJbtOfofgb3GLK72WYxLFZ4dxMM6
 ysd9eof5W8CS1Xr/A+L3i2rMFHMsoZMTmAcwZ5AF+YxWRt0rwF0qHXqHxmfVZts6WEOmdtuHMZ3
 iq8Sv+CYgIjwDhve0p/Hpn51lpdS6gYtoAPTOyZJOVyTEh0ZFxpooGAWkDqICZaWuq7J/jze
X-Proofpoint-GUID: nRCTr-LEDHLQUtv4rsBiaj065QGSJYCP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-02_01,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 spamscore=0 mlxscore=0 mlxlogscore=561
 adultscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507020089

On 7/2/25 10:45 AM, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Allow pins muxed to the "gpio" function to be requested as GPIOs even if
> pinmux_ops say the controller should be strict.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---

fwiw this simple change could be a single 'run sed on all files' if
we decide to go with this approach

Konrad

