Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0EBCC6901AB
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Feb 2023 09:00:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229569AbjBIIAz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Feb 2023 03:00:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229535AbjBIIAy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Feb 2023 03:00:54 -0500
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A552925946
        for <linux-arm-msm@vger.kernel.org>; Thu,  9 Feb 2023 00:00:52 -0800 (PST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 66FE45C306;
        Thu,  9 Feb 2023 08:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
        t=1675929651;
        h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
         cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=W5GRwHVSlmQ/jRNfErdbyyKqPQQH8qHhlRncp9AJkco=;
        b=kHFlHgzgBAE5+3koaZKvZ9+wSI1S+/NLwPIBNXgy6EIPgKZpxyk8lC5+9Es0vXuanmMjFs
        KkTrHkpSEXBqqvMZ8E9WnA2pmMYzGuv4trs22jW7w8qxHHb5u8uYj/2mJ1QJIsLFICYba/
        oyPMkRsEL8UAG9uRiFVF2UGXqLfTDxc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
        s=susede2_ed25519; t=1675929651;
        h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
         cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=W5GRwHVSlmQ/jRNfErdbyyKqPQQH8qHhlRncp9AJkco=;
        b=hgQ9OIWppuH7QNGG0Y1QFCY/QoJ6YYCnX0H7WNHy0bCUibzE7zx1ikqJdW5a1Ah7elEg0S
        zvfHsdCk6mx2HXCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 154F313A1F;
        Thu,  9 Feb 2023 08:00:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id DuCJAzOo5GMACAAAMHmgww
        (envelope-from <pvorel@suse.cz>); Thu, 09 Feb 2023 08:00:51 +0000
Date:   Thu, 9 Feb 2023 09:00:49 +0100
From:   Petr Vorel <pvorel@suse.cz>
To:     Bjorn Andersson <andersson@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Dominik Kobinski <dominikkobinski314@gmail.com>,
        Jamie Douglass <jamiemdouglass@gmail.com>
Subject: Re: [PATCH 1/1] arm64: defconfig: Enable qcom msm8994 clk drivers
Message-ID: <Y+SoMVW3Ea49p4pk@pevik>
Reply-To: Petr Vorel <pvorel@suse.cz>
References: <20230130111014.27980-1-pvorel@suse.cz>
 <20230130152758.f5hh7zydyca22ipu@builder.lan>
 <Y9gWsWuDt10fUL5i@pevik>
 <20230208230628.xoaqt4hby5ec4s6t@ripper>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230208230628.xoaqt4hby5ec4s6t@ripper>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

> On Mon, Jan 30, 2023 at 08:12:49PM +0100, Petr Vorel wrote:
> > > On Mon, Jan 30, 2023 at 12:10:14PM +0100, Petr Vorel wrote:
> > > > Enabling the clk drivers on msm8994 allows to boot and test most device
> > > > drivers on this SoC.

> > > > Signed-off-by: Petr Vorel <pvorel@suse.cz>

> > > Now that we can handle probe defer on the power-domains, can this be
> > > made =m instead?

> > Out of curiosity may I know what commit implemented handling probe defer on
> > power-domains?


> Probe defer support has been there for a long time, but it was not
> reliable after late_initcall.

> I believe 2b28a1a84a0e ("driver core: Extend deferred probe timeout on
> driver registration") is the change that altered the behavior, so we can
> now use it for kernel modules as well.

Thanks for info! I have v2 prepared, but I'd prefer to test it, thus I'll send
it next week after I get time to test it.

Kind regards,
Petr

> Regards,
> Bjorn
