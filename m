Return-Path: <linux-arm-msm+bounces-47165-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 340B6A2C9A1
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Feb 2025 18:00:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 526D3188F532
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Feb 2025 17:00:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 652591925BA;
	Fri,  7 Feb 2025 16:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WCiuPhJ/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C7BD1917D0
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Feb 2025 16:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738947554; cv=none; b=bBOhpm3Rc4FGJKMG28+/QDH4Q4yTAuZ3V/tWqXsDKvzOu728tRntvbmVi1Lt65nq8ifZGa6onBrpcnJebh3RhogtwEzWtg2K3d48ESuaWyigDC5BNzFsJcTLxtM8i6344043P3kY5NjzumKYYIWF7or0tK2qUMho+wdOrE1o62w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738947554; c=relaxed/simple;
	bh=XLDucNr2s31cTCQXDfFXJSf3YJUZjOhdeh3BRQjtjfw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WQpplev2QP8sQF7DrgOomVN8B1Z2Bkm/2G/EbSkO5TqqhL30F+5Ln9/1pzZAytIjOxohENvTHtPHHAeKsu2d2XPF8QV1rrZiosNl9DQRas2hEKV/xBlNkb4jyPeHdUp0oad8Y0QuiXayOI9PMfdjmIAXHqLT7kWLqAmAeswgd/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WCiuPhJ/; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-e573136107bso1998935276.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Feb 2025 08:59:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738947551; x=1739552351; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JKMHSngceKWhs09nWrQfjUrr/IL4+HaHfvztvz8mcLo=;
        b=WCiuPhJ/puuFHqitnraI85KcUIyMgOI7pFp+FYAx7zK8vbVB/Hi83s8PFHyebjPGGi
         ty2RMEx+McQZU2sdnCCJKLir6Dw43ViL9tHy+nGcgPrdN7ScbebiguVuh95lVl6GDNU2
         ZT/eiEStBH+xIlR5IKOoisbWKBr8LjUib9nek8EJUswgrgdaMLiwMeYu1Ued8FJxntb9
         BVozhBMXo3iRgdTSmy6dCbE3+sk4YqqWSPzRH2wGvMSEv5aLa4l5b4caZddQDkPuxphs
         v8m6rc9V2crD/l1aQwEsOIUoW6Gk6hO8R2OFtKOaa7hoaSqrLW4KpDK8akFZgqkYAhUt
         L8xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738947551; x=1739552351;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JKMHSngceKWhs09nWrQfjUrr/IL4+HaHfvztvz8mcLo=;
        b=tV7HZHKgTXIsndIv13i8HZyROk9UAczwCH0HmKLXkwo6f6mJ9MHyAez+4c7xSulrN1
         tCqR4D9D31qBncaCuVh5lBN5xGmN8rdZ91l/HZgKuL/URE7GbilEMAEm8mx2co0UxXJd
         RMTs7N+WW5Ek1g9JooVWrJ0xXioy2CO+BjPrtZ0dtUBzoAho7u5IgnbxpiUR9vVd/iM8
         dDZK+pE0pySh2uOD9j82jO/fOz/1q7eAjGygePGTtm5mXLoAAQ/XBJs6vyeUCmOrcTyn
         zEed7BUqPxSu4ipBOqUpdM1GDUalpWaZPAJ4t5NgOvCeAjgwmIxKmjcKev/sHoJdEind
         09UA==
X-Forwarded-Encrypted: i=1; AJvYcCXJarZXlWagFvvix4nXWMqPMybeCC5MWOYNUPQwf8AaJ68CUyWIx9jiQUbpP1LF5+gc1UoWmrpedYNoF5U5@vger.kernel.org
X-Gm-Message-State: AOJu0Ywn16ClLo1vUS4Zi3Cl9VjC3tsBS1n/Ly5EMuFdffM6zFHt4wic
	w/A3vB7vtMKmUT4atgdK3pflfymY8siJ9beHbBRvL47LAeGb/LxUWsoDofez4wjNuN8uO8byd6q
	z7bcy32VWg3jlQeYwdk6FpI8ECs9MlWCGndheqqsKaMqpPr9GHkA=
X-Gm-Gg: ASbGncu435Wv2Pm4haIxZvr6y9lLw9RKvOq3pQyZV8smxLqgmHXNxpgMSFCHbW+2S2X
	Mmi2+4WNDuLVu9rE1zJa+UeoT7/IuaZAROe6nJjC/aesMiVbB3WnRAtOAWkry1N2k4KzuMvcY4A
	==
X-Google-Smtp-Source: AGHT+IFbaQfX0T9itZHt97XrDniKr0h1sCRIXUebFUDmityl/mM6edqe+O7q6s7rU645tsgRdF1l7Tz+EiLmeIjEZ1c=
X-Received: by 2002:a05:690c:7307:b0:6f0:237e:fc67 with SMTP id
 00721157ae682-6f9b29e583dmr35319597b3.23.1738947551532; Fri, 07 Feb 2025
 08:59:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250207-topic-sm8x50-mdss-interconnect-bindings-fix-v2-0-f712b8df6020@linaro.org>
 <20250207-topic-sm8x50-mdss-interconnect-bindings-fix-v2-1-f712b8df6020@linaro.org>
In-Reply-To: <20250207-topic-sm8x50-mdss-interconnect-bindings-fix-v2-1-f712b8df6020@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 7 Feb 2025 18:59:03 +0200
X-Gm-Features: AWEUYZmNMwbk9eX4OjrXiHrM-Aq3WX39qLfKyYBqXNZ9vycYPBQwR8HodH7ba-8
Message-ID: <CAA8EJpq5bLTfsEBPNzJ9z+KV-oXerr1y7g72A5eWbotSk_Nrzg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: display: qcom,sm8550-mdss: only
 document the mdp0-mem interconnect path
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 7 Feb 2025 at 16:02, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>
> The mdp1-mem is not supported on the SM8550 SoCs, so only support a single
> mdp0-mem interconnect entry.

v2 went too fast. Please add cpu-cfg instead.

>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  .../devicetree/bindings/display/msm/qcom,sm8550-mdss.yaml        | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8550-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8550-mdss.yaml
> index 1ea50a2c7c8e9f420125ad30a80b4ebd05c9367a..9631fe11c152449f3dfa0b8f8f53feeba721c950 100644
> --- a/Documentation/devicetree/bindings/display/msm/qcom,sm8550-mdss.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8550-mdss.yaml
> @@ -30,10 +30,10 @@ properties:
>      maxItems: 1
>
>    interconnects:
> -    maxItems: 2
> +    maxItems: 1
>
>    interconnect-names:
> -    maxItems: 2
> +    maxItems: 1
>
>  patternProperties:
>    "^display-controller@[0-9a-f]+$":
> @@ -91,9 +91,8 @@ examples:
>          reg = <0x0ae00000 0x1000>;
>          reg-names = "mdss";
>
> -        interconnects = <&mmss_noc MASTER_MDP 0 &gem_noc SLAVE_LLCC 0>,
> -                        <&mc_virt MASTER_LLCC 0 &mc_virt SLAVE_EBI1 0>;
> -        interconnect-names = "mdp0-mem", "mdp1-mem";
> +        interconnects = <&mmss_noc MASTER_MDP 0 &mc_virt SLAVE_EBI1 0>;
> +        interconnect-names = "mdp0-mem";
>
>          resets = <&dispcc DISP_CC_MDSS_CORE_BCR>;
>
>
> --
> 2.34.1
>


-- 
With best wishes
Dmitry

