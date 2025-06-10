Return-Path: <linux-arm-msm+bounces-60793-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 774B6AD38DE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 15:22:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4481C16538A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 13:17:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0506296161;
	Tue, 10 Jun 2025 13:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ijXudvW+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AB7E28ECFC
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 13:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749561350; cv=none; b=NPEpOwcSIRj0D1iXW5xvetIINZXmY54AZY9X5hKJuQFHztIolTK2wP35X7UIZU9N5Ff1N27r1oqPDZwo4d0HkzS4fHksDkwIq8EuLgpXFzgAkLGZt6X4SbuA6vvSK1zfq3L1KafKIFnNi5xtCXpxgjgmLMgzxAvNN5X9NQPOKW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749561350; c=relaxed/simple;
	bh=5KHtsypxTOEwH2hoppvEko6q+MsIdk4Z+d5NAh05LDI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JESnGDAJTlU4yaj33+scuYjyGgSyxWklhoIagABubkmeq0liXhrWQut9KI2jxwey8bt7E+m0FZ7cH9jpdkn55341O1nEGPojbrXStKRgnd3bCXRjIQqvhMeDd+ane4EsiTuYyHo1zAUzR6o+Ci7kOgCLINAipqIi1L6BSPXXzWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ijXudvW+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55A9Nw58032285
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 13:15:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EwAmNEgz2U5R+Js4hjnEnVcfF/36zo6RLHZeqTJsg0s=; b=ijXudvW+2QCLsfen
	AvCbBi9I3LSakxmN0oAsNGHvKAGVW4Mg/6zczjaVLxk64Xdc3TyE6+DaEkCzUqSy
	Qxh8xhAbg+Xxx+6WkKkR+7MdWTJKxpp80fp9J4eJp8K3O9sVulnnNQ0MdHyuZa7f
	b1ZuD7t7BriHB2U25cWUblM6kbMrT/Y31FxGkiBcRo9/PVm1kMeI9MbgAcAHikCs
	0JFekTXbYZKXxCwGrdYWoxq/fprh7c1KqtIAJoRMCWNnynHFuQuGa08mrS9inTtH
	14l1CKq+edM3PLL5IM07eS8Zf5WGtOZ0ghVvbU05ekFqR38s8jx39P8XE/SPeibo
	wbT85g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474ekps8cw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 13:15:48 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d09b74dc4bso94533185a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 06:15:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749561347; x=1750166147;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EwAmNEgz2U5R+Js4hjnEnVcfF/36zo6RLHZeqTJsg0s=;
        b=JTueY5xO+hPxL+0pI0OgvIy90gaQQPyeT7ZSAUucNyo9gnW2WVwzChQPFDwoFG9N06
         Sm0YwTjhchucovmoRIiunrkTK5tL9fkBWuadFSCz6ZAuPbOktY461OiPJLJ26iLCcdUx
         h8KqKawtKHBJw1TUD2tvzcLFbNS+FrzYcC4pnc8whbgALo/Q3z7TcJr7e8daWKB1fAFr
         Q9lFk2l/8iZ20qzHP8o4lFFvfBjnKk5Y218/AdrkxMWHv/ZMrV6RpB71zJJGv4Ea1Bc5
         ZlRfpmTDN/DXzlQxXQeaD50sXDuUR0qNxKgcz4CvGguyxmZgJSBBPjNxDh+mtP7ZlyIG
         dahA==
X-Forwarded-Encrypted: i=1; AJvYcCWW01hYl1hlPqrK6j6iH93QOyhRl/CvcucyjHHbeU2it91NrG8BqhBkHOnrVHTvJmtPvKAA4TLTZrNT43KO@vger.kernel.org
X-Gm-Message-State: AOJu0YytBFybtpkaY9dFlhFxEBwYVAr4kmYa67aHxPLij69uHVmrCRHi
	gLqzFa+LT3qmGLjDJwOCLpHKBlpDCtnhewGMUsEDzQG0W3BTzQBCPso6jF8xdsL7uEOSQDiOO5L
	0DAzqoYgdB6ehtiLC9YNB6HIMtz+zL7Zcfs15O0ORrxrq9ncIFFM1OjD89Dm/EjqEarEM
X-Gm-Gg: ASbGncvCq6K2xln8C3zjGwvmVKOFhTEdNEXKa3nXWG6/NH/CGeCDo1ZBpIKMcFCaZyW
	QL4vYo9lehp4UY6lSLAZC3EuLGbny0CfOzwwauiLg8FEQ6/xSCJyM8SQjZBzgitpAyHIUJfppNO
	A8d/bIxeexZz983/cBAmb89oms2zAlkUmxbG3EvFR2UNDXFUHn+jt6bDuRiVDOKAvBwEOhWlyOL
	BM4lTo6rZVLWK3Ox1q9xQ0OSbUfjWy7P2iaogqtjDVsUPWoykN3Xqz8wUAjS7mfjqrZkKEFMMJj
	6R2Vyen0gwbOCczC4UCLAqD01O6+OIrSnA4ysvz2oRjR2hoEqsyDKgsC98ZFU01Lmjs+IrpLYtO
	+
X-Received: by 2002:a05:620a:288d:b0:7ca:d396:1460 with SMTP id af79cd13be357-7d33df39118mr853769785a.14.1749561346905;
        Tue, 10 Jun 2025 06:15:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHtqxF7J4fX5ZWQs38R17ip9jUcljtcIHttrdjrmoxx/VmubjbCQ1iXaj4T2zV2SHyjyVpQ1w==
X-Received: by 2002:a05:620a:288d:b0:7ca:d396:1460 with SMTP id af79cd13be357-7d33df39118mr853767185a.14.1749561346394;
        Tue, 10 Jun 2025 06:15:46 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-607783dd48esm6072351a12.56.2025.06.10.06.15.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 06:15:45 -0700 (PDT)
Message-ID: <56eccdb0-c877-431d-9833-16254afa1a0c@oss.qualcomm.com>
Date: Tue, 10 Jun 2025 15:15:43 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] arm64: qcom: sc7280: Move phy, perst to root port
 node
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Rob Herring
 <robh@kernel.org>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Krzysztof Kozlowski
 <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_vbadigan@quicinc.com,
        quic_mrana@quicinc.com
References: <20250419-perst-v3-0-1afec3c4ea62@oss.qualcomm.com>
 <20250419-perst-v3-3-1afec3c4ea62@oss.qualcomm.com>
 <20250423153747.GA563929-robh@kernel.org>
 <2ce28fb9-1184-4503-8f16-878d1fcb94cd@oss.qualcomm.com>
 <ba107a41-5520-47fa-9943-6e33946f50b1@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <ba107a41-5520-47fa-9943-6e33946f50b1@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=JcO8rVKV c=1 sm=1 tr=0 ts=68483004 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=IJG2AnB_qZu2HhMjgm4A:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDEwNCBTYWx0ZWRfX7sqyct8sZ0ED
 v2LuoV7tZyChSZUGibNdHR81Ow3dBt8aczglf8FXmTi1e5dL2lnQ/9RCT81V4Ys/BvrbOGn3hov
 A/1vhQhb+6lNuMlEG1qvz0wSOdyEx4XZ3p2Z20ID0nZubn3k2tVRwYzhwPBaydD8dTSRsQEe+cz
 cQKnv4/veDMgR7UnOSdMSAfYW9QZxj6Q8026eAH0UKaoBGaifcEZC3EjqM/pQMsEUiM2u2K+eFP
 rMs6RZ3owabeE4jKMrDG09Faoq7j2hVFa0FGVIc7Ecn8BJt4VxTeiBwtY2U/9QRjCj7XS4+zwJB
 ZH3y+wyh0pvntyWVvflnSiLNvyGVRZ/I0T3ARdqu58amD75KYLcTk34dyFMYl+7+3vmYG0vBp63
 UefdCE8ckPxS9Ldpy6GBm5K41bdmqnta+6StfW6BBUHMVNp0yM3aA+cdVL/LFKMElZcm5Q1r
X-Proofpoint-GUID: R9wtmfJwuWTj8EcipLU6GF-6mAJFuzN9
X-Proofpoint-ORIG-GUID: R9wtmfJwuWTj8EcipLU6GF-6mAJFuzN9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_05,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 mlxscore=0 adultscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506100104

On 6/2/25 3:01 PM, Krzysztof Kozlowski wrote:
> On 08/05/2025 16:26, Konrad Dybcio wrote:
>> On 4/23/25 5:37 PM, Rob Herring wrote:
>>> On Sat, Apr 19, 2025 at 10:49:26AM +0530, Krishna Chaitanya Chundru wrote:
>>>> There are many places we agreed to move the wake and perst gpio's
>>>> and phy etc to the pcie root port node instead of bridge node[1].
>>>>
>>>> So move the phy, phy-names, wake-gpio's in the root port.
>>>> There is already reset-gpio defined for PERST# in pci-bus-common.yaml,
>>>> start using that property instead of perst-gpio.
>>>
>>> Moving the properties will break existing kernels. If that doesn't 
>>> matter for these platforms, say so in the commit msg.
>>
>> I don't think we generally guarantee *forward* dt compatibility though, no?
> We do not guarantee, comment was not about this, but we expect. This DTS
> is supposed and is used by other projects. There was entire complain
> last DT BoF about kernel breaking DTS users all the time.

Yeah I get it.. we're in a constant cycle of adding new components and
later coming to the conclusion that whoever came up with the initial
binding had no clue what they're doing..

That said, "absens carens".. if users or developers of other projects
don't speak up on LKML (which serves as the de facto public square for
DT development), we don't get any feedback to take into account when
making potentially breaking changes (that may have a good reason behind
them). We get a patch from OpenBSD people every now and then, but it's
a drop in the ocean.

Konrad

