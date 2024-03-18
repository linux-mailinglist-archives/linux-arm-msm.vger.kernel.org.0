Return-Path: <linux-arm-msm+bounces-14423-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CE56887F243
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Mar 2024 22:36:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 35451B20A7E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Mar 2024 21:36:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFAA158ADF;
	Mon, 18 Mar 2024 21:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Xt4kLtuc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39891535B9
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Mar 2024 21:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710797785; cv=none; b=pWYWDOuW8DFw7SK6+xQ8/X32xKG9OrJP+ZuqKRhd3BoTnevSZUd/dmT8bXnWRyuE/HBKtDzGgrgfJUj0k2NlaFP6VubiFv6YwFJlbZpNoLiDTHKFCxqhjvK4qjUQqiOVzMQMDEbBjNFE6yVfCDj7N7riP50j0Z3L+IEaqSbEhbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710797785; c=relaxed/simple;
	bh=oN3ajsjXsAF9HfH4yepxydlxom6CmZW2+KuqWPApvOc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RyXq8cFAllFN8mX5GnXF/8Wfv5OGG1zvYm6TGRYv9yPGRbQcWo12kjAvdrDLSwvpUYmzx9EQMJdWGSwaNWN8W9wLHGnwMISjN26amgYf5S4Qy+yBBZe4tLNnu24d8yhDa17TlpB7qReZXW3TMY3QJUw5WTPdBhLMjijfNKXwyDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Xt4kLtuc; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7882dd2b1c9so382932785a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Mar 2024 14:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1710797783; x=1711402583; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oN3ajsjXsAF9HfH4yepxydlxom6CmZW2+KuqWPApvOc=;
        b=Xt4kLtucDqsA/MbhJz8HP7NmR2TGwDHm03/2lGlNE5xDmhjqxAd6W+x58EbtpCqlwL
         VRfRGcRbhQXMWSu6AQy9nFqfKxA6AhGHctMv5+XTA6+ra+qft+lf8QxWJbSItnpGoHKD
         WSuiyo3YUg5gyLGfRL78F4rTaDgmaqldy9UIA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710797783; x=1711402583;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oN3ajsjXsAF9HfH4yepxydlxom6CmZW2+KuqWPApvOc=;
        b=Vp+0R+FQdahBbHQdFVrmwyaZAbnoB1orZNueRqJsto1XOlw0xVyfzFPrNd6ouD0bp+
         QdWZ/395s7xqkdDeOOgtc05RdLjg7hsd7kCdCJJLc2ROJ1XKc686Iwo9LRUyvadf5v07
         HO/yGUk4Z860zSFznN12fIoxwuhAtTbe+/zqh8CNFArMz59CfP7jvWklj3JV6g5qizlK
         uj9oDhuMbWVCAYe4CQfvi+EafFHYA5Pm3ib6jEQgnJVzJ6Xw6o5gqmjK2IOnkWG8XGsg
         4qhQqs/Pwi5OZzE9YJ0IdBr0X/icgIxcqSRtaWrGK7d8XVGkc3pvD+rpNjMf6DXSgTXi
         mc/g==
X-Forwarded-Encrypted: i=1; AJvYcCX95TGr5IpatAPrHWGmRGN58bWgZe7BQt9lJeEqruS+Agpr22uJkF4EdLgAWivvWnm7ftSQf3Aws/MqSBlQbyLnOn/sTfFyrCaomvj0nw==
X-Gm-Message-State: AOJu0Yz8PW+hdOkHL/L5RIhAWwS0dOZxeV8H8Kk2dkaLzafP09xUlN/J
	nDhi0ajkizJOwq9O+KHxMgvjAGrRClZGpcfkIBVp7jA6WwUWFhe9RmBqsuj+o9Vu4Xmdfq1oiFw
	=
X-Google-Smtp-Source: AGHT+IEWNb49kbqUyH4SLC0obZkYhKO1V/EDIEXK8OaE8a/4hiVtRgTycDTBpGPVZhOFw5cMLzCnDw==
X-Received: by 2002:a05:620a:850f:b0:789:faed:fcb4 with SMTP id pe15-20020a05620a850f00b00789faedfcb4mr1303976qkn.21.1710797783251;
        Mon, 18 Mar 2024 14:36:23 -0700 (PDT)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com. [209.85.160.178])
        by smtp.gmail.com with ESMTPSA id wl8-20020a05620a57c800b00789f3e53d04sm2105447qkn.126.2024.03.18.14.36.22
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Mar 2024 14:36:23 -0700 (PDT)
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-428405a0205so38541cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Mar 2024 14:36:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWKrIJ0W6kA9fw4zKsyJYwa0XsdORACqbj3aH0Ukh4XBs4YAqMertJI9Bl/+mcOqVeuTtn1B1Oob7Sh+MTCUFqtAzn7Wb+Uefu94JGpFA==
X-Received: by 2002:a05:622a:50e:b0:430:b590:e88c with SMTP id
 l14-20020a05622a050e00b00430b590e88cmr111577qtx.6.1710797782513; Mon, 18 Mar
 2024 14:36:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <1710418312-6559-1-git-send-email-quic_amrianan@quicinc.com>
 <1710418312-6559-3-git-send-email-quic_amrianan@quicinc.com>
 <f6f317d9-830d-4c38-998f-b229b3d9f95a@linaro.org> <20240316-germinate-browsing-6865db3a44d7@spud>
 <20240316-herring-skies-6ee1d4a9c0d2@spud>
In-Reply-To: <20240316-herring-skies-6ee1d4a9c0d2@spud>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 18 Mar 2024 14:36:06 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VZB9Dqsw6+2WBdWxaQVA9NgK_W2n0okBOU0haDMSogPw@mail.gmail.com>
Message-ID: <CAD=FV=VZB9Dqsw6+2WBdWxaQVA9NgK_W2n0okBOU0haDMSogPw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] dt-bindings: qcom: Update DT bindings for multiple DT
To: Conor Dooley <conor@kernel.org>
Cc: Caleb Connolly <caleb.connolly@linaro.org>, Amrit Anand <quic_amrianan@quicinc.com>, 
	robh@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, kernel@quicinc.com, peter.griffin@linaro.org, 
	linux-riscv@lists.infradead.org, chrome-platform@lists.linux.dev, 
	linux-mediatek@lists.infradead.org, Simon Glass <sjg@chromium.org>, 
	Chen-Yu Tsai <wenst@chromium.org>, Julius Werner <jwerner@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Sat, Mar 16, 2024 at 9:51=E2=80=AFAM Conor Dooley <conor@kernel.org> wro=
te:
>
> On Sat, Mar 16, 2024 at 04:20:03PM +0000, Conor Dooley wrote:
> > On Thu, Mar 14, 2024 at 02:20:38PM +0000, Caleb Connolly wrote:
> > > On 14/03/2024 12:11, Amrit Anand wrote:
> > > 2. A top level board-id property that isn't namespaced implies that i=
t
> > > isn't vendor specific, but the proposed implementation doesn't even
> > > pretend to be vendor agnostic.
> >
> > I pointed out previously that the Chromebook guys had some similar
> > issues with dtb selection when the OEM varies parts but there does not
> > seem to be any of them on CC here.
>
> That's maybe a bit harsh of me actually, I see that there's a
> chrome-platform address on CC, but I don't know if that's gonna reach
> the guys that work on these devices (Chen-Yu Tsai and Doug Anderson in
> particular).

Thanks for the CC. Yeah, I don't watch the "chrome-platform" list
myself, though maybe I should...

The Chromebook boot flow and how we've handled this so far is
documented in the kernel [1]. This method is what we've been using
(with slight modifications over the years) since the earlier ARM
Chromebooks and is, I believe, supported in both the depthcharge
loader (used in Chromebooks) and also in U-Boot, though it's possible
(?) that the U-Boot rules might vary ever so slightly. I haven't tried
using U-Boot to boot a Chromebook in years.

The current way things work for Chromebooks involves a heavy amount of
duplication. We bundle an entire "DTB" for every relevant
board/rev/sku combination even though many of those DTBs are 99% the
same as the other ones. The DTBs have been relatively small and we
compress them so this hasn't been a massive deal, but it's always been
on the TODO list to come up with a scheme to use DT overlays. We've
also talked about bundling a device tree that has the superset of
components and then using an in-kernel driver to set the status of
some components to okay and there is some overlap there in the
possible way to represent board variants. I think Chen-Yu is going to
talk about a few of these topics next month at EOSS [2].

In terms of looking at your specific proposal, it's definitely trying
to factor in a lot more things than the current one that Chromebooks
use. The Chromebook model was "simple" enough that we could just
leverage the compatible string, though the way we leverage it has
ended up controversial over the years. Yours is definitely too
complicated to work the same way. It seems like device tree overlays
would be a better fit? I'm not an expert so maybe this is already
solved somewhere, but I'd imagine the hard part is getting everyone to
agree on how to specify stuff in the DT overlay that allows the
bootloader to know whether to overlay it or not...

[1] https://docs.kernel.org/arch/arm/google/chromebook-boot-flow.html
[2] https://eoss24.sched.com/event/1aBGe/second-source-component-probing-on=
-device-tree-platforms-chen-yu-tsai-google-llc

