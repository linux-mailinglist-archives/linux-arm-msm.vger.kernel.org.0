Return-Path: <linux-arm-msm+bounces-94910-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oGfHDXyGpWkeDAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94910-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 13:45:48 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D1BFD1D8F86
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 13:45:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5108530B1E7E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2026 12:37:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9063136E490;
	Mon,  2 Mar 2026 12:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aKfCmJX8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G1EqW3mK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C83D36E491
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Mar 2026 12:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772455069; cv=none; b=RlShuDomrInyKjtZ5Bse3uh9JJjeYln64Y+gAfClPas7/pEw/euUU9RDSY+OnS0AeidXLoy1uX11fJWR8iPnhlqpToI80Vp5qq9xk7+yT62DOaooMFBcN6OHagl/t8NqMJKkpm0kxVvZlzJ8tqKkfHC2XL8ZyKVeHENAG9D89Xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772455069; c=relaxed/simple;
	bh=rUzcL/fq9Rt7SWBtHjnWiP7BX7CjXvJruH5Jb2WdC0c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CQfS19rNmYmxzUq4zPOl9ccGMMVHcQowCyBaGcTXekC1b84tRslEo/eo7GkOcd5yeRbzXF8b4a6JyPVw2hIehQSGN0R9pVjg5N7o6PHxoiaSbyGurRGLUYG+K/pAKL8eeX1kf19b0pT0wNYHqX78EGmH7GQpTrXOw79KQ8jIU5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aKfCmJX8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G1EqW3mK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62285XwD662209
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Mar 2026 12:37:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sO1O0HnBKgXh8P/GdR5RZbvHGAU+mD3+U6BgHrGW0lI=; b=aKfCmJX8+azn10Dl
	GgGmRQHRtOwbvTRlrqeBpR4glc6Wg3z0c8XlucLgURJsMlt2bia+FS69Ty50ue4J
	9dXNMnu/99GZeLzPMwtsn04/yB68ZrDnAy+DaWxwZxiRD4sx3DXN+ZLmnbSIUJnt
	UZNGK3fvUYMgEQKpqTrQyscy73YFZLbd+royecFcJ6/MXFWxYYTvdHblbGvOefRY
	MK5N6Q/M9Zof7fNfIn8IwepXv6EI2a8mN/zcFNfOVqyLkjlAUOiHZK3qszH/XolO
	2zHyWSNrUhiKsH01TCYmH89vhVTgu5w9r4xq98OLg+xg8BVj+XLl+s0g3blHar9H
	qfQPNA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cn6r2s081-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 12:37:47 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb50dfd542so414850585a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 04:37:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772455066; x=1773059866; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sO1O0HnBKgXh8P/GdR5RZbvHGAU+mD3+U6BgHrGW0lI=;
        b=G1EqW3mKCLFuNdcLoir74HPzbekOxtYVimThnBhEXojVqOgkAA30eYSgyxtf0V8nLy
         UlQU4PDF3R2u+cW5m7HLbhQZ17YU9erAEo0AhZMeR7Iayb+R5xaBvDEqfDMGmHNBV8Pb
         BGUa7MzvFQGOAWyM5v6h59elolpIbPNn6nsNPJnzc3RQhaL8cfeX7kXx0nT4drjKS8qk
         tBg9tL9EnXxD5yupLbH1FL3JYbskhG4cPYGstNdXWSveKMTSp2IjOc6ZBIjabq+OOfkY
         OGbwSMm99Fu2tNOu+OqM0fXlRA+H97dNPqN++J6k36MfwIb4wfBZvcaXOBM/+qNNwowv
         MXVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772455066; x=1773059866;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sO1O0HnBKgXh8P/GdR5RZbvHGAU+mD3+U6BgHrGW0lI=;
        b=CabbIUEqiGJHU6/s2CweFmvU1INAeBcO5+qs86VeBocxC+D0yWDMR2/vnGqHCAFSpg
         /fYvLkTSaD8kG7bjMOD9jGus9BwWSFUPwgi64PKEvIldm9tA6uz7LCjjvV3B4MXWxMZu
         9uws85BMwFst85I7XoWM9NZKuNhBULTcLF8HWtFL3QjFxxC9gRctYQR+O/AnsRaJVDXT
         +prZIXCaZWD5qO7ott+w3UtxUFNPA03qEHkU1NytL24jV9pAH5bQo64H4pKBxms1/X+/
         XWGArusYTiAQ2HD0U0qo+uPhc+YkWt/W7ur19mwgfj3/k08pGcxFiBabHr4ZNSloF+cc
         1y4A==
X-Forwarded-Encrypted: i=1; AJvYcCWcRyFN9/xDxFDn8R1E4veW0dCSq8LMg8JJZxq3irOxjvXHTBvXUOjYrGFoV1ZrQ3l9awcZq3U2wCu+Up1N@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+Rd50N4ZmnPeykr9B7xjh2LHI21YyCwFob22H5LIOulTu8wY/
	La0rWcjiL2Djor/vRs1rwrV59neQ0Qfi2IPzPcovgXk5341ZTY86Ai7pcsLGKbFVPL0qQa+dSzU
	uD3cQLMegR18MApS/cdLQ6wNeMD+/8WEnekXwjR8AljW+x1chtz7c2mtHHSAY09Bmbt7x
X-Gm-Gg: ATEYQzy5HWNkqzCq/i3YMy/VRXdUoay72OzIHVACG+RUqPtevT/hdk98q50RjNe8Z0z
	06kVpMKbwfEA209LAZb4fztMWq/NmAnM9MH0ZaItS+mHRIQV/ifLC2gBFzQfZ7sV98417IXjNqP
	p/6DTfwm3LhHL6a0hMlTfv4ftlolN9H/WOMpW7iUkb6f+kxw+vB9qWh/q40LgHlH++SnZz/H8Lx
	6mh3W2zhfyPklIs7B34LCuArX7OGvgzuMDepH6pXjTt4BoSd5R+fwMatTkCoL24iI0iropVzNCM
	132gnD7QMfLumguD/jym1rgo4pvqMTlLDuqHYq4BlQrWTvJbWeIDCF/zWkHe8C4tckaPRIJmTIJ
	LUWkJiZmGf0bLwydNvxbz14IfS3k+e4r2RVDWn8twq8ntduomZW+By+Tw9ER1k9lRMA1El7ZCF2
	SgjNw=
X-Received: by 2002:a05:620a:1712:b0:8c5:3892:a554 with SMTP id af79cd13be357-8cbc8dd163emr1220871285a.3.1772455066395;
        Mon, 02 Mar 2026 04:37:46 -0800 (PST)
X-Received: by 2002:a05:620a:1712:b0:8c5:3892:a554 with SMTP id af79cd13be357-8cbc8dd163emr1220868185a.3.1772455065984;
        Mon, 02 Mar 2026 04:37:45 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66003d5ca55sm1989820a12.28.2026.03.02.04.37.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 04:37:45 -0800 (PST)
Message-ID: <00ed5c99-d844-4fcf-b4f9-e883938f46fe@oss.qualcomm.com>
Date: Mon, 2 Mar 2026 13:37:42 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] drm/msm/dpu: simplify VBIF handling
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260227-drop-vbif-nrt-v1-0-2b97d0438182@oss.qualcomm.com>
 <385d044c-29ef-44c2-9faa-0c306af44772@oss.qualcomm.com>
 <odvdqfomdfiyl34ftovpc4pfyrdhnol76qbufa32axpmsvvizb@c3oclvxz72am>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <odvdqfomdfiyl34ftovpc4pfyrdhnol76qbufa32axpmsvvizb@c3oclvxz72am>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: aTSL5333EfTQr5L8LQuTKi9dBAYkWeIo
X-Proofpoint-ORIG-GUID: aTSL5333EfTQr5L8LQuTKi9dBAYkWeIo
X-Authority-Analysis: v=2.4 cv=Hpp72kTS c=1 sm=1 tr=0 ts=69a5849b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=M2fHq20qpG9OoBxEoUIA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDEwNiBTYWx0ZWRfX0C2DoRTqwS3R
 bTaCgSSHN7F9ZU8lReZ7kcaeGEkIryF4/4UWgGc2jVzJB8lXtN8C9uBYsfg/H5VVVzAfXYSF6Bh
 k2t9O9mKjwg6TciewPc76KHoJ13kCTwopRlAR3TC1qrXgdoanGf55OMEafCzdGvSVZx45u1xl8u
 UpVfDWLQsrWdz4oGUNiu36KQjmwXy6LLO2jrmXk9gMjlL4sWvM736CbTgUD8YNW3i+HWiWVBaNy
 TItauQD/L2csSUi0jv14j7aOev4ItiXCr3bbtYv4OHqRX/oGIijT7nwKerj94m3m3/C+tCkhGyN
 f0oDvbSi+nqDeGSEgEzngDsHLlpSAA3D/LrR9XIdQRRrXOQqHKm5i3PErV3gsB9MIF0fM6eFMn5
 ShzJPuYLrVu/hgFezlKZWukisubSGHll+IOE5v0keMNL2E2sof1nUqNJFSrZP9UqngxB37fNAuM
 A7ByEaU4l/XCaS5edqw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_03,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603020106
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-94910-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D1BFD1D8F86
X-Rspamd-Action: no action

On 3/2/26 1:33 PM, Dmitry Baryshkov wrote:
> On Mon, Mar 02, 2026 at 12:58:42PM +0100, Konrad Dybcio wrote:
>> On 2/27/26 7:36 PM, Dmitry Baryshkov wrote:
>>> Once Konrad asked, what is the use for VBIF_NRT. Answering to his
>>> question revealed that it's not actually used by the DPU driver.
>>>
>>> There are two VBIF interfaces two memory, VBIF_RT and VBIF_NRT with
>>> VBIF_NRT being used only for the offscreen rotator, a separate block
>>> performing writeback operation with the optional 90 degree rotation.
>>> This block will require a separate isntance of the DPU driver, and it is
>>> not supported at this point.
>>
>> (in case someone interested is reading this - patches welcome!)
>>
>>> The only exception to that rule is MSM8996, where VBIF_NRT has also been
>>> used for outputting all writeback data. The DPU driver don't support WB
>>> on that platform and most likely will not in the close feature.
>>
>> Unfortunately, it seems that way. Fortunately, it seems like it's indeed
>> isolated to MSM8996.
>>
>> This patchset is tearing out a lot of abstraction (which would only be
>> useful for that SoC though) - if someone decides to work on it, do you
>> think this should be effectively reverted, or should the NRT VBIF be
>> instantiated in some other, more locallized way?
> 
> I think it should be added as a separate vbif_nrt, added and handled
> without touching the main catalog. The main difference point, xin_id, is
> still in place, it will be easy to add dpu_kms->vbif_nrt as a
> first-class object (instead of forcing the complexity of
> vbif[VBIF_MAX]). In such a case I'd prefer if calling code passes VBIF
> directly to dpu_vbif_set_*() functions instead of passing the index (or
> it might be easier to have a separate wrapper around those functions).
> 
> My opinion is that if something isn't applicable to 99% of cases, those
> 99% should not care about the remaining 1% usecase.

Sure, that makes sense. I wanted to make sure your opinion is put in
writing for the aforementioned "someone comes around to hack on this" case

Konrad

