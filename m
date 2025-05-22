Return-Path: <linux-arm-msm+bounces-59095-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 26DEAAC1324
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 20:16:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 19AF53A703E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 18:16:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2E7F198E9B;
	Thu, 22 May 2025 18:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Io9dp5Rh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D0D42AD2D
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 18:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747937792; cv=none; b=XahCuyPvgzGMoJ7d9ILklNk/bufDRFfzX8DRjmiFFJB/L39SNkq0xRNvQOZ55Dw3RhZbWKJmJjNBo4/PyBwIsxb8bYXOtz1D07akZ8o5zgRianpg0/96q7cID4WxXTabaDvf16TO3+slGi5zykkrmmEUUlN0J9OXT65mitNVMMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747937792; c=relaxed/simple;
	bh=secQdXXEgFxsmOhPWrTAs0k7BqWC8fL1By+eEVP1/k8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UvnojtR5MNJ7ZmSkQA++pmXDc979tzIuoiinpEgDRR+WA3ib0/2kgdt0MNiwPws0dBVPfP7Z68OOGZ486V72lENkcXs1iiJCSL50QBF6h1JVn04DmMsHDd4UQ6Yt1n915TCYqmda5W3UhlquEgR3YTu3HTG2Lob28WZITVVKY/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Io9dp5Rh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54MG2VUc024849
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 18:16:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Vd80H0upZK9Jr0k83Vkq4eqyU3PiY5TNFpb8R/4mM3w=; b=Io9dp5RhA7L7TC+1
	vFW+pX18qrmNfTtj/2tCqrg0pn/HnJtkR5o9c+TjVaLOFCN9SfBuYLtNpjje9yMh
	s++10oSTVaAOFwpLAQ7BKfFcM4/VuJsErHNxqiTUbH8q7nBn2DCZ5xKRcOUoMJHj
	dg+V1lnsKGnoh28C6WcSE8Dvv4OvR2AK7iwx6u0mZ6GIR1zuXdOd5x6BM/fyQhFE
	Nj2J1R9fxlJ6Xz7AQP4rmgOKB20Ti3aYHKWIf6tkC8cMSgl9cvegslS9c/3ejJK5
	0W7YXYKaqroxyE0LEK3NCnPZcZ0FXy9CRQnttlGncHqmSYhDWbRuqfSChL69zy0P
	TY6PGQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf4y800-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 18:16:28 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c76062c513so223636885a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 11:16:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747937788; x=1748542588;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Vd80H0upZK9Jr0k83Vkq4eqyU3PiY5TNFpb8R/4mM3w=;
        b=qbxA1dJ4Eiup5NXHJTn8L790KiJmGMzwZj5UQEYVqa+f0mQAfb05dNxDnR4E2ANYwN
         Ntoqa4JL9blHiHKcGeeXjMPDJBW0PQozBGEEDYqGVT2QiCBMIAJNUhIOxU28Q5Yf4+RC
         h0MGD07+xEJsr/T0joZUvWJB3PpJw60xKl8UiHBWIWUh6+EO5jKzYvdgYII3kKRECY3Y
         64ozyuAtQLrzdUXNxJavkQa/A6bxl6DlHdcMp4WSR6ea7HLaJrafCqRhotcFSm+3rS6X
         kIiwj+aXBpA6CmTbYlw3pqtR9zruI4tv2+FBlePqOHKz/sr5sFuFVSkfK5vGwcA5u7Fr
         YBgg==
X-Forwarded-Encrypted: i=1; AJvYcCX2zSV2uxQYCXdq3zoab86+h6/vw2T/zL8vhr+W9VefMZwWRtNEHwypoAtEJgJiJZ57KZyCGtdBgATfnr07@vger.kernel.org
X-Gm-Message-State: AOJu0YwUUVGsmkYs/8JS22KhdIctg02kLnScZM5GAowAaHvmISWeurMZ
	26/xilru43NpUIUg3DT8YL0X0yD2nPuI1BvUGdXWwflaYlk0I0HBpNNvbU03up7vn61u94tg3jg
	LfCIROHM7JbOq4zoxgnfhV350RhhtLxkXLaQoaZDycb26zMxOWnh3eI8kCuxW2nBlxpaW
X-Gm-Gg: ASbGncvFK/mu/ulMlVUEWXCg4vOScxizMONLtDu1PaoAjUohFfryUCr6QeHmcj461NU
	AA/usqk12MUXwRrLtZhRMoUcemIo0D+mK6evKEmBNxq5C9cQNRC6j3+KY4DT7Afq3XC+BO0twgZ
	JRUUnhqCmKsNYsgt3lm0fr/k83ctr0ddmp9fOYkuhfJG67nnjn3Xm0cd/AiMKsKmybofC86Yhvz
	+qA9x6dYthScSwIiUmKeDGJYFthlVuc0BZiBGTRGEFTZm9U/uHbS4u2qx8xay6KfG/AO+Bbopxv
	Rqxe5Pj/xbX/HiMZueGRZCs5GCvLrTURvkA9WSA1tkCpvj40pHd8eGNnS7ZZcxBJQA==
X-Received: by 2002:a05:620a:27cf:b0:7ca:e519:6585 with SMTP id af79cd13be357-7cd467237e8mr1424904085a.4.1747937788069;
        Thu, 22 May 2025 11:16:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG7zzhGT/5VJb4RVwNUci3BKE6HkwyeAUZ42nE2+lAjreHoCnTgE4GqyoQ4ph1hnGhM2Vtkwg==
X-Received: by 2002:a05:620a:27cf:b0:7ca:e519:6585 with SMTP id af79cd13be357-7cd467237e8mr1424902085a.4.1747937787705;
        Thu, 22 May 2025 11:16:27 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d06dfa4sm1119265866b.57.2025.05.22.11.16.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 11:16:27 -0700 (PDT)
Message-ID: <fd2b7010-7935-4299-9b72-e12d41014d25@oss.qualcomm.com>
Date: Thu, 22 May 2025 20:16:24 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 12/12] arm64: dts: qcom: qrb4210-rb2: add VA capture
 support
To: Alexey Klimov <alexey.klimov@linaro.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Mark Brown <broonie@kernel.org>, linux-sound@vger.kernel.org
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20250522-rb2_audio_v3-v3-0-9eeb08cab9dc@linaro.org>
 <20250522-rb2_audio_v3-v3-12-9eeb08cab9dc@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250522-rb2_audio_v3-v3-12-9eeb08cab9dc@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: p1saQsIat0Z8cRa7FBIv3gqOHvm_28IM
X-Proofpoint-ORIG-GUID: p1saQsIat0Z8cRa7FBIv3gqOHvm_28IM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDE4NCBTYWx0ZWRfX1bHfYWCasblX
 jgfzd1ggkRV6zML3Wwv0a/dWprSfy+7ZyiCYvMrGGE4/i7BVwdRpw/cfSwgzQ+0G70qhpKlsLZj
 uCkGsPlY5VVLKsLWVvjvDRWaW+9mUkyQZPqcd6eY0ciSbQYowz+FWFufYBR5GpUXmsOZ/BLWEO+
 sZ6TCkPtj7WOSVVdlqe4CanvN7U3Cp2tEfJIggr4RKDeXsGAnNUMPb/rRjOSrjB4gBJrW+ON9D1
 60XbRKTIJL/i32BphbRfktKTJujcRkwWwA6+rmb7+wFfZq66f+HdCtYVhrJX9ZOOC0+0Svi7OzC
 0zUua3+V6S/ZIeCpLKJg1I2pSnfq+MG4PFopYb+ZhuKlU598lK3WJ7Q+YgY3ll3sHOMhHaHcOTM
 mjf1S7ZfY5ZUgEC9cirZaBEc+b79uQQK9QREA8JA5FjQnA9iiTNw6FAIawTI4a803MqKbSb/
X-Authority-Analysis: v=2.4 cv=R7UDGcRX c=1 sm=1 tr=0 ts=682f69fc cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=tiHu44C2SuCey4_Rhg0A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_08,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 mlxlogscore=938 priorityscore=1501 spamscore=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0 mlxscore=0
 impostorscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505220184

On 5/22/25 7:41 PM, Alexey Klimov wrote:
> Add support for audio capture using onboard DMIC. It is directly
> connected to vamacro and txmacro without any soundwire interfaces.
> 
> The capture was verified using the following commands:
> 
> amixer -c0 cset iface=MIXER,name='MultiMedia3 Mixer VA_CODEC_DMA_TX_0' 1
> amixer -c0 cset iface=MIXER,name='VA_AIF1_CAP Mixer DEC0' 1
> amixer -c0 cset iface=MIXER,name='VA_DEC0 Volume' 110
> amixer -c0 cset iface=MIXER,name='VA DMIC MUX0' 2
> 
> arecord -D hw:0,2 -f S16_LE -c 2 -r 48000 -d 5 record.wav
> 
> Cc: Srinivas Kandagatla <srini@kernel.org>
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

