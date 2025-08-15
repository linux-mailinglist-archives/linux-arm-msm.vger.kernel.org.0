Return-Path: <linux-arm-msm+bounces-69364-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 32BD3B280C4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Aug 2025 15:42:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7455C1C27CE3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Aug 2025 13:42:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E62F30275D;
	Fri, 15 Aug 2025 13:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cOLn2gat"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A291D301015
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 Aug 2025 13:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755265348; cv=none; b=L8ovEn46Hmd5KnnsKmbLx0+Pa0xi0Chng0LEMifjfxjrMsvMElwwg4/9mvzfUE7iT5VuI3m6wXw4MRjB5Rk52fJUgyioo4h6zUntCwFEsc7xGU26Eq3Lp3KNW2nk8HNx4HlSE/0Oz1lsw0W7q9+pMPgFczqtyDLGVF/1Bv1Ct9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755265348; c=relaxed/simple;
	bh=PQ8+dfSydKrkvzfm2HENartemvX6MLXX0jZP5Wi/v+A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C+Yo5VrI0PGB57f6Gp535nvJ3eTF/BJ2QwFVNSfoDv8Cr3N1WSBqcmeJN5s1c0mIfI1I6MVURipuLWD80wANak4VpV8A7369dIoAfaj/DSdSCUdu3WMzdYAh0QpIppMvmqgxePPG8MqBU5q8pO3wqwVmAtl647A9qXdZWGb+wJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cOLn2gat; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-45a20c51c40so5349375e9.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Aug 2025 06:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755265345; x=1755870145; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tay3gLmD8Frwd0JSmKUUlrGu9kRRhF6pKhplgXjle5s=;
        b=cOLn2gatFPWBYGNe3cTRFGUqHek6Ba4rGEbgsc0dkLuynegdo6EBaVj5ltan662UsZ
         kovgTVgmBzzyJ9bQE/ssjPuZId+Za7HlOxZn/cXeKgrZR4q4g+MyE5KBvBWWcFwDyP/o
         AM33KgRkBju8lFD9AEaNYDTP16B7F7tQEChPARoI7nms4rslScEvXi7/iRBc20dcXYvv
         fxhICqvAHo4TLMLF38iPWIjUL6FAPb5jOro5s9Os+U7JQbopkG219xJLU0h0t1sh5S86
         8deCy/0UEB02vpMm4XU1Uf7V8VVmnzqLS/8CnREb0EYodmr9M/L2h6lAVd5RbRvann6m
         3TVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755265345; x=1755870145;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tay3gLmD8Frwd0JSmKUUlrGu9kRRhF6pKhplgXjle5s=;
        b=Tag7orPF/B9kKJehxMiGcTinrEPvZUOc17/03okN1PClOwZLQs7F7Lr19Sz2YJflbo
         JUlZTnDqEN/Tuhd/n6W5l2KTuCNFghD3tfqJv/Xund5zbcupZZbcFxuv94zG3SVTSiTY
         8s2U7K3nzrFFWYqdmV3ngNzfWGQVt/0bO0DUz9PPP8ZfhK/Hz4SmQKHNGcbIsKdufeuc
         JzTjzwhrbpctA3GhebKHingXhs2WTOtv+Zve8BXxeLMvEUX/9OlNqJmaO3GHYRtmvdi2
         QWLNFUsdsmu7Mm2iMzdnRckAGvBcCRDzPYaz9YDz3si6T/IV3aOax7x6LjIHnQZesk6o
         6Mgg==
X-Forwarded-Encrypted: i=1; AJvYcCXj1P/gBF49soP4RxznboZoTrHj2t5mEp6zZpdBa88oqFakatgw+QtGBfKqq9IJz7KZ02onC92+LO8Zh06l@vger.kernel.org
X-Gm-Message-State: AOJu0Yz60CogqgdgIgrwNg48bIZUrY3PKNPIEBpSo9IltQCxLcl4OQqQ
	4eiLZWGlMedJNK0Wv1n0Uel+sr/zOdFtCVXq7JtLWmcSRsw+HaIz13BHs616vEovbag=
X-Gm-Gg: ASbGncvj4puKX7oaAdbXCc3hwArUozId0y7dqMaqpeOS3cngm+4u945r/uCgr86tgjz
	JWM7rod0PppbF1+KXhPLALtCWvPdvWXbS5cTfZtRbPYcJqJL/YpqBWVbXzucODCUp4jdtUlorsf
	zDQNgYfTXd2nh6/IqeOdH397DFBgWntdHMjDbgHPzOaw0vBAdBQrQLrbKWEVNJJZXUS4gcAQsBo
	9F2tDwqakKBbm3GcxWrWhmcTLqpDriUKqUuZdKPvx8vIU4ulnyU/ZsOwZJsHa83tZo2JxhNQCDF
	pVj8SLe6si3gt3tB2QV0jV+fCkYPB7SlNijbVoMtw4WZWiKJ/6sTs9L8PZrvA5J+dW190KWxCRh
	MaoRrI7T4LgFKxEt9G4RtkUUdURmaReX80spPzocua4E=
X-Google-Smtp-Source: AGHT+IFlajPT5BztdSNYp4ivjV5fdtLyMwPsBJGF7bEW9Ww4T7y2G/wB+Plg/hRmOIzKKeMUkjMMbQ==
X-Received: by 2002:a05:600c:4590:b0:459:10de:551e with SMTP id 5b1f17b1804b1-45a218575d8mr17339135e9.27.1755265344897;
        Fri, 15 Aug 2025 06:42:24 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45a1c78b33csm62016055e9.25.2025.08.15.06.42.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Aug 2025 06:42:24 -0700 (PDT)
Date: Fri, 15 Aug 2025 16:42:21 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Thara Gopinath <thara.gopinath@gmail.com>,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] soc: qcom: icc-bwmon: Fix handling
 dev_pm_opp_find_bw_*() errors
Message-ID: <aJ85PQbujQe-IZUH@stanley.mountain>
References: <20250814063256.10281-2-krzysztof.kozlowski@linaro.org>
 <e35ca54c-252f-45c4-bfdf-fd943f833bc4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e35ca54c-252f-45c4-bfdf-fd943f833bc4@oss.qualcomm.com>

On Thu, Aug 14, 2025 at 11:15:08AM +0200, Konrad Dybcio wrote:
> On 8/14/25 8:32 AM, Krzysztof Kozlowski wrote:
> > The ISR calls dev_pm_opp_find_bw_ceil(), which can return EINVAL, ERANGE
> > or ENODEV, and if that one fails with ERANGE, then it tries again with
> > floor dev_pm_opp_find_bw_floor().
> > 
> > Code misses error checks for two cases:
> > 1. First dev_pm_opp_find_bw_ceil() failed with error different than
> >    ERANGE,
> > 2. Any error from second dev_pm_opp_find_bw_floor().
> > 
> > In an unlikely case these error happened, the code would further
> > dereference the ERR pointer.  Close that possibility and make the code
> > more obvious that all errors are correctly handled.
> > 
> > Reported by Smatch:
> >   icc-bwmon.c:693 bwmon_intr_thread() error: 'target_opp' dereferencing possible ERR_PTR()
> > 
> > Fixes: b9c2ae6cac40 ("soc: qcom: icc-bwmon: Add bandwidth monitoring driver")
> > Cc: <stable@vger.kernel.org>
> > Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> > Closes: https://lore.kernel.org/r/aJTNEQsRFjrFknG9@stanley.mountain/
> > Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > 
> > ---
> > 
> > Some unreleased smatch, though, because I cannot reproduce the warning,
> > but I imagine Dan keeps the tastiests reports for later. :)
> > ---
> >  drivers/soc/qcom/icc-bwmon.c | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/drivers/soc/qcom/icc-bwmon.c b/drivers/soc/qcom/icc-bwmon.c
> > index 3dfa448bf8cf..597f9025e422 100644
> > --- a/drivers/soc/qcom/icc-bwmon.c
> > +++ b/drivers/soc/qcom/icc-bwmon.c
> > @@ -656,6 +656,9 @@ static irqreturn_t bwmon_intr_thread(int irq, void *dev_id)
> >  	if (IS_ERR(target_opp) && PTR_ERR(target_opp) == -ERANGE)
> >  		target_opp = dev_pm_opp_find_bw_floor(bwmon->dev, &bw_kbps, 0);
> >  
> > +	if (IS_ERR(target_opp))
> > +		return IRQ_HANDLED;
> 
> So the thunk above checks for a ceil freq relative to bw_kbps and then
> if it doesn't exist, for a floor one
> 
> Meaning essentially if we fall into this branch, there's no OPPs in the
> table, which would have been caught in probe

It would be really hard to silence a false positive like this...

regards,
dan carpenter


