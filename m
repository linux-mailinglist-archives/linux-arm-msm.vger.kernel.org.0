Return-Path: <linux-arm-msm+bounces-76568-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B610BC8205
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Oct 2025 10:51:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E939F3AD897
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Oct 2025 08:51:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E38632D1F44;
	Thu,  9 Oct 2025 08:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g6asApzf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B52082D24AD
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Oct 2025 08:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759999903; cv=none; b=HRLOaE0VcWO/1ESbswKheuBBhRqOIxeGXMUV+x52UC9OCWOO+hEmW3QFg/y5NOK7cyV6OBljTvLmdG5/nl6vRti9i2U/aQkPyNkPBNg5oVrMK2MkFW3pno1KNws0NZoNsK/XOyUAUW2WppRqZf0hVULy32QTdSrx1CJZ6uYjPXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759999903; c=relaxed/simple;
	bh=QX4v4DxhfkvVUvRBSvFp2IiBTV7+8gg+zeuRWNyVCe4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=An067WM8RJK1hHvPTJJL9QFQgLJO86WBd4fGOeOVG/VzDS3z5OO4HvKb/4yug/ljQkyhdBV8Gi9btJRqUkgK1ktmXyEeDeBPNN80MP1fSqUowAnEC3K8cH286WGdZFNnkn/nK1KEG3QDEX45rmp+hFRyyQcwOEo5yGZL1EECHdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g6asApzf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5996EJ46019182
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Oct 2025 08:51:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rozNwP9rNVxJdTGVPBs6oK2WCT/2tAO/uW1pQSfTVxU=; b=g6asApzfeKmK3zLb
	wl//PB0rnxxAAX8m5sv+CLKGbSipro+ye5sHZr8Z5NIxdtKNP9/TDb9EFWeAz72m
	ejccBed6/GW/q8T72DY7ps+OE4IT8hICP+uHj3ZlapAZ291LsDX6SZTzXtWHIcWr
	H99zwm/DMUKXiIlE1NHBJMKebjumVwQknEGuup3lqjBaMoWuKt6SZEtqmxr9zJbu
	vyoNeFzLoNVXfXaO2sWYHxkN0s1iGDwgFsHpvZ4b68/iu2BCeGQmnfc6LFSZZpEw
	+6myKfy1NMuu7oGtUTB+icHtMBtOfOoW+ka7MKoGbNLvVbYKzt5dSiujbfwqOm1Q
	k7TlKQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4nt3mp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Oct 2025 08:51:35 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-873eac0465eso3413106d6.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Oct 2025 01:51:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759999895; x=1760604695;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rozNwP9rNVxJdTGVPBs6oK2WCT/2tAO/uW1pQSfTVxU=;
        b=Wmj/7tE48uUJEF2xLCQf62wj1rLlvQd4dXwerhLOvElNtCgWgHJPKY6tExrYfT35rF
         V0qgwdG9LX2xRWcQvsJ1QSkIylgvD7rBNLgzoUrTWIjZWSsLzqz4xaFOJ4dX1Gk7hYSX
         UHEm6g4sxkU4HpEooW+MOnVh+KOl56Cgyrl+GZO3LptNL7l0RT6EOEgYW4G6A4HYd7nk
         YWpyIP3W1rx+XqUhZWSgTSxsAhhRXO1mEauyNtwN14V0fC2fL/X3f/fy2zIv6MxT9i9v
         zz8Rl6hM59xnEtNzXOGvRhNRCitYkiRPneO3Ogs5/T6KmmV/5jaA8Aew0l5n7s2Y2olA
         oVCw==
X-Forwarded-Encrypted: i=1; AJvYcCV6STrhDjbt+U5+LAtfeXTjUjvzhNdcZFVRsTR3Zg+7PT04bUM+u5PbYLgDoT7A/Hve8cLkqIKU/460SD8r@vger.kernel.org
X-Gm-Message-State: AOJu0YyxVrZwHjl6fCtTVewyt180Onhhif7aRkSh8lWANb/YCWnGLKwg
	uHihAnsX5yFDdjkDvk+QvORCZdYwfoPB1YSOr6NA8uWg+34+WoqvQ7jnsrZdZOPfgRfrvZTnCkK
	NM5QivxDzd/BWZzKrFHASEu08/lyJYvoyfaSHRUujiUdZARuFB/X12oA1RBL2OVr43Soa
X-Gm-Gg: ASbGncuB/bZEilYIWNs7BmuC1BHOHHpgWu3oohL2dp+TOAIv7upQaZ2znpVc/IjA7mx
	D56lX4HLnHZc2PtBcEWUzxOrPxREc6TpR69GrfxQ7PSAea65iq0sXoNbhM1AMZ31h2phsF7b8Bo
	6hY6nMb6rJlsFU6NZD8vZAkTSgDokreWcrkEYktQZYfiSegKPPqp4a3VUcJwVNOC3UcvG30mmgR
	yhC46I8ZMEYktsx9DnB2fDj3eFtRNfaE8lCumVWqwDGL09SZv0UXozkRSpsTKBz9vYU4GOq51DD
	R0OeJzQe13rM0s/VOw7xhx/tQ55Z9s5kyi+xaXo+lxwZdJoxG2vJvmeSTY0itOvSoaGRUVwrqzp
	mYQlNjJ9YuzC8rHEPcXIXbj2c9wE=
X-Received: by 2002:ad4:576d:0:b0:87a:a954:4073 with SMTP id 6a1803df08f44-87b21027da1mr56827946d6.2.1759999894579;
        Thu, 09 Oct 2025 01:51:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEdr0m1qJjPCGx95tl5+kQQ8Lc5k1Lvq51C86DjFACuanr/UCQghW1BHHi6401yO2k5MyRZFA==
X-Received: by 2002:ad4:576d:0:b0:87a:a954:4073 with SMTP id 6a1803df08f44-87b21027da1mr56827646d6.2.1759999894039;
        Thu, 09 Oct 2025 01:51:34 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-639f40f23f2sm1850757a12.38.2025.10.09.01.51.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Oct 2025 01:51:33 -0700 (PDT)
Message-ID: <74893f76-1b7d-4cfb-ba7a-9fd64427762b@oss.qualcomm.com>
Date: Thu, 9 Oct 2025 10:51:31 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/7] dt-bindings: panel: Add Samsung S6E3FC2X01 DDIC
 with panel
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, david@ixit.cz
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thierry Reding
 <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Casey Connolly <casey.connolly@linaro.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        phone-devel@vger.kernel.org
References: <20251008-s6e3fc2x01-v2-0-21eca1d5c289@ixit.cz>
 <20251008-s6e3fc2x01-v2-1-21eca1d5c289@ixit.cz>
 <7askbazrkbny5jlw6cpxcpjyw5nyiozmksoyj5b5momcc7w5hn@r3x6kddatf3u>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <7askbazrkbny5jlw6cpxcpjyw5nyiozmksoyj5b5momcc7w5hn@r3x6kddatf3u>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: IY3FMouw2HMht2hi2Gp8ccKVl-1upctJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX2+TdnWxMH5be
 FAbSTtrqvw7EIsd0t3LMu88TTxWOGhXX/Q0rWW17CYcb0DKti0iFwhrZYokgWXoD1d0bcr/6DV0
 v5DiCKySwPhVbqd/HxQtm+7a70QaiWJVALxMhfHu14r1fk2ZwNecUxQEp6IW41t/23h330G4wG2
 Es394lEBW26W228fHSaDo5NjopxQfvkUBrvaQHjIvxdeeajXz5f48HRJMG3FfuLbn9EOufZgs6Q
 /uyBENtO/oE5axN6rJdUE+xwX9upS3Ju35UjQVl0rmM81fhJyrgVzmr+5DWdm3PVBcTVKafet+U
 9ZlioGEYrEZ3n45a7RR1OORaUGrB4M/q3CblNZiBbMPKGMkszvti4B8opS7xhoFwSQqMby9U9sy
 16vVM50FcmvE+Q4E1qJ/Duyu0jWVnA==
X-Proofpoint-GUID: IY3FMouw2HMht2hi2Gp8ccKVl-1upctJ
X-Authority-Analysis: v=2.4 cv=b6a/I9Gx c=1 sm=1 tr=0 ts=68e77797 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=LME89Ewccn7mWiF1t2gA:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_02,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 clxscore=1015 spamscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121

On 10/8/25 8:57 PM, Dmitry Baryshkov wrote:
> On Wed, Oct 08, 2025 at 04:05:28PM +0200, David Heidelberg via B4 Relay wrote:
>> From: David Heidelberg <david@ixit.cz>
>>
>> Basic description for S6E3FC2X01 DDIC with attached panel AMS641RW.
>>
>> Samsung AMS641RW is 6.41 inch, 1080x2340 pixels, 19.5:9 ratio panel
>>
>> Signed-off-by: David Heidelberg <david@ixit.cz>
>> ---
>>  .../bindings/display/panel/samsung,s6e3fc2x01.yaml | 78 ++++++++++++++++++++++
>>  MAINTAINERS                                        |  5 ++
>>  2 files changed, 83 insertions(+)
>>
> 
> Please also describe, why it's not enough to use defined compatible,
> samsung,s6e3fc2x01. Why do we need a separate schema and can't use the
> panel-simple-dsi.yaml

panel-simple works for 'dumb' (perhaps a harsh word for 'made with
just the in-spec DCS commands in mind') panels, but Samsungs are
widely known to require a ton of vendor magic

Perhaps the original change was made with an "oh it just works
surely there's no drawbacks possible" attitude, as the panel
was left initialized by the bootloader

Konrad

