Return-Path: <linux-arm-msm+bounces-36609-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 56ADE9B843B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Oct 2024 21:18:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CAECA1F237DE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Oct 2024 20:18:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AF761C9B6F;
	Thu, 31 Oct 2024 20:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QLyl/b1b"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C02321A2562
	for <linux-arm-msm@vger.kernel.org>; Thu, 31 Oct 2024 20:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730405930; cv=none; b=DsfL8/4mPYIaxbJS+r0yWIKiwP20/TPnuRhZ+0y5yA2Q38v3aVjdgcl8KYCT6+RtHX5k6A0twpzCHzFTq576vx5L0q/YuRQRBa37RuPqiO+a/MACKn7Siy1cZbpOMQ0xiwZU06xA+U9M+YV2hNHA2wDSJ2VR5Q1zDbK1jotVO8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730405930; c=relaxed/simple;
	bh=ZtAVjPxgYxzMtH9aW8STEf1QR6wb+MN6NfwJGe0MZxs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F60P8V1VnqJUtIDM6HTjV4Oi6BBErTrvmRuA/CwdfX/7bDX6ENzbp5ZthWcokMNytuoWuGx9EXZWpmPiv04FWOG1X72xHD5V6dxAX524sR3FHyNdQPPzbP9/wIdH/F436CevnJAJf63mm8YqnOWgWD9Wxy6aQUmbQBD8qMqrYjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=fail smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QLyl/b1b; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49VC5tLo005862
	for <linux-arm-msm@vger.kernel.org>; Thu, 31 Oct 2024 20:18:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+lwChbtf4QlnyS3a2fLibTs+TIvRzaYRIdxAmVV+Nho=; b=QLyl/b1bFoZBbmDs
	U6x0dCHx3E85PrnOaN6+Jwpd9KmVRZB9G64Jbn+y+pamzB4FXO4opdY01bUeHtCJ
	9zkwj/bEvO0ZeaXsyJJqPMg6ZAnkcNOdkUlQ6cbVLci3movx91VCeSrtjBX961i/
	hC8lHaxtDGRiaxgb1H7jZA+h8IwH/UNkmoUR12sMc8vCVvEEC+9CMGrO2J/WSKuG
	KuokHUT/1gtHkZSjK0Qd9k9EY7eE4PQCfoYLOXkDQTBTVpsarLkKr+xAeb3HJxL9
	ZfA5ceIs2byOfiuqvWCAyV1qgkOjxzVYtX/fqldkCfH8LnJtsPtkSubI10LCpgev
	INApJA==
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42m1xcascy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 31 Oct 2024 20:18:47 +0000 (GMT)
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-5eb85207c7dso92597eaf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 31 Oct 2024 13:18:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730405927; x=1731010727;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+lwChbtf4QlnyS3a2fLibTs+TIvRzaYRIdxAmVV+Nho=;
        b=DK5qaVN69Wm7aiBasFLcavXfoy10UYfJFQBccJtZWEp+KIv56rwT3NjgwXvD0zB9Pj
         /fdGnbRVnxxljb8br7fqT8a7FEXGxrE1BXhlOz2ZeZML61kanPNxaYqopno5X2d+DsuK
         yANXCJKwvZC8op16GYFq4a1vX7NMAqP/o7DQeVOuKuxXX2fyyU57oUIytXcA6Q7KpDgh
         TZ3JA4IbQd9chKimRojdFyubhzaaiUmInQc2NVpJ1NykagiOGms3CdAqyanGs04cvGVj
         mcgLcVfcyNCmW/WQF7yKMF8YWNhzZOrbV8WUnKYPoPTkIoQ9FKtjSbfy2xF72tp6RC2a
         meLQ==
X-Forwarded-Encrypted: i=1; AJvYcCWwMjEF/zsG2tO3rzvoVouyBeSg64ynGT/NNZSIbBrhM1YTzKXoe6uh6y9nvkTk2txFCIo0BnwKz3tlDqlL@vger.kernel.org
X-Gm-Message-State: AOJu0Yyk5WGT8kSu/IOFA9Edxc68Q85YuAA9ox/7nUMOTk9hFoiFoxET
	TomfUybr7RX0tvIYM5sk6QjWVrvLmCipXXLFw6cGpgBZp4pzcmak1p409Aaeakq4+55QIZCSrvl
	BNogXMQMfYPqifuHsuuMpQ1MG2AeKE/a5RBZYWmaM3lYCJa+p649K5pxLwX3VlWTs
X-Received: by 2002:a05:6808:1488:b0:3e6:24a6:f148 with SMTP id 5614622812f47-3e6384a3182mr5529885b6e.5.1730405926965;
        Thu, 31 Oct 2024 13:18:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGKrXFnhagF7X7syfI1//VxiRkYcsCZRZNjwpIrrX3+vJvnvmLryqItYJyXUaawNRnQpQnCnw==
X-Received: by 2002:a05:6808:1488:b0:3e6:24a6:f148 with SMTP id 5614622812f47-3e6384a3182mr5529869b6e.5.1730405926612;
        Thu, 31 Oct 2024 13:18:46 -0700 (PDT)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9e564c4f45sm100262466b.71.2024.10.31.13.18.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 31 Oct 2024 13:18:45 -0700 (PDT)
Message-ID: <e19d9f78-361f-496c-be81-e1ca1f0efc05@oss.qualcomm.com>
Date: Thu, 31 Oct 2024 21:18:43 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1 2/3] arm64: dts: qcom: x1e001de-devkit: Enable SD card
 support
To: Marc Zyngier <maz@kernel.org>, Sibi Sankar <quic_sibis@quicinc.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, krzk+dt@kernel.org,
        robh+dt@kernel.org, dmitry.baryshkov@linaro.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, conor+dt@kernel.org, abel.vesa@linaro.org,
        srinivas.kandagatla@linaro.org, quic_jjohnson@quicinc.com,
        jens.glathe@oldschoolsolutions.biz
References: <20241025123551.3528206-1-quic_sibis@quicinc.com>
 <20241025123551.3528206-3-quic_sibis@quicinc.com>
 <86zfml1tbv.wl-maz@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <86zfml1tbv.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: rM0Bc55HOrTe19QJJFzxuW2Titpo-YxK
X-Proofpoint-ORIG-GUID: rM0Bc55HOrTe19QJJFzxuW2Titpo-YxK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 spamscore=0
 malwarescore=0 suspectscore=0 phishscore=0 mlxlogscore=966 clxscore=1015
 priorityscore=1501 adultscore=0 mlxscore=0 lowpriorityscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2410310153

On 30.10.2024 4:52 PM, Marc Zyngier wrote:
> On Fri, 25 Oct 2024 13:35:50 +0100,
> Sibi Sankar <quic_sibis@quicinc.com> wrote:
>>
>> The SD card slot found on the X1E001DE Snapdragon Devkit for windows
>> board is controlled by SDC2 instance, so enable it.
>>
>> Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
>> ---
>>  arch/arm64/boot/dts/qcom/x1e001de-devkit.dts | 20 ++++++++++++++++++++
>>  1 file changed, 20 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/x1e001de-devkit.dts b/arch/arm64/boot/dts/qcom/x1e001de-devkit.dts
>> index 432ffefc525a..f169714abcd3 100644
>> --- a/arch/arm64/boot/dts/qcom/x1e001de-devkit.dts
>> +++ b/arch/arm64/boot/dts/qcom/x1e001de-devkit.dts
>> @@ -672,6 +672,19 @@ &remoteproc_cdsp {
>>  	status = "okay";
>>  };
>>  
>> +&sdhc_2 {
> 
> It doesn't look like this path exists in the upstream dtsi. I guess
> this applies on top of another series that isn't exclusively
> targeting the devkit?

<20241022-x1e80100-qcp-sdhc-v3-0-46c401e32cbf@linaro.org>

Konrad

