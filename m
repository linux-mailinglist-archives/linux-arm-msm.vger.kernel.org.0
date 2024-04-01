Return-Path: <linux-arm-msm+bounces-15902-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0382B8936EA
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Apr 2024 04:25:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AF9A1281066
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Apr 2024 02:25:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACCFE1362;
	Mon,  1 Apr 2024 02:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dXInj7ds"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E28B010F1
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Apr 2024 02:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711938333; cv=none; b=grwPXQF+TV/qNfIJhbV+W+CE73pipJv5Om8l5KU+ouydKbK0H2VyvaP7qv+cddrBUJVOyBmUTVYyzWWnoDkqyaDj3vVAaJVKXhvM6SAPBPpxl2mrTK/ySnXIwFHwvNGzMLsBizsWMs5fhyhaPfnMG8ZzLCfijamReThXauJLFiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711938333; c=relaxed/simple;
	bh=Xw7JZ5cP9Mxc06CRxC1FB8/x8MyizyNq5KlvS+gOSzA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BJ8NphrZRE53mXBKXD9vWjSDm1SpLH6B8++IOwNpqVLtkEK27FRvXdeNEzas1ch3G9s+fUvQwFUAMd6D++uaa2/ViNe8IVcVJwL5IXHsiUfNBBVQg4l6yXnEn9S00KOw7Wwm2DRp39EZwpctNTebmXAjXgx+RiI7rbk9n5Ysy4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dXInj7ds; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2d4886a1cb4so45512651fa.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 31 Mar 2024 19:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711938330; x=1712543130; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xw7JZ5cP9Mxc06CRxC1FB8/x8MyizyNq5KlvS+gOSzA=;
        b=dXInj7dslCvAt4eLYfFK3PxODgqPAc2mSLbfSw5IsVKq6ccMCsGd2IGX4uEcx6JHB7
         JQoupE1TXI3qQvTB+sHwklk7DepGN71NU8ZrcJI5icBcNy7h5phdzF7aToXFS9pSabVU
         EmLTOOqW3Lpk/m3NoTPCoxjc4duqjC6np71/8YHT6ANT71aXBfU5VJUZkK/Lwl40Fpto
         WfzTb4+EQBBPlAMYgIJhHDoOp5lz3G9Q5fHHYEyThYBukDMxS+7/PHQycGc7qVqHvIRW
         y0C9ATbljvs/IFnwsXkZKTQxFCMAFYNhO7Gu0SxfCEpehvrOZk84Jv3nhqoFYg5yVU3m
         ip9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711938330; x=1712543130;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xw7JZ5cP9Mxc06CRxC1FB8/x8MyizyNq5KlvS+gOSzA=;
        b=jT6KqZZKAWCRnt4LeyPfHNE3d1c/C2dLNcfcJPODQoK4IKlXnUqFLTY+dfHPaAurke
         jc50R/mFLH0VgVewePqQiPgWVBM8SXuipurropUxra6gFIKRppnSWMb4llsBeg8sBUO/
         1ej+wasn8AC5u42cB5cDpVDSXU0yghK4aWDNgUZvCOMpleHYE3vQY2ksU/Pz92GHXaPA
         fjizX8TLMlp4ffDUJJwIIc4qDMXklyyUvDu/K0bnI46IqehoJYD/cSZeUkWRstiyWb8m
         XuoblHT2zUsf0iiT5qII+4LI+9nDOUcjrT/DzD8RiSFghMYmQI8TSusZESWmwfD1qDsR
         XdqQ==
X-Forwarded-Encrypted: i=1; AJvYcCW2isaAcyAeHTGdHoFMHuK8b7Kctb4NOI3xq2Eb/7A2TSdoBPNlpO6up5HqfL6KFGC+vekEwtNQQw+NNTpGl/y8wsljfwFmpRevMDuawA==
X-Gm-Message-State: AOJu0YwTG2gpuPS2pYJxVrBKh7ULKKJC82F5ET4AXIMISvqvmABQZNoV
	zUP9+0Lilpd/Z7e49/V53JB5M68ZRmDH9yaYuLB75VnZdT7Ot/wE9KA2tEQgNNYvyPg28v9eySH
	G0nd2+Fsj29jczg7400ckvu9uOQJcEsKl8BniXg==
X-Google-Smtp-Source: AGHT+IHKkTnSyw5P0OvwczKf1uGSPsOI0/jLnf8GDjZN2xURVA2CzA+lYOJZ7sbbewSNcxf0NqTjcPipDx+7EyH8ArM=
X-Received: by 2002:a2e:850a:0:b0:2d7:b4e:1908 with SMTP id
 j10-20020a2e850a000000b002d70b4e1908mr5447615lji.42.1711938329992; Sun, 31
 Mar 2024 19:25:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240318-topic-sm8650-gpu-v4-0-206eb0d31694@linaro.org>
 <20240318-topic-sm8650-gpu-v4-1-206eb0d31694@linaro.org> <3e15fd38-13d1-4b99-aaf0-f422b2dbab59@linaro.org>
In-Reply-To: <3e15fd38-13d1-4b99-aaf0-f422b2dbab59@linaro.org>
From: Jun Nie <jun.nie@linaro.org>
Date: Mon, 1 Apr 2024 10:25:15 +0800
Message-ID: <CABymUCOHOTeY9y8trKFtWF9AQXQoKJE1d9uoHWXz60w_JHocUQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] arm64: dts: qcom: sm8650: add GPU nodes
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Konrad Dybcio <konrad.dybcio@linaro.org> =E4=BA=8E2024=E5=B9=B43=E6=9C=8827=
=E6=97=A5=E5=91=A8=E4=B8=89 08:24=E5=86=99=E9=81=93=EF=BC=9A
>
> On 18.03.2024 11:09 AM, Neil Armstrong wrote:
> > Add GPU nodes for the SM8650 platform.
> >
> > Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> > ---
>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>
Acked-by: Jun Nie <jun.nie@linaro.org>

