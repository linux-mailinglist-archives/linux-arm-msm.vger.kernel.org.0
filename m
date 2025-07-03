Return-Path: <linux-arm-msm+bounces-63528-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 60548AF74A0
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Jul 2025 14:51:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1CD5A189ED81
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Jul 2025 12:50:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A606A2E62D8;
	Thu,  3 Jul 2025 12:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ceIyflyr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A8B22E3B06
	for <linux-arm-msm@vger.kernel.org>; Thu,  3 Jul 2025 12:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751547013; cv=none; b=MoK6WcSa7Gfws9Few+hc7t/aza94/H3BqIQP22gORTcuwYZRnj+cvGpW2c54SU3aqvL/uyQDnLC1GxqBkdppjx1Vjd2g30WFD2NJi/4t6/MBkiS9PQ1nvtX4LPv8NBxCXaQQRvsyO1LVIpvb85F3G7B0T50iUcioBYDClTCv1sU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751547013; c=relaxed/simple;
	bh=Qqgc1GnsOOAq4v1APP985iIN3JGVd/bERoSbPbqKFAQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZFUWLogxdcQSP5az4aswAfC/B6nMzBhjSekLGMzixLGCaJwyCHu6OcAmrqDcqbE9hncddgV7hvDo84B9vBekeNTj3uIrb1vD67lJbpkpnBdSF/djobBT1PItNmmiKMU5AtnyTo4B02srcirLIYKfg/BtO4v5VOWGmaQ8aJ74Lt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ceIyflyr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5637UcKm018581
	for <linux-arm-msm@vger.kernel.org>; Thu, 3 Jul 2025 12:50:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uj1sS16Dw8PguzC7LFhxazWH4isKpN88omJ0VRX+99Y=; b=ceIyflyrPBy0NZjV
	JjVKQl9IXmvqESL+iKNOQ89Ru+xutmghTyTYK5EGp42+lVDIR2p8WQpK/pfEBOuh
	Cut0L5fIVUaYkSPZef+Be8Wc8zGbE55uixKvrwSfPV29jE4xyTk53tGYU2l38gxF
	/r00NMy7mQeCibDWjRGgyG6PIBzhY6IHAu9LNfxu52o+9O3DjB8JfW1LkEhYZMHr
	d403Hv+GCrQcnPprsD98e5eYyY5mJCmdXFHgUHUFUbvtnuHcEgrAg4sT7mKy0WeZ
	ik+kmm0rcoQfNI0GeNxE2YpdUO4c107araPDhvKtCvrmcSJyGXqY8icv375VLe1a
	+D3mEQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8fxrjd7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 03 Jul 2025 12:50:10 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d446ce0548so298635585a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Jul 2025 05:50:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751547010; x=1752151810;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uj1sS16Dw8PguzC7LFhxazWH4isKpN88omJ0VRX+99Y=;
        b=M7Bc0/zfHv3g5Du0qS7oNDQI7bp1NITIjMC/1vFjMC215tLCx8XTbezW/5lJs0TL37
         Oq4YIaNqxS/zAQrY3HEHW1hpbjyKACOp+u/0bBFkriRLpa14mTGk29GRbYWOHAopRI5U
         vo53MajEjvHftAb3iXYfrhYvt4TlZy6T5usPU8AgPbI9QGZCs73nGkdhd17OvxRUAcie
         2h2TOASnHC8YA3qh54fm7Ilw2m/TZsO8DBOGsw63RGZPnCFC5ShXCToEuEQHXbE+Cu6h
         h/kXjx5JCUeUVixNX4+RUTy0HztQCTv3x+cNWqYpRco6llpwt3apEIrKLKePxK87ZGQp
         9Xlg==
X-Forwarded-Encrypted: i=1; AJvYcCX0ZWC0lxMLNpSBrLhO77rR3+8ALnnaB8JGXq/NSRO3uekT6C3gBiHhHiXtcH81f+GTa2KSSrv2igMPv5xQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/IwoJ3fVrOdHY2JDEp5ywFU9F8aehmP8G/1d+xfVCSyZ3W8ft
	VpyXPhMzmZ5ZIrnjXe0EDHSdeFL/Vfy9724dt0dSeLfe0mKZ+FwASWQmJ5kBZ1ONklmuy6QgNWs
	Uw7zIEyXNj5MNxd76O7vDtYE7Vsa+CQjcasNkmRz83DU4c/+yTBnvGD6uCXvntY4bPlxl
X-Gm-Gg: ASbGncsN3tHH+jJEYBcGQCs1drf/67PmMuSJQtOFtN/+LtNb4dp/ZGUHlZZYqAHKogv
	f9manKbbiLrFOVgYBPklvGaVGRFGqpJs2NddNjWblRAhJfdzm6vRFRHDKShouZUlbilulwFy1Vf
	w9CO6t+FrKJTTLVUT6d1OXwxIWJSOHQ8hpmFtbzUaO5m9I9DkDOJoT97uT46CP6+U5TFd5tsxj+
	cYrNjSVYvYk5pStLl1fK+Ce3sRg61aI3a7emg7NqaLJN5LrYCByjvkABKPhPPRu27vygMIjvPWo
	dnLukeIBiR8hQLvC56356VP8Z8+MGqn1+SLSsMmBcSMWDHUh
X-Received: by 2002:a05:620a:28cc:b0:7d4:536a:c0c5 with SMTP id af79cd13be357-7d5c4704096mr755996585a.2.1751547009979;
        Thu, 03 Jul 2025 05:50:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE5zoCjhAwYQJaY5mtO22xdyqlDuhd9aBfqot1+DE6Zj4R49CJv87BJ4eKnl1sxbcb4/h4Iyg==
X-Received: by 2002:a05:620a:28cc:b0:7d4:536a:c0c5 with SMTP id af79cd13be357-7d5c4704096mr755991085a.2.1751547009398;
        Thu, 03 Jul 2025 05:50:09 -0700 (PDT)
Received: from [192.168.68.115] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a88c7ec6aesm18533845f8f.5.2025.07.03.05.50.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Jul 2025 05:50:08 -0700 (PDT)
Message-ID: <4f51fa0f-96ac-4b9a-8e8f-e9e3d9c1f512@oss.qualcomm.com>
Date: Thu, 3 Jul 2025 13:50:07 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] ASoC: codecs: add new pm4125 audio codec driver
To: Alexey Klimov <alexey.klimov@linaro.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20250626-pm4125_audio_codec_v1-v1-0-e52933c429a0@linaro.org>
 <20250626-pm4125_audio_codec_v1-v1-3-e52933c429a0@linaro.org>
 <00b63483-8012-4a04-9486-536a7b236497@oss.qualcomm.com>
 <DB16S3FI8AXX.1LA99XCPAW1UF@linaro.org>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <DB16S3FI8AXX.1LA99XCPAW1UF@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAzMDEwNyBTYWx0ZWRfX/XOxUfANbPFu
 z/HlS1EwhNbJNSoMPKWwrGlmcaBAII0aFkTfTPYrs2aC+kls0wZz2fqagUztt5994MMA5IFTcqY
 5CzY/1fugEsBI5bBtsZ5rXbimB7CVY+fiWJhmRciKj1d0i2Lg2QF3IOMY/pRnQehOG3SZmN+bQ1
 BSFrhwO9a89ta4cwwRHwWmKefJmjXY16u+1QhEh6LjXCvcF5ZtWNipwEby5cs49Ah0SMD/iGIlf
 KV7lOfCft8ft/8WmBBTavyUr10J3JPMLYhYDVLuDdSaypenM3ZbU+fHe6ddTnlrivQl808TZ7j3
 A30gKxucUWJ2GjH8aJGhnR+6OZLu33HRyA1tfL1ClrT7o6Nt6Ucx9DVbB44lvaajx87wjUlZ+/o
 KsGZfEc6hr0YM82ZtTlVxV6jkrWw1HrwWc/Ioa/Tkvg43Zne3qaBUJDCH6Y6RuvRyS6Q7IRG
X-Proofpoint-GUID: r-kmJURJAA62-VjdJcx_ERmPX5XKxQTz
X-Proofpoint-ORIG-GUID: r-kmJURJAA62-VjdJcx_ERmPX5XKxQTz
X-Authority-Analysis: v=2.4 cv=TqPmhCXh c=1 sm=1 tr=0 ts=68667c83 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=Men2jHeljtYBJhSsfTwA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-03_03,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 mlxlogscore=605 suspectscore=0 adultscore=0
 phishscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0
 impostorscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507030107

On 7/2/25 2:43 AM, Alexey Klimov wrote:
>>> +static int pm4125_handle_post_irq(void *data)
>>> +{
>>> +	struct pm4125_priv *pm4125;
>>> +
>>> +	if (data)
>>> +		pm4125 = (struct pm4125_priv *)data;
>>> +	else
>>> +		return IRQ_HANDLED;
>> This will result in interrupt storm, as you are not clearning the source.
>>
>>> +
>>> +	regmap_write(pm4125->regmap, PM4125_DIG_SWR_INTR_CLEAR_0, 0);
>>> +	regmap_write(pm4125->regmap, PM4125_DIG_SWR_INTR_CLEAR_1, 0);
>>> +	regmap_write(pm4125->regmap, PM4125_DIG_SWR_INTR_CLEAR_2, 0);
>>> +
>>> +	return IRQ_HANDLED;
>>> +}
> Do you mean that it should be:
> 
> static int pm4125_handle_post_irq(void *data)
> {
> 	struct pm4125_priv *pm4125 = (struct pm4125_priv *)data;
> 
> 	regmap_write(pm4125->regmap, PM4125_DIG_SWR_INTR_CLEAR_0, 0);
> 	regmap_write(pm4125->regmap, PM4125_DIG_SWR_INTR_CLEAR_1, 0);
> 	regmap_write(pm4125->regmap, PM4125_DIG_SWR_INTR_CLEAR_2, 0);
> 
> 	return IRQ_HANDLED;
> }  

yes. We can not return IRQ_HANDLED without clearing the pending
interrupt source.

--srini
> 
> I need to fix irq_drv_data = NULL in pm4125_regmap_irq_chip then.
> IIRC it is always NULL.

