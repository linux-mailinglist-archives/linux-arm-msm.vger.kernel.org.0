Return-Path: <linux-arm-msm+bounces-24881-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 408FE923C8E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jul 2024 13:38:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 644601C21E22
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jul 2024 11:38:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82C3D158D98;
	Tue,  2 Jul 2024 11:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="bu0WyF1t"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6663155741
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Jul 2024 11:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719920322; cv=none; b=EaAk+UNiShnN5JBwh5dokZgOgijNZKMqfhamDrkGnJmZBECb11SBPIyQe8aYzkAlKXcv+V4jIEWRDtaeQ1lfupU8SFRVJRBtfCzZXWOkIuZLqjhkD142lJf6RN4rq9R9sdfuPNF8qBA9WX9OvO/xAMHMV+So0z2SgbkOioNlUwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719920322; c=relaxed/simple;
	bh=zxPuS5kzIwm5vk5t+BjoNbU+A4vRHHGlPQxbOuS2DX0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SjEFy5EMT9BQaXyQBlI93L0HIkQNOCjXC7IItasMciw9kOI+p2lJxyclWIRx7QRFVRZuP1FE9am5yQAevHFxdrc8rVGqjxPjJIhji0S221bA0IBfTRhOgaU5HVKzaB+1UYH7vg3Lu+FstAKH34gxbsOXlqJB+bGkV1TqbiysrdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=bu0WyF1t; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2ec50d4e47bso39466191fa.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jul 2024 04:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1719920319; x=1720525119; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7NjO96YfHbcurYXoOtukjWlkFgYmx5Yqic6PVS6K5qg=;
        b=bu0WyF1tCSHkpNwmiriN3cFg/Usa2nBvP0iX9kU0qTF0TtHzB62UtlAYgKeRmskaOP
         x9uo7PjgpdV9/36W66mYDUacyMwA8CoVDD12ixrOu416loBZVOLnJ1RAE3VYw0JKvUKj
         mKEbGbuVqu7pVe+nzZGVTscAt7vnjpnQXO3WJSMRTviGBxZGnaPeevL3P95mxohKl04I
         H9OEaB0gvQgNA4YbacTHslV1jwKkcdq+MhFZ9HkrDBJO4kEvqsaFVdNMF3sHrPl5Ajs1
         cMW2lX+GjmlTGROFFJu9RR/n/QesHzgOMZn7RHAjjAOd71xcQqKwbQz8gs6Ls6TfhO/l
         L2kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719920319; x=1720525119;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7NjO96YfHbcurYXoOtukjWlkFgYmx5Yqic6PVS6K5qg=;
        b=pJU/Ul1UDg5/QoApmRdfPgj6YSUkqnS3FNLXmrEV7EZNK9x8Tt7SY//Qccv1afiocg
         5Bnucjo68TS/4RpjPWlyEopvQYLBrSAaE6jG/8Bc8zScojWw6k+fDi53a807r1QPdHYh
         57+xfl1Giz1LdIfJbsadP5hknM5Bg92jBChN4/X4r0Fs4JDSg2MiAIsSO8j54d07Nz0S
         mImKHIXt3PdmUQfY5tzllptE1f00Ljqg0ULi5ADA51OnDYsCTaMYRgmWi0os2v2Y87ml
         Fr13wkFYTmV+M6VDA3gllLt70n20ztLTwM3h0WDunwriQj2e7xrj59n0gI38GLC8DWhJ
         bqLA==
X-Forwarded-Encrypted: i=1; AJvYcCU5AZYbW/hutxhfY/a2jopwRUWum3aUvrVj3TAJlngyLtnxrnPnoljRCcMCse2EQAhlfKQtiQOSgo4d6DAryguTyOTnB3lnx6SvxCsfng==
X-Gm-Message-State: AOJu0YynFK0TI9qf2iTAU1p6Psnc4KZoTjnFIpHNPCLiV96OKpIr+HtP
	QXaiM525a+4JkUAs34xUEFAWUw/ZPWwGhrMF5p+CHw9wvqic7Oml4FBy9oG9XhSnM9zQIYeMWGP
	r4BA0j3OwmIa38ASG50Mj5hkKi/gWbNzlhWRM7A==
X-Google-Smtp-Source: AGHT+IEct1k3J7FL99TS+D1ZokLj073HD7kx+D6FCbVI9CHvsVitKkiw5Aq8FbYEWpxeuF0Ur6G8a/zFteINawUVG8w=
X-Received: by 2002:a2e:9e57:0:b0:2ec:5ff1:2274 with SMTP id
 38308e7fff4ca-2ee5e36f20dmr51288421fa.25.1719920318943; Tue, 02 Jul 2024
 04:38:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240702091655.278974-1-amit.pundir@linaro.org>
 <8ba07bbf-e8b1-4244-882b-ff2575368b20@kernel.org> <he7q4mzj7u7t3c4pndu565m727e6hqpf2srrqgbdltjdffugdl@x3xrwteqpki3>
 <CAMRc=Mepx86sQmPYLq2TkvhxtwUtsQGeYTVUc585oiuvOzLc-A@mail.gmail.com> <j2pvpoxrw7swutchmpgkzsacbwjcpdickmhprpxzedvcqxqx4o@6gyaqv4a35if>
In-Reply-To: <j2pvpoxrw7swutchmpgkzsacbwjcpdickmhprpxzedvcqxqx4o@6gyaqv4a35if>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 2 Jul 2024 13:38:27 +0200
Message-ID: <CAMRc=MdWQ6SKfubCqOOwwkn027W=Mt4PYQapQDJtfrei265GhA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sm8550-hdk: add the Wifi node
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Amit Pundir <amit.pundir@linaro.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	linux-arm-msm <linux-arm-msm@vger.kernel.org>, dt <devicetree@vger.kernel.org>, 
	lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 2, 2024 at 1:32=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Tue, Jul 02, 2024 at 01:13:09PM GMT, Bartosz Golaszewski wrote:
> > On Tue, Jul 2, 2024 at 1:10=E2=80=AFPM Dmitry Baryshkov
> > <dmitry.baryshkov@linaro.org> wrote:
> > >
> > > On Tue, Jul 02, 2024 at 12:42:02PM GMT, Krzysztof Kozlowski wrote:
> > > > On 02/07/2024 11:16, Amit Pundir wrote:
> > > > > Describe the ath12k WLAN on-board the WCN7850 module present on t=
he
> > > > > board.
> > > > >
> > > > > Signed-off-by: Amit Pundir <amit.pundir@linaro.org>
> > > > > ---
> > > > > Kanged verbatim from 490812872449 ("arm64: dts: qcom: sm8550-qrd:=
 add the Wifi node").
> > > > >
> > > > >  arch/arm64/boot/dts/qcom/sm8550-hdk.dts | 97 +++++++++++++++++++=
++++++
> > > > >  1 file changed, 97 insertions(+)
> > > > >
> > > > > diff --git a/arch/arm64/boot/dts/qcom/sm8550-hdk.dts b/arch/arm64=
/boot/dts/qcom/sm8550-hdk.dts
> > > > > index 12d60a0ee095..c453d081a2df 100644
> > > > > --- a/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
> > > > > +++ b/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
> > > > > @@ -279,6 +279,68 @@ platform {
> > > > >                     };
> > > > >             };
> > > > >     };
> > > > > +
> > > > > +   wcn7850-pmu {
> > > > > +           compatible =3D "qcom,wcn7850-pmu";
> > > > > +
> > > > > +           pinctrl-names =3D "default";
> > > > > +           pinctrl-0 =3D <&wlan_en>, <&pmk8550_sleep_clk>;
> > > > > +
> > > > > +           wlan-enable-gpios =3D <&tlmm 80 GPIO_ACTIVE_HIGH>;
> > > > > +           /*
> > > > > +            * TODO Add bt-enable-gpios once the Bluetooth driver=
 is
> > > > > +            * converted to using the power sequencer.
> > > >
> > > > I don't understand why hardware description should depend on the dr=
iver.
> > > > Either you have this GPIO or not. If you have it, what does it matt=
er if
> > > > there is no driver who can play with it?
> > >
> > > Then there is a conflict between BT and PMU, which both will try to
> > > access the gpio (or at least the pinctrl).
> >
> > Ah, so this slipped through the cracks. Amit merely copied it from exis=
ting dts.
> >
> > Yes, there's a conflict but Krzysztof is right - we should handle this
> > in the driver, not in dts.
> >
> > However for that we need a patch for the PMU pwrseq driver first. Let
> > me cook something up.
>
> Or for the BT driver, which might be more futureproof.

The problem here is that we have DT bindings that define the Bluetooth
node properties (including the bt-enable GPIO) for wcn7850 and so are
committed to supporting existing device-trees. Any change to the
handling of this model (unlike QCA6390) must retain backward
compatibility. I don't know yet how to approach it so for now I
propose to add a quirk to the pwrseq driver and revisit later.

Bart

