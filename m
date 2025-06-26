Return-Path: <linux-arm-msm+bounces-62685-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A7AEAEA5EE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jun 2025 20:57:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2AB817A93E0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jun 2025 18:56:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D0232EF280;
	Thu, 26 Jun 2025 18:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FOxRYxaV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B80792EF2B1
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jun 2025 18:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750964266; cv=none; b=aYKk4eeM1PVZRpOFu1LZpuMIX3LL3RPNh9w2AiZpCkyECFHfZJ3KJ7MXqN72IMLzqS1TJSxEVOr8ve8uI3grlTRvDKJtV2alILCq3lklubGOJZgels34lFoZ1yRbsJtg8DAR3OCcyqyvGKal2pK0pNu3/y+Go2dW2LNbbvXVu6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750964266; c=relaxed/simple;
	bh=NmfIm68YAjRG5h/tBl/EbY/PKiuMXgho6lidL4bzV7g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A5j3RHZ41ObU1prP7VjTHt90uls8QzJcKMJDjI9WMqM7gDZFp+Dn66qOCzfanzIpds9Dkalc/dbtP3U9tnNr72V8G04OnxbH777f39uTXPrY0t26nXzhSnMIafDJJBHiCFW4b8Pz/O5n8nHMsUp0QMjFOqHuDG7jqCqgh+kykh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FOxRYxaV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55QHIOdY002567
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jun 2025 18:57:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eWmnujwbUhTih84Oz0jMHvC/5s9gmiUhuj03SRFr5GU=; b=FOxRYxaVMVkZ0l2T
	/jOmd7WK1LNJyUKi9XG1Rw4aeSXCtfPN4tjvzsZidUcBflq1oEmXCFfdO9OTd5hd
	FRkyrDDhM6khXt6UO4vL/ww5f3jAuWJc5dS/425AHQ6BcerqBcjUkL4yB9mJfHYx
	cbUK2wuAiyhHA9Zbd7BBnYlvKQ61o87OY2apBceNgfbO2xW0CU6sUjrz97XQ2fX6
	Q2hQaqtvVJvNlEOSZ61j8j3vGLmYPpvB445WUWsXpn6dRb7Vy9ITkyVDOpJCHQer
	l+HvPtAyVVV+j5sy5xDlnGoHEMcuijJs90XSTCieGAK34tUs15pRlyo80GpyOsb1
	/hkHIw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47emcmx3v5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jun 2025 18:57:43 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d097083cc3so29622585a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jun 2025 11:57:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750964262; x=1751569062;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eWmnujwbUhTih84Oz0jMHvC/5s9gmiUhuj03SRFr5GU=;
        b=VTj3FBzO9DmoBs69vtp4pZ7urTOQwRNy9xHlnOmSyZWMTL9h+ORvehabF7LSVfqvy4
         Tkv8TJFR3iAa/kqIlKf+7L2qpAU1Fh8fzIYTttbiWDTV0zEVjihEfYaK71E5T7Rp0Eg/
         h6qv+aDtXJy0Cqm/nMyg6Ulmj889efjTWIkRt5CCuD7al4e5yvS+z364WKIWAOfJ1DP6
         80irE3vJ7jvt5iEzxyNqRh5Y01jegutmcrNfykSong0TgNKtz8YTSajcRUrbt9cWm2eU
         xv2Zjb8uymH4xdEc0K5Rb2qHCsdu3YwQkoAq+IwrZg3DdH8HDF97Yjh5FDscQwuiUZmh
         Bhfg==
X-Gm-Message-State: AOJu0YwjWCEOy8k4t2lh2pX9b9vaJBJbSCPXavB4kxWhDc7YxrcTNV/y
	eqXNDzB8NMp1kC3MsZKPhrAwuMF3xLrdP8WLuIRDzZs6AUIg10gaRGKS7ZQq7NbNWLp3yh8xhmV
	0URi/ycM56uPg9s3TmY2tmQjflTpYpgtUErOn7OYeAjTWM/aFYf7FU94lxvfZK34ahpyx
X-Gm-Gg: ASbGncv1dSXmYFwQXuAZ9a4xOVq6gUZ2MnpxFG/iGRX7JJRuly4nGp0FGcYeWjuA9ud
	Cva5D4JZW03wUR4QrDL9OuABI+zC/qGj0B6/4UHdnwLIKJ3uS4tpjC0yMpTBAEjE1BDC2t2kVdD
	x4/oxLV/rBwXSIlnIZDZi3yrPw38SL7Z+OCZx7hDrbzyXWQb2OUKz7F7vBEYRRQuRBm4WPO93qw
	bHsaSJUIv5GP6mqFGNg7zWViwWkNGy1O43WRXBPDn1sus/wMl0mPlpR3Lkrb0Ji6A3PthssnHMF
	oRrnDQw0Ft92Epy60CzJNSV2doQEUKC32V6JMsMd0jXtFOyGYz6g/cvRUcwbEvwmOlnrxs2WoDD
	eKlQ=
X-Received: by 2002:a05:620a:4054:b0:7ce:b3e2:3831 with SMTP id af79cd13be357-7d4438b4919mr31483985a.0.1750964262262;
        Thu, 26 Jun 2025 11:57:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGB30m5okVDJkeHnl5v0UU4V0XZkupcfsesSXQvHm/Aburs6vHWv5o0kDF78CMWJgBL4eZQXg==
X-Received: by 2002:a05:620a:4054:b0:7ce:b3e2:3831 with SMTP id af79cd13be357-7d4438b4919mr31482785a.0.1750964261619;
        Thu, 26 Jun 2025 11:57:41 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae2143d8efesm39531766b.103.2025.06.26.11.57.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jun 2025 11:57:40 -0700 (PDT)
Message-ID: <599fcbc7-23a3-41f5-8868-dd168fb8ecc0@oss.qualcomm.com>
Date: Thu, 26 Jun 2025 20:57:38 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: ipq5424: Describe the 4-wire UART SE
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>,
        Viken Dadhaniya <quic_vdadhani@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250624-ipq5424_hsuart-v2-1-6566dabfe4a6@oss.qualcomm.com>
 <bdf7e3e4-f1d1-4f3f-aebe-ded7b8091884@oss.qualcomm.com>
 <3514a3af-ab7d-41e6-9e59-95defe9105b4@oss.qualcomm.com>
 <da6daf53-11de-4ca1-892d-73754adb435f@oss.qualcomm.com>
 <5925b608-1251-4b73-b310-948b383f7b7b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <5925b608-1251-4b73-b310-948b383f7b7b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 5RAPn83q_vOFsqqcIafJjTKd4Gz8GidV
X-Proofpoint-ORIG-GUID: 5RAPn83q_vOFsqqcIafJjTKd4Gz8GidV
X-Authority-Analysis: v=2.4 cv=J+eq7BnS c=1 sm=1 tr=0 ts=685d9827 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=UEcVYaNH1ZSnb6mATNIA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI2MDE2MSBTYWx0ZWRfX6VfTknx3aa8W
 przIC0p6CNVFXwsfYYPkxaFz+8bHM14SRBEt/RoGOc/SbBfDXNc9Ar+Y371uS6/LCqWOmaCVqAh
 s28Kp7mxIN552ZGoZpn0sMWLcCpFtfPA4OuuUM8mf3iMGQ4gKjNzmEq9kUkF1zRTTBlCuPaSkBn
 HrgzoedoB01KVkxjDWzUhJi3yjAUlTkL4KxhtkEGelqJKOSkS7SK8KyFIuzXdH8GruDszxAMMRi
 ups3OQPqAx2AYMLbdr7haj9qZiV6DEJYePh4jePZwCx580KJLmVc59ja4LpmZZh2OKCh0PShpxf
 JTslOB2AOmyfZOgn5007RLFWf9ydIWg98TScIHwFyT4M0EG1+pjdKSTbo8CDs9XZ5MNuJ2tkagq
 XRCycApXGFGzvRpeiqJx1WmkFXrIExuZpjmCnDh3s337/zUFHzVC/F6lwfs4J5rM6N4Zsl+U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_06,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxlogscore=666 adultscore=0 impostorscore=0 clxscore=1015
 spamscore=0 malwarescore=0 phishscore=0 priorityscore=1501 suspectscore=0
 mlxscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506260161

On 6/26/25 7:16 AM, Kathiravan Thirumoorthy wrote:
> 
> On 6/25/2025 5:44 PM, Konrad Dybcio wrote:
>> On 6/25/25 7:55 AM, Kathiravan Thirumoorthy wrote:
>>> On 6/24/2025 8:08 PM, Konrad Dybcio wrote:
>>>> On 6/24/25 11:00 AM, Kathiravan Thirumoorthy wrote:
>>>>> QUPv3 in IPQ5424 consists of six Serial Engines (SEs). Describe the
>>>>> first SE, which supports a 4-wire UART configuration suitable for
>>>>> applications such as HS-UART.
>>>>>
>>>>> Note that the required initialization for this SE is not handled by the
>>>>> bootloader. Therefore, add the SE node in the device tree but keep it
>>>>> disabled. Enable it once Linux gains support for configuring the SE,
>>>>> allowing to use in relevant RDPs.
>>>> Do you mean fw loading support?
>>> SE0 is minicore, so we don't need to load the FW. But apart from FW , protocol specific configurations to be done in the SE's Image Configuration registers, which is taken care in the patch[1]
>>>
>>> [1] [PATCH v5 0/5] Add support to load QUP SE firmware from <https://lore.kernel.org/linux-arm-msm/20250624095102.1587580-1-viken.dadhaniya@oss.qualcomm.com/T/#m37a6b739c66040cde5b6b0121a03da7ea6715842>
>> I've heard the 'minicore' or similar name before.. how does it differ
>> from a "normal" SE? (+Mukesh & Viken)
> 
> There are 2 types of SE. One is Minicore and another one is FW based.
> 
> Minicore SE supports only I2C / SPI / UART protocols and it is fixed in RTL. Depends on the protocol needed, we need to configure the "Image Configuration registers".
> 
> FW based SE supports wide variety of protocols like I3C, CAN and so on. This can be achieved by the loading the protocol specific FW image and configuring the "Image Configuration registers".

Got it, thank you

Konrad

