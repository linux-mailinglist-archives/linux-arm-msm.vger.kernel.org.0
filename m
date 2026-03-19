Return-Path: <linux-arm-msm+bounces-98696-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yP+TCJTGu2n1oAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98696-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 10:49:08 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 84F6C2C9030
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 10:49:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B164630DB416
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 09:39:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 401443B52E5;
	Thu, 19 Mar 2026 09:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HP4eVMtV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QZmiZJvX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81B773B27D8
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 09:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773913173; cv=none; b=rytXFjaTsv9SIhWDpO/TE7miKbr4RDqk2LxKseuF4Yxo9tTEt2kynpqIBLcV9Eo2dzgB2JYNx4VOb3qO5l3IRgEuEzS2jXx86d5Nsbe5r6yRot4ipcLtXVKgioqmWS9qhivE4Y3c/HUiVUVqf2FB4AAXwX2der3gSsBDjvRMjS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773913173; c=relaxed/simple;
	bh=JjicrlBfk9QqFJ2kpdakwIDVXV7/i/EQrkfucEboEHA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eJxXxVwSmkj7M5cH3xxxxA1L9HsRSN9CznRvEXOBkx5rUaV/PrPyObGZQVM0gZI4mKmFiYCDQNgC0lW6jOAyTEF5qImK17/fflhxk+9sX+DGE1dpKfarzxsCbFUGIf9eeaPJRcTXBt82van3LS2ItkpA4ENaM28bzzdR6CmHooA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HP4eVMtV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QZmiZJvX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62J74QNw1772036
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 09:39:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bZQ1JZfZf0V3b2o9DsRkzjevaQcj+BM7BVANfXVI76Q=; b=HP4eVMtVTbOXWsW+
	nppDM8gMWfMyYCFG790YVY/aoyqToC0nn/4cqmpT1zlrOskNWyVYJMxfWBT97P2+
	6Q8X2GxNGWdzfHmaTdYZruseS9jlv0AkzcbUkxgAAokTrfxhL2gZpMuJqD31lnxl
	dbashY0pDeWFkJIEa7fWm3XKbuY0qdc++xecn1XEwI3LGdcJe3fuv/CazC/H4vPc
	m+cBp2JGk4lVNt93adVBt1tNl+nhXmopwyHo/lmSI36dYppfQ4xhI0+zSC65H+Me
	HdCmPc+LP6qBcS9zj8JUGyqODRZ1uZaFtZU/1Uz94lNpVK90jdbTNjtg3AkHFmAq
	nULnfg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyy75txth-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 09:39:30 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-89c49436edeso7727016d6.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 02:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773913170; x=1774517970; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bZQ1JZfZf0V3b2o9DsRkzjevaQcj+BM7BVANfXVI76Q=;
        b=QZmiZJvXktQA2unJNg5vAzO7A0/YUgbhr7urnZHsKO2JUOZ8DxA+fyMXpM/QW2rKq+
         OTWVDTzfrfAdr8yI7PnnDSjOWnwkoAqzK7cVMIr+ds5N49yFPcL+Nm1Wee6H9O53Pyq7
         9O54Z3oMZowcYfnSt9aZ6aJ7QNJMeYwtJqlP3G2EH6WLIlPcdOJ/lyYjXjsNQeRDsLkd
         TFGi0ZIsX1CnD/JSiXbMU95d6x82SJi3QvLo9RPiTUjLHY11saGkYyUzYHqQGzbKi+GJ
         GateDWrQEPkPhMJxRUZeEWj7uTPYElNj3Vx2fux5XOeW3cav2jEbvsxhcPgJ4JOr5atd
         eltw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773913170; x=1774517970;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bZQ1JZfZf0V3b2o9DsRkzjevaQcj+BM7BVANfXVI76Q=;
        b=HtKR8igpx57a5DjOF6EAXih3N1DqlegFJ4JF+H4N2PdX7MKpswkQ+ylfDflF+uRJ4x
         BWdm6Mm5dOAjttHSWsdk8J1oyQS/DjgCRg8sIaQrewTkg2AtYtU+oWu+EHWA5q0z/DeE
         lrek8Y1U6RneOJ9GEvzpB9f3aCwrbb8QCHBK/xkaWV4PFfP/2BLv5jzHCEXMcYgI44DC
         R4GP6Ab0ousCy8BkoQiTquKcRqHQZGiBXXBZUfc/sQV2RHgqJQwfUUMFAqzhCvJBDu0X
         WM2gbVCg2lrnq5Udg7Z8dN8GYkQe7t5U8qm+Z6oK2HS6z7//iowSrYqTEgkZS7h+3l+J
         HvFw==
X-Forwarded-Encrypted: i=1; AJvYcCWcwk/e0+sCCFzSpZGnV8Xr1Si53DTGYyaa5NS8H7pQNgEI4YxAER8ZjLR8yx5eFzHc04pY32FKyphPZnFK@vger.kernel.org
X-Gm-Message-State: AOJu0YzvxsqKfYX0Bez8AO0PwY2u52CbT28WYRDCz80UPEL6HEOLuwmF
	rckk9EkhsjAStedjDMXy4OapE4FuENnXhw/r64NiipcaAMELZNtAdGVYPoSW/dQaffgssSSwKt3
	hlVvQbZ79a3/96xOWibdblUp2hu2yesMw8URIpSwfQC8Dcxn6ZXKcH4JnV1jlhg1hs2Cg
X-Gm-Gg: ATEYQzw4H64yHEc7EOhxGPZplDWQonM59aLaG0JjW52qzZ//lKMxBqUnWzauRDzmiO2
	JrNMnTJ8kbljGMGv1XqKvz7nrq56DFLum+Gk4CGQjTj+smfjUVl5GwHmcsJ8KTvQXZxKevifUkS
	OHPzSz03gSUgon0NOLJLRcYG8v5MOz+3Kyc5bfP03yiFRRhrSR1MTjd2Np0XthSZAZOeIv1y6z9
	PEeyk/ocp4H+iBWpZGlIm3rwDIMtWug2e2YkwysDUHzJxhp5TQBV1Al2BYgwIHb5OPQ0Ho9mkka
	nUe1tnwpFhXxilvwZRy4s5i1EaMJVrDHLqilOg6QxqZ9vvQsqe2jfcexJaRT5WbDtcuWFaeVK+9
	jXmc3uKxaUVkJkIspzxRWihpkTFhLRao4aBAPnJILF7U4YIeDuB8LgiRXTJL2hxeSLWFBJgf0TZ
	Pp8G8=
X-Received: by 2002:a05:6214:411a:b0:89c:51d0:20df with SMTP id 6a1803df08f44-89c6b5bfd2cmr73428346d6.3.1773913169749;
        Thu, 19 Mar 2026 02:39:29 -0700 (PDT)
X-Received: by 2002:a05:6214:411a:b0:89c:51d0:20df with SMTP id 6a1803df08f44-89c6b5bfd2cmr73428036d6.3.1773913169232;
        Thu, 19 Mar 2026 02:39:29 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b97f13e989bsm429275366b.11.2026.03.19.02.39.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Mar 2026 02:39:28 -0700 (PDT)
Message-ID: <7d31ca0e-063c-4cae-be82-41f5f80238a6@oss.qualcomm.com>
Date: Thu, 19 Mar 2026 10:39:26 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] drm/msm/dsi: Add support for RGB101010 pixel
 format
To: Alexander Koskovich <akoskovich@pm.me>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
References: <20260318-dsi-rgb101010-support-v2-0-698b7612eaeb@pm.me>
 <20260318-dsi-rgb101010-support-v2-2-698b7612eaeb@pm.me>
 <5b79ccbd-5c75-454b-8b3f-812a6c59157b@oss.qualcomm.com>
 <pGJabrbuMx_tCkcjrvUESbgwgvwGXDQYJ3czHFEWSDDVv8ugukIWOchF7uV8D1Ns1WI4O9OKDBeKdOW4I83uD7ZfwX58k0EpxHwVVgcnSIU=@pm.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <pGJabrbuMx_tCkcjrvUESbgwgvwGXDQYJ3czHFEWSDDVv8ugukIWOchF7uV8D1Ns1WI4O9OKDBeKdOW4I83uD7ZfwX58k0EpxHwVVgcnSIU=@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDA3NiBTYWx0ZWRfXxMifHBBvqFoW
 8Zs8HD7xYiHevVeFamYpWcnfYbLIA7s3Y8R+BBJ+6Vu6KERtihdo66VV5U16D/+XbsXW4Ps+Dxd
 flNe+EZ6r4lvHHCK0LoZnTcv2oqBVsN3g8vpRT12kEYNECgrqvaE+b+PQdN6A8yfgTe0/s0AcAA
 Xt5aOMv3bxeLmFqie1ha5160yyKu+VsdkhZDPWON+vgKTj/1J+MFfqmFx20TkZg1FEPBTG2wwTE
 Y7lP3aCsLS+dxPct5Dhrq/qbg2kOBRT2aQBjwV4zKWA8J4/R62rqpA8Op4Yi4rfJKQ+sSmzLtFT
 Hheyty60VwZrK9yLWwUdo8tAYj0CcN0yNOGhGnhx/AxTIrbfDp6AmqThqVsOOFITTbvA2yJ8im8
 0qoq56SLssGNXdfmRsznmraaDhMqfWB5wGLVr0x5ta6SZYqvwAiyESSQHzU8+aZPc5I56/rUTPM
 AdBSHJAs7oj/4GNVSvQ==
X-Proofpoint-ORIG-GUID: 1tCafGxu08u2TjQ_-VmJ2yS37PH0Z8XX
X-Authority-Analysis: v=2.4 cv=A7hh/qWG c=1 sm=1 tr=0 ts=69bbc452 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=tXHaASYRl17ePNmWAmoA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: 1tCafGxu08u2TjQ_-VmJ2yS37PH0Z8XX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 bulkscore=0
 suspectscore=0 impostorscore=0 spamscore=0 phishscore=0 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603190076
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,lists.freedesktop.org,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-98696-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pm.me:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 84F6C2C9030
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/19/26 10:25 AM, Alexander Koskovich wrote:
> On Thursday, March 19th, 2026 at 5:10 AM, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> wrote:
> 
>> On 3/19/26 5:00 AM, Alexander Koskovich wrote:
>>> Add video and command mode destination format mappings for RGB101010,
>>> and extend the VID_CFG0 DST_FORMAT bitfield to 3 bits to accommodate
>>> the new format value.
>>>
>>> Make sure this is guarded behind MSM_DSI_6G_VER >= V2.1.0 as anything
>>> older does not support this.
>>>
>>> Required for 10 bit panels such as the BOE BF068MWM-TD0.
>>>
>>> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
>>> ---
>>>  drivers/gpu/drm/msm/dsi/dsi_cfg.c             | 8 ++++++++
>>>  drivers/gpu/drm/msm/dsi/dsi_cfg.h             | 1 +
>>>  drivers/gpu/drm/msm/dsi/dsi_host.c            | 9 +++++++++
>>>  drivers/gpu/drm/msm/registers/display/dsi.xml | 5 ++++-
>>>  4 files changed, 22 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.c b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
>>> index bd3c51c350e7..6a7ea2183a3b 100644
>>> --- a/drivers/gpu/drm/msm/dsi/dsi_cfg.c
>>> +++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
>>> @@ -133,6 +133,7 @@ static const struct msm_dsi_config msm8998_dsi_cfg = {
>>>  	.io_start = {
>>>  		{ 0xc994000, 0xc996000 },
>>>  	},
>>> +	.has_rgb30 = true,
>>
>> I wrote a patch to determine this at runtime, and only after I was done, I
>> noticed that we can already achieve this:
>>
>> bool msm_dsi_host_is_wide_bus_enabled(struct mipi_dsi_host *host)
>> {
>> 	struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
>>
>> 	return msm_host->dsc &&
>> 		(msm_host->cfg_hnd->major == MSM_DSI_VER_MAJOR_6G &&
>> 		 msm_host->cfg_hnd->minor >= MSM_DSI_6G_VER_MINOR_V2_5_0);
>> }
>>
>> let's perhaps extract this to a msm_dsi_host_version_is_gt(u32 major, u32 minor)
>> or similar
> 
> That's what I was looking into initially, but V2_2_0 (0x20000000) is numerically less than V2_1_0 (0x20010000) so didn't think I could do that.

It should be v2.0.0 (0x2(zeroes))

v2.2.0 -> sdm845v1 (unreleased)
v2.2.1 -> sdm670 and sdm845v2

Konrad

