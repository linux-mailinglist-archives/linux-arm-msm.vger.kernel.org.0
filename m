Return-Path: <linux-arm-msm+bounces-22211-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E29690282D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Jun 2024 20:01:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 26D8A1C21B02
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Jun 2024 18:01:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D1C41DFFB;
	Mon, 10 Jun 2024 18:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Mjz+bm43"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73FF31D54A
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Jun 2024 18:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718042478; cv=none; b=TMRyR3UcAXVPGm6yAHETKq8Mdp9JNB0ruxwP9UIba7JUm2GWs5ZwXTgyR9pyl8iywYrqMPm6GeeV11uHHNhujA7SEOUyCCxhAb/OzJLexMtSEupYdyaTAF51N8DJFly2h4O9gQEB1Gtmu6e6mrTwR0RAAnAkj+OLkgLl4+C7Cr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718042478; c=relaxed/simple;
	bh=Fa1MW02xtYNxpyq3hVxOyrhFI0x0nuzPDJiQWvaIXOM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TGpWMdUT5SF+wKGNOSX2+pObwIaGwSg7DMghQdn1i1DwJPx7vq9jSTfDtKwfEEKmbKl67flCU0Gsm+Y+gGEBhnxUhle8S+XiOW6GCYu8ldzN0dOTfxFymE0Rvqv3WtzyIK7bXMVfjwTneSmMfB2qOJ8Hvv3uzMulRooHfF7H4kE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Mjz+bm43; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-62a2424ed00so42025237b3.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Jun 2024 11:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718042475; x=1718647275; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/0KaDHM8PScqCd7K0oCuZ7GctWWLIl5bTkF49b4ZqfE=;
        b=Mjz+bm4399H/o7GTDQwMlmLF0NrnQIBBtqvjeDjtwB5x6zYrDe1NYVg1iltV5yfzoe
         9GUVxsLSckL6vEKNMXsYcGcjWV5zn+7eDxEnuPFj2KbNuZzmEZdO6EHveItpAvYLxfJk
         lHp7cG4+Z3TSV4mqW0Ki17qraf/L97EstQMSYd4czvIaHp+k2IJg/PYUxslkLr372YXO
         N8Pm+3of736obHzLK4gxip08leS732QY5TT5CzlS39fqSUpUApfSbJgvr+ttT/aHl7W8
         s/I1GEFqGPaYOkVh3qRkEzPbn1E1RstZKpl6m+NzhrU8xUjVQRdlqGfS3HuTpMksSP+f
         Qd8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718042475; x=1718647275;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/0KaDHM8PScqCd7K0oCuZ7GctWWLIl5bTkF49b4ZqfE=;
        b=xRwhkWL6XfazValwOMejfxRjobDutBSiY6oljLz64n46Lzsi1X6A62hT4tp9VvI+dn
         Fm5Gk7mIlGC/kkBoyrlnTLveX8soN6/4ZyKWV1maf0GKGJRWI2NuSkOv67s4vxAbsahZ
         yiIppQGEjHPLti06VHzO/gFYqu2RX6stftTQxWtuJm4lpBtVawMSBjY97K3Yydyuh4bX
         PqDnBXfahA6vtNMjvljlHmLNMRg0rJKYcHhPlE70+RWU3R/THYOw170H94GGFYeDYMeV
         wx1ux84q2q/0RCKaDZBqtxqvthmRMZLV3l8egjMJQVi4IwEPPX80O27G1c+AAj5iB6K1
         Jpyw==
X-Forwarded-Encrypted: i=1; AJvYcCW6BlIDEQpfypNy9jlT+BM3mqM25MUNNe/XMWKfEPql2bFTR+ixNpsT8ZE2qPjuyS2PQA4YnK3foGQohPIsaGpoFbSFrxKTK2m9AT5SRQ==
X-Gm-Message-State: AOJu0YwNY/Pm8yEkcH7Li6Tn8cR/gXJFI6TVmWYsrDKCpAQeOKVlih/s
	BLevwHZQiXx1yH5595/VI7Sb1J7eLtg1ikSBJCfbpJvM85fQcK/VrXuuJJUYqvSAJIJ8KuAuMMZ
	mjQel96IjBTDu6y4usK29ppWIlxwVe3NrVa1+9A==
X-Google-Smtp-Source: AGHT+IGViW9iwGdwl2ZOTouNSxtXASXUQ9Auy/K59++s+dLeYurbqnkMaU1cmD3YrwP3c4bfis5CyRo+xKEEFbsSK1k=
X-Received: by 2002:a81:e50e:0:b0:607:d285:4d7a with SMTP id
 00721157ae682-62cd5667e5fmr87990297b3.52.1718042473872; Mon, 10 Jun 2024
 11:01:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240606104922.114229-1-srinivas.kandagatla@linaro.org>
 <i6jwqycgywrq42u4km6pjppgvvhsbvuh7m6mzyqy2qcge32ihy@n3lrowkyouv2>
 <3ea05a12-27a8-46df-9fb3-28501404a399@linaro.org> <CAA8EJpqMk9vujHAmF+xSKBDzR1LM9w-M7a8vxcCkXey9VpHBhA@mail.gmail.com>
 <ab5c2a6d-6819-48eb-a3c5-178fa37204bb@linaro.org>
In-Reply-To: <ab5c2a6d-6819-48eb-a3c5-178fa37204bb@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 10 Jun 2024 21:01:01 +0300
Message-ID: <CAA8EJpq6tqO6chKASKWUtfq_9vt2tQp7eH1XJY3OaVnAahkwwQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] ASoC: qcom: display port changes
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: broonie@kernel.org, perex@perex.cz, lgirdwood@gmail.com, 
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, krzk+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 10 Jun 2024 at 18:36, Srinivas Kandagatla
<srinivas.kandagatla@linaro.org> wrote:
>
>
>
> On 08/06/2024 15:56, Dmitry Baryshkov wrote:
> > On Sat, 8 Jun 2024 at 12:12, Srinivas Kandagatla
> > <srinivas.kandagatla@linaro.org> wrote:
> >>
> >> Thanks Dmitry for testing this out.
> >>
> >> On 08/06/2024 03:23, Dmitry Baryshkov wrote:
> >>> On Thu, Jun 06, 2024 at 11:49:18AM +0100, srinivas.kandagatla@linaro.org wrote:
> >>>> From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> >>>>
> >>>> This patchset adds support for.
> >>>>       1. parse Display Port module tokens from ASoC topology
> >>>>       2. add support to DP/HDMI Jack events.
> >>>>       3. fixes a typo in function name in sm8250
> >>>>
> >>>> Verified these patches on X13s along with changes to tplg in
> >>>> https://git.codelinaro.org/linaro/qcomlt/audioreach-topology/-/tree/topic/x13s-dp?ref_type=heads
> >>>> and ucm changes from https://github.com/Srinivas-Kandagatla/alsa-ucm-conf/tree/topic/x13s-dp
> >>>>
> >>>> x1e80100 is verified by Krzysztof with his changes in tplg
> >>>>
> >>>> https://git.codelinaro.org/linaro/qcomlt/audioreach-topology/-/merge_requests/7/commits
> >>>>
> >>>> Thanks,
> >>>> Srini
> >>>>
> >>>
> >>> I have been testing this patchset on X13s, switching between speakers,
> >>> connected and disconnected DP output.
> >>>
> >>
> >> This series changed the Jack event names by removing HDMI string from it
> >> as suggested, did you update the UCM to reflect this?
> >
> > Yes, I did. The pipewire properly reports 'unconnected' state, but
> > nothing stops user from selecting the unconnected device / verb.
>
> No, the jack events should prevent that from happening. You should not
> see them in output devices in settings->Sound.

No. With PulseAudio and with PipeWire unconnected devices are still
visible. They are annotated as (unconnected), but it's still possible
to select them.

Anyway, even if the sound daemon were to forbid that (or to hide these
devices), it would be perfectly possible to select them via alsaucm,
not to mention the amixer.

>
>
> >
> >> I have pushed changes required to
> >> https://github.com/Srinivas-Kandagatla/alsa-ucm-conf/tree/topic/x13s-dp
> >>
> ...
>
> >> kernel:
> >> https://git.codelinaro.org/srinivas.kandagatla/linux/-/tree/dp/sc8280xp-6.10-rc1?ref_type=heads
> >> ucm: https://github.com/Srinivas-Kandagatla/alsa-ucm-conf/tree/topic/x13s-dp
> >> tplg:
> >> https://git.codelinaro.org/linaro/qcomlt/audioreach-topology/-/tree/topic/x13s-dp?ref_type=heads
> >>
> >>
> >> with the above on my x13s, I can properly do switching between dp0,dp1
> >> and speakers with no issues.
> >
> > Have you tried switching to the unconnected sink? Starting the
> > pipewire when the previously selected sink is now disconnected?
> >
> >>
> >> Can you try them?
> >
> > Is the changing of the JACK names the only change in the UCM? compared
> > to your previous version?
>
> Yes.
>

Then consider it tested with your patches (I did fix the jack names).

-- 
With best wishes
Dmitry

