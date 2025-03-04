Return-Path: <linux-arm-msm+bounces-50132-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AEA7AA4D6CB
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 09:42:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 35B313A9F63
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 08:42:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52BEA1FCFC2;
	Tue,  4 Mar 2025 08:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mETPgI23"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 725821FC11A
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Mar 2025 08:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741077704; cv=none; b=XQo90eEYmkT3JjyGV8HZRQ1q1pV+uxS4tv0K/fPM8S2gEBrrTVEfoI/FV6CQ1O3Kbd95M6p9S7y/k4KMQO2gEsJauSwB8yw7hyLbLfs2QA56nd1n6lifhvVprFnDf9FhHgLVUQo/CenEDmXFqlyzOCiLezA3ZwHW0y3nT6h0894=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741077704; c=relaxed/simple;
	bh=dQMWqa7bqGUsuYvK1/Ia2Th2yYYxZTfZ4zTTgbD3dM8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B4d/hviwO/9AUoj3ysXjHwKV8/YLXd/Y+L6ztaxGduTqgp35MU+Ha++ZG+ckrltXyOZ+58x3Qa8+AFN/W1FAyHwSW+ppQXSy/MQO0wg3eLJFyDWfy4jh9moRfcBwyaA5bLqPnZAm9gaWNQj2mpLYYnjFsVzCf8ILs/FbdbwVLP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mETPgI23; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5dee07e51aaso10022552a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Mar 2025 00:41:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741077701; x=1741682501; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=56LRZhimeVf0548v2DjrELpnYIUuGBcJG2m3Hu8yBtw=;
        b=mETPgI23iMZxrX7GFlSZRwwi7jXMWbtYR4M3vRphfBCECl58WfB81Rx9vB6ka0K3t2
         L/LFUswCMPP7zQsX2+qYYyvXJlIFe0+96ZuZB8QIMW20xuVvEn+22VTPPwE1ykFp8UET
         QugvwKbKib9yg5nXJnasC8WWRhvPtotg0o5LLcT2L7QDr4n/HgpZlFourgonBQLEcyHz
         41qc2oNbkw5hA/ZW/Afs2EeB6X3vq1X7y8SunsRQFmSsV8LSHWEd8ogu72H0yiamGsVk
         8v6oVEFyYisedodPQ4g7etioVcdXT7oFxC3SNWy+UxjDNYvR6ytzHziVV9qqpUhDN4/i
         ShJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741077701; x=1741682501;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=56LRZhimeVf0548v2DjrELpnYIUuGBcJG2m3Hu8yBtw=;
        b=Ks5ZOQm2lRf9VNIURmc45Z81+Ga8isXSR0AyLoq2/JgaPOsxN382xWtC56u1otas12
         DqWhYoPqTo6FHMomHspvrH6XL0g/XR9JEITOC8ijHKOw0qePG5OrkZTp1uyFDQ9hXxH/
         2DO3HUNAzVr+RI9HslDSyDVvsPL+jubvpy+oKa9FcNHW27rGQ5FBgvOjI87ZMx5GEojg
         ONY+GhVCDR2x9lM9fBRZVSOu/YK1mbgnkNuP1FCPFWpwC6GKRS7gaIUboe0UJmkdV4+W
         KTKshXPu7szDFoiHci67oQQvAa1X749KcSlA2laN8kurOvor+Fv+jXis8fbwJyWI2lks
         qb/A==
X-Forwarded-Encrypted: i=1; AJvYcCX+zp7DifUHEi1Bu5yX/F7Z2aJs8/A0+EtUHXaW3Hh7vi1aka6yfDGcl/TT8PzDdFVQuA7/YWy74QU7f0wV@vger.kernel.org
X-Gm-Message-State: AOJu0YxNFw5QmcSd9KtD3JBAJTmoHudn2u2AvzK+HpZoujS+RkhSXk2W
	woWJwMiD9ZMDVV7zuSSThXdiHJvAVO9dQ41He4kNCIIPRxbIghZEFANg9EY1ppw=
X-Gm-Gg: ASbGncuyuzl1s9kfXuoXdYXVjvczeyTXIDu4RbQDwoVUKrt//h5aS4KfCNGkc7jbw5H
	o1rh0bhaXajToig4FhJtFtpdBhT3cKhFJOlhgjb2oAZELQ3SCi+GSjIlApX+R2XVYXDCGcN2da9
	UTqJ8Oo5UrjxnXBjXA7SDcdW0s0zGEMBtuQf+evX2fQbWDeRHOybDFw2zC4hw9UbWRQVqMG5lva
	UXHPbEv4P9DEcAKIwsGZ8yrJH/6mueSROAinsC4DdIBpLIs55J0gySeVYNh7+UdcJ+BmFBt4O96
	sg1gu2qFCjuUAjkQscfINmm6c3uoCLxkRx5cTnzV4g==
X-Google-Smtp-Source: AGHT+IFFHM/nljeEtmfpwAYQ5fCe3mzYlZ/kbhPchbUbj2wuqBNp/7U42a+daD7qurHBY27yA6v3Yg==
X-Received: by 2002:a17:907:7d89:b0:abf:7832:bf5 with SMTP id a640c23a62f3a-abf783244f6mr732543466b.34.1741077700633;
        Tue, 04 Mar 2025 00:41:40 -0800 (PST)
Received: from linaro.org ([62.231.96.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf529feacfsm557445466b.153.2025.03.04.00.41.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 00:41:40 -0800 (PST)
Date: Tue, 4 Mar 2025 10:41:38 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>,
	Kamal Wadhwa <quic_kamalw@quicinc.com>,
	Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Johan Hovold <johan@kernel.org>, Sebastian Reichel <sre@kernel.org>,
	Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org,
	linux-pwm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v3 0/3] leds: rgb: leds-qcom-lpg: PWM fixes
Message-ID: <Z8a8wrEcBuZrGm2/@linaro.org>
References: <20250303-leds-qcom-lpg-fix-max-pwm-on-hi-res-v3-0-62703c0ab76a@linaro.org>
 <lvi75asit3ati7wwnyae6rowycr3veodswu7blbnzbrq646fgi@iksn4qas3dwt>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <lvi75asit3ati7wwnyae6rowycr3veodswu7blbnzbrq646fgi@iksn4qas3dwt>

On 25-03-04 07:29:46, Uwe Kleine-König wrote:
> Hello,
> 
> On Mon, Mar 03, 2025 at 01:52:49PM +0200, Abel Vesa wrote:
> > The PWM allow configuring the PWM resolution from 8 bits PWM
> > values up to 15 bits values, for the Hi-Res PWMs, and then either
> > 6-bit or 9-bit for the normal PWMs. The current implementation loops
> > through all possible resolutions (PWM sizes), for the PWM subtype, on top
> > of the already existing process of determining the prediv, exponent and
> > refclk.
> > 
> > The first and second issues are related to capping the computed PWM
> > value.
> 
> I just took a very quick look. I'd say squash the first and second patch
> into a single one. Splitting a change that fixes the same issue in the
> two branches of an if condition has no benefit.

Actually, the first two patches fix different commits.
The first patch fixes a commit that is only in linux-next for now,
while the second patch fixes a commit that has been merged in 6.4.

So they need to be separate patches.

> 
> Other than that this patch set would also benefit from what I wrote in
> the review of the other patch you send: Please mention a request where
> the result becomes wrong. This considerably simplifies understanding
> your changes.

Sure. Will describe the 5ms vs 4.26ms period scenario. Hope that's OK.

> 
> Thanks
> Uwe

Thanks for reviewing,
Abel

