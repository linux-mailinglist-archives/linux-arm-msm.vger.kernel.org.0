Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B949D737606
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jun 2023 22:27:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229685AbjFTU11 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Jun 2023 16:27:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229470AbjFTU10 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Jun 2023 16:27:26 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EEE21B0
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jun 2023 13:27:26 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 9D89D611B9
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jun 2023 20:27:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3D2EC433C0;
        Tue, 20 Jun 2023 20:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1687292845;
        bh=1B1S4EhxfYYeCKRGj/rPDezq4yKIcyVzll0C6MiU8VE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WKgMnzBEdZzJzh14pUpb0OYqM7KjfQX/i1Olwm0UKM2ii+5YvRW/FVEZIKP9Aqx9G
         jxSDMOyV0XbdpnmIEyDBSRX6eQ1peK9u+J6uAdIUr3LQ/qzX9FGlOg2n5n2+8eZwXG
         6n/mOnx98Br/8kLQ6duwHhDBI+y5A34peMQmEJt/aO37GVvKBcwXKnFlc/PVctgvfK
         mQqruGcl/IFNf1iPE908mkvCBB8hiiOdMEdbQZt8DvyaVJc6VReVxxjO/NvtYyH95e
         12+c93jfZm9EgHPSx9FhzsB4UBkDR2oID958+WMRAb9bYUx8oSqRbbOwmOCQOUGuXX
         7dpE0hXx7yTow==
Date:   Tue, 20 Jun 2023 21:27:18 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Neil Armstrong <neil.armstrong@linaro.org>
Cc:     Joey Gouly <joey.gouly@arm.com>,
        linux-arm-kernel@lists.infradead.org,
        Bjorn Andersson <andersson@kernel.org>, nd@arm.com,
        catalin.marinas@arm.com, james.morse@arm.com, mark.rutland@arm.com,
        maz@kernel.org, oliver.upton@linux.dev, shuah@kernel.org,
        suzuki.poulose@arm.com, will@kernel.org, yuzenghui@huawei.com,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH v4 16/20] arm64: enable Permission Indirection Extension
 (PIE)
Message-ID: <c977d0ef-8bb5-4922-a468-8d8858b688a8@sirena.org.uk>
References: <20230606145859.697944-1-joey.gouly@arm.com>
 <20230606145859.697944-17-joey.gouly@arm.com>
 <c3598e8e-46a5-c8d6-bf9f-9fb8f6cd346e@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="5FrF9/7Ubqya7hMS"
Content-Disposition: inline
In-Reply-To: <c3598e8e-46a5-c8d6-bf9f-9fb8f6cd346e@linaro.org>
X-Cookie: Chocolate chip.
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--5FrF9/7Ubqya7hMS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 20, 2023 at 09:16:05PM +0200, Neil Armstrong wrote:

> This patch on linux-next causes a great amount of:

> X     xxx.xxxxxx Emulated RAZ for ID register: ISS 0x36002f

> messages printed by the system firmware on the Qualcomm SM8550 SoC,
> and the platform is barely usable.

Regardless of what the kernel is doing it looks like there's a firmware
issue here, all otherwise undefined registers in the ID space should be
RAZ so spamming the logs like this isn't great.

--5FrF9/7Ubqya7hMS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmSSC6UACgkQJNaLcl1U
h9Cs5gf+OyHT2AsKCiBZcSFvKnmoSwpYCjeFVgYFbn1wIF0jT4dxEwAF/cT7oCva
dy5ebh5ENh2iuHJaduu8aJdQWa3ByTcT1HGdOhVr1x+5P4RoAwZqB6ZCD1L+i3qf
m8YnCxMgm8QrrExYiFwV7LbF937F6jTZa7MX0cA+ZoTQJgOYcKIV8/T9icJCJGB9
xtZz3dv8ARPH+bqinX34gSmPD8R1f25fjCbnZG6Lnlf6Xof+D6BV/0Nx6eILAccb
1TsqYNrt6BT/LbaQALE3WZJH6qTP0qGXYhN8UIqpxSZp48h/cADVa0+D3hnYT+1Y
9Xo4Sx6utvJa7YH4oe+xsSTM40VYeQ==
=hoLC
-----END PGP SIGNATURE-----

--5FrF9/7Ubqya7hMS--
