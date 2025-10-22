Return-Path: <linux-arm-msm+bounces-78351-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C455CBFCC06
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 17:04:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 954461A01655
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 15:03:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A8AB34D4F4;
	Wed, 22 Oct 2025 15:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZNHqvOYJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADAD934C986
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 15:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761145325; cv=none; b=S1Oo1aVBG3Js0xiKtsdz9g970nes6MaORzMhNvlMK/wTT55ZV7ZatMRBqLzeKJdTip8CPIqvkZL+8PX0/4ML4VLpgBM450R6PVjlMN8iuOXkN0XA5nCMFo4Lgwun/qs6DcrQGDeUGCJ2MdgkHH1HvBkqua/bLIWaCTWYMHlpo1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761145325; c=relaxed/simple;
	bh=AS6GTchDJiG/VSv415eyoTU4UvcWXjnpLTn/xX286zk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DqsSAtPKyPOoLMuhuGkM5kxOxC2cm9/gQ9H2027+KgPtOIPV2Wlf/2B214WSEZB4JJEfA+Je5SrxBHHslDJ6OARL5Ffxv6/ty9qHaggMAuULhRKBapIKJiJJbjdWcMH44M+LpDmm4+9CbAoT23B/tn5RMqSuqsSdkub3P0Z/+l4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZNHqvOYJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59M7Z6U6012419
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 15:02:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WVhUC5KfCy052S9d2cEakHXZ3DpmiRO1eWkjBgLlKao=; b=ZNHqvOYJ5BbO4Dbc
	Xtu+XaBVfr47/MXPRQCupdjpSjx62/yERh6mbpW2O8yd4yIaaWW8qWnMniDLruQK
	wK2m75UquT3XJ07ANajsdglGzqF8O/TZHOelLz3IouGK15T+JcSRqm/vo8eGVwYd
	PsksKp3F30DyhpZt9KbhYkXIiBcJ7ToJOJiLZm98X3C87q2f1bvKdMXiaNT1Iiq8
	aS67Fswl/uIIoiWN+ne4Fem1eYUOX3Njlt2VzrOvCu0kP7VOPmYA8tZwJkBLPYaR
	hxfSqhVw6yQ99FgVMmXn6vvUgiXQ4dKfnzQ4NplpIx9D4wdIfmg5ZLj16g2CF2uz
	sbaNWg==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49xhe0jwm1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 15:02:02 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-5db22173f9fso138062137.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 08:02:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761145322; x=1761750122;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WVhUC5KfCy052S9d2cEakHXZ3DpmiRO1eWkjBgLlKao=;
        b=PkG/U8MSvYtLNxEtXmwPrNX7csSFBN6wtBKRPRoW3eIVwc9dAIJaX2FlH+aWwzeqk5
         HqAX14B45vYWny+mSq6CtEfJHG4M/tMkEnn0KVsizk9PDhuVKGyCQjsnEy7dBa+YFhkM
         12LvkCMn6Fg0+69z9DbCR5Lp/tcZs/DpvuMfSXaXHWxxVqLLriqti0JFyW4osFeXNMx2
         EvPQN7INEU0Dy2pDB8vGZZvXCMnHPrpZrJNquBz2xiWm7HpZBVJNmvOJ+qTOQk74EyJY
         YL2Di87APZ7E8SXKEnOt2V6gVxCO7VaKLcodZQJRNC1E2g8CklYzSyQ70fSVJDcqPyUv
         CB2w==
X-Forwarded-Encrypted: i=1; AJvYcCX8zQ5mubLbLoLlkykcyJRWva6CnEXNCzq2nCFAYBR9dpi+fqweO3LztE5ltoOXLlydqltzXjYkvndVxkBy@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6tw/wDt+FwWE08kdAk5NYFNKFVg9tYkVoFRF+vdpj9EEe7/MO
	Puoj04lnF3BOCx5SAIsqdQAxkITh1AychaIf+JQ143qbTvJ8hT809aRr/VYeh1zSVbPiVlKZUOk
	iX94b0VrU7LWhOcHnaHVZF72o+lQrdw/dfslcYlICg807y8UYYtHNRslIp+D+JL8m4RCF
X-Gm-Gg: ASbGncvzyH99iqUoW9FFa63oMTvCGUrfaN7uvLeOaQlDKXLdNBJGwW6CGuhx9jw16oZ
	FMOWnpbQuex6QN0gWHnOY4hhy32hqbM1tMqKbe3w24ucHm5Oa83GcSkZTnkCnHTehvWuQfkWcFv
	dJiMPqL4qb2uq6vSmwM00H0fgPBUYzTiEcw95adgSF/HneIiKNL3D5UjqGSk3aFC2s64gCndXZd
	ao7440QHfeNf/H13JQ0ASUifXMSvQfABtmf/BHGdFiVqiVvZ9b4n6VYq6QwyxiG9yqV1QD7UeMu
	AGRkpKqVya5+bPaJ9VLjOqEM3QDb+2AHqc4sjbilI9ZL2touqj8B3K9eSPIl2NIUMqswzDZbYDS
	87ZbtHvbDnYUs4NRWh90nPyhBv3eGZbijPb1+1XC25PzYXUYXndkg+G/X
X-Received: by 2002:a05:6122:15a:b0:556:8b02:f82b with SMTP id 71dfb90a1353d-5568b02feffmr660218e0c.0.1761145319486;
        Wed, 22 Oct 2025 08:01:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGM5zhFY1onskFYnO+4Fv5ggq4wyPuFkBT13ek6QdXSAtiXahagt25PhXd78pcdYze/hqeLzg==
X-Received: by 2002:a05:6122:15a:b0:556:8b02:f82b with SMTP id 71dfb90a1353d-5568b02feffmr659951e0c.0.1761145316876;
        Wed, 22 Oct 2025 08:01:56 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65eb725f3fsm1354965566b.68.2025.10.22.08.01.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Oct 2025 08:01:55 -0700 (PDT)
Message-ID: <c56d48ad-425e-4e7e-9489-b3c926e4d617@oss.qualcomm.com>
Date: Wed, 22 Oct 2025 17:01:53 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/9] arm64: dts: qcom: ipq5332: Add QPIC SPI NAND
 controller support
To: Md Sadre Alam <quic_mdalam@quicinc.com>, broonie@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, vkoul@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dmaengine@vger.kernel.org
Cc: quic_varada@quicinc.com
References: <20251014110534.480518-1-quic_mdalam@quicinc.com>
 <20251014110534.480518-6-quic_mdalam@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251014110534.480518-6-quic_mdalam@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIxMDE2NyBTYWx0ZWRfX1RJYCyZ4kCaY
 nxqDeVhjs5hSw0CiZ7I1i/4MyADxZkDSNRrZOa8OEl1o8xShrVnWxK9S6E5nd0phAZpTZkcM0Oi
 jiOmVbxUipLwBIxfDstuRTwdTrCxt6gv97lVLD0rIf4RFu/bNIQG13CrnwZ+LfX5StqGGVirW3l
 6YsePUqqBZ/M44G+4+DZe01I6nj8Yi66KHN0DTq0z3bYgUVEtwy1mU2WBs3Z06Cb+HAbcygQHYv
 VrZCpMAhE5qSdrE/ypdBdL7S3u89qMvs7e/dBnaLy5a8rD0hrmE6dL6PT3PQspLCbJri2SHJnge
 WOl5jis4Oj/2aGsHOilYDnhEYYfihpoQbX0v9Hive4m1aBD4PNUi5R2lLX0g9meVYkJoLw8teqS
 d4MpxAIOhbLfkFtRB+YfAJMuMW1hhA==
X-Proofpoint-ORIG-GUID: Vkotn4SQqdBiRmj3hcJglLsvmUQFo0iH
X-Authority-Analysis: v=2.4 cv=WYUBqkhX c=1 sm=1 tr=0 ts=68f8f1ea cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=eg2IErnvy-Z71prtMQkA:9 a=QEXdDO2ut3YA:10
 a=zZCYzV9kfG8A:10 a=ODZdjJIeia2B_SHc_B0f:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: Vkotn4SQqdBiRmj3hcJglLsvmUQFo0iH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_06,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510210167

On 10/14/25 1:05 PM, Md Sadre Alam wrote:
> Add device tree nodes for QPIC SPI NAND flash controller support
> on IPQ5332 SoC.
> 
> The IPQ5332 SoC includes a QPIC controller that supports SPI NAND flash
> devices with hardware ECC capabilities and DMA support through BAM
> (Bus Access Manager).
> 
> Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

