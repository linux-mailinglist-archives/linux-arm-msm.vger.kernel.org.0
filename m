Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 542CC6697CB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jan 2023 13:57:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241108AbjAMM5K (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Jan 2023 07:57:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233066AbjAMM4c (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Jan 2023 07:56:32 -0500
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23D17644D
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jan 2023 04:44:37 -0800 (PST)
Received: by mail-ej1-x631.google.com with SMTP id qk9so52074670ejc.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jan 2023 04:44:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8OOC27K7Y2ptjYPzn9J84UKXhXNaGs+2+3QP8eAlxaY=;
        b=pUA1nJpe3s3/r+1jR/HvDxL86lB35wsDaplQQAp76H6FzBPa7EZIWA82FYqfkw/0M9
         CiC6cJVzRtUBbFyQ67LeiKzQDQQJtY/YnoC3tSDieBHH0IPnp1B1wKAKeLJAbEhqVbSF
         nsmqi32z3hjRFtKNGSJiMCaiAHPhrwPySsulklkIJeMTDMbOMfaMK39XkVai/IW6/nDk
         6+xspbv718zPXAdILY7m6G9/SrNBsaUFDlZG30CeqDjHa5i1Sgv2bCJwywd3LmgH/oTU
         VpRanzfBvGKm040l65LUvwwtxjMlnS+Vy9Nr0B7Chdrd1GocUt6R5nVzI3b4g0xY+g6U
         R7aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8OOC27K7Y2ptjYPzn9J84UKXhXNaGs+2+3QP8eAlxaY=;
        b=VVTpdcbuTds6ye5sOvSFNOI94wt1o6I5yUZp9U3uxD9Qrs059qyYQCehCvoLRW4eYo
         FW+rw2Z//+rD8y/RU/ymameRsgWwbqh5549JpqZU7phVI/kCWYSyd4ktxK/kQ+r2/Bim
         KsEwh16lWa5HDO+3g3ynr74paWowicheYzQS22N/RwY5wp+VVvcmiC9CNqFcVMqGF1Jb
         isosVpE/7gioaM8XwvV+mznkCuFVcjSF9FSrPSr8u+WE+1h/W/q4JHYj4ZnJhRZlS9ym
         sYA9/t3pIx1ShaZk4Jz/E81sV2E7VZvmF0jQBwGfU1vGnmByWaorGkKNv4CLQVRGDCVA
         Jahw==
X-Gm-Message-State: AFqh2koAmCt18u2d91a6S8ATzpazKOEFPjrhlLYGjS5P6ix6ZmO7EerB
        yyRRGjlAksD8sOBXHH5kK9aiQA==
X-Google-Smtp-Source: AMrXdXuox8jSaU89IemSpCgGuF+ll4JguwINiL4epNVqWhEbZZEIWdgixPDtTiIYIAQIxUAntpWlUw==
X-Received: by 2002:a17:907:10d0:b0:85e:f910:71b6 with SMTP id rv16-20020a17090710d000b0085ef91071b6mr9134132ejb.51.1673613875663;
        Fri, 13 Jan 2023 04:44:35 -0800 (PST)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id k26-20020a508ada000000b00487fc51c532sm8369038edk.33.2023.01.13.04.44.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jan 2023 04:44:35 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Fri, 13 Jan 2023 13:44:34 +0100
Message-Id: <CPR2LS3SJQ3I.Z7UY505COG3@otso>
Cc:     <linux-arm-msm@vger.kernel.org>,
        <~postmarketos/upstreaming@lists.sr.ht>,
        <phone-devel@vger.kernel.org>, "Andy Gross" <agross@kernel.org>,
        "Bjorn Andersson" <andersson@kernel.org>,
        "Konrad Dybcio" <konrad.dybcio@linaro.org>,
        "Kishon Vijay Abraham I" <kishon@kernel.org>,
        <linux-phy@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 2/3] phy: qcom-qmp-combo: Add config for SM6350
From:   "Luca Weiss" <luca.weiss@fairphone.com>
To:     "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>,
        "Vinod Koul" <vkoul@kernel.org>, "Johan Hovold" <johan@kernel.org>
X-Mailer: aerc 0.14.0
References: <20221130081430.67831-1-luca.weiss@fairphone.com>
 <20221130081430.67831-2-luca.weiss@fairphone.com>
 <Y6xP4YRAp68TfxFi@hovoldconsulting.com> <Y8BIX+js1ircJyb9@matsya>
 <cf968a25-02f7-d402-530b-eb379b707e54@linaro.org>
In-Reply-To: <cf968a25-02f7-d402-530b-eb379b707e54@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Dmitry,

On Thu Jan 12, 2023 at 8:33 PM CET, Dmitry Baryshkov wrote:
> On 12/01/2023 19:50, Vinod Koul wrote:
> > On 28-12-22, 15:17, Johan Hovold wrote:
> >> Luca, Vinod,
> >>
> >> On Wed, Nov 30, 2022 at 09:14:28AM +0100, Luca Weiss wrote:
> >>> Add the tables and config for the combo phy found on SM6350.
> >>>
> >>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> >>> ---
> >>> Changes since v2:
> >>> * Drop dp_txa/dp_txb changes, not required
> >>> * Fix dp_dp_phy offset
> >>>
> >>>   drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 126 +++++++++++++++++++=
+++
> >>>   1 file changed, 126 insertions(+)
> >>>
> >>> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/=
qualcomm/phy-qcom-qmp-combo.c
> >>> index 77052c66cf70..6ac0c68269dc 100644
> >>> --- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> >>> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> >>
> >>> @@ -975,6 +1039,19 @@ static const char * const sc7180_usb3phy_reset_=
l[] =3D {
> >>>   	"phy",
> >>>   };
> >>>  =20
> >>> +static const struct qmp_combo_offsets qmp_combo_offsets_v3 =3D {
> >>> +	.com		=3D 0x0000,
> >>> +	.txa		=3D 0x1200,
> >>> +	.rxa		=3D 0x1400,
> >>> +	.txb		=3D 0x1600,
> >>> +	.rxb		=3D 0x1800,
> >>> +	.usb3_serdes	=3D 0x1000,
> >>> +	.usb3_pcs_misc	=3D 0x1a00,
> >>> +	.usb3_pcs	=3D 0x1c00,
> >>> +	.dp_serdes	=3D 0x1000,
> >>
> >> I would have expected this to be 0x2000 as that's what the older
> >> platforms have been using for the dp serdes table so far. Without acce=
ss
> >> to any documentation it's hard to tell whether everyone's just been
> >> cargo-culting all along or if there's actually something there at offs=
et
> >> 0x2000.
>
> usb3_serdes is 0x1000, so dp_serdes equal to 0x1000 is definitely an typo=
.
>
> Judging from the downstream dtsi, the DP PHY starts at offset 0x2000. So=
=20
> dp_serdes is equal to 0x2000, dp_phy =3D 0x2a00, ln_tx1 =3D 0x2200, ln_tx=
2 =3D=20
> 0x2600.

Can you share how you got to the 0x2000 offset? You can see my
(potentially wrong) reasoning for 0x1000 a few messages ago[0].

The only 0x2000-something I could find now while looking at it again is
"#define USB3_DP_PHY_DP_DP_PHY_PD_CTL 0x2a18" which becomes
USB3_DP_DP_PHY_PD_CTL in the driver but this is seemingly not used at
all in my msm-4.19 tree.

Also if you have any idea on how to test it at runtime without actually
having to get all the type-C functionality up I'd be happy to try that.
Unfortunately I believe there's still quite some bits missing to
actually get DP out via the USB-C port - which I imagine would trigger
the PHY setup.

[0] https://lore.kernel.org/linux-arm-msm/CPDIYQ3SSY3E.I0Y0NMIED0WO@otso/

Regards
Luca

>
> >>
> >> Vinod, could you shed some light on this as presumably you have access
> >> to some documentation?
> >>
> >>> +	.dp_dp_phy	=3D 0x2a00,
> >=20
> > No sorry, I dont have access to this version...
> >=20
>
> --=20
> With best wishes
> Dmitry

