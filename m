Return-Path: <linux-arm-msm+bounces-79897-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E9A29C253B2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Oct 2025 14:20:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E2FE01888D88
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Oct 2025 13:20:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80781278E47;
	Fri, 31 Oct 2025 13:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZWXDynPN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K1pjdOwM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E77EB32720D
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 13:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761916794; cv=none; b=ItGoaubro9+ldcfU/cBr0tc6wOnIUmZ1GnjOW6t3SowNK75HQ0JP59PaEpqhMSihRerVGLfU+yUsEFcX9ITq7J1H30n0QwjWxTnPIgVPM3FbDd+3Gsh3sXARRqWaZJNnXPOMK5ZzBbHEvS54Q8NBsR6Y+jsL3kLzC5tptGxh3/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761916794; c=relaxed/simple;
	bh=kKIlQC49+1HvPMZ+KSY6IKOFV0Kf/+b+20LKz34U5yw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kwzsPh14qzUFwze8F/Htd7AWa3PnVhxB+41W4k4B/w4EtcB5TCaqkHWZnqEqZfL7YzW5evNbFGP5BU4T+dWXoDSx+Xcjo5dn8RQCJOUkXrYZM5q5JqklBGrNZ87FHaA7gU57wCUJX7CIH57n9P2wAElRpnDznFwQU0cxJT8wRJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZWXDynPN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K1pjdOwM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59V8SjZE873191
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 13:19:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=i1q+8kjbF6ZsBZxOZVi0iNgl
	M800iA6/f1hi233PBSY=; b=ZWXDynPNwl8wiZazuA3y2ocv1d/aLxaGDtl82VqZ
	EJtTz1fL6bsdzJbYiIqWIE1t1WEnaqsBLM4jIlbwx+DVvIotP/zdEwBmxc0MBiWH
	2beK8WTOw/gZHacDNqEBkRLhP0vh827gI4xjjHsLYghT5UXV0gOl2mprGb2+VcUK
	3l1H56sAOQxuCeCsNuOKEX+dntEu6GDfnWRoFcWsDDeV1w7CtdHkF0Xc85wwckKK
	cQt0GI+bDoA1odYCOjt7l6ifAtK3UwFmViJU1/w34KixwQV5tTy/fQGIxiubqos9
	2Li5JhKwouut+803Y1zYcoILNaRgKZ8kfYwjTu9jhuaPLQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a4fqn27e1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 13:19:51 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2952cb6f51bso11311085ad.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 06:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761916791; x=1762521591; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=i1q+8kjbF6ZsBZxOZVi0iNglM800iA6/f1hi233PBSY=;
        b=K1pjdOwMQmIt7MXhmjeKr0ZdOz6v2iQ+AQk5lDa8HoyIlTL787GjS8YEZfIssWt+l0
         agpcljPoYoU2BnHu1qzlX0SieWeFp3MA6Lt82c5LR+ZypqjZ1pIz8/fDQ2m7aHsBcdim
         IZd6Q0/ZHSVUCdc2aOPncyUGtiAcZxNCbWmhqbIiq6QLZreaztpghxUjLadyQphzAxfW
         7Kf/bWHNHcXGzWHoL9V8fyntbw+3ezhBUcpwAl1NMne6RMl4IEOh7qk3R6FMzcga9xrH
         cVwe8wVY9hEL3Jn9a1tK6HVDFq4+KHxf4CkfK4utS+OyUAwwrZUOQbGG6IvZsNTf+oQj
         4bng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761916791; x=1762521591;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i1q+8kjbF6ZsBZxOZVi0iNglM800iA6/f1hi233PBSY=;
        b=mhNWPFC8/Y/pvhb8p4pbjExep0EbQfb2JnHV5RLBWKBUQl/3ogWXI5azVJj26e/AdN
         q6y2xQfyTOUXCjH0HexyeK4oyvBIqyXdUmtwC4SN/S1qpoHI+BRYe/ZWBH5loacD778c
         oq8uy2RhO3+lW1LunppQ68BmgwX9sMr9nPR0QPpkr5tv/IwytWzxzGagb585WIRTB7FF
         g9aGS1OqDpmOFhlHUfRyLiT9OTvtWatE0/rWyOjjHZxJalbtQJKX67j6IB+OzJGlTyI9
         L6PjdLgML47rUaHEjllVQu9BkzzTUtrW+0VOnoDIh+gfFcuwz+vbtWGrIEqAU50YAsLh
         ml7w==
X-Forwarded-Encrypted: i=1; AJvYcCXDmbfYeFBDgVMjeS5uvE1CK+bCGprH4gUnQ4WgVFsCrFTQsU9SbieOksxlZq6ZfkDXAGE31ygFNqixDJJy@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2QdXTDW0eecU/TihkuXKjyv/oFGzzpyTR63OrZ81xfhW6y3WE
	QMCRgaCd7+iH2YI7d+WnWtMEDKuqRfRy3+srChyqzhZxbN0yFBpCzSjIgmw3zpvgPw6QRw2wAK/
	LB8xG3Q4aScFRXPyBYeGoNmLxM+Bqa0gtoPdhmu/x5cXDf8Aw+hnmsQUlkAU1Q/4mZbzt
X-Gm-Gg: ASbGnct2LtOG1ZFkY/gmRM5WqM32kszWyKmR258p27Ic0jrSDyt/CpUEpOQDV86XId3
	4f8dkuIiaWd6ZLAoL6XgC1TTDzqbt1cQRC/zzaQiclcsadVPA8y4DQ+ylNVTKd0FoJMxcqfvLM1
	B04rq63PN2hw9rui06v4HYzJSMN5FBsT+yCfC9mnEFABxhZlfnWpUADZp8x/b31SKaSc1uRIpqD
	zAB9DMlw+L7ozvJOqSyS979N+bkPTgdb9cVlJzydNYZ5SkWbTozmlmmVUKyL0/F7fxKYi02Vkn2
	5agFqyVIUjFHnp4bkyWpobbhmueM1EA3azlseRiBw83lJApkVBcHEqNSST6ql3oQU+ZA3JCf4z4
	YkviTqWlhHjhAqKwg3ITZgl1gHx74V6Mj
X-Received: by 2002:a17:902:f544:b0:290:a70e:6261 with SMTP id d9443c01a7336-2951a361f70mr55559765ad.11.1761916791086;
        Fri, 31 Oct 2025 06:19:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEWz7WaGspHmY6hwyIZRpl6IwBTpTBuIV69EQKKehTnyEv9Oq+hWYVVrkE1+HxBN8oUAGfLBg==
X-Received: by 2002:a17:902:f544:b0:290:a70e:6261 with SMTP id d9443c01a7336-2951a361f70mr55559015ad.11.1761916790332;
        Fri, 31 Oct 2025 06:19:50 -0700 (PDT)
Received: from hu-pkondeti-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2952696df55sm24405685ad.70.2025.10.31.06.19.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 06:19:50 -0700 (PDT)
Date: Fri, 31 Oct 2025 18:49:43 +0530
From: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
        hrishabh.rajput@oss.qualcomm.com,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v4 2/2] watchdog: Add driver for Gunyah Watchdog
Message-ID: <51372234-0fd8-4cee-a296-a5e8626b52a8@quicinc.com>
References: <20251031-gunyah_watchdog-v4-0-7abb1ee11315@oss.qualcomm.com>
 <20251031-gunyah_watchdog-v4-2-7abb1ee11315@oss.qualcomm.com>
 <13d2963d-e931-4e51-b875-a1650b899bb7@kernel.org>
 <09e8485f-f512-4069-be9f-3e94fb142aa3@quicinc.com>
 <68b2b40a-da98-46b8-bf48-ce17fb3b79cd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <68b2b40a-da98-46b8-bf48-ce17fb3b79cd@kernel.org>
X-Authority-Analysis: v=2.4 cv=RL2+3oi+ c=1 sm=1 tr=0 ts=6904b777 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=1ZP6r6y3UWDVpadotx8A:9
 a=CjuIK1q_8ugA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: GvdtIgo0tu9Wb7hBCHW0n-W6H-M-hf_t
X-Proofpoint-GUID: GvdtIgo0tu9Wb7hBCHW0n-W6H-M-hf_t
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMxMDExOSBTYWx0ZWRfX47V2Te+tSu7i
 fkrTSVYWhkLgEaqMOtQmu7kbZyvYI70tKibMO5isbMjjBM9QDPOus2s9llIrXFrKbh9Jsffy3Lp
 d2NWPpTiLiZQla6B44pNBLOF/BYyIyJXeN4LQt4uAyCmgCCukHbKYksnpE6nLi7MlWlqOcm8hl+
 V5VeDokBStP4dONBrl1B9WlaO8cPcxLt2QmYCHfEi8K5oC4DRPUFPRySIpAVP7NB0EAYmF1amPe
 iXBkwT5IAs6erB9fgcWg3lE4Li6qT9A3zdC/Wdu0bnRiZUczAkLj3FojSJj9OvtPC9OlAQtcXPY
 cb4Cxkr9JhlcoiZF945usd6CapRBu7app9JocVH7yqhyrYWW1Lny+yXAt6hnvxQvCGHYJB8CHIT
 6QGWsmapNNpbOF+/ZAzr+wEpgxYpXQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-31_04,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 impostorscore=0
 phishscore=0 bulkscore=0 adultscore=0 spamscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2510310119

On Fri, Oct 31, 2025 at 01:39:11PM +0100, Krzysztof Kozlowski wrote:
> On 31/10/2025 13:11, Pavan Kondeti wrote:
> > On Fri, Oct 31, 2025 at 12:48:18PM +0100, Krzysztof Kozlowski wrote:
> >> On 31/10/2025 11:18, Hrishabh Rajput via B4 Relay wrote:
> >>> +
> >>> +static DEFINE_SIMPLE_DEV_PM_OPS(gunyah_wdt_pm_ops, gunyah_wdt_suspend, gunyah_wdt_resume);
> >>> +
> >>> +static struct platform_driver gunyah_wdt_driver = {
> >>> +	.probe = gunyah_wdt_probe,
> >>> +	.driver = {
> >>> +		.name = "gunyah-wdt",
> >>> +		.pm = pm_sleep_ptr(&gunyah_wdt_pm_ops),
> >>> +	},
> >>> +};
> >>> +
> >>> +static int __init gunyah_wdt_init(void)
> >>> +{
> >>> +	return platform_driver_register(&gunyah_wdt_driver);
> >>> +}
> >>> +
> >>> +module_init(gunyah_wdt_init);
> >>
> >>
> >> Heh, what was my last message? If I see module_init() I will NAK it.
> >>
> >> At v3 you really ignored entire feedback and this one here continues the
> >> pattern.
> >>
> >> NAK, please read how Linux driver model is works.
> > 
> > You mentioned in your previous reply that
> > 
> > ```
> > If you call any module_init other than module_foo_driver I will keep
> > NAKing your patch because it is wrong. I explained why wrong already
> > multiple times in previous threads and other discussions.
> > ```
> > 
> > If you are referring to why module_platform_driver() is not called here,
> > Hrishabh answered that already previously. Please see
> > https://lore.kernel.org/all/ndwwddd7vzjpgvzg55whdno4ondfxvyg25p2jbdsvy4lmzsfyy@jnn3wywc7xtp/
> > 
> 
> 
> Your commit msg does not explain why this cannot be unloaded. What you
> want - intended to be a persistent module - is not relevant here. I want
> it to be a proper and regular driver module and I said it last time.
> 
Thanks for the feedback. I am happy that the only concern you have is
about unloading the module :-) I feel that is the easiest problems so
far have been pointed out.

Hrishabh, I belive we can disable watchdog via SMC interface. To make a
proper and regular driver module like Krzysztof is asking, we can make
it module_platform_driver by implementing remove method.

Thanks,
Pavan

