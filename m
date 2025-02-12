Return-Path: <linux-arm-msm+bounces-47834-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 32E2EA33397
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Feb 2025 00:42:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D554E1668F3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 23:42:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DFCD21324C;
	Wed, 12 Feb 2025 23:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="asUuZJlJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0673262170
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Feb 2025 23:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739403753; cv=none; b=ZT1w2mDWsrVROQmJTPvu6AhaXDTTEqY2NJX+bDv91XTp/SH3djrX0FpCnhd6oS0GJoSwutaOFieAvd1jeS66evZ5XNrc7XKnYR4GwJSjGt0xV0shgld4+B6E18rK6TSK8AgQbJm2CqMgxGtPAwcdYoeZT0UvY9L22IjLTM7ET5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739403753; c=relaxed/simple;
	bh=4xJ/+2gfdWNob7RP6rwE58FMEWZdjuuYQeURDwUT5vo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qTvyqUlp4cVQHcEeVOz1p7tkWK0wR3650BnuSREJcPRWCGHBlGU92xVCyQUf+0+V+1L5Kcsl0g70BJtsTBpXakB5qysSK9XLXWIwmjIKtGam3s7d5ACnO2keaXRInOFFyvP2aTKwgGx2qqUk81hMwBWGXUz8FTRPeI8o2yDvSKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=asUuZJlJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51CNQDm7029665
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Feb 2025 23:42:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xgGpedKTGpzNZfyzdIjm1VKTHgp+XOgbBRSIPKpy4pk=; b=asUuZJlJFet1EeGW
	GecB5BXf8QVZ7D/yvNDhlgkiJeJMFtI8ptYHfs9L5Hkpc2WTWep75Q/cz3+g111d
	bmdSk2tmtyu04Sy0Sv3kkfhyEBTftxuYK7gdWUGjgdxpgcwZQkKVZvOxNEpxpWtx
	91xPNhhIj/HCDmDRZr8F+/rui6PWcPBOatJk89anTMJGiGKlWQ00fAieEMvUD4if
	VTBWnCXfrLwsqYuMrpevmCmFLkv8LqIaUsoQLwlKQoakVubsPr8UHHYA942FEqeU
	UJO5f9JiWR217dRWR5Epik7mw+jeddQJQ2YiC6a7pILTuV851TdSSVUFmN5ko8Ku
	kjSt3A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44qe5n10g2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Feb 2025 23:42:30 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c0797974bfso3179385a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Feb 2025 15:42:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739403750; x=1740008550;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xgGpedKTGpzNZfyzdIjm1VKTHgp+XOgbBRSIPKpy4pk=;
        b=ck1jTXicDpWZgHKAp0I9asEH2Ewjl709sl2KbVuqsIDLN87NyfPdbvRECGR2fVordb
         /wq7F4rYw92vAgkMWY74dqh6r1sn2dfkJWFdnOL+cv9WQsRdMQtXvOWTOGwZ/COrFId6
         z426lWBxoq23e2Kq3wbQjcaOU11pYrt5PWiIB3YriVDPGgF5b2BxEK7fQqkzSnGoehuQ
         80LNCwMGblpu4/0FPdufLUbScbDjEaEA1Os0A0z3qjwWeU1lmVULUvuoQfjewhtCh2z2
         j6gZMn1qgCbCWlY99lgnFHUhoM2COGDDv+cI5ZdGnJTXX08YTlca83DLolBgNPM8MlOB
         7VBg==
X-Forwarded-Encrypted: i=1; AJvYcCWDNsokkmeKi0777p1YHKP9Bp3DdxAImpOSxC+CfvFooMV8IOVLEs3UCUkNzRkVUfFdSAAn+suqYg6FdMuP@vger.kernel.org
X-Gm-Message-State: AOJu0YxsozAjRC+4WuCcqxD9ixze6JLLKcUC5oIGd0F6T1oCMBQZSBYB
	t8q6Ng0Jjt8dz6JZW1VPwcU9WKgyFZjfUSLuGouVfdju86u1qqyUz0O5JgaHCAFLM/hT1uG3+es
	y5OimIa+5wqhODeBuwBJ2SDU6EPOntwfCnQ2ZPAFL4/hDGMSUlGPOThUCYDylwWuY
X-Gm-Gg: ASbGnctfmZ4VQzXuRFoJrCxFXY8nmeFydW9idYgpKQvn1pt6bx5N3YQ0phDYXQvKuKc
	5mer3LEbG/OREhmYMQI8aSOt7I9sXaUYBClSbavd7SQq5JW1LHVQMQ4OEzZKArecOdcfepbJZ3f
	UJKVad+7/Q1eZT2jaFBrfpmZSqxcoIiJVhLi6VC7rgQtbSjQjG0h9Wbz4DqttCWWKLm1R83puaY
	SreTtERMlp2HRCL+gfm3E8XvC8zRevbrgvChDFeAO99JQkpuOINvbgIsYJmtHJP+75poIfMtsKA
	RRJQyriCiFo0Y7G1z1Uy+mhFM3dvFkeEkgMR7wRztgmvr8TsLoNtMF5fB6Q=
X-Received: by 2002:a05:620a:46a9:b0:7b1:e77b:26dc with SMTP id af79cd13be357-7c06fcc6989mr319510485a.10.1739403749876;
        Wed, 12 Feb 2025 15:42:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGWgKCUEyrSFH/f5Wf1948BY9eXMfVEWSMHJfsB3GcAHOuXYsbdtTrfSIh5vcVxv1/Rh2F8cw==
X-Received: by 2002:a05:620a:46a9:b0:7b1:e77b:26dc with SMTP id af79cd13be357-7c06fcc6989mr319508185a.10.1739403749511;
        Wed, 12 Feb 2025 15:42:29 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dece1b4debsm182858a12.15.2025.02.12.15.42.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Feb 2025 15:42:28 -0800 (PST)
Message-ID: <ee113bc0-e8f9-48a4-8c31-20a5e2670ef1@oss.qualcomm.com>
Date: Thu, 13 Feb 2025 00:42:25 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3] arm64: dts: qcs6490-rb3gen2: Add vadc and adc-tm
 channels
To: Rakesh Kota <quic_kotarake@quicinc.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        konrad.dybcio@oss.qualcomm.com
Cc: quic_kamalw@quicinc.com, quic_jprakash@quicinc.com
References: <20250212113342.873086-1-quic_kotarake@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250212113342.873086-1-quic_kotarake@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Y9D7Mc4t3Cm-kmwn8Zh2Ky3KILr2Lh-s
X-Proofpoint-ORIG-GUID: Y9D7Mc4t3Cm-kmwn8Zh2Ky3KILr2Lh-s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-12_07,2025-02-11_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 mlxscore=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 malwarescore=0 spamscore=0
 mlxlogscore=715 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2501170000 definitions=main-2502120166

On 12.02.2025 12:33 PM, Rakesh Kota wrote:
> Add support for vadc and adc-tm channels which are used for
> monitoring thermistors present on the platform.
> 
> - Add the necessary includes for qcom,spmi-adc7-pm7325 and
>   qcom,spmi-adc7-pmk8350.
> - Add thermal zones for quiet-thermal, sdm-skin-thermal, and
>   xo-thermal, and define their polling delays and thermal sensors.
> - Configure the pm7325_temp_alarm node to use the pmk8350_vadc
>   channel for thermal monitoring.
> - Configure the pmk8350_adc_tm node to enable its thermal sensors
>   and define their registers and settings.
> - Configure the pmk8350_vadc node to define its channels and settings
> 
> Signed-off-by: Rakesh Kota <quic_kotarake@quicinc.com>
> ---
> Changes from V2:
>  - As per Konrad Dybcio’s suggestion, removed all default polling values.
> Changes from V1:
>  - Update the Die temp name to Channel as per Documentation.
>  - As per Konrad Dybcio’s suggestion, I have sorted the pmk8350_adc_tm
>    channels by unit address instead of alphabetically.
> --- 

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

