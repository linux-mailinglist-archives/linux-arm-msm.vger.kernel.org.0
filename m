Return-Path: <linux-arm-msm+bounces-57207-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 768BCAAF1EE
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 06:03:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D0EB14C6A64
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 04:03:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BD44202C30;
	Thu,  8 May 2025 04:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lIr0Em04"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BE911386DA
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 May 2025 04:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746677006; cv=none; b=btocECe5SCtqD0opQ9F9rWmw/uXvL5vlPt59RqJjg6sX2LZqRfa/GeAf8w2XQkwMuCdIse77d4k4y5NoaVk7XTbn6alsVA3sA1WfREvTyo3KFExxoN4gnX/O+zectViDJVfC+gl3UlNIf8ah85A7doncGdmpCNGIhDaao58EwxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746677006; c=relaxed/simple;
	bh=FdXcjbEbad1MvTLMck9BvVGpVGwxPcY9ao+oUboDcco=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N4HfCANaQM1kqciUneQp8QpKOUcGaMdD+3x9LIx38hPNpToXsX5DfPOSrg223L2aLhPLqz6+dmLG03OYlTOO2hE5l34D4gks8OgGjor0LM2mWh6C4jkwaR3PHALRtvMhJELLmtMlJeX5kmZw5JzGpyeXrlyEvXgZLY6RP89h9cI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lIr0Em04; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5481CKUp005190
	for <linux-arm-msm@vger.kernel.org>; Thu, 8 May 2025 04:03:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=WFGwx5PZ+G/9BxcVBebd00iL
	tXeXpkwlaZ/P+6/sls8=; b=lIr0Em04WtZl73eIUNkTUGI0JaqxYlvgs/JLqJlF
	OJhiYw3N9NXkePvJM+V/qosXsoViXifU83bw3AIlcsfYzv5h/XR6V+aA7ckOnLPJ
	qjcHtdVMCZsAsHltv5hCpRvjIxk1Yv1gzW9ILZQFAEAKq1QsnZjzrkt7xEIaLDOR
	5tGH9wJ7jz+Dpb/dKf4PhG1HRWcaQJDlCdxvWZLaHEb17IEB8I294Ub8XbDcJ61t
	6Cp/7TkAlYnHUxjg30Rnv3OCFnKGgHKHrQLSbZEagbeooCm3GylYAawzhQmMH0rv
	Iikx67Uy8lFxRjAJf1kWRMw9YvzAD95kbXTTKfGs53omiw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46f5sv7xer-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 08 May 2025 04:03:23 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c92425a8b1so98172885a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 May 2025 21:03:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746677001; x=1747281801;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WFGwx5PZ+G/9BxcVBebd00iLtXeXpkwlaZ/P+6/sls8=;
        b=SqFbZx7xq3A7zi1jSDIVIBj/nZML7HuDC2PIkbXH1Pypo2qSSgUdcwW00bblk3hYBb
         /Lo7dGaQjGQRFCPtc85E3uJko6bkUSAk8kgy4IJs1l4dLu9FzuJDrMJyvX2YL9JOI5vS
         wKv3i5TN0jWoVROFYanAHv4Jin9zwuIU98pmNryelpfNpuPq6pt5MzmbJxBfsDbEV01p
         xBnuWKLM6cuncYpiL48kkqiwNNjTvG24PGtkRSIMbMYdYo3r4PgZkz7usWknoWd+KUnY
         6pNEGtjOsZpT9oj0JgA+qDrz4CgZc7qgztZT/6I1PaKAuJ78xSSvbgUxwXc64md/Qm8g
         wwiw==
X-Forwarded-Encrypted: i=1; AJvYcCVlMl8qdaR6p1ucHuv1Rh6TlMY55u+W5Zps/tot68XVzGgaxNwbio3obpgKWPJDRMaTQKRN+oZXh9PDJXDS@vger.kernel.org
X-Gm-Message-State: AOJu0Yw44EkLKCoqUF97nL5LVCjpcV0xDgBrpdtuEKBmcVc8VDYidDoR
	8PvPq/8ScvME3e7B2NsECfw0duOJPoXY46iWrCYN8sHlyuHlVpz+cxatlDnLhI/rpWR/L7IbxMU
	XvsWhhO46bHQcHfAH8qHa26yxzjOd99t4vHl824OUXMbMcQBS2bIhuko6Ct1+Dpda
X-Gm-Gg: ASbGncvYINF9sIVBjOrZ321CZAdzjceG1Y/qwCx38NdaiXM7V6IsBWpnjbuwktqVAWL
	pSiMOWeFbUkdyc7Qpm3Or+ROqUf+RmRGV9QfF6q0VjpiQFeyhZMr4b6S/sPCjbyllelcwOSxEh/
	tXzVAQFvT5FcCTkQsbm7rB3dZtT2Y32wRXzWGntc4yANvF9DM38jqy1uXOTvHTYGI7P7/MglCOb
	YuGxRUzITeNC2lijwKGonuIcaSFPw1tlNK0Vv72StgX9NyMmTJUxBUDHfzgp3+3Ol22M8jsjtyM
	+rj1NWm7RGIt+CecN150XGMr1cU8Ikk2+KZTrHVsIFOinLWuefSLu3EUOrTJwjqYMDXZZDhoeNw
	=
X-Received: by 2002:a05:620a:8002:b0:7c7:b570:e2b1 with SMTP id af79cd13be357-7ccf995e1a1mr366749585a.7.1746677001625;
        Wed, 07 May 2025 21:03:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFCvb8VK0sMuvhaF34y+RLN/zFk90fkQ04v2q+mJ14cJV9oLuze4zWQomR2mbFMyLbVM3zhmg==
X-Received: by 2002:a05:620a:8002:b0:7c7:b570:e2b1 with SMTP id af79cd13be357-7ccf995e1a1mr366745985a.7.1746677001155;
        Wed, 07 May 2025 21:03:21 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32028b38ef2sm23996481fa.23.2025.05.07.21.03.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 21:03:20 -0700 (PDT)
Date: Thu, 8 May 2025 07:03:17 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: display/msm: hdmi: Fix constraints on
 additional 'port' properties
Message-ID: <fvrvrcqilnhma774kkojytlgwglsvgaxgukm2fc3gennaii4jz@dufjv3obqc7b>
References: <20250507215912.2748964-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250507215912.2748964-1-robh@kernel.org>
X-Proofpoint-GUID: nVEOdVLOEMR6lSmV6tWF-4CG9_eGWIO8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA4MDAzMiBTYWx0ZWRfX9SSZeGSJ0K7x
 2E6jyzcGP36IVCsXtZGHNXgzacPSyx4YWRj3Mhl6YKAKVBcbMQRDlatGQ/U0x7pk9GBsh9TUxdi
 GylYsPnyCgTHn5yjzwO5YBqazdz+WUbNuwXOpDvN06Nlzlk7f8zkBEfGnamy5rh3FUo8KkJNXjx
 mHUEwg9MYNWFxxPwlYtszpazozz8JU3UOHtYeSdg+YzQnRquPFVkrD+MwXnxszrILRNKW4jlB6A
 uB8oge9ZG6Bj3nIadgW7+o5UOyZI0gu2RciT9tgdRWyJWd76waVrKs2G4biv1yGJFaGIdbYDYIK
 V68YuUtY5s/SRsuevUHlTVbmwgelBNgxTG9arrsDibL/3j/22S9tmHXs4ewo7Cr3SpdyqZfj5y2
 6ptbrtRXHkQAwvAbc0grDbyZ04nPlPsl4suBej7KRXUU2Aco5ACzK7fYidj4NwK28jJwWObi
X-Authority-Analysis: v=2.4 cv=cOXgskeN c=1 sm=1 tr=0 ts=681c2d0b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=LCLtBpLZ_J7SsqHOqrgA:9
 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: nVEOdVLOEMR6lSmV6tWF-4CG9_eGWIO8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-08_01,2025-05-07_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 bulkscore=0
 mlxlogscore=999 adultscore=0 impostorscore=0 malwarescore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505080032

On Wed, May 07, 2025 at 04:59:12PM -0500, Rob Herring (Arm) wrote:
> The MSM HDMI port nodes are missing any restrictions on additional
> properties. The $ref should be to "/properties/port" rather than
> "/$defs/port-base" as there are not additional properties in the nodes
> to define.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  Documentation/devicetree/bindings/display/msm/hdmi.yaml | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

I've verified, it applies on top of msm-next and produces no errors. I
don't see a meaningful error in the bot's message (Rob, is there a
chance to fix the bot?).

> 
> diff --git a/Documentation/devicetree/bindings/display/msm/hdmi.yaml b/Documentation/devicetree/bindings/display/msm/hdmi.yaml
> index d4a2033afea8..099274d35680 100644
> --- a/Documentation/devicetree/bindings/display/msm/hdmi.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/hdmi.yaml
> @@ -89,12 +89,12 @@ properties:
>      $ref: /schemas/graph.yaml#/properties/ports
>      properties:
>        port@0:
> -        $ref: /schemas/graph.yaml#/$defs/port-base
> +        $ref: /schemas/graph.yaml#/properties/port
>          description: |
>            Input endpoints of the controller.
>  
>        port@1:
> -        $ref: /schemas/graph.yaml#/$defs/port-base
> +        $ref: /schemas/graph.yaml#/properties/port
>          description: |
>            Output endpoints of the controller.
>  
> -- 
> 2.47.2
> 

-- 
With best wishes
Dmitry

