Return-Path: <linux-arm-msm+bounces-86182-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 262C3CD556B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 10:35:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0354E3006986
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 09:35:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5383F24E4B4;
	Mon, 22 Dec 2025 09:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DJBtXAtm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Gp9BrYEP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D80A01E5018
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 09:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766396105; cv=none; b=QH2hU3UJAkcYGihZ8CnqhBdsrx1ShRHjS6z2DRRcef+By4TPnD1j2z8vURQ1+xuR4B/6E6/ktYZZCkGQzAdajRyNs5strD7bprF2LOfmb0fPkfSkInYudhfCcV6UAw9rRUkLHEm2OLTPFLS/TbGdlRmaStk35swQ1KIhPvLQj7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766396105; c=relaxed/simple;
	bh=uilvjhBxdRa2m7dpEC6IWDjUW8F6zPBGmjxovnoJxV8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D9OnLKhPAikmReHzIooLSW3yQBYmV3Zc2Zn98jOeqx9/pjKt7HkDD8kN7xsys4H7gSyia9cZbZa1XXTIuy9qakenit0tlezxJga1JYIgnCkl1EFXNuLqGAWYUgF2diY7yan/HkryQhtOoI8/dnYq5gTpNs20U9OMEZBbshbXqYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DJBtXAtm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Gp9BrYEP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BM84YOg3755813
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 09:35:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B3plZt5bte+qkiCj2pBEELaulJxcDl6ek425Uqlkc9k=; b=DJBtXAtmvN/Uwq7H
	edFOJ+QxnwT7xBkk2XCUM6s/aJCN5MzweckM/hXYniqxIDVBwvfemLYY/ZFwill9
	Bcsu9rhnXCxaLpu2s7+tQZgkoU/EtA49/nh1l/HjlCyMptSgZEWhq7OtOJw3YILI
	o5W/YzbuOLdh0fO/0jpgrSl23QoocZDEH/tYTh47vhYEJrs8HfQhBebRcbrwmXxS
	d9mAn7LgHFPrDQT7pJiGSePCikcNsxYnpRyv5MsxDB+DmQ1Ed+9EdEtEGTjKE38s
	S0o0sqRxzVilbZOpJDNpzDPo6c8en+yZP5qK5wPdBsGb4OflDMwmWhf2IDDhQNsN
	llUmBA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b69ahjstd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 09:35:02 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-88057e35c5bso9137786d6.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 01:35:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766396102; x=1767000902; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B3plZt5bte+qkiCj2pBEELaulJxcDl6ek425Uqlkc9k=;
        b=Gp9BrYEPZ83OJCbiYrYe89O4fD1gFx1q2oPZM90httTbsU6gRK7wjbkTMgis0iKhbr
         db34sM1MJr7pArSXStP80B1v7cVGWN7mrA23CTps4GYQfJNLOT5/67YCqwcTVLW5UzGH
         V+9lIpd8L86Vubcswxcxrf6JXPk1vklkTqeVJvOdJG6Qa2nJrPHcH+9+hZx2J9eYjy4U
         pJ4SnenjJADTMRNfPDC6hQW13ne7R4PxaTd/1GB/zfzFWQveh7iKjFgZbaDk1xbxvj/o
         oiIfLwSn2lcyM5nVHRFVDzvag9rm5RtpDmMgv17mY/gUUoHHKqWviF7WbHYrLPrL+G3q
         wpbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766396102; x=1767000902;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B3plZt5bte+qkiCj2pBEELaulJxcDl6ek425Uqlkc9k=;
        b=CqpsvRkzSltGuB73rNu0aG+EImH0EKPhqh0zbXEVinn+CMp9kn1xI7SCsyd2e4MLVG
         9mRS9B/drhFROD2bunbP/wrTKdhuC/rZ23aCsH1Q/DvWrKXzaKBCEYD7iP8MwyovmUef
         BageIQeSNvBBf3cO9DmktVeqcx6+lwREfyfZhnPH70jINqEON2siIYTmyI/FMMUI2NTn
         Jim0nZnIMEEPqC/3S0be6IK6ezhgp2+qBn6catZiLVO/J18QzaZqGs/JJVg++yW8KTBu
         OvWSY9x/uU1Iug4OCXZF9VhXGfNvy69MHj93TF39OhrDs8ojqUXWCS/bY80IrCH2LL0F
         +xzQ==
X-Forwarded-Encrypted: i=1; AJvYcCWc/a57PBferq0rr5XgitCiOTTC3/aCzWwjV3SRjusqEibDnLsa/l1LATlVejbo3R91e8uYJHFql1axf0aJ@vger.kernel.org
X-Gm-Message-State: AOJu0YzLnEGrHdz2zW1fpivdA88HsYfsFDuXiHUxe1YMg3Czxw4U/jgQ
	9wApxC6HOD3p9tBy26H7ghkz3QFrqCKWboW3TrJ8YcnweSrOONqhVqtkJ1aJ6z2SnN85q9hHffM
	qhb9xzRZbEob/6liVN2t3H+nwhLBwycb+R44J6WThIKyd83Ua3/RPt8qIhKoY2qGXOvnr
X-Gm-Gg: AY/fxX4GzYp++MHq+/FF74+y1Suh9WSa7spfCk1F1XGKVipvuZRZxxVI02Kq3c7aZTC
	f5HFVhb+v9dC7TZWy0Is8x0D9lGIQtIdFXDgJSv8CqiKMdNOQiaZm0iQKkjNHtn7lEu8Jix0HlS
	lOtLl/rMxGXxwgfwQZAsrfmetOGAPds1uQOwiwgciyeMoADBfyW4faHIBE5VDsJSAJkyG3V54cH
	Sw6GD8atX0OjWXcXDi/f4srsQX59Kg5Sar91qwPMw82+wXOX3IaYKUuqdrCDAJLW0f9zFlqCGf7
	VKRd1YpWhvNEgw0q/Wn87Valq7mago3WAJUHSYWNn5fDZX3N44xijucb3b6ywElIRXbxLgBkZh7
	m9rbij/t9h0t4zbUchIzFh7K4jwOsUty5GEw3Et7qwWTthR44eAEtcaQtjxoNqtTgUA==
X-Received: by 2002:ac8:58ce:0:b0:4ee:1c71:71e1 with SMTP id d75a77b69052e-4f4abdb158cmr107153551cf.6.1766396101915;
        Mon, 22 Dec 2025 01:35:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFC2cDet4JWSod54Bi6KxdIeJLQpbOWy6ZlVkj/EU4DXRP19VUVGfAQMc4AB0Mtr3t8FOTyMw==
X-Received: by 2002:ac8:58ce:0:b0:4ee:1c71:71e1 with SMTP id d75a77b69052e-4f4abdb158cmr107153421cf.6.1766396101507;
        Mon, 22 Dec 2025 01:35:01 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b90f53b21sm9857989a12.5.2025.12.22.01.35.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Dec 2025 01:35:01 -0800 (PST)
Message-ID: <3e42724f-8522-4426-b1c3-133d6f1d927b@oss.qualcomm.com>
Date: Mon, 22 Dec 2025 10:34:59 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/19] drm/msm/dp: fix all kernel-doc warnings
To: Randy Dunlap <rdunlap@infradead.org>, dri-devel@lists.freedesktop.org
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
References: <20251219184638.1813181-1-rdunlap@infradead.org>
 <20251219184638.1813181-3-rdunlap@infradead.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251219184638.1813181-3-rdunlap@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=JuH8bc4C c=1 sm=1 tr=0 ts=694910c6 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=JfrnYn6hAAAA:8 a=tHX55RXggAFrrhuCNvsA:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-ORIG-GUID: skW48naEr0crXTH_pcZDprcFdYXT4vFm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDA4NiBTYWx0ZWRfXyPH2vqsCzT4t
 PuJl3/7fYUu4Kppa3lJJF4Fx7Z8qGfk37gnjaHOP95vOThYtCiLAEJChCOvgYk0HgMfNFy6Ffw7
 0EeNuZKPBkohBYUKape1o8i0vGfguOA51ErvMt4gI6crev9/w6KUaKJGeeRFIPXMPXqBrzf/1Od
 z6EcH+YLUf1M19pQVZ0pIU1KmTS3EOK0Q5lQT3Yb22UCfXr0xUxBFj3G75QPTLXQaXq3iFNn8Dt
 BIQT2V0OZtwTvt4A1gwfkWIQhe6FWzI7Lv4E4mV4rZ0ebMcPstA7LONlt6NbwTA8sE5lpAmetyd
 xa71c9Tm2Z5D8e9MFbwwkv24/gQa/CadZcLrHOKaOFzccTtwVlV8MeP4aDAS7ukvAILTRPdnXSD
 fjWtS/bDm0rF7Btc2AsnIW/cx1YE4BJO2Q/51qYe2hHj7I19nPlJHEglu8yKr7+bXqOJFVm1phA
 CAr01Y9mqNA8V3PzQZQ==
X-Proofpoint-GUID: skW48naEr0crXTH_pcZDprcFdYXT4vFm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-21_05,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 adultscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 suspectscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512220086

On 12/19/25 7:46 PM, Randy Dunlap wrote:
> Correct and add kernel-doc comments to eliminate all warnings:
> 
> Warning: ../drivers/gpu/drm/msm/dp/dp_debug.h:31 expecting prototype for
>  msm_dp_debug_get(). Prototype was for msm_dp_debug_init() instead
> Warning: ../drivers/gpu/drm/msm/dp/dp_drm.c:24 function parameter
>  'connector' not described in 'msm_dp_bridge_detect'
> Warning: ../drivers/gpu/drm/msm/dp/dp_link.h:90 expecting prototype for
>  mdss_dp_test_bit_depth_to_bpp(). Prototype was for
>  msm_dp_link_bit_depth_to_bpp() instead
> Warning: ../drivers/gpu/drm/msm/dp/dp_link.h:126 function parameter
>  'aux' not described in 'msm_dp_link_get'
> Warning: ../drivers/gpu/drm/msm/dp/dp_link.h:126 function parameter
>  'dev' not described in 'msm_dp_link_get'
> Warning: ../drivers/gpu/drm/msm/dp/dp_panel.h:70 function parameter
>  'bw_code' not described in 'is_link_rate_valid'
> Warning: ../drivers/gpu/drm/msm/dp/dp_panel.h:84 expecting prototype for
>  msm_dp_link_is_lane_count_valid(). Prototype was for
>  is_lane_count_valid() instead
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> ---

[...]

>  /**
> - * msm_dp_debug_get() - configure and get the DisplayPlot debug module data
> + * msm_dp_debug_init() - configure and get the DisplayPlot debug module data

"DisplayPlot" makes me think no one ever read this in the first place :(

Konrad

