Return-Path: <linux-arm-msm+bounces-36819-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 60FF09B9E20
	for <lists+linux-arm-msm@lfdr.de>; Sat,  2 Nov 2024 10:18:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DC87C1F21C24
	for <lists+linux-arm-msm@lfdr.de>; Sat,  2 Nov 2024 09:18:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CBE8165F16;
	Sat,  2 Nov 2024 09:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KpfnoM6Z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D45A5154BFF
	for <linux-arm-msm@vger.kernel.org>; Sat,  2 Nov 2024 09:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730539084; cv=none; b=OdJMwDgA94uSp6eGX7PW+jnudCciuks3pFT9TNyeIExkgC5jug1nVPosvr1Mh6ixVDnDukMXUnTI8lMw7p7x9xUWDIasjYe8ffRN0vPIkyX928vLhsnJlcFV6FfwWPYtchxClG86f5EY28Oi2i/pSMk6hHkWXgGJSvmrDpBRuPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730539084; c=relaxed/simple;
	bh=njHM0JitJ+UFde2pIECv8aDcFbSmdoTPJmBk0518qKQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OwaP9QrgCkWNo7io9u6FBbEQFI+nLNGDuxmv6f+tznB+iHigL+TMFQaRBVI1E5ZmG0z1k2GojoJOhTGFhXdn3IgcKWteXtCtMlVvlrsPCnmqVrcWeQi/wu2BBT5wGtJS0ff9QHNqwum/h1OSlfxE21o2lfgUUk8ZrdY/2n7QaBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=fail smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KpfnoM6Z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A24XJBg019725
	for <linux-arm-msm@vger.kernel.org>; Sat, 2 Nov 2024 09:18:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SxLosq1NBnit3HDI9GiRh3jJbkWMHk8309JHht3lgxQ=; b=KpfnoM6ZM23lHpeE
	UVCjxPkl9b4RaGKi7bbQuFY16cv/Y08EHcVAEmTiyDtXEkJzR8K9etvGR11yf982
	tv8B4Zgp8Ttssjj2cEiRBDYSFnvy1/rf5c5DCSlj88pTI7lMG8MWnQMLZoSevMb2
	i6URjNwwEGszAEaUXXaVNyCVJzYZU19u9enjTmYNq2MiFuFSkIOe/T15pi7bK5cb
	k4IJvDSOcq68cHXdk5hwyQWCNmx7IwEzf9R1jH+5ch4QRcbEJPCluYVbo/2Ky5uQ
	n1hIZXqHbLDr8px1Lcb9HstqoqVcNqS79iLxiAe56DPpRYZ0j1LNbYlgw6aVVPjB
	aO5UXg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42nd5cgd1u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 02 Nov 2024 09:18:01 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7b1441d231bso32301285a.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 02 Nov 2024 02:18:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730539080; x=1731143880;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SxLosq1NBnit3HDI9GiRh3jJbkWMHk8309JHht3lgxQ=;
        b=KeCSIVs1mCcF3caoIUNQWCYoZ1cS0O3rVLpVVmcvTW9gBatqsj48YHVSZIY2VfkLWH
         05eMWKeeQMQtHUYV7k44urkenEA20+TBpoIa3OvpcI7duRFMYmKue4fNPV8q+ue5Tbii
         aM5mYowANCryD+/EPLPzlz2BJXXd6hCdigw0mkxSKy7EQK+8TGF7bdPE5mLmCNVMtIfY
         H74F8lOUK+phcD5aJ1Y5HsRN/LlI9UaOSVjCQs4pmVhtZ5QEWMWFBmOmtIx+jwKJyPPg
         TrPZUjbkJbTlyVZOMk0bsk6KPnEXeE9IMKCoDyQy95OdllDg5phDYEdbDF+fH5L+RbbH
         kimQ==
X-Gm-Message-State: AOJu0YwF3taevEGvYYnbyJXV8vnlQWDfi52Bf/54x6UQ113zGLfdEgl0
	wWKQRZeE81Esz5nTHIeUceRLlGZKF/C4a4l3ParQ0bpYw75Ai5UyVTF2A+fyt8x2tN61qeFbhod
	MWJVIQw4pDu8v4OXKAWdGMulBlCfHJEld1lKovHvQXOTTeD3MMY3iwMLww09bcQUQ
X-Received: by 2002:a05:620a:2a06:b0:7a9:a632:48ad with SMTP id af79cd13be357-7b193f386bcmr1681363585a.11.1730539079748;
        Sat, 02 Nov 2024 02:17:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGLJfkunugQ2at2GEhSt+xW2/lUJYpA3Jg23KZ4nV+MMia5zznXtwkl/He0lGbHfDJZbcYPtg==
X-Received: by 2002:a05:620a:2a06:b0:7a9:a632:48ad with SMTP id af79cd13be357-7b193f386bcmr1681361585a.11.1730539079442;
        Sat, 02 Nov 2024 02:17:59 -0700 (PDT)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9e56496c69sm288924466b.45.2024.11.02.02.17.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 02 Nov 2024 02:17:59 -0700 (PDT)
Message-ID: <ed0c77bd-770c-406d-851f-8589e53cde8b@oss.qualcomm.com>
Date: Sat, 2 Nov 2024 10:17:56 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] usb: typec: Add support for Parade PS8830 Type-C
 Retimer
To: Abel Vesa <abel.vesa@linaro.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Sibi Sankar <quic_sibis@quicinc.com>, Johan Hovold <johan@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Trilok Soni <quic_tsoni@quicinc.com>, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org
References: <20241101-x1e80100-ps8830-v4-0-f0f7518b263e@linaro.org>
 <20241101-x1e80100-ps8830-v4-2-f0f7518b263e@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241101-x1e80100-ps8830-v4-2-f0f7518b263e@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: iI0UzyhH-2XYJxtiZp3bIFUOf8-APVaf
X-Proofpoint-GUID: iI0UzyhH-2XYJxtiZp3bIFUOf8-APVaf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 mlxscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 suspectscore=0 adultscore=0 clxscore=1015 phishscore=0 malwarescore=0
 mlxlogscore=674 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411020082

On 1.11.2024 5:29 PM, Abel Vesa wrote:
> The Parade PS8830 is a USB4, DisplayPort and Thunderbolt 4 retimer,
> controlled over I2C. It usually sits between a USB/DisplayPort PHY
> and the Type-C connector, and provides orientation and altmode handling.
> 
> The boards that use this retimer are the ones featuring the Qualcomm
> Snapdragon X Elite SoCs.
> 
> Add a driver with support for the following modes:
>  - DisplayPort 4-lanes
>  - DisplayPort 2-lanes + USB3
>  - USB3
> 
> There is another variant of this retimer which is called PS8833. It seems
> to be really similar to the PS8830, so future-proof this driver by
> naming it ps883x.
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---

[...]

> +static void ps883x_configure(struct ps883x_retimer *retimer, int cfg0, int cfg1, int cfg2)
> +{
> +	regmap_write(retimer->regmap, 0x0, cfg0);
> +	regmap_write(retimer->regmap, 0x1, cfg1);
> +	regmap_write(retimer->regmap, 0x2, cfg2);
> +}

Somewhere between introducing regcache and dropping it, you removed
muxing to a safe mode during _configure()

[...]

> +	/* skip resetting if already configured */
> +	if (regmap_test_bits(retimer->regmap, 0x00, BIT(0)))
> +		return 0;

What is that register and what does BIT(0) mean?

Konrad

