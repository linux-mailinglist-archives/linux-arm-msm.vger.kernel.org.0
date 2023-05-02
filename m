Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D9C966F43B6
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 May 2023 14:23:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234178AbjEBMXa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 May 2023 08:23:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234057AbjEBMX2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 May 2023 08:23:28 -0400
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com [IPv6:2607:f8b0:4864:20::b32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98D9655B2
        for <linux-arm-msm@vger.kernel.org>; Tue,  2 May 2023 05:23:25 -0700 (PDT)
Received: by mail-yb1-xb32.google.com with SMTP id 3f1490d57ef6-b9a6f17f2b6so24517516276.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 May 2023 05:23:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683030204; x=1685622204;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=C9d4XFb7xb8OHKeS57hfPSsM1vaS6gs1EOIjHEvSu+U=;
        b=pdk+LOCbnHtCE3mOZ70HW38W2/zkGMStOeJYjOd3f5bCG4RM4eja3TJmykQ+LwcgjX
         bwXXUezRFTBXTaH9ZAUMZPHaKXgC/gFjbOOq8S5FocUhpec1mmFmIXI0PNf72lo0tvk5
         ZxNai/BAFSS0vmx+cDHyE07xJt2EGzDK65UibW9yJaJwKrVxMmYwRzmZfruwQEd0PgZN
         DqrnNUxbnczKuAnVex2KIm0pVYJQs0MjP6FGopp34ZRflwf8pJRqQcMbosH1J+9Ca0YC
         LJt52bEACoCSVZxw5LXbK5nKB45NwCG8PvpZ0UUtP/Jgkrrc83jNmqabA5pM2HuDw/3t
         pvEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683030204; x=1685622204;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C9d4XFb7xb8OHKeS57hfPSsM1vaS6gs1EOIjHEvSu+U=;
        b=E3HW52EeqxmYtqC2Qys0zbH6ydiPBIEBJv3VPgoJ+y2ouPzcfxYU5VK3JLpi4X/HdF
         x4An4PQATvLeiquTP+YA5eoIpqKNlwFHNR5tBbtZWzT7NCUNj3FoU0/0kl12roTifGYu
         rw7riiAotnrwf/OjeOfH9DjVmASCa+aMEIDG1afivAz2GhgSyvATZFAZS6PN7D77zypl
         cBdlnq4AKDDrY9Q15JNpBHwlyp5AxIgJb/c4lOWi/ioCW5eHeNPMOrm4izWQcym96YEk
         v1R0W4D6mFkJk+mW1J//2ivqvxhklVHGpBPizvFSMP17hLOMobht0bRPFidvwZ8EHeXM
         rRKQ==
X-Gm-Message-State: AC+VfDxfms1l+ZzoH5BKPVRxp3eWzTparcb2w/t3/2ps6Eif6kfbS/nY
        ahA7neuQV6MQ3tTNvpERvHj0qxg11B2jZu6GGV6Ynw==
X-Google-Smtp-Source: ACHHUZ4oPkdNhxDZb/SBbRSl2WZqfg7TLqI/32eUmaj3j9TxrZekC7RtQQ9woWJQKcpALFYENvuc3afd/BaL03v2q3s=
X-Received: by 2002:a81:9809:0:b0:55a:9000:59bf with SMTP id
 p9-20020a819809000000b0055a900059bfmr2554786ywg.22.1683030204676; Tue, 02 May
 2023 05:23:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230501105832.1185477-1-bhupesh.sharma@linaro.org>
 <20230501105832.1185477-4-bhupesh.sharma@linaro.org> <1aaff58a-f07b-1e2a-e27b-df41eacd19e7@linaro.org>
In-Reply-To: <1aaff58a-f07b-1e2a-e27b-df41eacd19e7@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Tue, 2 May 2023 15:23:13 +0300
Message-ID: <CAA8EJpog9cbB_y4zyeECkXRjOGznEATpztAOYsMx61NgyH3Xqg@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: qrb4210-rb2: Enable aDSP and
 cDSP remoteproc nodes
To:     Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        linux-arm-msm@vger.kernel.org, agross@kernel.org,
        andersson@kernel.org, linux-kernel@vger.kernel.org,
        bhupesh.linux@gmail.com, robh+dt@kernel.org,
        krzysztof.kozlowski@linaro.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 2 May 2023 at 14:58, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
>
>
> On 1.05.2023 12:58, Bhupesh Sharma wrote:
> > Enable the aDSP and cDSP remoteproc nodes on Qualcomm QRB4210 RB2 board.
> >
> > Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
> > ---
> >  arch/arm64/boot/dts/qcom/qrb4210-rb2.dts | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
> > index bff6ba1d689f..3ab46499d3fa 100644
> > --- a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
> > +++ b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
> > @@ -34,6 +34,16 @@ &qupv3_id_0 {
> >       status = "okay";
> >  };
> >
> > +&remoteproc_adsp {
> > +     status = "okay";
> > +     firmware-name = "qcom/sm6115/adsp.mdt";
> status last
> also, don't we want to use .mbn (squashed binary)?

Yes, please. Also, just to make sure, are sm6115 and qrb4210 binaries
fully compatible? We already have a mess of sdm845 vs sda845.

>
> Konrad
> > +};
> > +
> > +&remoteproc_cdsp {
> > +     status = "okay";
> > +     firmware-name = "qcom/sm6115/cdsp.mdt";
> > +};
> > +
> >  &rpm_requests {
> >       regulators {
> >               compatible = "qcom,rpm-pm6125-regulators";



-- 
With best wishes
Dmitry
