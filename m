Return-Path: <linux-arm-msm+bounces-61907-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 03BA1AE224E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Jun 2025 20:35:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 75E753B8C77
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Jun 2025 18:35:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6E3521FF51;
	Fri, 20 Jun 2025 18:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X5nx7/Gr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB386201000
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Jun 2025 18:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750444545; cv=none; b=G4D2IDps4dUuHNIvUF52oTL8gacBSB4NwK5g3NJVvfjCljo/RomUvpmrJAHbW/8znW/XrnnCciKIKrfXTso6Pk6URylrxVSp9sv2eKswuthTEkX5IJto4dqvE32WtkQLUle4JlxoSfzuWWaqr7ICY1td5iJlHDsiDwOVPgMpRHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750444545; c=relaxed/simple;
	bh=JWMSYzBtLnLZCvwsZk3KkGLaQqwSbdl7evbVSyyidtQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Wb8eaZLW5z+REC11cX/GFAohw00SbSOGaLcDPl3z81yUL7rMJOAp2BIzxn/ddRW1KuJOUU/QLtLFKJfMlCbZqtIq2uvHauP0paF6ne7sc51VBG+Iv9gRR4ojoYTUJ98K3jxJojrhW2AfmNCLNty0rZy+baf7w++4Fl9qIFeKfnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X5nx7/Gr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55KBiF2k000891
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Jun 2025 18:35:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gJw9p79NQp28rgL0YjqCtfjNT9ZaiNa7ynXf7QFlFhE=; b=X5nx7/Gr7MmRCnEu
	ylS3DFsjLg6Dqq3SlAo/V3lwIKBV7b1RxrEClRzwr7TloClwe3i3vX1hRNTY20O0
	lltwffkVdYLQYVcoP51FkX7yBVYgwGWFV8j09CNuUWVKjpaa51WYwOQMDwiOZEux
	1lUFguT22EJv3rd4mMGu/LYPAjC2sYMHxd01+T6xUUAx3Gxs6CF8RimcXXzYeSyZ
	ZD2VcC5CJiVw5ZGvX1R/XdzA9kIPNxvgDL7YFboE4Gi7K/5KaAY4v6XU8tJiq5a2
	SRJJ2gF7NBP5vOtA6dw1LgPkl/GNwb4otu6qBuRAwN0KTGIph8WMJsI/ooBcCcfe
	PmmcNA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791h9m66p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Jun 2025 18:35:42 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d40185a630so91737285a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Jun 2025 11:35:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750444542; x=1751049342;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gJw9p79NQp28rgL0YjqCtfjNT9ZaiNa7ynXf7QFlFhE=;
        b=sWuEge5WUni+WP+lanjha4BWljQmk+P00O6QkJf9gya94+9YHi3+3H7jguy/KctzYr
         MczThLq4J2KTUgHzLmLTAT6tIYpaFe1lRmC3lmVDCQ8SgO+auM3fyPUUuyWC1uIimExc
         esZsJCDnFbdBfIztfs/qAMmoM3/p+7pyYV8PakBLsQCMOVlNqttD8JrT2e/8OnykdBWa
         2gXe689N9+6Vmavapeh80XLgUfzTyeX6DIBvewYu8SD6Zs7aDJHswHm4rm9kQ5uOK7yh
         JYewm/n0f+Wx23tmVxg/x4hoVAhKeoqTLl9hes6A2F8en66vBm/TX3xaB/Hn5o72LNZF
         USTg==
X-Gm-Message-State: AOJu0YwBUVFk9+KDhiRnI5F2HtJrBfbKdZVg9Z+P8ukdeAftJfCzCWlZ
	dVvWl1kI7v+q6MdjkliPWNq9mR13k3eNkcQznZpC/XMT8NeW5Q7gW0g0HSqNu81FoT2WKuaaDAh
	jUz4Qiul8MW51aS+xi0c/Xpymcg3RjmCj2MZ2m5MEceU812KFAdaQAPCpcvIa21gMCSXZ
X-Gm-Gg: ASbGncsV3ymhnCEVjDd95ZiGgSGbd2w3hlQa2dRViEWwZrmorGyVubFLjosPpC+bKX9
	PoT66vGRR28V5YthImb/1MgxPJ0nyEbTspYEKRTwyUZF7WVVzOAOCZU4w0Cy3r4iHeXDiU9/VVB
	Nu24Ea7dU9T/klOjnBMceCguQd4QgktMxKUBWnoZNjPKNfPmCBpfsKW8qh+sXbOYYvMa9XkvMOV
	r3Ds53CLAWXe8Z3TWV6jizMkiKiHXdge6Ejrlk0i4HtQJxQSYYEL7e9wW7e4qZtpwYm9/ZjymzU
	I7MYCmVInSnww84lZp+xMjgBKKZ6Wv2iUjVJsDTMkvpqiqFMSxghK24tcxTV8DGntEO05sujot7
	if5VYxkvMwLn6B30G2JFNf0I4Dlqb+GPaAse5XqPpUNNT8xZhVV7rSz7w6zG7VFbWxDtc8AE3nS
	o=
X-Received: by 2002:a05:620a:7003:b0:7d0:a1ac:e83a with SMTP id af79cd13be357-7d3f98e00bfmr464035285a.16.1750444541639;
        Fri, 20 Jun 2025 11:35:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFsuEvU180uOuJG3lc80Lg0/m23ATne7omtzgMrhGIFzbRZsPZTYyD0LPioJVHR3t63qkWJcA==
X-Received: by 2002:a05:620a:7003:b0:7d0:a1ac:e83a with SMTP id af79cd13be357-7d3f98e00bfmr464031685a.16.1750444541092;
        Fri, 20 Jun 2025 11:35:41 -0700 (PDT)
Received: from ?IPV6:2001:14bb:a2:64d7:15aa:a456:4eca:f826? (2001-14bb-a2-64d7-15aa-a456-4eca-f826.rev.dnainternet.fi. [2001:14bb:a2:64d7:15aa:a456:4eca:f826])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553e41bbbe4sm369113e87.110.2025.06.20.11.35.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Jun 2025 11:35:39 -0700 (PDT)
Message-ID: <f9f96bf0-3539-4e77-8d3e-b87ddc561925@oss.qualcomm.com>
Date: Fri, 20 Jun 2025 21:35:37 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] ASoC: codecs: wsa883x: Handle shared reset GPIO
 for WSA883x speakers
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Philipp Zabel <p.zabel@pengutronix.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, quic_pkumpatl@quicinc.com,
        kernel@oss.qualcomm.com
References: <20250620103012.360794-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20250620103012.360794-3-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20250620103012.360794-3-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: z7PBLVglduV1TcCcX3y9MckMoaHrcKc9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDEzMCBTYWx0ZWRfXxjY78ixQby4Y
 myEy6iztMEK18Dfx96pVAGbcRsHK7UwJminN/FOlESJPpzWnex2JqDS4uGp9xyyPvtViGAlFcvr
 KybdsvHRFUCZk0Xl+0WygWvkEwk6l39n1TVKh2pHhwkKa6AmeaYJQ/7H43rysuSdBv7oh5gy8WA
 YBXIvsGcP0q2yueZD3beQ6F6UCoD04TKdLbz26fl/mKe/8Y5qnNFfV4Cx3PZOANumbR2mvJl6w0
 vkefq2ePE5pb1nxhJ3JTuuiaNEwDydjg70CrNLHeh0iHqlc/D95s7CSdHZ17CmYkpuavhUvTqnr
 rOVmkfs7F/xZJvpaCHmZRrh76PyJxnxtSessgn+ovPBF8QX1bzLq7iRZ2Wz+hsb7JU56PTQcMn0
 hNGfQyrmDBkgB09uM5blFRnZt3Yj77hyPCV7sHw3IYuZmj4EqinWFXP0KW4SzosEyQhglpWQ
X-Authority-Analysis: v=2.4 cv=UL/dHDfy c=1 sm=1 tr=0 ts=6855a9fe cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=5BTet7WxsRtOupFzBhsA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: z7PBLVglduV1TcCcX3y9MckMoaHrcKc9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-20_07,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 phishscore=0 mlxlogscore=752
 malwarescore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506200130

On 20/06/2025 13:30, Mohammad Rafi Shaik wrote:
> On some Qualcomm platforms, such as QCS6490-RB3Gen2 and QCM6490-IDP,
> multiple WSA8830/WSA8835 speakers share a common reset (shutdown) GPIO.
> To handle such cases, use the reset controller framework along with the
> "reset-gpio" driver.

How does this handle the fact that resetting one codec will also 
silently reset another one?

> 
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> ---
>   sound/soc/codecs/wsa883x.c | 57 ++++++++++++++++++++++++++++++++------
>   1 file changed, 48 insertions(+), 9 deletions(-)

-- 
With best wishes
Dmitry

