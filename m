Return-Path: <linux-arm-msm+bounces-76050-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 80AF3BBDCCB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Oct 2025 12:52:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 15AD83B3738
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Oct 2025 10:51:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1692A26F477;
	Mon,  6 Oct 2025 10:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WUcwFQ9S"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EE98275878
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Oct 2025 10:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759747802; cv=none; b=BOmHsIpFUSOK0uYXaBLsbXL9f4p36YxOSWccJmLIZWoQEkGyzXpGKbkpdBGZHNy99rTkhyivAyZ5U9gBwlOYjYXK/j29kwtWEUwzrgusgdsCZCu+YA5FMke5UTs2tKC+nNJZY6aHU06HfJz7YBjkymAxW919AJgZSvCY1Nb8/kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759747802; c=relaxed/simple;
	bh=nmQN2Ai0HjcSSzO0mxJrOtxVVNPLmWCIRBsAC/F8dB4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ClQrpv2lmc25uBpFXiYBSJjUgVH0Ih3Yw8GNNKx4m8yYj5ZwGQ7FwmqfKGrufZcoJaAieKYDlNXJE/MfBX5xcOnTyQpAFL4PJ/tSYLOQ1YVg6UnndNisoAAB08ZuCQDpARy7W1Aav8oYdwRfXsPyuakyb58nec35M5fKNGuNq0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WUcwFQ9S; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5961V753012086
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Oct 2025 10:49:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IN3CVmizwhnegBcGc3ulurAszyJXyt4uRPeWQ6uV/vI=; b=WUcwFQ9SMmiTZbx2
	NCNeZ1nWtZj9SZeY0FBSxzXMH2IzPbeI3uKZPRyDG5mIBhrMbs10/bHJuffXN1S6
	48ULwM2+mereT1CMxjpteWfk2W6DE7SpPaMQsKBSaw72XyizRA1Vb59NKoU3BYF2
	kN/HEYqbQueAvdOe+N8mgH21IY8fPnz6c8f/WGVRE8w18TQTDEZPzYlp5pOUh0lf
	zq+LbL8Whz/R/nlEOxyrky6T8KZI+AHAWTJxHzZr4qHilz/JFh5CmyACSz8HviOr
	Spq4Ys3qsT8/OfP0FULlcV0FUoOP+wws6TueECzH/vCxhsEMrC864LP8WoN/bm5A
	MH9+MA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jrxn3um0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Oct 2025 10:49:59 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4e015898547so8624181cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Oct 2025 03:49:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759747798; x=1760352598;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IN3CVmizwhnegBcGc3ulurAszyJXyt4uRPeWQ6uV/vI=;
        b=Fq5G3PFeeHCMI/VAoaW1uVsgS+ZL74uplI21WcnUgVJZHaZEnFKMpzsf0V6nopRLtO
         bMZfyz5b/+oygTmVdnwWF6D1Wga1qFOLkjRzYh9cT6uNjz/LNyzwx8OLYoQ0gHZxPk6w
         5CWHwEsFWq21vBtNDywpnFJr/we4Tz11dmpGnxjGKw8Q1X3TBsuTOFxL1yRpODJkEdfy
         b0x/pYvetH17xaNE4sY/y3CgD5AgvqOXzi3gghje8i3SdNMc3+BteBYEnd1mwnGFHiQ6
         J1VnRZRzxbjhNeORplP6VSv46Tx7c4XnpQlKYQThiEyJ7yy+SJloYmHKgnYsQ9jIYG2m
         q8Dw==
X-Forwarded-Encrypted: i=1; AJvYcCWLxb5uzNO0oolahSC5eGAJ9FUDgYDSEHyRv7iT+WO6eUeK7MCfLypNEXT/ASspcT7D7waZPw9bVxnJdSV8@vger.kernel.org
X-Gm-Message-State: AOJu0YyU+yJSZ9i5wVKiYRhmmiIHVI2HsFlaUrIdz0qpeQbVHCtvCnG3
	gPB1bIuT6NtjiY8lwSGAd63TgZ+Rk5XFLt5NnyjNT8iLKEIafQsTpHvwpNz7UaYK+WkUSS5OafX
	aIy8VzOTmaEmYz5ibupJK6CAKSwaQ540FJx5hnICjA90WZVF7Kpl9bpaE907qSNUQUx1K
X-Gm-Gg: ASbGnct8u9co1i4d4gcBYPsgMbCg4WV8VaYfE0CqXwsuLb6fuqwZJq5e8RMPIN2Bvlf
	FpJ2KxnzAn4COrpYd856DJ/ep+6BlDvPw3XLjmpbjN8MpuRSrxjDMjC0K9WHrZTgTL7XDvjdgQ6
	MwlkvNlrnoJutTc0tQsTMlnCFPsAt/EmWFHQDJCDXWecCyEPxF+Hh4dvTnLCG8kHjrtTPmJYa0y
	7yZZDL7MvtoehnF4N8ywGlE6RpdwlR5XMFdKVimSWwrYIionad95wo+s/Ml+nOd/7IS4ggdmrrQ
	OP2PNfaEQktVg9v+AIsfZpSHRLcNWGE/kdQ26pHDmLutKpWyGjfAZXET7+IbEN6KDEAz1qfz/mg
	FJYSAbtImsYQSRhPgZunJvqNFPwI=
X-Received: by 2002:a05:622a:60f:b0:4dc:fc58:c50c with SMTP id d75a77b69052e-4e576a45606mr94443371cf.5.1759747798231;
        Mon, 06 Oct 2025 03:49:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHSEU8VjnAr3dc4CRE1tKa0vgiLD4zAxaPVFZcAL5lIiyFY/V+S9ZVpzOWmv+pNPBnQHAcwzQ==
X-Received: by 2002:a05:622a:60f:b0:4dc:fc58:c50c with SMTP id d75a77b69052e-4e576a45606mr94443021cf.5.1759747797738;
        Mon, 06 Oct 2025 03:49:57 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b4865f741f1sm1118572366b.39.2025.10.06.03.49.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Oct 2025 03:49:57 -0700 (PDT)
Message-ID: <65d0012c-4c06-4b39-9375-89d635f8abeb@oss.qualcomm.com>
Date: Mon, 6 Oct 2025 12:49:53 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drm/panel: Add Novatek NT36532 panel driver
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Junjie Cao <caojunjie650@gmail.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark
 <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Jonathan Marek <jonathan@marek.ca>, Eugene Lepshy <fekz115@gmail.com>,
        Jun Nie <jun.nie@linaro.org>, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
References: <20251001135914.13754-1-caojunjie650@gmail.com>
 <20251001135914.13754-4-caojunjie650@gmail.com>
 <lfdhib6a7ct36nmj3of2setjft7ydrf6sfgtx7qued7qd56nhc@2xol3grm5re7>
 <e36572bf-4fb4-425e-8d10-c5efa5af97f3@oss.qualcomm.com>
 <rxm67cbwkp2qyxdlgqb3fz7fhiskmnhidhjvl4mhqn67iq2x4n@wfueruiiq7kp>
 <53aafa84-6d6a-4963-827e-c1600270662f@oss.qualcomm.com>
 <2do3dk7gqvbloocsv46t3zrc4ghvhrpiqre6djk6heese3wz75@dlqwkdsnrkbr>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <2do3dk7gqvbloocsv46t3zrc4ghvhrpiqre6djk6heese3wz75@dlqwkdsnrkbr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAwMSBTYWx0ZWRfX+q8pKygC9cjW
 4QyoID7lB67Gy3St4URrRraJtIqQA2cAHTD5PRXuWv3+XTIL5avBiz9PqINc3l7zOxmXF7gNVzq
 3USSljZ6jqz6kIda2VMII8BJT4ESpfWmVv1d/i6UgqN2+nqz2BESvBJMtBwUUFpLOrHb2McL46l
 ioUuNW3rWBXeJEFmMgQuicYSuyDgwkUG8CMptvxB+MUgOgGFlPN7sMyJFE15+Dfl+dLTgFPXpUQ
 cno+Yy4BltLvVzRh13oGrgwOXXK9t6rWrTyimqKz4VNqebEk9xqlegrjvn0d3HGKInnRRxoIT1b
 VnPrSQAiH0jQLNT8a6fk+XjM/OpazkOWSX/8mEUaCjzIH7Hz3Z0fCRafI7E9uwEBw47Mzhl5s5J
 csIkRQspvfP5s4kb2RpXGG1l+FbvRA==
X-Proofpoint-GUID: W8ho2UYkwO-WHa4Hy-QTo8BrRKKfbokr
X-Proofpoint-ORIG-GUID: W8ho2UYkwO-WHa4Hy-QTo8BrRKKfbokr
X-Authority-Analysis: v=2.4 cv=EqnfbCcA c=1 sm=1 tr=0 ts=68e39ed7 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=pGLkceISAAAA:8 a=zTkMZ0gcjxiqpFU4bxAA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_03,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 suspectscore=0 bulkscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040001

On 10/6/25 12:39 PM, Dmitry Baryshkov wrote:
> On Mon, Oct 06, 2025 at 12:10:05PM +0200, Konrad Dybcio wrote:
>> On 10/6/25 12:02 PM, Dmitry Baryshkov wrote:
>>> On Mon, Oct 06, 2025 at 11:24:35AM +0200, Konrad Dybcio wrote:
>>>> On 10/2/25 4:04 AM, Dmitry Baryshkov wrote:
>>>>> On Wed, Oct 01, 2025 at 09:59:14PM +0800, Junjie Cao wrote:
>>>>>> Add a driver for panels using the Novatek NT36532 Display Driver IC,
>>>>>> including support for the CSOT PPC100HB1-1, found in the OnePlus Pad 2
>>>>>> tablets.
>>>>>>
>>>>>> Signed-off-by: Junjie Cao <caojunjie650@gmail.com>
>>>>>> ---
>>>>>>  MAINTAINERS                                   |   7 +
>>>>>>  drivers/gpu/drm/panel/Kconfig                 |  10 +
>>>>>>  drivers/gpu/drm/panel/Makefile                |   1 +
>>>>>>  drivers/gpu/drm/panel/panel-novatek-nt36532.c | 437 ++++++++++++++++++
>>>>>>  4 files changed, 455 insertions(+)
>>>>>>  create mode 100644 drivers/gpu/drm/panel/panel-novatek-nt36532.c
>>>>>>
>>>>>> +
>>>>>> +static const struct panel_info csot_panel_info = {
>>>>>> +	.width_mm = 250,
>>>>>> +	.height_mm = 177,
>>>>>> +	.lanes = 4,
>>>>>> +	.format = MIPI_DSI_FMT_RGB888,
>>>>>> +	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_CLOCK_NON_CONTINUOUS |
>>>>>> +		      MIPI_DSI_MODE_LPM,
>>>>>> +	.display_mode = csot_display_mode,
>>>>>> +	.dsc_slice_per_pkt = 2,
>>>>>
>>>>> As this is not a part of the standard, what if the DSI host doesn't
>>>>> support this feature?
>>>>
>>>> Shouldn't the core gracefully throw something like an -EINVAL?
>>>
>>> There is no 'core' here. Each DSI DRM host manages DSC on their own.
>>
>> drm_dsc_helper?
> 
> No, that's just for calculating PPS and some other values. It's one of
> the problems of the DSI model, which I tried to solve a year ago, but
> failed up to now to do it completely and clearly. The DSI device can't
> check host's capabilities. It declares what it needs inside struct
> mipi_dsi_device and hopes for the best.

Alright, thanks for the explanation

Konrad

