Return-Path: <linux-arm-msm+bounces-49311-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D3E4A440CB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 14:30:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4EA403AB3E3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 13:25:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE43E2698A8;
	Tue, 25 Feb 2025 13:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZL7DIzay"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B62F26989E
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Feb 2025 13:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740489934; cv=none; b=m0dCHufmZd4cZYcYCnbWihdLjFEvoMiJDkPY6aKAOpmJYhzlYa13Hdh73NIzoJWLpAlqvLKz19bFOFxIqWcURdDBVpK337+ykxYfJ7B3DYbV1Q/ltPzJW/BY6GpjgpaReqKhWz1H+/PwJE+X66W8HZlFBjxAgPSkqoWIIoLbWdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740489934; c=relaxed/simple;
	bh=dvkgY9j8ojAQTguJ3EVyiu7M3f7f8wi6+K9BQusSw6E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XuXNZlbaO/8XWxMQ0dbk8caF93yqLoLvvVKW6Ufe760ip82K9h84Otoku+KallikNxvjZr1ae+yzPtxdy+8CbcHvkFB/cE9K5VUVeE8fLdSHNSOUbD0jb/JOwcVDRJEUsop8CCnLW3pZmGw9j7p56DIISDpxJkohvnb2K8+SOB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZL7DIzay; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51P8G4D6031843
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Feb 2025 13:25:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5mmpLZ8VgP/27nMfQFbOtx5Wu4HFcYY/tpK1+Z8cAM8=; b=ZL7DIzayGdXqCQ3X
	gy3YXrL5tm2VFOBaE7ZJowUtIdpLxOzumiu9cY4hbdQSNbucRU024M/HVmsE52dX
	cicgl5ScipIhi2tMnZq9UwzDrWb2iZ0CktuvMkYOLbNwmeKRy0Bz0lAE1FwjbkkW
	53bPWVQCpEK6fG2ywKNucP0ze+p/5mttq9A/EzrF7oJMYCPxx7ndi7vMBBA0g31p
	ofUwPR98+4MIGN3JBRli6tY/agoJvlL+1myYpyRUzr9NbSgG8nf6WZPwqAtNpikd
	zboO65KUlKUuglxgg33OC3i6GnK7a8jD9xwTbQ9xkLopmduVReSfozkWcY2rv7Yt
	gn+sLw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44y6nu10ej-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Feb 2025 13:25:31 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6e662a02f30so16482466d6.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Feb 2025 05:25:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740489931; x=1741094731;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5mmpLZ8VgP/27nMfQFbOtx5Wu4HFcYY/tpK1+Z8cAM8=;
        b=BTm48oTDXcZUA9YP32Odos225uh+8kyjiC1IxHxUU09y9qobrWPyle9gDsxrf4r6sj
         0d5yK9FtfUEEdrPL+7RSxbK0exhz7ZUNlH1jdJR6QNypXGb1NrsKON+k/ZNFq1JXKIWp
         80SV1BHW/gGZ0m4X1u4y3hZ/pE3tFC10+esx8b4q25fXpY9Of9pGr7BWPRO4Ap4doeb5
         hxilMyBNroYxb+b1jnWxJW2eigyew/2NXlLqluEuKhH543aWuRL+lEbfgcMkkQOrRfSR
         V5WL+woBcziRf4Dt3WGcj2HbyuCrXUvkk30bh9EKikTlJ/d3IIoB0iLhLQzc7hjsPJ86
         ihew==
X-Forwarded-Encrypted: i=1; AJvYcCW5019mKOgQzv+4auezBVW7vwO99VxRnazQYWIs3F63EU8u8o8lXX9PcAbQ6rguq8aXnk4yEseo0fdMO+Xu@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2bVnMl8hiXgvRIxX692U6gKlQ3Zy6D/G33igFLmQJbFB7/Z3E
	Dm4X0zszhmRyyadfuMB2APAhwB1QAL2l5w5ejTDrmTnQy0xnzL75sWCrCLVTXS8kXDqzQqsPRN4
	jB+oz2TNtPB9UTxJf+EfpnMs99TUV9yEhZoukJ6uGopZoZ0YFMvXZ+H3M1xQO8AWY
X-Gm-Gg: ASbGnctj/kyRSQXgOZhf3r/7oK4V0jXTkqrg2NzQvRiMUIvTGlmE6WqGXDUN5WrhPwT
	RFhN7FLiFw2wbQJITHLEteHR7m+Xvp0pIffitRTiaGmCL8oX76fPZXEtbDOHSEyI43gfAL1hweM
	+LuKH+kiF49Z1xQMOrobA8XqNnGiup9jw6bLQybXGJ+QJC057nhbw6lESi/OqY8QLkG+lLJ2fJe
	uATq20etBC4GqbY3Z9kzA9sYdbELTIFgbmZad/LQ/q+KW/Jro8jE3PodsCjmiZNAF3OpQ0PxSF8
	NRJdoAgV40pR1o4GIicahoB50ZQXfflEMHu2nE8t0ltOY/IDNzyVhgeqqtJ2sSNf8poVNw==
X-Received: by 2002:a05:6214:4105:b0:6e6:68df:6052 with SMTP id 6a1803df08f44-6e6ae84f58fmr84420876d6.5.1740489931099;
        Tue, 25 Feb 2025 05:25:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHdoCz4YcMli/dmEDb2Ah8B1cd1PtE8d4l4hyClg4l1Svg64+pZ1eu6Aex3DhHpvo7en1+AQw==
X-Received: by 2002:a05:6214:4105:b0:6e6:68df:6052 with SMTP id 6a1803df08f44-6e6ae84f58fmr84420666d6.5.1740489930690;
        Tue, 25 Feb 2025 05:25:30 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abed1d6b153sm141600066b.73.2025.02.25.05.25.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Feb 2025 05:25:30 -0800 (PST)
Message-ID: <af3f28d3-d3aa-4da2-81d7-4c3640ae62cf@oss.qualcomm.com>
Date: Tue, 25 Feb 2025 14:25:28 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] i2c: qup: Vote for interconnect bandwidth to DRAM
To: Stephan Gerhold <stephan.gerhold@linaro.org>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: Wolfram Sang <wsa@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Konrad Dybcio <konradybcio@kernel.org>
References: <20231128-i2c-qup-dvfs-v1-0-59a0e3039111@kernkonzept.com>
 <20231128-i2c-qup-dvfs-v1-3-59a0e3039111@kernkonzept.com>
 <5dr5ps4vb57xj2mfelgsxgoyrr3gg4ggwqggqchff6pda3ffsn@thxpg4h6kgel>
 <Z7W1EJ7uGsaTZMRh@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <Z7W1EJ7uGsaTZMRh@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: GRXBDGdqV7PvMyxQM9QwNzlYl3_Juict
X-Proofpoint-GUID: GRXBDGdqV7PvMyxQM9QwNzlYl3_Juict
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-25_04,2025-02-25_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=999 malwarescore=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0 mlxscore=0
 priorityscore=1501 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2502100000 definitions=main-2502250092

On 19.02.2025 11:40 AM, Stephan Gerhold wrote:
> Hi Andi,
> 
> On Wed, Feb 19, 2025 at 12:02:06AM +0100, Andi Shyti wrote:
>>
>> sorry for the very late reply here. Just one question.
>>
> 
> Thanks for bringing the patch back up after such a long time. I've been
> meaning to resend it, but never found the time to do so... :-)
> 
>>
>>> downstream/vendor driver [1]. Due to lack of documentation about the
>>> interconnect setup/behavior I cannot say exactly if this is right.
>>> Unfortunately, this is not implemented very consistently downstream...
>>
>> Can we have someone from Qualcomm or Linaro taking a peak here?
>>
> 
> I suppose I count as someone from Linaro nowadays. However, since this
> driver is only used on really old platforms nowadays, I'm not sure where
> to look or who to ask...
> 
> At the end, the whole bus scaling/interconnect is always somewhat
> "imprecise". There is no clear "correct" or "wrong", since the ideal
> bandwidth depends heavily on the actual use case that we are not aware
> of in the driver. There is also overhead when voting for bandwidth,
> since that can take a couple of milliseconds.
> 
> The most important part is that we vote for any bandwidth at all, since
> otherwise the bus path could potentially be completely off and it would
> get stuck. My patch implements one of the approaches that was used in
> the downstream/vendor drivers and matches what we already have upstream
> in the corresponding spi-qup driver. I think it's "good enough". If
> someone ever wants to fine tune this based on actual measurements they
> can just submit an incremental patch. Right now this series is blocking
> adding the necessary properties in the device tree and that's not good.

Yeah, the throughput of an I2C controller isn't even very likely to affect
the total bus frequency requirement, although it's a strict requirement
that the requested bw is nonzero (otherwise the bus may be clock-gated)

Konrad

