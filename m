Return-Path: <linux-arm-msm+bounces-3727-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2531A8089BB
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Dec 2023 15:02:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5A284281AE7
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Dec 2023 14:01:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 236AD4122B;
	Thu,  7 Dec 2023 14:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="bn5DxgBU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oo1-xc29.google.com (mail-oo1-xc29.google.com [IPv6:2607:f8b0:4864:20::c29])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7A3E133
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 Dec 2023 06:01:52 -0800 (PST)
Received: by mail-oo1-xc29.google.com with SMTP id 006d021491bc7-58d12b53293so366642eaf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Dec 2023 06:01:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1701957712; x=1702562512; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FgofkDV1QE+maxkL3S2zjSbu6oUy+IWDuYDQrR9vz/Y=;
        b=bn5DxgBUnGSxosVGKf/1iQfI+3Fao4pQFZYZSwTiR3BlvgJxWaJQ4YW29MdieD60AZ
         JqGWwhfGKZiPrafKGq7o5jKklPgi/m0jVKbsU1ODXtMwojZ1izUmm/WfpeC5PXbgqeqa
         8vhGYMJIo4dobjnAA1a6sL3zMWD/HzKacYCBizpitBiyVbEWigOSwjLuBiCpohi04Iu2
         8H1FI431fPwq/Qv9QvZoEO5uwiBN7UELAZ8esHT4ASzt8zF6vIJRTDsrLcdJvMIvI2ob
         cDhLjWiFSlap+VB3dC00F5qwPUw8ykDCFqqdLuNZfFjsjhg+W+cyrxQA9oCKrF89NaoS
         7e7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701957712; x=1702562512;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FgofkDV1QE+maxkL3S2zjSbu6oUy+IWDuYDQrR9vz/Y=;
        b=AzPhrOzSzcYS6rs2ZD4OV5NvHUnz6svsMjkFLjiLn+imHOQVpGriTUkvDGuX862jVQ
         I/gmPK4F9PglzetarClifDoMwnQpJ0dfneD4oNI2DkGt/dlrA7prE5+xY3Md9a9CrJqO
         t6WyuUjCU9DbGE5Qyl8NaWklk3jBDV+M4E4rnwFX38IFMeVCPBEasYTSBYGK+B8j4+CC
         fEVTDXigsmDmM3x3g3mJA+rXgTo2aWif0dr09duCdfC9uc08eT6X5uTj9oqywDTF8liB
         D5MloSJ0u/0371ldYLAPjpcjmvI0M2WuaZtWitut3R2Ss0WtkOno5f2QyFxHqyBN2FWy
         OW+Q==
X-Gm-Message-State: AOJu0YzFTo86IIl29Z5r+2XFf4khb+KtysxIzH1JUshqkJScVALM2f4V
	Hc8S4W3biBW3H80xwgwkbIa9F9Jx0cioaSE/esbzbQ==
X-Google-Smtp-Source: AGHT+IH4M1aBn/CT31gTrrwolpvSe2SEDODFou3tTJp1e3rmuWcBNBzkdyGi0z/PBvz1FAZx5dIKms1bMl6jOkL3qeU=
X-Received: by 2002:a05:6358:7201:b0:170:21b6:627f with SMTP id
 h1-20020a056358720100b0017021b6627fmr3209750rwa.14.1701957712079; Thu, 07 Dec
 2023 06:01:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231207091202.19231-1-brgl@bgdev.pl> <20231207091202.19231-3-brgl@bgdev.pl>
 <e58c7338-b01c-4327-9835-a3f4f8986a4e@kernel.org>
In-Reply-To: <e58c7338-b01c-4327-9835-a3f4f8986a4e@kernel.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 7 Dec 2023 15:01:40 +0100
Message-ID: <CAMRc=MfGzVODRmhxSjSc16TjwNrLSXS-WWgeSPTDkEkFo9mS4w@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] dt-bindings: net: bluetooth: qualcomm: add
 regulators for QCA6390
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg <johan.hedberg@gmail.com>, 
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>, Alex Elder <elder@linaro.org>, 
	Srini Kandagatla <srinivas.kandagatla@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 7, 2023 at 2:26=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On 07/12/2023 10:12, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Add regulator properties for QCA6390 that are missing from the bindings
> > and enforce required properties for this model as well.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Please use scripts/get_maintainers.pl to get a list of necessary people
> and lists to CC. It might happen, that command when run on an older
> kernel, gives you outdated entries. Therefore please be sure you base
> your patches on recent Linux kernel.
>
> You missed at least devicetree list (maybe more), so this won't be
> tested by automated tooling. Performing review on untested code might be
> a waste of time, thus I will skip this patch entirely till you follow
> the process allowing the patch to be tested.
>
> Please kindly resend and include all necessary To/Cc entries.
>
> Best regards,
> Krzysztof
>

Sorry, I just used the command I used last but this time there were
additional dt-bindings patches. Will resend it tomorrow.

Bart

