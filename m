Return-Path: <linux-arm-msm+bounces-84801-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 339DECB14E0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Dec 2025 23:38:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 96E0230CB83C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Dec 2025 22:37:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67F6F2ED866;
	Tue,  9 Dec 2025 22:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NvFRfxI+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L0Kr1MYi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52A632DECC6
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Dec 2025 22:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765319872; cv=none; b=lwGsVXxQET5QBZ0uayoRBXISZwksRPXxxkel5MwvkplrYrFNUvEacWMy4qAuzugXi4XlnzUXiyJB4jKqewEarrdifR4iJ0SINwHRpxdM62zmM4PDbjHd0h07bhi/3+vFNcJ48bExOjhxhXgUCs2JwG8/vMdukLxqcZPh9Jq2RyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765319872; c=relaxed/simple;
	bh=iJ7DMl5JUfZn55mCMCUFDFtqAA/ov2OkH/OdV2jVd4Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cJheKZU7/SMjH6Uowr1W6PCs3koY6fstxEiIdv76LycmTCi2X7FhHlEA81eUXWtlnDPaYH/7WzNstbDyr9Aoq4Z9dJDGR/ckWsdcxtgORZVp3Y0BASsdJ0eckS2ZQvLkfN5aWH2OZsZpY8QSfhrG8pBghBDT/N+Rei8nNSXHMb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NvFRfxI+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L0Kr1MYi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B9GiSjN474328
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Dec 2025 22:37:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=RmYc9tivKNP3axoENaRa+NYj
	Ro7tGvb9FspT8p6Povs=; b=NvFRfxI+UkIwQKdft4+YkpqUTuusNi4zx/VmTic0
	Ew5zFEV6t+jMEzO8SnIA4K6itS16RrXdafpyX8u8b7oPV45S0iYAYycuA0nvC0sv
	hb/YV2TtCuIlJMaK/SlBlX/LnfNtBUIQiNOMu/Kp+3LYkQomHjqYkQzL371gsGsB
	0ZnPCtAll3VMmy+HQxNQSKkGNQxjhtwxYWr1c0aJAuDqDLQtRgs5lj+FhK6vv2a5
	BfK3XzZERSWWme0DirIgkuOBlwznltlc2zxZfvC/mksT5FlaUlwnSF2Bdd0KS8yI
	QCy9llDGL+37Fb28H+WsALPjR14mu84Iw0DNoOxW21FChA==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4axm9c9sb5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Dec 2025 22:37:48 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-55ad466ae47so241516e0c.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Dec 2025 14:37:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765319867; x=1765924667; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RmYc9tivKNP3axoENaRa+NYjRo7tGvb9FspT8p6Povs=;
        b=L0Kr1MYiKeL2InFhXqvr8AEMHxuewEhz74O7ZLaA4iPml4Dr+oCNSE5yudczW0bPJt
         0ztMXMHvt84c+dtukJ22LP7upLjG3evj1QEV+WUPmZaN87UEFW/J4feNHHmNmjKilpdD
         WboQkHh0PR+eDOVQ3eeeVnJb0Q9ndT/oTV774o2eeXGkEtO1TAnfe/CXqvZRWwXbONxi
         d4d+avvKErq2E0JZJjuiWfNn0Vtfjt4YA2VF9Njj+qYpumAOa9hkBLKFSsVL9byoL//a
         4QBg3C+6e4F0FkFe+KW3yrk7//JObTlJOR074Bj0SSm7F3pgO/L7qkpY7xugKnKt6ufB
         1rnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765319867; x=1765924667;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RmYc9tivKNP3axoENaRa+NYjRo7tGvb9FspT8p6Povs=;
        b=j/1p+7wiZyC9SA2txPDhJ3CpX1Y6CIaQepC7IJFg558//Yc7AzuwpLyqMDB8plh1x2
         PbxPF13eJfKxpZ6dD5OyXJVB0fCQDO38PTQTnLi2WlXodeBh5r7DNuHMT3IANEJs7v1Y
         XKs8kwTrtVnhNPleuSHsK1PX7MN/PbtJS6SD95rPUndBAnavGn5Sn9MJYqfcAk1ve7ap
         jEFEbGWE9LudqUjPbSoMW0EKcN+tqneNE7X04Oq2B+a8mzoOpzhQzQnlZeWMMtGT40f2
         Q4FYkE+rq+muX9+IjtJlHWTFEW/bimqPxWDqkrc7TsrJ2BJ/6clVbd6MKKaT8hk7OlmY
         dXHw==
X-Forwarded-Encrypted: i=1; AJvYcCVMidjIF5bYKP1rXysBT9fqTdaoi8bK/+ww2YwzmPbWDxHvHZBLKxrj84Qup6caDhihtNDknka0djls0xYm@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8w8Nghz9xHHNoBEsfGLMGj9LiQsZtr2Z2tar/NntCC1Zk4h2f
	+lCMC9AoRqeach0D7CzdiI3NxTLwOSNMBJDB9TVKsSxNzpR5xLcg9vdBxg3VAHTGa6plWKb8ke6
	vs/KC7iYSWHp7wL6fvDYwADm67/Hal37g6wjDLwx9IXoHSAADZmv5zYN6c/O60hbaZ7Ox
X-Gm-Gg: ASbGncvCHUx50uFjPQ614qb5ktDKDNW1M96/6z1rFlPAjVkon6T79xYa7O2M7Gc49kR
	SSV+Bb1peOIG+IkXDxlwpIh+/T7EDGZJRyTtZ2YbXI9XlPE1VDK77YoUzxudhoep4WVjxdiC+cw
	0v6VmF5+3QBadMvU2M41ZadjuGbRRuVHMUrvYTU+wXsAyCHdq8ktV1lfGZwKCMn5Bf39hNnoc25
	peEY0RmEizNnEOqz9ws7Qg+JnvoSoxXgG7o9YkitWzdeOlHPWu7FMY5rZ+x78tUTYo4mDEBle0x
	7RVMWQWQ+b6m6+GOuqQtDGYY2O/1FOzRY8XMLKWzPzhnxXpLUFXBixPf4VS7hg9XlNWt14XBgGK
	Gs9BPmwaaeXroIBA6ogkaxb0c7OYurleM829NR+IaX6ZXRGIW+12NpN1dGyWLJAw2ezVMaLrAsE
	UXq/OYP6EhCL3MKGD1m2eWmd8=
X-Received: by 2002:a05:6122:20ab:b0:559:79d8:27a5 with SMTP id 71dfb90a1353d-55fcf91f853mr240057e0c.0.1765319867450;
        Tue, 09 Dec 2025 14:37:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFTVjEvn8TnwQni6UudT4sjJRz6IdwOXl7bjJWPhCVAbIL5oohiYT+ArJUzEVrPPRTBvx1YPg==
X-Received: by 2002:a05:6122:20ab:b0:559:79d8:27a5 with SMTP id 71dfb90a1353d-55fcf91f853mr240040e0c.0.1765319866970;
        Tue, 09 Dec 2025 14:37:46 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37e7065b4b8sm49658941fa.45.2025.12.09.14.37.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 14:37:44 -0800 (PST)
Date: Wed, 10 Dec 2025 00:37:42 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: david@ixit.cz
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Casey Connolly <casey.connolly@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Dmitry Baryshkov <lumag@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Petr Hodina <phodina@protonmail.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v6 4/8] drm/panel: sw43408: Add enable/disable and reset
 functions
Message-ID: <lilbxguznfzupg2gpfb6xuj4ickffgtuwwlve5g4d22lzr3bsm@slkmhn4agvgr>
References: <20251208-pixel-3-v6-0-e9e559d6f412@ixit.cz>
 <20251208-pixel-3-v6-4-e9e559d6f412@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251208-pixel-3-v6-4-e9e559d6f412@ixit.cz>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA5MDE3NyBTYWx0ZWRfX/Uno+JgDin/o
 BdeYco7GM3ZwnsbCvKHlmgdNpT2g5j2RMyeJQStnFf5BvcGhzREIJRpDhX2P+8z4xtiE/t6DKdK
 qlPrTQ72Tg8w6S0uKxwWbCuqG0PFGYfmiq9mjnf/v34BCOqgGE8GOeE2RVGmNuLeYs2KmnkiUIh
 pYhFzKCtQYbv6jc/5Tcf1deUipBThysfVHhazQvRZx7mWOilH141M6KPguXvmr0OzI099T/xNsa
 KN6Xd3TG53CCajFZRucdt1daKryjs+q5UWBVYJ+QmoTnrTkpz3ZV4kv0qUf08j+IlF+OE7rMl8H
 +W3URMi/igWkYCWUHbxbK4i94MEa0yhQiE7yDAGj5WvKK+IiWgfjBrtc8SWVlIw7mdKXYkHShLx
 o9v1ife5/KQkPK6hKFCLutisDMN8Pg==
X-Proofpoint-ORIG-GUID: r90HZxTey4T24jc_gPrzUMjk0o8w6ie9
X-Authority-Analysis: v=2.4 cv=Vcj6/Vp9 c=1 sm=1 tr=0 ts=6938a4bc cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Q4QeEDP4Y2U8xtt9THcA:9 a=CjuIK1q_8ugA:10 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-GUID: r90HZxTey4T24jc_gPrzUMjk0o8w6ie9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_05,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 impostorscore=0 suspectscore=0
 adultscore=0 priorityscore=1501 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512090177

On Mon, Dec 08, 2025 at 10:41:57AM +0100, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Introduce enable(), disable() and reset() functions.
> 
> The enable() and disable() callbacks keep the symmetry in the commands
> sent to the panel and also make a clearer distinction between panel
> initialization and configuration.

It's not just it. There is a difference between commands being sent in
en/disable and prepare/unprepare.

> 
> Splitting reset() from prepare() follows clean coding practices and lets
> us potentially make reset optional in the future for flicker-less
> takeover from a bootloader or framebuffer driver where the panel is
> already configured.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  drivers/gpu/drm/panel/panel-lg-sw43408.c | 47 ++++++++++++++++++++++++--------
>  1 file changed, 35 insertions(+), 12 deletions(-)
> 

-- 
With best wishes
Dmitry

