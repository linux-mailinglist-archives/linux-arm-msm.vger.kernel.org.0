Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EC0276E1CD3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Apr 2023 08:51:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229542AbjDNGvM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 14 Apr 2023 02:51:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229446AbjDNGvL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 14 Apr 2023 02:51:11 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 616EEAD
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Apr 2023 23:51:06 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id si1so13028511ejb.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Apr 2023 23:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1681455065; x=1684047065;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K+WN6T+Knm9we3h7NoryAk78kn2YJjd6ujXcjaUDzw0=;
        b=jsUU0UDsPlabryanLeKGvQftkQ6FvmoVprW1ZfF7bTrH0iq44Z0Nd3vmNlBuSZ3w7r
         orRE96ryBrOl1ezXihnOva23zCSYV7F9j0gKhB/zBJlxoHbH4D1rD4B6oUiZ6dqHOtA0
         030uk+9atlZ7Kti1uSzfJE+vxI5VwSmXxjm/wGMy/YRfKzD90G/pKAqXMynVxG+KHk3G
         MePXADzCjt3UdtdITQGgNzc+uP0gw+r4zqu/EKQNgMhlJLXTK+4gLwgCASNqgfn6r2Hu
         pOaZfMGtuMP7dSisH0mlAvFiqNJsCvrN6WMBib1ITKxd3cqaNB0nqBaoyrfhE+sJegY/
         QGxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681455065; x=1684047065;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=K+WN6T+Knm9we3h7NoryAk78kn2YJjd6ujXcjaUDzw0=;
        b=FKCFvkxRBPmYeqze6Z7g5nBMJFLLTznfrbx0YRS7/M28I9Ddc7Kjc5fLxt7K5FxibJ
         Vey9A7uXD6418358n+PQS7T4k7NHXDrk3E3V9TsEhuHHNgAPOOsRMTH0E6RoYc4YmyEi
         BeD4znOBHnw1Z5GuUzEcr2dSnxmNfZnAtF7vi4MeySeei5BCYQULilCzam2BGYFu4I4V
         Q66/GHgWW8RdAFiwkAkCAm4/nhs7wETRQAmjgvLTza7nDMrjx4jKxJsp5h5jEjvHB3Uk
         G3fAKfSzQJ8pks76VlfiPr4jpsgJ7rxT7rrf+o8EOR98PGYqNJLFscwZXZ+5q0I4WB7s
         dZsw==
X-Gm-Message-State: AAQBX9epUsx4FyUB+TwWj93HiHiC0eD/h/+M//RXwZ4NQHmV4NI2KjqZ
        idUtnj+V5JVCSlFxp9g2TRODUQ==
X-Google-Smtp-Source: AKy350agxzMApL1j52BabZywTTq67yJeqEy9cBCgbsi9iCU+RuSdiaPSo6d4BN//1w6aAifK8lRY5Q==
X-Received: by 2002:a17:906:1b01:b0:94e:edf3:dccd with SMTP id o1-20020a1709061b0100b0094eedf3dccdmr434902ejg.0.1681455064867;
        Thu, 13 Apr 2023 23:51:04 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id s5-20020a170906168500b0094d69608f5fsm1991552ejd.97.2023.04.13.23.51.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Apr 2023 23:51:04 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Fri, 14 Apr 2023 08:51:04 +0200
Message-Id: <CRWA2OP2T6KT.RCWAVWF5Q2T2@otso>
From:   "Luca Weiss" <luca.weiss@fairphone.com>
To:     "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        <linux@roeck-us.net>, <heikki.krogerus@linux.intel.com>,
        <gregkh@linuxfoundation.org>, <andersson@kernel.org>,
        <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <linux-usb@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>
Cc:     <caleb.connolly@linaro.org>, <konrad.dybcio@linaro.org>,
        <subbaram@quicinc.com>, <jackp@quicinc.com>,
        <robertom@qti.qualcomm.com>
Subject: Re: [PATCH v5 00/14] Add Qualcomm PMIC TPCM support
X-Mailer: aerc 0.14.0
References: <20230413113438.1577658-1-bryan.odonoghue@linaro.org>
 <CRVOZOPMKBX4.2T7FOCWF0RKBJ@otso>
 <10551f5e-4516-c0cc-0b04-73aa38f80a2c@linaro.org>
In-Reply-To: <10551f5e-4516-c0cc-0b04-73aa38f80a2c@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu Apr 13, 2023 at 5:08 PM CEST, Bryan O'Donoghue wrote:
> On 13/04/2023 15:19, Luca Weiss wrote:
> > Hi Bryan,
> >=20
> > On Thu Apr 13, 2023 at 1:34 PM CEST, Bryan O'Donoghue wrote:
> >> V5:
> >> - Amagamates into once device, Heikki, Rob
> >>
> >> - Takes feedback on usage form Luka and Jianhua on VSafeV state transi=
tion detection
> >>    dev_err() -> dev_warn()
> >>
> >> - Orientation graph example and general expected bindings
> >>    I discussed offline with Bjorn the conclusions of the glink/sbu mod=
el.
> >>    The expected orientation-switch path is
> >>      connector/port@0 <-> phy/port@X <-> dp/port@0
> >>    This can then be expanded to
> >>      connector/port@0 <-> redriver/port@0 <-> phy/port@X <->  dp/port@=
0
> >>
> >>    - Rob, Bjorn, Krzysztof
> >>
> >> - Data role
> >>    The data-role path is
> >>      connector/port@0 <-> dwc3/port@Y
> >=20
> > I believe I have adjusted my dts correctly for v5 compared to v4 but no=
w
> > the usb doesn't seem to work anymore in most cases.
> >=20
> > Only when having the phone already plugged in during boot in one
> > orientation does USB come up, but also disappears once you replug the
> > cable. I still see the same (or at least visually similar) messages whe=
n
> > plugging in the USB cable or the USB stick but nothing more than that
> > happens.
> >=20
> > Not that v4 worked perfectly on pm7250b+sm7225(/sm6350) but at least it
> > worked in most cases as described in the emails there. Since the driver
> > structure changed quite a bit, git diff isn't helpful here
> > unfortunately.
> >=20
> > Don't think it matters but worth mentioning that sm6350 uses the new
> > qmpphy bindings as described in qcom,sc8280xp-qmp-usb43dp-phy.yaml (thi=
s
> > was also the case when testing v4 of this).
> >=20
> > Any idea?
>
> Can you confirm the output of /sys/class/typec/port0/orientation in host=
=20
> mode with the USB key / peripheral in both orientations ?

I see "reverse" and "normal" depending on the direction the USB stick is
plugged in. When unplugged but also when plugged into my PC it stays at
"unknown".

>
> If that's still OK, then perhaps we can figure out the gap in the PHY=20
> code for v3
>
> @caleb is working on this code for sdm845 which is a v3 PHY

Regards
Luca

>
> ---
> bod

