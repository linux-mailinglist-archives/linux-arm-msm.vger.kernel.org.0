Return-Path: <linux-arm-msm+bounces-42013-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0513B9F0CA5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 13:46:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 02223161A71
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 12:46:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46A621DF746;
	Fri, 13 Dec 2024 12:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NX5vicBS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D95A81B6CFF
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 12:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734093979; cv=none; b=FAYsApcETWmwzHmTKEv8Ct3lwMmDNqu4OERGnME5/grCOE+Oywj6A/x3rB9HWb/RBlA1vHYFwRm0O0qhJQli0mLv9r/NNVVCZ8FULh3A01riW+7Y9cQjcfmR3gzrZ8joSerHjz3jK8Uyv7PJdLNeo31dYh3Japwmt5/h/4JD44I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734093979; c=relaxed/simple;
	bh=3p+CQsbB5i+cFiZUS0/AgT6MTGwqwoSiTAyXjy4jBAM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mBjhf5s7V1uHGpNFHMSxcGfDYNn+ioJFdi7jklbUHefcrGsD8RBVaQSeDCVfU4YrYhXES5LNAURyflsvmUadGfrv3xCFXtz0z1Z6T4Q0mqAL9ke7S9WRHGSUe5MS3X+JWpDmoogiTxX7duAz6ZNVox/16rdpqhFeMBEIQiOHS9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NX5vicBS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BD80LsF032522
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 12:46:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	322sb65Govxzmaokzre8m+pPsTL1q77XpnWd+ZZ4Vfs=; b=NX5vicBS+cYhDFSG
	+AxglO78kt0oG1XJNQbP9lHLvxWVHd4IeiVbmMtOE2Kjj4jW7p6yuI/Thz2PmUQr
	q/7DaIW021P/wco8t1ofFsagBlfHlaOOdcjOswa4Gr6OySOVmOXWymxui/d5hlW/
	kapNGAF5FjCnnhj4DdHEoJG6xwY/9rTSHoFPE52zZ7iYV854+om9oGNfjSjJepE5
	qoqklVW/mLNjd9ofByDZlNX7ZU5wT46V00Wck2kji/TMBsubQNWQDqQXzm+dMFUm
	0yMkWvnXAMwyP6czhBqcK+z22SABg0u9ovxVqiuXn1KKninfI5yTbGthBS6x+bsi
	KeJ3ag==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43f6tffm0x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 12:46:16 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7b6faf8b78aso22866885a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 04:46:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734093975; x=1734698775;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=322sb65Govxzmaokzre8m+pPsTL1q77XpnWd+ZZ4Vfs=;
        b=Nn1mUdfgrEtG3ON4szPqM5sm2eGx6O5UXICTc1qND0Wjt4MzczvScukURm8EjjuC9E
         KohMixIsbGYZDFrz0kSs84257oJTTkTq6taMfNpPPgfztYxL639x4g7y6SVeG/pKjx3e
         Dl6UTkgrH80vMUBSFLb0pbjzUZBCAEhJisHdIP2GZ6TgpfL4XbgxuG/locJNOl8GnadL
         lWcEtuglA0hCXZoR3akEc3869p6Wc1sM4uqGP/TAoAbzuGT40ZfJsc6LPibbaaF5NHEN
         QfXXJc2CjJvFZp1gU6LlcHBsPB30Lw0RxUJ8sSq6Vzsqnp7MIQV6hUQVj+k5ahfx2gAG
         TlCw==
X-Gm-Message-State: AOJu0YzlwYB44KP9DHU6tIdxaAasGetm1xd6yHETUOwLtnL+HhgZAkcv
	UeAHRKtnD6HOigQb02p4s6hmUhI65d8nOQcHsRC78y9cA446N5AqPk0w231SsxToWakYan6a7Bb
	pBOM+ct4R6IQmaTlK+W/ZWpEULqcizZlbY2TYMHbfYgdwEFh9Z4OnGH0mJr8NxGZO
X-Gm-Gg: ASbGncur5UAunKgcC5ITf/hWkBRDW9uDVPIj4bBIKtuyhL1NxvMyAKkogqe0+lOJDjx
	QXYV/phweDmakeM3/D4IucToe1VD3z/F6jPew9D5yMwJirArAREnb9xhgsVJgb4huPsiyb45Ddl
	DA9l4JcHMzEj7jB1R/VGts0YW8dJ9ijkB4wNVgUueAM+L5vfAFIKix/+st5soryTbW9woXgi2nj
	Ph8p9HyMUVkV0kCuOXjx/eDKg05MHaFOKAeXh6NI0B1JCvCmSTet4se+aIxEr3bxvUGlC1n4kGy
	cVBi8Rr+pzlL0x4uwcw33061FhtT0a5fx5S/
X-Received: by 2002:a05:620a:46a4:b0:7b6:753b:9b5e with SMTP id af79cd13be357-7b6fbf14fe8mr117322485a.9.1734093975546;
        Fri, 13 Dec 2024 04:46:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHCgXgVIRepMOK1PH0RtfqUKtKg09dCU/YpMDIeE2+caqG/wtCIds7uJFW7qJdKipl3vT8NAA==
X-Received: by 2002:a05:620a:46a4:b0:7b6:753b:9b5e with SMTP id af79cd13be357-7b6fbf14fe8mr117320685a.9.1734093975193;
        Fri, 13 Dec 2024 04:46:15 -0800 (PST)
Received: from [192.168.58.241] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa6873814d4sm700901766b.54.2024.12.13.04.46.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Dec 2024 04:46:14 -0800 (PST)
Message-ID: <ee245c01-b5bb-4ed4-963c-57c979f26091@oss.qualcomm.com>
Date: Fri, 13 Dec 2024 13:46:13 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: sm8750-mtp: Enable CDSP and mention
 MPSS
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20241122-b4-sm8750-cdsp-v1-0-9a69a889d1b7@linaro.org>
 <20241122-b4-sm8750-cdsp-v1-3-9a69a889d1b7@linaro.org>
 <d43a2a74-9867-42b7-8810-df081f037831@oss.qualcomm.com>
 <28afe0ac-5d16-4786-9259-6de5d090b491@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <28afe0ac-5d16-4786-9259-6de5d090b491@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: VtKde98jf0ySnY1yurXh6GRH9jjhj2jm
X-Proofpoint-ORIG-GUID: VtKde98jf0ySnY1yurXh6GRH9jjhj2jm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 mlxlogscore=793 malwarescore=0 spamscore=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412130089

On 6.12.2024 9:56 AM, Krzysztof Kozlowski wrote:
> On 05/12/2024 18:34, Konrad Dybcio wrote:
>> On 22.11.2024 4:26 PM, Krzysztof Kozlowski wrote:
>>> Enable the CDSP on MPT8750 board and add firmware for the modem, however
>>> keep it as failed because modem crashes after booting for unknown
>>> reasons.
>>>
>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>> ---
>>>  arch/arm64/boot/dts/qcom/sm8750-mtp.dts | 15 +++++++++++++++
>>>  1 file changed, 15 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
>>> index 8eeed7f2f7766326cfc7830002768087e9783b9b..e2562ea5996ddfb1bee03b367082f4e1890131f3 100644
>>> --- a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
>>> +++ b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
>>> @@ -791,6 +791,21 @@ &remoteproc_adsp {
>>>  	status = "okay";
>>>  };
>>>  
>>> +&remoteproc_cdsp {
>>> +	firmware-name = "qcom/sm8750/cdsp.mbn",
>>> +			"qcom/sm8750/cdsp_dtb.mbn";
>>> +
>>> +	status = "okay";
>>> +};
>>> +
>>> +&remoteproc_mpss {
>>> +	firmware-name = "qcom/sm8750/modem.mbn",
>>> +			"qcom/sm8750/modem_dtb.mbn";
>>> +
>>> +	/* Modem crashes with "DOG detects stalled initialization" */
>>> +	status = "fail";
>>
>> That is a bad sign, let's hold off merging this as we may be
>> missing some resource..
> 
> Luckily there are reports that all modems on recent boards crash (sm8550
> and newer), so probably nothing wrong was in this DTS. :)

Do we have anyone looking into that?

Konrad

