Return-Path: <linux-arm-msm+bounces-50741-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8818BA582A0
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Mar 2025 10:20:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1B3F7188798E
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Mar 2025 09:20:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5532E1EB44;
	Sun,  9 Mar 2025 09:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YNTemn4P"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90C4D4C70
	for <linux-arm-msm@vger.kernel.org>; Sun,  9 Mar 2025 09:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741511998; cv=none; b=ShQ+ZrKT1fdVQgvQJUDm5d2RTcfLkUYmn2WMohc4Eba9dRdRowPomddMz9fWcIzn+2nT4i+zU/UzQHR9D5YdJvvYlKGCZGRo6ea0osg7beXsqa0LS4D+gDl6TiQZgBHhZoBdYVWOpCGqQ5SmRVmKMkWyYLLBGhJKKeTO9s8NeDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741511998; c=relaxed/simple;
	bh=0ZAWAhuxOjxr7u/uIMgJIAn1ABV87XBqdsAnGT+CbhI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=in2LH2rddXykVjUgM/Lp0kskRc7YkluLFPZT4GSMhZhBg8wx3gTesS1eBp3aXTcVwkFwZeDr0g3Obw6bIJc160ZoG0mEGFdGmC+cKGlwe/i2qAN0BDiQRxlODwba4JJiLCAMcOmSZTptZ+qWq8ULsDAHcuOnxASKZFAgpwkfpVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YNTemn4P; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-abf4b376f2fso605916066b.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 09 Mar 2025 01:19:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741511995; x=1742116795; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bnawI9gS6q4xXdvkElc3iMq/OS/MAXIzpc5pDsTEkWg=;
        b=YNTemn4PJopHRApEnJeYZceTXrcazCxCAZy3l79zRKKEITAFJtnAYSuZPOZiXvsdfI
         8LsGp2PBp/rrhKJCApfF9h9Z9qao/GbX9J5IJilBHq0HWcY3zXS71jTauM5XULzPcjXa
         BTmoCMlaBijeOdqMjIJZpaSBzxpjVC6d63wo5hQ6Flek6u4Fv6wUj7p2SFbrHlJVn5aR
         fMybUYenFjwfoFUnDxozuEl5yWPYli2VuzkuOwMcgUtfh8kzmMTDPOAhf0YeYUpLPhCU
         02jZ8HSQIiT+sdk8bliVtHztlegJvwVq2Ur78a6NY2uEx22HuVw+fKQqPIGMWTcEnlQe
         T/0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741511995; x=1742116795;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bnawI9gS6q4xXdvkElc3iMq/OS/MAXIzpc5pDsTEkWg=;
        b=O7Dh78S7qjP5SIoAaEGcm6+TAziq+IgoM48iWHaO6r3Ek9j4JDgT+piB+wNWrtVjaS
         /Tblpm5IZkWLcJ1/LV6arBe6kQgSI8OUnn6GwMazAHhtoHVciycyIORQpDheFfwyB7lQ
         P6HxNERSHf4EUa6JW8JBheV1fk1/hfYlJQm3+jqgha49q4wiQThemfId/GuwRpKeRw/D
         xMMnITWlTQ//hABZ/lpbJSXugXgTEJFXNrB2nUick5p+zdkTq0+YfKM/kVliyVCKCPzL
         QzLQ+1gXtS1NocmPJwcZ14nz0r9XZf1kAtKvSJ89Z85KZvB/eN4buLNV61CcpkG6RNQs
         FxSA==
X-Forwarded-Encrypted: i=1; AJvYcCWGFZSLXedUvSv6fuEuOamGVGsyhNSXjgmzOOO5ry9QEawLto/tS1DULuB4Ygc/hmsHdKn70aSS0hXNbPi7@vger.kernel.org
X-Gm-Message-State: AOJu0YzHJTCOPkDbVTcQcGNWBzIzS7V41WbC1HQrU4yl5aTBPeXFxLYh
	cUlDgtdVNC/ZyoX0z4U9v4JZaCTz/Fo+qjUiWUGXomCn5wWgPHXtG6cBtxIsQc4=
X-Gm-Gg: ASbGncsaIMzKJzP5eAe0FVdK90ELWc08S9elm+SwXQ8MVlHvYMMve83j37jjFMEchc2
	QSk/Y3r7C9gngRD1okvwYL7GIPyrGvnyGDErPOXxGIZQxBqb4uDdeP+ocphueCGaMVeLi/ceL5b
	NZVdCUzT77F0iAHhAzpvNsrMCSuIK2mYz1xkvbpWWR+hskwWWgjTIGhFPALpn5cFQQY9nIjSlPf
	B3xmLKUrA1YNYoEgvsZNGSsj5p36qTH791zSME4Rxi1yTuNdBbMwSDGHIXz3QXcdXQXB+LGLbE0
	Z2HnrPZ7MhpuR6Moud7bxQ3HhPzNr1IphAxkSHAo1A==
X-Google-Smtp-Source: AGHT+IESTf6qmdwjvFLe5bEatJncsKdd+wPYuoCmsexsSa74nVUaQPgZY8WN12Uery5ZqyTBxFdohg==
X-Received: by 2002:a17:907:3f2a:b0:abf:5fa3:cf96 with SMTP id a640c23a62f3a-ac252a879d7mr922674666b.14.1741511994860;
        Sun, 09 Mar 2025 01:19:54 -0800 (PST)
Received: from linaro.org ([62.231.96.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac29cbf128csm9790066b.115.2025.03.09.01.19.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Mar 2025 01:19:54 -0800 (PST)
Date: Sun, 9 Mar 2025 11:19:52 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Sebastian Reichel <sre@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Johan Hovold <johan@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC 1/2] arm64: dts: qcom: x1e78100-t14s: Add LCD variant with
 backlight support
Message-ID: <Z81dODU91zDPo/H5@linaro.org>
References: <20250306090503.724390-1-abel.vesa@linaro.org>
 <20250306090503.724390-2-abel.vesa@linaro.org>
 <lolqokpczxdscvgj6xdfyxblmle3csgzje3fgo4itzspgmeriy@7zzx7hg2zfks>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <lolqokpczxdscvgj6xdfyxblmle3csgzje3fgo4itzspgmeriy@7zzx7hg2zfks>

On 25-03-08 01:01:31, Sebastian Reichel wrote:
> Hi,
> 
> On Thu, Mar 06, 2025 at 11:05:02AM +0200, Abel Vesa wrote:
> > Due to the fact that Lenovo Thinkpad T14s Gen6 is available with both
> > OLED and LCD, the backlight control differs HW-wise. For the LCD variant,
> > the panel's backlight is controlled via one of the PWMs provided by the
> > PMK8550 PMIC. For the OLED variant, the backlight is internal to the
> > panel and therefore it is not described in devicetree.
> > 
> > For this reason, create a generic dtsi for the T14s by renaming the
> > existing dts. While at it, add a node name to panel and drop the enable
> > gpio and pinctrl properties from the panel node. Then add the LCD variant
> > dts file with the old name and describe all backlight related nodes.
> > 
> > So the existing dts will now be used for LCD variant while for OLED new
> > dts will be added.
> > 
> > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > ---
> > [...]
> > +	backlight: backlight {
> > +		compatible = "pwm-backlight";
> > +		pwms = <&pmk8550_pwm 0 5000000>;
> 
> I've tried this patch series together with the fix series [0], but
> without the duty cycle calculation change [1]. Instead I changed the
> period from 5000000 to 4266667. With that everything works as
> expected for me.
> 
> [0] https://lore.kernel.org/all/20250305-leds-qcom-lpg-fix-max-pwm-on-hi-res-v4-0-bfe124a53a9f@linaro.org/
> [1] https://lore.kernel.org/all/20250303-leds-qcom-lpg-compute-pwm-value-using-period-v1-1-833e729e3da2@linaro.org/

Yes, I forgot to squash in the correct period.

The period should actually be 4266537. This is because the max PWM value
is actually BIT(resolution) - 1.

Will update in next version.

The [1] patch was basically NACKed by Uwe. It is not needed if we set
the period to 4266537 in DT.

> 
> Greetings,
> 
> -- Sebastian



