Return-Path: <linux-arm-msm+bounces-61898-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D780FAE2081
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Jun 2025 19:01:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4D7CF7B1273
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Jun 2025 17:00:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74E5A2E06C7;
	Fri, 20 Jun 2025 17:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LXIuSAl6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD1F12E6135
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Jun 2025 17:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750438880; cv=none; b=tNbqL1ZYk+kvP//sFieyM8m58NTN1DXpg8MJXw4Vn9wlUc3SBITiZC5gpHqPRj8uLhuwntna5QCDPEPj7Gsgrv5gxi01sd1S7Fz8tEgCB84VBBHFTkb/fbnvCY3znDrUoZurrCLysyxAMp2QqYrdqD4AG/Q41ciOQNQ+89mbzM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750438880; c=relaxed/simple;
	bh=XAukmnt5QjBdMQI+xuahj+iBwVBMbadMcYelH+EV8+o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O5ydANQmNGY/5vWpBBBpsho8Z9jR9Luv/Z57oR0Gi8u4TtvZZpc2e++wRYWU2deXjAtTVdiG8ZexoO27oNpMbCMILxxAluxxg2PVGGXRV3fm+VybJe6ALP6aNGp4cmTePtCs5uw9t1E5hLatOHAERmAhtDPXw2sj6onsST35g5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LXIuSAl6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55KBiFps000891
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Jun 2025 17:01:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Fpu0l6974H5V385jR1/L6yeOq9JUIfEhJX1r1r81aaM=; b=LXIuSAl6/qDRZB8x
	Rou07E5KSwJ2siNkOf3nRzeATHpXzlQBkuSyYIHUDMWKbO/ceb1UGe8aeHw1tRuV
	+ALWNpKymXnEnJc8yCtBdXL71yc4l/lHODXnx99U3EOQAd/yeavU40JDasmldLF1
	bM3fUiy0kAAIffnJB+O1IZn4sWUH3LQ1XxgIdenwpQ9ryYTqloVOQPrBr8MNlpfY
	X11lR/oJ87wYWKTBtLQIs5+QdYm8dYMDDSKWxDJQMk7VSYu1TdVoOC3rv0YG6Ih5
	7NR0cEOC7gKJL+/PCCh+FSb07j0Fcdsv9kOuohxSs25CEBa75BaBeWCJSDo4lTYM
	K97zFQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791h9kwr8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Jun 2025 17:01:17 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d094e04aa4so58755285a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Jun 2025 10:01:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750438876; x=1751043676;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Fpu0l6974H5V385jR1/L6yeOq9JUIfEhJX1r1r81aaM=;
        b=lTIrKG4U1pDOGJxODhh0cNTJttjSkz5r1i2itejjcYIQwv48ZsM1irCxZU6eo/fUhY
         5Era8dnjBKMEYWeoyipY2cCSSKs+YCIFWvic3yFyEui1tdiIuDtobg8GnT4hgNmQaikB
         vFMqScPrCDgzNIBZu7bhem+3rYjMot2ls3IyhNPyl2jcDFGB+3AZkz1/mdH4jRyVIJCZ
         XxXeSbckN4ZjxJ/SQR0yV8tjWIUAwICPqhFSwMAPpIEcQHwdGkKQOSVfKVBozsc8PSPv
         Vw9YE1RNGO5d8sH9nSaDBViYHAo17Guv+GEv7t3/7ESCp5BmBJJjJvK3teFqXzjKuLo9
         dASw==
X-Gm-Message-State: AOJu0YykYHULSuOWGlSXyddD+72EKxaYFJ4hhUaV4spSRGWf6sJREvp0
	4BQpgid0Tj8QW1BLyhyPndPGYtpXOjMWqY8kfJa6fL7ykkSIP5LhjNDOyzm406ilOMzyQdz34BF
	0t9+Q22o3IQv1axfl6F6E8QY0eX6FjGCwWZlyq37UaCcPID37wz2FXXLeu32Zq6FLRWVY
X-Gm-Gg: ASbGnctTg4TRgVNMDic0WsboV50KAE72LwHA6AlowRVXSSMVIZ8cEycQN5su3ENR8Ls
	2hHKyQ1kjeHznT2EJyw4A8WppRNsOgVxektxrOjUtk2PiPKshJ3dsYlRvi/40PgeWFVmKonP5+/
	i9Q077RjphZkAidkDvAWaRnCkYg9tb/5Y6LT4EGx0cQNnTRyor+vr3iRgbgZv3X0RClY9b4L7ec
	d8I8VOU8bBigZSs9eHVUUm4TEExrwT8cQuZeP20xycXeE0q9wD8fyJmkp/0oJ0fJXfb7MkGIvZi
	FS20HpNI+JDM+Z04k2pSbnmRqVWWYrJ1QcdMmOqGxtpAOrAiERGOu34MgDh82f0pOTjjmrTm5Ji
	O+WI=
X-Received: by 2002:a05:620a:1707:b0:7d3:c69d:ed69 with SMTP id af79cd13be357-7d3f98ec727mr193721385a.6.1750438875890;
        Fri, 20 Jun 2025 10:01:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG16STpHVdEHhYbxIqd3DOFgM6T+wJ9+inbvmdt4Ws0DP1ihUKEnE1P7W/LjHT61a5uRN3b1w==
X-Received: by 2002:a05:620a:1707:b0:7d3:c69d:ed69 with SMTP id af79cd13be357-7d3f98ec727mr193718585a.6.1750438875323;
        Fri, 20 Jun 2025 10:01:15 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60a185797bbsm1647747a12.35.2025.06.20.10.00.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Jun 2025 10:00:46 -0700 (PDT)
Message-ID: <2d3ff07d-1cd8-4eb6-8b3b-2d0d6f64445f@oss.qualcomm.com>
Date: Fri, 20 Jun 2025 19:00:37 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/11] power: supply: qcom_smbx: program aicl rerun time
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
 <20250619-smb2-smb5-support-v1-11-ac5dec51b6e1@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250619-smb2-smb5-support-v1-11-ac5dec51b6e1@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: gtjz0VbxPtph_olD-oSAGw8dHL4dfN8r
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDEyMCBTYWx0ZWRfX6kbHpx76zbrd
 GDiwvUaYAnFQ2GMwKTbw3HVdJzrOLyonhXro4lYK8pvOGXtm62qdVjiHGZrZRKMJAi6a4j8BltM
 0iBepyZM9NTrSQcOqMmKDGV6g1Idj+HE+J8Pa8hcRMHw1FnPY9Ldq2eevHK1ziuerow2YrHOw47
 njZUeFwUqOalggyuKJ6luf8wbaw0CwG9IIeitPu1ztB/X/Xn7tcbs/Vk8O+uiLRxfzapOWlUtvS
 CIhUB3rx3h5aXctRnibQ0aH/M7fr8JpRYkNrxm7xDH44Or0EFu9E0Zl7CP/C/dbm4oJf0klU+EG
 0pDp6dGjc8VDTalzLP5SWFrVcNHofbE5wsHuMAGmn4yWghddNJNzO8qPbOe5JxveCS23UhIOSlp
 os5gdLYotwnP35ncPafDyKKCRulHYrVdWYTHu5A/XAJ6qyKx/Z1stMd/kps2Fuetbz7e2H/r
X-Authority-Analysis: v=2.4 cv=UL/dHDfy c=1 sm=1 tr=0 ts=685593dd cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=KKAkSRfTAAAA:8 a=tPfAkDRKdS00ijgZXEcA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: gtjz0VbxPtph_olD-oSAGw8dHL4dfN8r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-20_07,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 phishscore=0 mlxlogscore=999
 malwarescore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506200120

On 6/19/25 4:55 PM, Casey Connolly wrote:
> We don't know what the bootloader programmed here, but we want to have a
> consistent value. Program the automatic input current limit detection to
> re-run every 3 seconds. This seems to be necessary at least for smb5.
> 
> Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
> ---
>  drivers/power/supply/qcom_smbx.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/power/supply/qcom_smbx.c b/drivers/power/supply/qcom_smbx.c
> index d902f3f43548191d3d0310ce90e699918ed0f16f..b723dba5b86daefb238ee6aae19b1b7e5236fce3 100644
> --- a/drivers/power/supply/qcom_smbx.c
> +++ b/drivers/power/supply/qcom_smbx.c
> @@ -1091,8 +1091,14 @@ static int smb_probe(struct platform_device *pdev)
>  	if (rc < 0)
>  		return dev_err_probe(chip->dev, rc,
>  				     "Couldn't write fast charge current cfg");
>  
> +	rc = regmap_write_bits(chip->regmap, chip->base + AICL_RERUN_TIME_CFG,
> +			       AICL_RERUN_TIME_MASK, AIC_RERUN_TIME_3_SECS);

FWIW a random downstream clone I have sets 0x01 which is claimed to
mean "every 12s" instead

Konrad

