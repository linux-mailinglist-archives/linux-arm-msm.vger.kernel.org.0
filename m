Return-Path: <linux-arm-msm+bounces-13587-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 37E9F87497C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Mar 2024 09:23:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CB64B1F210E2
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Mar 2024 08:23:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C5686306D;
	Thu,  7 Mar 2024 08:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RgZVpI2a"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 582371CF8B
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 Mar 2024 08:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709799786; cv=none; b=OWccNuWT0V3XoTqd2jCffRvkvH8/QXV83P6XZXqBGpR8+t2l2gV7tnoQzCtynNtutW5nkT/F1j3pI9hzGJDbT21YfmDSlZTyXIEJqCeqUYzLY97K6ugY3OCYevVItCzJ8pH5YX0dI1eO5yLyrNcL6JuArAJUlgADWFKklU3HUnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709799786; c=relaxed/simple;
	bh=c7DU7j1T11TpDZaT0tyl9BIJh8qXovMj5Xh/pKI1SjM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kYmxJzmTMOLr6TYO4WbnPGf+7xpHdLVejKMX3H7mHCl9edCxr9bb7bFo94dRh7bhSXP/ItOvQLc4ziXqb4wfI5DAScoyEYnNo4UuSF5u+4pwuNIidCx8yN8AKrcvwsIK0mgJs1GfpB0021DTFU7EQFqjOTBeYWlDcVTltfaxEK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RgZVpI2a; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-6096ff3e4abso5600007b3.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Mar 2024 00:23:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709799784; x=1710404584; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BTCDlQMgEr5UEnpV5mDn3dJxhyjjt0R5yPNztDHuRWA=;
        b=RgZVpI2am6/GI15D1D4hI8zwL8t0VmcPmEejTBQpsiE8+uEUjS8UmS8kuf324X76Mw
         ONy+yYJHOCT6yYbCB9VHBPEKZoVkyEPibwDbzGPjV+bppR8YNjW2FQF0NgY7lHM5dcCP
         IkrF3m/OqYv0yNU+p8llY/cDUWDQejUluw+C6b31jrCDBfHOHDHQ9Ai5WFhPTW2kp7XH
         wo4Kq5Kh9GmQafI1OZ5cjx9bsz9DVcsvShpoZqSbrWwTSOxXAkUMe4KIjW+ZELr2p2Lz
         +NHrs+dbw/qAx6K6Q4KpMxU12nq+tY+uZ5KUGr+fePYo312vdlrStCOoSiAo7hlhZLaE
         vBTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709799784; x=1710404584;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BTCDlQMgEr5UEnpV5mDn3dJxhyjjt0R5yPNztDHuRWA=;
        b=VjhgVEmhIB/yYwbwR+q395w5PCNgAoYnblLe0L58Dc1PXDx+b5kX4JSUNfSq5gOhkn
         HjxZXygdkqQjq2PLU7A6bBxmN/cs88AzWnk8rZu9oQA/KzSZnFA0XN3tU5+7JO/8cZ4r
         +QMYY4nCjJV/qC0adcbHoCkVRfA+n99Ye5lqFBp2Z0Gb64sU1tU+Nva0nSZXZyYjatyR
         ugIWHbjk9DyO6gTkaGDvMeOOYQ2jj65s91yR7jTJcbs6YcdfL7UO3n2l3jYcIcpaM2kk
         61fkWJ72PioemGBn3322QPhznWejaZ4W+gMZZGt4qNF6ygHG+5X4cyxHsyFUEdxBkmxG
         0C/w==
X-Forwarded-Encrypted: i=1; AJvYcCVkg1nV207vV3jlOYt3eFTRcJd59ADViCq5CeOGJj+Q+JeJhfrTdADM+DvNwPF1Ca5KgpvobWC6w3QBWppCUcXKJtkOKheSszRxnVmUYw==
X-Gm-Message-State: AOJu0Ywsqh4lfqPUMmFR0cKO5f22qJPV16SlMtUlAHm9Ocz3VK04jTSi
	hefjQmultb1i2Qpb+8EIUWFPBsqxr+6Nyi4WKpU+EoDEWfJCbIUJzbmFekSyGwFHc9eZJdKchwy
	zTtvQNYcBc7k01/6t1CdHrvEUypAb5PDezGsRFQ==
X-Google-Smtp-Source: AGHT+IGtlINLMOBpnSyCH2ZmpwWY+N46YIj+jpgvXOKi2Jcaj1+sVPOFaJ/lVWVfwLTv+DvW59tvQrS42RXoxx6CtmY=
X-Received: by 2002:a0d:d882:0:b0:607:834f:b4c4 with SMTP id
 a124-20020a0dd882000000b00607834fb4c4mr1560071ywe.29.1709799784322; Thu, 07
 Mar 2024 00:23:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240306-wcn3990-firmware-path-v2-0-f89e98e71a57@linaro.org>
 <87plw7hgt4.fsf@kernel.org> <CAA8EJpr6fRfY5pNz6cXVTaNashqffy5_qLv9c35nkgjaDuSgyQ@mail.gmail.com>
 <87cys7hard.fsf@kernel.org> <CAA8EJpowyEEbXQ4YK-GQ63wZSkJDy04qJsC2uuYCXt+aJ1HSOQ@mail.gmail.com>
 <baa7a017-ee4b-4e8f-9bb8-1e3857e18855@quicinc.com>
In-Reply-To: <baa7a017-ee4b-4e8f-9bb8-1e3857e18855@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 7 Mar 2024 10:22:53 +0200
Message-ID: <CAA8EJpq780+=b-XEShsS4ixtpOJxwigvR-E0nPJ1Xz0CV_eO4Q@mail.gmail.com>
Subject: Re: [PATCH RFC v2 0/4] wifi: ath10k: support board-specific firmware overrides
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Kalle Valo <kvalo@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	ath10k@lists.infradead.org, linux-wireless@vger.kernel.org, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 7 Mar 2024 at 00:25, Jeff Johnson <quic_jjohnson@quicinc.com> wrote:
>
> On 3/6/2024 6:23 AM, Dmitry Baryshkov wrote:
> > After some thought, I'd suggest to follow approach taken by the rest
> > of qcom firmware:
> > put a default (accepted by non-secured hardware) firmware to SoC dir
> > and then put a vendor-specific firmware into subdir. If any of such
> > vendors appear, we might even implement structural fallback: first
> > look into sdm845/Google/blueline, then in sdm845/Google, sdm845/ and
> > finally just under hw1.0.
>
> are there existing examples in linux-firmware?

Yes. QCM2290 / QRB4210 platforms have "updated" wlanmdsp.mbn file,
which actually prompted us to work on these overrides. I have opened
the MR against linux-firmware, marked as draft for now, until all
discussions are finished:

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/165

> or is the whole point being only the default firmware is in
> linux-firmware and vendors would follow this pattern if they add their
> own firmware?

Unfortunately not.

-- 
With best wishes
Dmitry

