Return-Path: <linux-arm-msm+bounces-47457-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BBA6BA2F4EA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2025 18:14:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 807F93A636F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2025 17:14:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44BB8256C69;
	Mon, 10 Feb 2025 17:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fbjQTyxB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E1F3243962
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Feb 2025 17:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739207647; cv=none; b=t3KSLdu6gbskz4ZwRy3bxZxYY/YDDkj46ZnnMZJ2AiyiFcBTGBscGpgQn2L62r5zLYsY5VXCv7JoMcta62GcR3C9zI5+2EteJiwSrOGS7acmNfw0AKWL3kn7nyhczVqXR6QyLVHVZ8ZdLzi42w90j4UkmAri1mfs1vDSPdt1Xwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739207647; c=relaxed/simple;
	bh=Fm+orapG4rfAJOK+GFT9MUohZDljqN9MQzwmEB9/a10=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ODG6pTrrwTt81uDHBWtotOgyE3I6X5IyNgz+/pflCHR62iSsuaqEegHqwI6npf/FvXVGgfjMaQo2PNhjexgiUSN1a2zlY4OEfGQUqs5uZ8YV/tfSPVx01hXRDbaRWWhsErmTb+8CjfDd3mbqbEqIK+StuWVBF3YxLCq8q4NbPpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fbjQTyxB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51AF22WP010515
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Feb 2025 17:14:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6sjOR6z6v+mTetpVJ4WzBGP05uwtgK5FJrf+rIzcNMg=; b=fbjQTyxBaibS1gkO
	ICidlf31EstiVtBDaFVe/l3b3FaXIUK1QpwnqmzBFiyQ+LLz8Jp6H54lHxOhgrZK
	sHzlodraMWDoL5EwyaVmob960NMZ4r5RDASt+DK9pRc4Vp3ZyDmi9cZsJcakk5Fg
	9BsKHbynm27/4YG/dKvBVViJUYbQBgaxS6OIta+dL5xBOJYwqqJ+RyFDqwDaGj2T
	deqYfTPs2JpObR/00j3x1xuGFthbjVxqHuLGaJOOwjQHWRGpzqFVTYPiJzNMJeRC
	2V++PlJOkHRlstH1cw+lMIccjoTBPxnjNCpmaAT3jtxR/fXjrQ9yQ8Jb6x1Z8ISS
	HBvAZA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44qcs59pu4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Feb 2025 17:14:04 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-46e78a271d3so7348181cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Feb 2025 09:14:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739207643; x=1739812443;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6sjOR6z6v+mTetpVJ4WzBGP05uwtgK5FJrf+rIzcNMg=;
        b=bezbhHTvDzL+XguWKn+3EQdfccKdLLg4ea1pJ70g8ftvL6LGzDozYpz/928PmtEb1y
         4RcXbcV840I4XoGrPNDw+2pD4PrVrH9GbrAfBpZBo7tLCJL3pVbkWo7nCnoXzcjYnVSR
         W5Yu1uBlvzxICJ6XlSdF/9zK3ntoHACQWXs5OFD8e9rHBTbkrAjx4XOdG5+MxQvs3Cm7
         nZoCphzwKZvhp7DtFgWbb4J/4ELtmSxUeF5icPBDWx736QIDBeGfrJTpQT2ZppH2AL6z
         BCAOBZBrPM0SjW8MCHBnTnNkgr7JKZ00BtqflRTCDnX8W9hk5J2C96H/0C27kh5Mc1bp
         tiVg==
X-Forwarded-Encrypted: i=1; AJvYcCUyYi3ozu5V01zK/JiXzPxyn73r/uF/YJ/KuLbDKvxLCjWKk00V/lGNQL0J+jPcXnaJ8DCSx1tUBymy9joL@vger.kernel.org
X-Gm-Message-State: AOJu0YzsJ/uGRbJvIpQodgJMoGFhrD5rIWlkKsuRzUGTBGYCYhwBlkQg
	eKdQm0FBEWo3g9Lnc/H91IhSLtD1lVy3bFxFU1Nd8g3+7UWxgh81A/UFYoCk7E10FJYpu0kaHMZ
	76m/71Efi4Vkk8KN8xSXaTMGVYwbc1Stpm5vPKMepLdMyJrv9HuxOZloB3GTH6wSu
X-Gm-Gg: ASbGncu/3kO2HOLxl3lOHHMbYyG+ale6jwh9GLmJeb/X0rzbiF85fCaq+Ngh9UqqzoJ
	Rz3RTBqsXv9fHJh8afMRt5VZz/vM4JVcchwfmwaa3Bn7IkUfib94Vfa1tFbQXQFuJ3H6V/ql7Wb
	CYOMNWvBVbfEmKbfNS6Atc5DZ3v75os0Jwk1z6EfBQ+B4PpbuLOWY+uWKpbOUEozaWpaMOrQnVY
	QMizaAlEzNXPxbobGIeY3pwXeuuJJYjoCVRb3eZNTe/7OKvX1XmVWugUmAfTKscwlXUIctKQbtp
	9P2ZKm87eg90B1inxk2B8eBzmIfWqfneFPr9Os1wlHx4a48BL0FI43WZuE4=
X-Received: by 2002:a05:622a:15cd:b0:471:962e:230e with SMTP id d75a77b69052e-471962e3331mr22527861cf.8.1739207643267;
        Mon, 10 Feb 2025 09:14:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEi4E2WXK1hxulEOeIEXVV83zhvwQMZX4si3KkAFpo5HoNgR/wjuGjLHflACJQGG5nJzbk4fg==
X-Received: by 2002:a05:622a:15cd:b0:471:962e:230e with SMTP id d75a77b69052e-471962e3331mr22527471cf.8.1739207642803;
        Mon, 10 Feb 2025 09:14:02 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5de5f3f92ccsm5041174a12.66.2025.02.10.09.13.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 09:14:02 -0800 (PST)
Message-ID: <e9ab55d7-bd2b-4241-bd40-322c2beb97d9@oss.qualcomm.com>
Date: Mon, 10 Feb 2025 18:13:58 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] drm/msm/dsi: Allow all bpc values
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Danila Tikhonov <danila@jiaxyga.com>
Cc: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, robdclark@gmail.com,
        quic_abhinavk@quicinc.com, dmitry.baryshkov@linaro.org,
        sean@poorly.run, jonathan@marek.ca, jun.nie@linaro.org,
        fekz115@gmail.com, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        linux@mainlining.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20250203181436.87785-1-danila@jiaxyga.com>
 <20250203181436.87785-4-danila@jiaxyga.com>
 <rnuv4dieiy6s6c5s33hff7ntr6hkneemsq5qzk3u4ug2abwisd@6ahmijlayhhr>
 <bcba3d38-525e-43d8-936f-2ddc95d0cceb@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <bcba3d38-525e-43d8-936f-2ddc95d0cceb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 15501ILvwZgFpyRn3E40qVgpkDm7BRKg
X-Proofpoint-GUID: 15501ILvwZgFpyRn3E40qVgpkDm7BRKg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-10_09,2025-02-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 impostorscore=0
 mlxlogscore=999 phishscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 adultscore=0 clxscore=1015 mlxscore=0 priorityscore=1501 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2502100140

On 10.02.2025 6:10 PM, Konrad Dybcio wrote:
> On 8.02.2025 11:09 PM, Marijn Suijten wrote:
>> On 2025-02-03 21:14:26, Danila Tikhonov wrote:
>>> From: Eugene Lepshy <fekz115@gmail.com>
>>>
>>> DRM DSC helper has parameters for various bpc values ​​other than 8:
>>
>> Weird zero-width \u200b spaces here between "values" and "other", please delete
>> those.
>>
>>> (8/10/12/14/16).
>>>
>>> Remove this guard.
>>>
>>> Signed-off-by: Eugene Lepshy <fekz115@gmail.com>
>>> Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>
>>
>> Should this patch elaborate that those "DRM DSC helper" don't have any
>> additional guarding for the values you mention either, i.e. passing 9 or 11 or
>>> 16 don't seem to be checked anywhere else either?
>>
>> And your title might have space to spell out "Bits Per Component" entirely.
>>
>>> ---
>>>  drivers/gpu/drm/msm/dsi/dsi_host.c | 7 +------
>>>  1 file changed, 1 insertion(+), 6 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
>>> index 007311c21fda..d182af7bbb81 100644
>>> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
>>> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
>>> @@ -1767,11 +1767,6 @@ static int dsi_populate_dsc_params(struct msm_dsi_host *msm_host, struct drm_dsc
>>>  		return -EINVAL;
>>>  	}
>>>  
>>> -	if (dsc->bits_per_component != 8) {
>>> -		DRM_DEV_ERROR(&msm_host->pdev->dev, "DSI does not support bits_per_component != 8 yet\n");
>>> -		return -EOPNOTSUPP;
>>> -	}
>>> -
>>>  	dsc->simple_422 = 0;
>>>  	dsc->convert_rgb = 1;
>>>  	dsc->vbr_enable = 0;
>>
>> This seems supicous on the dpu1 side, in the original DSC 1.1 (not 1.2) block in
>> dpu_hw_dsc_config(), which has:
>>
>> 	data |= (dsc->line_buf_depth << 3);
>> 	data |= (dsc->simple_422 << 2);
>> 	data |= (dsc->convert_rgb << 1);
>> 	data |= dsc->bits_per_component;
>>
>> The original value of `8` would overlap with the lowest bit of line_buf_depth
>> (4th bit in `data`).  Now, the 2nd bit which will take the value from
>> convert_rgb, which is already set to 1 above, will overlap with the 2nd bit in
>> your new bpc value of 10.
>>
>> Can you double-check that this code in DPU1 is actually valid?  I assume you
>> have tested this panel at least and it is working (worthy mention in the cover
>> letter?), this just seems like yet another mistake in the original bindings
>> (though the register always had a matching value with downstream on 8 BPC panels
>> for me).
> 
> It seems like the lowest bit should be set iff the input is 10bpc, the
> current situation where our '8' bleeds into the following (correctly named
> fields) is bad.

See also

https://github.com/Wikidepia/kernel_xiaomi_santoni-4.9/blob/master/drivers/gpu/drm/msm/sde/sde_hw_dsc.c#L67-L80

Konrad

