Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CD6664CC8C9
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Mar 2022 23:23:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236847AbiCCWYe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Mar 2022 17:24:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236839AbiCCWYa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Mar 2022 17:24:30 -0500
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com [IPv6:2607:f8b0:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2DC03EBB9
        for <linux-arm-msm@vger.kernel.org>; Thu,  3 Mar 2022 14:23:43 -0800 (PST)
Received: by mail-ot1-x32c.google.com with SMTP id 40-20020a9d032b000000b005b02923e2e6so5882314otv.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Mar 2022 14:23:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=84N9C6KvyMy2P8CDxkMygU4c2ZXeXw9ZduzWrJT2etE=;
        b=cFzFuK9Te+gPYjsQw43HWd+lX0dK75cQbikvF+GotiKMkoC7n3D5HmUVNLnEV8gBpH
         oBKM8lXnCJMovyZOcmMwSfRGp7xNWHY4XVb/EDVU5NpxUfncr25dJ5uqjKdGZG8y9hif
         ATRmIFWvL8nT6Fxu9sp/brC8rt8gRB/WUcYRk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=84N9C6KvyMy2P8CDxkMygU4c2ZXeXw9ZduzWrJT2etE=;
        b=Mv9W9BraPaiklfJFB59hKJWI17yFPCn7aCH+h0f9JRHB1TmIf6xx4VpFyryY8sQWI6
         VW6jkD/cyH5rQ5rRl3nl9ui27mvz6VJVVrtcRDovdX6BYee6Ax17s9bni8Sa+MGgiN4/
         YPxSDi1J094XAUEJPUJJlzJygAMEmLVPeT8BlFedlGVPAax3cShJSZ7PVdDf+TQo8xZK
         aY8/xcddzvavGMpSnbLxA5MaXWzot1yhxrpba0kLA5NJYZVoEpb8+6YdoCXRUfc46nDB
         Uyq5Hn8NIwfiAbmYKDiMC2F16g7Zwx8RD2Mm3yRsErdbsSLR6Nqufy1M1laIjXRgBjq5
         oSfg==
X-Gm-Message-State: AOAM531NYlSbGo9OY2VYVa+hRJEHHmetY1aBEH2HqVx4ifoYQiQddALj
        7ikLDwzc1qvSK/xMJGk9pfOLNiKIfDYcPnp9vZmKSWNyn4I=
X-Google-Smtp-Source: ABdhPJx96sN+CrROFdnLq4TVFnKH2FvrwIjYkI+NMasfcx0/cQZZuTxmSn4ziMWwpGM1lI9t0aITlvtBXJxVU5Cw/Xc=
X-Received: by 2002:a9d:22e9:0:b0:5ac:1754:342c with SMTP id
 y96-20020a9d22e9000000b005ac1754342cmr20034277ota.159.1646346223173; Thu, 03
 Mar 2022 14:23:43 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 3 Mar 2022 14:23:42 -0800
MIME-Version: 1.0
In-Reply-To: <b793195b-1d3d-63b2-19d2-72ae2aec8c0f@canonical.com>
References: <1646288011-32242-1-git-send-email-quic_c_sanm@quicinc.com>
 <1646288011-32242-2-git-send-email-quic_c_sanm@quicinc.com> <b793195b-1d3d-63b2-19d2-72ae2aec8c0f@canonical.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Thu, 3 Mar 2022 14:23:42 -0800
Message-ID: <CAE-0n53xT1OaDLg+o1g_DXO5CHOZ=YC1C=2weeET-6cvbSKXPQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: phy: qcom,usb-snps-femto-v2: Add phy
 override params bindings
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Doug Anderson <dianders@chromium.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Matthias Kaehlcke <mka@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sandeep Maheswaram <quic_c_sanm@quicinc.com>,
        Vinod Koul <vkoul@kernel.org>,
        Wesley Cheng <wcheng@codeaurora.org>
Cc:     devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-usb@vger.kernel.org, quic_pkondeti@quicinc.com,
        quic_ppratap@quicinc.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Krzysztof Kozlowski (2022-03-03 07:59:22)
> On 03/03/2022 07:13, Sandeep Maheswaram wrote:
> > Add device tree bindings for SNPS phy tuning parameters.
> >
> > Signed-off-by: Sandeep Maheswaram <quic_c_sanm@quicinc.com>
> > ---
> >  .../bindings/phy/qcom,usb-snps-femto-v2.yaml       | 125 +++++++++++++++++++++
> >  1 file changed, 125 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml b/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml
> > index 0dfe691..227c097 100644
> > --- a/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml
> > +++ b/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml
> > @@ -50,6 +50,131 @@ properties:
> >    vdda33-supply:
> >      description: phandle to the regulator 3.3V supply node.
> >
> > +  qcom,hs-disconnect:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description:
> > +      This adjusts the voltage level for the threshold used to
> > +      detect a disconnect event at the host. Possible values are.
>
> ':', instead of full stop.
>
> > +      7 -> +21.56%
> > +      6 -> +17.43%
> > +      5 -> +13.32%
> > +      4 -> +9.73%
> > +      3 -> +6.3
> > +      2 -> +3.17%
> > +      1 -> 0, Design default%
>
> Use "default:" instead. Here and in other places.
>
> > +      0 -> -2.72%
>
> In current form this should be an enum... but actually current form is
> wrong. You should not store register values in DT. What if next version
> of hardware has a different meaning of these values?
>
> Instead, you should store here meaningful values, not register values.

+1

To emphasize one point, meaningful values typically have a unit of
measure, like Hz, ms, mV, etc. What are the percentages adjusting from?
Is it a percentage decrease from the input voltage?
