Return-Path: <linux-arm-msm+bounces-33092-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FE2B98FFB9
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Oct 2024 11:28:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AF143280ABD
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Oct 2024 09:28:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D051D146D6A;
	Fri,  4 Oct 2024 09:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gnwSq9PA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54542146A6C
	for <linux-arm-msm@vger.kernel.org>; Fri,  4 Oct 2024 09:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728034087; cv=none; b=prBxKhuO+fR8dUPn01mMwDaIoSbC76tZCCU43xFvA8MHkGz8nU8IKba5J8S1w4IdCKbPZrPxofvH20n86KGGG2DvQqiYcDo0mFJgJunk9TBzuvPj2agZdEaMax/lwfmjkkfCdXRVsgYQ7ygM8PfO0cYN7M6+8IqJx6RCVdGm+g4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728034087; c=relaxed/simple;
	bh=LmDmej7lLDRBKoBJFi8etT0IoHeFSIIdMlBGnLoKvso=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ppKo/NtLpnUf3LTdAncxd1iRCGI/ES+frf4OSCwott7QkEP1o5ywTgxsdYwQwQ1bKqZa4L0waz3M2sQsUMxAD85rfDzykqaFz0JvJxaHYCAuPy+NFbo0Ye710pOZWDKfjSSKqjZ6dAs7aDSKiQlWAjWHPTTrhLEZ9unM/6MPmF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com; spf=fail smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gnwSq9PA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 493I01Hl026490
	for <linux-arm-msm@vger.kernel.org>; Fri, 4 Oct 2024 09:28:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Tjpps5uqJ9tr+olzb1+K4+r732DF29dhEskuewte7Pk=; b=gnwSq9PAv5rnk7pD
	aMw7W9Tu0n2SVy58tRjkZIeB6ggnVl/sN3Ja85OEjd27LKLJLmiGb/4VgVMIwgXz
	rB911nLDgI6Co+6cxAHOWEgSPrAzN2dp7ZAZI/p53PRwgrhx4o2xD5XZWgy/WhaE
	sRVCww7L0k1ZjgfOFxVxQXUPCSRNTzfchGg1hD033I9tjiGuH++FThQuOyjV9b/T
	h1O8mFLxI/zgn95MjHy5Xb0N51NYVDEaTroDlPl8R7rUPmgo6ki89E4b0YNjWELY
	/x3thad8Uk5UYEUSAcd+n+BPtZ5xUJEWWidSziK2+kyZqgLhC0eczdLisisRSXWJ
	TTuapg==
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com [209.85.218.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42205jhmqn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 04 Oct 2024 09:28:05 +0000 (GMT)
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-a93d13df5c7so28165766b.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Oct 2024 02:28:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728034083; x=1728638883;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Tjpps5uqJ9tr+olzb1+K4+r732DF29dhEskuewte7Pk=;
        b=wdOIHSHUKtGvwAqu94dp55QpxZgplJWz5WiNwMtd8/B4rm4uG02Oky5Wtd5+ZZIVkV
         7NTD+pMpfCpraOEx6hqG2y/RZa8q3BWkZPGnx0iM3j5QF8UzVpqodRd64Sl8VKvgkSmS
         n3KkSfM8BkQ6WvJVIiiWmDsARP4CRYSDMf0ezmLUm5F8aDu4IkXUCTIe9qAt/eoOd6b3
         ftBcxyaCsTDVQe1SXswMpuGEp8zIy4pIK0V3orRM5RAM9RKPzvkoOekpBtiHc0UgIKeP
         M35BcHKL+ZcKTiEmGN9UK9obUoWTzUrLoe+2NAIcjhjPTFAGXmYamvFywFFQKDwiyDh2
         Ydag==
X-Forwarded-Encrypted: i=1; AJvYcCVWuXko3OEgXpXkRi6m2rscDtY4oenrqIiWb+PhH3EEz5s+O0yu5X+8Jwm4x0dJh8El0WA0/uyYiaPBaBO1@vger.kernel.org
X-Gm-Message-State: AOJu0YyCN3BoSinZ0OfjVsIEMw3tlgZ2XvYY4rFBhFCIYm+3+00rM560
	nHLYmrulQpJZNXQA8QZbKU3kbSbHQJg4z0aPzeaLw+b7UyXjeoLvAjd73dFxwe7g5PYvdDhPEgn
	raY/7eVakTEfaR1Tt+kMihEW4RQ71MZ+H/wjVXUSnydILyDr4TOr9AjNE/o4F4sZn
X-Received: by 2002:a17:907:7246:b0:a8d:2624:1a85 with SMTP id a640c23a62f3a-a991bfef116mr76595366b.12.1728034083170;
        Fri, 04 Oct 2024 02:28:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFXt44bQ8wTQRm/YRHvmhXNraUrxIvHMnjvqnxGYQMcJaraaxjku0u8/sUcMcNj5dRE6qGSlg==
X-Received: by 2002:a17:907:7246:b0:a8d:2624:1a85 with SMTP id a640c23a62f3a-a991bfef116mr76593466b.12.1728034082609;
        Fri, 04 Oct 2024 02:28:02 -0700 (PDT)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a99102a998esm198244466b.94.2024.10.04.02.28.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Oct 2024 02:28:02 -0700 (PDT)
Message-ID: <02ded4a4-0f0f-4a96-afd9-5a1756215382@oss.qualcomm.com>
Date: Fri, 4 Oct 2024 11:28:00 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: x1e80100: Switch PCIe 6a to 4 lanes
 mode
To: Abel Vesa <abel.vesa@linaro.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Johan Hovold <johan@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20241004-x1e80100-dts-fixes-pcie6a-v2-1-3af9ff7a5a71@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241004-x1e80100-dts-fixes-pcie6a-v2-1-3af9ff7a5a71@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: sg5dE3PpUYvDCJVNxx4yT4rko0zn-LSK
X-Proofpoint-ORIG-GUID: sg5dE3PpUYvDCJVNxx4yT4rko0zn-LSK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=999
 priorityscore=1501 malwarescore=0 clxscore=1015 phishscore=0 bulkscore=0
 impostorscore=0 mlxscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2410040068

On 4.10.2024 11:06 AM, Abel Vesa wrote:
> The PCIe 6a controller and PHY can be configured in 4-lanes mode or
> 2-lanes mode. For 4-lanes mode, it fetches the lanes provided by PCIe 6b.
> For 2-lanes mode, PCIe 6a uses 2 lanes and then PCIe 6b uses the other 2
> lanes. Configure it in 4-lane mode and then each board can configure it
> depending on the design. Both the QCP and CRD boards, currently upstream,
> use PCIe 6a for NVMe in 4-lane mode. Mark the controller as 4-lane as
> well. This is the last change needed in order to support NVMe with Gen4
> 4-lanes on all existing X Elite boards.
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
> Changes in v2:
> - Re-worded the commit message according to Johan's suggestions
> - Dropped the clocks changes.
> - Dropped the fixes tag as this relies on the Gen4 4-lanes stability
>   patchset which has been only merged in 6.12, so backporting this patch
>   would break NVMe support for all platforms.
> - Link to v1: https://lore.kernel.org/r/20240531-x1e80100-dts-fixes-pcie6a-v1-2-1573ebcae1e8@linaro.org
> ---
Depends on

https://lore.kernel.org/linux-arm-msm/20240916082307.29393-3-johan+linaro@kernel.org/

Otherwise

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

