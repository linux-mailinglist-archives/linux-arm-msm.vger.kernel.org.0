Return-Path: <linux-arm-msm+bounces-71920-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 335E6B4287B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 20:01:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 806407B61CD
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 18:00:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57CF035E4C2;
	Wed,  3 Sep 2025 18:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j4ceDE7d"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1AF335A296
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Sep 2025 18:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756922502; cv=none; b=tV1HuCp+F81qR6KmE0F/MAIh2auOZzRg1w8mgqRmyRDjku5FVcwk1hokp9c8uRyi+LjPTM/b0OxcYs+C2S4++9fsKrV6FQ5wY6g29dXaiWK0r3zbdC+JartuKDK+dVBrxGLBe2BVqOX4gAVcbmjpDHJagnaZzC7zKAOJkcmUcPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756922502; c=relaxed/simple;
	bh=7pnDp9VhTyE3htCGAVgMQLhag197BUUR1H7lClQJXHk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e+WdhEzwmjTBpGXsJ63rh+1rXyfHHEHX5zsLFCFDhOK0nLBPC5cD3C4TUox1CPIMgVCUzT4MCLzu50NiNg9ml8QKV1XW9CyabKlLNuZ8SbhPrZd0Om9rhCrTT5kWZJOG/jomSYHv0/5QDPbdOHhQH3gcmWT4y6WRgz/BHp4eQ4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j4ceDE7d; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 583DwqBh018990
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Sep 2025 18:01:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	e/p6NQMyBBmLey3xjPGP/xYfDYla1BUyFB6KTGlNvQY=; b=j4ceDE7dGvyAemkZ
	CRwsJwmPM7rg/FpONIX/f3c9qs9NwhXkXZxENiVJ8wD+2cTwRj4EDfqTQ2kB9L4t
	wG/gLq4r9g6ywmf4IZjotAEI/Z+TOjzSDZKo2eo2XMbgstm3sqX46sMnfVb8qACI
	jzl1PVtSscG+pIVykfyEE2HAqMOU5ty8qlC1hCjn2oMvmdWMvz3DwFwakG04RzhR
	X1sOaln/i252utxL6KjL3uvkS8BvlRwStcT0VhtZiTCoeYzzhir0xL67xGDWjhIU
	QDqBeUeTcUnsZzwVefnTn/2B1fLySSqwLoAKwcMUCtBLTIHO9KzItooslQwEXF0H
	dZHv0A==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48utk94j7v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Sep 2025 18:01:39 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b4fbcfd821eso51770a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Sep 2025 11:01:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756922499; x=1757527299;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e/p6NQMyBBmLey3xjPGP/xYfDYla1BUyFB6KTGlNvQY=;
        b=B1byGE5+GExZ0Cs6qIYyI/aJAMw7JyagDzVThLmw2CIujCmUcWJkt4wOe4LnuUWyK5
         rQIwkVHvxZlMqibMfjANEokuOikvNDbq+bEDRH0s5Yk78A10u/LFcXYvPAkpKdHAPV/x
         5zyZYugzsdrInRk7qg7raYGsMMtmpUpAIktelRhNyp79Pv3ZjqUZ/SDfbZO3iRVyh7Bb
         6gC8+W2LkclqgwNS0vXhjUSdsF3713h9zZs/3btRlDeG9D23/JWUFTvICH58jHMexUE5
         0gaL97TWhu85zJcweotizTE4m+W+8S6Yp5ocfwvdqll02DAMvXhs3S8rECN+QbaIdTfc
         UjIQ==
X-Forwarded-Encrypted: i=1; AJvYcCUPycLvyu/dFi2QuE9Jt0GGAkyYL0TPqRc7s8ZAtsnQVvnZqWSmL5P2jLKpi+fUPQKuPWAPG6qEZvFbYSSJ@vger.kernel.org
X-Gm-Message-State: AOJu0YwV6zZ1iio28Wz40FpeX6aIH22uL1SmzNQd6usjxGGIewmCba1H
	A7+hiqoruaQXhqlt2LX8tgB24gOMX5ACr/hsRgAoOXn2bR0Z0EYxJs02UTAxZao8C1jLF0ZTjDY
	lbvp/FgpHO4bGmc1wmrdUFtdt6oA3QMPylkXStRsNiL8ryR1dXhuodPDmHYdccT3i3sKu0oGXrP
	yu
X-Gm-Gg: ASbGnctdaGtEMTk8W13VUhZ6akHEWrAlZd5vEKS4MOICiHTbAMPMQODI2EPw1Ry2z4o
	viwkXQQC5FuMh2tolCnKKfAgPhsyk3QebJqQyKsTHSE6UTDXDP0+PXy4SvIX4wFsZ3n8NXijrDX
	idxXVMoOZvVcrXpWVWm9Fuje1/uvhzOa/aUK1hUJpTwyKwus6QhEVdX+lcIwQEQFdUOogPfSbFw
	o+mVQMcYzXSM9qdlgNCwuqzzUsuG/1fjFr4NDmZHAiInTV385XiJKumdoR5SjkhRc+hFMkhHhOr
	P6MXgiWNFroJrNnYAiubnkBD5pppOeX+KsupBJtqfPFaFkZ8Av1kKjBiZF5Ykz0N0DbsxZc=
X-Received: by 2002:a17:90b:1b12:b0:327:7c8e:8720 with SMTP id 98e67ed59e1d1-328156e57demr19444724a91.34.1756922498364;
        Wed, 03 Sep 2025 11:01:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFeb9eLZArrjeEJcIg/7Rx3a/Fa169OALXNV2q0nNF+8FgBvv+z9E0vUippWGNtAeLloBrrCg==
X-Received: by 2002:a17:90b:1b12:b0:327:7c8e:8720 with SMTP id 98e67ed59e1d1-328156e57demr19444658a91.34.1756922497588;
        Wed, 03 Sep 2025 11:01:37 -0700 (PDT)
Received: from [192.168.1.8] ([136.185.244.63])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-327da90e423sm18122214a91.20.2025.09.03.11.01.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Sep 2025 11:01:37 -0700 (PDT)
Message-ID: <6cdeac85-a803-4b75-8fb5-c9d485ae374c@oss.qualcomm.com>
Date: Wed, 3 Sep 2025 23:31:30 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: interconnect: add clocks property to
 enable QoS on sa8775p
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Georgi Djakov <djakov@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Raviteja Laggyshetty <quic_rlaggysh@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mike Tipton <mike.tipton@oss.qualcomm.com>
References: <20250808140300.14784-1-odelu.kukatla@oss.qualcomm.com>
 <20250808140300.14784-2-odelu.kukatla@oss.qualcomm.com>
 <90b51e31-3217-4483-bb5b-ec328665a723@kernel.org>
 <28b97952-1b67-411f-a7fb-ddd558739839@oss.qualcomm.com>
 <ac83c453-c24d-4c4d-83bc-9ed13f2f9d1e@kernel.org>
 <7d3e5cf7-4167-4005-ba4b-c1915c254705@oss.qualcomm.com>
 <00f50d92-e4ea-4805-b771-147fa5f5ebe4@kernel.org>
 <249f8109-31b1-4cb8-a5a4-b30c27b2e987@oss.qualcomm.com>
 <6e036d6a-f2d1-43d6-bb35-54467edd7ec9@kernel.org>
 <26e5309e-3705-4d70-a2e7-3f0e9344816b@kernel.org>
 <3c4751c3-52d5-408e-ae80-df22bcff5d8a@oss.qualcomm.com>
Content-Language: en-US
From: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
In-Reply-To: <3c4751c3-52d5-408e-ae80-df22bcff5d8a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: aYOwL0SVKfH5Jxxnu2DFYhpqQYE5rskr
X-Proofpoint-ORIG-GUID: aYOwL0SVKfH5Jxxnu2DFYhpqQYE5rskr
X-Authority-Analysis: v=2.4 cv=ccnSrmDM c=1 sm=1 tr=0 ts=68b88283 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=yA1qRYK8n1cH6pNkam3zVg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=8_klXzSyxtcaGXXTCUoA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDA0MiBTYWx0ZWRfX6QAd5XVieZDo
 n65kMWFnEomV+KmADk+uquZOvoWXNKGwOCjIICzdWsh+ziMqSuDj9cjMw7giBhj1QLIQE1Cb/gS
 SWfzCWm8a3Wx1pcSgZnBN51Iz0jHER/ilrEgfZtW36c1Xd5kJWTIehidM8wRMWlOWe49mj+MIIS
 4KPN25lj1B699L3bjGd2gU85ivGX3RDi3r2wU7SED765yS2ZuUHWfi0yTecu+gF2Ny3Ht1K74uI
 h+dua8GFFSXlsUT8r2fUO/6WVdpu9b2CcazyQ15Y3HsUt3RHQNcr8q5TG+JGl/QPF1cJ+qSb9Lz
 HiFDgUJkO0zuxlhzDjS525u2HZT/MlVZc7bSEQG3o7kUBCiDph30PJTGmTBMy0o7getxjN9FLa1
 hxs1pQJx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_09,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 clxscore=1015 suspectscore=0 spamscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300042



On 9/3/2025 6:12 PM, Konrad Dybcio wrote:
> On 8/28/25 11:59 PM, Georgi Djakov wrote:
>> On 8/28/25 9:20 PM, Krzysztof Kozlowski wrote:
>>> On 28/08/2025 20:16, Odelu Kukatla wrote:
>>>>
>>>>>> QoS configuration is essential for managing latency and bandwidth across
>>>>>> subsystems such as CPU, GPU, and multimedia engines. Without it, the
>>>>>> system may experience performance degradation, especially under
>>>>>
>>>>> So how was it working for the last 2 years?
>>>>>
>>>> The system may function normally without this feature. However, enabling
>>>
>>>
>>> Huh? So you agree but keep continuing the discussion?
>>>
>>> I don't understand what we are discussing in such case, but just to
>>> close the topic from my side and be explicit: based on above you cannot
>>> break the ABI.
>>
>> To be even more specific, if we already have some DT binding without any
>> clocks and reg properties, we can't just suddenly change them from now
>> on to be "required". But they can still be "optional" and this will not
>> break the ABI, right? The old DT is still valid and the QoS will be
>> active when the new properties are present and this is handled properly
>> by the driver.
> 
> Correct and this very approach was used to retrofit QoS onto an even older
> sc7280 icc driver.
> 
> The icc-rpmh core already ignores QoS configuration if the clocks are not
> provided.
> 
> Konrad

Thanks Krzysztof, Georgi, Konrad for the detailed discussion.
To summarize: we can’t make reg and clocks properties required now for
sa8775p, and making these properties optional ensures backward
compatibility.
I will address this in the next revision.

Thanks again for the comments.

Best regards,
Odelu



