Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B8A5A5F5A55
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Oct 2022 21:05:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230454AbiJETFG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 Oct 2022 15:05:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230426AbiJETFF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 Oct 2022 15:05:05 -0400
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com [IPv6:2607:f8b0:4864:20::b2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C489DB1D1
        for <linux-arm-msm@vger.kernel.org>; Wed,  5 Oct 2022 12:05:03 -0700 (PDT)
Received: by mail-yb1-xb2b.google.com with SMTP id j7so21416888ybb.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Oct 2022 12:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=2cJirH90HW7xVCysl0fto1HgX5uh1AW5BZAitKF9mvk=;
        b=AVtlJeP1pvxBh/ZFwpxCpZ05pLHmDwnwthLnHgoGADKQozH+n2jfOUfw4GinGuY+yR
         dQS2mG/UBsto1AWgjRY7Nfpj6fh66iRnsCmtUM6nnpYr9JTkdzTsHDkkwq2Yrf+Sqoal
         9G0ATAFTP0ia3enyvnVnndt1MaLHbEZ0w+4hwwPOz1ixuxatt1m8OynVxrxKhpnymC9o
         kHwCoq4afhhs7MpnIHyUT9q1fpaLWLRHgB2l3CnfmDopfN3964kPNipbKvrcU0e9Mv+i
         Tn7iZLE1vNVDSv5VSwi1UUvhGhniRx73HBL/bSJFCXyCHPE3RjnyTKaJdWR73shqiVo3
         aXIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=2cJirH90HW7xVCysl0fto1HgX5uh1AW5BZAitKF9mvk=;
        b=joW3FumLSSOYWBa7neW56DGaoDfLUKyEawsNy9V3rmhA7VvWbn21QaLbyf0iqQqVIa
         u0S9yQZ3NWH4pcGlo17NKMIm1mbgAK8pw7KmL/rIvTYSUZnJHImawdGjq4F/GnbKejix
         7fz7PaocEWqEaChuBmaEHgBc2k4ZQtLpiFCwoXALeEkjllMtFlIsjn2jBnVsO+LbWDRY
         OKw6DaYUrtOHfoOSCt4jJ7CyQVyDGBUqZUi7ogVP8J90y33w3kamgAfNodKNj2IHtG7J
         sxSU9qup81Ncg+8eGLn/gxMIHYXThh5u2fO0fTNBgKx37Se+vlYXLjRFlv4aUUy0aSNB
         bX/g==
X-Gm-Message-State: ACrzQf0vfctJ66xUy0U2sqRFw5Smw3aNZEWGLV1jXCM+zIU1wXJkXlEL
        1tKA1LrOA98ZMtl0XrgQx0k0X8Z9Ti1cP95xTYl9GQ==
X-Google-Smtp-Source: AMsMyM7Ryt6r8FGgpTov5nWzlPI52smWYCBkNF2hYk+i7FdQkz8uKfgOMr/HZ/4NTZsTwXir7+Nr5UMDJhvEUSW0EAA=
X-Received: by 2002:a05:6902:102e:b0:6bd:bdd2:ac32 with SMTP id
 x14-20020a056902102e00b006bdbdd2ac32mr1369818ybt.516.1664996702969; Wed, 05
 Oct 2022 12:05:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220930231416.925132-1-dmitry.baryshkov@linaro.org>
 <a743d50f-fc59-161e-c98f-f10b26e2afe5@linaro.org> <CAA8EJpo9kSs_h28SneAwQ0FLHJ0PipmbQRm791hb-vHtGwXwDQ@mail.gmail.com>
 <4bc9033c-624e-bafb-a6f7-3915a1b27664@gmail.com>
In-Reply-To: <4bc9033c-624e-bafb-a6f7-3915a1b27664@gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Wed, 5 Oct 2022 22:04:51 +0300
Message-ID: <CAA8EJppRRSqLfpq1HMkubB4EErtWpOVJ7Zikwtuqjz2NXMsr8g@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: soc: qcom: qcom,spm: support regulator SAW2 devics
To:     Robert Marko <robimarko@gmail.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Christian Marangi <ansuelsmth@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 5 Oct 2022 at 16:50, Robert Marko <robimarko@gmail.com> wrote:
>
>
> On 02. 10. 2022. 14:20, Dmitry Baryshkov wrote:
> > On Sun, 2 Oct 2022 at 11:49, Krzysztof Kozlowski
> > <krzysztof.kozlowski@linaro.org> wrote:
> >> On 01/10/2022 01:14, Dmitry Baryshkov wrote:
> >>> Merge qcom,saw2.txt bindings to existing qcom,spm.yaml. This fixes
> >>> compatibility of qcom,spm schema with regulator SAW2 devices.
> >>>
> >>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>> ---
> >>>   .../devicetree/bindings/arm/msm/qcom,saw2.txt | 58 -------------------
> >>>   .../bindings/soc/qcom/qcom,spm.yaml           | 44 +++++++++-----
> >> You need to update reference in
> >> Documentation/devicetree/bindings/arm/cpus.yaml
> > ack
> >
> >>>   2 files changed, 30 insertions(+), 72 deletions(-)
> >>>   delete mode 100644 Documentation/devicetree/bindings/arm/msm/qcom,saw2.txt
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/arm/msm/qcom,saw2.txt b/Documentation/devicetree/bindings/arm/msm/qcom,saw2.txt
> >>> deleted file mode 100644
> >>> index c0e3c3a42bea..000000000000
> >>> --- a/Documentation/devicetree/bindings/arm/msm/qcom,saw2.txt
> > [skipped]
> >
> >>> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,spm.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,spm.yaml
> >>> index f433e6e0a19f..8fe35fde70b8 100644
> >>> --- a/Documentation/devicetree/bindings/soc/qcom/qcom,spm.yaml
> >>> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,spm.yaml
> >>> @@ -16,23 +16,33 @@ description: |
> >>>
> >>>   properties:
> >>>     compatible:
> >>> -    items:
> >>> -      - enum:
> >>> -          - qcom,sdm660-gold-saw2-v4.1-l2
> >>> -          - qcom,sdm660-silver-saw2-v4.1-l2
> >>> -          - qcom,msm8998-gold-saw2-v4.1-l2
> >>> -          - qcom,msm8998-silver-saw2-v4.1-l2
> >>> -          - qcom,msm8909-saw2-v3.0-cpu
> >>> -          - qcom,msm8916-saw2-v3.0-cpu
> >>> -          - qcom,msm8226-saw2-v2.1-cpu
> >>> -          - qcom,msm8974-saw2-v2.1-cpu
> >>> -          - qcom,apq8084-saw2-v2.1-cpu
> >>> -          - qcom,apq8064-saw2-v1.1-cpu
> >>> +    oneOf:
> >>>         - const: qcom,saw2
> >> I understand old bindings had it, but I don't think we really want to
> >> support the generic compatible on its own. Even old bindings indicated
> >> that there are several differences between SAWs.
> >>
> >> Especially confusing is that once qcom,saw2 can be alone and in other
> >> cases must be preceded by specific compatible. IOW, you allow for
> >> apq8064 two cases:
> >>
> >> 1. qcom,apq8064-saw2-v1.1-cpu, qcom,saw2
> >> 2. qcom,saw2
> >>
> >> I think we should instead add everywhere specific compatibles.
> > I see your point. Yes, it's probably worth doing that.
> >
> > Robert, Christian, can you possibly check the version of the SAW2 used
> > on ipq4019 and ipq8064? It can be read from the SPM block at the
> > register offset 0xfd0.
>
> Hi, I completely missed this so far, sorry about that.

No problem.

>
> I checked from U-boot on multiple SAW blocks on IPQ4019 and it looks to
> be v3.0:
> (IPQ40xx) # md.l 0xB0B9FD0 1
> 0b0b9fd0: 30000000    ...0
> (IPQ40xx) # md.l 0xB089FD0 1
> 0b089fd0: 30000000    ...0
> (IPQ40xx) # md.l 0xB099FD0 1
> 0b099fd0: 30000000    ...0
> (IPQ40xx) # md.l 0xB0A9FD0 1
> 0b0a9fd0: 30000000    ...0

Thanks, this looks like v2.3.

>
> IPQ8064 is a bit weird, both SAW-s from DTS show all zeros:
> (IPQ) # md.l 0x2089FD0 1
> 02089fd0: 00000000    ....
> (IPQ) # md.l 0x2099FD0 1
> 02099fd0: 00000000    ....

Hmm, I guess then it didn't have this register. As the rest of
kpss/acc follows apc8064 design, I'd assume that SAW2 also follows
apq8064 with the version 1.1

>
> However some old datasheet says: 0x02011FD0 APCS_VERSION
>
> (IPQ) # md.l 0x02011FD0 1
> 02011fd0: 10010000    ....

This is a part of l2cc, rather than SAW.

>
> But It also says that minor and step are both bits 15:0 which makes no
> sense.
>


-- 
With best wishes
Dmitry
