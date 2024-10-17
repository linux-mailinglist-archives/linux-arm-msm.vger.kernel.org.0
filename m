Return-Path: <linux-arm-msm+bounces-34744-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C0ACD9A2288
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 14:40:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 86715281AE9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 12:40:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C7B51DDC3E;
	Thu, 17 Oct 2024 12:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ODnFXsYu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EED831DDC15
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Oct 2024 12:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729168756; cv=none; b=hcRj8y6ZqO0rrf+YjNP+8PyuxlfP02ZDTfXI8+Or4XLhqA18Ve5CxnL8plYf4GImTREL1iPtFbgUEGh5PidhgjqHmUarO0aPJtSFeQULyW/DjajFJEoQGWhhfnX5ZGC/ccazZVXDziaSMl5ybGU0pP9JFPAgUE/4MSlCEXCJDrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729168756; c=relaxed/simple;
	bh=CmSgG8dgDVGowYqWp/vzfob7NQfDeXXWilwWB40CND8=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=YjqCyQSCyzKMdpzdXAtgPuZxZRb7JeXEZW6shTYog8Ik440qlGSsAxusc7Izr6dBES4E2XSvkLPolvzLHIVK5clZORxiAN2UBJ+/FdFUeA0PjbnaJYIEsWQHd59iM6BsGaLxLfj/UkA7oFC37o02QpLG+dzMIQDBm4s4UIrDB3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ODnFXsYu; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4305413aec9so9823255e9.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Oct 2024 05:39:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729168750; x=1729773550; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eLKbd68RzcxlFXK7q4vrGEd+fffJ1TMM8zv/7HYDcsQ=;
        b=ODnFXsYuVqeN5imNxMuTsXP49rINnfJwbqB6dqlPqXJF1QCS4flU6hHbEdzl9vkPoD
         JhiXnXVpauDasz71/s1st4xCUEJQyd056XN5/GCmTtwCfHCHEDsbsXVrx1ZzV1tL45LD
         WdwnIGuoKHJH+WtB34GBxgJsCphjW6AFTpgAqCMm12tnGgGdOsUufQ0fyUuYh71tpMwD
         emUto0uD3B4WUUNMv3y2yHaD7vclvjNuJi+S/8rLP6pW97i2J81iH0NoGgiAGp1LBvxJ
         BRWr9YI/XkBEGO6V1wUY5bNyQ85l6I3H8nsIQnsAhbmTotKtoRvVRkhJZFnV6H6lWsXy
         ZBeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729168750; x=1729773550;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eLKbd68RzcxlFXK7q4vrGEd+fffJ1TMM8zv/7HYDcsQ=;
        b=Hn/1qrLU5znUlzJrHxiskBl4JxbobRxpSb2CY66+h6tAqNquLQtZ+996H8vMch34k2
         R7y2WOth2fqs3M7rmt63B8vBVAclUQaof+repcX08Zzxy2G3Gq6N3d4k04968McT3HEi
         /pGngRBVTWZd2OUNVkXxPfEnTMH/VfErz5yb3Z44pkEtM/+Zh0alFepV8jV07eNdacHX
         KQHSaaGi1cthWpKOsHPzEpN07nn7OuvFXDOIfZ+Wjzbp5QF7F9lu2a2yhqLpopEvpscu
         LF1pph/K2H0yEiRJB1C4UJ+QDKFOrLOu1RHGP/TO/Ffhuz7hZFOqC9tOWYwwlIDqpG6i
         5WzQ==
X-Forwarded-Encrypted: i=1; AJvYcCW9WLP617Te4N+booUHBm/XLX5oHI/HjjnI9wXbendacbRX8bt5YFAUtKibg09Qq/T0xYmyyzcrIdf3Q/o8@vger.kernel.org
X-Gm-Message-State: AOJu0YwTIpJQSDu6IG4MFGL2+NbZfDj/R0cIOKOY6NHCHCK7cW8Oj0rk
	WTo4DlJ4PjXaOeypbynl2N8jOHMUiJUhq1IX19tqpBxtQXJToeQaaZxfb3/3+W4=
X-Google-Smtp-Source: AGHT+IG7ejxJJUoO3H77hYt2WNQRu3rm4oMZyvw11lFYzsiOaPe5DscdwmGO2D+HP8vSEzTm8Trfkg==
X-Received: by 2002:a5d:5051:0:b0:37d:4fab:c194 with SMTP id ffacd0b85a97d-37d86bd59b0mr4879360f8f.25.1729168750204;
        Thu, 17 Oct 2024 05:39:10 -0700 (PDT)
Received: from localhost ([2a00:2381:fd67:101:6c39:59e6:b76d:825])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d7fbf80a4sm7156250f8f.87.2024.10.17.05.39.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Oct 2024 05:39:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 17 Oct 2024 13:39:08 +0100
Message-Id: <D4Y35WNU7MWN.2Q3RHCLLZ69Y@linaro.org>
Cc: <konradybcio@kernel.org>, <konrad.dybcio@oss.qualcomm.com>,
 <andersson@kernel.org>, <mturquette@baylibre.com>, <sboyd@kernel.org>,
 <krzk+dt@kernel.org>, <robh@kernel.org>, <conor+dt@kernel.org>,
 <srinivas.kandagatla@linaro.org>, <linux-arm-msm@vger.kernel.org>,
 <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 1/2] dt-bindings: clock: Add Qualcomm SM6115 LPASS
 clock controller
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Krzysztof Kozlowski" <krzk@kernel.org>
X-Mailer: aerc 0.18.2
References: <20241017005800.1175419-1-alexey.klimov@linaro.org>
 <20241017005800.1175419-2-alexey.klimov@linaro.org>
 <n4nbzwostn6i5ygskjfr4o7haqujodadxd2kspvlk2gccxoaen@pk3qj7rxvspf>
In-Reply-To: <n4nbzwostn6i5ygskjfr4o7haqujodadxd2kspvlk2gccxoaen@pk3qj7rxvspf>

On Thu Oct 17, 2024 at 9:39 AM BST, Krzysztof Kozlowski wrote:
> On Thu, Oct 17, 2024 at 01:57:59AM +0100, Alexey Klimov wrote:
> > From: Konrad Dybcio <konrad.dybcio@linaro.org>
> >=20
> > SM6115 (and its derivatives or similar SoCs) has an LPASS clock
> > controller block which provides audio-related resets.
> >=20
> > Add bindings for it.
>
> That's a v2.
>
> >=20
> > Cc: Konrad Dybcio <konradybcio@kernel.org>
> > Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> > Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> > [alexey.klimov] slightly changed the commit message
> > Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
>
> My tag?
>
> > ---
> >  .../bindings/clock/qcom,sm6115-lpasscc.yaml   | 53 +++++++++++++++++++
> >  .../dt-bindings/clock/qcom,sm6115-lpasscc.h   | 15 ++++++
> >  2 files changed, 68 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/clock/qcom,sm6115=
-lpasscc.yaml
> >  create mode 100644 include/dt-bindings/clock/qcom,sm6115-lpasscc.h
> > +examples:
> > +  - |
> > +    lpass_audiocc: clock-controller@a6a9000 {
> > +        compatible =3D "qcom,sm6115-lpassaudiocc";
> > +        reg =3D <0x0a6a9000 0x1000>;
> > +        #reset-cells =3D <1>;
> > +    };
> > +
> > +  - |
> > +    lpasscc: clock-controller@a7ec000 {
> > +        compatible =3D "qcom,sm6115-lpasscc";
> > +        reg =3D <0x0a7ec000 0x1000>;
> > +        #reset-cells =3D <1>;
> > +    };
>
> Not much improved. Don't send same code from whatever repo you got, but
> go via mailing list.

Ok, thanks! I was not aware that there was a previous version on
maillist ~ a year ago. My impression was that this was never sent for
review. I'll update and resend it as v2 if there are no objections so it
will become a proper v2. I am more interested what should be done
regarding older email addresses or maybe .mailmap will handle it correctly.

Best regards,
Alexey


