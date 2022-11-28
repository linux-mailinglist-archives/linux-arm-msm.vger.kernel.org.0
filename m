Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C6C9863B1D5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Nov 2022 20:04:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233050AbiK1TEL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Nov 2022 14:04:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232858AbiK1TEG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Nov 2022 14:04:06 -0500
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6B9727FF0
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Nov 2022 11:04:05 -0800 (PST)
Received: by mail-ed1-x529.google.com with SMTP id d20so5984200edn.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Nov 2022 11:04:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i7TE3xTXHxdiPDqToBEWb9svQo97suw8gwZaCnVq0Pk=;
        b=aVHKrbjVR6RMBzgskzOOJX3n9se5rG6SNBpczzN6sx49SsQagI8ySWu1eWrAS82a25
         1VtP5sG0l2SyzqLy8HSg/XT6g+6M0QNhfPNKCWzt5SUpD5S6zy52Z6I+hC609fD64GI6
         jb+MdADYxZquZEKxDNUGYPaoCBRTDAWnCtKlM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i7TE3xTXHxdiPDqToBEWb9svQo97suw8gwZaCnVq0Pk=;
        b=tkypPDYZTNvFmZRWnM3OOBfjG/bv5UflTofAD1h4p/rXSPsZhV8e9UzmAOR4TR/w2i
         tVAofqCKzaceJ99t0fHWiPlPmnB1PdSPkPggG54Ila+kJm2U03feYJuYym09tLU+JtSV
         I+VsGe0wfa1JfE+VvIuR9zbD0LJaTfdeVr13eBa1PN0ltqmKGyGxtFUw94G2jQkUzIDA
         k8KaOaN34BRJ/gsiI2KZZxs83ZIEKUffaCozLrIwPjfZj5jhUpuvd19dYbuDhSNnPSWt
         L9APpSNHZjkVFi1NcBB6novLZxhEJpbquVGee4oF08M/aJRTIh0LF+PPxyn87tBtkkq1
         09Yw==
X-Gm-Message-State: ANoB5plABQmZfKzM4AfUfPyZtkB8atGo/BVhJ9RckxR1wKPDOVmUAzLq
        XUECnYv87HwJ1rpTGjgPTN8eBebJHcZBTS1M
X-Google-Smtp-Source: AA0mqf4cumbE+mZNkFCR+opXOJBviXV4egxSM4sjY5fp4BkJJf4X5ICq9ckpBSShFml1JTOCMwID7w==
X-Received: by 2002:aa7:cd91:0:b0:469:2f36:fd with SMTP id x17-20020aa7cd91000000b004692f3600fdmr35091510edv.385.1669662244000;
        Mon, 28 Nov 2022 11:04:04 -0800 (PST)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com. [209.85.221.51])
        by smtp.gmail.com with ESMTPSA id o20-20020a50fd94000000b0045726e8a22bsm5413905edt.46.2022.11.28.11.04.03
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Nov 2022 11:04:03 -0800 (PST)
Received: by mail-wr1-f51.google.com with SMTP id z4so18521238wrr.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Nov 2022 11:04:03 -0800 (PST)
X-Received: by 2002:a5d:4950:0:b0:242:1f80:6cd9 with SMTP id
 r16-20020a5d4950000000b002421f806cd9mr681565wrs.405.1669661755148; Mon, 28
 Nov 2022 10:55:55 -0800 (PST)
MIME-Version: 1.0
References: <20221124115712.v4.1.Idfcba5344b7995b44b7fa2e20f1aa4351defeca6@changeid>
 <CAPao8GK93KMrtaXw7mNWOCE60zk=uCENLfBXhNRVxJXEnnaGFg@mail.gmail.com>
 <f58866c8-0164-2e59-4ff3-f9a4f9334e49@linaro.org> <CAPao8GKbdK79Z7w91x0T6JW9v6VFoeYSaXGGAuzB_=ukR9g0_w@mail.gmail.com>
 <b54cd0a4-7ee8-e8c0-ceda-18b29588d535@linaro.org> <CAD=FV=X9C8nLDrEpZE2tLtq6Brn9cd-15+1JWFOL4cPYdJs5Dg@mail.gmail.com>
 <f92ce2ed-80b5-eb26-36a4-2384a7a8510f@linaro.org>
In-Reply-To: <f92ce2ed-80b5-eb26-36a4-2384a7a8510f@linaro.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 28 Nov 2022 10:55:41 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Xfo713SmTpuOJYDavWCciCR0p47Qx7U+6gEN+f4FrB=w@mail.gmail.com>
Message-ID: <CAD=FV=Xfo713SmTpuOJYDavWCciCR0p47Qx7U+6gEN+f4FrB=w@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: arm: qcom: Add zombie
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     =?UTF-8?B?5qWK5a6X57+w?= <ecs.taipeikernel@gmail.com>,
        LKML <linux-kernel@vger.kernel.org>,
        Bob Moragues <moragues@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>, Harvey <hunge@google.com>,
        Matthias Kaehlcke <mka@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Gavin.Lee@ecs.com.tw,
        Darren.Chen@ecs.com.tw, Abner.Yen@ecs.com.tw, Vicy.Lee@ecs.com.tw,
        Jason.Huang@ecs.com.tw
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Mon, Nov 28, 2022 at 9:22 AM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 28/11/2022 16:56, Doug Anderson wrote:
> > Hi,
> >
> > On Thu, Nov 24, 2022 at 3:27 AM Krzysztof Kozlowski
> > <krzysztof.kozlowski@linaro.org> wrote:
> >>
> >> On 24/11/2022 12:20, =E6=A5=8A=E5=AE=97=E7=BF=B0 wrote:
> >>> Hi Krzysztof, Matthias,
> >>>
> >>> How to use "get_maintainers.pl"?
> >>>
> >>> I find this script in path "<MyCodebase>/kernel/v5.15/script", and ou=
tput
> >>
> >> This looks like v5.15 kernel which is heavily outdated. Please never
> >> work on such kernels when interacting with upstream. The rule is you
> >> work on either last mainline kernel (v6.1-rc6), maintainers for-next
> >> branch (you should know who is the maintainer of subsystem you submit
> >> to, get_maintainers.pl gives this information) or on moderately recent
> >> linux-next. For bigger patchsets there might be exceptions for these
> >> rules, but it's not the case here.
> >
> > Just to add context here, it's a fairly standard workflow for ChromeOS
> > kernel engineers to work in a "versioned" kernel directory but still
> > checkout and work with the upstream kernel. I'm sure it's confusing to
> > anyone not used to working with the ChromeOS source tree and build
> > system. Sorry! :( So the fact that Owen is in a directory called
> > "v5.15" doesn't mean that he's actually working with the v5.15 kernel.
> > The fact that Bjorn's address is correct in his CC list implies to me
> > that he's actually got a proper upstream kernel.
> >
> > I had previously [0] instructed Owen to send against Bjorn's tree, so
> > hopefully it's correct.
>
> If it was on Bjorn's tree, get_maintainers.pl would not produce such resu=
lt:
>
> ---
> Series-to: LKML <linux-kernel@vger.kernel.org>
> Series-cc: Douglas Anderson <dianders@chromium.org>
> Series-cc: Bob Moragues <moragues@chromium.org>
> Series-cc: Harvey <hunge@google.com>
> Series-cc: Stephen Boyd <swboyd@chromium.org>
> Series-cc: Matthias Kaehlcke <mka@chromium.org>
> Series-cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

So the above is the _manual_ set of names to add atop get_maintainers.
Patman starts with the list you've manually added (via Series-to and
Series-cc) and then automatically CCs the results of
get_maintainers.pl


> or this:
>
> ---
> owen@buildsvr-HP-ProDesk-600-G4-MT:~/chromebook_zombie_os/src/third_party=
/kernel/v5.15$
> perl scripts/get_maintainer.pl -f MAINTAINERS --email
> linux-kernel@vger.kernel.org (open list)

Wow, really? Maybe I don't have Bjorn's tree correctly checked out
either. ...or you can tell me what I'm doing wrong.

$ git checkout linux_qcom/for-next
HEAD is now at 4d2b529bce12 Merge branches 'arm64-defconfig-for-6.2',
'arm64-for-6.2', 'clk-for-6.2', 'defconfig-for-6.2',
'drivers-for-6.2', 'dts-for-6.2' and 'arm64-fixes-for-6.1' into
for-next

$ perl scripts/get_maintainer.pl -f MAINTAINERS --email
linux-kernel@vger.kernel.org (open list)


> as Owen indicated earlier. They are either incomplete or not correct.
>
> Of course I don't know whether the base tree is the problem or usage of
> get_maintainers.pl...

I suspect it's because the only "maintainer" of the file MAINTAINERS is LKM=
L.
