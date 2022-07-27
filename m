Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 95304581D02
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Jul 2022 03:19:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240139AbiG0BTW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 Jul 2022 21:19:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240135AbiG0BTV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 26 Jul 2022 21:19:21 -0400
Received: from mail-oa1-x2a.google.com (mail-oa1-x2a.google.com [IPv6:2001:4860:4864:20::2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9EB739B98
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Jul 2022 18:19:19 -0700 (PDT)
Received: by mail-oa1-x2a.google.com with SMTP id 586e51a60fabf-10cf9f5b500so20859026fac.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Jul 2022 18:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc:content-transfer-encoding;
        bh=N3xrUzjUYFPtoTbDR74Lo54Yq/ddaaWSnnHdJbvIshU=;
        b=csS2R2IZMt5wdMU536xlBF5TJRObaR2yn7fl6kdl10elppqpFKNDU/b53ozNfjcDs+
         4lolN0ww4/KdeEm38w/ObNhLwoBXSFG28PR/PSpXS2UcOXhNPzeR/HfcqQj2Ygct05zn
         /TYnlGGQgtmaODLNi0aZqMKMtGMizkm7WkF1k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc:content-transfer-encoding;
        bh=N3xrUzjUYFPtoTbDR74Lo54Yq/ddaaWSnnHdJbvIshU=;
        b=X0w3EYa8pX5TkuUqagBHlArm2LDQ/JgWfz/6zPqErmSE+7et7y713cL9haC+hM0ngQ
         A9jX5NO6C9Jthz9ImuPcwpgC7TQ7mdKa88uv2MFc4cpXbyXTfG2+lWFIbaWJT3FPHBX3
         52GPn6aFI1Tb1D2DWKx4aXTh7j4FzkDyOKnf6MUjXTCaUqeYzEzueksbd6/WHGblQfJr
         1Kz7okBEoNPu3PfobPT7ihDb/kuCZjFvwxXMpRQgmfakBV9YwuNp2JRntt5bkYICP2lV
         9PpAN0Y4w/O1WqMfZXsAjEeUAOCN6YPmuPzViysDD0B64tiLANHMnpmJo31Z9U+85t0E
         P3jg==
X-Gm-Message-State: AJIora+Y02sYv95AWUx8yjdDrRLBV/nlnihYVI+jbo1mSLNZsCKnBQVJ
        McAiGs/K26eMYSIvs+p/Ef1zEEfSMqn1jNK/oQzEfQ==
X-Google-Smtp-Source: AGRyM1sITUa1kmugE3kEUcG0/QUqaOExLTLf+OwZHOnylEFi62EbnydR2G47tkAROqiHwutJOJOI0DUIwm8VfP1A84s=
X-Received: by 2002:a05:6870:9a17:b0:e9:3d1:f91a with SMTP id
 fo23-20020a0568709a1700b000e903d1f91amr942074oab.44.1658884759251; Tue, 26
 Jul 2022 18:19:19 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 26 Jul 2022 20:19:18 -0500
MIME-Version: 1.0
In-Reply-To: <dc737abb-041b-491a-14f1-a584f9e64a3d@quicinc.com>
References: <YrxtXdOsIZ5LKhdV@google.com> <de1f3f33-0a8c-eb87-694c-16ebf2835720@quicinc.com>
 <Yr6oLlmfWRkiAZG7@google.com> <52c6ab15-1cd8-324e-4bcc-c449d8bceb19@quicinc.com>
 <Yr66ZZqEnBApHYMA@google.com> <0481d3cc-4bb9-4969-0232-76ba57ff260d@quicinc.com>
 <YsLhxx+L3+GJDRyO@google.com> <bcc5f059-b991-296a-bba6-9cb1236097f2@quicinc.com>
 <Ys1tYAO39LKzEAOE@google.com> <dc737abb-041b-491a-14f1-a584f9e64a3d@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Tue, 26 Jul 2022 20:19:18 -0500
Message-ID: <CAE-0n528QaTtZFp=WAaHShegFRpKVN_67jQfUJTtsRPr6s--zA@mail.gmail.com>
Subject: Re: [PATCH V15 6/9] mfd: pm8008: Use i2c_new_dummy_device() API
To:     Lee Jones <lee.jones@linaro.org>, Mark Brown <broonie@kernel.org>,
        Satya Priya Kakitapalli <quic_c_skakit@quicinc.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_collinsd@quicinc.com,
        quic_subbaram@quicinc.com, quic_jprakash@quicinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Satya Priya Kakitapalli (Temp) (2022-07-21 23:31:16)
>
>  =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 regulator-name =
=3D "pm8008_l6";
>  =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 };
>
>  =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 pm8008_l7: ldo7@4600 {
>  =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 reg =3D <0x4600=
>;
>  =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 regulator-name =
=3D "pm8008_l7";
>  =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 };
>  =C2=A0=C2=A0 =C2=A0};
> };
>
>
> Stephen/Mark, Please do let me know if you are OK with this design.
>

I was happy with the previous version of the DT node. That had one node
for the "pm8008 chip", which is important because it really is one
package. Why isn't that possible to implement and also register i2c
devices on the i2c bus for the second address?
