Return-Path: <linux-arm-msm+bounces-64355-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F352B001A0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Jul 2025 14:25:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D6C7F1C88373
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Jul 2025 12:25:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0263F2566F5;
	Thu, 10 Jul 2025 12:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BCBl8BQn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9094B24C068
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Jul 2025 12:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752150322; cv=none; b=Z47u02eRk2jLE2eq6lmwV+LdbLIXlWZio0MkGP27CdgcVKmzSkLCkvwkiJkOEED5JaSRQ6ur/2N9ZS27SDD4kjzMfA/hK3Wy6HFzv0dyzREqzjay5tw417DppKw7uEKiJ1IzPcVWILRPliuddpEGFMiFHYxzhqKu5v5DzQHwZzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752150322; c=relaxed/simple;
	bh=FgzRt8ZR7RE+rp15IyUmQeD1Nnm06vrWcpPbcGFEZc8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iVlvUYxagw3C+Qrtvxb5FS4g0m7kByf/73L/NmqqFs+8q8THIuCzh94yVooEft5gYgcx8f879Jx1m7IhGNOP7vzklAzoPG2urvGnZBLtYrIhTA52o8jd/4cthisr3TZDPKsw2TYYyMravXZbk9YOhUdJLnRu679OVMm5JpLwRe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BCBl8BQn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56A6GdK4022610
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Jul 2025 12:25:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ytbTCzKHlppw2SwuVFycJKbJ22dHTAoFO6LLPths6vk=; b=BCBl8BQnoib8Svq+
	gfbo5fvs1mFg9wD06+fQV4mO1Yujoh6bcMlpk5i47P8zlnXcU5yE4ZPwbEecRf7z
	HReJSijPmv9Gp6e0mRCjmIfajjbIqmhe3BWdIlgQb6g38Hx/ZsuGU9wx4aia/xCq
	t65mAn4ocuHMxGM3JMLfvliRQ5mq3GSqvx+vUYklz9zLmSMOwausfZgxwXWK+7pV
	ascfe6QsPtHKFrGuwBjcVjOkEd5w391snbN4+StyJ49NENL9SDRm9P/7M6Jw740Y
	ZM2RR9kJr6fV2QFImPUZcizk7Q6lu8vj3hI3OZxb1BKUqfpC/fc5ge10boKpxYZ6
	dv6zdA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47t83u1597-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Jul 2025 12:25:20 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4a43924a1bcso2225391cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Jul 2025 05:25:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752150317; x=1752755117;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ytbTCzKHlppw2SwuVFycJKbJ22dHTAoFO6LLPths6vk=;
        b=j2JpqI+ZXhOvF0F6sFnhHU8G5KojHtyNydMM/Q2AFPJsIQuwY3alOL2QnskZfD4tCj
         iL9vZUYRgK3bjNqpkLWOU91hgUR83oSDURHKJ70wVylZjJvYaXkH25fE4536c018/4kB
         IrtaRRtUFOI6++WSiU34r9DldeNjcb2vkGUtx4C6feepw7BciWkNEWyFBgHeR1oGQLw9
         AAEnoUWoWuKTaB/olHkRxqFseLCMiORYSpmBkkwjfOTsVWRxfil6iPrY2CgFbbb+qGz/
         Z+4zh6AkGXWFm4tcW9OTIvbsoR0WEEJuxr2S9JRjTIQgw1ZmZ9Jx0eGMJ8VT35gN36t1
         BbWw==
X-Forwarded-Encrypted: i=1; AJvYcCUGj27nNSd4+DywjqM6y0fXeLQUxwtw20FpZIbnmkS4pxLZi7zyJlITv9XxJSP64c2ilnOOJvfUkqnQyBh+@vger.kernel.org
X-Gm-Message-State: AOJu0YyTMR2lZjMSO3VIJ8Pz0OjO1eGMlvPTfk4Gs5MLTopNu3o2E1CA
	eTVCe/1v3a5S/BaG55JErnDTf9DVYtggahH/WQVBFR+weh60NUWqov+6pqgj9koXTtsv4bcm1nR
	s97OjmV4m/bJhZ6OJuVZ9wZMuoycbteN+FlkCNewCmxr/Q3lla8g5fzO2OXtGZ8LAn6Oi
X-Gm-Gg: ASbGncs8f1waDjrIoZOX5FvpRUK4yXRtaba3us/HGRXuIVjbL50zkP6Qoqn9XqUz2cs
	SNC10Iqbkudak+vm4XSI3IyOGuRTqSn6MvoAp437HN7V3usA4L46lTAM52CYukQBWjRm716+OZb
	0ZCJiHCydNkBtPk46DNPIdqb+JWOGskT/LCF4fxGJRerTnDXRBPJ+lUTW+ze6ahDa1Dli6gtlI5
	gzGK0GwgKWZvYejj2mCFFszeTqHxVHjaMJsxzqAiF19nnQSucd3nfxCbnrDmk9JCwZYjz/tDNgS
	2k+8cwLWmy08RxTYaYYRYYyQXFiZ7TH5pwspzr6B1i5LgwIlq+d5//YI5Yn6Yu0p+8TgUViQakA
	hHyM=
X-Received: by 2002:a05:622a:18a9:b0:474:faeb:50aa with SMTP id d75a77b69052e-4a9e72c759dmr23061941cf.5.1752150317048;
        Thu, 10 Jul 2025 05:25:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHL2upV2JP4A2q8XY4xH5jOb8YXZErvSG6S/PQkLmFjLIJfoL6nTfAPNahLLoITNqEwR13IJQ==
X-Received: by 2002:a05:622a:18a9:b0:474:faeb:50aa with SMTP id d75a77b69052e-4a9e72c759dmr23061571cf.5.1752150316273;
        Thu, 10 Jul 2025 05:25:16 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-611d1062950sm455639a12.65.2025.07.10.05.25.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Jul 2025 05:25:15 -0700 (PDT)
Message-ID: <46a506ee-0472-4c7a-8fd8-b3a1f39105b5@oss.qualcomm.com>
Date: Thu, 10 Jul 2025 14:25:12 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/12] pinctrl: qcom: use generic pin function helpers
To: Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexey Klimov <alexey.klimov@linaro.org>,
        Lorenzo Bianconi <lorenzo@kernel.org>,
        Sean Wang <sean.wang@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Paul Cercueil <paul@crapouillou.net>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20250709-pinctrl-gpio-pinfuncs-v2-0-b6135149c0d9@linaro.org>
 <20250709-pinctrl-gpio-pinfuncs-v2-8-b6135149c0d9@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250709-pinctrl-gpio-pinfuncs-v2-8-b6135149c0d9@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 7afirHXnOUayNDYEYtx1g-il3KhegPr2
X-Authority-Analysis: v=2.4 cv=OotPyz/t c=1 sm=1 tr=0 ts=686fb130 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=KKAkSRfTAAAA:8 a=SCCoO-_AHFKZ3jW1OIgA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEwMDEwNiBTYWx0ZWRfX0G6ACWdBbMZ/
 hkAsrhSDJfRjJuBg5gWC7BVYuAHy2J9HMa7I9aAl6xaNEdAa3TCB7lgUnf0KtV52T5p9Wb3EbJl
 seUly9LzwkESlR1BFS1JGWxrEkhv/BJZ3WnQRcACvphW048gLK3Hf/Amxz/FC2IjvwN0sCJFtii
 QWDWPiU4svlK6Fc8pcNDQCBLomK5BF2M7w+9eX3HcQE7zFT4l+vF5rSCNFE4UnPzzZt9HXmHTwo
 /QTI3Wk504jtrHqrLCERVsKItAzdaZCcrVisyjvJw3W9VxrfCYB+CAGvecGEaAO22+5glVsWapk
 QlfmSUb7WC8vfSKPVZnGZhLHvW3XdUh/u1vpsHzqxNCuGyQli2i8FzzWUFXC4Ej6g+FPWcHXhjL
 nYkFw51fam//jdNanUgo7UzuItScTqwa0JnWu/dBf3HQjSi1H0Len+WBgPN6+N96DNcmhCs8
X-Proofpoint-GUID: 7afirHXnOUayNDYEYtx1g-il3KhegPr2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-10_02,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 mlxscore=0 adultscore=0 spamscore=0
 malwarescore=0 mlxlogscore=762 clxscore=1015 suspectscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507100106

On 7/9/25 4:39 PM, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Use the existing infrastructure for storing and looking up pin functions
> in pinctrl core. Remove hand-crafted callbacks.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---

[...]

>  int msm_pinctrl_probe(struct platform_device *pdev,
>  		      const struct msm_pinctrl_soc_data *soc_data)
>  {
> +	const struct pinfunction *func;
>  	struct msm_pinctrl *pctrl;
>  	struct resource *res;
>  	int ret;
> @@ -1606,6 +1581,14 @@ int msm_pinctrl_probe(struct platform_device *pdev,
>  		return PTR_ERR(pctrl->pctrl);
>  	}
>  
> +	for (i = 0; i < soc_data->nfunctions; i++) {
> +		func = &soc_data->functions[i];
> +
> +		ret = pinmux_generic_add_pinfunction(pctrl->pctrl, func, NULL);
> +		if (ret < 0)
> +			return ret;
> +	}

It's good in principle, but we're now going to house two copies of
the function data in memory... Can we trust __initconst nowadays?

Konrad

