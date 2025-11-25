Return-Path: <linux-arm-msm+bounces-83162-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id AB398C83815
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 07:38:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 215D034943E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 06:38:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2297298987;
	Tue, 25 Nov 2025 06:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oiCWSWb8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZbhoQIqK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F59C296BB6
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 06:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764052680; cv=none; b=i+bA2nzb95lsxHvy8rKMNBFvuQpdMsHv1Yr6OUeR9o+yE9m3KECBmBXRk8hJcasU7PsakMFghIvkIOxOa0UXh90Ko6jIFKce03hC69PConUlulmADwINLU1FeCeFPA5B8HDIYZWrrJrCBo5uNjjAVy0I3ltsxuuRTIYQTOzNQA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764052680; c=relaxed/simple;
	bh=rWLERcFF2SbpU1nSKdtBfJAGJKT+za0aFJS7Vfsi9eU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ANJtJSLk6ncU5n2BXpZTFdSId/fispxWkZ9aoBtWvM6rg3g1w6ZMKh420wPEib0s0wdFm/bjeDKtrY4E3HKiKNKxWvWStc/3ypEuohIhJ7xwx57VEnuwsqPHE+iPI/CqHfKbF+gvn4K3mUkeHt2WZWUDvxZOQG+8w0uyEOOfW50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oiCWSWb8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZbhoQIqK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AP2hA6q1700181
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 06:37:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ErqSuJhmVOAQ6Obb00NbJWCGaUXkzOxerh/e1fs0cE4=; b=oiCWSWb8VF2dOwPO
	mR1QLGw3v/dqeQ3Dl+rEGA7UD/jL1l9LVyR/HRPsGmFz1e6vC4rK/rfcW3JsInQx
	ZIo0BndnpiWoQcZbRRxtxQKk2dkrq7Y+KKn5a/Y1MHUmodi96/lcdrp7D1Jh49q7
	cfAqpKadKK99k2siT4fvSftV/4Kn9WTTz2ZJ+OmrboKa3bl4ApQT6VX0k4prDUx2
	0UBQByU0Wj7ZfOGON0CGa4h9/jbewy1P0pC70Yig//u649OyzQmRbjb4GB8cOZd3
	8cdQ7bDX43BpoeBZOH/xXvF+DK/p8c1v1AL8omMTQL+Q9cw2G65X+Z3XaPd0J2Za
	ag1ugQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4amp56b087-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 06:37:58 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-88236279bd9so161994886d6.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 22:37:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764052677; x=1764657477; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ErqSuJhmVOAQ6Obb00NbJWCGaUXkzOxerh/e1fs0cE4=;
        b=ZbhoQIqK/ZiPHXOipq8oK6GWzZXZHMn0s5Y4wvjagJZYWjkkgzj2LBy8dvrcs7O8ZD
         VJoNwyeKOL+EwE25HbvjAPtmMWGgkAdt/+JoGiD0a6whIaAfR/qRD/ptaUnWvfz0wj1B
         jHUXG9VI7Nd7kbkA2ngCsn6lffFR4wdVAkg9jtwVVh4DMugYhpMyE0W6DDEbfyKRByoa
         VjR6CDTXfwqK564cgAdwdabPy581bMnnjzwbn6EFS/DPKc58sZd2b0CemdAXJXHDkikn
         5ZStQMYPzH5X4GwsaTPcWk2UG0v7Cd9nhdDiBEp5PUAec8Ie7eUVRZSOrLr+nlKevpBY
         DM+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764052677; x=1764657477;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ErqSuJhmVOAQ6Obb00NbJWCGaUXkzOxerh/e1fs0cE4=;
        b=LbHiv/WRH4omtvwAr8nZaiF5bC6FNa0iozgRZ0WuHWFB0TcjkyMr8FDlXLmor8GQKP
         SWerP8wRdgx9RFSaREShWyYJgtS/uMRhtjwWaBNNZzootOXRJjbj2Cf/dJi8nv9UFEqq
         g9p4N10le1+2RheIoLXLqMwioRj7aYf6+LWfuTfXHXqSRVkx+IcyzUpkBxDJWQtj8tCe
         3l5873fpbI8amzwJPisQdMvSj0AoG2qkWaoDqMLlF1axsseBYZS9YwFld+i8egoeYje4
         2tgyNLGYYYUOAMFqAC5y3CX03dG7yQC9sMKv9+8+dmCmlJJ5ofLoDcPb93hjzlnaPNQM
         HNIg==
X-Forwarded-Encrypted: i=1; AJvYcCUd6gypKirdQcg0sdCN3pyPRwQ3/ny3Y6LKUhqR9zGQ6hPLMhT6cWZ0kTZgS2T/26vgcmWZ7Ht+GQHxRmhB@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3TmVSn34N3frynVJWCungNOqIwLLOVDjLmQlQoE2U5vi/mC1O
	w3tRReiH4xcFajPk7WcG9j3UOk1RwS6DHBOaxSDQEYcZbloesYygh0lsk5SKfygudOQPuwGuv2y
	K8t/TqnoHqVfsWdL2rks5uyFIPdRuNweigDHS04SBLPejElZBObwlsyPsLeM3kSnsPMPy
X-Gm-Gg: ASbGnctVPEDWZptw5mBYc56a0VkrlHXXqJ9ME+ocBU7WcqyA7Pnp46wJLCkr36raW8c
	fNiB+DjPGQpqwcKlXLPohbn7o3GPymipdXF4iC2ecYOFasACNn73G1ps8onzdQN1fzIe3a3jsh8
	HrAz+5tbZpGOkB3w2HPyEhEl13g2cqGUtZcRvo0TPOLehUAp53TcKAgcyCZtfN6Hl4bIZkN3UNL
	TrG8dFpW3FMfKQEV7C+N4+sJKiqO7PdnH/ux3oQaRD356+WcZ6hnpXE+ORmi2a6IPT/anEKIV91
	r6uEiZai6gfXnT0riLuUS+wpGwbQdFI+zfT8VzpLcxFO3DxGKui2ec70TTrqJgoj4tXXl/25kSb
	xysFAFj+40AOaYlW+iJVHnDpDcC0RmFOfgg==
X-Received: by 2002:a05:622a:148c:b0:4ed:67bc:50de with SMTP id d75a77b69052e-4ee5885402bmr185785631cf.24.1764052677014;
        Mon, 24 Nov 2025 22:37:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH3IEAKR3Cy+9eYJq5upmyvN0y0HD6s2YnTjLvISf6qEEcoow8UYxypFBvz2esF8/bKVX5elg==
X-Received: by 2002:a05:622a:148c:b0:4ed:67bc:50de with SMTP id d75a77b69052e-4ee5885402bmr185785451cf.24.1764052676589;
        Mon, 24 Nov 2025 22:37:56 -0800 (PST)
Received: from [10.64.68.30] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4ee48b45ccesm100522231cf.0.2025.11.24.22.37.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Nov 2025 22:37:56 -0800 (PST)
Message-ID: <e6aff9d8-a6ae-497f-8c8c-91d60959eadc@oss.qualcomm.com>
Date: Tue, 25 Nov 2025 14:37:46 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/38] drm/msm/dp: remove cached drm_edid from panel
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
 <20250825-msm-dp-mst-v3-1-01faacfcdedd@oss.qualcomm.com>
 <otmy4kttxflsxkvacwdsqynck4nqeww7jsxaq2xwjtlooxnhvx@gmpezdliskck>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <otmy4kttxflsxkvacwdsqynck4nqeww7jsxaq2xwjtlooxnhvx@gmpezdliskck>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: jq5xmZha93PXrcIHxOUHO046NU5JVkSN
X-Proofpoint-ORIG-GUID: jq5xmZha93PXrcIHxOUHO046NU5JVkSN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI1MDA1MyBTYWx0ZWRfX3VRdUZmnwYv4
 tKLmGi9SmyjYdyE4AqEiI6q9rHzyNtnMHJnzznl3KZcqBrWgquMk2ZtvJFiIWrg55HdkNK7i7iZ
 zpX4JywtXP6kN8thtEDWqmPSwSNI7+89APRT6kF+e/wCWM4guRYM/NR3n1tAgloXG7m46Os1jFb
 XkmDVZqbPe6+XLm2pAZhw53R7Fo3ECMPhAaTayqPVuP08NexMZgx0ZDRtltjOG3k/WPAMbq6Hx9
 aEQ70Ahi+CAN7NK+lyGAeTWBYsFt6gc/PenX3TIhURg26Y1YvFw+jPDqWtbig+lKcxjZwPjWaiz
 htCC5ORjLPWjM+blpwUYV8yBES0dQZEakqmCbqjEoNmnoMDjIXjZ6n15HOYtuftpwJygYQGi2H7
 8ZbAZxb0NPZdmQmoQY6mIT74grEhwg==
X-Authority-Analysis: v=2.4 cv=dPWrWeZb c=1 sm=1 tr=0 ts=69254ec6 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=UzQ1Ta3AV69qgWW9qvUA:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_01,2025-11-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 phishscore=0 malwarescore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511250053



On 8/26/2025 12:41 AM, Dmitry Baryshkov wrote:
> On Mon, Aug 25, 2025 at 10:15:47PM +0800, Yongxing Mou wrote:
>> The cached drm_edid in msm_dp_panel was redundant and led to unnecessary
>> state management complexity. This change removes the drm_edid member from
> 
> Please see Documentation/process/submitting-patches.rst on how to write
> commit messages. Please use imperative language instead of describing
> the changes.
> 
> THe patch LGTM.
> 
How about this:
"The cached drm_edid seems unnecessary here. Use the drm_edid pointer
directly in the plug stage instead of caching it. Remove the cached
drm_edid and the corresponding oneliner to simplify the code."

>> the panel structure and refactors related functions to use locally read
>> EDID data instead.
>>
>> - Replaces msm_dp_panel_read_sink_caps() with msm_dp_panel_read_link_caps()
>> - Updates msm_dp_panel_handle_sink_request() to accept drm_edid as input
>> - Removes msm_dp_panel_get_modes() and drm_edid caching logic
>> - Cleans up unused drm_edid_free() calls
>>
>> This simplifies EDID handling and avoids stale data issues.
>>
>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>> ---
>>   drivers/gpu/drm/msm/dp/dp_display.c | 28 +++++++++++++++-------
>>   drivers/gpu/drm/msm/dp/dp_panel.c   | 47 ++++---------------------------------
>>   drivers/gpu/drm/msm/dp/dp_panel.h   |  9 +++----
>>   3 files changed, 26 insertions(+), 58 deletions(-)
>>
> 



