Return-Path: <linux-arm-msm+bounces-86-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1919F7E3F75
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Nov 2023 14:02:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BF128280C86
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Nov 2023 13:02:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6191E22F00;
	Tue,  7 Nov 2023 13:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="r5Few5gp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F146A12E69
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Nov 2023 13:02:01 +0000 (UTC)
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com [IPv6:2607:f8b0:4864:20::1130])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F5436EBA
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Nov 2023 05:01:59 -0800 (PST)
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-5a7fb84f6ceso61819047b3.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Nov 2023 05:01:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699362118; x=1699966918; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vKVO9Km+ohatrlDcgogUtJ4mNCpxTTFHDSK1wMZmOyc=;
        b=r5Few5gpA76Ifz0dX1zlEQNbsMf92BhqfRDD+0U85UtZhe8OTiUVKxvIVlEXOJfE4i
         y3ayktHHwujW29SkiK8YLXqxM1ZbbhM+f/I7MzIA2afZ3aac/Wq0VWzNkAuVqAeCy/1P
         7h7g6SbKBR4yryNNbg5v/5SofqqZRFlaKOYr0uotIQfY8JPw+8hXdqTVTZIl3dbaQGTx
         PChQBD72Qe+PFPMcyePbGppoTiBTvpkm3kelhZ5fgFEnsSYSmhtkzmjaK9w8v0uSF043
         ICL6zsglBB9ML92k7sOpiJqsqggFo339o8fy6CK/lJfg50HOTIgYTw3hQEHTeyWIh6XN
         cBhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699362118; x=1699966918;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vKVO9Km+ohatrlDcgogUtJ4mNCpxTTFHDSK1wMZmOyc=;
        b=DezPVJTH1g0fohbS3FBntIIdZUtjOpH9e/NZ5tXG0+TXAhUKzSt4yEi9JWY8W2RWje
         n6paXf/74PDWqo7CJ+5o+mKbD6mqannD42eLl2RRIIOnbALfU72MxMzdvAu4WHvDi5NZ
         4B/haFVuhCVRGE5pWd1YGR8ZAoJxPbXIMMSPiaXCNjZRdXu3uVRVUKUk6bir20uuml4/
         F48KoWeKMIZtXXr8mx9D4SFbojMQ4Lja1oTJzbbJi+XfMPfNgv7/QIevpycdS3rzJWh2
         Ut7pbfLO5I5ImhexCgZn+u+5jOd4g2l22Rm5nWlwXE0neR6eyCD6KhnoCw9MFeEoyIvv
         3f7A==
X-Gm-Message-State: AOJu0YxzC1gSchoizUIO1Tew7iKJzy2bAmoTUL6HcI/c7XUY/8zhJ2wH
	yjTiZeTKx5ZkijMpE002G7eCzR+Ls5cdqAMh+07ufA==
X-Google-Smtp-Source: AGHT+IHKQoKSsmRcg/sOieixzdu1e2l7NoB3NK+XgDvDXaMmTUjWJdL0uuTj6OuaO4uthq+8deJFWHoWrBfrpSar5O8=
X-Received: by 2002:a81:5210:0:b0:5a8:181e:8d6c with SMTP id
 g16-20020a815210000000b005a8181e8d6cmr10151699ywb.10.1699362118505; Tue, 07
 Nov 2023 05:01:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231107-refclk_always_on-v2-0-de23962fc4b3@quicinc.com> <20231107-refclk_always_on-v2-1-de23962fc4b3@quicinc.com>
In-Reply-To: <20231107-refclk_always_on-v2-1-de23962fc4b3@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 7 Nov 2023 15:01:47 +0200
Message-ID: <CAA8EJpqvCJsft3Y-m2ZYORBg=6P7EhT-PsCSkuQ4xaxuf3KOwA@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: phy: qcom,qmp: Add PCIe
 qcom,refclk-always-on property
To: Krishna chaitanya chundru <quic_krichai@quicinc.com>
Cc: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	quic_vbadigan@quicinc.com, quic_ramkri@quicinc.com, quic_nitegupt@quicinc.com, 
	quic_skananth@quicinc.com, quic_vpernami@quicinc.com, quic_parass@quicinc.com
Content-Type: text/plain; charset="UTF-8"

On Tue, 7 Nov 2023 at 14:26, Krishna chaitanya chundru
<quic_krichai@quicinc.com> wrote:
>
> Document qcom,refclk-always-on property which is needed in some platforms
> to supply refclk even in PCIe low power states.
>
> Signed-off-by: Krishna chaitanya chundru <quic_krichai@quicinc.com>
> ---
>  .../devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml        | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
> index 2c3d6553a7ba..263291447a5b 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
> @@ -93,6 +93,13 @@ properties:
>    "#phy-cells":
>      const: 0
>
> +  qcom,refclk-always-on:
> +    type: boolean
> +    description: If there is some issues in platform with clkreq signal

nit: there are some

However this still doesn't describe what kind of issues with clkreq
you observe. I mean, clkreq is just a GPIO pin.

> +      propagation to the host and due to that host will not send refclk, which
> +      results in linkdown in L1.2 or L1.1 exit initiated by EP. This property
> +      if set keeps refclk always on even in Low power states (optional).
> +
>  required:
>    - compatible
>    - reg
>
> --
> 2.42.0
>
>


-- 
With best wishes
Dmitry

