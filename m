Return-Path: <linux-arm-msm+bounces-72611-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 472F9B494DC
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 18:15:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 16ADD1BC39A1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 16:15:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E466930DED1;
	Mon,  8 Sep 2025 16:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JWP7pwRJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45F7A30DEA7
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Sep 2025 16:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757348101; cv=none; b=CdIIm8zz73PbX9QN+AL9OvQSQhdsnkxnraIGGZ9fiHiJ/87F8wPeE1MtOwjdyHvK2ATq9h1S92eH0S2C0vFKlQ9cwPhCNc5wmoxsmXyLxLZExX1maThSINnY8tObCGvBn0eqpvjvSNZcPFgVsymCeapW9L7qMGVKAwZjLpDvS4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757348101; c=relaxed/simple;
	bh=my2J7ZSJKgwOGws1Hzn3zA5jTkV8FObsyOMISQJ3baM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fESlTsxB/6sOYxeoqZRMsheFsksY+FBt+CrC4OWRsar2ddAs9L0hKhqeZNyoDDESr76n8Ceh2y4DIcQHg3cdyNRs2R7WLraEcC7j3onx7JtXYpm1mwltUcQDjRrGjwSxY4E0u2/MVqqz1hIUsnexhSv9SA1iAyQGTkGmdS7zubw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JWP7pwRJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5889a6Ff014843
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Sep 2025 16:14:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uNUg7SeCQHOb1a3Kr4zUTJOlns3BsZPwl8vdQ/gvp4U=; b=JWP7pwRJqb/4XlNK
	BSNvvQAQIwgdwBtdYDtuX4xfXMrzCZkoe4s3IuBXiYQ+9P/hGqp9akDdbZ6c9dAL
	iVyB3EjQJp1Y+Gsxs8Yopt0UTQzUfMlo3jfxNEmoqvgfFjgGScLVHoHMsWjp6Rrf
	+rs7Eo2/IQhagay0vlyaCMy4JwQTpZRUiHY1oqXq2glG+jG55s2zJ+QUPVpZQF4E
	NWcB7jKWAwGmcBH+u3gTsUazNdi2+nKGBcmgLxcNMppUfgsr7Gqj6dHX3yfEBQVf
	fwaCklWz40tP12XQt3qskJTB8hHCbHFnQU80gthIPNLsD7d751jx0ExxPhkIUX1w
	BM/eBQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490dqfw2fr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 16:14:59 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b600d0a59bso10909341cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 09:14:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757348098; x=1757952898;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uNUg7SeCQHOb1a3Kr4zUTJOlns3BsZPwl8vdQ/gvp4U=;
        b=NipCbXaKUL0tX/2W21tJrkyau3fwyfsN7clSxpCQjTAPPxSn+dDdTLtJ3FK4mmSw8+
         iXhkxT2/I65iGFgw+C0Na5AwbMU/wyvg4tokrRH4vBu3Wv4X7zQByYZRpmP//eMz/fCY
         YMp0096Fa22XU+O6ELw0rd7wstIxOEnIPxepKjVrhtkBJZoToqiN/daknK6vOO8pFIgg
         fYIh+kkLf6T1BYQrHUrLOiIdC9gDKV+tqE1ji4BcuUWRApazyufSG4Dr71a4RRQgELxS
         lM7Iyjd4Rd/DfaC7yYa46gsI/vgGawt0gOercxs9mxxmO3CS2jEvL/dC/V35vZC4vF0J
         boSw==
X-Forwarded-Encrypted: i=1; AJvYcCUa3HpLFSTkieENZoea64s/0QIhQizXrxTqjmloWznbVSEQjXD1oR3burwEWWIXuRE09BKdJqFTSIXMa7Kg@vger.kernel.org
X-Gm-Message-State: AOJu0YxrUf6MBZ215Awa8e9jHbvkHecLxxTkVffIoEGzkTqVl2o/+FQh
	g1o213xVCZ9msIsG+RywitH9thc1imXMnoIbvNQBBw1/VZa1TFYPwS3DPbFxqvoVRcNPoGzLoko
	t8Hu2PjS4f77wlcvAZL5foQhjphDvAZyP+FUNKPNQyIodBfzFJb3j1QEuGwPFWF6KrGSU
X-Gm-Gg: ASbGncuvHTidPNEYbWrtMiTeNTT0b+2JMBmi7+ee9/Zl7++Y84OhM3DeocVznwZ0jsY
	ndiD4tUrSe/8x1djh3424Gsfrmj0x2d2W/dyMJUF+3kBj1LZ0KT7SCURYivRi6PUvBlRF2u5ei8
	53smuhz4hYdzlNmZrH6aBQCN/Ivk+fACsxS/NxIJ4I4XIsp+SI0Dyk+LYMca/l955PROxfXIXxe
	kE54VLFpmMmhPlHrPrX2pneErJzdRaKbF73nOLV2DHSB7XvD4pkNvms4u9ddrUdABtuR9pFZ1Ev
	ZntGjvQPXJTPG9w7lY6JcA8cgkz2orcK+7KjYcz5BvAojsRNst1kI+aZvVVNTSnCU1bNaUpjEaV
	jZQCjH2vh6N8M74zwlT465w==
X-Received: by 2002:a05:622a:1803:b0:4b5:eeb8:9dbd with SMTP id d75a77b69052e-4b5f8389c08mr70178151cf.5.1757348098031;
        Mon, 08 Sep 2025 09:14:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEco+Q/q3RTA++gNO5I3yZ9Bu9pgiKTfiyr/MiXQ9nF5ACsplPzOWYy4LyCZQCEZJJixvAMtA==
X-Received: by 2002:a05:622a:1803:b0:4b5:eeb8:9dbd with SMTP id d75a77b69052e-4b5f8389c08mr70177621cf.5.1757348097446;
        Mon, 08 Sep 2025 09:14:57 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b0307435422sm2283685766b.78.2025.09.08.09.14.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Sep 2025 09:14:56 -0700 (PDT)
Message-ID: <0583a79e-d87a-457c-8416-f3a0b240d63b@oss.qualcomm.com>
Date: Mon, 8 Sep 2025 18:14:54 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: lemans-evk-camera: Add DT
 overlay
To: Wenmeng Liu <quic_wenmliu@quicinc.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, bryan.odonoghue@linaro.org,
        vladimir.zapolskiy@linaro.org, todor.too@gmail.com
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
References: <20250815-rb8_camera-v2-0-6806242913ed@quicinc.com>
 <20250815-rb8_camera-v2-3-6806242913ed@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250815-rb8_camera-v2-3-6806242913ed@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: DRrYOIjxZCVsIVipjnaFxy72arbcp6jE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzNSBTYWx0ZWRfX072mYDL6iTf+
 Apl5ilz6hLXRShiC3g4rNg2BcUSUOUkgDXIH+lQFwyaPn/PhitHZDd5T25tg4P5VNTsR+U0cwj+
 16/F/QOIYm1XPIeybwCZS7KcopqBbll2fAQLVNtKCXA5vixkL7hlDxiB0yL4XnT6uzmxEwLwB7l
 7nH/BVruPNwncfhFfQJybytjQf0j8wiACUxmppEwk4TtaxALG0pTmBM2QKKF+0vIbuttbUqRBda
 GskDpOLhcQBaoG5zG39ungwlKqQwIIC2Y06fl1jfONGGx9CR+WlFp1yjBuQwbo13XNYUlvX7R20
 hhio+IL0ekpQSjNYLHUZPsv9P6OJ46JB0j8I4JbIIM4OQ1vOgtUFbDX/NO4aoutqCHl8HiKnrqy
 erk3dDb2
X-Proofpoint-GUID: DRrYOIjxZCVsIVipjnaFxy72arbcp6jE
X-Authority-Analysis: v=2.4 cv=N8UpF39B c=1 sm=1 tr=0 ts=68bf0103 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=gJbItJof4LNU2qWXpP8A:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_06,2025-09-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060035

On 8/15/25 9:07 AM, Wenmeng Liu wrote:
> Enable IMX577 via CCI1 on Lemans EVK.
> 
> Signed-off-by: Wenmeng Liu <quic_wenmliu@quicinc.com>
> ---

[...]

> +/*
> + * Camera Sensor overlay on top of leman evk core kit.

"LeMans EVK Core Kit", this will also fit in a /* single-line comment */

[...]

> +&camcc {
> +	status = "okay";
> +};

It's enabled by default and there's never a good reason to disable it

Konrad

