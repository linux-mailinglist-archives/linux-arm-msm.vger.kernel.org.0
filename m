Return-Path: <linux-arm-msm+bounces-78701-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 424FDC052E0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Oct 2025 10:50:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id EC547581F33
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Oct 2025 08:41:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 796C2309DCB;
	Fri, 24 Oct 2025 08:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N7EkyC3V"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2DE53093DB
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 08:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761295205; cv=none; b=DAbXh8P8hvuSIk59JKdZBS3Jh2cSTz4SeCgOBMlY9HMQ9dytIKn7Np+vfJ28gh9SfdoSoTnlZcUHOyLic3jSBY4Vi6zQpleGLQ3GoRuDVmNa9aKBlUQQZuxkGF/AGCWi0UwxB8Hmg4fioQo3/fyHWpfxGdkQftQEZzpQiDhwLao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761295205; c=relaxed/simple;
	bh=JYG+1M6PiT/mD78iOJ1agyaZE8yQPk6FhGZI0XIiWLU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ACGceBoOvFtlnZ8QPFUprOZjNvl57A4a7EnhBqs2fB5RuVTNd1M47pLs4rtuMrb1XVMhLWnFnyOSzEISqudMlD0ZoqmwAHiZ/hVZUPIIrAUh2+de8PUPawC02Ty4UWPgBYt3vgSoIQ8r/1BJkXPU2ofnMO+5UucWG5DNiPG0vCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N7EkyC3V; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59O3M7JA010231
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 08:40:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1JOLmma9bqlEv6mHUzEz+JGLukJKbebhm4RprQi7te4=; b=N7EkyC3V4jno2qqu
	cri/U0CCVWsxtL80RgQTiqAAbi5Io/FErEVEqOQkhu4irHFPgpoas8cci/k1AldD
	bPVxwZIKQyfcuBVTYnF51Ifdgl0VjsNwLtno5vixKyubJSwxj7CsIez3sFgG5tmP
	5it57gNgFEDRDweHrXOBh4gWPdbcRQKIIYCDHP1ztfx/cSSjbmGNE0o3u6wNPcPO
	OjHIdGcPPTR5fxYnfR5Wsz/I1Neh4ZM3N0OMJGvxsO3GrIERWVoCSvBcbD56xkH/
	Z4dQotg9mBZXeo97jkhhtYHYqmy8RRlMFktz/aFkAepg0II8g9sgFp76kDNc93S4
	exhcYA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49y524dkms-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 08:40:02 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-88f7d885f8dso56528285a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 01:40:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761295201; x=1761900001;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1JOLmma9bqlEv6mHUzEz+JGLukJKbebhm4RprQi7te4=;
        b=Ra3Yjfd4Irs321yHzDhhpjJYheTQtsajb9jDMAG9lahmXc3DmFQ7yPlr/GlZRivoIq
         9d23MtaiQmloji2egap8RI1mSMUZdIK2St9M0HvrsyM1A0YaG02TpEDozwHcrA9OO1bM
         cTf1RzMB3Pr1ltWBwoayrFxlkPKVK9NMGZSYwjRLOnJqeVTnLBnNqseoVZ4HnlrIDLcm
         bKzjQ7V3/xqtuxTdaesGS7zSqreiBuu8XQRGDzPYCZgU3n6a1kv/WtO9AUjw/fVcrAyI
         kCzuRSkL/5ENyI66o+5AzbmlJjR+G2FBwt7/nG+leEMKbAf66Cu9HM391+WypZLMOmkj
         Cx4A==
X-Gm-Message-State: AOJu0YxwZ+nZIDesqX4QCoI9FdDzEkinHcvzKMBlpczm+hGSdkLeJYnL
	+O9tS54j0jWL/OSGuXLXi2/po+bJjZQcAVTLQ49cx3Zy+tYNUBUnpCFogd3ET0mga8oHLMkBz57
	+h7dPCDxHLM5X7kFM3fqapy15dFJ0ET8BV+hr+hd0ppah4twfCnoaeV+tu44UtQ3Q1PNY
X-Gm-Gg: ASbGncvdIX3BhzTj4LXRxsMuxgm2AfZ/kK5Zcj/8f85ionJpkLbQKjEdwvC0hO4BRQL
	mI5sjTp1a1864miYW591sWfiZ9y5HQe5eyc0f4w1ZIKzp13lsz+0ONQatNQfZpuzBGa5tF990uJ
	XYuIk2E7zCCejG/cyY6FvaHPJsKGwfhQSjqWbkIHQU7DLcspAOxdxZeI3nOlHc+4GGr+h+WkZ2f
	47X0RxcW667A7uwrkw8xP5rMookM4WFnuh1ZUPOEA70XObbNlXBC3Tq8kedTYuRxV5BGHwK69K2
	5f2deETzFLx37RhheV2EC15PS+lT77PSzugvABVQV40rdQJ7M5aOt+2mbwNU8WKlhny1ywpD9aZ
	dzFPu8KzQosMSBaxHbUM61mzims3kmjufr41TPecnoD4XiioIq1HZGkHI
X-Received: by 2002:ac8:5f10:0:b0:4dc:cb40:706e with SMTP id d75a77b69052e-4ea117e0b30mr119093201cf.13.1761295201570;
        Fri, 24 Oct 2025 01:40:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHogEfnZCnfST81Rb3Ac0hj/uzXgJkTfe2vdk/f4ZOhJqmLDy0hT9TzZwbdfJg4861TgaON+A==
X-Received: by 2002:ac8:5f10:0:b0:4dc:cb40:706e with SMTP id d75a77b69052e-4ea117e0b30mr119092961cf.13.1761295201142;
        Fri, 24 Oct 2025 01:40:01 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d51471ef6sm444517466b.72.2025.10.24.01.39.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Oct 2025 01:40:00 -0700 (PDT)
Message-ID: <102d9042-49cb-4aff-8b93-a882ed8da27c@oss.qualcomm.com>
Date: Fri, 24 Oct 2025 10:39:58 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] clk: qcom: ecpricc-qdu100: Add mem_enable_mask to
 the clock memory branch
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
References: <20251024-sm8750-videocc-v2-v3-0-6286bbda3c8e@oss.qualcomm.com>
 <20251024-sm8750-videocc-v2-v3-2-6286bbda3c8e@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251024-sm8750-videocc-v2-v3-2-6286bbda3c8e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIyMDE1NSBTYWx0ZWRfX9Hbx6RnNPh0i
 3Z97c6RwoH3pWdF6iZglQEHQgoN5BBqzYv+eglNPrYJyc/YVmnacPNei9Ghk2uAp54GtLClNCuk
 m/tZYLZEa9GHChf73Ik76Kyqs68UvEcdPKNlqpi1Ot6U2OrAtrM7eVivetN7h6QaJw0BkHyOUnd
 GEsjc8SUfKggtgXWUnU1UlSkhEusPcN6b1CqCMVKeM2Z2dXymTHTKUqLUNvyRefps3luZpPQbCA
 u9UemKTiHME9RaMeC9lvg7Um58yRUi6uHHBi+Xn91i2LD5lvVoiQ5eeBQjFyXO7AQuG0MCypz9x
 23U0LHP/nBA2+42AaZvkMPSK2I3GYHTzGztQJom3Au/BK9GpqTL6NZUECmzZVoMfUSY97pEFBDz
 4wNttzZ23jbDX9P+lmnByrg4ZMnRPA==
X-Authority-Analysis: v=2.4 cv=Uotu9uwB c=1 sm=1 tr=0 ts=68fb3b62 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=FB20kyDvaZqv9jGj6gQA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: BWRl4pn2wHcUu5zq-psPdgBYKEZCmUyA
X-Proofpoint-ORIG-GUID: BWRl4pn2wHcUu5zq-psPdgBYKEZCmUyA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-23_03,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 adultscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510220155

On 10/24/25 6:24 AM, Taniya Das wrote:
> Add the newly introduced 'mem_enable_mask' to the memory control branch
> clocks of ECPRI clock controller to align to the new mem_ops handling.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---

This probably fixes some ugly issue, could you please mention what
the impact/problem is?

Konrad

