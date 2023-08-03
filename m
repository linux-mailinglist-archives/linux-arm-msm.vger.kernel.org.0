Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6810876EEB6
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Aug 2023 17:53:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235674AbjHCPxs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Aug 2023 11:53:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235670AbjHCPxr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Aug 2023 11:53:47 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBC373A85;
        Thu,  3 Aug 2023 08:53:46 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7A21E61E21;
        Thu,  3 Aug 2023 15:53:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FDABC433C8;
        Thu,  3 Aug 2023 15:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1691078025;
        bh=8fn4NsglEHfAZXQyXDuTzdOkvddrJ8Q1RH8EX5Eb4xk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=VWRxlwQupQZMZqEzRYfwLLRMQo46W3vX+fCsqjSsQRjJZLzQq+vKEQN2iLdMfQMj9
         w5NRZ6cNDwSltBwqhaQl1mvsbTZX99hsd11qjdPgJ+QVRByDw9x/TDXziRRtQPK0NH
         IodqrIuDyByTkutlWM38y+JqGt3HgMEQXBoEk+JGLHhQUiraAOsMmwFZBMqkT35d05
         qBc9VpvWs5QLxHBlNIF4MS3H+ZmLSslItbNFBvTyH5xk0MQnGNAf4WFaWpc2y3Jcby
         eHHVsbiNSZ6YLmdAvy3POIDzG6e8AEGl9HDZy+/JIDEncRNfqHiMPkxpmEuyCGkO3Z
         xcpygLl8g2bmQ==
Date:   Thu, 3 Aug 2023 16:53:41 +0100
From:   Conor Dooley <conor@kernel.org>
To:     Otto =?iso-8859-1?Q?Pfl=FCger?= <otto.pflueger@abscue.de>
Cc:     linux-clk@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: clock: gcc-msm8917: Add definition for
 GPLL0_SLEEP_CLK_SRC
Message-ID: <20230803-sake-festivity-f0fb57b108dc@spud>
References: <20230802170317.205112-1-otto.pflueger@abscue.de>
 <20230802170317.205112-2-otto.pflueger@abscue.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="vthWvwlxNCXH5G2O"
Content-Disposition: inline
In-Reply-To: <20230802170317.205112-2-otto.pflueger@abscue.de>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--vthWvwlxNCXH5G2O
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 02, 2023 at 07:03:16PM +0200, Otto Pfl=FCger wrote:
> Add the missing #define for GPLL0_SLEEP_CLK_SRC, the parent clock of
> GPLL0_EARLY.
>=20
> Signed-off-by: Otto Pfl=FCger <otto.pflueger@abscue.de>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--vthWvwlxNCXH5G2O
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZMvNhQAKCRB4tDGHoIJi
0jQqAQDxL4V2Yb1k3YUHI/WpmV4l3pLytoEjhc+H+C7nDIDFGwD5AWoO77Ykngvn
ZcYM4GmwjYmopMfpc+ksrxg3C8Xssgw=
=tnRJ
-----END PGP SIGNATURE-----

--vthWvwlxNCXH5G2O--
