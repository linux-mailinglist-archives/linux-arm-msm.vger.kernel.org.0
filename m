Return-Path: <linux-arm-msm+bounces-44684-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 86A79A083B0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jan 2025 00:54:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 697C6162F28
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 23:54:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E62E2063DE;
	Thu,  9 Jan 2025 23:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ci+fUMwT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 175242054EB
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jan 2025 23:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736466883; cv=none; b=olWUeGB0D43Wh7WLhqPla4CWWef5eJdyoSw9U48VnkH7dr191MnSmPksm5I4SSPuavgMzm+Iq8tKbTCP9D2qbKe6i3Nv8rp8GZ65UZDTsPCOu8wGICsJyEos4y5sakd+erR0yUeOpWcLnh6w3OvF2CS0jov7GrJTx75Nxn4mjnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736466883; c=relaxed/simple;
	bh=FjKK0rI8Ms9lkRFrMPcOVJOxH3kjCjHVUFI2nxmoACo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PXEWk68FGk214o32lP6fOzBYVt89E3tc0REKo17sVouywAqvJpnBg3rGkA9U/GUDi7Sa8hJ3I92li9f6AoPwNFY1DAgEu+TksrJPlQD4UtUXQiSueGJKvDC5EUquHhT+QHBHtpolMU5O2++D8Pg/ztJgLpYF+7kx2O0OTS1P/7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ci+fUMwT; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5401e6efffcso1578321e87.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jan 2025 15:54:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736466879; x=1737071679; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FRNnDNKo7frSuIUs5Hy6anVWpgbvz5zJrTUHbShG9EI=;
        b=ci+fUMwT5k7py0XlkvsgCOMWoUMhBqFcF1k06fk1yt8cVsapMA0t7C4+QeEZhpkolj
         sJTd3/AoVlL8xXTThlB6sxjZAYWg4Wl5el7bYBklF/8JMwh+Eah+iD0WXFNoiv7CEanp
         7u57eitWdWueothh9oNtG4ekyCo0G+6EsvRtmt/GXqPlh/rgY53NZ9mKDGMTDkal6DdQ
         5xbZtPd/KCU01yauJbog4CQ8O1kx5+sJz/fKYmYV36wMM8BDCyDE9sqUjQ1BNfW+cqMF
         v5ycizIQDTKlOj3FDcTRfnZP16MMJLzxRxT559grO3VsT/dFhOl2mCdTgYWIEY7yT/S0
         UIdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736466879; x=1737071679;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FRNnDNKo7frSuIUs5Hy6anVWpgbvz5zJrTUHbShG9EI=;
        b=iFRciacQmY56bS8ypip23+3bLuI8VH+0zc0DpGbzFmhf73S9dzCIQi9PlKXDy9bZSY
         KIaDDiyxiBVcyc/NE66gqudNeyogjSUEAYAi8Hsf553FfFmGs4poDX6Lr4nDV+8CHkvH
         TqZOvWiGe2tyFAs7Rear2QHMgBNqnCRerOBWQawZyJ5j3QrfN7fICkxwGxtrAKlB/H1p
         wIMYNYEU1NcFJUTWkeK27Ktw7qLkj9cmDSnCjDbHVtorNLikpI/IwrXkjIxKpMa8T7HQ
         m9DTSJUDXin8TgipzF/Z9FdT6vt8dyavTkcuVLp+WTNuFJkmdSOoYbKHlQw3vG1gyiSQ
         0w5Q==
X-Forwarded-Encrypted: i=1; AJvYcCWzSmSZWrpb1SkwSEKbOGR3RS78vM2BPEZD0A7otpXpam8bKUZyGsRS4WcSEZXVkhrzFg3+UdHXiBRTshcC@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9q+pbOo6WgfI56gcl9IQcZVBxESjKvHlgXV9xzdxSO7CB1SsS
	C9e65ZDBpz2NU/YycyfHvB5n871BBByBVXqyE9AMn+ksBjdGgVL3mJQdWIk5Yfc=
X-Gm-Gg: ASbGncsm8Jc2yanOLE+ckeu7pwjyXiEyEphwuRBpyb/UwDDIPX1UVDV0B+AS0MPBMwl
	1fE2fRYxE0j21/n5ayzCq3KRTYBUs22/LLe3G52ORYkfoMJHk+rztby2vRApMxxinxU9tQTDS25
	O1qgNFc3QseNbd3LWpipHo24jz3lVyG7WTJGUtUI2xZxzox91pOkPqPumfJIPs1qVvwexWt/8f6
	bhmO3rg/KWLkQFrXzb0wHAmrK22BSOFFi0u2odeV7lt2ThJ1gJ/2M7q2BatMlWAchtM5Y+8j9DU
	j3YRQVB/ub3boxOEE4Hv6pF2izRrWFJUdqKj
X-Google-Smtp-Source: AGHT+IHLuIQ06TZzrrj4vtwF/OP2Cww1gDE4ud7HhI0ahmVJGuMiFw0HoTdSaptnu+mwHQq4vYxZvw==
X-Received: by 2002:a05:6512:398c:b0:542:213f:78fd with SMTP id 2adb3069b0e04-54284815fcdmr2023405e87.40.1736466879189;
        Thu, 09 Jan 2025 15:54:39 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5428bec3ee8sm336598e87.226.2025.01.09.15.54.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 15:54:37 -0800 (PST)
Date: Fri, 10 Jan 2025 01:54:35 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Manaf Meethalavalappu Pallikunhi <quic_manafm@quicinc.com>
Cc: Wasim Nazir <quic_wasimn@quicinc.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel@quicinc.com
Subject: Re: [PATCH v5 6/6] arm64: dts: qcom: Enable cpu cooling devices for
 QCS9075 platforms
Message-ID: <6zftdu5myuporxsvxlxhojnlhnfa74pjj7nvy3wmiaw7jdsuo2@3ebcpevzvtlc>
References: <20241229152332.3068172-1-quic_wasimn@quicinc.com>
 <20241229152332.3068172-7-quic_wasimn@quicinc.com>
 <zn4uf3mmlmt3who474hwkr44poycfqtjtidshybbg55a3hr63y@zxefqbhiwkbg>
 <d54c6706-3c6b-211c-6acb-fa3984c30c67@quicinc.com>
 <ubasbsyspn5euygihgphyw3xg4ckveytvgnjpwdiyg4pv7degr@6y44ya4gvaqj>
 <07c41571-28ca-6f9e-bcee-899bbf77f687@quicinc.com>
 <sufmykle5inyk73i3qfmy3xqq7plgfr7txiruyahc5wgvvn6uo@kytxtb5zc3tg>
 <cf2ad828-d00d-133b-f310-1688fc0ed59b@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cf2ad828-d00d-133b-f310-1688fc0ed59b@quicinc.com>

On Wed, Jan 08, 2025 at 09:38:19PM +0530, Manaf Meethalavalappu Pallikunhi wrote:
> 
> Hi Dmitry,
> 
> 
> On 1/8/2025 6:16 PM, Dmitry Baryshkov wrote:
> > On Wed, Jan 08, 2025 at 05:57:06PM +0530, Manaf Meethalavalappu Pallikunhi wrote:
> > > Hi Dmitry,
> > > 
> > > 
> > > On 1/3/2025 11:21 AM, Dmitry Baryshkov wrote:
> > > > On Tue, Dec 31, 2024 at 05:31:41PM +0530, Manaf Meethalavalappu Pallikunhi wrote:
> > > > > Hi Dmitry,
> > > > > 
> > > > > On 12/30/2024 9:10 PM, Dmitry Baryshkov wrote:
> > > > > > On Sun, Dec 29, 2024 at 08:53:32PM +0530, Wasim Nazir wrote:
> > > > > > > From: Manaf Meethalavalappu Pallikunhi <quic_manafm@quicinc.com>
> > > > > > > 
> > > > > > > In QCS9100 SoC, the safety subsystem monitors all thermal sensors and
> > > > > > > does corrective action for each subsystem based on sensor violation
> > > > > > > to comply safety standards. But as QCS9075 is non-safe SoC it
> > > > > > > requires conventional thermal mitigation to control thermal for
> > > > > > > different subsystems.
> > > > > > > 
> > > > > > > The cpu frequency throttling for different cpu tsens is enabled in
> > > > > > > hardware as first defense for cpu thermal control. But QCS9075 SoC
> > > > > > > has higher ambient specification. During high ambient condition, even
> > > > > > > lowest frequency with multi cores can slowly build heat over the time
> > > > > > > and it can lead to thermal run-away situations. This patch restrict
> > > > > > > cpu cores during this scenario helps further thermal control and
> > > > > > > avoids thermal critical violation.
> > > > > > > 
> > > > > > > Add cpu idle injection cooling bindings for cpu tsens thermal zones
> > > > > > > as a mitigation for cpu subsystem prior to thermal shutdown.
> > > > > > > 
> > > > > > > Add cpu frequency cooling devices that will be used by userspace
> > > > > > > thermal governor to mitigate skin thermal management.
> > > > > > Does anything prevent us from having this config as a part of the basic
> > > > > > sa8775p.dtsi setup? If HW is present in the base version but it is not
> > > > > > accessible for whatever reason, please move it the base device config
> > > > > > and use status "disabled" or "reserved" to the respective board files.
> > > > > Sure,  I will move idle injection node for each cpu to sa8775p.dtsi and keep
> > > > > it disabled state. #cooling cells property for CPU, still wanted to keep it
> > > > > in board files as we don't want to enable any cooling device in base DT.
> > > > "we don't want" is not a proper justification. So, no.
> > > As noted in the commit, thermal cooling mitigation is only necessary for
> > > non-safe SoCs. Adding this cooling cell property to the CPU node in the base
> > > DT (sa8775p.dtsi), which is shared by both safe and non-safe SoCs, would
> > > violate the requirements for safe SoCs. Therefore, we will include it only
> > > in non-safe SoC boards.
> > "is only necessary" is fine. It means that it is an optional part which
> > is going to be unused / ignored / duplicate functionality on the "safe"
> > SoCs. What kind of requirement is going to be violated in this way?
> 
> From the perspective of a safe SoC, any software mitigation that compromises
> the safety subsystem’s compliance should not be allowed. Enabling the
> cooling device also opens up the sysfs interface for userspace, which we may
> not fully control.

THere are a lot of interfaces exported to the userspace.

> Userspace apps or partner apps might inadvertently use
> it. Therefore, we believe it is better not to expose such an interface, as
> it is not required for that SoC and helps to avoid opening up an interface
> that could potentially lead to a safety failure.

How can thermal mitigation interface lead to safety failure? Userspace
can possibly lower trip points, but it can not override existing
firmware-based mitigation.
And if there is a known problem with the interface, it should be fixed
instead.

> 
> Best Regards,
> 
> Manaf
> 
> > 

-- 
With best wishes
Dmitry

