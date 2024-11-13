Return-Path: <linux-arm-msm+bounces-37848-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 77B799C7AB8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Nov 2024 19:10:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 69DF9B23EC5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Nov 2024 17:53:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C6F12022D9;
	Wed, 13 Nov 2024 17:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="k2g2dSBw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95DC12AE69
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Nov 2024 17:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731520431; cv=none; b=mPGvbx0Dt3CwgmYi/CgkTrmlZxSPSeMkqoYp94A/sniJOCzPDnx3Y6GgJROI0QRCpIAGbivxqXW/wmOF2DiL8SZfWcjKQLSLBsUMYahwBo8JsKDy1OUoE/1bCUGhw3Gw567BETuEnT8m2pDDq8tM0AZFw1bJE9f8/D2h0daVZ1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731520431; c=relaxed/simple;
	bh=zm1fv7C9ZvMgmxoPVPmAEYJM5s2lGtTeZmY8+odA6jg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f+O/kmSadHXJ2DMaxjsj0FH1Cl+wFa5qVVHkarcantv3djBphX19yQE2WeoUnMdEakUY4/UQJVWJkF7F66a4PaMOMpG0n+e7Itir5t7f5lsLQjAbx6NAiunsecNMJ+RX+R0OIgZ53G9Gf9zNAEokAIhxK9obVrIae7xUGQBA+dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=k2g2dSBw; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-e33a8c84b9aso3530582276.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Nov 2024 09:53:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731520428; x=1732125228; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V0HM892jiNpcUVDvngIW3uKBaNyn81wMonH3CRQInwM=;
        b=k2g2dSBwJ0AkJTBs5TPOOS594JcbZvhj1lC3TLUDICB6VWeZqC8ZtsWvKvjwNs6gxd
         7Q1p5EtH+Eb2laKStFi8YM9oJwF2jb2dtbnwGGTuku7hqDfiYD4cNk9Wf2XvxBijHnSX
         vCnzyOIi4gEUjYxnTIjSWlaNZQ76XfECOGlwNiBeqUHH4m7gHPaf4dQ2KcSCyQc9bo9K
         ndiAxckhh9GQO3rdSe/AT//emR+ewuzqTDCWP2Uhx+v7AdyaBrI+OA4qRbUANMt/5KUn
         32ddkXcb1t+LvZybYecbByvsGP9qJWxStaxltI5xSYPLakRUenDWrdQ0oC+nRhmf1m+b
         6OBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731520428; x=1732125228;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V0HM892jiNpcUVDvngIW3uKBaNyn81wMonH3CRQInwM=;
        b=Qws8MKFDuv/GXW/uwRDxDLdqIrAaCMFJdnz8Lxtx0CX7/JOZ2qM1v1oRBiNFAYAbY5
         N1CfA+5VMdIDS0LV3jhdsk2qeX5mQZ7DSHndYhAaxHg3jHVq4thz/i9ZpIxMkQtjkzzH
         q3DKP+GScl4t1/C2pqMPgWUOshR5cSJfdi1XWnxETTHLLmbFyx2sromzz2RS+1rKWyof
         alyKvVsETO+BEnI240vtJf6Au2OkhAgBlo2hTi7xJE7/t6z1lfNSS1tQoezhZr6GpFoy
         ddSN8YCUp5URWJEOBrCvaIQ0ri0rovtFvKK1Ip9RqKpKkwkWhZ8M3COBI0WIrqAFQEqs
         viIA==
X-Forwarded-Encrypted: i=1; AJvYcCUcHxJtXXOeB7DLLMROU2ZpagsrFXfWE7Rp2ocxLWnb2EiNj0mG3o+o44XiLXt3VCjbgjStHNclBdCokdeU@vger.kernel.org
X-Gm-Message-State: AOJu0YyjUneCP4dRQ1MEmNK9RHxmkGB233FrR/VMJxbN3w2Td9OZrlA0
	kCp0CRL+y9b3n3aPiaUXT0cg21ptIzMSse3/NnFheYhJLbOedDDwYSGXCDpzAg7flBJE7Dt2mtL
	OrM67SrEUIefSV4yfTrABL4s0TH8noXbiD2nMSdw1JDRaLq0q
X-Google-Smtp-Source: AGHT+IG/FxsxAVZjA0S4w2yNDF7845ou6UQCRi8CzwPkPHrpGvfQjJZBg9L9DaEJfeAb1k1rHj0ZKAv66tVhrBp5EBw=
X-Received: by 2002:a05:6902:2b01:b0:e35:e0c4:a06b with SMTP id
 3f1490d57ef6-e35ecf0b3demr4644521276.25.1731520427281; Wed, 13 Nov 2024
 09:53:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <83153c5ab8374e008d62646f200f9a04@quicinc.com> <CA+5PVA6B6cJ4sTVF_HN84_ommsMJzK5OsuaG+ikrzV1Sm441Jg@mail.gmail.com>
 <v7ltgyxqzrt7pmcgy7bfsanfxbuu5fr4rn7yxg7hal5londeqj@44v32zea44hg> <CA+5PVA79SNW6rPF7XCMTE5LswQu5Jxf+ajAzV+JWRpXz8EZc6w@mail.gmail.com>
In-Reply-To: <CA+5PVA79SNW6rPF7XCMTE5LswQu5Jxf+ajAzV+JWRpXz8EZc6w@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 13 Nov 2024 19:53:37 +0200
Message-ID: <CAA8EJppUfGB4XcZXyG=ZUdKREo+x6yR=dAbahdjMvzShCmqoDQ@mail.gmail.com>
Subject: Re: add venus firmware file for qcs615
To: Josh Boyer <jwboyer@kernel.org>
Cc: "Renjiang Han (QUIC)" <quic_renjiang@quicinc.com>, 
	"linux-firmware@kernel.org" <linux-firmware@kernel.org>, 
	"Vikash Garodia (QUIC)" <quic_vgarodia@quicinc.com>, 
	"Dikshita Agarwal (QUIC)" <quic_dikshita@quicinc.com>, "Qiwei Liu (QUIC)" <quic_qiweil@quicinc.com>, 
	"quic_zhgao@quicinc.co" <quic_zhgao@quicinc.co>, linux-arm-msm@vger.kernel.org, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 13 Nov 2024 at 17:00, Josh Boyer <jwboyer@kernel.org> wrote:
>
> On Wed, Nov 13, 2024 at 9:43=E2=80=AFAM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> >
> > On Wed, Nov 13, 2024 at 07:22:28AM -0500, Josh Boyer wrote:
> > > On Wed, Nov 13, 2024 at 5:50=E2=80=AFAM Renjiang Han (QUIC)
> > > <quic_renjiang@quicinc.com> wrote:
> > > >
> > > > Hello
> > > >
> > > >
> > > >
> > > > The following changes since commit 6482750d396980a31f76edd5a84b03a9=
6bbdf3fe:
> > > >
> > > >
> > > >
> > > >   Merge branch 'verb' into 'main' (2024-11-11 20:01:00 +0000)
> > > >
> > > >
> > > >
> > > > are available in the Git repository at:
> > > >
> > > >
> > > >
> > > >   git@git.codelinaro.org:clo/linux-kernel/linux-firmware.git video-=
firmware-qcs615
> > >
> > > Merged and pushed out.
> > >
> > > https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/37=
0
> >
> > Josh, it is very nice to see a promt merging of the firmware, thanks a
> > lot. However is there a chance that you can give reviewers a time to
> > react? Usually there are no issues, but I think it is important to let
> > the comminity to be able to review the patch / pull request.
>
> Happy to let things sit for a while.  Out of curiosity, what exactly
> are you reviewing?  They're binary blobs.

Yes. However sometimes they can be pushed to a disputable location or
have other issues. In this case I'd like to understand whether this
binary is specific to QCS615 (and thus it should be a separate binary)
or it's just a somehow updated version of the existing binary.

--=20
With best wishes
Dmitry

