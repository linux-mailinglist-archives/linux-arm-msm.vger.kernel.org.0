Return-Path: <linux-arm-msm+bounces-27290-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F3B0A93FCC8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 19:50:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 312561C220CB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 17:50:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20D672B9D2;
	Mon, 29 Jul 2024 17:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DrZK72TN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7251515E5CD
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jul 2024 17:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722275402; cv=none; b=OqOvpQ05GjOxpk1XZPy6CZET2MsaOISQxklmdnkE25O0FT8yg/Mj+n9txwF/91Yq30i7wRm25h0z7NCRh5nwinAmAiE2V1ltrt5dqH0IqR9YL08VRnAcMhkMxlFyr49wXrWWh1xdHTOKy8SSZ9d13sHRD5pYjjSTmRgfyJVYUqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722275402; c=relaxed/simple;
	bh=bihYQoBOOiJiGuf2B6GESNpxVhKjMGZpNIOW4gqLU2o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rL8TnsskHLKHNcR2zXN6vKYuMlvd4p1qzZGvAZ1rlAl8c0HfOnNwyyYN7y4Mf9fos178YnwgqWY4AojjC2E5M2ar3LtvnQyZFDdScfK5HNAIPNJcbVVrcQu0mTgXHVCDaN1p/cCSiW4rE0agiAnviUJMyZtGqFyaGmjxfL88Q50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DrZK72TN; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-661369ff30aso21639037b3.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jul 2024 10:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722275399; x=1722880199; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=U48fpdCm4NGtwo1sTgsrUBIRZd2qhEbh1HbahK/oVr8=;
        b=DrZK72TNN2Bw9yhAy8wcAzarLK+KX8QP0P5ydHneLlLRYIXNOUCvu9lxO9Aqxo/kso
         b1KBujIOyzuDQK9sd6JWAwk3cKBbRif9IOohVQ0q5GXxz4mrhOM4uCrRF37y2RQappqm
         M7k2/zGbv9RwsedClBsBUjHii8dXkrZEt4a5JtF2fLJKaflJW++0f9a/RGd4/2TR0hq6
         lqncgsk2EYDvF98zG+tiVY4wSPEPMHhmLtMvE6+cmbu5E9apSyluqoWfcUAUj/Vi5VhX
         s8lHL7DKT3wFlZSNje5x11NBvZv5/DcasPdmvqnVm6jxeAtBe8gofDbSPhEgI7s7CuAo
         k7gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722275399; x=1722880199;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U48fpdCm4NGtwo1sTgsrUBIRZd2qhEbh1HbahK/oVr8=;
        b=pu6wWnDlzDVfooIkzNcgkeNFYX8pRSDH6GGZjLFkwP+eSHqNXy8yTXsvXLAfotHH9R
         ndDws9oQmIhFG3+gVXvsakSlVIxldXc+GbPLbze47F3T4cR9MEAlx71TXnjxh9P2IwB8
         jqlHFQaZIMeQFCrdnKrh6VaB6Zen0tfsUOe7ApcfXmxvYMQnwZeYg31coLBjUmI/wMnT
         HUxI47vLyicEUa0+sEDsXni/m0TbzeZPj8qe2lVZURjqBPANF3DfRziIyUjV35gNjTnO
         9NfGesy8wrJHB3Frmf6JC0ZkpfWxT16W94TV9MFittM8BGvhid0asmb5k5+5nyRwDMtW
         RL8A==
X-Forwarded-Encrypted: i=1; AJvYcCWi/2v5ADQIKNfDDAFPyhz1EL2DMqfrNC/Rna6d96boJrpJ+GgmdpnA39NtTLEVbP9ITKlFR7GPAg3Jg1ZPvW5Wvjnur78xwhh3CS9sdw==
X-Gm-Message-State: AOJu0YwNGAqxn9X2wFhGDbVUKx+4YiMANkF4K4aYw1bSfjoVQrQ3Xi4w
	pNjjpY28zGRNDfHIBFBsUUH8XbNDWdXPVEUbtJYp8biMIDSYbVAIIdoGNY+MgfqfQoHxSxXzNO8
	G9+5CqCRJLBugztK4AdOGnEhbm4RP1hgx4DK9Mw==
X-Google-Smtp-Source: AGHT+IGyAtQWoTJobqaZBwhClULReeX2eVYFV263RkPuVkU/hSqxYd91PSjHx1mgomnc4KTeZggZZGZiQG6l1PmOvJM=
X-Received: by 2002:a05:690c:3384:b0:675:a51b:fafc with SMTP id
 00721157ae682-67a0959640fmr100729907b3.30.1722275399444; Mon, 29 Jul 2024
 10:49:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240729-fix-smd-rpm-v1-0-99a96133cc65@linaro.org>
 <20240729-fix-smd-rpm-v1-2-99a96133cc65@linaro.org> <6c5acb84-0d09-4a87-adb2-d0b10c67b98d@kernel.org>
In-Reply-To: <6c5acb84-0d09-4a87-adb2-d0b10c67b98d@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 29 Jul 2024 20:49:48 +0300
Message-ID: <CAA8EJppO_fohT_NWJ1P95YYejgAnZQdzrBpz7Ooceiu-t_MkQg@mail.gmail.com>
Subject: Re: [PATCH 2/4] soc: qcom: smd-rpm: add qcom,smd-rpm compatible
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andy Gross <agross@kernel.org>, Stephan Gerhold <stephan@gerhold.net>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 29 Jul 2024 at 18:04, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 29/07/2024 13:04, Dmitry Baryshkov wrote:
> > The device node has the compatible string, so the glink channel name
> > isn't used for modprobing. Add the qcom,smd-rpm compatible to let the
> > module be automatically loaded when required.
>
> So autoloading is not working? I don't understand whether you are fixing
> real issue or just making something complete based on your feelings.

Yes, autoloading of smd-rpm is not working since bcabe1e09135, kernel
looks for qcom,rpm-FOO rather than the rpmsg:rpm_requests.
The obvious fix is to revert the commit, but I don't think that
listing all the chipsets there is a correct thing.

> >
> > Fixes: bcabe1e09135 ("soc: qcom: smd-rpm: Match rpmsg channel instead of compatible")
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  drivers/soc/qcom/smd-rpm.c | 11 ++++++++++-
> >  1 file changed, 10 insertions(+), 1 deletion(-)
>
> Best regards,
> Krzysztof
>


-- 
With best wishes
Dmitry

