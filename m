Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8404E679217
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Jan 2023 08:35:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232605AbjAXHfn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 Jan 2023 02:35:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232152AbjAXHfm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 Jan 2023 02:35:42 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82AC23E617
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jan 2023 23:35:41 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 33DEEB810DC
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jan 2023 07:35:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D06F1C433EF;
        Tue, 24 Jan 2023 07:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1674545738;
        bh=pDKgWUoua20YmE6cBGGrAAjwPz/aziIlCSE60NBy7gg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=XrqByYokM3qTW2JuVOUIiaNnz5AGptMJoXAau5XqV4NH5iTKQZaFe9t7W3zn1l+pj
         1H2D0aohnobycL5To58trZ/FbiYeLbSh29wJ9caRRAF2BUFaEhLj/zC6fOokbBOogV
         TMKporNpvh92G7KchymYu1Wr7QmK8ogJbaL9H8xE5U/3gSYTIDaO0xp+5EtLb99uSb
         iZLRc8QMxbRODwO/yJYg/evGvPZHGNJ5/wdi3K1vBGb+Hpin31qLnn16EySgU+NS6+
         z3bPX6owF/m42+JaFoWeA6Bjcj3zXtpWkjXQfRSndkIldCEkCpepYJAVmIZDHuDH+b
         IFMX/x26jC7bQ==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1pKDqD-0003fc-Ql; Tue, 24 Jan 2023 08:35:38 +0100
Date:   Tue, 24 Jan 2023 08:35:37 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        Johan Hovold <johan+linaro@kernel.org>
Subject: Re: [PATCH] phy: qcom-qmp-combo: correct DP register offsets
Message-ID: <Y8+KSV/0Jk9nnntK@hovoldconsulting.com>
References: <20230123120807.3101313-1-dmitry.baryshkov@linaro.org>
 <Y86TDYOKtpcLdZYx@hovoldconsulting.com>
 <CAA8EJppU4nQRYWwAahWtjrVbU1ywF4P+zxHs1PZm98bzKswiZA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA8EJppU4nQRYWwAahWtjrVbU1ywF4P+zxHs1PZm98bzKswiZA@mail.gmail.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jan 23, 2023 at 08:59:48PM +0200, Dmitry Baryshkov wrote:
> On Mon, 23 Jan 2023 at 16:00, Johan Hovold <johan@kernel.org> wrote:
> >
> > On Mon, Jan 23, 2023 at 02:08:07PM +0200, Dmitry Baryshkov wrote:
> > > Correct DP register offsets used with new DT bindings scheme. First, DP
> > > TX registers reside in separate regions, not in the same regions as USB
> > > TX registers do. Second, correct DP_PHY region offset to follow the
> > > offset used for earlier generations/bindings.
> >
> > No, this patch is broken. SC8280XP is different, doesn't seem to have
> > separate DP TX regions and the DP_PHY registers lies at a different
> > offset than on previous generations.
> >
> > You can't just pull these numbers out of your ... ;)
> >
> > This is the only platform that I can test the DP part on and it is
> > working. If that happens to be by chance, then you need to blame the
> > commit adding support for sc8280xp (i.e. not the one that fixed the
> > binding). And note that this was added by Bjorn who do have access to
> > the documentation for this SoC (as well as actual hardware).
> 
> Ack, let's wait for Bjorn to check the offsets. I find it extremely
> suspicious that dp_txa/txb use the same region as usb txa/txb do.

Yeah, I agree, it seems odd, but then again the sc8280xp PHY is a
different beast which also supports USB4, etc. The DP_PHY offset comes
from the header file in the vendor tree and there are no separate DP TX
registers there.

By the way, I forgot that Bjorn actually copy-pasted the devicetree
nodes from an earlier platform when first adding the PHY and only later
realised that the DP part did not work. The fix for that (e.g. to use
the same TX registers) was never merged to mainline (instead we
temporarily disabled the DP part) so the Fixes tag you used would have
been correct if this turns out to be wrong.

> > > Cc: Johan Hovold <johan+linaro@kernel.org>
> > > Fixes: 83a0bbe39b17 ("phy: qcom-qmp-combo: add support for updated sc8280xp binding")
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Johan
