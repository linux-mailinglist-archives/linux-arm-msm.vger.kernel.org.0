Return-Path: <linux-arm-msm+bounces-69204-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 80864B26425
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 13:23:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E3D269E6D9D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 11:23:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5E332EA158;
	Thu, 14 Aug 2025 11:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GGcXKh22"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5027B2BCF6C
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 11:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755170583; cv=none; b=Gi5RuDmBuqpAnfAnIQ0L5VnIv3Mu08qLjT7XXwqvMpteQqlEMdvQAa+RKbQ7NnC/EwQ02W8AGlGg2Rb4jFi949NujSzVYX8n+afvkbRFANmzTg374Za10XeTI2XtjXss2ikRjFzBPk54ZjKBGA0oHshhZ7mWJ9iOXZ2rqDaeZLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755170583; c=relaxed/simple;
	bh=xUNru0mlqpchsDzS+TuxcdBBakDaluDopFCZtDDF0FM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UqMmkgytY8DArUNeawDZNL3npVX8GS+TEdCeN1gQi67hqCjg2ZDjQlajlv1Ubtwv7cPhHkUfZ4AIHUy+mJ6/zSZejyMygZdFBo+IjDIl7uFLW96sVq3eeNKBHEzyiDOcuvBprFJo93qB3luWjBshvMuS2L6oPaHezaR6bUgnl28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GGcXKh22; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57E9MOu9031982
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 11:23:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hQ5Wn1+6Fv1oHRCInTDg/1OC1hdkSifC03+smNxA01M=; b=GGcXKh22d5t6Y/hu
	Vnko01d0Da6qxSaAjur0KGPPQda6XnxoR7i+LibZQajlTvkayG5Wc7HFJ1yjfmFd
	P+W/841Ql8xanTNz3ENCTyRRifmykpfzP6oB3e4yFIADz5Nh5j7V/uK4JBNsgTk9
	juvSCflvG6GmuryIbM0ogM84mVsle2Am5+lNiVtNpMIk0CTCbnEhm+ZOXdCjghLv
	VSBKbFJqR3J0FRxNTW5iKOBWTXA9CAHqzDmgdmuDh5kApFQOSYbrXGSDOp1gNsZY
	KDuPH1v/y9ZayTBIgPT0coD5MU592ju6lWDtjG4e7ezbn9488KW3+f8h21L4Vz4i
	G7mnLw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48fem4kehe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 11:23:01 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b109cb7ca0so2567431cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 04:23:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755170580; x=1755775380;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hQ5Wn1+6Fv1oHRCInTDg/1OC1hdkSifC03+smNxA01M=;
        b=XTzFCvAM65PYbgOc9GGmjM/+l+MYiObsoLCFS9u+bkBDxeaYI6HCEd8wJNwNeaHlHI
         Ps2WaH5dtGjxnKBh4ndF/MtIJVow0ljry9ZVkUAYARSbCVTDtKUjTlEIsqRoxSjT9bxX
         ylDfwI/8IGeB3Lhrx+fV7ZBL18roVfcIDqJQHRDo06ouFUR2ZbspVnjYN5CGZazbibcB
         l6UUHwO+6gax+S+D8w9L2gjgUpmJoy/41ZP6xxZEL/mnPxQdJyeeRQn3D1omkmFfF+P9
         w9kLvka04hHqvfeXQ0l2IeRCgUwISXTdJbun5nUuBWMxm9Q3nKdUlD75iS6p2Y6F1V+I
         hqnA==
X-Gm-Message-State: AOJu0YwcatcPqCVQtN8k6RT4WxKTNT0CT6X+8MyvWdBzlBo8EVIifc3g
	U+wsw3c/52JSaGuPHlCs+9OGjpW7JLaZAyk40Kxqp+5lyyJHt+J/NTJu5Hu/+x88+Ro/fmKfqXH
	JlgVkCxMTG2P9pg0U3u3CDh22MEW3H6s0kBb3b9YnAIGShI8APammcmhRNxDsIZGQiaRe
X-Gm-Gg: ASbGncssRmUf82IZFWNpCM9Q40eA/an5yqpHXUp7Ws6nGN+ICxIgRyRezywsetK6ZqW
	FiEjgP4NdYYqdFoSrU0ZNCb68y7R7QF6nogaeKHAbzkTbBtkIf246hFNH9ooIhyJ6JqoyH+ffRQ
	KyPzpQ33Lvz4chA6clz/TOD1ICyFfEtInOpCKyHP6h4OlQuonkVZhfafLP1ZGizwHlV5NNt0A/x
	QtS4NOSzUMltH8W9SuoQgeYPWv8PNievUyQbh+If03uf6YeYoSWY3rgCoR5EYr+oWi2CfZpHTVA
	JkzLzOoVkDStIpo68RKA2V/ijLuImzxImnIXqEbMIwZWW3+3aJCI8zT3bwx7iS8zYUGO594jvb+
	nbZ00uRICQQcv+Z9EiQ==
X-Received: by 2002:ac8:574a:0:b0:4ab:6d02:c061 with SMTP id d75a77b69052e-4b10aa79245mr17184241cf.6.1755170580405;
        Thu, 14 Aug 2025 04:23:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEBEqH1INBenomIkNEpLsnsD1vmfMViwj5vT13W7Lz3WQ/KCQYzoIaA6pCulkVk2wkfvE/B5Q==
X-Received: by 2002:ac8:574a:0:b0:4ab:6d02:c061 with SMTP id d75a77b69052e-4b10aa79245mr17183881cf.6.1755170579781;
        Thu, 14 Aug 2025 04:22:59 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-615a8fe7995sm22946026a12.36.2025.08.14.04.22.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Aug 2025 04:22:59 -0700 (PDT)
Message-ID: <b4f283ce-5be1-4d2f-82e2-e9c3be22a37f@oss.qualcomm.com>
Date: Thu, 14 Aug 2025 13:22:57 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/msm: adreno: a6xx: enable GMU bandwidth voting for
 x1e80100 GPU
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20250725-topic-x1e80100-gpu-bwvote-v2-1-58d2fbb6a127@linaro.org>
 <e7ddfe18-d2c7-4201-a271-81be7c814011@oss.qualcomm.com>
 <33442cc4-a205-46a8-a2b8-5c85c236c8d4@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <33442cc4-a205-46a8-a2b8-5c85c236c8d4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: dLsAxIXN6R_GkadzBwZGF5NJNyrKbClm
X-Proofpoint-ORIG-GUID: dLsAxIXN6R_GkadzBwZGF5NJNyrKbClm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA2OCBTYWx0ZWRfXyIS6Ir5vxp9v
 Uvz24QNAImuYKD/f3DiEP+YxvQ1s1kPTDnx7Lwyau0bqQ4Mmd141TVI5e6J+8MpN6A0mNzPiy3i
 A0Koq2NHZjO2czzn2z6lctsM/5I2+8eKU0VNKsMLTrYuN1Q2RNYNQCzPRisuJfTGNWT490UKIcE
 h07Z1PdHsux+PnglhmmMfO0XWHAO2G0lGBL9dkvsH25ln0qaE32dUEC5oKdYXQaTIYsfwEIn//F
 c6bBZQCkRunEIw+mJ6Y57bn3culJYqplfWPpAytlhWSpg20jS4xnQgg06uZm4fnGxZUCTt8JCAO
 DEku6fL6ZxZE+Qq0QGWoiMHJjI+ekntotHs6cQQrXbHRqTpQk4DTGsNi/+fF+XGramjzF9/8zdk
 z4ZmeGK3
X-Authority-Analysis: v=2.4 cv=YMafyQGx c=1 sm=1 tr=0 ts=689dc715 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=w8v9NIqJ3aMQWT92luIA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_02,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0
 adultscore=0 impostorscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508110068

On 8/14/25 1:21 PM, Konrad Dybcio wrote:
> On 7/31/25 12:19 PM, Konrad Dybcio wrote:
>> On 7/25/25 10:35 AM, Neil Armstrong wrote:
>>> The Adreno GPU Management Unit (GMU) can also scale DDR Bandwidth along
>>> the Frequency and Power Domain level, but by default we leave the
>>> OPP core scale the interconnect ddr path.
>>>
>>> Declare the Bus Control Modules (BCMs) and the corresponding parameters
>>> in the GPU info struct to allow the GMU to vote for the bandwidth.
>>>
>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>> ---
>>> Changes in v2:
>>> - Used proper ACV perfmode bit/freq
>>> - Link to v1: https://lore.kernel.org/r/20250721-topic-x1e80100-gpu-bwvote-v1-1-946619b0f73a@linaro.org
>>> ---
>>>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 11 +++++++++++
>>>  1 file changed, 11 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>>> index 00e1afd46b81546eec03e22cda9e9a604f6f3b60..892f98b1f2ae582268adebd758437ff60456cdd5 100644
>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>>> @@ -1440,6 +1440,17 @@ static const struct adreno_info a7xx_gpus[] = {
>>>  			.pwrup_reglist = &a7xx_pwrup_reglist,
>>>  			.gmu_chipid = 0x7050001,
>>>  			.gmu_cgc_mode = 0x00020202,
>>> +			.bcms = (const struct a6xx_bcm[]) {
>>> +				{ .name = "SH0", .buswidth = 16 },
>>> +				{ .name = "MC0", .buswidth = 4 },
>>> +				{
>>> +					.name = "ACV",
>>> +					.fixed = true,
>>> +					.perfmode = BIT(3),
>>> +					.perfmode_bw = 16500000,
>>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Actually no, BIT(3) is for the CPU (OS), GPU should use BIT(2)

This is *very* platform-dependent, goes without saying..

I see BIT(2) is also valid for X1P4

Konrad

