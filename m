Return-Path: <linux-arm-msm+bounces-36946-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C96BC9BB6C9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Nov 2024 14:53:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 74A151F22093
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Nov 2024 13:53:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55E71139D13;
	Mon,  4 Nov 2024 13:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hfmE07B5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E412B139D04
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 Nov 2024 13:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730728374; cv=none; b=NdDvVN+Wm124mSFUFAe0Ok6id+hZOfh10c0qEbdrS/KGIyRidhSQ3PcQOOaPV14Fwn6TGX75+zOL/YlXPh3FA0Ory8DyPVc2Bf7JoazrfKaPVHEw1qJeDoAHqxhwH+0FTZhNB5RaIPOQAgpW+vxS5ZgAJrzC+mQ/F6NQSyePiUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730728374; c=relaxed/simple;
	bh=+w0U36dAEMR+Tz6mLGB2q6Y7z8YJQMQ6qtiKhCbaP/8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DWUj9AYWgsbRa3CkLm7EmiGO4M4KJj9bQKOw6TKdW3d/mUpvA41h6iqGmlHd6cm6Rzz8txHIEvMh5nYw0FTxxuW+UUFaDiBLX5LjYy3FGBwZZFesjLMz+TfvF3W+bPqakNPQefD+j4Ag6YYiClE5u86bYYR0md73uYFAJMJ7wMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=fail smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hfmE07B5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A4BuS5A011100
	for <linux-arm-msm@vger.kernel.org>; Mon, 4 Nov 2024 13:52:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6Fc9RPWMyJisVrZOEDQeTPJ82OGC+aMZTuKQQ+ERKr0=; b=hfmE07B5Evvpzyra
	OJM/s2wsqCtXoWnoErsU2kS1WldMkzvW+P6/0AZib7MOVveGIqgJesXZnQ2yPfIO
	a6PFziJLLNEZSmlJc7RSu5nCBw8kWe7b8rrjr7O4wDG0eSf4Rmxvgg3tMAAdo2IJ
	tqpO58VYHR34FKzlJbN110BOP6jsX6Vpbnmc1kkpX9LJEzctShohLSyBoLl9v40g
	TCfqGB95ryVtC4Dw9TQkFrT1XZfPQcAXaJjoXhejPmDL4yfYgtViuZaZe+EXyl5v
	ppjAFw18YnCTHUkU+MWTJG4F29IRRM42uNBTCELNPnzweJSN3s+Dpdv66/qc2bca
	IcV/nQ==
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42nd8hcavv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 04 Nov 2024 13:52:51 +0000 (GMT)
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-5ec1dda8961so111053eaf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Nov 2024 05:52:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730728371; x=1731333171;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6Fc9RPWMyJisVrZOEDQeTPJ82OGC+aMZTuKQQ+ERKr0=;
        b=XORtuIhMRnhce7ESXHMnoA+zeqXfxYP58lqcTvEoDUcxiS1DxNRZMWCKuvDSUd3ZC1
         +d4HncGwzYLliP7Q7+/yDXVBJl4KO0Em1+Cvoe6Ub5N4ANOdLM9vBElaKVdQYLEhV0V5
         7O4P41PJtnrY8avYXgj1xF63dRw/4GcEFwvrv407VPd3LtzTxcoy2+ToOHGceKze+bX2
         MO8kbl3dxmcMtoE1iy5UH0G2A7zf2tjbLONK4bB7vS98q33mDzskzk7zHcSpS6f+ZuVT
         ky3URq6FbP1OP7zVKRzw5XXDbgE5aeEmo4LtxRiGyk24zjnmxN3wqhaTWTtm42bb07sB
         oQrg==
X-Forwarded-Encrypted: i=1; AJvYcCW8GtdsuZ/Q8+LznceMNQ6BDRgTieww50Bjeel3prXvm879yeZjsa5csaWQF9I60L2cdTfh/f7CTKlcQW7I@vger.kernel.org
X-Gm-Message-State: AOJu0YwfY5dhTPaVp/RWIdz8TrThavBcC7PpbDjgdEb24JRAm0mO9W1V
	D5+DidAyL/wyB6ugYfpf5dbltKwTOY4nrfb0yYRQ2T0rBCb8JiF9MsxgEEbDddRUr3KhchO8Nm+
	ku5dSWtwHjkEf+/Kjv4rjNkEgQXE6tnjpIsfvtqYTUahwsX7XwOukGVJ2U8MMNDX+
X-Received: by 2002:a05:6871:694:b0:27b:9f8b:277f with SMTP id 586e51a60fabf-29051dcd160mr5908877fac.14.1730728370855;
        Mon, 04 Nov 2024 05:52:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEchYTW941Pm6zez8i4wTztMoaNYpH6TGQ2dGSCprATsnU06GAno4f2JaI16THOFTQWIZTfCw==
X-Received: by 2002:a05:6871:694:b0:27b:9f8b:277f with SMTP id 586e51a60fabf-29051dcd160mr5908867fac.14.1730728370479;
        Mon, 04 Nov 2024 05:52:50 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9e563093e5sm552177566b.0.2024.11.04.05.52.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Nov 2024 05:52:49 -0800 (PST)
Message-ID: <c1dbfe1e-9519-4bf9-81df-8c32e08d0126@oss.qualcomm.com>
Date: Mon, 4 Nov 2024 14:52:46 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/1] arm64: dts: qcom: x1e80100-dell-xps13-9345:
 Introduce retimer support
To: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Bryan.Kemp@dell.com,
        tudor.laurentiu.oss@gmail.com
References: <20241030182153.16256-1-alex.vinarskis@gmail.com>
 <20241030182153.16256-2-alex.vinarskis@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241030182153.16256-2-alex.vinarskis@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: UeLgGsSRpw7eWVCFV5XR87D3k6zcM_DQ
X-Proofpoint-GUID: UeLgGsSRpw7eWVCFV5XR87D3k6zcM_DQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 malwarescore=0
 priorityscore=1501 phishscore=0 clxscore=1015 mlxscore=0 impostorscore=0
 bulkscore=0 mlxlogscore=975 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2411040121

On 30.10.2024 7:19 PM, Aleksandrs Vinarskis wrote:
> Describe x2 Parade PS8830 retimers for left and right USB Type-C ports
> respectively. Adjust graphs between connectors and the PHYs accordingly,
> add the voltage regulators. Dell XPS 13" 9345's DSDT describes 3rd
> retimer, but its not actually present.
> 
> Regulators are _assumed_ to be correct, since:
> * tlmm pins match DSDT definition.
> * tlmm and pmic gpios were tested and confirmed to be powering
>   off/resetting respective retimers.
> * USB3.0 now works correctly in both orientation, pre and post suspend.
> 
> Derived from:
> arm64: dts: qcom: x1e80100-t14s: Add external DP support
> 
> Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

