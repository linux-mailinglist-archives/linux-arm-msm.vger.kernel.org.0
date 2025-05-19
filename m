Return-Path: <linux-arm-msm+bounces-58449-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DAD6ABBD5D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 14:10:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 65D46189BCF9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 12:10:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED27827603D;
	Mon, 19 May 2025 12:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Y42JWilf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 219EF275871
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 12:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747656621; cv=none; b=qniETPBlyhAo/vldCzNvYa3zL0+Tqku0gviFPqw305xIyBy/FQdJDNJXJzrtOzAQvEtMCGgIk8XA7jsftJBJQLj/PPvTPo+zuYEVUPb29XFRclpVIwcD24+PEGPfuA+8ht/Al/h0eOAvNqU4zXUhQuWqMHEzBJVkz+Q/Ia5McJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747656621; c=relaxed/simple;
	bh=wBqYj+sCibCFcOQCkUndDtj3Y9xZcCxYLzSWlnzdhVY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ki9Hs+kbmkFNyZTAGmhMtDfnJfrTxqFMLB64yiJa8PG6oDrjn32qg59SlugteM3syPms4EVEgM4EW8nHEkE5aKcAct+53qYDckfc839lOgLlrX4alRCbGT1kJJmvb9rRqqhxGakR26TpxDthJHRCHe2Ui65WqfAzP7yiVY3wB2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Y42JWilf; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-acb39c45b4eso617138166b.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 05:10:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747656618; x=1748261418; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6baiB+VhScKnBJFcGjroRlH3n+JmifYkI1E83/dxc7w=;
        b=Y42JWilfvyOTDfm+G3JB7ZQzihbbGbZvYtou5dFrKNfLz45GX89Z4YfZIf2gCuP8DQ
         frZ97WAM4HFSw4a6JV+7rEJwOHz2kZQ5eDSwT2hTLybQlfp3C8L+QhEJHtrGlpB+lPBU
         oGadJ4mRb5ox+FXktghA5Mw9cywKdv/QESeXSCl1krM10Xs2YkrYCvoAV9V0WIW7DiWs
         r5Jfwjr+lI1m01Mlp7dZ0YNhHKTfLCXrr1/Ne+J7LD+m6PJEOwimfyOEWdK2VHlsAbvo
         c+2RqPtqnM8fqyXrG8dUZJCBvw+CWUO7BhAeufhkyn9dQqoxQ2iQYya83l8IRCvW6RRZ
         oHHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747656618; x=1748261418;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6baiB+VhScKnBJFcGjroRlH3n+JmifYkI1E83/dxc7w=;
        b=ETeEPQaBbDuNd6I4V+K9mwj3ppNsGUsSTiWMF/448d9xd77Mtz1tn1UaLLbFl9bKU/
         zqsymPRBHOoBVBOEMJ6PndaKC2Kr+bCgntqt4odtTs17kLkd6hd2BUvcE+z3VGA77nTA
         oLMjZ4EI41o1MfqgkOjV9jGdQakN9UxVDAyKuqWl7j7LCYoavsC2taZ/Rvtz+PyFDmx2
         hyQjcuSG3eg7/BdFdDnh2ONI+p78vbxPbWZ/ro/tIdbrmW1YSjWjIhxM0D9gD5sLR9cz
         LgAIvZGn0hSNaXV4KUfNhaMETQJYvRpP3q+OR/werqD8qj2rrPE5YJc2qEpSV+P4t5aT
         ryvQ==
X-Forwarded-Encrypted: i=1; AJvYcCVuaK7sziZYg79ms82EqgoFebBYkejdpzEKBB1wQTeCAbo05SguMo6EgSx4Vp7lxJW1gVgMo/VSnyn+Y0sd@vger.kernel.org
X-Gm-Message-State: AOJu0YwKcoqbG77cKUpRdK24fhzzwzmk6My7Wl5Slg4T+wgdvyZyMHhO
	rwQcXkJIddCSJ0xOK0r0lEJEnkWkXH1Iq56tWHElPYrEWHcWEBjxv/oKy4bePULydg==
X-Gm-Gg: ASbGncvCl7Yyjz1okaioOZFH5tJ6OAOC1/TlLK00T2Unjipm3dzgGkc2VPUePfYE/s6
	/A62QU0aavWtE/EzN/Do0+xpewjHZa7jSIDKmgFfu2QA1PEnS7zonAv0H/9KrlNCtKjGFkDJgsC
	BcaLYyWkozXH3XJgyAlWzooZPTd4QzmlJ+z0v75IJMewCvAI2/sAojXsRqiYBfLH+kGZtClkIqr
	qA7Z0ADMvt8F5TuD0TphQRv0HNLx9YttznPvkG89kKQ9w1JQxgFii82sK75HpKpfAekP4XPeWH8
	FxA5RCgRrPT7l2Zx0WfFkQpJ9EgBXPHTRacTawpCjjPFlRnP5//jFR4hEIMykOr/IO1C/a6BjCu
	og/6h1t/VooB/CqhZvC3GTUgrt78i8qytUA==
X-Google-Smtp-Source: AGHT+IHpTwdnK5YFZhkdVK9LBLESGLHcc/FhT6MMJ8mFqjOpeOo+JiJr1fFrHlhNHE5cLqHy2HqRNQ==
X-Received: by 2002:a17:907:7f16:b0:ad5:5210:749c with SMTP id a640c23a62f3a-ad5521075fbmr644487766b.22.1747656618307;
        Mon, 19 May 2025 05:10:18 -0700 (PDT)
Received: from thinkpad (host-87-20-215-169.retail.telecomitalia.it. [87.20.215.169])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d04e80asm580893166b.2.2025.05.19.05.10.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 05:10:17 -0700 (PDT)
Date: Mon, 19 May 2025 13:10:16 +0100
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Niklas Cassel <cassel@kernel.org>
Cc: Laszlo Fiat <laszlo.fiat@proton.me>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Heiko Stuebner <heiko@sntech.de>, Krishna chaitanya chundru <quic_krichai@quicinc.com>, 
	Wilfred Mallawa <wilfred.mallawa@wdc.com>, Damien Le Moal <dlemoal@kernel.org>, 
	Hans Zhang <18255117159@163.com>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH v2 0/4] PCI: dwc: Link Up IRQ fixes
Message-ID: <jbl77lwvxvjeeaed5jiavv3nwfctjqpuhvbzha2fucsdgoulss@u6xjrckk4so3>
References: <20250506073934.433176-6-cassel@kernel.org>
 <7zcrjlv5aobb22q5tyexca236gnly6aqhmidx6yri6j7wowteh@mylkqbwehak7>
 <aCNSBqWM-HM2vX7K@ryzen>
 <fCMPjWu_crgW5GkH4DJd17WBjnCAsb363N9N_h6ld1i8NqNNGR9PTpQWAO9-kwv4DUL6um48dwP0GJ8GmdL4uQf-WniBepwuxTEhjmbBnug=@proton.me>
 <aCcMrtTus-QTNNiu@ryzen>
 <5l0eAX7zaDMDMp1vJhvB9MVKXSPn3Ra0ZiP5e2q1E4rwmADBB6MlREZO9cuD_zvclAOhhBE0-NFthVbOajeSCfYjchT-83OgLbjclOgx3T4=@proton.me>
 <aCr9cYhtcBJZ-9Fj@ryzen>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aCr9cYhtcBJZ-9Fj@ryzen>

On Mon, May 19, 2025 at 11:44:17AM +0200, Niklas Cassel wrote:
> On Fri, May 16, 2025 at 06:48:59PM +0000, Laszlo Fiat wrote:
> > 
> > I have compiled a vanilla 6.12.28, that booted fine, as expeced. Then compiled a  version with the patch directly above.
> > 
> > >  We expect the link to come up, but that you will not be able to mount rootfs.
> > >  
> > 
> > That is exactly what happened. 
> > 
> > >  If that is the case, we are certain that the this patch series is 100% needed
> > >  for your device to have the same functional behavior as before.
> > 
> > That is the case.
> 
> Laszlo,
> 
> Thank you for verifying!
> 
> > 
> > Bye,
> > 
> > Laszlo Fiat 
> 
> Mani, Krzysztof,
> 
> It does indeed seem like the reason for this regression is that this weird
> NVMe drive requires some additional time after link up to be ready.
> 
> This series does re-add a similar delay, but in the 'link up' IRQ thread,
> so even with this series, things are nicer than before (where we had an
> unconditional delay after starting the link).
> 
> Do you require any additional changes?
> 

No. Sorry for the delay in getting back. I was at Linaro Connect last week and
had to take some vacation for the first half of this week.

It is fine with me to add the delay only in the Rockchip platform where the
issue was reported (next time please mention the issue that triggered the series
in the cover letter). But I do not want to add the same in Qcom platform as the
delay is not strictly required as per the spec (if I understood it properly).

So I'll merge rest of the 3 patches.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

