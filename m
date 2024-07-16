Return-Path: <linux-arm-msm+bounces-26352-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B91649329B2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jul 2024 16:49:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7548A286B88
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jul 2024 14:49:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82F1519ADBB;
	Tue, 16 Jul 2024 14:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XI77zN6T"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9597854BD4;
	Tue, 16 Jul 2024 14:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721141364; cv=none; b=X50hQkn/zABrY4Yie4s9/sQhhmavfiSFi99bCuZJrhVzJTk9uCIWVIQmstuUd7ZbBTVzRqb3dh2odIfFwNbc+rtUFktmlij5KGnncaU7RKxlBVZnB6fmWk0/nlfK3fRcuIGx1Ut4aqTrg2X8Z8Em90G3kCRjeEFHPMpacwiv298=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721141364; c=relaxed/simple;
	bh=IzYm1ODjx98rPnxHT2QFZ0eJuGhCkk0xgeP66jOXqt8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O0tVZLifoIGx32pLD255xkzPzsYm83l6ZBed+hyr9n3AdoieRnoTwesKe9oJ0jz2dSdsRv7FZR8nJKvjlAsgBXLROJWXfHwnGEnPIp1rVn3wPzaE/bGJ3Fh13MdrsQklGzW8YPi0KbIOqsMe4rSbhKByF2g/Nn727VoCX0L5CNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XI77zN6T; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-52eafa1717bso5780526e87.2;
        Tue, 16 Jul 2024 07:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721141361; x=1721746161; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bAw5U9i3+ZOKLaHb8edTb084r/ssMR28KQlSh1pAWiM=;
        b=XI77zN6TfAjNKhdK1QxoDH+R4pnhyCrEC8bTxCItNsIz5VUyWam5XIpE+xo6lMIiOn
         LNxgXjQkmnjJoqI7IhNjbRpiCv571DsdXXS5HIGZb+KPN8cHokZuHGujRpn/WfwMqdOs
         NNzQWS6fpEjiKtQAdu/TlyOPcvf3O1EbY8dHsf64IAFVlWKF0xvmfZaSc+sHdfsUcGF3
         hab42MjGqyGbH75V7beMsa8/frUPTrTtLH4sEz8PyEA+HAe8hbVz6SeUD06orbGwNvdc
         nWtfmccYzU66FYGLXRRVnUX93356eruMEsz3FyVGpt3MLePVdiGICsg2cwFhVYZFDnEf
         P9Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721141361; x=1721746161;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bAw5U9i3+ZOKLaHb8edTb084r/ssMR28KQlSh1pAWiM=;
        b=DAW5FRjLLh7cjIb58e7C3JA14Y+nP2a0HcgtVSL7zb4/ysrLuK3ohiZGmnCdZSx/kO
         LXdsrZWU3jwMpf0PAdiITQNV+snyCNcRIr+z89OVTJRmXQNYXWKlu1VPsRuQXwujF5iZ
         W1k9ggWsVxi3H9OnWXvNH2FzrgOn/TpeabEDpfQAi1loo7xLgYc/R63qBh87cOdSLc8k
         DYYCUtWVqfNhCgh8eYJ0Ga9RjmM716IGIzXU+a1YlbtrIpBdghPJvnysWgpov3W2zhQk
         cDrq7DUxDPvc0kLhMuKdhnLlkLFG8DNYm6pfEnXJ200tEjmf+ge/rM+RDPIUUY0u2x5E
         Pz3g==
X-Forwarded-Encrypted: i=1; AJvYcCUdfhn8QS7ft0K6Abyc4skNrt246Uc5L2Ki2B6kJ88HV7A0+5YvhmQ8dl2MFdMthEuaFju1NYnE8P7HRF9w1LwvP9gvdt8cZq8d0ZkKY2+6uRmDlJhlh87R8T+TWo2bAmo5ZOVZT0f7CK/FXI241nM2F12veo8WuFufzsicJMvd/F2B1wvSaWA=
X-Gm-Message-State: AOJu0Yy/QQr4qrbmOPeXVvDB4XVlp+125PidCH/ARMp0V6F1paT2C6M6
	8MD8InRevajGdkbUXpoSYj+ZKJXLB0QdrxNYQw1uzPYSDyJ5lHV8aWYOK3d5PK89TbPDAffxuhI
	4cnSrZpKrhY1rhlko+1OlYy2l4SA=
X-Google-Smtp-Source: AGHT+IHW0jnedglIdeW5LQSBi91kYNksLiz+/WQyl3NwrTbSGuqtAIGUY5Bd+0hXeaqYT+TVrFsHZ63y8ZXnG6cRE7w=
X-Received: by 2002:a05:6512:33d0:b0:52e:9407:ddcd with SMTP id
 2adb3069b0e04-52edef21722mr1789750e87.18.1721141360382; Tue, 16 Jul 2024
 07:49:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240715-x1e8-zap-name-v2-1-a82488e7f7c1@linaro.org>
 <20240715190108.vjctytyntxlottgt@hu-akhilpo-hyd.qualcomm.com> <CAA8EJpqzhEotdVsW3EudR9cqSOm-djjKSgRaqKRbEtJ6wTBZKQ@mail.gmail.com>
In-Reply-To: <CAA8EJpqzhEotdVsW3EudR9cqSOm-djjKSgRaqKRbEtJ6wTBZKQ@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 16 Jul 2024 07:49:07 -0700
Message-ID: <CAF6AEGvmuzMcYz+oqu+GKhhxYqc8SqKcThY5CvR6tnES-Lu71A@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: qcom: disable GPU on x1e80100 by default
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Akhil P Oommen <quic_akhilpo@quicinc.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Rob Clark <robdclark@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 16, 2024 at 4:03=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Mon, 15 Jul 2024 at 22:01, Akhil P Oommen <quic_akhilpo@quicinc.com> w=
rote:
> >
> > On Mon, Jul 15, 2024 at 09:18:49PM +0300, Dmitry Baryshkov wrote:
> > > The GPU on X1E80100 requires ZAP 'shader' file to be useful. Since th=
e
> > > file is signed by the OEM keys and might be not available by default,
> > > disable the GPU node and drop the firmware name from the x1e80100.dts=
i
> > > file. Devices not being fused to use OEM keys can specify generic
> > > location at `qcom/x1e80100/gen70500_zap.mbn` while enabling the GPU.
> > >
> > > The CRD was lucky enough to work with the default settings, so reenab=
le
> > > the GPU on that platform and provide correct firmware-name (including
> > > the SoC subdir).
> > >
> > > Fixes: 721e38301b79 ("arm64: dts: qcom: x1e80100: Add gpu support")
> > > Cc: Akhil P Oommen <quic_akhilpo@quicinc.com>
> > > Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > ---
> > > Changes in v2:
> > > - Keep GPU enabled for X1E80100-CRD (Johan)
> > > - Link to v1: https://lore.kernel.org/r/20240715-x1e8-zap-name-v1-1-b=
66df09d0b65@linaro.org
> > > ---
> > >  arch/arm64/boot/dts/qcom/x1e80100-crd.dts | 8 ++++++++
> > >  arch/arm64/boot/dts/qcom/x1e80100.dtsi    | 3 ++-
> > >  2 files changed, 10 insertions(+), 1 deletion(-)
> > >
>
> [..]
>
> > > diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot=
/dts/qcom/x1e80100.dtsi
> > > index 7bca5fcd7d52..8df90d01eba8 100644
> > > --- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> > > +++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> > > @@ -3155,9 +3155,10 @@ gpu: gpu@3d00000 {
> > >                       interconnects =3D <&gem_noc MASTER_GFX3D 0 &mc_=
virt SLAVE_EBI1 0>;
> > >                       interconnect-names =3D "gfx-mem";
> > >
> > > +                     status =3D "disabled";
> > > +
> > >                       zap-shader {
> > >                               memory-region =3D <&gpu_microcode_mem>;
> > > -                             firmware-name =3D "qcom/gen70500_zap.mb=
n";
> >
> > In general, why not keep a default zap firmware listed here? Anyway we
> > are disabling gpu node here in case of platforms which doesn't upstream
> > secure firmwares.
>
> Excuse me, I missed the question before sending v3, however the answer
> is still going to be the same:
>
> First of all, we don't do it for other platforms
> Second, we don't do it for other firmware. Each DT declares its own
> set of files.
> Last, but not least, it's better to get an error message regarding
> firmware-name not being present rather than a possibly cryptic message
> regarding firmware failing authentication.

tbh, I think it might be better to just remove the default fw name
from a6xx_catalog.c device table.  That would better reflect the
situation, ie. some fw is needed and not available (if the
firmware-name prop isn't provided).  Trying to fall back to loading
the wrong fw is a mis-design.

BR,
-R

> >
> > -Akhil
> >
> > >                       };
> > >
> > >                       gpu_opp_table: opp-table {
> > >
> > > ---
> > > base-commit: 3fe121b622825ff8cc995a1e6b026181c48188db
> > > change-id: 20240715-x1e8-zap-name-7b3c79234401
> > >
> > > Best regards,
> > > --
> > > Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > >
>
>
>
> --
> With best wishes
> Dmitry
>

