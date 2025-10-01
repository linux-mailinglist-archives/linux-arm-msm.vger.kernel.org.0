Return-Path: <linux-arm-msm+bounces-75662-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 59C87BAFD67
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Oct 2025 11:20:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 17B553AB5CF
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Oct 2025 09:20:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FF19283CA7;
	Wed,  1 Oct 2025 09:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RCGJqzEz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CB6F27E077
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Oct 2025 09:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759310401; cv=none; b=pWm1NDvZs+PuNdJhR4725fpOC0Fx0JHKnHd4I8ugaS3fAWGwh8C0RYCVzpamsmNnrsSIbLifNGkmEaauAgKhkNk9Yc6eMVz1brqrms7XKy/iG9cyd3DLJDGCc0rGCYLtvB9llG5xURMVH6NGAILxP6x0+v5CBRi6/mrB97EHTUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759310401; c=relaxed/simple;
	bh=xUbLsE7+b/6DcdaGkzKeBsXAunvj6ceqqBajwg4A+rM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h8h4+2BnX0S8XUT3m/LTgpyiqKVfkl+bS9hlz94QoSNEZN5GJol3+9c3wmJPiblwRk4ULWOfmPwox0Qe+0luFQ9mVG+YlD0RgN565JRsDWla/Nt+ciff8KZWEfQlKhM25sRoRdK4ZOTI/80jLEUuyMBqzEMnS5DjJJMylzbomis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RCGJqzEz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58UMIT2K016964
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Oct 2025 09:19:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Gob+/+Jnh7/czqlbfOovpHjo691+sHroBwNdrWojy3I=; b=RCGJqzEzeu85fd7H
	KV9qLaSeXcnjfhEnYnUK9uEeUfhGlzTOnarssIYO+/NDP3AAP7C0H3bqg4tNztNY
	jOkcabBH1GY+MDdvSOESGPZG7gYXelBjGTduG/Wr857T3ukUFf+7WALKN6omK1TH
	LvLIxiJFfLn7dqOre2TDnONai3Ly2+vvMeugpT7o8uUBiwz4F26h4GKozicJyVlw
	ZHj5UdeqWXM656p77+u0vflVwu2BHevXKYu0m/zR5SoDzrdstBlKn0Q372QlEcMX
	QMPxiJ3+78mLD1q6pfFqilGi0JvHUGUUua35noTmN/8IOmZVMDFcbok+2lYbOp5B
	nZ4W+g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e93hkpy0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Oct 2025 09:19:59 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4e015898547so4666821cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Oct 2025 02:19:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759310398; x=1759915198;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Gob+/+Jnh7/czqlbfOovpHjo691+sHroBwNdrWojy3I=;
        b=vqhQP7OO1eLYkxqZy6Py0XXuJIq5nOPa8Pu3cdagTfsqhTOkMWP+tVpx90mmDAI4n5
         srMeV5KdgW8g48aq2c/cSGAtKRyHQA7lfBB/bSA1kngeyLS2WH9kR1QJJwGTm4GrMygd
         UdHvOex1RysVU9hRhv0Rm0nSHCZeRb6GxxZKvwIPcXZRfN5tABQSliDtnwLxZe6lH/fP
         rvLN579nFLa25OfD4BgNxd1DnTCV/QqmxauWuY1pHZsx9B6vt+Q/T+tQ9+kYdyFYKSlm
         XKKd7irOZkgkF3YvaOF8fKcv3uuR3t7Os3eOMoJTMHB4BbGtKFPMjW3BprpJfi+yfoIr
         bRZQ==
X-Forwarded-Encrypted: i=1; AJvYcCW9VMIpbvYK+4iM9D5QLOGfLw28bxmslSOki3ntc6QslvIjvQ7tu1NLYIu6YC3dBj8SR5zZt+vaKQWkrFmI@vger.kernel.org
X-Gm-Message-State: AOJu0YygOjOAFQubSs+PcHL777LuFLs0FM8/cFYag7b+LZt5ZSew1XBx
	Ui+UKwOe3gfhzMjcUwd5jJTRp39X9GU48kbceAdcub5W+zGUjpd/O6LXuQ6rosXYy9jAOhQNiyC
	U68ryfbMlavC2l+zJ+aPz2Wq2+22ceQV5Ku03NE2qxMj5Rc8BFE7gKFhMGRtg6HMzNW30
X-Gm-Gg: ASbGncuSXTeWkwaoUaFBtR6Df8f0VXpfOOUfD214sLWtDXpKWp2DZ2rCvP7Y0fMXHih
	4dfGPoChzjIl4BBZ6RkctYocyInLBzYAB328TGDz/d5bQPE+mhqBh0DHLkg2OjtpLlL7B6zIZKm
	OKYQj6V+A0mJ8/nVY7zTRxufpqVj5q4E6R7hl2ZepOMUF9xknOTxo1TCnT+jradSukO/OQuiZ0p
	R8DadRMvGBgZZGK5jFIsHsCh5/tKcDehF1MnjBoHO3nJyNeN893pSeN5SeHX5lSH3Zj/EZGwc16
	ehCmvGb9qwRXXWrDOKAHkJq6WA3nIFgxPuXWzDS46j1HW5ZQwCSsaGYLBctPdBWmK8EkLD7emKV
	6uYp44detZzZF9Km0l+nEak7c3mg=
X-Received: by 2002:ac8:7d0c:0:b0:4e2:f1b3:346a with SMTP id d75a77b69052e-4e41e256f17mr21153381cf.10.1759310397748;
        Wed, 01 Oct 2025 02:19:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGKJoQUQsWf73fTXk+gDvPvLLj3Y/I7IdgSFwb6X+1+mfUxdCGvdvgd1iqFUC8eGAWzUp8e/Q==
X-Received: by 2002:ac8:7d0c:0:b0:4e2:f1b3:346a with SMTP id d75a77b69052e-4e41e256f17mr21152961cf.10.1759310397254;
        Wed, 01 Oct 2025 02:19:57 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b3f7b67b883sm553368166b.79.2025.10.01.02.19.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Oct 2025 02:19:56 -0700 (PDT)
Message-ID: <7ef97ace-e46a-44cd-b632-eb7b699c20c2@oss.qualcomm.com>
Date: Wed, 1 Oct 2025 11:19:54 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm64: dts: qcom: sm8250-samsung-common: correct
 reserved pins
To: =?UTF-8?Q?Eric_Gon=C3=A7alves?= <ghatto404@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250928045817.37384-1-ghatto404@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250928045817.37384-1-ghatto404@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDA0MSBTYWx0ZWRfXxWUYgD7vUK5M
 C7SRFgzfJgQPdfWgCYplRCJ8k1swnnD+5p0KtlCa3/Nvv6+Lf9BeUa9wyCz0XTEn4LjfRK9PVwF
 2bFyvnwvN0FWQe7TE71qWGUTrEclNx7zszJnMCqfj6fBCF8X54tAjT5GKzUyY/Uj7DlzKPNr+zr
 wcVJJ+sYa3bbdCmYoWEXq2uEtUZ1EgDp3ugj2Ie/ekk3Iu0O7Tgru3gMZgCG+sB+qzK3cUTkbIn
 EbNU+oRMVWevaV2XYTH7uj0aJetqJ6ByHRElmiAUjY20kC3+gHVG1mXflPhXOitqS9/l9++Z5Uo
 ly2OMc+x5ZyXdzrpNwDnmHnj7Yf0rQ28JW0B6eJYV9neaz5/mAxTf1qqXzq+8QrkU5kgE58YuKB
 tfT8ZJE5s56j6eWuLtzqwkTha6mX3w==
X-Proofpoint-GUID: AHOFauWy3CbUlV7NkpNoqHf0Yb8QvVfK
X-Proofpoint-ORIG-GUID: AHOFauWy3CbUlV7NkpNoqHf0Yb8QvVfK
X-Authority-Analysis: v=2.4 cv=Rfydyltv c=1 sm=1 tr=0 ts=68dcf23f cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=pGLkceISAAAA:8 a=3bGHI0pndnSrP7k9S98A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-01_02,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 bulkscore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270041

On 9/28/25 6:58 AM, Eric Gonçalves wrote:
> The S20 series has additional reserved pins for the fingerprint sensor,
> GPIO 20-23. Correct it by adding them into gpio-reserved-ranges.
> 
> Fixes: 6657fe9e9f23 ("arm64: dts: qcom: add initial support for Samsung Galaxy S20 FE")
> Signed-off-by: Eric Gonçalves <ghatto404@gmail.com>
> ---
> Changes in v3:
> - Actually fixed <40 4> indentation
> Sorry, I still had my editor on 4 spaces a tab
> 
> Changes in v2:
> - "Fixed" the formatting of the <40 4> line
> - Added Fixes tag
> ---
>  arch/arm64/boot/dts/qcom/sm8250-samsung-common.dtsi | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8250-samsung-common.dtsi b/arch/arm64/boot/dts/qcom/sm8250-samsung-common.dtsi
> index 96662bf9e527..7696b147e7da 100644
> --- a/arch/arm64/boot/dts/qcom/sm8250-samsung-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8250-samsung-common.dtsi
> @@ -159,7 +159,8 @@ &pon_resin {
>  };
>  
>  &tlmm {
> -	gpio-reserved-ranges = <40 4>; /* I2C (Unused) */
> +	gpio-reserved-ranges = <20 4>, /* SPI (fingerprint scanner) */
> +			       <40 4>, /* Unused */

the above ',' should be a ';'

Konrad

