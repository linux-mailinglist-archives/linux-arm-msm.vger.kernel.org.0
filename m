Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 89C9D6D1649
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Mar 2023 06:17:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229567AbjCaERv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 31 Mar 2023 00:17:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229448AbjCaERu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 31 Mar 2023 00:17:50 -0400
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com [IPv6:2607:f8b0:4864:20::b31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF89311EBA
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Mar 2023 21:17:49 -0700 (PDT)
Received: by mail-yb1-xb31.google.com with SMTP id k17so26056503ybm.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Mar 2023 21:17:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680236269;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/Awmt2R8QdeQ6LlMv7k0ieRniqF2o3/eCQObkBo9Ae0=;
        b=DgsBRKwRYkHurWnkEnW4FMOIiDteXU3//J00uOtHMGYtxOQ2mEeXTwvyRSdXmd52a5
         RlUkroYu+9xpTTSShpOpsmw8u6g35P7aVGkJJtcOZF8WiB2aJ6Cy8+oaisCJlSq0WExz
         8gOUIDWP4R8LP+Rj7wC9MDSPT2g1+I8B3rGjhek0MuFUKfnHkFk478+TYYPUzYoB9Tdo
         GtOybAFSpl2I87sqll9UuIGrVxLW82/jbBPJDREQINpiQb820OSTflAV21NLy+ATiDkm
         GVRtgrPZv0VACJii12D139PRjQxj4lCfEC3rEzawuTxDZLct635RX2i/gtdOt1Sz8Mfr
         03lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680236269;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/Awmt2R8QdeQ6LlMv7k0ieRniqF2o3/eCQObkBo9Ae0=;
        b=aq7oijN2iGw43p1yk9wh02SNleEdT5jKW0r6U2DM+aMdxwGuYDC3esJE0EnPmHHHMa
         R8GXTxQxIHHS6oTTjhYBOtYjNg++zoNJgVz82lccj2JbM+M30s/uF7i7ct4oaMM0zsvz
         eqA4TwJNgAtirnRpGEqBPfhbOJlFQVbIfBexS2IEODaWPs6DJwnDO5ZkaO+6aL4mosMd
         nHBt6L+Z/MgClkZd7YoSuoehyefMCBTxnb1pNLmnFDZf5GOy12yUzro2k0GEC8LLK+q5
         Vncp/hEgUBoPKZpRfSuCFUw5X0S9MAguCnzJJgAdwMbAijH8fwdKUad/+ulUeo10LAUR
         y8NQ==
X-Gm-Message-State: AAQBX9eA90M8LLIqLOLjnpxGEsx8MXUSa0ZMFZgLs++6457EkCAsS2Ek
        PONNioqaDyd0voyfPhqrpc2olfP5zT0y5mezug6Q9A==
X-Google-Smtp-Source: AKy350bmqNhiibMax6oW4ot4bQpSBl90+Lz8uv/LuZqI9MkWL/BzSv4Pr01iXwUlCpe7TWk8nmmsCVQafhV1ASTSY6o=
X-Received: by 2002:a05:6902:102b:b0:b46:4a5e:3651 with SMTP id
 x11-20020a056902102b00b00b464a5e3651mr16787785ybt.9.1680236268945; Thu, 30
 Mar 2023 21:17:48 -0700 (PDT)
MIME-Version: 1.0
References: <20230330165117.26348-1-quic_gokukris@quicinc.com> <8685b710-b74d-556a-815d-0ffef2b0eeff@linaro.org>
In-Reply-To: <8685b710-b74d-556a-815d-0ffef2b0eeff@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Fri, 31 Mar 2023 07:17:38 +0300
Message-ID: <CAA8EJpqAzaGa9quhgQYSNEPtrC7bwxpXBmbuk4F85RsMSjTm+A@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] dt-bindings: firmware: qcom: scm: Updating VMID list
To:     Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     Gokul krishna Krishnakumar <quic_gokukris@quicinc.com>,
        linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Trilok Soni <quic_tsoni@quicinc.com>,
        Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Elliot Berman <quic_eberman@quicinc.com>,
        Guru Das Srinagesh <quic_gurus@quicinc.com>,
        Sibi Sankar <quic_sibis@quicinc.com>,
        Melody Olvera <quic_molvera@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 31 Mar 2023 at 01:57, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
>
>
> On 30.03.2023 18:51, Gokul krishna Krishnakumar wrote:
> > Adding the full list of VMID's, which are used by different clients to
> > pass to the secure world.
> >
> > Signed-off-by: Gokul krishna Krishnakumar <quic_gokukris@quicinc.com>
> > ---
> > V2 Fixed allignment issues in [1]
> >
> > [1] https://lore.kernel.org/lkml/20230328214703.12093-1-quic_gokukris@quicinc.com/
> > ---
> They're weirdly ordered now.. I think Dmitry's comment was
> just about the usage of space/tab such that git would not get
> confused. With that fixed, you should be able to get a diff like:
>
> +#define QCOM_SCM_VMID_LPASS            0x16
> #define QCOM_SCM_VMID_WLAN_CE           0x19
> +#define QCOM_SCM_VMID_CP_SPSS_SP       0x1A
> [...]
> +#define QCOM_SCM_VMID_CP_CDSP          0x2A
> #define QCOM_SCM_VMID_NAV               0x2B
> +#define QCOM_SCM_VMID_TVM              0x2D

Yes. Konrad is correct here. Please keep them sorted. I just asked to
keep old lines intact so that we see what was really changed and what
was left intact.

>
> Still, I really appreciate you providing that information to the kernel!
>
> Konrad
>
> >  include/dt-bindings/firmware/qcom,scm.h | 22 ++++++++++++++++++++++
> >  1 file changed, 22 insertions(+)
> >
> > diff --git a/include/dt-bindings/firmware/qcom,scm.h b/include/dt-bindings/firmware/qcom,scm.h
> > index 1a4e68fa0744..7ad6cbe623d3 100644
> > --- a/include/dt-bindings/firmware/qcom,scm.h
> > +++ b/include/dt-bindings/firmware/qcom,scm.h
> > @@ -2,6 +2,7 @@
> >  /*
> >   * Copyright (c) 2010-2015, 2018-2019 The Linux Foundation. All rights reserved.
> >   * Copyright (C) 2015 Linaro Ltd.
> > + * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
> >   */
> >
> >  #ifndef _DT_BINDINGS_FIRMWARE_QCOM_SCM_H
> > @@ -13,4 +14,25 @@
> >  #define QCOM_SCM_VMID_WLAN_CE                0x19
> >  #define QCOM_SCM_VMID_NAV            0x2B
> >
> > +#define QCOM_SCM_VMID_TZ             0x1
> > +#define QCOM_SCM_VMID_CP_TOUCH               0x8
> > +#define QCOM_SCM_VMID_CP_BITSTREAM   0x9
> > +#define QCOM_SCM_VMID_CP_PIXEL               0xA
> > +#define QCOM_SCM_VMID_CP_NON_PIXEL   0xB
> > +#define QCOM_SCM_VMID_CP_CAMERA              0xD
> > +#define QCOM_SCM_VMID_HLOS_FREE              0xE
> > +#define QCOM_SCM_VMID_MSS_NONMSA     0x10
> > +#define QCOM_SCM_VMID_CP_SEC_DISPLAY 0x11
> > +#define QCOM_SCM_VMID_CP_APP         0x12
> > +#define QCOM_SCM_VMID_LPASS          0x16
> > +#define QCOM_SCM_VMID_CP_SPSS_SP     0x1A
> > +#define QCOM_SCM_VMID_CP_CAMERA_PREVIEW      0x1D
> > +#define QCOM_SCM_VMID_CDSP           0x1E
> > +#define QCOM_SCM_VMID_CP_SPSS_SP_SHARED      0x22
> > +#define QCOM_SCM_VMID_CP_SPSS_HLOS_SHARED    0x24
> > +#define QCOM_SCM_VMID_ADSP_HEAP              0x25
> > +#define QCOM_SCM_VMID_CP_CDSP                0x2A
> > +#define QCOM_SCM_VMID_TVM            0x2D
> > +#define QCOM_SCM_VMID_OEMVM          0x31
> > +
> >  #endif



-- 
With best wishes
Dmitry
