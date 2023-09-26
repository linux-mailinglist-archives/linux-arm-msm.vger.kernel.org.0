Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 31BE57AED70
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Sep 2023 14:58:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234710AbjIZM65 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 Sep 2023 08:58:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234036AbjIZM64 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 26 Sep 2023 08:58:56 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73ABFC9;
        Tue, 26 Sep 2023 05:58:49 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8998C433C7;
        Tue, 26 Sep 2023 12:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695733129;
        bh=P5SKgQ9MdPsUVRQrXY42lQfhxPb8Z6wRlFFl4iHTEjk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=RH97QqzQG1Nkqh1HfDpK1xEerLsAeRd9gH8UTV3Jsv4pgxmlm7/fXouN5T7uu1hXC
         Tek0ZZ/DNUS5wIhFXZkI6sHYcDG9iIAtxZVOOJWRqNht5fZIuylbKvYtIGsbGd/tU7
         wFf+qYbJdzQXpoakmsXhJtYK+G0hZ7DSa82wAcGPFEJrm/NdEpqDTA2Lwi18dE/tcg
         XajpPyPLv6/vYO6kis1LiNoH21gv+D1YPod9qpIye01Uk9gANTIQc6xFuI7EDzduKl
         Oo0aVC65OvHhBOGb6mDC8Lw5N0rQvwfsxy8TI/ajP0Yav3b952efGyA6/Xoc9m6yjI
         SMUupXYZpM1xg==
Date:   Tue, 26 Sep 2023 13:58:42 +0100
From:   Conor Dooley <conor@kernel.org>
To:     Rob Herring <robh@kernel.org>
Cc:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Del Regno <angelogioacchino.delregno@somainline.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] dt-bindings: display: msm: Make
 "additionalProperties: true" explicit
Message-ID: <20230926-dugout-movable-0f9fb1218cdb@spud>
References: <20230925212434.1972368-1-robh@kernel.org>
 <20230925212434.1972368-2-robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="1VDORcXQMVvglL3W"
Content-Disposition: inline
In-Reply-To: <20230925212434.1972368-2-robh@kernel.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--1VDORcXQMVvglL3W
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 25, 2023 at 04:24:25PM -0500, Rob Herring wrote:
> Make it explicit that child nodes have additional properties and the
> child node schema is not complete. The complete schemas are applied
> separately based the compatible strings.
>=20
> Signed-off-by: Rob Herring <robh@kernel.org>

I cross-checked only a handful of these...
Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

> ---
>  .../bindings/display/msm/qcom,msm8998-mdss.yaml        |  6 ++++++
>  .../bindings/display/msm/qcom,qcm2290-mdss.yaml        |  6 ++++++
>  .../bindings/display/msm/qcom,sc7180-mdss.yaml         |  8 ++++++++
>  .../bindings/display/msm/qcom,sc7280-mdss.yaml         | 10 ++++++++++
>  .../bindings/display/msm/qcom,sc8280xp-mdss.yaml       |  4 ++++
>  .../bindings/display/msm/qcom,sdm845-mdss.yaml         |  8 ++++++++
>  .../bindings/display/msm/qcom,sm6115-mdss.yaml         |  6 ++++++
>  .../bindings/display/msm/qcom,sm6125-mdss.yaml         |  6 ++++++
>  .../bindings/display/msm/qcom,sm6350-mdss.yaml         |  6 ++++++
>  .../bindings/display/msm/qcom,sm6375-mdss.yaml         |  6 ++++++
>  .../bindings/display/msm/qcom,sm8150-mdss.yaml         |  6 ++++++
>  .../bindings/display/msm/qcom,sm8250-mdss.yaml         |  6 ++++++
>  .../bindings/display/msm/qcom,sm8350-mdss.yaml         |  8 ++++++++
>  .../bindings/display/msm/qcom,sm8450-mdss.yaml         |  8 ++++++++
>  .../bindings/display/msm/qcom,sm8550-mdss.yaml         |  8 ++++++++
>  15 files changed, 102 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,msm8998-m=
dss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,msm8998-mdss.=
yaml
> index e320ab1de6de..2d9edab5a30d 100644
> --- a/Documentation/devicetree/bindings/display/msm/qcom,msm8998-mdss.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/qcom,msm8998-mdss.yaml
> @@ -38,12 +38,16 @@ properties:
>  patternProperties:
>    "^display-controller@[0-9a-f]+$":
>      type: object
> +    additionalProperties: true
> +
>      properties:
>        compatible:
>          const: qcom,msm8998-dpu
> =20
>    "^dsi@[0-9a-f]+$":
>      type: object
> +    additionalProperties: true
> +
>      properties:
>        compatible:
>          items:
> @@ -52,6 +56,8 @@ patternProperties:
> =20
>    "^phy@[0-9a-f]+$":
>      type: object
> +    additionalProperties: true
> +
>      properties:
>        compatible:
>          const: qcom,dsi-phy-10nm-8998
> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-m=
dss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.=
yaml
> index 4184b84d4c21..5ad155612b6c 100644
> --- a/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml
> @@ -44,18 +44,24 @@ properties:
>  patternProperties:
>    "^display-controller@[0-9a-f]+$":
>      type: object
> +    additionalProperties: true
> +
>      properties:
>        compatible:
>          const: qcom,qcm2290-dpu
> =20
>    "^dsi@[0-9a-f]+$":
>      type: object
> +    additionalProperties: true
> +
>      properties:
>        compatible:
>          const: qcom,dsi-ctrl-6g-qcm2290
> =20
>    "^phy@[0-9a-f]+$":
>      type: object
> +    additionalProperties: true
> +
>      properties:
>        compatible:
>          const: qcom,dsi-phy-14nm-2290
> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sc7180-md=
ss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sc7180-mdss.ya=
ml
> index 3b9c103e504a..3432a2407caa 100644
> --- a/Documentation/devicetree/bindings/display/msm/qcom,sc7180-mdss.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/qcom,sc7180-mdss.yaml
> @@ -44,18 +44,24 @@ properties:
>  patternProperties:
>    "^display-controller@[0-9a-f]+$":
>      type: object
> +    additionalProperties: true
> +
>      properties:
>        compatible:
>          const: qcom,sc7180-dpu
> =20
>    "^displayport-controller@[0-9a-f]+$":
>      type: object
> +    additionalProperties: true
> +
>      properties:
>        compatible:
>          const: qcom,sc7180-dp
> =20
>    "^dsi@[0-9a-f]+$":
>      type: object
> +    additionalProperties: true
> +
>      properties:
>        compatible:
>          items:
> @@ -64,6 +70,8 @@ patternProperties:
> =20
>    "^phy@[0-9a-f]+$":
>      type: object
> +    additionalProperties: true
> +
>      properties:
>        compatible:
>          const: qcom,dsi-phy-10nm
> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sc7280-md=
ss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sc7280-mdss.ya=
ml
> index 43500dad66e7..bbb727831fca 100644
> --- a/Documentation/devicetree/bindings/display/msm/qcom,sc7280-mdss.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/qcom,sc7280-mdss.yaml
> @@ -44,18 +44,24 @@ properties:
>  patternProperties:
>    "^display-controller@[0-9a-f]+$":
>      type: object
> +    additionalProperties: true
> +
>      properties:
>        compatible:
>          const: qcom,sc7280-dpu
> =20
>    "^displayport-controller@[0-9a-f]+$":
>      type: object
> +    additionalProperties: true
> +
>      properties:
>        compatible:
>          const: qcom,sc7280-dp
> =20
>    "^dsi@[0-9a-f]+$":
>      type: object
> +    additionalProperties: true
> +
>      properties:
>        compatible:
>          items:
> @@ -64,12 +70,16 @@ patternProperties:
> =20
>    "^edp@[0-9a-f]+$":
>      type: object
> +    additionalProperties: true
> +
>      properties:
>        compatible:
>          const: qcom,sc7280-edp
> =20
>    "^phy@[0-9a-f]+$":
>      type: object
> +    additionalProperties: true
> +
>      properties:
>        compatible:
>          enum:
> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sc8280xp-=
mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sc8280xp-mds=
s.yaml
> index db680fb12b6a..af79406e1604 100644
> --- a/Documentation/devicetree/bindings/display/msm/qcom,sc8280xp-mdss.ya=
ml
> +++ b/Documentation/devicetree/bindings/display/msm/qcom,sc8280xp-mdss.ya=
ml
> @@ -34,12 +34,16 @@ properties:
>  patternProperties:
>    "^display-controller@[0-9a-f]+$":
>      type: object
> +    additionalProperties: true
> +
>      properties:
>        compatible:
>          const: qcom,sc8280xp-dpu
> =20
>    "^displayport-controller@[0-9a-f]+$":
>      type: object
> +    additionalProperties: true
> +
>      properties:
>        compatible:
>          enum:
> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sdm845-md=
ss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sdm845-mdss.ya=
ml
> index d6d7ac1b2ef8..6e8b69e5ec62 100644
> --- a/Documentation/devicetree/bindings/display/msm/qcom,sdm845-mdss.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/qcom,sdm845-mdss.yaml
> @@ -42,18 +42,24 @@ properties:
>  patternProperties:
>    "^display-controller@[0-9a-f]+$":
>      type: object
> +    additionalProperties: true
> +
>      properties:
>        compatible:
>          const: qcom,sdm845-dpu
> =20
>    "^displayport-controller@[0-9a-f]+$":
>      type: object
> +    additionalProperties: true
> +
>      properties:
>        compatible:
>          const: qcom,sdm845-dp
> =20
>    "^dsi@[0-9a-f]+$":
>      type: object
> +    additionalProperties: true
> +
>      properties:
>        compatible:
>          items:
> @@ -62,6 +68,8 @@ patternProperties:
> =20
>    "^phy@[0-9a-f]+$":
>      type: object
> +    additionalProperties: true
> +
>      properties:
>        compatible:
>          const: qcom,dsi-phy-10nm
> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm6115-md=
ss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm6115-mdss.ya=
ml
> index 17221b62a642..dde5c2acead5 100644
> --- a/Documentation/devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml
> @@ -32,12 +32,16 @@ properties:
>  patternProperties:
>    "^display-controller@[0-9a-f]+$":
>      type: object
> +    additionalProperties: true
> +
>      properties:
>        compatible:
>          const: qcom,sm6115-dpu
> =20
>    "^dsi@[0-9a-f]+$":
>      type: object
> +    additionalProperties: true
> +
>      properties:
>        compatible:
>          oneOf:
> @@ -50,6 +54,8 @@ patternProperties:
> =20
>    "^phy@[0-9a-f]+$":
>      type: object
> +    additionalProperties: true
> +
>      properties:
>        compatible:
>          const: qcom,dsi-phy-14nm-2290
> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm6125-md=
ss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm6125-mdss.ya=
ml
> index 57f0e3647711..671c2c2aa896 100644
> --- a/Documentation/devicetree/bindings/display/msm/qcom,sm6125-mdss.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/qcom,sm6125-mdss.yaml
> @@ -43,12 +43,16 @@ properties:
>  patternProperties:
>    "^display-controller@[0-9a-f]+$":
>      type: object
> +    additionalProperties: true
> +
>      properties:
>        compatible:
>          const: qcom,sm6125-dpu
> =20
>    "^dsi@[0-9a-f]+$":
>      type: object
> +    additionalProperties: true
> +
>      properties:
>        compatible:
>          items:
> @@ -57,6 +61,8 @@ patternProperties:
> =20
>    "^phy@[0-9a-f]+$":
>      type: object
> +    additionalProperties: true
> +
>      properties:
>        compatible:
>          const: qcom,sm6125-dsi-phy-14nm
> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm6350-md=
ss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm6350-mdss.ya=
ml
> index db255b1f4c20..e1dcb453762e 100644
> --- a/Documentation/devicetree/bindings/display/msm/qcom,sm6350-mdss.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/qcom,sm6350-mdss.yaml
> @@ -43,12 +43,16 @@ properties:
>  patternProperties:
>    "^display-controller@[0-9a-f]+$":
>      type: object
> +    additionalProperties: true
> +
>      properties:
>        compatible:
>          const: qcom,sm6350-dpu
> =20
>    "^dsi@[0-9a-f]+$":
>      type: object
> +    additionalProperties: true
> +
>      properties:
>        compatible:
>          items:
> @@ -57,6 +61,8 @@ patternProperties:
> =20
>    "^phy@[0-9a-f]+$":
>      type: object
> +    additionalProperties: true
> +
>      properties:
>        compatible:
>          const: qcom,dsi-phy-10nm
> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm6375-md=
ss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm6375-mdss.ya=
ml
> index 30d36fffaedb..b15c3950f09d 100644
> --- a/Documentation/devicetree/bindings/display/msm/qcom,sm6375-mdss.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/qcom,sm6375-mdss.yaml
> @@ -43,12 +43,16 @@ properties:
>  patternProperties:
>    "^display-controller@[0-9a-f]+$":
>      type: object
> +    additionalProperties: true
> +
>      properties:
>        compatible:
>          const: qcom,sm6375-dpu
> =20
>    "^dsi@[0-9a-f]+$":
>      type: object
> +    additionalProperties: true
> +
>      properties:
>        compatible:
>          items:
> @@ -57,6 +61,8 @@ patternProperties:
> =20
>    "^phy@[0-9a-f]+$":
>      type: object
> +    additionalProperties: true
> +
>      properties:
>        compatible:
>          const: qcom,sm6375-dsi-phy-7nm
> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8150-md=
ss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8150-mdss.ya=
ml
> index 54cdaa827cd3..a2a8be7f64a9 100644
> --- a/Documentation/devicetree/bindings/display/msm/qcom,sm8150-mdss.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8150-mdss.yaml
> @@ -47,12 +47,16 @@ properties:
>  patternProperties:
>    "^display-controller@[0-9a-f]+$":
>      type: object
> +    additionalProperties: true
> +
>      properties:
>        compatible:
>          const: qcom,sm8150-dpu
> =20
>    "^dsi@[0-9a-f]+$":
>      type: object
> +    additionalProperties: true
> +
>      properties:
>        compatible:
>          items:
> @@ -61,6 +65,8 @@ patternProperties:
> =20
>    "^phy@[0-9a-f]+$":
>      type: object
> +    additionalProperties: true
> +
>      properties:
>        compatible:
>          const: qcom,dsi-phy-7nm
> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8250-md=
ss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8250-mdss.ya=
ml
> index e887f031b8be..994975909fea 100644
> --- a/Documentation/devicetree/bindings/display/msm/qcom,sm8250-mdss.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8250-mdss.yaml
> @@ -46,12 +46,16 @@ properties:
>  patternProperties:
>    "^display-controller@[0-9a-f]+$":
>      type: object
> +    additionalProperties: true
> +
>      properties:
>        compatible:
>          const: qcom,sm8250-dpu
> =20
>    "^dsi@[0-9a-f]+$":
>      type: object
> +    additionalProperties: true
> +
>      properties:
>        compatible:
>          items:
> @@ -60,6 +64,8 @@ patternProperties:
> =20
>    "^phy@[0-9a-f]+$":
>      type: object
> +    additionalProperties: true
> +
>      properties:
>        compatible:
>          const: qcom,dsi-phy-7nm
> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8350-md=
ss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8350-mdss.ya=
ml
> index 60d4aae1131b..163fc83c1e80 100644
> --- a/Documentation/devicetree/bindings/display/msm/qcom,sm8350-mdss.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8350-mdss.yaml
> @@ -48,18 +48,24 @@ properties:
>  patternProperties:
>    "^display-controller@[0-9a-f]+$":
>      type: object
> +    additionalProperties: true
> +
>      properties:
>        compatible:
>          const: qcom,sm8350-dpu
> =20
>    "^displayport-controller@[0-9a-f]+$":
>      type: object
> +    additionalProperties: true
> +
>      properties:
>        compatible:
>          const: qcom,sm8350-dp
> =20
>    "^dsi@[0-9a-f]+$":
>      type: object
> +    additionalProperties: true
> +
>      properties:
>        compatible:
>          items:
> @@ -68,6 +74,8 @@ patternProperties:
> =20
>    "^phy@[0-9a-f]+$":
>      type: object
> +    additionalProperties: true
> +
>      properties:
>        compatible:
>          const: qcom,sm8350-dsi-phy-5nm
> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8450-md=
ss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8450-mdss.ya=
ml
> index bb22940b9385..001b26e65301 100644
> --- a/Documentation/devicetree/bindings/display/msm/qcom,sm8450-mdss.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8450-mdss.yaml
> @@ -38,12 +38,16 @@ properties:
>  patternProperties:
>    "^display-controller@[0-9a-f]+$":
>      type: object
> +    additionalProperties: true
> +
>      properties:
>        compatible:
>          const: qcom,sm8450-dpu
> =20
>    "^displayport-controller@[0-9a-f]+$":
>      type: object
> +    additionalProperties: true
> +
>      properties:
>        compatible:
>          items:
> @@ -52,6 +56,8 @@ patternProperties:
> =20
>    "^dsi@[0-9a-f]+$":
>      type: object
> +    additionalProperties: true
> +
>      properties:
>        compatible:
>          items:
> @@ -60,6 +66,8 @@ patternProperties:
> =20
>    "^phy@[0-9a-f]+$":
>      type: object
> +    additionalProperties: true
> +
>      properties:
>        compatible:
>          const: qcom,sm8450-dsi-phy-5nm
> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8550-md=
ss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8550-mdss.ya=
ml
> index 48aea8005c86..1ea50a2c7c8e 100644
> --- a/Documentation/devicetree/bindings/display/msm/qcom,sm8550-mdss.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8550-mdss.yaml
> @@ -38,12 +38,16 @@ properties:
>  patternProperties:
>    "^display-controller@[0-9a-f]+$":
>      type: object
> +    additionalProperties: true
> +
>      properties:
>        compatible:
>          const: qcom,sm8550-dpu
> =20
>    "^displayport-controller@[0-9a-f]+$":
>      type: object
> +    additionalProperties: true
> +
>      properties:
>        compatible:
>          items:
> @@ -52,6 +56,8 @@ patternProperties:
> =20
>    "^dsi@[0-9a-f]+$":
>      type: object
> +    additionalProperties: true
> +
>      properties:
>        compatible:
>          items:
> @@ -60,6 +66,8 @@ patternProperties:
> =20
>    "^phy@[0-9a-f]+$":
>      type: object
> +    additionalProperties: true
> +
>      properties:
>        compatible:
>          const: qcom,sm8550-dsi-phy-4nm
> --=20
> 2.40.1
>=20

--1VDORcXQMVvglL3W
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZRLVggAKCRB4tDGHoIJi
0i8QAP47s75JLP12JmyhDt129VKkI7blZ9Rqh7O8Ly6PHo/anAEA1r6W8PoSpW66
STfNcWQfsXqZcqfUn69EOHd6kQT97ws=
=TYGp
-----END PGP SIGNATURE-----

--1VDORcXQMVvglL3W--
