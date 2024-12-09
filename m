Return-Path: <linux-arm-msm+bounces-41180-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D0849EA32E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Dec 2024 00:52:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CFBBF282523
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 23:52:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14EB61F63F1;
	Mon,  9 Dec 2024 23:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KZy/V4FA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2169519ABD8
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Dec 2024 23:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733788370; cv=none; b=GBRtd3sCEOPty2SPWYupTfYbDaAbDW4DMOlzy1tL8l79D5xxDxCRIEMU5OHLTqGbw3knDFwQ2wxfwc6yI7UB5AfNhrtzdvYabAts7ukUjWTbA04bhULKHApMVxK9jAu+o2AqQc82OByCHVGOWLiMZlJ5FwnFcPa4qEOYlqrtZOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733788370; c=relaxed/simple;
	bh=ee9Yq/Rd/pSfnwyk+Gw8BNSUwK2jpwcl/Kc8CNSpHtQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O998JJAts2zqveJ3BMHQidad4kTVAFw3oliHSRMxY3fbWjpj6RDX4i9HePgD4uuTCYRtbZxuQ9enRtjjnH7ZZnZFfQ5UoqthmDjqnbUzhhR4KmvRP26jWBTq9FBFpR1H7513ESPpeR771TP1oPfQelWWNqF2HaDyMr9Q8fiLo60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KZy/V4FA; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-30039432861so32290751fa.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Dec 2024 15:52:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733788366; x=1734393166; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8pM7U1GSGMw58mKFSa/5KwQJ4aVmx/cTtBUSfrJJX6Q=;
        b=KZy/V4FA4JmjcMWKJzC0CMi4z9PMTSG9duuO62z73+pvK95akpS8I8uoMottvAazcu
         twcSM0ZjqOKjrCNvxkT+/EgkKNc9MZ6DESiy8jAvXyeU4w/AEZ7KuUNGfr1y8kiW8CWp
         JyTvKEHXSh/0MsyuGriBZFZvL4OdUT6H79g3hpZN9NTPGBsPg3sngiEoHRh91YvHQ6S+
         wWgMEqD6VEEr4XeJxqzVW/7IsabapXPa/lVHbjEjwFOSHY8e+k/6vxNQFmf9i21rncEo
         UBgD1mMjKSAGoBNaLzbrUjAJdz+1pI2TUrQap5gXtzDnwr7yqlYtkfSVbIvNl1Jc8QP7
         mQDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733788366; x=1734393166;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8pM7U1GSGMw58mKFSa/5KwQJ4aVmx/cTtBUSfrJJX6Q=;
        b=eOXBUpfAYQatlpnWQlX6yRzDkUYHBQDbfip2hNpH/1YRKO4bd51pBDh2dv0y824Cn0
         b6R8h97f8ZRlSbYdWZdHmDaAlC+JzdHhu738fbfbgPsTR14McOx7MkXs4wRKKvciCPag
         gUQCieu5iHMAd0NwTHjgNoQdkHHoLsQ5heWfJrSPOpGU7ezQk7by8FH+Q92MnegesECq
         9a5TAaatqhgzMZv/PwLyDGLS0p6wKIXnFphjIfTuGmcZ5Tx8+98jUH55D7EC1ytY3M9X
         pSOlZzcYnVuCSU/lmyyGVmsrZYMuGOsRIkl2AYL7CwsctfFu6lTqiRK2dhPU+XpRIqHo
         7aMw==
X-Forwarded-Encrypted: i=1; AJvYcCWSsmal/uo+9fBfxkOxWgd8Ga68ZVbGvUk1yF8cJFCLc2lHBM6+sY44BEEkjFr88O90HUGe36QAKhAPvsvw@vger.kernel.org
X-Gm-Message-State: AOJu0YysGKhsXOVQ32FpZQ93M0sIANO4UlCH/n8CotgVywFbG5lTPxnU
	50VYXS46iBpFiK1f2XpCxsUc3Wj56monZFrbCNpUiWBXCnhGw5tUdZWxA0PbzTU=
X-Gm-Gg: ASbGncuIDc1WURlhIjXVZuKixt5/iTqHY28Quo2NvZJ4t4D4NMX8HCaowIsXnetxlF9
	Whix7zydZvgnYvEX//Ny/OQDNgB261ka0c5jgD2OGWqlpu1AQDK9h86UKUWgxB/01HHZPDjuzmv
	qtZc0MQEuwCFGSHy6Nf4Vt8Jl5UcXevgjSrZ9E445/7sWSleq0U9OEoHabpj8pB/uCqAlrxJgKC
	xVf9kymLZEjpprpPQass/dmt7XGmWIWK3qXlAPJ7kwXlZfb7e0ibR4xAY2IkGxN+hUiAgCxAEbc
	BjS8ca4JonrO1wh8YKFPpqqL7/PePtlPoA==
X-Google-Smtp-Source: AGHT+IHyF5rktCxD8kY/bacLUOJzx36QikPDeY4Bw3Za1LgYmjbnjgANCIKBZa1aDn+yZRzJ2gM1lA==
X-Received: by 2002:a2e:b8d0:0:b0:2fb:5035:a03 with SMTP id 38308e7fff4ca-3022fd42e9amr6845101fa.14.1733788366224;
        Mon, 09 Dec 2024 15:52:46 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3021a5fa257sm6740481fa.81.2024.12.09.15.52.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 15:52:44 -0800 (PST)
Date: Tue, 10 Dec 2024 01:52:43 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Julius Werner <jwerner@chromium.org>
Cc: Douglas Anderson <dianders@chromium.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Jeffrey Hugo <quic_jhugo@quicinc.com>, 
	Roxana Bradescu <roxabee@google.com>, bjorn.andersson@oss.qualcomm.com, 
	linux-arm-kernel@lists.infradead.org, Trilok Soni <quic_tsoni@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/6] arm64: errata: Add QCOM_KRYO_2XX_GOLD to the
 spectre_bhb_firmware_mitigated_list
Message-ID: <w725lby34vpavm3knq3ikz2wb4tzlfr4elbgf25mjbvgamtq5t@zgc52dc2wvsy>
References: <20241209174430.2904353-1-dianders@chromium.org>
 <20241209094310.2.Ia3dfc0afadbfbee81bb2efb0672262470973dd08@changeid>
 <wx6qbdbcrvbq34snzkxawlbpxm6vogt5ccjmdqqyazukfbjy7t@qkvax7tr27bs>
 <CAODwPW8mq-saJuTYnMhA6bCopcjQwBxEoyWhQB60Jg1m7wUZkw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAODwPW8mq-saJuTYnMhA6bCopcjQwBxEoyWhQB60Jg1m7wUZkw@mail.gmail.com>

On Mon, Dec 09, 2024 at 03:34:59PM -0800, Julius Werner wrote:
> > > NOTE: presumably this patch won't actually do much on its own because
> > > (I believe) it requires a firmware update to go with it.
> >
> > Why? is_spectre_bhb_fw_affected() returns true if (cpu in list OR fw
> > mitigated)
> 
> That affects reporting, but the mitigation works by making an
> ARM_SMCCC_ARCH_WORKAROUND_3 Secure Monitor Call to firmware, and that
> only works if that call is implemented in firmware. Trusted-Firmware-A
> is currently the only open source firmware I'm aware of that
> implements this call, and it only supports Kryo 4 and 6 upstream (not
> 2 or 3).
> 
> So in order for this patch to actually be able to do anything other
> than report that the mitigation is missing, it would need to run on
> devices that either use a downstream fork of TF-A with added Kryo 2/3
> support (I doubt this exists because AFAIK Kryo 4 was Qualcomm's first
> attempt to use TF-A) or use some other proprietary kind of Secure
> Monitor firmware that has this SMC and mitigation implemented
> separately. (It seems unlikely that Qualcomm did this in their QTEE
> firmware, since if they had they would have probably also added the
> MIDRs here to Linux to activate it.)

Ack, thanks for the detailed explanation.

-- 
With best wishes
Dmitry

