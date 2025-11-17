Return-Path: <linux-arm-msm+bounces-82074-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B6DD4C63CF3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 12:29:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6C15E3AE6C3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 11:25:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E328123C8C7;
	Mon, 17 Nov 2025 11:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="myGhlPJQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TR7Kw0C1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49CE92836AF
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 11:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763378743; cv=none; b=uPbXTkOIbLTkGstqBgQtv3XpMLQpgAu47cXhnpuRpH5IZ9Cc/wWMbgQdJBS/hfLlyh0/OTzz1vLbVIrwWzlaaKy7UAI/cx0qjcbS5kVovLixxcCSdV752hytJfMsSHb7manSHQvtzZ67BEUceJI01whYBQmKkziUNNrn63m8SSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763378743; c=relaxed/simple;
	bh=aer8y0iOIWO7MB4rJPgyxwUhs+31aLbbFrr5dox6lso=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ipOch6K7+6zEMq/csCdmWnt5HycvTJ/rzrYypvqkZVwUQQ7WlITsaBFO1ZGzuM07RVXnTjsfA6diRgVe5FgwBkLJxAm88tRTfTi+ZOGFcj9IKddQCo2GYrR2p4wqxtpx0Rc5SExd6UJvEFJlMmlgVw2uq8Q0SbCuoCUt8o6BiNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=myGhlPJQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TR7Kw0C1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AHB2sfd3671302
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 11:25:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DWoPim49AaUbsvQ7OBAsCz7JIUC8pQiq8bzO11oAofg=; b=myGhlPJQcQUN3m1f
	vhojFWveibAK/5N+ThHxznofkP3OsfaU/11houm4nMWY/8HtezzeDju5KtsPBkBj
	g2+1qjNG3lv4H5aEFCD8eF0prlhl6bs7i5YBdiKMGnSJbYBLVML9NGFw6XvgwbuK
	NX9LSNOihJGx69/rcggKgGvDbaq3WgRN6m8nUGn0FIVPe9iKgfESWu3e7AuSfrSJ
	l1nsjZIW6bvAFjW/eNACObI0w98R7naQ2AkKMFh0TZEuPEK27QkMiiuGLgXetXbe
	IulyK68xizJoMCBi0/LRLO9og/AW7LpvMoSvcYXFiyfWYMyogyIzXsQU5TuO0NDT
	EM5+1A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ag2g581vq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 11:25:41 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4edaa289e0dso21169491cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 03:25:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763378740; x=1763983540; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DWoPim49AaUbsvQ7OBAsCz7JIUC8pQiq8bzO11oAofg=;
        b=TR7Kw0C1DMhEvHGq9fO9VP5xboJbBNQdHyz6eqiGF5LLFdWyJ+lP7yN+6/O1jC/Vdy
         5o+A4ZTnPurh2vx5kjaq7/vTPtwC9bAUl2VDWvaw49O0KRQiE50lXAh7guOgD+oL6RJn
         eHg/7tJyl8NBpA+qKUZ4fH4/ErBmPS8UiU0bfLOWyxjJ+DwaSD+XuaWhoZnoYNebax6L
         J6R/pqKK+tDX+zj3eJdJ5eJG8wCTWqPmb6sejep+3oY9GhCtTpIXJkzCOlQrP3FJqrAO
         dmS35IHJJmUwzf/oCNsQbDt8t9OnDErXYD+OL+pOAr1Es4DwoKEe2TbxVeKrd2GSkH2R
         a9VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763378740; x=1763983540;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DWoPim49AaUbsvQ7OBAsCz7JIUC8pQiq8bzO11oAofg=;
        b=iPDFugjHUtw3EobvBTGPakIe8DL/0Xki55vuRS+Lkzt6Il3fVFmPGMjT8AB7yOJ1TR
         fhKw6GAQoXGHZHqNGnCB34IrLkvAqPDkYlbAUqNQECcrPHGsRzdd/mrOmdvO2aeiPLk8
         kISBPJnDw5G6VGCmjCYiNcRm4lvb9PjhBdvIxxkAZJUJuqnFt1zzY5URjAOzRReRqOhV
         +evcuR3j6G/cKKt+1CS1YW9uuhXDe0briSAfmVsPgdjRjv3xTYWr23qe2bypisxxrSEJ
         06SX+GDThcterbjnf4TGN2CmkM2ktdnxMIMIujxrdfr5PDCFvsu0hNXIr0u4j9AhB6ud
         tH9w==
X-Gm-Message-State: AOJu0Yy8c+slAmcUKe8U4+z5nkVVrxSv1jpHWkIBaWK5V/FAm7Zz+7Pl
	0ab8YyNn4mxsGhaToHSOBXprA9bCeJOWgGbYr7keS9u+lVZGUiEplLcHlQ0m0YDbPHnHF8KfRRS
	4xPwFaI5GoYX3lyJqg4RFSyy8kD+AVypwup/vZd5nZf6HWY5Ga8KiX/cupp/L0CdZO0WP
X-Gm-Gg: ASbGncsmZD/sl/rACuMhDGC1GG3vq1n6vTjNTJfLlJXMEHaqMP52PWoxP1WiUsqgL63
	GJdxBWxDDCbRH/HQr4qZeFX24gTj2JCfZ5ENnl307SCR+4EwTWLQxdoIAdkx3l/MhWIvWpTjVlt
	dxt1h8S0krTPbTmP81TaAHNIAP4L1R+GUy2cZEeZ5Xjgwln+OVby/6Y0rOIlvcCEwcIHmxS/qLw
	7TF+kxdjjsJC6quvyHpzT8FeKhJAWLdpKS4Zbes805h6oXWkX0PyfwRTNgEFERqNca54t3RMHsJ
	5FFWiV9xTGWZdrNP6WdSILALU35jNrjNJTCbm3lfbrhwy/uoOg9Cbc/iFd2EdmpKoPcmt0GQLOm
	bDTTe2PUe00Wxo8E9U+0aWqMVZk/io4dy2c6YzEK95E9sJOqJrtq/5cyH
X-Received: by 2002:a05:622a:4f8d:b0:4ee:87e:dedf with SMTP id d75a77b69052e-4ee087ee1c8mr52470591cf.8.1763378740412;
        Mon, 17 Nov 2025 03:25:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHb4Ps3dPzCqOHGYfilA8tMKme1OEdnyPVxzwMviUQvqScJt0idpN8FF+7TPF+Fjwwa4wsGQg==
X-Received: by 2002:a05:622a:4f8d:b0:4ee:87e:dedf with SMTP id d75a77b69052e-4ee087ee1c8mr52470441cf.8.1763378739967;
        Mon, 17 Nov 2025 03:25:39 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6433a3d839esm9776968a12.8.2025.11.17.03.25.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Nov 2025 03:25:39 -0800 (PST)
Message-ID: <6457c60a-2ede-4df8-ad82-d974690eba89@oss.qualcomm.com>
Date: Mon, 17 Nov 2025 12:25:36 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/dpu: disable gamma correction unit on SC7180
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Federico Amedeo Izzo <federico@izzo.pro>
References: <20251115-dpu-fix-gc-v1-1-0a4fd718208d@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251115-dpu-fix-gc-v1-1-0a4fd718208d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=F7Vat6hN c=1 sm=1 tr=0 ts=691b0635 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=JlwW-Zz180dxR8tk6I0A:9
 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10 a=zZCYzV9kfG8A:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: _F7Wt-1LiztGwfonf5VhwjFeCs2q18Vp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDA5NiBTYWx0ZWRfX1m1vH7VJk1Ve
 37hzlikcuQIyiH1wY3JP2qJfwEEauoqZ048PEfFdxj5CtgVMLOtywI+4hSVvSXNOUPOCeQvwsY8
 YgqVzeix2A9J0NGrUlEgyTUHQwsxHvB9YcxU9vsusonhK8Jq1WnYKhfpkrewrwfAxi9mKg7CQnT
 xILdpgpJgKkv0YFT1k0NswqcRcrZ9cGLqpynInogX0U4Tqiw87rrM5e7eDr6V/E4GWg0X6a4HqH
 Slpz8H6a5xYt+Bas+7g30PjiXQXpvjV4q1dPi+pCyuA81tdXCRQRA2wJuiHDSF/uXyoRYMIvClK
 0G457nUGzpSK5VAniiG/d2ZajBI8+EoZAhKVbFnXpbHvYImtOmH+HkCH+tkhrBZYc5cb8Rzvkoh
 XfMcE16W7nmZDoJ4NLkEBqY/XfTFwQ==
X-Proofpoint-ORIG-GUID: _F7Wt-1LiztGwfonf5VhwjFeCs2q18Vp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_02,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 spamscore=0 bulkscore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511170096

On 11/15/25 4:08 AM, Dmitry Baryshkov wrote:
> IGT reported test failures with Gamma correction block on SC7180.
> Disable GC subblock on SC7180 until we trage the issue.
> 
> Cc: Federico Amedeo Izzo <federico@izzo.pro>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
> Most likely I will squash this into the GC patch
> ---

Peeking at downstream, 7180 and 845 should have the exact same GC
(v1.8).. it seems like there's an attempt to program it through
REGDMA instead of regular reg access. Not sure if it's actually
necessary or just an optimization

What tests are exactly failing? I couldn't track it down on FDO GL

Konrad

