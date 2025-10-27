Return-Path: <linux-arm-msm+bounces-78838-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 51AA6C0B94F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 02:14:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 85B82188E14C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 01:14:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 000E01D79BE;
	Mon, 27 Oct 2025 01:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DNGRK1ck"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FF5C239573
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 01:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761527670; cv=none; b=i2saaexFR5ztd+VvceSfLHdUZHdOozJuyVP7fIoymmaxmhxRoenKr/aDbKPAhM9kSIMmBFU77SSjXeshsJvyg6bevXAAL7atdAnPk8/IK963hSBc7+kAH9acGauWLHKvub0slX0arpEMFFOGQrPIgq3MejEMPZnjpeEvZVwbpmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761527670; c=relaxed/simple;
	bh=26Zr1IfDLM2HwHhlkPk74AD4l/itxa9AB7lNv8cLE24=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=W4IVCzgfcWPwQy52P3WC2qT/VgnO1laPA50H/Pch6nMJC0+h/IUvnpXw5JJmZUtI0CH9RN7F1jTq5gklFCgRJENT777njtSY0NnSCn13OloAlBhsoNe+K+eXqEVqqGjrOKrEYsgUyE3ADd3ewdLs0uYPyt6dQc1DHeTMxlyFGm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DNGRK1ck; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59QLeprj826421
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 01:14:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/6bjhQSOqx9D1Tl5pyAATW/nu6ENMdIgZuft4+Kzf6g=; b=DNGRK1ckf+y+TIL5
	vsUrDh8XWa45d+I4LKXOE8NcC4Y4t9tbHiRXX24RlWBdqva7/bvvLkSnUSECVmJx
	lOR2rCLeZi3WxxX2DcKOTfdRRTQWS30NYNpCq58Ud2E5hU4238je2e0FmK1hpW1Y
	bIKiYWJnWFphbh7NxgAtH/4sWpEZgf+5yC392KGi237aFcY3pl2Hb9X/rmjHBS+j
	6zt6RD586fFrX4qWqb3uA6yKNXWib6S/UndXImA330Pgcc42izLC7p4kZRXHmQQZ
	Jx9mpXsLWR4TFF2HwW3mKeXTgredgX84Fg+WLZxfGFecaA2o3P5zDdQnS02LQU33
	3LVtmw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a0p4watg1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 01:14:28 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7a27ab05999so2461839b3a.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 Oct 2025 18:14:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761527667; x=1762132467;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/6bjhQSOqx9D1Tl5pyAATW/nu6ENMdIgZuft4+Kzf6g=;
        b=daKVVl60JBE58X9+UdaoKMbo+VujinmmPy1C7jeFiYTL0IS4FHObty4GoLZFuMhP/S
         /NBkSIK/rEckrjck1i8QMROCxD402z5+84oGwTF9OIG+CPPInXU7HZESpq7I0vN/Fa+Q
         8PmdTt1L8LFd+hPv1b54w+U9j9G6JQeXUuLhRm1VG+npx12RFxMAd/RNurP9Ib7/esj1
         iryH+NIH61mxLLUjp85q6VKejm4dEdop2S3iN4OzwexyTuDwerR0H7B14dFR9aFJBzsh
         sFImnZ55V0pWF2JQm4RnQ2SxukQjBb3uE0DPNOXOmNmwjedgo8JyWeBTV/Wokbbu0ZH9
         +ZSA==
X-Forwarded-Encrypted: i=1; AJvYcCVytTDyNZzhP7yZqgi0j4HH1RTkk6I/4yTP6g8garJUbRdWoHOpsvs+pwWRThej2kRWLwZR1YImgt6WExCH@vger.kernel.org
X-Gm-Message-State: AOJu0YzlGkuX9Yvg3iKC2NWrsMlLnsh2aScABvSgRitmYOsH3sXNiAGN
	VU5vSZ560WTXRYp1YsGA5nYYSbx9/GuylRahXqAtEC0JVScWWsLjBLegGfPrT6fITrEcAlas6Md
	y9gNhcxPDGzeMPOiNUMBka76FJAqF2q7ZLXvM18AqweTWVqEQr2W0bzFnKmgSfIqO9kvZ
X-Gm-Gg: ASbGncsQPPnDHFB2/jHDsiQQb8hzvmu3f0C3p+0uV7sik2cnNT4UkRRefH6T+zy/dHr
	AyT4K4PYtUSpUGKYKCZn636b99cE2McNwIUDyQqT5cufVsB0weCySDAqXEluUAVugqAZh7zhyeu
	9syWEdgMjFkcVxBm3JfOrADDDoqReCtRrEtMZ5kICPq9Hqo2LN3e3Il0qdDTpiZDMNQRkfFlqAU
	3l39RetA41JC5VghqprJFB8Z1KJawbavfo27tN3DV/AUpbBey5jI+b43OW6y1N+OJZIXGvKutz3
	FVj50aZ36AqipewP3lzfnk5yPAVu2bwtBNTDVtz+LWmooQwKetUO0X4pttAEoW7F5ZPiHLsjNCa
	ziu8dY5RvORfNWpc7oDEZTTOJKCQDsSdYXPgEgkqDxUSXrORzD1re82WHTH4p1upF
X-Received: by 2002:a05:6a00:4fce:b0:7a2:7da6:bc02 with SMTP id d2e1a72fcca58-7a27da6beaamr13311901b3a.21.1761527667144;
        Sun, 26 Oct 2025 18:14:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF32JqcgNw2EBOJY022swQQnuYAkI1zM/sffyqHmGk+kPX4EtGMw7pwfLHomvFqdSoHf7H4Kg==
X-Received: by 2002:a05:6a00:4fce:b0:7a2:7da6:bc02 with SMTP id d2e1a72fcca58-7a27da6beaamr13311872b3a.21.1761527666633;
        Sun, 26 Oct 2025 18:14:26 -0700 (PDT)
Received: from [10.133.33.212] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a414072492sm6066360b3a.53.2025.10.26.18.14.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Oct 2025 18:14:26 -0700 (PDT)
Message-ID: <b5762a05-8b63-4354-925e-fa3c8296e19f@oss.qualcomm.com>
Date: Mon, 27 Oct 2025 09:14:22 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] add sysfs nodes to configure TPDA's registers
From: Jie Gan <jie.gan@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20250827105545.7140-1-jie.gan@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250827105545.7140-1-jie.gan@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ah4iOU8Q1yo65vK_R25tbtw1qcNB72E_
X-Proofpoint-GUID: ah4iOU8Q1yo65vK_R25tbtw1qcNB72E_
X-Authority-Analysis: v=2.4 cv=NobcssdJ c=1 sm=1 tr=0 ts=68fec774 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=wn2eFai33wK1SlCS9xkA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI3MDAwOSBTYWx0ZWRfX7/BqJBSkBi3z
 dCY3I6oqayKbxcncjkVeWLm8Rv4r7B8HkjA7QtOrjtFN5zDqRQaJmYS1svA0XGZXJx13VccnSio
 1NeZTOFy+gRBybvWpx3W7VoEbOqeJuWA8quODdir/ptL+5U6i0k9FHAN0igl+qTO3l/vXmiF9FO
 fjSGZARsuVmkCAvAF2Ze++/zrYn0qOQoX4ejtPOopgKvmsE83+OshbWyXrim+bjYrTHowVnSxWE
 8+i7HzU729UUw6zo8Nea618UMr45gugw48uOuaXAj5dQp5rs8BdPBcoUGqkrlwysWSAHuxmfDFi
 MGwSaGJIJsw0hWxzs7rTg7dsLMl8K68dA6kEeLzBwNU1wpP9nmvyQgVrSsNpnQxAUQwXmj9RvBj
 06DcQsn6ozRMtEp20cIBJSkzVTjcLg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-27_01,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 phishscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510270009



On 8/27/2025 6:55 PM, Jie Gan wrote:
> Patchset 1 introduces configuration of the cross-trigger registers with
> appropriate values to enable proper generation of cross-trigger packets.
> 
> Patchset 2 introduces a logic to configure the TPDA_SYNCR register,
> which determines the frequency of ASYNC packet generation. These packets
> assist userspace tools in accurately identifying each valid packet.
> 
> Patchset 3 introduces a sysfs node to initiate a flush request for the
> specific port, forcing the data to synchronize and be transmitted to the
> sink device.
> 

Gentle reminder.

Thanks,
Jie

> Changes in V3:
> 1. Optimizing codes according to James's comment.
> Link to V2 - https://lore.kernel.org/all/20250827042042.6786-1-jie.gan@oss.qualcomm.com/
> 
> Changes in V2:
> 1. Refactoring the code based on James's comment for optimization.
> Link to V1 - https://lore.kernel.org/all/20250826070150.5603-1-jie.gan@oss.qualcomm.com/
> 
> Tao Zhang (3):
>    coresight: tpda: add sysfs nodes for tpda cross-trigger configuration
>    coresight: tpda: add logic to configure TPDA_SYNCR register
>    coresight: tpda: add sysfs node to flush specific port
> 
>   .../testing/sysfs-bus-coresight-devices-tpda  |  50 ++++
>   drivers/hwtracing/coresight/coresight-tpda.c  | 278 ++++++++++++++++++
>   drivers/hwtracing/coresight/coresight-tpda.h  |  33 ++-
>   3 files changed, 360 insertions(+), 1 deletion(-)
>   create mode 100644 Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda
> 


