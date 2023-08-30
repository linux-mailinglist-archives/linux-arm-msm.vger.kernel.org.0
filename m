Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 348FF78D94E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Aug 2023 20:33:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232366AbjH3Scs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 30 Aug 2023 14:32:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243263AbjH3KfP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 30 Aug 2023 06:35:15 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13DE419A
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Aug 2023 03:35:12 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-9a21b6d105cso696322266b.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Aug 2023 03:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1693391710; x=1693996510; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PakJOWM3f2X2lU1WdNU5BXfvb8MoSegIjT2fCvwDw80=;
        b=GixEsPqB2Th8dNC6y1A9NmVJ8DU68tCEFs3pbkeUL4NK6rr9DIqgUYW7J2xdZAeMD5
         n2GLwwRWMo+pBNZDev8GBEq1BVhRmHssjQ86kPyVIsifDM24qP2hQooWK0Db2yXkkCWE
         Uu8tCeqeOwFA0aW0j7DcTUHfpsqmZWg4zeLR7Rq/QUnw/Mv2hAcguwBpltqNt/ciknKd
         6mB94S6VsuyKyzdkYwGIxW66fqxcnALruf20ueO/+n47nuepdTKY3gPg3QjNUlPKdrAi
         ei1Aoab16YdrNxSuo0lNGAagk9+tx38EAPAcuL8yb/fewoei36LhKqorJqB5LJXyeqcB
         GzvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693391710; x=1693996510;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PakJOWM3f2X2lU1WdNU5BXfvb8MoSegIjT2fCvwDw80=;
        b=DKEbDLdx0wfylS2/O+cZftszQ1sY68WPw9T7PVQV6YBc0SBC8hM7/bJIyV9MuiaoNi
         7ZlZCiZm7o7r4Jj1EdjpdlOgzmL4BFGZZZvnzdsf1f0ZgKARApA+e3FetDpel0etxXkk
         J8yxSHJOdtZheA4+tFdsfhTNwyjrDz8kzaqyrLdMFzTIUGHvJtKFjXYXByJw/AyqM8xe
         X1IakklfmKnK3jV9iw1VrKqeWcVOpzkmwXReghADHBjSTHEkkjtOC1gAd3ciqEUGCSgX
         uL5+/Z2NlTA1kEL8x3xsZz/NX9MqMIZobs0+8mCfWftBx8CQTVM//DWbM8NgQ2kW7XsN
         m5rg==
X-Gm-Message-State: AOJu0YzuQLurv08aSZOA6bEIiVOHbnvfufD95DNHBxvtF/NPsn8RHFl2
        oaklFVwDgfHxqxHlbXVroGXCEg==
X-Google-Smtp-Source: AGHT+IGXWivNh1ZlN/nqyhwxsykDuhrosQf2fDYTztx4ftyPi0mkO+YgqlM65aT3mHmdxazJFxUSiQ==
X-Received: by 2002:a17:906:3152:b0:994:1844:c7d1 with SMTP id e18-20020a170906315200b009941844c7d1mr1175949eje.13.1693391710514;
        Wed, 30 Aug 2023 03:35:10 -0700 (PDT)
Received: from localhost (5073ED84.static.ziggozakelijk.nl. [80.115.237.132])
        by smtp.gmail.com with ESMTPSA id gy25-20020a170906f25900b00985ed2f1584sm7066888ejb.187.2023.08.30.03.35.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Aug 2023 03:35:10 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Wed, 30 Aug 2023 12:35:09 +0200
Message-Id: <CV5T9FXMWOAT.2ZXS0CZ8S0EUM@otso>
To:     "Konrad Dybcio" <konrad.dybcio@linaro.org>,
        <cros-qcom-dts-watchers@chromium.org>,
        "Andy Gross" <agross@kernel.org>,
        "Bjorn Andersson" <andersson@kernel.org>,
        "Rob Herring" <robh+dt@kernel.org>,
        "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
        "Conor Dooley" <conor+dt@kernel.org>,
        "Srinivas Kandagatla" <srinivas.kandagatla@linaro.org>,
        "Linus Walleij" <linus.walleij@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        "Viresh Kumar" <viresh.kumar@linaro.org>
Cc:     <~postmarketos/upstreaming@lists.sr.ht>,
        <phone-devel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <linux-pm@vger.kernel.org>
Subject: Re: [PATCH 01/11] arm64: dts: qcom: sc7280: Mark some nodes as
 'reserved'
From:   "Luca Weiss" <luca.weiss@fairphone.com>
X-Mailer: aerc 0.15.2
References: <20230830-fp5-initial-v1-0-5a954519bbad@fairphone.com>
 <20230830-fp5-initial-v1-1-5a954519bbad@fairphone.com>
 <160d6151-914b-4f2f-9f7c-d14cbb901619@linaro.org>
In-Reply-To: <160d6151-914b-4f2f-9f7c-d14cbb901619@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed Aug 30, 2023 at 12:08 PM CEST, Konrad Dybcio wrote:
> On 30.08.2023 11:58, Luca Weiss wrote:
> > With the standard Qualcomm TrustZone setup, components such as lpasscc,
> > pdc_reset and watchdog shouldn't be touched by Linux. Mark them with
> > the status 'reserved' and reeable them in the chrome-common dtsi.
> >=20
> > Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> > ---
> Could probably use /* Owned by ADSP firmware */ or /* Owned by Gunyah hyp=
 */

Do you know which one is more fitting for these nodes? I don't really
have a reference to if the ADSP or Gunyah (is this even used here?) owns
this.

Regards
Luca

>
> the change lgtm though
>
> Konrad

