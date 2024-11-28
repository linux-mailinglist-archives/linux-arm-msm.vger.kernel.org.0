Return-Path: <linux-arm-msm+bounces-39498-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 384889DBD0C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Nov 2024 21:51:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EC32D281ADC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Nov 2024 20:51:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D8661C32EC;
	Thu, 28 Nov 2024 20:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hCp0Y+Gz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71A571C302E
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 Nov 2024 20:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732827103; cv=none; b=hwpLEf8aEH8NO4QsHWXyktxXRkXPKNFzknNtYlVtHd52igqRzyt6syjwvB9RZcwFeHYuup02+WvAaX501FqdKbSRGuIx8dTh6RvbzdbTdRnAqgdxNYedl2W6CZ7cWBzsqG0UNmXlg5K95q8PwJcDjhnATISq5YTs2eAlibex0zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732827103; c=relaxed/simple;
	bh=S3fEwRzf+95GuuIf2gn1/bGkssvPOpxwgvp6Ntrq92s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WUucrteuaih0RhUElhNqOFHbDWyW3xADDpSkhZ1ucfyC783u6oiN80woheCQR910XZKBW1bmYrgqLyhDnZRRyNncOZp4HaJpJ9RqbYssnV9ULGWmdisqvGbOH74O38lCPDro8EOeRsgqhAHpHJFR8u+6B0p13dgkWX/cHSnzfFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hCp0Y+Gz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ASIo2BV024717
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 Nov 2024 20:51:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YO+63SqzNSZleOnphAI5CtW01nneSUZGJugsHP/1Bvo=; b=hCp0Y+Gzz44QIr0N
	QiziuaCQsWhxAwno/LB3r7gcAPQpW1PSxocUKhVLLjpzg7UxwtRVlPBXzSMhzARN
	ZFomkgJVxgcFLLMPTcQp4XouPBQGAYY4jPmoGtIhs4ZlaZwju2SCtdET0F0VBxwX
	KP/rn4mBw16hQ0sXM2ZpR6JvRowMttZpejnxtyBxpxUYzu4cwT29g6AmljYGwWT5
	pmPzxLoSFBACJslZERkXLHTxqoQPwHreX/+za4Dcy82qZ7+5n7DI3UUjHKeP2Rw3
	Wr2wjpYjqe/lMSrn4F384523Ry+xKbrK+8zvbKqxA0jjW/HByjTPbrrrMVeVUXAa
	+KmCBw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43673jbn6p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 Nov 2024 20:51:41 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6d880eea0a1so799886d6.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Nov 2024 12:51:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732827100; x=1733431900;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YO+63SqzNSZleOnphAI5CtW01nneSUZGJugsHP/1Bvo=;
        b=NULMcpsRlssfgLyEp2ABrjQGbWmFPsLMRkIK1qkMjCCCR9sX0TS+3TPFqa4Tyt3xpg
         jEOafQ2H08ue4nqCO7ArEFRqhXuDyzIqC4DtF86mtX7RoUj89cnmiwVVYzcx8wJmAtFh
         ULCBiqcio0UPiwZSVmweQQMZh/auJ+nguKFH2dq7kQjg62Jb4lnGGSlX+oCRbV0mzDGI
         5z3xHtfQ3+lHSgpvmSWhPNxf+LNIBObyLv3he1Kur9wL0F1+qT6pzdkLIuQiKEfJdh78
         IPkWFGgpEdJKyUN/ONmfQNEwbz8PF/H+aeHjt37r1rGtXCtRlR7Lm9iK43YFJaA2uLJ1
         947w==
X-Forwarded-Encrypted: i=1; AJvYcCX/e+l11T5QnlhnsNOLek9lWCBYBSy2C5jPNq0Ygp1jI8kE07Nk5aLDcHMG54QOoRw2zJH8mYWJ+W7GrozR@vger.kernel.org
X-Gm-Message-State: AOJu0YzBeDH7//DebdIpMQSMAuYOg6CjbkgfdKtwJDDVyICxgRj49BpC
	hIGYYpQJ7s4DTQprKk8SDsfRlZLQ7N5a2i5M0nkKSvtEolj/Ah9mq/3DVhAsCc7Ol02g7xG0fGt
	o8aw91Ff4iv7lxAzDnwTl6KipemIna2RDmGkH869Jz2OFQXtNxijYHjvdrL4w6mxE
X-Gm-Gg: ASbGncuGRsH/H5cr6/yp4MzHejngR1rs0B9vu7vnyG+b4NYyTrBbTBVwPYD+xzRK5yS
	c/v82YbovSwPJbXCR4MAScUWlfQMRV2lBb6qVfiuzNmYLdDDtAF/77t6quepXH2s5V47yXxsAiP
	Y447lN0VG3VA52QJbsi4ao1krSuMEgQ2s9FRizFvpEt14fp/W8hQr5z1jb3hWM4J9tGh563Xy6L
	MVxUGPOkYhc0kBnqYQuvST32V9uM99AoRDphoBlkBlsUKPjJPbYEn2dJO2vIxXc7V2wHcSkniCS
	/KZHDXnNZ10kl6jT79wAbp3aPuhopE8=
X-Received: by 2002:a05:620a:2447:b0:7b3:2107:2eef with SMTP id af79cd13be357-7b67c50621dmr474882685a.16.1732827100096;
        Thu, 28 Nov 2024 12:51:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHi9dx1Pj9NkSNENKqt4G+dw9v2Xg+cie6fSEML8L/rZz+N+DT8Xtc+w9VR0C9Pn0Tjekm5gg==
X-Received: by 2002:a05:620a:2447:b0:7b3:2107:2eef with SMTP id af79cd13be357-7b67c50621dmr474881385a.16.1732827099666;
        Thu, 28 Nov 2024 12:51:39 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d097eb9bdesm1054157a12.82.2024.11.28.12.51.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Nov 2024 12:51:39 -0800 (PST)
Message-ID: <6deb55c7-78de-462a-bd15-6b1cdd4c731d@oss.qualcomm.com>
Date: Thu, 28 Nov 2024 21:51:35 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] arm64: dts: qcom: qcs615: add SDHC1 and SDHC2
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Yuanjie Yang <quic_yuanjiey@quicinc.com>, ulf.hansson@linaro.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        bhupesh.sharma@linaro.org, andersson@kernel.org,
        konradybcio@kernel.org, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, quic_tingweiz@quicinc.com
References: <20241122065101.1918470-1-quic_yuanjiey@quicinc.com>
 <20241122065101.1918470-2-quic_yuanjiey@quicinc.com>
 <7c0c1120-c2b2-40dd-8032-339cc4d4cda4@oss.qualcomm.com>
 <frjnnd7bvrdn5frfo4xnz35rb5zxa33eayu3oc5wux7casay64@t2tfbsf5jrva>
 <03b6f863-ccdd-4e07-9574-ee9dd7c20ab5@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <03b6f863-ccdd-4e07-9574-ee9dd7c20ab5@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: sDT_WxLE6_AcFshoPhVR_6VCuPSL9--h
X-Proofpoint-ORIG-GUID: sDT_WxLE6_AcFshoPhVR_6VCuPSL9--h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 malwarescore=0 adultscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 mlxlogscore=999 priorityscore=1501 clxscore=1015 suspectscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2411280166

On 26.11.2024 10:26 AM, Krzysztof Kozlowski wrote:
> On 26/11/2024 01:07, Dmitry Baryshkov wrote:
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
>>>> index 590beb37f441..37c6ab217c96 100644
>>>> --- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
>>>> +++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
>>>> @@ -399,6 +399,65 @@ qfprom: efuse@780000 {
>>>>  			#size-cells = <1>;
>>>>  		};
>>>>  
>>>> +		sdhc_1: mmc@7c4000 {
>>>> +			compatible = "qcom,qcs615-sdhci", "qcom,sdhci-msm-v5";
>>>> +			reg = <0x0 0x007c4000 0x0 0x1000>,
>>>> +			      <0x0 0x007c5000 0x0 0x1000>;
>>>> +			reg-names = "hc",
>>>> +				    "cqhci";
>>>
>>> There's an "ice" region at 0x007c8000
>>
>> Shouldn't ice now be handled by a separate device?
> It should and UFS bindings expect that. However I am not sure if MMC was
> improved to support external ICE device.  Also for example on SM8550 the
> ICE has entirely different (further) address space, so it also suggests
> it is separate device. Here address space looks almost continuous.

Some SoCs have two ICEs (one for UFS and one for SDHCI) - seems to be
mainly the case on platforms where there's "sdhc1" (intended for eMMC)
*and* a UFS host.

The commit message that introduced a separate driver says:

"""
The reason for this is because, staring with SM8550, the ICE IP block
is shared between UFS and SDCC, which means we need to probe a dedicated
device and share it between those two consumers.
"""

but:

* in sm8550.dtsi, only UFS has a qcom,ice reference (like other device
   trees using that binding)
* I can't find anything that would back this internally

I'm not sure how this is supposed to work, especially on SoCs with two
instances

Konrad

