Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2E5A37C9FFF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Oct 2023 08:56:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230257AbjJPG4h (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Oct 2023 02:56:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229523AbjJPG4g (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Oct 2023 02:56:36 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA50B97
        for <linux-arm-msm@vger.kernel.org>; Sun, 15 Oct 2023 23:56:34 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-533d31a8523so6947999a12.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 15 Oct 2023 23:56:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1697439393; x=1698044193; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mIKLA6FpZ/tBtyGW8aEqqSCm4XNwQ5xgOuHWuH9vZ2k=;
        b=dgRfnslNP51vNXEBXGgtzViY1hDiPbXcKH64h7XpGd2FwvdfiieKiXj2Un7gGdAqaS
         vkf+PE4FVGGosfPy5hch0EvkIlg3kyiDxEJGXGcELmoVjLGT1hQECaV3S7l7EqPs7zOm
         WcDN2Sp5JxEOVuNkGPGs6EKj36ZvUwwzl7Bsh1qMMPrNhmakFTa882lmPmFSiRYK340y
         45GsM8AeebGFyl9Jduy876Nsox2zOZvTRAomequZ49LdZxyErIrbbxlndnUlN5h/gAfU
         rZoyD3vRjFlJNJtFFxDyeLMF2BamnuReJ7LskSGhVLkIRx52MuxyUC6EIA6QTUy0NAzh
         5csA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697439393; x=1698044193;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mIKLA6FpZ/tBtyGW8aEqqSCm4XNwQ5xgOuHWuH9vZ2k=;
        b=MmR/bGFfcuLF8NKfvEKIs+qalFWVTLG2VF+DqgDcigJbOMUs8Jff4eBDKCLLyaVNPK
         8+RDv9IA2axJEqKjExk+8xTJ60rtzoNBxtq1FAgQM2atWQyip1YYb6yaq2w0aT7u4f1n
         a7yiV3GxB/MGuJ8uQfmZPkqf1fewCCp2mB+9+RMFkB9qx1Jczym+lD8fjEm01fNEhtiG
         Y9lAK6lO6qPrwyC29ouQ8nCOeg28fybarHL8+UlA/hHqc2E0OPH1l8eezA+Yjp0YM99F
         mEK0/DrYKUDqvcKaBOdQgd5CRu1VTVsyQwi14NIJLkEJ3lqNxIUsfxuP3eVbi/KxP+hm
         IELA==
X-Gm-Message-State: AOJu0YzJVWmw2yBg1PjRMx1D2R03sZogngPxMz0jWP8E/voaspYdrT/x
        /U11xjAU2cjhLYyGzqM0b3K4Xg==
X-Google-Smtp-Source: AGHT+IEso5kuLZbg9p8FT8lVYXeK62hYjaBJ2yzw2VF1TjF8zIDcesabpryDe3mRe4T/YBqRFzY95Q==
X-Received: by 2002:a17:907:3da5:b0:9bd:d961:ddea with SMTP id he37-20020a1709073da500b009bdd961ddeamr6901803ejc.45.1697439393118;
        Sun, 15 Oct 2023 23:56:33 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id e3-20020a1709062c0300b0099bcf1c07c6sm3389234ejh.138.2023.10.15.23.56.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Oct 2023 23:56:32 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Mon, 16 Oct 2023 08:56:31 +0200
Message-Id: <CW9O1NB1NZHP.34BW2ZGP1WV8C@fairphone.com>
Subject: Re: [PATCH] soc: qcom: pmic_glink_altmode: Print error when retimer
 setup fails
From:   "Luca Weiss" <luca.weiss@fairphone.com>
To:     "Bjorn Andersson" <andersson@kernel.org>
Cc:     "Andy Gross" <agross@kernel.org>,
        "Konrad Dybcio" <konrad.dybcio@linaro.org>,
        <~postmarketos/upstreaming@lists.sr.ht>,
        <phone-devel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.15.2
References: <20231013-glink-altmode-ret-v1-1-77941537a35b@fairphone.com>
 <6fw7eho6rapvlghujche4k3pm5mx7a7ojx6yyyreq6dhzjfwlt@ggqoxgirpcnr>
In-Reply-To: <6fw7eho6rapvlghujche4k3pm5mx7a7ojx6yyyreq6dhzjfwlt@ggqoxgirpcnr>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon Oct 16, 2023 at 5:18 AM CEST, Bjorn Andersson wrote:
> On Fri, Oct 13, 2023 at 03:56:40PM +0200, Luca Weiss wrote:
> > It can be useful to know with which return value the retimer_set call
> > failed, so include this info in the dev_err print.
> >=20
>
> Is this useful during development, or during normal execution etc. How
> about using kretprobe or similar tools?

Hi Bjorn,

IIRC I encountered this during development of my retimer driver, where
the op in that driver failed for some reason and it was very useful to
get the return value to debug that.

And sure, I guess kretprobe might be also useful here but I think it's
very common to include the return value in the error message when
something fails, no?

> If you insist, could you please make sure that the style matches across
> the various typec_*_set() calls in the driver?

Do you mean adding the return value to the other dev_err prints after
typec_*_set() calls also?

Regards
Luca

>
> Regards,
> Bjorn
>
> > Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> > ---
> >  drivers/soc/qcom/pmic_glink_altmode.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/soc/qcom/pmic_glink_altmode.c b/drivers/soc/qcom/p=
mic_glink_altmode.c
> > index 9569d999391d..136713e1155e 100644
> > --- a/drivers/soc/qcom/pmic_glink_altmode.c
> > +++ b/drivers/soc/qcom/pmic_glink_altmode.c
> > @@ -168,7 +168,7 @@ static void pmic_glink_altmode_enable_dp(struct pmi=
c_glink_altmode *altmode,
> > =20
> >  	ret =3D typec_retimer_set(port->typec_retimer, &port->retimer_state);
> >  	if (ret)
> > -		dev_err(altmode->dev, "failed to setup retimer to DP\n");
> > +		dev_err(altmode->dev, "failed to setup retimer to DP: %d\n", ret);
> >  }
> > =20
> >  static void pmic_glink_altmode_enable_usb(struct pmic_glink_altmode *a=
ltmode,
> >=20
> > ---
> > base-commit: e3b18f7200f45d66f7141136c25554ac1e82009b
> > change-id: 20231013-glink-altmode-ret-3911e6c1eab5
> >=20
> > Best regards,
> > --=20
> > Luca Weiss <luca.weiss@fairphone.com>
> >=20

