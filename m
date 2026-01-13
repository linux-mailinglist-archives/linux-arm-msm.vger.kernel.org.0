Return-Path: <linux-arm-msm+bounces-88704-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B7C6D1773E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 10:02:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 44DFF300F9C9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 09:01:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF7553806D9;
	Tue, 13 Jan 2026 09:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KEXsgQGX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HGq/tNIe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20F203806DA
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 09:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768294861; cv=none; b=K4tgDQIJVJMbmWNpfCEsPjyPcI/x/8yJY16MXPthPCtach8htTuUeLhas2N42Z4ZiEzesfNmB7Nr0lG9JCA6CQ+ms66nOArg4DPPOSBBtulTYGOK3/Q56k+CJpzPLEHzWu+n9839wGoglnkHRqj0PkVmzmqLzSKZM0bXNgh3SFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768294861; c=relaxed/simple;
	bh=zmEvqIBXdnGpgTflNmWuXOE16ZDSWEqcWsIPSe9jqJQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fsQGmmaqzAyUN7DJsNPJgDjVc5k5jMuFnVSDoKfDS4/Zm/Y1kYQzhzHEPhVX3RwiQ9dvqtHnIVP/b3A/6b9fZdvgS4eoIzKVdI5HqyzCsvJdcR0BM39ya+UqJfU9WpbJatOtvCjndGoRn8YAjyRIExCeD459eCLaOMRZNrT0Mkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KEXsgQGX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HGq/tNIe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60D7V3nr3299864
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 09:00:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zmEvqIBXdnGpgTflNmWuXOE16ZDSWEqcWsIPSe9jqJQ=; b=KEXsgQGX651qbW2O
	TjkbCoy06tKKRbBsRcGGrrJ5czlpms5uDz167YfORNuGzG7x1cA62ABtFSiEONWe
	YKgClWxTNpuR2DzpP3OQwf+oG6z97Gdoby/olD89OWIhK6JAtWgEh/pySjtq2r1R
	AF3PnD5rM9K8PksBeNtzdSCzAGUn2BCmfREnCfwLbT8+cs5AWPf2XDyZQ3DUuzc9
	DZFI0dMKCe3raZcwhspOl7u9RfbMDeF0XT/wVuVq0kIoZiYGlNTp+cUy9NC205bM
	8Zf1F23zLMWAd3JRTjAt7HoRTzP9FiXSkMHLFJlE7lS+oVH+A3WyM7rbz/dCbJ08
	6GO+mw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bn6jma3dm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 09:00:59 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4edaa289e0dso24668421cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 01:00:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768294858; x=1768899658; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zmEvqIBXdnGpgTflNmWuXOE16ZDSWEqcWsIPSe9jqJQ=;
        b=HGq/tNIeUkwkGZFu7YbLfEU4bHQAa/W/XCQkKUnsU/CvSaavOjIaVRmF3Hr0skbmRU
         zmWZl/1tUutPolNbBcWy12XkconvzCKAWyRc90KykwkKyzW19RSsPub1ypgTavkLYPGV
         EWQtmhVlH02l3XTfcuTb8+BRjdHJ9oJHnaJKW63IEudgktxTwEGNMGN28BG2tunspG7l
         yaBg3/OMUFzL0mUYnIbPGbKApX/65jMTJ9jAMTraoFM4K7VcDA8hSdSpjh+UU8qo3PKE
         kMFhHxfLVkSf6YrdqO4y9Nxvdb4089TlIOT7WJQmgxMKMtDWuvij65fnJ6APfqNAb/Dw
         ltqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768294858; x=1768899658;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zmEvqIBXdnGpgTflNmWuXOE16ZDSWEqcWsIPSe9jqJQ=;
        b=HV9bwKx6Dr1IqO0rru4d0HJ1VVWQ+7eNrzK7NMMm2gJ/Cx9UcRJwleZ1Y/qF4HbIm5
         pKIR/n9ZPDihR658iDqIaVLEcOOW12oTkSGq4n5tkBv9dufGzlw/bERcfx4ZHHzBQdpR
         RB0DhChG4tcwDWvZZrDmsMg/e7XcXZzLA/EHOXTL5rbXpCDFCbmlt2jEAYho9w/Ob7b5
         VMMltY+zQEndrxXPWZG2xfCfIKZm7tntreFD4dSdaM7dm15oVJQIEG9XzDG76ZEgLR5W
         3pusi21OBNBZUwXI5JhdrIRPxVm4UAqINot+gYCh1Hy4MN6wDHn1a7javJpyXNPRvy0t
         FtOA==
X-Gm-Message-State: AOJu0YxPwhZEwPBfH74ILulD0Hq5KYkxVXnDrKC8vMgg3/f2NPtR7PpN
	WNk4Zuswi/lj7eDSfS6j5oe8qyRuNKgKaPAN0xevjfLclJgoPwtb7fT67ZYVuGNA+mC+1kg1j98
	yktzT3XuzHGUQsy9DXKJiPmF9Qnxhp7+oyNIzDlm0jlH+XrljxylpAly2qLdlTVVcQfCM
X-Gm-Gg: AY/fxX7r+uWayEy/BnuGunVRDJ39mbQa4RiM9VkW2SeMns8q+35ooTghBtDbylwdxA+
	I+sbWtu4jaX4N1LYCb86cllsLySFHxHIgBkPJUH7VFgRJeigOgRop52GdjTxvg4PeCaTIjlI6Fr
	cTXBL0pm2t/YQOU6+dTwMaCbQo9Vr8m+n8NV/NABUSEBkpNzgqkcJNCO4xLBc5CjyPBehw03CsU
	4du7pmJW3nDeON5NSmWSESaLanvebLUezJu77TKVyNNsnfuscZQRGwH01kgOaekUbGREh7hWuhh
	3nks6IVRKPzD+7r5rrY8Pcy5mz4gMhHY2jHqeWWsMHkEwipvbbniwxinqNXkgo40uo/oMHRUCJ5
	FkPD5MA5V446wX9BavsAnC1RTWVoncSZeoZn6UqpoyI+QjHHKkrA+ryf5yXGELQFvpLk=
X-Received: by 2002:a05:622a:211:b0:4ee:2580:9bc5 with SMTP id d75a77b69052e-4ffb47cfe1amr232029941cf.2.1768294858253;
        Tue, 13 Jan 2026 01:00:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG5beq5fmT9rl2rskNz5xtpPUMHW61786+z5iSz7v6XEXO/Y7S061xRYJo5ZaIT4WiV34EIuw==
X-Received: by 2002:a05:622a:211:b0:4ee:2580:9bc5 with SMTP id d75a77b69052e-4ffb47cfe1amr232029561cf.2.1768294857665;
        Tue, 13 Jan 2026 01:00:57 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b842a563f0esm2218533366b.60.2026.01.13.01.00.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jan 2026 01:00:57 -0800 (PST)
Message-ID: <57ddf3a4-8e4a-4072-828a-9145f1f30d12@oss.qualcomm.com>
Date: Tue, 13 Jan 2026 10:00:54 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] arm64: dts: qcom: sm6125-xiaomi-ginkgo: Remove extcon
To: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Gabriel Gonzales <semfault@disroot.org>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
        Biswapriyo Nath <nathbappai@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        linux@mainlining.org
References: <20260112-xiaomi-willow-v1-0-8e4476897638@mainlining.org>
 <20260112-xiaomi-willow-v1-3-8e4476897638@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260112-xiaomi-willow-v1-3-8e4476897638@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: hAYw6_Gw7gKkyAZNkmgqcRd1E6FOkMYy
X-Authority-Analysis: v=2.4 cv=SK1PlevH c=1 sm=1 tr=0 ts=696609cb cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=MdDK0SfbWQR3MZ74HusA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: hAYw6_Gw7gKkyAZNkmgqcRd1E6FOkMYy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDA3NCBTYWx0ZWRfXwXruyJ7uqv6X
 NULixpV7/P8bHQv6qgRiE6bY1xLJw/HBQ6Gey9VaajiXWojlMqI9XQmTMLrGa9JCb3oLuj/ObXo
 kFWC6n/ugIrektjVAwPX+RJbi7ATCIULeNlU9lkjN7GnCI9hzfwxfQnhfx66XvsTNwlHWWe46yw
 fPeeIWxvaoGDsJMsqxUCiuetska64gqmmIye9fhZCp5T8YNt8Tk0MJFWOcmhNe7ODUU+4tZHyMb
 x98ZHTpi2qltN4jRWyQvRFTu+FCowXstWg9N+18Gh3K4D3vRNxl9gBH13F5+ReEaoSTs2ZmeqG0
 VMRcDX+qegSHhWIaZyrsX3AnODHGri++Yup4UesvdokprjOri3Ts05F4deOpxstf2Cy4cHfqi1N
 Pjg0TwNE1iqZf0iTnjqW3+KKUZN0mJiFFV0Fo7LAPdvx0SGDQMnrPHPZH/RfIIDwwbxuxzcMjsi
 PmJnuQ5KuEq/dQHSrVQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_01,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 clxscore=1015 adultscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601130074

On 1/12/26 9:13 PM, Barnabás Czémán wrote:
> GPIO pin 102 is related to DisplayPort what is not supported
> by this device and it is also disabled at downstream,
> remove the unnecessary extcon-usb node.

If you put the phone in fastboot, and connect a USB3-capable type-C
cable (making sure that it's not a fake one, usb3 ones are noticeably
thicker), does it show up as a SuperSpeed device?

Konrad

