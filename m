Return-Path: <linux-arm-msm+bounces-41561-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DB4B9ED74F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 21:38:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9FDAD163E69
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 20:37:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD8A41FF1D7;
	Wed, 11 Dec 2024 20:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gejs+bbB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AB482210F2
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2024 20:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733949471; cv=none; b=VX36Sop/L5Yx+waof36H0ihXO9o6M5ddr0ogkIvR79rF8hLtN5Xw6fujnhGsEwPynT0cvM8JnkaKvQ9WVB/TJxu82twyF/dJvWw08Xkx0/KESgsoQP4ZV0EArtQe/szKPLgyQTH0e0EETQGLAYH57ZO9zyyf0URN5NHZRAv1L60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733949471; c=relaxed/simple;
	bh=py3efSUAyRMleagDedwpV2XljaINIU+e6U/z0umBLxs=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=qdygu1AoPBi5eWB+PqCtHK9jX5zMKt7NnFbLaiyP8uvAS9eRU1/dYN59iL4hRh/5EZGtYZi2H8yVcIiPtky2yqaKP9R1ow4fJ5GB21v2l4fWs8ETwFEdek1PlHMY3lakA8gv9bTP4tgOu7rMqqvU8lLn3YVGXVXXKKAc0ViDOwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gejs+bbB; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4361dc6322fso7436985e9.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2024 12:37:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733949468; x=1734554268; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HlaSWtOv+uqBTc8ZWTohBmESKhd/YTad6Sqvxj+0fo4=;
        b=gejs+bbBIH7xBtEifsPyN7YEwSTJuxCzXsUoBzRCiio33Ymlf+BcVhInOm8OxL/xH5
         8ZGWdudPENKYgSruWg6ZauU2dgj0GH35/9cXo6DjxLGS8bCtBlSZdL9VPaNVqAqN0lMd
         MB6eZX8RT+fIwpneFjkwJLoqm6RcIwwxMhYjBf7Qk6GYj/ZGf3lya7x0m5GYFn16uXSy
         vBUCUGi6jUzlCt/04x75yfXWscZVyCPa85Ngzj4ulMw/ctlqIzBeFyb+jZKIqBlAiUq7
         g14zGq6Sm+JaIr2Ow5qCLzycGhaKJk9+/r8ZWbgOU4ohyuDPd/2v/JXMlY0S0JlJtghG
         fa+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733949468; x=1734554268;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HlaSWtOv+uqBTc8ZWTohBmESKhd/YTad6Sqvxj+0fo4=;
        b=lX3B71dN/VIjHEN0YsYwgm295JOmIjzTDOfKHOGekZxRh1NRnQkM1m8nduWUuE/MvX
         6QDGWuSFtrJ6z0IJe1XTAB1Z5uz2a4CHXxBfSTq0iSe1YYBb8Dh09s44fj/7Zj8J8V7S
         ay5E7k2r+fPzpkSwqd4qk4GhiHqOJNG0hHhHsLA6w56aF8N7fjElh08g2PPvbnBVZpqV
         tCW0J7dDkaPC6Kbjl2hxirootdtPvu42JIP0BPjcYwWwc9vOfEOFMKpkAw5GveqbNsZb
         dZhXHUxQA4UA68BJT791Fvh6uaZF8poSQBIvSsw87sIBxUHK4AsoKdbTsCP2JQlz6Wba
         IVpA==
X-Forwarded-Encrypted: i=1; AJvYcCUPYe9Ck9zl0Z14f6pSeiHDwi6isj9izsJYfzWfvo1N7RH28WWVouuvTygvRxXguzhVFu632vmisDM2LRkH@vger.kernel.org
X-Gm-Message-State: AOJu0YxejnjabuOV0jrjU1XZyNoey6Db9jFDTwWno1KCS4NQK7ljI7z2
	KDOLgLUjsEecZsMj12brBS/HNdp6oLV+nWwQdPqYLfSx1MZPD6IqHcPrQAmdiXU=
X-Gm-Gg: ASbGncuPmCcpulfMnuUI/U+ZOHEDkekkFcacYXokAUg/TeMjmyJDEHz6w00PjCDIsKV
	ONuOx9t+Y+B7ADZxrNDmd3insn1RUo4gEvSbwmEA2CFb0ubFLbfuRkHIFQhupA/Wp4omjSlDUAC
	z6b2CAX02xQB4OXe4xU89iDmxQ9nIYf5iy/mrpqH1IcCRbx9v+GBR65N4wgUjmKmcHuvRME4A4I
	7L/CS1bm+iWERYCIOP9KJeKA643l+9/84seEZRrU6O7u2P5Ti5e/D8p
X-Google-Smtp-Source: AGHT+IHMqAvhHC5dNEzt4Ji77GJgaTqFedpYNmwmOTQLG9a8yXEQAvuJOLZ9//3kNsztFbc6usJwig==
X-Received: by 2002:a05:600c:b86:b0:436:1c04:aa8e with SMTP id 5b1f17b1804b1-4361c3746c2mr37514545e9.16.1733949468341;
        Wed, 11 Dec 2024 12:37:48 -0800 (PST)
Received: from localhost ([2.222.231.247])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434f44eaac7sm130892245e9.42.2024.12.11.12.37.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Dec 2024 12:37:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 11 Dec 2024 20:37:46 +0000
Message-Id: <D695SBZSGF7W.3ONJO2E84XN0@linaro.org>
Subject: Re: [PATCH v1 03/10] arm64: dts: qcom: qrb4210-rb2: add wcd937x
 codec support
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Krzysztof Kozlowski" <krzk@kernel.org>
Cc: <broonie@kernel.org>, <konradybcio@kernel.org>,
 <konrad.dybcio@oss.qualcomm.com>, <andersson@kernel.org>,
 <srinivas.kandagatla@linaro.org>, <tiwai@suse.com>, <lgirdwood@gmail.com>,
 <perex@perex.cz>, <robh@kernel.org>, <krzk+dt@kernel.org>,
 <conor+dt@kernel.org>, <dmitry.baryshkov@linaro.org>,
 <linux-sound@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.18.2
References: <20241101053154.497550-1-alexey.klimov@linaro.org>
 <20241101053154.497550-4-alexey.klimov@linaro.org>
 <a4z5awo6xodgjnmgrqd2hvf2ta2yhexsoyilbprz3vkimymc77@pqp3bgc2fgdh>
In-Reply-To: <a4z5awo6xodgjnmgrqd2hvf2ta2yhexsoyilbprz3vkimymc77@pqp3bgc2fgdh>

On Fri Nov 1, 2024 at 7:59 AM GMT, Krzysztof Kozlowski wrote:
> On Fri, Nov 01, 2024 at 05:31:47AM +0000, Alexey Klimov wrote:
> >  &tlmm {
> >  	gpio-reserved-ranges =3D <43 2>, <49 1>, <54 1>,
> >  			       <56 3>, <61 2>, <64 1>,
> > @@ -691,6 +731,21 @@ sdc2_card_det_n: sd-card-det-n-state {
> >  		drive-strength =3D <2>;
> >  		bias-pull-up;
> >  	};
> > +
> > +	wcd_reset_n: wcd-reset-n-state {
> > +		pins =3D "gpio82";
> > +		function =3D "gpio";
> > +		drive-strength =3D <16>;
> > +		output-high;
> > +	};
> > +
> > +	wcd_reset_n_sleep: wcd-reset-n-sleep-state {
>
> Where is it used?

Right. I'll remove it.

Thanks,
Alexey


