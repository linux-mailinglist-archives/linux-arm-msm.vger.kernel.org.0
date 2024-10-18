Return-Path: <linux-arm-msm+bounces-35032-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3518B9A4769
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 21:51:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 928EE1F2230B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 19:51:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79B5020262E;
	Fri, 18 Oct 2024 19:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MPpVqvWu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEB13205AB4
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Oct 2024 19:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729281094; cv=none; b=g9P50l6Itr/pRzJ2GIhFhzYT/BQ8rQjyu+8dfP8XR3ilbGCwqO4P32QtpLQKwUax62AbHdIw+I2remm0jp2UfZ+Gt2FgueITryk1dNkbKshAThaKB1LUbTDILpQhTmqoq7W1G+Sz2DpYTFIaN7ZoBkbVEMwV15vQYBmxTYTAwRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729281094; c=relaxed/simple;
	bh=kExbHH+oxNyny5wKWmm0g7CywIGCSBP9irnyxn5J6GU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OiE5mqNaH9+/XYzthHiF5NdEQxhYCl2hJVonGj1/UWmDQya1H1FojErIs5F1uP4HT5QxDgnQNkgAK9orlb2SvSujssgzaMcBpngS0coC7qZao/juo5aeItoN5qKe0I5ZK/ubAuVV1lsj+rnIoJQVT5M9PuSL01XiTrfHIcqRiuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com; spf=fail smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MPpVqvWu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49IEujbS029139
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Oct 2024 19:51:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IVhVnBJdVne0oYLvVazKv1+qUKHXqZeHtFpVJEz33ZU=; b=MPpVqvWunkmZX8th
	Ns6KtZYUeqqebrOzNqSsum3+CLYmyR8CL2MbHsqIWWQfMhGnk1b0y6/gA5KgOrXo
	Nmukv7VQGHR1q9PsMP66ZSV9lBJLEVbPl3WfJ6L/T/MyFCQs8wzYpijS8A0nyUnR
	wTs3jo5/dBMrnd3oYXdBtLjMxvYe7D5pRyCcXHYc2ABpt4lrQQA9rCxLXwgdfx3y
	eMsGxr2+HyaGjOTyHAPEccPGFsBHrpwoviGEHeaKPbcPajMLn0dBB7O4cd+vru4s
	s1Ezcix6WE85wvG5sTiaHes5tCVz5S0alXZtvjmxyeA34O3/HgPj9DY5pI7EFBjA
	JzNAYg==
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com [209.85.166.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42bhbqad40-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Oct 2024 19:51:31 +0000 (GMT)
Received: by mail-io1-f69.google.com with SMTP id ca18e2360f4ac-83ac065de2fso9631439f.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Oct 2024 12:51:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729281090; x=1729885890;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IVhVnBJdVne0oYLvVazKv1+qUKHXqZeHtFpVJEz33ZU=;
        b=Es/9Fx1Im73zexx+6VgaN9nleu6vzG9UFSeF3geI8Rcqh6SPxE2vH5UL/g3ENe+FMo
         nMgqjm23oFYhq4VJpCzanQ5/TP84AC6HjrHPUPk8410P0RKzJt54GT2yyF0hnx3y26iV
         hC5gVjVYhxvjhmBA+4UlFeH+iT12d/Na3bH1NxTVEIqGgcYAeIjP/zSGk5MaDYg6ORXG
         nTDXcKwilU27gMYeU5f1W6SfQWJL6dVb7uBtoIlFFNxYtA4LPHoggNRiKQqMYPoUn+Zi
         2k/CcL8yOtrE2VU688DWxrtbCi2kmU3GvVwRt7ehcWXzfKaITWfC9FKv7S8vMoMjSoY2
         Nrng==
X-Forwarded-Encrypted: i=1; AJvYcCUPDb2OfGBL1F9DHT1JGyv727lEJb57vmDPvrp9rp7cpZXJXhx4Q7dqdrz5jNeHOcEIU4Fo+m///8QBfyuF@vger.kernel.org
X-Gm-Message-State: AOJu0YyJ6mDUTdxUnGEQn+1a1rJCR3XYQaAXjNR6B6lAU9SZ434bV/2t
	gYarm+xDxfJXyISTsTRrQAT2UwXltyGq/u/0C9p/4F91wMaHgwCsDA1LVtTB4MwqCfHI9IPFsEm
	kigNRAiFF0PsAnCi522SiExjFemSIo7w1kZFUi0JK0uITdTFQeXgWQwl71pJUCBJ8
X-Received: by 2002:a05:6e02:1a08:b0:3a3:a5c5:3914 with SMTP id e9e14a558f8ab-3a3f40c59a7mr7468955ab.7.1729281090519;
        Fri, 18 Oct 2024 12:51:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHzGGsPIhZIa69ufeWmPZycdZfWGmppELXEs8PMAUdKhcw+Nxq5T88PWDuDVJXLNSlOAVsE9w==
X-Received: by 2002:a05:6e02:1a08:b0:3a3:a5c5:3914 with SMTP id e9e14a558f8ab-3a3f40c59a7mr7468685ab.7.1729281090120;
        Fri, 18 Oct 2024 12:51:30 -0700 (PDT)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a68ad4eacsm131589466b.58.2024.10.18.12.51.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Oct 2024 12:51:28 -0700 (PDT)
Message-ID: <d5aa1d73-5d3a-478d-b030-a03a0ae89989@oss.qualcomm.com>
Date: Fri, 18 Oct 2024 21:51:25 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/5] arm64: dts: qcom: Add PSCI SYSTEM_RESET2 types for
 sa8775p-ride
To: Elliot Berman <quic_eberman@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Andy Yan <andy.yan@rock-chips.com>,
        Lorenzo Pieralisi
 <lpieralisi@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, cros-qcom-dts-watchers@chromium.org,
        Krzysztof Kozlowski
 <krzk+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Shivendra Pratap <quic_spratap@quicinc.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20241018-arm-psci-system_reset2-vendor-reboots-v6-0-50cbe88b0a24@quicinc.com>
 <20241018-arm-psci-system_reset2-vendor-reboots-v6-5-50cbe88b0a24@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241018-arm-psci-system_reset2-vendor-reboots-v6-5-50cbe88b0a24@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: KuG1Z7_O3DD8jqAN3yFURHk7KC_9g2Hl
X-Proofpoint-GUID: KuG1Z7_O3DD8jqAN3yFURHk7KC_9g2Hl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 mlxscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 mlxlogscore=763 priorityscore=1501
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410180126

On 18.10.2024 9:39 PM, Elliot Berman wrote:
> Add nodes for the vendor-defined system resets. "bootloader" will cause
> device to reboot and stop in the bootloader's fastboot mode. "edl" will
> cause device to reboot into "emergency download mode", which permits
> loading images via the Firehose protocol.
> 
> Co-developed-by: Shivendra Pratap <quic_spratap@quicinc.com>
> Signed-off-by: Shivendra Pratap <quic_spratap@quicinc.com>
> Signed-off-by: Elliot Berman <quic_eberman@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi | 7 +++++++
>  arch/arm64/boot/dts/qcom/sa8775p.dtsi      | 2 +-
>  include/linux/arm-smccc.h                  | 5 +++++

[...]

> diff --git a/include/linux/arm-smccc.h b/include/linux/arm-smccc.h
> index 083f85653716..bdc974b76df8 100644
> --- a/include/linux/arm-smccc.h
> +++ b/include/linux/arm-smccc.h
> @@ -85,6 +85,11 @@
>  			   ARM_SMCCC_SMC_32,				\
>  			   0, 2)
>  
> +#define ARM_SMCCC_ARCH_FEATURE_AVAILABILITY_ID				\
> +	ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL,				\
> +			   ARM_SMCCC_SMC_32,				\
> +			   0, 3)
> +
>  #define ARM_SMCCC_ARCH_WORKAROUND_1					\
>  	ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL,				\
>  			   ARM_SMCCC_SMC_32,				\
> 

Unused hunk

Konrad

