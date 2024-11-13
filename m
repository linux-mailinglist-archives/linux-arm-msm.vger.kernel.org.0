Return-Path: <linux-arm-msm+bounces-37800-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C51C9C74F8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Nov 2024 16:00:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C58F428A6F7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Nov 2024 15:00:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EDE841C92;
	Wed, 13 Nov 2024 15:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fo74Cp5T"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECB241C695
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Nov 2024 15:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731510011; cv=none; b=IcBnyecKb4yuyUndjmZosCdMXH3tL9Y7oZfPkQgdNHBUbEkEDDEJ7waVeYGWnKXB2p6YQZUXHHnlCWlmErTX76O3QieenKc6ipcLV7aqSwcBpbn+1W6lhl3VUGRwZQPGRvjDHTfgjf3Tj21XdfugNlDCZLUWjhLCig01EOjXj8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731510011; c=relaxed/simple;
	bh=rOTKgEN7AQTPtDYa90FhNhr0jkFxIaC9XwCYe1Rw9L8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CZnVoTtZ1nTvdsLjvMABANvC5SHBUaQ+iWXK3K/GIbXKtd3DdoOqWbVJycV6lrWjaphTduEyrpctGvf5uwBzF8522vVTCo8HFgJz4jQUgAtaoTcj6pX+5AYR0l8OugzuC8Rdz39rCTAfYpWJHJpVvy/Tr5SSir22QwOYj5AZtAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fo74Cp5T; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DB09C4CECD
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Nov 2024 15:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731510010;
	bh=rOTKgEN7AQTPtDYa90FhNhr0jkFxIaC9XwCYe1Rw9L8=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=fo74Cp5T20xGuBuJoWDCvx6LD5fW2whKrRrXb17TPB4OMRT1LOA9Us25T5mAjPlyR
	 nrsDeXnaopY0k8Ts8b8Uqehjn1K7kYCdkInuP/6R4qlZ6RMGVxJn3ZlWL5HRVwU1lo
	 TH61mvq5rxaTeCsP4wDNHeigL+beLbizUaOmrxwQCy1zRkBrlomPGLIpGt/UBAa/Nd
	 wCyUoJ8za/wau7sCbE/qdEkPshIzaqKo5HYhYUI2c2JJ3pI5uyuZ8ifFp5qFCU/EWZ
	 kYuNrF/luth8/mOtWqFwqnfKsrzKDtvkl4pdy+E+D9vp37Dx7HUnq7mCrz0fDclzoD
	 qpSUYLOmwl9sA==
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-6ea50585bf2so69708477b3.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Nov 2024 07:00:10 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVu3gcoP1V0sAig7+ZRmaKgWw3aUo2K7auWqn/w8Neq1UKg2HcLaKP4U3Gzy5bsxngbDcDAw3stugoHf/a/@vger.kernel.org
X-Gm-Message-State: AOJu0YxDCXZpvltfgqYhItAZWfV8cQGf5M2Klfx2wfE3nsUyxMhCx0Wi
	G9B4YpXmDacO60nr/wtTCTr22n3WG+a6YfydJYH0svBoJr0oDaP+JNiqDVn0w1YMJMB9O1xfui7
	aeD+NERGVzMa7Ek4O8vvWgqP7ujc=
X-Google-Smtp-Source: AGHT+IEmP17XOlHyVHoRfkmmhg8PsBNAz28CtWvLaddcY42EXpWkdkEdFUm+d5rnkoo6+m2flCQkGCHiYPvxN7tMfRM=
X-Received: by 2002:a05:690c:6f88:b0:6e2:12e5:35b4 with SMTP id
 00721157ae682-6eaddc1e448mr203356657b3.0.1731510009127; Wed, 13 Nov 2024
 07:00:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <83153c5ab8374e008d62646f200f9a04@quicinc.com> <CA+5PVA6B6cJ4sTVF_HN84_ommsMJzK5OsuaG+ikrzV1Sm441Jg@mail.gmail.com>
 <v7ltgyxqzrt7pmcgy7bfsanfxbuu5fr4rn7yxg7hal5londeqj@44v32zea44hg>
In-Reply-To: <v7ltgyxqzrt7pmcgy7bfsanfxbuu5fr4rn7yxg7hal5londeqj@44v32zea44hg>
From: Josh Boyer <jwboyer@kernel.org>
Date: Wed, 13 Nov 2024 09:59:57 -0500
X-Gmail-Original-Message-ID: <CA+5PVA79SNW6rPF7XCMTE5LswQu5Jxf+ajAzV+JWRpXz8EZc6w@mail.gmail.com>
Message-ID: <CA+5PVA79SNW6rPF7XCMTE5LswQu5Jxf+ajAzV+JWRpXz8EZc6w@mail.gmail.com>
Subject: Re: add venus firmware file for qcs615
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: "Renjiang Han (QUIC)" <quic_renjiang@quicinc.com>, 
	"linux-firmware@kernel.org" <linux-firmware@kernel.org>, 
	"Vikash Garodia (QUIC)" <quic_vgarodia@quicinc.com>, 
	"Dikshita Agarwal (QUIC)" <quic_dikshita@quicinc.com>, "Qiwei Liu (QUIC)" <quic_qiweil@quicinc.com>, 
	"quic_zhgao@quicinc.co" <quic_zhgao@quicinc.co>, linux-arm-msm@vger.kernel.org, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 13, 2024 at 9:43=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Wed, Nov 13, 2024 at 07:22:28AM -0500, Josh Boyer wrote:
> > On Wed, Nov 13, 2024 at 5:50=E2=80=AFAM Renjiang Han (QUIC)
> > <quic_renjiang@quicinc.com> wrote:
> > >
> > > Hello
> > >
> > >
> > >
> > > The following changes since commit 6482750d396980a31f76edd5a84b03a96b=
bdf3fe:
> > >
> > >
> > >
> > >   Merge branch 'verb' into 'main' (2024-11-11 20:01:00 +0000)
> > >
> > >
> > >
> > > are available in the Git repository at:
> > >
> > >
> > >
> > >   git@git.codelinaro.org:clo/linux-kernel/linux-firmware.git video-fi=
rmware-qcs615
> >
> > Merged and pushed out.
> >
> > https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/370
>
> Josh, it is very nice to see a promt merging of the firmware, thanks a
> lot. However is there a chance that you can give reviewers a time to
> react? Usually there are no issues, but I think it is important to let
> the comminity to be able to review the patch / pull request.

Happy to let things sit for a while.  Out of curiosity, what exactly
are you reviewing?  They're binary blobs.

josh

