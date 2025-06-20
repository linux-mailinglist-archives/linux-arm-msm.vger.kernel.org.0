Return-Path: <linux-arm-msm+bounces-61899-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3527AAE208B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Jun 2025 19:07:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A85673B97B1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Jun 2025 17:07:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 447532E717B;
	Fri, 20 Jun 2025 17:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jGFbBnwr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9B582BDC01
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Jun 2025 17:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750439266; cv=none; b=sgwO+ACqrl1gpyq1YWaqt/DHmxI1Wwn3MQcTTGQVrIlwoyWpU4Ff0+AJDmeXEFnqyBPlFcGvnsEytAwroJt9jeSMfXkrMaYuQkym7UnRJuly+7WEkOni99YywI0psRSgWG6dHRea6Ftk8YFZswgGbuNtOlwU4bJdBzZcjsC7XTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750439266; c=relaxed/simple;
	bh=TJoa2xPImS4wAM1uUVWoOFg2ZyzLr2gFfx8eCrn+wM0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a14Kns4wt1F2hCg0VhGrztKwvDlELDm/AJP/lcAlk4jKrWe/ghnDTksMTrtLwP0lNKSvrE7trI6bo1TxGZmx4Tf36YLemVDRbiEjbbARsZVeSZPmbxrDKOY1D/yhTUWXKPNZtsiEK3j9UUen3Vz/fE+L71IYg46sZD5U5Ebu7So=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jGFbBnwr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55KGZN0u000358
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Jun 2025 17:07:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hKKwQ1dKYiwuL/gFRwwSIgyThK0XHURSCnVrX9k5gJg=; b=jGFbBnwrmAaYrBWh
	0xzZGscS1uyi5Kkfttcn23aT9G8l2Rm+6h0wVa2FWYAxlCSHsrN+K6+AVY9Vo3i4
	B67RczhwXtXSPBUggERRf2kSNESIGDWPQ4bN53te4EnYjnLbLzOoC2LoLrIMAQ5T
	f4zz2zR5SK2FeIj62BUGC3ly6O1DF72RH9+wbt5Cfz96BOJaHz/4AznNj7EAVMj6
	ESsiyHmo0bWm5zfZJJ7eL2W6BfwOhcPoMp9Z3p2np17DhKDPhQiaTe+rJSvcuyiq
	qiDF1RABlLwmL7Ec51bOyE2nVy1mWfhM+1oUc3C4LQnBPTSrH21iu/J7V/rVMB2c
	zdgdHQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47db9w0278-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Jun 2025 17:07:43 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4a5a9791fa9so5791251cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Jun 2025 10:07:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750439263; x=1751044063;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hKKwQ1dKYiwuL/gFRwwSIgyThK0XHURSCnVrX9k5gJg=;
        b=EXuUhAXoj9QkjuaZdg3ZlGu69cdwPG9AiAytpncnWgAfRkE7DwrrcYWiSuNz4j1Fkr
         C9qDawBIDIuwO61xkvJE5f2Z8lvEL3yZH9GzuS6y73pXMLi5fZuOMTHPNw6RCw/7bgPk
         TmcmzCW+dFAlkl8HGxZmSrOn68IHvhW/JlvcmkldI/Gb3kBnSRUgk23+yqpjt2MkqnCv
         evSOTeP2Dydjf1rEv6D3hMDozWvglJx1KEhtiEMCmS01mNu7a2zI0k/6k+piEiyUVyWn
         +1+DIGgBkRjV1lZEXK5XpVV5T4NL4RNYv9TF8v2E3ZqbIVa9cvMsjbobzWalylMe5GzS
         wV0A==
X-Gm-Message-State: AOJu0Yz/hoKUPjBLug8k2o7mbVVKWRxosjkqIeLfWUqaIkZ2+kYKMLwH
	MhzSEf3IBKRjNjsi3hsvhXJ8yinZrEqRyYHk5qIVNk39uXYwzjnr6J4l0FqO3Zwee1MGYZDx41T
	lODmf6+xAX/faYLhR0RVeW9Q3MCiZrDRHNJy/+m6osArSSGQnKID7MLKUE7bBuvc+AATb
X-Gm-Gg: ASbGncvZHzAb0/ijFTlS1c0mxK0Lw/gCGNFB7/6/7wbFMWTNGUwOuwbq5b42jlDSyVs
	/22D/YGr5g1rPG744MpeVkrygnDJRtQPEzFNuKYqIIlEwvu9xJlWIJTYRvsnCPcTfiIlwIdN8GB
	0RaEuPy6TLCoA1kInXLqQc13Ojj6PoLpRmrkjzmozIni9ZeG6WLj2rfveglAaGvzWwyvlyXvjB1
	HJjMynnvFAHWBXvhiK/bAdgKfCZIeagvB4xJvw191jT2iqSyuYO8qY6yH9OMcx50CxPTuH5TdJ0
	7kZxQ0aLxbPTQKvK40sf0oaRtbfGXtuYeXlmDLjje43uTz4OL+FU0rjeok6HV4p5Go0qjAHa2TM
	4+6w=
X-Received: by 2002:a05:620a:f10:b0:7d3:8e88:dc0a with SMTP id af79cd13be357-7d3f9916bfamr156998985a.11.1750439262667;
        Fri, 20 Jun 2025 10:07:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEVSWLQFC0kpw0PBqz9gCS9IFs8NVF3u0lcuSEdXmZtlYNC6FTQskFyKD9xoz9LSWWobdlLxQ==
X-Received: by 2002:a05:620a:f10:b0:7d3:8e88:dc0a with SMTP id af79cd13be357-7d3f9916bfamr156996185a.11.1750439262103;
        Fri, 20 Jun 2025 10:07:42 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae05433aa56sm188279866b.183.2025.06.20.10.07.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Jun 2025 10:07:41 -0700 (PDT)
Message-ID: <efa03e46-35c1-468e-a188-8e857ecd4b8b@oss.qualcomm.com>
Date: Fri, 20 Jun 2025 19:07:39 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/11] power: supply: qcom_smbx: bump up the max current
To: Casey Connolly <casey.connolly@linaro.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        linux-hardening@vger.kernel.org
References: <20250619-smb2-smb5-support-v1-0-ac5dec51b6e1@linaro.org>
 <20250619-smb2-smb5-support-v1-7-ac5dec51b6e1@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250619-smb2-smb5-support-v1-7-ac5dec51b6e1@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=MttS63ae c=1 sm=1 tr=0 ts=6855955f cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=KKAkSRfTAAAA:8 a=rhSfmRiNZEirnHGn6ZAA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: rJvRAm5tIwrGmN_t-KtRcI4nKdJ2jgMY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDEyMCBTYWx0ZWRfXwAwjmSbpzU/w
 5Wv1efogUI1BHOPqmZc2doqnP9xbpg3G915qs2F2yjKi8RetU0/6o3R806/BOQoNbiBMALVGMZV
 pvt7xJHrbF8MjFSWz7NfYf48tqAG0ysHhwSmrl2jhbTjEZJSBpzox3JijCJqfgP3RBGpB49bGI3
 l8vjfdp+1GFR6A20045laVi4U30wpS1T0vA7vusM5AF00m/n+OWHT990rFqYR7/QHGPerRko1Q2
 D0xib5TP5slRt626vyenLeqLTgx14tA43HkjbJYsmD3Y/xSfR+KFNkxfzAvdtUkysVcEiywumOm
 i61muIYpeiwFOLi3gcaNhq+WhbWxEJv3gJj/HlWZMxlx5Beeqt+7ghRDJwyAeW/Cmh6uh5KFDrB
 xhpw6sl9n1gAy92b6N+My0qv2G2iVzuiigRu36QKDasUL++rQT1Eu3NGxRuQCfuRrnr8NxNv
X-Proofpoint-ORIG-GUID: rJvRAm5tIwrGmN_t-KtRcI4nKdJ2jgMY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-20_07,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 mlxscore=0 bulkscore=0 spamscore=0 malwarescore=0
 clxscore=1015 suspectscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506200120

On 6/19/25 4:55 PM, Casey Connolly wrote:
> I set a super conservative current limit since we lack many of the
> safety features (thermal monitoring, etc) that these drivers really
> need. However now we have a better understanding of the hardware, it's
> fine to bump this limit up a bit, devices can additionally set the max
> current via devicetree instead.
> 
> Since this is common to smb2 and smb5, move this write out of the init
> sequence and into probe proper.
> 
> Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
> ---
>  drivers/power/supply/qcom_smbx.c | 22 ++++++++++++++--------
>  1 file changed, 14 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/power/supply/qcom_smbx.c b/drivers/power/supply/qcom_smbx.c
> index 7fc232fa7260a7422ac12a48686cd7d396edd9a4..d1607674d291d6ef5762d35acd3330e2116f41a3 100644
> --- a/drivers/power/supply/qcom_smbx.c
> +++ b/drivers/power/supply/qcom_smbx.c
> @@ -875,16 +875,8 @@ static const struct smb_init_register smb_init_seq[] = {
>  	 */
>  	{ .addr = PRE_CHARGE_CURRENT_CFG,
>  	  .mask = PRE_CHARGE_CURRENT_SETTING_MASK,
>  	  .val = 500000 / CURRENT_SCALE_FACTOR },
> -	/*
> -	 * This overrides all of the current limit options exposed to userspace
> -	 * and prevents the device from pulling more than ~1A. This is done
> -	 * to minimise potential fire hazard risks.
> -	 */
> -	{ .addr = FAST_CHARGE_CURRENT_CFG,
> -	  .mask = FAST_CHARGE_CURRENT_SETTING_MASK,
> -	  .val = 1000000 / CURRENT_SCALE_FACTOR },
>  };
>  
>  static int smb_init_hw(struct smb_chip *chip)
>  {
> @@ -1029,8 +1021,22 @@ static int smb_probe(struct platform_device *pdev)
>  		return dev_err_probe(chip->dev, rc, "Couldn't set wake irq\n");
>  
>  	platform_set_drvdata(pdev, chip);
>  
> +	/*
> +	 * This overrides all of the other current limits and is expected
> +	 * to be used for setting limits based on temperature. We set some
> +	 * relatively safe default value while still allowing a comfortably
> +	 * fast charging rate. Once temperature monitoring is hooked up we
> +	 * would expect this to be changed dynamically based on temperature
> +	 * reporting.
> +	 */
> +	rc = regmap_write(chip->regmap, chip->base + FAST_CHARGE_CURRENT_CFG,
> +			  1950000 / CURRENT_SCALE_FACTOR);

In surprise to no one, I'm really not sure..

1A is not a bad default value if no other information at all is provided.
I'd say deferring this to DTS would be the best, so that if the programmer
knows that e.g. the batt/skin temp sensors are there, it takes an explicit
addition to allow more current

Konrad

