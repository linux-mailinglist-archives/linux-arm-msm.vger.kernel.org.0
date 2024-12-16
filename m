Return-Path: <linux-arm-msm+bounces-42348-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AB6C69F3221
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Dec 2024 15:00:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 658411887698
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Dec 2024 14:00:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85A76203D77;
	Mon, 16 Dec 2024 14:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i6gytyrh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55DDBF9DA;
	Mon, 16 Dec 2024 14:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734357637; cv=none; b=KpxA0GPQ/70fP5SDVGCbHHM0kaJZ6m8EETBx4zvGbrGcgU/0HsCrfrc3jbCt510c5Z2bzN/NkdpJ6d7V/DPOxBA2wGHm4wf2Vnv3UoPaGl34Cd/Qz7Jfz2lxuJUjjR9XuV2fir/rOyyg9RjAnxJBVwgsFWl2Mbf8TXLPgPaFiVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734357637; c=relaxed/simple;
	bh=k6eCuwQAvLVd3KGGJKl0vuXppvcGBhn/Jp6GoLT5orw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZSgkb/5ilAmafX5AHTZ/ZJsRf+3GSI3CWFKpJjD3LuQAvLK4V6ka31E1TDrJyOIdM2V5hdOpqkw2Ge7Nneu//1H0XA5eAsPHoX0mz5X3qdtLWs/yqY8GUAkeYKhtHtr1l4X5/u5qqIp3tFjo8iNjMRFEFJ6UIbZKOjzYbIn2t8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i6gytyrh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE21EC4CED0;
	Mon, 16 Dec 2024 14:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734357636;
	bh=k6eCuwQAvLVd3KGGJKl0vuXppvcGBhn/Jp6GoLT5orw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=i6gytyrhworWnBYUdgUh/2DnGYwrkq2+cm1dybuxcnwQsqSTyq3SyZJ74FMH0HseN
	 N3lZ9y7fsC+FYT6XOqWn/2fVvT9X0Wn6Xy8+XfikAV+XRYyz0rebN6B6VC0LuQeMUC
	 atpMOW+kIfiHkU1wn5N7E7N5mnyWPf+5oBUj7y1i11Zi6dEv58yIyNGM7onjL2riGI
	 bIq46A18RIP+Z6lHy2QI1gFIMsp6ppPz17Zn73CwuuiTk8xYnKpfvQamr+AxpwUufC
	 QbuG+PzZBgjC+nF8pLNVH3GF6tBuEK23jbBOm6w+VqyOPjiAkQevNzJxDGmVty6zFD
	 t3fyJYb/xnB2Q==
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-e387ad7abdaso2966483276.0;
        Mon, 16 Dec 2024 06:00:36 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW7QNk2+3p7cIVeODQPLK7EVMrOFHaZGEq6nikGjr9z9q3opYs4OvW4rYYlT92duyuckn76jTdn4dczz0naAQ==@vger.kernel.org, AJvYcCWAKJSQ6vf5Al7qFw0er1PnwUe6z1SjKeYq5PSbeQWNCQQ2vPwEJ3rs3iLk2yYiVVdTuD+FhxXr7m6H@vger.kernel.org, AJvYcCWp2saI76mlspJ4+eItKhTXuTnCCp0KgV5bV+xtSQyhTctR2ymu4XEsravl9I108PpfwvRxjflL/UtwuaKP@vger.kernel.org
X-Gm-Message-State: AOJu0YwSIq/QXFe5qnBZByitFldHhHP5fENfiUrp+93mmOZ69iKE8Aok
	g8csatIA4Wed8Tj/8rGOHD6TPVcA+Mb4Wm/P7UCXjns2QjZrcvttiBXRzkn3fJ6jha4bAWev/0N
	D1jGTXnlIEaoW6jX5ERUP6v6JkA==
X-Google-Smtp-Source: AGHT+IFcT4Ym5cRcHnfhOvYYOMdS/4zmCfLrA6GYjh+4eFLYt1kO4XwsP+JPyBS+FJMTvyhlDLeL58JK2Ae1sYBPKcQ=
X-Received: by 2002:a05:6902:300f:b0:e3c:9fb5:837a with SMTP id
 3f1490d57ef6-e434e5e1223mr7783383276.41.1734357636086; Mon, 16 Dec 2024
 06:00:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241115193435.3618831-1-robh@kernel.org> <68c079b0-defe-4cb0-9f6f-ce9e3645e2ba@oss.qualcomm.com>
 <d3d9dd62-e0cb-4c12-91d1-17ae52688654@quicinc.com> <2b866563-1328-484a-bfee-f41190ce856c@oss.qualcomm.com>
In-Reply-To: <2b866563-1328-484a-bfee-f41190ce856c@oss.qualcomm.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 16 Dec 2024 08:00:25 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKZb6X+XVr+yWbzbi6FhgJkcd9k1ai=y6U4eujz4Tfqng@mail.gmail.com>
Message-ID: <CAL_JsqKZb6X+XVr+yWbzbi6FhgJkcd9k1ai=y6U4eujz4Tfqng@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: Remove unused and undocumented properties
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: "Aiqun Yu (Maria)" <quic_aiquny@quicinc.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 16, 2024 at 6:42=E2=80=AFAM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 16.12.2024 4:42 AM, Aiqun Yu (Maria) wrote:
> > On 11/16/2024 3:36 AM, Konrad Dybcio wrote:
> >> On 15.11.2024 8:34 PM, Rob Herring (Arm) wrote:
> >>> Remove properties which are both unused in the kernel and undocumente=
d.
> >>> Most likely they are leftovers from downstream.
> >>>
> >>> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> >>> ---
> >>
> >> Funny, the sideinteraction compatible is undocumented and the touchscr=
een
> >> driver is not upstream
> >
> > Does the compatible also need to be fixed to "focaltech,ft8719"? Refer
> > to the info from [1].
>
> +Alexander, Caleb - would you like to look into this on axolotl?
>
> > Confirmed, the compatible "focaltech,fts8719" is not even in any merged
> > bindings or drivers. Instead, "focaltech,ft8719" is in the current
> > driver and bindings.
> >
> > By the way, I am curious about how Rob finds the unused properties.
> > Could you share some steps?
>
> make ARCH=3Darm64 LLVM=3D1 -j24 CHECK_DTBS=3D1 dtbs
>
> returns all kinds of errors, including "undocumented property"

This case however was a dtschema change I have not yet committed.
Plenty of other things to fix still with the above command though. :(

Rob

