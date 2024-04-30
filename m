Return-Path: <linux-arm-msm+bounces-18941-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 584D08B751A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Apr 2024 14:01:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 140B0286363
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Apr 2024 12:01:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51FB113D289;
	Tue, 30 Apr 2024 12:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BpxXjIY9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C421E13D26E
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Apr 2024 12:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714478460; cv=none; b=rR82b5huwsXqqy+IlQZKj03l8HLugyNFj7uKrfHtkZrjEHhrNcjUl6QF1aRwL+saa8Bru7A2ku9vLxLSRzEcYAaPaP7JRx8zj039cHG0p4208ZfMWEATQ7MwB0+O6X3k5h5RbSzBxwSUHiuBjdRflP9ffIqUrBW3NKjSVrFU2iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714478460; c=relaxed/simple;
	bh=4i+oZELfhNBtH5dV47fRsrwUCxoVTACihHsZt/+Av6M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ed/bbY5teu+jbXWOx4gBbxnYA2d3APoRVdX2dnEtJcr99kwNdlffqTSu3segyyO1nzsBQ6GXO2R0EByOkEpAR4U4TnQZSA632QkmY0yRFIEcWDMdvfEozK/+sVUxL7diUgpwKwwpc7ZdDlKl1eXFGuVoWmCLSLHUhyJL6hIyF08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BpxXjIY9; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2a2d0ca3c92so3944473a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Apr 2024 05:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714478458; x=1715083258; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1Z1myKdAdC7HyTTZzja4JHzqozZdoiE8OpsVv5HUH3I=;
        b=BpxXjIY9SXeeMvcA+8kpBAFTJg8aMorOMVAwa0JPkjpgxf1NLkBcmHjrtO8zSQ+u6l
         dxQEWNLKBKJw4ZtQ3Lh75+xLmXS4qoe56MfQP7XyTViq7AAikaXwrGIL6kJC0QD3ZOqa
         2zxSTum5ismBdU59R6UnmHeSqdbH/73k0oW4IINcFFgwvwZHI0LUEs9g43eceSLmnzjA
         h6OVG7sGlYbNxGWffSo7RLYt27vSjbcVwFzUZigckKgMT69Jj9WAWlg5FKKNrVSvqUqN
         AriE0W5TlTW9qPeDhSK0taVPjWkoRORCCO5oiXZ6b3ln/4oPIPGIU8+HeiZsaBrQsma9
         BpBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714478458; x=1715083258;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1Z1myKdAdC7HyTTZzja4JHzqozZdoiE8OpsVv5HUH3I=;
        b=k044u18T4k7ZZ8SAZ2Qi1f2vRcGmTu8GQD9gUtIvyCFTyn4WmOVYH8DSH9h8r4JrYO
         R+gSljn6ITO6dEWIM+ikGF2uXtTw55QYq7d69MgILuXNpINMgiU4FQRud1anoEZHs1TW
         NJEXtYDLpVueSAcJGmfisC3W0aSHKM6UBkmgPfneAg/6OUHo2RJS11XIWRE7hJLciuI6
         3Opop6cUOpAMXssfxASElfKgsz8AXzV8s4fHHEAyCH2Ul81d5qThi0/Bp3fsN+oEBG8u
         Fhd19rGE6KzHkYUBs9d1UYEOSeryZ/URiIYA0aCkv4QbbzhUhaOR55XZQfhgjN8VmMPJ
         96gQ==
X-Forwarded-Encrypted: i=1; AJvYcCVdp+OdifJLPEGzvHumvxCsS2AsBr8DAfmaRpUZM1SwP3x2WSf6WkdXoxNo2GT197CjvYj6BRv4z3vPRCWPD1IDs8ANd51WbDRo8jKBWg==
X-Gm-Message-State: AOJu0YxjNLtTbaTn5hBgWHACJx0s1OMae2tSOmyzsaKcN0+W++W+Sa36
	GL/9D5s1HSEwFEG5/E5DhHASPMkCm6g24xUqYDjPu8ec8uf4DUzzE4DKuwgBISCsXp+GrrNRmWs
	4ZznJFFfaE6zN9OQ8Qx5WtrJJIgGRD8K4QMcJCA==
X-Google-Smtp-Source: AGHT+IEuoO12CTIHP9MUVVJqpOCwqG+W7dUdh4INEBszG2ueQMsjN9KNncSH+zwGVhI1PcUMescz5bfhnoSrw19sGCs=
X-Received: by 2002:a17:90a:a00a:b0:2a5:df97:b with SMTP id
 q10-20020a17090aa00a00b002a5df97000bmr3997149pjp.18.1714478458032; Tue, 30
 Apr 2024 05:00:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240326091616.3696851-1-vincent.guittot@linaro.org>
 <20240326091616.3696851-5-vincent.guittot@linaro.org> <95760e2b-ec38-4f04-8f86-e4f935d24a83@linaro.org>
In-Reply-To: <95760e2b-ec38-4f04-8f86-e4f935d24a83@linaro.org>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Tue, 30 Apr 2024 14:00:46 +0200
Message-ID: <CAKfTPtDhVfpvO46YWmMnVhJmiKUbNJt7d2cvmyXfPJ4g1YZkXg@mail.gmail.com>
Subject: Re: [PATCH v6 4/5] sched: Rename arch_update_thermal_pressure into arch_update_hw_pressure
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux@armlinux.org.uk, catalin.marinas@arm.com, will@kernel.org, 
	sudeep.holla@arm.com, rafael@kernel.org, viresh.kumar@linaro.org, 
	agross@kernel.org, andersson@kernel.org, mingo@redhat.com, 
	peterz@infradead.org, juri.lelli@redhat.com, dietmar.eggemann@arm.com, 
	rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de, bristot@redhat.com, 
	vschneid@redhat.com, lukasz.luba@arm.com, rui.zhang@intel.com, 
	mhiramat@kernel.org, daniel.lezcano@linaro.org, amit.kachhap@gmail.com, 
	corbet@lwn.net, gregkh@linuxfoundation.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	Qais Yousef <qyousef@layalina.io>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"

H Konrad,

On Tue, 30 Apr 2024 at 13:23, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
> On 26.03.2024 10:16 AM, Vincent Guittot wrote:
> > Now that cpufreq provides a pressure value to the scheduler, rename
> > arch_update_thermal_pressure into HW pressure to reflect that it returns
> > a pressure applied by HW (i.e. with a high frequency change) and not
> > always related to thermal mitigation but also generated by max current
> > limitation as an example. Such high frequency signal needs filtering to be
> > smoothed and provide an value that reflects the average available capacity
> > into the scheduler time scale.
> >
> > Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
> > Reviewed-by: Qais Yousef <qyousef@layalina.io>
> > Reviewed-by: Lukasz Luba <lukasz.luba@arm.com>
> > Tested-by: Lukasz Luba <lukasz.luba@arm.com>
> > ---
>
> Hi, I'm not quite sure how, but this commit specifically breaks booting
> on Qualcomm platforms with EAS..

This is the fix:
https://lore.kernel.org/lkml/20240425073709.379016-1-vincent.guittot@linaro.org/

>
> https://pastebin.com/raw/1Uh7u81x

Which platform is it ?
I tested it on dragonboard rb3 and it booted and run tests  even w/o the fix

>
> Konrad

