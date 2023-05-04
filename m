Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4ABCA6F70AA
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 May 2023 19:16:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229972AbjEDRQd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 May 2023 13:16:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229472AbjEDRQc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 May 2023 13:16:32 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C63D226B8
        for <linux-arm-msm@vger.kernel.org>; Thu,  4 May 2023 10:16:31 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-3f315735514so72085575e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 May 2023 10:16:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683220590; x=1685812590;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=o2RAHhaxyXIg8vqIKXQz3LeM9SzAwuVSXKa9rGCQUhg=;
        b=FC9Sq09wan3CTtRshB35e+apWwzPyXyqLx1Z6Jmy43MuTwNCij7HmCtL8JTQCBAwG8
         YeSvP5AlsHY214taapVE+bareqY1qcxH/Pb23AcyrY09fqN8l6Q2SEFaQPCioxw4lUU5
         YtzMr6WM7Q+sjzl+7s2OXw5tfnpUPvChxQvA09AqUpocyIb4yGP4LQCzagwMsL72QpCZ
         z5jw8hqZLeWLC5iQJt0lrFz70+T1fe8RfrFa5BEtbaWpfk+5zgX5zwFSyygaVuzf9FbR
         ofoM/dZdv3PLq/xuLgleAwHmEN8HYGhGL4GcNyn05DUtxl8GNGI2bvADKQGEm7IFNJCk
         M/Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683220590; x=1685812590;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o2RAHhaxyXIg8vqIKXQz3LeM9SzAwuVSXKa9rGCQUhg=;
        b=ZruLGBBR/r/rn+mloLAj8Q8O+T0UcvL+QrhK8/2mTGbHMsURwtq4uphKaAfZW1YMOM
         QFm8OVyHC7LQTSZkzi7ynC9Kq39GvzJbDAWa+8HACWId+d3sORHT1NgwE/V9RjuXzcrH
         VLWCREiHJdNl6/V2VCsUp2R/m20Y3kSqsa28gGFRoU4KHjdFiG0vi9B7hRibewRFeEUM
         0x6ey2dFE3UwPyEveVLqCHuwjZE+SOj0tfNNUpIvcvytUzf9JkKQA7zoUCikDK9yq7bS
         3Vb6hASFyjKchcgdT9x9wg2qVfK0WxhRBlKIvBvXc66tvvzySlw5TMp7/At+WDLE+FO3
         oOzw==
X-Gm-Message-State: AC+VfDz/s8elvDjT2HQMuXtlOTpgiRVOuB6gdGCgD9l9pFc1UPiTr+IW
        4jZx3Fs2JwskMaxC2QznOhr2iejcRSaShApJmbv3Ig==
X-Google-Smtp-Source: ACHHUZ7hZ50T/Pwr9w/GflPdscw+9rCulRDegeWiCCmJWCsRX4pJH5oZJaDR9tMlZJxoYuZb6tWW84RIZsYCa7hjlgE=
X-Received: by 2002:adf:f4cf:0:b0:307:5091:5b96 with SMTP id
 h15-20020adff4cf000000b0030750915b96mr1426097wrp.22.1683220590241; Thu, 04
 May 2023 10:16:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230501105832.1185477-1-bhupesh.sharma@linaro.org>
 <20230501105832.1185477-4-bhupesh.sharma@linaro.org> <1aaff58a-f07b-1e2a-e27b-df41eacd19e7@linaro.org>
 <CAA8EJpog9cbB_y4zyeECkXRjOGznEATpztAOYsMx61NgyH3Xqg@mail.gmail.com>
In-Reply-To: <CAA8EJpog9cbB_y4zyeECkXRjOGznEATpztAOYsMx61NgyH3Xqg@mail.gmail.com>
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
Date:   Thu, 4 May 2023 22:46:19 +0530
Message-ID: <CAH=2NtwVtLdE5hg8Qhd_MLCPJTqXvus8+qW_uj4O7hnOy7PVUA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: qrb4210-rb2: Enable aDSP and
 cDSP remoteproc nodes
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, agross@kernel.org,
        andersson@kernel.org, linux-kernel@vger.kernel.org,
        bhupesh.linux@gmail.com, robh+dt@kernel.org,
        krzysztof.kozlowski@linaro.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 2 May 2023 at 17:53, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Tue, 2 May 2023 at 14:58, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
> >
> > On 1.05.2023 12:58, Bhupesh Sharma wrote:
> > > Enable the aDSP and cDSP remoteproc nodes on Qualcomm QRB4210 RB2 board.
> > >
> > > Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
> > > ---
> > >  arch/arm64/boot/dts/qcom/qrb4210-rb2.dts | 10 ++++++++++
> > >  1 file changed, 10 insertions(+)
> > >
> > > diff --git a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
> > > index bff6ba1d689f..3ab46499d3fa 100644
> > > --- a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
> > > +++ b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
> > > @@ -34,6 +34,16 @@ &qupv3_id_0 {
> > >       status = "okay";
> > >  };
> > >
> > > +&remoteproc_adsp {
> > > +     status = "okay";
> > > +     firmware-name = "qcom/sm6115/adsp.mdt";
> > status last
> > also, don't we want to use .mbn (squashed binary)?
>
> Yes, please. Also, just to make sure, are sm6115 and qrb4210 binaries
> fully compatible? We already have a mess of sdm845 vs sda845.

That's a fair point. Let's use qrb4210 naming instead of sm6115 here.
I will send a fixed version shortly.

Thanks,
Bhupesh
