Return-Path: <linux-arm-msm+bounces-24475-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 55ED791A8B3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jun 2024 16:09:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9B95BB2402E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jun 2024 14:09:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43282195F04;
	Thu, 27 Jun 2024 14:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hPaid9Tl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13F02195B2A;
	Thu, 27 Jun 2024 14:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719497386; cv=none; b=oG2NwYFjaAA8eK6IN2LBUBKrH8YwzUvxki2i4Ws7hJgYL2M4bZjh6bO57f5H0rN2/MDw7IcvXUVB5AeS8NnYewPY+/z4jSE7T7G/llta334gDTgXPiMTDVRvk0jET6n5vUs5jxSh/tBNR1Gkw5kSD+SuMIEWdvriO/tav4MnhX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719497386; c=relaxed/simple;
	bh=N/OaLsIcQKk+az4MXyzNRYt8fiAoAVDEiwFfGH80yO8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZniWSMEviJqWGvuVAMjypIzC0wgLIz47ZrD+nHsdZdKvWKjAxQN0B5lvabBGtCWDxNiP1lPT07YJZB76rlnzc8+Ot08T9luik3Bv/o59FCq1b7fevORtOJaid1xsKEDmjgssiCSpF/GL5KpgycegAf97p8BeE5KClOYNqJTj9dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hPaid9Tl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EADC7C4AF0E;
	Thu, 27 Jun 2024 14:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719497386;
	bh=N/OaLsIcQKk+az4MXyzNRYt8fiAoAVDEiwFfGH80yO8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=hPaid9TlGTftYeVmINfp/bFuIp3X+H1tAbGWvyAbjuxLQ65YBIUIo9SYiA9CCp6pL
	 ZI/nGkTO+roGRGVdjCJCKuyLrCvp/D9UlwXqQjXfb6bQC9HXaceicwxrbWtjPHwqKi
	 8vj/tR5txBnREaLWhuxnN7H9NqkJ18d4OY/sTU+iJ3ALq0JB4kzR4Z9p+UiJmTJHrh
	 /EEy9290v/MYcKGxw9Xcoya3EC8L08uk45UAliavLu7KQ7vfIsCwej+HZjhHlbNUXh
	 qtKTIiEFYXAL2PRX4lP/0aeloyjHtR2+ZgRzf1s9RdAYxzLD6uVw9BvvBVXRZnXiSA
	 ncpGb2EeAYnxQ==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-52e7145c63cso483804e87.0;
        Thu, 27 Jun 2024 07:09:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWqkYsBQw4tkSQ4DsbV/trcWVLyQx3pCRovV1hRTWntlxu9yMfD5+q6pQCQQfkFUmPPYzhVniEo4kBRs5a1rvHhXawX7AtGd2mVWf/kV1+H8GnMTZ2R0jbVQTvKZ/ZuXa4/UpmTrkeQGdLL2Hizm6guUW0hc0OugTRpa2IpX8yf2I/w4LiQL2M=
X-Gm-Message-State: AOJu0YxfLsmODJ7DIm0CDwHocRrvq7T2QpO7kgRu/4qBB5zspF6AaX88
	U9yDDAcCVI31ZA078CLO33aAPIm7GMgioKfu/duH9MR6HNC0ETNc+37KP7fkRzK9Y9514glyGqY
	tx5uJUIWFlD5xy9uawF9phV5q2g==
X-Google-Smtp-Source: AGHT+IHfkgyQQA4gvyq2HH9PsGgzZGKPkIdmGjgdjtGkoMqcxNoy8z91RZBHjqrqy85lT8uGRsN+wJtK+ZV44Jy73Vo=
X-Received: by 2002:a05:6512:3d24:b0:52b:963d:277c with SMTP id
 2adb3069b0e04-52e703af548mr785682e87.33.1719497384167; Thu, 27 Jun 2024
 07:09:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240614215855.82093-1-danila@jiaxyga.com> <20240614215855.82093-4-danila@jiaxyga.com>
In-Reply-To: <20240614215855.82093-4-danila@jiaxyga.com>
From: Rob Herring <robh@kernel.org>
Date: Thu, 27 Jun 2024 08:09:31 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+vL2fBJBBj13A=qgTQX1rj7tK=ybn+7tXBdpobpRoi6Q@mail.gmail.com>
Message-ID: <CAL_Jsq+vL2fBJBBj13A=qgTQX1rj7tK=ybn+7tXBdpobpRoi6Q@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] dt-bindings: display/msm: Add SM7150 MDSS
To: Danila Tikhonov <danila@jiaxyga.com>
Cc: robdclark@gmail.com, quic_abhinavk@quicinc.com, 
	dmitry.baryshkov@linaro.org, sean@poorly.run, marijn.suijten@somainline.org, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
	airlied@gmail.com, daniel@ffwll.ch, krzk+dt@kernel.org, conor+dt@kernel.org, 
	quic_rmccann@quicinc.com, konrad.dybcio@linaro.org, neil.armstrong@linaro.org, 
	jonathan@marek.ca, swboyd@chromium.org, quic_khsieh@quicinc.com, 
	quic_jesszhan@quicinc.com, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 14, 2024 at 3:59=E2=80=AFPM Danila Tikhonov <danila@jiaxyga.com=
> wrote:
>
> Document the MDSS hardware found on the Qualcomm SM7150 platform.
>
> Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../display/msm/qcom,sm7150-mdss.yaml         | 458 ++++++++++++++++++
>  1 file changed, 458 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sm=
7150-mdss.yaml
>
> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm7150-md=
ss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm7150-mdss.ya=
ml
> new file mode 100644
> index 0000000000000..13c5d5ffabde9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/msm/qcom,sm7150-mdss.yaml
> @@ -0,0 +1,458 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/msm/qcom,sm7150-mdss.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm SM7150 Display MDSS
> +
> +maintainers:
> +  - Danila Tikhonov <danila@jiaxyga.com>
> +
> +description:
> +  SM7150 MSM Mobile Display Subsystem(MDSS), which encapsulates sub-bloc=
ks like
> +  DPU display controller, DSI and DP interfaces etc.
> +
> +$ref: /schemas/display/msm/mdss-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: qcom,sm7150-mdss
> +
> +  clocks:
> +    items:
> +      - description: Display ahb clock from gcc
> +      - description: Display hf axi clock
> +      - description: Display sf axi clock
> +      - description: Display core clock
> +
> +  clock-names:
> +    items:
> +      - const: iface
> +      - const: bus
> +      - const: nrt_bus
> +      - const: core
> +
> +  iommus:
> +    maxItems: 1
> +
> +  interconnects:
> +    items:
> +      - description: Interconnect path from mdp0 port to the data bus
> +      - description: Interconnect path from mdp1 port to the data bus
> +      - description: Interconnect path from CPU to the reg bus
> +
> +  interconnect-names:
> +    items:
> +      - const: mdp0-mem
> +      - const: mdp1-mem
> +      - const: cpu-cfg
> +
> +patternProperties:
> +  "^display-controller@[0-9a-f]+$":
> +    type: object
> +    additionalProperties: true
> +    properties:
> +      compatible:
> +        const: qcom,sm7150-dpu
> +
> +  "^displayport-controller@[0-9a-f]+$":
> +    type: object
> +    additionalProperties: true
> +    properties:
> +      compatible:
> +        const: qcom,sm7150-dp
> +
> +  "^dsi@[0-9a-f]+$":
> +    type: object
> +    additionalProperties: true
> +    properties:
> +      compatible:
> +        items:
> +          - const: qcom,sm7150-dsi-ctrl
> +          - const: qcom,mdss-dsi-ctrl

You've added this compatible, but haven't updated the corresponding
schema. With a recent change to dtschema fixing a regression, we get
warnings about it:

/builds/robherring/linux-dt/Documentation/devicetree/bindings/display/msm/q=
com,sm7150-mdss.example.dtb:
dsi@ae94000: compatible: 'oneOf' conditional failed, one must be
fixed:
        ['qcom,sm7150-dsi-ctrl', 'qcom,mdss-dsi-ctrl'] is too long
        'qcom,sm7150-dsi-ctrl' is not one of ['qcom,apq8064-dsi-ctrl',
'qcom,msm8226-dsi-ctrl', 'qcom,msm8916-dsi-ctrl',
'qcom,msm8953-dsi-ctrl', 'qcom,msm8974-dsi-ctrl',
'qcom,msm8976-dsi-ctrl', 'qcom,msm8996-dsi-ctrl',
'qcom,msm8998-dsi-ctrl', 'qcom,qcm2290-dsi-ctrl',
'qcom,sc7180-dsi-ctrl', 'qcom,sc7280-dsi-ctrl',
'qcom,sdm660-dsi-ctrl', 'qcom,sdm670-dsi-ctrl',
'qcom,sdm845-dsi-ctrl', 'qcom,sm6115-dsi-ctrl',
'qcom,sm6125-dsi-ctrl', 'qcom,sm6350-dsi-ctrl',
'qcom,sm6375-dsi-ctrl', 'qcom,sm8150-dsi-ctrl',
'qcom,sm8250-dsi-ctrl', 'qcom,sm8350-dsi-ctrl',
'qcom,sm8450-dsi-ctrl', 'qcom,sm8550-dsi-ctrl',
'qcom,sm8650-dsi-ctrl']
        'qcom,sm7150-dsi-ctrl' is not one of
['qcom,dsi-ctrl-6g-qcm2290', 'qcom,mdss-dsi-ctrl']
        from schema $id:
http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
/builds/robherring/linux-dt/Documentation/devicetree/bindings/display/msm/q=
com,sm7150-mdss.example.dtb:
dsi@ae94000: Unevaluated properties are not allowed ('compatible' was
unexpected)
        from schema $id:
http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#


Either you need to drop this node from here (and the example) or
update the DSI schema.

Rob

