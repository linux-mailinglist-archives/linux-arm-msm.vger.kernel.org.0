Return-Path: <linux-arm-msm+bounces-69212-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CD125B264C5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 13:55:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E66851C23616
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 11:56:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F1BA2FB97A;
	Thu, 14 Aug 2025 11:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f/hxzrDp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C86E82FB966
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 11:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755172552; cv=none; b=jFDtP/4vftj5UsxWxTK/j3jXJQqII07IFYkK3Yx0FM92H+3Eio/1j2b1KuqhubjGFW+lsVSKw1AlfuxC1GTHQMAhiP6cCaqkBFxj/dhaFXw9GmeSXIuqpZXzdpHEuaLZ4btIzA3yv8Gwja7x74POsIJ+Islh3OK1bYwFAP+KJbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755172552; c=relaxed/simple;
	bh=a4PCDUN3BWKJQof73UOlnWBtwCz9o5k7rIL0T7w2yDg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VBK81OcFRGEDHN041djfHYv7QE48xNGQtYNT/PULFwZMFEJHPFKfdydNZvUMBrYnR4ggwH1HlWbQylbNkljHpcTHR4UFVw/Hdm9PXHLSQDvfpONOdkZabyNa5tW+Hg1nseZeD7EIiclZgzHST9eTR9Sd8ePZkuvlxRNqkMDIpXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f/hxzrDp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57E9NdlH031866
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 11:55:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=KwaUoxCOeIrDWwA8MlhquWgH
	JPxXaTq1KQH7JgKMBMY=; b=f/hxzrDpyJJBp6bHh10DNPL4BxwP+hS/6GNa2af/
	kCwkSAX3lPXVFDQoUuReh+6mV5Ldm+9d0JnrtCGHNhSAdze7NYm4nq0Ey7/4Y47q
	pMIr91TaLzYMy2KckdySSHg+MQb1lfJu67Yhb5AUdXAH6C4gYJHKMrOi7+7kl8AB
	+fA9oJ9uUeH/RSTS5cAxaH54hq19sVstF0kmMJHCXe9eFxrYt+Dtsb26+Ls/bw6d
	/CknuDnqcL29vPlPa56tJmfcJtjP5DAZ3fG+LPJ+OqENzYITxp0MroUYDm7Km7IR
	wzsPzGtckcyxaS/krzZ82e4K5ZWUUOD4jEMxu0wPXi0nog==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48fem4kh1k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 11:55:49 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b109c7e901so21965691cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 04:55:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755172548; x=1755777348;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KwaUoxCOeIrDWwA8MlhquWgHJPxXaTq1KQH7JgKMBMY=;
        b=idJ2BxTWOQ7sET26Nnm6JODvhyz4OWLV1ApZx0vjuMenozE1d8ebyrk+Zw1CdSstJv
         jURrr+U9fngXcWSiYPZVempvwlkEZ8B3MEr94ZztV39a6baDvSrfajNe1yVNw/4Rbyns
         txxp4oO5/p/gas1di8fcLInNq4UKXJr6et6OY1yBeDptix7aQ4ewSsb4+bXZJHfhIcco
         f+UH3OOI5KM8arL/EUlJ1n3ODNOCbYNbgXg72QGI1Ppaeqn8X6yE6g69lBbyo0sZtJWb
         GksBPnigFRhWPubRrVfhgmh6lUDIrtQdgfzavN4YmAkLF8UgUpea7ywwDEWa5XgXXynN
         0VkQ==
X-Forwarded-Encrypted: i=1; AJvYcCUcL4HWjMGlUuugPAT34f3S8Za9ABdFg7erAZnu2e3wCPVqBGRYdnKaVWVqcd16QGB35AoJPcuL/ZF06tjf@vger.kernel.org
X-Gm-Message-State: AOJu0YzXbRIbG4H4hwtAJxlwQ6PcnBVi3moL3YET1IwDXLQ/76DZvacB
	Y6KZbiqu+/+hOQ8ivwi10kHiUNaTGMGQNXnPY+xx2QxELbtDcS52LMseVCFHg8rtL/aU2fu4Ol6
	pFULPOStd/glcEgNGRTJa/4yMXAIeJlLRxsssh21pGENSXBJBpzemM5n2UaeaSegEIgtd
X-Gm-Gg: ASbGncsTfJ5tU/uXohZYIQ8FwtxzxugNaz0SkGgmrSJhVpI3KIrDolohH14CCZfUCw+
	uv0pOnxstuSXBBLG3vE3A8iLkZRhkVdVyw9rc9PZYZRcwKHFh84CMQ2E4xdFb9xn16X7BoKdV5T
	OC2Hlhhyhwq8HS4FeySW+fGox3OqOahc0etlZddKJ0g169E/tRJmp263gT5hPbqLKtz47eJFVAL
	LO42YixuCE6oIeUlLllIgFgGK/xtNg/HOpQUAVfRzL85r5cUzBTdpCDs1NFoZkxpSuESnDsefwV
	wNtwAPLbuZpp5irwlBaRzoNmHWbRimmSZuwVauvXfPLatkcGzQ9IZ/4Ohangv6AQrodf4GziMgI
	faZufhxbtm7oG5g2EAse+gpoS5EwORNuPHb7VIqS4HLXCWARlaKWQ
X-Received: by 2002:a05:622a:181b:b0:4b0:81b2:a028 with SMTP id d75a77b69052e-4b10a9599a6mr38768661cf.9.1755172548331;
        Thu, 14 Aug 2025 04:55:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH5PGTOUVfkkOdPwUV4mfK2TYoGc7cZ5ZdF55FySgMx3O0MHYR346J62Rlv5Z/fmOpnbr4S+g==
X-Received: by 2002:a05:622a:181b:b0:4b0:81b2:a028 with SMTP id d75a77b69052e-4b10a9599a6mr38768071cf.9.1755172547762;
        Thu, 14 Aug 2025 04:55:47 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55c78c9123bsm3781616e87.44.2025.08.14.04.55.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 04:55:46 -0700 (PDT)
Date: Thu, 14 Aug 2025 14:55:44 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Abel Vesa <abel.vesa@linaro.org>, Michael Walle <mwalle@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 0/2] driver core: platform: / drm/msm: dp: Delay applying
 clock defaults
Message-ID: <flybqtcacqa3mtvav4ba7qcqtn6b7ocziweydeuo4v2iosqdqe@4oj7z4ps7d2c>
References: <20250814-platform-delay-clk-defaults-v1-0-4aae5b33512f@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250814-platform-delay-clk-defaults-v1-0-4aae5b33512f@linaro.org>
X-Proofpoint-GUID: ZfiY1oEwRm85OeaYAmNTgV6YzDpZueCg
X-Proofpoint-ORIG-GUID: ZfiY1oEwRm85OeaYAmNTgV6YzDpZueCg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA2OCBTYWx0ZWRfX5ENswqDbEMji
 bZkW87cCXVLaWttCkKidpcfM9CKpqASmEwcvr3tBLBEFckhHirxazuKLnKMj2LGmZyc0R0+FFSa
 pL8VREDNfm4LRbhiGz1YKUaN964RtQGSATVA5kyZCnenfQMJ6wqqRunSN8gUEpVwoKiVplIxu+r
 yvyZ+FWc/Ywea9K/iG7WJD7ZEoAxCoUQRvEqboIh/ZCh+0Y+MsFSw5IvraXSeECNX7sOcBhPZOn
 loTFN3QuRuJq7GQERFLp5fNkV5jjOrcKwCpx62pUq2krST1MqtJfJmwcpm2UMT2wCR5ZVAW5GyN
 L+kNdkh42u3i0l7//ztzIcRwSgk7s/0Ktei7wzQmaG3SJ3bzXAtck3eQs2oAw9/eKZ2khYhw+ei
 1odq9jse
X-Authority-Analysis: v=2.4 cv=YMafyQGx c=1 sm=1 tr=0 ts=689dcec5 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=PpI7sDOo-OXBv82Lu10A:9
 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_02,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0
 adultscore=0 impostorscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508110068

On Thu, Aug 14, 2025 at 11:18:05AM +0200, Stephan Gerhold wrote:
> Currently, the platform driver core always calls of_clk_set_defaults()
> before calling the driver probe() function. This will apply any
> "assigned-clock-parents" and "assigned-clock-rates" specified in the device
> tree. However, in some situations, these defaults cannot be safely applied
> before the driver has performed some early initialization. Otherwise, the
> clock operations might fail or the device could malfunction.
> 
> This is the case for the DP/DSI controller on some Qualcomm platforms. We
> use assigned-clock-parents there to bind the DP/DSI link clocks to the PHY,
> but this fails if the PHY is not already powered on. We often bypass this
> problem because the boot firmware already sets up the correct clock parent,
> but this is not always the case.

So, the issue is that our abstraction is loose and we register a clock
before it becomes usable. Would it be better to delay registering a
clock until it's actually useable? (and then maybe to unregister on the
link shutdown)

> 
> Michael had a somewhat related problem in the PVR driver recently [1],
> where of_clk_set_defaults() needs to be called a second time from the PVR
> driver (after the GPU has been powered on) to make the assigned-clock-rates
> work correctly.
> 
> I propose adding a simple flag to the platform_driver struct that skips the
> call to of_clk_set_defaults(). The platform driver can then call it later
> after the necessary initialization was performed (in my case: after the PHY
> was fully enabled for the first time).
> 
> There are also alternative solutions that I considered, but so far
> I discarded them in favor of this simple one:
> 
>  - Avoid use of assigned-clock-parents: We could move the clocks from
>    "assigned-clock-parents" to "clocks" and call clk_set_parent() manually
>    from the driver. This is what we did for DSI on SM8750 (see commit
>    80dd5911cbfd ("drm/msm/dsi: Add support for SM8750")).
> 
>    This is the most realistic alternative, but it has a few disadvantages:
> 
>     - We need additional boilerplate in the driver to assign all the clock
>       parents, that would be normally hidden by of_clk_set_defaults().
> 
>     - We need to change the existing DT bindings for a number of platforms
>       just to workaround this limitation in the Linux driver stack. The DT
>       does not specify when to apply the assigned-clock-parents, so there
>       is nothing wrong with the current hardware description.
> 
>  - Use clock subsystem CLK_OPS_PARENT_ENABLE flag: In theory, this would
>    enable the new parent before we try to reparent to it. It does not work
>    in this situation, because the clock subsystem does not have enough
>    information to power on the PHY. Only the DP/DSI driver has.
> 
Another possible option would be to introduce the 'not useable' state /
flag to the CCF, pointing out that the clock is registered, but should
not be considered for parenting operations.

>  - Cache the new parent in the clock driver: We could try to workaround
>    this problem in the clock driver, by delaying application of the new
>    clock parent until the parent actually gets enabled. From the
>    perspective of the clock subsystem, the clock would be already
>    reparented. This would create an inconsistent state: What if the clock
>    is already running off some other parent and we get a clk_set_rate()
>    before the parent clock gets enabled? It would operate on the new
>    parent, but the actual rate is still being derived from the old parent.
> 

But... Generally it feels that we should be able to bring up the clocks
in some 'safe' configuration, so that the set_parent / set_rate calls
can succeed. E.g. DISP_CC_MDSS_DPTX0_LINK_CLK_SRC can be clocked from XO
until we actually need to switch it to a proper rate. I see that
e.g. dispcc-sm8550.c sets 'CLK_SET_RATE_PARENT' on some of DP clock
sources for no reason (PHY clock rates can not be set through CCF, they
are controlled through PHY ops).

> [1]: https://lore.kernel.org/r/20250716134717.4085567-3-mwalle@kernel.org/
> 
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> ---
> Stephan Gerhold (2):
>       driver core: platform: Add option to skip/delay applying clock defaults
>       drm/msm: dp: Delay applying clock defaults until PHY is fully enabled
> 
>  drivers/base/platform.c             |  8 +++++---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c    | 10 ++++++++++
>  drivers/gpu/drm/msm/dp/dp_display.c |  2 ++
>  include/linux/platform_device.h     |  6 ++++++
>  4 files changed, 23 insertions(+), 3 deletions(-)
> ---
> base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
> change-id: 20250812-platform-delay-clk-defaults-44002859f5c5
> 
> Best regards,
> -- 
> Stephan Gerhold <stephan.gerhold@linaro.org>
> 

-- 
With best wishes
Dmitry

