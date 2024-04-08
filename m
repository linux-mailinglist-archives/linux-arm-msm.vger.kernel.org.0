Return-Path: <linux-arm-msm+bounces-16801-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E8C8689BE5B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Apr 2024 13:49:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A3C2F28253D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Apr 2024 11:49:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AD0A69E0C;
	Mon,  8 Apr 2024 11:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Q7mZP+7s"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84462524DB
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Apr 2024 11:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712576938; cv=none; b=HSXEYYrF18W/59ZL5qutnjJmlEdGuUrjbzQUqwMMsAaBEPqKveUxB0uEOZ6uaHCsuX5aV6itEr0S5bo5apov8HroQYA9nMr6d81Dhiu12f1FJIptpCT/S2mWO5oRMJb1M84/M2AfgM3+8aoqUdw4d2LdFllM3rpl3Iz0jNd7Ogk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712576938; c=relaxed/simple;
	bh=ZplvEpasmgzJ6wLQyYh4WhuOhD0mNNMVL+GAvGPYA50=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p0PB9idioPSRVis9kMebA0icVyx7qi1cZDhe6aRvrKRSsaXbeR69+bNbkHWcie4iR3+GFp/NBGqF/cF20oiJ+qllzjojnBx+FhzN7lxq9jdrZByLW0u0fX/qVP9He58UbSXBg0hpUtDzJtmqS+Mlptz+kYZ31meeNnctfx5zirs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Q7mZP+7s; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-dc6dcd9124bso4104146276.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Apr 2024 04:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712576935; x=1713181735; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lMDAeYxA+8h9mLgRvt8CuTix6N7PrmKJtS5hTj3/DdY=;
        b=Q7mZP+7sL9qwHEAnDbpfLEy+7FQ7COe+YBW6R9EwFevav1erN8jvjiNchxx7ABKk08
         6fGNHNEoofTsYh8tns70MR6eYqnetRgITtSiZ+vQkFuJo+v8BDRjU5Ohc07i5Yb8mFzx
         pG2Vjkkl7708GDROf/9oMSBcyeust1McAbKUkcIZ9BBLNr6/oy/0rqnZdkF7FF6uprKv
         aB9CxREYjNlYMCBo6P4gcv09rg1q7xWMSn9XhivtU9goS4Pr32ewiq1vFkH/a/7rz04r
         B3duwm3+9pRakgtSVSGiPOm+x3IPJk0yuyWiHftYMNMWOIPwQRVEW4ptEtLTCRcJ38ZA
         s5vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712576935; x=1713181735;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lMDAeYxA+8h9mLgRvt8CuTix6N7PrmKJtS5hTj3/DdY=;
        b=UepEr4z6Hkgx+H5c7XjIlVX4oy2ulPvfV5eNs7LR/eJZAWPr3VW9j5BQHpHMer55SD
         nskMK5XerdWOwOze4kqDMguckeIZmZMnfp27NnfKxrD55ViQDFcJbEGRjiUsFVGbRwEI
         evvAQXOGpvXFa7XB3lqnJIJlViolyTc3ns5oK8dzMrMJvPPkYu5JGRPoWPXtCkYgTJpO
         KO9x9GFRHh+3Jy1+KY/CU+O9lcSCNhKLSWgc+qPMdmB8IwyDecaGd+jKXUwmD3HCk10s
         06VE6ubr8rR3PQNLDL0ap9Ox7cdn+x3NqC6knX1W6eEE2WrSFezu9rWep+HgykXIxyDj
         k3yg==
X-Forwarded-Encrypted: i=1; AJvYcCV3gkSTjSxLvw3E90YUzyXs19Va51ZyAgZbDTCGlp/R1UuhsGVEYVOGGDNnoM/itWODDp4NZc9vyicoxcE10t1gzGKNUnRM0NqCF2rKdw==
X-Gm-Message-State: AOJu0Yy4ik9DxaUsyMtlTgE6lK5qdx+o0NXQaAfjQ6fInuQNoeb8xeiY
	Km2zjAZ05HYtlQvSlxvXubihneFq4z4w9Yey1Fo8qMUQUznHie0fg4M7BQLN6f3kc/3+51I7RvT
	kiocutUg4X2KHI09BOPT9Bh5jZPKC46H/h71WkA==
X-Google-Smtp-Source: AGHT+IEXbwNzz9Y0cju5mewgKB6tApslQjL/V6ufIamJWV4n32/Ilr6oM4Az1DFmVNbM0DNXTBhyeV/ujVlibxbgq98=
X-Received: by 2002:a25:2981:0:b0:dc7:4bc5:72cf with SMTP id
 p123-20020a252981000000b00dc74bc572cfmr7010513ybp.14.1712576935548; Mon, 08
 Apr 2024 04:48:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240408-qc-pmic-typec-hpd-split-v2-1-1704f5321b73@linaro.org>
 <ZhOYpHXz6t0fkzZ2@hovoldconsulting.com> <2ejpom6ykci6o7d7luwa2ao4stpm24aoyi66aoncxcqcwgidxz@gcsqvpb3s7nr>
 <ZhPYjXjX3LcCMhyh@hovoldconsulting.com>
In-Reply-To: <ZhPYjXjX3LcCMhyh@hovoldconsulting.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 8 Apr 2024 14:48:44 +0300
Message-ID: <CAA8EJprJn-sq1Xb9E0bJD814CepKPzsD=xCFAKFeCGjj2Tv9Dg@mail.gmail.com>
Subject: Re: [PATCH v2] usb: typec: qcom-pmic-typec: split HPD bridge alloc
 and registration
To: Johan Hovold <johan@kernel.org>
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Caleb Connolly <caleb.connolly@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 8 Apr 2024 at 14:44, Johan Hovold <johan@kernel.org> wrote:
>
> On Mon, Apr 08, 2024 at 01:49:48PM +0300, Dmitry Baryshkov wrote:
> > On Mon, Apr 08, 2024 at 09:11:32AM +0200, Johan Hovold wrote:
> > > On Mon, Apr 08, 2024 at 04:06:40AM +0300, Dmitry Baryshkov wrote:
> > > > If a probe function returns -EPROBE_DEFER after creating another device
> > > > there is a change of ending up in a probe deferral loop, (see commit
> > > > fbc35b45f9f6 ("Add documentation on meaning of -EPROBE_DEFER").
> > > >
> > > > In order to prevent such probe-defer loops caused by qcom-pmic-typec
> > > > driver, use the API added by Johan Hovold and move HPD bridge
> > > > registration to the end of the probe function.
> > >
> > > You should be more specific here: which function called after
> > > qcom_pmic_typec_probe() can trigger a probe deferral?
> > >
> > > I doubt that applies to tcpm->port_start() and tcpm->pdphy_start() in
> > > which case the bridge should be added before those calls unless there
> > > are other reasons for not doing so, which then also should be mentioned.
> > >
> > > I suspect the trouble is with tcpm_register_port(), but please spell
> > > that out and mention in which scenarios that function may return
> > > -EPROBE_DEFER.
> >
> > The probe loop comes from from tcpm_register_port(), you are right.
> > However then putting bridge registration before the _start() functions
> > is also incorrect as this will be prone to use-after-free errors that
> > you have fixed in pmic-glink.
>
> You obviously have to mention that in the commit message as that is a
> separate change and also one that looks broken as you're now registering
> resources after the device has gone "live".

No. I'm registering a child device rather than a resource.

> So you also need to explain why you think that is safe, if it should be
> done at all. You're essentially just papering over a DRM bug in the
> unlikely event that probe fails.

Unfortunately, as pointed out by Reported-by, Caleb has actually hit
the probe failure loop.

-- 
With best wishes
Dmitry

