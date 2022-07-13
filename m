Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 26F06572D7C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Jul 2022 07:42:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234092AbiGMFly (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 Jul 2022 01:41:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233769AbiGMFlc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 Jul 2022 01:41:32 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 416E0E0276
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Jul 2022 22:36:41 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id o12so9314966pfp.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Jul 2022 22:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=swDuaVEjfQDSnt/+tLhKNmCVtI0rCsf/yOtGg4uNukA=;
        b=ZIZsba5lOfVNSIR+fGjHmKHj0TvHo9laX90QNLTSyrxN6e214SoIGjyE9Z5zc7FCtG
         LNHhRJy4jDxm2B491oqDssgMiOC+YkWDC8L/+0qhxuQkylHV8uNkp3B82iAKmpKICHT2
         lPGK7XRngwRT1qadAKw2swJL7q6K99rV9Pp+FVasEelkaQF8baGQQMeS3DYxICPS63E5
         81XkxoPed6FvFdrwPXX57Gb8KVMvDcnRsx34MZ6R26jcwQAcyVwIaJBzNbDfk/XT57no
         6wVo2GkrbwrrNQ+7zxY0+GykpLeGXhec+9zV0w3LfqN65aL2T9QGTPevNByG9rNnGKGt
         6UEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=swDuaVEjfQDSnt/+tLhKNmCVtI0rCsf/yOtGg4uNukA=;
        b=obSWY5adKzmKVYuXJ939+vI2Yq33zKyvFLGuw6BCvJEGjL52jwBNg6H/hr40OOTq5R
         FB7q8w8oaxZQaW5hY9L3e0kZdnSoGms9/wAe8M6loxnAAMVy+guRxa5WM9nnLZcIQBCS
         0+6CBid4tCXTuVHzEAf4TxUn1M/06r8ztRsPmnZABcAOW4Uorf3gIXWbOpO/zPD7PfQw
         WGENPvmPwzryXcHhQNFZM68/UMROvRpjO3fDwa08Hf8/SQWQ3Wjb6dpje94QKdVgbjob
         cch4T1lP31sbjx2/KVbxU0whyZ9u1cjWbCYb/Jt03Kg92rZWZV6+ysLqqe+I6lUOxW7d
         DETQ==
X-Gm-Message-State: AJIora/fjfTtJpPUkQEpB7Q6cS2Jqw3KkAM/IWJpdTLuUdbDQkO9Ude9
        V7VfNNt8dE8xJQ8pgalpl4Dj0V+J50Q2U9/qpkjkmw==
X-Google-Smtp-Source: AGRyM1sSE5OwbigkvwdXNQB+YSapvmZiwKYoaR+srwTKyTTfPrGJx5Wklbs1Mcl4LR1XIVd4DObLnb3M0TINGh4dVlY=
X-Received: by 2002:a05:6a00:140a:b0:4e0:54d5:d01 with SMTP id
 l10-20020a056a00140a00b004e054d50d01mr1481729pfu.20.1657690600733; Tue, 12
 Jul 2022 22:36:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220711083038.1518529-1-sumit.garg@linaro.org>
 <20220711154632.w5qtmroc22qc7yqq@maple.lan> <CAFA6WYPUX8aLGScx7er=3-iqEU9Vp+TsQAck_BnLz1RNMbr9cQ@mail.gmail.com>
 <20220712140512.y7fezq2kjnuyq33b@maple.lan>
In-Reply-To: <20220712140512.y7fezq2kjnuyq33b@maple.lan>
From:   Sumit Garg <sumit.garg@linaro.org>
Date:   Wed, 13 Jul 2022 11:06:28 +0530
Message-ID: <CAFA6WYOs2CZ3Z6CDJEUhvf_nXW4fSeORnOHgQxE_vL82amV5XA@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: qcom: qcs404: Fix incorrect USB2 PHYs assignment
To:     Daniel Thompson <daniel.thompson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, vkoul@kernel.org,
        shawn.guo@linaro.org, bryan.odonoghue@linaro.org,
        nicolas.dechesne@linaro.org, mworsfold@impinj.com,
        andrey.konovalov@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 12 Jul 2022 at 19:35, Daniel Thompson
<daniel.thompson@linaro.org> wrote:
>
> On Tue, Jul 12, 2022 at 06:02:22PM +0530, Sumit Garg wrote:
> > On Mon, 11 Jul 2022 at 21:16, Daniel Thompson
> > <daniel.thompson@linaro.org> wrote:
> > >
> > > On Mon, Jul 11, 2022 at 02:00:38PM +0530, Sumit Garg wrote:
> > > > Currently the DT for QCS404 SoC has setup for 2 USB2 PHYs with one =
each
> > > > assigned to USB3 controller and USB2 controller. This assignment is
> > > > incorrect which only works by luck: as when each USB HCI comes up i=
t
> > > > configures the *other* controllers PHY which is enough to make them
> > > > happy. If, for any reason, we were to disable one of the controller=
s then
> > > > both would stop working.
> > > >
> > > > This was a difficult inconsistency to be caught which was found whi=
le
> > > > trying to enable USB support in u-boot. So with all the required dr=
ivers
> > > > ported to u-boot, I couldn't get the same USB storage device enumer=
ated
> > > > in u-boot which was being enumerated fine by the kernel.
> > > >
> > > > The root cause of the problem came out to be that I wasn't enabling=
 USB2
> > > > PHY: "usb2_phy_prim" in u-boot. Then I realised that via simply dis=
abling
> > > > the same USB2 PHY currently assigned to USB2 host controller in the
> > > > kernel disabled enumeration for USB3 host controller as well.
> > > >
> > > > So fix this inconsistency by correctly assigning USB2 PHYs.
> > > >
> > > > Fixes: 9375e7d719b3 ("arm64: dts: qcom: qcs404: Add USB devices and=
 PHYs")
> > > > Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> > >
> > > I've not got one of these board (nor any documentation for them) but =
the
> > > description and change look OK. Thus FWIW:
> > >
> > > Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
> > >
> >
> > Thanks Daniel for the review.
>
> No worries.
>
>
> > BTW, I did confirmed that this fix is correct with respect to
> > documentation (SA2150P LINUX USB TECHNICAL OVERVIEW) as well:
> >
> > 2.1 USB memory addresses
> > =E2=96=A0 USB3.0 core address starts with 0x7580000. USB3.0 is connecte=
d to:
> >  =E2=96=A1 SS PHY with start address as 0x78000
> >  =E2=96=A1 HS PHY with start address as 0x7a000.
> > =E2=96=A0 USB2.0 core address starts with 0x78c0000; it is connected on=
ly to
> > HS PHY with the start address as 0x7c000.
>
> I didn't mean to imply the patch was in any way deficient (the patch
> description showed your experimental method pretty clearly).  I just
> wanted to be clear that I hadn't double checked anything outside of the
> patch itself!
>

No worries, I see your point. I just wanted to put out this
information for maintainers which I was able to find yesterday.

-Sumit

>
> Daniel.
