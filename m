Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 81696633669
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Nov 2022 08:55:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232609AbiKVHzh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Nov 2022 02:55:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232419AbiKVHzg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Nov 2022 02:55:36 -0500
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D07BA326EC
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Nov 2022 23:55:33 -0800 (PST)
Received: by mail-ed1-x533.google.com with SMTP id x2so19510925edd.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Nov 2022 23:55:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7VrZzkD1Cr8qqJBfT7GRoGj/Crlh358pGAEmxK6rqjY=;
        b=s+8VCn4820xwQ6YRzOkeml1/cJ9VNCx8dMHCmCyqHZqwkYfdwL9GLdq/RQQlBSX5Dd
         C6OQhf5D8ZhMXDKtQBqvIgm5bw/WLtw//GlfI7TRzN5QHIRwDIHRDoXz7nQgW5hiyfdm
         QVVTxQ7ST2ouMebLDuo+sTVOnWyoVFqQ5Eyab7hX0Zc3xpubLYf2C51rWya/uY/frYO7
         aoxZ27bQWrxsTjE5Xt9AaMxdtH5Al+EWVCw/M5Itc7xoxDQMQRKoSAUe29qrYmkwcOjW
         B4MnwRvMzn1XlM0aDSY50uU0jCAINlpv5FU5OY+UCeZlOaubWjRB2uaRKC8+5lT/zM5c
         Ll1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7VrZzkD1Cr8qqJBfT7GRoGj/Crlh358pGAEmxK6rqjY=;
        b=GzZkAuLyaSJwsBIPPnXonKf++2SXGeNsLuXJ4OYdn77R/MEfCZespMZIoxBdfYLDDZ
         jtrF/JA1R8Iup8CMXxVt47xRRTQIF8ILVSxqL66827NOsRqB7QPizYikc9GZB+93WlnN
         Gb9Wp+H1yVw329td9/G8JqqE3dnvE6K/Iz7FkW8zCT5VurKjTgrRPujrGk8p/cM11OOw
         1eWpHDE02j0ELKF2AqHa1GvHPsytXTvoyypNJIC2+pKXDfkTPr/9UAhCYDCrUNtaIe+N
         91jIM9ip9KHZu0Juo6aymBP5j1DlW1TycDPx5ivqFpKyBjGuimI1Qlo6dp3GbQefC27H
         6nvg==
X-Gm-Message-State: ANoB5plTWua41L5YsMWbuOmNzxe/OiYjO8uYp6KzKlaFLMDcuEU2MCXL
        CVSlRxB0ubgbEoiulDHUfsyNow==
X-Google-Smtp-Source: AA0mqf67m24Zi4PkGBuuRliY4SRbPsAGjpoT1+hR7vl2WAj0bSh/UQQm8M20UDO4OcQhMd2cFKGIKg==
X-Received: by 2002:aa7:cd8d:0:b0:463:19ca:a573 with SMTP id x13-20020aa7cd8d000000b0046319caa573mr19884464edv.31.1669103732262;
        Mon, 21 Nov 2022 23:55:32 -0800 (PST)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 15-20020a170906310f00b0078cf8a743d6sm5695025ejx.100.2022.11.21.23.55.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Nov 2022 23:55:31 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Tue, 22 Nov 2022 08:55:31 +0100
Message-Id: <COINW4PF8OS8.2QJZZKVL58FJG@otso>
Cc:     <linux-arm-msm@vger.kernel.org>,
        <~postmarketos/upstreaming@lists.sr.ht>,
        <phone-devel@vger.kernel.org>, "Andy Gross" <agross@kernel.org>,
        "Bjorn Andersson" <andersson@kernel.org>,
        "Konrad Dybcio" <konrad.dybcio@somainline.org>,
        "Vinod Koul" <vkoul@kernel.org>,
        "Kishon Vijay Abraham I" <kishon@kernel.org>,
        "Rob Herring" <robh+dt@kernel.org>,
        "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
        "Wesley Cheng" <quic_wcheng@quicinc.com>,
        <linux-phy@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: phy: qcom,qmp-usb3-dp: Add sm6350
 compatible
From:   "Luca Weiss" <luca.weiss@fairphone.com>
To:     "Johan Hovold" <johan@kernel.org>
X-Mailer: aerc 0.13.0
References: <20221121075358.76582-1-luca.weiss@fairphone.com>
 <Y3sxqUu0dnaQfdFY@hovoldconsulting.com>
In-Reply-To: <Y3sxqUu0dnaQfdFY@hovoldconsulting.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Johan,

On Mon Nov 21, 2022 at 9:07 AM CET, Johan Hovold wrote:
> On Mon, Nov 21, 2022 at 08:53:55AM +0100, Luca Weiss wrote:
> > Add the compatible describing the combo phy found on SM6350.
> >=20
> > Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> > ---
> >  Documentation/devicetree/bindings/phy/qcom,qmp-usb3-dp-phy.yaml | 1 +
> >  1 file changed, 1 insertion(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/phy/qcom,qmp-usb3-dp-phy=
.yaml b/Documentation/devicetree/bindings/phy/qcom,qmp-usb3-dp-phy.yaml
> > index 97a7ecafbf85..68aecb638870 100644
> > --- a/Documentation/devicetree/bindings/phy/qcom,qmp-usb3-dp-phy.yaml
> > +++ b/Documentation/devicetree/bindings/phy/qcom,qmp-usb3-dp-phy.yaml
> > @@ -18,6 +18,7 @@ properties:
> >        - qcom,sc8180x-qmp-usb3-dp-phy
> >        - qcom,sc8280xp-qmp-usb43dp-phy
> >        - qcom,sdm845-qmp-usb3-dp-phy
> > +      - qcom,sm6350-qmp-usb3-dp-phy
> >        - qcom,sm8250-qmp-usb3-dp-phy
> >    reg:
> >      items:
>
> The current USB3-DP bindings are broken and we should no be adding
> further compatibles here. Please consider rebasing on:
>
> 	https://lore.kernel.org/all/20221115144005.2478-1-johan+linaro@kernel.or=
g/

I'm not quite clear what you want me to do. Just rebase this change on
top of your patchset and resend or something else?

Regards
Luca

>
> Johan

