Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D8F8E64899B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Dec 2022 21:39:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229798AbiLIUjA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Dec 2022 15:39:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229626AbiLIUi7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Dec 2022 15:38:59 -0500
Received: from relay05.th.seeweb.it (relay05.th.seeweb.it [IPv6:2001:4b7a:2000:18::166])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98D4AA4318;
        Fri,  9 Dec 2022 12:38:57 -0800 (PST)
Received: from SoMainline.org (94-209-172-39.cable.dynamic.v4.ziggo.nl [94.209.172.39])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 349A63F1EB;
        Fri,  9 Dec 2022 21:38:54 +0100 (CET)
Date:   Fri, 9 Dec 2022 21:38:51 +0100
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     Luca Weiss <luca@z3ntu.xyz>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: Add configuration for PMI8950
 peripheral
Message-ID: <20221209203851.sy37qqzczoaruuyb@SoMainline.org>
Mail-Followup-To: Marijn Suijten <marijn.suijten@somainline.org>,
        Luca Weiss <luca@z3ntu.xyz>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jonathan Cameron <jic23@kernel.org>
References: <20221101161801.1058969-1-luca@z3ntu.xyz>
 <36eb03e8-aace-f7ce-edc8-53715021c0ea@linaro.org>
 <20221208112055.m7sqg3ysxzskqjp4@SoMainline.org>
 <5740737.DvuYhMxLoT@g550jk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5740737.DvuYhMxLoT@g550jk>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2022-12-09 17:54:50, Luca Weiss wrote:
> On Donnerstag, 8. Dezember 2022 12:20:55 CET Marijn Suijten wrote:
> > On 2022-12-08 11:23:17, Krzysztof Kozlowski wrote:
> > > On 08/12/2022 11:12, Marijn Suijten wrote:
> > > > On 2022-12-04 17:19:05, Luca Weiss wrote:
> > > >> On Freitag, 2. Dezember 2022 10:36:58 CET Marijn Suijten wrote:
> > > >> [..]
> > > >> 
> > > >> So the way this patch does it is good or does it need changes?
> > > > 
> > > > Except the typo(s?) pointed out in my first reply, this is good to go.
> > > > 
> > > > If we stick with generic adc-chan node names that should be documented
> > > > in the bindings IMO, as it is currently only captured implicitly in the
> > > > examples.  Krzysztof, what is your thought on this?
> > > 
> > > If I understand correctly, the outcome of other discussion [1] was to
> > > use labels and generic node names.
> > 
> > The outcome was to use labels in the driver and disregard node names as
> > the new fwnode API clobbers those names by including the @xx register
> > bit.
> > 
> > (I'll follow up with Jonathan whether or not to remove the current
> > fallback to node names, as [1] ended up discussing many different issues
> > and nits)
> > 
> > > In such case the patch was correct
> > > (except other comments).
> > 
> > As a consequence it _doesn't matter_ how nodes are named, and we _can_
> > use generic node names.  My question for you is whether we should, and
> > if we should lock that in via dt-bindings to guide everyone towards
> > using labels (which i did _not_ do in the recently-landed PM8950 and
> > PM6125, but will send followup for).
> 
> FYI the patch has been merged already and is now in linux-next
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/arch/arm64/boot/dts/qcom/pmi8950.dtsi?id=0d97fdf380b478c358c94f50f1b942e87f407b9b
> 
> If you have any changes that need to be done please send a follow-up patch.

Unfortunately saw that today as well, well after sending this reply.  I
would've loved to correct the pmi8950_gpio label _gpios before someone
starts relying on it in followup patches.

Fixing the v -> mv typo isn't hard though, I'll send a followup patch
regardless.

- Marijn
