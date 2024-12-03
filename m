Return-Path: <linux-arm-msm+bounces-40101-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A3B809E1E86
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2024 14:59:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DFF241630A6
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2024 13:59:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D51D11F4739;
	Tue,  3 Dec 2024 13:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qrf57wu3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 125A31F473A
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Dec 2024 13:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733234342; cv=none; b=Ow0j6jDQ5jSSVA7b1q8rdmnBiz2qwTcy4oLXjpWBGByju6M3IrJmtszkSGkuv17p8fNp2N5UHgaenAQ1sloCtn25H+5Op+c7NbH1filCwVRaZPqfLagJnrg2aHFESwYKhyKKQ8LnreMPqf9DpVKFu2ejQ44A+2lbwbcXhUWEWh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733234342; c=relaxed/simple;
	bh=TF0PUhtQTicvC6M129Y4QTNRkQEuUNF1PsicyZbmyQI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tIgGQtExKqEaS3mogMqbIFHOHmHAVtn55M6GUL1H8fToActJBBHduWnXpPHiwoxnXoizsTn5zGuq2e67PBoMIzUc/c6HvYM8sPf6HLtBj1QQZVCeeCFyfM9E7DtZKvM2J+vEjWcnV9VDr6u4THfgOT5CqbYupl7y5nCqV5SCdMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qrf57wu3; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-53df6322ea7so9601695e87.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Dec 2024 05:58:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733234338; x=1733839138; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ratoXWp/EmolcxNUAUNGQ1kmRPcGIDYTBbsytoKVT70=;
        b=qrf57wu3TdmSGq5Rpxe3lX4V0TQeAepWhnssvHbbk8N159cFgJ90/doN8H5xLTXReZ
         sXvpT7H3Eb0h7rWguridTBqAh2kIsyJIXuNCjUuYhpagjs093HORXq0W4Iez4dW0x5kY
         M0gx8tCna6n21Fgt+Z76TQY0j/3Ikf3Z1rFmbRFKcJMKUmhoVKrMGNhmg8ToME3FS1EE
         a1zIFEcPlQaoCuO2Cux+EQ2ivB5GHCAporzlupljAo8PDk04wZtB+zouiyJYzS8o938e
         z0nABEzlRdn3gwkoPqUEirMQ7x/ujdwNEdufQ+MLOiMSWJ07CkZQgWTq4GPpbbKYWe6x
         NONQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733234338; x=1733839138;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ratoXWp/EmolcxNUAUNGQ1kmRPcGIDYTBbsytoKVT70=;
        b=MDEISjhEz9NKGm7Ou6AFN6PtBD4BcggaokDEQKon9dNgdvWu6s9BKA7nycNbXbl9QX
         fbJM2SrL5HL+QvMkd8AMBSZnrcUQT61PcXT9Mk1C9Vx/5BXbXcpidmgoqzMh1VYOp2fx
         +RJ3ptfbHwz0Pxan06KOx/PiwLqpgnBmFzlGA1ENqRSceEPBJCKpEMzvXqVU1U25farA
         2ouN6YyabGb51ive4F5Yv1OEvEB6mQ5s54A4vDA5rBCpXH3VVXzO8042a7KUWoCevKAA
         SYXKZVXiZULMUfsXDseu8szoyBNUCZHIs65n+IJPLBfD2IM24TgLd/7QJuUnDpKheB8g
         aJ9g==
X-Forwarded-Encrypted: i=1; AJvYcCUecH5OnFPfWuVvxL30GNdK0w65gXCBaCxh7ct/c/wFsUGyP3m5Sp1dVqMdYdEfPmaaAvmQZZ64IlmrXkYl@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/DuhfFBb4MBUqgwuoOctD1IHJAbiXlcWS9AlkhrfIracv7gK1
	hlF/qlM9mPv5vXc4/3ohdfv4VjDBJvoKHrPRw3XACGAlmPf4cLeElanpU6N1M/Y=
X-Gm-Gg: ASbGncvug+vMkdMA2R0J50LxOzMq/g4J6u+NHUMIpdgmWanYmfnEaorySw+TUs6ygLV
	TK7glS5C7bJcfem4H+r1+VIeXX179cyAijfkADgh2AabACG1Xp+1+ttmBVyX5FamLdpyoIqY31V
	nnGxwFbSvOHu7IifmYaXlHie4QjNT3lL3KKBWujKbbJPArIEdXByQ0KoX2PIWekxzJugxdhvs5k
	sTCaSJA4VjYKVhG7pS3xYmsNXG33eecZPE36YCguVr7L40d28vbcqHEa383frqYapwpeTtJymOC
	j8df6gM7wJWByPYMDfm/kCTU2I3lxw==
X-Google-Smtp-Source: AGHT+IGXwu7iAMc0T7nz4ZWr7DVCTldVmrbcWesEg5VeYru0HhyDfTDMH7KA7Bk8Gf9p7i1oKm3lyg==
X-Received: by 2002:a05:6512:3182:b0:53d:a025:1142 with SMTP id 2adb3069b0e04-53e12a39336mr2285402e87.54.1733234338202;
        Tue, 03 Dec 2024 05:58:58 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53df64a06fesm1843812e87.258.2024.12.03.05.58.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 05:58:56 -0800 (PST)
Date: Tue, 3 Dec 2024 15:58:54 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Xiangxu Yin <quic_xiangxuy@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Kuogee Hsieh <quic_khsieh@quicinc.com>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, quic_lliu6@quicinc.com, quic_fangez@quicinc.com, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH 6/8] drm/msm/dp: Add maximum width limitation for modes
Message-ID: <fb6enh3wzusadc6r7clg7n7ik2jsucimoi7dnecnsstcz4r6e6@dtahvlm522jj>
References: <20241129-add-displayport-support-for-qcs615-platform-v1-0-09a4338d93ef@quicinc.com>
 <20241129-add-displayport-support-for-qcs615-platform-v1-6-09a4338d93ef@quicinc.com>
 <CAA8EJpprTGRTxO+9BC6GRwxE4A3CuvmySsxS2Nh4Tqj0nDRT_Q@mail.gmail.com>
 <95a78722-8266-4d5d-8d2f-e8efa1aa2e87@quicinc.com>
 <CAA8EJpo-1o9i4JhZgdbvRxvoYQE2v18Lz_8dVg=Za7a_pk5EDA@mail.gmail.com>
 <86b9a8be-8972-4c19-af0c-da6b3667cbf4@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <86b9a8be-8972-4c19-af0c-da6b3667cbf4@quicinc.com>

On Tue, Dec 03, 2024 at 03:41:53PM +0800, Xiangxu Yin wrote:
> 
> 
> On 12/2/2024 5:32 PM, Dmitry Baryshkov wrote:
> > On Mon, 2 Dec 2024 at 11:05, Xiangxu Yin <quic_xiangxuy@quicinc.com> wrote:
> >>
> >>
> >>
> >> On 11/29/2024 9:52 PM, Dmitry Baryshkov wrote:
> >>> On Fri, 29 Nov 2024 at 09:59, Xiangxu Yin <quic_xiangxuy@quicinc.com> wrote:
> >>>>
> >>>> Introduce a maximum width constraint for modes during validation. This
> >>>> ensures that the modes are filtered based on hardware capabilities,
> >>>> specifically addressing the line buffer limitations of individual pipes.
> >>>
> >>> This doesn't describe, why this is necessary. What does "buffer
> >>> limitations of individual pipes" mean?
> >>> If the platforms have hw capabilities like being unable to support 8k
> >>> or 10k, it should go to platform data
> >>>
> >> It's SSPP line buffer limitation for this platform and only support to 2160 mode width.
> >> Then, shall I add max_width config to struct msm_dp_desc in next patch? for other platform will set defualt value to ‘DP_MAX_WIDTH 7680'
> > 
> > SSPP line buffer limitations are to be handled in the DPU driver. The
> > DP driver shouldn't care about those.
> > 
> Ok, Will drop this part in next patch.

If you drop it, what will be left from the patch itself?

> >>>>
> >>>> Signed-off-by: Xiangxu Yin <quic_xiangxuy@quicinc.com>
> >>>> ---
> >>>>  drivers/gpu/drm/msm/dp/dp_display.c |  3 +++
> >>>>  drivers/gpu/drm/msm/dp/dp_display.h |  1 +
> >>>>  drivers/gpu/drm/msm/dp/dp_panel.c   | 13 +++++++++++++
> >>>>  drivers/gpu/drm/msm/dp/dp_panel.h   |  1 +
> >>>>  4 files changed, 18 insertions(+)
> > 
> > 
> 

-- 
With best wishes
Dmitry

