Return-Path: <linux-arm-msm+bounces-36571-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A5CF9B7E0A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Oct 2024 16:15:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 201F91F2208C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Oct 2024 15:15:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55D011A303E;
	Thu, 31 Oct 2024 15:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HBryv0aF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 207E91A3047
	for <linux-arm-msm@vger.kernel.org>; Thu, 31 Oct 2024 15:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730387705; cv=none; b=OMgoa9LfRJXgODU+Trz5bReEU6p1u34AA4wzd2w24xB6uE6xgCBTYsO6JUYyRXUKC0BB/SjnZfqPAgXykNdJbpJ2rGXnMb1wpgVhyLBopcbdCM6M0iu+e+Esgb0+mWW+vNdZF0BQtDHYfv/adisYUEj9p7maRc0tvqIuYLPmqfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730387705; c=relaxed/simple;
	bh=CIqgAcLbJbz9DTJFXaDtE7u4mCfu6HFK2Ec4lMCXi2w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=frKEzvOKI37LOHcVWTevPMa0FoR2DJiP9aWacqwcfksmqAaTZL8POVO/5nYJBxgHwWEcsOPSJzAqE2UOiSDKvUgTynfe7sgiJFfFxDrfc3XRDcWpalz8eeotM1ajIMaV98Z7EdJIQOaKgmtWsI78v6zIQjYh6d/CX7gynW3acgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HBryv0aF; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-6ea4add8a5fso10109147b3.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 31 Oct 2024 08:15:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730387702; x=1730992502; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PsNfyZkAbUdRy3BMPYsQyztzSUGdi05Vyd/UT3Z4MOk=;
        b=HBryv0aFYb5GtzJOnqslVXR/dnUvcIoz7+UMNrpcEzi5V09oMhgXwj0HhOBNrabF3Y
         P2RaxlpRKRe3QhH/uo2TFSQSODC6y5HZBH8FaKt2oWiR99L5ajwSYGB6VplK8fPCONeW
         Rnb1pWOq0Wl+SrxpKG6g6m+cTZB/hWhA8JRZyeVbdmiNe15frgShLXeIAO8Cuf4GVweJ
         mlMUexdjKxlkD+9eohUj20XVn2ze7NpJAgAqIYvvb6BP3cTPVRo0sECxe7EDQaMFb9kY
         EZk/M4YxmSWPEe/jqjnCcJLzLFJbhj/RO4c3+09xsiv6+No7ZXHbuTgdHBaBU46MRIAn
         gllg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730387702; x=1730992502;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PsNfyZkAbUdRy3BMPYsQyztzSUGdi05Vyd/UT3Z4MOk=;
        b=Kt8nZ/Va8sWS+0DQHR2EXL9vhWrxHe+F28uYeQlEaTmlAt63gpJZ8TmteuEOl89lcL
         vYlCc5rQ6kN4KlDKbGWzgVp0MAnLr9WPX3k9F44173nVAPkiPnREATc3D1uZwpvc2IA+
         vYkoNRAhoRmcS/hPpNM1frN+20jnCwypJ9xRnnipfT+3Vp9ZYj32+Q3q/r6l45cxbMg6
         yH6zwGsZHQdcYVeWY4NHkAaKoDewFjZ4ep7TsgwLTXSBSddD2W1NFA/0hYCXQllVxEJF
         BKbYtabdX5tK/fxr/6bRnqP1veLvzMBkYkJRQ6BmkCWhlbeEcSr2eXhl5KiFKwifGeHG
         AcLg==
X-Forwarded-Encrypted: i=1; AJvYcCUR/n5yL6ol9XP8q+oIrhdO2h72dVHiNS19I0NPV06qJfh9FKdVlZCka7hQ0V14gxKGwJM9Zk1PAOzk0ZkD@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+F270aIBFLuhn3KzNXkP2k1KUpqxVZGz002uPtr188ECFrI1P
	AwJj09kQQJI47D3Cxm7RH6ijVkpyBC01zPeC2v68Dhe1kIuh9JxdEbTWzVsDv/79XOk3+eGAlfI
	wmi2W+bLLsS3z4U2OBpKd3mfZ86VoS5a/CRD8Hw==
X-Google-Smtp-Source: AGHT+IEzbgAkvn+Kbd1W59aqNXrS5kqasKo2UcyReXDn6RNKVnLzNobyJmTaqWwwzBvxE1e6RcSS33ZES6nefnm8xiY=
X-Received: by 2002:a05:690c:3803:b0:6e5:625c:5ad8 with SMTP id
 00721157ae682-6ea52542f0dmr43442727b3.37.1730387701805; Thu, 31 Oct 2024
 08:15:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241019-qcs615-mm-clockcontroller-v1-0-4cfb96d779ae@quicinc.com>
 <20241019-qcs615-mm-clockcontroller-v1-8-4cfb96d779ae@quicinc.com>
 <omn34rwurlxrjckb5d6xb2brg6zwcizonmqyfckvngk5msrfav@b3i2bdjk5vw7> <2aa768a4-b0e9-4b2f-8d74-736a88cf81cd@quicinc.com>
In-Reply-To: <2aa768a4-b0e9-4b2f-8d74-736a88cf81cd@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 31 Oct 2024 17:14:57 +0200
Message-ID: <CAA8EJppZyJt_MWrafSKReuCXy0RtEAQ6VE-kt_Fp41eFpsW2SA@mail.gmail.com>
Subject: Re: [PATCH 08/11] clk: qcom: gpucc-qcs615: Add QCS615 graphics clock
 controller driver
To: Taniya Das <quic_tdas@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Abhishek Sahu <absahu@codeaurora.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Ajit Pandey <quic_ajipan@quicinc.com>, Imran Shaik <quic_imrashai@quicinc.com>, 
	Jagadeesh Kona <quic_jkona@quicinc.com>, Stephen Boyd <sboyd@codeaurora.org>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 30 Oct 2024 at 20:04, Taniya Das <quic_tdas@quicinc.com> wrote:
>
>
>
> On 10/19/2024 1:58 AM, Dmitry Baryshkov wrote:
> >> +static struct gdsc gx_gdsc = {
> >> +    .gdscr = 0x100c,
> >> +    .en_rest_wait_val = 0x2,
> >> +    .en_few_wait_val = 0x2,
> >> +    .clk_dis_wait_val = 0x2,
> >> +    .pd = {
> >> +            .name = "gx_gdsc",
> > .power_on = gdsc_gx_do_nothing_enable ? Or is it controlled directly on
> > this platform?
> >
>
> On QCS615 the GPU clocks are directly controlled by high level OS.

Is it one of the gmu-wrapper platforms?

>
> >> +    },
> >> +    .pwrsts = PWRSTS_OFF_ON,
> >> +    .flags = POLL_CFG_GDSCR,
> >> +};
> >> +
>
> --
> Thanks & Regards,
> Taniya Das.



-- 
With best wishes
Dmitry

