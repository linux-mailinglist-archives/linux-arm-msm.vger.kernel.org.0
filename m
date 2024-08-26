Return-Path: <linux-arm-msm+bounces-29510-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F388E95F764
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Aug 2024 19:06:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A982C1F2292B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Aug 2024 17:06:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29FF719882F;
	Mon, 26 Aug 2024 17:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fVabn5F4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E55951946BB;
	Mon, 26 Aug 2024 17:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724691949; cv=none; b=H1eHZ9uRK2W67t72aGKxKeuzasJ+1vLkLIV/fjmTzpxu7BcJADlE5Ss/xJR619gZ1DsXH1z6WGpcx08rrhryzSI25f+UUTeM+jDzMOT+ncIhsb0edzZAtqX5PlLpN2By/H/geh/DRzHEZafA19r4A/iLUDM6RGApz+UDxFt+G5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724691949; c=relaxed/simple;
	bh=VR8cQnd2jkpOlp3yNKb3N7oiXs3ndhhCx6B2YAFwy8I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V1k2QCRWEjQV41CEQUIA5rHrseDyI8biSD8MLYomL4UZFl9nWDeEIdBEbrsqVYGasS7FErt6ZMg229zIrR4iSdSgCxEkM3q2R9N3iNVE/6m73uHxULX5uoUV9WOznsGp5rc3vXDkIoHyI++fdQaILjukmiNaRWodvvRghSqHPY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fVabn5F4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73413C5813D;
	Mon, 26 Aug 2024 17:05:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724691948;
	bh=VR8cQnd2jkpOlp3yNKb3N7oiXs3ndhhCx6B2YAFwy8I=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=fVabn5F4agEUgnaRRl/G/+oMYkarnLxCCvtUqpXLBgE65cyJl/upInXXVRzhWCile
	 9DrJ0izSdfgN9r/uXnwQ3KJ7dSS9m0zCSaqZn6lqjoR4+0Ew8pJCeJH3vLLZ9/Hy+f
	 V4AyftpZC+MWf7qi8Cp986DdrH8Nt36imz7Vl/JjB47kCsTeiMC6iXTLVfp/4BKyli
	 YYU49IkE2oOLHo+t6AZcwWaJEzcmwfR6/ZyzbzoQZVqN9dd+V54NE1DHTKNOCSBXQ1
	 wV0cw9qUu+RV0a+G8VLlPWxK5hwogUBOxer6xNHJH92y14PZKg+Axv7eCBFUVNoHjt
	 JBLZwwKMsv4Gw==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-533462b9428so7777201e87.3;
        Mon, 26 Aug 2024 10:05:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVQbGEUxAHd0Df8twFJo6SdLQWURXmHltG5gdGjID0v0BwNUn0x7kL8uYpAIYDvBqs2yajmEUzuK0b/27vfOg==@vger.kernel.org, AJvYcCWdST+IVYFddui0fFx0Ug4Yby6Bfnp8GoQv6//f+ptV2hpJ18EWbRC+4eV5KGhQ0mH82j3T8RXcTvHHGRMS@vger.kernel.org, AJvYcCX/azFGiGkm1M8gf+7k7t2qfs2+XV3Xt9SEqyVY7W6fqPldAAcNd4tGmwgMiTuSj0fOyHbQHexY+ZvK@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0CslS487lpTNSP2G/UKdGom0HBktA2E6WFoa/x0sdzJNH0Gae
	GMYMgm5u0CBTmrcoUeHzQzqWwYKhEwlIodOSztIjTLzDslPyAqarxv+RtAJ7aUrNfk1QOop8BBf
	6R3Z5BG7uQj9gMDMLZ6NEXf1vVw==
X-Google-Smtp-Source: AGHT+IFePtF/71t/va0mn7s3BHROqldAaZg4KJIDMXGMvV2CV3OEiF7RoqRoXtZli5Rfu1WTZ4RGlmXa1BMmQbL4mv0=
X-Received: by 2002:a05:6512:3f12:b0:52c:e17c:cd7b with SMTP id
 2adb3069b0e04-53438846fd8mr10502133e87.22.1724691946622; Mon, 26 Aug 2024
 10:05:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240719-topic-t14s_upstream-v1-0-d7d97fdebb28@linaro.org>
 <172222551321.175430.17493901039813561000.b4-ty@kernel.org> <CAL_JsqLiGxqDYXTJzYNE=4LN2Cpa+G_LY6C7YAfHRVmz=cfkPg@mail.gmail.com>
In-Reply-To: <CAL_JsqLiGxqDYXTJzYNE=4LN2Cpa+G_LY6C7YAfHRVmz=cfkPg@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 26 Aug 2024 12:05:32 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+f4K4OO+_PuTJEv=+mgiQnHJKKcwq4SqJzHAuQKGKkjA@mail.gmail.com>
Message-ID: <CAL_Jsq+f4K4OO+_PuTJEv=+mgiQnHJKKcwq4SqJzHAuQKGKkjA@mail.gmail.com>
Subject: Re: (subset) [PATCH 0/3] ThinkPad T14s Gen 6 support
To: Bjorn Andersson <andersson@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Marijn Suijten <marijn.suijten@somainline.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>, 
	Johan Hovold <johan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 16, 2024 at 11:30=E2=80=AFAM Rob Herring <robh@kernel.org> wrot=
e:
>
> On Sun, Jul 28, 2024 at 9:58=E2=80=AFPM Bjorn Andersson <andersson@kernel=
.org> wrote:
> >
> >
> > On Fri, 19 Jul 2024 22:16:35 +0200, Konrad Dybcio wrote:
> > > As good as the other X1 laptops
> > >
> > > See this page for more hw info:
> > >
> > > https://www.lenovo.com/us/en/p/laptops/thinkpad/thinkpadt/lenovo-thin=
kpad-t14s-gen-6-(14-inch-snapdragon)/len101t0099
> > >
> > >
> > > [...]
> >
> > Applied, thanks!
> >
> > [2/3] firmware: qcom: scm: Allow QSEECOM on ThinkPad T14s
> >       commit: e6b5a4c3ae3b883cb13be2e1cd9fbf364928173e
>
> Now "lenovo,thinkpad-t14s" is listed as undocumented.

Still an issue in linux-next.

Rob

