Return-Path: <linux-arm-msm+bounces-12995-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2998E86D097
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Feb 2024 18:27:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D24BC1F24F4A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Feb 2024 17:27:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78BC66CC0D;
	Thu, 29 Feb 2024 17:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gateworks-com.20230601.gappssmtp.com header.i=@gateworks-com.20230601.gappssmtp.com header.b="D7HArK7v"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6572470AC3
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Feb 2024 17:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709227634; cv=none; b=fwSO4Q/ZiUaW0j7rFtn/alP1gdtfq9HHnyvw7CvaY3ocufgHxfoY/rjew+RQeZ38MsrLMwQuLw3Nt/54eR3Y8XRmkn+5bFyT4RE27BZoxUaf81zp96+kD94EZs3dtod5y1PrXOtfpRRJ6xRQBlGOERBTWmwvEbANtfTEYPo8TCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709227634; c=relaxed/simple;
	bh=853yl5T7RBe14Q7Ic1pdq6lruxKv/bJ3MDmBIIZWjSs=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=kJ0R4IR4NQzLxaX2w20jUuOai2R1n0Bzu5sOcJbJakpO1cF/48cqSaga7Ic4ZG/FVMtlTUXisHXuuFW/du9TMMOfTAlDaR/DPNsJ8fyyXPOc7cL5WJE5ftP0i4FnSRw2Lu3Ywlu16WIHr1/CMBxOxUuIwecyg7D2Pu08+k2fLfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gateworks.com; spf=pass smtp.mailfrom=gateworks.com; dkim=pass (2048-bit key) header.d=gateworks-com.20230601.gappssmtp.com header.i=@gateworks-com.20230601.gappssmtp.com header.b=D7HArK7v; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gateworks.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gateworks.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a44628725e3so74759366b.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Feb 2024 09:27:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gateworks-com.20230601.gappssmtp.com; s=20230601; t=1709227631; x=1709832431; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=853yl5T7RBe14Q7Ic1pdq6lruxKv/bJ3MDmBIIZWjSs=;
        b=D7HArK7vr9IhpSKV4M7w9oNNLRVkDv2nHrmMYoHqdMt3zlGxuvyFgItSMicyJml6zy
         zZ6lXJvw0qlj3ASNSRgTtfHhyzC9sh0kKmneDlV6lUWixHQ5zCQJo8KsdqwJ0chIljsk
         kPJe/XsoRDcHWJQF+WmkSb1V9DrVaZ5r8phH9+ADImYoVCvZHf2WYMK/COva+614TbfM
         Mb6hk5q7btSiXvxqyfEGtZKaPHJdauIsLlnyLmFJGmPgyA3mepWUSms1VyPvkX00uIPk
         Q7rBPDv100R6vRzeoNviXnB3wxIeYzHXRZlBjUcvpvjK7ISa4lH8kmAyZesldhxIE2k1
         jlSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709227631; x=1709832431;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=853yl5T7RBe14Q7Ic1pdq6lruxKv/bJ3MDmBIIZWjSs=;
        b=EkOo90MyoUfb9QSfKcJTpp225UwYIyIjRYZVo/eEZOscDsiBjflnuS4R3xlHTjBgA+
         6FoLR3yGqKvYMXHsdo04OYZbojQHjj5XBY12pSdnxG7ouAFDGKEUy8llZDA9Tu3aihSW
         tXcDjCs6rBARHMZjywr+8F6jpWPMf4ZCNfvVgae45Vm9f/sKIAzw/79Pn6/PSJD5w8pS
         iCBFC/uC+WB6KusplPSfra2+Kz+0MG14JjUEn2F85tK3xS+MZt3kyNqDvyvmRNu9tlL8
         N7Si3qxts9w/VVEIGClqEKbsdC2TPK+x8qH+L6xh53IqDAXWfX2Nk/DwDZ/8Xvp9mrww
         qFJA==
X-Forwarded-Encrypted: i=1; AJvYcCXpYShBcohxRau32jSCKncJ2ocXa0IcOBn6hD/4c2odZAk/35mv7IdwxkY8EjI8U6BRY7p8Lw2kttxDIR7vcA8HDGlosKjCEpvHCAPh/Q==
X-Gm-Message-State: AOJu0YydkkmMnubn7hoND6vUPRhhQjUKxJjt7k5HGp5wd5aBfJEzykvi
	dfmyiPxi7Wo7zPP960NNcZtwfnIK/rN697wbfDVCCcqsB/QiBMvfpxwPQK6c9I89UOjdDBsOcad
	qZhCOAxda1Df8XJN136FR4WfkMYTN1A/DzOpCQA==
X-Google-Smtp-Source: AGHT+IHY+BeReToKKxC+x9eEFVG469n2fNVsygBbwAcPapCF0QV3dnwOTqV/Fu19u/7jKdln3AQTI2lVnWJwQiLIPYs=
X-Received: by 2002:a17:906:5fcc:b0:a43:a4a1:1945 with SMTP id
 k12-20020a1709065fcc00b00a43a4a11945mr2004809ejv.75.1709227630755; Thu, 29
 Feb 2024 09:27:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Tim Harvey <tharvey@gateworks.com>
Date: Thu, 29 Feb 2024 09:26:59 -0800
Message-ID: <CAJ+vNU3y5pzqeBnr8LHDtJtU7zajfRvP=_WmAhP=cAp_3iGFQQ@mail.gmail.com>
Subject: Re: [PATCH 2/4] reset: add GPIO-based reset controller
To: Sean Anderson <sean.anderson@seco.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, andersson@kernel.org, bgoswami@quicinc.com, 
	brgl@bgdev.pl, Mark Brown <broonie@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Device Tree Mailing List <devicetree@vger.kernel.org>, konrad.dybcio@linaro.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	linux-arm-msm@vger.kernel.org, open list <linux-kernel@vger.kernel.org>, 
	linux-sound@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>, perex@perex.cz, 
	Rob Herring <robh+dt@kernel.org>, srinivas.kandagatla@linaro.org, tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"

> On 1/9/24 04:41, Krzysztof Kozlowski wrote:
>
> I think a separate pseudo-device is necessary a generic solution. So I
> guess I will revive my patchset.
>

Sean and Krzysztof,

I see a lot of value in a generic reset-gpio driver that you have both
tried to get accepted in the past. I support boards that have a number
of SPI and I2C devices that often have GPIO resets wired to them that
are pulled in hardware to the in-reset state and find no support in
the various drivers for reset handling. I've often wondered why a
generic gpio reset wasn't supported in the SPI/I2C cores like it is
for some other subsystems.

The approach of a gpios-reset solution makes sense to me.

Will you be submitting a follow-on series to your previous attempts?

Best Regards,

Tim

