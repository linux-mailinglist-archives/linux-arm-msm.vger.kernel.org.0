Return-Path: <linux-arm-msm+bounces-76210-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 819D3BC17A0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Oct 2025 15:21:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 36B7E3AD3D4
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Oct 2025 13:21:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4CAC25486D;
	Tue,  7 Oct 2025 13:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="htfyjoaf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F1DC255E27
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Oct 2025 13:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759843310; cv=none; b=Nc7pH+SZi8XWXKWATHaY1UzE69FVp2I1jvPjlcYJSnTJRchcfhLmQt+jLnL3qGa7jECguh5Tz7oD3d8P+hMVJo9ll7DbCrh7AvhI6jPTtenSX8bSWghYGxX38RZYDoCkdLDV9zAXj+FHNkWbdeEOsSw8g1HBRk+X7rUVn/SlfnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759843310; c=relaxed/simple;
	bh=KfH/1jqNQyHXHlWGnPskC3l+clWGf5otYkYARvsHOOg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BpqLSdErprk5TvZZsvwd6Nbwbg3yjgd3bM5GyFar78tsOMD17MIhPdMDL5YckTtRo2H4DOurfQnmcV29FGn+B+LZ4EOPPpM9rA0tLOxAIIexoqwfHkFS0TtI/3X/ScnATppnnh1CoZdtUo3QXA6b7aprFAxMfa7z5Pn5W2fLoq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=htfyjoaf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 597BWndh020172
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Oct 2025 13:21:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	69V/u5q238Ax0jCPnsahYPkllbnBSkqASEz80OzIQtA=; b=htfyjoafLsGxy0kf
	J+cwEuZi3iW5da95gdZb4eYdL4GB1PoBOMr0hP5CRbMFROI+xzgYw+vGX8v5s10t
	5A11p6GUoXh8elM3brpF4mqBlnBHG2WOrUjiAOrPZ9BYzfJQSrqd2uZmL2ENHiBz
	Y0RKVVFX2pmjU21TqcDXMjCzGz/phgWANAQRMfbQHtdImwDNCy33xNDnJBOTfXn+
	uCZc24RxJQoL/i6K2AZA1Swr5yz3o4CIbcqVJHNkpxlp83LKjOpC27MIFT8YZOXK
	Irr8b8KdZNbHG5WR+NlVGbZRV58s9hwA+D4zqGn/Bt0A3IuO6tIoLtxp/kn/2hoc
	vGAJiQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49js9dyeyv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Oct 2025 13:21:48 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4e6d173e2a2so6119781cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Oct 2025 06:21:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759843307; x=1760448107;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=69V/u5q238Ax0jCPnsahYPkllbnBSkqASEz80OzIQtA=;
        b=h57qn7z5ilLL4vXnpgy6jqj+vwm97MjZbLIOY46WFymSG+DSOSokFesusXi+5twjUZ
         QN8oO6uFMCYCC+KdLbNHx+pRhd6l0gL6Jr01zf9xJyaivOCw7xnIPCJgMevoj4NvW6YE
         fUVyxiW0qwJ838yC4sLEaCGUqd5rQdSceVxMWrWFV3NewYB5gw8qISwCnfXFWyvinlVa
         1z2U8yQtK9X+AvlxWKdtEjhVcIY/kWlW9xwpVsOveGdttdSupY6Xbkoybh78gCnHLp5B
         wxsQApG0I8YKTnh7t/u/YBwOstmzPaCZWipkEkQlkJ6kF+sD05uygZf5h8e/bkoM11+h
         8l6g==
X-Gm-Message-State: AOJu0YymOtNlpYOP+8iaxg9SLooN0jIu5+OPE4dEoLbhgJJjuvSNB6kA
	jzZbuSArv6gOxqdUPw337qSXo53Bxj5ZyyrtPIRVGMG90MR38Q40JQMul55Mg+tyJnonBHF2A8o
	HigINpH7r3xcxhzGVQarSxrgqdZfyAa2eP9MKS52N5M/at0n2BTJGFdzr+o7OE6WRtyLd
X-Gm-Gg: ASbGncupBrlPChU9WSATCBepfppCthoTkMUuhA82CIQOKYKAmdY0tSreYrG6Sl8VmzL
	jIYi241YW1mAtyFvRSjZxW1fT5igoin+Nn31l+w7RquoXQF2GprK4as4d+JH4SnxW6wVRUwLiS7
	B+drB/Y79CvZZAmVdTWMVcTOOY+ZqXqJEAm9NoLZU9TmfkiFcRScSJUAanp3UH36Tpd8/oHAiWq
	0qPkW6FYT4d5KRIqFKzkNjuUVmRH5MzDgWUPeOkVocj29E9OwDysHiToWqPe0YZ0feKcu//szwg
	f9XXkChL4+T+9pqBRVjOwP2ehlxoo0wXT7mOMtogs00xG2Tcj6yzrlIDpdevJCFeN5xfj6Q7RLa
	5C0MHyoCdqT+mxxubFrH39eruY6M=
X-Received: by 2002:a05:622a:258a:b0:4e5:7716:53f2 with SMTP id d75a77b69052e-4e5771655famr137439761cf.8.1759843306738;
        Tue, 07 Oct 2025 06:21:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFV+5gLGyTtm2EcoLGMjErrwgnYOqeTHtg3sD1ZGygw+OnNB220PhRNrlGL06lG+1LwfOeQBA==
X-Received: by 2002:a05:622a:258a:b0:4e5:7716:53f2 with SMTP id d75a77b69052e-4e5771655famr137439001cf.8.1759843305826;
        Tue, 07 Oct 2025 06:21:45 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b4f7eacdfe6sm194442766b.27.2025.10.07.06.21.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Oct 2025 06:21:45 -0700 (PDT)
Message-ID: <fedbc219-7935-4d7a-a9f6-3df05e27be92@oss.qualcomm.com>
Date: Tue, 7 Oct 2025 15:21:42 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/8] media: iris: Introduce vpu ops for vpu4 with
 necessary hooks
To: Vishnu Reddy <quic_bvisredd@quicinc.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250925-knp_video-v1-0-e323c0b3c0cd@oss.qualcomm.com>
 <20250925-knp_video-v1-7-e323c0b3c0cd@oss.qualcomm.com>
 <3355306e-4059-4af5-8865-3b5335356382@oss.qualcomm.com>
 <68686586-f161-c6c6-cd3f-c5eb87e33954@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <68686586-f161-c6c6-cd3f-c5eb87e33954@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Hrl72kTS c=1 sm=1 tr=0 ts=68e513ec cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=bkvKUzPmFnKcqkYD6asA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: mv62KpaPgkgoy3aKg8G8oNUlL4iGKL3Z
X-Proofpoint-ORIG-GUID: mv62KpaPgkgoy3aKg8G8oNUlL4iGKL3Z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAwNCBTYWx0ZWRfXx4zRp0Kz1uHt
 tabW1GVqjTyoG7yyKRkecXBFd28CNrkOlSQw3Q0KpYejcz6k2FQLck3kBAkQXCLx7ObcuyoDWFq
 NW6AVamxctpNqFSRgzEVaD+XKoe4GWgNS6xOm57QgS+JKjcVfWNK3P5tN+9NTVAUDrP/idS2kg2
 XeQXq4d6HOPgbMdxixPueWdF/iuZWQs4ZrTeAN+XYF0WhmsH9EE3cu/Tn2HZYo1Gy62xvEH+39U
 CDz1wRgBBoX8RcGSdXMskeB297oMZsBCgDaJcBbyzGl4DsPzbiQBUKsIDnLxeqrkDacjSSPdXjN
 nA1+SLhtVRn7GWtKmj6moBqTzjhvaT4Nvl1ri4mkIrukriz4qoSanjvi2bTxE3qmrtiDUL97rfp
 rz6YVk7jTcVo4iePYRhGHSBFNvKBgQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-07_01,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040004

On 9/29/25 7:45 AM, Vishnu Reddy wrote:
> 
> 
> On 9/25/2025 2:48 PM, Konrad Dybcio wrote:
>> On 9/25/25 1:14 AM, Vikash Garodia wrote:
>>> Add power sequence for vpu4 by reusing from previous generation wherever
>>> possible. Hook up vpu4 op with vpu4 specific implemtation or resue from
>>> earlier generation wherever feasible, like clock calculation in this
>>> case.
>>>
>>> Co-developed-by: Vishnu Reddy <quic_bvisredd@quicinc.com>
>>> Signed-off-by: Vishnu Reddy <quic_bvisredd@quicinc.com>
>>> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>>> ---
>>
>> [...]
>>
>>> +#include <linux/iopoll.h>
>>> +#include <linux/reset.h>
>>> +#include "iris_instance.h"
>>> +#include "iris_vpu_common.h"
>>> +#include "iris_vpu_register_defines.h"
>>> +
>>> +#define WRAPPER_EFUSE_MONITOR            (WRAPPER_BASE_OFFS + 0x08)
>>> +#define AON_WRAPPER_MVP_NOC_RESET_SYNCRST    (AON_MVP_NOC_RESET + 0x08)
>>> +#define CPU_CS_APV_BRIDGE_SYNC_RESET        (CPU_BASE_OFFS + 0x174)
>>> +#define DISABLE_VIDEO_APV_BIT            BIT(27)
>>> +#define DISABLE_VIDEO_VPP1_BIT            BIT(28)
>>> +#define DISABLE_VIDEO_VPP0_BIT            BIT(29)
>>> +#define CORE_CLK_HALT                BIT(0)
>>> +#define APV_CLK_HALT                BIT(1)
>>> +#define CORE_PWR_ON                BIT(1)
>>> +
>>> +static int iris_vpu4x_genpd_set_hwmode(struct iris_core *core, bool hw_mode)
>>> +{
>>> +    u32 value = readl(core->reg_base + WRAPPER_EFUSE_MONITOR);
>>
>> I think this could use some explanations.
>>
>> I'll go ahead and assume that the eFuse tells us that parts of the
>> IP are disables (hopefully not all three at once.. we shouldn't
>> advertise the v4l2 device then, probably)
>>
>> You read back the fuse register a lot, even though I presume it's not
>> supposed to change at runtime. How about we add:
>>
>> bool vpp0_fused_off
>> bool vpp1_fused_off
>> bool apv_fused_off
>>
>> instead?
>>
> 
>  Hi Konrad, Thanks for your review and suggestion.
> 
>  The poweroff and poweron ops will be called in each test. There is no
>  ops available that called onetime only to cache these values.
>  And, to create any variable, Need to add as static global in this file
>  because these are specific to this platform and I feel it's not
>  recommended code to add into any common structures as a member.
> 
>  Do you have any suggestion from your side how this can be do it in a
>  simple way?

Can we not just read it at probe / fw loading time and store the data in
iris_core?

Konrad

