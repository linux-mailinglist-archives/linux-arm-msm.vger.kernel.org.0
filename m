Return-Path: <linux-arm-msm+bounces-75330-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E4F38BA4471
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Sep 2025 16:47:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A018238423F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Sep 2025 14:47:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8D1F199FBA;
	Fri, 26 Sep 2025 14:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="moIfQDSQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B404C1581EE
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 14:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758898043; cv=none; b=dfleCP+DR/Sa8CwMenz9pXgvzmVsStA9xo2/gQbb8HRG3wPlxFdA3Yc4XOGF7O3urea33E05Kgs/CkjsP5pkypY/tGI0TPbsEx+/PkXbmwIG0joKMBMdC4O82EWBztka3mUXRjUtV5FkkQY9BE5os3f/T+P1cS7QD4OB2PwtL2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758898043; c=relaxed/simple;
	bh=PxLJxKxKxHHAU6FGVEjqIZb4eS8mFOjMm0lu6rHkXFs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CfgbBO+Y5kQy0YjAEt4g90I+ic9WfYYLdqoi3W6FJgkHZHZwaCmRLdhsfJXP8Dcd0U9R/RgrX4O9mxViK80Bs7c4WmNGG8k7gtwkHy6ecnFzIBqK8cHESz14qJ8+iLhcvQjIsgFkukgQEZYvDFxsx/WmMlXClNfWJiVgiWPNEfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=moIfQDSQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39049C4AF09
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 14:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758898043;
	bh=PxLJxKxKxHHAU6FGVEjqIZb4eS8mFOjMm0lu6rHkXFs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=moIfQDSQC/I8oMohSKkuwl/IppgEcDKIezdjh7KfKl7Nn/2Z15OAtbZBq02WlXvHs
	 zYYRcpFlZv4tP8PukMEf/ZRKs5PMskLG0i47dI7aF8MUHM50akaoSAUHuxfdQFk4zj
	 fzuM/gw7ylJVMc7aVquDxSnGGGLUJHhjf9eK8HCSiUY0CPax65b8Jbiz6s3wDTmXRc
	 2UhNkeaBxCIiwhXAXcp/PHHa4EIuV5DYVF2rgqcYmH0x/sc6YeqTs8385P8JV7dA/l
	 0vHkYVJUvzPwQWq+hF9OWvFvZjcWzt4U9EyNoHdXVVdW+qNw0GWhF+9qojEYoizcyD
	 lrBYkc/JQvctw==
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-afcb7a16441so370561366b.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 07:47:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWtLR3MAYKeHWWlhe8MEaNzyS9awemkbiiGR4j1KdjJjD/Hz6tLWtAIBMz706Ng36vLikuVYBRh6/yUDCh3@vger.kernel.org
X-Gm-Message-State: AOJu0YyKQhvcdRfpTII4fpNqs27Nzn/FQ+JUrDvxnqJXwGISJhyT6Tt6
	vm2C0DUHZp9y/r8U7wCOPD3nHkUtmWoLdpvFgtWrfC/fsSvZ/vceK8iP9+idCNvbTUjC4xV6gzF
	LyORgPUv10JxiJt347Z5yRtEZXkme9w==
X-Google-Smtp-Source: AGHT+IFYlhh1P/VEFhBfLmLyN0WsblCYhmdb8/TU2n2m3mQ/geQQ+5CPtM0v6/lEal0Fl9k9sVhPFz3LsvIfu6OQy8E=
X-Received: by 2002:a17:907:86ab:b0:b04:6cf7:75d4 with SMTP id
 a640c23a62f3a-b34bcd5959amr809600766b.49.1758898041746; Fri, 26 Sep 2025
 07:47:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250924-knp-dts-v1-0-3fdbc4b9e1b1@oss.qualcomm.com>
 <20250924-knp-dts-v1-6-3fdbc4b9e1b1@oss.qualcomm.com> <CAJKOXPcbJY4JEjfZLvOAXEWCTYFpe7En+Riis2t3K5fWJgNU5A@mail.gmail.com>
 <3up4xqgd2ay3tex4ckzgews3ukyrdikcmgk7tbddggj3s5gt4d@foqcpnfptjk7>
 <20250925213151.GA2455023-robh@kernel.org> <c13b94ed-a240-4a32-9f11-f0e323197500@oss.qualcomm.com>
In-Reply-To: <c13b94ed-a240-4a32-9f11-f0e323197500@oss.qualcomm.com>
From: Rob Herring <robh@kernel.org>
Date: Fri, 26 Sep 2025 09:47:09 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLCLy0JxPtbg5sbXux-o8aQi3a8EOs0c=VEJCePew72nw@mail.gmail.com>
X-Gm-Features: AS18NWC5C7HnLX7fNJNeb1WDQk7YmZFfyTQG79-Q0QGWW0BmFcacKZTlJXUOwQI
Message-ID: <CAL_JsqLCLy0JxPtbg5sbXux-o8aQi3a8EOs0c=VEJCePew72nw@mail.gmail.com>
Subject: Re: [PATCH 06/20] arm64: dts: qcom: kaanapali: Add USB support for
 Kaanapali SoC
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, =?UTF-8?Q?Krzysztof_Koz=C5=82owski?= <k.kozlowski.k@gmail.com>, 
	Jingyi Wang <jingyi.wang@oss.qualcomm.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com, 
	trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com, 
	Ronak Raheja <ronak.raheja@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 26, 2025 at 8:21=E2=80=AFAM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 9/25/25 11:31 PM, Rob Herring wrote:
> > On Thu, Sep 25, 2025 at 08:57:56AM -0500, Bjorn Andersson wrote:
> >> On Thu, Sep 25, 2025 at 10:50:10AM +0900, Krzysztof Koz=C5=82owski wro=
te:
> >>> On Thu, 25 Sept 2025 at 09:17, Jingyi Wang <jingyi.wang@oss.qualcomm.=
com> wrote:
> >>>>
> >>>> From: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
> >>>>
> >>>> Add the base USB devicetree definitions for Kaanapali platform. The =
overall
> >>>> chipset contains a single DWC3 USB3 controller (rev. 200a), SS QMP P=
HY
> >>>> (rev. v8) and M31 eUSB2 PHY.
> >>>>
> >>>> Signed-off-by: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
> >>>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> >>>> ---
> >>>>  arch/arm64/boot/dts/qcom/kaanapali.dtsi | 155 +++++++++++++++++++++=
+++++++++++
> >>>>  1 file changed, 155 insertions(+)
> >>>>
> >>>
> >>>
> >>> Second try, without HTML:
> >>>
> >>> I really don't understand why you created such huge patchset.
> >>
> >> Because I looked at the logical changes that went into the big squash
> >> that was initially planned, and requested that some of those was kept
> >> intact - because they where independent logical changes.
> >>
> >>> Year
> >>> ago, two years ago, we were discussing it already and explained that'=
s
> >>> just inflating the patchset without reason.
> >>>
> >>
> >> We used to add things node by node and that was indeed not
> >> comprehensible. Overall this adds features in large logical chunks, bu=
t
> >> there are a few of the patches that could have been squashed.
> >>
> >>> New Soc is one logical change. Maybe two. Not 18!
> >>
> >> I can see your argument for one patch to introduce the soc. But two
> >> doesn't make sense, because that incremental patch is going to be the
> >> kitchen sink.
> >>
> >>>
> >>> Not one patch per node or feature.
> >>>
> >>
> >> Definitely agree that we don't want one patch for every tiny block!
> >>
> >>> This hides big picture, makes difficult to review everything,
> >>> difficult to test.
> >>
> >> The big picture is already obscured due to the size of the content
> >> added.
> >>
> >> Comparing to previous targets, I see the baseline content in 2-3
> >> patches, and the remainder of the series being things that usually has
> >> been scattered in many more small changes in the following weeks or
> >> months.
> >>
> >> There's plenty of features in this series that are yet to be concluded
> >> for SM8750.
> >>
> >>> Your patch count for LWN stats doesn't matter to
> >>> us.
> >>
> >> I agree with this. That's why the QRD is 1 patch, and MTP is 4 (this I
> >> think should be squashed to 2) - compared to 13 patches for across the
> >> pair for SM8750 with less scope.
> >>
> >>>
> >>> NAK and I'm really disappointed I have to repeat the same review .
> >>
> >> I'm not sure what you're disappointed in, this initial series is large=
r
> >> than any we've seen before. I really like the work Jingyi has done her=
e,
> >> aggregating the otherwise scattered patches into one series.
> >
> > The QCom folks can review all this first because I don't care to review
> > the 50+ binding (just bindings!) patches sent all at once right before
> > the merge window.
>
> Unfortunately this is sort of beyond our control. We don't expect you to
> review or apply these patches immediately.

It is *only* in your (QCom) control. I would love to have control over
receiving patches to review, but sadly I do not.

Then you should mark them RFC at least if you know they are going into 6.18=
.

> The platform announcement just happened to occur at this and not any othe=
r
> time, and we can't just ask the entire company to shift it to better
> accommodate the kernel release cycle..

That's exactly what we expect. Companies following the rules or
preferences of the kernel community is exactly what is expected and
required. Companies that continuously fail to do that result in
requirements that all patches be first signed off by trusted kernel
developers in those companies.

What would you have done if the timing hit in the merge window where
you have trees which have policies of don't send new content during
merge windows? Just going to ignore that?


> We do have an interest in sharing the work at the earliest time possible,
> and with all the legal knots included, this is what it came down to.
>
> I (and many others) made an internal push to upstream any pre-requisite
> patches that we didn't need to disclose any platform details for in
> advance, so this patchbomb is actually somewhat reduced.. but of course
> DT and bindings are the main course size-wise and we simply couldn't do
> it earlier.
>
> Give or take 80% of the bindings will be "boring", i.e. "add compatbile"
> or "add compatible and adjust clocks" because our hw is rather
> standardized and the interesting changes often happen at a level beyond
> bindings
>
> > One comment on commit messages though. Please explain how the h/w block
> > is or isn't compatible with some existing platforms. Many just state th=
e
> > obvious "add a compatible" or such. I've yet to find what kaanapali is
> > in relation to any other QCom chip. It may be the next SoC for the smar=
t
> > toaster market for all I know.
>
> Perhaps this would be useful to have in bindings commit messages, but
> the cover letter of >this< series states that Kaanapali is the newly
> announced Snapdragon 8 Elite Gen 5.

Patches should stand on their own. I'm talking about patches in other serie=
s.

> The product page states at the very bottom of the spec sheet that
> SM8850 is another name for it (although the shift to codenames
> happened precisely to disconnect from specific SKU numbers,
> because e.g. both SA8775P and QCS9100 are 'lemans' silicon)

Sorry, I'm not going to go read your product pages...

Rob

