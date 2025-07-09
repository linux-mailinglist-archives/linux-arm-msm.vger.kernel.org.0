Return-Path: <linux-arm-msm+bounces-64278-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C98EDAFF066
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 20:04:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 40C371889053
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 18:04:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0F6823ABA9;
	Wed,  9 Jul 2025 18:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KnupimiL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB1F022330F
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Jul 2025 18:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752084219; cv=none; b=ghgTOwoua/xbZO2fYd1k5LBWZDJoBKRmUjK0bYfRk9aZsaw4vQP7h261mfejOMF8iNgzw1oRagmrfq/mTBDB5LzIsu4IkWs/W+FKorIW1AL90tlx7mnNMfTQPPXkCIl8bBQcrZOMzBwomZgtI77SvmbYEqUSpMc7wxX+3L5B2TA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752084219; c=relaxed/simple;
	bh=27TDKvCzp0syh0EGTxobI8FWbGxi4OXzg+TEq6GiL0s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ukBIR5pHwYhyllOPhxmCGpvnTzRxaOh+e7HO+p7p+KHtVH4F/nhaVO5dW9rg8g3OMk2e6zyuac4kBdm6q1rPyHI8Z/Iu3lfepK1Ee98Lb+a43UC/BJ/64Vp2TFL9yjvGtpQrdZDYlMFEU2tZKnX6ES2jxf2Rz8C1Tf48yo3eKqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KnupimiL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 569ColK8030233
	for <linux-arm-msm@vger.kernel.org>; Wed, 9 Jul 2025 18:03:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2uc92O1GGv7emWG1TYEn9fypVsBaY5TnEeVaY/0T7/w=; b=KnupimiL4EZalts1
	9iEjxmVspLViNkxnTUsyCodjfZClzaw3RAAZ2hh6QRgRGnyn1GoKdQZidsvNJHYN
	Z7/VxAuaKpUtt74ZD+sV0H64fNlFc5S0Yd/FPiazPMl/e0V7hoqjbc5cJLu2kySp
	7XUXkBuvInznLXZjQPSYeQDgGitwILYrSCJRWt//urOBqwyfdi8imRlHHWnrtTBo
	MeSHWjhAulRW7flXAk5sA6yGYoCPCxRjjtv0S25CDHWIJ6+uRWzW4mTr47k5zDpu
	9GsTKJHcr+xuVJte38F/oNEiHARwn1Tmmpzc1opgSA8fRa0kksABdaEGanDNpou6
	KHMHmg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47smcg20hp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 09 Jul 2025 18:03:36 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7dbce38d456so3086485a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Jul 2025 11:03:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752084214; x=1752689014;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2uc92O1GGv7emWG1TYEn9fypVsBaY5TnEeVaY/0T7/w=;
        b=J2k9l+XQzKwzQ2Gnhn7aaw/hRMBq2l+F/ktnnVXj3InA7gj+h/14Fr0EME9J0X+z/E
         6PTykSRYyS5ZDry9dIfj4jRVuiJfHFfxlNWM59zlYFnCTm/mHi/L/cNFQyR7AQ0GtJuU
         YxV6kuDIN8L3ayMZ/viYp/ljfKc7jb8UaoHzVkIUwh3B1OWZ7t6Afq/CmBGsyjRuiCHc
         Of/euBd/gfou81wp0YeU68zd8IxLUwMYqyZtvsSub/ujiRHIZ49tyJZRioinQHzki1er
         9ysaYjrkq5qLGe4uQxIZ2syaXPAvmqPjeDADrRH3gEVbfs/J7aEyQx1yKFdlu01/Pv4j
         0Dow==
X-Forwarded-Encrypted: i=1; AJvYcCXPi2a9HFIYO51ylqNW0ObfST0Y1JzsndC23vf2L0P6V1daXMZQwYPaxxVOxei1wLYevqXinhX+Qvu4dp89@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/00OtBuV3Kf3ntulUXK4nTSHGwWCSArJ9YR07sofqomvvRByA
	1BDS7PpLylCXyZW+R9Gkd+SXVAuBkJ6mW091Q941kLeFSN3Y8FyNARgbJnkqo+csO9Qeg9hC8+r
	o8KxDbxFcYKaCsDuQxGL5GvOS6ctRS50QtPW9VihqZ85DBWsYaCEA7RaYAMX30CavPUoK3Mxtp4
	2L
X-Gm-Gg: ASbGncuAXqzmmsyxvjfoBcBrxkaUaqGnaYTHIeTG7ep8/N3qkStwSCXIbo1Dm3N1A3G
	iohxRXY0U1K62+G4cAuZXrHBMS6+kUYASDnxn1xUWo4THeAEhBuKrY4mXGv4ELCr5SXWBnVEMsn
	LqjsDTK9szwAISqRal116oxhKzO4xuGvTVBVQQq+0BTmjQfsGodTigugEQbnga26cj0pnT+cyID
	PPJTVqJ+AXgTqjNMa8M2661EcFJAnoY9opGYFgv9A0smK2EWy6+7tLTMQRgSBQc0ru/hw6YzFwo
	4DlnMdBtBhIrpaVQmRqTOhsrAZI+so+Y2IlaQqr8hNyBkldUEOirGoiCZLgO0bYWIkhROrJ6fa4
	1ioY=
X-Received: by 2002:a05:622a:1491:b0:48a:80e5:72be with SMTP id d75a77b69052e-4a9e9db4837mr1964111cf.2.1752084214601;
        Wed, 09 Jul 2025 11:03:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHT4JbzQDFlByDuD7hy/m9S00Zb2j1K9B+NMiIKO0svgqjP5RylRzZ8vUZfB5MYmmWt5DXtBg==
X-Received: by 2002:a05:622a:1491:b0:48a:80e5:72be with SMTP id d75a77b69052e-4a9e9db4837mr1963781cf.2.1752084214116;
        Wed, 09 Jul 2025 11:03:34 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60fcb8c80c4sm8994918a12.75.2025.07.09.11.03.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Jul 2025 11:03:33 -0700 (PDT)
Message-ID: <68dfc6b7-1083-44dc-bdaf-4fc09e944671@oss.qualcomm.com>
Date: Wed, 9 Jul 2025 20:03:30 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/12] pinctrl: qcom: mark the `gpio` and `egpio` pins
 function as non-strict functions
To: Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexey Klimov <alexey.klimov@linaro.org>,
        Lorenzo Bianconi <lorenzo@kernel.org>,
        Sean Wang <sean.wang@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20250709-pinctrl-gpio-pinfuncs-v2-0-b6135149c0d9@linaro.org>
 <20250709-pinctrl-gpio-pinfuncs-v2-11-b6135149c0d9@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250709-pinctrl-gpio-pinfuncs-v2-11-b6135149c0d9@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=P7o6hjAu c=1 sm=1 tr=0 ts=686eaef8 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=XSwnDwznb6xmaXktW1IA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: ufEfVa8ycSo1mcXqldZWEtdccfnLbbpl
X-Proofpoint-GUID: ufEfVa8ycSo1mcXqldZWEtdccfnLbbpl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA5MDE2MyBTYWx0ZWRfXxA6x6ZOTQLse
 EnSg7iK+IKDT9feZHYEJH7c3oXxdTh117HB/JyQkF2WlJBwSVW4HwemnKplTaVCm37XUA788cp5
 bBgzpgxgYmTjFe0krXBV+6huExS6NaVnAWA4/Fgxz87H+vqzNj7jsC8YIg0lHyPeX33JbYeXCQB
 d3T8Zxyfn+5F4g3TPUDSOHal3PI/Xw+9wR8iUmj7FZfoAE1oXZbfWcvEclhROwlgqnWf50NQz9E
 2HjKvjYMcyRgJ9If5cFOjT8K7SeyhcpY97FS9u3JwG7UmvY8D56oDIK7+QwXjvm9v9oSXm6eTkf
 e5i3kY5yGQvwF1yIML8SUItko4jtkOCzHLUOwRyzqnDgLvw2RBj7IR7KvRJXNYSWo6fskyCMiVx
 UemhRnw2Bmm2k7uGrUZePM2dX45drBykUmGcBPY6RmEBtgfZ5C7YJ7KW6sQ3ODF6dKstS5bv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-09_04,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 bulkscore=0 mlxscore=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 adultscore=0 mlxlogscore=852 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507090163

On 7/9/25 4:39 PM, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Allow pins muxed to the "gpio" or "egpio" function to be requested as
> GPIOs even if pinmux_ops say the controller should be strict.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

heads up for +Luca, I'm not sure how your Milos addition will
stack up chronologically

Konrad

