Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0FA496D42F8
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Apr 2023 13:08:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231571AbjDCLIN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Apr 2023 07:08:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231937AbjDCLIM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Apr 2023 07:08:12 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E8EE1FCE
        for <linux-arm-msm@vger.kernel.org>; Mon,  3 Apr 2023 04:08:07 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id t4so23679669wra.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Apr 2023 04:08:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680520085;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Bptug0IUr53yiSheFLOI8G2Iif+jS74EZZFVW0ghq4Y=;
        b=vreEWXlZbzmDkdbQfhaSTbAF0zBCQML/+uh0/XT61CID87nHXYxLi2ptmfsWCR7FZS
         rd+JBdYxMW4T1r4QbUMScNhtx09lwBNSecJlAIr7j8sZOkodTCCRv4NJpv78+eoMDyJo
         LleEmISnMK5nUIbsrLrudbyB+Ai4e5sO/70RXb5RiEhfeD997/YARfoTge/hXktX6sNS
         bs7Iq8IVtp4DrRq8Xd5HvvELojLB+4y8IDSuhxW9T3gbrjdLf+6Jg7/bUJ4tk88bM6JA
         LcBMnByuGe+3t9LxG+4fuK0E9ipAglBRPcPRiUGuJAVcmovEUl4jA5/JeFvT1zzxAB+y
         ViPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680520085;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bptug0IUr53yiSheFLOI8G2Iif+jS74EZZFVW0ghq4Y=;
        b=uBCvslVr3WP+9mTMvlgPsy2jli227g1l43HaOAsstgS3k0nI4LUpc5xioidxAAQvj+
         Hs0dQZkzQi+1Xqm3O7vcd/pc/q/LBh9vCJzTiKPyZGzeQ8jxpHiikVL+whMJfCzE2apZ
         4Q/cTMYTH05udDyKoKWxEeVjKGMgl6dLGZmfxE9Y07sVbexPR/ME7YZgXA5/bcBDRX+a
         KNuQy4VlhyY7eNfdk7HzRrxSuRFZz8hBbHhacbs1x67ModX4701eypBZS+CZQnSWVWrO
         6GHFOGPuMX1ZmXcSfGz4+D+rU8SVpO1I04O0Iv1or5tV1aQ2VmpthuNqYZlNroStrcrg
         uOdg==
X-Gm-Message-State: AAQBX9cb1ASf23D6PHDtqJd6CZaUT157uMX5QP3DqQ6lK3g8jpMIhf1b
        EEhhhW8vq/je44M/pwnBF1DLtoJGbPreSnxer6sg8w==
X-Google-Smtp-Source: AKy350a35YO64iiFVjm8L45Px3SvEHZQujkKj79U+2xxdb5LSQringWJf/gKcgWkxVo+4wghHg8fc88lKlahPBMtNCg=
X-Received: by 2002:adf:fccb:0:b0:2ce:a8d6:570f with SMTP id
 f11-20020adffccb000000b002cea8d6570fmr7454599wrs.4.1680520085453; Mon, 03 Apr
 2023 04:08:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230402100509.1154220-1-bhupesh.sharma@linaro.org>
 <20230402100509.1154220-6-bhupesh.sharma@linaro.org> <21eaeea4-4f2e-5ce5-c75b-d74ded8e6e4c@linaro.org>
 <CAH=2NtzKGxzmCq2JTajxWoeRFR+mPnFY3YF5mn0tGt30T7SJoQ@mail.gmail.com> <463a9885-741e-a44a-c6c2-7cf5b0560d2d@linaro.org>
In-Reply-To: <463a9885-741e-a44a-c6c2-7cf5b0560d2d@linaro.org>
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
Date:   Mon, 3 Apr 2023 16:37:54 +0530
Message-ID: <CAH=2NtxgxrybNDm7HOBtMjcMk6WM5dMko2GWo8H8Z6F1HgKLrQ@mail.gmail.com>
Subject: Re: [PATCH v5 05/11] dt-bindings: qcom-qce: Fix compatible
 combinations for SM8150 and IPQ4019 SoCs
To:     Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        agross@kernel.org, linux-kernel@vger.kernel.org,
        linux-crypto@vger.kernel.org, andersson@kernel.org,
        bhupesh.linux@gmail.com, krzysztof.kozlowski@linaro.org,
        robh+dt@kernel.org, rfoss@kernel.org, neil.armstrong@linaro.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 3 Apr 2023 at 16:18, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
>
>
> On 3.04.2023 08:15, Bhupesh Sharma wrote:
> > On Mon, 3 Apr 2023 at 11:06, Vladimir Zapolskiy
> > <vladimir.zapolskiy@linaro.org> wrote:
> >>
> >> On 4/2/23 13:05, Bhupesh Sharma wrote:
> >>> Currently the compatible list available in 'qce' dt-bindings does not
> >>> support SM8150 and IPQ4019 SoCs directly which may lead to potential
> >>> 'dtbs_check' error(s).
> >>>
> >>> Fix the same.
> >>>
> >>> Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
> >>> ---
> >>>   Documentation/devicetree/bindings/crypto/qcom-qce.yaml | 6 ++++++
> >>>   1 file changed, 6 insertions(+)
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/crypto/qcom-qce.yaml b/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
> >>> index e375bd981300..90ddf98a6df9 100644
> >>> --- a/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
> >>> +++ b/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
> >>> @@ -24,6 +24,12 @@ properties:
> >>>           deprecated: true
> >>>           description: Kept only for ABI backward compatibility
> >>>
> >>> +      - items:
> >>> +          - enum:
> >>> +              - qcom,ipq4019-qce
> >>> +              - qcom,sm8150-qce
> >>> +          - const: qcom,qce
> >>> +
> >>>         - items:
> >>>             - enum:
> >>>                 - qcom,ipq6018-qce
> >>
> >> Two commit tags given for v2 are missing.
> >
> > Cannot get your comment. Please be more descriptive.

> https://lore.kernel.org/linux-arm-msm/333081a2-6b31-3fca-1a95-4273b5a46fb7@linaro.org/

I think Krzysztof mentioned (here:
https://lore.kernel.org/linux-arm-msm/d5821429-032d-e1e6-3a4e-ca19eb4a60ed@linaro.org/)
and I also agree that there is no need to split the enum into const.

Also, I will add the 'Fixes: 00f3bc2db351 ("dt-bindings: qcom-qce: Add
new SoC compatible strings for Qualcomm QCE IP")' tag in the next
version (waiting for more comments before spinning a new version).

Regards,
Bhupesh
