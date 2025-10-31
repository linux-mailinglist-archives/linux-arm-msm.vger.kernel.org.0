Return-Path: <linux-arm-msm+bounces-79942-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E22BC25D76
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Oct 2025 16:30:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B5BA73BC194
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Oct 2025 15:30:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E00102D7DEA;
	Fri, 31 Oct 2025 15:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k83hUwoE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z2PJdock"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CCC22D130C
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 15:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761924619; cv=none; b=SAv2oxy2fm1rUeEttIvtA3COxSWEhrHBnO2OrJLqMoiKv4gwoUFjxXdAlR+/6tsKSclJz9JVzYTQ7symI7QU+tahfXG8peAHhoPhbXZeHQki18cr6bJiFPy+/H+oa2mY3cfhcspc13eedQUJ/f0B5l0pVtsvV++bBrOTQMp0gZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761924619; c=relaxed/simple;
	bh=/eiVLLLAUQkmCi47mmct2VhL24BCqlSBWKy9afC3gT8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eNc1hgucKaGGv53WzlFBeTOWG/PVzGXXdmt18FykEEGuWbLhImq1d85BicLydQUyuqHjpx0ePRAAVh7iZYjXv8ol2Eksu2bdeYXK8dzuvTdzrFnmki0sj/HlJ5NQxPUo58TSE5wqncyPo2VB/DG25DD6mZF5Pra4RnQck6KlsiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k83hUwoE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z2PJdock; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59V73YM52059008
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 15:30:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aubjBpZ4Wxz6WDYi3ML1S8Br7mpPFHUcMeGT2IdqfJM=; b=k83hUwoE2hZlFlIS
	oITN13ABbcaks5UErqK2TdL64wOAw1HGbfYOj/mxk2jhaplLkPD2f69cpA9lyyel
	BnVXZ+fbCtyn4IFA+wgHiQQZa1tH2bdci/akd+TnDbyRyk9D0HJ9c+SzO3i749lc
	eXgO8Huj3AgL4EodPMD6YTGbUMLo+L0DaXzgDEHsMyh/LYPEtLZ8LZPG61cIjKl0
	mr7F7tMjPXtCNC2rjoxsZhlGEEbfK+OoD0ljgZ8THSLhfBksXW4OjtqcgtUO9TEi
	IAJHMkK8PtE/PCDUkNVtaOz1TYjdfONAX2g95aNsZ4OMto2VGTy4eVUlSGwa/Yuh
	k2qzZg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a4rcvhc3u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 15:30:17 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b6cd4d3a441so2099590a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 08:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761924617; x=1762529417; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aubjBpZ4Wxz6WDYi3ML1S8Br7mpPFHUcMeGT2IdqfJM=;
        b=Z2PJdocksohB05bQKs2Xk6EioL1ZNfS2bbbj1z7JGwucdoOwMb2z/+5xgKg5AW7kTG
         ygvAjIe1VBAI+kNMb9wVlR7mVThItcGXIrqTMgJBvcZ4mm6jbkBtaBEka63CfMc7nFNA
         6A1tQN/7GwADagJrLROT+cLvZh5tX6UH+60WxDryneA8zm8bkqUvVfbqRsQaJZLP2v3g
         Av7seTkSLXGMIcMxH2F2Wji3n8VF+mu9MfvTFOdFgKyNxK3dUedL2qHP7p1UMJoxebZ3
         WhS0IPfDgWEbSIRtNgkdC/PAe+0wFgEBb9ZMZCLmdMgxNG/Ou3eTLIOXeO+RXAGe1fYu
         5Q0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761924617; x=1762529417;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aubjBpZ4Wxz6WDYi3ML1S8Br7mpPFHUcMeGT2IdqfJM=;
        b=ipumqWkgviPGcDqx7AHYt7vlXz0fuC06rHBItmSqgcRXDGP0I+z/+TwdE+peFw8vRA
         2E2RjyfudS6Z+HpZLzLAnckHyxxXTs6gVr2YrDBjya2FDmM6+sTXfPL44bYjEgohP9/w
         kqZNMQrmPmL6+DcpLQJNdr4GWfNjy//qknsImqPIRKKvI4Rg6CvA0agSnv6kNalVLcp8
         gTcmEG19/ectIqTnu+sXH+uaWPUUGv23gW/Oc83WnAx/1o0KZe0mPX8jA3nnDCEpcABK
         JgQXOEHk+X3HR8hJDNs4/v6b5IPOAhzKBXYwVnjTtErbzSBL0GIutZ9ZVO1ukUl3Pl4f
         FR1w==
X-Forwarded-Encrypted: i=1; AJvYcCVe5omocPhLDLj48nwrZ/OVyR5G31+sXCJXAroI9/zVV0BCypnL8odcFYTIRIyfR19ReilIv1NHn8LEP3Um@vger.kernel.org
X-Gm-Message-State: AOJu0Yzzb+wQq+eCJz+BFvnw9lcbBZEgq2Qx0EzOZl4yDYX0M/fRnWZa
	OyhQrGGRxBKuu8zdTutSfmdBBZiwpdJrMTuJyZJ2SiYvq298NhKfTFwLu4434UH7LHoZcALE5+x
	lLYE1qa4wGrkxtSBRbsYYAue02BjrletsYs/0f17BLIk7gQcgtBmMqo0RfEBtUMMoyWsCPxD30F
	wr
X-Gm-Gg: ASbGncscBSkXzNdAbXJQtQVwnfQrNBep1R9n9O3aR4Tj361d86n76Fwy1/7rlmTJ3dl
	3p4AUYGmgWktsRizwDe07u8WEvwuAl/5KgD+JVdfc6WZrs+1YW3xIIpXWkdwqcdXYY/FXeMOZrb
	eLNMxTpCQPicZ8MhhrUKqWTVjg07+WitsM4Or0rpdB08yPmGgBftAIRViO3HW5awZkyOeN9YbCG
	HODZhiiyKN9aFLLIMO8ukSg3YynwUYc676NTmdam1iH51INc4IZzY7bv6VR6kdteeX1wL6KNaMw
	nNdhOBM9rG8qME2eYWmTPmILqHwY35Xv2AqJFjwdufPczmWZyQ625kXWAUUWmP0GJd3GaFrs9z4
	8Es2QxObu3tHeHULQfZeUz1bSi5cNZcoFkEabsKIJqID94r6D4bWG
X-Received: by 2002:a05:6a21:3998:b0:345:3eae:c6a3 with SMTP id adf61e73a8af0-3477c3d4aa1mr11213337637.18.1761924616201;
        Fri, 31 Oct 2025 08:30:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGI0yjTWVj8oWnooNwsC1xD39utAJSo9GaWuze9TCeSTyfY65uj7xmGoPU885hFwiAxRoWjtw==
X-Received: by 2002:a05:6a21:3998:b0:345:3eae:c6a3 with SMTP id adf61e73a8af0-3477c3d4aa1mr11213279637.18.1761924615551;
        Fri, 31 Oct 2025 08:30:15 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b9483c03f43sm1961613a12.24.2025.10.31.08.30.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Oct 2025 08:30:14 -0700 (PDT)
Message-ID: <ce252b99-c011-428f-a89a-5792f14c2eaa@oss.qualcomm.com>
Date: Fri, 31 Oct 2025 09:30:13 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: Use pointer from memcpy() call for assignment
 in copy_partial_exec_reqs()
To: Markus Elfring <Markus.Elfring@web.de>, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>,
        Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org,
        Miaoqian Lin <linmq006@gmail.com>
References: <d154d3c4-dd3e-488d-862f-5361867a70f1@web.de>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <d154d3c4-dd3e-488d-862f-5361867a70f1@web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=bJYb4f+Z c=1 sm=1 tr=0 ts=6904d609 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=FP58Ms26AAAA:8 a=i7YI89PhWf-mWEaAo1gA:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMxMDEzOCBTYWx0ZWRfX0p+8GfXLQ8Q3
 D54P0YdhOpegEaaDY/yjWyP52TIAf329vF9Lq2CsJ+nAlJ/YViBxWeJMiZJk3K/DAt6w9xDzXs/
 xE2vPh2go7QpK5wtwKZenFFpnThxGSdzTYdSvqqwnGRM5Oubar2SQtHpwAHuuqhdDgmR9jnsYd8
 1r4OP+x8JhWeofKXOO46bBnFngcuQUV+tEMn695poReLl27X6e/nPzajC8AeURx8CIYpQe4d9Ds
 NqGmx9iN44cr/iTSjF/a6joiSBz+JCqwzI/YCYopI26HWN49jajUqdvCzML+KTCKFS1cODnH1MT
 lL6CoDXH5YAUk9+LIuidkEq4ywK1L5vY7o3Q3Sq//gjB8UWlXnoo6NqAk4wDtPB0yE0+z2eqLpv
 ifz8CAXpsroT8HwJX7+Jl/aSn+GAIQ==
X-Proofpoint-ORIG-GUID: mu0Hxb-pG8a3OruSQy3N-li6aJQH0Rvb
X-Proofpoint-GUID: mu0Hxb-pG8a3OruSQy3N-li6aJQH0Rvb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-31_05,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 phishscore=0 malwarescore=0
 spamscore=0 suspectscore=0 priorityscore=1501 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510310138

On 10/31/2025 4:34 AM, Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Fri, 31 Oct 2025 11:26:33 +0100
> 
> A pointer was assigned to a variable. The same pointer was used for
> the destination parameter of a memcpy() call.
> This function is documented in the way that the same value is returned.
> Thus convert two separate statements into a direct variable assignment for
> the return value from a memory copy action.
> 
> The source code was transformed by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

This does not match the address this patch was received from, therefore 
DCO does not appear to be satisfied.  I cannot accept this.

> ---
>   drivers/accel/qaic/qaic_data.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/accel/qaic/qaic_data.c b/drivers/accel/qaic/qaic_data.c
> index fa723a2bdfa9..c1b315d1689c 100644
> --- a/drivers/accel/qaic/qaic_data.c
> +++ b/drivers/accel/qaic/qaic_data.c
> @@ -1171,8 +1171,8 @@ static inline int copy_partial_exec_reqs(struct qaic_device *qdev, struct bo_sli
>   	 * Copy over the last entry. Here we need to adjust len to the left over
>   	 * size, and set src and dst to the entry it is copied to.
>   	 */
> -	last_req = fifo_at(dbc->req_q_base, (tail + first_n) % dbc->nelem);
> -	memcpy(last_req, reqs + slice->nents - 1, sizeof(*reqs));
> +	last_req = memcpy(fifo_at(dbc->req_q_base, (tail + first_n) % dbc->nelem),
> +			  reqs + slice->nents - 1, sizeof(*reqs));

The new version reads worse to me, so I do not consider this to be an 
improvement.  This is not a critical path, so I doubt any performance 
increase that may exist outweighs the impact to readability.

-Jeff


