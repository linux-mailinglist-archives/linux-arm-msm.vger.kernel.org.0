Return-Path: <linux-arm-msm+bounces-69448-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 70B9BB28E4B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 Aug 2025 15:55:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 889B0AC5930
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 Aug 2025 13:55:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC18F2E9EAB;
	Sat, 16 Aug 2025 13:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T8UPGD27"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D0F1317709
	for <linux-arm-msm@vger.kernel.org>; Sat, 16 Aug 2025 13:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755352515; cv=none; b=XnnVDBz/wCs6jcQFQKDRh/1QX7f6oMEHe523kcg1CtLc0OBnuwJRBGSnx7F9I0wwg9PphoqiDlPlpEXeT2oX7jIdMredSouPYrfxKxsxbQ3kQqQvt9DwZMwKW0ic3wWTamrAviQ0Y+RpyXH6AMYcw24mGAc8mkufo5MY68AQ8/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755352515; c=relaxed/simple;
	bh=zXJNIryBwUqERcOr1QlRPNTD6RUU1fPwFpLasPETPGE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k0OV9fxTK8qLpIbPFoAWCsn2b1t0XhlP5iQ+iiRoEEk7jgeaEu8BdEGE5dB1e38IzUR5LhHQo1Wl2a3klNL8t5kiGkoTZgXDjxRbGg0OwnInu17PG/UBP1sYvOkaKV95Nz7Fh2Dr+gOTwbJTN4PvvZWxeFXOuOZjtV3E38QCdHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T8UPGD27; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57GCqsKh030504
	for <linux-arm-msm@vger.kernel.org>; Sat, 16 Aug 2025 13:55:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=a9zYANIX49bgaw1SNhNNLdN0
	47lWkWIZ7zlz0nou/K0=; b=T8UPGD2796uIQ92pVnMHU8i8edIeMhZoq10gcEgu
	I7BBJ7CAR+Zpd1ur5qLaCc9Fu2rDUDtAB1DFWET8HeLQxp8lvnqKvyqyQTFgmv42
	uNjnqw4PYUyZvAnIAzfY5EexTMHzNskzNIcA76KChMqiPrU2hZW3VpRFR29X8ZwX
	b3qlJjWkNgrhHkoCbANwHkH6u/gUJZWpbr71M0H8tgVao2D6Zj6fnF3r0vlAhis9
	pAqdGg0iKaZVbj06rwWGNlj2262PL2JsXHZ08QXPEqlcd7T+PGQE2WNvnoe1R/iW
	6ISSOsEOwJDW2A3m26CFnFntEckofQBTVVsbVOE0KI2uUg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jfpf0x10-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 16 Aug 2025 13:55:13 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-70a9f57f950so59335986d6.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 16 Aug 2025 06:55:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755352504; x=1755957304;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a9zYANIX49bgaw1SNhNNLdN047lWkWIZ7zlz0nou/K0=;
        b=wy12c+r51Lq5L4fWvTVFmki1BK2WKdK4FaSN8UzjamGlV4YsgqEZemp1+OXrksef5k
         Hm6IZ3AMvqzKtULac1p6UDsw59NhEtWRtyZ13GnDM34De7SPjJusSJQdTCV98L8ysXqm
         1UnMEejLkAk43+2V2ZIWyHpYoIYvI5qMP2cYVguZs/UqJXuQ/pTJl0PfAPn1oDxF4+MY
         xiyBokzGeNVfUTfCRiI2fqUV4QrSUOe1z7UYEdkkIZqmqHNjMjKvRS5ymfhrdKUFJyzd
         m2Y1lwmLDowNM49Ki+ToBWh/Bjzl7Oz9PZ3SPCJgReQ/Dvy98Zril+JHaCyLxa44jbCb
         2r7A==
X-Forwarded-Encrypted: i=1; AJvYcCVsXjqZ8TrNPZzOgp4GD8Ow2QnrYV3XAriAzKzx7IoAUQcPo0xmxauY2oMUioyPguyE2huSCwpTLQAnkNjQ@vger.kernel.org
X-Gm-Message-State: AOJu0YwpiT81Ug764G1Ut+I7fraplX462MVhMMC26qktwr2bOK6yInxP
	Z4EWNlQE9zWWeiWIHNwaqo+5dXND5jE1dntxDwFC1AR9LlW788j7DcxTiza+3L1/zDdECvYRVpc
	5k2TAEgYAWD5DVwh20UUPRtrB0yjalD+A+7fMZhRnWirGL/DlX2eugSprCvxDCy46cmgh
X-Gm-Gg: ASbGncvA26dYEnq/RwKNxIJKSP/uD62dJlbUWzjO9/fLIaV0O2T/Mw92fBekM3+ovn0
	z0LV5kh7FgaxSNJfyon3IuYQhYfJz7kd7Zys0a9RpvPj4FjezJQ3RNm3F5sInmxOQFbo7yBtwBX
	iCJSZ4REque68CUvTLBsmWrJ0Yk+zmuMMuUmbQ57INlUl0ew8Gm6EgV41SivQueOs1g6c6nGYUB
	+UHNA6GvB9D/vy3yaqQqyylHUKbX1QYH3GGuVHJ7cGz1ev5ou+a8Vnv0ZVcEc79tYvgjJqVkTfa
	GosXHW1ErLCZHD+Pe2aLT0vQzSPwMrU7quYJfeqHsCkvxcSavuoUWe44gDbDHRfZAw3xsz1T/i9
	9aRqsR+zZCLODH+ySeU+6y3egGK0Svn22d2S7zucpdJKWYxzKL3RY
X-Received: by 2002:ad4:5cc2:0:b0:707:56e1:4806 with SMTP id 6a1803df08f44-70ba7c0c266mr64819146d6.26.1755352503827;
        Sat, 16 Aug 2025 06:55:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFjK12eVhr12VMUi48bvOGnpy+oqFtp/dDx+KcfOB4Ct+XDsdWZMBpgCzIT9Wh4SppdahooWg==
X-Received: by 2002:ad4:5cc2:0:b0:707:56e1:4806 with SMTP id 6a1803df08f44-70ba7c0c266mr64818736d6.26.1755352503240;
        Sat, 16 Aug 2025 06:55:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55cef35153asm866295e87.16.2025.08.16.06.55.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Aug 2025 06:55:02 -0700 (PDT)
Date: Sat, 16 Aug 2025 16:55:00 +0300
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
Message-ID: <ddp77rvwe6brwyvkzbkouguigd5tjg2qqfxomlhd2hb2x7w7uf@2uyl2q47bpei>
References: <20250814-platform-delay-clk-defaults-v1-0-4aae5b33512f@linaro.org>
 <flybqtcacqa3mtvav4ba7qcqtn6b7ocziweydeuo4v2iosqdqe@4oj7z4ps7d2c>
 <aJ3Y1XhvTPB7J6az@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aJ3Y1XhvTPB7J6az@linaro.org>
X-Proofpoint-ORIG-GUID: cPTDEn3JHzf-j-ajlJxkx6TaI475IuI9
X-Proofpoint-GUID: cPTDEn3JHzf-j-ajlJxkx6TaI475IuI9
X-Authority-Analysis: v=2.4 cv=X9tSKHTe c=1 sm=1 tr=0 ts=68a08dc1 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=vveynParcMvujpoCFGYA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAwNSBTYWx0ZWRfX9nrawdmCaghg
 /KmRyOwFjh32pKR2z912qoggLnAdYoj67OJcFy9mBKpD2IptS/s46UQ0y7T0hVx+378KMcmRLd9
 RnBaQDSPF0pTEIjbNK/GQSR8fRu6nV8Racs8rIl3gquB2ikh+C5lyxw6IWJqzPAe1ZIQ287c7WK
 h+uMZ94iVLeLlu1lO0qMnVzW4WBT/NI8FyGQxmMwqbDo2Gu6/C5PtMFrpg9HujLsh1auPWRytdH
 qDg50WcZrubWS5fWzNa/uZj5bcU62pLgzbLbAOwRorsrjlYvLnKUq5mtC+lFziqtkAhrqVeiqV7
 ffwVSg1gSJnzX4rrT+yUVcZnBt+jE2l9odZqJWJmKRdjipCJ3njWkz1C45tjky/hMCFoxOC1Rrj
 vHjLZA7V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-16_04,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 phishscore=0 spamscore=0
 suspectscore=0 adultscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508160005

On Thu, Aug 14, 2025 at 02:38:45PM +0200, Stephan Gerhold wrote:
> On Thu, Aug 14, 2025 at 02:55:44PM +0300, Dmitry Baryshkov wrote:
> > On Thu, Aug 14, 2025 at 11:18:05AM +0200, Stephan Gerhold wrote:
> > > Currently, the platform driver core always calls of_clk_set_defaults()
> > > before calling the driver probe() function. This will apply any
> > > "assigned-clock-parents" and "assigned-clock-rates" specified in the device
> > > tree. However, in some situations, these defaults cannot be safely applied
> > > before the driver has performed some early initialization. Otherwise, the
> > > clock operations might fail or the device could malfunction.
> > > 
> > > This is the case for the DP/DSI controller on some Qualcomm platforms. We
> > > use assigned-clock-parents there to bind the DP/DSI link clocks to the PHY,
> > > but this fails if the PHY is not already powered on. We often bypass this
> > > problem because the boot firmware already sets up the correct clock parent,
> > > but this is not always the case.
> > 
> > So, the issue is that our abstraction is loose and we register a clock
> > before it becomes usable. Would it be better to delay registering a
> > clock until it's actually useable? (and then maybe to unregister on the
> > link shutdown)
> > 
> > > 
> > > Michael had a somewhat related problem in the PVR driver recently [1],
> > > where of_clk_set_defaults() needs to be called a second time from the PVR
> > > driver (after the GPU has been powered on) to make the assigned-clock-rates
> > > work correctly.
> > > 
> > > I propose adding a simple flag to the platform_driver struct that skips the
> > > call to of_clk_set_defaults(). The platform driver can then call it later
> > > after the necessary initialization was performed (in my case: after the PHY
> > > was fully enabled for the first time).
> > > 
> > > There are also alternative solutions that I considered, but so far
> > > I discarded them in favor of this simple one:
> > > 
> > >  - Avoid use of assigned-clock-parents: We could move the clocks from
> > >    "assigned-clock-parents" to "clocks" and call clk_set_parent() manually
> > >    from the driver. This is what we did for DSI on SM8750 (see commit
> > >    80dd5911cbfd ("drm/msm/dsi: Add support for SM8750")).
> > > 
> > >    This is the most realistic alternative, but it has a few disadvantages:
> > > 
> > >     - We need additional boilerplate in the driver to assign all the clock
> > >       parents, that would be normally hidden by of_clk_set_defaults().
> > > 
> > >     - We need to change the existing DT bindings for a number of platforms
> > >       just to workaround this limitation in the Linux driver stack. The DT
> > >       does not specify when to apply the assigned-clock-parents, so there
> > >       is nothing wrong with the current hardware description.
> > > 
> > >  - Use clock subsystem CLK_OPS_PARENT_ENABLE flag: In theory, this would
> > >    enable the new parent before we try to reparent to it. It does not work
> > >    in this situation, because the clock subsystem does not have enough
> > >    information to power on the PHY. Only the DP/DSI driver has.
> > > 
> > Another possible option would be to introduce the 'not useable' state /
> > flag to the CCF, pointing out that the clock is registered, but should
> > not be considered for parenting operations.
> > 
> > >  - Cache the new parent in the clock driver: We could try to workaround
> > >    this problem in the clock driver, by delaying application of the new
> > >    clock parent until the parent actually gets enabled. From the
> > >    perspective of the clock subsystem, the clock would be already
> > >    reparented. This would create an inconsistent state: What if the clock
> > >    is already running off some other parent and we get a clk_set_rate()
> > >    before the parent clock gets enabled? It would operate on the new
> > >    parent, but the actual rate is still being derived from the old parent.
> > > 
> > 
> > But... Generally it feels that we should be able to bring up the clocks
> > in some 'safe' configuration, so that the set_parent / set_rate calls
> > can succeed. E.g. DISP_CC_MDSS_DPTX0_LINK_CLK_SRC can be clocked from XO
> > until we actually need to switch it to a proper rate. I see that
> > e.g. dispcc-sm8550.c sets 'CLK_SET_RATE_PARENT' on some of DP clock
> > sources for no reason (PHY clock rates can not be set through CCF, they
> > are controlled through PHY ops).
> > 
> 
> I don't think there is any problem with the 'safe' configuration you
> mention. I have not tried, but we should be able to use that. However,
> my understanding is that reparenting does not fail because the clock
> itself is in an "unusable" state, but because the new parent is in an
> "unusable" state. We can run the clock from XO, but that wouldn't solve
> the problem of reparenting to the PHY (until the PHY is fully
> configured).


How would the CCF react if we return -ENA from the enable() method of
the PHY clock if it's not available yet?

> 
> (It would help a lot if you can find someone from the hardware team at
>  Qualcomm to confirm that. Everything I write is just based on
>  experiments I have done.)
> 
> So, assume that DISP_CC_MDSS_DPTX0_LINK_CLK_SRC is already running from
> XO, but the PHY is powered off. Now of_clk_set_defaults() gets called
> and we get the call to clk_set_parent() while the PHY is off. How do we
> deal with that? Returning 0 without actually changing the parent would
> result in inconsistent state, as I described above. clk_get_parent()
> would return the new parent, but actually it's still running from XO.

For RCG2 we already have a lot of tricks like that.

> 
> With my changes in this series the clock state is always consistent with
> the state returned by the clk APIs. We just delay the call to
> clk_set_parent() until we know that it can succeed.

I know. But what happens when we power down the PHY? The clock is
assumed to have the PHY clock as a parent, but it's supposedly not
clocking.

Another option would be to introduce a safe config for the PHYs and make
sure that the PHY is brought up every time we need it to be up (e.g. via
pm_runtime).

-- 
With best wishes
Dmitry

