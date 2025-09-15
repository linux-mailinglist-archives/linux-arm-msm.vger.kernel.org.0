Return-Path: <linux-arm-msm+bounces-73592-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 56395B57DB9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 15:45:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 884A43A40B4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 13:44:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C36F9321F3A;
	Mon, 15 Sep 2025 13:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YweElsmi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12497321F3F
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 13:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757943771; cv=none; b=QCup0skNoXuPiuJpV9dTJgIObAcWNei0uWshr8G8eOQ9iwr0k/BqgM4yu/EMQQJHg1SZxyTJHiY8yLIUGdI4Ptk0AGw0oB3OlfmCKl7AqpiCrP8qIwhPOrIZDqE1kEpUxIJpyeEFANKsgbjeWIT2K6U+4eSQD68zqDpUAEgaeLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757943771; c=relaxed/simple;
	bh=M5RHgPucAavaK9i2L+zRCxXrGX3r4X2NxswK9RXwFek=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IbARsrNkafe/s8kfqBcbY8ch4QvAc8884qvcrk+XrZ41DMkBzc+iYwhk5CHhYwzWIVysYwtRELxICNOKqID1K7XcpViaHaKZ8kytiPuri+ZRlFSG3XOBaio7Jacxav1U6c+YsGEcEw9p2jSgMFeoEtzE+2ipBOC/ezj1Fm0KPrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YweElsmi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58F8FlXC027268
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 13:42:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4/3kWKrV7ZPI5tWosvI/mMuCkZRCGDU56/gZl94qUbk=; b=YweElsmiqvOCE4Ni
	nqZ4oW6FGkm4nsI2jNh9icg8U6Qc/VZY/dcRplP1q/5YUuKPsOjZWc8JhC2miLFW
	U6WGDUjbVkISHnlVP1p1p1BsLtCl3zq5TnE5lVqHUphviFxspWixYItDpbK8cMZN
	e3nSrQIpQohZwUcJdKbukM1YozRq1i0BiAkAq/U+ap0IKTvEdGOfYu4n18GchX8G
	fGuL6Y2hS2I+WHE2Ps/I4HNxlGCnNH+9Zkp48jC26G278M3DDFO8gNkA7HR3FkMX
	O2JH360P6sTCK3oYRFeZv2IPB5i+tzy+FrssYuuNLpebW8rTi8psec81UdPky4A7
	kTz7rA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 495072n4x5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 13:42:48 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-70dca587837so12873476d6.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 06:42:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757943768; x=1758548568;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4/3kWKrV7ZPI5tWosvI/mMuCkZRCGDU56/gZl94qUbk=;
        b=CoH/W2WhZXNRprpN1vm6HJua48yyXkr/1RypqTI7Uptp2dxNYEaYbL82VCus+ARqmI
         EbGZI2Ew6xmhgWJPLNvetGjc1UX6O6iYxX395lAlEca8LnLIl621WSGdLsiw+kUyJG6H
         2DCUhlK0LUoCtoBNScQBAvEbv6pCEsoSNEPXhKbRLMR8TEiVSKyK6vgcoOnj47JCoikg
         p0SNv8FnfeHXM3+HYuSDwUkniP2ex0jqJPyq0SK/mwrj1/hJcyZOlb6IkpQuPKe7aQfS
         DLqoDkqVG9BbDjjhuKJOhtLT0F0s2SSlwDbQ/MNYNm/t3iFI9+1o8CZFpjxyo9vjQkny
         RMxA==
X-Forwarded-Encrypted: i=1; AJvYcCUDsrOYzLPhix0UxwLXl9lh3h/hbuzP/nUFQIj6ZmxhDS/eL4FQLevB/vINV/Q2CcybFYCPBETHyHKDEXOc@vger.kernel.org
X-Gm-Message-State: AOJu0YwMONl6KBj8N/z4G5U5yrAqdcbTkeHUo9oPGllK2i+mE60zibpM
	59FOhQKFGYW0NhUv1Oh/t62h3KpAstIzjs6WshqCf0TpPrqZGN9tFAgDUeLwBlUbJdI1IFnc4ex
	xSAQV3XjchADOVkjR4fwLqVdx0YKKWhqZbOyT3/qxIMzBUv+2Y8StfukNwKH44RWmbvGw
X-Gm-Gg: ASbGncugdFs2PYdSwdA/1cS1z7CWBYbxMR8F2w8nLbVSwkglehbVX5T53YvSxhdpJ9g
	MkALO2Mk/UW3Z6uWs3j9dis1lNJu3A8YtWscO6VfLDngwqSGktRJ1rikgNOgC7uoAYonUZKNsAr
	DDzRJYUHtI0Jvv9G0c5LowQQ3jzTuP+2fXtme+kqzGXIINDToIJDRcMqkdBRXQpdBxsYLKyWR49
	F/CatqoyTxwhK61Ng7NqJn0XplCElZSQXJmq13iZYWsnp6z/xUJgjxdZoCsDLPfckVUkSHVwowG
	JvzeEns9+gaJVpeEkosMjqZyO+Yr+Oe/8xirWhlwILHtiJgg+usNlte2tmbRVEAOv8xlNG5UPqP
	Uph9pst+AexrxK4A3LhW95A==
X-Received: by 2002:ac8:5953:0:b0:4b5:f4c0:60b with SMTP id d75a77b69052e-4b77d087e8dmr103184471cf.11.1757943767851;
        Mon, 15 Sep 2025 06:42:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGGqsH+rP410sg5iFE/J6ASYV/Uui6s8GeSdgdfcTItelaC5HbIEhMT5aYL8jp5pYysXYPv6A==
X-Received: by 2002:ac8:5953:0:b0:4b5:f4c0:60b with SMTP id d75a77b69052e-4b77d087e8dmr103184061cf.11.1757943767274;
        Mon, 15 Sep 2025 06:42:47 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07b32ddf93sm940209866b.69.2025.09.15.06.42.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Sep 2025 06:42:46 -0700 (PDT)
Message-ID: <d10424b3-b70f-4166-adca-f81fcb214e04@oss.qualcomm.com>
Date: Mon, 15 Sep 2025 15:42:45 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: qcom: msm8939: Add missing MDSS reset
To: Stephan Gerhold <stephan.gerhold@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Vincent Knecht <vincent.knecht@mailoo.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250915-msm8916-resets-v1-0-a5c705df0c45@linaro.org>
 <20250915-msm8916-resets-v1-2-a5c705df0c45@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250915-msm8916-resets-v1-2-a5c705df0c45@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAyNSBTYWx0ZWRfX8bTXL6xkNntn
 IuwHLRKIK4ODEAQ9nMIsNOhSCeIoNhqoxB096hyvlGJ5vSI0soETOpjkFnvoACLo7Cx4Jq77ReI
 ZC3iZT3F07p6CTMY09g82PorgMWQB5yltKmNy/xtf+qHZcAzYinUvxe4ImsFPUr3W+D1aoIFMmG
 GB+aZbtLu2Qf8cIktgGBxo3VAp8UY3DUs50hmxs5Qp4/9vIdN2H7xp1GDgqu4tOoHxjs6AXllBs
 n12slTi2A38Wmhi0O9N/HGIvCGeFVVlGd0h67rKlwd+QjTFnNJsK20C+UX8GfuieGYL10E7TALd
 W/OLYv4W5ytMo6qdssLitDVMdv/avFYChztmc1ARpaUjdvhvLIA9+QtW7I3VGA/wK+M0qiGuo3R
 c5vZtfrP
X-Proofpoint-GUID: W0ibMY5CfxH2lZqrW5UCQMdWfmRzHDvs
X-Authority-Analysis: v=2.4 cv=WcsMa1hX c=1 sm=1 tr=0 ts=68c817d8 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=M_eXORl3-W3UjsCHqzwA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: W0ibMY5CfxH2lZqrW5UCQMdWfmRzHDvs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-15_05,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 bulkscore=0 spamscore=0
 suspectscore=0 phishscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509130025

On 9/15/25 3:28 PM, Stephan Gerhold wrote:
> On most MSM8939 devices, the bootloader already initializes the display to
> show the boot splash screen. In this situation, MDSS is already configured
> and left running when starting Linux. To avoid side effects from the
> bootloader configuration, the MDSS reset can be specified in the device
> tree to start again with a clean hardware state.
> 
> The reset for MDSS is currently missing in msm8939.dtsi, which causes
> errors when the MDSS driver tries to re-initialize the registers:
> 
>  dsi_err_worker: status=6
>  dsi_err_worker: status=6
>  dsi_err_worker: status=6
>  ...
> 
> It turns out that we have always indirectly worked around this by building
> the MDSS driver as a module. Before v6.17, the power domain was temporarily
> turned off until the module was loaded, long enough to clear the register
> contents. In v6.17, power domains are not turned off during boot until
> sync_state() happens, so this is no longer working. Even before v6.17 this
> resulted in broken behavior, but notably only when the MDSS driver was
> built-in instead of a module.
> 
> Cc: stable@vger.kernel.org
> Fixes: 61550c6c156c ("arm64: dts: qcom: Add msm8939 SoC")
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

