Return-Path: <linux-arm-msm+bounces-14136-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C7A3187BD3F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Mar 2024 14:05:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2D47FB217F8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Mar 2024 13:05:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD2705914E;
	Thu, 14 Mar 2024 13:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gXLxoAhX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F55759B6E
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Mar 2024 13:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710421540; cv=none; b=MhAy7POWyImGtz9SOPQiiAfekFz77/w9H44qeZkzDr45nsKHJGXZM2RT5up1qFyPFU82BjTe4hqhuVo9NENGIRlUufX/XvhpwtvFwBTzrDWvPcbwq2IzVukADbLPB3GmNY3w4+V1rIDalc2CO4GaKQmkFy4StqURP1gpB+gqQAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710421540; c=relaxed/simple;
	bh=QBhs2rdEI9Ta2Qm5lV/m1p6meuBuhC/dnIjl3YYKYI4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HMoLo2KmnciHUL4UYgJmn7ilJ33A3ky2VPSyccr1c4jZg72mGPXJ1STtMxjzQqbn4QuZAFXyPjkeavYGADQ8x6BaA6PGXv/awICUVhtwJ8fJJAcO02EgUdwZVUloPS63Fg+saQoI6bvJd4yRqtqMBBgcU+relU4zpDyCAmsNVWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gXLxoAhX; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-6099703e530so9049217b3.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Mar 2024 06:05:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710421537; x=1711026337; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=II2UsaIZAzw07RsAVvrS+6gd+EObsid7jBvJIs0WBzw=;
        b=gXLxoAhXqsvS3fzWN/U9aHRYz4lemCrCX+CKcD0Q7RYLy2VBqhmE5LgmumFQ4hBVOO
         K2EaqXgOPD8jhf5n2YtTKoFdYG1/pCG66yNA4vZVq4syEIgAY92WfEoLDWPbv/pOXNTP
         H3vA7uegPZCyl8GbpN6WyPh/0pGhbFjWGf2ZhDrJ/YKYBmIakta2GIlfSk8y8pXg46b6
         ZIUUDSGGiNlpMgN+biy0N9E8KAdb0CBv1gSY0MSvaZJCMn22J0ha/KHzYIwkg8iDakmg
         er5f2Js7oPX0jaTWeas/7lkk7cf0EeN526XMxt74PifdLCB/EEBir507/mFAJ+Drsvvv
         sfkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710421537; x=1711026337;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=II2UsaIZAzw07RsAVvrS+6gd+EObsid7jBvJIs0WBzw=;
        b=CghFbxNKs2UhInoubXG5DEjz5+4TwBwthMwslXSVHQY0DSQw6lGgcOJ5ollv24BKwj
         zLhIj/SFqKlNqXLiods8SkJYXNKn4+HuTzi5S7eT2b3f+Aq8cGgIoxIUWD6htn+mHs3R
         JJnHeK0aQintvcUqhZmI59GgSPLksS11d5n1tFol84j7Xfsqt69eYzEQp0JtM8YBdyvQ
         gaggzy+8v1FD0uzb1twnuL4AiBKpk+eeINnfyP+ceFBCjkhTL9Pz+jFRC5PWTB2GlKqk
         RaZYwcmTPJuTNgsRlD3eLkHxDOOpfT3E7yRNlcW6gNKluYK59YkaXzPRnjaBKigYRebf
         sAaw==
X-Forwarded-Encrypted: i=1; AJvYcCX9zAihoSvryASd4B0p3W1witq0xAUdtqAF6cyVdSUfa2dOC4AU/jTxQHocE5Ww0qmBd806tCaL4yZR2lgrJkjf2MP1UQO/DOwpeugNTA==
X-Gm-Message-State: AOJu0YwjOHQes7bx/KHdbc9HoegeOcninSBAGYqgKj5VbgDoqLGHM/nt
	AwGgrAjwJayIikCiUgd2Qi6t2RFVQSJgK++8hSi/A28tOGHuulKbBQMDqUuJ2rUKSdlpN/yhMEU
	ZSNWCz3p3L1Mdaym77nKjiheV6gCWSLcjyWozqQ==
X-Google-Smtp-Source: AGHT+IFXC5RLGM5+/OQzl0VN7/sYRocbZIrLl+pCS9V1R3inRBR/pXXbajydYegK5aeCFV33pHqokJMy1KmLSL3ltB4=
X-Received: by 2002:a0d:e4c4:0:b0:60c:ced3:8e26 with SMTP id
 n187-20020a0de4c4000000b0060cced38e26mr901393ywe.13.1710421537330; Thu, 14
 Mar 2024 06:05:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240313-videocc-sm8150-dt-node-v1-0-ae8ec3c822c2@quicinc.com>
 <20240313-videocc-sm8150-dt-node-v1-1-ae8ec3c822c2@quicinc.com>
 <CAA8EJpo63oRA07QNCdzJdHW_hJJWK6aj-LCpp-XwmPJYf0twZw@mail.gmail.com> <a09941ff-7b43-a964-1bd1-5321913be1a3@quicinc.com>
In-Reply-To: <a09941ff-7b43-a964-1bd1-5321913be1a3@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 14 Mar 2024 15:05:26 +0200
Message-ID: <CAA8EJpo=ACtqbaPQN--p_28Cf6DLsKMFKh-A0crMZq4hmhPdyA@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: clock: qcom: Update SM8150 videocc bindings
To: "Satya Priya Kakitapalli (Temp)" <quic_skakitap@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Ajit Pandey <quic_ajipan@quicinc.com>, 
	Imran Shaik <quic_imrashai@quicinc.com>, Taniya Das <quic_tdas@quicinc.com>, 
	Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 14 Mar 2024 at 11:19, Satya Priya Kakitapalli (Temp)
<quic_skakitap@quicinc.com> wrote:
>
>
> On 3/14/2024 12:50 AM, Dmitry Baryshkov wrote:
> > On Wed, 13 Mar 2024 at 13:11, Satya Priya Kakitapalli
> > <quic_skakitap@quicinc.com> wrote:
> >> Update the videocc device tree bindings for sm8150 to align with the
> >> latest convention.
> > But why? Bindings already exist. There is nothing wrong with them. And
> > sm8150 platform in general uses name-based lookup.
>
>
> With the new index based lookup introduced we cannot use this bindings,
> hence I moved to the sm8450-videocc bindings.

This is true for _new_ drivers. However you have a driver already. And
the driver has bindings. If you check, existing drivers were updated
from parent_names to fw_name / parent_hw lookups. However none of the
drivers was _updated_ to use index-based lookups.

> >> Fixes: 35d26e9292e2 ("dt-bindings: clock: Add YAML schemas for the QCOM VIDEOCC clock bindings")
> > It is not a fix, there is no bug that this commit is fixing.
>
>
> The clocks list needs to be fixed to add both XO and AHB clocks, and we
> are adding required-opps property.

Oh, so you have mixed two unrelated changes without telling anybody.
Please don't do this.

>
>
> >> Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
> >> ---
> >>   Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml | 1 +
> >>   Documentation/devicetree/bindings/clock/qcom,videocc.yaml        | 3 ---
> >>   2 files changed, 1 insertion(+), 3 deletions(-)
> >>
> >> diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
> >> index bad8f019a8d3..e00fdc8ceaa4 100644
> >> --- a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
> >> +++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
> >> @@ -20,6 +20,7 @@ properties:
> >>       enum:
> >>         - qcom,sm8450-videocc
> >>         - qcom,sm8550-videocc
> >> +      - qcom,sm8150-videocc
> >>
> >>     reg:
> >>       maxItems: 1
> >> diff --git a/Documentation/devicetree/bindings/clock/qcom,videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,videocc.yaml
> >> index 6999e36ace1b..28d134ad9517 100644
> >> --- a/Documentation/devicetree/bindings/clock/qcom,videocc.yaml
> >> +++ b/Documentation/devicetree/bindings/clock/qcom,videocc.yaml
> >> @@ -17,7 +17,6 @@ description: |
> >>       include/dt-bindings/clock/qcom,videocc-sc7180.h
> >>       include/dt-bindings/clock/qcom,videocc-sc7280.h
> >>       include/dt-bindings/clock/qcom,videocc-sdm845.h
> >> -    include/dt-bindings/clock/qcom,videocc-sm8150.h
> >>       include/dt-bindings/clock/qcom,videocc-sm8250.h
> >>
> >>   properties:
> >> @@ -26,7 +25,6 @@ properties:
> >>         - qcom,sc7180-videocc
> >>         - qcom,sc7280-videocc
> >>         - qcom,sdm845-videocc
> >> -      - qcom,sm8150-videocc
> >>         - qcom,sm8250-videocc
> >>
> >>     clocks:
> >> @@ -75,7 +73,6 @@ allOf:
> >>             enum:
> >>               - qcom,sc7180-videocc
> >>               - qcom,sdm845-videocc
> >> -            - qcom,sm8150-videocc
> >>       then:
> >>         properties:
> >>           clocks:
> >>
> >> --
> >> 2.25.1
> >>
> >>
> >



-- 
With best wishes
Dmitry

